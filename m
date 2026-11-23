Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.160
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795440566;
	b=4fuNQX1W+IlfVD6rqxQAYXRYw0sOurWmlRtteAQFoghuHMTlQGBJywbZgd920Nveq0qO
	 1zHxn/+u4U2z8hDNbiO+mRmQa1vZm7R9QDAI5fLZRLk3b+gV+RsyfFdZedRae2K8TAWaA
	 V+x0/CJnh8WCu2uo0Zo/lh8htNAwhWd3NmOR8lrxxcqDlwmLWRFZaXqPIeynbBMk/tMLM
	 Zf5UfQW0LNtcszBGZTFfDcRUhIHDLNjj3DNv6hgGK7roCxJFKN+z8bpsONjdElJBNgZyR
	 Fmg3qDlgNyn0tFIONgIg5ugofriQmTCaaedSYJxCEZ45QxUY+mp/lnyXxmlTZyxI2Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440566;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=7NlW+FgjysmHMnzkxFKX17sDt3W0d1ei1PekI6+t+P0=;
	b=f4IT7oC6xf1iAVJ3GlCtEzC6x2Vlrmb/5fQqAlEw8SgjyIw+WIFNHBEfWN/UWpzo6xHH
	 kCtq8dE6uwNVyrSbxijxIVGqtzAbojUgapX96A6xkAAx0wP+9HnekxdXFxDdVDrAYdUZv
	 oJbe0rW2oHQSshCmxF6j0ZIhVo2zVRrq6uYqw+eIpUEo/mrFe/nCIweSoYL6tbej/raqy
	 2A0ckUZgbe/9ubamkclp5n7FZFbgoBHL3EpOYLTqQAzcvYJjZe4uXth/74/0xs6Gl/thY
	 5leU5lrUvL2ELtUxhDEFeP1DzhDjn8eOjsRHGnyXjmJrd0F/VCpWI2yEpiiOFqxHq9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KLCDN3RR;
	arc=none smtp.remote-ip=95.215.58.160
Received: from mta1.migadu.com (out-160.mta1.migadu.com [95.215.58.160])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B3C606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:29:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68B3C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KLCDN3RR
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=BqxPQ9dHVKr6euzRtYVNyX6SshL4LBsKIsbxv3eX7kk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795440563; v=1; x=1796045363;
 b=KLCDN3RREH38PYL4wAUQgbojvujEeO8IUrvD+1Sw8IY1q5iA0tGh+mbpBjzfqoCJKo/fNyHB
 wI0wYwoemMvK7SjRCGfnwcITjWogMuGOMMmB2wfb4RpijMKQnk3pNdJ29zF7YxhwG85hAssCioq
 KIvOUSW+aHckndLl6J3rcDxs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5158886feeb44b14;
	Mon, 23 Nov 2026 13:29:23 +0000
X-Mizu-Trace-ID: 5158886feeb44b14
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5be58ad9600so10956e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:29:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGjyk662g+ET2N+MnWztsNG1KrLlJvuO3dZt7klllw8ajHgQ2cv7u1iW4SXBQwLB5aDkUin9V3KHTzwsrE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/bFWxFp+GxZOVbZTkfFTSDFpx1CkQqv4qw/yjCcQ958Lzwb+2
	+M2Y3JfF4JjEdPbYQSEDg/aCZW76i0tHD7HDne3QHlRQKRMDK/xXqhcy0Ibl+wK+yCXw7AqT4Qa
	7EISokhlYn14SQVr7WiB2wfzYO/28Qfm4+zXjpPDI
X-Received: by 2002:a05:6512:124e:b0:5c1:a93b:13c2 with SMTP id
 2adb3069b0e04-5c1c8276424mr228955e87.6.1795440557447; Mon, 23 Nov 2026
 05:29:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116192933.3266502-1-fuad.tabba@linux.dev>
 <20261116192933.3266502-5-fuad.tabba@linux.dev> <86jym3zoq4.wl-maz@kernel.org>
In-Reply-To: <86jym3zoq4.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 23 Nov 2026 13:28:40 +0000
X-Gmail-Original-Message-ID: <CA+EHjTzOf6k3rvcrWK83QTKC98O5cdt8GSMQxc1yBwvv_FftOQ@mail.gmail.com>
X-Gm-Features: Aa3M54rqkkHhCwgMSlFFvyRw4hHY0llS5vEglhNNQ4qWm5RVErUKegxr923W6b0
Message-ID: <CA+EHjTzOf6k3rvcrWK83QTKC98O5cdt8GSMQxc1yBwvv_FftOQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] irqchip/gic-v3-its: Zero ITTs reused from the ITT pool
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Zenghui Yu <yuzenghui@huawei.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Steven Price <steven.price@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marc,

On Mon, 23 Nov 2026 13:01:07 +0000, Marc Zyngier <maz@kernel.org> wrote:
[...]
> > diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
[...]
> > @@ -270,8 +270,10 @@ static void *itt_alloc_pool(int node, int size)
> >
> >          do {
> >                  addr = gen_pool_alloc(itt_pool, size);
> > -                if (addr)
> > +                if (addr) {
> > +                        memset((void *)addr, 0, size);
> >                          break;
> > +                }
> >
> >                  page = its_alloc_pages_node(node, GFP_KERNEL | __GFP_ZERO, 0);
> >                  if (!page)
>
> If we are going to zero every ITT that is dished out to the driver,
> then there is no point in asking for the page to be zeroed the first
> place, is it?

I'll drop it in v3. Until [1] is in, __GFP_ZERO is what clears a page
before a pKVM guest shares it with the host.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20261116110549.1863653-1-fuad.tabba@linux.dev/
