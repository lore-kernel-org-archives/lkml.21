Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795089008;
	b=ces0Jvvt6ExM0QlaTfgR+hExE3Fg+n2l+0fnHjlTi/YWcAUGjgJyMu2Uay6tkVFA9aP7
	 dtwNeA1pBknxHwWtOSxT4celpAFFT0Ma6Q01XPra/i0I31XXoe2Kw/aCmjPFJxzp80GV/
	 QeX/Uos5j17gj5wgDScHvAjlMkOG2s+GzKHbsOVW5LntEJXp3g21PsQL5SOcG//bnuWzd
	 4JrlL8dFpFUFo2UMKrws/A9e3RuPgf8Afx2iG4viU7pdRloVdwMGb5lS2rdaihVG3paXz
	 5WtWk4cfLvMM0wnYcwbhqxx/P15xgXIMKWUTOH8zkcPVyIYLITApx7MfNKJRN5J2erQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zOO8IN3WTwfTWmmyHCF/uCzTotxA10dmHaLxKg4Nq4E=;
	b=P+ptwib2KAbvRcUAONVdC8hLGhu5Up4b05LlMUe/c7KJUO+5IzpgIyEqHC6h2/jta1Z3
	 0QNcYWIwlOh97SOzh7NjnBaRpF09xcXmoFtXN8FJjG3ktKCXTgEZM8Bpzk8A5++VjTsS0
	 o+FlGZBHV8HEJxd5TT1O+N/D9s5XWZLvCnq+DFe737p/1FJA2ETRe66qk9cZIMKnMf+aQ
	 eJSnp28FYQr+V1PegRDxyfcgGBvtwEhuDES6Unx6vv2E971NlakVtDAm9N4oNim5zaj1f
	 E+dj8gphgBchloG9j7wY8IvtnSWj8U4mOuzXaLXLAUVC6FQ3EpszUe//+G2z5Q6v6Vg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QQId+XqJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777E0606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:50:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 777E0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QQId+XqJ
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so1183322f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:50:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795089007; cv=none;
        d=google.com; s=arc-20260327;
        b=PihQI4t91A8crDFkUXws8vJlhLAXmR3t+/i6STF1KEWpx+z09KJKrLCcCWy6kU9QZL
         8HyOOT5YzJGgYRQLoFgbyZk6Oyqob3yGoAB8532sM0oQZfZufLxNM34+fCTSut9Xvgue
         AJgSfHyhbdK1dOe61P/8ZXOZg67szez9dAHlV/iDdIAI7pUMhRg2Dl3fsfF5tmcxzgOu
         SXRvt471hzyVogNz+1d+9N6t/nwqKigLlXUwUW+xFWs6FoFbvLjzKR3D/ZkCfbyyR8Wl
         XZvXsjBS3WjwwwOiggU1a8NHwHg0Sjwxlq7eQtiHW58sznSrxUOgprBwjPb66b9lqP9r
         Fe9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zOO8IN3WTwfTWmmyHCF/uCzTotxA10dmHaLxKg4Nq4E=;
        fh=Qx0unwDIEOfCVSJce4fkssiX4o147BFn9xF68HStoiU=;
        b=ngduWORasZvo6B2wouol26+LW3f6FOXn1N2LJp7G13beMM6ZoWsLPheMlgb/RbZmCM
         Aigr4hKJBsyNrQ3f7rppEDQSKyYD6QAZ9D7TXkwoU0so0CJ0AwFbI2HCw9P7AYlNhdfZ
         zhXoPpNpMkANXS5n4FYzGMmV6vXRMT1P6+QpsplVEsGkSEVRBP1BuGO0Ns75oActsJDG
         EbN+qUDqWxhHabxZ1jzXE/EPBneC/O8HNa///u9KRCLj7DX8VEWQXJN6uNm/aA3m4UNz
         /CFZBe/CMI7NxVXymhmhzk/YWkGsV4YH2foXd3AqJqpy6cmWatHbpMBmhRMzuPR+l23r
         FBOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795089007; x=1795693807; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zOO8IN3WTwfTWmmyHCF/uCzTotxA10dmHaLxKg4Nq4E=;
        b=QQId+XqJHc6/Vf9YxDoL4P2Tn4hvgiczGFrDlL7pq03qn8tlsBgLada/OoPp3FAScL
         0GmXYnijJ2aVhgc2IamhiK0JWHB0pqpXEZrDagZ8aS0bzMEB4/nBrkWqQOmF/J1UHJsU
         DV0WkOchAR5vtT8DRzUMZaDiT4MNN2o+kBX3Q98vad3roNBRiL5cBD32PMe6SCTvfeY6
         fZas5wrW1OBVLG4FJ/NjXfRLdiPsCnq07RS3gwWp7C9Gt3cABDbIk6xReHeNRM86pK68
         BRywyWUNuC2I3t/L6FegbyGHi87AyPauhXFb4jx1NXclspOdORSdXmP6Z7msFX3bhuEy
         YIYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795089007; x=1795693807;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zOO8IN3WTwfTWmmyHCF/uCzTotxA10dmHaLxKg4Nq4E=;
        b=dLkYwciKckOLt+0Vixdse22RT5Aed8EQCXNUybZgTxlGLW02adNa3lXP8r0vK4CJ/N
         73rFj3t+g42NQukUCDaZQARaDiBGjN1+a0mfLSgON9F1gsd2uGebWN6P40yvzRV3L8ib
         z/GcZrriZ2tjDvS9ZQF8AGBIj9ZFQwdq5GqxlMFwJluh5PMt+jClH21rlMOIMlwWc1MB
         6uqH9mNadKC0YohgI0UaFNu8weKzoq1WZYmrX0uRMYDLzDQmlSf8hkKDBRjOHYTqylr9
         LF7xgrThav9o+M6ZeIKgBvlF+Xidi1UzhqrVY0NHmVSS4SW5YI+z5roGJwFo0pvw2ig4
         cIgg==
