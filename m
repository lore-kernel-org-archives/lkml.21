Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795553709;
	b=44hoyfXLT/U0bXYMaWZB5iXH0BGQAma/R0kFQ2vHN9ZHZ1pjkT5Eo0fg8dvXmhuYOQg8
	 YqOw19NhtM1J+fFUa2p2ib5EflowAEIVp63EbXcX8Xvw7lQzprA96QbVbUw/Lzcl94kV4
	 Z5dJnfLbUeIKibACFfag2Ezsfi5jB/GzrWHWhtnRjrhZSGi/x6rBci5AFav7YtFTocOtW
	 D2p2Iulskr7QC25SWyXgsggEmDXG2rKl1Ciuxjh4JpzXlrIMJnzDzFgnPCs2yA6e7ztTl
	 +ESDf3m+BoNqZk527WJk4tkzXQdv6i2rBSDTezeUGv7U0zE2v6LEukLWKveryGeDKbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795553709;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=OT57QIIbgw1mNoCmc4Nd4ViyD4coW8RXoU/BWL17AVc=;
	b=Jr/JM+64/ZRtlYNZGtyaoVeswIm6kT5pyg7kdiw5E5kWYpzdzdNquqnRLgsvAb2Bz+UM
	 xNjK7z8zXjly3JI+ZgYJ9BW62Ok2SYRWg/Fiwled/DFdPTIIxG+7d59VgYmo3b1i1vMw+
	 FWsQ+CnYHyNbN8QMZg3m5BfoF5OyVdPACO42s12KRtlbIFCbxA57yvpowa+uj20lOdww1
	 JeB4UMRwjYUmmRpg3TmPzcolIb7VA4O5quESVMgxoEEQ6k4A5sttOGF47EMuTVL5nqwWI
	 mqU+KN7gmtu/HiloItUqmBeIIxvjlnZ4rqLsLvGpI/QEAUSNY7ayzL7wSNFfr37HCBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=AsXqa2X0;
	arc=none smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE762606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:55:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE762606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=AsXqa2X0
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-9495e8ae239so565051385a.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795553707; x=1796158507; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OT57QIIbgw1mNoCmc4Nd4ViyD4coW8RXoU/BWL17AVc=;
        b=AsXqa2X0Z8akbnIHJrtz2Q6snRX27AvTTIVWMqTUgURfZupv5nUqNVaFzMUx71RpEs
         ce78DjKAo2WX9CSUA0sIkT+RvNLvSIqy4hdoem2ri03GmWOCely4FmIpsAHOmIXhFhJ7
         xZ93F2eiV9QgVj34qW3bB+fTFXBOsXnjQ6cea8uG5F32xAcGN4sUmP+nVocjMvH4pstX
         bPOnuZSDLr4whb/kvDIUAW4M2CqnNLxm4TdFqyrT+Tej1Td4gLO8AypvwodVbQz90tkL
         QHSZZIeXPBUCkpC5mUQXnhcp0qjvW0jLtetelEKmDDnZwg1XQlxwyj0lj3WOd/7uG+v2
         ZOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795553707; x=1796158507;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OT57QIIbgw1mNoCmc4Nd4ViyD4coW8RXoU/BWL17AVc=;
        b=p6dLSe1rLZ3YJ9/CnAWyZTgQKIsM2lLf+aLKSYc/eY7D3YZZI4FgjChA50cZYIeZ20
         0VgJkluDqgBbSJcbqIAklCk6qtQGHuS0bIYFpL5ZJ52VOtE75ZbDFuyAQ22ssQdML/vZ
         inN8KaSdn0sQyVR63c9U5CSbW6X/RAUVH1hZYkuxIJgPkx/whNE4lEkcVu09DJ8w3fm8
         lH0XDF6TkSLluYmu8MBjxbGJ0K1WD2kSMGxBCXKl+haRneFOgA7e6KkFo2z1hvGhhfbC
         BYdXCUUlBf/v7/waKqEx15FFkVVekzGBS/DOyvqk1xQ92/gJi86yTGsrVZj+Ke37O91w
         09dw==
