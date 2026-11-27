Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795771315;
	b=AwLysH4ZdOx6uID4vmttHEAAzz8xFVdeIxrgVUJ9qXiAN99v2P4asEDFA4Oy22/ud+K9
	 WSMj61VD3ghGAa00QFQHoOYM80aP0W3nb6xF7chgNX2lm7ItzIzbFp73FE5gQP88zsWxH
	 tw3KMN4bBImMh/cTlQJ5djaVgmOZo+eCOedjhOug0ZgM2NLMk1lkqvu0i3FgzKBRxHyiG
	 rPHUIMuTB1E/ZYPVKjUALKTnwt8S7NQZsHWlOAb/ZBYgQBa+anbQkRqHzN1PzzW9a5tG2
	 T/s013+qntWxox687YqYRdren13+ZZH7zbgcIz6VPlzsRp3VPtmAyJdy1505jUiIPCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771315;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=htV1Nze1V9TPe9ypwx86PJUFfDuF+mF97F+ZRWmyzZw=;
	b=GIVpQMVjpgFI3ZTqRXjFZoX41ABfK8ph1PhrK+DXPnnRlcqG+CYnfvcp+Ea8wdSdnE06
	 LXxTnCBxNbKAhDgLFHnIJSJBN737Qg5Z8Eztf06qmrfQ9qG3QkiM2SH20w9b5NfZ9YCXo
	 VAkyQsIlrWWf7PddwZSUsrEklzZuolCAaV6tbMPwNTNxlNcY9uK4SQZQ+pib7KHNgrkKH
	 tYH6SfFrKUcBFISG/fYkZIxxn9Xafdzl+oQq3JdU8NkQNm5trrHEGqBGJOFHMyZo/65L6
	 pUzlTW3CtD2wU79eY1JgFPKwA4j8okl4J/AI2GjO9KfD+XOTm6U3PNMuF6RxxMMihJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Db4rXmoK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB6C606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FB6C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Db4rXmoK
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-380c28f9e35so8763151eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:21:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795771314; cv=none;
        d=google.com; s=arc-20260327;
        b=oQniVaLVpYJxPoYbMzg5cfBp6BMecN4GmD+7HoiUydkHrd6mCSbf8Cyz4eOH2YtMx3
         dAnN59Qua4usTt0LNraZx8tliP6yv2VfvsAklcwb6H9B0P4Vyou/fvk8n2NtZkGQf8GJ
         zOuciH2zzCHJqS+Frk+cinpT7A4KYt7y64mYjx72MUCL+ekLVmSgVWeSIzKZqaaGopDS
         g/xd5Eovzy46wF3EIuCEGsPnuhszs0uMmEzrSy8J6KYFh8rExuV+jz2KLG+1h+WcwgZW
         M2n6B+1thwAOFRBfbcxmi0xqJVs/inV2fn/oxjWuiALDYIGX0BEfbJ0cw1EIAX+cznPA
         vkMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=htV1Nze1V9TPe9ypwx86PJUFfDuF+mF97F+ZRWmyzZw=;
        fh=bmtN/PnKiCCpfzv5d8MYqARhVztmo3u9mH9mqYj4A9g=;
        b=OWxSmLxw0SiBfOSEk56/SvC0lqN1d7TzUNwg28U/+mX1Krd7w8w/s8DeGb83Z8iAKG
         6f6wzOY0tPl6Vic8XplyBsUrH39PYLRhSWFpCpWbq33h9rScSVQ1dz5xAzepSxVJ3egE
         OGOd6s9fLcdH+PPsW6wvDcJ3Tvfzn15VVeJvURoOzLhqBCDdkL5VLMNBkUY6IASjvb0+
         PrbGEK1RlUR3eExWgZ6vlq6S4LdiBzNBgXsjdSDWrT6deuuYauV2OTfUcVvtP2myC+S+
         vT/WZ1wGKIJVWHWE4joqeltB5dwlMFrnauVhzXLwaVXCGDfnDVHQUrLh9D2weHodU7H6
         Q+jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795771314; x=1796376114; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=htV1Nze1V9TPe9ypwx86PJUFfDuF+mF97F+ZRWmyzZw=;
        b=Db4rXmoKZRcliDEDP8BIj49W67I5o1jlMhpiIMdBYulpofHZDKjqiALfNz7rvLeeyP
         TN4FKyPxCi1lEK5eWxGzaKTw/O0PcYG2PsGeweSc68Sf/jVStA9qIZ5z2QQmCTyXS8Zy
         CsgAc5PBfBOtDOY+iY6aHufIATlpMVKdc71RzvmsTdkmsNeJt3Q//K87qDiwAMH1knJw
         kW/EWLSVRLVAIda84zt7gHAByzyPB9ewmaFYCUTPusqiKH0R+MnEkSecPs29oRa3mPvz
         H6TcVgsm7r1VyvF3rb4eU3zXSeIZtSTdcuSaoBPasNuQvQwTla+TY8hteC6RC+dBYvce
         k2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771314; x=1796376114;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=htV1Nze1V9TPe9ypwx86PJUFfDuF+mF97F+ZRWmyzZw=;
        b=XfM6zxFV/xt+lBkxacTp1CJ5gXFLlqZqNUVC3e1VnQ8hjPn2l5GxpKiK/l7FMDfM4w
         gIjf2sEVjkl5gT/MnBoC5CAGeNBW9iDynIOmWJA4IVD2rJc+i7nDXVJA3smV5dwForTn
         oq1xzE+AWgXNDNvbC+h5mPwAbz1tJtASDzriegw6VlvxvlaKoxmrytIytSysaQBwGKwj
         e6N3LNJfFpqflvF0s0LgSIcsbpbnYtMFYiJw14VonvpFemRyRFmAHYLnWyLPztfo5dFV
         PCrOnheg2zSXbLZgfhuu5GkiU93jjOSviW0aHFGQ81nNO94PBCw0hQ4IKVKFM9ObK2Th
         Isxw==