X-Forwarded-Encrypted: i=1; AL+hErHFhAnPRdm5romakdJivjHf2SSMe9aFq2v9gcD2JJbDjBg+v/TEdndd8ivoipJTlbwPgf7Bpnx9kzIUgxg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EeJhX9DNAJxTDev6437ACN0p2/vWjz/PPhLDlD5H+rzNp94Xw
	T30JB7Z1XJ54nzkr7E6uzm4+S+gKOfBmSHRcu0lBr6r+FPrubuKfButwWtDCouDhwQpupS/lxBp
	YOBBFJMdF3IiSJpb9iiuUYOPCjDrUrx0LPuXjQoQS
X-Gm-Gg: AZFdTZf7ZHsXC94v5JImWl07AFtspOvTR34ubzdKxPh+Hl+Ixxd7xf/bd8licDHsrgT
	XsNr0LoxV7PAzAKzmTfK4mcKjY4mJ/LwlbpsE8wgJRj+WUWp3ikSssSfDIJZxdLYMIlrt9wOsJ1
	8x1rdxAlIEoEQElEe/yP0SJtRWtMuppVFN7PksCi4AqUIzpevlvDOmUetLu1eDq2ln5Z5Jr56UZ
	2YMZl9HmZC2m1XVoBMbAK9rItI9K5gqJ0HMtYThkDZbhUb1l2LPKVFdCH5S9hvQ7X/kgS/TbIcF
	+EuF4f4Tg34zC+wboMUABhdotNQ7QGwUe1rCv/gzsr4+0k90ZVJXAJbUMFLpIcUVKjpn+MRjUBM
	udMsVLxjWagSDs1+QKa+6Tvx8dEN0TiXWgRK2gw16HdoSHibz1LnSrROIjnh07eReZ4lLYirp8y
	tEEHeWOOfEMtrzT+ozwiOCLgzLrZbTe+8+V01A9+ZEV+m1
