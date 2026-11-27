Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795785673;
	b=Dou5qxVD8B4UV2hWTuaS5bH6dZibeMTSJ49qazz+asWKS9wpEz6mxbxq31k6dq+Y2yCk
	 981/N1xw6qtAOtU9J3LJQqItJIVQc2GCHVom4RRbqBhP6MrXorhUEqQCZQ7YwP+V0mp03
	 QzmkvpcignjmcJfEi1IXi0tTDtzR/h9Bxumuo3w2GV6FQTAtIwCimC85KTUSWcy+D74iD
	 o8TNjes5SP8VECnHvVxzTFnRNQk5fbbr1ry0u+wuoVyAuTaiG+0a8dCjO9dzVZ/6pe4D4
	 mxhzTW+aCKwY48aJlf7ToUA8HtyEXB2gbKrhw1xcjEfO+KNxHEr3xb8+qcyjbY9ksmg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785673;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vZvQHSZLsgr2GY03N9ewvKKm4RcNGFB1wwLAiy/rmRw=;
	b=ulSoeyjHpNTINzoaChTE43/QrwgOFeypmWu7mDQ46Do1HUgw86OniXaEl2Atoj4vvdxi
	 GSeTRiSJufvQ33SYkbCQOPQCLues8fyYWvzZLNdEAFPlz89ZTWLr+P6zl/fKPIPSwQi++
	 N6x2zdMetn/b8LWX1l3ejuCT6gYmajIrarmltO8b941ATpIvvbJf2mqNt9EE2ocrtdTF8
	 smxl9awfuYiCkufOqAb79+4jpC3vxfcokI09dPfb3TcUvVauDdHuPxigWGpXxvJxRR5PV
	 SPW+901zLYBS1jXB/QX6+U3SN1/33TrVRd+RNyIFM7OGqUQoVTpwP7BCsvaVtNhvY9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="HFQU6E/Q";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84312606A323
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84312606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HFQU6E/Q
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3869f03af6aso7158648eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:21:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795785673; cv=none;
        d=google.com; s=arc-20260327;
        b=BhxLtYCL4OIZ3Ne/KDpDTwqDv7v8HU5UGYQJ9QVoQdYpOcvXRsEMGTby/YnlmI1fyV
         um6cHydn/XisWis8W1Jr+hBDu4KltPxGrjLVZdApVML5TmvtSe25aL1W1IcwTgGcyvCY
         kluKeiG3t6Ols2nyvQ8FVzrDSBfuwTMN94Xzmx2FS7bFln50TmL5hdlGs6GgIWM+Xpwb
         zpqvbZLfwACxmJqy3+xqEO68KY84O92UUzF8TuARI2rx1A/OXYasrzOciuA4eLx3iShZ
         c2S92HWoD7CE/Ed5V/+Fio1W7kj8tH6BZhCaW4hQ0+UlQ8YTeAMXrOwOo/gA8RCahoWD
         bSQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vZvQHSZLsgr2GY03N9ewvKKm4RcNGFB1wwLAiy/rmRw=;
        fh=ZU5FOSyp5bQPg0xIfS2qHUnQ0SSFLD+ujbFN8SXjJsg=;
        b=cQntfiE3GpwqXesFYjX+FYb1Q52velaRCrrurrJj+Iv0XYf1Mplp4qppLEm023Xhyw
         ohg8pUW/9jr4kMzWBQ3z4UbSWSymn3PY0Mn6SlXHGvHermWe6Hj2r8ZjxkIkU4Z+sL91
         uiBCTZf+v9ljWXy20es427z6DymlOjDBbPRX5ighfl+zUFOx3VJInNS+ZEHPIF3jC7ua
         sNhZE4SOXcLA2EakwOewhHbycHjboZzsBGcZlC2Qu1BaTZ7w9nFL8UcOWX1R992z5rwI
         UXRJooyP1H6aNPW6y8n8UY0i4GDjoc0B+015z8gGiP8/m5orVVY6CwU2V71imVgYTgmG
         do3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795785673; x=1796390473; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vZvQHSZLsgr2GY03N9ewvKKm4RcNGFB1wwLAiy/rmRw=;
        b=HFQU6E/QtvmBDmwLiDq9kncfd3FKte+jfI7n3fsgpKrU+ujHcifftF3NYaZBdCJdQH
         OK4kfsInbBbGoAgA5CTZV9ia1gTMWToM4NqB4nSh0LHN2XxREa8Cpq4t1HMzC3+2IpSq
         9KNb8hGyxna/08v9lqKFbJ/Ya9M5uiUWpJWCMDpsjz0V5Rf8UShGJSXe3Ovb8nia8X7z
         7r/3tM9hVsGdixiM1KQHinV2Vb0N2Z+jSEgtZ0XOW+LRAjfUnn9rsT+3ObOWGFF0XhyM
         6zDHZwBMwDn0oWLBZFKhzd7/RLn5xFEX+Ynjn/ECjWoLdygu2nYmv2asT16ADGuXeg/Y
         3Lqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795785673; x=1796390473;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vZvQHSZLsgr2GY03N9ewvKKm4RcNGFB1wwLAiy/rmRw=;
        b=CfJE0np4UcaHRlVZ1blcjoVq5pR4+TqGbdMiufv5XQ+VDfvipMZkZ8TQg95OVRPjT3
         NtTQbVcJgd3KZqtWZfuzFn4HwZJYfetR/O4v0EaFM7LXuYz3kEPQVNUg58db+YhEmKhI
         WCOZYzd4xyvFj1PADU9qgt+KUX/4UU77iw6oNhqX/egZtZ2zj8xP2RV4xJPBdEmRsbGo
         LJR4uJNgwM7ntBdL4tMYG0wBNh0uEBNrunrzKBQJpaGUwwC3DHh0rqW+NCTVBYz0hSG9
         7h0xgwU+UdFJLwAuHH7DLY0sUIWnAICJBxxhVAdyWccxAaWQBdMe8+RXpTUt3Kdg+7Od
         4PkQ==
