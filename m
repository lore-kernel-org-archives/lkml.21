Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795682754;
	b=PlX1qWfAb0XzJFQDsYDJfzBn/YTryyepJGJHty5ke/MPDUJ1wUs3OBwaIvSmaf+ft9qK
	 /tTujEOf6AftILX/gp6XvcruD0qaYOE287n77x6WdQHbuNWZC9p+rDWWmNCO5FgTuzPtL
	 8RTptl6ugpgwcL7Ii2UJzfG/VCZUREHML2yKxyoaI1NGhsCqSvMhE0x27EAPsu8t+RLIz
	 6DNNpD1yb9e87FNaLAQvmr77sXUtsOlO5QdqH2J+SI338D4GUcEhReM7BqMJxuxTM240m
	 RYW54IJT6v4PV7bkGiJKq6tlWGhjuggPsQRGR6FwkwO+TCFqX1uE5IYKHN32fv2Ry4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795682754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=AJu04eNoB1sBlEXHCPuiDkza8mteAHzav0QvwSSwQK0=;
	b=1AZP9XiSrnMdco4Dtvlbjh8WMpkEhfmJBV7OMUFxXZ+ZLNmO96qStzfiRMdnfDWgQGg/
	 vZFmTYnHkxNmG4y1D5qZokvvExncAHHlM0R81bgq/mMJGvPdmNnXlefZkbFbC3K5c9sUD
	 wEW9/iLBC2SPHsUC4XrUcUBiQ4xrAjL7Q8IhvQ5QQZNR8XCgPNNWhrX57t+pJDyRjTg/L
	 dv2+MUvAOvWAaRJm8w3gymEgnoNO5OCrfhL2lmCNigutRHQyt4/Y9COdL0Dndmw0qVBWY
	 2QZveiLt7xO/ZPte6bfCDzxrKscdH+X+I51ygrkKGOnWGHLPIRmkqjqNNk71WRCCF7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eTfmiHtH;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2121606A332
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:45:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2121606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eTfmiHtH
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f02b9c1f6fso46699195ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795682753; x=1796287553; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AJu04eNoB1sBlEXHCPuiDkza8mteAHzav0QvwSSwQK0=;
        b=eTfmiHtHARlh1l3Oq0yk7fmF9qOswcLuF1wfU8hNzwn1a0VoAoJriwk3MBo0VZRpr1
         P8LblYEeCxa7e9hM/u81XQXgLYwLg55y2+Su6PSifNeLxtU6wwbKMINdpaKfJB00r7vI
         RQ6qm5MnDngwJxUNGj0XN3B3VrT6Oraae/FEGMCnel5Bj8wRmUN6pcnYb3svmmG43PUv
         J00A2xLLNs+Z8/AcWGDIoSoZQ/AsljOxoUQke4LNmzrMCJLCZY0ZvuM38iVxNuJ28g9w
         VbTd3lcTg/arMSbqh5lkwywdOJd24mr0KINa+lPOHjldODGhfyWpRWok+mKjol9d+Y+X
         Vy4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795682753; x=1796287553;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AJu04eNoB1sBlEXHCPuiDkza8mteAHzav0QvwSSwQK0=;
        b=B1bdYfHvdiDw/3yktAww11tRxWwIk4ZU1zMeWFu5cjzBRK1NI+5K1+l8GxC3o9h2ON
         VgTlqdIRcHGkR9FiTkEOwjsAlNJ5CfWKGGLeXNOQFBdJLEKtwel17XC7MGp0clqva/I5
         KltDwefDb6CKR2us9YQj2OenEzoNOQACaxdsfgfnBwyKxjn83wL1QGbtpS553gQh3UNv
         /SKaVq8STnwjIu1SGGpiZaevqcgQmoYWpMyr+cIgmKrs1sEVeRaxKkouCnCc3q2ysl05
         5w6au1W3scy8Vsg45VcZuLnE61F4/RH55YWyqqBNP2mlPsC7pbcN7tLp4xeDbZdI+LZS
         5plQ==
