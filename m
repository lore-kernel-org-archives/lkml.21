Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795270374;
	b=Gl3CGd4huLOVomWDjNvJjMgbPtaCMUluByaXtyTJCv9U5GmKTCJ3VNejZ7OZGlpHVtb8
	 L3sd6RZJMgUeqAJXlmXtxZui6jnpuiMBXe+rtVW/hqaX1+cdVM0BbA/StuJxbRTZ9mrdP
	 hBdcRYK2M/cW+K+qFvO3nQhWAcwty4c5KY8gKgc7qdI/Jq7aUMBaZ8JWELpAKHHFOsAey
	 VS7cWpXubCwcZLSxVHzgJ1c54YMANaHbpXhWUB+ZmPkrGFLEGCM2MVDkA3MFNLyqa9TlJ
	 5uajFHbTcFlKzgzOgRvnQzhfkrcmJfROoks3PG3skHU3WPLxDCYV1yWrJRwaNRpV55w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795270374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=PuHKHlqLNR2MksId4LLRNrhrnwLo9yVhdzo1ZqEJWls=;
	b=Q1Fhsv8BS2h1SJomaKzkuglQIQnKN+ey5qsmR53HyJKzVsqQtWcbk3yBW6xNEMz81KbP
	 wrY0Bau+JDCjkldBux6A9b/rVbWCAGuX1bsSa9hKXEyfI+AfwTKuRxjtnG9IT8+Khak8F
	 HgGztT42e9cBpXKqxqoFmiTZynjzmJEE9BYmlrYYAcP/bJdBlSzuq5FXrl06igln72p0G
	 TmLYPtZSNyOlqUJvuPIo3KUKgAiR2f9Trb7ue4/7NpR2GCjHWR1jUhaCB2W3Oi0CWYJAs
	 lTQzK8aVZVoFgUzTlKloc9HcsVbDWa+xhKzQjspQ2LzZYKbjvmtD0wFMIlMf3zr/pIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AjadA13+;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE610606A68A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 14:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE610606A68A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AjadA13+
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4b9fde3044dso12890455e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 06:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795270372; x=1795875172; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PuHKHlqLNR2MksId4LLRNrhrnwLo9yVhdzo1ZqEJWls=;
        b=AjadA13+1JWdiMR9IBnGjh6jjgCZzjeI67CBHj9DENQCFoed8vlm1ErurhrjpO8ygw
         qIugUFCaI6UDjd7BVvmv5wZKQ5S0bOn9GlQvJkIRfu3eJcqTnoyAKAwGb6WLMFvsA/Zx
         bpJ9IhnK6R9aveDR7iLdMACp9V5A7AGK35wAQQMXPTloMpTVlODxEb0EI1tpBA3yl33V
         /x+NBWi4tXLbMhWYcCk97klit5X1GzoCroDNjS3r/HW0OF3t/DmynpmsGtaX7+Rd0b/k
         pylgQgKO8E+PQjLjSL1H4snABZMrHiUU9Zsad+jic1w14vBsuDUCZJPCLthjyHcwVqAB
         jS1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795270372; x=1795875172;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PuHKHlqLNR2MksId4LLRNrhrnwLo9yVhdzo1ZqEJWls=;
        b=Vl1Dryy1Ip6FbtJ29oMnZDN0KV+nuquV4oBCTW2Wkcus4OaF/ggUzyM6j17jFlg+3m
         3VlK2DuDkK9hCuZ6Q/KMFeGGldAy0gVrUhtUDw1ZZx9Gwf8dFFBQnPRcfjhtc/kmCmcK
         pFrKT1iDSnzV2pVQIuOD/PVoyyfQpqqsbYa4E/E2U9i7LgmbmssoF0+ZxYVIdJD9oLPy
         VQEHTYaH6YEVNzrJJtSlxT3aP4qslSfom0X9VMf2yh/fhuBBB/d27jx/UrORr+HxYTIv
         KDWlKEdpOxW+9IIbWEbqpNX+zzINiK0ZuUGyDx9izXLSm9XKhgACYPoQDmx+t6PwE/xh
         /img==
X-Forwarded-Encrypted: i=1; AL+hErFJzDf4wTHtQMN/Nm6pIGRYrYfeQHCKitfitzCcdiOtdGzIWPUuHXA/cknIPRkzRv3q0aVLH12aUQ/SJHg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WECv5Ms8sMG1eJ4UET19nsoMNYQVjkl/SDI7vg6UY4WmaPJ2N
	3b+j00FIlJZH4+ur1d87XEyzV5ybFq7dECSyvCtmcB1eDYucwWoxItLDInd32FBZu587EwHqMap
	LrD9C2DLU42KG3zWk2Q==
X-Received: from wmcz23.prod.google.com ([2002:a05:600c:c297:b0:4a1:e780:89af])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d0a:b0:4bb:840c:72f2 with SMTP id 5b1f17b1804b1-4bb889323a1mr136801365e9.25.1795270371975;
 Sat, 21 Nov 2026 06:12:51 -0800 (PST)
Date: Sat, 21 Nov 2026 14:12:47 +0000
In-Reply-To: <20261113-tyr-reset-impl-v8-1-2ee298ac9808@onurozkan.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113-tyr-reset-impl-v8-0-2ee298ac9808@onurozkan.dev> <20261113-tyr-reset-impl-v8-1-2ee298ac9808@onurozkan.dev>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261121141247.142001-3-aliceryhl@google.com>
Subject: Re: [PATCH v8 1/3] drm/tyr: clear stale IRQ state before soft reset
From: Alice Ryhl <aliceryhl@google.com>
To: "=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>
Cc: Alice Ryhl <aliceryhl@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	dakr@kernel.org, daniel.almeida@collabora.com, airlied@gmail.com, 
	simona@ffwll.ch, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, boris.brezillon@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 05:32:26PM +0300, Onur =C3=96zkan wrote:
> Previous reset may leave the reset completed IRQ set which can make the
> poll return too early.
>=20
> Clear the IRQ first so the driver waits for the current reset to
> complete.
>=20
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>

Applied to drm-rust-next. Thanks!

I added this tag when applying:
Fixes: 6ea52b6d8f33 ("drm/tyr: use read_poll_timeout")

Alice
