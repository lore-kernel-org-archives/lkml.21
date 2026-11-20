Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186788;
	b=ec65fwRhczg0H9TZO7Sc/1Qb0HcY/oDSY6rez/Klqropaxk31ukyK5ewyxx1gIR0oimw
	 J4VzYCUl53AyZryuEsl3/A6zlXBJq7PMkW+TZLO+r8aZvTxYVzFoMgAKOY63Rvn4FrPM9
	 q27mOqqyU12cTzbF3Cfno1M0yrjK3gpNyFeqsnHwP/6+MIP5FjtbtwhkKObDs1Vt2kqHR
	 a/FUzeeAdKWN4vO1qbDKWpe/clhEnMIJaZstX0/h0cReghNxI9J+kj0/i4etwYhcDnkiR
	 Q74VJTwqiaiPTRLLl8YCappS2h39lODXc3mZHV4yDOpTyeC4BIBPZPTt5gXg4BH1sVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=0hY5ua3O3jmOpFf4vZNeVvm23+ZKOqIsiyXF3A3efJg=;
	b=O/+5NKTbskTIleaq2JQIQ+0xITMshyUgKw/pnPaPFIxjpjdEpyHq9Kja+OMV8CL3oR/d
	 c3RWidnjVPLuJdkHXE5HPEeIhENJJmtBs0JZ8d7JfuAaKHFbO1b3tFJmlZjqV1FiFSNb3
	 dkLPxrUXZT4bE0H7QfDPp5DOoU7eVORqdUS8J87E4fhSw1dzqNvdw5uRdtJCnejvl+KBG
	 XwnVMjYkDojZTYZWhVXM3BBgVavSUHxaBvpwjGFAWhN69kOIHyBIKtWqn5NQ2vze+sJ6x
	 /31G5qFfVZo16x6TMd+do+l6y2EKFUEMjs8inlR4Z1PjKNm3Ufojr8ae8jn+aA7RfZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=GQOBYiiS;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8E86074D1B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD8E86074D1B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=GQOBYiiS
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so930705a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795186787; x=1795791587; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0hY5ua3O3jmOpFf4vZNeVvm23+ZKOqIsiyXF3A3efJg=;
        b=GQOBYiiSfODVUY5BPry3vYjPqZmWwB2BfZdrAloTbnofeo1ihjK8fEuQmY4qAki/+H
         jwPOg8fmGgNKjzaulexXfpXOcrl9MwTULPR/FJxdXVJsigwLWaLXAlxE6jqrSNMGc/eh
         j52M0zK2n6Zpm+MyLwPg0s21NdU5uwqmchktt2llqHaQayd9LVWN456DCblY1+3JY4HL
         XhndWn9Vu+h7ht+ze2TgSV0C2XS5wgVL/G97xEOt4LpCp/yhAsLRsl3TNgrTRAPYXgGa
         SUhJX0IBxJll4EgXwcY+Sd9f3UTkAqLIysWbU6QJnSXhRakTLmSwW/CvoaXZxntnu9Gt
         sYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186787; x=1795791587;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0hY5ua3O3jmOpFf4vZNeVvm23+ZKOqIsiyXF3A3efJg=;
        b=ik5sSjRxZrYx2WgdxoDZflUB0zQUDsT3Lyyo8g0G6g1Zr8rUwKMI5Dxn+dsjF+uagL
         t06g0DbWWyaKYUOgjxzjiaTahNAeDQwRcGBluWIQegL8X0kTiLbMJJ1+fdj4GzDm+oWh
         EttH1gkt8khqwa3Zz7OnCtQNWRqJHOrkkuN1XQF4DPVusCQyFY8jVloz2LGc3ar2w+Cd
         0jK7KGebkM9gT0mAS920OYwmV3WNicmPJTx2c5GA9IKilcQfEhwEl6eKVzQk+Q+Xuekz
         u8snEHT7bsRIijPMFvQQ9z5wvEhwR9/EEg7huTDUaBHdFmb6bMePj2deoupluPj+qSKY
         s8ww==
