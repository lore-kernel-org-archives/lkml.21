Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795002066;
	b=ez82AC4bEivgvjHp2gDEP+prDEYNxBQSUBysyqPy6jyOvhxAtdjMQ47GUpgmbUgpIR+h
	 Fj6QN56STVEaGtHcOrREvYJFYk+Y8FHCUlvnvkDzM35ehjWomE0+02t/SSPBtNWyOouBp
	 6B4STPxWFRuZQurrTz8wwseMUc0sFqa1mbmbpd5AM6JNygwTi9H0DUk7x4a9gmKlf8JXF
	 9Q3YYjHiJTLJogqS3d5hongpe89Ls7CI11f9rMc7GqK5i77Q93AzE/9+GYP7b5seJLZ2X
	 /tPip322YTVFT/N1fpT7DY7psFrc/fjnHG46vXOkaOCz4f8EsjneIP38SnBBc3+cIXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795002066;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=vocEukt94wLT/ULjaP2vDLoUIImfQpzcE9D0A8nRexo=;
	b=ZVFJRlHyFZ/mmwQGXRtKDrKoYG8ctU9+Bg8/o8/hKWZ7cTL325mQN1W0pf28RPuIz+hq
	 oJ12kflQXaw3Hw2mNZ21cLUJiygscZfxwyEmQTfVK+6WpMIjk6Ev8xzyMrdBwygikTDEp
	 tldoIE53VVrdzsC0to6UUl6ju/0h1XXTWAL6hohoQre6c54z+eZMPXIVLZOK1pAUuLosr
	 ehjfSumD4O6M00gV75cR0yPKtmLM+YWSJ3reqOdd8375p0D6Xp20l0+wxN48hEOCJR5hL
	 of/DW2FRhRGr7P4RvBWCY13tkd4/LT/AC/dq9r++CbXZ1AeN3m+PHMdv/97l548zOrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=U5uNPXeU;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DB9606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4DB9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=U5uNPXeU
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4b9fde3044dso6467445e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795002064; x=1795606864; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vocEukt94wLT/ULjaP2vDLoUIImfQpzcE9D0A8nRexo=;
        b=U5uNPXeUdtp4NBOVu4ZhluUyJ0mNvLuYeuQrg5v2BS+ZqqOp1CVI0jFzT5Irc+n25g
         0btxBfU/9JIk2hfz99IJ3XlgNzTX3iVpGrGZGomYdSFcd0PihHD5VHkpkmu7pDogIEdJ
         sVXJHY2T2dwNrdkj0ixzN8rkAt0mQEQ6czmQFyHbc5MPm9qv5RbPznv52P1/MrBOrS65
         RLUT00vvnT1Llw+nG+W0LSHEjrBp5Ux/pbZ85I3jObQ8EnyvDTuXrt9L9HS4DoBc7AV1
         TFEW2x8arxIKXGXHwR7VSH/NHimDOzV0egdTKVMcF1a3iWbODkSr7kRnc27i+W/Px000
         dv3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795002064; x=1795606864;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vocEukt94wLT/ULjaP2vDLoUIImfQpzcE9D0A8nRexo=;
        b=QdAZ+DzjbVxAYcNK5UDwnN/Ja8gbEkpcoTh3L0D7D0jaFiieW8O2COkOnuBr1wfhqM
         HS7sTRTWKFHbUhSPjkz9y/pmMxSw4+FvB8a//H/eJ7fLr3X8NkwbtiOtX2wL7h7X+U1+
         0P2FSZMTIJV0GFedHSeHEeVvrdXncBLrP/yohobMA7HmtTgfXLob1SO0ipAFj8SUk+mq
         Y3mdwUsAwp8GxAgiqGE5xDPpvXrEUPxBhPcZT2BoYKqB66uouIYiyTDSYCRSKCogphm+
         e4dCsoDsIYqqpk0dkjzCIXcBv2/fx4NQrlzmRVu2Fp0gjNLNqiH/cfRhHdO7lsXWgaik
         0org==
X-Forwarded-Encrypted: i=1; AL+hErHa7ahl/iBBexXS0V/0q6ZubiIL+0EheTdR5uY5cmghVlLNDNpS/9mNrONZJSib9yK6yZmlyBPKXAeVqNg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jHVdDvhzC4SmDKS0IiWBraF0BVYA8nqKmYqAJsiyKGd4BHwHg
	mIOIlQeyZ6eTHqEUCtCUDs+Fg+sCnzcYqkL1Jx/PKoLfi3rziW7AFHcR2kQxckQ+REdAGk84XD4
	FYRDYZo8beMmnRGYS2g==
X-Received: from wmbhb15.prod.google.com ([2002:a05:600c:868f:b0:4bb:5d5c:ab85])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:83cf:b0:4a0:1c0e:b057 with SMTP id 5b1f17b1804b1-4bb7d6cd41amr41190555e9.4.1795002062763;
 Wed, 18 Nov 2026 03:41:02 -0800 (PST)
