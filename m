Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794961630;
	b=pBlgzOyu+t/WsIloIDWmslJ2CCrDYNQxnnjbqZiRYkdo5kpXqaq1xc3HMRLHqziZDwi1
	 876X9h70J0acTM+01IkmOlfxU3ynkBv/vafChDAo/+ucqn/WWFqRJkqc+D3n/5QXOuHWy
	 FoQMJklKhqzDRBMx3qYLH2whtaRPpMVbKVibcK2nU3mFgptfIxCjPzNGVbq2ak3d6Yj4O
	 FrfWTHMry8v1rjGz9/0OJZcEEVmojOkdkS7ZsKwoUL46OQZcR+Usft2bbGnef25b7SmWL
	 O6J/1WeMIuKGHNMnfnJjGC1dmAX6IsqfHE81M4nIctEdv2vj34l657Fdd6WROIjwDxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794961630;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=PsHVmlswq1n5zq4kG8Bif2auVAICBU1MbvOTG3olm7c=;
	b=L+Doi4DxRqlVxfLSdNCwFRGbfIGDq6jnRIU63wndFFlRmWQYcjYLhD4oNL4d8qicMZD0
	 zdfZiWVRoJ5vfMMeARm+vLxOhGom0wO1Um0/+4Zxfs5IHtR36BpfT6R4zwZLA1B4Jj/Er
	 F7kVPndwfC/hXTGmVoZ5o4o6yd4ZITZheONb1xl1N0qy2zokd3UVevs/epzLOKANuaJ9D
	 32bVpK6OAgGrjKaICDkAytI/qpae1UXOLlyoVlOWtXx56A3H70R6jEHI08i9R9XOL+HOW
	 J8J3mKqxphqTL9TOXLygNkG89PBQfM+Nmr4Z7MMZxPN0FkJpZ8lcBzU3BvPUbOn/otw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TJy2c5Zo;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F409606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F409606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TJy2c5Zo
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36f26e6abe9so612075eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794961628; x=1795566428; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PsHVmlswq1n5zq4kG8Bif2auVAICBU1MbvOTG3olm7c=;
        b=TJy2c5ZoUY/cYj1ne5dNZ0SfN9BtHEhWBLat+/aePFMP1eNIu+DPc2r7g7H8aS2AP/
         Zfdki1sUyKwUaBCXTt2YxK5+sFqIiImVjz7SVNrKWy338I9rqrSQT9yA7NQBpqpDVQLD
         LowIGFxwfj0KI4FqUsN86KrnvaC9MEMUswbs16I2NukrFCoREq7ZyZ6Nf6MaJC0sKZxl
         CEaiMriTIcdXA9j3uY2O+0gVxr1GklIJIKsbyaS55vBvEgSHaY3L5K0FzdWfNJ3BChK+
         D4Jf9iBvBOu8xmZIgo66JrAesQXYPg6SrvzGaEyeBOUbOQhyM1CZa9+pT+/C1ITb4rkf
         Ghsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794961628; x=1795566428;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PsHVmlswq1n5zq4kG8Bif2auVAICBU1MbvOTG3olm7c=;
        b=QWvSrVYZGp6Ae2jNZ14sBASeRjWgEGuD8IQt/iPB0su4p4DvXWPmCc6SZ8KpVNCVfA
         bfNpXrr2jt3i6vqgVN8fS6FzZENY1L4qErsGy3Zoz61NB5rn/aIkhiifZ8mbtSoZC78j
         qgA3sa0K7CuMA4ZREcRSUikzGoQy8UdzmJ4DirqdankFQtWw2+dmnPE0hNAca449BEOF
         /ACWIUbWpIKNpkcB0VgjdwZlapuGVAs1YJC+FjqynMkQq8qXqA/hOVR9HvtK/NoRSZaY
         OqJxdcwEP712Jzlhbe7YbQWuX7ds65MARkcgA4htFzBDMe2i9Y00gvaZPWMP7M9p5UNy
         +tBg==
