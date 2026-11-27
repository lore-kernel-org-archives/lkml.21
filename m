Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795819167;
	b=jLlhnxOTbEJIbmeiJmWSkRz1a5/MFTuPMNYYNKGx+pkd5Gco+1ccPTRdptcPdbqlbmf2
	 q1IgMFm3G9bjo4hKKYu511jDsjWuZmwCXrO9EMzBiBWZPOsFqbL6CL1uof/ujNiTgDwSN
	 44BKTEPV70bP0COyW3ViPzljj4CTbS3tqmYgWIv0WwXrUk/zBnldtFCju0qNub7O+b4Lo
	 ZV1yTIge+WJYWrNSABj4EUN9XBPbi8CD9bSDuE+5Qjx6bxLQW4FWyYulRJvO95H7uq7qV
	 bOK+hkSjUZZJX/t8XYdNNLYc4mjyp6tPuhZ5IAQY0af1H5IcVBpur7xzViXihnznLMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795819167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Reply-To:Subject:Content-Language:To:Cc:
	 References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=90z1iTA6D5hw7YGcnjWGq3A71T6s6+jBr633hd+YCV4=;
	b=1g1OMXDOM/mj8b+hqZitAgnRkt4OW3CEUTXe02/y4F0dsSn5SlRRSTZ2Xna/Azkk6fhU
	 D4W7QRqQIjO8akg7WgBrQuGio4DjTp/IAZxlar/YtN0XoiXV1V5gek1jgEpcTuxlpF2Ro
	 4DWmUx28eOvY1p35IrySA6Vj1jstTSeU05uqYYeGvzldEHEvbSESzT/L99QSTjFNRvK6z
	 nx3+fI6n/AmsHIPMNCD8zWxJhYfaR80JxGFhk7hJqXinN7NXmUoTM7ttds4iJk1+fH408
	 If/xHgl/mSqZix3yrQoO9/sUR8ZxpJsL29xrTsEiVFursnZqhVm9BZDGqGl1lJKqF7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dr04bENn;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901A9606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 22:39:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 901A9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dr04bENn
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso3933450a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795819166; x=1796423966; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=90z1iTA6D5hw7YGcnjWGq3A71T6s6+jBr633hd+YCV4=;
        b=Dr04bENnJAvrYc8QCoCY9wKm39WfyrZe3kD81rM8ZYakNlQqCmL9tQRPNSwD5jGSEj
         Na6wGZHO7cNALFwqrMfrDqU1tqDQJskfJ66y+ORFczWm0t33LhrjZNGXQXTOjj6ipULg
         XCBWhVsqEUbh4jkILwJuZcR5+WGqPBVqxYFBouFcnQ8YNT2bGN/eTUt2ElBdhhHIluer
         ctOpiDolycf3jiypnhLt8rPsLlKWWRQB1EZhHsSppSTNgInJpTQwU/8aleatsSJhRkTY
         Bi/93LAQ5zLoIVhU5Ns+CTCUPi1dqJ+ttowjVb+wUtgPcHiALKYwojRdz5BVRnGsepu2
         NGeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795819166; x=1796423966;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=90z1iTA6D5hw7YGcnjWGq3A71T6s6+jBr633hd+YCV4=;
        b=J0OhQw5YmxB3zATnLV/KQffOiQqNHkWOAFr1Zso5wabGhKvDR7t5wGCeJmBkoZGSYK
         OVrFB8OCrzG7wDe34ovT5VYv9IkZ3oZ+oKNPzCUYrKh+tDN4tUhwJbZTIH93NW30moIA
         Ag9XrBhY/qY7uIMDI9ZT4P8FGwoJbVqBVxyQcd3W9aLSyRzsmzKu1W0fPeVSdEwPSMMf
         SH83vkSAqaJiy5xCu08v4wqH+7DhXTsnSz2HEmaFqlm3DA0J8naEaGqaMbxH75GWPcfL
         r+b8azX3h+DwLbeKp+OZBdm27JLWJ9quAFJgKjJBiQa0jV0qx33JTilfi6y/qk0mGJAQ
         sFuw==
X-Gm-Message-State: APuU4Z9qJlKswtP182RaXD6Mzl0HeGuHeQUxgghcJ2FRuIaVDwqhSWcM
	a+d6N4ZXXaqs6Vy8og8Hh1XV77qzrYS9siFn6KViXXAjx0LDA+JvvFN9
