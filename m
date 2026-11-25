Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630675;
	b=o+KpXTAjmel+e+4ay+V3vG83hoeKg2sAdQVxTcr+Lq4fLAIpcMYRKSbySlsxel+694Sr
	 n0bpKsbAz7jgageKjYxFe4XsxMots+b5vucvQfsnzd/Xe/tzl/oqk6w79wm4ysZPFOdmZ
	 Kn2QaIgRafIIw/V4YeANyMGmqJE3QwBah0xfbTLrOcXBSHgDgm+vfDOyysOIZVsGVU8Zb
	 iERDOhcmRxM2cHuAPj/PjN2ARvbDrAsDFkwegtQcGqC+VMp1eCo/aE4OgRVocPXI9djds
	 uGcRJledzDr9GXOSUuJy6BEuhyYVyoQEPIsMgmJT7/6ZWV2CxO0piRLTXriFVzZWKcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=YHLhVtA0M0YnoXZFl+g5SRgT14ajH+S/lGw2ZTmdV94=;
	b=rW+d5SqViT3uxcWeD0ZRdHeca6WabQG2RszGCcnChpRd5EjXXTzdGLlpPicuLw6ew9j4
	 jLYErd7WmvOZro625OTAqIeo3Ck+vo3C+VBZPdJ+/rEIfytaLb4iiMoumBQjHSIXrWIeW
	 rePIBhseZC+eshP4Hg5ZqHyWpME1s3frKwGt2MbV/T/dnwjYxWMu2Vs4kWmMrR/gaWpnG
	 4H71WsVOxHv6wYBTpRAVEgJgoLGrQSmco+Yyb3EEEQwvLJH7Ck5TMvobVk1twFSkxCpXc
	 4WCyqZEeTgGyGLkJjRYxj+Hzg3IZ1Dbf7uq2rghujbY7qvrM+/wyh5qwhcrl339Z9vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KkOMrl45;
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA81606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:17:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FA81606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KkOMrl45
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4b9fde3044dso43593115e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795630673; x=1796235473; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YHLhVtA0M0YnoXZFl+g5SRgT14ajH+S/lGw2ZTmdV94=;
        b=KkOMrl45Ovpk14ILpt4BJIXO9BYTFs2IWZ90yK0DGtWNNYu8P+XeP5IhTdQaDnYALu
         nKXAKJZZ0o5C8JDLoLO8V+wDqklxfhBilI6wHnL8FNSGhw5m9wKFLT0bdKjHof8+qE0z
         BcYdB+SrLvQHXgFiTWdeNAACD9TrHqo2xqucID5I4BWeSUYyslXTGcRmkO1EUooKgNVB
         k6O5TPDSlsT8mOoPm+tOba6uoAmy5lZm2pjGZgOWhrCgjtPpBaNrStoXR0s7TbJNTlYm
         cl+LWH8/0qqoYG0wpHUBeYI6XO82s/B0pyqPU06h31wpa8GpAYR+HQo5cQKGmhROYu6h
         mlMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795630673; x=1796235473;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YHLhVtA0M0YnoXZFl+g5SRgT14ajH+S/lGw2ZTmdV94=;
        b=ZXkJyEDlfXTYuFfx2pT7ni2AFN4avZC2leUInP39us6UTFvxZ8s/duNCDgXUFIDyuZ
         g8zHnF8/rF78mgWfZAXHVLlMYOTrpyaqyQN7O+o9zykxroO+5fTR6jW4Nh7gRHTUqyla
         7dCgN1pJH3rFHlkh4WzpteCUSvUuGrj99uFCbcZ+mLEFeU9uNiMGJz5hWB6eeGyQn4fB
         PGumCRYYstoGjqqiR1t/PBUh/u4yBGAcIisicOLf0pGuXjpMFFjcEd9ZFJeAl1yHMugk
         XgtOBnIMK3aWrHIL2Iau2X5EKhk37xPJaY4/XGb56NYRtLgseq+6SJKUiLAUW7SbMM2u
         TadA==
X-Forwarded-Encrypted: i=1; AL+hErFIBF4Jtfk4UDGEzcW3oM8GMWTOeAikEekhuMqgfXXGTvp5OtYesrU7HAFAiEHr8IdRvluM3672zGfCcuI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lByTfBUw8rhNpJjJR4VaXBwx7TjhdaLUsZLgQD5YMl/Z9yvfh
	cprd7wpRny9VMbIRWn8spQf5/AsER9tIK84H+N+GKk/bB0WISMd46/XWw+lWRSU4o0bzI4E3mLw
	nh+dt5gY6U+GmKug3WA==
X-Received: from wmbz25.prod.google.com ([2002:a05:600c:c099:b0:4a1:e676:5ad4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3508:b0:4b2:3c81:d1 with SMTP id 5b1f17b1804b1-4bb88826921mr365854635e9.5.1795630673419;
 Wed, 25 Nov 2026 10:17:53 -0800 (PST)
Date: Wed, 25 Nov 2026 18:17:52 +0000
In-Reply-To: <5eec17370f67438e43bb1c82b1d6a16b@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119-rust-workqueue-v4-0-707c68994940@google.com>
 <20261119-rust-workqueue-v4-5-707c68994940@google.com> <5eec17370f67438e43bb1c82b1d6a16b@kernel.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125181752.2027207-1-aliceryhl@google.com>
Subject: Re: [PATCH v4 5/5] rust: workqueue: add ScopedWork for non-'static
 work items
From: Alice Ryhl <aliceryhl@google.com>
To: Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, Danilo Krummrich <dakr@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, 
	John Hubbard <jhubbard@nvidia.com>, Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 25, 2026 at 06:44:05AM -1000, Tejun Heo wrote:
> Hello, Alice.
> 
> On Thu, Nov 19, 2026 at 02:12:46PM +0000, Alice Ryhl wrote:
> > Because the cancellation guarantee only holds if the destructor runs
> > before the bound Queue or any lifetime in T expires, ScopedWork::new()
> > (and thus new_scoped_work!) is unsafe and requires that the resulting
> > value is never forgotten and is dropped before 'wq or T's lifetimes end.
> 
> I'm no Rust expert, so maybe this is me thinking too much in C, but
> requiring the compiler to understand and enforce that a workqueue outlives
> its scoped work items doesn't seem very convenient to use. Wouldn't it be
> easier to package e.g. a percpu refcnt with the workqueue, have each scoped
> work item hold a reference from creation to destruction, and make
> destroy_workqueue() keep draining until the count reaches zero?

What I'd say is that this isn't the only way to spawn work on the
workqueue. This utility is intended for use-cases where it's convenient
to do it like that (e.g. because the queue is defined before the work
item in the same struct). We already have another way of spawning work
that uses different ownership rules (e.g. self-freeing work) and that
mechanism would not go through ScopedWork.

Alice
