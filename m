Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795022015;
	b=dXbjHEuw4IADwSp3D0MvOflOsRd5Qq70uINU3owXP6DqTui45x7OaeIrDtLP5eTUGrE6
	 yBLNxn+qNNhHwx3kgPN/a5t8RRWDFhcK8e/xbzbLHRnkXzqBmkLpbLf6EEiGcnKVpfoCT
	 LIOF9EvbUMLUIsIKDZXotf8i7jaB87zirJTRVel7he/xobc+JgoVdogg9pMvU4O5G+ZuS
	 DNWXFvOJIXVkDlM6Da//zQaMolWRmJoHLjYwmD+Hn0y0R8M6fP2s9SIUkmKPxgx4zkXez
	 PdGTZaubarIYxZClMncjwSNpS72Ox5mdmIrTCbrL1DririQ6TkSM/iKtC5RjZbPk+xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795022015;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4cBtlgSholNnDJWCl4oISQxqxXzBWeFzV9tSbiyzJfM=;
	b=uHgqhREIz1yHIV0a11xPkqbwDVEs6uoRj+oR/wIbV6zVFoNxT8qCZaL2pXqRl/DlZLLz
	 UkV1nSCuo9askONcv08HwwGn7gp6pkjWRb2toJumLDmzK05vZ1VaNjmMrSg24S3c3th0z
	 o1h5iMf0qCaJ2/f6zBDDnrCZ5WRfsodZ+n479m26fFB3HP1sknRJAJnVD+odi+VQiomsQ
	 Zo/bNPuWnXrv/9c6Hj2fyvIxQiMafyE5IaZ5YTEdD8VluSUpdyhXsFKGkH5UcuY42FKLH
	 F4xiHHFgfss0pxFJydYRo9UL5jgot4rPuDga04nJ9bUHBHDkmAl/HhG/sYh24c1P5MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oqdcq2jA;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E723C606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:13:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E723C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oqdcq2jA
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb66245c51so626325e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795022013; x=1795626813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4cBtlgSholNnDJWCl4oISQxqxXzBWeFzV9tSbiyzJfM=;
        b=oqdcq2jAFfgr419IQ26VJOvfkh19c7KAa6r4tiEfQg1KBiSn6h0ksqMe/Rmz3wciw1
         0quzx40LPTfZUhLJTW1ee0GrC4JlIq+b0zjtW+iT3lRjClNv921pA5skjm4rWPHpbyPZ
         JQ/4v9r5zjOFHwUd3C3oiWPv2DDQ6S0y0OYmt3q4obBQ9b+HI2bFeMnyjKVGkRpWQIXc
         Xs2/IPr910LRZgFjogfIX4dtyLrhBn+HJxsegjKI7EWUhlneZ+ig6aq15IQqBURkuhMT
         Mf5IrNBUOh1AMCVn1GqGrce9Ahf8nDBL7kDC0iuZBfiix8y9mxc8CPxwpzwTWTs5noFg
         hjOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795022013; x=1795626813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4cBtlgSholNnDJWCl4oISQxqxXzBWeFzV9tSbiyzJfM=;
        b=JadABsbyo6a9z24xyb1qMgoyihvs/KRh+otlcV9gxIzjDyi5bmjs+cXCffEYUVnN1f
         hFhDQLWMJQS6Dpjz5205P+QZpqBFwzCpAJtE5UJqoYSQEjwcqcYMSNW3FI7QCe9xbI+D
         FTzzuHj9/jebilfzg6HLYrLEjpDEdSxtsoDSk7Wnv1QXBxG7OeG5MlHFM6zk7lw7fDR2
         E227jAVjfvTrMdNAIaEdjj3ZJR8hzUk93Y+/chkuk5bsNZBAV0Hl1urL4VVHN53A2v89
         bVsXlmeeJ0Yz8zuub2CNm7eEQTZpAETqzvScO4eOOUR5F9En45OCRvcXN5qcO+py68kG
         pHIQ==
