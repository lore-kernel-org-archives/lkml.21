Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795173127;
	b=iIbSg5b8RkSsRbD2jzaYJvi71eBS2hRhxHFKeEfPs1DGYIV8SE/e6c9Gl3eWu1LlUEpW
	 MwnnJnHWo1ZkPMZ5VrrJ2NS5vj91cmYM61QRnf/SQKCRaC5FSdbR4O9jJQFdGQJAxWcdy
	 aXanyJo8vHJW4qygP/SaJV2BsSRuYetpQUVJlsoCAPy9HE2zNcY1sw3pxWWxyBLqSrhIo
	 upHyB6mjWC1ThkCCfHNBBlf5VQ+ArtLpqwC8coo+qla1+UjmORFXc/dmi+VW+1o48kips
	 mfQVvPkJcJ4rvTPRTJpc0fz+d7xxvRRL8sKmPa1KEBqyVk3oNqLWgll/OgteTueHE0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Ctvd1E18LBT1bm/OVmwtHp7EJOxWtY2oUhWq4p20dK4=;
	b=U1CFWkc1MfnpvkWk4VoxLxgbSIlBsHg7j7ewaBahYos1DzM74YMXr2I+auqKxMLc6eWu
	 z552C2F6QHHN6gFVryuxXnRJdldB40RJQph22NsvqbnhbFpxGo9H//R1oszEixPEZdgRO
	 9eYwTpVds1IK0LN5cMm15bWomDgSZLw3UiMdBBV+f3XGakKprP8Ud9XLGl9B/ftFJIIC/
	 UajfYivZCS/aUY7/NNTTaBGxGdapbfLQRpHfbVxx2eUXcKMrGih6xKX8fGJw+Z8dsSf8d
	 U4pjOJw99ToBrQuC48txtXlXiNVOsSQ03JoTiYl6aSROkUzftZYYdV9oejwUGUvU3UA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=gXAyg1xD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910A360A261E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:12:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 910A360A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=gXAyg1xD
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b4e04eda5aso5936617b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:12:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795173125; cv=none;
        d=google.com; s=arc-20260327;
        b=BbxuDQrdlVsAvmXQDzF3kbSD9309WGWEt10X3aXcOBZ9m4SAa9pEIlcko+5AnSNTBv
         Dwldpt6Vfjy2+XHQmluJ8OIuIcaz5Mth47by4nES9eNTUBF74b3PFN+VpWCEgkgrzQQI
         mq7jjAEVi1LJ5H+bXUppFHMgyhNg3RTd7fPDXCZAoITrWYs+A/kPaE/ySwNern23l0Hf
         QhpCQ7yGIdzdq5wXOykDBRFVGoeeMGALqTCFmUB1XKWGSgpajz3LfHWjODkpgN756Ytv
         igh9/bIoGoSOcQ0xj0HWgwPrPRSzjksAzhZx9pij/OI5nYBKWorjC5JkVP0twMo+8EmY
         pMHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ctvd1E18LBT1bm/OVmwtHp7EJOxWtY2oUhWq4p20dK4=;
        fh=did0jnNWmoLC05oNfVblGYV+ywmQnWBeCGB1uh+Jj4w=;
        b=efx8CDwoGWHt6O8v/bgFoEFrEx501BgdAMjSsaYBKyqE14cXUDxRi+zu4xx6C/X5BF
         x+YUMcJefTnQwYg+61aXE45qUM0al9iKPLfY7X9FQxO9xjCJJzV/yAVij4jentcfq0lE
         YJeiWNe2wxOHF6aTyxAA6IrhbNqQ5Q4DsXyBpoNcdfO5FWPfblotbynSWKmIC3XKA3Fu
         mNOAaEmWqvZp93eS7VoWDVtRn6JMResciWuTjoVbSmdPYO8YAPePAMzF038XQ0/oF+o/
         eDNzf7aKc7W7mmPn8S5qYExJkd62RcT9bQqtW7pdn5wgks9Z0Z5U3WwgV1y5Vf5dGrf9
         rY6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795173125; x=1795777925; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ctvd1E18LBT1bm/OVmwtHp7EJOxWtY2oUhWq4p20dK4=;
        b=gXAyg1xD5CkN+cApFfkBLPEDOlbhZd2QB67QK1jHKVo+QMT0WNj4AxKncrM6oIracS
         uVqYdQIXDOa2p6jJOiI2OgBVnDXFoO5zoLUwIKT5pFXuiR/VBXBHSZaq/P0D9ynV2X5g
         w4J7Pnbqvak+7gHMVB57O/LIOLqNrJBOxF4NU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173125; x=1795777925;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ctvd1E18LBT1bm/OVmwtHp7EJOxWtY2oUhWq4p20dK4=;
        b=ms6UBWXLiXkD3V1zGVrWYLnaPrJx8ts41+D7mXAFfyYDRLmMKqXs2kIjpQ3Q+WEqGb
         QddRCrbHANAAprcG06iAN0dNj9Ylp/fVBuTyYJVS0X/gbQRAPa84lDbjw8Wp6Jy6Ioy7
         aZXpQC0sFo45VtXu/CL6cnHz+xfyIixwrai6Pcle6oaUIcUZ6R8Oz1zbcedCWFOEtW80
         2bvxGX0qqnag0stn/y99eThBqBxLg027yhPBk9A7bJBvI1q33XjU1l+DG5jQZlrxEXmZ
         01EbLQDpmuRphu8H8zb4D4MsLclkc8jIQwP78nHvrZOvJwxO+N003JDqWthH4To1fIjQ
         fH4A==
