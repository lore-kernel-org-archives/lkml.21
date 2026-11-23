Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425459;
	b=Rm+LMKMccfGKBKSHA+O4CpivO27J6+EfgL6s48UwcVnQ1prvFmvLv+EkJGdhmBDWsut7
	 7piEb1p4Znr17Qb/4PiLxiQIXT1itWuJhM3Jd75T0yXN/8KkYJxqweZ5w/TdJ2roEzIYW
	 UBLpCqvz7Bd2KsXXNJ/A8gpiCO/1m9YLDbMtt4h9IvdkOLJjyokS9b+O9903jth2clIm1
	 rxMvXA4P7RhWzQUCeg2fr4JIDtmGqwdBt5d2xRY3eTmMMyuCpBZLfPrVYY32FWXSNQTT/
	 NF8X8ebkiNfYnpNzmVgYt9mjqRNA6uP59Sp5C5B/GSyPR1e0JUZLYRmBlgTWwN4P7dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425459;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=XivqS2GzXFfLVs4e8GPr3drYgoFDRP+i4GE/VUr/Vsw=;
	b=peIrIuzME5AKnk235UmbMOnEXaivOpqTv783bRanZI5CpuMN27+JwtTxRhmmsAYBlJ+A
	 drWH2OlGtq8hjobqPVPv//fkgS2/jSlE7HuHobl/jOF0HrT3ueLh/Ixj+G50cVhOhC76a
	 Y3yrYFHVIDCmKK/2zYNP4djHIP+naMENJc0aJjS1asDhaP/NIPSzhs2DO/F35QarUw0sF
	 nP0/JqH0SY66Uba/VYpQSLOk9jkQOoX1vTVA6PVuPvryCiVwxj6ArB6EqnDu/xUvUbvs9
	 O+Oz4YsMqmq/DzUta19jHOQGcom8EspTq+GY5i2RPupA8WpFjge+NtEIzWIXSCSKIHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MjgPBNgH;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB8560A3824
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:17:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EB8560A3824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MjgPBNgH
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so22768705e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795425458; x=1796030258; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XivqS2GzXFfLVs4e8GPr3drYgoFDRP+i4GE/VUr/Vsw=;
        b=MjgPBNgH02xQwwlmVT88dEKqXLmkOtxBaiUolaQXrr+yWHJYso0rq5H3V5cMGxLZ4j
         4A2RItLr1Sek84a15jzHonWwk1i+lX6hrm7p24UH3BIVH8u/GLz3xMWZesQ53FDWA+dG
         x2x2jR4ERMEhavazR0qcOByOsQ2qCtCO2KRjD5X4T6FvMjY7zuG6fmRzqAPu/AUqV92V
         3zRAjur90G2sULFJ+iQ/xXtaDgx1eTPqGezZVhpjaWkCUtP1ZjTSJ27EpBZSLQkbdNSp
         w+okTMvneu+NyL6uX2WegqtYxcRuAgKYFanr9LmWTOiEkdkqf5Pi0yPw0QbSbOF/v2lF
         Cgaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425458; x=1796030258;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XivqS2GzXFfLVs4e8GPr3drYgoFDRP+i4GE/VUr/Vsw=;
        b=sXZKXKJ4Fu0giXIliQNVLlkA6XrywJYFNJTjG2yGwae0/+XoUnGqSAzUpRm6xNi4A6
         rF35HSbzF2YO9NSxQ+v65G2uSpqpaKR+r7jZ3kU73NpPee0HqOKCdd+5c/DZwcmHPB0H
         22YxRxAXe0hqAyJaCw5A8LBh92w5FVJC8cB+M8Ak5UpvHMLGMANGQfvPwqxUg5HAzMOH
         vaL2ZalCRRyp9ifeAEihP1fl291pJzGXju4QNMuXq+1X1nN1VyeutdJbnV1RAJxH3Jnt
         t05+ihZy25iYJrqq6xPFQF0/v3iJZ+pS1zSHz17w91IJGTjv9d4GTNRzn3S3snSfUY/k
         SA/w==
X-Forwarded-Encrypted: i=1; AL+hErFYfAldk4UXCbuPzW6z8zljJT25zSH4lV4gd+sS2gZ5hUATTFPGaM//FXvgQ1LbMlv7Ihlou+SwABV5K/c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ipwsz5dAIAWVnOpdzKik2foDpVpoCs3EW7+wEhl1j97kSyzWC
	+rcWg5KxXLKUuljqSFYEpv58bxGAd+G0PQoicEjdOgfc/83NfO4453n0lZyKmERDw/s=
