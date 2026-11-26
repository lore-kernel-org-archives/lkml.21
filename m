Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795713445;
	b=Nmme2D1YWbSlMYbV3gMRBMVHULR9PdpWa/+liHlIfMEr2Gfo0XY9xsMGgDjmSQ/fQQZJ
	 gSw6m8WyUTAfxXPG8ST7XNuvbjVLv/nZEDCiISL1XAlRPRHpm53Y1H6xWPwCMOgqIAODq
	 RcU0HjvVsvPQ/Oc4b93B8gyIY0Hu3255Y0HSMIsNuC5R3th8cOYbvKCLX0wzS6EcJZWsW
	 ha0DGQ1dYgwcT98SToQfQyFKjVoHx5Q0ifdHCargoOn5IQE9dMbIYJKmCAy9tSjnJ4o9K
	 tJERFLirWUvFQcPMCorvtHgOIzutGyddLMKdz6inv/oMEXbGtF+71gxi6cZ6BwEg6LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795713445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=EILph5uN4fSM4fF0EevcsLMkCO+dSIG9bRlB+rnqTxk=;
	b=5SR1MrqtigQJdokVJbmVagiZxW17XFitY3MWgXDkFDL7jHYhKJcNoapWNwSPaoyCO1ao
	 akzCby/+Zg5cub2jpoOcjyygp/Ujouj1Gv/CODPEBuzFSHrJ1G/Dr1zw65kWdCZL8HU8h
	 owAeepAsj3E7qtgXiOkYnzhuJ2AUsoJxXs24ZP4A3PKaTjLIOho7YkDaWxHmJZ5tkt6Yu
	 8ClTOnhmA2dtVVugDxyYcMYSSQ55RfQFy6vMsbwTd07Wkqfre9oV6jR0LsmgmS7VgfarD
	 remZxS2O02ql98U5QZNT7LHkF5W+LmdmSwVdGbIWdsPaT0z1XPsGNCTBCXaQhtynb4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wrn4bv9i;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D039606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:17:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D039606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wrn4bv9i
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-490f38e9688so5066761f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795713443; x=1796318243; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EILph5uN4fSM4fF0EevcsLMkCO+dSIG9bRlB+rnqTxk=;
        b=wrn4bv9i2F7ZbfsSqvLyZK6M43Y/6Zr+ZtT98bumoX1W8gq3NagIWl18dtnUg25j+Y
         KldCdvPomCfgjMpEf6etltlFwDr5eLg7UIdd55al5Z6NtRn1RK8MIcUtla//xrrbpgdD
         GZSdKgjgkT97w/AfxKl/wsKGobZq27BZPJUmSk98ybh62MpxAo3Bm5Xd1UDJn0aOreg0
         GV3ZO4kmlpO5qqHmgkXDeuR4L4C+RJxTrUrvDxBfaSOGOqzzXtdZ45hyLzgOYJUJQZuT
         qYQXg7w/QFbG8eA4da8Bk2ArsLHGe1+fHsDxEdZC4v3ksrOe36G+FeZAkUQA66Y0l/Y1
         p+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795713443; x=1796318243;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EILph5uN4fSM4fF0EevcsLMkCO+dSIG9bRlB+rnqTxk=;
        b=ff9i16P2oKtM4XzmikNDWWKokMuXucxB6EQ+bupPYh5YFgJiBZyMQlLqYIHZNo7UKL
         O8HJnM1YwFHWnCOqj6lrE0bPDGdxYyFmPbzCg6kWyBd6yoB4arYHhIh09y/elKoaup4b
         OOWj5/oIOmQjPj5kzY3INjV6/qYkguDDAXuuHdvpNqU6q23kHtQhlZKgbSQ/7ZG172iQ
         EZqvKLp3h0yuLTQUWt8lj9+OxHna9weuGdEVIS0zPx3GaKxOFrOkYL2uuQylwT3iF046
         1YDRPE0Sja0zaieIMWpl3Krnf2sDahWc4RDr60Ubuh189AO8CXb53/ZPo0C85oa36Y4s
         yJIg==
