Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697335;
	b=bmGAxN+JXm7NycMBNvvoN4peqUqqi2eB9mc+ig/RFhNf4puMiEddwS7wvEUFtAvWtmJh
	 M6qxUdeMDuRS63KZ9F1KjY99szZ+Sy8nuUOr9kKZlh+OayGewg+wnZdU+fJNWcv1dgVUk
	 wJRmhmY7FY6yrk0tL58Q4CKBZNfoc212SmbryiBwL+aZqpemG+Tt/1eldr4/+jtosQS1w
	 buMbqGhDjYgEr86Ev6jgc6VuSNoFJ8/8Xzrz9zFHw9k8KPZ+Mqzx22WNKkAj+8tHXL4WL
	 NRLpVk0mopUZKOMtxKLKow2E7ZOZDVynt+L5RENN1UV69S+Mdp4vH0xuHILJ6+ShIAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697335;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=REOzMMTPDLDlLUvCKX/dzO9sL/SNpW9z3fgnSLvxTe4=;
	b=CGncmgrxiPoWI2EGi90Vj3DdQ++ma7d4fPyqISvRqaiQhNF+a5J5CfHWRcmi+qVintsG
	 e9ppn3QLy3b7KORwiIqJ7BXmV/5f3eVof0TB79hFGnz58AUvUJbgtaOpkWM1WK61L9RXV
	 e3yNjbvEv+siiyqUDRnClpHmvlibMHsR9FIZVAVjR5mNL4XFLicvcBM3w1O/J952M7YAU
	 EPLbUdgYIMyMd9KK7Ley/znnSrTNkJ1nUnYcR0n5NT7b4nP5lcZbGCc9ir9+RBkGTQsLg
	 cmzvjEmIr6hYRfCnQJ55RqAsrufjwLhX8ckpJTbasSuYLQd3uYcAmQJOns+DoLBSJBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52ABC606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:48:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52ABC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b0d126f631so61007087b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:48:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795697334; x=1796302134;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=REOzMMTPDLDlLUvCKX/dzO9sL/SNpW9z3fgnSLvxTe4=;
        b=HiRHDH56X+dG3JQ4O4Rx0oltDwDXiBr4q5O5nQJIQQIxAKEiQioZ7DpCCbJGrw77TJ
         o2BobvKAHeQuZl6fgmoqRPpAymezkqQ+69Ebx9m4zv6hIeMeG6bWB/nFVNEXCQKZBaNO
         KjZNnbHfUrOUcITKg3VXzLtRm42mK2XLm4OrntCCLShHyPT5QWDSChrslKDD65aBC2aT
         UUngSnr4k3NAWiUSW3ypHPGGlwiG9ei5MemIaXE54LZCGMCz4rctYTVf0fWLZJj2bf4C
         YUeHYjtf/tRYMs+4YCQAmhdy120GMFc6B6frLRvfb4vvaokGqb3Asnj5m9/5Q8y6irPI
         SFbw==
X-Forwarded-Encrypted: i=1; AL+hErFnSjGja7dUeo5POrWcJhsW1QOFIh1qJQoyZHk+XmNaQqZY7cqIhG0B9baVQcTH2RDYnoMwxLbeBduwG0s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9L5pVNVjW8DViK9kVilf2Zm+4O9gRfvbHHxCAg80qgY8C9YTgj
	TGlhrA96CDIPvbNJiXfiIRhcbKt1iaUDUxXVq0zvh95n8bVboO8fYXa8kJexwE8maaM=
X-Gm-Gg: AZFdTZe/4A0378B7nS1SmXVIUNyuDHmIt8o7WYl6p3BUZFXss9taVu949V2HH6xe4rm
	4TfySh7C11Lw3RNTsIwe2yLlZamULz0Eek2TenFCblxh+ax+HMaI5NQaFmTMUuUsNaGtwNynSU/
	cuGoZ2Oa4BpnnbDRd4O6Qvt/VyKlV1wrTJAqminpunQr7kr2CUZXQTHL84ztgvNsG3aJxLcOEy+
	WV+80lBb0OYL+JKeQ/9ZIfn1PXkn98ZgTi7sfHD082waGBrrmK2utIQtke1fTarJQQG8EhCQqX7
	BCwKPMULTRypuB9V7SS/g+cFcOgxHsKsHdlyFYnz+P4T0o2Z8z5OZ/n5BDHzdJllSj+QNFMX0P6
	5twavpNPjtFqqE8DGkSi2OKKZtu0QosujvzrxQ/MEZujVdJa+JIeyF1s4wnWVBO2s+BPZ+PWeRJ
	YqlthsDTp2CUDVJ5hZiQzRse19tExnRdFTdpOseoFSVbb5zQQvwFFQbWGrpvTSBmYRWI8kjA1bw
	XMsHGN61NMGgSkzDH9AvKSvLqNLpNs0jvQIobJKuZBZjFj1fv7/GWHnmYRsvABm5q7GZBRmMrVy
	AKE8NmufOP6Fyh/uKAcfqPnjbkWwloj/NYQJ12oWrZMIZMRos9rL9O+vsNt7dZ4DYQ6bFUvt2+N
	l+rn08UjgxDSg2GvQ3YLiP+xNSfTm9l57QXxfT4aQ5mtmlkMSjD2JHrz94A==
