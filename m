Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527659;
	b=1d/yIJS2uJCUXmDcG5feteMnNpRr18Vi4+c2fut27kU8cUwazS9qAwXfHIMqYggt4Q1a
	 Kl3vNeIGpK/BsveyhF6qM1qk2cDy1cwmXb1eKshkXffDioDNLF1voHDMynDQQOoo5362o
	 RVn7rgp/fb4UyvNvOdGECyZ666nLlW3INWQP7Ml8POjjP6I3Snlsb6msPK3yVyiJEDG2t
	 6jd7UhHFaYX+9XWAdUUMwfKS3EB3WIFdkfIgVeYx/uAfE2IYVV7PQ2SHBagKzJx91HPcT
	 KaOamk4IFTa3ftDluH9ooIsVn/13pA3USplymAFvp46apxkzIUm5Vo9S3OzH887EdRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=M+Df03Fx4+itYz4J38HagOcF0QG4sU4+kJ8QrdfzfKM=;
	b=kZ9b1oYgBk315tFbykdmDkDsBO+f/jEo53R/j+V2+Riunpregk5u79ZZZO4/5YFz2u+i
	 PB0+ONzhemeRa9qRUa4qBE2ULTCQBVK+42sfynu2z9kSnschR45fcMzjZnlM1sQTk3fPH
	 3/5S7ZR2LBVbr3sJdYeGWrbXT7RCkziwKLckGxOo9HKRdL9eK97dM4ugocd+BMTOBCHyG
	 sc6+T9gFjz9GpjBsqanrY6MsSUTv31t9a7rvN75ZLh7tSd203j/qJ32yxqGWBsnudhepB
	 +ljAJyVWi9AGHpFuMCGdwBxZ+6RHc57P42fkP8UtwGxsZ6igsrPzD3gYAmnrfvGnWhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QT73COJj;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4F0606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:40:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E4F0606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QT73COJj
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so36281655e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795527657; x=1796132457; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M+Df03Fx4+itYz4J38HagOcF0QG4sU4+kJ8QrdfzfKM=;
        b=QT73COJjUjEN0cDmUNtGuSh6DXbiOd+LIuDl2tdWJ4Xo+TvUwOV9Wccr49zcIh5Dzx
         glh2FnEXPoM1H0+kQC3+XnBG5m1BZTzSJw1tawEOCDWtwfA3/rl99DSbZO8P02eDe3ji
         PATSkvcN89p82fCbvuZChqe5UjnUFAL2LQ+Do6cz0fgMbq9juU3FfPiHTBoRSpY4pJIo
         DK5dQ+eXVpdkraAPG0OBMM/04rV+qccjDWygJMPazMi21SQldPv3K/6pxaLExByBqRrH
         WthVaY7Nxv1YFZWV3rdRpzUdQmepcSX/H8UgQ3V3shFKkPIWTB7oc0Q13u0FXu6X9x85
         v+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795527657; x=1796132457;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M+Df03Fx4+itYz4J38HagOcF0QG4sU4+kJ8QrdfzfKM=;
        b=DIm4iqVHpUWDP4U+y9klpD6O2kLCSRxS9BTykX/JFtZL5ororjRwNICoK6E0bzVm/R
         c9+VtDGBL+uxf8bJUT68L3M71AHmzvXKIdfdDAOFoH756l+/HIIRXcbaeuCRhvsfdDce
         NQM9Hicnc425BiDTCNfsD+wBEU6dnIFcafzOUuA2gfc6ciRnLkTKhptV0+odepHa9vuS
         epmOvb6L8+SwDg8wmT4pnzyxYp5iHFY2qrNnmfiBPu9rT1gkHtSo9gfFFRSSYHpISg52
         p2FJ7ktUnFeSQ892/8ciFd4Shix+iEpri+b3SWiAa78nxtoBx3B1oT1hNGd5/8dIHpvO
         JnBA==
X-Forwarded-Encrypted: i=1; AL+hErFRDuTtTWogVoj2MSZrOB9mCgP1XBGVSd4eOpaZpyXGgwU23jupmnpSQI7x5ygcJc/ibli4B9ICStA6eDU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/y/1oqbxD56Du6/txqkLkso9JZidnFfEmacJOOMvoAyy+z9n6d
	le8Ozctflq0CcxyeFiJnrRdmtQnpwkxjU9rQWld57qTZobiXFjydHImgXfwGtB+kWX0=
X-Gm-Gg: AZFdTZeBJ2CEc5zqfsqejI+cUTv45htQEpt+XjBaYUH+Vk2LK94TQ9YNHH6Izlh7WcX
	joIjjpzDUAeUZbEeoQSlshcQXG3U8xHs1w+icLPQygc1N1n4Hn5qt+INW+CvSA2qbdvqP87reL3
	kgOM4L5vD0Ihz9hDrCFZldDKdk3SAfTzRkLOkjcQQRGLYeqU/Lc23YlzfJcp5p5+sY6QbM7vWq9
	RnKtCWzjmc/Zh9fPfNOMAFUryHEQ1TiYxAe8c/fxd3AK4aPCErIC0U9u6p30H6E6QkwLnUCcSMy
	38pWRxpVMIMzg6FuSd3DDRppDvyjq39jEI2sKH7gTfm2lw0DdqsmjMjtA1SGwjhZm7ClgALePST
	cCmZXbiQ7LmHnXSlg3e9V8mf0VUzMvb71FVcmQ3bvHG9G+l3JyvO2IvUamDMit7Qyi2/d+fGHu3
	MGfce0O9vbYQHHDHl9FCyyfBUC9XPWSk/XBD75QU2QrO7hwi2BYekIkqw9eymG+pwu/HXbVvG7G
	/xGbE2la9UjKFGneZUysLcrQlIvY/VRm85TtYMVvcetYKbO9LMSsviyxUbxYeKIFFNKQ39HZ6VV
	uDZW/TuF6rPPhOH2WIOz7bm3SRVU8WobLll6HcHjCOMSFgJHKaU9p3Ih+0Ed4f1nKHyCeoQCiT0
	UG+E3HdGx
