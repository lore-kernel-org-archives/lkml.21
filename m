Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795162358;
	b=PIHhJy+B1asK66nNs/cB95G+uz6RmI9H9wNx6KnB2XwncylwdAbbvhrWSOkJin83yKe5
	 v+quzQ67PerbINchcWUufF7I43am3gvibb91gnscgIrY8Oqo8akp6VdDnZ8MFkfAN4ijR
	 U2iGQ7OWPIs6fDcoEiV+jmeK0Un2Qq+6ULZxIhbbor4i7NtgkTlbx/mNTtVfrC0E98YnQ
	 qh3uosDyKLMMVqsHFj8/hrJmz+U7qaf+tlHUIdpuv6a4Y1HaKhEl0TyFLCIjT/S6gVFzJ
	 fJjqQxule6mkyyxOz8zCPdO+wa9OxG2W0oCVUZu9uXVPsecuD62mMwBE2X+ixxTzuSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162358;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=yny7ZCsaJaUBk2Uk+L6wiiJ87n/ATHV1ryvHlIqZ5Tk=;
	b=FzhXwdtY5MTwWSrsWUVh2Bv9Q61gUSL8pWIX/HUeuCM81s4vOxT+13zYEnvyJ4mYxlM3
	 nhO84q4NbxZ6O9jp35kon9TjZbDj2KlzkdkNQKjbacuZvaqxwyM6YaOd7q1wuXcbjPUcm
	 6WuDCnDpvI0I+FI4YVNZgmDzAXxxwlDOZPrEktu8iDo98l6hzo+wBO1R+XgVBQlaO9AHn
	 FiIyQiBEHIrz0wpFTa7UqHJ5x6ZTVbhVbKwipUWx+TIUJWw8VhFzHjgTt+j/pIpJ150Zk
	 cjgJ/9J8Gp5XOyoHRQUjDgVRCy3bX2rAKWCP2gD7UlvH5AzA5d7n3VlpykrHtLXrnyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IXUtFnpz;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=s9x3RE0W;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C454606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:12:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C454606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IXUtFnpz;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=s9x3RE0W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795162356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=yny7ZCsaJaUBk2Uk+L6wiiJ87n/ATHV1ryvHlIqZ5Tk=;
	b=IXUtFnpzoAOlbIDtwZ8WhauUJZdHs65FhMtsHlehbYKGFuQtSIzLQ05rq44Oin7UKOOCOa
	kgTRfMcZRJS7vZuQHdBwcX3guq+UwrCfP8qIn5R4jopj0s+IdzhXlTQvqZKl26KaScuSGn
	oDtm0JzRrhuAuvWBEPjm+TD9fbq+vMg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-488-2x5eM3jZMyONtp-lPPg89g-1; Fri, 20 Nov 2026 08:12:34 +0000
X-MC-Unique: 2x5eM3jZMyONtp-lPPg89g-1
X-Mimecast-MFC-AGG-ID: 2x5eM3jZMyONtp-lPPg89g_1795162353
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48c6a1d4034so329145f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795162353; x=1795767153; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yny7ZCsaJaUBk2Uk+L6wiiJ87n/ATHV1ryvHlIqZ5Tk=;
        b=s9x3RE0WoWIvHKOPPHwZ7FVniVBxSmeBH/V21eo4hE5BsskAduWe00X3OQGsEfuQyT
         UipSnLjKCav00OgeJw+RgPzaunyfh9gU6tNAQzQEMlZo/uYhEBOwaYQW4riGUN7KqD9q
         SyXiu2P+ARcVcvJEVH70vTlWiyKo2Aoq5DNGLkhF7bmT35xf5fAZ6lw26DHZRGwjo490
         MZI/7qUgrRg/jKGP/RnLj8RVKKUz9/gFyzCby+Zu2BGvl0eTu0CxISpW3lG1y9t+Cll9
         1Adb2CVVRGH2mtFEC5iF4/6njuoiPAG80I03WQ8DVfeFSYw+yZ0JP605UOExaI0QH1T7
         TQDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795162353; x=1795767153;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yny7ZCsaJaUBk2Uk+L6wiiJ87n/ATHV1ryvHlIqZ5Tk=;
        b=13zA/vUtbSvYdN2E6GQNUh0Cf7MjaLNM6stAKDCX1JrQJhd8YWGlTVOr/6s626vpMy
         Pb0MgHNThdjdoK22ysR4qTQdQhc2NkR/uYjzdykkPS/HxZ7KCpuwz9uzTopIeZ6z584V
         py3fEF/brXBCKoKzvlZMdyVhIylpbl8toPD68cp4f5opVWCQAYBoAN227SnM3zN+tZX9
         4oI/dFBQi84dD9l8w1mdw3kFJXW5gMn1SmhfxEb0O7i9MmfNcZDq1VHcjLqP9/6pLfpk
         f5MsPtYPVU547nq8wRIo+04NA6H9PbYroOiPvcBtRqJGbfJXSJv/DRFrlI7QFjHGswfX
         2ECQ==
