Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795286204;
	b=GPEuvoWKTVPed+TFuY5cl38nAqcOOUkNXUTjaGbkmr7ICaBJqn99MLdmV7RpSz/+E7At
	 pyjqynkHCI1Ml/xurFCijYx6WMDQzvlioVVnaz9KQK861xjdJHo75ekLfKllLHgyrqzvp
	 7BOp/3I8V3Y9sdHaZkt1XZLvdAUuTDRdtZIsduDA+/Df8Yz7GAPdxIEGkkgz33pEYKGLn
	 JDCFSMi3mUldm7si6SgkYHxXfHWDYFVNp+Zo1j8bjaCQ8zG1vtKUHKplmCshehH0OX1Wu
	 eeKYEG7C+B99u4Xrlr11UDQf421tCDnhsdQxe01FaryCNxypHvuQN2oP+vsIO2dcehA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795286204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+ww2YgpbwqAsCskuaPEB3Im3FqWoUKfW8X2evO7N+Ik=;
	b=aMtGN/yUYlT7cGR/Ay7FpMUccoh/JDeSBm9ZQeL2YCggw+NkHGRkY4wbRY12hsD4Bd5B
	 SL1jXAHo5fAi6+yPdhIZo+RnFHYnpD6fJMe0ZUtsWq9hi/GRQZKC1H8S2Hq3cwhrV+f+D
	 VPOgZwaT2zxBSmwb6cS4S18Awbs15AGY2VI2gO6xITrf+QjqkSu7/tyOGoPjEm88Y4gcG
	 /bApVWnBIJwkjRWdHO5Zv+w0AmygXnWcDXz15/mli7zSSoVRLBagO1YFYUvEoJUvJicLt
	 fRRYPuH32gUi+HjQb4wNtJQFfpysW6HS6uSn5wkckIZ8tCKWPv0IhI3FkW6NDJ7Cjqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kllpQrZs;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC604606A32C
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 18:36:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC604606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kllpQrZs
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ee254f6eefso46835ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 10:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795286203; x=1795891003; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+ww2YgpbwqAsCskuaPEB3Im3FqWoUKfW8X2evO7N+Ik=;
        b=kllpQrZsclScBd2V4ukGbVF4w3Z5xGIfBuKD9oTDjED0p6TvaUbvCeUH/8zmkri8dF
         XvQsHvTlcKJcBNfNxcu9D38cO6Gy+/praAzbn3HI9Kh6Y9cu65ca2AbXgrnR/sWaeIWS
         riuJU9KsN4FnehnKw743RaDgUqv/SEQQWblKFIWtSkOTuYYQarqqjGsdBvgNghhkVO3e
         JKBReVAKiKsWIVqV36LavngpZRvNMkoppts/T5bJCXApbMWUJ1H6Hqvf9Y5nL3ZsySZ4
         8l93I3IL0tull5tEDaZQwok8x3/XaWECLYQ8pjz3bzFMLsNH9kRgMwWqnHx3FyorMVl0
         X/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795286203; x=1795891003;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ww2YgpbwqAsCskuaPEB3Im3FqWoUKfW8X2evO7N+Ik=;
        b=Ztre5JDu+XcUARN7qdPLpevxppxbrZS23PapACWOYl9C0j0hfV4k8+qz7Exa4DrXRX
         09FzEwTFFlxRV8zVfGdU/lEJn0GgXtfr5lrr502N4wOXIuOnI7n80gvmThAt3WMW8Av8
         jYAOEr9Hb2N+FpkeWhegP/MCakgYWfjn82XFLBGaIPXzpL4XzJwhVK8Nd4pzGWsCQnpr
         w0+mcCN+DOE+Q205B1H0xAI4K8uo1NRq/DxeS9sZtCAI9oDONie9WJREN//PspE2UJtz
         OK2f7nt7scbHAGbdkGpbA1kyZQJsHkSm/p1JwbG43LMK1xDADwmoxmLJVJyYS2d6SWZt
         /8SA==
X-Forwarded-Encrypted: i=1; AL+hErGuymKxdU/2Fz4+logz/ibGx3qdb14F2sjsf1D4DkVyf6fIUItCNdzarAwfdfyKIhJzstZzZOueycp//6c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rJ4YqJR7imvKd7PwGPRCco7odhTQjIbflkaW4AkrYkzxM4Bwd
	4poUv9Fri9MJrsWTyPVQ49xYBicJeF1bkVTwqmcdHOui68RceqAOX/U8IMGH4V1XFQ==
