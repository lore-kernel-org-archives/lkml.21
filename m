Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795028316;
	b=Hke7xotdJ7xVad9CCm0x58Ug0R//eDgz0/aDu8RP54g9Gg534gbUq1hlHDoAg4rggdAx
	 VBi45qVBIhCM2xzWv50Gi23nCyIjOP7ZErFDTXp1vHwN04YL9nbT5Pu/L2f+LNQBUH3je
	 +IvrxRgGKdaUMs6y3DEPReT8yF5KSA6BIjFolUVns4t/V1k1jFL+xpgQ8zzBiHX+X/2XY
	 P1Cyx9yYErC2XqaBWtpRluvbNvRH0fSe6Usy1IkjK2s5UVAWkuEiuGX30tKKAD1+CHLUG
	 5z5KH+Ec858b+2YtE4RLdwb8+SB8MMPlQJY2kkpLyoZomfZwG/AzJUo9RZnh+RUEPXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sANgHflY4l/Fe7eOmc9nVUukAbjG9FRan2mAzBkUStg=;
	b=2Mdz8TVlgI0pc92qPzVF6E7j36bPu6tvhp4VJNd7NQtOPNs+YAo0QzILElXbH05BwXSg
	 HOILwcrD4S3uzBC8N85iIGF7Im1hD1C3vEXGkcUuEUCIqFdXr8ywIFCJyZC6Ovpvz+YZ4
	 tuR+wGQDcc6rvIhy2MhDplZcvnCSIeSqA9mGSdhHl/o5JyLfohs/W81RudlQEbDDxHrXf
	 GtpDeHZCcZhYIzvu/bqpWFOzT5fCRZlBhdcpj++xHAjDlpyNid1zDhF4Q52J+Reb03y7F
	 W47Gby2qQJ3UteAGVQfpSY903rYo+gvXKrduuTs8Zw50MXefCqINOd0DwEMHM2GfA0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=F9We98XN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34908606A335
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:58:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34908606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=F9We98XN
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb62d40736so4235e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:58:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795028314; cv=none;
        d=google.com; s=arc-20260327;
        b=W8yDZUnRUQU7LfsYTMQ5uxx8eY3ay62oVkXpyuUSQ7aLUAQtZoQsLOyJIz6czS0BcI
         KQ113rg9p5KmLsViqGnJCVhfnX+Q8NVbl49ghstgNkGDVC/OMIGPy6FCd1DYGjBlSpYC
         OMoB6KeJJKI6pq5CfGtFifrNIGGRGf8Bp+osy2zqpqxw7iMh2AF2zOBnB5AJvtv5VuoJ
         QN2l775S+xT2RY/d/0ByHIOv/Ro8OcNTslZTOa/Xsjq6TaAJqnw33YJDxeflh1CfbUW1
         gMrb373NLkWalxBzsKVRnxUMpYos83ATP4xb4vWqllBDCPRrbd8seIGLGJFDGCwgP2/g
         CvpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sANgHflY4l/Fe7eOmc9nVUukAbjG9FRan2mAzBkUStg=;
        fh=UfkMsvk6ybAvT5MB/tMu7ZzcNle1byS/TlPam8AvqoY=;
        b=fsgZLmXs+84Hqp9XXOCtwwYcfInkvLsoWPEjpsffTMa8qxhafhpE+uXpFowQeKboex
         B1KtBrP9ym5+jWQRp7HZti6TBn+zBbw+KxA89+xsCjmqaANsixgx2uVdTnVYlDRGdtbq
         4TFB2b74jtmRYm9ugOSqxSs2l5vOtTKmbfiaFTWK0Iw92gcx+KMVjXEZO5l1OE1Jm9iJ
         H4BQ8twUpdmRMFpTo2OHf49MCyAZuc2EN2BzvzUQPSDjr1CcwpZpOuY4LLXHJYN12B4m
         psvzrCnWJGmRI8JQu7XT4SzeA+9NiR9dXkF4bUbwF3vul4KPeBPM2lHji1BCc5FFSpyK
         3T9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795028314; x=1795633114; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sANgHflY4l/Fe7eOmc9nVUukAbjG9FRan2mAzBkUStg=;
        b=F9We98XNxwEBIks/3AYeT70ES1muTwDULsZ3smWcjmbyi68BeNmCoE5UKaa+QP20IU
         idVv3Ly9x+C69lvE4uQnSg9efmRha+lnASsrXtxS4zwprkmt0yKozwHmfe8KUIlEEM1F
         MmNxuNKQbY7AvJzbXzeOT9p+l+2Xgb9QUPSuHSU2buIZybf4nsmFs5Si3KkhQiS/ROQO
         KEOygG+Nfq+3axzLPY+SMkV+ZUmjt5GMPFLwJieAzlUp8kFR9eiOtLj1FUmg1UMn1spb
         JKU6l3MlsNypoBwoz/NLDr9bLqZf87p6NhGjXigdQktEnh4jGshBesGgYHJ4+q8nrB12
         sS5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795028314; x=1795633114;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sANgHflY4l/Fe7eOmc9nVUukAbjG9FRan2mAzBkUStg=;
        b=jz+wMMh2+MQNLpx7B9jMyo6Ke0jAJOtrFXuBX9FZxc3nYK8hmNwEeULyFnun2pUeGQ
         O2BQxNU/35YHWsm9/W2PTnp2jrbIux73LJJLf4G1cqDwPhpQkqDLHtdbaL2Pw82O4HvF
         Dl0+/F3PqSD8fXOWXrrAq5d9XqrDu/PoVjkqE/F7EyXacZKqsIjdzPtRcJaUCpkZj8fI
         4oPmT3AG3W9l7o/zw22Fu1Q8T/VL/Y5j+7aSlQQC01Is3aHcMgX8iGD3g2rMYLo5ZkIT
         W5t9tmsaps5Sj+8C347plqmtCnXduIp9GAc5Vfj9uW1qUOtXqtdcHuE0J00uvVVlYiW+
         bDIQ==
