Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795002083;
	b=Z5wC636H3TdeKVgtV7XLqp7HiTUOaZD3AecEETeAVdFSo0ytD2CxXwEss9ZlSNAyeQqt
	 mi8CsqQgsvV/uXkDCJubldcbjb/2GS6RiBnN6AYqMnQ/18V2c4oG8GuKRS1datv0R9wC0
	 nZwCiZrhdjFatfdGPin+Z4XuoTUdsaG2h23jkitDv2dIal8v7DA+8SE1No+1ym4roiCDv
	 IDI5V66hDABMOsKAovnJiMo9bPXyufYVs+bwRX8Ht7jfaLrPinGOoBT1N6w0sbpVfv/Gu
	 HEzxoEIGLOwe1SajBaqLGit+tcA8I7AuZAH7rjVasseSlMgb77CWSIck8mnfDdH66XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795002083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=6D6rhu+SkVFybLm4YEOF9t8UdzNLA6IBCbMCQMMTO+E=;
	b=X8XUCL06jPEL0fvdtMHJGSpmzkEt4AmMm/ZXu/yGhEONGrBf1foZEITy+Sic2ow8aqJm
	 HpotCr/cxWHf/bN5bpTQicHQ/yPGRjt2t97oMjXaNj2Q0CQcd+QSv9WkxNYMNwO9CfPrh
	 G/HGHCYukoynluR20ZSIKbiZSshKgGcxFrT7Umnd4wFF28x3BgP3TfmawO+I949RPeo+b
	 ny152PW2yakitQYdAYCYWM9gKpHuidnsJafDATTIb558fhb2+vK5SuSzFoDLtBrw797kq
	 opeZpsxH/kynY1YA8GwtvX5u9w6xBXVb2/6zO+MRZJwx2UpGrx6+Y/c8WBPzJR1GBDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=douJ7GzB;
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3078A606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:41:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3078A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=douJ7GzB
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48e29c25101so412246f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795002082; x=1795606882; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6D6rhu+SkVFybLm4YEOF9t8UdzNLA6IBCbMCQMMTO+E=;
        b=douJ7GzBp/OM9NyJnZ9MyvhR4rG93gckMnTGjghElLSuHUVd9lUVSBWsCs6p4mtKZj
         vABjkqJFqNOsLfTEj2fh/Xt9bCktEwc3YBIh4v8yNAhL6nh9g1XsTtY1SUYG2EpOnOcA
         jFgPXtBFNV6iGL0UZ1VIcHMXjeb3YfRTT3nXfJ31Rf+S6W8v4V8UCXA1dA0iDA1Lp3DJ
         v/aqdHJ8LZWiV52TIcDe7/7nfcY3NvUCPxdwCKtoXv+2WWEiYSdp8UxxlOGKZpouNov9
         XlqoR4V/+KVeOGahFw7RkdEVg58DaMKBNcSFz+gn6b+p6eo+PMBqc7RHTMw6HyO8d0PO
         Xlfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795002082; x=1795606882;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6D6rhu+SkVFybLm4YEOF9t8UdzNLA6IBCbMCQMMTO+E=;
        b=J/JWVfdieteztQfM90YFV/NbeO5v0PCh5wXOjG3sHmn6GJ/9DCD5NhWtOy4FYb62X6
         lBWePplqR4XGSsxUrXUf1tLin7Cuaij+RQgS3SxMyXsEx5P/AX8bvQ33C8C21lzaxWxJ
         SfpxnXN7pL8iONka7GggxGWqSuyQD9IvNdjQaKhtHwRyCSxGjDKtDLwxE/XhWDqF+cbj
         ne0r5Z1hEw4iHZC2rGK1UCNSwaCu2Nv6pdY8Q3ihDZ0yzBIi91HGeMWUXa5HDqIdr6Y3
         u7L87A4KlwIAFGvT5v4ZM0GzPLUCWd5Zguyweev0a4dgswWM4FW7+aFp+k0jUv/xRxrb
         SoBQ==
X-Forwarded-Encrypted: i=1; AL+hErGCI+Sn0k8jTayKSrVjTNacyV++aBC+T/9k3+V6jBiwF64cX7+DsR2VXo1mbhO/uWrq/EKUUoI38Uf/zNo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/F6VG1f6tnw3UN4Z3OMv9gCzumxDaaTXlxqten8kJGOq7RIOp8
	ixIgI1lST2RGgT3cXbiTLA7LroEI+n6ZVbtiepFhJJ8WBTvuimkS3XKcP77EVR2nnTmgbcMk03E
	i362Tk5VAKKMkZT4wFg==
X-Received: from wmix22-n1.prod.google.com ([2002:a05:600c:e556:10b0:4a2:11fa:1981])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e56:b0:4ac:86c9:b09c with SMTP id 5b1f17b1804b1-4bb7da1b40amr42014765e9.13.1795002081244;
 Wed, 18 Nov 2026 03:41:21 -0800 (PST)
Date: Wed, 18 Nov 2026 11:41:20 +0000
In-Reply-To: <20261026-rust-drm-gem-shmem-imported-sgt-v1-2-36f15ace04b1@jannau.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261026-rust-drm-gem-shmem-imported-sgt-v1-0-36f15ace04b1@jannau.net>
 <20261026-rust-drm-gem-shmem-imported-sgt-v1-2-36f15ace04b1@jannau.net>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261118114120.490722-1-aliceryhl@google.com>
Subject: Re: [PATCH 2/3] rust: drm: gem: add an is_imported() accessor
From: Alice Ryhl <aliceryhl@google.com>
To: Janne Grunau <j@jannau.net>, Sami Tolvanen <samitolvanen@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	nova-gpu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 26, 2026 at 12:14:09PM +0100, Janne Grunau wrote:
> From: Sami Tolvanen <samitolvanen@google.com>
> 
> Drivers need to check whether a GEM object is PRIME-imported.
> 
> Add BaseObject::is_imported(), wrapping drm_gem_is_imported() through a
> C helper shim.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: Janne Grunau <j@jannau.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