X-Forwarded-Encrypted: i=1; AL+hErH8d4Hou6PgpgSi9HEIQgoGKhvVnDHCFRiECzH9+HjIoQhkSso/T9KrpCV1UF7Hx+t6eEN4WFrVxdgGApY=@vger.kernel.org
X-Gm-Message-State: APuU4Z96G54yMgacqPL5IZoncUpNBmcDJJJ6Jfy066OjjxneW1GYYtsM
	WQea6UDImeMYCS8gPMWOGdB440R4Cm5COhQTx912XwXJC/NHBIupVyNx
X-Gm-Gg: AZFdTZf9z6HUK95nLNdZCezdF7lryprY6qKMkn2hBVKYqLoTQFfOhVr0uAPvTXdeiOf
	WFHZarDlwl2R+UCO3KP6XvAb1WRUy6PjKLxN8TiegIAPuHjMyRuWOBS1gkZa64N7dgeG+fNVW/A
	9AVErKbSKhLmzZp7idy61ylByEKXEPAIBKqLpGr5NLz4VoOQbt6aYM87mTmWJh468UdQUc103Ao
	IfGzeSolg8nCFp0pG8aczkupmDVVOvqY9dolNw17V8zBD6xjPcWaGKDpzBw7CVumsnMqNMicAff
	tJIrMjOwYZH0+3zmRmpW059kHrx0D6zmg4ze2kPzn37shHmGyYdM9Nkg6uuWaMC8pRx0k6YMdPb
	cN2L+Lfg6i+J3Y+FhJRwbHZdsxkvCLryQVaXnNnrH3T0kRslK3L+E/1r1t/ZVP1Sb/Eyu/emvI0
	JciwMLRB7cT3U14LVNn0dMwWu+/jDmSbDE2VXOyJeY5YaAjpJSweGzOS9VAkRpUp0zcvM6tH7Ux
	ZFTN4abNDtd25X1kxXjNyB8phYJHNYDbv/gcucTqRkhmCyxjcvCGBAh9WXt6jWgxPabr9GVdklq
	u2CKDZtFR3KGFV8fZOKbMhkL/RZPhAYw0uvKsVpWnFQeQjem9r+B/QqGkfBXvxCYMutqMFX090Q
	ep/HaonySdEIHcCHgcjFx3xlYvB7/otSXM9aqtUvD4xQJExtzrTUaEXTLDR3dji2wlGYGMc3Kjg
	MnAt75W95DWSZ4NCHF/+mXV7VxAxgFDjEdE5HJvY87glPz/9Cn/R0dKwkxkiRyQ5KvM7AtgB9gd
	cj1xvcfmWkOZyRVxJj1BVu4SXhBHwwhv0De+gMGfuTdy6tjpL1BF8jOxrG4joYpTzdQtz1uH6hg
	UhUQPR3z
X-Received: by 2002:a05:6000:4028:b0:4b7:6dcb:e909 with SMTP id ffacd0b85a97d-4b76dcbeaa9mr18536789f8f.8.1795713442699;
        Thu, 26 Nov 2026 09:17:22 -0800 (PST)
