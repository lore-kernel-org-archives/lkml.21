Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795613118;
	b=34RzCkPBokYMxD7J/Fb+rTBhQ7npFDdX3dVahh5HguIh0CkmmC92Pwny9Xs1sqV0zAbf
	 O/gwhmk1HLEZhf4x2FsKsi5Yvt8yO5aMhySgWId/9rGvA14NACtKKYthWvQ9K+oG9kFBG
	 f3xa+O7UDu8XBvSNIPKTQ6cz54ElRMmBHEwtZ77Hr0Bg9Xok4xEfmSM7BSEEAI6qbrrzF
	 5UQtV7wFKAnCmAWNUK9uN4jyJV6xzKomT3VzgF2El2913drQY8Gog07W0l3zS8f1NYAkE
	 IYAv3AHJ2kmMne5jO5IhdsC3T19L2mxrlGDCsB1HOSZgw70bcIf+W7kxkawsPVv7qfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795613118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=NQLOwLKmQWGXVjYzEC+v5DF5B/Ubjo80CMy8M7QDT2k=;
	b=bi7TJqsI5j3RHQu1sx8I93eRj9uoKegqd+OIPDfipE1KFuq2ugy+7BufRdBwYdGBzFud
	 ySuTdhCsHoxOxtiXJ/j2cKKUYabLnCAWac/5y4CaCpAaDMKX9HBxYBaXV9mchz+i2d+Zu
	 g61ubwnx3nzN42Qyd9blWDh6q3uM3LLXt6Hi5RXEmWmZbesDC83Uud47HYLqYqIQ4uCXw
	 5k1RQqyfJU1yxI4zR1PVfpu2860CDYFuu+IaiJvXlE2bro/5TaE/Zz6RQx1OIshQAB8HA
	 Qq85a2xhxO0B+uVhIdcRV/vglLIRJvSg6O2GP8q3Xnab/pV1gRhv86RMBMPE06a77uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=n8vilfMw;
	arc=none smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BED5606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:25:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BED5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=n8vilfMw
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3adef2bf7acso4742691fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795613116; x=1796217916; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NQLOwLKmQWGXVjYzEC+v5DF5B/Ubjo80CMy8M7QDT2k=;
        b=n8vilfMw95U7RGGQTrQ18OiIGt4lPTBlaA0eJ+bgBAaZd3duyIsAIQt3bBnTX2AY9h
         x0BN648T4J359K6PAuYa3+NgtWG9EHGCut3jPu373XwMaFpFYdPV2sNsAwsnKCjAwnMC
         fZLZsQmHOeVePSzrfQ4Az99IGPip7gEseXI+oExdXmqSsFXjoVOCMUVu3zN+EUiJ3k7t
         0Ly4a70yYEiU0TPD31hTC0MbXvg0yZmGbLU4enOfgaO+c0wpQSz+33nibOR2MgehRzh9
         odoMW8R2Sry5YZZzbfoUlv/anMH74EVSx252be9Len7WudNnOjJq+wCLSOOoWYf3ZTIa
         Jsgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795613116; x=1796217916;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NQLOwLKmQWGXVjYzEC+v5DF5B/Ubjo80CMy8M7QDT2k=;
        b=j5pJIKVUwcivBTNgR/wRac6e3vHrrOcRFQ9DJxhHnnfLq4Sloy4HEcpbX0Jn3eejib
         6pVpFkKwPE8MABGtrwYQ7yQHvawyWdxIUXG7DfesalUU7JktkZMlrLyKrzzkVqWUpTIN
         vrRlKdTQRPhhlyNvN7uECpb5VolBwY6bKSMDQYQnaTKUqNcsGrB4GYqHEdI9i/QWWWsU
         53g+eTdGP/1sRqFw+ws9uOrHIcxFO1A0fJzvKREHVADEWgdg5B8m0xb5p64WDmkX3GZb
         xQL236oBTTLNVuEoUOlw94QxUy80ZlycBgj7llqT5rNqThULqFB6jDjICQRLons+Ex6Y
         6D5g==
X-Forwarded-Encrypted: i=1; AL+hErHUD+pIc7RxPtNP8d0qTmPQultj/V3DOSoo/XTFxUQm8GE8r86FsNoUIZIzenpEFist4gcfkOYrC78Rvz8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dEyQBpREWdb3T1srkjhIBd5dJxHFf8l1zczT87+bNqz8P3x+p
	EiDn3BtF9rfHlPWis33gJp1pc7w6S6B+qDb1hxWdu66ney3+Q9wmMwSRyExm/ia4UuI=
