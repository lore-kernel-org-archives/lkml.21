Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795087071;
	b=W8+VMDnhaTG5+XyMaKhPA1tWZ0Ugcd2CJtCJ0FBqe+AQXIweUEwSDCFfAy/cm9w1cn6B
	 vBMptCHSFqwvdZtJypArWnjndsIO4K9uACilrsEdqY/oeJe1zMk/uieK3IyNNcc3VYRKy
	 dVja9WF0/+ZYl/Zw0hQe1NUVKTTUP7gjf8ern7zURcTDHBkdlqv5wQ4JfBcCLOAhN8vfd
	 XKKnsfM/lZbddVmMbMbPaW67ErQ7V+Je1rAM431/g3uvJ9g0EfsH+cxQ81xhhM6PxQamz
	 R7GSf5/hdLq1Nq6XD0/NcrWPhq/jhasSTwboAtxwT9cTiXAxNO03tUbK/XNQOHqR99w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=RlZOdD7i7xCpjMBuRImGfpZl+cJFA2YqI8GZO6zioDo=;
	b=MIjXzckSl8jIuiAuJr/j2BAcv/REnoN3gQbKEXCKOC4Wjwt1kjsgp9Qqi+8wZ4SyQ/Qo
	 WcPM9Pqa59DRdoa7K3uIQhcKYhdd+LEgKjA7gOWFDjudZs5dWzaOTHLrICy+gxOejXkEG
	 UUB3lHazPMP1//3/kRNrvNev5pu3ICaGpJCTHZfk7J/esk6RQsM2cHQr9s4x75jFtPOCz
	 d3d9hTT9Z90EI0l/pVQG4Q1PjwI9II3l1t19LQV01siTt+KWZwUq/Q56tVEcw/QK3fOSE
	 KYpZJ7aXEkzaSSOWjV7CF5tVhmWWMGRu92OA8sHnTMVZydhBoKdwiaXpOETigvSMBtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=d+xkWfJo;
	arc=none smtp.remote-ip=209.85.221.72
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0365606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:17:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0365606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=d+xkWfJo
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4a9be7586ccso334338f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795087069; x=1795691869; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RlZOdD7i7xCpjMBuRImGfpZl+cJFA2YqI8GZO6zioDo=;
        b=d+xkWfJo1ROIAbdDs75wxkKtPvqofQgoDfLrHOBkYZTBnp+ldFwQkG56hhvfW335ML
         0QLWRZNUir1ZDNRYKdTlMxpPsfW2w6lm+UvyrYKTGbcnLfC7J5G//3mSTg/tDJAnR921
         oat6OKIoK/llJKHs2mnebkkzLx0Ackxj8IdjOGUUd3vEd2uWvhtGwrt/MsQ4zbCZIrui
         4Mtxt/nRlOD2mk5/LC1Dtq9hFXKn7ts768IE9OSOqe7uJlvCsBq/2bdHXq0Nq8fGddkp
         d2bZUCz7WflLfBS/8ULCtaOo21GQ37H5TbqysYXDNdZFOXsBWqvbZBNK5010QjTJjpuw
         NAZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795087069; x=1795691869;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RlZOdD7i7xCpjMBuRImGfpZl+cJFA2YqI8GZO6zioDo=;
        b=cJVi9iwyTsbo7sDkMPZUB44CEyxLnMm3J780MYX/qeV1bhtz0Lhlg8sgUWfgzEp//g
         gry/xoXW0QKU320obNIDbzUh7LXNxZqSWiv8LTSA8DxQIMYXdseDuipRE4uj4w5dyUqc
         qgUq8U4i/CCQoRxT8EBB8wSa5W7jb6+XMvS4a4wfNKDm/W9ekixbg5IvMnSqloSYiLUY
         cx8woj27vqPu/60bWoX23kE7oFoYzyBvNaniTG6h3lvdLtmr52EiP7qnmKTaZ+zSTK08
         PfPElgI/oV/Bp1I+ULc/sCaXrog9l51UVrBmhSkas4aQSrBCt5PqPrybGN1RxlsEvdCz
         vFWA==
X-Forwarded-Encrypted: i=1; AL+hErFOCNuyV8wr7KqLI1AYisZltpN8Fgl5OivoziKiu3N9HZg6FyuClrOFZk4+oePd8DroVlM47TVvKO+AoPo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oY4OOIyJSqkdecI0MRPm8Oz84aRI6/ZfJFOvlULUPZajxgWNH
	oHm79xWanZ1xLZlgihafbSsDCGA14yMF4FTXElBzmG0ConFxZeZUJxYUBVuoEf2t6lkq2hsndBD
	wgVXznYZC3ycUchU2dg==
X-Received: from wrwi10.prod.google.com ([2002:a5d:55ca:0:b0:4a7:4b90:c045])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2c0d:b0:49b:b94c:e8e8 with SMTP id ffacd0b85a97d-4aa544edba7mr2116016f8f.8.1795087068558;
 Thu, 19 Nov 2026 03:17:48 -0800 (PST)
Date: Thu, 19 Nov 2026 11:17:46 +0000
In-Reply-To: <20261118181245.2583303-1-dakr@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118181245.2583303-1-dakr@kernel.org>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119111746.3049044-1-aliceryhl@google.com>
Subject: Re: [PATCH] rust: drm: remove DRM device private data
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, airlied@gmail.com, simona@ffwll.ch, 
	daniel.almeida@collabora.com, ojeda@kernel.org, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 18, 2026 at 07:07:35PM +0100, Danilo Krummrich wrote:
> Driver::Data is owned by the reference-counted drm::Device and can
> outlive device unregistration and driver unbind. Driver state belongs in
> RegistrationData, whose lifetime ends with registration teardown.
> 
> The intended model is that, after drm_dev_unplug(), surviving DRM
> objects (e.g. through remaining userspace handles) no longer require
> access to the driver state. Thus Driver::RegistrationData is available
> (and sufficient) for all DRM callbacks into the driver.
> 
> Remove Driver::Data, its storage and Deref implementation, and the
> unused workqueue implementations that depend on it. Drop the data
> initializer argument from UnregisteredDevice::new() and update its
> callers.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Makes sense to me. Both in-tree users had `type Data = ()` anyway, and
nothing uses the `WorkItem`/`HasWork` impls on `drm::Device`, so this is
a pure simplification.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

One small suggestion below.

> -        release: Some(Device::<T>::release),
> +        release: None,

[...]

>  #[repr(C)]
>  pub struct Device<T: drm::Driver, C: DeviceContext = Normal> {
>      dev: Opaque<bindings::drm_device>,
> -    data: T::Data,
>      pub(super) registration_data: UnsafeCell<NonNull<T::RegistrationData<'static>>>,
>      _ctx: PhantomData<C>,
>  }

With `release` gone, nothing ever runs `drop_in_place()` on the Rust
side of `Device` anymore. That's fine today since all remaining fields
are trivially droppable, but it is now an implicit requirement on the
struct: anyone adding a field with a `Drop` impl (or a pinned field
that needs a destructor) would silently leak it.

Could you add a short comment on the struct along the lines of "no
`release` callback is installed, so no field of this struct may require
dropping"? That way the next person adding a field knows they have to
bring back the `release` callback.

(For what it's worth, I checked the lifetime-parameterized `File`
series [1] against this: `open_count`/`open_count_wq` are both
droppable without a destructor, and the two merge cleanly, so no
ordering constraint there as far as I can tell.)

[1] https://lore.kernel.org/r/20261118163203.2483856-1-dakr@kernel.org

Alice
