Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179154;
	b=HcZtLUjIsaP0CnjqXXRj6guICAvwH7Z5lbQf8tzzJH5MJUeqxnmmH+hKEJqB4V2ZqdDI
	 Mq1jtBYzr5nBB7wRDrRI44/0+0bLtlYSXN5wzvjLZ8MgE2SFb4AGCRdfyPwBVefvZZqO+
	 4zRRP4XRQWhRZ2hbxYRPQKrStq4aLPGH9Cjq7ETc5j9S7EDPbG27Q2xeSXc2iDR580u6x
	 imcxsbIXTFmTMQEU8Kx8OkdTqKty9siHnu9rih27D/J7z6UvXcp0oIDWfbQMEBMbLwstz
	 /hmFUvRGeTUo7ylI2dP84g0ANAZEyf7qed/JCDTreMa9FaTLy2/CruBYY6mL2IaqAdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179154;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=9SjRna3ikFVF0kjvJgTvEWSAoXwpZaelLjTatjkSd8k=;
	b=oYF3RGBc4d+qhlVXGoUl35CAB1lwq5P0h/VvxKl6Er8TMGoV0zD4016a3u0q5ATJ4/fm
	 jg7zD1HMFwN3+rBdir6j6Z9YCYb/DXkl52JXUPPTZdqovLUAOhgmWXbK1Z8DbZVpFWWPB
	 P1ZRMtZjt653gC/U2oStRMjgiygLZUiItzOUf7yzlI9ScyPXfZ4WBaICq32BUgPAok9d3
	 yE+NYCjEKtXrQfbTzRR+g2z+QidP4M+GzLglaweJsGpd87nPI6dQSD1tYLvx16sdBTh7N
	 EBIcX2fXzkbEOCeiHFJwjw2P5Q5ObkFUVY7qO7u5aLISt33vTqikilAfGfUQRgGbd6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.172
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126EA606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:52:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 126EA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5ee029fd76aso562254e0c.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:52:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795179153; x=1795783953;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9SjRna3ikFVF0kjvJgTvEWSAoXwpZaelLjTatjkSd8k=;
        b=yBd138Vpvcch1cInNOUh/a0PL+1JbcF7BhqcuDDhesXXUHkU/Ui5KYZms3NECzkw04
         ML6jSnSsySJGDl58f1TZYnl+ZxqHEeMyPcn3dXWyeZMliWAh4oE+bgwi75aslzNBrwri
         au7vIWkHPAS8GjevAiJi5lv8NtzGG09VvbLo+hPG7/chHjDZCq0zyvdiXkKpkC/wn1jk
         K16KxxctPPXGrnwcAeqtSA6VvHYVCtzT1SinqDQvbdzf1JhKDfhauOlvQHSYL7LB9giF
         DsatwLaeAglfNWaSERoS1U+0p+GDw7oetDN/LoxrsdBg9QT9kR8oKEYlIyg7aKnO+I+r
         oWbQ==
X-Forwarded-Encrypted: i=1; AL+hErFmm7Adb7FvgQf1hxqrnAGCMcxO9oT5a9/+Gz58P21iVJxe25U4k/20t/x8yilAAn7mRrZNNgl19Mz5br4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KWHXTn7Vm3oEskLqztVNX1TXIyePrsCxlxcan7nMvCB8C1a9Z
	5BaMBy29qEDX67zp+SP06ejCLd/9dbotbYWzOeIfYq+tvciNov/anemSq4Ra6hQa
