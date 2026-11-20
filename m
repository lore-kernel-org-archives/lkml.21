Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795179200;
	b=vSUdC4ZMfYcIxPJNWqrrhhXzV7ub0dfnJQQ8m7TBQHTu3XYKhcZpLAMoK1BvTYSHSX8J
	 cyy2dv2oRJSq29AcVE0g1whCvKWEo6O9dG2cKCXH/jqRlFkVAU/iDCIFcrrub71S1vZC2
	 JYbYOCU9k/UBXokK2HM+QjNXDnFt+VpLY4doG9amG5ChCSEtS9PMOhiZ9+5NyXYnaKAn2
	 0Le4XDcCaYeQcKNFERdizyR2s1d24bNfi9yqAp1ObL9ycZDPd1t0yRwDA+pfb2dixKs7v
	 Y7CDe60awkEjdeprI6qV3ig4Ae5oDzfKMNifrKI3TZRuYtXUyzilKyBAlpORQPsOZMQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=ieYBoPMUvb4s/PCH+V30xJw7NXondGMmODLCCsted48=;
	b=f5Jbctz2UGnSvkilxRZT7WxU8tbx38zWS6tmoJ1dQ/xsayxTPkCb/vTVfvrIsXSWoMuA
	 oXXfC6W6agayeU2nD1TwxVZtHGjWDy4VjLLVMVHjwSHpII2gg6D3maF8vx9UGxjcgl3jN
	 oOOnYWn3fplk91P69P/WFP3Ea2iWsHzV0uXTDtiQKAxA5vnbHoNbqhVVo47pkfJw744qC
	 PzFGgYUFtL6u6/FrxiEy5qTNLYg+To5CgoZqNoykxmqJeaUra3F+DGdvcTD+kGiv9y/2B
	 DxIFFl/N4mW3leSi/S5QJ5VbXoDxgzDzteEK/NCR/A3r0Xx7/D1l2Raf0/kZeLOun4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=p+nwIxD+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5B860A2600
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E5B860A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=p+nwIxD+
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b10d24345dso7965057b3.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:53:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795179197; cv=none;
        d=google.com; s=arc-20260327;
        b=S0tUx2crbAY19Gwldlo/a01ItcaaNJUf/wU4WxT+N7dBzeQQCEiCX5DiOG10XxFpZW
         Hnr9LPpqgb+S+2c5S5460XeRRityM2/hzoF2bswXd16jooIqYyU83bW8HWGsG+hY9EAj
         rjJIA1hGClw4oJ5wARepRGPxRHjORR1LHsqDNrKBSqGG7gSqC/fPlLoOdXmm1LCvl0vm
         TRit0W+MFcDfaJ5T97j1Tn8AfcM2LFkMe2pozBg1d2TVt3VHMFOzRU4MxgbV6z9hcT97
         36qfl0J3LhYUw2sfIB575/sOZa9TQSzDn04hP1Pf+UEgZI1NPNwiXVAZv8abS3XP1ICK
         wzkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ieYBoPMUvb4s/PCH+V30xJw7NXondGMmODLCCsted48=;
        fh=SgBCHw6o63aB6sx8EpqqlstxBVXKCOVx+c8EOrXoGy0=;
        b=We268awVG37naewoz6PNFnTyFJMEVQ6k7OqJHqvCctx933LKsUbw1N/FXoTxFF0s4l
         KQUbPUBC5tx12RCzMg4zajdqsiTtuHvdtmLsMzHOSTCqUpnm/MY4/Gy+N2q45dsQRbl7
         +h5zroYRmgYmGKH4OaKnkazM8IuaIFDF8MCM2l3bLGWi7nmgyEsPcHXh8KW0BpkrEc3e
         uAUt6kpGWZFmRBIuFC/UJ3wxZm3oxr6s+tHe2wuUlOZl4TCwz+/0rGGFRDO/mksXNG+P
         jzcVDEHLXaJs9oKd9RKaNamHiCpR2SHkmimRHX7L3m12ylHUPHji2uxjLndIhuM9L5C5
         KZsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795179197; x=1795783997; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ieYBoPMUvb4s/PCH+V30xJw7NXondGMmODLCCsted48=;
        b=p+nwIxD+6yjLv1XlsJns5B4Ag+p0R2HUx9b44padqWJLRazJNgxsCKlVLlFVEP6dHS
         A6CyQLQvWj9Hxefmj+Z19165TNUbh1OBDvBpFGrFNdKP1EfQD2udDxQuIQrS1kWHpCZX
         Wu1hkW3yYg9WWYC9lZSc/VjK364nRomo1VAWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795179197; x=1795783997;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ieYBoPMUvb4s/PCH+V30xJw7NXondGMmODLCCsted48=;
        b=zhWc+KYgoql3w/FGmC+IUrSeEZbQbKxqSh565oKsNSo21oaFPdGMJNx38qhU8MKa5q
         jEepOtwGt8bFr+MFlAmoFfYASlmf9bhMTyW5AnmRGW2JAqVhpf28EcglCYA/zXhkBcc8
         wws8ds6zQK7cyM27hbMG1iPi8zLUEFomADEyW/mF7C+CeFKdxGvauQkVEOz4uvuxhnQW
         urm5DjB4WiNMsXLynb27hGWAPVWBJNaMoLuXDA8tkjyoa5IvEUmoWd9zlSxxZ01imL35
         ZDpSNj7TR/tHJn2txcmYiFvneJYDYPyLC/qP6WweRVOyN7vXkELEsKHdxNC0JBbSbDDA
         EWgw==
