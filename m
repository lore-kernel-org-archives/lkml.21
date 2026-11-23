Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795423269;
	b=zd+abexI9TYor5JqiSQvFkW4X06s74Ykvac1dkPlxwRAPsTzVcx4eekrrR671RdbaRb8
	 9CECO23IRAC48wiHZyt2RW1XYuQ34ObwnNA0qVVqLdpN90dSQsvz9Nm2jMKfcxs/EXAZc
	 ZCOaiRclP5DgWlik6xdWXI1Uy32X/3n9z4fr7w1cBCQ8zyOWLCJtaKHTKNWszOLnVGiSi
	 W6Lw2hnE8I9AVRmUqbgpB6iPVWmXR/Zk1X3sMA5IJ4wUHFqvfJtk0LeAe1gya06HIIeX0
	 g4SKA84/T2F2IWtMELI5gc56C6EVmW0QBymfvs1KdUlDffRnMuC8qQpMkBoKDbEfUng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795423269;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=weS4nh8yzJ9DgJBIRpH2X6+13bRBxiBauBejFD0MyZ0=;
	b=SuUJOoSA/7HkVQlKFhq97AD89y4IMYdy5aIvSyjBm0thJhXsUBuve5N+YJVYPv3Y9uBV
	 TLvKj0a6x+8Wegxmli4sTxb/+DpgNhvjBAjWAr0/P8w9F64JACL58z2QpetRq3jt/pzsI
	 A/2/ymalwz83dmdsyEG0l+vBjeMjcYEIx4z7gT0mKz0LQVKkm6foYKDNNtTRyD2qrMDBm
	 D262Qd1P58LV3+Y82LxqdCP53wU/RtlUMXX9mYq2TFhkv6FbkpkhfIPSj4d/LZB34c86a
	 4j/y/VDpMpObQZgMfGDsk3yVLb/+oNllkVur7qwmUcOIUjfuoaD9gEl7BEm5dSv6XcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bk0ytuA5;
	arc=none smtp.remote-ip=91.218.175.64
Received: from mta0.migadu.com (out-64.mta0.migadu.com [91.218.175.64])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACA1606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ACA1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bk0ytuA5
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=l2DP2WRCJyIifr/DPGizDAIwXyQaHH94kdBlyIJQkXM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795423265; v=1; x=1796028065;
 b=bk0ytuA5taDoTGgVafhhlm+v9MxLzRYr/Bloib4ufR6eML6dAvXr63wvEXk/tuf2ctjwJPuy
 HX2P6VLK2TeDCq8Rq6h2ECB6MQNrcsOBxT5RKiFmCoEM1KYRcS1Y6Ne/a323HlfDaCmDO2wFhAm
 8pWhr2atTDrYTbBvfDkZrVSc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 49510743510806cb;
	Mon, 23 Nov 2026 08:41:05 +0000
X-Mizu-Trace-ID: 49510743510806cb
X-Migadu-Flow: FLOW_OUT
Message-ID: <ec584c15-c49a-499d-bd79-a9f48f54dad5@linux.dev>
Date: Mon, 23 Nov 2026 16:40:56 +0800
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
Subject: Re: [PATCH 1/2] riscv: dts: sophgo: Enable the RTC on SG2042 EVB v1
To: gaohan@iscas.ac.cn, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Inochi Amaoto <inochiama@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org,
 sophgo@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261122-sg2042-evb-rtc-v1-0-f222c64cc7b9@iscas.ac.cn>
 <20261122-sg2042-evb-rtc-v1-1-f222c64cc7b9@iscas.ac.cn>
From: Chen Wang <chen.wang@linux.dev>
In-Reply-To: <20261122-sg2042-evb-rtc-v1-1-f222c64cc7b9@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/22/2026 9:33 PM, Han Gao via B4 Relay wrote:
> From: Han Gao <gaohan@iscas.ac.cn>
>
> The SG2042 EVB v1 has a PT7C4307 RTC at 0x68 on I2C0. Enable I2C0
> and add the RTC node.
>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>

Reviewed-by: Chen Wang <chen.wang@linux.dev>

Thanks.

> ---
>   arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts b/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
> index 9f403e564694eae14913f6ab23080a6333df15ae..6ddb16eabc48a51f457449d245d63a3840b2fdef 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
> +++ b/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
> @@ -136,6 +136,17 @@ &emmc {
>   	status = "okay";
>   };
>   
> +&i2c0 {
> +	pinctrl-0 = <&i2c0_cfg>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	rtc@68 {
> +		compatible = "dallas,ds1307";
> +		reg = <0x68>;
> +	};
> +};
> +
>   &i2c1 {
>   	pinctrl-0 = <&i2c1_cfg>;
>   	pinctrl-names = "default";
> @@ -201,6 +212,16 @@ sdhci-emmc-rst-pwr-pins {
>   		};
>   	};
>   
> +	i2c0_cfg: i2c0-cfg {
> +		i2c0-pins {
> +			pinmux = <PINMUX(PIN_IIC0_SDA, 0)>,
> +				 <PINMUX(PIN_IIC0_SCL, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <26800>;
> +			input-schmitt-enable;
> +		};
> +	};
> +
>   	i2c1_cfg: i2c1-cfg {
>   		i2c1-pins {
>   			pinmux = <PINMUX(PIN_IIC1_SDA, 0)>,
>