X-Forwarded-Encrypted: i=1; AL+hErHN6n7F1Qn1ZS7TicOuVfmB+OooYSGIq6iHHpL/QL9oFvhR6moAxHmTGJgHYewE0ZwKh/F1rRy/pOwVx80=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Vf5QPaoU/5fD63Eb04TXWr/+Cg260IxXa31hLrzqwTYc8MhUs
	znDJ12Z8eFdk7QznnnO+bAzzctGFFiiYubkU3w/d42mVyDDcx8f2puIc7ihN322S6RpoLgLJlsi
	jFQk1M3i4W4hLKJYGu5VUGkXSutq71GeEWoAUpgO0
X-Gm-Gg: AYBFou2SnXv3v+qC2z3xu5cPLC3eaKa+9ZUsIl5n0qVXxBKsLmUsegFDUSg7cpqSAT4
	eidwA7jIL66iNAcPjrPYHsxyhsel8u3fJhSRL5bX9cAkRK506Dpsn22WWdtkLOm25uSyh06GOKM
	KTO9c0f6TZYXH4el2VkEl7gXKH4kzophh26nEOhbW2dScYzhD8k53NkK+JQJkn1ufiwMMtrzy4a
	4fMZ/D++BA8ACgxAigC554b8VZkbWLrRvmzAVohEK+lCCF+t25wDvZQNOQ0WBpheg4ODb37xN0z
	4ysFSLGydUKHRi2UDNrDcaJDtnCHItw/qpFi7pkQg8JouJfAOdD1qXRPAaf6kbNCd+jp2UaaooZ
	qVb03ra3AXPTRXwB+nH0UmIcY0NjbAb6fuyeg+he2a+XHoyJSM+qSi9+PxKfySRJlu7St9Y7P24
	S9+n/TaMaXZm2I
X-Received: by 2002:a05:600c:840c:b0:49f:ddcf:45b7 with SMTP id
 5b1f17b1804b1-4bb83c9025emr23355e9.10.1795028313968; Wed, 18 Nov 2026
 10:58:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026-rust-drm-gem-shmem-imported-sgt-v1-0-36f15ace04b1@jannau.net>
 <20261026-rust-drm-gem-shmem-imported-sgt-v1-1-36f15ace04b1@jannau.net> <20261118114102.490384-1-aliceryhl@google.com>
In-Reply-To: <20261118114102.490384-1-aliceryhl@google.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 18 Nov 2026 10:57:56 -0800
X-Gm-Features: Aa3M54rtfthEgFiAPOcV53y3ZwydiRtVUQnZ06u4pa0OMeOurh1hyDTgkerw9LE
Message-ID: <CABCJKudrDOu3sD6J5LN4o3XF9JrU85pZK4DUXNH4d9iC363bEA@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: drm: gem: shmem: implement gem_create_object
 for prime imports
To: Alice Ryhl <aliceryhl@google.com>
Cc: Janne Grunau <j@jannau.net>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Lyude Paul <lyude@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev, 
	stable+noautosel@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 3:41=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> On Mon, Oct 26, 2026 at 12:14:08PM +0100, Janne Grunau wrote:
> > From: Sami Tolvanen <samitolvanen@google.com>
> >
> > For a prime-imported BO with no `gem_create_object` callback,
> > `__drm_gem_shmem_create()` allocates `kzalloc(sizeof(struct
> > drm_gem_shmem_object))`, which is smaller than the Rust `Object<T>`
> > wrapper. A later `container_of!()` from a `drm_gem_object` back to
> > `Object<T>` then runs past the allocation and corrupts the heap.
> >
> > Provide a `gem_create_object` callback that allocates the full
> > `Object<T>` via `KBox::pin_init`. Move `obj` to the first field so the
> > returned pointer is at offset zero, satisfying the `kfree()` on the
> > init-failure path. This is now compile-checked with `const_assert!`.
> >
> > Imported BOs have no userspace creation arguments, so extend
> > `DriverObject` with a `create_imported(dev, size)` constructor and
> > implement it for Tyr's `BoData`, Nova, and the in-tree KUnit driver.
> ...
> > +    /// Create a new driver data object for a GEM object that is being=
 imported
> > +    /// from another driver (e.g. via dma-buf).
> > +    ///
> > +    /// Imported objects are allocated by the importing helper, which =
only
> > +    /// provides the device and size. There is no driver-supplied
> > +    /// [`DriverObject::Args`], so drivers must initialize the per-obj=
ect
> > +    /// state without those arguments.
> > +    fn create_imported(dev: &drm::Device<Self::Driver>, size: usize) -=
> impl PinInit<Self, Error>;
> ...
> > +        // SAFETY: We never move out of `self`. Ownership of the alloc=
ation is transferred to the
> > +        // C side, which will run `__drm_gem_shmem_init()` next and la=
ter free us via
> > +        // `free_callback` (or `kfree()` on the `__drm_gem_shmem_init(=
)` error path, matching the
> > +        // C kzalloc fallback contract).
> > +        let new =3D KBox::into_raw(unsafe { Pin::into_inner_unchecked(=
new) });
> > +
> > +        // SAFETY: `new` was just produced by `KBox::into_raw` and so =
is a valid pointer to an
> > +        // initialized `Self`. `obj.base` is the embedded `drm_gem_obj=
ect` the caller expects.
> > +        unsafe { &raw mut (*(*new).obj.get()).base }
> > +    }
>
> I ran this through a review agent, and it found these two things. As far =
as I
> can tell, these are valid concerns.
>
> 1. On the `__drm_gem_shmem_init()` failure path, `__drm_gem_shmem_create(=
)`
>    calls `kfree(obj)` directly rather than reconstructing `KBox<Self>`.
>    Having `obj` at offset 0 ensures `kfree(obj)` frees the start of the s=
lab
>    allocation, but it skips running `Drop` on `Object<T>` and `inner: T`.=
 If a
>    driver's `T` owns any fields with non-trivial `Drop` implementations
>    initialized in `T::create_imported()`, they will be leaked if
>    `__drm_gem_shmem_init()` fails (e.g. if `drm_gem_create_mmap_offset()`
>    fails).

I agree, this looks like a valid issue.

> 2. `Object<T>::ALLOC_OPS` also sets:
>
>        dumb_create: Some(bindings::drm_gem_shmem_dumb_create),
>
>    `drm_gem_shmem_dumb_create()` calls `drm_gem_shmem_create()` ->
>    `__drm_gem_shmem_create(dev, size, false)` -> `gem_create_object_callb=
ack()`,
>    and `DRM_IOCTL_MODE_CREATE_DUMB` only checks `dev->driver->dumb_create=
`
>    (not `DRIVER_MODESET`). So `T::create_imported()` can also be called t=
o
>    create a non-imported dumb buffer (`obj.is_imported() =3D=3D false`).
>
> Instead of implementing `gem_create_object`, what do you think about
> exporting a `private =3D true` counterpart to `drm_gem_shmem_init()` (sim=
ilar to
> commit e3f4bdaf2c5b ("drm/gem/shmem: Extract drm_gem_shmem_init() from
> drm_gem_shmem_create()")), implementing a Rust `gem_prime_import_sg_table=
`
> callback on `shmem::Object<T>` directly, and setting `dumb_create: None` =
in
> `Object<T>::ALLOC_OPS`? That way `new: Pin<KBox<Self>>` stays owned by Ru=
st
> across `__drm_gem_shmem_init()` just like in `Object::new()`, so `Drop` r=
uns
> normally on error and `obj` does not need to sit at offset 0 for `kfree(o=
bj)`.

A later commit in tyr-dev lets drivers opt out of dumb_create, which
addresses this part. However, your proposal sounds cleaner and fixes
both issues, so let's go with that.

Sami
