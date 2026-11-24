Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539187;
	b=tcUC9mSS2I+RQ4F0Ah5F9pyA62Ib5yRyzBF+vKOzm3yU1thKrPA7/SiB3DnlfuwAIknF
	 SrzmjhGDFWIvsbHWT/mghOmMwi/FQt7LiKcHj0xIW5jNc/yYms4hHW8CU7K91FoSsvjVv
	 W52RWiH5QVJVVoCL1VApBA33kC0qboE+0otjlreaaEJh6BFh0n7CGlEDd8odHTlSHfrzy
	 maPNWKqVZgsHlkJxrXCg6tXcdcHOvfbNaQb/YtkbO1KNYsOfpSFdy5xbEpKk1PFIt3lVU
	 IwCaJQnJLB0yeHPLjvH9pHiru826mZn7g3kJe6q66g7QqGLRj8d6c2OVMbGd7jCsCIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=+6XqvUEASgW1nzq6zUn3qY0teVOPvQxrwEX3381OA8Y=;
	b=QUpZYcr6aL26CnNtgPInf+y+nvgQqkOEBSj7clV0mh6y65005uafHYRCjmbtHfieIrmS
	 aWbJnjmuWnYsxNBUaw/OL0qX53IsnC6E/JC6qhF/Voku9FL/TswTXwB6V7iDLuJwV+Lem
	 ZE42S5a6gYFQklqnPdW0v9/gINYdvMLpetpsEFrN6Nvzg4ab/M/pMXhA2nHyDzhcUOV/F
	 Q9gnydDh5XKnrjCp2X9jg9af2Uvy45WqP/R764/epibQXL4kX6GULIjHe/DctMxrG04OS
	 pQpfkzUzPAfIPxP6X62EEfSRN8dnEc55Ln7A/TucPWkYQ+tyKO0dhuFkJ9ZzHHUPDUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VZZFRFXk;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D55C606A33D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:53:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D55C606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VZZFRFXk
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a17741243eso25260725e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795539184; x=1796143984; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+6XqvUEASgW1nzq6zUn3qY0teVOPvQxrwEX3381OA8Y=;
        b=VZZFRFXks8uGXgDGorAP4+ZWHzw0yj6MCSZlxEzeTSwsY1U3CVjquxB5j+5PHxDBOi
         tv/qoecFSu8lvgvkPy4gk66sO1SHDRC/Yrnl7nk/xH1ks3+D5BIxQdxbbVSJaiXFJIsW
         zmH9wfa+i73Zw4RtNQpmkjwuR80dB0S7VNCDdBl0DQsRaab1TBVwI9pJblnEn7/znayI
         fK4i/j8P17rdau5upiQYK6a0AU1FmOAWdcxvUp6eKaOwox6UyxC3HemNuV5+LcxL9mGt
         /CzntqWrWiw/IRpwkjWbReFloc0bhLxfmAuP5Yy0fYtSMEzVfgIaSExAQVQY3MIOXW46
         rq1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795539184; x=1796143984;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+6XqvUEASgW1nzq6zUn3qY0teVOPvQxrwEX3381OA8Y=;
        b=0VQAL+3fPgSOsYaRg0c/PRRX+S/Nm7d+jlfI5/0iob+v5HYYcTH/9uC9B+Pbm8QqqV
         qczN5kEA7XLeopaUO2VO8zs7vqXx9K6in5Z+auv46qiT0LO7f5RBZWHH9NgSpol86AlZ
         Vyf44Rri8Y6793ZNsjFUrdVJY6D1K9770p2rFlmrvXqnfoywHQCmpcVWivfMN2x0OaxD
         +RV+XW4LUmDdpPtwcmgfF7yz5J2cOyGahtlndKM6KqA8K9hyDqrDv+YYc6BmWC+zZt58
         78W7eqHECz1HaGkuZAlArQ5WBf5MAxOLGENlYKNhkwYP8QHNn/wIhleRFN/D9cExFiz7
         R+uw==
X-Forwarded-Encrypted: i=1; AL+hErH78KUB3MtnhKTaHJ0L5ZvpAvswiRZ/nM99bBDTMcCzRb3Wl4/jVrlj0KRnLyJjlVdmSLQcSqdrlxQXrK8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zPdsf9xFPKjXyM/UWN1AvgMLDfgAonjQbIuvYGgRvLjmn0Uu5
	LSBnVVX2qpLorUfY5Izb3+rEE9yl7Tcz72lxaUGhfoHVofT11m1OC5Yw14ddwEtRJe3L+Jteb7f
	y8ZSQBq1AByLpIQ6EZg==
X-Received: from wmik5.prod.google.com ([2002:a7b:c405:0:b0:4ae:362d:4d6c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:154e:b0:4a3:59ee:86b with SMTP id 5b1f17b1804b1-4bb887c3b63mr334954395e9.4.1795539184204;
 Tue, 24 Nov 2026 08:53:04 -0800 (PST)
Date: Tue, 24 Nov 2026 16:53:03 +0000
In-Reply-To: <20261124-rust-drm-gem-shmem-imported-sgt-v2-3-000f7a9ccb8d@jannau.net>
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
 <20261124-rust-drm-gem-shmem-imported-sgt-v2-3-000f7a9ccb8d@jannau.net>
Message-ID: <awXA70GWssuU991c@google.com>
Subject: Re: [PATCH v2 3/5] rust: drm: gem: shmem: Implement
 prime_import_sg_table callback
From: Alice Ryhl <aliceryhl@google.com>
To: Janne Grunau <j@jannau.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sami Tolvanen <samitolvanen@google.com>, Lyude Paul <lyude@redhat.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	nova-gpu@lists.linux.dev, stable+noautosel@kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Nov 24, 2026 at 12:37:45PM +0100, Janne Grunau wrote:
> +        // SAFETY: The DRM shmem helper only invokes this callback for a registered DRM device of
> +        // type `T::Driver`, which is `Self`'s driver per the `AllocImpl` impl below.
> +        let dev: &Device<T::Driver> = unsafe { Device::from_raw(raw_dev) };

`drm::Driver` in `rust/kernel/drm/driver.rs` currently declares:

    type Object: AllocImpl;

without any constraint that `T::Object::Driver = T`. I think we should
introduce one similar to how Driver::File constrains this?

Alice
