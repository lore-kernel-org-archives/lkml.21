Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795217603;
	b=RG2GVh7TABmuZuc2MP4lCy46iAskcREWbK0lylKzXH4vr5mmh73G+orOqHBV7FcKDcig
	 4LTiqIOFswhb36UQC4pYDqAA0hwyHoq7uZnzwq0Kbii8wnYNpaPPkUdihyIuG4cU0weat
	 7iHUS+upsZP06r31GGh0sl1kgIFfZVpQgV/Xvtbo5khKhbmxUX2qHqoXdjNhTUp1xgHun
	 1hHxrUIxDRBAjXwJak+rbbcewD7/RlPnq4VjirNX51U6zfzoMnbUTzBpYIiOEgT1JRSbY
	 jVw4+kpL8CAd8CvgPi2Aj7GWc2Qn9iDfnVWC6SmnfSV9mBm/TuwNjjxs8aTa4mVzIFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795217603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:X-Google-Original-Message-ID:Date:From:To:Cc:Subject:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=5ue1b2+ZjqmKkDCu3UdAaIQP1rc8l0RRlBnT4tbuOuI=;
	b=RKcysg+bfQyk60CfGZiQshnbsSgYIKVCahwDw+ZBZp3YuD94Or1Hz1fgWW7uFX6mkant
	 URDKQAxM+QwMbArl13VqXy140es6zEVoRbgyi/CZhzfZcfODQ+Yyfo5NzJG/luF0GLLBj
	 NF1CGWkbVmd/9JgbwwvH468einZaqoCV6cuB/u1mnW3Gd6Uduz3qVbpMehOBsbu/Esk+z
	 ZZ/wS4SCJcQblQWIajDWt7Fb+A8f3gpz4DkJSp9nLd7jnPH5WgBw7hFwyYKpy3oSqLjip
	 ph6ozNmYTky3s91vYXmCvMIpElgw9RTq1AHEoJiP6IfLyuJyNX3ofhrOg9n/Q1FSZMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HgRlFfFr;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C364606A6A9
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:33:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C364606A6A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HgRlFfFr
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so11530245e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795217596; x=1795822396; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5ue1b2+ZjqmKkDCu3UdAaIQP1rc8l0RRlBnT4tbuOuI=;
        b=HgRlFfFrpkUyzgd7JVa/GkPe4W9b8tnBpYjT4sMf2y2pRWcop83zlfpr70NbTyQ6O3
         Uk5W01XIz0ampvOmG/rOavp6u+3KylxHqaPY8mt+i2qhCDqmqIJZ8lC8gSZVgYfPz2bV
         04Blp9Kc0vF6lcEtiIEnuBSgjdIKvG0LWLD8HFUTjEYKn/A5e3csMo17S/GNHPtN4kpX
         y3INPSP8AkETKYAk8RkIZb5CX3TCUwWfm6pEagH9Xpqv6fhtIXBfb2x1reM0sDqk+Jy4
         cLn4odlsQY5t/1IcmcPt66TJjsQxP1oB2rdmE+Nv389o00vjuOEU0IqMqJemLpaCWyP5
         2wNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795217596; x=1795822396;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ue1b2+ZjqmKkDCu3UdAaIQP1rc8l0RRlBnT4tbuOuI=;
        b=eQoCYkgzjDXRsomkfvcPr9RL2kKFGfFFCBvKa4+yx+SMYE/JDzSfeSc/5Ez+iZCSnV
         vyg7YFiTzSG3XeTOrU0AT0rY77WBjYli/ApBw9Y42puTReD+PnTiv6J0rruu6gFo5NaP
         yEVqdZspfBfFiKV/NRH0iy3efT4yly2rchKZ8AH9fiY9aNyXNWC5QsuFyCAfNx31UxiG
         WCyi/dUKiC9iynpRG9bYEX4Rbcj4AbxWI2YUeDGoqj+2fXaZUALRSCuxVifvCIyzjKwa
         wPuu6idNZ2dl+0lWrXEi8qnayLhdshbt0zjmOuRPuI7+Tin3tDDcSUUjWu0hA+NB8F39
         0XOw==