X-Forwarded-Encrypted: i=1; AL+hErHhwLFITRTNZQzVCuyKVPLOuD8NEwNKS+OZ+hmA6BuBcraAYjO5o8x3DEQnvIZk1mU5ZPH4oBFKE0IjGT4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+S4vtj4EZAuz5rpzhDvakyTvGRdYrK3gf0jXBflaQ+7SecHyiH
	7TCEGCyL2lzInme46BxswWO/wV3qHRZJF9P43uQt1eaE3rNI2M2ad1DRg/nzu8wvjqV7EwGp/05
	0TilEG5fqKd/drPOZ0zM46KBFSatFkycURiVPdRJFvYAVahpzRvi9kt2D+Xcmx+8wVw==
X-Gm-Gg: AZFdTZeqELwZk0R+AwTlwsGJjJDgrAwJPGhusZCRsU60xlCIKYzaaMfQR1z3cxat0mf
	hQjace7EN3Kyci3XfxDdSBBVU1VmeupPh6zQgwoQ074L91ocRTMp0vcynrcZiX5k1x00SnedoCe
	W67+LYF7EFLe49bViZ/K9PgQEJnvLO6k0aUFJIs0MeZVItFJROUKjI3pG44LRHKh57+/g7J62hi
	J5KfvPlqS71ORDR/+vG0pD4WsPxWb/tSWj5/dL8JmjmZ1kh5Q7AinyGvG9+gBQceYh7bKKT91lp
	d0FbJ/Pb4ev0SbENTdKK4JZANqlz2ENAVwokI/PD0nnRLcKlZlL1jV2O/70Z6XQKeSb/gFREPVU
	Nfl3hk7c1zXNYef/QVBJB+I3LEm4xF2wI+/drV4WQHz9ecyrp/YbdEIZ/wIso6UH3Aw187WFQrc
	Av
X-Received: by 2002:a05:6000:22c2:b0:4ad:5e91:8fcb with SMTP id ffacd0b85a97d-4ad5e918ff5mr44920f8f.25.1795162352943;
        Fri, 20 Nov 2026 00:12:32 -0800 (PST)
X-Received: by 2002:a05:6000:22c2:b0:4ad:5e91:8fcb with SMTP id ffacd0b85a97d-4ad5e918ff5mr44869f8f.25.1795162352554;
        Fri, 20 Nov 2026 00:12:32 -0800 (PST)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.168.96.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf680fsm4565988f8f.14.2026.11.20.00.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:12:32 -0800 (PST)
Message-ID: <0a593f7ba6372245497cb9ac58dad1b71f9a2f4b.camel@redhat.com>
Subject: Re: [PATCH v8 08/14] rv: Support embedded target types in
 per-object DA storage
From: Gabriele Monaco <gmonaco@redhat.com>
To: wen.yang@linux.dev
Cc: Nam Cao <namcao@linutronix.de>, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 20 Nov 2026 09:12:30 +0100
In-Reply-To: <49fd8e0482d2cf1f9c690031ab0cf9cc1eb1c5ad.1793900349.git.wen.yang@linux.dev>
References: <cover.1793900349.git.wen.yang@linux.dev>
	 <49fd8e0482d2cf1f9c690031ab0cf9cc1eb1c5ad.1793900349.git.wen.yang@linux.dev>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, 2026-11-06 at 01:49 +0800, wen.yang@linux.dev wrote:
> From: Wen Yang <wen.yang@linux.dev>
>=20
> A PER_OBJ monitor usually typedefs monitor_target itself, as a pointer to
> the monitored object (borrowed: the object exists independently of the
> monitor and outlives the storage).
>=20
> A monitor whose target is monitor-owned data can instead define
> DA_OBJ_EMBEDDED_TYPE with a complete struct type: the framework then
> derives monitor_target as a pointer to it, embeds one instance in each
> per-object storage, and allocates and frees it together with the storage.
> On storage creation the caller-supplied target is shallow-copied into
> the storage before it is published, so it may be a fully initialised
> stack object.
>=20
> This allows per-object monitors to manage custom per-instance data withou=
t
> maintaining private mempools, complex multi-stage reference counting, or
> out-of-band teardown state machines.
>=20
> Suggested-by: Gabriele Monaco <gmonaco@redhat.com>
> Signed-off-by: Wen Yang <wen.yang@linux.dev>
> ---

Looks good, just a minor comment.

> =C2=A0/*
> =C2=A0 * da_get_target - return the object associated to the monitor
> + *
> + * NULL for an embedded target whose storage was pre-allocated but not f=
illed
> + * yet: a manual-allocation monitor publishes its storage before it has =
one.
> =C2=A0 */
> =C2=A0static inline monitor_target da_get_target(struct da_monitor *da_mo=
n)
> =C2=A0{
> -=09return container_of(da_mon, struct da_monitor_storage, rv.da_mon)-
> >target;
> +=09struct da_monitor_storage *mon_storage =3D
> +=09=09container_of(da_mon, struct da_monitor_storage, rv.da_mon);
> +
> +#ifdef DA_OBJ_EMBEDDED_TYPE
> +=09if (unlikely(da_storage_is_empty(mon_storage)))
> +=09=09return NULL;
> +#endif

We usually avoid ifdeffery inside functions like plague..
Could you embed this in TARGET_PTR?

  #define TARGET_PTR(storage) (unlikely(da_storage_is_empty(mon_storage)) ?=
 NULL : &(storage)->target)

> +=09return TARGET_PTR(mon_storage);
> =C2=A0}
> =C2=A0
> =C2=A0/*
> @@ -572,8 +635,11 @@ static inline struct da_monitor
> *da_fill_empty_storage(da_id_type id,
> =C2=A0=09=09=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 monitor_targ=
et target,
> =C2=A0=09=09=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct da_mo=
nitor
> *da_mon)
> =C2=A0{
> -=09if (unlikely(da_mon && !da_get_target(da_mon)))
> -=09=09container_of(da_mon, struct da_monitor_storage, rv.da_mon)-
> >target =3D target;
> +=09struct da_monitor_storage *mon_storage =3D
> +=09=09container_of(da_mon, struct da_monitor_storage, rv.da_mon);
> +
> +=09if (unlikely(da_mon && da_storage_is_empty(mon_storage)))
> +=09=09da_storage_set_target(mon_storage, target);
> =C2=A0=09return da_mon;
> =C2=A0}
> =C2=A0
> @@ -589,7 +655,11 @@ static inline monitor_target
> da_get_target_by_id(da_id_type id)
> =C2=A0
> =C2=A0=09if (unlikely(!mon_storage))
> =C2=A0=09=09return NULL;
> -=09return mon_storage->target;
> +#ifdef DA_OBJ_EMBEDDED_TYPE
> +=09if (unlikely(da_storage_is_empty(mon_storage)))
> +=09=09return NULL;
> +#endif

Same here.

> +=09return TARGET_PTR(mon_storage);
> =C2=A0}

Thanks,
Gabriele

> =C2=A0
> =C2=A0static void da_kfree_cb(struct rcu_head *head)
> @@ -635,7 +705,7 @@ da_create_pool_storage(da_id_type id, monitor_target
> target,
> =C2=A0=09memset(mon_storage, 0, sizeof(*mon_storage));
> =C2=A0
> =C2=A0=09mon_storage->id =3D id;
> -=09mon_storage->target =3D target;
> +=09da_storage_set_target(mon_storage, target);
> =C2=A0
> =C2=A0=09hash_add_rcu(da_monitor_ht, &mon_storage->node, id);
> =C2=A0=09return &mon_storage->rv.da_mon;

