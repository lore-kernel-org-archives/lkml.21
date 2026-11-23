Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795434155;
	b=5cJKTLLZCjynEijdztTTbEyG4qs50n7dmP7RUMJK7Dw55BoEIjN1mxnsOWJBbYiL7NGz
	 upNDZ9Muqi8APJHBS6REwFL5mGtEERRKQY+5qtXTPElKEn1LT5P0bL4rok113zkvFuEil
	 qApe/2WU5uCmEvsodZ00CkPb9QyrVJrNkHDsp0hQL6GZt34rUAmEik0TPJWCgnBOOFSOo
	 fZkxt/1BOjWGW9Q8n7QZX2zWYHLME9P5p/31SFFvABcmAE8nHNTC6CYAL6GVSbCSCNP+j
	 ZQ6KNIJcLo7rMhCz3RK+TGANUbLlMLUP5DpJFumCfB5SFGMOb9a4QpX6aSkDuBNZIaw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795434155;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1hW9+0nqRdg+3q1QPOHCOfA+kKVlzauKBMN1mSe+ESM=;
	b=1UXflWnwbIeaSsFs/nJAja9Tq/zIAUb4b3ZAKU7mHtUHqdZNrsEXtVQSssD9nAHl0JW6
	 +hpK69Xep4TDgSLikrG+X98Zn28oqCD4RMdh8OFG41fZ4bBcH3C4sbBePShZ4jEWpTvWF
	 EYhpDq95ISXPAIrKOGFmMy9uCGZawMgIxVPStXiKNxUBgA0df6tECyOihyr/aSuEhZIxO
	 bAcZzekz5IZJn0S5U9WzjRV1//+KlTs3XSDueA43BvEKSYJHoTQO+/yROFD8YBZEkK2Gm
	 nyKVCb0AlOxP6rvtyZO1xBL7tU0IHqYBpamhTk3I5yzBIlu9puWaKAp3utz5BB7kBuA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="waG4/sVP";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BDD606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:42:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3BDD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=waG4/sVP
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-843cf077f10so4588618a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:42:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795434154; cv=none;
        d=google.com; s=arc-20260327;
        b=eHbdyaHTmC44JOQScnAKRePxfZQNeku62Fx0sZYw4x2w7q5QpW0060VXNoWYUX9Xlr
         39gxtZd0JSvq/0Xt18e1M+kR9LnZ6iFC49q/9f+mIJgTBK+KA/s+M8OhzS16vKK7mfxc
         RV96aTJEmnblYCw4LnHyra8KHnGM9vVKpWhkXxFzXRoo2uM2j7A2buAJje4NAOQxOul6
         dHb4neaR1eZEt1pCkHhPinsquoui43ATU+RQ5rFHfQyaOyu4Zlh8iEwe914KN/7r13R3
         Goid89TDBXE8ETTIpyP3y66EoNX/4K2Z4ICE4EhRtjp02ALK9no5bHPgKEj+tQrcUyjh
         Nedg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1hW9+0nqRdg+3q1QPOHCOfA+kKVlzauKBMN1mSe+ESM=;
        fh=FDF9UL87aXw6oJWyJMv+0qfNEm3hM5KQfbq60TY83WE=;
        b=lkw+ZByaP7MPVGtGQ468WGKoESGlBcWLXyyod09QXUAa5zb5PWEYX5+rOhxkUoE/1k
         Sy3CSV+j/Y6FZ6fhWx1gguKAUAUqsHHGmUVl/2aLenD0FXDe+HciSM3RopoeUXSL2ePJ
         NqqZSJSZJxr3EIECZOdt5nhqHbya6ujNe+MpF3TAisrIZJ3B7GI5gIhp9bcAc+rAFs0+
         aX/4MBLOo6ppHNULzZI0R/cjFS4dMjmvV4mCL7cllRoZjm/4Ei9OfrDgYY+FWfjj6Epy
         FCHmh3c4hkrgxMoVdti4Y1k29zGpvWliJzRECrzNxDdIZAN8Q9hNWE85Kkz2+rJifPJo
         /Yvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795434154; x=1796038954; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1hW9+0nqRdg+3q1QPOHCOfA+kKVlzauKBMN1mSe+ESM=;
        b=waG4/sVPeZingUiVUORMLtng9Mbq/PKGmshRRhVj3jNPTuxRjIY8mZH6h37zpR4yvL
         67pn+EBZw7qYlVRXJSY3kymoYqtK5ndAqUgf8WBAa80q7ULF3DwZeO8HKPUg641jBGlO
         06o/y/nMOBlc9XjLN1HjtH8F/4VjFpP9C8wWSnGFXHPDiwNRBe2Nc8o7xvNCNxVkEVIh
         dlbKfPr8nWa2XwPTinmrZNQZP20gOQeFzN9zEDLaIjwk3f6rLv2XAulIKDNaM4ahWP2E
         Oft2NKK5Nfem8BGFabWyPKJ7DaGwnI4KRR+oki8vzhf9cET/5uJGp81G0Nrmfpsr3hL4
         r1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795434154; x=1796038954;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1hW9+0nqRdg+3q1QPOHCOfA+kKVlzauKBMN1mSe+ESM=;
        b=TubgnZR86g0PTfKW4AFtPbIKJapQyW0aX4JbKRS9Rvmv9hGMZiWtf6bmG9gVohaNt8
         wh1rs9ZrmIxBPCoRBrRvDcZFi7QGowzngexTRi9oT7o9uCm+XEHsHLiX8YlbtoyJw72T
         /L+mCzqWR+I/l2LCgPIW7Oi1pXAAkleJ0R62m1zgFLoirwNUiuS6NHO30Pc/55JPK6EI
         rHEjh8CMvhTqJW/9zbTv9Fzwi1ljWsVQxNKo/T6Di97cU0Z/Fb6gTrP53kTUf5E052jg
         Xbu9GHCreEazhS7wpesRz36i09+WAVBtP7xYjfuDUCLZKRhgRZc0788LUAfY2GHwpTtD
         bDCA==
