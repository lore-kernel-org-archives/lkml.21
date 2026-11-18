Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794997923;
	b=FLq96TYZUKHA82WeuaBM4fsCEmUDzjsPb6rjakIiekTZRqO8YQ1Rpdz1EQ4r9dhfEwwU
	 qadyzYeLjmpD6hjmnHeebCzYHvNiGsTVg5hNG23aaNWeOy14WR2eny8X0tIQzsmxtHTVr
	 BFJifJvSVD9gHSEg1J/W6/7pCXoUI4xPJjA1ZgbwissBa/tbWgkitD2WBXvhsv8YuL0js
	 +gaskfFp5Teat1iN2xH4KaNfSvRzt7FYGQg3eI3k07cTNXZVM7w6hgH0frKMUA2AjJ6TU
	 wmqBwfi5eoACV6cGjH4Atjtnfv3zYUOK0VTVNVRyKO9fvSt/wUuWf3lpW3G9t7VCGRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794997923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=zp8KDvfQnedhc5dWWrFnI8zt16YP/phqo55Fqv1pHj8=;
	b=lCBIVm201ed/KmS+rGAFXa+jaj47YLSSCaZ8pTfYL/BhhBNGRHjhu5bJTZb+lVbdnAQQ
	 uAeLDce5z6PXNRSz22v0EcNBZDecc2j5dvbdP0WCWzBUkTh9KHCsmoifcoDJV7+5aKTuv
	 styzymHIuGpFMkbCupcSpWJ5TnPGYtyE8nYvO7UKbUN5BPQouMxeUfS+Ym/L8QA27WIIo
	 sDXGTlD+uXXPbpYCrFiKm9tgProq5ouiuHVlhpy2K9b/YvIoBqfQ+SFRBZVXNLrqU6eXv
	 QG84HhbiDfxcFxqAsupvvRpwPqmTfnSJGxRnKYbCE8EfOvffT5APiaTaMmJv4PkvDeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sIAmVEWX;
	arc=none smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9A360A261A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:32:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C9A360A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sIAmVEWX
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bcdae234ecso913651e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794997921; x=1795602721; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zp8KDvfQnedhc5dWWrFnI8zt16YP/phqo55Fqv1pHj8=;
        b=sIAmVEWXig+xreMoQRKV26QS1AdelvXoSpodOL8/hIhZw3yXevIgOofeE82qc45x9V
         gb0+TeVEbMp5qUfLvsRH91VnVe9lmEnEWia8Jf5bE+3Sicn4ymkTybOBHPsS5EMOMRLB
         yYvDBfz0+ZOe4f0xgAshhx/RIsOCf2LidpM66yiq+ONm8N6l2BgvceOGmmv4WvWH1OJq
         GT0lPQbSZ1Np6B9gCKXgpSpJgaOpDK1I8+iNQrRDCPW/3K73CJ5MVjOV7EWRsVFpMfIZ
         yfRCk4Z4fGUmjx6pVG6/HPRnikQxXMLX6Wd2Z95ArP+LbXVOeIIq5bzA147dEKw/ZlK0
         numA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794997921; x=1795602721;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zp8KDvfQnedhc5dWWrFnI8zt16YP/phqo55Fqv1pHj8=;
        b=mQGxsXRVtHMfxkfS5OZGxadJhwsvlKPABY3WwFS/0MuCe+lPE+K5LrpK/UH9a4Y64V
         h+SEz2VcfeVVK4TaoydSDEqTY3leSBQ5E6TJEBzxAf9L5Uw476JTIze1zZTTMslGYCdM
         lZlIgED6V03J4bQKeQ3GyPWU2fZ/3ZK/c4fUBv6e3N2rTpwm48CSj2DNZ1scVLFrD+8s
         JH8z9vxzAZOuT71ShW3jFh6/IzVSiPviDNEah8BXT/RI2lF7O6/W9gfbffKQ1TskFexS
         kGL2CdGu2j6H1FQYSU+wv87/nFoPymbQKGpIobxeeqk6F+llEMrYT9KcxA8oY1AeL7Va
         ixQg==
