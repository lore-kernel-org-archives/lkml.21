Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795802501;
	b=RepLD2puUhLr8iDPDcHUnoNy7BEvnnQp+lqQKnRR6t2LbOyfVYqj/wtYbBy+8wgBdokx
	 gf1aBBwcnT5qBOC2plpIhG8jEWvL2EtTpTZ+JzVUlLxdeXiIVieghiUoDuoM5gjsm67cZ
	 j04QrzPt1zb84kPuu5Ty/utQVqnjHFMYVOoufG9eg4vI7j6JW3kNL06bu1hpZv//YTkoD
	 tBWCC8QAvcPO44Gcdn6gNqRLBF6HcCblpr9OmhgxI2guq1F7HKAyLnmgq+fdzHwB6PnXR
	 p/kXyROlsJidH2iInEF5I88+fe9e6wtmAPcdEUfDMIOnhbnG5YXQArsjhfrUYS6/h0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802501;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=fsNoUHPpGo1gHz1gAcdVPTu3hkJcEuLuYD2db/66XEI=;
	b=EsJDa2Ge5ENBfb6MBghutiteGTS0c8KFj6onaDmzZvPcaPEE0RZeBjXm3muFu3bj9jSE
	 NRc93HW3iqt2KQSM9VIWVYCvtQm3okXc6L/vC9vY4JXUTsj9spnPV4inuJbYbs0AhdEE0
	 ulOJZPD7hiRW8HOVHgMI8DbjP+jHuGOR9DMx9XM+fLuoZggCk6sYpT+yfSwEuySDRzXuD
	 bDnq/wvsL2T8nYUPhSEVixZPMuef2h0tfOOYLrp2d7TwwL9kDsrU2Fz8Dg/bGuusgOn5t
	 +MCdN/HSXLzIYjbiD7D7Bpl7hkBDQbJDYnzrVblYUmiPm7QKmDdf3+/88NrlVKGaBLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=dKxCSoOQ;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD1D606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:01:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACD1D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=dKxCSoOQ
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso102579965e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795802499; x=1796407299; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fsNoUHPpGo1gHz1gAcdVPTu3hkJcEuLuYD2db/66XEI=;
        b=dKxCSoOQwJY4+C9ZrIn428uzPaSbrcuceYsjSLJIHTG8/Vl6PTA1WVNHaJUAa0sxVo
         zs6EqHR9E8Wyd3mJva38/SQrjM4FzsDZbINuoFZNtQ8nQvSmGrlwYddn4uvg5mwizuFp
         qsJhus/e5OKeyi5ElnkQ/2rMAH9ojoBaSw2eemDnCwYzeOGGufOxFE4fIhqxEeLu28Sh
         guhaJd8c/DYLGSEEhLiy6uOGH9zL8hGUt3r/fKFRjlOch5ZidbPnbvaq4aB6RWgjnKLu
         BaC2/RRPWCiW5kxsgkmSK34Bp5u9asihDQaF2LtMYpORq68eZwqB2dqUuwTNJ9iQs1eL
         +W8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795802499; x=1796407299;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fsNoUHPpGo1gHz1gAcdVPTu3hkJcEuLuYD2db/66XEI=;
        b=h3qulS+Oc8MY8M1Rf/l8qh2nvDluwHLO0lY+LG9Gn81J7HLOfqyFju0glM6pjNUjki
         9HwswgPUAKwe4Lqqe3fhv1ZWrAnCjexxH/ICXdoke4mHmXXh1vZELL36elyAoJompEUy
         Tkcrr0x9kIJv2R4jt3vS56g/nPkyFEFej1P4sCKFJIrHv2U0UCFB/VvTI9EIc7JGF7lq
         skBdDFPHvZiZhu37E9s8/rXftn4j5aEYZyzjf1s9cUtQXGC0+WbaIy4p8dQyCbdIhny1
         3ZEZiTHlwGhpkJ7LmWXNKP1yQptvOLPg65KXoDrgAnrHO8QPAAWXzTWkwv8Iir49zmmZ
         LRzw==
X-Forwarded-Encrypted: i=1; AL+hErHb+eeLWWl7W2ZYkfeY3OpVxc/v+P4QI+5iaNmTxH5knX11sWjtzWgV3LA3GGD9X0eMEAwAH/HfhKDWdyw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/V8ymSn4SyNyxNqjsZBxCgbqhfccJguk/00ozgu/a0xoMLeAsV
	msJwTMcZSDC+hCNZklVrUcx18/fXup0uucY/47K7Yb9Yrn1/PDn84V762kBhZXfh/60=
