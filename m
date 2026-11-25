Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618998;
	b=lQDpV17uL0Q/zjK5+otPtbFvmTiBaBMujh5QrM4viTPWe3OR3gOFurwfbBILlEY9ADvq
	 oU+0gn5UO6H8AS9ImvHghRxq8ax3wsWNDJFceeiWjFMpfeGLwrNsocGmLtf0HfCYf5STO
	 qPvr6GpiZkqhx9tzTPj9yeqTuYNuPx+rU9FetzD500NDM8jAjof0cd7HVOgKQvi4aPNlb
	 KXEjboP5MOXyvUNYfgf1J9W05qjEFcUJMkgq0n5Y7a1Lf1yb35fuurTnl8EJ5AUKP/on5
	 vZ0NVKXfALmByW6TYIAk8GmeZcHbuCNXWRLFL6c7RTCaEdEJa/h58SXPY9AiuAeOmqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=8Jz8ssl/IqO+cdkuoUF1XK1hhhFDc4ccWMMZLEDHfAk=;
	b=BWcdsRI4UF/rDEyA2Abkl0X4Do3ZpH14bti3fJqCZFOVY8/6XYowtTVZN4Lpcyg19KE+
	 9j1V9pR1FHiHNlTGQaJqyGkmmCVasgrQ8U80KDI350FZX0vrSV8ggvGbNvXZq5oG+WMlu
	 G3GTtpw7G0YF8E13qZd3rqId/Ppe2Zn+hW0fTc4ZRTFHpfA6rlRr/oRYImW/zFLd4hVcw
	 czqjr45dhgGqOKGYw83qGcTzl0IOZaCruj5OyFO/yQz6a6dgorDoRSyhavFOWV+H/huus
	 FgnYcYL03prWO8NcHMCmlnRuBH+g1o/YIaZkXE0m4G+3b9dB/zH9xuel9hYpl+su/iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A78AbNie;
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F70606A684
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:03:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88F70606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A78AbNie
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a1fdde384cso41752345e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795618997; x=1796223797; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Jz8ssl/IqO+cdkuoUF1XK1hhhFDc4ccWMMZLEDHfAk=;
        b=A78AbNiebNcNklyGszsJq8iPMepM+a6YL5fAZFdxaO9hs88QZZ/buRs4hMEgXNv+Zz
         ulEuzpfSlOsD9TFztYZ4HeQ6DOrR94+9N7Xs9SOaACCfJQ4banvsFCS3rN/KKZrxNksv
         5w7wG6TWmacfS1GFN6P1AGF97oRGT64FjuEMJTUiJRXt1xz1xbujYKs2izTINehVGc+p
         baKL/xKMIXxWSgSXnGZDYuin3Uxz0yBdqwnMziFh0e/84mnxNjU2Qn0KclZNeEGHyVBp
         FrVo0PmtvLzXll5Ktnb+qnuGp//Tmcfz681NGQTB0/Ccpnj1wQcj+sGCdcNKZg08s6zJ
         P3mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618997; x=1796223797;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Jz8ssl/IqO+cdkuoUF1XK1hhhFDc4ccWMMZLEDHfAk=;
        b=d5J00QzZdelEcYw1hHKWKxlt9b4ETTcxlGCeKpIXKqwBVIQcZk1sVZb5/Ps7mEgLy6
         yEzSX7n6H0akIKnYAcijauRQ04yLd2K/PJCf+zc6uW4vNxhO2WY9SaEtmoFa3eePqfD9
         7pwpsjaWhxN9Nd40qYS2KBOWEXkC/A/UQ+ucvtA7DFXKtNbDLegquEqx///Xc4AehnUv
         DBqYkKSNOh08kovB/3burKjuQnHzsjpr96WWObpu5mQXldytSSDD4HxcCKxSHwuJwSoE
         fiC10ReVMGMg6rfw8ds24Bdm9KZPWj/0RQwEPLB7l96YTR6/WhGskVjcyBvN+kQPGDLc
         5h+w==
X-Forwarded-Encrypted: i=1; AL+hErElgM9Nx9C8bU4ZRrqcor7gfOhju2Ji+L+ifYyruVfQsMoKc39EufnGJylOPuSw064KPrURlzt36vxi6Lc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BOhzYM21X6j61ntAGZLgFoOFJNWHYegffISisDbApzbhEHHKW
	jjw0ZnRL286hmV9j3qpziEg04z61EKkWqK3Lre6933LBFrwHGxqRgMrnnJwWxIoZlg2wBqNDZE3
	McovyW/z2QgEg+DSprg==
X-Received: from wmpr23.prod.google.com ([2002:a05:600c:3217:b0:4a2:e03:1f55])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d08:b0:4a2:392:9de2 with SMTP id 5b1f17b1804b1-4bb8882bd7bmr363816705e9.28.1795618996639;
 Wed, 25 Nov 2026 07:03:16 -0800 (PST)
Date: Wed, 25 Nov 2026 15:03:15 +0000
In-Reply-To: <20261124-rust-drm-gem-shmem-imported-sgt-v2-4-000f7a9ccb8d@jannau.net>
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
 <20261124-rust-drm-gem-shmem-imported-sgt-v2-4-000f7a9ccb8d@jannau.net>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125150315.1587936-1-aliceryhl@google.com>
Subject: Re: [PATCH v2 4/5] rust: drm: gem: add an is_imported() accessor
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

On Tue, Nov 24, 2026 at 12:37:46PM +0100, Janne Grunau wrote:
> From: Sami Tolvanen <samitolvanen@google.com>
> 
> Drivers need to check whether a GEM object is PRIME-imported.
> 
> Add BaseObject::is_imported(), wrapping drm_gem_is_imported() through a
> C helper shim.
> 
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: Janne Grunau <j@jannau.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
