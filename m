Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795558375;
	b=jKWRrABsEF3GcRn3oqpJncyq0ts6zUZTbvJpSMhgSBoiRyFjnlqegMgz29qi+UKVYNKL
	 ytET4gAjZ+vH9NTYNbiTiD70jR4yemkz6kVPirAp6I/dXmrMhpDiNEbGIbYUAlgCKKroa
	 dd7CoZ9+KOe2g78l/CykGie8Wx8r7yvFvVptPvPZ4MWGpbkyKqv0OQq9vMSPFtmfivIoz
	 YaEk82CdFw1wzWXrxXiEJT/kV00HfTukLqrkd1O3bH7kYNAVC+I9NmpL09UfQzjAE5PS/
	 aF2NUv7aBjTmQpxqAhkYyccAznf695I//5Yo4W0gGmUGqDF1wiiiRtXd05k/nXo/QPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795558375;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=a+lCQh9rFeHZpRcts8xKmbAzUymCGM5+mzuki638UuI=;
	b=JxUKtaRNuJ/0XvLhzaDVQlrqAy/YqExJSuNK3AyU5MGbET9Nz+CkcQG9GkBGn7yxPqmn
	 bX+8YTAPrgFlwAVUQrGHDDxx0WMBfanYtOY++I53iNdsPNjupyEVSghPCK5MUDJ6cgPBX
	 Cec3vfr1MojFKNWtcUiBl3tkZOCw7vHG/KCA7VvfvTg8HJfVpE+Sde6UijhZBfLQHiUIR
	 xp/qk2Je0ksMiSYCOkKXIJ1d8y3/azMSX6alt2SPEN5YQyoee4hCtvYIEjsfQv1H5peTB
	 OGcMn2QnvHapFcfraDImC0niusSh+4Dz98l2Sa/eJKcGDS1eTRsg6iurvR3U36IVW7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=I2XVqDN9;
	arc=none smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BB9606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:12:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83BB9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=I2XVqDN9
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-930c0f9c1b1so531325985a.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795558374; x=1796163174; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a+lCQh9rFeHZpRcts8xKmbAzUymCGM5+mzuki638UuI=;
        b=I2XVqDN9DEPyLiayQzz/N/Ji/74i6qgmANoQlCH0gBUSconoKdJE0r1vzhxVt9vobq
         qQ/yFqkVc5KfzvXUESXKXd5eT5E0CjzDdMBNFwvTxzX1NQx9wJ4xFMpcNBjrRF4ayQA5
         i75qQnXUSEoKBZiebF0TaEdeV8tPtM5RXZWFc+1pTnEgzicwolv9mzdR5v7rrz1OIQeX
         Lr//EtTWhn3z8jiuFlqZhSEkMKtxGQ93vF86kpeIeylbxQ4kXofSki/NshTNKv0JIS/5
         yiLBITHIC7NBmoSeZyhdURVAoFC7kd2TvhNih16fP1N0fM8Kucd1XRIslkUKTv/mhXQj
         TBaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795558374; x=1796163174;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a+lCQh9rFeHZpRcts8xKmbAzUymCGM5+mzuki638UuI=;
        b=j4Pqkn2MX6E0t7ZYo9ZwyCR2k4Xa1nMvpAQWKp8iydaa071hrz9CPHE4vq2hE7BmfM
         8rjygZ4uZK4X3bmj47eAdtYbIXwGruNoIKX8zEleritmcI2aMiNDVL0qPDqh0aHxeWAM
         fLOfhq2cK0Iljpt7gMovVJVNnAAVQhbxBuoyP4wshkJMI6PQ/zvfdoFB1gcGg72b/T9W
         hpYPoRdsR70TuC9qtXEUS5NyEVG5WHBNuHrEc6L1ub55SKnWM4LYWD1K6v+7HbIwyXBc
         1mA0zfyfplO8HchLThEYEjYSY3iSnskuIT3oR8/dv7wSe0dShHLZqWXX9/4CAJVqyMH9
         0d7w==
X-Forwarded-Encrypted: i=1; AL+hErEG0Tgs6y16w49I6ig3YHw0hQOs+H57eoUFVviCxJM/hK7FwRGhyDPcPuxjRCgX9OdeguvCsE6PESXHVe4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IBipwUvX2Zav84qTAunTIa28ZlhxflhFfjTublXxEbQ3nBkQP
	JsVRJMh8sWobVIlO6D+rVSbyuBYJ+lhd/uO6u5ThdOxPvD5yD7Cz/r0qsFEFwMc+0yI=
X-Gm-Gg: AZFdTZeBAzhxQSEAhEFn0K0Hd53gCT0lHYoUf8P2hyGq3Z+mu9RJhvsYg9g5WEWZ4yL
	j9IYzrts6GkGQuos9UY5jDV0piXkk7NSdh40NsLKmW4CjZPLgHQKN58LfUWMMeO8Ct44KptXjjE
	84rNFPXgrKucK0rLnfgEAcNphiSuap3/y9tZ1Je5rzvc/uiGBGz4Wek5e/yW/Oh2ODPjaBEQPDj
	ss9CKYhYqFxN+Pu8h4ap7GmzqixX4t94SWgfRKhFRyYFtAArEU/r7odMOYOt054fyx8es7v4zqG
	uSzDix7knMvdPEGkqvj3gs2kXk35pqCg5gD16BDYjVa4obin9pjU9CHWWeOYqVgi473KR9AX5Fs
	RLeax4j9Lt6EGDbzWFyULBfvATFrJZfrogIm49mlZROo9ghog5kdRFcFhEi7tAiH5b/PsmriMhR
	g1l1xzBDvkXBHByyrksFLsWMeib6W61wjuntToLKuacF9OM6Rs1wW3yVc2QFfLrLYfhvJV9YZjs
	GqFx+fBOeUev9awBtWtODtpYsuQJhIGnTvYd2zOJKpu/2rKbNSbUOkzTHkFdwQTYu5IcHQdnOVv
	YYZCKt+qyb2Gk5WrNrl3GxmRSzjX8t4VyHYu4NMvwdw1XkouIpO9kZ+SEQ+GnhIh4idxsy5k4os
	a
