Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795021048;
	b=X9UMh7mLvHrt+OEuXnki4bBcaqLjBZNdikr6FN067koPqVVHHSHSjJ4XrZE9IZltMsf8
	 fLEbaaIlVcqWMFW4NkB45tDQkEvskznk+USUrcpClIVnXAUgRAnp3fpKAHYgoa9INeS2k
	 jj7O9bKV8FJfYKS6xpPzpqyo6ZwcHxmj7U2JFe4Ur+GdCP2mU/t10d281vkHsW9xtV/ts
	 eyZ6BoEBs8KQN3xzFIWtURndk4IQ7D26APuhcXjz44SC3WCvZGajneJzhSGuhv2Y+FtdE
	 0LnbFbGIVSpuvfyvqRPMCMAxH5wlHYGg2OUyAxUUgj2drupsgnlC6v6fD7QgGvWFJZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=q4KDOTPdWsAvn5fnJD2QpV13fNXrFnBH5XSZbqxlxTc=;
	b=T6h7W/BXwGBxNeYhRvNL9LpjTeFW1nx5iv7Nm4HLKaaHmr7+fdBEX3ntvFDcyRRHH61+
	 5sALCz8EiBt8/x/a0fi4okBxukqOwDTvosT5C/ip8KEmm/Km3dpwpW9Ca3yqr4FSssfl5
	 iroCQYVqsJ2No4ryxq26QSCjtWsN7KY2Efb1zORTE9RZMnrSL/ZPMg3vIlre0Pv9BnCYf
	 a4VLEYNTxQnqv7JgFS6DQutzMVZy/OD0Jx+0SQBtsKLRT1R/90Gn2yqbOzGliYJbfWa5n
	 pZpvlnAgdxUBpeKXrYgrBNWVWhfpjAoPue5TJXWnnVZDM3/X9hDLDtnQU97LSYLdJRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gDbaeCUk;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA45160A260F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA45160A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gDbaeCUk
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4a42b34e930so988133f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795021046; x=1795625846; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q4KDOTPdWsAvn5fnJD2QpV13fNXrFnBH5XSZbqxlxTc=;
        b=gDbaeCUk4GIRuxDdeulzhOU84d7EBOgDmBW3pOzJDe3LLdN1nTHx/eqr38pjPOmtPU
         ZZiSrhlKPjhHiIeMLGGoVnBZj7UvbiTbgmzaEW4zDTAm4UQove74zVlNSNaj/DIY1Eh8
         65MATJR6ts2TkdIZsG7eDeqh8gICNdODo4FzYaj6iZEFhCLNZmqGG4swtcESCxRFzH2i
         7A+vuoQFVCuN8NyMeEZdXnLDyXBSNx9mFjLFf//TTfB78DE3YIZTp2vZGzbpN3QZw8bs
         vIFDglROm6lHh6pLIlRQEoSRIGdrelE//UvVbtHMUAtyCQCtm61WNdYJR92PJPwJhQwf
         ijzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795021046; x=1795625846;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q4KDOTPdWsAvn5fnJD2QpV13fNXrFnBH5XSZbqxlxTc=;
        b=FspehrzSu+GstN6XGeJ7PNXo1fGvGh/2H6ErOYEF/HmVODCkpu09GtQVcKnXYJe9D2
         xaTtPWnTjVq+w8x7xeYJuand5Is0cTIHpeLFbP+ucL7xYqumu4jXt+0xZEbkRUhFzBBu
         /sJbnoY90E60wcCaeFJdJjtAu+AkPyhvN6Wfht4CY4CTqmBrAIUS7qeN7CSSzz8ahnTQ
         8/JaJxLtutH06SDOMe+tcHGRe0BG7R5CtHA/i3sS4Wqrck3wWaNCQ4B0Zc9gOKhMSgzx
         yETElLtN5c+drX/+mxSKp+4VnSb8oxKMw4Yvoyf/CknJo1DRtI3p0Yy8KoLHmmQWx2IM
         3x1Q==
X-Forwarded-Encrypted: i=1; AL+hErHcN2gAcSAfOO9SC/TTGU0bCgQ8MLBcxyBQv5EcNe7ZozdhHgTmZNyv7hgB0Lv+a42QJQjb3aoYwP9F6AY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VcwPaHQcvBT9YpRvGYKqI/5Cg+vf7CFqMpWjuqa55yck5wRgh
	av+IDGGycy1L4OCeZiXwwQ97fa9EwUgHocdberxBaK+8HK9oxpcQfcSN
