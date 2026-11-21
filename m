Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795286059;
	b=vibgFFSsJq69Gr+F7KiT8a0BvxnbhAa0hr+fvOajaqvjKTL1ky9j6VsqmPN/GZRmxUPP
	 yNfO2IrelX6KmSpn7QYfFOrPSSeU3hUjQFrguRCwapxbAgea48YZ9Iu7IA/WDqnN5DRpQ
	 /RFnPMTuZgkcP5iDTIAvtq2fXcTdQDnk9q/iDtsY4FW7fm7UsE15SVwx9r/PjBlnDwaYO
	 Fvfe9msE1ccDy2s7TdjIh6yTznPV9WrsbGjYBC8alstAvwil1H5JKIJHSGfKTto0ltFnP
	 YotsP7XeXnVaLiGuj0JHLjv4gfQcysOvyBKzI6cCrIAnXtsKd2NJzPDwvTIbIZSVE6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795286059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=pZwAAsxZcP3F0DIRuj83h9LceocBWHM2k4wu68EYJlk=;
	b=B7Wst19t54kNFa7uJRpe6aVmF67EtxMI29qk5xyMj/7C6FBu8Xh3kzrdc+aNPsiWaHot
	 bcQ7GAysz3CfI9Mol3m0TAiUvq3iQtZGH/voQXZWpN/jB9t/NDoe5rS4kHXxJ8OZkyUEa
	 JBHv4FnQftIzqwdgPNjCVYxEMdFw3hHJWvJXrVpWPBtuIRyb5dwPOp+VYcWadJX4nf5Lf
	 At0+MYmDl3a0DIX8X90h0xQV8IgMUGuLJmTjc/mPCLEPGFc2gtezIwo4V9BFtBA5No1Xe
	 Uic+8/g0B9sjzwsUD3Idgn2roA1lR9ZtCt6+UGj2thPaaCzvyBS8DGKm/OabBP/MTkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ib6aRbCf;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724D6606A32C
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 18:34:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 724D6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ib6aRbCf
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ee254f6eefso46715ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 10:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795286059; x=1795890859; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pZwAAsxZcP3F0DIRuj83h9LceocBWHM2k4wu68EYJlk=;
        b=ib6aRbCfOGwQE6/BATIR+ceYurjtyrXkoCQHVhE028ha+RoKuL8pR1qHFqJyREFiKp
         z8p0CuAQU2n88ax0i8wGZlB6nXui7WzmCSc2h0hXq3v6IsM2CXQWpqyyv1iALwoW9ZwQ
         NvataTs2P5rQ8WJAEEhfk4cuMQ3PG9jA2yrPBuWooin0pTdFTUTZ1coIiZTEa9+r7lfk
         /QPClRGwXRDRWTQToXdR4j3aUxsV8XrJ0tuosKcEP/cfY524JSaePMdH0+JNm6/o/sx7
         xw+9VJpw6BCTn+81JZihzC1VDOlc+XArW/7P8L2u8Sv1dC3L49WMbrDg/NKIXjBupZvt
         KuLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795286059; x=1795890859;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pZwAAsxZcP3F0DIRuj83h9LceocBWHM2k4wu68EYJlk=;
        b=zmF9K9wB7VZX0ayE9nTq6zu7+sj3A707ojsx68ZhRiNBiVg/tGEp+yL6IEogwTSlpK
         uXZgCOsky3dfHpQSIO5R05Ma22m4j3jfACpFSXZlhmdZkA7wGPNiMBXwwNIopArhixUL
         uE3NKgny/vDkj3EGOu+XMssbfIpBJV4x//1mqmuv567xFcUwPetOiS8C/2r0d/PaeqAC
         adJk0aFOQT0iT3qsJGcpxqnlkjZVuEXMO6pdb/2/NonIwCQ/VBbVHsBOJRIb8KlutK7W
         2w19mx6Hgw07/8Lpa8keZ1DBkB/X0+tdkYPy8M/vZaagGvfyQe2pWnvNMY8G1V1EN4+O
         B5Vw==
X-Forwarded-Encrypted: i=1; AL+hErHw7/GfGPEnKN3BPQ+0f30At9HGrHccRWBWt5obAISesXcmHHSw1/QTtIdGxYq4wMPNMQq90q2sa3ild+c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tKj1InV2D5+tYMz0iQzLcpaQm5ZtERo1ct/lcmfq7AmdXNSg/
	9Ap9qzlIbyqqecdv9h//PRxbu8GTqdhJtvTMEUXywW65pHbeMM3RI3ncxOhzCov1Xg==
