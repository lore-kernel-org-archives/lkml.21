Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795665412;
	b=B/15P9QFZJpCaS5frVu42wXGnJ/5cZbciUq5xQhHFlwmeWolskytpwq/vMbp/idtckec
	 UzzxyQql0FNT7cmzyqAficDIi9gjqFKOJRrZ2xCWCkMLPrIPRK/da/l8/jxH/4K2y/4+x
	 XtWTBNMbgZfHznJOODcPPUps5jd55Spo3fBFYGVQNel0rhVG4lBl8GsQFH4pPUm+HJkjN
	 t1liNcbPwoSYU76GQjqoR8L3bXgjMcyd+QmyImmxn1/L/XPk4jsuGwB3t0WOJRAgXH4O8
	 KwncroJWBxn44LNU58BZuC9qJtrInVSuGXarPSy8V/ocg2d0NVtz4GvGWhsEgQoPUPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795665412;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pnrWDLI+bbkoF+uspFaAef/gof/CKGiguNODNOS4GpA=;
	b=0cv4Dir6KP3qIiuTSANKSjGt2zfkHQkfk+nNIDVDz3/RZXf2HXGWdqfQXnE+CnLZ9C9S
	 F8uF5mR+6O114PBsEntCfx7kWgq3MwpqeNZrAxjhnRd61jGJe3RtZSCM5Cxkmm4fwggkY
	 SG6lVb5kvNC6bOlLdeqCkyKzfdQxig5T2N3keTvyHAFqsz0BpOB10V4GFNSNpBWID47FX
	 Bv8+1Qqt8wEGTX4g4fNFCM6ZydLT2LCLIerqN2pJnhm8scyjtNXg5wDMI1PX7oartd3jr
	 ZhfYtPerLJMxlTiiOY3pfmpZ982rHyqhlt86/1BGZG9t0znmWu6qzDU6qIBHTVuGNtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EnFf2oIl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A41C606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EnFf2oIl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5B931F000C4
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795665411;
	bh=pnrWDLI+bbkoF+uspFaAef/gof/CKGiguNODNOS4GpA=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=EnFf2oIl25F5fuGyrN92NOgPL6kqIB+PTByRBEV3aAZf8ZfJ957KgMf5KK6PsD4Cw
	 zflo82yjh57GWQAKBN0zQJ3ijLHDRdSpLs34Ypubezx1+kdfXAnPIjT0MRca7B7nRb
	 +rO8mpQb/bCxW8CFA+2Lx5rEVRmyJz4YfrOrnc0k250Cwzd7xVTkbCMd+ipqAGmsNt
	 HlHRpxSdtd7AvpLEw2SfBrHhhWw9nPCLZOm8brr6044aErj4rTR4DdBOsdGnfIIcmV
	 dO3wocrkyfGT62CpwOxOuAHNl9X/82Ppq3JVVcDI5bXUE7TCNERLHEGOfW+aVa5yvh
	 KoGaWgq/V1/8w==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3ae85add4dcso44244191fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:56:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE6ugprxPGgyj7NZTZnEFiHpt2lB+2yq80Y6YGYe85tzgI57xFuVhVJ5jSIL5XGLoSkM1vPgLrci6dmgi8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JctvB420d8IAO+MSKIUwnS/0yp4h2ePJZOfCARpinw4N3OFp+
	gb7Mxy+Dl9fPIZ6P46H7XFcM+nS9IlgY3wKT6j914yebJDXvifVqO1OUtEYFleSh4MEQS3r5ogG
	3Yyc/8NruQV+0HsyKvIVGOIgjsgE1Jn0=
X-Received: by 2002:a05:651c:a1aa:b0:3ab:3af4:c2d8 with SMTP id
 38308e7fff4ca-3ae7fa71a15mr56174711fa.28.1795665409967; Wed, 25 Nov 2026
 19:56:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-a733-clk-v7-7-db7c5451ffa2@pigmoral.tech> <20261125115320.3692954-1-alastair@d-silva.org>
In-Reply-To: <20261125115320.3692954-1-alastair@d-silva.org>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 26 Nov 2026 12:56:37 +0900
X-Gmail-Original-Message-ID: <CAGb2v644kMOCbLGVNB0HRFmoaQcD3qbhKY9G5FVE46O=2td12g@mail.gmail.com>
X-Gm-Features: Aa3M54rpP-Zn9FFry4pu5XjBTgRTyOiIwDPt_8N8tX1t-bsfN3kUc7IF24g0SfQ
Message-ID: <CAGb2v644kMOCbLGVNB0HRFmoaQcD3qbhKY9G5FVE46O=2td12g@mail.gmail.com>
Subject: Re: [PATCH v7 7/8] clk: sunxi-ng: a733: Add bus clock gates
To: "Alastair D'Silva" <alastair@d-silva.org>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>, linux-clk@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>, 
	Enzo Adriano <enzo.adriano.code@gmail.com>, Norman Herms <dockseed@proton.me>, 
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 9:02=E2=80=AFPM Alastair D'Silva <alastair@d-silva.=
org> wrote:
>
> Hi Junhui,
>
> On Thu, 12 Nov 2026, Junhui Liu wrote:
> > static SUNXI_CCU_GATE_HWS(ahb_msi_lite0_clk, "ahb-msi-lite0", ahb_hws,
> >                         0x5c0, BIT(16), 0);
> > ...
> > static SUNXI_CCU_GATE_HWS(mbus_msi_lite0_clk, "mbus-msi-lite0", mbus_hw=
s,
> >                         0x5e0, BIT(29), 0);
>
> While bringing up GMAC0 on the OrangePi 4 Pro with this v7 CCU series,
> link-up and DMA broke as soon as clk_disable_unused() ran.
>
> ahb-msi-lite0 (0x5c0, BIT(16)) and mbus-msi-lite0 (0x5e0, BIT(29)) gate
> the shared MSI-Lite0 bus fabric used by GMAC0 and other masters, whereas
> bus-msi-lite0 is only its register configuration clock. Referencing
> ahb-msi-lite0 and mbus-msi-lite0 only in gmac0 does not model the
> shared fabric, and gating them off breaks GMAC0 DMA.
>
> Could you please mark ahb_msi_lite0_clk and mbus_msi_lite0_clk with
> CLK_IS_CRITICAL, matching ahb_store_clk and mbus_store_clk in this
> driver?

The patches have been merged. Please send a fix on top.

If in doubt, you can always check linux-next for patches you are tracking.

> Tested on OrangePi 4 Pro (Allwinner A733).
>
> Thanks,
> Alastair
>
