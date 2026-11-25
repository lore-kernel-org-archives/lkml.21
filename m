Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795624369;
	b=Go3jNwvn7E3OJ+E70ts9+nBMrtq1OHfYzp/epmW9d1PrBKh9+vvpcinuCO4zkIbUwhMf
	 Ke+/nZlZV2tZfsWiQEKn+6q9BGNSa7T1GHEXfpzbdqi+63+sCeMMquJfa22LFU9KdCNMI
	 BjEqzRCVZl82yY/wP+qVl0RxZ+mAoSo9De+6wNp7wV0+d1A8W0dzp/OWdISy+C05zAqFl
	 2fNQ5YckS+bPXbazQVcoolBVRTIi/GkRvid5VvimWvUtfWfn3LUQRHtGnuXLhWlVi6S18
	 P/Uv6qOrt6wS6cXQylilFgc9X7MYOXZ5XneUDMlCmNzti5GUkXULnV6cYAzB4fsTdgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624369;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=fjeXOElCViRQmgZvgDDdONv2Uyhg+At7B3MV4y/CS3E=;
	b=wm4yVCo7lflpYZZqn3aY1TJkIPVnM6jRYlP9xI72PQjDujd1z8pUjfGjLV6+22GPX24f
	 oxl95aUV3neyeHu0XkLZvVDkPC9e1JGmNTjP+0JywnQCoPVLUvefzM6VQyFwF+kTn9zOX
	 33t4Z6+ZuDh81AnPlvjCTmlpdmcvirEgknaruyw4iZ1JoMcZxn8RaEcHwBZGClvQw1ET2
	 m9TTK8EhxwRYlqbz3kJOF+2M/gE7lv3ofSreUuhqTBfr3oozvJQHErhBcriemT9wKeCuh
	 gh8G+qCGOwsCagb0mIy0nAjzzCflZqsMWZs7YINtv1Y+yBGjxnzZQKwpUxF3A/k6lsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OeYV92tR;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A4D606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0A4D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OeYV92tR
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so53689405e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795624367; x=1796229167; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fjeXOElCViRQmgZvgDDdONv2Uyhg+At7B3MV4y/CS3E=;
        b=OeYV92tRoy3r9HM1arkFD4XQZAtUvBnArRdHX3S+tRAhPlHWD42AGwa0CbMKQhe1A8
         hpFCCQOqCtJtMB3yL2tkM9ewgVf+3TQlOdTOcVE8tVzC/N4x8FroFZ+4s1KkyyMRvvb9
         qO/v6gwiQ8v90pSSZhqvkv6IYdGMj5DDlM7FngblUIRRPd38C+Ed/z1fWqykg5LOt0Fa
         vY3HRgF55bzfsCw87qYRanRQB1D1EbX5syTy7RO3nqaT0AQpETdCfqNcTUPneuz5hpf8
         oU2uS23TLTIxbKspf8f5Yv9TS0g8f5S3dwLjkUQ1/P0pAemljB7Z3QkJDb+uUFDaiQpz
         UQNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624367; x=1796229167;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fjeXOElCViRQmgZvgDDdONv2Uyhg+At7B3MV4y/CS3E=;
        b=uTcpsLC1MlR5ltQuxNActw2oqGWF/to82BAA6y/xlvtbCNvW4oJ3NZKWGx0/gqVTir
         EA5ppTBjcK9ZfWWaUmt1KKsUMRGcKtyLjui1thb4P4SAiHVpId3tvJL+dA4ZXJXkTjg6
         Vi+ZuGTT/I2QP6FdkrmYbhOdjg3Lpij7NYnLq7ec7WTe4mfpT2B1RSsUydsTZwifQfkT
         Y95iRd6jTuc/+97LjZvy3bU0M88Nscvwy4QFikPZi8P93G+bE33+uVf9FS4PAR9k72Ho
         +n/IhtmFUHMYScW+3ng4wm9wL2wbiIg4S3TwS//Xbyfy5u314CKUr06JwEiwMK43ozBa
         IlaA==
