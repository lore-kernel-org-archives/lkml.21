Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795695229;
	b=z1mUujpmUnYf/t3M4ggZe55w1YQkBNK/92qlxZcI+WNF6JmMpwONC6s93SYu3cpLXL/8
	 jCB3viWdqc6d+XV/KCcEKmj9ZikmkPe9MWnFal6EsayOf8dNjU0NPf/7F6qXY7RIvLUDV
	 YXyXmfs+J5pT20+ghGttcd3w/QezSj+sJoVMH0pHOMOHsSqZmWju0UHPfVOByhBnRjjRA
	 jYiuXA/1hiBztJ39fq8K/KMmqTNZALIR06GPObRqbTJs0qHBs5S8Oi+VBMM5hlj0D7xE1
	 48EOxVB60n9thVPj78krb4yyLKa2F8BewRwnE9JPjUTCIGm0Q0C/mZ5mdNWDWFSP1kQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8oQPuCvkPSk5AvgWx1uVWwUGY4FHBPq4s1ADy1aw6U4=;
	b=iiQgmtNlN0IXQnch/Twz4QAMbFqlrFzO20Puo9VKRoGRs1Ukhje1ZR3Hf3XUHEvMPFYA
	 pcNB7b2QJbl4eT166+M7PaYsRZIgM1gwk+WOxROqpxiNYa6+AVTmSzJM45Rqi3omVfQsx
	 5QeCFQNgwXQ9QtmNdxb/EBYOJQp5Fb+ehdX9zOZra1j8iCcZJkgUrvP8l/4vSSvGD0dNv
	 GPArtai1V0TF4ZOuSkVQ/PUWFWrAWXL2xPE3fc38ULHD56qUj+AOwIXqzv4r2ksJaxnL8
	 pYIwByehkb3n4ZWalRFSj1pr1OKTB0kQi3B+RK/G07cbfrFS/5wlOODgIneErjeGIag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OnTrh62B;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5A5606A6A1
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:13:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF5A5606A6A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OnTrh62B
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e09aa5264so4044324f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:13:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795695227; cv=none;
        d=google.com; s=arc-20260327;
        b=G0XxYsXdWyuJ2470OLc1csB2TN0P4xGfmBanvTD/TrkAOkP7enUYj9oLoklX11BbuC
         FXK3XGy4hFgDnnKdGyViZBd1hOvIOqk1mPXlVlOxqgYp4N1+jg58sZoy+Ce9by11H1UL
         GKZs5NVrudN+B0gSCnA2iTIsaq1A0vi1D7untfeKrb89DTCFILIewx1T3rixsF5At0ok
         KdnIrLhoVWdKddj+7P9vrVQ+IAPh3T6AMRjnnjqXzTtKJTJ8aA1lru1gBMrTLyTuZLr5
         fYYTrnCyngTt6jXF90jhtHyx60au74Njy0vI/wIbVks/4tm8a6fYwhoQ7jl0ZXZpVTWJ
         Ko1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8oQPuCvkPSk5AvgWx1uVWwUGY4FHBPq4s1ADy1aw6U4=;
        fh=mI+g1q+puGB5UtKdKT1X5j893nurd9HIm9hh49RtcfU=;
        b=lo9batf0lj/GD2i1rFzctKolexujF4hep1sF1hfL6i8qSbjRntc9auwqxxCpzJHjY/
         6MQPLnbO0pqeSXBOALdy91RkU11N8BAZHvtEtoEU54u5QdJpG9PL1Z0xE6RLoWj8qU0D
         d4qpYcnLx4E6DPNSQaZboJoMgkJWF2QTTeEQ7x/Z8HOI54KAzLJ8ZPyJZsGNuvBIXPy0
         GJdIxKGOvKUFGPJen8QaC83pbmLpE1HF8EpLVqUAs8MRQKiCEM2Pon0Qii4MgDmLKdE/
         aH8OxFkr1Qoae/YD/7gwFeJQDlD11SrJs8dZlbV6eTO484xe0GhcPdfJEmVGlm0Nwq+k
         t12w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795695227; x=1796300027; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8oQPuCvkPSk5AvgWx1uVWwUGY4FHBPq4s1ADy1aw6U4=;
        b=OnTrh62BErmlljhlpukUz7dfRdVPWlz9elGN1Cpqbny/F6/cIHqS6TRRPLJU36UtI0
         2lAneuhQjEImukoH/gIvi5std14Hg8LcaMmAIEQ2BaVDynDM93tIkxaRxRrBHZ/qVWXD
         GWuRs0rik2RSvxn0XidRhyLV/Tv1g7CT/XZEMiDvt1QfssEYdjd9mw9HEiNzQz6urGx9
         ItTNFxmqQwDux8YDHHcj4nD8qO3pGUU3ifos8fFtPn580DyTaVVxoJngQO8sBD+472+J
         YlShpSQZvDoTlUcDK4sy06iW9YigluSeMQFBpFH5FFASXTAKQIgBjZT60G3rPyK1d8KD
         oEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795695227; x=1796300027;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8oQPuCvkPSk5AvgWx1uVWwUGY4FHBPq4s1ADy1aw6U4=;
        b=U8Vw0NNXNgxZBvL2UiD2CmugPXzOMHLnUkdIqgMC7GwiO3Zvd1L1G2VsDWBU6XZATl
         zWWavNU6be7eI5r/c697wvxWUSj0ZLxmlzQpzEFaS5G/ykQ0w5BUD2EBf8PUn9/5XhYn
         7qVev6OpNJuJ/ibOLbmOcWFM1nzgP5C3GGSFz/FbC9HPCi3lAXgjRh159X5nzNWUSRGh
         1WPNaCF2ikYdBQut2C8XMW72JKHOp+6PMnTqrSpSZ7zOtkVnt+oeu8U2tH+eLmyzpllH
         SG1S6g7h2PcGXQcuKoKXK3kFL9i3jDub6ltjqwfP6wu4BqhcLnlwADgt7VR2UWmkKo2l
         Vi7A==