X-Forwarded-Encrypted: i=1; AL+hErFlU2CqQPj1S7OueXGzuj7zajtaOATqN3LBNkTN/kkg5Kd2YPPjTFVJ6ZkQw/IukXRDQ0ah4Dx8nOikcgo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mttbxqKpOtE0ldLS3l/okQYHrCS9OpHUyUwjQEBgBkOlDzusx
	GVSaP9+uFY6aHfO9bjqd0kcQkOJbanY43lk/CFcMYkwJVyeMrSlzlHrP
X-Gm-Gg: AYBFou3TpIFDQh6WT9YZ0a1W4sD5/hIilBHYSYXF8bdeKs5XfZLoslNVIE0KbilXqld
	aALQc4ekvq6nR7f6nT/BQc/BICFCIvt8uWtco2aitcxr/qQTmbe9OfzOjRiO2J3/fw2f11kzdw9
	1Xi5DeQgivfDjDP/5gETDsKty+CyHuymhzcjQ45e/2GeGALaBa70/Wy3Q3By3wfPibY0JKGfnwH
	jp8HVuhDTbvtlAcOMttWPC3b6trEzey67xlV3UjXTMlpb2HjNy+cRSISxpTvrOjKYZ6xeX4FZlV
	E9I+E3qbje7mB/2gOn1A/DYtrg3aAr65cKKXw4v181cFgjWZt8UHwoWv1BL3mhPegFb6etIqXuz
	bOQpGHIGX4PwPCnITdWsiSr8i9q3OxMkwVsR31baEjCv3yRFboUp9Y+fNFPKEWnjslgqsBlVvQU
	RGRPnpdRasDP+S2oyQUSK6k32FMZgNIFyiFm4xo0eAlmUxwxkEjTlPJMNexbzCl4d4ZObBAFuXf
	8Br9uKf6FQlxwxtUY7DFUn85MtomjyQze+7VDhiV5Jp9reMvMqpRbxXKmLPQL2R2Y1gAIJ6ELzT
	D5ry3vq00i+OHB+PE3HKoVkdQzvDR/6kHsyYue/3AUk5vh0h2w==
X-Received: by 2002:a05:600c:524a:b0:4bb:5ad9:50dc with SMTP id 5b1f17b1804b1-4bb7d5783b5mr61295565e9.0.1795022013053;
        Wed, 18 Nov 2026 09:13:33 -0800 (PST)
Received: from L-P-ITAIH2-L-RF.rf.local ([193.169.70.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8324a0d7sm2940715e9.3.2026.11.18.09.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 09:13:32 -0800 (PST)
From: Itai Handler <itai.handler@gmail.com>
To: miquel.raynal@bootlin.com
Cc: mwalle@kernel.org,
	pratyush@kernel.org,
	richard@nod.at,
	vigneshr@ti.com,
	takahiro.kuwano@infineon.com,
	tudor.ambarus@linaro.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v5] mtd: spi-nor: take the flash lock around spi_nor_restore()
Date: Wed, 18 Nov 2026 19:13:20 +0200
Message-Id: <20261118171320.3887035-1-itai.handler@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <87bj7mi5gy.fsf@bootlin.com>
References: <20261029210153.3986211-1-itai.handler@gmail.com> <DMYDITU0H48Z.2LA5KF2TFNUY2@kernel.org> <87bj7mi5gy.fsf@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed Nov 18, 2026 at 3:23 PM CET, Miquel Raynal wrote:
>>> +	ret = spi_nor_prep_and_lock(nor);
>>> +	if (ret == -ESHUTDOWN)
>>
>> This is actually really hard to follow.
>
> Yes, I tried to review this patch and eventually stopped. Please teach
> your AI to not overengineer its solutions.

Sorry for the time it cost you. That one is on me: I sent it, and I
should have made it simpler before sending it.

v6 is simpler. It follows Michael's sketch: spi_nor_restore() takes
the lock itself and then sets a "restored" flag, and the lock helpers
fail any later operation with -EIO. The extra helper and the special
error code are gone, and the commit message is about half as long.
The diff is longer than v5's only because the _pe and _rd unlock
helpers move up, as Michael asked.

Thanks,
Itai