X-Forwarded-Encrypted: i=1; AL+hErFxW4wzoEBebXh0WcTE6FxXYvXxu/IJ4iaeKIXtBSV90w58u3yxkrRwq4Bq8scPzpUEqQJ5NAECExMBe2w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4nYG00b4AplBAV8toZIZSVU1tWy+loRnIFuppwqUWzG/Z2qdv
	tbBGsMfsUYqkzOjUpWvJ4+Z8Ud3DDhxS9Mz4GB6gifoZ2y3aRxfo6cNMIzqzxkmRXtPf2lmhPND
	FsUM72necZamLx9n1ouNCG2z1u7UM4h8=
X-Gm-Gg: AZFdTZfF+HEXr65GazAEN/ptt3nGBBRWPBda9xAO0gd6xGR6SNu1kFgeT6vvOOh5uiV
	Pf7SognSgixa39goxthO6DMYyzS2qo16EIHPqMELyu0sEEnn97PgjmmRO/I/SpHmrEYNtrYVeU6
	c3j1M2p9tBiyrqSqoVGNl6fyuTJvTdhtfarhQja76ypfXppSnJlfr3l46FoUywg5D646ehykzqb
	riz7vLcuY4nbYO4Gw/5sy/vFiQdCnFcsa2U1S0xVJ7OwQIt/UH7oXmxSb447u+RYY1b5hEghElE
	8twGGNwYff4HSxv9n0ySqFpQPi7pU4UlJE9+MukeBc2Oj5+DDeq0JNpnOvWJ2W4Gj6rkSpo1xnh
	g5vly8X/RMLDF+sUCFfysyNGWv20t1VHGWo5RRIwzhVF35kQMD1jHUpAPfAfZ0buhCmyB4SH68T
	+zvztWIxPo88qVOrFlM7Bov+OD0nrFEA==
X-Received: by 2002:a05:693c:6395:20b0:375:6fed:8e71 with SMTP id
 5a478bee46e88-384b3986edamr24820513eec.7.1795785672262; Fri, 27 Nov 2026
 05:21:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122081820.53199-1-clamor95@gmail.com> <XPGRUNopQCaIq1yDhISpSg@nvidia.com>
 <CAPVz0n3YEoq5dg4+sHfd74rT8x_R9DEv1eTzW7UHVKEABGa-BQ@mail.gmail.com> <QEeSnm4uTjq24quMQBzlfQ@nvidia.com>
