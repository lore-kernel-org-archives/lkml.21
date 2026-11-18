Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016560;
	b=nojdcboiHyc8L8GdZrQ5BWguHOJt/JuyhnE8MB/wGceHWhiHCg4t7DrZK8UZqU+XTVEf
	 IDc14xvbUYTsQ9zaB4HPnXudvGpEyu5dkUGNE9EG5R99vyW4hmJeGsgRhYXI0AV4ea5yK
	 b+R3OsWM2ESxQSzCO7Z2AjOtq+xIgdorEK2TQ9xeFQLY04jyVyCY1SYMAlwPMq7u63lzh
	 tEZdInhlYjLEEI4O7+ZW7R6vxMf0zItMElxLDuN2cM46pe1YWYQRbvBuP8IDvECeaQikC
	 AmPevA6EbaJQz07wAt2IDJujjh6dSjLvrOXqAKuEqbYXHKbI2spfpMhfDQqNL0tI0DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016560;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=RKQbSciVgm6q6OZuo/dZsxr8jfr4y3IcbTHmuYz4xRo=;
	b=yxRhQU3/UXeP2yH5vJywsMk/y1CHdAmMsKm/V8GRKHpu8jqcB1+sMaSuCIa2MzgmP/LR
	 of2AQmUxv6p0YGBO8KSLAx6CBbRfDBNJa82/Oq02XF1LG18ExANQvWNjN/ug1yVgJDoyS
	 Yg7errgpPSiNfHntT/pN0rh3pofwVwFX9bMe+h5IV2zUp04g/cjqBMEhPjui0J/DoaOSV
	 QO8S8zoCddOg1fVSBRr0K6xiObB8XJFO4+52JhUg8TkNn8oNlOOrw4mPZUqQlPS5dY8dP
	 Dq02TQ4VghLPDtk9BUCOBJm7/H9tV8OyE9Z9yw0clJ7AFKmunc9bZ/b04C19Ck4u1vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="eXLibT/q";
	arc=none smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9F5606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:42:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E9F5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eXLibT/q
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5be4fea434bso1959067e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795016558; x=1795621358; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RKQbSciVgm6q6OZuo/dZsxr8jfr4y3IcbTHmuYz4xRo=;
        b=eXLibT/qYFd7DQjxErpIUzZgYn49p6J/2rXvi1eenyjCr3QFswsL4rc5SfIIfFHC5D
         M8YYkzzmaAyOtRqEDzDA8z0pqP5cHILcIbQ+mdYrK1zwURohpC7vZkQrZ/XzlHzQdyTu
         Cqeb2TqSQBnwvVFAqvwgv4dbX1PYizJnVwdc/k4UlfiIBpADUrZXYbHLdZOzkX9k/NFl
         jzOf7d95kF9171GJnVs1GwerQ8WWTMu57mBlSynbufpCSYC5+ucFcm3JsdIq3+Uf1z7x
         Xpo4/5Fw5iDrOBm/wIcOXnc4415Abe4tUOBJLHzMRxU460QIOVPoCGNdggNS4ifs4wjT
         T6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795016558; x=1795621358;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RKQbSciVgm6q6OZuo/dZsxr8jfr4y3IcbTHmuYz4xRo=;
        b=o2BZNyJNPymumSWIXcRy5Hl5gLfdGkipfRNuh+rgAFhecJjlfQESbXKwkK6cXlggz2
         4eBhHigQ6xt9XH0WitlrVLRpwFy7ULvB0Limfu5Ien5uvkt/KoZrXvhfz5f6P+FzAozO
         dOOwN5brN23ltUVgjoF87wmmWage3oTblkf+XlkUPYbx8l59fmRWuUGgGv/TMNWqzyRT
         E7Or7goVizBcsZTbiOjKpdFKoZGuVv3ttRffnPttpBUphYA1ywqeCIjkz3MqiyUBUZcR
         RU3lcF5mdpT6R9K1qRXp/cNCpWYM9lX2hAJxgWAx+6Gysq6sPqkwpWuFDo1LTAEK8wwN
         DaPQ==
