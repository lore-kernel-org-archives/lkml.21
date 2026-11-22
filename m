Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795346487;
	b=eMtwmNx34Q2q2abqBMrw+eRfM8UjsGobBUEyHN2obkROzHMGWhm9zNtTCy8IYgxtqoJE
	 4GO/m7B4qP60dOX69uReWnUjW0mE+ITjJBPaE0onYL7ZltQIoYVRNtc1Crv4H5Ag12gyY
	 hYMEPcvq7suxma7S9zP1b8gIBg7wqdyilalqbcutghtNtEOLfzkdlwM1xed5mWuzFcGGF
	 /QpB2SdKX4qgHTHhLQu3kVRH7kX3vrxZc3d3ibCNUtMrM/Q5bZhnGwDINIR2OlHKKa62I
	 inhWRpPITckZqQohCzO8p0hroKtINMyhhJKsKwRk/vgd1feDkuwOFsTjB7w7t2SGyOQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795346487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BCdFGEAGi1FkXvjngBIPRRqSI+mSTpjGWxSdX4AZ69g=;
	b=VvblPE8c9JWu5zHlZxNgtLhpaw6kkQEq2d7i9dq9DPui0f68xBaDteP9SURodTA1696S
	 R8eqWCp2htKxnx/FuXvm+qsw5XC5fQDpAG4rpz28WrANVXU+FQJQbhIprvH/kXBX11MUK
	 dF84CaXQpyxCgRukvxzgMAl5T9Hatd0qIgUmaOkKHubRrDfOrfKMOCV/DGd2pDdnjca78
	 kgOwbHGNiqmuxeS3g31wdcq9XU9J8FJynE6tMDYe+t+NFIWZjIFqxp1MXqAOch6TxakOo
	 BkUZX+e8J2grg00ABMgmXUK7fD9SxcafhSX01gosuB2dmRSoLF49nUzfH7LCHoTuiug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Zf056G/Y";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BFF606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 11:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20BFF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zf056G/Y
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ab3cb83f54so1722831fa.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 03:21:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795346485; cv=none;
        d=google.com; s=arc-20260327;
        b=P+eO/Mc0Lw2PkbiD5b0UaG0hUfrJGekfrid1LwQ9kINS4T8KlPO0CHohj0NJOELOkM
         dSTtmIsdW+PRwl45borywEfB4YttudbVuqYGiqmkSOIGXV67XQGespJJaC2Q4oq3o1Mj
         eO2x1zWgxG/jCc8xjnDUE6/Ln5o21dRm8gGv63c9vvJnYIXYpX5XHIJ21LBkcmpdFXm+
         8zEgj44XVVH4alrE1uNocDAUcNTLJ3ldvwxPyq6IkovvLTLij3JW1uA8UWOdNTf1+3bv
         011/ZSNOg8AHfJsnF6MKPs3g0/Uy+J4FDtGjT+xKdXMXKCEl1KMd06qoLCMP5HVuLzQ/
         smBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BCdFGEAGi1FkXvjngBIPRRqSI+mSTpjGWxSdX4AZ69g=;
        fh=Nxm5Elvafs0Ak4DS/ufI/2WKQPXt/n2/KVbWzfbfQZg=;
        b=P2b+c/s11HQ2eNSBEIkivSSYh/FG6cjK3vz4XSmafSo+iyaXR0FhM3pStpYI3gSFH1
         rrjahVJ6WSm/IC5uRKAsJsy3seku9udebTImhq9XI4T/AL0ojLQW5JyTlEjTILC02+vE
         34aizklT85HdEA9LZwSOxcMCuxF/fKOcFIGBCAoSzkipflQTBvcsTXwGRekpMVuXHvRk
         RKkwyEgHodGC46gVJIkkCHp6RlcwI5eRz0TM7PqwxTP+c0n8MuF7z5AQHy0xLtfRvdoL
         wLkHQ3oLUNnysmk1lsyWVphrx2E5cjGKc5OKP6B0stibkuxrIpThKM2l2tJRdg7RwEAd
         9lPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795346485; x=1795951285; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BCdFGEAGi1FkXvjngBIPRRqSI+mSTpjGWxSdX4AZ69g=;
        b=Zf056G/Y+GwGxQXeae6ea0V5lpqHLMoxwIERhMIGNmrPdDZ6cZUEoHU4hrCFI+XQPu
         DtuuDApe9j2ugyBnKJw8BnIVnu1bY+6E2hAi6GCbeElPeWazvmsDNRdPdzhAF6ch+tB0
         sDMwQCeoHX/9pKFb9x74e6mnkglRTIN4TILmvm/kkwXU8Fs8C8MyMJgN/jx11Uj9kbTL
         ado1hj028EW6qS1Am1bSc/OrESnmIvOG2jEH27iyYoz+NJlcYcQMNgVrTjfy1leizNdH
         NV5DOBaeMdvTr8c7lXA7NsOkseNQGf9CBYJNmJSQWgoHi1iEwAVOSZDfiJbiqFvj4F/t
         jeCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795346485; x=1795951285;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BCdFGEAGi1FkXvjngBIPRRqSI+mSTpjGWxSdX4AZ69g=;
        b=UjuLVElIzdDQGppANMk0uHNChsef45pQR7AdsMkSdhY0NRWZQHx9vfNYCX8Kvn3Jgr
         p5VSre4doa+22yG2rzxlX2H+Jl4hXk8d556IzBRFTXcO8c9wO20uKy37o9ELbS3muh4e
         R55/qstX9sqsMxJIvKQoL/2w86SwCKWEPUqtShZBCfIUQ3qtz8J347pmt/zHE4qizxR9
         cV9YmRnccaDPoEcWFxPPyRndZ2Lwvnrn3O4A0QECdCgj7x+qPVkM4OktuiEzTFEs/rs8
         8PGpLaz+2u1On+Mvd66MY5mRl1Synv5WIWCfsVowkEUqSwNMp0WBOlI8nqiZZBrRcXyM
         QLrA==
