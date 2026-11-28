Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795840491;
	b=g5zrLvJ3oCtpIKrP743jHA8nx8njDL0PAdz7/yf9tgBNFP7dcu4+99i7j3SZPnoHHxxz
	 vRfmiRA78QpR4yXejsWZgaESeKKzWoFa37ZJ3YuD7z4Mkyp0uh4h0br/HZxpT5YPM7Dps
	 zpDRdJOl5xywfZba9JVixkEPTLyo6O3Mlderob7BKu2IsNjxc4HQze44E40hCBVsiiwPL
	 dFkjLiJ0sgQZPbD2Gl/vCoU8GHeZ4HVBQ/FUvC66srRfIFwI1ostbYz4NkGDLg8bmmpm9
	 8ARMxgZfcWKt0kxfk7zuPbRZilfyPErU4AZPltQJjWpkfazaHVasTSPJm4JJ3/WIImg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795840491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Ft3cUGMZwuJbnCtx/nSJpqRqOJFMOjO+enjfoT4AQ1w=;
	b=IdJ91UgBZ5tHtdyb73lFW9w/vqJNaH6lAHG7PWEjU+/W7qgC2SmQiXekjVlnWt9v/4HY
	 kBaFU3ZxoN/NV0PxFC0cwPzJl3BgaCFdgJM4UlbrJIsI9nAWY0EFWUM8XdmYbeaHIqqjS
	 oR+VxRkg62qeks/STir6ZojEgBwHU2Y8iC1E6WktbXYEAIT6EdD/FPfJx36y+Q4qQKBbI
	 ectigJHCVdWv7iuJBbDYOOwfcpE/u7pXxPkFHUHr2j/Djf0+wXDvY8NYyfPv5THrQvhGq
	 ocyE9Pu+2ZimjedeniSe0jZT5G9H4+R2ortejETuoWn/Mh05HDcu85Hi5X01OvX2HJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yBlDy5ox;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.53
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D06606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 04:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80D06606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yBlDy5ox
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-4d3dc583029so4999fac.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:34:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795840490; cv=none;
        d=google.com; s=arc-20260327;
        b=KIBMhApORrTS9nbRsR24YMdec8UHyQXIk+CZJEYz2Qyh9wOP2ZGQBnJ5H6NIi1ysWq
         ZMtkgasLSmcZB+nJPKLvJCnofvZN3+FEGtluPfP0R002dF7LSs7ih1jNa8NG0dN0HU3J
         A7MfoaT8UUglzev/ZnzOyJ11EDj7kO1hhsEW7HSHTTxSiLQ7p9xH4XuGCQ/sttwR1xjB
         VBKgBNauG44VILNdlmSIFbAbzEEbqXKFFFHl2egqNV2nsWkcOrJ2pI7UMk7a4Bktw3f2
         tAhSDXhQCGpxgskR3dD70OPMVBHsBZLyodGkRNuIN5/0CU3L3zAGeY/aXQWluZGSoMvf
         U7SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ft3cUGMZwuJbnCtx/nSJpqRqOJFMOjO+enjfoT4AQ1w=;
        fh=nR77RUUn9Cao79st1ulwOWdWam+QZ++yrhs4iMkDFXo=;
        b=Vn0mGy0wxBnEmb8q1p1LG0xlQlx2HcYJRiZUTAetM2VuvGN7CWE43tS5c0Ymslsgu3
         OSEwUtxG8KOFNn70HhqYsRPPX0NNyocBD+hQG8hslkDXSBfV0kWAtZucuSr326BaQ8VU
         FlMlgeps0A6kSlNXGU07JCJzd8vMnWIPOmmS0GbuHh9KjXnF+e3wehjL7duHK4BC2FPp
         L/8Lm+SflhXaSC6l9akEtt5ac+Ll4AW/Ar+6GI2GvE87U4R36G8KZuxNXEuFENdI+gmQ
         t7dUdlK/Cvo5TBtNE7mlWjl97oO4h8IyYIoF/ORFTvh7dTmSU835owaMJ39KjGRksyk3
         TJZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795840490; x=1796445290; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ft3cUGMZwuJbnCtx/nSJpqRqOJFMOjO+enjfoT4AQ1w=;
        b=yBlDy5oxOhAUHry053sMlyAdv00U90rbHk36Bz+1T0NNwtlGh+TkZxTo3VwvUNhOsz
         7JFQSZWLd/Vol7U3Llt8kBlhkze7fYCb8FLYdAGTtfhjQZ6Pc3+AWNMTZj+8bD4POi5E
         yaGB7YL6AHO1vyG9dMLloSOnSX+BW0p+mDmbXeG8sGOvNMJoZrtvla9G3crknJyLh9PI
         VWqXpc/7+wf0Y4DCQmvI24qNLzswJ6BpntvRw/EignLknmZnjaZ16M0dnFEDyvPAx3GR
         1g2f50VdrU0UlcR+eDU4fp0Hz34xpqlrHVQn/mwnLnXNolGzNsJj1F+ht4FyH3+03+wP
         k6mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795840490; x=1796445290;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ft3cUGMZwuJbnCtx/nSJpqRqOJFMOjO+enjfoT4AQ1w=;
        b=jdlBCEGJRre5sGqeDgxVsnIUGdq2/raAZsFV02h24HpslLCH8R/KkQV7Cjnu3xLTXm
         WWBAKJkFDPkuoIfY991eEjQxrZgRlE6XsHHIccZl0aK4e+8rzrpr9zohYIUvrXyVT6L/
         dmacInGOL0m6iiap5sPSeykwRyDcisNTJanV+ZiI+D1rScURN3L5OPD4hKc9cWczGHR5
         RPNp9uoaMjcuaVywmhm+lnESD7qVfwCp0pPAaiy/ze1uM/ef6R7J9i94TT88c/Fg1DxP
         VftEQLKxEAcUfVTgfK9mfGwEAX2QIKR1F24F7kn7F65y+Ig7HHdeNaDZgjFeo9FQq7Lb
         wrrQ==