Received: from jernej-laptop.localnet (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm39409423f8f.26.2026.11.26.09.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 09:17:22 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 aiyengar1990@gmail.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
Subject:
 Re: [PATCH] media: cedrus: vp8: do not disable the engine when a context
 stops
Date: Thu, 26 Nov 2026 18:17:20 +0100
Message-ID: <G0WUYb9qQ46JcwzsVuhrfA@gmail.com>
In-Reply-To: <20261112-cedrus-vp8-stop-v1-1-27d5ca038578@gmail.com>
References: <20261112-cedrus-vp8-stop-v1-1-27d5ca038578@gmail.com>
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

Dne =C4=8Detrtek, 12. november 2026 ob 17:08:44 Srednjeevropski standardni =
=C4=8Das je Arun Iyengar via B4 Relay napisal(a):
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> All the contexts of the device share the one video engine, and the m2m
> framework keeps running the jobs of the other contexts while one of them
> stops streaming: stop_streaming() runs under the device mutex, which
> device_run() does not take. Writing VE_MODE_DISABLED from the VP8 stop
> callback can therefore switch the engine off under a picture that
> another context is decoding, which then never completes and fails on
> the watchdog.
>=20
> Every job selects the engine mode it needs in its setup callback, and
> runtime suspend resets the engine, so there is nothing to disable when
> a context stops. Drop the call, and the helper, which has no other user.
>=20
> Fixes: 3c39a16d30d8 ("media: cedrus: Add support for VP8 decoding")
> Cc: stable@vger.kernel.org
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>

This is correct, I have similar patch on stack. However, helper to disable
engine is useful, but in different place. No worries, I can reintroduce it
once I came around to post fixes for concurrently decoding issues.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
> Tested on an Orange Pi Zero2 (H616) with the same change on a 7.3.3
> kernel that carries further, out-of-tree H616 cedrus patches (VE behind
> the sun50i IOMMU). The old behaviour was brought back on the same boot
> by a temporary test switch for comparison. The test is a 4K H.264 decode
> through FFmpeg v4l2-request while a second process opens VP8 contexts
> and starts/stops their OUTPUT queue in a loop. With the old VP8 stop the
> watchdog fired 12 times ("frame processing timed out!", after two IOMMU
> page faults at address 0), only 289 of 300 frames came out and the md5
> changed. With this patch all 300 frames match the reference md5 and
> dmesg stays clean.
>=20
> On media-committers next, the base of this patch, it is build-tested
> only (arm64, W=3D1, no warnings); it has not been run on that tree.
>=20
> This patch is independent of Jernej's pending series "staging: media:
> cedrus: assorted fixes and VP8 4K support" (v2) and also applies on top
> of it.
>=20
> This patch was developed with Claude (Anthropic) as a coding assistant,
> which found the bug and wrote the code and the commit message. I
> reviewed it and tested it as described above, and take responsibility
> for it (Documentation/process/generated-content.rst).
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_hw.c  | 5 -----
>  drivers/staging/media/sunxi/cedrus/cedrus_hw.h  | 1 -
>  drivers/staging/media/sunxi/cedrus/cedrus_vp8.c | 2 --
>  3 files changed, 8 deletions(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/sta=
ging/media/sunxi/cedrus/cedrus_hw.c
> index 444fb53878d1..a22a8402fc60 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> @@ -71,11 +71,6 @@ int cedrus_engine_enable(struct cedrus_ctx *ctx)
>  	return 0;
>  }
> =20
> -void cedrus_engine_disable(struct cedrus_dev *dev)
> -{
> -	cedrus_write(dev, VE_MODE, VE_MODE_DISABLED);
> -}
> -
>  void cedrus_dst_format_set(struct cedrus_dev *dev,
>  			   struct v4l2_pix_format *fmt)
>  {
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.h b/drivers/sta=
ging/media/sunxi/cedrus/cedrus_hw.h
> index 6f1e701b1ea8..4edf729c556d 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.h
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.h
> @@ -17,7 +17,6 @@
>  #define _CEDRUS_HW_H_
> =20
>  int cedrus_engine_enable(struct cedrus_ctx *ctx);
> -void cedrus_engine_disable(struct cedrus_dev *dev);
> =20
>  void cedrus_dst_format_set(struct cedrus_dev *dev,
>  			   struct v4l2_pix_format *fmt);
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c b/drivers/st=
aging/media/sunxi/cedrus/cedrus_vp8.c
> index 969677a3bbf9..4438c7e1bbda 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
> @@ -856,8 +856,6 @@ static void cedrus_vp8_stop(struct cedrus_ctx *ctx)
>  {
>  	struct cedrus_dev *dev =3D ctx->dev;
> =20
> -	cedrus_engine_disable(dev);
> -
>  	dma_free_coherent(dev->dev, CEDRUS_ENTROPY_PROBS_SIZE,
>  			  ctx->codec.vp8.entropy_probs_buf,
>  			  ctx->codec.vp8.entropy_probs_buf_dma);
>=20
> ---
> base-commit: 3fc9303dba01676c2090768126e5327e341b7761
> change-id: 20261112-cedrus-vp8-stop-cb2d66d855ff
>=20
> Best regards,
> -- =20
> Arun Iyengar <aiyengar1990@gmail.com>
>=20
>=20
>=20




