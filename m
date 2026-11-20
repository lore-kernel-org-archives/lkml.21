Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186880;
	b=XFbzVzZhCujKpR7DdmpnRms4QxkHr1rPpaPMAH7q84zZiNpx7Jl5cjw930v3JsqsBHJt
	 2udQ6Am1GiDmueVZOzdZUCTtsvwX1LGqC0wgoUQF0sdOgf/S7ABy7mo30QdUfYRYbl8oU
	 7DKZ+cJ1t0WcshymZzkbf3x/3hxvx7xhJIZWAnAQK8iB+KcFQw6AkuyCG2r3Rn9VvWlQz
	 tSHUg6bRqtOvFqt6e8sD1LcgUFyxuipiAUJww8xa16xrmYBDqlmnX4SmHfPFfyUujTwvn
	 CPMhpadK8aBSQRBo/zoNE0WUe4VLBYzpZ4tBLsogRFCkgMe520j6X0HujYJIZS+A66A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=mCRm+l6ZHE272rkjlmN9VUDSwPrbwgekcccIxZDKOHc=;
	b=BgyIjCU0RG3MeY+2uxF9wNx82aBie/+uI7xPYJRAObFaVLqQQsp2oyhmnup3LJ6koNaa
	 PsmyZPDO2l56wbBPKZis/tRwU5Y7ewYJiROek/8r8F6Ndve6ftRi4LrXjUBGcRZ4fE5KY
	 D6/XMv1CVzWEjOLHOulMum6PRg83KvVKUqu5Ui7/m0IQLU9aoBbj/jL/UC+9u6lTT4DAH
	 S1A0k9Uc59rHDO6KzSUl9WS+xb7TXOIZswm8k9/ydo4BN2ofjYHCe0qAqAJi4xxbj3wuy
	 vJEBw4DqNIyMk5e+qaz2mIy5L6YXvjgZPlf6aWX8+D6ekuif7Zv6uNoTI5tgJtTXk4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JvSz+61v;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE3460A5BC7
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:01:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CE3460A5BC7
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JvSz+61v
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2f0414c1062so5258035ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795186880; x=1795791680; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mCRm+l6ZHE272rkjlmN9VUDSwPrbwgekcccIxZDKOHc=;
        b=JvSz+61vQyUZqYJyiTfG07ysQ2zpBtbFrcR6lmftpISADf4xgS1s7hF9NFLDmqknVj
         v+x2IBguo7+M9xKQdefS1WSvzXB8KlfUg6m4NwfgrkWKs6lRk7XWHNTrXg7p4MvZOfQT
         yDhMmyx7P84x5WEU/WLZg9UBxV+gdSGQhF1Ykww4UyHSIfTmqWdpMjzzX/HQBCByoE6l
         /8dY27abJx6u/+GSsi+24FRWophKKvPATbynOHgbL/XlxfG2iTOfg2S3xSvkC31ay1r7
         atGPb68ZBnLSOt3keQPpWiK6aEr/sMsm/KaTAZGOW9jnuLMkVCIs0uTQTfQqaj+ra71T
         WfVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186880; x=1795791680;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mCRm+l6ZHE272rkjlmN9VUDSwPrbwgekcccIxZDKOHc=;
        b=Fr520GlsATihSwgp33SxlpGcc/xvL3k6vx8+2SjIydgXpbc+J0vmcoa3NyHCzf3mLz
         iRMUPmBaPSZ3owWrzE4gVHXuau17zm6iSeU5eo7gAm+CTu3ihSyD37CKzF5ur1OuWhfI
         iFHtyQJrX2uce3NSgnYkO3RgIPawG3SMZVux3D08sesk6kHZU84bkEf7gvdeAPVRosZi
         W5MksQ3MAfqYs2Ocu7fNTNNDFQJXkEnGc5lewIGQo7SGa/8JsLyzm/n7BzQ7ksdNRu8N
         ui4WdHDmAAupZ8HYtE0EGVawUXO2mGjGkCNNHIjrp8CJvXQcZh9uEdxicyDSsQq20y+V
         hYmQ==
