Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081840;
	b=tRbnVG5wt99V4Qv1AgkD1MZIa1UIC0PmsACviJi3VdfkkeOz+AfWtrNFBhkG10gAGgS+
	 pdSGk4qqbPxHiFELOA6GEeBCcsa/wpw8ViYmUZBrNGYfJlOxHHo3zbpbNWx9DQcoDu46O
	 aTqp7g+jFsjpOy93srTr6DURZZvpV4ztBza+2mVZQlCUuW8VP8PIgLIz9yEyTyJIVDUhT
	 ZfWoqxnVdcOQ5u5h6hmc8Y8Hp9xbmtTBvUtrrFPEoG8CPhz1wFD9v4V2mkqc19Ulnv9EC
	 Wx1V8ULhktkYovwMy6wMfcptdDJiIx/PNTg9pufUimhMY8vFJexLWO/oefrMyWzccmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081840;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=HEoDeaJTImMBawubpaGZWjudv+J8A154zaqaDyONBtM=;
	b=HQiJHtljhOLUE5a/zZPXkcgiWpo387VXAvhlB1diAeVfJKzR7vHzCluS2PQTjC3Arncj
	 3sFmO8hHLUtDM1WC58lGnf3gDxdkm0KZwZSwfbteTzuDaJnNpE5Nuilw50HTy7891pY67
	 56UKZgNoLmS+Uup/gflf1xdzRXqFqrB9sl3JhQVI2Y9mIqq4V5eoJ1zm1UJy1/tmwS+hy
	 ieXfvaTWTKmi68dd21baZJSe0/C6ymGdUYOmYVXXqrBGAaT/i4nc2wZ8QFgjmfc4P9sOn
	 i6gsUVcjlnEcgXhIkiopEVOX/eiIm+niPwZ22MMp1be7yZg5bbQ+AVNTquzP5AKqfEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=iPZwjHka;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C02606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6C02606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=iPZwjHka
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 28BBE1A170C;
	Thu, 19 Nov 2026 09:50:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E63F360237;
	Thu, 19 Nov 2026 09:50:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5551B11BC3329;
	Thu, 19 Nov 2026 10:50:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795081833; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HEoDeaJTImMBawubpaGZWjudv+J8A154zaqaDyONBtM=;
	b=iPZwjHkaQA8GvDXb0be4rEpBVOPWczQwuQVidZe04kZ1axMziW8ctBFUrb6lKv9SpDsox+
	8p/LXCvtERWx05CSoW44NDPEkPGteJMPrZYcSeROxoaS2aKaq4zOvgWyeQ+MHw1Lhj53bv
	E2sU6AD+k+0FEapkgIlQBYJQo/nlPArdRVqfkcVZU+nY6Q7K7ET2iclpyL+8PhLnGNZnd0
	mX1iW4YbeKLFFJ6um3IqO/JoIptnDGJ+CUhS+XesmrcxzCir33sVIP6NxUc/3GfDvhuotT
	aeweWW4eGBhj5gXv63nxTWdKWA9nwsCfjO1VZRsm0e+OYKKETJ3k3YMhieR6+Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "ping.li" <leeonion.muyu@gmail.com>
Cc: richard@nod.at,  vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/1] mtdchar: kvmalloc() for large read/write buffers?
In-Reply-To: <20261119090055.1255028-1-ping.li@horizon.auto> (ping li's
	message of "Thu, 19 Nov 2026 17:00:54 +0800")
References: <20261119090055.1255028-1-ping.li@horizon.auto>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 19 Nov 2026 10:50:29 +0100
Message-ID: <875wxtf8uy.fsf@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Ping Li,

On 19/11/2026 at 17:00:54 +08, "ping.li" <leeonion.muyu@gmail.com> wrote:

> From: Ping Li <leeonion.muyu@gmail.com>
>
> While investigating a throughput regression on one of our platforms
> (long uptime, fragmented memory, large read()/write() on /dev/mtdX)
> I noticed an inconsistency inside mtdchar:
>
>   - the ioctl paths (MEMREAD/MEMWRITE) allocate their bounce
>     buffers with kvmalloc() (83208e106a8e8),
>   - but the read()/write() paths still use mtd_kmalloc_up_to(),
>     which halves the buffer size until kmalloc() succeeds.
>
> The halving behavior is not a correctness problem: the loop in
> mtdchar_read()/mtdchar_write() makes progress with whatever chunk
> size it gets.  But under fragmentation a multi-megabyte transfer
> silently degrades into many small mtd_read()/mtd_write() calls,
> which is visible when the low-level driver cost scales with the
> number of transactions (e.g. drivers that forward each call to a
> remote controller over a bus).
>
> This RFC proposes to align the read()/write() paths with the ioctl
> paths by using kvmalloc(), keeping the KMALLOC_MAX_SIZE cap.
>
> The open question I would like to sort out before submitting a
> proper patch:
>
>   How concerned should we be about low-level drivers receiving a
>   vmalloc'd buffer?
>
> Looking at the tree, most drivers only memcpy() the buffer, and
> the controllers that DMA directly into it (brcmnand, gpmi,
> cadence, atmel, ...) already check is_vmalloc_addr()/
> virt_addr_valid() and fall back to a bounce path.  So vmalloc'd
> buffers are supported everywhere today -- just slower on those
> controllers.  With mtd_kmalloc_up_to() the same controllers get a
> kmalloc'd (smaller) buffer instead, so either way there is a
> slowdown; it is mostly a question of which one userspace prefers:
> few large transactions through a bounce path, or many small
> transactions without one.
>
> If the direction is agreed, I will follow up with a proper patch
> and numbers from our platform.

I would be curious to know how this gets faster and why? Because the
preferred path is obviously via DMA to avoid keeping the CPU busy for
such transfers, in which case you have no other choice than kmalloc'ing
your buffer for the low-level driver.

I am not generally opposed to the idea. I actually think it's best to
have a unified allocation method if that is possible (without strong
preference myself, but perhaps Richard will share a more educated
opinion?). The main problem is how to handle the legacy cases. Typically
Sashiko raised that some devices use __pa() over the buffer virtual
address, which is absolutely horrible in 2027. Those will have to be
fixed in your serie (as prerequisites). So be aware that the series is
gonna be larger than what you expect.

Ideally, I believe the low-level drivers should tell the MTD layer
whether they expect continuous buffers > PAGE_SIZE or not. We could
therefore have our own devm_mtd_kvmalloc(mtd, ...) which attaches the
buffer to the MTD device, tries kzalloc() if requested by the mtd device
(some kind of mtd->expects_dma_bufs boolean set during probe, typically
based on the availability of DMA callbacks), fallbacks to vmalloc()
otherwise.

Thanks,
Miqu=C3=A8l