X-Gm-Gg: AZFdTZdgxL7Sr3sBhrSJ4leDlZXc0xp9lPFTUc82R3VISbJ6eFUDi+8mmzHEsVu80tl
	5jzVOabJ94kVHE4eXrjG52Kwy/+Rt41XoMzANqtQAXoAOxViwS6QNEy3FjnCP0ixVyExDiRct90
	0NdlqfRUpl3NXNnmwJPuG6Do5ELtoyMkyEOyMVh3R+bS0MIDI0CIulRBO/SqdagDjxgszo/UdIK
	n3Hj0udOGsfyB2TIKI80IqlaXgpXV+VfN0OqhpErVVtZMyWBDs5ePExFmHnt49PejXxp5tHGFSl
	WioxwImeVhm4x/9vy9EpjeS4eFix348uXfwFhkctgrAdZHiFQxbi5g7G4yUazGMa6XOum7RQX2Y
	wPDuApQnlbpdVtx14dudo7v42vNl3dhbh+e6Jm4zNUMugUvUlcqdyqEc4ME/R4mcQkTaUyoCL0l
	lJ+36JeRHqnIaK/mcl0JdzruH4kmlC/xdlSeBcqkw4BVSjPqGff2egc30kb37W8S+bVtJPDNaCn
	Ax3g4pRb/bZ5JSvqHPghPk/lO+KtOfT236cilgESLrKZE1YiSX6wa7vGigRokXjPE9Ap2tP8Vrf
	3OuBNXCKmelIVXGk5R9IiIUwHc5AXpK8ETxhgJ7qY00E3eEHw4qwc29WMxbrvMV6F+XE8LmJUQf
	xm2erYH9DOcZDz4WY+pQA9n4kw5IR1/aI8Z0JWW36H9u0+aTpWr7EZI1/+Z9r0C1ZH5uUZwRhQC
	v3IaKXLOLyOA+yp4uqIHRXqO7E7vRVFh/Jp2Y5qRfmNUaNPk6Ef11ZUmC874aaFqR379yVrg==
X-Received: by 2002:a17:902:ef52:b0:2e6:d25:d874 with SMTP id d9443c01a7336-2f066568e6fmr2749075ad.10.1795286202449;
        Sat, 21 Nov 2026 10:36:42 -0800 (PST)
Received: from google.com (130.155.125.34.bc.googleusercontent.com. [34.125.155.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b8c2fcesm1972529a91.4.2026.11.21.10.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 10:36:41 -0800 (PST)
Date: Sat, 21 Nov 2026 18:36:35 +0000
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
Subject: Re: [PATCH] rust_binder: treat ESRCH as BR_DEAD_REPLY instead of
 BR_FAILED_REPLY
Message-ID: <awHksyRSafcJKXjI@google.com>
References: <20261118-binder-esrch-is-dead-v1-1-a45bb951fd14@google.com>
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
In-Reply-To: <20261118-binder-esrch-is-dead-v1-1-a45bb951fd14@google.com>

On Wed, Nov 18, 2026 at 11:24:25AM +0000, Alice Ryhl wrote:
> When sending a message concurrently with it exiting, the transaction may
> fail with ESRCH if the timing is right. Since this is delivered to
> userspace as BR_FAILED_REPLY, userspace thinks that something went wrong
> with the transaction, but actually the target process just died. This
> usually leads to the sender aborting.
> 
> Cc: stable@vger.kernel.org
> Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  drivers/android/binder/error.rs | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/android/binder/error.rs b/drivers/android/binder/error.rs
> index acf0aa09c555..00f1519a8d77 100644
> --- a/drivers/android/binder/error.rs
> +++ b/drivers/android/binder/error.rs
> @@ -78,8 +78,12 @@ pub(crate) fn new_frozen_oneway() -> Self {
>  impl From<Error> for BinderError {
>      #[track_caller]
>      fn from(source: Error) -> Self {
> +        let reply = match source {
> +            ESRCH => BR_DEAD_REPLY,
> +            _ => BR_FAILED_REPLY,
> +        };
>          Self {
> -            reply: BR_FAILED_REPLY,
> +            reply,
>              source: Some(source),
>              line: ErrorLocation::caller(),
>          }
> 
> ---
> base-commit: 20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca
> change-id: 20261029-binder-esrch-is-dead-8109ceb9115c
> 
> Best regards,
> -- 
> Alice Ryhl <aliceryhl@google.com>
> 

LGTM,

Acked-by: Carlos Llamas <cmllamas@google.com>
