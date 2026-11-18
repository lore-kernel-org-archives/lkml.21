Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794999126;
	b=ZcnGkS+e7NAwWI6DpRbA2L8OwJyQlDylVCEd/wYC4P7mQmdmv708p3RtxBmznYAeJJU4
	 +KMRSXcz7KWj8a6PIXCWVotkI5HMpBD5L0kIYGVr+gahEZVgvd4Fo3KGqPttgOHSCsh27
	 MwRlDIizW8/zKtKdRwv/fdIYuGVWtBjIxQ1Ue7vYB6whr4ygZN5Vc+I5irPOps8YS3xtN
	 +Xk4B91wyXz0fZyUy0K60xCEy7aNaQSqksEbdXGC01KO8Rqgy0mgRyXLSWdB8ahp0pGPA
	 Rqw+VgHLiN0FIfkEFUvDDq6F/X9M5k/998C1CvEwY+/DF+tplLq+DOjMzIxB/I48a5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999126;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=6V3F/TSXzJ1yFzQQyqbXX2wh+A56YFrKNfrIyDrkHyU=;
	b=QbuYtDxycy2ZSaES+SCs+lfaDNSz+/lz+dIXCSbaA4K+6Q1/qPIQT1aeqtuvvSJwJxlI
	 X3cib3VmLPjC6aFczj/ceK1Jl6vX/AbksOLKgU8PF5TYB2CrP9h9DqKetst5C9nub3DpP
	 Vc1xhLw+Cy6FSHfCWWum4GpjnDJv7aYJ0TO2E+nJ2wDkVi4sk+2JPHbIdNV9sEu7rF93+
	 zcqgwfcSnaQw8+wov9gjcGczPJZ3WE77dznS1uOpXqIl8TuHhYs2gJPknME+XIaFlWUy3
	 mPJV1npyLjdEZnwDm3fqLPc6auWr13BKrLyjtjTuaNK/HVS4WMt9px9cUGJNR7blVKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=zYkl0DE+;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC93606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:52:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AC93606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=zYkl0DE+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=6V3F/TSXzJ1yFzQQyqbXX2wh+A56YFrKNfrIyDrkHyU=; b=zYkl0DE+BVYT/mUnLuS3fQ6W70
	t/AyqNTeS/4GSW+JIuxVvD3nUaGdWQBC42zY9ZUplSWYj3d74AQ1N9/8bvKVYIa7ZQQzSn4t8H/5L
	wxpNTybpbCgzNVuyep6yi1Gp1f+ICVX/CUsMscDnot7QOPkT2btd+xjeVwGVJrdwggM2S+sDYmqmT
	WqwZEantW8hLovgBZl4ODBLBwajCPq+kUaMkSrno+ri8sALz+VSUCcA+q7CNk/i+QLvWRF2XM9A1C
	8toJHpiEJOCMUr4LFfe9oLei4Nu2bLH30d7gUyqt/zD+FrnnXrfuJst/TEHAVIkb7VQgMxUsuA0u3
	pQOS5u5Q==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Oded Gabbay <ogabbay@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Triet Hoang <triet.hoang.dev@gmail.com>,
 Sidong Yang <sidong.yang@furiosa.ai>, Igor Paunovic <royalnet026@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] accel/rocket: Fix up sched array handling on open and close
Date: Wed, 18 Nov 2026 11:51:52 +0100
Message-ID: <wyynHb1JRJGu60KFW3VQvQ@sntech.de>
In-Reply-To: <20261118101901.253550-1-tomeu@tomeuvizoso.net>
References: <20261118101901.253550-1-tomeu@tomeuvizoso.net>
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

Am Mittwoch, 18. November 2026, 11:18:58 Mitteleurop=C3=A4ische Normalzeit =
schrieb Tomeu Vizoso:
> Don't WARN when drm_sched_entity_init() fails in rocket_job_open().
> It can return -ENOMEM, which is an allocation failure and not a
> driver bug, so it doesn't deserve a stack trace.
>=20
> Also free the scheduler array in rocket_job_close() only after the entity
> has been destroyed, so that entity->sched_list never points to freed
> memory.
>=20
> Fixes: d341ef030f3c ("accel/rocket: Check allocations before use")
> Fixes: 9bca2b5f1a4f ("accel/rocket: Keep scheduler allocation in rocket_f=
ile_priv")
> Suggested-by: Sidong Yang <sidong.yang@furiosa.ai>
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> Link: https://lore.kernel.org/all/20260826113538.42111-1-sidong.yang@furi=
osa.ai/
> Link: https://lore.kernel.org/all/20260826113538.42111-2-sidong.yang@furi=
osa.ai/
> ---
>=20
> This addresses a mistake I made when I missed the v6 of the
> "accel/rocket: Fix allocation handling and scheduler array leak" series
> and pushed v5 to drm-misc-fixes.
>=20
> With these changes, both drm-misc-fixes and drm-misc-next contain the
> same code in these functions and there should be no conflict when the
> two are merged.
>=20
> This is to apply to drm-misc-fixes only.
>=20
> ---
>  drivers/accel/rocket/rocket_job.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/roc=
ket_job.c
> index 7b798a90bc49..454d465a39e3 100644
> --- a/drivers/accel/rocket/rocket_job.c
> +++ b/drivers/accel/rocket/rocket_job.c
> @@ -572,7 +572,7 @@ int rocket_job_open(struct rocket_file_priv *rocket_p=
riv)
>  				    DRM_SCHED_PRIORITY_NORMAL,
>  				    scheds,
>  				    rdev->num_cores, NULL);
> -	if (WARN_ON(ret))
> +	if (ret)
>  		kfree(scheds);
>  	else
>  		rocket_priv->scheds =3D scheds;
> @@ -584,8 +584,8 @@ void rocket_job_close(struct rocket_file_priv *rocket=
_priv)
>  {
>  	struct drm_sched_entity *entity =3D &rocket_priv->sched_entity;
> =20
> -	kfree(rocket_priv->scheds);
>  	drm_sched_entity_destroy(entity);
> +	kfree(rocket_priv->scheds);
>  }

Reviewed-by: Heiko Stuebner <heiko@sntech.de>




