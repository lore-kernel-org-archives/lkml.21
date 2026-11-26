Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687383;
	b=C3XdzNbjdUeH7bARIRMIkUoFqCBEqshPTFsmIGYNEZ4aOpuxuohkLYaiPvujMF7gbUBD
	 gbviKgPLAFDASiychSd+46mxYdz4GQmkH+hju0VLJYWMlPmJ0sS22hsKs0PWSI3jL5sv/
	 witHB8yQTOBX+c4atQTjKp5AVeQjGrX1Gs4DACgjxzCoXN3wgFCrhGArs8AXhIA4Eurf1
	 O4U4CgPKItlI7Nvl30L/xna/In1d0m2DhGVQoIimH6+/YseO+XDPjSp+FR/w3U12pSbTd
	 zGi2x5CS/ISDusPPI4i/9E2vU9Uv6RWiYJPdF3aonsjTAdyS2w67HtZ35FTjmbbQI8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Z+D36NsUsNKkqF7ketqLvXXyv+j/mhnbTnZNBUdnCJ8=;
	b=fmpqrEYYmhmmQiHDSixRgFIbRoIuEfwjaoLFRDhTbpTjPOc0XZ0jZvz5Te9NtWXUmIdO
	 x+qMkCInExEAxaAfbpuabFGvjtPTweY1vkv5lXx7dDc5y/8e2pPXFIpRiy8NWfx8ELCTI
	 4/wiXSGbEC3K9jq/9Y/WTZjLRVPOKj+LI1CX8sdX6v/KIqwMsyZpaBCvW10kB0nwruD8C
	 0f3GVHjwqwQR/kXtmxmsFRUFqT1xIPJEwxV05sc7tmwz98FzO7KlJftTqI7BKgtbQ/SWR
	 WEPV+PmFg5XavFiEuwwf8oceA1tn5HLydsThFDjWPZPYWS41WLrTPbIREZUcikMZXGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IcHlH3T3;
	arc=none smtp.remote-ip=209.85.218.71
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D21606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:03:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49D21606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IcHlH3T3
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c4163a5400eso634395266b.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795687382; x=1796292182; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z+D36NsUsNKkqF7ketqLvXXyv+j/mhnbTnZNBUdnCJ8=;
        b=IcHlH3T3bnPaEg9CQOk5caNH7/MgaQRbG4lGi7J3a1odSY3PQINZyZEp/nawvdWZVS
         qgDk8PeK0axYIRLPawfuHX64JhaLB5wHE0cW67mKabvPeEPzui58i1v8rvqGL50aJRlb
         qMYcic8M7Np53g3jdGKALFlQrgopuN4aJxIyH4rNnD25GwFBCyGsnevaak94rpvuu5da
         ASSztJ4GzTU6W/1nPgUqHoM0/atqSZXO0EiENw0EfLDlXkYOgxga46jtqNXr4SPgTNgq
         lnAQ5Aq35Bo1D8Ms0lYgFnUIF474kba5UF6B7oxEm8LIptxCKx+OcE6PSpayKZjrShgv
         S1wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687382; x=1796292182;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z+D36NsUsNKkqF7ketqLvXXyv+j/mhnbTnZNBUdnCJ8=;
        b=qar/db9y+4hAgFDc4vvm8l5XDzc8UV85E8Rp8swZyx9xRliumi2vl46Zlel91/5shk
         1HS9bTp1GEocQq6kyFbsQnGl41xtXULZg/GASTFauXP6DjekjSlSLwVaQU9YdKO/i6vI
         bmooaSapG/zr+AmkiHIgd/gOX6ETTsl/Gv+cBwja/kj9eYeNroxB6Sk7cYuslC3j0Ftd
         cuyDv4hNqsgIl0vzCTV3PIMCwuZQsc2GW8LPyt8l2qxRoE1b1cjb+s+W0MEFlwYNr/ZH
         CaQUmqyIRLLC1X/IiT7ZdHgaKydcFT+ygrzyUL7R2g8irrXdzBcEIjGPb2ufg7hl45I/
         QshA==
X-Forwarded-Encrypted: i=1; AL+hErEqqDZf3elYA13Xp1huD4mj4wUpCbCHNDasRAOnL0J5KK0Vzy9N26N6xIIQ5LcF5YBr3VBSGBj0QDrqkBU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8A7yiIqqWKE0/dXalParc2GmtvGao/vMzlXUXDfgWHcseTfm6O
	0IuuWquHIAgpTfk0tToM2NZJMgwA5Tpl+RI1RGQwyeFi1gGX8N3g+A4/bkOlzWqpKKoLBEt7Ale
	sdaUke/XNZeQyDtLdSA==
X-Received: from wrmd16.prod.google.com ([2002:adf:e890:0:b0:4a4:8b97:27fa])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:b0c8:b0:c51:5384:eb0a with SMTP id a640c23a62f3a-c515384ecf4mr1127711666b.3.1795687381470;
 Thu, 26 Nov 2026 02:03:01 -0800 (PST)
Date: Thu, 26 Nov 2026 10:03:00 +0000
In-Reply-To: <20261125-rust-drm-gem-shmem-unused-unsafe-v1-1-d6c5cb0b391f@jannau.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261125-rust-drm-gem-shmem-unused-unsafe-v1-1-d6c5cb0b391f@jannau.net>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261126100300.3642738-1-aliceryhl@google.com>
Subject: Re: [PATCH] rust: drm: gem: shmem: Drop unused unsafe for vm_ops assignment
From: Alice Ryhl <aliceryhl@google.com>
To: Janne Grunau <j@jannau.net>
Cc: Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 25, 2026 at 01:24:28PM +0100, Janne Grunau wrote:
> The assignment uses a raw const pointer referencing the static const
> drm_gem_shmem_vm_ops from C side. This is safe since Rust 1.82.0 as
> stated by the #[allow(unused_unsafe)]` attribute.
> This was added in parallel with commit f32fb9c58a5b ("rust: bump Rust
> minimum supported version to 1.85.0 (Debian Trixie)") for Linux v7.1.
> Drop the unsafe, the SAFETY comment and the attribute as they are always
> unused with Rust 1.85.0 and later.
>
> Signed-off-by: Janne Grunau <j@jannau.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