X-Forwarded-Encrypted: i=1; AL+hErHLJmM6qz4LiEWL79kWP2cNcTXpOdJZOhxZvX3WggJiBq1f0ZM92EL9ArA6LaksogP5xabmhf+k8bZf6Vo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8y519IcZyRNsinaUI0SV3VnawC9i56Qrebj49jzTXWJNBGqM1a
	2zCHDirnA5znkcAR9Q/aFzGvkwlXYx+VNBahaUdty7f8kmNc2KL3jU/HPW6naB1Mm8jjkRRf5T9
	Kpa3D+S8uK+l1bCA2Jm8eJNln/aNz8Q==
X-Received: from dybut12.prod.google.com ([2002:a05:7301:e0cc:b0:342:c2e6:20f7])
 (user=chriswiseman job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:7314:b0:381:a3bb:f945 with SMTP id 5a478bee46e88-38280a386d4mr1424912eec.22.1794961628155;
 Tue, 17 Nov 2026 16:27:08 -0800 (PST)
Date: Wed, 18 Nov 2026 00:27:07 GMT
In-Reply-To: <CAO9r8zOtL4t5pwQOE=SAWeg=k2TkhtNXgV6CJJGNTwuTebKpBQ@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <47ed45b5-de67-41aa-aa21-a3ba3479a7cc@vivo.com>
 <anXJ-5_vO7-toSe1@google.com> <CAKEwX=Mm2tXcen-quRXHf1Y2qSHYvpEUe4xiw-mHYaJnRUR-EA@mail.gmail.com>
 <auKqt6b4AxCLziIH@google.com> <aufPMirl4cD7tz0X@google.com>
 <18e4542967ebdd10.3137322e32332e3235332e313736.1dfc41.0000sendgmr@google.com>
 <CAKEwX=MV_xEUvz91pz6uc4qXWnWOUDtXZ2zASdNVOBHBLeA60w@mail.gmail.com>
 <18e4ebf806e937ec.3137322e32332e3235332e313736.1bf52a.0000sendgmr@google.com>
 <CAKEwX=PFdgEbba+H3fEnJFDnfkxCTsvuHEb4numVwJRaiMgwKQ@mail.gmail.com>
 <179384102494.19062.12740032892044628762.b4-reply@b4> <auwOBaRtM9p_Wxfx@google.com>
 <18e529a5ab0738f7.3137322e32332e3235332e313736.873cb.0000sendgmr@google.com>
 <CAKEwX=OUt4=wqDLiPvYuiTnkpuZYnszkuNQScNR93hHhVPRRGA@mail.gmail.com>
 <CAO9r8zMMGem-LTJQseT5xSSBjfr3UX2gzG_ftpw6+KF8m9v5yw@mail.gmail.com>
 <CAO9r8zOY1E7gCYnJZAfKvyHcbj8e2WVuXMqsaPGPsKR4-9itsg@mail.gmail.com>
 <18e53459a8013078.3137322e32332e3235332e313736.12c7b6.0000sendgmr@google.com>
 <avVVRYkIAQnLC_Yu@google.com> <18e8fb5c1c4d127f.3137322e32332e3235332e313736.289d37.0000sendgmr@google.com>
 <CAO9r8zOtL4t5pwQOE=SAWeg=k2TkhtNXgV6CJJGNTwuTebKpBQ@mail.gmail.com>
Message-ID: <18e8fc17375582a2.3137322e32332e3235332e313736.2a6db6.0000sendgmr@google.com>
Subject: Re: [RFC PATCH 0/2] mm: zsmalloc: make shrinker compaction budget-aware
From: Chris Wiseman <chriswiseman@google.com>
To: Yosry Ahmed <yosry@kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Xueyuan Chen <xueyuan.chen21@gmail.com>, Xueyuan Chen <xueyuan.chen@vivo.com>, 
	Barry Song <baohua@kernel.org>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Brian Geffon <bgeffon@google.com>, Minchan Kim <minchan@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Chris Wiseman <chriswiseman@google.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 17, 2026 at 4:23 PM Yosry Ahmed <yosry@kernel.org> wrote:
>
> I would rather drop it right away, but I am fine if you don't wanna
> bother with zswap.

Works for me - dropping it outright is way cleaner than adding a
Kconfig knob nobody wants to maintain.

Nhat / Johannes / Sergey - good with a 2-patch series that just removes
the zsmalloc shrinker and adds the unlocked zs_can_compact() pre-check
for manual zram compaction?  If Xueyuan doesn't grab it I'm happy to
post it.
