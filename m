Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795553073;
	b=zSEVKDx5n1+IBwedl69fCV1fPWaRdhjyz9BcU0kvbydgZ7224Tf9uNzYVlqzRvlj0F6y
	 EuwKfDup0T+MJii/k6nq2jzAjzUUaX2djM0+AsbbgywATUgyQLWJNglK6+hQu0fpkRpbl
	 m4Nz3zKEX+t2UBSrTEKwM+FA2RzBrYuBkN2amjvGI0h27aJYaHiZ2L5q0SSWO40N2Qx0H
	 F/IxTfZimxEaqMIDjDSCHmQKuHB+rc/kkM0lOd6izdB+RMa82ktJbEyq3gHHwWbPiYotH
	 3FU4I0Vu50mCpVWg/V4pqhX+aPp8huZ6CMatZArkcPcHXzXmdEXh5fpyjyTwgUpINEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795553073;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=jyAVIemv4fWXyD+LtqEPdzMQSiUFyBaf0aWHkJ+3gZ0=;
	b=JLrelesX3Rn9I3q79qVuTWHRApJ1O3J6VZnCQcCdz93Sh/itYUBBj1i8aTeymySHMoFi
	 wCFWlgREggitGG9yH8Z5Pya6ppd2bI0S9K03GwWWMHDhpB73Q7YyLkAF7RcF0A5XwHsTY
	 +A5Dcmh1VYyo9BME+a5dkx3gHIKHaCztKiwvMss3ptA2NP8pDiwb2tbG/6/0pIcn478no
	 kKDwz49TgyzOVE0TTp8yCMQS06F6R3CR8yK8G9EVroNxnQZMJREyZlNrREdqb9bcuV7vZ
	 IoanG0xMjryqaiDKwlyXQI2xFFnukTE6YlTz6ySSqFRKxdDkJlmyc9cGIh8GB5SZPKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gKrPXqn3;
	arc=none smtp.remote-ip=209.85.222.170
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B218E606A323
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B218E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gKrPXqn3
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-94959217274so529534885a.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795553071; x=1796157871; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jyAVIemv4fWXyD+LtqEPdzMQSiUFyBaf0aWHkJ+3gZ0=;
        b=gKrPXqn3hGkxNlxFMHASxpt3ERkdHVwCcv8vY5oT2YRf/Q2u6Lm7mac+dQ+XFHKGcG
         TqvdelxNvsg7NLhtEhQc93CCKIommP3U5nr/nNj/XLNkKK94RVtUbDd6ijqw6l1EarS3
         iudsnZW624SpDrUuRoK/R+pungt/2sJY+Pl/0+aLUaDMoWY7ht0CxrS/7ydVr2LZSvCk
         jwvee1iugbWsvekuM+E7NyG/a3hDDQdWvBZ1igdMai6QrDnfkgjbnPY2ZjgJw46R0n2w
         fzev0M7BUAVtyHLmTvROFQuxp94Ig6s5TDqpC1gCIYyhZawN7nrhJ/T3xeUJnhyV56N/
         tC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795553071; x=1796157871;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jyAVIemv4fWXyD+LtqEPdzMQSiUFyBaf0aWHkJ+3gZ0=;
        b=QZ7oocG7tzSUk7NLBLhrHcvfrFKsnr5tWf0KW2rEXZo8hp+jwZWvrigs0R4fyYNI/o
         qMG1MyJt4MlFlaS3LWR60T6v8K4szisAV7Atx0RA3uJ0dB97go2jbClB85+PLuG6EVTy
         T/dP2Y4OXzJIWtNjg/fmLtdGlkxccY8JzjcSnhucfXDlnEyY0gvxKF8zKHoPO7iXhMVY
         7NSHiFUXoR8V5JJKbYk2G8WgTyZRJjPEJZeCfr3VKew5MvrXDj70nqM1ibZRzw+K0Mwp
         z4Daum21HwSPvgZakB5HrmWBxEuOPd4NgnroxJqgqak4MhMVNFX/iJIT/lXkEvw6XVQ6
         QxuQ==
X-Forwarded-Encrypted: i=1; AL+hErG1vn0zdGzGYBKBvbFkgh8mZO74YO3l1envwAXqKYQ+ZPObHyI8ExwXUvho8wVGqw6xNrGMZON8GgLwOdw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ubvGL9UIyfScFE17/eTv0YkMXV6Z2DbKLI3Opl3TmeFcQbV+G
	eshG7tNzBWhdTXbw9Mri2XA4XzwvyAXwN7ok/3swsmkrQ+dP97EUWphCZt2+rr/jSf4=
X-Gm-Gg: AZFdTZcumbyLWf+xe4d5dbtYKuo8LDhkvgk9m0mPpyFffWxYMqtbTCrzo4S3KaAQJly
	J/AbkaPoR2ze2CGFBf9bK5813V0kOsKjqUlkuFq1qhJbG+GrEwxVXXho1lPJ7VMcFKCyYtQaCHi
	ulKHO7NzT9G2wEJLYkUxnRQMMjnxzDHavtnojc0SC63HRdq+us43vRhutGQE7T/e68Ki6meIjmb
	9eArvCkA0m9nT/AsjspxU3M3BCZ7ccNnHEgF/laJMicvFwe5Oy/Jy0mDpopmAx/REnCEG1B/nHX
	x/aw7Dgxad1LtZ2VqLE12lGDMNVt4HDDEwOi600LFvu+sdBq7drZXN0937gZ7oljL++GPZp2tFy
	AvQoYIg2S6RBP4E+5q9+la/t/LEbm8w3rwhuYtnnddFN1NTa2J0heGWnGcOCr8hFbJ59iCJgZQO
	7AVQ5IBGvfUOm0B73ztJ8T9H2+KvQgXF+ztdxqXtcBu6n9c2GGkdo9ERbUOwPTE7sJ3yCi4txRd
	fomv70B8hKTZNFq6aZc80FXpAYV4IbSYaAw8ImbV3OAffs0mwezRKcytV2sWIMAjPkgAsMXF6+g
	nPxXU3Bskk2N5Jqs5nbCHKpYd5pQCCuvLVa7WNq4mh+VUko2xmJGZqw=