X-Forwarded-Encrypted: i=1; AL+hErEY2dyiRrOz9aVSVEcihqsKjfHkk8Bf51Xi0djsdSDbm6+EBF0ctjO47YQ815CcdBmFcNLrPhFPVhlb91c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SgAIHjqpoqGD8X7qbihqD7NV/LC+dPbqrcjr7Gfq+9O2bzUYn
	Qt4ynTrLNvF9VS++F6mH3zEO6fNGypY9x2X/Lv+gq9DpaW48xABsC1mjL+XtV3Arb+qQqjpwzEq
	BNk/uJBn3yswH0+mDfqlxW/n1ffy+lpZVTCRfgYx5BQ==
X-Gm-Gg: AZFdTZc4yJArxuX47sFstDkePo5Qe4NyWm1lQAyuBQjYkCVTp4oXJNKCFslTXDZ3ujI
	ziecrTjX7hVEPkXW90QOtndlmanYiA/Wod+B0Y2P/pl0dl6Wwlt1Lq6UO8foKh4THlufUhtYxL/
	z36Ep242y6K5rXe2Wls3KlQ3yYrc0hBf0rvtm96UQVlJGTWUHYqB8V/OnjuzNazFvkdXHCVxDck
	WVKR1mpbCZiBC3c7GrJ3v4CD37A48/S53UQvIaJvQNwL2zPC6ZEeESp5ZWo4m3SnN55o8Tr2xgj
	QVF6DqdAvj/CYWp8h3vu3is0nZrJZ9PfTIxyBN7ns/2ZGZCyEiI+HPpDeVYvJ8PjeegIJ4wK5sF
	oSlywMSUOTDi5g74aZYh2L+2FWOvETaPdYEfIZ/ScyH8iupHCAr4lKCcuKusi9L7sH8I=
X-Received: by 2002:a05:690c:e908:b0:8b3:3956:6f7e with SMTP id
 00721157ae682-8b52043cdd0mr12064397b3.12.1795173125445; Fri, 20 Nov 2026
 03:12:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028131823.2649142-1-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20261028131823.2649142-1-dario.binacchi@amarulasolutions.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 20 Nov 2026 12:11:54 +0100
X-Gm-Features: AclHuK-5tDXHRBDyzoy4ZajDKym7P3SzWGspe7yU6ZZCvGx7SKszxQtXGhkPNm8
Message-ID: <CABGWkvrPMDAq2s5msic8y=Ds7uNgqC79BLMzZNFmez7v9DVJMQ@mail.gmail.com>
Subject: Re: [PATCH] drm/stm: ltdc: create blend mode property
To: Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Daniel Stone <daniels@collabora.com>, 
	David Airlie <airlied@gmail.com>, Leandro Ribeiro <leandro.ribeiro@collabora.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Pekka Paalanen <pekka.paalanen@collabora.com>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yannick, Raphael, Philippe,

Gentle ping on this patch.

The warning has been there since v7.3 and is still present in v7.4-rc3
and in next-20261119.

Thanks and regards,
Dario

On Wed, Oct 28, 2026 at 2:18=E2=80=AFPM Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:
>
> After commit 860e748bddcc ("drm: ensure blend mode supported if pixel
> format with alpha exposed") we get warnings at boot:
>
> stm32-display 48010000.display-controller: [drm] [PLANE:37:plane-0] pixel=
 format with alpha exposed but blend mode not setup. Please fix.
>
> The LTDC blends the pixel formats with alpha by straight alpha, the
> only mode implemented in the driver. Create the blend mode property
> with DRM_MODE_BLEND_COVERAGE only.
>
> Fixes: 860e748bddcc ("drm: ensure blend mode supported if pixel format wi=
th alpha exposed")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>
> ---
>
>  drivers/gpu/drm/stm/ltdc.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index 5311e0b3e8dc..3b6e680c1c61 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -1642,6 +1642,7 @@ static struct drm_plane *ltdc_plane_create(struct d=
rm_device *ddev,
>         drm_plane_helper_add(plane, &ltdc_plane_helper_funcs);
>
>         drm_plane_create_alpha_property(plane);
> +       drm_plane_create_blend_mode_property(plane, BIT(DRM_MODE_BLEND_CO=
VERAGE));
>
>         drm_dbg_driver(plane->dev, "plane:%d created\n", plane->base.id);
>
> ---
> base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
> branch: stm32-ltdc-blend-mode
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