In-Reply-To: <QEeSnm4uTjq24quMQBzlfQ@nvidia.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 27 Nov 2026 15:21:00 +0200
X-Gm-Features: Aa3M54q49lQTvJf3rTm0bm2TUGaSnY3ikhfCBwYj5e-cBK25rEq9w8C0KAb2mko
Message-ID: <CAPVz0n2xxEG5vR4X_dZeyQfN9TVSCBn+2uW1wY7Z+P3N8BhNqQ@mail.gmail.com>
Subject: Re: [PATCH v8 10/12] drm/tegra: rgb: Parameterize configuration based
 on bus flags
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 27 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 14:3=
5 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Friday, November 27, 2026 6:21=E2=80=AFPM Svyatoslav Ryhel wrote:
> > =D0=BF=D1=82, 27 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
08:22 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Sunday, November 22, 2026 5:18=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > > Parameterize configuration based on bus flags passed from the bridg=
e or
> > > > panel. The list of supported flags includes now pixel clock polarit=
y,
> > > > display enable (DE) polarity, and data alignment.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  drivers/gpu/drm/tegra/rgb.c | 39 +++++++++++++++++++++++++++++++++=
----
> > > >  1 file changed, 35 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rg=
b.c
> > > > index d48d498068ac8..faecd6f94359f 100644
> > > > --- a/drivers/gpu/drm/tegra/rgb.c
> > > > +++ b/drivers/gpu/drm/tegra/rgb.c
> > > > @@ -5,6 +5,7 @@
> > > >   */
> > > >
> > > >  #include <linux/clk.h>
> > > > +#include <linux/media-bus-format.h>
> > > >  #include <linux/of.h>
> > > >
> > > >  #include <drm/drm_atomic_helper.h>
> > > > @@ -106,6 +107,7 @@ static void tegra_rgb_encoder_enable(struct drm=
_encoder *encoder,
> > > >       struct tegra_output *output =3D encoder_to_output(encoder);
> > > >       struct tegra_rgb *rgb =3D to_rgb(output);
> > > >       struct drm_connector_state *conn_state;
> > > > +     struct drm_bridge_state *bridge_state;
> > > >       struct drm_crtc_state *crtc_state;
> > > >       struct drm_connector *connector;
> > > >       struct drm_display_mode *mode;
> > > > @@ -117,12 +119,21 @@ static void tegra_rgb_encoder_enable(struct d=
rm_encoder *encoder,
> > > >       crtc_state =3D drm_atomic_get_new_crtc_state(state, conn_stat=
e->crtc);
> > > >       mode =3D &crtc_state->adjusted_mode;
> > > >
> > > > +     /* Get but flags from the bridge state. */
> > >
> > > s/but/bus/
> > >
> > > > +     bridge_state =3D drm_atomic_get_new_bridge_state(state, outpu=
t->bridge);
> > > > +     if (bridge_state)
> > > > +             bus_flags =3D bridge_state->input_bus_cfg.flags;
> > > > +     else
> > > > +             bus_flags =3D DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
> > > > +                         DRM_BUS_FLAG_DE_HIGH |
> > > > +                         DRM_BUS_FLAG_DATA_MSB_TO_LSB;
> > > > +
> > > >       tegra_dc_write_regs(rgb->dc, rgb_enable, ARRAY_SIZE(rgb_enabl=
e));
> > > >
> > > >       value =3D DE_SELECT_ACTIVE | DE_CONTROL_NORMAL;
> > > >       tegra_dc_writel(rgb->dc, value, DC_DISP_DATA_ENABLE_OPTIONS);
> > > >
> > > > -     /* configure H- and V-sync signal polarities */
> > > > +     /* configure H- and V-sync and pixel clock signal polarities =
*/
> > > >       value =3D tegra_dc_readl(rgb->dc, DC_COM_PIN_OUTPUT_POLARITY(=
1));
> > > >
> > > >       if (mode->flags & DRM_MODE_FLAG_NHSYNC)
> > > > @@ -135,11 +146,31 @@ static void tegra_rgb_encoder_enable(struct d=
rm_encoder *encoder,
> > > >       else
> > > >               value &=3D ~LVS_OUTPUT_POLARITY_LOW;
> > > >
> > > > +     if (bus_flags & DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE)
> > > > +             value &=3D ~BIT(PIN_LSC0);
> > > > +     else
> > > > +             value |=3D BIT(PIN_LSC0);
> > >
> > > I think this is the wrong way around: SAMPLE_POSEDGE means that the
> > > pixel data is sampled on a rising edge. That is, it should be driven =
on
> > > the low edge so it's ready for sampling in time for the rising edge.
> > >
> > > LSC0_OUTPUT_POLARITY says that the value "LOW" (a bit confusingly, 1)
> > > corresponds to a data transition on the falling edge, i.e. sampling o=
n
> > > the rising edge.
> > >
> > > Section 31.9.6 states this a bit more clearly: "an active low pixel
> > > clock means that the data changes on the falling edge of the clock, t=
o
> > > be latched on the rising edge".
> > >
> >
> > DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE =3D DRM_BUS_FLAG_PIXDATA_DRIVE_NEGE=
DGE
> >
> > Should I replace with DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE?
>
> No -- with the current code, let's say
> DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE is set. I.e. the panel tells us that
> it will be sampling pixel data on the positive (rising) edge.
>
> LSC0_OUTPUT_POLARITY will be set to 0. The TRM documents the value 0 as
> "active high", and "means that rising edge coincides with data
> transition". That is, the display controller will change the output pin
> state to color data on the rising edge. So the SoC pins will change
> state at the rising edge, and the panel will sample at the rising edge.
>
> But the pins will take some time to take their new values, so this might
> not work or could be unreliable depending on all kinds of timing
> factors. So if the panel is sampling as the rising edge, the SoC should
> be driving the pins at the falling edge, that way there is time for the
> pins to settle before the panel samples them.
>
> So the value written to LSC0_OUTPUT_POLARITY should be the opposite of
> what it's now. If that breaks the panel, either it's reporting the
> incorrect DRM_BUS_FLAG_PIXDATA_SAMPLE_* value or something else is
> incorrect.
>

This may/will cause regressions across multiple panels and devices.

> >
> > > > +
> > > >       tegra_dc_writel(rgb->dc, value, DC_COM_PIN_OUTPUT_POLARITY(1)=
);
> > > >
> > > > -     /* XXX: parameterize? */
> > > > -     value =3D DISP_DATA_FORMAT_DF1P1C | DISP_ALIGNMENT_MSB |
> > > > -             DISP_ORDER_RED_BLUE;
> > > > +     /* configure DE signal polarities */
> > > > +     value =3D tegra_dc_readl(rgb->dc, DC_COM_PIN_OUTPUT_POLARITY(=
3));
> > > > +
> > > > +     if (bus_flags & DRM_BUS_FLAG_DE_LOW)
> > > > +             value |=3D BIT(PIN_LSPI);
> > > > +     else
> > > > +             value &=3D ~BIT(PIN_LSPI);
> > > > +
> > > > +     tegra_dc_writel(rgb->dc, value, DC_COM_PIN_OUTPUT_POLARITY(3)=
);
> > > > +
> > > > +     /* configure DATA order and alignment */
> > > > +     value =3D DISP_DATA_FORMAT_DF1P1C | DISP_ORDER_RED_BLUE;
> > > > +
> > > > +     if (bus_flags & DRM_BUS_FLAG_DATA_LSB_TO_MSB)
> > > > +             value |=3D DISP_ALIGNMENT_LSB;
> > > > +     else
> > > > +             value &=3D ~DISP_ALIGNMENT_LSB;
> > >
> > > DRM_BUS_FLAG_DATA_LSB_TO_MSB does not seem the correct thing to check
> > > here. According to the TRM, DISP_ALIGNMENT doesn't swap between LSB/M=
SB
> > > bit ordering in a classical way, instead:
> > >
> > >   // DISP_DATA_ALIGNMENT =3D 0 (MSB)
> > >   LD[23:0] =3D {R[1:0], G[1:0], B[1:0],
> > >               R[7:2], G[7:2], B[7:2]};
> > >
> > >   // DISP_DATA_ALIGNMENT =3D 1 (LSB)
> > >   LD[23:0] =3D {R[7:0], G[7:0], B[7:0]};
> > >
> > > I suppose MSB is more natural for 18-bit panels and LSB for 24-bit
> > > panels depending on the layout. So the correct value depends on how t=
he
> > > panel is wired to the SoC on the board. Hence, I think we should
> > > describe this with a new property in device tree under rgb/dbi or
> > > endpoint node. Something like 'nvidia,rgb888-wiring' for LSB? And
> > > document that this means the above kind of wiring - not all RGB888
> > > panels use it.
> > >
> >
> > Ugh, why is this so confusing...
> >
> > > > +
> > > >       tegra_dc_writel(rgb->dc, value, DC_DISP_DISP_INTERFACE_CONTRO=
L);
> > > >
> > > >       tegra_dc_commit(rgb->dc);
> > > > --
> > > > 2.53.0
> > > >
>
>
>
>