X-Gm-Gg: AZFdTZczYoGyn7/dvfEaeCmkuBoOvC1838H79X9kiGEhBjFNEDCb0IqWk8lSZHZTqmA
	e9TB0gr9CsuHAHHPciwzyi67EENiTpBYyHKz3mlA9o1ejC0HCzg3Er+f7NdzbbepREVYlM8BN5n
	9of3wMWvaXG+3CEn1OUO/3+BFrx+TyyQ8OjzqN59QYO3Squ16RaxhxG9Kn1TukwI1OgGb2ABwhE
	zC+x0j3Mw0tNkZNtRY2ciSpthJZdwfdHHoi4q3VP9WWS2/0DdNjwEZFCJxCv7HIK1U5Ci71lhdd
	jbfoG+CuWwFUELPOaDN5KlxpAMLSCdNhKrFGB3b3JHwDHorJVbNQLXADnu9W0LsZpimRjeW+lAG
	MQyouvbbvP1n1pCgwgFoBIYXpVZdB8Gh9S+kZIJ3NuswcvPbdPfjuXBA3lrDqDIEq1x0sMWKP/q
	zvM2cR4XsAJNb3IMoSJSrjnp+BLTbFAa6jSaCKd/fYcp+sMFe87O+bC9KvobiKvFogrG1EghC2N
	jLmDndxEcSqEaxU992oJaBElzhgk4vxBbW6aFAKL+xxdv5uS8M09KXGi5uGlt9pCMOVVgcBrzGE
	Ny6ESxE3Y1N8RfEKlGtKDUJ0XjIpjCSEqajW7T5vjDNTdijFYC1qKOCbnu4dJ+YosvhdZYdTjhm
	D8q6zgjmjXDsBWSSjj85itz+h+uhx2ejRi2eXl1g07M3PxPC2G2H5DjGG/c7+bSrRkiZxr2qIWb
	y+
X-Received: by 2002:a05:6000:608:b0:493:28c4:331e with SMTP id ffacd0b85a97d-4a63ac6b509mr6786601f8f.28.1795021045786;
        Wed, 18 Nov 2026 08:57:25 -0800 (PST)
Received: from C422HJQPQG-Fractile (cmbg-18-b2-v4wan-168328-cust3701.vm17.cable.virginm.net. [80.5.206.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656b1cfdfsm6052676f8f.47.2026.11.18.08.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:57:25 -0800 (PST)
Date: Wed, 18 Nov 2026 16:57:22 +0000
From: "Vishal Moola (Fractile)" <vishal.moola@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: drm: ioctl: fix call to unsafe function
Message-ID: <av3Y8mTaRi7l-5iy@C422HJQPQG-Fractile>
References: <20261118133232.48603-1-vishal.moola@gmail.com>
 <DMYH0CXPUTMP.J3AKN619TL34@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DMYH0CXPUTMP.J3AKN619TL34@kernel.org>

On Wed, Nov 18, 2026 at 05:17:41PM +0100, Danilo Krummrich wrote:
> On Wed Nov 18, 2026 at 2:32 PM CET, Vishal Moola (Fractile) wrote:
> > diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
> > index 64af9eacc306..5a2e2f4f0e91 100644
> > --- a/rust/kernel/drm/ioctl.rs
> > +++ b/rust/kernel/drm/ioctl.rs
> > @@ -152,7 +152,7 @@ macro_rules! declare_drm_ioctls {
> >                              // dev/file match the current driver these ioctls are being declared
> >                              // for, and it's not clear how to enforce this within the type system.
> >                              let dev: &$crate::drm::device::Device<_, $crate::drm::Ioctl> =
> > -                                $crate::drm::device::Device::from_raw(raw_dev);
> > +                                unsafe { $crate::drm::device::Device::from_raw(raw_dev) };
> 
> I remember there has been at least one compiler version in the supported range
> that complained when the safety comment isn't directly above the unsafe block.
> Has this been fixed in the meantime?

I'm not sure? I'm compiling with rustc 1.98.1 (48a229cea 2026-09-01) (Fedora 1.98.1-1.fc44)
which gives me no errors like this.

Hopefully the build-bots catch it if there's a specific compiler version
that still dislikes it.

The following command shows a few other occurences in the kernel like this,
so if its still an issue I imagine it'd likely be caught somewhere:

	grep -rn -B1 '^\s*unsafe {' rust/kernel | grep '=$'