X-Received: by 2002:adf:e183:0:b0:4aa:8de6:6648 with SMTP id
 ffacd0b85a97d-4aa8de66db5mr1569581f8f.45.1795089006191; Thu, 19 Nov 2026
 03:50:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118181245.2583303-1-dakr@kernel.org> <20261119111746.3049044-1-aliceryhl@google.com>
 <DMZ5ER6XTNLG.2ZJOF7F4100XW@garyguo.net>
In-Reply-To: <DMZ5ER6XTNLG.2ZJOF7F4100XW@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 19 Nov 2026 12:49:53 +0100
X-Gm-Features: Aa3M54oh8HJOrpuOfJ-i5QqnZtSXVPWrGr-cWZKRejJI37TjGzDfWl8zYFwePng
Message-ID: <CAH5fLghc63zD9c1F437pQiX+ohgSkYQe4nt3xP4gSTsqAVLzBA@mail.gmail.com>
Subject: Re: [PATCH] rust: drm: remove DRM device private data
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, airlied@gmail.com, simona@ffwll.ch, 
	daniel.almeida@collabora.com, ojeda@kernel.org, boqun@kernel.org, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 12:25=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Thu Nov 19, 2026 at 11:17 AM GMT, Alice Ryhl wrote:
> > On Wed, Nov 18, 2026 at 07:07:35PM +0100, Danilo Krummrich wrote:
> >> Driver::Data is owned by the reference-counted drm::Device and can
> >> outlive device unregistration and driver unbind. Driver state belongs =
in
> >> RegistrationData, whose lifetime ends with registration teardown.
> >>
> >> The intended model is that, after drm_dev_unplug(), surviving DRM
> >> objects (e.g. through remaining userspace handles) no longer require
> >> access to the driver state. Thus Driver::RegistrationData is available
> >> (and sufficient) for all DRM callbacks into the driver.
> >>
> >> Remove Driver::Data, its storage and Deref implementation, and the
> >> unused workqueue implementations that depend on it. Drop the data
> >> initializer argument from UnregisteredDevice::new() and update its
> >> callers.
> >>
> >> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> >
> > Makes sense to me. Both in-tree users had `type Data =3D ()` anyway, an=
d
> > nothing uses the `WorkItem`/`HasWork` impls on `drm::Device`, so this i=
s
> > a pure simplification.
> >
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> >
> > One small suggestion below.
> >
> >> -        release: Some(Device::<T>::release),
> >> +        release: None,
> >
> > [...]
> >
> >>  #[repr(C)]
> >>  pub struct Device<T: drm::Driver, C: DeviceContext =3D Normal> {
> >>      dev: Opaque<bindings::drm_device>,
> >> -    data: T::Data,
> >>      pub(super) registration_data: UnsafeCell<NonNull<T::RegistrationD=
ata<'static>>>,
> >>      _ctx: PhantomData<C>,
> >>  }
> >
> > With `release` gone, nothing ever runs `drop_in_place()` on the Rust
> > side of `Device` anymore. That's fine today since all remaining fields
> > are trivially droppable, but it is now an implicit requirement on the
> > struct: anyone adding a field with a `Drop` impl (or a pinned field
> > that needs a destructor) would silently leak it.
> >
> > Could you add a short comment on the struct along the lines of "no
> > `release` callback is installed, so no field of this struct may require
> > dropping"? That way the next person adding a field knows they have to
> > bring back the `release` callback.
> >
> > (For what it's worth, I checked the lifetime-parameterized `File`
> > series [1] against this: `open_count`/`open_count_wq` are both
> > droppable without a destructor, and the two merge cleanly, so no
> > ordering constraint there as far as I can tell.)
>
> Instead of a comment, a const assertion of !needs_drop would be better.

Good idea

Alice
