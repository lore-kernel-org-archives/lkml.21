Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795573504;
	b=C98EAf4ak9pX6y42jhdiY+eYn+FGmBtFoEdvbTEUm16FLVVmIOakBTiUhzAy+H6/2bYO
	 TTvAFVEMr6CTRbmosMM7XhB7aegEP4z5GHl3PmVykg4q03CxIm0Alqqk6CGg58db9JyDz
	 EsGlfIqj6X3aUxKeQMBJWaa94kUeJvgQmnhY4un3dtGc7OtWGz/G9Z0UDUmLgB/GKelqf
	 OqOEKg+2Leiw//Ln0pYQDy2G5kkXqYVJlcX31t2F5U8MUs8GOcbMSs5fJltQWXzCJRADF
	 5j0CTbiLmcVEJu3WGUcXDps0CNQtok7IwLQYjiHNJNrXgI2pbjl+wn1eY6YQrg3fnlw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795573504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=RoVdVJuanm6IY9SbdoTW0HDKXtpUnzxojZdIdcKrd9Y=;
	b=GIk7nNmNjur2ZXr95UC5RtzOR6lhV8yIqf2xz8wj2KxSr/OlKggkw8tD1bQKc/UAmuBx
	 hLepDqS+umtmkBu5SwEtZPzNEjXty8C/2PpYZ318I0mmTtv4N51bpVBds2qD52AAY77fK
	 JrLI3STI/NCfWxarcrGMvC5bpm9Ri2vXu/vE2Sv/y6O34PscH9T6/SUQDqapTpsZwZJhR
	 dSO9zvcGZqoAYo9D4WKFNpAdQBy91ecI2DHr6VeQsVFoIqzvMmmzLNLA34Wjxnh9/1HUM
	 HFMkr0WM8A5sZLaI1LMP0Fq/yyz0cNl9GXPNben7n04TBvA+dpGV40lmHwtoJapO4GQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RDPnUdSz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43423606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:25:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43423606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RDPnUdSz
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3adff684a52so42905601fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 18:25:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795573502; cv=none;
        d=google.com; s=arc-20260327;
        b=BB4tFTPvlJFQgwzbBEityPt0WnsG4HsgkSgBRZBrygCJDfermYF9gp3uWF7YhJB7JE
         T/n4KUZu50hwMDi19ktXg30ILy9DMCdbhO6ZOfgfMo0NtDVPkaXwV3IruhZ3pwTIe99b
         JKe+X1rxPq37vVNreNavlbsXe0MGPRbolsiBnkxDUALQESKDFD1yg7Per2Q10DIQjAlg
         5ZQsJ4GA9XBCDWcXM0u1EV0Yrhga3MHFhWc0b7OZUHVZAif9GIF5sQ6ko5V0r3jmofBU
         HJoqxsMtT33JmYj9KRvl9fJDhNU8DifaiVDohBi+/AuvcqDe4IdYMMiFV2U2q4+YpXiY
         pa1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RoVdVJuanm6IY9SbdoTW0HDKXtpUnzxojZdIdcKrd9Y=;
        fh=XC07xjq04DFqJ9IWU0b9FwHVC1rzry+M/cUeUDxpJww=;
        b=ZK3QLC6nAbWKi37GuG3iLS+yt36/9N4GcpFjz3cOVt8Z7FYojJSoCOKcNa6+jdtIMB
         kwK8AeiXytdHNpz1PZUIJaQKM50ELVyvzH+ACf45bZaHxE6AZ43OEcZyTtu94UvCOsY1
         hhTjKOU6iPpmrJtePUpMvRpKn1pIKLTMt3/c0GLMcD6tLy+Yz7YoSXTT6bS/AwLf2SdB
         m+673ySqgKBP6WE+8Rc89olBxDIjbT+k2RwJfNf7bTZDTj2mArFN5Ogcend+JR882VK1
         IFJRDIhxu8kVYOQPC9eg14vRWoT6jMSLZTPsZcyus3RBuV38D0WFrgylunpwZ7ZvKrBF
         MHLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795573502; x=1796178302; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RoVdVJuanm6IY9SbdoTW0HDKXtpUnzxojZdIdcKrd9Y=;
        b=RDPnUdSzB/AhnrN//N+BqPMk9ZTTXTKqFwy8gyHKdHefO1PpfVCMR6aUyienTzJI8P
         JQGcRjKX+MmaAJZP+B6NKdLw4K1FiiVv/6KY1f/KYSLS45C4rvQa4hna4gHfroEycXg9
         5lJVhz6BETGdhwdNnDbEdLmmRORAdtJpV5iWI7e9M8rr6iI8DHjdVvwL2S2z1QPfiOUa
         Pojb1nWft/8I7O5ZqDj5nnkxRhCwPDxrbDwItFQbwdO2Zaqcq0UY7r1w+tqo2Kg6hLcq
         nCJypzIw9gh4ToZYIVblfw33S8GICrIljQcEyhLP8cllbNWTJ1sIVcj6ZIeQ6W73XNxJ
         fwSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795573502; x=1796178302;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RoVdVJuanm6IY9SbdoTW0HDKXtpUnzxojZdIdcKrd9Y=;
        b=zz8PgqmhGyWAE+r2nevIOS574P8ChZpdOeCejxcg06zUsjO/fLC1ryNJ5JeMOAu2Mo
         SiQb96dtZIre8K7gR+OG0MG4FmDpoCV952QwjhCU3pn/QnEWglDjGrnjuyKJyR/rEzhl
         IMYV41ulb4Rv2QDdM6pYzBgWUzOFYzl85IbpPvbi/yRCq0pY7/SwnN46DmtWxs1tvqIz
         DE8nB3iwIbb4o0zik2I0E/XoLxM340Z/MvrxX6GQd1VYL/iPA7GbUo7irMXtulSm2zeW
         lU6o2Oj/izCpVqa0JLLOebU8JvxitbssBGBqI8RY8bsw2rEqrWIbWF1zZttNMSn8xysR
         Z+FA==
