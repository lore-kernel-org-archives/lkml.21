Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009677;
	b=jNI17ojtPwZhDWaSUO4I4/xjwaVtZ0fX8e46U4wVIAFlxq9MJGwEbKaZ+LL+cfDd6H+p
	 5fmeZJXfPGn3k9G9g/wfrRzyKzyU9dyDGYEHdG7SmFZVpA1raC8PD8ZbzqosAjTRjRrNm
	 kDcUl+NGq9v3aEcWsdXwWtjWX90xd8Zm9rV0HM1jOc5YbjluA9xVIQT85MHUrrBTVy6Db
	 H+MsYDikVXDb8q0YUoMRDZfr4iF/Mj20RoM/ZJUrAoxT/ctt/p1RatLUtoK+bHGyTaIZL
	 QzuggjKNmptdHcrNFT1Yy25B5h6lJi5TJ5Sil395CQbaYLPFJ/Az6hbradPIAjg1JYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009677;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=ReEzbagpHcp/fcY0hMd4fNtM6diXxUaPoUO44vW/qBI=;
	b=ceBjrrodvaRC4eAK0u8Haoksu1N6C1NJMYxCXLYuM+quJAwYcVnfaKGi8+VkJg4g7N9B
	 orjZeubLCYraA3x9dEkyZOsUV0RioicjX5pCZCC0Yftwjfs2BhpiRgQkkce+sxNwPn2/q
	 /F6BtwjCh34PQB1On+iJzpbNbXq/Ph4vY0QLoTbR7Jho7erAdJjvkIEoU7TYKdh1IdzOD
	 HXCYGje+AlE/UyAepfkvYEF7ig05J/0q/Wz0roz5b8eGk7Df5dSWGFseXvuvK2BL/O4P2
	 liU/cE4Nc3HGE2SOC3WY1izdfgoCz8n2Nz1gM8RswvwCiS3UOqZj1PcCVgiOQqY/ChQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mD+pK0c+;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D6560A2610
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:47:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84D6560A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mD+pK0c+
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4bb6bbc025aso8399365e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795009675; x=1795614475; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ReEzbagpHcp/fcY0hMd4fNtM6diXxUaPoUO44vW/qBI=;
        b=mD+pK0c+M4yqOS0nuRtyleGn08rLkbqa0+ntG2h9RSKQx8HxtzF2uFobMxvKsLhFIF
         u5tuxotsdBlKwuJkGYA8QvBtxl70+ju4T58pnrA8AGomEzyUapTBTEXgFKhkbTLYv31q
         aZeUKsF4hqL9Ma7GkvfyNhUI2vbBkAzmJSvSma0+/1rQVupdCHXJxZeUtpSD7LNrkC1k
         npmLaX+YbPK3Y8usYq0DooJydQ9Fqzi6UCgg72jHJ0ycsGxAWct5tOvTd38kA0Arxpyn
         N75V8uZstRR4Gzlspm0oPGuc2XBc5pSlxw2tTPSZd03qQ7vNPkzi7M5tK411P8HzYeNr
         biDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795009675; x=1795614475;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ReEzbagpHcp/fcY0hMd4fNtM6diXxUaPoUO44vW/qBI=;
        b=tRo767xYW8HMJZ/viA0Z1MEXTRHj9vDkblOMzSEk3i9yqSQkICWdtT8E4XKSxFnhIL
         C7amn8aUE9Gfnd53RxZ2O9jVQvh3XtK/WCB3hp6uHXRRDvh/ViuIxOxcAi66Nes+JYOK
         znZLoPfhSWRCw8TJf4XgdHChnOJ0r8kaCI3Da0AOG/OcU//1ryPa8SCipjXNMTg8gfO+
         NItI8t6g9KUuOFOyJQesg2kFMgphNYs/4iA4eVz7QcMWskW3ISdLyOX0pE1aBjpw+qh/
         WaA6Su7Nrel6ZPBXaJM1w5Xyz7dUHyGVA/5yQ0SEbtXlioXsiOCJoMY1OnFlBA4GAU8B
         OYyA==
X-Forwarded-Encrypted: i=1; AL+hErF2GB8mhk/m2xet++0c16IMTGwBRirPnmKTFQBfJe0orD8Y6BGGrkEdjPYG8Hxv0vn+0VUZ1bnNio0HqCc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/A/YKjbQMjFu0fp+hls8Kl8NoqJ0Rc4K2dcg/0pl47bc4MhPn
	erPyBHIrj6PRjpJoU9vkCmGZezXVJHX782FwxUrnRhvxrhug8MFJmNQcFcdLi+TUXQXHJpds9Ta
	6XyT9Ek4xYASuFFkadg==
X-Received: from wmbgz3.prod.google.com ([2002:a05:600c:8883:b0:4a1:811f:6de2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f56:b0:4b7:6c16:7b43 with SMTP id 5b1f17b1804b1-4bb7da12aa6mr55502915e9.10.1795009674222;
 Wed, 18 Nov 2026 05:47:54 -0800 (PST)
Date: Wed, 18 Nov 2026 13:47:53 +0000
In-Reply-To: <20261013-clk-type-state-v6-4-a5e9977b3509@collabora.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261013-clk-type-state-v6-0-a5e9977b3509@collabora.com> <20261013-clk-type-state-v6-4-a5e9977b3509@collabora.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261118134753.658399-1-aliceryhl@google.com>
Subject: Re: [PATCH v6 4/7] rust: clk: add guards for scoped prepare and enable
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Alice Ryhl <aliceryhl@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Drew Fustini <fustini@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	"=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=" <ukleinek@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Boris Brezillon <boris.brezillon@collabora.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, Maurice Hieronymus <mhi@mailbox.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 13, 2026 at 02:07:43PM -0300, Daniel Almeida wrote:
> The state transitions consume the Clk, so a driver that keeps a
> Clk<Prepared> in its data cannot enable it for a short section without
> moving it out and back in. A clock handle also holds at most one count
> of clk_prepare() and one of clk_enable().
>
> Add EnabledGuard, PreparedGuard and PrepareEnabledGuard, returned by
> Clk::enable_guard(), Clk::prepare_guard() and
> Clk::prepare_enable_guard(). Each guard borrows the Clk, takes its count
> when it is created and releases it when it is dropped. It dereferences
> to the clock in the higher state, so a function that takes a
> &Clk<Enabled> also accepts an EnabledGuard. Several guards may borrow the
> same Clk, and the borrow keeps the Clk from being dropped or moved to
> another state while a guard is alive.
>
> There are no users yet.
>
> Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
> Suggested-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
