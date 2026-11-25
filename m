Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795643797;
	b=DaZnTv6jnAwXjZKRwptl5TLvEq9D5kaxLKdy8F+0eDUcEg7VuHipUD85jaE9aEKTgJ4Y
	 gFXUucmtISQwDZd/kq54qZOIRdGT6NRxm+TcI23vH/nCdreGdOtdlI6zxejJ673M5ZeUY
	 LrE0HR9OC70SxkMdic3GAeEs1zbsoxx21uFYJi+/YABN32Irt1SQz9WHn7gCPDbllm6nK
	 dwGYx96nq+DVyFJRrHEyMGb7+yp2Ag5b7jbjkC0KdoiJqfYJBMmHJD6GpasX1v0XoUYmw
	 /UTxM/WxMKHYS0cXd0egxO85xvc5MJugdPniUXTNZ402JSfYiPuMs/07sc1pQbo8ZRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795643797;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=9PE68dNtC/k/Esp67FurgmP7IWjKQi8+eTRAEPekc+o=;
	b=XKBvKV8YrBmKmFhSV59YDXvnxyzXQmTkEVJJs+IQH3LXVtB5enAJ2UpouOyiuJmPQCZI
	 ujEG9AVlTqbcNGLGsgN3a38S6qZ50z6IkRjwTnXMe7oSwSuGvXKCiBja3w+pF5NB1l+Dm
	 x4CV1dSDpW7uBwg95NUNcYolk6FxDHxuH3qVBKEIETNssgd1jY13aRrApzhXfBLMM4yvE
	 tk582Bg7mAoEk/1AhMvXtB2X6jCTG7Nw7NstQy1cDuBD3FG2b6jwMtpXVBpdugaE5IJVG
	 B9ViSdijst+MB9BLrWZIwDPauP0IetHVfE0saEpvUUcsRGlOIXLUtC2NpIgg566CoSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jtKQ9nlW;
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF87F606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:56:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF87F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jtKQ9nlW
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4bba856092dso7537455e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795643795; x=1796248595; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9PE68dNtC/k/Esp67FurgmP7IWjKQi8+eTRAEPekc+o=;
        b=jtKQ9nlWnHH9shqOIE+ESH8shkq4cDB8ZE3cAutopwBEXBeYs1Hfo4rhnUnY043n3w
         014kLbS56cZWdmnsWjA27xTwFkIDEyrsoc3MtiP6xUY8wf5KlzG28DxGoxLvbE86gyGY
         kZc07DBg21KhIMk4fdVX+HP7bnvkABeJbdRl5GPSBKLfDES5YNFZ96S11Gc6HvfGteKA
         B+efmGb1PNu0U+e1TmC5/yqkS+UJbPBZyo8PSwDI+HUIf55A8ZCISSGRSl2stIZuIHdX
         AyFmjQZyBDbGuSpOTiFgLfHxPfzw4B6rl2Yweq39iXKtMT8/UHVv4FiJOzdpeYuJoNht
         WNyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795643795; x=1796248595;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9PE68dNtC/k/Esp67FurgmP7IWjKQi8+eTRAEPekc+o=;
        b=r45JL325rKF9erIAloEqUhzNvJr67kLWZ4CaEPF2RXQJkppgQNx8CzztuY1N4l3z7c
         jhEIfu8sj14DatrzZCGHjTJT+e+NSjnH8YuDOGy+sd5TmAzteRMI3JV08UPzGL4k+izP
         FS7lINJeZcjCCwk+SdDasrhA/x4ohPUEjEG1m7yxirifsGT+GBtYH6Ngm752zTvRxOUJ
         U5c4FpzfjTmIufWtd7u0es8SGMUcLUAxBEqHjsY7FsN84WKNwNJWMrnSXgpsPdGBdJGt
         NAXgEVPsrcIk0GOfVPIKDYEj5qJD83ztDavrUJEnFN5kXN7jbaWTV1npD0BniHJDRDFp
         7cqQ==
X-Forwarded-Encrypted: i=1; AL+hErHRfl/LpA8sKsyx7sadWpHDRTzTuLwztJ/LSB1scNT00JnA7vANA1ASSEQ9UZhYEDC8q6g4E7kf+F92Wck=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fuueJ7klHr+dHUWQOJhx/SJVHBBYqYrZbSm/YOOkfiBSAnNud
	skjkGDzysrVMNKzyAyVcPVZCZrWm8qs0arnW+LgImg3i3JERubLeMipUoT3slRorzYoYpdmtY4e
	C71tA3/QdwDjDBlmOnQ==
X-Received: from wrf5-n1.prod.google.com ([2002:a05:6000:43c5:10b0:4b8:33ad:b766])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46d3:b0:4bb:5c92:ce12 with SMTP id 5b1f17b1804b1-4bb88812200mr409757855e9.17.1795643794950;
 Wed, 25 Nov 2026 13:56:34 -0800 (PST)
Date: Wed, 25 Nov 2026 21:56:34 +0000
In-Reply-To: <20261125-b4-va_bits_clamp-v1-1-07e2bb33eb50@collabora.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261125-b4-va_bits_clamp-v1-1-07e2bb33eb50@collabora.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125215634.2399752-1-aliceryhl@google.com>
Subject: Re: [PATCH] drm/tyr: clamp va_bits to available bits
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sunke@kylinos.cn
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 25, 2026 at 01:28:20PM -0700, Deborah Brouwer wrote:
> Tyr creates a virtual memory space using the number of bits supported in
> virtual addresses as reported by the gpu. But the page table mapping
> operations limit the width of the input virtual addresses to unsigned
> long. This can result in tyr creating a virtual memory space that is
> larger than a 32-bit system can support.
>
> Check if the virtual address space bits supported by the gpu are larger
> than the width of unsigned long, and if so, clamp the virtual address
> space bits to this smaller size.
>
> This reproduces the clamping that already occurs in panthor_mmu_init().

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
