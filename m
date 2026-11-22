Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795337958;
	b=WealLLQChRbYqCXLItBjyz+8ZVCrScQx3Zii1a3qg7ya/66ADiGFkK79j3cupuQU1uwq
	 IiRAm8EiZ1G+F2745NImWEMCG1Hcpt4GpmatoJvgqCzGZ56mB+WTeRqpIoXKuhGhQcnhB
	 SYKT6eHWBxNh6VDgRxjN2wQ3BuQHg9DPZGpZFNveGJ/luU1XO3EOYay0rPpnT9fXmpNm3
	 Hb1J+y1iTs6vUbt3hliUsVa+VMK4hbkiFsnrFIFxatXxgruQ99H6IL/EK/GK4C8N40VWs
	 cWRwSww+pvAhhFmsF5keORTQQVI1D+oxTOLH7LxfMlnZJ69kOSjpEtn98L9BfKWQ6aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795337958;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=G2sUKEpp9UCq//DjZnGDoTE+Lw96P7JUYjiRFoz38Vk=;
	b=Z/Z6rROqiFdC5yEtGtraWHDuWhBzw6GQPxnJZwtS8rC+S2Ry4c8JyFxN06STVugHKl6K
	 3N7EWcAdB5YSZTsEKRTyyd/Jrovys7ihEoF+7riR+JetWkvutOZpH/1kyNMQ+wMr9Jdxa
	 9IGBFV+qAfRNCoo3rEJsXLikx2dT1mZowKJyaqxq2VabJNY7x9axGRTJXpEiq4jAaJqx4
	 kN2KWbScIqge+IwfFV1Jr5amq6gcRhqsiDvEW3hh0lYXlazfclqluymZAnDjHVpUXz5mF
	 7fyRGxVLotyp132icjyNhsLjvXw4TR8cBAoO4ZZhCwKkaHP3RGEK4UMQYLSGV9yud6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="M/DA+iUE";
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769AC606A33A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 769AC606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=M/DA+iUE
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4ba01393800so13974775e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 00:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795337957; x=1795942757; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=G2sUKEpp9UCq//DjZnGDoTE+Lw96P7JUYjiRFoz38Vk=;
        b=M/DA+iUEfZH/RTuJV4mophhfeAOFmY/wKP2WaYyLAjRtxbEjeZ1kirf2SBA88/0aUo
         YSypVD//LfRhnXdqjJNjNX8Fkoh2uYvp2lLQ/EaQMk3TpksjRn/2XUlc1HVrQkRwZ/zS
         FvJwEcIPOXcdw+VLcg9/DWchUzU0IatILZ6uM2PFc8GokZkAX+Zeo3ZfJw9rBv+5Tgpk
         ELcn0+BQdXRghiesPne1hWUo5WCRqAK/9azw9J5g8ah0CDnLRYWS08NIkx0pFm16z8wl
         naRKHqKSYI3B9fdsqf1kAK+p2Hqbxkler90om1+RqtiJW84NmRnYPCvzdhj2x4pLYXkD
         x5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795337957; x=1795942757;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G2sUKEpp9UCq//DjZnGDoTE+Lw96P7JUYjiRFoz38Vk=;
        b=ny+cxBLezZNn0WgoxDd8JzrT7P+ZSX6lnKEuysNxdQ9MPvprtlrmqravYPe9bihisq
         TRomTMyERC7EOUS9VzA99q9fYde6ELPqYZgrW0uZY5atETsu++eqLsgFKkKMVC5Prxlf
         M93WUWFqAyRefmbPIVb7L3HuDTksLCIYy4kmuxEP27+xPvZFlWvmgRfyJxKaggZcnEzK
         P1YGZywG9OvGwTCrHNNcw+gQVoKa+e/Edi45Hb30BXSf7U48uNpKreK0YME+qCy/GZRP
         JDws5L0hvZ1U4cmev305RVPZr2F0Baus9BQm2EZ5PND8yIX7ok9Se8c+xSvGzht0Ya2Z
         eg6w==
X-Forwarded-Encrypted: i=1; AL+hErH6vHTt73ciPzFEyJvYPxWoRXIHmiWAIO4AoqvsGMYMtvFr7iLnq8FLsvJy69NTKWN76iYV054hQr1v0mU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fJgzALcIE47FZU+93RI2LupTOhKgAZZqVcpPmXmS72+jXSTga
	pXrvrnsGbJFMIPpdv3O4/qigIuztYjVPooWvbo/b5UDo+uF0oxmrTXRCxfMmtmqI+nHKpmF2xV2
	LNJxuBBGg4TgwHtFnmQ==
X-Received: from wrsv4.prod.google.com ([2002:a5d:4a44:0:b0:4a5:aaa3:3335])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f0d:b0:4bb:5c97:f4b1 with SMTP id 5b1f17b1804b1-4bb8881941bmr192603305e9.24.1795337956685;
 Sun, 22 Nov 2026 00:59:16 -0800 (PST)
Date: Sun, 22 Nov 2026 08:59:15 +0000
In-Reply-To: <20261122-tyr-reset-impl-v9-2-ed42d8f513ec@onurozkan.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261122-tyr-reset-impl-v9-0-ed42d8f513ec@onurozkan.dev> <20261122-tyr-reset-impl-v9-2-ed42d8f513ec@onurozkan.dev>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261122085915.1094533-1-aliceryhl@google.com>
Subject: Re: [PATCH v9 2/2] drm/tyr: put iomem behind the hardware gate
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

On Sun, Nov 22, 2026 at 08:40:33AM +0300, Onur =C3=96zkan wrote:
> Move iomem mapping into HwGate and pass Arc<HwGate> to components that
> access hardware. Callers obtain HwAccessGuard before accessing the iomem
> so the reset worker waits for ongoing accesses.
>
> Acquire the gate once per address-space operation and pass the guarded
> iomem reference to its helpers. This prevents nested gate acquisition
> from deadlocking with reset and keeps each operation protected throughout=
.
> Clone the gate Arc before acquiring the guard so mutating helpers can
> retain their mutable self receivers.
>
> Suggested-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
