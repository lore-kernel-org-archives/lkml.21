Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794997878;
	b=bJLbe+bNa9mTEIiOlGQlS19JenUJt8aW1RS+ommjkJ1L7oFaywXGJ+Tv+uYP7D54+Wsp
	 ABO3l7K6ewxRaWLrAcH0JikvrH64EYW18WHBykbCU+R7z3xvY2ZF09n9UIYn2p5oFEHNu
	 HwpPOQiKloJCxlLJHeW9209EFhT+0JrhXn6gdFQBD7WJkCJreMpLPkZw9JllWWFNcfQPr
	 uVXNXyqEfTOctilaHagnHtHMHiVsFm8l6iEv/5UESA6yVhjzoNNxgv49kse0RH+Fiw0i+
	 POnM9FkO6uMHAKfnhb0N8ZqJkBVXFs29aAqT2s7gUqRGXJCXztOGf9PvdXbnRF+mn3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794997878;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=RNaYfzqeD2INqtazwHcQmd57GXTu5xCWhu4vIapt7gM=;
	b=u4vhRuiHZsOZJa4iTHJ/p2XlihnHCUySo39mobhrsYXI2MKXYRjVTY3z230xb7lSP6kH
	 JWWwvgIv2bL/y4NZrW6Z6EGemLGbAnInepu1hihYt613LP2437LzFiCBAjcGthAmNSg5V
	 YYS+FBxMW0kCoFT1O91c3/gjZs49Y78cstk55XncSCfSaWG01IdnAJTUMTMGmbbS1+Gr6
	 R+80gL+MI+Xqrb3xmHfE/iNWT3VyhwIRuKCh4nUiTk4Um8LuogUBrodXe7XNXupgDPq6L
	 t4e/DTXGzWeCAZp3AwQO4clTKR4aUKbHiLhw/VZohHkJq2Hs5IMo+whBoxGUxtwKK5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=owm1zLg0;
	arc=none smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D563606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:31:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D563606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=owm1zLg0
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c126f80426so638047e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794997876; x=1795602676; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RNaYfzqeD2INqtazwHcQmd57GXTu5xCWhu4vIapt7gM=;
        b=owm1zLg0VzYFmDdfm336JH/9bvcMfVg5N5R7J3bsi4HiUKpzL+6sCLOkWIwkPYCbMV
         UdAaZ9AVS1itm0VjYjLte2phA1r0VNW0wsggScBPXp2mNVaygoFzxOLr25NmEnebyMJt
         xp+ORVMt+ygOaD2zyIkYCYGqQ+ziH8XY9DswtnW4t9ZRd2jSkvNG407ofM1sHtyTn7al
         22JdLD6YyqYmnc9HY+zwPURAl1GUA2FbyBM8SAMRBr9bVD9yEcWwAQp2z/3yE24ad5+r
         nsSYBfq6iSWuqj5MtOXPNGP4HJqP8RKXhP4f7l/3251v3mr+6rObHBAAT34hCKtf5lDj
         fvUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794997876; x=1795602676;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RNaYfzqeD2INqtazwHcQmd57GXTu5xCWhu4vIapt7gM=;
        b=gaVgbjubnW017z328+H/duBUW9A0p4CRXUqRsONmYsfEbrEhCQNt+pi/VSWdyB8OLa
         gv/Jpb98jofvRgyhi/p/qs5Mk5vV02dhKX8TveFBsWgvpnJ/rful5AmVg2qP180lwDXg
         WLSOHbKZQm+DmYfpHjDAC14uHsGpxv13tkZbbuedqGH4KU5PidFYo6HgvHlQisYc75F8
         7SBFZry5EZO+2mM90pjQFed9jwS3Zy4G1Cvj+Sunv1JCk8XbbtfxlFDj7o32O7YJAjIi
         v1Hk/E4pilS4wzD8AXOvk2sZO5WsGdA1vyf+c18Ghntno9rNGBC54hR7xqZ2DKE+5Ah7
         DnLw==
