Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.253
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795395426;
	b=w9WxIBUAqAJlbQi3iexYDUXoZl23py8ta81TvJYnO3j/YuTjvzaRd0SZZf7AM14A184D
	 C+koxyFcfu/WyrNdtJqvz/j3yjBpT3MV/7pUAKmy8zXgA7d6XegKsyMAhoAGvjthlndol
	 CGFvMXj4abvEDxFQMqLlxa0BbYJPDIL1pJozZz+/4GTJH84CIE/TeLBRZ6jTiSUOaCnCt
	 9BjqtbPC4x8cOb3oE7T1H/IfuRNwOAR24CIUwp410R/w5cnIWFoGZkcFY+oiupkT0fNmM
	 nuLsysiiENx5cCmxOC2RXVDfkLxaKQ4N8eGjA1g3Dz/lsPgOG7sUy1oU0pECdPzLTBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795395426;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=gxvaU6l29IKFaRAkpXOj2cOR3APQrTCBsOxVrKA4i9M=;
	b=YRbQSSBaoPnD2FcX50UMT5XDjhNHL31uv6G71ujOMD5uB00jkTyaPD7eprsTktzl20ZQ
	 7P48/7tpUdMNatscZWwjCzSqVc56TuzTRmajzc/DT+Okpiqdjmos/CTB9xkmyl3o3oS9t
	 namsGcKL6CgsbsFU/5bkjsov3kHzXb3BhxN6XV4jOObrlm+82xMvgeyFLUefCENuYJcus
	 6JDumVaYz9slde7sNfDWTtRyiNJywlExVVJ+YvAxk0qua+d6rVtmXXfMDULHAz58m6yor
	 8BQxT2ehN0Ket54XpI3zZTbgXkQZs+kJc1LxsrijILEVCJU8TKELHHzFNMLaOQuD80w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=E9fJI3Ds;
	arc=none smtp.remote-ip=95.215.58.253
Received: from mta1.migadu.com (out-253.mta1.migadu.com [95.215.58.253])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E80606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 00:57:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4E80606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=E9fJI3Ds
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=eWEFZWHZfFCAhK2XmNa/wVqm+6q8zSGaxKeXW6zWVNY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795395423; v=1; x=1796000223;
 b=E9fJI3DsDB5cz5isO/HQiSAo1jOm3YV9R/iPtuUpw2slYkkPM0HkaIM4ab8iCv8piiKJAk3y
 ZOZQ+Dg1c6jNCTN2wjfaruu1fLN4F7b/FeoILjEt84Acn6qMWaHoER+ZmzJvVe63hnDg7KDAzHx
 vexa9QqkEWgeWIDb3m1lisUw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8e70aef377a98481;
	Mon, 23 Nov 2026 00:57:03 +0000
X-Mizu-Trace-ID: 8e70aef377a98481
X-Migadu-Flow: FLOW_OUT
Message-ID: <40455616-b1af-4801-865c-187bcb2e0c39@linux.dev>
Date: Mon, 23 Nov 2026 08:56:56 +0800
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
Subject: Re: [PATCH v2 1/2] riscv: dts: sophgo: make sg2002-milkv-duo256m-eth
 overlay generic
To: Hiago De Franco <hfranco@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Chen-Yu Yeh <chenyou910331@gmail.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261104-milkv-duo-eth-overlay-v2-0-e3d2d39cf229@baylibre.com>
 <20261104-milkv-duo-eth-overlay-v2-1-e3d2d39cf229@baylibre.com>
From: Chen Wang <chen.wang@linux.dev>
In-Reply-To: <20261104-milkv-duo-eth-overlay-v2-1-e3d2d39cf229@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/4/2026 10:52 PM, Hiago De Franco wrote:
> The overlay only enables gmac0 and the MDIO mux, which are common to the
> CV180x and SG200x SoCs, so it can be reused by other boards such as the
> Milk-V Duo (CV1800B).
>
> Rename it to cv18xx-eth.dtso.
>
> Signed-off-by: Hiago De Franco <hfranco@baylibre.com>

Reviewed-by: Chen Wang <chen.wang@linux.dev>

Thanks.

> ---
>   arch/riscv/boot/dts/sophgo/Makefile                                   | 4 ++--
>   .../dts/sophgo/{sg2002-milkv-duo256m-eth.dtso => cv18xx-eth.dtso}     | 3 ++-
>   2 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
> index 49639cb0888b..440acd0aa55a 100644
> --- a/arch/riscv/boot/dts/sophgo/Makefile
> +++ b/arch/riscv/boot/dts/sophgo/Makefile
> @@ -1,12 +1,12 @@
>   # SPDX-License-Identifier: GPL-2.0
>   dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
>   dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
> +dtb-$(CONFIG_ARCH_SOPHGO) += cv18xx-eth.dtbo
>   dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
>   dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
>   dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-milkv-duo256m.dtb
> -sg2002-milkv-duo256m-eth-dtbs := sg2002-milkv-duo256m.dtb sg2002-milkv-duo256m-eth.dtbo
> +sg2002-milkv-duo256m-eth-dtbs := sg2002-milkv-duo256m.dtb cv18xx-eth.dtbo
>   dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-milkv-duo256m-eth.dtb
> -dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-milkv-duo256m-eth.dtbo
>   dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
>   dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
>   dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v2.dtb
> diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m-eth.dtso b/arch/riscv/boot/dts/sophgo/cv18xx-eth.dtso
> similarity index 66%
> rename from arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m-eth.dtso
> rename to arch/riscv/boot/dts/sophgo/cv18xx-eth.dtso
> index cc93746d932c..cdb8db063977 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m-eth.dtso
> +++ b/arch/riscv/boot/dts/sophgo/cv18xx-eth.dtso
> @@ -1,6 +1,7 @@
>   // SPDX-License-Identifier: (GPL-2.0 OR MIT)
>   /*
> - * Enable ethernet on Milk-V Duo 256M with the USB & Ethernet IO board.
> + * Enable ethernet on boards that use the internal ethernet PHY of the
> + * CV180x and SG200x SoCs.
>    *
>    * Copyright (c) 2026, Chen-Yu Yeh <chenyou910331@gmail.com>
>    */
>