X-Forwarded-Encrypted: i=1; AL+hErHQlykfPkvSi/abVfZd6aClM9loAw+LY8xwffS4O61YLtYqZPkNjL7vn9H3xbO2ARkUh85Cl31ck1HRvUA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+hGlZwxk5MyhaBiitQF+3+1fa1CzUFCnzMhk55YH66WPIMHQ4
	zocNbs8wMmP6oskJwrMF/b6tliFmVCr6nEsgIK2Zx4h+38Bl3RiiFFqt
X-Gm-Gg: AYBFou2/QGsw/EdHkTunTB6R2HJL2ZK7q2oUtP+edXgKcDsobBXBN/Qt5DAqq5VnGc4
	vP5zNoZUZMqGrR2AUp1ZjXAE/1EL/61QPZwNoCs7M1s/uIzMi63QH13A2rryse7SzSP1LSLLmpd
	8Y0VWtu8y0xoLLhtK3IBMU+LJue85eKMnCS476Pqhfi3r8Ih5SdQ47nvhmLMlR1ZlFxiuOOzO6W
	yqkHYObar7sdK9RrqZM1f2rviSqJnMMA58tPamnBUidIc9Z3zJlWntg+o3Yb//MoFMmmTsTR/Wa
	ivaNVXxapGsT6SraY5vyHu+Z2hMMm4a70UafU+bhO6snKbGbXJfZld9NshOsrRNPLqa25CkmGPj
	Ia3yACMJGRfA0jKbijoBCNM2J75IAPr9sz6oMyTWTiEWfEgK5wtvNZi7uuL2KBUcItett8i4d74
	3jk+BZZ6QBaa/81yweZcRCHnK78roy9bNsv8yAIpd9efCmpMViHGZl8wCxzmPKXJloBICnvIuN1
	VSIClKzXDX9aBQzJidb4vl8ZELP+wn517GSrfS5om0+yEERJ8lDauEPOcllie/geSgS0CsytRM/
	Aa99JpdGMCw/LNLe3z259uglHns3301zsJAEBww2694ycccT8ohPvOzPWi7491+AWof2vyTdgKR
	duOZ6pnk7eQ==
X-Received: by 2002:a05:6512:1596:b0:5bf:b144:fcbb with SMTP id 2adb3069b0e04-5c1aa067108mr678419e87.28.1794997921160;
        Wed, 18 Nov 2026 02:32:01 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1aa77e5ebsm420005e87.46.2026.11.18.02.32.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 02:32:00 -0800 (PST)
Message-ID: <820865f9-2ef5-4316-abbe-5c44c7df55ce@gmail.com>
Date: Wed, 18 Nov 2026 12:31:59 +0200
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
Subject: Re: [PATCH v2] iio: light: bh1745: fix 16-bit register accesses
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Arnav Kapoor <kapoorarnav43@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Mudit Sharma <muditsharma.info@gmail.com>,
 David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261117110327.198084-1-kapoorarnav43@gmail.com>
 <avxi4BBJ_Ztg-aN7@ashevche-desk.local>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <avxi4BBJ_Ztg-aN7@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/11/2026 16:21, Andy Shevchenko wrote:
> + Cc: Matti (even he is not listed as maintainer) for possible another pair of
> eyes and/or having an answer why this was missed at the time of the driver
> submission (from my perspective this patch is correct).

Thanks for the heads-up Andy. Unfortunately, I have never worked with 
this IC, and I don't think we have it in the ROHM Finland office (but 
I'll check this just in case. It'd be nice to have this covered in my 
test setup).

What comes to missing this in reviews... Well, I suppose the reviewers 
are just humans, or if they're not, then they might have concentrated on 
other important things, like styling, instead of the real functionality.

On my own behalf, I was away for 1.5 months when the series was applied, 
and I only looked at the GTS-helpers usage when I did my shallow and 
badly belated review. (Furthermore, I am 100% human, so I might have 
just missed this even if I had all the time in the world to do the review).

Yours,
     -- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
