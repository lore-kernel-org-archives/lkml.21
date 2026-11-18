Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011726;
	b=yBwUwL6YFtnC+nkmSri2wSdt8Vky0OKL13PMZ3fMXl1RXeRc11byxwTii2P72evgt7OI
	 os+Ht9/PbTApY5/sKPx+ao58sCuI3vHxQUOgxsrBZHJMKuZgL7jSRcaK1tE8g6TSysW8V
	 nJ9nCXNoyCdGiWKYnfqYjBkfyiyeaJoLQqMw0GBoxnFQHRfSocC6Tgsp3z+0s0kxkRFVQ
	 gI50eALkdQ/QLEDh1BRZt+5orOg8veCWURSv2Dpa/onnH4rPhqcHS/bPkmXG39wHdt3Ko
	 uKefizVUCjcMytyARzBFOOnaP7D8bKlTKowwVLfpPTuS6IOZCw8+VKtP2/dmVTIjZ7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011726;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=2X2NffGsec/PeOgMoOFFc2QFkD6CeBxkedqmF186r8s=;
	b=2bKezi3DQ9xkVB2bBddmE0D2g49xJ9u4COgsfYLRtFtxZ+nuuFvKTFGx3PbADfuYp7W+
	 7kIN+kE1Ae8yo8/6PxOhaZUv0IXUc3Uztz4w3zXHkahAXj3OiJeY8xKS4DE5LUOpdjcto
	 cMQ7RSqC57KqcoaxZ3jWlX2L6ohc9cZrJLk23tXr1CozAHLqEKYzFdxxZA6jTVo38wmES
	 2ZIHIttD9Vtaxpckv23hjC7CBTZyuOoe4IhIe7zMPwFqRPQRUMaXiNeNhH4hJvPmZhUVw
	 AOnu51mfDZD9Z2vENhC5QT4CVVp5XG0JIqKxwuSESscV3+CcpNBvDmwGaw1V+BdhEvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="i4/obGMU";
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A00606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:22:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90A00606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=i4/obGMU
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a70b42bab0so8285145e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795011725; x=1795616525; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2X2NffGsec/PeOgMoOFFc2QFkD6CeBxkedqmF186r8s=;
        b=i4/obGMUduCfgnSMu8WY+Vr6YRUaAUb1ZMdoGa2hdIZG9KcEoXPIRWcRTd6tCIbpKA
         ZXMbQxd9sUWAN1G7QRw1Lb1WHNiql9zhHxs/gO61gU4oIUaTNACP+fKGvdCwcKAaRSjK
         lpUkpKUbw7RPubisZzPdo1XOnFHRwe/MNzEr1YGFY0GEzJWd9VlxLmmgEeWANWkRPefo
         WNgK0c+5nCA5TrhcJXpHU4oAg/Os0SqV5XhtRloiDNjdIErJtB/MBgjYUGS2Yd3WH6LJ
         98C9i5M9ZVb4cw6wQhscgaaWdfbdIOAKZpmqWshTmmFU3l6EXufjKUVCe/JNxbWyzwKq
         EVBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795011725; x=1795616525;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2X2NffGsec/PeOgMoOFFc2QFkD6CeBxkedqmF186r8s=;
        b=rMSeQYgaRTSKE7DNaiGTMjCC32K8vw/7b+WntC+kp3V/BQxy5dGgZlfJYF7Y8mWymd
         oxf4iUSoDJbI0l2wGyWkk/glTDv9U7bfM1ado94MYO+XbQI6afnaaWPT4HSaZ2lwZ0Ze
         2j4Q1pm+V3ui7qAmNPG8/5uFaYn+ylbCFGJd2BOSfXB92PRrDyjYKWsmZk0O1NG51y0m
         vVRWNZzke8+Vv/ATO7TAxYHyld6rJNapH7v+Coc/xoXnLjgIcAqSvOBpfGOqbJ91ta4q
         yhle1tzEfPfpSuFpgaClDO2/NrjfNvX3ZM9+pWQThix9relFI2TTbRA0wcb68rHhSeaC
         5ZeA==
X-Forwarded-Encrypted: i=1; AL+hErHCcM0bUb3FaptbFEvA1GpQTafcczfoY1tv/w725pUM9J5fP2ut8AQ7H4Wwz9dQIEf0tzjeBJwvQQ3IBOM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8h416Hm7C4uj32IcDbbj8BukMKiEcvAVNfHqNWwHgHw9xgSKhp
	l+ly8s88Ye2mJtZQdKDx43zWQY3gRdy0TYfRqgmi/z3cnCuLKGyeeVr12n6xAYcubgAfzEySrm9
	TMVtQOs+JYhDwSiAkzw==
X-Received: from wmfu2.prod.google.com ([2002:a05:600c:1382:b0:4bb:6a03:8800])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:37c3:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4bb7d6cd4ffmr49219565e9.2.1795011724035;
 Wed, 18 Nov 2026 06:22:04 -0800 (PST)
Date: Wed, 18 Nov 2026 14:22:03 +0000
In-Reply-To: <20261019-rust-shmem-fixes-v1-1-3f7f6de5b5e7@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261019-rust-shmem-fixes-v1-1-3f7f6de5b5e7@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261118142203.711097-1-aliceryhl@google.com>
Subject: Re: [PATCH] rust: drm: gem: shmem: do not leak pages when sg_table() fails
From: Alice Ryhl <aliceryhl@google.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, Lyude Paul <lyude@redhat.com>, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 19, 2026 at 08:21:52PM +0000, Sami Tolvanen wrote:
> `SGTableMap::new()` takes a pages reference and maps the table before
> `Devres::new()` allocates. If the allocation fails, dropping the map
> frees the table but keeps the reference, and the next `sg_table()`
> takes another one. `drm_gem_shmem_release()` puts only one, so the
> pages leak.
> 
> Take the pages in the initializer, after the allocation.
> 
> Fixes: 616c229ab010 ("rust: drm: gem: Introduce shmem::Object::sg_table()")
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Applied to drm-rust-next. Thanks!
