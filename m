Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795714550;
	b=ANedqy8Xy8au5iGsXT+g1kX2Jg/TJIXZA4Uhix6fNPKYWQpmOTPbdjX1V3TMKY1b1X71
	 qTzi3rEnNCR34cN7ZMrWQ4n+O4NZA/t0VK5p47KI554HWordzNyiGw+hf2aw+eBpJAR+n
	 hUX7bLNOwgdV1V9UFv9fxdJWT5o9Y/aiegY/z+miOuhrUGxSuhhml30Bi1gZ5FL8k8rja
	 5FEOYi9nVSY2QpLmuS7mQBC2G5tZ2j8zgUZRJKZ0zJ47e42FPsaUVRZL0OBV9Gg92Cov1
	 IC+Yd0CzKsdSpV4A7eky7l6fXSZC+vPpfcM2u5EaAfNNogskVc+JRAq2du/mrwGWc0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795714550;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=qX7hQvpKRLbWPJiO5CVxnjE3ZLRTJ3WKFWSTYSfxc60=;
	b=zDrRZTaFYxVTUjORPnPLin4Vbq6LKcGxQ3uH6UvCuh8ebPkJMenypeIBt6ff1bi7PYnm
	 7G5TYw9AgcBzlG2XEGIr7o67+BwsRiQZOfA7RAR9wG8+HIVSGdOw4nfD3Cj5hs3Dv0ayB
	 pvWoeFrjaKDOO/pmsELirVoWiujIJtCiGNVZHBBxMUb2mv2mAbeTSKUqh4s7T9aiLbBbD
	 UQDHyh8Gp4r8UXvAi3bd/O1at3mIdS9j8azqxwnobY6LJaK8s5oopxstsRvkvIA/Sh71c
	 WBL3AXdBbC3qDa66C6WQ27+ab/fXelXtftlje4a0YscXZCwIZnghHCfKUiEZ5RdB70g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rg7Orkih;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82534606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:35:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82534606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rg7Orkih
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-491846221ffso6355550f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795714549; x=1796319349; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qX7hQvpKRLbWPJiO5CVxnjE3ZLRTJ3WKFWSTYSfxc60=;
        b=Rg7OrkihCTmGhc1xxci3wg7S960TTY5WDen6YEsgW1kwGkE67xsLRVBHU59R/yhBBa
         ycxd9vHKhZY/23vf8rHlwRn7DDoPx9zsYIMVS0KFKxVO3yOZ+SZHpO1osBAs/SpIUXkQ
         sDy9QS8ktqh7zqIwsV9FCSxT/33h8poIH+JqjKk7QO2M7SXxiKPWcVCyANJHhxcZQjU6
         /cDMoPjfmPAC3C7rS/m5Ws8Y8QldZj+6sbex5z/FhVIA4OGhEigDEMbq5UOHeFBDy/Es
         oVtASoMf4ASkX3byclT135IpeI5S2UOP0d8UmbxOlSc7VNq6S2uotMmRd8DCMp8WXI87
         0+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795714549; x=1796319349;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qX7hQvpKRLbWPJiO5CVxnjE3ZLRTJ3WKFWSTYSfxc60=;
        b=rTmsmN6YkDXUwUk6kJAxmsHPXt5ZBzs1PW0aGUhwtfwkhUoBdwmpBlHrVImSpSMTSM
         pEhGirVIjK3cNUwux8BTJmnqzVYG9sZ4XQlOzKyTzQK/hepfxogf2GnHGV23eNCqMPLj
         IDGy3bhEErf84ve95zqoqKb28OC2eaD0izGne7SSaLf9RyT69UGee92E4uudVGoJlVGO
         hGhnmg9Slb3kP9qBK1Q5ddpGfFwrHeJRmT4+NQ5Whlzh8j6ceG5qhXGKsxwFiZXaIoVn
         t6W8GLalLjsy1Ia+KexnxKeh3fWY9sY+BwNfHpDeKPRWKN5v2BrohO+sE2UpUX46pcsG
         2kwg==
X-Forwarded-Encrypted: i=1; AL+hErEf2/GXOpMBnOcUEmIXQuHUroMzxecw8SRNSn5qRCpqnAZ7wjowvuXSJJmOouMBi4oBmkvpSQMqGhOxOSY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wFIe5qgGQGj5na30xVmvL9+hq9ycDTjWSl6Eyb/tI6K8yldF2
	+TY7ajM6XfL6m+JLWRZDMzwCjwWGUEQ843elgJt0M1cp/Vui8wHd65gG