X-Forwarded-Encrypted: i=1; AL+hErGIJrTs8WDu5FhWncf6IQJ6FaUCtAWdMEWoAL38V91CSjoAvIJxuaIjb4Q0SG3ikxp9HD0J6DC82Qx0wl0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Gvus8xUkHMEPF33WoCFjtmOXX8DRHZihuyX2tfvlkSNceP8zK
	lNDmISkGMNdzIv5CGSjYT1jr6QXJi1axli0ynosMTLqqlQDkbYWruO71MyTYcL2xwOUiVCrRxWq
	tF0m6zzvSXF4up8CLig80d0XY4HgNibY=
X-Gm-Gg: AZFdTZcF/hmuxF9ZNkMJKhHgzDSpruujvlXBensDyBvcXbCnzrMhhaTunmMHSjqiHvw
	57O+DAcb2xzO9OlgTifVrhoPfByq8T+L9RaTTICXdpnx2i4T9EFEcLsqRT9bw7TiXZ2AtcXafAF
	UnHGU8ETOjnSCki3eZOms07GaIT/SN4lkzp7D4xnFDs37M6qnF1o0NR58Ir4rzWVZAHG4+nvwNK
	jWl2YVM1puL/JFAZC1/cJM0OiNGgQK9c+QbsmtWbnzjiCN1XReY4g+zR3mUt86tq0DWGsuo847o
	nJVLp/0r2PmCsu4wg2PX7pGIXdRFkLvyAhkcKRmB0+6mGiCQXMPGBNNdPkJOxiS7Y+sDZiILJb1
	3dCPmorSXqZVI+xyni7nnbL9gAvGpmHQzhaz8KZrnOQMlVaCHTBxpqEzJlJx9z9P6zoXW/SVz1v
	3Nyux4EuUNcB/MT6GzXU2xP8bWgWVMtvqPbpgTNyIZiHRjDiVdqvCm5T8MM/qYoDXUsN+pgRufs
	dsd2Z+qsJWw7WXT4ng+FRLwgNFinXrCRODzNPXuJLRZhDRm6zQMICDIuUXbkW4bxOqrGJy5
X-Received: by 2002:a05:6512:31c3:b0:5bf:e6a1:3115 with SMTP id
 2adb3069b0e04-5c1bc76a33fmr3359356e87.2.1795346484987; Sun, 22 Nov 2026
 03:21:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-b4-dev_query_fixes-v4-0-df66b4c98bc6@collabora.com> <20261121141830.171033-1-aliceryhl@google.com>
In-Reply-To: <20261121141830.171033-1-aliceryhl@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 22 Nov 2026 12:21:12 +0100
X-Gm-Features: Aa3M54oNJa8cPl_YiVnZHC_82X9FGjy0ARvybs1hSE8ttDDvbfY_eIi5LF9yt98
Message-ID: <CANiq72n4CLJZ0aZwHJYSnnc58haG05si6+ocibzd07HLgFbAkg@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] drm/tyr: allow mismatched buffers for dev_query
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Deborah Brouwer <deborah.brouwer@collabora.com>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 21, 2026 at 3:18=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Miguel, are you ok with me taking these uaccess changes through drm-rust-=
next?

Sure:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

A couple notes:

  - rust: uaccess: add UserSliceWriter::clear(): Newline before `//
SAFETY` comment? I am actually not sure why the newlines are placed
like that -- if one wants to compress the code, then I would place the
early exit `if`s adjacent to the variables they check, saving 2 lines:

      let len =3D self.length;
      if len =3D=3D 0 {
          return Ok(());
      }

      // SAFETY: `clear_user` checks the userspace address and range and ha=
ndles
      // faults when accessing userspace memory
      let res =3D unsafe { bindings::clear_user(self.ptr.as_mut_ptr(), len)=
 };
      if res !=3D 0 {
          return Err(EFAULT);
      }

  - rust: uaccess: add method to get UserPtr from u64: Intra-doc link
on `UserPtr`, and span and intra-doc link on `u64`.

  - drm/tyr: allow userspace buffers to be mismatched: `set_uobj` has
a bunch of comments, should they be documentation even if private?

Thanks!

Cheers,
Miguel