X-Forwarded-Encrypted: i=1; AL+hErEOuiBNuzUOtVzu5daQJFIwMWPVMuvUWEQ/t0bEZ3Q+FkSCRFNtxasOCgP0cmP1ymNvT0yYiSncyTUZVkE=@vger.kernel.org
X-Gm-Message-State: APuU4Z87LQG9yhiy6p08TCIoNCpfvyHhmYzcVnXCk1Gm6JbcJwLb1Gd7
	ma7LTIgIf2VIac2lYNDS9MYrvUEeg8dRwCkO4ahPpJu0YbftkeXPKiu6anr7H+z5Hss=
X-Gm-Gg: AZFdTZfYrkw6Mq/zgLaM7vN98L4ZdP0/ylWG8nXG6qOloGSLW2DR23p1XHBrWc0nhBz
	xKJvFfzEV9pCO4GwO0j/7KJBaDMFlNIRSFfMjFnBu8kZozweNrHV5ySNXKR4Hv4U9r+Cy2P2sWm
	GHhEvMa2JIer92RNlNi/ty8QG4iiGDbLFkNJzWgqmqsrKHvIKEbNYplXcEW8/4zUX53zcwaVhU3
	kk/VF+iZIvkh3LjrlqCaj7gZ3MUt9oeplJ0Q2pqVFYLYIlsYhbLflXH6yQ5QRJ+ScU6pE6oeGQp
	mJIcdCO6egO8N6dgKWBmoQFY3Njv/SZSVGD9cqLL8dCnapR9u5TtQnreuZs5T4cu1anJ85Xtgym
	NQctm7VCttJWrnifbuutMEtktYMr11mWw177gMcMnXqwRpPrhgq7KsWmQB6c3DoLaIzlOJL/pcM
	w71lZnBntJTnzYuBUXiN63m6TE4tsND+3NZEg8kdR/4HNxjvCq30m0INfwQbk0RC+C4+CJyqoCF
	Jn+ZJoiv5UCBQYgn3BC+hZzFCVxXZ2AyA4389IsT549t9+T5LVZd3CFLGrhpL1nMpvA8aRNHKS0
	jLe/OetAWjVeglBmavfZkGe0divIvdkepNAMhezzzm8PKaoWeKQwcKKHCRAFXemH9WsImupre2g
	KI5Xa0kLWoXbnDTSUvtNq+aaBzHF2wBPepTrm
X-Received: by 2002:a17:90a:e7d0:b0:3b4:a90:7f3b with SMTP id 98e67ed59e1d1-3b41c97c98amr3317137a91.56.1795186787223;
        Fri, 20 Nov 2026 06:59:47 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41aab4729sm4660624a91.0.2026.11.20.06.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:59:46 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: mkp@kernel.org
Cc: target-devel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hare@suse.de,
	bvanassche@acm.org
Subject: Re: [PATCH] scsi: target: tcm_fc: reject overlapping write-data frames
Date: Fri, 20 Nov 2026 23:59:41 +0900
Message-ID: <20261120145941.3127955-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <506886f3051941899c26b3dd4d2a32a3c0cf9846.1791812937.git.yhlee@isslab.korea.ac.kr>
References: <506886f3051941899c26b3dd4d2a32a3c0cf9846.1791812937.git.yhlee@isslab.korea.ac.kr>
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

On Mon, Oct 12, 2026 at 10:51:59PM +0900, Yehyeong Lee wrote:
> ft_recv_write_data() executes a WRITE once the received byte count reaches
> se_cmd->data_length.  Frames are placed by their FCP relative offset but
> nothing tracks which offsets were filled, so an initiator that sends two
> frames at the same offset reaches data_length with part of the buffer never
> written: two 4096-byte frames at offset 0 of an 8192-byte write get the
> count to 8192 and leave the second half untouched.

This is superseded by v2:
  https://lore.kernel.org/all/20261012153502.2435483-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
