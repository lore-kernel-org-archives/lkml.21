Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003840;
	b=5TIRjyrX28JlK0AeLT00cqRHrVgJWs2sTJ9i/nUl7aKbF9JpQgVlUW4q2WA5XaoGGELk
	 l1r+FN5k5i9Z42nc3wg0rpP1t688uWxpXCvlnmPGB8KHRxdL3O1SRz3phtwpK++Q1bb3E
	 sfIluX1yauxV7B8vt+U1qfCYCnEpnbV7Jv222MR5wXW9PsrxaEdAbPhKdCwpBQAoTyafZ
	 pKRHRH4P72mTmQHhljF8h5PSmphUyRC6HjGockbshyIrgkim8yeHDn9fPws3D1Q4yIm2m
	 ND8JaMToGBtZNj8madpMBx3/RGlv1LMTjuPiFOBCcsPPCbkW/9sNybhrNnBVfOmtXWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003840;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=qj1PLy2yInc0qHugCW7c4uxMVK1VS1mHZtMcI4xn/SA=;
	b=GHpuAhsYh++Ba84fs9W76qKT/7z1jve4R0ykfFIwS8hL7O4om3ub67WJSEi1ZyTwEQrv
	 CbMjRJKOHenM25OdFIESBmSFpOxG9Vk77GqgfQKLBdKWauSWHDzWgfTUPCcReu9iq5uxQ
	 Wwk0DSdU/mA3isAezeld2n5hfk/FB97XjFVZOgPk/80noHa9PhDpZsLQQJs+uKcbPZnR8
	 E5cB0OPfsaM561sb1Olz4uvra8XU8HP+w/j1vSwfAPmBTJL0fduJVCgtsiEfUxo55Kj9W
	 fg1KD+O6xpJ4Qe1DfC4KUOGDbRO7XZXWFcoyDvJRcdZdXOHsw1OGnJmD59xUkUHGdeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bapSOEt2;
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D689606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:10:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D689606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bapSOEt2
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4bb68d624baso9319665e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795003839; x=1795608639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qj1PLy2yInc0qHugCW7c4uxMVK1VS1mHZtMcI4xn/SA=;
        b=bapSOEt2yW/HPhm5fe3mo9ZKAMuYA6DQELqvDkIA+dKDC9dGShG2nTqoFU8Jx9OyVq
         Pmlk5tfxofX4tZv8Odbtc4K54jbSgz37RmWhGtmzFmJQYhsPTAcSzD5jbiySQ8kAKxmk
         NpB6mhBRbDMnyTbVOYZNU95SguzVcUSD/PyI8H1+KFcMZ5F6+CsqsAvdGMxVRkpd4GnP
         Koa8XbMnnJbTdaLfnEgr1xVMNdzPH88uPIqKx0kR93dFp/t+7+bd2jN0Uz7DLEJLFsUC
         nqT1i+AngkHar8mz/kIvFTgKgmoMwKkOUdksgZTZK20OKLm4y2ixgE1H9kptRSSDXoO1
         ntuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003839; x=1795608639;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qj1PLy2yInc0qHugCW7c4uxMVK1VS1mHZtMcI4xn/SA=;
        b=ujBnboY8vFPeHhu/USHI4MdAIHvE7mqK1HG+MmKrLP9fscWOJXMH8LJfjrLh1JYZ2C
         8wr9kdnjtLnHRAlw0fGxkmrpYKhawQVZrSm6rnbamasVvWb4jbbfqBbHXg3Sqy9AkEhr
         gRjEYXCnmc0IcrcNbDTea790G2nQHvQcMxYJfS0idchvKtv4uIXd3ZED/tN3mjZbpcVP
         TMpOKbf6ftahANMZ9G4OP1w6Pyr3fyiO3Ekr82RH+EfJ+WKQj2IRMfptRxPWvfPn/PFm
         QNN7yijfjpMHKVcREeTzVQLaQj58Mfvx5ZtQblBLNnm7SQyoS1Tcdyzoj7NSHdPtoRld
         CWSw==
X-Gm-Message-State: APuU4Z/QHbCawbjKQCL4relOtumhvfnth9+jSVMkVA9reQJWMsKgM+AF
	ksbjiFg15Pldb2ZXEayr7ieFk+LoMpf2lNmxcjtZJh1sheb90K98et1wjWiT36WBmoYcRSTzD9m
	gitizvizdQimN9glNQg==
