Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018069;
	b=gyEqhR6MYLHCHWKFDVAD/7Bkbl+eqYxK7V3DkSB502bJJYPzWMsh28SOaPiEHyoBvb+7
	 K26ZnVl5Pr//fo80OevjnELo8kzrIasXcVmgY0Mu9PZIe/QuwWh4Ka6brC83wIhraKDah
	 oMUdN+Br8k0ol57VEXyKVEGlgtnIv5I70G4LR+HmBUEkzbpTu6iC3IJiFcvUHP5Sw343D
	 /4Gw9nv4VmnwkOGagK/H6g0W8UDxKsNf0SpkMEMK4rcKxAhHkD8Dtwjur422mA9cbgH/v
	 C+f9Fhsbm/0EGpHixaBpYQ0jKVuzokTJjjm7HgN4YD+h6lSl3ARAtq768je/giwcDZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018069;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=uMY6Jb3UDbPrg75ENQ5Iey0rgsluCVDooajDuLXd0cE=;
	b=TPkwi3zos86rHMgCkUkWI1I6oB6kYRp5QwvbRPBCiWi0+2bOwzAgyC+5eEB6Z02RPEoQ
	 nN3BCUyMDoSJ8EFGoHTTLHjyVZpJWOWwk/q9RQZzwXQUwfztSYIIh8BkDmIwz+wuvCaCm
	 RXFKxn0kTf5STCXFUPEQynIP36/5+gTvGUkofAV1knHgb9amF/xFa5j0poFDlpDhtSuO/
	 aPdsKZfd4Jv4mMEgs1lg1nImgmddBx6hhKtSMxSmx/Svm5p7QY8pCne9ZlX8wpCD2CWmq
	 D1lZs5jroq9OCC3E0g9QmA1ekqpYAEkxSo12ItR/pF8sUQOWEvbXFQ2SCWzXbseAihA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="K2kH/UYx";
	arc=none smtp.remote-ip=209.85.160.49
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DF560A5BC9
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64DF560A5BC9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=K2kH/UYx
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-4adea5b7a2fso443856fac.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1795018068; x=1795622868; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uMY6Jb3UDbPrg75ENQ5Iey0rgsluCVDooajDuLXd0cE=;
        b=K2kH/UYxJ1s9QIk2I+iFE+8oy6FJi8D0+gEKDqY+gZ6pmW+8qIuvQdlK1zDDZ2tqn9
         +grxhnhVVFi4vC6NoXujmaBAsELkdHD/ni+akIyIdYfnQVXIUdefoLtZsRuvr+oAWjod
         D2kOcmXFzzguDmC6XlwD514NWwSbkg28+3FtOt4YIfS+BzJB8WflsXo9S0UVl6D+SSMZ
         CeUaoy++aAN5yOC7dc450MBb2IQmziuDqQJL1p/6pk+Bkx7pDd2i+HrMHxPHvS7zRqnm
         RGaipKK3GMXRuwVd3yNsQnE8F9AoDHxyWIXb8pin1xjuivCgF6cf5Uuo6uS+rfAjDy+w
         RNkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018068; x=1795622868;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uMY6Jb3UDbPrg75ENQ5Iey0rgsluCVDooajDuLXd0cE=;
        b=m772n4e3zBKGJeskv0TDFSAlmifQnt1KEI1vsdH7TOFm94rM1ikhCgFJyzWPuQEvZE
         osBsgsrt+CtHVErXyQcc+INs4Nq9NE9cne1YH1aDiukLPXiM+LIO334nUVTho9wjY/pB
         NnRZV1P+CoM2o93I9H/kf6Dv4T9lxvqomCri55pkLGsHN3UTRhMhtK14aX//QgjtUDR8
         iYn3cNsZiuW6Rnb2vZbkVJY6+jxTXtVCBAR5G5YBfB/ihoCn8OEohog7JLUHdchc9qLE
         CnmPiAbXDiE92kQLaQ8zqjuWdild/3POM3CRzIt+RP2q1KGZZdf0cgzYRSvh81oTM1Jk
         VD2g==
X-Forwarded-Encrypted: i=1; AL+hErGbW4WjhYfvDi6kyh3lc/QWvRLNy+yM7I/i0aB072sCuGk50g7uOgPfMeu6DrJR3vPllk41ZMmyThXSdqI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qCoklOY6/JSGJTtLWcqPcMlBCAedjCq789iSQBEDEPHikqcCL
	quvCbbgceoayVl3k0trLGl+vkMlphw06yyiIEniYT38M914ThAskop44ngGNnhJg+EPSPGMvqQ/
	swWuRmqg=