X-Gm-Gg: AZFdTZf9rf2IVGD/a3UGEi/JWgjYc4PFInX3LYS60+7Kp0p1fkFlLtaKkx+ClvAukZS
	M1GRM7yEaOsOs44FVOEzskNT/VcupBFavxdq55qebJjehOs4kxKSvJBjyL4zY86QgqnwtiKSNdc
	lbodlDOMB7uenlseZ+Pjo8I8lAqA9VnBckDMdWdTJOrB70zHx+vah0rV50EPGruaA/WrWjmsIOx
	/GTEHj263T4dZ+lsWKQlc2CoM7vNyyzLtFDoC3waSrtFguWw9SMPBeV27NoDqVwKZylY1iOTLu7
	FQ8yy2dG7P1Y1+k6bru+biRV4FEQMPmjd6+tBrKAqrHrmegP++Dld+Y+G2MDIXhahA2+qj4y6ps
	i8hTIEfNOTIKu4/prmKrzgv2Qs6no8jk7ZkR3H1jdNhag1To+50TGdfMF1LeO2/K1QA3PBH3yS+
	SvWkENan/bik865ORG1Q+7/MVhBGRASvnqtRcrY2gLc2LBJfWRPYvUMRydfPTsfKNOfuq06VwAq
	EoqvEtAWJQSe0N77jrh3Xr2kUxXP9LPwa8YUu55mn/bKEVRfZGTEKhgR3DWEwDrpqj2pIUF9hHY
	Qdkp7i13Y8Us3kZoinveF2vPAJdxCQqFch6FY+vHCeePtLj1r/1DJr54nOeMsO7oOJ8=
X-Received: by 2002:a17:90b:4ec5:b0:3b3:a6b0:8991 with SMTP id 98e67ed59e1d1-3b41c96180amr24549608a91.60.1795819165951;
        Fri, 27 Nov 2026 14:39:25 -0800 (PST)
Received: from [192.168.35.60] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b48b41928esm30447911a91.9.2026.11.27.14.39.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 14:39:25 -0800 (PST)
Message-ID: <39365d6b-ce1c-4915-b3d4-6760e847cfef@gmail.com>
Date: Sat, 28 Nov 2026 07:39:22 +0900
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: chanwoo@kernel.org
Subject: Re: [PATCH v1] extcon: max14577: Use named initializers for the
 platform_device_id array
Content-Language: ko
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: linux-kernel@vger.kernel.org
References: <a4f99944ae965760fb3d532172a40137a9bfe938.1781620257.git.u.kleine-koenig@baylibre.com>
From: Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <a4f99944ae965760fb3d532172a40137a9bfe938.1781620257.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/16/2026 11:31 PM, Uwe Kleine-König (The Capable Hub) wrote:
> Named initializers are better readable and more robust to changes of the
> struct definition. This robustness is relevant for a planned change to
> struct platform_device_id replacing .driver_data by an anonymous union.
> 
> While touching this array drop commas before closing curly braces on the
> same line.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> ---
>  drivers/extcon/extcon-max14577.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/extcon/extcon-max14577.c b/drivers/extcon/extcon-max14577.c
> index 5476f48ed74b..2c1580ebfc61 100644
> --- a/drivers/extcon/extcon-max14577.c
> +++ b/drivers/extcon/extcon-max14577.c
> @@ -771,8 +771,8 @@ static int max14577_muic_probe(struct platform_device *pdev)
>  }
>  
>  static const struct platform_device_id max14577_muic_id[] = {
> -	{ "max14577-muic", MAXIM_DEVICE_TYPE_MAX14577, },
> -	{ "max77836-muic", MAXIM_DEVICE_TYPE_MAX77836, },
> +	{ .name = "max14577-muic", .driver_data = MAXIM_DEVICE_TYPE_MAX14577 },
> +	{ .name = "max77836-muic", .driver_data = MAXIM_DEVICE_TYPE_MAX77836 },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(platform, max14577_muic_id);
> 
> base-commit: 8d6dbbbe3ba62de0a63e962ee004afb848c8e3ac

Applied it. Thanks.

-- 
Best Regards,
Chanwoo Choi
Principal Engineer, Samsung Electronics