X-Forwarded-Encrypted: i=1; AL+hErGSzq3nCqEg8isAvIgYCD0sQSgf1YL+2q8jqlkAdncT2wm/mgWex8fVbWGOQd4FO3KhHXX0NfmeZY7IOOw=@vger.kernel.org
X-Gm-Message-State: APuU4Z83Ps744RkGCTYO8wEifvrFOJwgwMcLNZhRdN5X1sXd2lqkV9Bt
	+f9qlVX04vPXYmoRnF1R9lvCHVD7iDBMVidu3AYMdz7YiLh40xTsbqFWPACGRV4BbrQ0n3el7ey
	quod9
X-Gm-Gg: AZFdTZe5YFsMQuMi1/fskVQE6qmek7umEi+ZRW/YbyJAFp2z1sCKOzq3uhoBR4zVhd0
	6FEc/pPC7GVgtgBpMXz/YsQZ4h727DJ3aLGIw2c91KNV4mwSm/1+7VNehpojopYy4SdoJbbRcLl
	IrzFLX1a+O5dOZBhyQXcQkDWSf/tY5naHoQJzKNcWsXpGYn3n/jLyq5/SIR5ICfVxYXkir9o6cl
	k/UsjXuEDJ4RSIcACYdEPgtCD2wL7mQIv2OvxrnQ2i2DSc2kHOjpHH3NBA7XgLjAWp7XQEeX8Dl
	sWba+xtSHGpuiDlvbhBLtV6B4/1/OyRgJyocB/fYkbgQZZUfbmJzs2xZkeVHX/qhmINnKgaOVya
	le7t41wFy6SBG0CbNZRxQKYs7EkZT0jPA365OLiFZlwvUuw3hHHXMIXFvCZO29R0QfSU03qLIg4
	H1TJjazI7tfsUgBaZPKKBpOaQp+z1AFU0RBp01802OPn93UY6K9HC//JhYrtp0zuDWWCbm9LjTM
	Vi/r28kKgyFH7JbkkzJFoFIfad9Y7DJdZwBhFu5FCE5O8voBHx9dqjy7EEw+dJK7tOe7NTvKX++
	IctvuNYvkL6SLqxH0iROaHbQgB6H3HIdFO5lYBqYP7mhAEIr27/9BYE=
X-Received: by 2002:a05:620a:6f02:b0:93b:bc51:b40 with SMTP id af79cd13be357-949ba84ac50mr2649854985a.2.1795553707568;
        Tue, 24 Nov 2026 12:55:07 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb40ea12sm1141447585a.35.2026.11.24.12.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:55:06 -0800 (PST)
Message-ID: <82a6933335048ca8f9969481cde8340dac19ccb1.camel@ndufresne.ca>
Subject: Re: [PATCH v2 06/17] media: v4l2-mem2mem: drop curr_ctx member from
 v4l2_m2m_dev struct
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
Date: Tue, 24 Nov 2026 15:55:05 -0500
In-Reply-To: <20260916-spu-rga3multicore-v2-6-23aa2cb74e61@pengutronix.de>
References: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
	 <20260916-spu-rga3multicore-v2-6-23aa2cb74e61@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-qDFQbRP8sfMUezyW9fo/"
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