X-Gm-Message-State: APuU4Z8HfBw4bTVONOVyyAUMpB5ETCbip3LhbbSlmIGHvzd35zaapB90
	qg+qWtfqNOQqeIPAkxeX/BcMEjsPjySYdMKg9qSj6Bqsb2mhttYSZOabpljyMAEu4eYiiMXkjCc
	J11G5JWxuyfhcQ1d8R3Sa47vWRE48dQlfzg9PdQ5C6wxyeKwSfkuIqy4=
X-Gm-Gg: AZFdTZdkjGuqkwxjQfdEIFQJxfLDqjJXID12OTbyK/MnN6qh1wtgtOA6e/Dl/ZCcGEg
	w2II9LcUiB1VDAx1UIG9UnWvbJJYhhJSiOZ9yuhlq2/GekmKg/rUsTjx+e2NrlD745PrZb7Xdz2
	NPD7N5G0M+mi3OrsNgDSzJU6SD/0MP/tc5UI4YgWIWzS2gFfF426NM06f+/hihu8ufqPAIcsyI5
	jxW2APnWY5VxZMZhcP8XQ9WmdCxzpxka9LmROAaaLA9rhPP0B0EbxYw4ikxclsT1KxJUDSFOuZz
	IUSwpFGe01j76ex0HyuTbH+0eTxrnrkgr6erlmHbIQ14ArsWnrVe5p/S8B8MAZowX5iDGBbrTA6
	ayi3v0bFY9G7uva8kNLXfAR7/C44Y4LTX6fZ9HNqrOffOG9jSPK3wpF3qXh7n6KP2vAQ=
X-Received: by 2002:a05:690c:e3d2:b0:8b2:e0c3:1f4d with SMTP id
 00721157ae682-8b5204ab2a6mr13766787b3.37.1795179197354; Fri, 20 Nov 2026
 04:53:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 20 Nov 2026 13:53:06 +0100
X-Gm-Features: AclHuK9f8_4hj4WZI7U8R_PPW4mheeI6fjAZW22lb_dsLGyAMF1kCmKW69Uy0Cc
Message-ID: <CABGWkvoKQksL0vKOi2bLY5o3j998SzkAhdkkP4_ftySjbgqBrA@mail.gmail.com>
Subject: Re: [PATCH 0/5] arm64: support Engicam i.Core MX8M Plus FE C.TOUCH
 2.0 board
To: linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com, 
	Conor Dooley <conor+dt@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, Fabio Estevam <festevam@gmail.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, Hugo Villeneuve <hvilleneuve@dimonoff.com>, 
	Joseph Guo <qijian.guo@nxp.com>, Josua Mayer <josua@solid-run.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Markus Niebel <Markus.Niebel@ew.tq-group.com>, 
	Maud Spierings <maudspierings@gocontroll.com>, Mehmet Fide <mehmet.fide@screeningeagle.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Stefano Radaelli <stefano.r@variscite.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Frank,

Gentle ping on this series. Patch 2/5 has Krzysztof's Acked-by, and
the series still applies cleanly on next-20261119.

Thanks and regards,
Dario

On Fri, Oct 30, 2026 at 5:35=E2=80=AFPM Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:
>
> This series adds initial support for the Engicam i.Core MX8M Plus Fast
> Ethernet C.TOUCH 2.0 board, based on the i.Core MX8M Plus Fast Ethernet
> SoM.
>
> The support includes device tree descriptions for the SoM and for the
> C.TOUCH 2.0 carrier board, together with an overlay for the 10.1"
> LVDS display (C.TOUCH 2.0 10.1" Open Frame).
>
>
> Dario Binacchi (5):
>   arm64: dts: imx8mp-icore-mx8mp: enable the watchdog
>   dt-bindings: arm: fsl: support Engicam i.Core MX8M Plus FE C.TOUCH 2.0
>     board
>   arm64: dts: freescale: support Engicam i.Core MX8M Plus FE SoM
>   arm64: dts: freescale: support Engicam i.Core MX8M Plus FE C.TOUCH 2.0
>     board
>   arm64: dts: freescale: add Engicam C.TOUCH 2.0 LVDS display overlay
>
>  .../devicetree/bindings/arm/fsl.yaml          |   7 +
>  arch/arm64/boot/dts/freescale/Makefile        |   8 +
>  ...ctouch2-overlay-am-1280800w8tzqw-t00h.dtso |  53 ++++++
>  .../freescale/imx8mp-icore-mx8mp-ctouch2.dtsi | 166 ++++++++++++++++++
>  .../imx8mp-icore-mx8mp-fe-ctouch2.dts         |  17 ++
>  .../dts/freescale/imx8mp-icore-mx8mp-fe.dtsi  |  62 +++++++
>  .../dts/freescale/imx8mp-icore-mx8mp.dtsi     |  13 ++
>  7 files changed, 326 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctou=
ch2-overlay-am-1280800w8tzqw-t00h.dtso
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-ctou=
ch2.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-fe-c=
touch2.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-fe.d=
tsi
>
> ---
> base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
> branch: engicam-imx8mp-icore-fe-ctouch2
>
> --
> 2.43.0
>


--=20
Dario Binacchi
Senior Embedded Software Engineer
M. +39 328 0625246
dario.binacchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com
