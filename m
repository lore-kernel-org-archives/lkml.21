Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795451065;
	b=5hkA5CwIKVu6avkBut1rxYD94JMLvM7g/qGwFWMkjJGXiepRN6aXhwJyzeKdKRASaWla
	 w/G90D7UVk395YoLPQs5rcDp9dHQBT1U4UJa+oUJaJAgyHOn9KOto2ZwassvpyjyQ/cQg
	 BD/blfZ/++UrFX9VSN+l9Ou8QKKHFlTzrQPuBjjgXoUhXcQpF4LxzNu7TZiMofQrJcGmt
	 u0V6apsCa2MWjxG8YE5GZbcyRXb7kf6TPqWUozuprP/VNlh+jzeN0+0GXoz1nHRdn+vQ6
	 AoE90MnCcrKpEcRQ13HmfqrNmFgKdzgCpQO288/izWNwyaBrGYenTIvat6ERMRbs3Jg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795451065;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CNJ5tMPn49GAcvDTSuAR0rimcoVMJYlaC808t8jK4Ww=;
	b=FEi6G9LEm3PhSSHB0NvmLyIpUc0MwIu+sdTuVixHKsGj37O1p4M1wHHnGPIxFSYpiNr8
	 sT1iJPD7qN6C/XszgA8d41uSdJaEU18O/CkAglbSPr2VeLYYpqoq5M8jQ//syDVnyadKY
	 BFILaelF2+cGHXPkGCX1xIb5M/K9bnZI95lS1ifsf28g44H5rIO8/T8iGk/y8Q5jkQ88x
	 ThKMMshu9e7ZENupTMaRAVa2YIiCcfcfvVei5EdiuXonHMT/O7m84WKcSsALbHOLenbN2
	 AuORg/K8cP4i/UV/kZUIrQHMCKXCB23MALIvMir+9wQ9jWKYckGcgthuj25VZnCJGgw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kGG61wye;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77951606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:24:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77951606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kGG61wye
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso501690966b.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:24:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795451064; cv=none;
        d=google.com; s=arc-20260327;
        b=nkSVdxmXfMwpsvudOmvhyb4ilpPjDCIf3ibFPuFtqyaMZhp1TKPpOuVlnoZ0HxTrwV
         quji4+8Kxv4ebaM4vt8cXjvA073ztoRylQTPkLicX0Nh4tkBQPU7bKYOq7ZLyDtKofSY
         7nEbqdR9bbilqD/bWz6m5ffHUeQEWBOxga28zj9/iZLbxrVJKIJkochYGhaSmbHJUMzV
         CJhGXBF1hwfDLwAct0vFSj/ibM3Gvtwr5Ajc3OYMujalpJCvWp9rlAZLEhHa9mOPpqN1
         NNixyJzXrNU0MbSspsy9jJmDTA8zwxsY4z/eVg3Vyj2ZC3KTml3xE6fAC+h1PAamcvWS
         AG/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CNJ5tMPn49GAcvDTSuAR0rimcoVMJYlaC808t8jK4Ww=;
        fh=d83K41p4P3U8B8KrDvm1KJkBY9ODTCiiVNU6xJbH50E=;
        b=CrQJDQSL45xZYYK6fPYnAIva79ha1ZXaUdb5FdRI6QM6wV7xAmM2pbxZwrwtC72x+s
         BJkxruZrWkT0ncZaSJhdBA9yqEezunQ0+8uxupA+ZZ/uc6d4RFxrQBgvAKQRqVdfo+hS
         NkM9YG3lz601qpA+sykaazyV9WF0dRTYbTfHp32GB8xfUTiAQaGL7pb0ofxOp/qVPPel
         yDt1t5jz1EfzZC6MAOcEJ9GaYWiZQXY9+WR9koWcl8br/9hED32aL4TKef4yBc7mlKdG
         HluddGBdNQGzqimrkFYUnKhczW//2t8JhlmZl72C4/FE3h6UUXUtKWSNba7d8OdV6QB+
         fxOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795451064; x=1796055864; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CNJ5tMPn49GAcvDTSuAR0rimcoVMJYlaC808t8jK4Ww=;
        b=kGG61wye3HV3NP7BQ17KP5dlch87le463+NAUdJ0Azg5wUYimKiAXVX7T+vAKgW4n4
         USmVJ6ccq1JiCOBFkF238YbF4N9Al3OehytGod9mVZIrZDCu8bHXwPxRDjfQgB/x1z4S
         dG37hmDbqD1JMdGkG1LnHRi44iWi199K6o3DAbckMhYBQRRZb2X7RzPY1yIFuQ2nrFL+
         xwLWYkuR8i2t4oLid/D0xml/jOJL9hY+et8bBtzEkPqj9JXq1XxiW3yn4r+SFuAmmJfe
         thBHf/UcvioFJlCVfIwSXNxW6mzt9E7sOVMxo03V5lZZZh/KAq2Dfgx06TI7XBA0z2Zw
         G++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795451064; x=1796055864;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CNJ5tMPn49GAcvDTSuAR0rimcoVMJYlaC808t8jK4Ww=;
        b=V/IPq9LPQZqnmQNXslfcMYkw2EDlhWNZqax2LYuScZWcIGwFtIs+kxp8pYPl7l1lrn
         1zvLaYjueYK5W/Y1rgwm0zW9o3i3Yd7gHLtEq2IhT3T/GDGnX4sRkVTCN6efAWV9eUOL
         aIfUih8A+KPHJt7ruJOPaf2J36LTuRsEjp2vKkvLIyXlKxf8Tm93/qJ0kA5KZRsZ8Y4H
         9zdsCd9ljXoOXsEb6SOEDREjLUo/T4zJQU6M6HxNZds3L9Y+AK3DLF6s4ciWWpAVaqyx
         fO/F/K6LNu6KdljoHQC81dY7N74sm6VVzRPPHmuF7LFKzeBjs9dcD4itEeyhQ9stRKSY
         RjrA==
