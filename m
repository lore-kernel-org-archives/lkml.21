Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168416;
	b=dJiF7PAi7KqgUP0JLVu6QuKTlEETQFI5Nolmm4TKBg2sTed4As+1STKJP+nFtWRQUK6A
	 q0IHNQuUuSaD7QAKTpUrLLn5X30bTXuxtMlaiRW2nHdzH42evQ2+GcslhqHWHWekB/wLW
	 T2frgOdbOlg0wPiqH5MIC1pWPYpR5HdKasV/7PG6mvt1LMI+Hc5myJNOVkt1Mj5+CiqiD
	 qwM3wp6V4jq7SuqmUeRosgSWtZQS1fyAeZprqbG/+OBNpYJAzPW5YkHNP6Ags3WB2s5+x
	 LjnWa4KrySbakEW4JPk0BmwEB+W2zlsIRg/iata3UX/1X1b1aaDmIaT1jV+V9spL3IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168416;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=wU4LlfzaVTfqT9FAZ2d8xCr1YhlqLtpgo7yVgEhBPXE=;
	b=X54SWCs7j2r4/xrRlQrYDx8oSGpn2DvzyR6jJ8/IQqyppfqNZsguU8wk840tuNMEMpli
	 Wpyfnl2Qm92nyZ4QPgIC5Foh+5xcaKKT9VJmg60mFMQjRaJ8dMJBLg8nvD2eD/e7FaLOX
	 Ff/R7Dfkip4rdRDTO38E9McmNGtAGp2n/bfkGLw39deWgAfVZ/25f+bx6GEfcbyHva+/y
	 wLouG/Mpt6bZO96xQZwnnCVrvflwJEswtOOkTnX0PHuPGgjCc/+yqDgf+fhWIf7+Mao2f
	 JZ9owluOxZHRijQ9kSSfLlpLQ0zQdZ0zCq5PwpDt7qWGggtPnZAVNYFezg7UDAVG+Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nim6ikRC;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6AD60A2600
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:53:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B6AD60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nim6ikRC
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4ba078f26f4so4780485e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795168414; x=1795773214; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wU4LlfzaVTfqT9FAZ2d8xCr1YhlqLtpgo7yVgEhBPXE=;
        b=nim6ikRC/WTAbGXoW7i6eME06QvX3oaPjttXLeBQZz1VaoNrCWK2LmeoHvjzII5zit
         rNk6PrR1FTkyAI4jenIo0A4ADkkolqv6haLxQL7Mh+HUVTBM8uguxKauGOV2IRmRxLvN
         dLRz6nacQIy5qL6Oexp5dwKNnpYYZJFZgY5eDGb4SDJuws9+kEagEmGpfE2GAqhPWIb1
         ecudZGQWG6GkGy0cTTe9Qm4DtrJviIVeg4z8R+idYy/cLQjnrtI3uHnntyEPn3PEIOQx
         9eeawIsNf12frM0ftKdgGwNNNR7TBIhooEwM76od1gJu+u+rC6QdLGQpm+UzbeeI0xUC
         FjiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795168414; x=1795773214;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wU4LlfzaVTfqT9FAZ2d8xCr1YhlqLtpgo7yVgEhBPXE=;
        b=q8TF/hc4QgZu3H6c0bADWFx8B/GtbduQuErWLwnAKBDI3SE6N2aFzD5PVi+GrCVjY2
         Fu7lGw+STF7l/q/wKpvGKFSQZPxqv3yjoOZYuYsLSjXn+IjnTH6ydnwhJk49ivv/LWEL
         3telsIFIU64HvcWaiuTsEh1/6mRCzcXKWHLEAjTIYDuMZmuhea+NJnxJaywEakfsZ1ub
         o++8/dT/o2xlDbFzWQmu776WJY5BVEBRKUisMuWrBJQENemqK+MZW9XZfS2aMTylHgoB
         NxpHdbpSE6g3ygRnWySNIWJ6Ba0Xjhyo3YJJEtRKD1TgptUg00KlREhve8lby4FvomwP
         2mcg==
X-Forwarded-Encrypted: i=1; AL+hErE3lLZwqTwTxgzPw05W6O0o6Ws6SzzDmqgvQCeGBatx1EGnHNjeuiQM+9VtM69Es1e5kHIelKmvy6bc35Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EPS9U7ee9uNnaCOyCaEgt9YpHtGntRdGRPPDIIjoLYKNOlNDO
	rX89xUGoh54wHWmVtmcIb4dZc+EzKxyYbVG9T9+PG+M0J9shr3dGKrvzf4XKWlGYMwhm+Gt22QE
	WTErndZFU9aNjD37VHQ==
X-Received: from wrud2.prod.google.com ([2002:a5d:4f82:0:b0:48e:3c17:c059])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e4c:b0:4bb:6238:cd81 with SMTP id 5b1f17b1804b1-4bb88807dcemr52539295e9.10.1795168414195;
 Fri, 20 Nov 2026 01:53:34 -0800 (PST)
Date: Fri, 20 Nov 2026 09:53:33 +0000
In-Reply-To: <DMZD4TXCZSRX.HN0ETV0FWFIY@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118181245.2583303-1-dakr@kernel.org> <20261119111746.3049044-1-aliceryhl@google.com>
 <DMZ5ER6XTNLG.2ZJOF7F4100XW@garyguo.net> <CAH5fLghc63zD9c1F437pQiX+ohgSkYQe4nt3xP4gSTsqAVLzBA@mail.gmail.com>
 <DMZD4TXCZSRX.HN0ETV0FWFIY@kernel.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120095333.2135217-1-aliceryhl@google.com>
Subject: Re: [PATCH] rust: drm: remove DRM device private data
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>, airlied@gmail.com, 
	simona@ffwll.ch, daniel.almeida@collabora.com, ojeda@kernel.org, 
	boqun@kernel.org, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 19, 2026 at 06:28:07PM +0100, Danilo Krummrich wrote:
> On Thu Nov 19, 2026 at 12:49 PM CET, Alice Ryhl wrote:
> > Good idea
> 
> Indeed, what do you think about this?
> 
> diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
> index 774db3acb15a..8c48dcfdecec 100644
> --- a/rust/kernel/drm/device.rs
> +++ b/rust/kernel/drm/device.rs
> @@ -158,7 +158,11 @@ const fn compute_features() -> u32 {
>          open: Some(drm::File::<T::File>::open_callback),
>          postclose: Some(drm::File::<T::File>::postclose_callback),
>          unload: None,
> -        release: None,
> +        release: {
> +            // The DRM core frees the device without running a Rust destructor.
> +            const_assert!(!mem::needs_drop::<Device<T, Normal>>());
> +            None
> +        },
>          master_set: None,
>          master_drop: None,
>          debugfs_init: None,

Looks good to me.

Alice