X-Gm-Gg: AZFdTZcuUxggC7vFe/PnrAKjU4/oIUuMzZ0hQS98ZctGX5a9OxWxMcJV15Q3kRVE+GL
	LkfmpT1tz3cLEL6n1Ad7OfLPkmjnHhkABIJFpNDved5t2zSJDgdJgc7L7S3hTZnrmXrGvD5+I0g
	CLncfvxUimVh9SvlgLF4T0Dq8tIl4Fi9E4106b7Wmunwn1J649KPcara0T9B/cuwP7A+1PmcpKD
	XqW4F0/q+CTxvZPE35EdV7bun4Qnh0o0G6wGsXmkZgmQ8exmYI9gOoYW13fXO6iRjmh98el6eBf
	3FN2nuruqynHrAicnYX3hF5V6ebA1AhvMWxt+C2FHR9cTbEJ7y/eltyW+Qkx7tmQwsxe3zH56Le
	fclV8ByC3JPNo0/YJDaMgiztRHh87uxjynEz1Q6KS3GWAUESdloDJKGVt4OaEtDiqbnM52qICJB
	VwHgQz4XK0wsethRmLIdNZI5xr8PrQ1UQoVuH6axPO+Ce8glZJ/0jWp3fcEaNproRVyZdmLQl21
	JFE2Ehkpx8NoaeVy+xwd/A1Om5bz22K79ZwsRYZq0w0sa0q81nd/RcnsuUTNOru0OPY42sVBCWV
	Y57BzgywMWKQcOI7i7b3antd+7YvX1uN+7wPUZmHRfDL+i4R
X-Received: by 2002:a05:600c:8486:b0:4ac:aae6:6401 with SMTP id 5b1f17b1804b1-4bb8880606fmr521206445e9.12.1795802498933;
        Fri, 27 Nov 2026 10:01:38 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm832738955e9.11.2026.11.27.10.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:01:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 1/3] dt-bindings: toshiba: introduce
 toshiba,tc9564-clock.yaml
From: Jerome Brunet <jbrunet@baylibre.com>
To: Alex Elder <elder@riscstar.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 p.zabel@pengutronix.de, andersson@kernel.org, konradybcio@kernel.org, 
 abelvesa@kernel.org, daniel@riscstar.com, mohd.anwar@oss.qualcomm.com, 
 lorenzo.bianconi@oss.qualcomm.com, fabrice.gasnier@foss.st.com, 
 alexandre.torgue@foss.st.com, marex@nabladev.com, 
 changhuang.liang@starfivetech.com, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261125202141.1288493-2-elder@riscstar.com>
References: <20261125202141.1288493-1-elder@riscstar.com>
 <20261125202141.1288493-2-elder@riscstar.com>
Date: Fri, 27 Nov 2026 19:01:35 +0100
Message-Id: <179580249573.2809466.11034484697919897942.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6124; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=geWxMicG6uVAdhcEualT0NzvyoAmaPCiuckBB8B5yvQ=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmcRxul7Xh+dZasndPvIcma4mp8cO+Pq9KHrhavfhO6K
 e9E7PaJHaUsDGJcDLJiiiw13NXi7yS1vsyarnMbZg4rE8gQBi5OAZjItimMDIuUQ7gT3BbFLlqw
 7s2d/5M/7/KoX7shWK5yVYKMkdrFVDWG/65Z13T7Xl9l7purknKx6MW58le7Tt+onPdZf3bbpYM
 tDBwA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> Define the binding for the clock and reset controller that present in
