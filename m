Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009674;
	b=Ol9V/GoqUjFrcLa5xjCGEF1EII0FPXCyF9RXv9mEnuHbOrbZoIPiN58C66NM/vU+Imx9
	 GWB1AdSrXoHV5oBUWUY/f2guge3lsUIpaVGortpwP4Mq2lGql7+FlEFkJgwPxJvnznDI2
	 EDTMzmqnaRnrc1CS73pwp2HpHJg+fg0QH5f81OtcFhWHJqSQEgn1p+fachSWtnc4rxjls
	 5RKXLQIx13XfL264QhUFKgUI4+ZA1ubbZOkdQcV9p9cbqpQv42zC1lnmkOQ7SryI3f3td
	 pUoX4Zp06DMrngBdq8lTpCMphSixanfGCo912IihbkZ1t5W+Y8+BP/YGXuhDewH/UVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009674;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=zquXBrMDSkgmhzVSBU9n1JfbEE6tjoTWMroKtZE+aJ8=;
	b=nyKs5me+z7SmE3GTLsAKTPwbTJ/Vwda5/irq57qq1xgVM9bGcvrrAtMSO9N8PBJ9ROZV
	 AkbptEkU/kQA6e4V6ZFD3yfY0txCZeNRqiIvOfY/f6FVojlpgH2UNTwVeB+lZ0eWPfh4U
	 aHqvJ7YATjg526M8xD+q8K8//cnz0zgluwg2j8HVkA0EsdK3iGmDCeIXnxbGmIvTj5hEy
	 d4SqTHF/ImFgYo0DQRecaTUWRZJ+P8WXnUshvyi58/itwz4m//N7tPHaOuosY9Tb5aiD4
	 spHn9ypljveIk2C8ewpT6yaAk1IKDVG0QfS3bw1vnDPeQJbyWR8it+Mo0fNt6l+KTPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VTi+CFM3;
	arc=none smtp.remote-ip=209.85.221.72
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07C7606A33B
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C07C7606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VTi+CFM3
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4915ba023d4so720782f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795009672; x=1795614472; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zquXBrMDSkgmhzVSBU9n1JfbEE6tjoTWMroKtZE+aJ8=;
        b=VTi+CFM3r96ENufgUf1BqcL6oF6r8eAjhz50y8tV4dBbtCWsQYlSrWVc9xQKUvbKC5
         X0BcAjgiGtS3p4ezRH9yLP/L9XR75gtjGPDGBmtt3X2mgFIixhYAq1jItVf8T+1KTiU3
         l6yL5B0ruXP09ejvczDzmfWGsnLQaV4/PnsONB0m1ghoqerB4pMFY3Af41GgmVFXMXNS
         YyRkYnog584Oy8leIF/0nbwK6L42giCZD48stK7Q0sucf50uEfN2R33jDMvq6mo9oW7+
         d2lYNXLylRILKoJCz4dRzSTo4D1yJEIUE31B8I8sWZQsqixGdzViclQLFTF9cd+TwY0R
         ml4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795009672; x=1795614472;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zquXBrMDSkgmhzVSBU9n1JfbEE6tjoTWMroKtZE+aJ8=;
        b=CBno50kSRx4Q0se46b9sPiWydc/WPTAnneWnApH8yv69FKAz8pFaPKVNVnzfQweGrM
         B+eku1JlCKwzULDhjraBtrqw+HwAf+3QyGtrl4AAFLYDlcKGikTsuQjkUc7Gte/hHOHC
         peX8kI/G6iEu/v4blASJ61Iv7/0LJNbzgoVtVnP2+J7wrElUGZnHgFluUfuHT9D5xbQD
         sLNvT0c7rIRz98spU5zzAOmvkcyc3uEyn4QBbXUA6Cl9KPD0L80S/VVL0VMCFgALo5Z2
         agnoCOH/+SzAudSNm+QXiZ+ruO7kfDqH0YEsOAIk9DkUBvqliIo3AEBjJ2q1ntk5vC3h
         bSVg==
X-Forwarded-Encrypted: i=1; AL+hErGMqXK3iRQeb179xnvRQKKGPVwLlheixr0CAyNvIU1HFp+4Z2tWFudE2CPmOd6sKeCfAYD4VTeB13vslzU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Rlx6d7EeE8P3hUWis7gXUuLb6lHoD3cdNLuhMhUiO3piFoefu
	PdBQNg0bV2PBbyEHOrzLpfQ12fkvvl/S/SAosLvpYbF1JPrveD+ilO5fHbfzUlIcYX9/YVtdw+n
	omu6/iEfjJ7yP9m2vqg==
X-Received: from wrqt12.prod.google.com ([2002:a5d:460c:0:b0:4a4:28a2:fcf9])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5d84:0:b0:4a7:150e:cfe5 with SMTP id ffacd0b85a97d-4a7150ef4dcmr3970052f8f.42.1795009671601;
 Wed, 18 Nov 2026 05:47:51 -0800 (PST)
Date: Wed, 18 Nov 2026 13:47:50 +0000
In-Reply-To: <20261013-clk-type-state-v6-3-a5e9977b3509@collabora.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261013-clk-type-state-v6-0-a5e9977b3509@collabora.com> <20261013-clk-type-state-v6-3-a5e9977b3509@collabora.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261118134750.658250-1-aliceryhl@google.com>
Subject: Re: [PATCH v6 3/7] rust: clk: use the type-state pattern
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

On Tue, Oct 13, 2026 at 02:07:42PM -0300, Daniel Almeida wrote:
> +    /// Drivers that need to change a clock's state at runtime (for example to
> +    /// enable it on resume and disable it on suspend) can keep it in an enum
> +    /// and move between the variants:
> +    ///
> +    /// ```
> +    /// use kernel::clk::{Clk, Enabled, Prepared};
> +    /// use kernel::error::Result;
> +    ///
> +    /// enum DeviceClk {
> +    ///     Suspended(Clk<Prepared>),
> +    ///     Resumed(Clk<Enabled>),
> +    /// }

Nit: looks like this doctest missed the vertical import style from patch 1
(and `Result` is already in the prelude).

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