X-Forwarded-Encrypted: i=1; AL+hErG8b5w+lPqErwaIsRPIp2ZetbZnxKTpNu7FsA8Nj3Etd9z2iOjg16nyIkkqTietmKOMjpuHGL/k5nulLJM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vzGyRTqehOOLUWsByR5e1KSV66CfS68RVf3BjRxvyLSYGnROT
	2eeVrxrZb58OSpG9If5cSftU53SUrY5gc6vqrQ8oTG9jAcO8mKVFbeYbFpYkWCGt/YfevCZAUyM
	TQrKcStF2JVXGiSzrHlo7j+r+ATTfEaU=
X-Gm-Gg: AZFdTZco3h/QXZaLEc3iGpQ/SAXvceyGce96bo9kwAy2hdbfKlPAdBW40TSpQlB7HYL
	AS7w2u5jVZvW3zijzBxst7kW1OR7w3+W8o1X1PLxSSfRNynMHCwdE2AxoVpmPB+JVS3BBAPPBWO
	gvgn8zrILIKuiazuPa3jMXEp+sFCFheKNzX2PVQ0K7UbiqpRDAvyaCku2EnMjkfb/5v2SgVtdb4
	D+Hq4v0XLidaW2clydZQYNmlikyFTnmStrHLNzsUzLbP3c1ud4eyKasdhO3d3IVvBTR780ZgR3C
	a5EHmWeMy5Zwur1S36gQ4hMBgoo1NVrL8dsIKfpISkExmgxQG8cUid25pl6aU5BVdzUFanUt03d
	vvX0vaFI7hwRO5R0VhgzhFW34mW1PgbZKju1Hp85R6FliC4aZrr3zbdpltwv/rnIqteICYi9eum
	uIniIzoKAGfNt0gBvIVS/i9tZ2k0aC1djZLYq2RNIj6TW7qAoFj2Yiu2fuBg==
X-Received: by 2002:a05:600c:6219:b0:4bb:60b1:4409 with SMTP id
 5b1f17b1804b1-4bb88816525mr406462305e9.19.1795695226899; Thu, 26 Nov 2026
 04:13:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102104907.16007-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20261102104907.16007-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 26 Nov 2026 12:13:20 +0000
X-Gm-Features: Aa3M54o554CBQDS46Q5cL_QVod_O_1ZDWVlLVSBjQ9SBzaVxWUHV8HeeuRLzrP0
Message-ID: <CA+V-a8s-GdrW_d1OY42awLqBapVY1LpKbpq_u8ZvGmij_Mnzug@mail.gmail.com>
Subject: Re: [PATCH v3] phy: renesas: rcar-gen3-usb2: Keep OTG VBUS disabled
 until role is known