> the Toshiba TC9564 SoC.
> 
> Reviewed-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
> v3: - Added Lorenzo's Reviewed-by
>     - Changed to @kernel.org e-mails for Daniel and me
>     - Only the gated clock IDs are now published in "toshiba,tc9564.h";
>       the PLL and internal fixed clocks are implemented and accessed
>       only within "clk-tc9564.c"
> 
>  .../bindings/clock/toshiba,tc9564-clock.yaml  | 73 +++++++++++++++++++
>  MAINTAINERS                                   |  8 ++
>  include/dt-bindings/clock/toshiba,tc9564.h    | 40 ++++++++++
>  3 files changed, 121 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
>  create mode 100644 include/dt-bindings/clock/toshiba,tc9564.h
>
> diff --git a/Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml b/Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
> new file mode 100644
> index 000000000000..026ed949f0f0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/toshiba,tc9564-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Toshiba TC9564 Clock and Reset Controller
> +
> +maintainers:
> +  - Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> +  - Alex Elder <elder@kernel.org>
> +  - Daniel Thompson <danielt@kernel.org>
> +
> +description:
> +  The Toshiba TC9564 is an SoC accessed by a host system through the
> +  upstream PCIe port on the PCIe switch it implements.  The chip includes
> +  an embedded PCIe endpoint that provides access to various peripherals
> +  within the SoC via its BARs.  These peripherals include a simple
> +  controller to gate internal clocks, and a reset controller.
> +
> +  The TC9564 chip has a single input clock.  Internally that clock is
> +  multiplied by a PLL, and the PLL signal is divided internally into
> +  a set of fixed rate, always-on clocks.
> +
> +  The clock controller exposes a set of simple gated clocks, which are
> +  controlled by two registers.  Each is derived from one of the internal
> +  fixed-rate clocks.  A total of 21 gated clocks are implemented within
> +  the chip, but support for enabling and disabling only a subset of them
> +  is provided at this time.  Two clocks (I2C and PCIE) are marked critical
> +  to make it clear that they should never be disabled.
> +
> +  The reset controller uses two other registers to control a set of 13
> +  resets that can be asserted or deasserted.  Here too, only a subset
> +  of the resets can currently be managed, and the I2C and PCIE resets
> +  are treated as critical.
> +
> +  Clock and reset IDs are defined <dt-bindings/clock/toshiba,tc9564.h>.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: toshiba,tc9564-clock
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  "#reset-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - "#clock-cells"
> +  - "#reset-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller@1004 {
> +        compatible = "toshiba,tc9564-clock";
> +        reg = <0x1004 0x10>;
> +        clocks = <&tc9564_xo_board>;
> +        #clock-cells = <1>;
> +        #reset-cells = <1>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 93abbb315065..4d1f4cbfd731 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -28332,6 +28332,14 @@ F:	Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.yaml
>  F:	drivers/media/i2c/tc358743*
>  F:	include/media/i2c/tc358743.h
>  
> +TOSHIBA TC9564 CLOCK/RESET CONTROLLER DRIVER
> +M:	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> +M:	Alex Elder <elder@kernel.org>
> +M:	Daniel Thompson <danielt@kernel.org>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
> +F:	include/dt-bindings/clock/toshiba,tc9564.h
> +
>  TOSHIBA TC9564 PCI DRIVER
>  M:	Alex Elder <elder@kernel.org>
>  M:	Daniel Thompson <danielt@kernel.org>
> diff --git a/include/dt-bindings/clock/toshiba,tc9564.h b/include/dt-bindings/clock/toshiba,tc9564.h
> new file mode 100644
> index 000000000000..7de8c8165199
> --- /dev/null
> +++ b/include/dt-bindings/clock/toshiba,tc9564.h
> @@ -0,0 +1,40 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +
> +/*
> + * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
> + */
> +
> +#ifndef __CLOCK_TOSHIBA_TC9564_H__
> +#define __CLOCK_TOSHIBA_TC9564_H__
> +
> +/* Clock IDs */
> +
> +#define CLOCK_I2C		0	/* critical */

Name seems a touch too generic.
If everybody named clock this way, we would be very likely to get collision
in the DTS.

suggest TC9564_CLK_XXX

> +#define CLOCK_PCIE		1	/* critical */
> +#define CLOCK_MSIGEN		2
> +
> +#define CLOCK_MAC0_TX		3
> +#define CLOCK_MAC0_RX		4
> +#define CLOCK_MAC0_125M		5
> +#define CLOCK_MAC0_ALL		6
> +
> +#define CLOCK_MAC1_TX		7
> +#define CLOCK_MAC1_RX		8
> +#define CLOCK_MAC1_125M		9
> +#define CLOCK_MAC1_ALL		10
> +
> +/* Reset IDs */
> +
> +#define RESET_I2C		0	/* critical */
> +#define RESET_PCIE		1	/* critical */
> +#define RESET_MSIGEN		2
> +
> +#define RESET_MAC0_MAC		3
> +#define RESET_MAC0_PMA		4
> +#define RESET_MAC0_XPCS		5
> +
> +#define RESET_MAC1_MAC		6
> +#define RESET_MAC1_PMA		7
> +#define RESET_MAC1_XPCS		8

Those ids do not belong in include/dt-bindings/clock/

> +
> +#endif /* __CLOCK_TOSHIBA_TC9564_H__*/

Nit: missing space before the closing */ in the comment.

-- 
Jerome