X-Gm-Gg: AZFdTZc83nEdxdzLgDeWVLlIzIPDMLF/eC1fKSxH0kaEpOfIoi2MPLXBE23Hs8jCDm3
	aYIAQaXTKJ2nyjC2YGH8U7EytewAf0F5+TZ8viRAt9XfP0cNdOIKuyaua8Czuk6vO5qTf5qutFv
	XSdj2jZPT/reel9+Dxif92jsVqFLaCUMvCCKNJIl+ytG9rxtGWvM3sBbl3s5rj1c3004NsJaF/K
	e+tR+xjS3QFhoZYVpJY7c/V2Dj6B/aWPAkgXMKFc8NAdW4XS7dGa5HELOlv9BEUJaH8JTikYzi/
	d9ABC9FFlR/31K5XtNJmqfws+dp1XWAJg8+nCKguNAxOBXmGbX3lxKbvMHX43LlG3bR6hmRmmwo
	xHMpAZGJND1BHPfuVTBPru5fwOE/O45mV7gksvQ/2VjljlM8nNmAsGVHezhEUcADwDQ/uxU7yka
	QQhEzhV4Mr15veHas3V7hsK1giT0UnxnEsNs2KBKKuRR3tkxnSOBTqGKWfBWnxak8nygfq2YOR7
	2Hp/6zRoC6vgyird8DjszU20AC2Mc9zcfFwQtaBfBM/vCHi6S9dHsCbKhB/cL6+7u2uKi83mQ0E
	rCj7QqvvX635IUURsiDu8+pdUDijE2B3+lKPh2Qo2q6R1jr6/ifsXAgOSb5xrLjZYePLu0ksBv/
	4wWAAHvjt/TEsW4bh+zHrNxfESAcjBFGPW9l1LGwwQwP8RzGuLe4iwE4GoG0OPR5F79M2sCURvE
	/xZjE4os6Q0ZwBr8qTzUXaDtq/qUMmX7Dyng3fBvIa+kf5N6GeoGuioQRyaXStBOonH3qV
X-Received: by 2002:a17:902:e950:b0:2e6:12af:5b04 with SMTP id d9443c01a7336-2f0615b8824mr3806955ad.0.1795286058213;
        Sat, 21 Nov 2026 10:34:18 -0800 (PST)
Received: from google.com (130.155.125.34.bc.googleusercontent.com. [34.125.155.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b6fe711sm2350677a91.1.2026.11.21.10.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 10:34:16 -0800 (PST)
Date: Sat, 21 Nov 2026 18:34:12 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] rust_binder: report EINVAL for unknown handles
Message-ID: <awHkJIAjp7FuTxia@google.com>
References: <20261118-binder-unknown-einval-v1-1-ef4ece277b26@google.com>
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
In-Reply-To: <20261118-binder-unknown-einval-v1-1-ef4ece277b26@google.com>

On Wed, Nov 18, 2026 at 11:25:40AM +0000, Alice Ryhl wrote:
> Currently unknown handles are reported as ENOENT, which userspace
> doesn't treat as a fatal error. However, providing the wrong handle is a
> fatal API violation, and indicates UAF in the userspace process.
> 
> Thus, change it to EINVAL to match C Binder and make userspace treat it
> as a fatal error.
> 
> Cc: stable@vger.kernel.org
> Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  drivers/android/binder/process.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
> index e97213250beb..406d80cfff08 100644
> --- a/drivers/android/binder/process.rs
> +++ b/drivers/android/binder/process.rs
> @@ -958,7 +958,7 @@ pub(crate) fn get_node_from_handle(&self, handle: u32, strong: bool) -> Result<N
>              .lock()
>              .by_handle
>              .get_mut(&handle)
> -            .ok_or(ENOENT)?
> +            .ok_or(EINVAL)?
>              .node_ref()
>              .clone(strong)
>      }
> 
> ---
> base-commit: 917fcbf033154a6c8d83cfa6c88f012b71eb37b2
> change-id: 20261029-binder-unknown-einval-10407d1ebb1e
> 
> Best regards,
> -- 
> Alice Ryhl <aliceryhl@google.com>
> 

LGTM,

Acked-by: Carlos Llamas <cmllamas@google.com>