X-Forwarded-Encrypted: i=1; AL+hErEC0mDuFrg/2a5ZEh1jnFT0DSV8GbPjmajjT9BBUVARxS7Mrg4scrCWCSxcBtz2Fqu1fg1Z4In2ei8wcTg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5PTES3cp2WL5BN/qHejCMP11u2HUfQKK+C/ObuNf47vMGBY9X
	SLGjwCR+BG1EjikIGm+9OA07lv52OIHLW8MxWzevOxqolvp5zf5PGS/iE+RBDjSFJBFP9+i0aAP
	RfTSfuxGfM8vIVXEl4qslu52+M70vdvY6+qoc72g=
X-Gm-Gg: AZFdTZepogEl66e/1lzrYctcobbaug9osZOct6F9CmhwJY0W9TtsfgT8acEfLjNql0T
	H5ey5oKpHerrljqatZ6RHvmm2yiPPMwwK3uUG9+H7lZtl1xrl54h33TnHtAPkVrvAO/crXQWyAE
	Sby0wWAYIvin3UIhVOmTUB0YwXn6upCzmqnMa/yanWlrFHt7ulIjqoygSUlcCiKKNJbxpzNVb3t
	3gkTHSLBCt+o464U9bArp7spl+/XpZJa/3BuyhwyHwRwwp+m81wztZ6Hm+qMI6kOA3qnAJAqeRl
	iA0j3mJyTxs88kq6el/PPULJCKCE2zWUGYng4W6QVLlyeaE6IZzwi6ZEzdyRJyijCzBfR1PoX88
	9VxyOomatpdKI5oxlPCX1O3DTYYJ60NlOSSXhKw==
X-Received: by 2002:a05:6808:1484:b0:4e4:627a:e0a5 with SMTP id
 5614622812f47-57a0bb6bc73mr12310235b6e.40.1795434153972; Mon, 23 Nov 2026
 03:42:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123113234.197852-1-mariagarcia7293@gmail.com>
In-Reply-To: <20261123113234.197852-1-mariagarcia7293@gmail.com>
From: =?UTF-8?B?TWFyw61hIEdhcmPDrWEgRmVybsOhbmRleg==?= <mariagarcia7293@gmail.com>
Date: Mon, 23 Nov 2026 12:42:21 +0100
X-Gm-Features: Aa3M54qEgTnUApaug_umccwNyfXYHicYOq5jO2DBK4wHU_AjN4m9rB3P8QZtQ_E
Message-ID: <CAFOBSkS92tdv9xkwYk2MAyYk4J5YL1b5rqgfbT4_A2prCJRupg@mail.gmail.com>
Subject: Re: [PATCH 0/2] gpio: pca953x: Fix TCA6418 multi-bank I/O, caching,
 and IRQs
To: linux-gpio@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Guy Morand <guy.morand@bytesatwork.ch>, 
	=?UTF-8?B?VGhlbyBMw6licnVu?= <theo.lebrun@bootlin.com>, 
	linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El lun, 23 nov 2026 a las 12:33, Maria Garcia
(<mariagarcia7293@gmail.com>) escribi=C3=B3:
>
> This series fixes multi-bank register access, input register caching, and
> interrupt handling for the TI TCA6418E GPIO expander in gpio-pca953x:
>
>   1. Disable REG_ADDR_AI (0x80) for TCA6418_TYPE so multi-byte reads and
>      writes advance sequentially across all three banks, reverse Bank 0
>      bit order (bitrev8) in bulk read/write paths to match the datasheet'=
s
>      MSB-first layout, and mark the input status registers (0x14..0x16) a=
s
>      volatile so reads do not return stale cached values.
>
>   2. Support TCA6418 interrupt setup, edge configuration (GPIO_INT_LVL),
>      masking (GPIO_INT_EN), status decoding (GPIO_INT_STAT), and W1C
>      acknowledgment (INT_STAT) by reusing the existing pca953x paths,
>      while rejecting unsupported IRQ_TYPE_EDGE_BOTH triggers.
>
> Tested on TI TCA6418E hardware across all three banks (single-pin and
> multi-pin reads/writes, input volatility, interrupts). Also, independentl=
y
> tested by Guy Morand on his hardware.
>
> Maria Garcia (2):
>   gpio: pca953x: Fix TCA6418 bulk transfers and input caching
>   gpio: pca953x: Fix TCA6418 interrupt handling
>
>  drivers/gpio/gpio-pca953x.c | 120 ++++++++++++++++++++++++++++++------
>  1 file changed, 101 insertions(+), 19 deletions(-)
>
> --
> 2.52.0
>
