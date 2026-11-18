Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015746;
	b=OLYHSO6mSAQTVQAQEwlJpmf/k+iV62YJdDwj8A1MF080nxnQvAqNKK53DtgKZEsyiHr2
	 dGWXwOeW+PcgihtpjM+x8YurzzvuZ7w8IktdRihxIvh/HPShP47k9Ed0lc4OPN2FyAPMU
	 EhuyS4w+cDwgwTaENZLfjnqaIt9OPEpiAsr8rrRfdyOPivepFToZhZqJ4UaxKlWoUoRSC
	 qppcwnEuSACY+kCsEePWLZvBMdHAGHINGECXCo2yBM33Qs2j5p/DwwV5pIq1hsEVQ0ru+
	 3ehcb2IO6MAY76rvfxc3GB+b4XViJk1JBrM5oBHNK8jGPtPBjoJrh9iinHgK7CDLylQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=WjQ+lJ948dIG2BXocv8WBAwSlCVPjavCtkad1QsAfjU=;
	b=nXv6mwAmSoociWZcqQrocd2KHAL5ZP5hD0CBQXCDDaACWRlEyXI+N6ljz5hGgMQvgH7f
	 FtcrDdjYY5TnsN13DTdM2PLLa55bXJ/3KlSbBR/iy54bbjBtz93Qzkjdbcpy2wpqnSCQV
	 crLoQS1XweHra0UPGHAEhh+umC6dYHKUnjA6eTcwVVV8vNL5pzOA5YOtpRQK8GF3kcHJ6
	 QVmANhscl6dhmEZk7YDIeg9Xx4ELqMyLo+wJTH9G4tVfx6RwyugTH4Syrv/Y51XXWMPq7
	 X/nq2I8c7xTGFOfHnfWNf6XC1jKGtNg9L6Fy+1dCNApfHWk7Qmo/N+qbJaFxcd6CjlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hPY7twFf;
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BE1606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:29:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99BE1606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hPY7twFf
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a16dc2323cso10359345e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795015743; x=1795620543; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WjQ+lJ948dIG2BXocv8WBAwSlCVPjavCtkad1QsAfjU=;
        b=hPY7twFfgYZsSLpm/wBE8tsEMaXzEm/nNAVYiPPBA9dqn4wo0krrCyqdAl0387aRxu
         1BkfEWIFZWDQfdt2PUiUWMxYoKJC3IBq601vzPk7GjLZUGwH2tFs/7M9TB335oxhkLsY
         RI7HVnzOzF2zUMAfM8S6a4TImmXhOlJp+GY7cKK+7fMHinhpy8FSvoFSuwEpIzvAmCBk
         kCcVXAhFajBtkmn43NVyY+QpiZmRhsI2aYK4WKH8VJdPZCBpu8zBsiHqFQAOyTSkCRKA
         IzsVxA4hkULC4h7dTed3Koig49lAAwp1aAvSs0S1HMf0JKtFMR7BTPEWTLFNa4JaLcCY
         rdtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015743; x=1795620543;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WjQ+lJ948dIG2BXocv8WBAwSlCVPjavCtkad1QsAfjU=;
        b=z5l/3xckvDwZWV0rfvno0WYjQYL6+i8ZlkrhKoIF8JDl4yh5+8UVJGLzZPMzHDg9ch
         2IdtF5mYIzg3GI1yEVjafuxsckDmSdkt6y3ArbNVMDzI0eqlwKO4/cb8D9+gZL/1gJtj
         AIP6DnSRay7A7+EXxJU0RoGJ8jGto0o+lEsfamcCLVuUC9cJpdmVR422SdSIwTBqiIy0
         DqpvmWPcHwDPwwSlttDOSspqeEkjWONdsq+VxGEGbcXSaKipuv/VHVAQD4q4THZ9Llr7
         R6/53rOSNlYF1XE0W82RzR5qaV4NmspcOQAkkpoOnIkMBofqnmRxEcECndDKECrFVeR4
         Yetg==
X-Forwarded-Encrypted: i=1; AL+hErFjrTpE2hh3M586itUUvuNVamBc9PI6dxq5os8pez1DOAqVYlpH4uNNVnVA1gUWhMl1MDsN8o7y+yf9EDw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/aWEZ7LwUlZ2dlyCxXmYZNJ/4T+xfGfvFABE7hvDkLsR58Wz9
	Bgzcfblbx/Zo1U+TkrVZbFi5DJEemS1H7Wq8emHNKTkT5PVG4trIkR06Zlw5HI3ADSF3R/SJKj+
	CMHg8HVAlfGKBYfApFQ==
X-Received: from wmbeb10.prod.google.com ([2002:a05:600c:678a:b0:4b6:5d12:e070])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a55:b0:4b1:2026:6b41 with SMTP id 5b1f17b1804b1-4bb7da2bd37mr54038905e9.30.1795015742420;
 Wed, 18 Nov 2026 07:29:02 -0800 (PST)
Date: Wed, 18 Nov 2026 15:29:01 +0000
In-Reply-To: <20261118133232.48603-1-vishal.moola@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118133232.48603-1-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261118152901.788942-1-aliceryhl@google.com>
Subject: Re: [PATCH] rust: drm: ioctl: fix call to unsafe function
From: Alice Ryhl <aliceryhl@google.com>
To: "Vishal Moola (Fractile)" <vishal.moola@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, 
	Asahi Lina <lina+kernel@asahilina.net>, Lyude Paul <lyude@redhat.com>, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 18, 2026 at 01:32:32PM +0000, Vishal Moola (Fractile) wrote:
> Fixes: 9a69570682b1 ("rust: drm: ioctl: Add DRM ioctl abstraction")
> Signed-off-by: Vishal Moola (Fractile) <vishal.moola@gmail.com>
> 
> --------------------
> Based on drm-rust-next.

Note that patch commentary needs to go after a three-dash `---` line
rather than `--------------------`, otherwise `git am` / `b4` includes
everything above `---` in the commit message. No need to resend just for
that as we can strip it when applying.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
