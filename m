Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180939;
	b=Xm9jC1e9v0kKU6B3pGldh8za6K67M+YJJedUWS44wFHo3Pa6h9XrfIISk40PdMKef4rC
	 qn70ZhiuHJxmJ8A32RMCKywAP9kRiNPsSbxtj3HHnPT/3/R3hogySdwI0GMtYBhkWzhcp
	 ErQpCNtb+2q/KeQ208DOAlchMiNPCaHUjgA0RucxwtIUSVJ9+Y+SpmxeXwqFkWu2MY/3K
	 j980ef1D07kif+gEF0tgeQD5C1qvAYaXfqCz/pYKtgffQpippx25pOOiNi9f/QU3fghMJ
	 wv5hPpB73EuFOdTC1SUmHdSOMpCIYumskAihFjM6pxpx1W0YUQnT6J/er2+XyrqehIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180939;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=NWnIiKbpB4h5H6+7A2EeLgsdTZHto9WMJYZBt0yNauk=;
	b=dQDqVrrOpq9mD4hqcfGfumpy9FHhIbjiWwWCr0CZ3mk+xTdKcFnhSRT7LxjkyMaaMypX
	 wbjExfJOJmeqJObCkFHVocUtUz1iYfqTY0aCFJhCpabfVh4fVeHss+WYmRSmWzsGkLyYZ
	 imxierYbeRxhXNkuacDdZyGHosOigAAbb/fDYDlp5S71m9w5Wm7jKOuTbGUxPdottL/OT
	 94ug1vhjB6jZA/F++a3q3KUtOAQUpCstLJXDkYtIlr4QTeikBO0MdsF0VqtkMRKFw73VB
	 m/4MTeWLKhk10ac48XDRWo9IPJjbPnW31taMCo8+24kzpQSxvk+rgPm8u/nAucpDUZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.53
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3510606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:22:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3510606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-78fb1fb9508so1634032137.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:22:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180938; x=1795785738;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NWnIiKbpB4h5H6+7A2EeLgsdTZHto9WMJYZBt0yNauk=;
        b=WgpO67bfWJXinu6WuOMWEImqrZRTWENHCHdnr/nZUQq3EKatrWgJz3lERBCdosHfpg
         okHMPhOOcTwWDyUAlLtzlXoQFsejMcOAQ5UQdLPAxFqAKYYmTTAwRZ4iEjMfGxbwzOc1
         Az6cUWtkNLGFXJVaLMcvXbVXdCeUL8tqWLmNZVCqSBGw0lVy0m+Au/mJdS5ZZcvhKd8R
         VWOSS2sH4L9ccd9i9vHlR93/I9PgGZxR/YKS2jdd580Dmyo4Fg06noH+V2Ha1mJr7fLN
         r3utWwDHQPrrawYZPrj57d3QbZG6xOToOMLGYyhLjuxvFJdF/G1pjku2Y2N1s972scg4
         TTCw==
X-Forwarded-Encrypted: i=1; AL+hErHuApdCv2CvetBUIKOcNgExJJpFqqCXQmTzpoASIsvkCgG5sBzzY2aqtU+5Tk4q0ye8O13+7G1WTbp2lTk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CoRitflKOtOVd6aYH3abDgO+31iSN1ytBtI6niVmQM8+2TihN
	phDd/XKwnzbuYiGHBT8TAqOIz8RvTB7CcRbhscdIu5yGmREDnBQfPxBCrvIXaiVN
X-Gm-Gg: AZFdTZeFCYRUgNlDmHoBtLUKpo70JJEOXnm4ELsTweK9xMaL9GqhRW+IRpZGa6Ah5vX
	HlJwYvGzbG1Pnd/9hl5w+kQJ2b1utuSqwh5wP4cCOn4dkFU6upo4BsbZcMY7idRY/HZzRCafvEO
	qIEfIA0F0BE4aRJpEXJj2sRUHdvv+hb0TiZWtv/iSDnjcrAmsS/bwOky4HABs/M8CuaPAsf6gNa
	e4aAPKrZ39Owvxd5hxr8Bh/VFn6zYpD1WDoGlN1mSNjlz+Bp0tiwLJxF3xjBREstVv4xx1RDlpI
	hNaaXwQMcqyF1fPfe/4Db5uY2xCIBKu1b31WQHQIXHuf5GN6Zb9XuhejFowcIUNLtbDP5NJtWk3
	h5mND78P6e1Z2QxKCwgm8CenWvKgB0PqxLsiBCGToW/2XOrgE/Wf+uJ+Qtwnob9xvEW7b3jqVQO
	Ld5UArsvkqLiYEEfBlpS4k10h25If9kJq43QL0L5WJitfTNaX+EJvHGzWPgEPMi1wYNAXuWImyO
	gV+xTNhuYdP8fSesRp95c1eVJvO1vpIemI6HAJvnPadpWL+nlyxNfl/TBQCMWhCAgsP9xLR/A28
	hWsKTD4f3purpF0gc31l0v/xLYrs5tdEkLBspGqmNhVt0BqLATeFl5fe5JUwca76WYk=