X-Forwarded-Encrypted: i=1; AL+hErEwM2LuM784fiDX/wviH6weEvCmGiAZLRyAWoKwtiachbrpJFul8cqIv/TeNUlLJTPcddZk/84cL1pUg84=@vger.kernel.org
X-Gm-Message-State: APuU4Z8l85o/6+LcFYQ/UhM8kQxNqtFe9TR6dIDoOmEzqwEk2U9nZzfT
	RFd24pMfSmcxoaI/zu7qIqpOSQ/yJVM4Vu+oNFVeqctApgDguI4Gh4uyZ0epLYsxkK698RG2Lfy
	hBggKJg4=
X-Gm-Gg: AZFdTZcL2hdmmV+sY0ixBmKzoHaReobv6RLsHHtpLZjoKhU1yamK+mAdF8+dNbbB1vd
	f9pnj+OXC42keI5RfrOjvjyp61CPKEftiqLLzgPjHLo2NYS9ng7eMzJYfxhFKaXdnf1gQLAUFa9
	iRW0cSEmRiKW5Mh3d5BRzRTFH3u8sTfJNZUCvpTsdE8PGo5PWXdsH54vCmEwY84S6VIBqOtjUCb
	uIEtBWFdAQomVdy/STX82KvRhGQKeRk0TuEoe9Na9S3gyoRtVMbUTkgcW4EMW6Z9Vc6M/PCObuM
	vnPXvyNLgIrcVCaOLrPFTupaWOXdbWSasgBuDQ1Zp+Uc+Ko5MMknaY4hDHyq1pUbAGUDJ5c6NGN
	+aZaMHrwV/CXgDlt5w17GvKkWN1upjBcvcP9wqGRclWBMiz1E2OaVXt6afDnMhYTI89nA2RrzCE
	S28UEOfKdUYF/zbdnb3VcUz91Jh/Z4MTKQ8q69RIRaPmn3Ii5wfH+18aiOaaCmX/3hAiIkLyApV
	l+zQkgvIx5own5U0JhFFm+i9CYIsLnlc0QNyfT/eh00epy0a0umwuSnJGhkq469Mm+NuAeojc9s
	UeZV/VaRXD95XH66X5q/flk1nUGgs8nutbzhoUUXPSagHyZONTl5q6hLIQB6lBiMxdYs52cGoYC
	S+ld7WWkpUR8cDUqx9DwI7+aw1ff4R6Cg1LND
X-Received: by 2002:a17:902:e551:b0:2ed:ff4a:6d21 with SMTP id d9443c01a7336-2f03f1beef6mr33867465ad.73.1795186879777;
        Fri, 20 Nov 2026 07:01:19 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f12028dsm15024705ad.60.2026.11.20.07.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:01:19 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: ram.vegesna@broadcom.com
Cc: dwagner@suse.de,
	mkp@kernel.org,
	jsmart2021@gmail.com,
	hare@suse.de,
	michael.christie@oracle.com,
	James.Bottomley@HansenPartnership.com,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] scsi: elx: efct: fix target session lifetime against node teardown
Date: Sat, 21 Nov 2026 00:01:14 +0900
Message-ID: <20261120150114.3128328-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021130802.2691833-1-yhlee@isslab.korea.ac.kr>
References: <20261021130802.2691833-1-yhlee@isslab.korea.ac.kr>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, Oct 21, 2026 at 10:08:02PM +0900, Yehyeong Lee wrote:
> efct_scsi_new_initiator() hands a bare struct efc_node pointer to lio_wq
> and returns EFC_SCSI_CALL_ASYNC, so the node state machine keeps running
> while efct_lio_setup_session() is still queued. Three things go wrong
> over that window.

This is superseded by v3:
  https://lore.kernel.org/all/20261021142818.2782104-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
