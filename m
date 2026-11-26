Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697371;
	b=Sb0HskQF/5TY9xLO66hII/nu4rkzqJVx3gxrbmcWtLBnVqPPbg0A7rRWkj51mVq4gomV
	 Zvq8gW4HElc8MKv97jpnSMUywohdHOc8S/ZzGJEk/iJ+uryliMSVwnc6aXL7Lu+WQVPZ5
	 YprDCVqpXlhPTh5rU0oKk8GUaMaTXfT7w7xNSCt31brxkQ+vF8uyjQKD6ZAVBy3Jr7pXu
	 kiL7PY6sRRctiAr/9J/1NRODdhLxK6UaY7OYbkJI6xsRy7bBm8a+T4DKM9otBy6P8DE/x
	 wupG96Uu9f70vtUe9xGQCK8VVOnBFnVufO4jJycew2UubrdYnlX6gvWiADOHxQP7cCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697371;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iCeQ/db20QjGcTEZMmDdadaK9BiQoJcNEDJPAm9EXfU=;
	b=JszXzcigGwYRJGtOq2y61R0YSerzNEmb0UAimt8jRhZSQpy6+dqx0vFHh2puVv0SU+xS
	 lmsxWWvgqoMjNlAeS+oOpOiFyt+R+ThzCNyH1glPV9w3Mu4D017NHOZl5zOTGPAvPm1Ax
	 l2JJlgxNgDHsCZWkd7T+LI7cLU6J9aQl8gbtr9+5om9A/2rmwhXG1ajNcNao7SHZT+RR3
	 rMN+z0JihXNnaHc/x/zR2hQncvB0uf48ax3VNiyxAl36OCfkcfwMOcZ0+sV4/R8Z5wK5z
	 EHX9rtpK9WrFdQwZMH4AA5w2qNyaSIIz51+vTFnQvSSt225brcfkUng5OdMu1i+bPag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247E1606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:49:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 247E1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b4e2fcc300so61019747b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:49:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795697370; x=1796302170;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iCeQ/db20QjGcTEZMmDdadaK9BiQoJcNEDJPAm9EXfU=;
        b=cD2bdgTRUDixBev3Gh/+ASKbRgjbP7k1s2Cvr1z575tPj+UmKGTZGDWeiaZD9iopD7
         OttqJdmisIcGeZOGESOpUAXa97fwp3Sow4XrEgQ6bqhP0MnTxQg6BW/IL9WYtRcXnCmj
         ONZIkEOnd9Zx2hjlvN7o0D19iVf6dQ4PVmPPsz2TqWr37Q4hJtEMkoxBK7bgCFaUvkwX
         EtCjQFd6nbnU3TwhcMOLZbDnsy8Q6lAfcfjDJhUpm0qp4YWHa3cT5zzIYMkAY0vLLv7C
         lvIiSzNEboeMIVw5u/4RVgurZgIhfyIUoqR814G5SY444tFH0NCItuuwGSB0NQcbvvy0
         Xn3A==
X-Forwarded-Encrypted: i=1; AL+hErHEWZ98leOUa/ZG68UHrePExWVVZuxYUW5WpiHi64u1DXfAE8RhY2qo1Jc1QhXIvY+hbaxh52c+k/fr3V8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sKu0ueiTNHdasw67kdLqnIT08ezSp9Z6kySIgtqeIT2rPdVZE
	QScAO9EAfa/1V9fOlW3ESN+2X6gPTBAhD4AoHpaydEV3X/66Qj513AxmBcPEr94hYdg=
X-Gm-Gg: AZFdTZdisB5/eIi9orPnH4Vpz7Xvvx8DZzas8Oppal9LdEaJXICxWeqxwn9ffBXzFXV
	94/DhPN2Q2qPt4IYvpslrGWbWycwIx78l1q5pWPq6lqu+vBr7yEiWD14y3iyUridEAEXXsX6KKW
	aZFNOTLjT6nzoMrnlCUcN9X/eR1yaxvns8CWcFEWGs2mK8bQm8+iJYvRRBc7TrWBA6LDhSydOsH
	qVRpfFZMQAJJG9ARbhl0IXwpd6nOroqGCK599o4YLE6TIqv6hVDy0JFiWQRYLxB0IlkZUk5t283
	V6oUABtBH94VNgDRFqHhk+H5rSEI0dFy0i9U12ChU9pCo1ULbkDPsvHQXfj3leTwxBoKDSuCcFw
	IgO4XzVntU98XqIfELR3SgF6jOxoOorG+gJ0dUhSbT2b8akvSI7ZbG9LXHERknL8WsrSfYcdL1d
	zgSUHHGtazCv7hMdeTctqKuYYdr9mqBn+p1GEx/c7YRTQ5I3T/0KlA8E+qBJMO+4eta7mjK8RSR
	G3mFpXSSV6PeJxEldvbYBWywoJtCftIAT3k3o6n2zab5bsX3pOPoS+hPXT+xHkZtiLELGwOYu2x
	WgOQM8tvXISfJ0TsoO1TyDNm4BDDPOl09uS7BHd9LcVEnhzJAS2egXRe6/pDFFVKr18W9Nr/5kg
	+MCpEW8Fl4RZIchpk5yyKtv37NlwazXfzDQLUrKXSZIyjz2g0ZLn6Pw==