Date: Wed, 18 Nov 2026 11:41:01 +0000
In-Reply-To: <20261026-rust-drm-gem-shmem-imported-sgt-v1-1-36f15ace04b1@jannau.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261026-rust-drm-gem-shmem-imported-sgt-v1-0-36f15ace04b1@jannau.net>
 <20261026-rust-drm-gem-shmem-imported-sgt-v1-1-36f15ace04b1@jannau.net>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261118114102.490384-1-aliceryhl@google.com>
Subject: Re: [PATCH 1/3] rust: drm: gem: shmem: implement gem_create_object
 for prime imports
From: Alice Ryhl <aliceryhl@google.com>
To: Janne Grunau <j@jannau.net>, Sami Tolvanen <samitolvanen@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	nova-gpu@lists.linux.dev, stable+noautosel@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 26, 2026 at 12:14:08PM +0100, Janne Grunau wrote:
> From: Sami Tolvanen <samitolvanen@google.com>
> 
> For a prime-imported BO with no `gem_create_object` callback,
> `__drm_gem_shmem_create()` allocates `kzalloc(sizeof(struct
> drm_gem_shmem_object))`, which is smaller than the Rust `Object<T>`
> wrapper. A later `container_of!()` from a `drm_gem_object` back to
> `Object<T>` then runs past the allocation and corrupts the heap.
> 
> Provide a `gem_create_object` callback that allocates the full
> `Object<T>` via `KBox::pin_init`. Move `obj` to the first field so the
> returned pointer is at offset zero, satisfying the `kfree()` on the
> init-failure path. This is now compile-checked with `const_assert!`.
> 
> Imported BOs have no userspace creation arguments, so extend
> `DriverObject` with a `create_imported(dev, size)` constructor and
> implement it for Tyr's `BoData`, Nova, and the in-tree KUnit driver.
...
> +    /// Create a new driver data object for a GEM object that is being imported
> +    /// from another driver (e.g. via dma-buf).
> +    ///
> +    /// Imported objects are allocated by the importing helper, which only
> +    /// provides the device and size. There is no driver-supplied
> +    /// [`DriverObject::Args`], so drivers must initialize the per-object
> +    /// state without those arguments.
> +    fn create_imported(dev: &drm::Device<Self::Driver>, size: usize) -> impl PinInit<Self, Error>;
...
> +        // SAFETY: We never move out of `self`. Ownership of the allocation is transferred to the
> +        // C side, which will run `__drm_gem_shmem_init()` next and later free us via
> +        // `free_callback` (or `kfree()` on the `__drm_gem_shmem_init()` error path, matching the
> +        // C kzalloc fallback contract).
> +        let new = KBox::into_raw(unsafe { Pin::into_inner_unchecked(new) });
> +
> +        // SAFETY: `new` was just produced by `KBox::into_raw` and so is a valid pointer to an
> +        // initialized `Self`. `obj.base` is the embedded `drm_gem_object` the caller expects.
> +        unsafe { &raw mut (*(*new).obj.get()).base }
> +    }

I ran this through a review agent, and it found these two things. As far as I
can tell, these are valid concerns.

1. On the `__drm_gem_shmem_init()` failure path, `__drm_gem_shmem_create()`
   calls `kfree(obj)` directly rather than reconstructing `KBox<Self>`.
   Having `obj` at offset 0 ensures `kfree(obj)` frees the start of the slab
   allocation, but it skips running `Drop` on `Object<T>` and `inner: T`. If a
   driver's `T` owns any fields with non-trivial `Drop` implementations
   initialized in `T::create_imported()`, they will be leaked if
   `__drm_gem_shmem_init()` fails (e.g. if `drm_gem_create_mmap_offset()`
   fails).

2. `Object<T>::ALLOC_OPS` also sets:

       dumb_create: Some(bindings::drm_gem_shmem_dumb_create),

   `drm_gem_shmem_dumb_create()` calls `drm_gem_shmem_create()` ->
   `__drm_gem_shmem_create(dev, size, false)` -> `gem_create_object_callback()`,
   and `DRM_IOCTL_MODE_CREATE_DUMB` only checks `dev->driver->dumb_create`
   (not `DRIVER_MODESET`). So `T::create_imported()` can also be called to
   create a non-imported dumb buffer (`obj.is_imported() == false`).

Instead of implementing `gem_create_object`, what do you think about
exporting a `private = true` counterpart to `drm_gem_shmem_init()` (similar to
commit e3f4bdaf2c5b ("drm/gem/shmem: Extract drm_gem_shmem_init() from
drm_gem_shmem_create()")), implementing a Rust `gem_prime_import_sg_table`
callback on `shmem::Object<T>` directly, and setting `dumb_create: None` in
`Object<T>::ALLOC_OPS`? That way `new: Pin<KBox<Self>>` stays owned by Rust
across `__drm_gem_shmem_init()` just like in `Object::new()`, so `Drop` runs
normally on error and `obj` does not need to sit at offset 0 for `kfree(obj)`.

Alice