X-Forwarded-Encrypted: i=1; AL+hErF8ayeiMy+sArl05W8udM366b8ORzHyDmK6qrHYyyl2IN6B7WXldIhhcjXq6iYiY9cPP1W0dO1N3bqkWV8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KW0J29vKWJfhQXvznnUPSuJGpF/clBSOck8oPCGajjJVyuNj3
	Hwd4yBY8TCExZFWRwEwfVRmLnNnBepQBu5mrSLJoy1Qh5/iSCHSvYzEFqIbtj+1VUh8mieHTRgf
	jOlD+nu21xI+rhZ2okNqGdX9qEZmOTIU=
X-Gm-Gg: AZFdTZc++hnjTS3rbn4U4WIw4Gdh4vFbk8uT84tw25n4M75Cz7IdmneAwew8RIz5hmH
	4upcVoBa5v80G+193VrESv9VYNy4QO/kS2AEJfi7pqYUT6XlP5aMkqXuyS/DKrglYemzonA2Kf5
	0tvS0Cqdqo0f04OwzDRg70QaJm6Sh5jOZK5bPZc/GDvJwpXDJaqiaP4yzocRBV8PMTJ/QD4UeCc
	VNnew3+c4ahWzvoN8YIkaT7GbJXMIfJ0tf8QpLtYQspkzknkJO6ILo/mkcPEWbYitCUV1LaJFKs
	X7dW+P5saI6wcRKGfUdcHPkfGiMPH2avAjCkdfzpsRKB6OQL7fdJcaQk+bDsiDsEwitohuHTNmR
	MFjZIG6a0ExW9idQKvA5N9xcZUdNJsPb7D1nm1zeqMSNJLk3TmQsMxsvSSmVsqdZRfeFUG4ow3M
	XKrfWiagwVTTQlestmscvA5G9w/stgdw==
X-Received: by 2002:a05:7301:6782:b0:385:2ea8:aac7 with SMTP id
 5a478bee46e88-3852ea8d7d4mr33082873eec.23.1795771313759; Fri, 27 Nov 2026
 01:21:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122081820.53199-1-clamor95@gmail.com> <20261122081820.53199-11-clamor95@gmail.com>
 <XPGRUNopQCaIq1yDhISpSg@nvidia.com>