X-Received: by 2002:a05:620a:45a2:b0:946:2a0:a11b with SMTP id af79cd13be357-949ba9cddeamr2766829985a.35.1795553071093;
        Tue, 24 Nov 2026 12:44:31 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb418241sm1116481885a.38.2026.11.24.12.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:44:30 -0800 (PST)
Message-ID: <31ccb07818b643bc483e07184d7ecaf918be84ca.camel@ndufresne.ca>
Subject: Re: [PATCH v2 01/17] media: rockchip: rga: zero cmdbuf in shared
 code
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Philipp Zabel
	 <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@pengutronix.de, Detlev Casanova <detlev.casanova@collabora.com>, 
 Michael Tretter <m.tretter@pengutronix.de>, Guangshuo Li
 <lgs201920130244@gmail.com>
Date: Tue, 24 Nov 2026 15:44:27 -0500
In-Reply-To: <20260916-spu-rga3multicore-v2-1-23aa2cb74e61@pengutronix.de>
References: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
	 <20260916-spu-rga3multicore-v2-1-23aa2cb74e61@pengutronix.de>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-rmu7i0hUOnNVmWqXcZ0e"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

--=-rmu7i0hUOnNVmWqXcZ0e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 16 septembre 2026 =C3=A0 17:09 +0200, Sven P=C3=BCschel a =C3=
=A9crit=C2=A0:
> Zero the command buffer (cmdbuf) in the shared code instead of the
> individual RGA2/RGA3 implementations. Besides centralizing the memset
> operation this also uses the cmdbuf_size member for the memset size,
> which is also used as the size for the actual allocation.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/rockchip/rga/rga-hw.c  | 2 --
>  drivers/media/platform/rockchip/rga/rga.c     | 1 +
>  drivers/media/platform/rockchip/rga/rga.h     | 3 +++
>  drivers/media/platform/rockchip/rga/rga3-hw.c | 2 --
>  4 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media=
/platform/rockchip/rga/rga-hw.c
> index be1bc8ddbd03b..4d7b0a03820a1 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -443,8 +443,6 @@ static void rga_cmd_set(struct rga_ctx *ctx,
> =20
>  static void rga_hw_setup_cmdbuf(struct rga_ctx *ctx)
>  {
> -=09memset(ctx->cmdbuf_virt, 0, RGA_CMDBUF_SIZE);
> -
>  =09rga_cmd_set_mode(ctx);
>  =09rga_cmd_set_trans_info(ctx);
>  }
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index b3cb6bf8eb863..bd0afd33affe4 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -41,6 +41,7 @@ static void device_run(void *prv)
>  =09spin_lock_irqsave(&rga->ctrl_lock, flags);
>  =09if (ctx->cmdbuf_dirty) {
>  =09=09ctx->cmdbuf_dirty =3D false;
> +=09=09memset(ctx->cmdbuf_virt, 0, rga->hw->cmdbuf_size);
>  =09=09rga->hw->setup_cmdbuf(ctx);
>  =09}
>  =09spin_unlock_irqrestore(&rga->ctrl_lock, flags);
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/pl=
atform/rockchip/rga/rga.h
> index bd431534d0d39..2b4f5694375a4 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -152,6 +152,9 @@ struct rga_hw {
>  =09u8 stride_alignment;
>  =09u8 features;
> =20
> +=09/*
> +=09 * Requires that the cmdbuf is already zeroed.
> +=09 */
>  =09void (*setup_cmdbuf)(struct rga_ctx *ctx);
>  =09void (*start)(struct rockchip_rga *rga,
>  =09=09      struct rga_vb_buffer *src, struct rga_vb_buffer *dst);
> diff --git a/drivers/media/platform/rockchip/rga/rga3-hw.c b/drivers/medi=
a/platform/rockchip/rga/rga3-hw.c
> index c4a71306278ba..46ba6d270f232 100644
> --- a/drivers/media/platform/rockchip/rga/rga3-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga3-hw.c
> @@ -261,8 +261,6 @@ static void rga3_cmd_set_wr_format(struct rga_ctx *ct=
x)
> =20
>  static void rga3_hw_setup_cmdbuf(struct rga_ctx *ctx)
>  {
> -=09memset(ctx->cmdbuf_virt, 0, RGA3_CMDBUF_SIZE);
> -
>  =09rga3_cmd_set_win0_format(ctx);
>  =09rga3_cmd_set_trans_info(ctx);
>  =09rga3_cmd_set_wr_format(ctx);

--=-rmu7i0hUOnNVmWqXcZ0e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawX3LAAKCRDZQZRRKWBy
9AhMAQCGhrDq6Wo05uGIwcgUspFxMR11dARVIwEBmUuM3LVIJwEAocRRq6OhxGmC
mVkh4hNw4ukUg+HMXCrf96F1LggktwY=
=ZVCJ
-----END PGP SIGNATURE-----

--=-rmu7i0hUOnNVmWqXcZ0e--