X-Received: by 2002:a05:690c:3607:b0:8b3:2d9f:e5fd with SMTP id 00721157ae682-8b52046138amr84284897b3.27.1795697334322;
        Thu, 26 Nov 2026 04:48:54 -0800 (PST)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5202d7769sm84918957b3.25.2026.11.26.04.48.52
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 04:48:52 -0800 (PST)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b4efdc8c20so42546797b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:48:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF46JGFWNjBzhW6d+6zjvAJXnejXnnIn6BnzNE89xBExVwn9K0i9R4Q0UrPiq92DZ5isker7nmkGz6vTDc=@vger.kernel.org
X-Received: by 2002:a05:690c:c15:b0:8b3:27b8:2bd2 with SMTP id
 00721157ae682-8b52042f569mr88911427b3.10.1795697331984; Thu, 26 Nov 2026
 04:48:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121213102.143130-4-tanure@linux.com> <179561837659.3135.6655031502321722558@kernel.org>
In-Reply-To: <179561837659.3135.6655031502321722558@kernel.org>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Thu, 26 Nov 2026 12:48:41 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+0MtVhPHAW_DSHJQMXSPgtJ=H1mKqGSR_09UOqAkgLexQ@mail.gmail.com>
X-Gm-Features: Aa3M54pUuxKwHlhmSM8ws03XH7rNC1f2K4BBc-Hnx_WBDraHYgmAijaXPXLQFsA
Message-ID: <CAJX_Q+0MtVhPHAW_DSHJQMXSPgtJ=H1mKqGSR_09UOqAkgLexQ@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] arm64: dts: amlogic: t7: add the ethernet controller
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
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 2 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] No driver or binding in the tree accepts the new ethmac node's
>   compatible pair, "amlogic,t7-dwmac" + "snps,dwmac-5.10a".

They are in net-next since 2026-11-20, from v7 of this series:
18029931478b ("dt-bindings: net: add amlogic,t7-dwmac") documents the
compatible pair and the five clocks, and c4c851a3325e ("net: stmmac:
dwmac-meson8b: add support for the Amlogic T7") matches
amlogic,t7-dwmac. The cover letter lists all four commits. This
device tree patch goes through the Amlogic tree.

> - [High] The commit message names two problems and claims this patch
>   handles them: 1.

Same commits: the driver claims the pipeline clock with
devm_clk_get_enabled(), and the stmmac core takes "pclk" in
stmmac_probe_config_dt() and enables it in stmmac_bus_clks_config().
Once the MAC probes, the node holds both clocks; the multiplexer's own
reference to pclk is no longer the only one.

> - [Medium] The T7 MAC is declared as "snps,dwmac-5.10a".

It is a 5.10a core. The A311D2 datasheet (section 14.3) says so, the
version register at 0x110 reads 0x1251 on the VIM4 (User ID 0x12,
Synopsys ID 0x51, printed by stmmac at probe), and the GMAC4/5 DMA
and descriptor layout moves 941/944 Mbit/s with no error. The S4 node
describes another SoC.

pw-bot: cr

>
> --
>
> arm64: dts: amlogic: t7: add the ethernet controller
>
> This patch adds the T7 Synopsys MAC node, its PRG_ETH glue registers, and
> a g12a-compatible MDIO multiplexer to amlogic-t7.dtsi. The multiplexer
> also gets an internal PHY bus. The MAC, the multiplexer and the internal
> PHY bus are all disabled by default.
>
> > diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/b=
oot/dts/amlogic/amlogic-t7.dtsi
> > index 7bd53ec166071..eb7f46c98b0b4 100644
> > --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> > +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> > @@ -250,6 +250,31 @@ gic: interrupt-controller@fff01000 {
> >                       interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8)=
 | IRQ_TYPE_LEVEL_HIGH)>;