X-Gm-Gg: AZFdTZcP88eUYIxZTq8k/VcHv6i4qrzrfRDnfJ0w9yPtkLS1HGLakwrzCNoW2sE3o1s
	PSIZthgLyqA6oKR6fOLxKrz+divdVrJIMSVzqKY4ccgCzdBPL9Yw4K3e5iJcV9sXUIs3o6sP3ES
	b60jcN6Tz7G9m/aN5mGxhRXQhm0h++vyUQCtYIUw66xM2Ja562osiWwJgDnYH67QNvUosv1oIYp
	K4IZhkU+5wdbUIy1gWrNfLVMHBCvuOBQrbMmOMpRCkEmFNpugGhN8+cSPk+ZniRw1cKt7o+l71v
	Br0eqYQK3ObvX/RyhchKMNNKePj5/rhGQeT8zpPBoJ8fHevOOXVojyRf52QYs6Iduc76AVupWxX
	j9fXkFSNPk6RTjHBGpU12a7XIUjVqIkOPnNO1zs+IdHiExXeQ+dmgOJ4bD0NWSLpF4XxtOgmFEH
	bl9AIx6DfRv4LlGH0OBAksJSilc59wcTUzDlpO0IsIGp60a7cTxlYuGYHZoPtQHneMOwSQJjxaB
	62ODk5ys3Z+vP/oXPciHZK/Vgr264Fu/iY+ETAl7Aid/lkJYwEO4kU09mP1GW8zPDj7nTDsGCuJ
	uX+t/CDcXmb7Xp4j7QkFVInME9uSh+FScoFrBjiKcKQmhIvVFjg2zRO874PmO2LLnGzN/flDzez
	vfK3xyIItN9I3kEzpnb6roY8GWGOPvYhLokmjwg==
X-Received: by 2002:a05:600c:468b:b0:4ab:cc03:7f60 with SMTP id 5b1f17b1804b1-4bb8881b511mr224342725e9.18.1795425457707;
        Mon, 23 Nov 2026 01:17:37 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb906e4ce6sm162891895e9.4.2026.11.23.01.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:17:36 -0800 (PST)
Date: Mon, 23 Nov 2026 10:17:35 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: yogo.0917.sabu@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-mmc@vger.kernel.org, linux-doc@vger.kernel.org, 
	soc@lists.linux.dev
Subject: Re: [PATCH RFC v2 10/13] mmc: sdhci-at550: add SiRF AT550
 programmed-I/O host driver
Message-ID: <awQEjpz2572Y9wsB@monoceros>
References: <20261121-at550-rfc-v1-v2-0-b0309d0789b2@gmail.com>
 <20261121-at550-rfc-v1-v2-10-b0309d0789b2@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="53xo6eipu5xw5r7j"
Content-Disposition: inline
In-Reply-To: <20261121-at550-rfc-v1-v2-10-b0309d0789b2@gmail.com>


--53xo6eipu5xw5r7j
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH RFC v2 10/13] mmc: sdhci-at550: add SiRF AT550
 programmed-I/O host driver
MIME-Version: 1.0

Hello,

On Sat, Nov 21, 2026 at 09:43:20PM +0900, Yuugo Yoneda via B4 Relay wrote:
> diff --git a/drivers/mmc/host/sdhci-at550.c b/drivers/mmc/host/sdhci-at550.c
> new file mode 100644
> index 000000000..11c9de0c9
> --- /dev/null
> +++ b/drivers/mmc/host/sdhci-at550.c
> @@ -0,0 +1,51 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Standard SDHCI PIO only: do not assume CPU/PCI DMA address equivalence. */
> +#include <linux/mmc/host.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>

<linux/platform_device.h> already provides of_device_id without the
implied dependencies you get by including <linux/mod_devicetable.h>. So
please drop the latter.

Best regards
Uwe

--53xo6eipu5xw5r7j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsEBK0ACgkQj4D7WH0S
/k7hOgf/csj9IbehNzv7kJ/jSWUzgb6r4/RUEEbwtHDzllOp2mTN98xOQkRXzRr+
kmuM5eb3Prkbs0qQBPQiihfmm0Jo8lnvB2N8uBswWQM42XQ1o5YmtZx2RIs5cp4a
M0FFz9Bz2fH6rmOr5ETS3FRjnZ8CNqQnaFBWD9lGusUfgppfoyqvFwbXBZyQd45Z
KCR1pIqN6sWoDMkalLwcL8/M72VapgfDtPpmNp4qxYjf3m8WbJJZGT7uK2Mk78DG
WWybLbbeuHCv72ICgMdJArlShc5E7A8r/LZSSpXjnNPBCxOU5AeW1Fa/7Ma+TYWI
G0UtaE9KZSsmGdqMVovJUC5O5/MnDA==
=R4EF
-----END PGP SIGNATURE-----

--53xo6eipu5xw5r7j--