X-Gm-Gg: AYBFou10mdguks/eJMi9ydVIynR2S0vShRgABHWAxtLAX7ZwOEz03d2f6TmfdT0mV4j
	mFFD/xeEPnMp3e00MxRTTbXkVkCWRFOe5k8A/qiBQbDTpx+J8+pkKxBqMUXZ6r439bf3BXuUmgt
	ADWDCAB21iNgkz9agmnFMUGPkLtLcZ/K7Bc3nozUKTYvfThgt5UBJB7YxqSOgfpyEcp8IDCP411
	XCfGM3n9YrPtj09Bc83TLDcPz408rbh5rEry/e52XU06KF+4Y2a22IdQVwYki/9F8SzKlTtg6At
	UOBtGyHmmSuPRQt5qYv4nIwEVx1iUmfWWxLReX/h4xqbnwYveDSC/8UT79t/FH0Ep7ny2K+WQZm
	0NQ/XUD+GgoRlrlxaTPm8hwldVzDujiXrtjl14n8kOqfMdGuRsRymz5sFVnj+fNMMeb0zImvpyn
	Xbn3jE/bIYJOeInKSkm7EoO8qt0VZWj0sTBF+Nk6vLVYh4aw0vxE2okpfj1h/fncZt+1sTz7FMY
	oYsnVhe/Lv+zLyDJrg39y/1WkJLpy2zAfGSniI4hiV4YV+dqOFVWScW0Q2djJEWmhJd0YJXW4nb
	MBvhIOtDBwCHz20f5qMeL89uAIW5m+uLQsvd2PtHaDTcpg7jWDHJKIEwZrZvBfldM2jBrS4L1zZ
	FMDEjyWjUjV6sovdS74mj23w376wIDhrBZE6y6ec/80TMQTyXUo1Rjb3Xmy3mzQbv1Ahw+AYI
X-Received: by 2002:a05:6870:4692:b0:486:c1b6:643a with SMTP id 586e51a60fabf-4b75c3790dfmr2555326fac.19.1795018068283;
        Wed, 18 Nov 2026 08:07:48 -0800 (PST)
Received: from [192.168.11.112] ([96.43.243.130])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b743721fe9sm2624231fac.6.2026.11.18.08.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:07:47 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Mani Tofigh <mt4022@columbia.edu>
Cc: Mohamed Khalfella <mkhalfella@purestorage.com>, 
 Keith Busch <kbusch@kernel.org>, Ming Lei <tom.leiming@gmail.com>, 
 Bart Van Assche <bvanassche@acm.org>, Christoph Hellwig <hch@lst.de>, 
 Nilay Shroff <nilay@linux.ibm.com>, Josef Bacik <josef@toxicpanda.com>, 
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tz2294@columbia.edu, stable@vger.kernel.org
In-Reply-To: <20261106-blk-mq-del-quiesce-lock-v2-1-cd4f72a6eb03@columbia.edu>
References: <20261106-blk-mq-del-quiesce-lock-v2-1-cd4f72a6eb03@columbia.edu>
Subject: Re: [PATCH v2] blk-mq: take quiesce_lock when removing a queue
 from the tag set
Message-Id: <179501806686.17649.15466634007148423129.b4-ty@b4>
Date: Wed, 18 Nov 2026 09:07:46 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Fri, 06 Nov 2026 11:53:21 -0500, Mani Tofigh wrote:
> Unquiescing a tag set can run the hw queues of a queue whose hctxs were
> already freed.  blk_mq_unquiesce_tagset() walks the tag set's queues
> under quiesce_lock and rcu_read_lock().  Commit 71ec3c7d6db8 ("blk-mq:
> quiesce a queue that joins a quiesced tag set") added quiesce_lock to
> the walks and to adding a queue, but blk_mq_del_queue_tag_set() still
> removes a queue without it.  The hctxs are then freed right away since
> RCU only keeps the request_queue itself alive:
> 
> [...]

Applied, thanks!

[1/1] blk-mq: take quiesce_lock when removing a queue from the tag set
      commit: 495f22c5a99ac38e527294cdc4f3972718b9bee0

Best regards,
-- 
Jens Axboe



