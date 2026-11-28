Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795881949;
	b=jvj4Ty9FKw/kHcvsmCzL4R+dKAWX3Rw5glv0jLg+2/3jkEyiB0LQOeqQ1YnvoydMgEXk
	 JeYXJOx2oeW6xWs/QFfLVit4lxL0WV9acTZVFMkj/YYr2YW2BMFpA6c++gDC8VG3MZqFH
	 vkb2FbHAKSiCbXokp0ickSRvTuw1rJOJipobnfHgYwNu+dmXTHSEfNPrbi9RNVquZoiHj
	 u0CpZrBlk2uwli9ZivW/BYcqGEzokoNTAAp98+0Vt3gO9vqf6K1AfCGoVX1FkV1OnDWDZ
	 shLkWSVJnS/aje1ajGbEy7Eg6F0bPbHAhm9/GP3lVMymZ4nWHiUFNqW++4LwOvvCXmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795881949;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=lcoH3yI0uHH8hb5GdapZ+cjDHBttXTymWOGdrX48sfY=;
	b=en8BOLIkdYumGSA+8DiSqgm7epiaUCNJdd46YQfJwZwhJW11PCSQU98coNuN0MEj/fLJ
	 HNwnQGak/Q6q9dFXYulGIXv8n0YmOnZ5dtpSAzLmDQ8AgFXRjiHFm0VuKbxVN8r0wyLaF
	 5lbWw3Q4WxX2INzvpd70Y89Ey/SHqQJA/k8cI3kWowBsHK1Zu1i2LtyooOPpSI99tXSMs
	 mocLw18kPi9Sn0cSGMTc5Ty33wwCWKifQ4yRjq7UBB2Rrxojp0uhpGgreHvShZFx5tgOu
	 myXKtmT7HFJ1XchA3yQZa9NkKRFV3NA3urTEZQFaYB0yN12og/X0qrD6Jt/vi0KEjmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=UcHwordB;
	arc=none smtp.remote-ip=212.227.15.18
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4994B606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 16:05:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4994B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=UcHwordB
DKIM2-Signature:  i=1; m=1; t=1795881946;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.de;
 s=s31663417:rsa-sha256:seG/Q1WRIrT0w5KoLgJlAKdAufJw
   s6woZgB86GgY+fA4FjEzGLIq1w/sHb8BLSYVLavmVr9to2uSy9Pef9vfF/p5uog/y7MLHZG9brq
   r5UCw/tE387MsQ9COm5FlEvgYd4nE12QxrkSk5lh2QRjsXWRvhNc1Hbkp1UFsKFSyZ6txxYg8PK
   7U7LyhRnzT4ZRKxLzqzrYlWXfy42ElQu3jF+OrPnMpB1eTWL7Ca/4wvXbIzG9Rnd4zmyaGS6Ac3
   L27AluS62prkv1fZtmCDo3UkIb2+PS4JM+MoR10jPB41DaS0G+8x/dwoWtOvzhGlA0jQQCwKovz
   kbTJXGwWCgjAKw==;
Message-Instance:  m=1;
 h=sha256:
   ws0eAwTsrehXjCkN9HARAWmq1kCB568IeGpQkmLOdkg=:
   +KNKkxEV6CjqDoo92zE3i4uGONMePSpmSJG0cUX/0M8=,
  sha512:
   J2d75NA871A18gBQ7XZoR+9xBp1vDKztWh+2DAKGq50AeSliQMvZd0CB4zpaxuNQW6Ev2vpKtJCBUjCBQxy8hw==:
   sjLG8VVYV3Ej+8cgM33W3IRIFb2Rq/jA1Z86FOBXj2/Fm/XXW7IC6NuUBcqpIBMKhCt7hwM1LQkd7B2f6dY78Q==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795881936; x=1796486736; i=w_armin@gmx.de;
	bh=lcoH3yI0uHH8hb5GdapZ+cjDHBttXTymWOGdrX48sfY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=UcHwordBFMszRtfdWuRp/UxevH4xOcFqPLEfo3ba4d5vYuJNVJwVY7KbMVGBMB7S
	 oRvRPtMWbpFVpmL4xeavKJ5AypA9UhiRnp0VaDgdubtFjkjhpQuccB1ILRtV/oEA2
	 XXGx9Ekch6psZldoZcHY6RvSlQF2N+V+H2wsxQ5LUsDdnnwbDAFGRpi7axHfkyjk/
	 Y9ZXQuaLOTi2AUlfOxCe6NHXlBWy63fYk2Ny4IiTFsrun4RW4UpiNxnynxnJvaK+7
	 /IGaLMSkME4g+9ul7vQI27rvISCXX5QbC6NmFUMIoC6c7pIcVqPbppNHbrJykSlGG
	 Ts92Xnjpq5bkk/Op7A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N79uI-1yZyBH3mDk-00tv9t; Sat, 28
 Nov 2026 17:05:36 +0100
