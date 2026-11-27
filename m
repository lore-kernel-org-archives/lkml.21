Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795799735;
	b=XaT1Rx+Gr4eSTghw5vztWb2FkO2X2ID72hAdfH8MUSBn6xYLPfW2EHKfovIncLTos73z
	 w8dC/JsWOXBH91zGhrGzzYs+DyBS+yPoZooLYaOPLQ1FQqC91IelfAi38wtZ1BFcv6lZM
	 uP624DUJlJZS8BAKfKx/bSv7v/mjSh+IsdfMNKkGfCmzpi3RqrDXTVW1Tfx57nTKFx5mB
	 qbYiabkSzV2mGc3swcQdB87Nl8nItj6SqJEK3rlL+WQV4U/j6AmgjETR0j6ysZs0w9mMs
	 4WL2ttcDjzTl6P4QyVCoioFOpTwHgtHACG5plNTtQntUMxLDONCq3+EPuQYI6WsptdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795799735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=/UfmuLP06BAHAycCguSoDWMAlj8HmLnc5qWwAUzsshs=;
	b=Gzf44K1YSv3tyOUr0muBWE6pMuqq+/ZaFa52HDxOQ9em4l6s/YpdwU6DbGs440CWP4gN
	 NDnBeXT996ifaEJCtPBQPnoziKiWTwT9iaAHMItdMAWrGhAzQrli6jTmBWrDRtcyhceIk
	 7tLETFt4wLhnP0G4Plsk3/81onJfD0pqWODNC4P0sOojPY6yy2Rd02JO/YxScTXDe0OKL
	 QNwI1WSwEs6g60tRG9Cj7KnzRYMcj5Y7SQkGlktH/avwDpYFUO3bNK6TJevSEbRc5rt4n
	 YKVQPp7byTLFio8RuzxI8NzHCpKCoWZvO+DHi1AFutvsO8gjlkSMjjqKyvHx4oAv/ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=h8Z08pXQ;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B314606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:15:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B314606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=h8Z08pXQ
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a1fdde384cso59843695e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795799733; x=1796404533; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/UfmuLP06BAHAycCguSoDWMAlj8HmLnc5qWwAUzsshs=;
        b=h8Z08pXQHuXeva5jFGbGWVRIXlA6LVAQKtUA/qaKGdTo0+oWVHlKRTTUZI03gz18bz
         LjkeHmFWQVcSiLF2q/ZM7h0NE3aNVKut6mqs00TnqgMbpihV8WWcJArbPJGFZ6MBm9vI
         usMgoyrgOL+qf6159TRQCwg0hBTbO95GmQIKtNHld8Sb0HzRhayeJWhqCuPOcXc5g6I0
         2gJwQsURv2Vck7dHGBKhCWv/0FigcQ5kaCxshd2ZhGbYbeIF44398nfRQIYcG9tMRrZx
         +7NmKsFhTm8r4sL9Wm8yqHsR4f2fn2zvW3WgsD14gXQuYlSBnYd5yt4lJT2RExfhVcRG
         RuOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795799733; x=1796404533;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/UfmuLP06BAHAycCguSoDWMAlj8HmLnc5qWwAUzsshs=;
        b=vuXmsyFS5i6il9aPM2rwzdqPuuDtz5PpdjQAIpjnbdM0dIQxtCZjORwCx6qAc/JECg
         9rj7/DIG//A1XTJ7RKKtKSOdvOstYg/JPOXE1l2nLo0IA1chkc/MS2nF4ZgS8RUjqGcv
         Q1cZxnW42OxhfnlkhxziVj0ZNd4+uMSA4kkfetH/XhVTySv87SnelehGCWOqlk3eTKHO
         uQU7yTWW47LlGCobs1WtpLE2iMAOpmwLCL0K8kdu0mlTuIJIGfSz1kZMm/pXrvnxVZxt
         pn6uGUUBmQgEHU1mTBz6yrQBDKw8WgDMkQhQwv+imP69Bk+smVW6oFmfLHuoSKmNxKC/
         w7zw==
X-Forwarded-Encrypted: i=1; AL+hErFqYSj+BsIT6MWzVSEDhjBvPk+TPeCGMB9gwaOa1+W0gmx65BlprUl5TcBT56jT3qLazmv64KcZ8LDSZMs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ylgTRncBeksZQMoLQI1x7jQA7z4s1ScueEngu+SMuEnInZCrZ
	uDyvfvhbIFH4SGpbkcquftc3VLncJO1+kd6i83DSYKN3WZn47ga9kgWOZcxRFHy063pGb6EWvK3
	5IQHjEOyrDevZuc523Q==
X-Received: from wmaw11.prod.google.com ([2002:a05:600c:6d4b:b0:4ae:7292:22a7])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:18:b0:4bb:abe2:bbce with SMTP id 5b1f17b1804b1-4bbabe2bcc5mr96165705e9.29.1795799733462;
 Fri, 27 Nov 2026 09:15:33 -0800 (PST)
Date: Fri, 27 Nov 2026 17:15:32 +0000
In-Reply-To: <20261127124107.1782-1-AeeSec@126.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261127124107.1782-1-AeeSec@126.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261127171532.2097157-1-aliceryhl@google.com>
Subject: Re: [PATCH] drm/tyr: fw: fix integer overflow and inverted range
 check in Cursor
From: Alice Ryhl <aliceryhl@google.com>
To: Bilal Hashim <AeeSec@126.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 27, 2026 at 08:41:07PM +0800, Bilal Hashim wrote:
> In drivers/gpu/drm/tyr/fw/parser.rs, the firmware binary parser `Cursor`
> has two bounds-checking bugs that can panic the kernel on malformed
> firmware images:

Note that neither of these can actually trigger a panic on malformed firmware
images today. `Cursor` is private to `parser.rs`, and its callers already
guarantee these conditions:

- `view()` is only called in `parse_entry()`, which already checks
  `entry_size >= size_of::<EntryHeader>()` and computes
  `entry_end = entry_start.checked_add(entry_size)?`, so
  `self.cursor.pos() <= entry_end` always holds.
- `read()` is only called with `nbytes` in `{1, 2, 4}`, and `advance()` is
  only called with `section_hdr_size <= 248` (since `EntryHeader::size()` is
  an 8-bit field). Because `self.pos <= self.data.len() <= isize::MAX as
  usize`, `self.pos + nbytes` cannot overflow `usize` even on 32-bit systems.

Hardening `Cursor` so its bounds checks are self-contained is still nice to
have, so please reword the commit message to describe this as defensive
hardening rather than fixing a reachable kernel panic (and no `Fixes:` tag
is needed).

> @@ -144,7 +144,7 @@ impl<'a> Cursor<'a> {
>      ///
>      /// Returns an error if the advance would exceed the data bounds.
>      fn advance(&mut self, nbytes: usize) -> Result {
> -        if self.pos + nbytes > self.data.len() {
> +        let Some(end) = self.pos.checked_add(nbytes).filter(|&e| e <= self.data.len()) else {

This line fails `rustfmt --check` (please run `make LLVM=1 rustfmt`).

Alice