X-Gm-Gg: AZFdTZfgCXlNaJEcFSCOHMk8V5JkNEeLIl9sgaIxZ4UeAoLDCUhCzXEek0K64CcLuay
	Rw+vw3ExLJJZAxrXhpS0uCOzFXGcAd+oxTp3yj8NdLILgqkj+n7fz7x/xemMfrhwbp0g1UDGylw
	fMELav/2u4HBgf/qj+aweOiWzXFKXxtd4fRK3M3qA5llFxkxZMXg++iXBlASwGKzfKLIA3Oh7eX
	Q+R2pMumMFdNDdh9/RbDpGixJB8evz88/JAU5aE1uAkXYjUiB/gy/ZhfE7oInmwAfGwasbhQk+E
	nN0gHufqPlgeSxoqTYoDQ6bx7I8I1Ot63BCsIIatjgY65+lsAsu8O2NQvhW0YD9jHOyleMX5ei7
	av+WgPA5+heCGquZ3WqnDeamqigQr7UQOf/odiAxKaxsRSXOgMpNjhQfYcn3HO2w836RpvvBHw6
	zv19Q1eZb+emqz5Yhugv3O4zskdLjmF4auU1DRzzCEFvsYxG9/8XNzeZztsGFSsdvUbtCr1uTN2
	BzVm4u7l+XatOyyvQQGfS5P64I135Qrh1ifj93AcfXVvjgKA3rAVFLNws8D649mQqDqIn1fRziM
	ogiY30cX4n42cZG1+IxgPukzJOaWD/ISPYQsmxQkE1KBneFudLtgryxQjgH6a9/MIlanBWKzEjd
	mAOK83GY=
X-Received: by 2002:a05:651c:a110:20b0:3ac:e540:987a with SMTP id 38308e7fff4ca-3ae7f7ccbccmr42034731fa.0.1795613116510;
        Wed, 25 Nov 2026 05:25:16 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8044e3c4sm47116791fa.4.2026.11.25.05.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 05:25:16 -0800 (PST)
Message-ID: <38bdcad3-2c2f-4e55-9a3e-17047b9f486f@linaro.org>
Date: Wed, 25 Nov 2026 15:25:15 +0200
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
Subject: Re: [PATCH v7 23/23] arm64: dts: qcom: eliza-evk-imx577-camera: Add
 DT overlay
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
 <20261114-add-support-for-camss-on-sm8750-v7-23-8ff2a11835f6@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-23-8ff2a11835f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/14/26 13:29, Wenmeng Liu wrote:
> Add an overlay for optional IMX577 integration on the Eliza CQS EVK,
> shared by the eMMC and UFS variants. The sensor is on CCI0 I2C bus 0,
> uses MCLK0 with its reset on GPIO8 and connects to CSIPHY0 over CSI-2.
> The overlay enables CAMSS, CSIPHY0 and CCI0.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/Makefile                  |  4 +
>   .../boot/dts/qcom/eliza-evk-imx577-camera.dtso     | 85 ++++++++++++++++++++++
>   2 files changed, 89 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 64d2cfdb89c89f1c6eb0085e2bf5877ff980dbc4..a9374c54dd514f53b7aa97f5581c99cb6e75697d 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -16,6 +16,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-ufs.dtb
> +eliza-cqs-evk-emmc-imx577-camera-dtbs := eliza-cqs-evk-emmc.dtb eliza-evk-imx577-camera.dtbo
> +eliza-cqs-evk-ufs-imx577-camera-dtbs := eliza-cqs-evk-ufs.dtb eliza-evk-imx577-camera.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc-imx577-camera.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-ufs-imx577-camera.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a14-ux3407na.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a16-ux3607oa.dtb
> diff --git a/arch/arm64/boot/dts/qcom/eliza-evk-imx577-camera.dtso b/arch/arm64/boot/dts/qcom/eliza-evk-imx577-camera.dtso
> new file mode 100644
> index 0000000000000000000000000000000000000000..08f2e3c62dbdaf23a2f6ca69a5c392054cb1c225
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/eliza-evk-imx577-camera.dtso
> @@ -0,0 +1,85 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/clock/qcom,eliza-cambistmclkcc.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/media/video-interfaces.h>
> +
> +&camss {
> +	status = "okay";
> +};
> +
> +&camss_csiphy0_in_port {
> +	camss_csiphy0_inep: endpoint {
> +		data-lanes = <1 2 3 4>;
> +		remote-endpoint = <&csiphy0_out_ep>;
> +	};
> +};
> +
> +&cci0 {
> +	status = "okay";
> +};
> +
> +&cci0_i2c0 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	camera@1a {
> +		compatible = "sony,imx577";
> +		reg = <0x1a>;
> +
> +		reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&cam_mclk0_default &cam0_reset_default>;
> +		pinctrl-names = "default";
> +
> +		clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK0_CLK>;
> +		assigned-clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK0_CLK>;
> +		assigned-clock-rates = <24000000>;
> +
> +		dovdd-supply = <&vreg_l7b>;
> +
> +		port {
> +			imx577_out_ep: endpoint {
> +				data-lanes = <1 2 3 4>;
> +				link-frequencies = /bits/ 64 <600000000>;
> +				remote-endpoint = <&csiphy0_in_ep>;
> +			};
> +		};
> +	};
> +};
> +
> +&csiphy0 {
> +	vdda-0p9-supply = <&vreg_l2b>;
> +	vdda-1p2-supply = <&vreg_l4b>;
> +
> +	status = "okay";
> +};
> +
> +&csiphy0_in_port {
> +	csiphy0_in_ep: endpoint {
> +		bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +		clock-lanes = <0>;

Here 'clock-lanes' should be dropped, it shall be implied, and I belive
it is.

> +		data-lanes = <1 2 3 4>;
> +		remote-endpoint = <&imx577_out_ep>;
> +	};
> +};
> +
> +&csiphy0_out_port {
> +	csiphy0_out_ep: endpoint {
> +		remote-endpoint = <&camss_csiphy0_inep>;
> +	};
> +};
> +
> +&tlmm {
> +	cam0_reset_default: cam0-reset-default-state {
> +		pins = "gpio8";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +};
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