--=-qDFQbRP8sfMUezyW9fo/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 16 septembre 2026 =C3=A0 17:09 +0200, Sven P=C3=BCschel a =C3=
=A9crit=C2=A0:
> Drop the curr_ctx member from the v4l2_m2m_dev struct in preparation of
> adding support for running multiple jobs in parallel.
>=20
> The curr_ctx member of a v4l2_m2m_dev was used to track the
> currently running context. But the currently running context will always
> be at the top of the job_queue. As the TRANS_RUNNING flag can be used to
> check if the queue head is already running, the curr_ctx member can be
> completely dropped.
>=20
> By eliminating the struct member the code is mostly agnostic whenever
> only one job is running at a time or multiple run at the same time. The
> main exception is the v4l2_m2m_get_curr_priv function, which is by it's
> design incompatible with running multiple jobs in parallel.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
>=20
> ---
> v2:
> - split curr_ctx removal into a separate commit
> - add WARN_ON to _v4l2_m2m_job_finish to prevent mismatching context to
>   device (and an unused m2m_dev argument)
> - rewrite v4l2_m2m_get_curr_priv to get private data inside the spinlock
>   (https://sashiko.dev/#/patchset/20260606-spu-rga3multicore-v1-0-3ec2b15=
675f7%40pengutronix.de?part=3D5)
> ---
>  drivers/media/v4l2-core/v4l2-mem2mem.c | 61 ++++++++++++++++++----------=
------
>  1 file changed, 33 insertions(+), 28 deletions(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-=
core/v4l2-mem2mem.c
> index a65cbb124cfe0..60cca94195166 100644
> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> @@ -84,7 +84,6 @@ static const char * const m2m_entity_name[] =3D {
>   *=09=09=09v4l2_m2m_unregister_media_controller().
>   * @intf_devnode:=09&struct media_intf devnode pointer with the interfac=
e
>   *=09=09=09with controls the M2M device.
> - * @curr_ctx:=09=09currently running instance
>   * @job_queue:=09=09instances queued to run
>   * @job_spinlock:=09protects job_queue
>   * @job_work:=09=09worker to run queued jobs.
> @@ -93,7 +92,6 @@ static const char * const m2m_entity_name[] =3D {
>   * @kref:=09=09device reference count
>   */
>  struct v4l2_m2m_dev {
> -=09struct v4l2_m2m_ctx=09*curr_ctx;
>  #ifdef CONFIG_MEDIA_CONTROLLER
>  =09struct media_entity=09*source;
>  =09struct media_pad=09source_pad;
> @@ -232,8 +230,14 @@ void *v4l2_m2m_get_curr_priv(struct v4l2_m2m_dev *m2=
m_dev)
>  =09void *ret =3D NULL;
> =20
>  =09spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
> -=09if (m2m_dev->curr_ctx)
> -=09=09ret =3D m2m_dev->curr_ctx->priv;
> +=09if (!list_empty(&m2m_dev->job_queue)) {
> +=09=09struct v4l2_m2m_ctx *first_ctx =3D
> +=09=09=09list_first_entry(&m2m_dev->job_queue,
> +=09=09=09=09=09 struct v4l2_m2m_ctx, queue);
> +
> +=09=09if (first_ctx->job_flags & TRANS_RUNNING)
> +=09=09=09ret =3D first_ctx->priv;
> +=09}
>  =09spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> =20
>  =09return ret;
> @@ -252,14 +256,9 @@ EXPORT_SYMBOL(v4l2_m2m_get_curr_priv);
>  static void v4l2_m2m_try_run(struct v4l2_m2m_dev *m2m_dev)
>  {
>  =09unsigned long flags;
> +=09struct v4l2_m2m_ctx *chosen_ctx;
> =20
>  =09spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
> -=09if (NULL !=3D m2m_dev->curr_ctx) {
> -=09=09spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> -=09=09dprintk("Another instance is running, won't run now\n");
> -=09=09return;
> -=09}
> -
>  =09if (list_empty(&m2m_dev->job_queue)) {
>  =09=09spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
>  =09=09dprintk("No job pending\n");
> @@ -272,13 +271,18 @@ static void v4l2_m2m_try_run(struct v4l2_m2m_dev *m=
2m_dev)
>  =09=09return;
>  =09}
> =20
> -=09m2m_dev->curr_ctx =3D list_first_entry(&m2m_dev->job_queue,
> -=09=09=09=09   struct v4l2_m2m_ctx, queue);
> -=09m2m_dev->curr_ctx->job_flags |=3D TRANS_RUNNING;
> +=09chosen_ctx =3D list_first_entry(&m2m_dev->job_queue, struct v4l2_m2m_=
ctx, queue);
> +=09if (chosen_ctx->job_flags & TRANS_RUNNING) {
> +=09=09spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> +=09=09dprintk("Another instance is running, won't run now\n");
> +=09=09return;
> +=09}
> +
> +=09chosen_ctx->job_flags |=3D TRANS_RUNNING;
>  =09spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> =20
> -=09dprintk("Running job on m2m_ctx: %p\n", m2m_dev->curr_ctx);
> -=09m2m_dev->m2m_ops->device_run(m2m_dev->curr_ctx->priv);
> +=09dprintk("Running job on m2m_ctx: %p\n", chosen_ctx);
> +=09m2m_dev->m2m_ops->device_run(chosen_ctx->priv);
>  }
> =20
>  /*
> @@ -469,15 +473,16 @@ static void v4l2_m2m_schedule_next_job(struct v4l2_=
m2m_dev *m2m_dev,
>  static bool _v4l2_m2m_job_finish(struct v4l2_m2m_dev *m2m_dev,
>  =09=09=09=09 struct v4l2_m2m_ctx *m2m_ctx)
>  {
> -=09if (!m2m_dev->curr_ctx || m2m_dev->curr_ctx !=3D m2m_ctx) {
> +=09if (!m2m_ctx || !(m2m_ctx->job_flags & TRANS_RUNNING)) {
>  =09=09dprintk("Called by an instance not currently running\n");
>  =09=09return false;
>  =09}
> =20
> -=09list_del(&m2m_dev->curr_ctx->queue);
> -=09m2m_dev->curr_ctx->job_flags &=3D ~(TRANS_QUEUED | TRANS_RUNNING);
> -=09wake_up(&m2m_dev->curr_ctx->finished);
> -=09m2m_dev->curr_ctx =3D NULL;
> +=09WARN_ON(m2m_dev !=3D m2m_ctx->m2m_dev);
> +
> +=09list_del(&m2m_ctx->queue);
> +=09m2m_ctx->job_flags &=3D ~(TRANS_QUEUED | TRANS_RUNNING);
> +=09wake_up(&m2m_ctx->finished);
>  =09return true;
>  }
> =20
> @@ -548,12 +553,15 @@ void v4l2_m2m_suspend(struct v4l2_m2m_dev *m2m_dev)
> =20
>  =09spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
>  =09m2m_dev->job_queue_flags |=3D QUEUE_PAUSED;
> -=09curr_ctx =3D m2m_dev->curr_ctx;
> +=09if (list_empty(&m2m_dev->job_queue)) {
> +=09=09spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> +=09=09return;
> +=09}
> +
> +=09curr_ctx =3D list_first_entry(&m2m_dev->job_queue, struct v4l2_m2m_ct=
x, queue);
>  =09spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> =20
> -=09if (curr_ctx)
> -=09=09wait_event(curr_ctx->finished,
> -=09=09=09   !(curr_ctx->job_flags & TRANS_RUNNING));
> +=09wait_event(curr_ctx->finished, !(curr_ctx->job_flags & TRANS_RUNNING)=
);
>  }
>  EXPORT_SYMBOL(v4l2_m2m_suspend);
> =20
> @@ -896,10 +904,8 @@ int v4l2_m2m_streamoff(struct file *file, struct v4l=
2_m2m_ctx *m2m_ctx,
>  =09q_ctx->num_rdy =3D 0;
>  =09spin_unlock_irqrestore(&q_ctx->rdy_spinlock, flags);
> =20
> -=09if (m2m_dev->curr_ctx =3D=3D m2m_ctx) {
> -=09=09m2m_dev->curr_ctx =3D NULL;
> +=09if (m2m_ctx->job_flags & TRANS_RUNNING)
>  =09=09wake_up(&m2m_ctx->finished);

Sashiko report that wake_up() is unreachable, that job_flags have been clea=
r
previously.

If that is correct, its not a big issue:

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> -=09}
>  =09spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags_job);
> =20
>  =09return 0;
> @@ -1194,7 +1200,6 @@ struct v4l2_m2m_dev *v4l2_m2m_init(const struct v4l=
2_m2m_ops *m2m_ops)
>  =09if (!m2m_dev)
>  =09=09return ERR_PTR(-ENOMEM);
> =20
> -=09m2m_dev->curr_ctx =3D NULL;
>  =09m2m_dev->m2m_ops =3D m2m_ops;
>  =09INIT_LIST_HEAD(&m2m_dev->job_queue);
>  =09spin_lock_init(&m2m_dev->job_spinlock);

--=-qDFQbRP8sfMUezyW9fo/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawX5qQAKCRDZQZRRKWBy
9AHWAQCmqcFAQMkugv7AJiaX/VEcrfFOq0yeQoHoehSg1I0udQEAkDiuFPHBWI6B
ZlpYRZjVAmYDkdC/FdAGAE99MAig2ww=
=f+mj
-----END PGP SIGNATURE-----

--=-qDFQbRP8sfMUezyW9fo/--
