Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795773334;
	b=4knUiYNEfEJ/5fWLJyaUjXsPxzReE4lU9T5+3mTAaS9nHYpNAFn8UIEvpBQLpzGLU0Ko
	 kDQOXuY1sLMj8dAfuX0BdRe36pOUHdKjNDTP2nK5gDq7pn7S6ZSfC8zS4wD0yRJWu+ifs
	 J9XIoLmUk0H3oA3jn/LL/ic4IqrFMsLtJIK7iPhy9v1HVwqTqzXX7Xh+jepb0H1CbDYHx
	 oPKESaqw/Jp5cX7xp00LgVFWOmRDnhtf9f6L2Bt0CBNBoa6PdLMk+B0fu4BKLk+HR1Fpo
	 LXvxkzt8nO/ww7wnkMrgfyFmGFyrwXVYi2vgQtdWWPjaMdoaDYzlk8x0L6AkgzRCrvA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773334;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vpy+L8ilFk/xVj47uBuvADr4xljwNe7U/d1k7VvtaJ8=;
	b=SvKZN+Y846XhGRJ809dj3MZTAHDW2biOf7ecFfMQrNeKSAToSAGqY2XaJc8uvUt1KNBz
	 ntmrFo7b+Rw722GIEiWeC9bufdcC1MC5x43T0eVyYgaTcXyySxZDB/+6sqW/b8hfpF0vI
	 JDXoWY8kYnAj9oIGSZABfMDjzLa7OfM2ABT8Oqj5q7Cg4Dc3ZfO0ZlaXYpMlM0qJJZcD3
	 MQiQNqlsnqTz95mBYC/wn5I0Xyr+ACyyr+qfXRE4YV9a4JkOU5LWgPhyAKI1OpQvSj1ZL
	 yGtO73/HjWYzaaqqtMXowEX+2SWIBSAaR5o93Fa5olAUoRSy2heucJ7+/qgoaefx4Ew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=o3OSRhaw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E177F606A682
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:55:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E177F606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=o3OSRhaw
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4a9be758734so4980593f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:55:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795773327; cv=none;
        d=google.com; s=arc-20260327;
        b=nXVDJsSq/10AXDSNdAbU+CWvqvwotp8BOjBsFE2ywXxbVUdrHdKi0UUdM9uPuw/VO6
         dLkZ4eWtBPM5d/BvZM/7WUjxS0EfHsiAFdc8qosV4czOU7oRQkYDHQHU+gTAwALKaH5v
         9vzBc6OMs2UWUvBbWlr0ViDzQoiP/+EWqU/XfAGhpwi2mDdAudlwnXbO8QyYqA2/aFAp
         tgNOi6rKj8E2QuEIS7xK59qTCiNldsoV7XhGVL0g0wYLugk9iLmofCUrKDpDz+BAlcLq
         ydMPDpLReHutyOMLXEXVWd72vIJ+zQPPHzf2dwcetXQ1ut46yTlQtHMFwFc9sXfWHkVP
         Vp9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vpy+L8ilFk/xVj47uBuvADr4xljwNe7U/d1k7VvtaJ8=;
        fh=RBNGBugSER4fQpWeafwbgkXoOBZAJw5YQCyq0lL+Kl4=;
        b=VTeRfLJECN62Q+tLdTlUMwzPvtkE01s3PbjenQXVuOwMUjv9IploOki0u+t+6Aeebh
         3A47tXqMZktKFJiAX7cHkKKWBlWSOMM3ZEYEh4szoc5vu2409UofDo4skvVaMoSOQ4h3
         aGMrAXWySoAShUcZNxSymklypdbACryp2L3cMIQ71O2X4ZMiDqK/v6dIN5jvV0R/iHcS
         sucCCMeCyBPDbiIo0414SlX6Ac3/42tU6p2UzWRlYCgFfYiIm47UMY98dIQjAjmIFwG1
         gSlxyscYYGlcWFlADSgxolv6x8iNrpkVgUKw8pscpByF/GPlSCRM6TjUPwtGlMqnOyMJ
         rsMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795773327; x=1796378127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vpy+L8ilFk/xVj47uBuvADr4xljwNe7U/d1k7VvtaJ8=;
        b=o3OSRhaw2QYcXwmaZ3dSGH1e18rCjmoO4Up/97k1PFGYjLm4Xa0qKyEVQesQPMEaAN
         DIUz1VvKO1keEcutO8WSM8HhHMKVxKc+E3vOtmXZMWf+65Xnd2flpMmgdVNmYBt0HzXz
         RoOeiEXgzTPHfsd4d3V9Xk24iQs+ovcjlDS7aP105p6QC+18Ki01aiQHNXDjSBsTiA8I
         qkAhtY6jPuD6++aUisGf5ItXnPYUM1L6PZwNePjh2NGKd2iDWtec1XxoQtEoV1A8nmaO
         xjvCzcw5f2Zk6DEzSE2Z5dGdNbYrSBC3trhGzD0rDrRYy7sCwLeH5gMDXuR35+Vg1/bf
         +TsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795773327; x=1796378127;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vpy+L8ilFk/xVj47uBuvADr4xljwNe7U/d1k7VvtaJ8=;
        b=Q087txIDApUa1Zcr8AFQme6tghly0hddwWcxRCGif3/OFugEd5wu+rH5bkQ8hWawAy
         Xrk+QdrU10qvv03+uRVXg7kSh/AhqzELRsKy/3NFZO5yeGBHp4dFr34X63TzkKUusvxM
         b585mRjakNuO5+LD+TOx6lCs1tD2nKvjepDOjdXKJwWFWsDTh7AU37CBxg1391mrt4cC
         4WtwXDx2vZL4vmnaEHfaNQbAd1dvvwNjszwJYb6sxlNHjjurhn3b+egTqO3orlQHrxYM
         bizOwYECsM+fo2zRwsK5cFrv49d+5nkxvSS7EQABRIyfHt9v3vRxMMHXP6FwkFNcnb23
         ZlTQ==