X-Received: from wrpe7.prod.google.com ([2002:adf:f347:0:b0:496:d435:25e5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3e05:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4bb7da03dfemr41829965e9.11.1795003838418;
 Wed, 18 Nov 2026 04:10:38 -0800 (PST)
Date: Wed, 18 Nov 2026 12:10:37 +0000
In-Reply-To: <20261113-tyr-reset-impl-v8-2-2ee298ac9808@onurozkan.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113-tyr-reset-impl-v8-0-2ee298ac9808@onurozkan.dev> <20261113-tyr-reset-impl-v8-2-2ee298ac9808@onurozkan.dev>
Message-ID: <av2VvS0bRJYVwdUz@google.com>
Subject: Re: [PATCH v8 2/3] drm/tyr: add GPU reset infrastructure
From: Alice Ryhl <aliceryhl@google.com>
To: "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, dakr@kernel.org, 
	daniel.almeida@collabora.com, airlied@gmail.com, simona@ffwll.ch, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, boris.brezillon@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 05:32:27PM +0300, Onur =C3=96zkan wrote:
> +    /// Processes one scheduled reset request.
> +    ///
> +    /// If the pending reset cannot be claimed, the worker returns immed=
iately.
> +    ///
> +    /// It first claims [`ResetState::Pending`], then waits for earlier =
hardware
> +    /// accesses to complete before issuing the reset and returning the =
worker
> +    /// state to [`ResetState::Idle`].
> +    ///
> +    /// Panthor reference:
> +    /// - drivers/gpu/drm/panthor/panthor_device.c::panthor_device_reset=
_work()
> +    fn reset_work(&self) {
> +        if !self.try_transition(ResetState::Pending, ResetState::InProgr=
ess) {
> +            return;
> +        }
> +
> +        dev_dbg!(self.pdev, "Starting GPU reset.\n");
> +
> +        // Wait for current hardware accesses to finish before resetting=
.
> +        let reset_guard =3D self.hw.close();
> +        let reset_result =3D run_reset(self.pdev.as_ref(), &self.iomem);
> +        drop(reset_guard);
> +
> +        if let Err(e) =3D reset_result {
> +            dev_err!(self.pdev, "GPU reset failed: {:?}\n", e);
> +
> +            // TODO: Unplug the GPU.
> +            // There is no API for unplugging the GPU and this is unreac=
hable
> +            // for now since there are no hardware users for reset API.
> +        } else {
> +            dev_dbg!(self.pdev, "GPU reset completed.\n");
> +        }
> +
> +        let _ =3D self.try_transition(ResetState::InProgress, ResetState=
::Idle);

I'm pretty sure this needs to happen before drop(reset_guard).

> +    /// Creates [`ResetHandle`].
> +    ///
> +    /// # Safety
> +    ///
> +    /// The returned handle must not be leaked or otherwise prevented fr=
om
> +    /// running [`Drop`], since it owns work that may borrow from `'rese=
t`.
> +    pub(crate) unsafe fn new(
> +        pdev: &'reset platform::Device<Bound>,
> +        iomem: ArcBorrow<'_, IoMem<'reset>>,
> +    ) -> Result<impl PinInit<Self, Error>> {
> +        let iomem =3D iomem.into();
> +
> +        Ok(try_pin_init!(Self {
> +            // SAFETY: The caller guarantees the handle is dropped.
> +            controller <- unsafe {
> +                kernel::new_scoped_work!("tyr::reset", Controller::new(p=
dev, iomem))
> +            },
> +            wq: Queue::new_ordered().build(c"tyr-reset-wq")?,
> +        }))

The Result is not needed. This can simplify to:

	) -> impl PinInit<Self, Error> {
	    let iomem =3D iomem.into();
=09
	    try_pin_init!(Self {
	        // SAFETY: The caller guarantees the handle is dropped.
	        controller <- unsafe {
	            kernel::new_scoped_work!("tyr::reset", Controller::new(pdev, i=
omem))
	        },
	        wq: Queue::new_ordered().build(c"tyr-reset-wq")?,
	    })

> +    }
> +
> +    /// Schedules a GPU reset on the dedicated workqueue.
> +    ///
> +    /// If a reset is already pending or in progress the call is a no-op=
.
> +    #[expect(dead_code)]
> +    pub(crate) fn schedule(&'reset self) {
> +        // TODO: Similar to `panthor_device_schedule_reset()` in Panthor=
, add a
> +        // power management check once Tyr supports it.
> +
> +        if self
> +            .controller
> +            .try_transition(ResetState::Idle, ResetState::Pending)
> +        {
> +            let _ =3D self.wq.enqueue_scoped(&self.controller);
> +        }

Because this type is invariant over 'reset, it's impossible to call a
method that takes &'reset self.

I think you can just change this to &self.

Alice
