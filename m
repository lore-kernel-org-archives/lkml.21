Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795395467;
	b=n+fa14wEe4BxiQd0VZ1G8I/sct/GCGCTS6J0LMBirrY6TMVHqmJW+TO+gFsiaSWpZUy5
	 gGnjYjrkoXd9yvo3OOtgrvjCAbWgl3Yf9FsYpioGjEqIYv+ewmVsNNHbBPg3953k6H0y7
	 YTUC8lLCRfvm9tPsPH2xrQ0h4fgSvWuz/5jqMbzEOGfmQ4LG8tt2omPOt/pH4MGG5ujw3
	 sDQF1CP5Yl2m6MENDRBHBsBEemJceguRgYK0U4EeOYtX7WbA2BW5u8oUNkyMWw8ZENYno
	 mTQRsgiw1jjRDi+G2hmcZBAm1I8AqxNUD1WvjqPHAxyeuQMR7moZtRYwkNUHkrwH6fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795395467;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=fc8Ar5aH5Y5otKVLEatz4wwbIIdMLZtXZ0Vqbo5bjHo=;
	b=4GAfEXQ3Nh1huyxU4BBODz7qY+KJdP5pVTXYHLUPlb3rjtTYLEdulLcnixt11LoDKnrB
	 wCxSpXVjj1DPLe0FHMSMbirtsV4RNnzrblROGeQU75iTZd4Oxr/9UtwZlsB7+r8NXfP8p
	 QiAfWl4bkIxzARTf2GpyhXN1sUQJD67hMgB8QSn3mM0XFcPZ6GeLLhh/y6APlRGvGisNZ
	 AtckAn2ZHLfGHpK8J8Di/m8euMQYQJNG5yhJ50trKeMF3njx44VvFp7OcaEJK5hxwnV2v
	 INuKrbGaVvHin6IPD6zT62QGgx+74hFiqW1CuB4uDQEYvNV45p7LpTtM3wivSJQXfnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cgRXkngm;
	arc=none smtp.remote-ip=95.215.58.8
Received: from mta1.migadu.com (out-8.mta1.migadu.com [95.215.58.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32D2606A33D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 00:57:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D32D2606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=cgRXkngm
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=1Z+IV195TFBGbtanyq4aEdiPJ9El2Z9WkuHp4Wlnj24=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795395463; v=1; x=1796000263;
 b=cgRXkngmMNtAHuGqTXs8XGGOeo13Ta/LeISW26FYOi7oQg2o/FIQD+M5e2Iv2N9nxKZU/Gw9
 Tra2kEqSDA88+2cbvS7rvxxFriipPUP3dM4G6NWEM4MR6+TCKFZV+d5ks7t7mW17RbXy5QKFhrC
 y0kW4ehzeuiQPWRO17s7cBec=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6ddd898802172db6;
	Mon, 23 Nov 2026 00:57:43 +0000
X-Mizu-Trace-ID: 6ddd898802172db6
X-Migadu-Flow: FLOW_OUT
Message-ID: <f611948c-0462-45c3-ae69-2ae083231f2b@linux.dev>
Date: Mon, 23 Nov 2026 08:57:37 +0800
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
Subject: Re: [PATCH v2 2/2] riscv: dts: sophgo: add Milk-V Duo ethernet DTB
To: Hiago De Franco <hfranco@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Chen-Yu Yeh <chenyou910331@gmail.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261104-milkv-duo-eth-overlay-v2-0-e3d2d39cf229@baylibre.com>
 <20261104-milkv-duo-eth-overlay-v2-2-e3d2d39cf229@baylibre.com>
From: Chen Wang <chen.wang@linux.dev>
In-Reply-To: <20261104-milkv-duo-eth-overlay-v2-2-e3d2d39cf229@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/4/2026 10:52 PM, Hiago De Franco wrote:
> Add a DTB that applies the shared cv18xx-eth.dtbo overlay to the Milk-V
> Duo (CV1800B) base DTB. This enables gmac0 and the internal PHY MDIO mux
> on boards with the Ethernet IO board, matching the existing Milk-V Duo
> 256M DTB.
>
> Signed-off-by: Hiago De Franco <hfranco@baylibre.com>

Reviewed-by: Chen Wang <chen.wang@linux.dev>

Thanks.

> ---
>   arch/riscv/boot/dts/sophgo/Makefile | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
> index 440acd0aa55a..3c9f3530526e 100644
> --- a/arch/riscv/boot/dts/sophgo/Makefile
> +++ b/arch/riscv/boot/dts/sophgo/Makefile
> @@ -1,5 +1,7 @@
>   # SPDX-License-Identifier: GPL-2.0
>   dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
> +cv1800b-milkv-duo-eth-dtbs := cv1800b-milkv-duo.dtb cv18xx-eth.dtbo
> +dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo-eth.dtb
>   dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
>   dtb-$(CONFIG_ARCH_SOPHGO) += cv18xx-eth.dtbo
>   dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
>