X-Forwarded-Encrypted: i=1; AL+hErHLY+0RezGplz0Jnp2EbjhspRhr/mQHM/b7Xp1rWDMJeMSZvYxsivdvTKwdax/+1oOaJ5Dp9PQ7bymZzlc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+grXHxDKQt2wXESb+fFBzE7kra1ISL6LOXGccwVzsM4d7Gp28s
	U98FePtdz5N7iEXzmR9LKLWYMFx0guV7RZz30QESc1Ok6+xc8G7b+xs/
X-Gm-Gg: AYBFou2Mju8UUy1um4oDQ0IiM8Pke1adX34Eu4r4XYeBFsw/lj4vRq7o7/pR9c+951y
	YGdJRqCj0YF4LWXxssENzLpbT34Sy2XY0hPw8zXY5JXpQ/Y8tpQwff3xtDHNfj1T6erlsqBfxEh
	3GpB6KWfXZ844fxEhLSfZ+1HswPdo/uCMh3T4SubbDK/gx9g86ZO/L6Dgd3d3nKvzngNARESRja
	YP8f88LFJYP097YS912KnaWcUOke9A7MsDQq8caU73ZxMvupgKxQsKn6gFTUOxz7GVr/OAcMMey
	LL0OUJWZLuyq1L3M2QpREhCtLn6CNs6mFx8Q9P3SlVTKrn0h9G2vSTeSsQqWafZOZohkLE7wVpj
	UhJ7/zae/3O0TOHBuhnDTDusXtbsxfdVvKFpV/2FQDfbQU9zdWr3GriTYN43Stx07ml4Kjsu9IO
	1EYFI1R9JE7iUMVydslC5ShJ7BLXZhajjBGkOGN4iS7xzDRvza7T9UdxO1oLjykvwCeAnCnCqJ4
	B3lZHkqgt//Y5zrb6lsbFv7rrYSmP9RS94vjJv4BEJQY40baS6xkjxPMg8u65V9XkMYRe8wJKNQ
	vtVlUS2a0pLwQzTrhJv6ZMYSqNxSspZi9Xh1pww8kePcRGl/Mg==
X-Received: by 2002:a05:6512:32c9:b0:5c1:56e4:c705 with SMTP id 2adb3069b0e04-5c1a0e434b5mr2331156e87.3.1795016558031;
        Wed, 18 Nov 2026 07:42:38 -0800 (PST)
Received: from rigel (106-68-220-184.tpgi.com.au. [106.68.220.184])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1aa76035asm631034e87.27.2026.11.18.07.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:42:36 -0800 (PST)
Date: Wed, 18 Nov 2026 23:42:24 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Jia Jia <physicalmtea@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v6 6/8] gpiolib: cdev: don't report a failed line read as
 an edge
Message-ID: <20261118154224.GD46152@rigel>
References: <20261116-gpiolib-chip-removal-v6-0-aambrozewicz@nvidia.com>
 <20261116-gpiolib-chip-removal-v6-6-aambrozewicz@nvidia.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116-gpiolib-chip-removal-v6-6-aambrozewicz@nvidia.com>

On Mon, Nov 16, 2026 at 03:47:09PM +0200, Adrian Ambrozewicz wrote:
> With both edges requested, the IRQ threads read the line to tell a
> rising edge from a falling one, and treat an error as a high level.
> 
> The read fails when the chip is gone. A driver's ->get() returns an
> error once its device stops answering: pcf857x when the I2C transfer
> fails, dln2 when the USB adapter is unplugged. Since gdev->chip became
> SRCU-protected, the read also returns -ENODEV between gpiochip_remove()
> and the IRQ being freed.
> 
> Drop the event when the read fails, as debounce_work_func() does.
> 
> Tested with gpio-sim removal (test delay in the IRQ threads) and a
> test chip whose ->get() returns -EIO: both reported a rising edge, none
> with this change. The HTE path was compile-tested.
> 

Reviewed-by: Kent Gibson <warthog618@gmail.com>

Cheers,
Kent.
