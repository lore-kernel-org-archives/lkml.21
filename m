Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618997;
	b=scV2MyDINnWlriC6IKsHuqp10ES7fpF9HjZ5S4KJ2F6FjSn8vH7zqnGbdKx39BK17mUG
	 1AOoTdSvwse/ZIi/5dtmXcB3Xl65Tc+DL8QtrAm51sQAyK37M1RK+nFfAHNTS/AOB03IH
	 m/H6lJGuE61+3+hyypKph4VVNmY2w+kjMj2zC+2kRT53M3DWoJWF/dlHZqH6pepNbnBBg
	 UqICjSh+2slQryQlajmvAu2HkQBpfmx/ePC1yX+oZELOSI77EbA3aJtH8PUk1YV0vqhc/
	 e/4FhQ27aGKUUSfShxDXc300oeEY0HiskFZCiJwA00zlH9sK3iBvat04yQwnmCzW0yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=N4O2DbAYKqujXPOE3qGC4/NB1PRFQz/yrJhP3BnWqGc=;
	b=Qrf0Gl3AAWzW0E2PTErxU8BkS/2PeZOtp01CXGDL/B98xPUJrrs0pw1Q9jIk3I6/1J7o
	 emkiiXmnKBsIvBCqEuSNAOSUK/RVFkZ7qgSnUcmGQV2AEg9EDJSJF7hAtXfkRdDUQIh3T
	 WsIguCCPdqmsjQekLiXMV5H4u905xqRK+cAu9Gu5oFHu6LGB5ut9wo7tLJuEqqICjzKtJ
	 0UpR0hRU31ps4fFUpJmnBm1f85BKhElY36aV7v2N5u5wta4aZ4HyhUyEBO/BLL17r/zA2
	 d52SDIiOmlv48NNZK5QL4oEfvp5eMYmD/oDvNqV9XHWuCRI0nnPSIozh+XfKJIS/GQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nA6o9YS0;
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A24F606A333
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:03:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A24F606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nA6o9YS0
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4bb66fc3aa6so50325925e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795618995; x=1796223795; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N4O2DbAYKqujXPOE3qGC4/NB1PRFQz/yrJhP3BnWqGc=;
        b=nA6o9YS0JDCjENOgK23oRWt39tSZ+7jAlrpFeu6eTbevBHhESqnKpWIyByw9TdM90Z
         xJExr3JEAz0pnvOhBA1BL6SSR1T498hzLQmXrGM2aXbLZCo8zMURSQBOKNK24W+YaKeP
         n/SrJGXbiJ5Kxq2MNo28AqaCK2tQ0dWYUD2ovPqWC+2BGDeVFYwSUvy1XZm4Gv8Oovbm
         FR+CR0r2LyAZHzhQLGq3Az9lZAy7L+PSmqgPdCRuM+iSOIjq/iksaQ8Dc+23wCnY1RHz
         Lp84BV5+dfXSl+0Blq4KMq7pbWHXE2TCmTz7q8j7QPvPresrr0LOBB9QmskfelE5vp3j
         1x6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618995; x=1796223795;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N4O2DbAYKqujXPOE3qGC4/NB1PRFQz/yrJhP3BnWqGc=;
        b=BjrdiK/N7NnTtjFofzf8k5mkshix+GZcRDKSH/vq4xCUVmvW7M6bOrY3r4rp5aJFPD
         kNFbhUHl+mBaKvf4z7Qb7Z8QTW5h9TGa0j4tNJ3Ijm80Tp2hXch0lCUeOHcBrcj55+HU
         euJynVAaGm7SF59RXt1Ui08zOzGn4ukW+l/au4Q1cwPhEoQDmOm0vkL0ivsbQQu2+YIl
         kP9QF65JgNgJog/UIAQNPDpBlS3L9COS+88v0Otc6DloAUXxkohKxEIBmULeM8m8feYx
         oolArX5su/UVR4QnMIquKSJUgc2VuYNAJr/ctR4kkA7hhtqJlNXMPnsqgTh2RR5o+Oy3
         4RFA==
X-Forwarded-Encrypted: i=1; AL+hErF5xlYKjzM1LaubRAltRBtd53Zo+s6bVSQa7dpBzw9xX9Ti087G8Tpv6scS/HQTCuvPAUkOgi16GQDDVl4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+L6pO4ZbV0GIFZTml7NsmLLRPdnR8QTb06Vxs6gfWK2LmTBg+L
	yU6+dtbdKs/vnMdsrQMMb9DfRFUojORFVokuwSjSXUIYew2pDIq0SkstjRSWAnm0xKQIFzz5IZt
	zlLV0CLVtq7SsWxLdQA==
X-Received: from wrpy15.prod.google.com ([2002:adf:f6cf:0:b0:4a4:8614:8907])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6748:b0:4ba:761:97a1 with SMTP id 5b1f17b1804b1-4bb888251bfmr350875475e9.14.1795618995334;
 Wed, 25 Nov 2026 07:03:15 -0800 (PST)
Date: Wed, 25 Nov 2026 15:03:14 +0000
In-Reply-To: <20261124-rust-drm-gem-shmem-imported-sgt-v2-2-000f7a9ccb8d@jannau.net>
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
 <20261124-rust-drm-gem-shmem-imported-sgt-v2-2-000f7a9ccb8d@jannau.net>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125150314.1587795-1-aliceryhl@google.com>
Subject: Re: [PATCH v2 2/5] drm/gem/shmem: Initialize private objects via
 drm_gem_shmem_init() too
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
	nova-gpu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 24, 2026 at 12:37:44PM +0100, Janne Grunau wrote:
> Rust drivers need to initialize private gem objects when importing
> DMA-bufs. As with regular objects the ideal way is to allocate the
> object in Rust and initialize it via the DRM gem shmem helper. Expose
> the `private` to the exported drm_gem_shmem_init() function.
> 
> Link: https://lore.kernel.org/rust-for-linux/20261118114102.490384-1-aliceryhl@google.com/ [1]
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Janne Grunau <j@jannau.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