X-Forwarded-Encrypted: i=1; AL+hErGHbgu2naUAoz+gRAKZTG31gKKMTgOH0cTqUocr6v0aCf3UySDtJFOLPx3H486N8Tuw4FctA2/uf7/n4s0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DYvevD6hAnWfVd3lwiCDsscC4LVp0jkN0Wg0jAx3APrJ/aPlM
	wghbNio1ExIvq5EJBOmC4FpAsXcAUHxVpXPDdqPDXrdJ/zUF6u8Jxjz8
X-Gm-Gg: AYBFou0vhrahNWc8ff0k/8AACVnicFyKJpzSa+XrYzQtpCfwYX8LC6DGOACQ6kHqHzx
	HVxSX9VCmM0kpQn2/VFkL3WbmBrWkkpL+ZttYh0//m8eeK7u2ckx9EW6yh26gN0CsMHN2vtWieE
	rkNmYHjexcpPpFpfF7ZTO40cZdvBmJsqmMfVtAKvG4ItikWdvVcNHETnGOy2XnjtoQ2J7Piiscr
	aW+QHaBXPR1kLeuMH3ieml026A/epC9vwUsSrSPNHuZzMws+hUEQFiawWYPKseafWTnK8CRXf9L
	KgVzR0aaiivpu2Neio9Q5YRDBJSL9EYDm3IaFb0EeL7NUsIn/zKzg39AQK+AEafo621HNM44AZC
	tXFEGWKsvWbOJuZFWNiB9YRW1QF7NxpLs4eBP/scuxMu7hwblzVd4DXG9UQGimCJr106En8j/OO
	FownR8vWXcpUlruEP4b3UuFFeF+iI9cq/Vahph7NV0Ryvu7h1e02PHXW8AHaqHlgspTDlGd/afW
	tvkAHAz0b9LAHmC/2vj0gIHGI/bketA8rA6RZYnZbzfYzJkhbwOvsl0+Oq0iXyfY0tE2S3/sIPJ
	GIdgBchVI3I2Iqi0wx2+lWevYoEVhcyBMvm2yNa4oA8xf0LrOTJ7mAJ3QucrsBJ8EemE1/2isd/
	9UkWIaCYnvQ==
X-Received: by 2002:a05:6512:31ce:b0:5bf:b999:91ad with SMTP id 2adb3069b0e04-5c1a9c17fa9mr645391e87.20.1794997875982;
        Wed, 18 Nov 2026 02:31:15 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae67b0cac2sm5223771fa.22.2026.11.18.02.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 02:31:15 -0800 (PST)
Message-ID: <c2e9261c-2906-457c-a6c5-8a81d87e3375@gmail.com>
Date: Wed, 18 Nov 2026 12:31:14 +0200
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
To: Arnav Kapoor <kapoorarnav43@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>
Cc: Mudit Sharma <muditsharma.info@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261117110327.198084-1-kapoorarnav43@gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20261117110327.198084-1-kapoorarnav43@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/11/2026 13:03, Arnav Kapoor wrote:
> The 16-bit colour data and threshold registers are little-endian
> LSB/MSB pairs, but the driver accesses them through regmap_bulk_read()
> and regmap_bulk_write() with an int or u16 buffer and no byte-order
> conversion:
> 
> - bh1745_read_raw() reads 2 bytes into an uninitialised int, so the
>    upper 16 bits returned to user space are stack contents.
> - bh1745_read_thresh() reads 2 bytes straight into *val, which the IIO
>    core leaves uninitialised, with the same result for the event
>    threshold attributes.
> - bh1745_write_thresh() writes the first 2 bytes of an int, which are
>    the upper (zero) bytes on big-endian.
> - bh1745_trigger_handler() pushes the raw register bytes, which are
>    little-endian, in a u16 to a buffer whose scan type is IIO_CPU, so
>    user space gets the samples byte-swapped on big-endian.
> 
> Use an __le16 buffer for all of them and convert with le16_to_cpu() /
> cpu_to_le16().
> 
> Fixes: eab35358aae7 ("iio: light: ROHM BH1745 colour sensor")
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

Thanks a lot for hunting down and fixing this Arnav!

Yours,
     -- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