X-Forwarded-Encrypted: i=1; AL+hErHzK0ZsVjB5opJSsduAMoJ8O7p4rAe40+u86jBNNNBqnEIY0kuPyhyYUJn/pt5jJY2qucPUAjQBAL4LJk0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gu4EixCVsnfyHUlF0WN26q/td8/odP5EAfuXQYoxHDOzgJ/T5
	bJqC/RNcQX4gwkKB08bompseCBBPUsP/zH0a5PYZgVw1Hl/a0cbQElgjc9hgLTFufemYowXfIEo
	NqAnZHFLCJBav0RxpmoZWswW7Uif6l8k=
X-Gm-Gg: AZFdTZckChhldtDfizIzT5PoBS1xPOpXlkBhUJAgsgP9H6ukAIySDVsAi+41nBARQ3o
	HDjEiylKGHp+52KsPLAN7SldDKHknnmw+Cx9br/DkZ1Bgp199gsr+DhskdPREWzCLkTYCRCSbAa
	wDLhTD02qUach59ecbNRussCT1x9O5aM77TTGq6PT6hF4d8+qCUV9LbIWrW70ijQTd4UtqLx2e0
	DU4OfGYXWh9CaElDi9veVsnd2UW11eCJmxMS4lobD60d1Ntvx+XydBSNJJGWX8YlaOBI8XLjDqv
	/TH4s/v0slkxTSwm7CvFeDTFvQdwmR8IwKwES5WPYRMdpcZFJp5yb1miz4vruSKSqdvNbjPqh4R
	/JsP65FxLOtdmmwWfoK/xhxRN4VlkPBxufIth/Q==
X-Received: by 2002:a17:906:231a:b0:c42:4750:8d49 with SMTP id
 a640c23a62f3a-c513aad2400mr684425566b.25.1795451063824; Mon, 23 Nov 2026
 08:24:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122131900.2951586-4-a.shimko.dev@gmail.com> <179543998366.3135.8537500779592480863@kernel.org>
