Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795546470;
	b=hY/PINAomoBS0zraRVNx025xixtklw2HITXWiQ+cNgsZ/7BhBidrMgnft7y5POL6TFw0
	 +UuyyT8+1EkpaGegJbOdCMPyfyp4ppekzgJlwAxzkFkHCHIbxv5IFhew2V4hMzqDTiFPv
	 XTx9LUifbXpo7hpy6mYuZCDlVbW69Zo2Z7+cyYWcfO0l/HhB4fO6RnyMDUW68KG3N363w
	 +9cz52l87vC6zmkw4a2mFz6//GDuo8Yd0gFmAR41yJ/cv0DFl5IkbaB9LqvFIwtJNBv92
	 WQlJpVzt3R81zQ6kcA3sDIx/om/ZwkZTbS32jAg4ltrPGuDamfJlgocPh0CfGoB1xLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795546470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=JlXoPCsikAIAHDol8QyOvxuGmdfr1LiWSUW7tFYnhrg=;
	b=wnKH8XJNeiipP0SBNGRH3NNC0ikWl4Mb0jBEhJfJuxVoEujHgBaVOi3CedytD3vf7iXh
	 tg57H2VZ2WTnN4J51J9Gdb84fYKXSOcwDB2HMmwmME0QUuzxo9Q3K5PHxCVaCV4EH74Ck
	 9ESjMLEqEukwVTEhbbjax+GCH97wzAvoHt6QIIBOp9f07kJONBYmE8astlHZtnNojmqva
	 cmSrBAmkRVHWJYHJZyvW+4mKI+lKuDPI4v3Dh4qVU17bgTHeYrhqXe8DECXtIpaWQoLZ1
	 VrWe9MR6gy3ekK34u58HDN/zPffUYUq6qkA+S0e91VArOPmmKHRjpXOZk5jqiphuIEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cs25wCsA;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046FA606A33A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 18:54:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 046FA606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cs25wCsA
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a009f82bedso34923885e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795546468; x=1796151268; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JlXoPCsikAIAHDol8QyOvxuGmdfr1LiWSUW7tFYnhrg=;
        b=cs25wCsAxCYY1cJ6Eg6HcinqoZc4Ui95SsWD9SLhzVgU9u/mUxznVWamPkE2XUy9im
         X/HlL+u7UcI3aNc3FzmSU76n3MgItgzvA6DYEWvBqbHJ89HkiI/ifBOIPcmQsbvm5d4L
         25i7cMtrd5kDP3pE06QF6T/9Zwhqyv55lSL8mQHH/Pcn6HKj3j/D8ReXSupuP0dBhD8n
         jSEJ3wxGu3hy9nNNnai4mTjQzEn5MZceDId9G2WpRaDBJMdBQFG97YOhdsxgPoBif4m6
         Bod4+sfeFwg1WgTpD12YLxcsBTgou/BIqJ74NmyXFx1KPGFl09D/8ejYplf7reCdI7F/
         +5QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795546468; x=1796151268;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JlXoPCsikAIAHDol8QyOvxuGmdfr1LiWSUW7tFYnhrg=;
        b=Q8kk3tqkNLQvzB/hdlLQHkGBPT9PB02vgzG18hnro/9qSXpQDGH+MIRFEWetdujFAj
         d41WUPJLTFCA6yK6QX6iDjIr5qIjFRwnNkMtL6uy8Vdox6wTHIROog/+qUqT22Aw/7SG
         GPg/ZnDUlpkLBVrwAAZZLbPVrTqy2679+rUqUfZNEVaL8JLE2oJiFub25EqMwqWZFi0F
         eSCLWTgwZPFNxstWFKWGvcqv5XRPGZqmhtsKRSkFxugGcVjvTBr5PzeeNJmuUovh2YFf
         Chy6lr7U4cGPq+K7kXFJdZb8GrUITGlonqRaNpweDyBThK/rMFTMUEC2AQvp0O4zghTw
         TbYw==
X-Forwarded-Encrypted: i=1; AL+hErEVkzV9PWc5k0ZS1ZkeeqPAp7eL8Tbpw4sYzmVcTA6vds7OXuoVQ6WEdSlodWMlsiuUXs152PI6Qti06Ew=@vger.kernel.org
X-Gm-Message-State: APuU4Z91HW29tOnazTdiCXVEQn+qCeaXGsGjhhAeY/e3LtWDA/1Jal64
	sp2HFOx3rRzH1dJxgb1ccZcHNSNRItL04k7V/M3mmcHoJLlgg/H0iegft8P3ByvDxUfE46drRGE
	qck9Ku2yWglnWHNZDlg==
X-Received: from wmbje17.prod.google.com ([2002:a05:600c:1f91:b0:4bb:5e69:8177])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:82d0:b0:4bb:818d:8d8f with SMTP id 5b1f17b1804b1-4bb88818955mr377886255e9.23.1795546468273;
 Tue, 24 Nov 2026 10:54:28 -0800 (PST)
Date: Tue, 24 Nov 2026 18:54:27 +0000
In-Reply-To: <20261119-fix-drm-rust-fdinfo-v1-1-c10f4134488d@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119-fix-drm-rust-fdinfo-v1-1-c10f4134488d@gmail.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261124185427.3821700-1-aliceryhl@google.com>
Subject: Re: [PATCH] rust: drm: enable standard fdinfo for Rust drivers
From: Alice Ryhl <aliceryhl@google.com>
To: Peder Bergan <peder.bergan@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, 
	Asahi Lina <lina+kernel@asahilina.net>, Lyude Paul <lyude@redhat.com>, 
	Janne Grunau <j@jannau.net>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 19, 2026 at 10:48:47AM +0100, Peder Bergan wrote:
> DRM monitoring tools use drm-driver and drm-client-id in procfs fdinfo
> to identify DRM clients. The common Rust DRM file operations leave
> show_fdinfo unset, so these entries are missing for those clients.
>
> Set show_fdinfo to drm_show_fdinfo. The DRM core helper emits the
> standard client information and calls the separate driver statistics
> hook if the driver provides one.
>
> Fixes: c284d3e42338 ("rust: drm: gem: Add GEM object abstraction")
> Closes: https://github.com/Rust-for-Linux/linux/issues/1266
> Signed-off-by: Peder Bergan <peder.bergan@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