X-Gm-Gg: AZFdTZdh0X6uk3m7HKbpixE9MV041KI/gLMa+co/3N4AxQkncGTBbbZH09UR/aN2Eaz
	cDOQpYCXGuu+axu5sdPSF6DUbJSpUOndpHEZU6cd0XanETNwIWSNNaobhXBso0LnQZ+HBvzJXGA
	hdqYDENlpPQYiVMqK+J+L/0Xcl4Aefz+Zolcxvc2knhlNitdlZZvzdX5/DRRgh6AuMP/qaasDqq
	NQ2gRNhji1rpmI1gRzihgPzsli1nZz8AENJdcT8BRrI5AYf6gZElfu69Mxjx/C5gTsvMAJqpSj4
	XMTildl7RrKN2PrhAUD8m9qSNfbCEEd0Bqd73YU7j7N5+Krc75QrNKlza6etHUoj43QVOSYzGzV
	cTSfMlJ7HWrKI5/D6errEvQzeiwLMkhc9D6bGGMbauA7kYoPMcpwWIYncUD8FvDFkEw1jwwUCcy
	CoCXrWaAKqlyAty81mcA2CT4kx4zxBNKZzjUI3C39FMjp2qLPG6Pyo1dqwTwa/2+MT3Frf8UAt8
	wgz24dKTEYiE1D3K1pKSLIAyzq+SALK1QQJWjPmoJ/BJ6ZAW6FuE7MCgZmw9z87iN7jKYCTHCij
	sSjoyZzSw/2sW0wuwyBRwqOfclZvQ9x7z5AdiMl6kLtK3JyImWfJ0W1rkHYRQdU5TUQ=
X-Received: by 2002:a05:6122:8c8c:b0:5ec:e6b8:ebad with SMTP id 71dfb90a1353d-5ee8af4a759mr1500155e0c.10.1795179152975;
        Fri, 20 Nov 2026 04:52:32 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b555147sm2370640e0c.6.2026.11.20.04.52.32
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 04:52:32 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7d2da166818so523422137.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:52:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHCp1ytrQKdSV/NWNlodjQCO6W1JqgH1xFAt2WRgwJgN4JOrf/BxFeQJe1LdogxvvZbK4B4pR5UbxIp7ew=@vger.kernel.org
X-Received: by 2002:a05:6102:3e8d:b0:7c3:fcb:180c with SMTP id
 ada2fe7eead31-7d739572406mr1186700137.20.1795179152283; Fri, 20 Nov 2026
 04:52:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-sdhi_rzg3l-v1-0-ca30b209615d@bp.renesas.com> <20261112-sdhi_rzg3l-v1-1-ca30b209615d@bp.renesas.com>
In-Reply-To: <20261112-sdhi_rzg3l-v1-1-ca30b209615d@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 13:52:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWk_0VT_UgaYoCW8c9zac2g88bL6niZF6aDu+UbWroFjw@mail.gmail.com>
X-Gm-Features: Aa3M54qyNQu_3mY0Gw0VIiuXO7cKeCCI_cdaF_qJo1F3yjQPV5KrJ3x92PPsDRE
Message-ID: <CAMuHMdWk_0VT_UgaYoCW8c9zac2g88bL6niZF6aDu+UbWroFjw@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r9a08g046: Add SDHI nodes for
 RZ/G3L SoC and SDHI1 pincontrol on SMARC EVK