X-Gm-Gg: AZFdTZcWuLyeaMMG+5XSBho/A/LSQJL815OXS79jRDJARmAz2jOfvB4I1IaABBUetZa
	TGrmbmTVIJmCQ0v16OOQqdsnZjLlVTP0b91SeMJSTZWj1PF+R7X5xGijXFTOpy8Om79OXxmTqhI
	zx73/vQ9hYupuboyCYx4RvQ1EcSIbGuRPMwWxSCWWuML+0+FIKDNYKGzst3eSKtulBgu0KR4s/a
	NfTBBuEDU+zp6vvcDeMaSQW7Tyvll+bTRQxX7Mg4N/2WxrphoP/6X2V3PvpVQN1ScNXBtpUwRbr
	J0MQTirH8fmi6KCZBcYCzmH6KzbUkzYH9K4TXIvDH3chS4HMMo6HeGAjLTfuKHihlV13Ge8dZjW
	e0PngEasVJqlwMMlLKj6BlffqYzr4ZZl7GnWf1ceFWv2oe7nhe8bpCLyPxlsZOe5e0PfH4/Edbp
	Uh5lcITouMZGHJTUrTg28R82tIJFMifSpBN4vC6OQnQTEM1ncsYxJ0Npc07ZlwfBBaimCxvpzC6
	qX7h8xkoOo988do0ZvdlhJH5rJ4tbpBzf9aQxivj8fowUCHosSwZR6kMwarrcE74doUgYlh+uDH
	1McSXUcTCnQT8bUKSAOQOqumhQEqDWirifL7lCY+oC7f0OjIfg35zvT8luFsli27Dx8cwiszDLr
	NrvZqYua55rHRVMwsH3sE4mmsGFAY7FjuAUUY49gb2f/9pH0LcTS8QPpPrr6lGtFcvg3nNDpY2J
	6Q7/M3w8hu40tuVzSw0Nql5Qcpbe9ATABTQOuYrK3un3N6OkBFBxO9ezHFQRXoeW8A1+xqSaEna
	3BFd7bu4FKpD7PWPtf7vizImUmnUVvLL9oCxvd7MWdQr889BTExNCCHJCmTov2RJ33UiaXxbxPi
	I3K4oF5w
X-Received: by 2002:a05:600c:4f84:b0:4bb:8701:a2df with SMTP id 5b1f17b1804b1-4bb88809950mr448141145e9.17.1795714548844;
        Thu, 26 Nov 2026 09:35:48 -0800 (PST)
Received: from jernej-laptop.localnet (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90655f5asm397758825e9.1.2026.11.26.09.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 09:35:48 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Alastair D'Silva <alastair@d-silva.org>,
 Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: linux-gpio@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] pinctrl: sunxi: Drop unused parameter from sunxi_grp_config_reg()
Date: Thu, 26 Nov 2026 18:35:47 +0100
Message-ID: <AalbXD-rTNOJWAc97z7puQ@gmail.com>
In-Reply-To: <0defdc40-a96c-4df3-aadf-3c3db3c48b7d@arm.com>
References:
 <20261126104954.441427-1-alastair@d-silva.org>
 <0defdc40-a96c-4df3-aadf-3c3db3c48b7d@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 26. november 2026 ob 13:02:59 Srednjeevropski standardni =
=C4=8Das je Andre Przywara napisal(a):
> Hi,
>=20
> On 11/26/26 11:49, Alastair D'Silva wrote:
> > sunxi_grp_config_reg() takes a pctl parameter that is never used.
> > Drop it to match the original signature.
>=20
> Ah yeah, looks like a development artefact. It's indeed not needed, so=20
> changing it back to where it was makes complete sense.
>=20
> > Fixes: 8b367fc08be4 ("pinctrl: sunxi: refactor IRQ register accessors")
> > Assisted-by: LLM

This tag is deprecated and should be dropped in all patches.

Best regards,
Jernej

> > Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
>=20
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
>=20
> Cheers,
> Andre
>=20
> > ---
> >   drivers/pinctrl/sunxi/pinctrl-sunxi.c | 5 ++---
> >   drivers/pinctrl/sunxi/pinctrl-sunxi.h | 3 +--
> >   2 files changed, 3 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/su=
nxi/pinctrl-sunxi.c
> > index bf4ec4665e2b..d30a562315aa 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > @@ -763,10 +763,9 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct su=
nxi_pinctrl *pctl,
> >   		else
> >   			val =3D 0xD; /* 3.3V */
> >  =20
> > -		reg =3D readl(pctl->membase + sunxi_grp_config_reg(pctl, pin));
> > +		reg =3D readl(pctl->membase + sunxi_grp_config_reg(pin));
> >   		reg &=3D ~IO_BIAS_MASK;
> > -		writel(reg | val, pctl->membase +
> > -		       sunxi_grp_config_reg(pctl, pin));
> > +		writel(reg | val, pctl->membase + sunxi_grp_config_reg(pin));
> >   		return 0;
> >   	case BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV:
> >   		inverted =3D true;
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/su=
nxi/pinctrl-sunxi.h
> > index 7c2f29e75519..3060cef3705d 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> > @@ -328,8 +328,7 @@ static inline u32 sunxi_irq_status_offset(u16 irq)
> >   	return irq_num * IRQ_STATUS_IRQ_BITS;
> >   }
> >  =20
> > -static inline u32 sunxi_grp_config_reg(const struct sunxi_pinctrl *pct=
l,
> > -				       u16 pin)
> > +static inline u32 sunxi_grp_config_reg(u16 pin)
> >   {
> >   	u8 bank =3D pin / PINS_PER_BANK;
> >  =20
>=20
>=20