X-Forwarded-Encrypted: i=1; AL+hErHTF09mJa8GQutHRqB6wcINFNigmMA9va3k+X3duVRKUzjVoFZ3W84bO+XCg8EKUP41bjmiK4/liSjP4IU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xVtYiD3/d1MFpngvN6qoMwKkCuEBPHHO63duYVr0SC1s46lBt
	zhUtshEaPI3K/paMPQj6SZhThjn1xAwK8lCPZZ5SwOZ2nW2QeShSDUqh
X-Gm-Gg: AYBFou2oi9t6f4i+BfuFlE9qTXZXGImnf2vQOz/ZkXd+QTbl5b1UpPjFhgns80c2TGO
	BPXu6NR7ZyskOZXaSLpq70N4iOT75C+ViTjVxHkzq0iW82zIb2jyYSrWE3kFsSyOYvDiPJul3N6
	oeN2bmryAGvEiexMzgAQPJVZiSKK7tyHajPVDTeQpT3jf6j1V2lKEjFWRJbwyxHtrt3+J8l9y5U
	k5IMz/6QNm04O4kO717cR7PAO9TALPRKPi6eE5D74/NA/jRE+NSmHHvSTca9cRLkrqwdVhaoepC
	F68LHtReQpJJTuhgiuX853bYusUb9y4r1wAHc5Y300Qi5GwvGAEpmWfVUugjBQbBWpIh6QfTWEg
	94jcP7BYFoLGpPlDkL/h++iPA1FgoINtwf4qjDPMKaLL8y0XqqsYzXDiy2pHFKuMHd4YgBWgMsl
	E7QhbWUKjJ3UBamFojE0VLFMqBK2eIm1J77D5x10VJJuVpXCIuiZrfu0uEviddkX0ChX0BJvWE6
	dGgP5rayyuq063nJRkLSmddk94x6JIq/eJ6UbveO8cUsUgS//lcWnBEN4ctXXmpQ0uAmPQdpMAr
	dLWMo9DG2vGEltdG0Gl3nvFvJgq7MK/e198M+RqgFWLf37rzSPSvHPMmzWmPBBG4aUmNRXZmQX8
	UVmvQYRR2u8R1Lq9mXhOn+gA3CkWQg0wvefnPUffBKY3Rh2e9cF/W5FkZ5g==
X-Received: by 2002:a05:600c:828e:b0:4a1:e6a9:4086 with SMTP id 5b1f17b1804b1-4bb88785a99mr102949125e9.0.1795217595621;
        Fri, 20 Nov 2026 15:33:15 -0800 (PST)