X-Forwarded-Encrypted: i=1; AL+hErFizub9bUmhKmzAhPru5+4QsqzDX4XE4F8lxx5cBHPuRZrPGH4FadmCEZThmEklR5bp6iorbokBP9xDQAM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CIls8eSd8Awa7pBSZj510RIG6HlhFxOY0eO8DKh/UsFZS81Nd
	iuAorkhkn1rcjePbqGc6c1ICBONjDPw9UzDnLyq0kaMt9MYtO8vPVvNj
X-Gm-Gg: AZFdTZcqrre/VBNSTT5WerDNbOMFdJp6/rzBNeqVhlQq8ia3B9CkDp1NjngVndpH/qz
	fTt9CUF893lMtr+Wj5rWOy3vK/RhwMUWYCl2kLjMkgy98g11T82ezmeK6ASaU57fijVLZn1eGR3
	8lQV6qSgg7tY4/JY/4IBDKHufS3xVlvPa5N0SRD4LaHmztXxsvOcHjH2+WIDqBfBlwG38rr2ZB+
	RPVTvLxOpILYrcL+kIf5b/vAa36X+PtmSWWUjMqnxpErCrdZLM8r40pjfRiwHDhRfqP04nR1e6I
	qBiyutiSftYhzVuDKfbBa20yYPrf5MEdDrGHbVyAD9N/Dmn5L9J9+mEKIYwRZswW8DTze/zZbFK
	XZ21fhiCD1RrFZtPYJWsq25rLBDHwlJFg5K0TZakR5lliVvskX0jAYmZkZUZEHkik8sqg91fYGJ
	Njc3iwY8Jlg9QjdxS0xLrTtMVqOUSJ7jGiBt+YugPHuXJxy3+JrzCvZQub7frt4OaJkMaCtJCTt
	3FSJhrnQJS5IeRJ92bBYiOGawg6tABMN3kkGwLlJ5E6kMdol9AclfInnE5W1rNea1StKB0DC8VP
	Cw4X6sOivhOjgzyMiDyq+nL9TJpzY43ZsAXO7+1Vhf4vvE9OmCzaOFbcct1T6Q9l1Axb8RnwUbZ
	scCoBMIZfpCpYM+d9yZYcBmgbEQIDuqlrjzyNqqxBcgmfHfKFNKq+ebj3pxiZAEmQb5A6gkpujj
	yp0ZBHu88TCENbJH5R2w/sErQ6l/MP0VGH59qNgySRFmKBdzqNIebV+9Xs2wDCYxuMeRTS6YQxu
	KXGGATlJTwwn8IByYPqwsZtxyNHIf5Tz+M0CxrIYN61VONVhu/M3iWY4m4f/qcnrAcWw7sWiXfF
	t3T47WL+
X-Received: by 2002:a05:600c:800e:b0:4bb:7757:fe58 with SMTP id 5b1f17b1804b1-4bb8881b9d7mr381679255e9.19.1795624366963;
        Wed, 25 Nov 2026 08:32:46 -0800 (PST)
