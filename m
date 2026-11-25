Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618996;
	b=JIANnZiKpYKrYzK8xAn1AemmihovVgA/mNtanKG/OyXRoab5AgPkIV94vOFIcruOpht3
	 Bh3A1O8vM23HA3ppiL58tVhkbZDoUkD5au27y41rP+lUJ+CUkz0Dpp9Yyy8g8tfeW8B1h
	 ENHffqaUP66DTXyQUS5JeUnbCGq27JnQ/r5Ib48WtZ/+6KQY8jZDNS6557M6ubYDuUCXg
	 xCe+hYXXR8cgr9GEtU9luKc7CvIn5LQraIPOIcmAUdysNMKvMXLc/bsPc/G0NfHBrc51X
	 sUP5KLGTw+/EKh6rkduNLLW+E+m5ccjwQG5zxvmwy3grKnqE6SGaB8q6HCK/uJea15g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=8aj9nTYzj6cuyNzNLusXOllcp3z+nABWrRwzBA+BFgQ=;
	b=bSmjJ79LJ0jvIV4a4qp2yNOa1Qby6/dJP84rVGIG8nhkwWasWiAb9hb9ERrMj6sK4/Sr
	 Q1DIatRpRugv3mKN/RFga+ve2uvT4Sw6Z0oFx9CUhqRX/+sG9l92s1rARmVVtiKDm91Sq
	 FBKDuQU4oh9vU+sRULN4dX0ZkWg6ePMn1MHX8Zd9pd3E9KOsJ6hGpIdO+itVJ6scFtl33
	 DRUTP3KZ+Zn3JqsoNWGxJ2dcXtthy2oJ/2GpJqC7WWdPLCeF3g9qVhj7MaeQClwzumV/R
	 ngAgYzOF2s3T7zvDwLl/MqlsICk/YHmvkRn5+mE40sy1a+ksDS+tHnZM7fMn6F0Nh0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MIP09PUu;
	arc=none smtp.remote-ip=209.85.221.72
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C45606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1C45606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MIP09PUu
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-49d70f45b22so3460226f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795618994; x=1796223794; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8aj9nTYzj6cuyNzNLusXOllcp3z+nABWrRwzBA+BFgQ=;
        b=MIP09PUurF3S2YFaERK70bZXWItvXb0OK8Pfro4q5FbsG1amrlshUUx9v8OwgO4rbX
         eSwxp1NlAm1zLkNy8GG9aqDWIAePnxgGDszaIpQLFYj3O1icITGUKzi/mhKeaMU8tBE/
         XujLy5HHIcOUveXn7Yw6zVBf2I4fRZ+XDuBZ5bORKtkShkBRra9+kAeZg1PLimF7X3jS
         ibLYnD5ChkgXJ1KO+R90XRzXhemCmUstZL2okgFLs8x4q2pJovHKGHGTK7mgGLNaz+Qa
         /8nmk8ZKA0YXaWx3YTEIuHer2ctFdZZXcXWrF0XMf0ssNdyvS3LVKdHaPuP3xv7+covE
         OfGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618994; x=1796223794;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8aj9nTYzj6cuyNzNLusXOllcp3z+nABWrRwzBA+BFgQ=;
        b=V9D+vrPgPIHzb0Hm/oNoC8hvvP8dnfTA2XbUGBNxU++WPVv4SZ1WlNubMitrbH0rEd
         +aQVTJC+Rds9Z4spOTGuy6FqHvtwanr36t2NQ+JsMUO5GfbUCUSzaOSZlts/7DXa76yD
         H3pjRkOZQyuGo8oiY6RzRQGIB+xyvOsEscC6ytjfeFIrTWZI93fEAYf3rghozmkO0PRN
         JIGTtPhwW71JFF/KbRnAQsK5H6CNYuDpTnnE36biGM5lNZNZ18YwT4azk54aq862t9aj
         BCIDDV++KLywkKTegSBK832I8TKPcJ92xdd/0URSIAvW5xDNaVrQDT/M5BfIieTXM3T7
         kA8w==
X-Forwarded-Encrypted: i=1; AL+hErGpnuF5BaQZdt8izFZEgSFJgnQEayUuUkb9SuIlc3oqoSIcFSijgn4mL3j52uDncebUXsmGj0wotMQOdJE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fpoO+iqiigH3o3ANTGAGmWFMGHAF69ZV5rnjAGUX/zuXopgx+
	kgt0Nl2DgtWZ1l7i6gZhOrFqBPkYCerhq+JNppLADuOlh6Wb+mtKg8fNpofi1Ecy2KnSXOCxLZF
	Izzp7BFbmSTu23oeyDA==
X-Received: from wrzt4.prod.google.com ([2002:adf:e104:0:b0:4ac:99cf:5a0e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:29d3:b0:4a2:6542:989a with SMTP id ffacd0b85a97d-4abb4b85a5cmr21029290f8f.52.1795618993824;
 Wed, 25 Nov 2026 07:03:13 -0800 (PST)
Date: Wed, 25 Nov 2026 15:03:12 +0000
In-Reply-To: <20261124-rust-drm-gem-shmem-imported-sgt-v2-1-000f7a9ccb8d@jannau.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261124-rust-drm-gem-shmem-imported-sgt-v2-0-000f7a9ccb8d@jannau.net>
 <20261124-rust-drm-gem-shmem-imported-sgt-v2-1-000f7a9ccb8d@jannau.net>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125150312.1587642-1-aliceryhl@google.com>
Subject: Re: [PATCH v2 1/5] rust: drm: gem: shmem: Do not use drm_gem_shmem_dumb_create()
From: Alice Ryhl <aliceryhl@google.com>
To: Janne Grunau <j@jannau.net>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sami Tolvanen <samitolvanen@google.com>, Lyude Paul <lyude@redhat.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	nova-gpu@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 24, 2026 at 12:37:43PM +0100, Janne Grunau wrote:
> The existing gem::shmem using Rust GPU drivers (Ashi and Tyr) are render
> only devices which should not set the dumb_create callback. When a
> driver with KMS functionality is added it probably will not be able to use
> drm_gem_shmem_dumb_create().
> The Rust gem::shmem::Object<T> wrapper should be allocated and destroyed
> from Rust code. DRM drivers have a `gem_create_object` callback which
> could be used to allocate objects from Rust. The C code will "destroy"
> objects with `kfree(object)` on error paths which is unsound if the Rust
> object's DriverObject contains fields with a non-trivial `Drop`
> implementation.
> 
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Fixes: 80df573af9ef ("rust: drm: gem: shmem: Add DRM shmem helper abstraction")
> Cc: stable@vger.kernel.org
> Signed-off-by: Janne Grunau <j@jannau.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