Received: from Ansuel-XPS. (host-95-234-253-103.retail.telecomitalia.it. [95.234.253.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884911e3sm144076735e9.6.2026.11.20.15.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:33:15 -0800 (PST)
Message-ID: <6b00d8bb.5576de51.27441d.756e@mx.google.com>
X-Google-Original-Message-ID: <awDYuZ9RgrHjrcWS@Ansuel-XPS.>
Date: Sat, 21 Nov 2026 00:33:13 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Brian Masney <masneyb@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 5/5] clk: en7523: add support for Airoha AN7583 clock
References: <20261117182444.103123-1-ansuelsmth@gmail.com>
 <20261117182444.103123-6-ansuelsmth@gmail.com>
 <179513295004.301584.12820965897975670200.b4-review@b4>
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
In-Reply-To: <179513295004.301584.12820965897975670200.b4-review@b4>

On Thu, Nov 19, 2026 at 07:02:30PM -0500, Brian Masney wrote:
> > Add support for Airoha AN7583 clock and reset.
> > 
> > Airoha AN7583 SoC have the same register address of EN7581 but implement
> > different bits and additional base clocks. Also reset are different with
> > the introduction of 2 dedicated MDIO line and drop of some reset lines.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  drivers/clk/clk-en7523.c | 249 +++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 249 insertions(+)
> >
> > diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> > index 90bb86427c29..a7cb8dbcb048 100644
> > --- a/drivers/clk/clk-en7523.c
> > +++ b/drivers/clk/clk-en7523.c
> > @@ -13,6 +13,7 @@
> >  #include <linux/reset-controller.h>
> >  #include <linux/spinlock.h>
> >  #include <dt-bindings/clock/en7523-clk.h>
> > +#include <dt-bindings/reset/airoha,an7583-reset.h>
> >  #include <dt-bindings/reset/airoha,en7523-reset.h>
> >  #include <dt-bindings/reset/airoha,en7581-reset.h>
> >  #include <dt-bindings/clock/econet,en751221-scu.h>
> > @@ -167,6 +168,14 @@ static const u32 crypto_base[] = { 540000000, 480000000 };
> >  static const u32 emmc7581_base[] = { 200000000, 150000000 };
> >  /* EN751221 */
> >  static const u32 gsw751221_base[] = { 500000000, 250000000, 400000000, 200000000 };
> > +/* AN7583 */
> > +static const u32 gsw7583_base[] = { 540672000, 270336000, 400000000, 200000000 };
> > +static const u32 emi7583_base[] = { 540672000, 480000000, 400000000, 300000000 };
> > +static const u32 bus7583_base[] = { 600000000, 540672000, 480000000, 400000000 };
> > +static const u32 spi7583_base[] = { 400000000, 12500000 };
> > +static const u32 npu7583_base[] = { 666000000, 800000000, 720000000, 600000000 };
> > +static const u32 crypto7583_base[] = { 540672000, 400000000 };
> > +static const u32 emmc7583_base[] = { 150000000, 200000000 };
> >  
> >  static const struct en_clk_desc en7523_base_clks[] = {
> >  	{
> > @@ -369,6 +378,138 @@ static const struct en_clk_desc en7581_base_clks[] = {
> >  	}
> >  };
> >  
> > +static const struct en_clk_desc an7583_base_clks[] = {
> > +	{
> > +		.id = EN7523_CLK_GSW,
> > +		.name = "gsw",
> > +
> > +		.base_reg = REG_GSW_CLK_DIV_SEL,
> > +		.base_bits = 2,
> > +		.base_shift = 8,
> > +		.base_values = gsw7583_base,
> > +		.n_base_values = ARRAY_SIZE(gsw7583_base),
> > +
> > +		.div_bits = 3,
> > +		.div_shift = 0,
> > +		.div_step = 1,
> > +		.div_offset = 1,
> > +	}, {
> > +		.id = EN7523_CLK_EMI,
> > +		.name = "emi",
> > +
> > +		.base_reg = REG_EMI_CLK_DIV_SEL,
> > +		.base_bits = 2,
> > +		.base_shift = 8,
> > +		.base_values = emi7583_base,
> > +		.n_base_values = ARRAY_SIZE(emi7583_base),
> > +
> > +		.div_bits = 3,
> > +		.div_shift = 0,
> > +		.div_step = 1,
> > +		.div_offset = 1,
> > +	}, {
> > +		.id = EN7523_CLK_BUS,
> > +		.name = "bus",
> > +
> > +		.base_reg = REG_BUS_CLK_DIV_SEL,
> > +		.base_bits = 2,
> > +		.base_shift = 8,
> > +		.base_values = bus7583_base,
> > +		.n_base_values = ARRAY_SIZE(bus7583_base),
> > +
> > +		.div_bits = 3,
> > +		.div_shift = 0,
> > +		.div_step = 1,
> > +		.div_offset = 1,
> > +	}, {
> > +		.id = EN7523_CLK_SLIC,
> > +		.name = "slic",
> > +
> > +		.base_reg = REG_SPI_CLK_FREQ_SEL,
> > +		.base_bits = 1,
> > +		.base_shift = 1,
> > +		.base_values = slic_base,
> > +		.n_base_values = ARRAY_SIZE(slic_base),
> > +
> > +		.div_reg = REG_SPI_CLK_DIV_SEL,
> > +		.div_bits = 5,
> > +		.div_shift = 24,
> > +		.div_val0 = 20,
> > +		.div_step = 2,
> > +	}, {
> > +		.id = EN7523_CLK_SPI,
> > +		.name = "spi",
> > +
> > +		.base_reg = REG_SPI_CLK_FREQ_SEL,
> > +		.base_bits = 1,
> > +		.base_shift = 0,
> > +		.base_values = spi7583_base,
> > +		.n_base_values = ARRAY_SIZE(spi7583_base),
> > +
> > +		.div_reg = REG_SPI_CLK_DIV_SEL,
> > +		.div_bits = 5,
> > +		.div_shift = 8,
> > +		.div_val0 = 40,
> > +		.div_step = 2,
> > +	}, {
> > +		.id = EN7523_CLK_NPU,
> > +		.name = "npu",
> > +
> > +		.base_reg = REG_NPU_CLK_DIV_SEL,
> > +		.base_bits = 2,
> > +		.base_shift = 9,
> > +		.base_values = npu7583_base,
> > +		.n_base_values = ARRAY_SIZE(npu7583_base),
> > +
> > +		.div_bits = 3,
> > +		.div_shift = 0,
> > +		.div_step = 1,
> > +		.div_offset = 1,
> > +	}, {
> > +		.id = EN7523_CLK_CRYPTO,
> > +		.name = "crypto",
> > +
> > +		.base_reg = REG_CRYPTO_CLKSRC2,
> > +		.base_bits = 1,
> > +		.base_shift = 0,
> > +		.base_values = crypto7583_base,
> > +		.n_base_values = ARRAY_SIZE(crypto7583_base),
> > +	}, {
> > +		.id = EN7581_CLK_EMMC,
> > +		.name = "emmc",
> > +
> > +		.base_reg = REG_CRYPTO_CLKSRC2,
> > +		.base_bits = 1,
> > +		.base_shift = 13,
> > +		.base_values = emmc7583_base,
> > +		.n_base_values = ARRAY_SIZE(emmc7583_base),
> > +	}, {
> > +		.id = AN7583_CLK_MDIO0,
> > +		.name = "mdio0",
> > +
> > +		.base_reg = REG_CRYPTO_CLKSRC2,
> > +
> > +		.base_value = 25000000,
> > +
> > +		.div_bits = 4,
> > +		.div_shift = 15,
> > +		.div_step = 1,
> > +		.div_offset = 1,
> > +	}, {
> > +		.id = AN7583_CLK_MDIO1,
> > +		.name = "mdio1",
> > +
> > +		.base_reg = REG_CRYPTO_CLKSRC2,
> > +
> > +		.base_value = 25000000,
> > +
> > +		.div_bits = 4,
> > +		.div_shift = 19,
> > +		.div_step = 1,
> > +		.div_offset = 1,
> > +	}
> > +};
> > +
> >  static const u16 en7581_rst_ofs[] = {
> >  	REG_RST_CTRL2,
> >  	REG_RST_CTRL1,
> > @@ -544,6 +685,64 @@ static const u16 en751221_rst_map[] = {
> >  	[EN751221_USB_PHY_P1_RST]	= 3 * RST_NR_PER_BANK + 7,
> >  };
> >  
> > +static const u16 an7583_rst_map[] = {
> > +	/* RST_CTRL2 */
> > +	[AN7583_XPON_PHY_RST]		= 0,
> > +	[AN7583_GPON_OLT_RST]		= 1,
> > +	[AN7583_CPU_TIMER2_RST]		= 2,
> > +	[AN7583_HSUART_RST]		= 3,
> > +	[AN7583_UART4_RST]		= 4,
> > +	[AN7583_UART5_RST]		= 5,
> > +	[AN7583_I2C2_RST]		= 6,
> > +	[AN7583_XSI_MAC_RST]		= 7,
> > +	[AN7583_XSI_PHY_RST]		= 8,
> > +	[AN7583_NPU_RST]		= 9,
> > +	[AN7583_TRNG_MSTART_RST]	= 12,
> > +	[AN7583_DUAL_HSI0_RST]		= 13,
> > +	[AN7583_DUAL_HSI1_RST]		= 14,
> > +	[AN7583_DUAL_HSI0_MAC_RST]	= 16,
> > +	[AN7583_DUAL_HSI1_MAC_RST]	= 17,
> > +	[AN7583_XPON_XFI_RST]		= 18,
> > +	[AN7583_WDMA_RST]		= 19,
> > +	[AN7583_WOE0_RST]		= 20,
> > +	[AN7583_HSDMA_RST]		= 22,
> > +	[AN7583_TDMA_RST]		= 24,
> > +	[AN7583_EMMC_RST]		= 25,
> > +	[AN7583_SOE_RST]		= 26,
> > +	[AN7583_XFP_MAC_RST]		= 28,
> > +	[AN7583_MDIO0_RST]		= 30,
> > +	[AN7583_MDIO1_RST]		= 31,
> > +	/* RST_CTRL1 */
> > +	[AN7583_PCM1_ZSI_ISI_RST]	= RST_NR_PER_BANK + 0,
> > +	[AN7583_FE_PDMA_RST]		= RST_NR_PER_BANK + 1,
> > +	[AN7583_FE_QDMA_RST]		= RST_NR_PER_BANK + 2,
> > +	[AN7583_PCM_SPIWP_RST]		= RST_NR_PER_BANK + 4,
> > +	[AN7583_CRYPTO_RST]		= RST_NR_PER_BANK + 6,
> > +	[AN7583_TIMER_RST]		= RST_NR_PER_BANK + 8,
> > +	[AN7583_PCM1_RST]		= RST_NR_PER_BANK + 11,
> > +	[AN7583_UART_RST]		= RST_NR_PER_BANK + 12,
> > +	[AN7583_GPIO_RST]		= RST_NR_PER_BANK + 13,
> > +	[AN7583_GDMA_RST]		= RST_NR_PER_BANK + 14,
> > +	[AN7583_I2C_MASTER_RST]		= RST_NR_PER_BANK + 16,
> > +	[AN7583_PCM2_ZSI_ISI_RST]	= RST_NR_PER_BANK + 17,
> > +	[AN7583_SFC_RST]		= RST_NR_PER_BANK + 18,
> > +	[AN7583_UART2_RST]		= RST_NR_PER_BANK + 19,
> > +	[AN7583_GDMP_RST]		= RST_NR_PER_BANK + 20,
> > +	[AN7583_FE_RST]			= RST_NR_PER_BANK + 21,
> > +	[AN7583_USB_HOST_P0_RST]	= RST_NR_PER_BANK + 22,
> > +	[AN7583_GSW_RST]		= RST_NR_PER_BANK + 23,
> > +	[AN7583_SFC2_PCM_RST]		= RST_NR_PER_BANK + 25,
> > +	[AN7583_PCIE0_RST]		= RST_NR_PER_BANK + 26,
> > +	[AN7583_PCIE1_RST]		= RST_NR_PER_BANK + 27,
> > +	[AN7583_CPU_TIMER_RST]		= RST_NR_PER_BANK + 28,
> > +	[AN7583_PCIE_HB_RST]		= RST_NR_PER_BANK + 29,
> > +	[AN7583_XPON_MAC_RST]		= RST_NR_PER_BANK + 31,
> > +
> > +	/* RST_PCIC */
> > +	[AN7583_PCIC_PERSTOUT0_RST]	= 2 * RST_NR_PER_BANK + 29,
> > +	[AN7583_PCIC_PERSTOUT1_RST]	= 2 * RST_NR_PER_BANK + 26,
> > +};
> > +
> >  static int en7581_reset_register(struct device *dev, void __iomem *base,
> >  				 const u16 *rst_map, int nr_resets,
> >  				 const u16 *rst_reg_ofs);
> > @@ -1149,6 +1348,43 @@ static int en7581_clk_hw_init(struct platform_device *pdev,
> >  	return en7581_serdes_phy_register(&pdev->dev);
> >  }
> >  
> > +static int an7583_clk_hw_init(struct platform_device *pdev,
> > +			      struct clk_hw_onecell_data *clk_data)
> > +{
> > +	struct en_clk_priv *priv = platform_get_drvdata(pdev);
> > +	struct device *dev = &pdev->dev;
> > +	struct regmap *map;
> > +	void __iomem *base;
> > +	u32 val;
> > +	int ret;
> > +
> > +	map = syscon_regmap_lookup_by_phandle(dev->of_node, "airoha,chip-scu");
> > +	if (IS_ERR(map))
> > +		return PTR_ERR(map);
> > +
> > +	base = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(base))
> > +		return PTR_ERR(base);
> > +
> > +	priv->base = base;
> > +
> > +	en7581_register_clocks(dev, clk_data, map, base);
> 
> The Sashiko output looks legit here about the missing .set_rate,
> .round_rate, or .determine_rate callbacks.
> 

It's getting handled by a different series... It's really to keep things
split and speedup review process. When one of the 2 gets merged, I will
quickly rebase the other if needed.

(honestly was done to not make a big series)

-- 
	Ansuel
