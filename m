Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795002086;
	b=HcZXfBDoThNBApWA3OZ+v5mFZqYz1WoGTBgEtrSuNwK9qoxMMBYGb0fXkCGqMUw4Cr5N
	 uaJIuGPO5PhJz0h04KEBMHruE6xCZfrvimPOkhJaG5B9H+LeCmyE1L69PRfmgUZBNh4jI
	 MfFGzPiIWzHTSrMzbhkzbBLttQlWjhs4hI0N2lldUDEu6De1fhwIGCCaX1xAHuZF+mqxR
	 J9JFTU/bDXAZWVeyN+nOD0Olx/Hh5kQtSpM9Mpr2s7JdiDii9bEGmuinrAWIGsqqnFXUA
	 fuiyhHFqjIut3SM1OL5HZDBehzRPdI1yVSyDSkm45wxyEp/IxP663dy4f6STtm07fdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795002086;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=HNjwtMA1cqvQF95bOt7vOmJ6SObUlbZ189r7Lg8dxx0=;
	b=kKXmaKALQIzAO4w+x6/dVs4/J0rQQCRfKd3T2gib84yGRcqLyyLgW7M/z8i+Zvo7+cek
	 Wgckx/BnXJg1Ek8bK+q4H4UZ6rotSb0TXmzqM2+AONRiJuy5HcRigkPzxDAiLEwdaRCkN
	 h69TtWJYdb66rKRKg85jomltTiwox6mZn5pKdca5P9FZQTgY6++5limbv03wP7RWa/MM2
	 MEc2MazDvy4dE0LCsQn3X8jJOWWj5rAVWMqbxs359Rm6FtaCSuV9qnP9YUdMOdjDDzCzQ
	 Jb2k4FqwqitGk7m9wbaTrlOcm44AKQyLKbfLyvX8aSyh/V3jItUyY10Nj3oWsFOEzmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="fU/jQ8mh";
	arc=none smtp.remote-ip=209.85.221.71
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C2360A2605
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:41:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80C2360A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fU/jQ8mh
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4901562b819so695731f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795002085; x=1795606885; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HNjwtMA1cqvQF95bOt7vOmJ6SObUlbZ189r7Lg8dxx0=;
        b=fU/jQ8mhHcys0xXE2eAhXL4yLPXv8Z25Wqul8Eu2wzPKbn9J1NkO0a7tfLtcnG37lQ
         1r6Gt8AcNOtopY+Fab28qEPpP2dZoSM76lcPFag9UociGhjZsNGTmbmXt2jxj8sSxs3n
         x0ejW7IyI4Os0ZgdbaJ9e6neAMJhzCS4EGWQrGaLp7ax9W//1Dom27silrvkS4Nxvxn7
         TSasluBD+oe1MafkzC69xPXP4YwtWo+a+4x3JhXCrmeuGZ7Io+znmYTh2nWrkFncaGtj
         ZIPg3u9kWIXGm5neWPeGCERgCN+BSSBkreH3IOpYyTc67UzVETvp9dxm+O/b0bJ8IXSD
         bOSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795002085; x=1795606885;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HNjwtMA1cqvQF95bOt7vOmJ6SObUlbZ189r7Lg8dxx0=;
        b=SCnY9inBlrzx2p5QFyHsz1G0VlGYS/uWo6wMYO5vrSJKnwNrRwXJyqpT3ZFLTrv4uE
         wgtzFlz39W6JbXemSwEdr7XMZ/DLrHwkmEh0Nz98mfzsYCS21mJrAbZLDgPi+cShoj5r
         01qMf87lR67A2g9yBvVD4mf9kmBt1fOCA2obIQ0GGLwNTxnvfSAm14SU7OHwYfGbmZGP
         kFH6N+l3VqHDkhgOi5mRgKyXE+GdXS4blt7U4A9I2Ut0UaFJiKRfC6nQQoqiSGHKKKcX
         k/pTG7EfQaH1XhZmZYgXj9KcNosJC6IMzJebEujC88XLolUQMJ5JN6weeFcN50ecIEdk
         2ZNw==
X-Forwarded-Encrypted: i=1; AL+hErEFTQ87EIBlc2+xr2TBBS45zgotdQ6Ps1goPLo9yvNYyk9gmhlNprKCgkMP7nwjl+++7Si5ZHkQDkle2i4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Oqr1niNwpgERmgyw9q6evVCdUw85sBmFzoyIvT61wjIaZZetn
	H7eVg3GfOK9qGO6stNKY6qlz62qIWAbWCz5wceQprkcsveWz5NYvow0Mmvu9c5Ang/uf88WTMIE
	/g9LxSIgD6hdYEUrWrA==
X-Received: from wmpz13.prod.google.com ([2002:a05:600c:a0d:b0:4b2:3c81:ca])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b84:b0:4bb:5dbf:af06 with SMTP id 5b1f17b1804b1-4bb7da2243fmr49551165e9.9.1795002084674;
 Wed, 18 Nov 2026 03:41:24 -0800 (PST)
Date: Wed, 18 Nov 2026 11:41:23 +0000
In-Reply-To: <20261026-rust-drm-gem-shmem-imported-sgt-v1-3-36f15ace04b1@jannau.net>
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
 <20261026-rust-drm-gem-shmem-imported-sgt-v1-3-36f15ace04b1@jannau.net>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261118114123.490870-1-aliceryhl@google.com>
Subject: Re: [PATCH 3/3] rust: drm: gem: shmem: Do not free SG table of
 imported objects
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
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev, 
	stable+noautosel@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 26, 2026 at 12:14:10PM +0100, Janne Grunau wrote:
> GEM shmem objects imported through gem_prime_import_sg_table wrapping
> drm_gem_shmem_prime_import_sg_table() do not own their SG table.
> SGTableMap::drop() must not free it since it will be freed on exporter
> side once the DMAbuf is not used anymore.
> 
> Fixes: 616c229ab010 ("rust: drm: gem: Introduce shmem::Object::sg_table()")
> Cc: <stable+noautosel@kernel.org> # no in-tree users
> Signed-off-by: Janne Grunau <j@jannau.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