X-Received: by 2002:a05:690c:6d87:b0:8b4:fc2d:2fbc with SMTP id 00721157ae682-8b52043a8e0mr75931337b3.17.1795697370165;
        Thu, 26 Nov 2026 04:49:30 -0800 (PST)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com. [74.125.224.41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5202bef08sm85407707b3.20.2026.11.26.04.49.29
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 04:49:29 -0800 (PST)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67be4f2f4d4so8195906d50.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:49:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGZQHCVP0x0Q55MCVJ3n//n23n6ej8ch6Jg9XyJpC61kiZDLJZQkAZp3m0HUvK9oXTdu9Uk3pUuXGagQ6c=@vger.kernel.org
X-Received: by 2002:a05:690c:6c8d:b0:8b3:2d65:2c72 with SMTP id
 00721157ae682-8b52047a894mr79381047b3.42.1795697368796; Thu, 26 Nov 2026
 04:49:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121213102.143130-5-tanure@linux.com> <179561837863.3135.7453763060716815613@kernel.org>
In-Reply-To: <179561837863.3135.7453763060716815613@kernel.org>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Thu, 26 Nov 2026 12:49:17 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+3yLJbKUKh9ZqbJTm5QY+5jGedaST8aFJvHQvU6mu3oNg@mail.gmail.com>
X-Gm-Features: Aa3M54rVCY5vVqL26ka6o_i4OGggk-NPYkWlLazpuMdrAcDWKkBH6Cp6PaCVWDk
Message-ID: <CAJX_Q+3yLJbKUKh9ZqbJTm5QY+5jGedaST8aFJvHQvU6mu3oNg@mail.gmail.com>
Subject: Re: [PATCH v8 4/4] arm64: dts: amlogic: t7: khadas-vim4: enable the
 ethernet port
To: netdev-bot+sashiko@kernel.org
Cc: xianwei.zhao@amlogic.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, 
	khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, maxime.chevallier@bootlin.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 2:53=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The commit says it enables the Khadas VIM4 ethernet port.
>
> --
>
> arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port
>
> This patch enables the T7 ethernet MAC and the MDIO multiplexer on the
> Khadas VIM4. It also describes the RTL8211F RGMII PHY at address 1 on the
> external MDIO bus, with its interrupt on GPIOH_6. With phy-mode =3D
> "rgmii-id", the PHY adds both RGMII delays.
>
> > diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.=
dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> > index 0fa83362b4179..7b86ab2579aaa 100644
> > --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> > +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>
> [ ... ]
>
> > @@ -256,6 +257,28 @@ xtal: xtal-clk {
> >       };
> >  };
> >
> > +&ethmac {
> > +     status =3D "okay";
> > +     pinctrl-0 =3D <&eth_pins>, <&eth_rgmii_pins>;
> > +     pinctrl-names =3D "default";
> > +     phy-mode =3D "rgmii-id";
> > +     phy-handle =3D <&external_phy>;
> > +};
> > +
> > +&eth_phy {
> > +     status =3D "okay";
> > +};
>
> [Severity: Medium]
> Can any driver at this revision bind to the ethmac node this enables?

Yes. c4c851a3325e ("net: stmmac: dwmac-meson8b: add support for the
Amlogic T7"), in net-next since 2026-11-20, matches amlogic,t7-dwmac,
and 18029931478b documents it; the cover letter lists both. Tested on
this board on top of them: the PHY attaches at mdio_mux-0.0:01 and
iperf3 runs at 941/944 Mbit/s.

>
> The node in amlogic-t7.dtsi has:
>
> arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi:
>                 ethmac: ethernet@fdc00000 {
>                         compatible =3D "amlogic,t7-dwmac", "snps,dwmac-5.=
10a";
>
> The amlogic,t7-dwmac string appears only in amlogic-t7.dtsi. The Amlogic
> glue driver's match table, meson8b_dwmac_match[] in dwmac-meson8b.c, ends
> at g12a:
>
>         {
>                 .compatible =3D "amlogic,meson-g12a-dwmac",
>                 .data =3D &meson_g12a_dwmac_data,
>         },
>         { }
>
> dwmac_generic_match[] in dwmac-generic.c ends at snps,dwmac-4.10a, plus
> snps,dwmac and the snps,dwxgmac entries. Under drivers/, the only place
> that names snps,dwmac-5.10a is stmmac_gmac4_compats[] in
> stmmac_platform.c. That list detects the core version. It is not an
> of_match_table.
>
> If nothing probes ethmac, its mdio0 child bus is never registered. The
> eth_phy mux enabled just above binds through the amlogic,g12a-mdio-mux
> fallback and has mdio-parent-bus =3D <&mdio0>. So mdio_mux_init() would
> defer on every attempt:
>
> drivers/net/mdio/mdio-mux.c:mdio_mux_init() {
>     ...
>                 parent_bus =3D of_mdio_find_bus(parent_bus_node);
>                 if (!parent_bus) {
>                         ret_val =3D -EPROBE_DEFER;
>                         goto err_parent_bus;
>                 }
>     ...
> }
>
> Wouldn't that leave ext_mdio and external_phy unregistered, so that
> phy-handle never resolves?
>
> Also, nothing would program the PRG_ETH glue window, which is the second
> reg region at 0xfe024000. That window holds the RGMII mode select, the
> clkin0/clkin1 TX clock mux and the MAC-side delays.
>
> Nothing would claim the pipeline clock (CLKID_SYS_AMPIPE_ETH) either. The
> previous patch in the series, "arm64: dts: amlogic: t7: add the ethernet
> controller", says this gate is otherwise turned off as unused. It also
> says the port keeps the bootloader's delays unless the controller
> programs them.
>
> amlogic,meson-dwmac.yaml does not document amlogic,t7-dwmac, so
> dtbs_check would report the now-enabled node as undocumented.
>
> Does this patch depend on a separate glue driver and binding series? If
> so, could the commit message name that prerequisite, or could this patch
> be sent together with it?
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261121213102.143130-1-tanure%40linux.com