To: Vinod Koul <vkoul@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Manivannan Sadhasivam <mani@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 10:49=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> On OTG channels of SoCs without ADP control, the VBUS regulator is
> acquired with devm_regulator_get_exclusive() and its output is switched
> by rcar_gen3_enable_vbus_ctrl() using regulator_hardware_enable() once
> the port role is known.
>
> The helper acquiring the regulator has the following problems:
>
> - The internal regulator is unconditionally enabled at probe, so VBUS
>   is driven before the port role is known. If the port is connected to
>   an external host this can back-power it.
>
> - regulator_get_exclusive() hands the consumer an enable reference if
>   the regulator is already enabled, for example by the bootloader. The
>   unconditional regulator_enable() then takes a second reference while
>   only one is released on unbind, leaving the regulator enabled and
>   triggering the WARN_ON() in _regulator_put().
>
> Fix this by making sure the driver always holds exactly one reference
> to the regulator: reuse the reference handed over by the exclusive get
> if the regulator is already enabled, and call regulator_enable()
> otherwise. Register the disable action in both cases, then turn off the
> physical VBUS output with regulator_hardware_enable() until the port
> role is established. Enabling a disabled regulator to take the
> reference may briefly drive VBUS during probe; this cannot be avoided
> with the regulator API.
>
> Rename the regulator helper to reflect that it acquires the regulator
> without directly enabling its physical VBUS output.
>
> Fixes: b6d7dd157763 ("phy: renesas: rcar-gen3-usb2: Add regulator for OTG=
 VBUS control")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.co=
m>
> ---
> v2->v3:
> - Added Fixes tag
> - Added Reviewed-by and Tested-by tags
>
> v1->v2:
> - regulator_enable() is only called if the regulator is not already enabl=
ed,
>   ensuring exactly one reference is held.
> - Dropped enable parameter from the function
> - Renamed function rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable=
()
>   to rcar_gen3_phy_usb2_vbus_regulator_get_exclusive()
> - Updated commit message
> ---
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 35 +++++++++++++++++-------
>  1 file changed, 25 insertions(+), 10 deletions(-)
>
Gentle ping.

Cheers,
Prabhakar

> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renes=
as/phy-rcar-gen3-usb2.c
> index b5ba751805aa..3481505dea2e 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -1114,8 +1114,7 @@ static void rcar_gen3_phy_usb2_vbus_disable_action(=
void *data)
>         regulator_disable(vbus);
>  }
>
> -static int rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(struct=
 rcar_gen3_chan *channel,
> -                                                                 bool en=
able)
> +static int rcar_gen3_phy_usb2_vbus_regulator_get_exclusive(struct rcar_g=
en3_chan *channel)
>  {
>         struct device *dev =3D channel->dev;
>         int ret;
> @@ -1133,17 +1132,35 @@ static int rcar_gen3_phy_usb2_vbus_regulator_get_=
exclusive_enable(struct rcar_ge
>                 return 0;
>         }
>
> -       if (enable) {
> +       ret =3D regulator_is_enabled(channel->vbus);
> +       if (ret < 0)
> +               return ret;
> +
> +       if (!ret) {
>                 ret =3D regulator_enable(channel->vbus);
>                 if (ret)
>                         return ret;
>         }
>
> -       if (regulator_is_enabled(channel->vbus))
> -               return devm_add_action_or_reset(dev, rcar_gen3_phy_usb2_v=
bus_disable_action,
> -                                               channel->vbus);
> +       /*
> +        * An exclusive get of an enabled regulator already holds a refer=
ence, so
> +        * add a cleanup action to disable it when the device is released=
.
> +        */
> +       ret =3D devm_add_action_or_reset(dev, rcar_gen3_phy_usb2_vbus_dis=
able_action,
> +                                      channel->vbus);
> +       if (ret)
> +               return ret;
>
> -       return 0;
> +       /*
> +        * The regulator is enabled only so that the regulator core holds=
 a
> +        * reference to it. Do not drive VBUS until the port's role is kn=
own;
> +        * rcar_gen3_enable_vbus_ctrl() switches it from then on.
> +        *
> +        * The VBUS regulator used on these SoCs implement the .enable/.d=
isable
> +        * ops, so regulator_hardware_enable() cannot fail with -EOPNOTSU=
PP here
> +        * and no special handling for it is needed.
> +        */
> +       return regulator_hardware_enable(channel->vbus, false);
>  }
>
>  static int rcar_gen3_phy_usb2_vbus_regulator_register(struct rcar_gen3_c=
han *channel)
> @@ -1151,7 +1168,6 @@ static int rcar_gen3_phy_usb2_vbus_regulator_regist=
er(struct rcar_gen3_chan *cha
>         struct device *dev =3D channel->dev;
>         struct regulator_config rcfg =3D { .dev =3D dev, };
>         struct regulator_dev *rdev;
> -       bool enable =3D false;
>
>         rcfg.of_node =3D of_get_available_child_by_name(dev->of_node,
>                                                       "vbus-regulator");
> @@ -1165,10 +1181,9 @@ static int rcar_gen3_phy_usb2_vbus_regulator_regis=
ter(struct rcar_gen3_chan *cha
>                                              "Failed to create vbus-regul=
ator\n");
>
>                 channel->otg_internal_reg =3D true;
> -               enable =3D true;
>         }
>
> -       return rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(cha=
nnel, enable);
> +       return rcar_gen3_phy_usb2_vbus_regulator_get_exclusive(channel);
>  }
>
>  static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
> --
> 2.56.0
>