X-Forwarded-Encrypted: i=1; AL+hErHF2Pkq/o8zf6MngLAF7b2WwexQw5t5AJooTkzWqyfH0Gha5KZ/zzGse1fZPNSOAZGhI/k5xoCkRWDEASw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EYr9uMM0sSlaLXRe5OevNj8pUwmajvxQ8WNxcDfY3szmNjKxn
	aH7DWR+6Wi+YqvS0Ajkt7YLAxUNPrT7Hu1W90dmMIFG5mKNelhgCz6gbg7y1dVh6pUAwYAtNV0d
	KNY5kuBvgb/75tbfIv8D5uy89/vq9LP9VsD5xqaRK
X-Gm-Gg: AZFdTZfcK67JXq+R//7Qy9Qo072f2U3V9tmcGHF/HIlGvD76/zxqnsMHc5pC8D8fAJH
	kC+2EQcSjv6+AIeiOZXDR9EXk2CWOMqaNcM05xpVQeN8BdIbt2UVHEF2SjMqsxpDOyEAjRtdIOM
	SKUgzvbGaJq24vdSGkLeNBnNKDIgM4Ie/esLHRI5h4GhJQuK6UNAx5tqQ0eSg9yidHLbSn0Zi7H
	0sKEKYJXUCmwmvvujSp1IRhhDnFhGbrOW1tz72+PbrvezHYzJQG3/Ps5F2ACk7q510BZGDg5jML
	ZLC1yo1DO27PCn0PoET/wZlm6453Z5BkryXI0XwUXU6A58fUzdUqiAmihs7HUVJhlT2cyvov+Hy
	i3bbjhRaz7Bj/D+j8hhd35qKE8XlKHKfixWBZtoHon7cZkvQ30L0xqqdocXjVqq6umhZ11/+PHF
	y3qhZi+CmsbUmglRB3bUb4b5GmK8Y77BsVgULC2pAHyyP6
X-Received: by 2002:a5d:588b:0:b0:48e:66d0:664c with SMTP id
 ffacd0b85a97d-4abaf64be12mr50144469f8f.15.1795773326393; Fri, 27 Nov 2026
 01:55:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124-rust-drm-gem-shmem-imported-sgt-v2-0-000f7a9ccb8d@jannau.net>
 <20261124-rust-drm-gem-shmem-imported-sgt-v2-3-000f7a9ccb8d@jannau.net>
 <awXA70GWssuU991c@google.com> <20261125113846.GB372978@robin.jannau.net>
In-Reply-To: <20261125113846.GB372978@robin.jannau.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 27 Nov 2026 09:55:14 +0000
X-Gm-Features: Aa3M54oiZNSDgmAEoH9NzLLBRhpgjBRE2cJGZY4MeBf6M2cJPAdsD-3P1zcRduo
Message-ID: <CAH5fLggRtEUopYT0ZacNvczLRTNk4sKDrE7q-isgW=MDn4mqMQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] rust: drm: gem: shmem: Implement
 prime_import_sg_table callback
To: Janne Grunau <j@jannau.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sami Tolvanen <samitolvanen@google.com>, Lyude Paul <lyude@redhat.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	nova-gpu@lists.linux.dev, stable+noautosel@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 11:38=E2=80=AFAM Janne Grunau <j@jannau.net> wrote:
>
> On Tue, Nov 24, 2026 at 04:53:03PM +0000, Alice Ryhl wrote:
> > On Tue, Nov 24, 2026 at 12:37:45PM +0100, Janne Grunau wrote:
> > > +        // SAFETY: The DRM shmem helper only invokes this callback f=
or a registered DRM device of
> > > +        // type `T::Driver`, which is `Self`'s driver per the `Alloc=
Impl` impl below.
> > > +        let dev: &Device<T::Driver> =3D unsafe { Device::from_raw(ra=
w_dev) };
> >
> > `drm::Driver` in `rust/kernel/drm/driver.rs` currently declares:
> >
> >     type Object: AllocImpl;
> >
> > without any constraint that `T::Object::Driver =3D T`. I think we shoul=
d
> > introduce one similar to how Driver::File constrains this?
>
> so changing it to `type Object: AllocImpl<Driver =3D Self>;`?

Yeah that's what I meant.

> I think it's hard to get that accidentally wrong but since the change
> relies on that constraint and we can express it sure.
>
> I added it locally for v3 but feel free to make that change before
> pushing this series to drm-rust-next if there is nothing else that
> warrants a v3.

I'm ok with adding it on apply if there's nothing else.

Alice