X-Received: by 2002:a05:620a:7087:b0:93f:633b:ee1f with SMTP id af79cd13be357-949ba9c6b95mr3002134585a.28.1795558374358;
        Tue, 24 Nov 2026 14:12:54 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3bec3dsm1148251585a.23.2026.11.24.14.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:12:53 -0800 (PST)
Message-ID: <16ae904e41539059dbe1649551c1c903295690b3.camel@ndufresne.ca>
Subject: Re: [PATCH v3 04/17] media: v4l2-ctrls: validate av1 tile info
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sofus Forstreuter <sofus.c@icloud.com>, Sven Peter <sven@kernel.org>, 
 Janne Grunau
	 <j@jannau.net>, Neal Gompa <neal@gompa.dev>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel
	 <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>, Daniel Almeida
	 <daniel.almeida@collabora.com>, Xiaoyong Lu <xiaoyong.lu@mediatek.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Date: Tue, 24 Nov 2026 17:12:51 -0500
In-Reply-To: <20261020-avd-v3-4-85cbaa2125d8@icloud.com>
References: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
	 <20261020-avd-v3-4-85cbaa2125d8@icloud.com>
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
	protocol="application/pgp-signature"; boundary="=-TfGKB/izRKTkKjOJIU01"
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

--=-TfGKB/izRKTkKjOJIU01
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 20 octobre 2026 =C3=A0 11:37 +0200, Sofus Forstreuter a =C3=A9crit=
=C2=A0:
> Many drivers use tile_cols and/or tile_rows, so make sure they are
> valid.
>=20
> Increase V4L2_AV1_MAX_TILE_COUNT to MAX_TILE_COLS * MAX_TILE_ROWS
>=20
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls-core.c | 15 +++++++++++++++
>  include/uapi/linux/v4l2-controls.h        |  2 +-
>  2 files changed, 16 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4=
l2-core/v4l2-ctrls-core.c
> index 661a3a25da52..922cf74c4eb8 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -800,10 +800,25 @@ static int validate_av1_film_grain(struct v4l2_ctrl=
_av1_film_grain *fg)
>  =09return 0;
>  }
> =20
> +static int validate_av1_tile_info(struct v4l2_av1_tile_info *ti)
> +{
> +=09if (ti->tile_cols > V4L2_AV1_MAX_TILE_COLS ||
> +=09    ti->tile_rows > V4L2_AV1_MAX_TILE_ROWS)
> +=09=09return -EINVAL;
> +
> +=09if (ti->context_update_tile_id >=3D ti->tile_cols * ti->tile_rows)
> +=09=09return -EINVAL;

Make sure to update std_init_compound() so that the default passes the chec=
k
please.

> +
> +=09return 0;
> +}
> +
>  static int validate_av1_frame(struct v4l2_ctrl_av1_frame *f)
>  {
>  =09int ret =3D 0;
> =20
> +=09ret =3D validate_av1_tile_info(&f->tile_info);
> +=09if (ret)
> +=09=09return ret;
>  =09ret =3D validate_av1_quantization(&f->quantization);
>  =09if (ret)
>  =09=09return ret;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2=
-controls.h
> index d17e41d51d2e..abdfa102a77b 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -2939,7 +2939,7 @@ struct v4l2_ctrl_vp9_compressed_hdr {
>  #define V4L2_AV1_MAX_NUM_PLANES=09=093
>  #define V4L2_AV1_MAX_TILE_COLS=09=0964
>  #define V4L2_AV1_MAX_TILE_ROWS=09=0964
> -#define V4L2_AV1_MAX_TILE_COUNT=09=09512
> +#define V4L2_AV1_MAX_TILE_COUNT=09=094096

Hmm, added Daniel in CC, no idea how we ended up with 512 here. This will
increase MTK insance size, but the communication with the firmware seems
dynamic.

Hantro is limited to 128 and properly reject anything above. So in all, sho=
uld
be fine, unless there is a problem with MTK firmware, which which case I'd
suggest to program the original limit in there. Also added Xiaoyong in CC.

> =20
>  #define V4L2_AV1_SEQUENCE_FLAG_STILL_PICTURE=09=09  0x00000001
>  #define V4L2_AV1_SEQUENCE_FLAG_USE_128X128_SUPERBLOCK=09  0x00000002

--=-TfGKB/izRKTkKjOJIU01
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawYL4wAKCRDZQZRRKWBy
9AqIAQD/Po4bqlGbwwvzn3azk4B+6lvUS+G/w/qpKmt706DCrgEA7eZ3FFzsMcQl
GNrZH0OYicvPvO4L1n4kg3NLn/HwGgg=
=kmno
-----END PGP SIGNATURE-----

--=-TfGKB/izRKTkKjOJIU01--