Message-ID: <f84eb81a-7072-4280-8731-7d1639f09cb8@gmx.de>
Date: Sat, 28 Nov 2026 17:05:33 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] rust: wmi: add Buffer and Device::invoke_method()
To: nick42d@gmail.com, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20261127-rust-wmi-v2-0-5bfafabd6a6e@gmail.com>
 <20261127-rust-wmi-v2-4-5bfafabd6a6e@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20261127-rust-wmi-v2-4-5bfafabd6a6e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tGNhOVhXIVfrOHDMsDZchYOGGeJ02841//c426Qr4cr0FXGXrQr
 xZjOEauyhKmiLScdN3GtoVdfd2h7dSxUdUTTA4Lak2gryo2sVT8aORIatqHOQE2E1vtDtUt
 ayoffEE0jFLFawzLBaCKr4iJbpihpmfx2tuyef36mcMHlqhTqnzTfl1yYR4jE8tlizpqRmU
 9wEQXuTiBZHjyI6hi2Z6Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:aIoafxbvkgs=;2mQ8m43O2EDp2d+brNButFDujik
 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
 EBs=

Am 27.11.26 um 12:02 schrieb Nick Dowsett via B4 Relay:

> From: Nick Dowsett <nick42d@gmail.com>
>
> - Adds safe `wmi::Buffer` RAII abstraction wrapping an owned
>    `struct wmi_buffer`.
> - Implement `Device::invoke_method()` - safe abstraction for
>    `wmidev_invoke_method`.
> - Also implement `Sync` for `Device<device::Bound>`.
>
> Signed-off-by: Nick Dowsett <nick42d@gmail.com>
> ---
>   rust/kernel/wmi.rs | 101 +++++++++++++++++++++++++++++++++++++++++++++=
+++++++-
>   1 file changed, 100 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/wmi.rs b/rust/kernel/wmi.rs
> index 235c4a2cef6a..3cd5bed6066f 100644
> --- a/rust/kernel/wmi.rs
> +++ b/rust/kernel/wmi.rs
> @@ -17,7 +17,9 @@
>   };
>   use core::{
>       marker::PhantomData,
> -    ptr::NonNull, //
> +    ops::Deref,
> +    ptr::NonNull,
> +    slice, //
>   };
>  =20
>   /// Type alias for [`driver::Registration<Adapter<T>>`], the registrat=
ion of
> @@ -229,6 +231,11 @@ unsafe impl Send for Device<device::Normal> {}
>   // - All methods on `&device::Device<Normal>` are thread safe.
>   unsafe impl Sync for Device<device::Normal> {}
>  =20
> +// SAFETY:
> +// - As per `&Device<Normal>`, but `&Device<Bound>` also has the method=
 `invoke_method()`,