X-Forwarded-Encrypted: i=1; AL+hErHnM8DoQgR1y8fgimSxoLtZ0NGAASvBd/mu62M2YY+T36yBvdbEssFQjXZxNh7CEMl2sbE5ZjYQsGdyK78=@vger.kernel.org
X-Gm-Message-State: APuU4Z/v3oEO36wwmnADJl1vg+sRBY1zd3ZWev8QtPNnK6qr/yzay0Ik
	EHRpRLLviJ0gSNISQ2IZLFNygnThh05cPn/K1bRQ5kqYUVpVFhO5vGx7M+VPPdpYf7ESODs24Cg
	XfCLdnTXbPCzR+XMEc/2AeBcxn1IZGe0=
X-Gm-Gg: AZFdTZc0Tm0yPQKsPbbl6ixBXqciC/mMbOPrbGMc4NdzXq1n5LO7WAWVjIN9gPXtnL/
	UFNntxke4hLykTK06X0ICx/ln6gCDT7TRrzVgQBpQ/6lDSlFTMvJr3zwXn7AtQC8JktlxBvApMF
	rGbk7BDceoz+gEmfuSgIsxxSC8np330q8w7LK0YOI+KF6g6tmwf8ejHNzZUMHXHZLcZlHYqP27H
	c5DEkL9hgU3chK6nlwYX2YksP5mA+Qp3DkT2qsLweEENu3c04cN/VdMM9PCM+ozmVRjH1AYR4rL
	F6DyRZffUKu6mcrvLzPbDuy+vJiovxIMEhdet8RzK7dKv+RQF7vqYTwoQqHjOXtM0hFqb26ZPW6
	i8yCv89fc/4NA6YgxN59x45OZl1CDptNl6inD
X-Received: by 2002:a05:651c:160c:b0:3ad:ff5d:19b1 with SMTP id
 38308e7fff4ca-3ae7b7fbe41mr38238951fa.20.1795573502123; Tue, 24 Nov 2026
 18:25:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109155743.83740-1-muchamadcoirulanwar@gmail.com>
 <20261109155743.83740-4-muchamadcoirulanwar@gmail.com> <179538281024.9825.4132712997497273037@linux.dev>
In-Reply-To: <179538281024.9825.4132712997497273037@linux.dev>
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Date: Wed, 25 Nov 2026 09:24:50 +0700
X-Gm-Features: Aa3M54rxCZafdUbvRb9-vw6Ll7Se68ZBnBVHsI0xIW9ramLI50wU4YKTZItQkks
Message-ID: <CAO26r3Tn95hm8SCEcP13wXE7p+iQpJ0O2n_tyhQvYUTkG813cA@mail.gmail.com>
Subject: Re: [RFC PATCH v7 3/4] rust: add minimal IIO subsystem abstractions
To: Igor Korotin <igor.korotin@linux.dev>
Cc: Jonathan Cameron <jic23@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Mark Brown <broonie@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Shuai Liu <847807867@qq.com>, 
	linux-iio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Nov 2026 at 04:26, Igor Korotin <igor.korotin@linux.dev> wrote:
>
> Clippy shows two issues in iio.rs:
>
> 1. Line 332 -- ..unsafe { zeroed() } in VTABLE. The SAFETY reasoning is
>    already written above the const, but clippy's undocumented_unsafe_blocks
>    wants its own comment immediately above that specific line.
>
> 2. Line 408 -- unsafe { (&*priv_ptr).channels() }, drop the &:
>    unsafe { (*priv_ptr).channels() }. needless_borrow, no semantic change.

Hi Igor,

Thanks for the review.

I plan to use `pin_init::zeroed()` instead, since `iio_info` implements
`Zeroable`. That removes the need for the unsafe block.
I also removed the explicit borrow, as you suggested.

Cheers,
Coirul

> Cheers
> Igor
