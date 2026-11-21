Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795270371;
	b=Pk65jb/FIaQUTAh47xdUpr8VS/ee7n7+9dWXucireCBtA6oYp9g4GnoOqggT99U/o1pR
	 z1fe7sYdj4jtWvntI9oDQYa/VVpPWFMg5PM5+0C5gt//BS1pkDQw6h1yQewy1fDH9swmU
	 0D0pR4GX23dQGj7WpxU/YTjLU3Ojk1MB8ye2XdmrgLNGh101BeuAEEnF+SUmzJy3P/zuL
	 D7a3ruJjtW+TXJeCn6wY5joY4NJ6tCJKIhAU5EsYNEMUcbG+ZVe1kmFpCcAyZ5RPOV/a1
	 bgHjwXqXkvfMcoR+SeKPrl2+WHXtiihurvKnxWajjics1C4IctKRSXtEFRuAILBYf3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795270371;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Jy6Vcdhv2NcktCCVIrJ79GzBwKeJB8AKRYT9ZAytoZ0=;
	b=eMKiUIEpLESxMrKcixAq+O/FsWhhQtN3YQkI95GOHYWweuhdwoBHRDqiA5IUaGvmWx09
	 B1asMr93Ex6jffmYVicmkD91M+EyeMVXdoOHEV9RWdjXb9sLnVYMB1HQTugXN4fZTYixA
	 TRtARGR0OHtJhpKop+JY9znONOLxum5nVptN7YxDQKFwu/y7IZwlowDhn/dOhlNRHOKnf
	 kq9TIJmKMGUAgJPES2GKdZ+VsXXuQvLZlubUO3kTIDRK97sZCM9Een2ErR7wr4GAX8aeZ
	 trCsO/txDFWr+dJDZbbAbdgUbiZWaHAdtC0rCyFaRZ60FV7WJWqTImYttAbAHoOoUyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="H/zb4JNr";
	arc=none smtp.remote-ip=209.85.221.69
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F3F606A330
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 14:12:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8F3F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=H/zb4JNr
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-49337a224a8so1052614f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 06:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795270369; x=1795875169; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jy6Vcdhv2NcktCCVIrJ79GzBwKeJB8AKRYT9ZAytoZ0=;
        b=H/zb4JNr3JhpSSqDlS59uvRJAhO+co+VqIY9aORfduKliaaMsb81WAYsG/38OdCY9P
         zZZW8u9uVJIH9i/YHjnCcz6jGkCG/HXndpOtMLaiz/d525Lb8wKzkWsamKKYd/IBYiXm
         4864hWN7oSot814FsxJ5M5nhXZ0yn7guXaiUtXzfq36e1l8OQeR/n6kZFcTDwTsgfq6Y
         1RZnAK1LrewpPxCh87Lmz603d9a8Tg98FAEOAnzzbZK/2jLq/It65TJpzA+U3oNrRGA6
         XE0WzbKi69WY9XAIJRtuE+0wZI+g3h3ZBYN/5zdZBAYKWxOd7lIIhFxPxnMtZ2HqW5L2
         0BKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795270369; x=1795875169;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jy6Vcdhv2NcktCCVIrJ79GzBwKeJB8AKRYT9ZAytoZ0=;
        b=srOkX4DlDMuNusZjjNl2HLDygtYFP2cxo1gWAYa/qKtNpaJz9o8NxPYPNqqLUzeJEr
         5kDZizjBVo+IXxLO57hegIvtTxG6W7KgqQl9wHJPlWhaQ6vuwRHtj8uX6BjqZZSPAoDI
         YG9UJGIrfCTZSCMuIuPmhvxa45fgCB/+8AN04U9GzXVTFbudvxqQGKH/Yxn0oiyGZxlN
         Kas6Ma63SknM2V1hlTf24Q3gziH7EcWZy8ag1rOaP2WvTfvcd4jV+dKfDppiD71cgWnZ
         wXcbfeAeqMiOD4zX/3IpoVtUojZcc3bQjoQIeSgBYr5Bjp95XX5GEEOUtC3NsT7EArN/
         2LqQ==
X-Forwarded-Encrypted: i=1; AL+hErFtTOqZPRce80Jr68lzGtnPOUNb9J99iJ0yJHEh6Es0dVHqC0UEcwWOtLR3WVjt0Ff2BNeiMSukUNIXlsU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9i0v3uxv9fiqNmFIPtntyQ62McmNYz6xA7H1WV4fmEfSwlds+/
	Q6kMGdtpd6vPWjMqM+Cqri0Zag9yoDETXN0GRPdoPriCPjNx94D2Afo5HfOlU8brw5VD9fRNnAi
	Q+GOhhST/5rJjmyZotg==
X-Received: from wmdn12.prod.google.com ([2002:a05:600c:294c:b0:4bb:5ea0:79c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:674b:b0:4bb:6847:791f with SMTP id 5b1f17b1804b1-4bb8880f267mr135552605e9.7.1795270368808;
 Sat, 21 Nov 2026 06:12:48 -0800 (PST)
Date: Sat, 21 Nov 2026 14:12:45 +0000
In-Reply-To: <20261020-b4-gpu_info_intobytes-v5-0-3e0c7c93223c@collabora.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261020-b4-gpu_info_intobytes-v5-0-3e0c7c93223c@collabora.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261121141247.142001-1-aliceryhl@google.com>
Subject: Re: [PATCH v5 0/2] drm/tyr: safely write GpuInfo to userspace
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, Jesung Yang <y.j3ms.n@gmail.com>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 20, 2026 at 04:47:47PM -0700, Deborah Brouwer wrote:
> This series makes zerocopy and zerocopy_derive available to both the UAPI
> and bindings crates.
> 
> It derives the zerocopy traits specifically for struct
> drm_panthor_gpu_info, allowing Tyr to safely copy this struct byte-for-
> byte into userspace memory.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Applied to drm-rust-next. Thanks!
