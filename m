Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018063;
	b=rVYKgLhpaGqK5P4jPz+rC3P9KhAxYtKog87Q7Q1+ECEM/b48mPW252axqmncqg6nj/x4
	 TaLPYEM+H2ek33e6ZKDBrDLtRNiJxRTPN6VIt6Ay7x774aeY20gECmYrjarWPIRxIdr3s
	 x7Lr7NunPpt15EWtUdNm7RQ4gdcf0dnDVvS0EGiOvlhe9bv0bBqAZbkOwxp0nlCtw9UmJ
	 rVVzqB3yAsxrTOiqh76L6HuF+K6ikXTfs1EhJV8me3ktSWkEgqr1oKHModTQqQXDyZraU
	 5VQQPHneSqFa2zqgLaGqo/9vtY/tpgtGoGtU882MAMdUyhh7gY0gTdkRoEw6rZplg/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018063;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=JmaZ/n9FsASCYINSVjYeJtINexMMe1X6XnCohCT4mSs=;
	b=4bWmMs51CYcyPjfPf/psnCZxuNt8F8FelMWXotuoDuFvrxsh421hGWrMm4VgdjevT7s4
	 6RzqF0o2S1No4E6vM2Zi6w+2bwciP8KJI7Tb78A/NTHmdq0FmOcKihgl8CRYvWke0kreU
	 VFR3T0MP025wsle9aMPdptN4mzu8x6DS7FKqBlqcvCxdeE3cnZVmYbQvExd1Ba/eIx34Y
	 0YrjLMr+3TeklYx7oihPH2y+MAN74b5pwJbeBd+0OYRVr+MIMGoZHGhMAY5IkYnWHoJBO
	 0voMD+NZieUFq1WD6Nw6qFpcWwgt/0treQh6w9G5geNujOkEDWC48LfDYOaN8pnqp7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=YIGUfzF4;
	arc=none smtp.remote-ip=209.85.167.176
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC6760A2624
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:07:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFC6760A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=YIGUfzF4
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4a451915d8aso618395b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1795018062; x=1795622862; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JmaZ/n9FsASCYINSVjYeJtINexMMe1X6XnCohCT4mSs=;
        b=YIGUfzF4YnoSIglmvHhpupDq72wlS4QGZnvMOEHjBAiofpTfvXUr9l69ZgY5KW9v37
         BebnR6s4m+EJuuRwS1MIoehf1B1szHGaFvybAFk/6Y67mWgEwe8Z1j2yNgyUbPpmq+Qw
         uB0lALKqu0H19jXyksW90i8+XVHdbLYnn9AQZDE3vmQhy6Kw/Z7vihQ4fQ+RtCLB6QLX
         UQrpjYpz90AZg4LIeflbmQvQAZSJOpX9QQzrIdZqIUG1i1FQi2ajKubFOllnTD1ABKPl
         zzUfkW/UQPqAxI/BJnq/h/YKqJkem64f0sGOoXqJQohx4xM62iNWD+mdjup01f4EsJBZ
         0nqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018062; x=1795622862;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JmaZ/n9FsASCYINSVjYeJtINexMMe1X6XnCohCT4mSs=;
        b=eusiNHXsE9a/QO+tiPb9+ozkDZR+7R5Jf0ycqyA34D2hTkd7g4vnErv5pQuvJbT7ws
         jYeVenRBs/sLxMCjps2s7bnDw3Qlfu+5dHueGyNsAAbzRKvR27BS/u6qYj2O6fJsL/M9
         BYSOoHrzf3GqCKcy4j0HbySTXZ4hJ4oVM4NXJOqAX/dEvQxARdxE3M+SVQjpmPk1nN2w
         3/CazDqqnYWtYzXJgUODbW6Q329jSKOIcXqecrOMcoiSJyRIhUQXZR6jBFKFkS8v2lTf
         5IKZzfT/JTD3kSP3l3hlMWnlR1RsoU7sa13igZRlpbW9F0m2e9yWcWmktdmKih1J6cfM
         NwTQ==