> >               };
> >
> > +             ethmac: ethernet@fdc00000 {
> > +                     compatible =3D "amlogic,t7-dwmac", "snps,dwmac-5.=
10a";
>
> [Severity: High]
> Which driver is expected to bind this node? I can't find anything in the
> tree that accepts either compatible string.
>
> meson8b_dwmac_match[] in drivers/net/ethernet/stmicro/stmmac/dwmac-meson8=
b.c
> lists only the meson8b, meson8m2, meson-gxbb, meson-axg and meson-g12a
> compatibles. This node has no G12A or AXG fallback.
>
> dwmac_generic_match[] in dwmac-generic.c stops at snps,dwmac-4.10a. The
> only use of "snps,dwmac-5.10a" is the stmmac_gmac4_compats[]
> feature-detection list in stmmac_platform.c. That list is only consulted
> after some driver has already bound.
>
> The later patch "arm64: dts: amlogic: t7: khadas-vim4: enable the
> ethernet port" sets ethmac and eth_phy to okay. Wouldn't the board then
> end up without ethernet?
>
> meson8b_init_rgmii_delays(), set_phy_mode() and meson8b_init_prg_eth()
> only run from meson8b_dwmac_probe(). So the PRG_ETH registers at
> 0xfe024000 keep the bootloader's interface mode and delays.
>
> The stmmac MDIO bus for mdio0 is never registered either. That makes
> g12a_mdio_mux_probe()->mdio_mux_init() on mdio-parent-bus =3D <&mdio0>
> return -EPROBE_DEFER forever.
>
> The node also looks like it fails dtbs_check against
> amlogic,meson-dwmac.yaml:
>
> - select has no T7 string.
> - The fallback contains list only allows snps,dwmac-3.70a or snps,dwmac.
> - clock-names is fixed to stmmaceth/clkin0/clkin1/timing-adjustment.
>
> The commit message says the multiplexer "probes after the controller has
> programmed them" and that "unless the controller holds that clock, the
> writes are lost". No driver in the tree does that for this node, and this
> series only adds a T7 binding for the MDIO mux.
>
> Is there a dt-bindings patch and a driver match patch that this depends
> on and should mention?
>
> [Severity: Medium]
> Is snps,dwmac-5.10a the right IP version for this MAC? The string is in
> stmmac_gmac4_compats[], so stmmac would drive the core with the GMAC4/5
> register map and descriptor format.
>
> The S4 node in meson-s4.dtsi seems to describe the same block. It has:
>
> - the MAC at 0xfdc00000 and the glue at 0xfe024000
> - macirq on GIC_SPI 74
> - the same rx and tx fifo depths
> - an ETH power domain
> - a g12a-compatible mux at apb+0x28000
>
> But it declares the core as 3.70a:
>
>         compatible =3D "amlogic,meson-axg-dwmac",
>                      "snps,dwmac-3.70a",
>                      "snps,dwmac";
>
> If the T7 core is also 3.70a, then once a driver binds, stmmac would read
> the version register at the wrong offset. It would also use the wrong DMA
> and descriptor layout.
>
> Could the version be checked against the hardware version register (0x20
> on 3.x, 0x110 on 4.x and later) and stated in the commit message?
>
> > +                     reg =3D <0x0 0xfdc00000 0x0 0x10000>,
> > +                           <0x0 0xfe024000 0x0 0x8>;
> > +                     interrupts =3D <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
> > +                     interrupt-names =3D "macirq";
> > +                     clocks =3D <&clkc_periphs CLKID_SYS_ETH>,
> > +                              <&scmi_clk CLKID_FCLK_DIV2>,
> > +                              <&mpll CLKID_MPLL2>,
> > +                              <&clkc_periphs CLKID_SYS_AMPIPE_ETH>,
> > +                              <&clkc_periphs CLKID_SYS_ETHPHY>;
> > +                     clock-names =3D "stmmaceth", "clkin0", "clkin1", =
"pipeline",
> > +                                   "pclk";
>
> [Severity: High]
> The commit message says the pipeline gate "is switched off as unused",
> and that the controller has to hold the clock it shares with the glue
> registers. Does listing these two clocks here keep either of them
> enabled?
>
> Nothing under drivers/net requests a "pipeline" clock:
>
> - stmmac_probe_config_dt() only gets stmmaceth, pclk and ptp_ref.
> - meson8b_dwmac_probe() only gets "timing-adjustment", plus clkin0 and
>   clkin1 as mux parents.
>
> The only "pipeline" consumer in the tree is meson-gx-mmc.c, and it claims
> the clock explicitly with devm_clk_get_enabled().
>
> Also, t7_sys_ampipe_eth is declared without CLK_IGNORE_UNUSED:
>
> drivers/clk/meson/t7-peripherals.c:
> static T7_SYS_PCLK(sys_ampipe_eth,      SYS_CLK_EN0_REG0, 20,   0);
>
> Even after a T7 entry is added to dwmac-meson8b, wouldn't
> clk_disable_unused still gate CLKID_SYS_AMPIPE_ETH? That would cut the
> MAC's DMA path to memory.
>
> For CLKID_SYS_ETHPHY, the mux is the only holder until a MAC driver binds
> this node:
>
> drivers/net/mdio/mdio-mux-meson-g12a.c:g12a_mdio_mux_probe() {
>     ...
>         pclk =3D devm_clk_get_enabled(dev, "pclk");
>     ...
> }
>
> That reference is dropped whenever the mux probe defers or fails. This
> looks like the same ordering hazard the commit message says it closes.
>
> The five-entry clock-names list also doesn't match
> amlogic,meson-dwmac.yaml. That schema allows at most four entries, with
> index 3 being timing-adjustment.
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261121213102.143130-1-tanure%40linux.com