In-Reply-To: <179543998366.3135.8537500779592480863@kernel.org>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Mon, 23 Nov 2026 19:24:12 +0300
X-Gm-Features: Aa3M54pFMGCEqfrknuxTm9QQEvcIIV5arWsj3tZLkp59n888HFnWQSHbf7MxHro
Message-ID: <CAOPX747Whtrpa-aP=AhtaFfqMpqHHYVMJ7jNZWCdgmMc1_GYag@mail.gmail.com>
Subject: Re: [PATCH net-next v4 3/3] net: phy: dap8211r: add PHY LED control support
To: netdev-bot+sashiko@kernel.org
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	maxime.chevallier@bootlin.com, pavel@ucw.cz, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-leds@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 4:19=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] In drivers/net/phy/dap8211r.c, dap8211r_led_hw_control_get()
>   (lines 312-351) does not undo what dap8211r_led_hw_control_set()=E2=80=
=A6
> - [Low] dap8211r_led_hw_control_set() in drivers/net/phy/dap8211r.c first
>   clears FORCE_EN(index) in LED_COMCON (0xA00B) with=E2=80=A6
>
> --
>
> net: phy: dap8211r: add PHY LED control support
>
> This adds PHY LED support for the three LEDs on the DAP8211R. It adds a
> dap8211r_write_ext() helper for indirect extended register writes. It als=
o
> implements the led_brightness_set, led_hw_is_supported, led_hw_control_se=
t
> and led_hw_control_get callbacks, using force mode for brightness and the
> LED_x_CON registers for hardware triggers.
>
> > diff --git a/drivers/net/phy/dap8211r.c b/drivers/net/phy/dap8211r.c
> > index 1fe20efd394d7..b0fb3cf89b55a 100644
> > --- a/drivers/net/phy/dap8211r.c
> > +++ b/drivers/net/phy/dap8211r.c
>
> [ ... ]
>
> > +static int dap8211r_led_hw_control_set(struct phy_device *phydev, u8 i=
ndex, unsigned long rules)
> > +{
> > +     u16 led_mode =3D 0, led_reg;
> > +     int ret;
> > +
> > +     switch (index) {
> > +     case DAP8211R_LED_ID_0 ... DAP8211R_LED_ID_2:
> > +             led_reg =3D DAP8211R_LED_0_CON + index;
> > +             break;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +
> > +     ret =3D dap8211r_modify_ext(phydev, DAP8211R_LED_COMCON, DAP8211R=
_LED_FORCE_EN(index), 0);
> > +     if (ret)
> > +             return ret;
>
> [Severity: Low]
>
> Force mode is cleared in LED_COMCON here, but the new rules are only
> written to LED_x_CON later by a separate dap8211r_write_ext() call. Each
> helper takes and drops the MDIO bus lock on its own. In between, won't th=
e
> LED follow whatever LED_x_CON held before (power-on, bootloader, or
> previous trigger rules)?
>
> If the final dap8211r_write_ext() fails, the function returns an error bu=
t
> leaves force mode off and the stale rules active. set_baseline_state() in
> drivers/leds/trigger/ledtrig-netdev.c ignores the return value:
>
>     led_cdev->hw_control_set(led_cdev, trigger_data->mode);
>
> so the trigger would assume the new mode is in effect.
>
> Would it work to write LED_x_CON first and clear FORCE_EN afterwards? The
> rule register has no visible effect while force mode is on.

Agreed. mxl86110_led_hw_control_set() does exactly this. I'll reorder the c=
alls
in dap8211r_led_hw_control_set() the same way in v5,

> [Severity: Medium]
>
> Does dap8211r_led_hw_control_get() return the same rules that
> dap8211r_led_hw_control_set() writes? I see three mismatches.
>
> First, hw_control_set() turns TRIGGER_NETDEV_LINK into LINK_10 | LINK_100=
 |
> LINK_1000. This function only reports the three speed bits and never
> reports TRIGGER_NETDEV_LINK.

i'll add it, thanks

> Second, hw_control_set() always sets DAP8211R_LED_ACT_BLINK along with
> TX/RX, but bit 13 is never checked here. The kernel-doc on hw_control_set=
()
> says the LED does not blink on traffic without ACT_BLINK unless another
> rule is active. A register with TX/RX set, ACT_BLINK clear and no
> link/duplex bit would still be reported as tx/rx offload.

i.e., if ACT_BLINK =3D=3D 0 but txrx are active (by some reason), then
-EOPNOTSUPP should be
returned, because the register state does not correspond to an
operational state. Oh, that's
important i think. Yes, it should be fixed.

> Third, any other LED_x_CON bits are silently ignored, and 0 is returned
> anyway.
>

ok

> rtl8211f_led_hw_control_get() in the realtek driver reports
> TRIGGER_NETDEV_LINK when all three speed bits are set. Could the same
> approach be used here?

Yes, i think so

--
Best regards,
artem

pw-bot: cr