X-Received: by 2002:a05:600c:64c8:b0:4a0:1c0e:b057 with SMTP id 5b1f17b1804b1-4bb887e2380mr277520385e9.4.1795527656673;
        Tue, 24 Nov 2026 05:40:56 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:ac27:24a0:7b1a:dd94? ([2a01:e0a:106d:1080:ac27:24a0:7b1a:dd94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm229886835e9.2.2026.11.24.05.40.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 05:40:56 -0800 (PST)
Message-ID: <9bc15d77-2a56-4e64-8b73-163c44bcf5ea@linaro.org>
Date: Tue, 24 Nov 2026 14:40:55 +0100
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
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: amlogic: khadas-vim3: add SPI NOR flash
 overlay
To: Jose Nieto <jnieto.alaber@gmail.com>, Kevin Hilman
 <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261103164730.160593-1-jnieto.alaber@gmail.com>
 <20261124111333.33734-1-jnieto.alaber@gmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20261124111333.33734-1-jnieto.alaber@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/26 12:13, Jose Nieto wrote:
> The Khadas VIM3 has a 16 MiB SPI NOR flash (W25Q128) whose data lines are
> shared with the eMMC D4-D7 lines. Add an overlay that restricts the eMMC to
> 4-bit mode and enables the SPI NOR controller, exposing the flash as an MTD
> device.
> 
> The flash HOLD#/WP# lines are wired to the eMMC D3/D7 nets, so the
> nor_hold_wp_pins pinctrl group is intentionally not used.
> 
> Signed-off-by: Jose Nieto <jnieto.alaber@gmail.com>
> ---
> Changes in v2:
> - Keep the original BayLibre copyright and mention the U-Boot
>    meson-khadas-vim3-u-boot.dtsi origin (Neil Armstrong).
> 
>   arch/arm64/boot/dts/amlogic/Makefile          |  2 ++
>   .../dts/amlogic/meson-khadas-vim3-spifc.dtso  | 28 +++++++++++++++++++
>   2 files changed, 30 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso
> 
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index 57bc440fa55c..3714cbaaa03e 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -23,6 +23,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12a-u200.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12a-x96-max.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-bananapi-m2s.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3-spifc.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3-ts050.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-bananapi-cm4-cm4io.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-g12b-bananapi-cm4-mnt-reform2.dtb
> @@ -104,5 +105,6 @@ dtb-$(CONFIG_ARCH_MESON) += meson-sm1-x96-air.dtb
>   # Overlays
>   meson-g12a-fbx8am-brcm-dtbs	:= meson-g12a-fbx8am.dtb meson-g12a-fbx8am-brcm.dtbo
>   meson-g12a-fbx8am-realtek-dtbs	:= meson-g12a-fbx8am.dtb meson-g12a-fbx8am-realtek.dtbo
> +meson-g12b-a311d-khadas-vim3-spifc-dtbs := meson-g12b-a311d-khadas-vim3.dtb meson-khadas-vim3-spifc.dtbo
>   meson-g12b-a311d-khadas-vim3-ts050-dtbs := meson-g12b-a311d-khadas-vim3.dtb meson-khadas-vim3-ts050.dtbo
>   meson-sm1-khadas-vim3l-ts050-dtbs	:= meson-sm1-khadas-vim3l.dtb meson-khadas-vim3-ts050.dtbo
> diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso
> new file mode 100644
> index 000000000000..9f57d9433ee8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso
> @@ -0,0 +1,28 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2020 BayLibre, SAS
> + * Author: Neil Armstrong <narmstrong@baylibre.com>
> + * Copyright (c) 2026 Jose Nieto <jnieto.alaber@gmail.com>
> + *
> + * The Khadas VIM3 on-board SPI NOR flash shares its data lines with the
> + * eMMC data lines 4-7. Restrict the eMMC to 4-bit mode to free D4-D7 and
> + * enable the SPI NOR controller, exposing the flash as an MTD device.
> + *
> + * Derived from the U-Boot arch/arm/dts/meson-khadas-vim3-u-boot.dtsi file.
> + *
> + * The flash HOLD#/WP# lines are wired to the eMMC D3/D7 nets, so the
> + * nor_hold_wp_pins pinctrl group is intentionally not used.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&sd_emmc_c {
> +	pinctrl-0 = <&emmc_ctrl_pins>, <&emmc_data_4b_pins>, <&emmc_ds_pins>;
> +	bus-width = <4>;
> +};
> +
> +&spifc {
> +	status = "okay";
> +};
> +

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