To: Biju Das <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Thu, 12 Nov 2026 at 19:48, Biju Das <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add device tree nodes for the three SDHI controllers (SDHI{0,1,2})
> on the RZ/G3L SoC (r9a08g046) and enable SDHI1 on the RZ/G3L SMARC
> EVK platform with pincontrol and GPIO-based voltage switching
> regulator support.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> @@ -1062,9 +1062,80 @@ dmac: dma-controller@11820000 {
>                         dma-channels = <16>;
>                 };
>
> +               sdhi0: mmc@11c00000 {
> +                       compatible = "renesas,sdhi-r9a08g046";
> +                       reg = <0x0 0x11c00000 0 0x10000>;
> +                       interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD R9A08G046_SDHI0_IMCLK>,
> +                                <&cpg CPG_MOD R9A08G046_SDHI0_CLK_HS>,
> +                                <&cpg CPG_MOD R9A08G046_SDHI0_IMCLK2>,
> +                                <&cpg CPG_MOD R9A08G046_SDHI0_IACLKM>,
> +                                <&cpg CPG_MOD R9A08G046_SDHI0_IACLKS>;
> +                       clock-names = "core", "clkh", "cd", "aclkm", "aclks";
> +                       max-frequency = <150000000>;

Given the bus clock can only run at 200, 100, 50, or 6.25 MHz,
150 Mhz looks strange to me.

> +                       resets = <&cpg R9A08G046_SDHI0_IXRST>,
> +                                <&cpg R9A08G046_SDHI0_IXRSTAXIM>,
> +                                <&cpg R9A08G046_SDHI0_IXRSTAXIS>;
> +                       reset-names = "rst", "axim", "axis";
> +                       power-domains = <&cpg>;
> +                       status = "disabled";
> +               };
> +
>                 sdhi1: mmc@11c10000 {
> +                       compatible = "renesas,sdhi-r9a08g046";
>                         reg = <0x0 0x11c10000 0 0x10000>;
> -                       /* placeholder */
> +                       interrupts = <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD R9A08G046_SDHI1_IMCLK>,
> +                                <&cpg CPG_MOD R9A08G046_SDHI1_CLK_HS>,
> +                                <&cpg CPG_MOD R9A08G046_SDHI1_IMCLK2>,
> +                                <&cpg CPG_MOD R9A08G046_SDHI1_IACLKM>,
> +                                <&cpg CPG_MOD R9A08G046_SDHI1_IACLKS>;
> +                       clock-names = "core", "clkh", "cd", "aclkm", "aclks";
> +                       max-frequency = <150000000>;

Likewise. This instance does not support HS400, but HS200 and HS400
use the same bus clock speed, right?

> +                       resets = <&cpg R9A08G046_SDHI1_IXRST>,
> +                                <&cpg R9A08G046_SDHI1_IXRSTAXIM>,
> +                                <&cpg R9A08G046_SDHI1_IXRSTAXIS>;
> +                       reset-names = "rst", "axim", "axis";
> +                       power-domains = <&cpg>;
> +                       status = "disabled";
> +
> +                       sdhi1_vqmmc: vqmmc-regulator {
> +                               regulator-name = "SDHI1-VQMMC";
> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <3300000>;
> +                               regulator-ramp-delay = <1200>;
> +                               status = "disabled";
> +                       };
> +               };
> +
> +               sdhi2: mmc@11c20000 {
> +                       compatible = "renesas,sdhi-r9a08g046";
> +                       reg = <0x0 0x11c20000 0 0x10000>;
> +                       interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD R9A08G046_SDHI2_IMCLK>,
> +                                <&cpg CPG_MOD R9A08G046_SDHI2_CLK_HS>,
> +                                <&cpg CPG_MOD R9A08G046_SDHI2_IMCLK2>,
> +                                <&cpg CPG_MOD R9A08G046_SDHI2_IACLKM>,
> +                                <&cpg CPG_MOD R9A08G046_SDHI2_IACLKS>;
> +                       clock-names = "core", "clkh", "cd", "aclkm", "aclks";
> +                       max-frequency = <150000000>;

This instance maxes out at SDR104, so max-frequency should be lower?

> +                       resets = <&cpg R9A08G046_SDHI2_IXRST>,
> +                                <&cpg R9A08G046_SDHI2_IXRSTAXIM>,
> +                                <&cpg R9A08G046_SDHI2_IXRSTAXIS>;
> +                       reset-names = "rst", "axim", "axis";
> +                       power-domains = <&cpg>;
> +                       status = "disabled";
> +
> +                       sdhi2_vqmmc: vqmmc-regulator {
> +                               regulator-name = "SDHI2-VQMMC";
> +                               regulator-min-microvolt = <1800000>;
> +                               regulator-max-microvolt = <3300000>;
> +                               regulator-ramp-delay = <1200>;
> +                               status = "disabled";
> +                       };
>                 };

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