X-Forwarded-Encrypted: i=1; AL+hErF8zz4E46gLgdo/tsSq9tgspreH1Bv4O4mrn5+dgtv4mcsGUhAUOCyv7DESSyTFzFSRg7oieb26YylF0T0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dbcb+HzQVF+m2Xl/mTRngPPLT5DoxeWVZyUP0lHRZwffDlSur
	PhCQ9Vtt2wn4JBfWJbpZ+mQsGHyhsjQvmkXAO1FQLf/7JviRuzwhOTIC9JcWw+eTFlKFUXoRpPO
	acEiO+r+AoWu0bvAuMXVxJxnbfTfZjLY=
X-Gm-Gg: AZFdTZejA/OuXrTXmKe/uegwB1YWAxBDegpozGIVdUvG3sjV4S3t18Gz/xELgKMl2/I
	2C3yHYxweIxG1p44XHjWpJrIvbn77o4HeIrfIpZgzKCXIBODGO8i1F/EK1vmTd0oUXriUYXXS8u
	E/QepvmYldmj6LXFoAblrzRbsM48U054JvsqlSo9Lcfhm6sEtyiexfdAoANTHcDt6xXaOCgifXF
	zFSM4No06l7/UZ49AfXVix6gAdqGthBpiWT0Nsb4Vd/2XaU4RhtePgSI2ocwHcLP8qyrJXhKJuf
	Rx4OXLtwpzQpZd7Te4Zx3aDH6E8RUGtgGynbkwZKSE4SDTDB1sZWTYiozk8cp4yiVVIvmcxlrVB
	b+7qDm2VHllFrmdwwRXXI8S024WRMDqJUL9XUu9FHr2IA8ww8kEOWBGoRksXnD6QdjmQbBBwO9A
	tH66tJ4ST5TGuTZugpQxCZLr3Jcdm16wLZoOMwXXQ/xlrZxy7EHBxJns3O
X-Received: by 2002:a05:6870:b154:b0:4a6:f676:ecef with SMTP id
 586e51a60fabf-4bc85902a3cmr23268703fac.55.1795840490274; Fri, 27 Nov 2026
 20:34:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261126-exp-phy-rs-maybelocked-v4-1-16f9a10bb579@gmail.com> <179579171493.3135.13012003515691317246@kernel.org>
In-Reply-To: <179579171493.3135.13012003515691317246@kernel.org>
From: SeungJong Ha <engineer.jjhama@gmail.com>
Date: Sat, 28 Nov 2026 13:34:39 +0900
X-Gm-Features: Aa3M54oVMmGH-ZjaDn3eIIdiuG-rT6kTcFR9f6TCVy1lL0hu446KZxkRFm9B_ts
Message-ID: <CAGAB667-6_gX7_q13GvgmAZQGHNTqxxJ5_nWFLrpvA42ZfAzBg@mail.gmail.com>
Subject: Re: [PATCH net-next v4 1/2] rust: net: phy: take &self in methods
 that do not need phy_device->lock
To: netdev-bot+sashiko@kernel.org
Cc: fujita.tomonori@gmail.com, tmgross@umich.edu, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, dakr@kernel.org, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, andrew@lunn.ch, 
	hkallweit1@gmail.com, linux@armlinux.org.uk, netdev@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 11=EC=9B=94 28=EC=9D=BC (=ED=86=A0) =EC=98=A4=EC=A0=84 12:01,=
 <netdev-bot+sashiko@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:

> rust: net: phy: take &self in methods that do not need phy_device->lock
>
> This commit splits Device::from_raw() into a shared from_raw() and a new
> from_raw_mut(). It redefines &mut Device to mean exclusive access to the
> phy_device state that phy_device->lock protects. The getters for that sta=
te
> now take &mut self, and phy_id(), read(), write() and genphy_suspend() no=
w
> take &self. The callback SAFETY comments are updated to say when PHYLIB
> calls the callbacks without the lock.
>
> > diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
> > index c4e7b1d6c6f4a..bb2cc6b3c94c8 100644
> > --- a/rust/kernel/net/phy.rs
> > +++ b/rust/kernel/net/phy.rs
> > @@ -57,50 +57,71 @@ pub enum DuplexMode {
>
> [ ... ]
>
> > +/// PHYLIB calls the callbacks that get a `&mut Device` with `phy_devi=
ce->lock` held, except:
> > +///
> > +/// - [`Driver::probe`] and [`Driver::get_features`], which `phy_probe=
()` calls without the lock
> > +///   before the device is attached.
> > +/// - [`Driver::soft_reset`], which `phy_init_hw()` calls without the =
lock while the state machine
> > +///   is not running, or from a MAC driver that then ensures exclusive=
 access. `phy_mii_ioctl()`,
> > +///   which PHYLIB documents as "use at own risk", is outside this gua=
rantee.
> > +/// - [`Driver::read_status`], when a MAC driver calls `phy_read_statu=
s()` directly. The MAC
> > +///   driver is then responsible for exclusive access.
> > +///
> >  /// # Invariants
> >  ///
> > -/// - Referencing a `phy_device` using this struct asserts that you ar=
e in
> > -///   a context where all methods defined on this struct are safe to c=
all.
> > -/// - This struct always has a valid `self.0.mdio.dev`.
> > +/// - `self.0` is a valid `phy_device`, and `self.0.mdio.dev` is a val=
id `struct device`.
> > +/// - For the lifetime of a `&mut Device`, no other thread accesses th=
e state of the `phy_device`
> > +///   that `phy_device->lock` protects.
>
> [ ... ]
>
> > +    /// Creates a new mutable [`Device`] reference from a raw pointer.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// For the duration of `'a`,
> > +    /// - the pointer must point at a valid `phy_device`.
> > +    /// - `(*ptr).mdio.dev` must be valid.
> > +    /// - the caller must have the exclusive access that [`Device`] de=
scribes.
> > +    unsafe fn from_raw_mut<'a>(ptr: *mut bindings::phy_device) -> &'a =
mut Self {
>
> [ ... ]
>
> > @@ -309,10 +331,10 @@ impl<T: Driver> Adapter<T> {
> >      /// `phydev` must be passed by the corresponding callback in `phy_=
driver`.
> >      unsafe extern "C" fn soft_reset_callback(phydev: *mut bindings::ph=
y_device) -> c_int {
> >          from_result(|| {
> > -            // SAFETY: This callback is called only in contexts
> > -            // where we hold `phy_device->lock`, so the accessors on
> > -            // `Device` are okay to call.
> > -            let dev =3D unsafe { Device::from_raw(phydev) };
> > +            // SAFETY: `phy_init_hw()` calls this with `phy_device->lo=
ck` held, or without it while
> > +            // the state machine is not running or a MAC driver ensure=
s exclusive access. The
> > +            // `phy_mii_ioctl()` path is outside this guarantee, see `=
Device`.
> > +            let dev =3D unsafe { Device::from_raw_mut(phydev) };
>
> [Severity: Medium]
> Is it sound to call Device::from_raw_mut() in soft_reset_callback() when
> the SAFETY comment says the phy_mii_ioctl() path does not give the
> exclusive access that from_raw_mut() now requires?
>
> The new invariant on Device says that for the lifetime of a &mut Device,
> no other thread accesses the phy_device state that phy_device->lock
> protects. However, phy_mii_ioctl() reaches this callback without
> phydev->lock, and the PHY state machine may be running at that point:

As discussed on v3 [1], this is documented as an exception, see the
Device docs above. Passing &Device to soft_reset would drop
genphy_soft_reset(), which ax88796b_rust needs, and FUJITA agreed on
keeping &mut Device there [2].

[1] https://lore.kernel.org/all/bfd7a44f-2bba-4aee-9758-1dd88f94566f@lunn.c=
h/
[2] https://lore.kernel.org/all/20261126.081155.1605990248496749195.tomo@fl=
apping.org/