X-Received: by 2002:a05:6102:b12:b0:7cc:ace:24ad with SMTP id ada2fe7eead31-7d6db6d3f04mr1430102137.0.1795180937681;
        Fri, 20 Nov 2026 05:22:17 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e7d76b74sm2914937137.1.2026.11.20.05.22.16
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 05:22:16 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-99e156fe905so1417456241.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:22:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEBYlpj5mXrcFv5R0NsPKc/xVa+J0Z9aHbKrlzsg7U3/IuQLrV2EvehZ1QEKuGTh/NxHgvRRnPDaQc0keE=@vger.kernel.org
X-Received: by 2002:a05:6102:5126:b0:7c2:b741:2391 with SMTP id
 ada2fe7eead31-7d6dba096cbmr1501978137.30.1795180936383; Fri, 20 Nov 2026
 05:22:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-sdhi_rzg3l-v1-0-ca30b209615d@bp.renesas.com>
 <20261112-sdhi_rzg3l-v1-1-ca30b209615d@bp.renesas.com> <CAMuHMdWk_0VT_UgaYoCW8c9zac2g88bL6niZF6aDu+UbWroFjw@mail.gmail.com>
 <TYYPR01MB6603B59F47E78CC7DDBF50B986782@TYYPR01MB6603.jpnprd01.prod.outlook.com>
In-Reply-To: <TYYPR01MB6603B59F47E78CC7DDBF50B986782@TYYPR01MB6603.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 14:22:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX670UgRM=tH1iVeCZhqtBvXQA8=Zp1BLHMSqkrf1Emuw@mail.gmail.com>
X-Gm-Features: Aa3M54rJ8nO7mFKGfpphYUxz52FFSlbHBA0u3_e6u9X18v9-00fZ-jlsVzihWbE
Message-ID: <CAMuHMdX670UgRM=tH1iVeCZhqtBvXQA8=Zp1BLHMSqkrf1Emuw@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: r9a08g046: Add SDHI nodes for
 RZ/G3L SoC and SDHI1 pincontrol on SMARC EVK
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>, "magnus.damm" <magnus.damm@gmail.com>, 
	"wsa+renesas" <wsa+renesas@sang-engineering.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Fri, 20 Nov 2026 at 14:14, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Thu, 12 Nov 2026 at 19:48, Biju Das <biju.das.au@gmail.com> wrote:
> > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > Add device tree nodes for the three SDHI controllers (SDHI{0,1,2}) on
> > > the RZ/G3L SoC (r9a08g046) and enable SDHI1 on the RZ/G3L SMARC EVK
> > > platform with pincontrol and GPIO-based voltage switching regulator
> > > support.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> > > --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> > > @@ -1062,9 +1062,80 @@ dmac: dma-controller@11820000 {
> > >                         dma-channels = <16>;
> > >                 };
> > >
> > > +               sdhi0: mmc@11c00000 {
> > > +                       compatible = "renesas,sdhi-r9a08g046";
> > > +                       reg = <0x0 0x11c00000 0 0x10000>;
> > > +                       interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
> > > +                                    <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
> > > +                       clocks = <&cpg CPG_MOD R9A08G046_SDHI0_IMCLK>,
> > > +                                <&cpg CPG_MOD R9A08G046_SDHI0_CLK_HS>,
> > > +                                <&cpg CPG_MOD R9A08G046_SDHI0_IMCLK2>,
> > > +                                <&cpg CPG_MOD R9A08G046_SDHI0_IACLKM>,
> > > +                                <&cpg CPG_MOD R9A08G046_SDHI0_IACLKS>;
> > > +                       clock-names = "core", "clkh", "cd", "aclkm", "aclks";
> > > +                       max-frequency = <150000000>;
> >
> > Given the bus clock can only run at 200, 100, 50, or 6.25 MHz,
> > 150 Mhz looks strange to me.
>
> Ref: RZG3L_clock_list_r1.10_ad.xlsx
> 400 MHz IMCL{K,K2} clock is prohibited for this SoC.
> 800 MHz HS clock is prohibited for this SoC.
>
> IMCLK = SD / 2
> HS = SD
>
> IMCLK clock sources
> 400 MHz:- Prohibited
> 300.000
> 250.000
> 133.333
>
>
> The next available max frequency = 300 / 2 = 150 MHz that goes to
> SD interface.
>
> >
> > > +                       resets = <&cpg R9A08G046_SDHI0_IXRST>,
> > > +                                <&cpg R9A08G046_SDHI0_IXRSTAXIM>,
> > > +                                <&cpg R9A08G046_SDHI0_IXRSTAXIS>;
> > > +                       reset-names = "rst", "axim", "axis";
> > > +                       power-domains = <&cpg>;
> > > +                       status = "disabled";
> > > +               };
> > > +
> > >                 sdhi1: mmc@11c10000 {
> > > +                       compatible = "renesas,sdhi-r9a08g046";
> > >                         reg = <0x0 0x11c10000 0 0x10000>;
> > > -                       /* placeholder */
> > > +                       interrupts = <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
> > > +                                    <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> > > +                       clocks = <&cpg CPG_MOD R9A08G046_SDHI1_IMCLK>,
> > > +                                <&cpg CPG_MOD R9A08G046_SDHI1_CLK_HS>,
> > > +                                <&cpg CPG_MOD R9A08G046_SDHI1_IMCLK2>,
> > > +                                <&cpg CPG_MOD R9A08G046_SDHI1_IACLKM>,
> > > +                                <&cpg CPG_MOD R9A08G046_SDHI1_IACLKS>;
> > > +                       clock-names = "core", "clkh", "cd", "aclkm", "aclks";
> > > +                       max-frequency = <150000000>;
> >
> > Likewise. This instance does not support HS400, but HS200 and HS400 use the same bus clock speed,
> > right?
>
> Yes that is correct, HS200 and HS400 use the same bus clock speed
>
> for HS200 it is 1:1 option, so 300MHz and with internal divider(2) = 150 MHz
>
> For HS400, Divider from SDctrl register=0, so 300MHz with SD_CTRL divider 2 =150 MHz.
>
> >
> > > +                       resets = <&cpg R9A08G046_SDHI1_IXRST>,
> > > +                                <&cpg R9A08G046_SDHI1_IXRSTAXIM>,
> > > +                                <&cpg R9A08G046_SDHI1_IXRSTAXIS>;
> > > +                       reset-names = "rst", "axim", "axis";
> > > +                       power-domains = <&cpg>;
> > > +                       status = "disabled";
> > > +
> > > +                       sdhi1_vqmmc: vqmmc-regulator {
> > > +                               regulator-name = "SDHI1-VQMMC";
> > > +                               regulator-min-microvolt = <1800000>;
> > > +                               regulator-max-microvolt = <3300000>;
> > > +                               regulator-ramp-delay = <1200>;
> > > +                               status = "disabled";
> > > +                       };
> > > +               };
> > > +
> > > +               sdhi2: mmc@11c20000 {
> > > +                       compatible = "renesas,sdhi-r9a08g046";
> > > +                       reg = <0x0 0x11c20000 0 0x10000>;
> > > +                       interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
> > > +                                    <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
> > > +                       clocks = <&cpg CPG_MOD R9A08G046_SDHI2_IMCLK>,
> > > +                                <&cpg CPG_MOD R9A08G046_SDHI2_CLK_HS>,
> > > +                                <&cpg CPG_MOD R9A08G046_SDHI2_IMCLK2>,
> > > +                                <&cpg CPG_MOD R9A08G046_SDHI2_IACLKM>,
> > > +                                <&cpg CPG_MOD R9A08G046_SDHI2_IACLKS>;
> > > +                       clock-names = "core", "clkh", "cd", "aclkm", "aclks";
> > > +                       max-frequency = <150000000>;
> >
> > This instance maxes out at SDR104, so max-frequency should be lower?
>
> SDR104 max frequency theoretical 208MHz.
>
> In our SoC, 200 MHz is prohibited, so the next maximum available is 150MHz.

OK.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
