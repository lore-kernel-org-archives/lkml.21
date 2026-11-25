Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605154;
	b=vkuiR+24BKDnp17GNRCH6FoEAgRpYp/Gohf7OEhUEAtndMct0ToxJUZ4+JuwelNDw/jL
	 I75ub/SRsx/lcyKXBHE7+cg+wjWOaqCTPKB393I9LSyFdh7x0BsvlSQJFHLx/suQzLFjz
	 yL7FenUsb+/0eU4S2tsnjLjKGj543OhgLGz6za/uS8UT3+QKHQFDfTcQaAkP/OZNH/04g
	 y5cXg15BBaJ6hkfvyutoxNS8HSy8mstZp8+mc3yWMdn5/KWOwHDReoIp8GuM3yWqB6gcN
	 yfp6kQaaaheor/bbnPAaNLg3mtdCdO1ajryKCfWrZUonv4x0n1THIZQDb6Eh+MaycGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=lmO9qlZWx0TKcaEyqSHqDwn9dZMk6HPcgLTZNeLkLbo=;
	b=VwNj0IYgENpss/9Oc9TdJOhLHmTDfsIaPesF1vrUWkZ1qGiuj4eYWPR3GdnvFhL5aGRw
	 v+V62ktyJj4L9+rYh9FKBtKNja4Z5cftShPLDjTkr0ndXvM8A8voxiOqDZ25PYi6mRocW
	 BzG3Vk7Eg3L0jkHMf85RKnLAd3fAKnTNb3XwfVbTlfAWZOQl8OR8AsEu2FJu8TXbry5+X
	 dSRO09OsPhXaagR2YDKenIar5zc1jrfyooysj5wJa9W1JHow72gXWk2b5eLBN2wc+SxmN
	 PDmaupAouwMYHO0/1Yq4s/DqSm0fJQl3p/3zHXUdfVjBoF2P8Y/J+2NxLwQYGCID7OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NWMxLyQp;
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10206606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:12:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10206606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NWMxLyQp
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4903fc8537aso3746046f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795605152; x=1796209952; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lmO9qlZWx0TKcaEyqSHqDwn9dZMk6HPcgLTZNeLkLbo=;
        b=NWMxLyQpoPPny8w0k/sNJG7mdgkvkReOLIELehJK/e+4rGbD8J9jG2aKb3XYfOOdTz
         hH35qaLmPkG7tvE7RqXNQMzo2BSaRAw/A7yU7FubY9nHhBIC93TC6s8J2a3gpJFPk/tb
         XR0Ey5HSYA9Zwz7ii9iMR/qzFwVk1VuzcXHaVtzf1+oCb4uo6e8ZFyoo+NowU5l5WUkD
         VxoJl+rt+sJ5u8a1rbI7TvpTAObn9gUhfi/172MuHRScrj4sQD6dXVIa7QkGdNHr04sf
         x7nO3XIZH9VaGQbfQOtu+PKzRFwXx4YpF/9I9XCAVfbsDW/liFsB5Fah3n6RHa9UIF92
         c9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605152; x=1796209952;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lmO9qlZWx0TKcaEyqSHqDwn9dZMk6HPcgLTZNeLkLbo=;
        b=vrfvqDYnFBczgR79SEzgrrioqi/w/5ht01szMC2365+iN+84TT/U+jhv+UEjc9jRS2
         o4OxLEndRofqTJh4tZJcwjmi4ajjvZaItJg0tSZqoSzi9Qyzsai2peEC8Hz8QPwu/DWr
         pB6b+04EqryHPNnPueVBw77Sdz3rXO4KcHytdV08HvaTYzF3ovcbsxaTvlp+QVLkbEXf
         LPpg6gbrqcnkKnp4qiMNhLe3Hp85VfaIq/Xx6UAUENdLoaGtmu3bLaN7n2RWpRzO3V5H
         Aro6l3lfOiHacEKw/ifrS9tLa5yhI9KlLus6FGzyf9UU9Ga4GIWvJybRTjAOmd13ZvM8
         kx0g==
X-Forwarded-Encrypted: i=1; AL+hErGf1/vXA3epDO61wyjoxBdqWJ9kFVME2unEsMCU+g5w8K145C9y2HdcAtLVibx8u3S3XSku2K1tU43/Kag=@vger.kernel.org
X-Gm-Message-State: APuU4Z95m4e07xW7iMzVkm6UBBRUAMIGVJ7qdSp/RTPRZcNgZYVA4O4u
	CYXyKc97ddfwjVaOKKOZ3FsXX2PR7yM28/wtOC+pKguZ3BaSsNxz46KSZBXQcCo7FEtdhgkkIZG
	Rk90lQiPm5rDhkCkQWw==
X-Received: from wrmk12.prod.google.com ([2002:adf:e3cc:0:b0:49b:2420:f8db])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1788:b0:492:3176:3d6f with SMTP id ffacd0b85a97d-4abb400aefcmr32875648f8f.47.1795605151706;
 Wed, 25 Nov 2026 03:12:31 -0800 (PST)
Date: Wed, 25 Nov 2026 11:12:30 +0000
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
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125111230.1082141-1-aliceryhl@google.com>
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
> dev is created via an unsafe pointer dereference. Following the
> convention, it should be wrapped in an unsafe block, but it is not.
>
> The compiler only properly lints declare_drm_ioctls! when its defined
> in the same crate as it expands in. Since upstream drivers are all
> separate crates, this is silently ignored.
>
> This has been present since commit 9a69570682b1 ("rust: drm: ioctl:
> Add DRM ioctl abstraction").
>
> Fixes: 9a69570682b1 ("rust: drm: ioctl: Add DRM ioctl abstraction")
> Signed-off-by: Vishal Moola (Fractile) <vishal.moola@gmail.com>

Applied to drm-rust-next. Thanks!

I stripped the commentary below `--------------------` from the commit
message and worked around a minor conflict due to the `Ioctl` -> `Userspace`
rename.

Alice