In-Reply-To: <XPGRUNopQCaIq1yDhISpSg@nvidia.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 27 Nov 2026 11:21:42 +0200
X-Gm-Features: Aa3M54r9PD-vpDJoY894sGmJ09TY6pWekwcQ8wsOPcIm9P2nFgYst_79Ta6LzYI
Message-ID: <CAPVz0n3YEoq5dg4+sHfd74rT8x_R9DEv1eTzW7UHVKEABGa-BQ@mail.gmail.com>
Subject: Re: [PATCH v8 10/12] drm/tegra: rgb: Parameterize configuration based
 on bus flags
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 27 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 08:2=
2 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sunday, November 22, 2026 5:18=E2=80=AFPM Svyatoslav Ryhel wrote:
> > Parameterize configuration based on bus flags passed from the bridge or
> > panel. The list of supported flags includes now pixel clock polarity,
> > display enable (DE) polarity, and data alignment.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/gpu/drm/tegra/rgb.c | 39 +++++++++++++++++++++++++++++++++----
> >  1 file changed, 35 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
> > index d48d498068ac8..faecd6f94359f 100644
> > --- a/drivers/gpu/drm/tegra/rgb.c
> > +++ b/drivers/gpu/drm/tegra/rgb.c
> > @@ -5,6 +5,7 @@
> >   */
> >
> >  #include <linux/clk.h>
> > +#include <linux/media-bus-format.h>
> >  #include <linux/of.h>
> >
> >  #include <drm/drm_atomic_helper.h>
> > @@ -106,6 +107,7 @@ static void tegra_rgb_encoder_enable(struct drm_enc=
oder *encoder,
> >       struct tegra_output *output =3D encoder_to_output(encoder);
> >       struct tegra_rgb *rgb =3D to_rgb(output);
> >       struct drm_connector_state *conn_state;
> > +     struct drm_bridge_state *bridge_state;
> >       struct drm_crtc_state *crtc_state;
> >       struct drm_connector *connector;
> >       struct drm_display_mode *mode;
> > @@ -117,12 +119,21 @@ static void tegra_rgb_encoder_enable(struct drm_e=
ncoder *encoder,
> >       crtc_state =3D drm_atomic_get_new_crtc_state(state, conn_state->c=
rtc);
> >       mode =3D &crtc_state->adjusted_mode;
> >
> > +     /* Get but flags from the bridge state. */
>
> s/but/bus/
>
> > +     bridge_state =3D drm_atomic_get_new_bridge_state(state, output->b=
ridge);
> > +     if (bridge_state)
> > +             bus_flags =3D bridge_state->input_bus_cfg.flags;
> > +     else
> > +             bus_flags =3D DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
> > +                         DRM_BUS_FLAG_DE_HIGH |
> > +                         DRM_BUS_FLAG_DATA_MSB_TO_LSB;
> > +
> >       tegra_dc_write_regs(rgb->dc, rgb_enable, ARRAY_SIZE(rgb_enable));
> >
> >       value =3D DE_SELECT_ACTIVE | DE_CONTROL_NORMAL;
> >       tegra_dc_writel(rgb->dc, value, DC_DISP_DATA_ENABLE_OPTIONS);
> >
> > -     /* configure H- and V-sync signal polarities */
> > +     /* configure H- and V-sync and pixel clock signal polarities */
> >       value =3D tegra_dc_readl(rgb->dc, DC_COM_PIN_OUTPUT_POLARITY(1));
> >
> >       if (mode->flags & DRM_MODE_FLAG_NHSYNC)
> > @@ -135,11 +146,31 @@ static void tegra_rgb_encoder_enable(struct drm_e=
ncoder *encoder,
> >       else
> >               value &=3D ~LVS_OUTPUT_POLARITY_LOW;
> >
> > +     if (bus_flags & DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE)
> > +             value &=3D ~BIT(PIN_LSC0);
> > +     else
> > +             value |=3D BIT(PIN_LSC0);
>
> I think this is the wrong way around: SAMPLE_POSEDGE means that the
> pixel data is sampled on a rising edge. That is, it should be driven on
> the low edge so it's ready for sampling in time for the rising edge.
>
> LSC0_OUTPUT_POLARITY says that the value "LOW" (a bit confusingly, 1)
> corresponds to a data transition on the falling edge, i.e. sampling on
> the rising edge.
>
> Section 31.9.6 states this a bit more clearly: "an active low pixel
> clock means that the data changes on the falling edge of the clock, to
> be latched on the rising edge".
>

DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE =3D DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE

Should I replace with DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE?

> > +
> >       tegra_dc_writel(rgb->dc, value, DC_COM_PIN_OUTPUT_POLARITY(1));
> >
> > -     /* XXX: parameterize? */
> > -     value =3D DISP_DATA_FORMAT_DF1P1C | DISP_ALIGNMENT_MSB |
> > -             DISP_ORDER_RED_BLUE;
> > +     /* configure DE signal polarities */
> > +     value =3D tegra_dc_readl(rgb->dc, DC_COM_PIN_OUTPUT_POLARITY(3));
> > +
> > +     if (bus_flags & DRM_BUS_FLAG_DE_LOW)
> > +             value |=3D BIT(PIN_LSPI);
> > +     else
> > +             value &=3D ~BIT(PIN_LSPI);
> > +
> > +     tegra_dc_writel(rgb->dc, value, DC_COM_PIN_OUTPUT_POLARITY(3));
> > +
> > +     /* configure DATA order and alignment */
> > +     value =3D DISP_DATA_FORMAT_DF1P1C | DISP_ORDER_RED_BLUE;
> > +
> > +     if (bus_flags & DRM_BUS_FLAG_DATA_LSB_TO_MSB)
> > +             value |=3D DISP_ALIGNMENT_LSB;
> > +     else
> > +             value &=3D ~DISP_ALIGNMENT_LSB;
>
> DRM_BUS_FLAG_DATA_LSB_TO_MSB does not seem the correct thing to check
> here. According to the TRM, DISP_ALIGNMENT doesn't swap between LSB/MSB
> bit ordering in a classical way, instead:
>
>   // DISP_DATA_ALIGNMENT =3D 0 (MSB)
>   LD[23:0] =3D {R[1:0], G[1:0], B[1:0],
>               R[7:2], G[7:2], B[7:2]};
>
>   // DISP_DATA_ALIGNMENT =3D 1 (LSB)
>   LD[23:0] =3D {R[7:0], G[7:0], B[7:0]};
>
> I suppose MSB is more natural for 18-bit panels and LSB for 24-bit
> panels depending on the layout. So the correct value depends on how the
> panel is wired to the SoC on the board. Hence, I think we should
> describe this with a new property in device tree under rgb/dbi or
> endpoint node. Something like 'nvidia,rgb888-wiring' for LSB? And
> document that this means the above kind of wiring - not all RGB888
> panels use it.
>

Ugh, why is this so confusing...

> > +
> >       tegra_dc_writel(rgb->dc, value, DC_DISP_DISP_INTERFACE_CONTROL);
> >
> >       tegra_dc_commit(rgb->dc);
> > --
> > 2.53.0
> >