> +//   which wraps the internally synchronised `bindings::wmidev_invoke_m=
ethod()`.
> +unsafe impl Sync for Device<device::Bound> {}
> +
>   // SAFETY:
>   // - By the type invariant, all instances of `Device` are reference-co=
unted.
>   // - Increments to the reference count keep the object alive in memory=
 at least
> @@ -258,6 +265,71 @@ fn as_raw(&self) -> *mut bindings::wmi_device {
>       }
>   }
>  =20
> +impl Device<device::Bound> {
> +    /// Calls `wmidev_invoke_method`.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// # use kernel::{device::Bound, prelude::*, wmi};
> +    /// const METHOD_ID: u32 =3D 0xB105;
> +    /// const METHOD_ARGS: [u8; 1] =3D [0];
> +    /// fn method_returning_u32(wdev: &wmi::Device<Bound>) -> Result<u3=
2> {
> +    ///     let output: wmi::Buffer =3D wdev
> +    ///         .invoke_method(0, METHOD_ID, &METHOD_ARGS, size_of::<u3=
2>())?;
> +    ///     let output_as_bytes: [u8; 4] =3D output
> +    ///         .get(..size_of::<u32>())
> +    ///         .and_then(|buf| buf.try_into().ok())
> +    ///         .ok_or(ENODATA)?;
> +    ///     let output_u32 =3D u32::from_le_bytes(output_as_bytes);
> +    ///     dev_dbg!(wdev.as_ref(), "WMI output: {}\n", output_u32);
> +    ///     Ok(output_u32)
> +    /// }
> +    /// ```
> +    #[inline]
> +    pub fn invoke_method(
> +        &self,
> +        instance: u8,
> +        method_id: u32,
> +        input: &[u8],
> +        min_output_size: usize,
> +    ) -> Result<Buffer> {
> +        let mut out_buf =3D bindings::wmi_buffer::default();
> +        let in_buf =3D bindings::wmi_buffer {
> +            length: input.len(),
> +            // NOTE1: Even if the input slice is empty, this will creat=
e a dangling pointer
> +            // rather than a null pointer as Rust references are always=
 non-null.
> +            // NOTE2: The input parameter to wmidev_invoke_method is ex=
pected to be read-only,
> +            // however, we cast to a mutable pointer here purely to mee=
t the type definition of
> +            // `wmi_buffer`.
> +            data: input.as_ptr().cast_mut().cast::<c_void>(),
> +        };
> +        // SAFETY:
> +        // - By type invariants, `self.as_raw()` points to a valid, liv=
e `wmi_device`.
> +        // - `out_buf` and `in_buf` are pointers to valid, live `wmi_bu=
ffer`s.
> +        // - `in_buf` contains a pointer to an allocation behind a Rust=
 reference (which therefore
> +        //   lives as long as this method call) with length less than o=
r equal to the allocation
> +        //   size, or contains a dangling pointer with length 0.
> +        // - The allocation in `in_buf` will not be mutated - the C imp=
lementation declares the in
> +        //   parameter as const.
> +        let status =3D unsafe {
> +            bindings::wmidev_invoke_method(
> +                self.as_raw(),
> +                instance,
> +                method_id,
> +                &raw const in_buf,
> +                &raw mut out_buf,
> +                min_output_size,
> +            )
> +        };
> +        error::to_result(status)?;
> +
> +        // INVARIANT: `wmidev_invoke_method` was confirmed to succeed. =
On success
> +        // it returns a `wmi_buffer` satisfying `Buffer`'s invariants, =
which we
> +        // hand to the caller as the new owner.
> +        Ok(Buffer(out_buf))
> +    }
> +}
>   impl<Ctx: device::DeviceContext> AsRef<device::Device<Ctx>> for Device=
<Ctx> {
>       #[inline]
>       fn as_ref(&self) -> &device::Device<Ctx> {
> @@ -274,3 +346,30 @@ fn as_ref(&self) -> &device::Device<Ctx> {
>           unsafe { device::Device::from_raw(&raw mut (*self.as_raw()).de=
v) }
>       }
>   }
> +
> +/// An owned, 8-byte aligned output buffer.
> +///
> +/// # Invariants
> +/// - `self.0.data` is a pointer to an 8-byte aligned owned buffer of l=
ength
> +///   at least `self.0.length` and freeable with `kfree()`.
> +pub struct Buffer(bindings::wmi_buffer);
> +impl Deref for Buffer {
> +    type Target =3D [u8];
> +    #[inline]
> +    fn deref(&self) -> &[u8] {
> +        if self.0.length =3D=3D 0 {
> +            return &[];
> +        }

Hi,

this might not be necessary, because an empty WMI buffer from the subsyste=
m will
never contain NULL for .data, instead said field will be set to ZERO_SIZE_=
PTR.

> +        // SAFETY: By the type invariant, `self.0.length !=3D 0` guaran=
tees `self.0.data`
> +        // points to an owned buffer of length at least `self.0.length`=
.
> +        unsafe { slice::from_raw_parts(self.0.data.cast::<u8>(), self.0=
.length) }
> +    }
> +}
> +impl Drop for Buffer {
> +    #[inline]
> +    fn drop(&mut self) {
> +        // SAFETY: By the type invariant, `self.0.data` is exclusively =
owned and
> +        // freeable with `kfree()`.
> +        unsafe { bindings::kfree(self.0.data) };
> +    }

This is wrong for WMI buffers used as input for wmidev_invoke_method(), be=
cause the data
might be statically allocated. I suggest that you keep struct wmi_buffer i=
nternal and
instead return a KBox<[u8]> from invoke_method().

IMHO struct wmi_buffer only exists because C does not define a standard sl=
ice type,
so there is no reason for exposing struct wmi_buffer as a separate public =
rust type.

Thanks,
Armin Wolf

> +}
>