Received: from jernej-laptop.localnet (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a12acsm560493135e9.8.2026.11.25.08.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:32:46 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Liu Ying <victor.liu@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-sunxi@lists.linux.dev,
 imx@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject:
 Re: [PATCH RFT v3 3/5] drm/sun4i: layers: Fix VI buffer address for clipped
 offsets
Date: Wed, 25 Nov 2026 17:32:45 +0100
Message-ID: <sBipOLw6T_aZ1e-H2zFl3g@gmail.com>
In-Reply-To: <20261124074041.115251-4-wenst@chromium.org>
References:
 <20261124074041.115251-1-wenst@chromium.org>
 <20261124074041.115251-4-wenst@chromium.org>
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

Dne torek, 24. november 2026 ob 08:39:31 Srednjeevropski standardni =C4=8Da=
s je Chen-Yu Tsai napisal(a):
> Commit 79ac1c945ab8 ("drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to
> get display memory") dropped the code to calculate the framebuffer's DMA
> address in favor of drm_fb_dma_get_gem_addr().
>=20
> This turned out to be wrong in a couple ways. The hardware is programmed
> with clipped dimensions, so it needs the buffer address to start at the
> clipped boundary. Moving to the helper negated the clipping. Also, when
> clipping on the left, the buffer address needs to start at the first
> pixel in the sub-sampling group even for the luma plane. The hardware
> handles the interpolation internally.
>=20
> Switch to the new drm_fb_dma_get_gem_clipped_addr(), which provides the
> buffer address starting at the clipped boundary. Calculate the intra-group
> offset and adjust the luma plane buffer address so that it points to the
> start of the sub-sampling group.
>=20
> Fixes: 79ac1c945ab8 ("drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to=
 get display memory")
> Cc: <stable@vger.kernel.org> # v7.1+, needs drm_fb_dma_get_gem_clipped_ad=
dr()
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> This is an alternative to Jernej's original revert:
> https://lore.kernel.org/all/3980ea1aeb3f7fe8b4700e36560deeba3d050664.1785=
772659.git.jernej.skrabec@gmail.com/
> ---
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c |  2 +-
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 16 +++++++++++++++-
>  2 files changed, 16 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun=
4i/sun8i_ui_layer.c
> index f9c7f28f9fa2..67cce1b0e70f 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> @@ -130,7 +130,7 @@ static void sun8i_ui_layer_update_buffer(struct sun8i=
_layer *layer,
>  	ch_base =3D sun8i_channel_base(layer);
> =20
>  	/* Get the start of the displayed memory */
> -	dma_addr =3D drm_fb_dma_get_gem_addr(fb, state, 0);
> +	dma_addr =3D drm_fb_dma_get_gem_clipped_addr(fb, state, 0);
> =20
>  	/* Set the line width */
>  	DRM_DEBUG_DRIVER("Layer line width: %d bytes\n", fb->pitches[0]);
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun=
4i/sun8i_vi_layer.c
> index 4d3fc03f9877..b6796416d550 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> @@ -205,7 +205,21 @@ static void sun8i_vi_layer_update_buffer(struct sun8=
i_layer *layer,
> =20
>  	for (i =3D 0; i < format->num_planes; i++) {
>  		/* Get the start of the displayed memory */
> -		dma_addr =3D drm_fb_dma_get_gem_addr(fb, state, i);
> +		dma_addr =3D drm_fb_dma_get_gem_clipped_addr(fb, state, i);
> +
> +		/*
> +		 * The mixer can handle odd offsets into sub-sampled YUV
> +		 * planes, but needs the address of the first pixel in each
> +		 * sub-sampled block. Adjust the luma buffer address backwards.
> +		 */
> +		if (i =3D=3D 0) {
> +			u32 x_diff, y_diff;
> +
> +			x_diff =3D (state->src.x1 >> 16) & (format->hsub - 1);
> +			y_diff =3D (state->src.y1 >> 16) & (format->vsub - 1);
> +			dma_addr -=3D y_diff * fb->pitches[i];
> +			dma_addr -=3D x_diff * format->cpp[i];
> +		}


This could be done differently.

Before for loop (done only once):
src_x =3D (state->src.x1 >> 16) & ~(format->hsub - 1);
src_y =3D (state->src.y1 >> 16) & ~(format->vsub - 1);

Inside for loop:
gem =3D drm_fb_dma_get_gem_obj(fb, i);
dma_addr =3D gem->dma_addr + drm_framebuffer_get_block_offset(fb, i, src_x,=
 src_y);

But it works in any case, so:
Tested-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> =20
>  		/* Set the line width */
>  		DRM_DEBUG_DRIVER("Layer %d. line width: %d bytes\n",
>=20