X-Gm-Message-State: APuU4Z8cobtmJ2UrrXPBNLt8xrRv1LPwm9JiJN5iEuKPVJ0dZxExdOxR
	ic7JQXWGwqIhEoPJtCHfaAWastlPxzoHLvgzA+m/gVLyqgQGCWJHYQzeX618M3NuORXmuZNDwd2
	esriRtLU=
X-Gm-Gg: AYBFou3nM+3a27BVk8eZJEbN0dP93UjXeR2jFBJ5+R+DTEfKkziFCatYaBeYT0XR7l0
	MdBPBc0PGsu34e3UDv81izTA1MIKp57QeFHat3AvrdcjMB1ZQwdtcIkvioSJv3H3tkF2eEMJssv
	Sj1PQf42nmL3uv3gUgvHAo6xyc9O6Lz35vfkFmei5BcuSrUvtDoALgZfbHYf5VubhT40RtX2DUu
	Dcd3GhpbSg4oNRI76LBmt8eVTJx25veNwU9ajP4gN7BGrs5anx6BxtgB/5ercFRtNlVLsa+i+89
	CgyHPX9aTimy+7LOU1tZXlmtv8MKzotneW/81EeBwXFyDnEdtKZwJI6BkbYb6jLtSPStRzsnYpJ
	LXfUM3DnwDCsCb7E0Dvwdi17YO+4vPFaznEEKU1eZluRAP9oMyyGPdF53qNS5C6bapwkh0nRSej
	1VE9pqSDk9iGksgJVuGneXHjPuQTdLT3IAC4RFDpzeLXMioTlK6FUvBYLtgkhVEM0NlHs9BVB2B
	kiHWMvrkK3mAc7UmVIIr2NNsCfjHkCkK0pMSjlUlNaYYrsnHw+xkBKndgumSYFgoHha9oVNVXQI
	c+Ifk5yo2itshNjwDSKncbJjny7IN/FInjRpK91n5pzVEzttKAA45Mz3Dn3sDWtsfGh2tXwpu2r
	aGgEVkVjN02ywsGzGy2ahb3ALjsBvENyFFdJqmsRVgrLhHlxBR+Y=
X-Received: by 2002:a05:6808:2220:b0:4f6:a430:1822 with SMTP id 5614622812f47-5773c52fedamr3373325b6e.7.1795018061884;
        Wed, 18 Nov 2026 08:07:41 -0800 (PST)
Received: from [192.168.11.112] ([96.43.243.130])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b743721fe9sm2624231fac.6.2026.11.18.08.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:07:40 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: linux-block@vger.kernel.org, shao.mingyin@zte.com.cn
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20261115003345297PJDJduSwIS5uDYxPFRxKJ@zte.com.cn>
References: <20261115003345297PJDJduSwIS5uDYxPFRxKJ@zte.com.cn>
Subject: Re: [PATCH] partitions: aix: validate the physical partition size
 exponent
Message-Id: <179501806057.17649.7759332240241480233.b4-ty@b4>
Date: Wed, 18 Nov 2026 09:07:40 -0700
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


On Sun, 15 Nov 2026 00:33:45 +0800, shao.mingyin@zte.com.cn wrote:
> The physical partition size exponent is read as an unvalidated 16-bit
> value from the LVM record and used as the shift count of an int. Values
> of 32 or more cause an out-of-range shift and can produce an unrelated
> partition size. Exponents below SECTOR_SHIFT produce a zero sector count.
> 
> Reject sizes that cannot be represented by the parser's u32 byte count
> or do not cover a whole sector before doing the shift. Use an unsigned
> operand to express the representable byte count directly.
> 
> [...]

Applied, thanks!

[1/1] partitions: aix: validate the physical partition size exponent
      commit: 9ce4cf1ad3392b2945bf1d49f1fd305364020a1b

Best regards,
-- 
Jens Axboe