X-Forwarded-Encrypted: i=1; AL+hErHvO++CQfG+zbNngFeP3IFplGbzsmPlxIjdi2i+FH7sry+ndLtKgXNl7dn6D79X154knfTAnZcIbEAs3pE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WsHbAZGMgqgmAJzb99kBfGJYjf1Xfrt3bltP9cw0hsxJ7F3Ew
	xaUKCRWmXLZqCzbyoBpvTepehKYNW+coznQfc1OuVh9fOoF/dxnbFhs2p3Q41lpmkE8=
X-Gm-Gg: AZFdTZdQZwlO9I1hCBuSgZ7Po4/wpQHklLTzcWCDlzwKThS9RugubZuMD0GRiEmgG5V
	spOYtziIBTJM3q29olEJ9Qp/vhELo1OoZrE6ORoB1s1yQqfczwcbG/EEt3sqmrldnaqLn2+mnfO
	PL52q7mvcRt/rMJqqlPkCv+Lj8XIAovb1+DvokBA11LVFwy45Jz7h76RtuVnCmUph4Im9MmF7/r
	xRPtmnPGbaNbyqlVitA6sgLoHHAyEAU2t3de5dj4yRXzvKHF0/G1E3bSpJoK5ZCe6uS09j4pTX4
	xVfAcujcQaQbg26Ae69hi2oxPtQ3GFfOMIcM6paxJtTtwOIsNaKWm8l3sKsnDTAm0Md3boS3Mwx
	sr+8HGWAnoHawnqcDTHAARWMXsUpPmEUJI1xxSvATU9uuzMr+uT2gs6JsB4hxbtdPVQ0/bZnWGs
	xj7H9HKd39kUBYOkVzAat4REp9k7mmTixb2CctmhA3S6Kxj140YkIJvnkrDUHlphTp9zHGE7XwS
	VU+wpGb2BRF7W44XKOCuTnI3jYCL2Gyb1RBDs9HUgywU6jZx/iS3ww7cQV9dqq6QewdGu3LcAuT
	Ni4ys88kQPt8fQejLqs=
X-Received: by 2002:a17:902:ec8b:b0:2ed:662:e485 with SMTP id d9443c01a7336-2f03efa420fmr137669995ad.2.1795682753264;
        Thu, 26 Nov 2026 00:45:53 -0800 (PST)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f08d73dfe0sm65354835ad.69.2026.11.26.00.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 00:45:52 -0800 (PST)
Date: Thu, 26 Nov 2026 17:45:50 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: linkinjeon@kernel.org, liubaolin12138@163.com, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, zhongling0719@126.com,
	stable@vger.kernel.org
Subject: Re: [PATCH 3/6] ntfs: read initialized_size under size_lock in the
 iomap paths
Message-ID: <awfxvg7w_i49JxBv@hyunchul-PC02>
References: <20261125073547.154150-1-zenghongling@kylinos.cn>
 <20261125073547.154150-4-zenghongling@kylinos.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261125073547.154150-4-zenghongling@kylinos.cn>

>  	if (!(flags & IOMAP_ZERO) &&
> -			iomap->type == IOMAP_MAPPED &&
> -			iomap->offset < ni->initialized_size &&
> -			iomap->offset + iomap->length > ni->initialized_size) {
> -		iomap->length = round_up(ni->initialized_size, 1 << inode->i_blkbits) -
> -			iomap->offset;
> +			iomap->type == IOMAP_MAPPED) {
> +		loff_t initialized_size;
> +
> +		read_lock_irqsave(&ni->size_lock, irqflags);
> +		initialized_size = ni->initialized_size;
> +		read_unlock_irqrestore(&ni->size_lock, irqflags);

Is it safe to read the size again instead of reusing the first one?
And the size_lock is missing in ntfs_iomap_read_end_io.

-- 
Thanks,
Hyunchul
