Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108998;
	b=bBGZ6H48hjBhYm8+5b5bLIy8dtEdKt4HtBA2z1Ln0/rFwqghmehfIcPBTXbeLagGpk7E
	 ryyEJhprN+aUQxgxuDlcOoyWmctHTphRUIxwFF+VnD5WuLBO7oXTgRyI1QXe5kzq8QxAg
	 fNSB7GoEmtZWTA6mVsUeHByjWW9HLXSrHCzaXjBjQCOu0rh0rE2470lakspmREv70MeUg
	 hTQEXqVwkL2Hp4i43mrxuffG2J/v5kriXEus4MH8E9lc0aPEX8Lens4ixsxidv3812trO
	 YrDwxXnf1kclOchT1m76F6zvBhGhcrrphzx3WVUfiGqzaGGI69Kuin5rGL+O1AreLBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type:Content-Transfer-Encoding;
	bh=dvwpM6x9UyT5LtxoyNzaw4LyWCYizJm0AMP5Y1DvOYE=;
	b=cE7wgVhWB5xwYQDuPdUI19ivQUPUCvrnWctEQiChzEFLDJ013YQlFxsz778D67WRtdFW
	 1xivVjq6p18oYxA68yKr3ISDLJxc8QI39o7Hdsmioi4R/oldJ7U/Q9JjHEBKNOvWNHElk
	 J/PstlPOgaOPEx31qKtbagtmbdUAkFFgPXKB0PMNTs7q8aGsZ8A1aqytXXeKRKNp7NAX4
	 Ja7gHvQX3Q+Bq8BVHwcWx+J0ea8sHBAVgdz1EBN//9m71/3Evz9W4Q6Iz10S4FCnwkxJ0
	 8pNGCKd9Emr7nZE9hPvEgTbPL4VpIQ3Y2X4urZU9iBxrb85f00flMNpcAeJFppWAEUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lr2mE5V0;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3506E606A33F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:23:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3506E606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lr2mE5V0
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33fb4680717so5754821eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795108996; x=1795713796; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dvwpM6x9UyT5LtxoyNzaw4LyWCYizJm0AMP5Y1DvOYE=;
        b=lr2mE5V039VB51Vsm/jWl3rrHr6VYkhtZ435HmeV3b+Q9iIig7dYr9Xdhv5iThmAY0
         7zu0pGrVBW1+tc3zOhqWk5nmnfUibifLRaPn1romfsmuWWzM/D0s0xLBxOOFjuU9kyzp
         gDXa27D5drpJ4btnm9hwGVOANYEOeaLCotZME39JJMC16/0ALhFKnRImFlvvReJpEsXk
         LLyh9mIylJB8y6EPwpwPQwrwAhyZG6de4tHE10z9suIJdUjfV2gyZa3/n0E6HfmLTO7o
         90udpZZM3kODzi4ET4fDk/bufnAYXhZfcmqMB3Fk9UZnNsOOO2Fyqvi8/uaLJ29Oz6ji
         3lCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108996; x=1795713796;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dvwpM6x9UyT5LtxoyNzaw4LyWCYizJm0AMP5Y1DvOYE=;
        b=wvqQvVFeiqtayIUv1YO/LdC1tFSp0g11ogC84Q2qqH0OjIniSrAsHZnkuec6/MBEB/
         N/zPiU1STtE6uVFkDzByE2iQ+HYBxiYZEV+Le7pd4KS32GouVQHIy4D+N4svHoRNO1g9
         XqASA/FaoUDgE+H2WH/maoSQcks1rH2k4NUDUX01MDfIDS5PF5b2qoeFX0Ngcudbey5R
         A2PmQCUJpysJ3tSy2zshVQOMy7n65taOrRcXOsSomqWqerStEZkEQeXqoJfcqKIK2P39
         nY+uWz5xGcaZvM4ojmAnh7ZgjlT6BXzB3ZRSpEA0ekHRKfhFG4K45mj2hvLlLGM9KPKI
         MOHg==
X-Forwarded-Encrypted: i=1; AL+hErFG72+X+eAe0NI5Iwtu83zosOPigH5Mzni+v4w0Lq6VnZT0AesdyvXHROZAsiCZj6TWaVA3hjzrJUzYOds=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hD7Qb2hfCeVeqW4oCaQ+kRmyr97unhRb9Yxex6eA8KTI/s28h
	w0fIygO5Xyvua3jG2WCNkp8VGM5N9LakFdnTCbKGl8YWXVTN0EAE5BJS
X-Gm-Gg: AZFdTZdW0REpmyy5Bg9xkkkekd0FgajlQbrh69ne0FHFud85q4DFPZp2bEEI3i01CF3
	fj7/xHbJLAWx42NbuFxIpoyoGqjQT7t8PY9ocnzKEzaDWjD1yLeSFHpwF3yuHhw2yzN14v/lADU
	lUXyZU1NJCoFZ/7SGQgPrGwplT4fpClVLrKuhkWFIL+Hphq4f7uuE1PBy7Hd8k5hSaeBUvotIQr
	EV/2KQsnFdV4/pagi3Ta3y5x5xihCCDZpPC7l2l/Sjjy8hLzn6D+UoSoRTS7ZHispRK4YUNWMz9
	SQ5KU/WdYqzLCv3yFLeenXcpymo81IBPzlcDzmXQg1z9bW/pHebeWF8htPFIV3LaKGIW4XLOl04
	QIf/cAmktuYx8UqkVP7CnwfAM7LOT7gWBvbnCfuP2+ACN1IFjS5ZE+9nEt5xUOSSO5Vg/ziIJL7
	Bg9P44l5ymUHGwvYzaUs/2zkkHuiu3x5B87ovfzHRRfc9DCVK89ZoMoD/saqXmzSyWOE800uEgE
	7dr1uteBnrVArAUXylTuA5F6sj2zseANG2479ivgJcqSn+9AuFvEJ+WEdKtPTsriHtMhpvy5fv0
	pFzgibXKMFBjR/er86n4vXeZA0VuhxMcsl96HKIGjSVKi4uq
X-Received: by 2002:a05:693c:829b:10b0:383:a0bd:275a with SMTP id 5a478bee46e88-3856e947850mr47370eec.7.1795108996234;
        Thu, 19 Nov 2026 09:23:16 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm265231eec.26.2026.11.19.09.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:23:15 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@infradead.org>, Thomas
	Bogendoerfer <tsbogend@alpha.franken.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
	Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shrikanth Hegde <sshegde@linux.ibm.com>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: [PATCH v3 5/8] powerpc/mm: handle highmem pages in arch_dma_prep_coherent()
In-Reply-To: <20261119151520.2383226-6-m.szyprowski@samsung.com>
Date: Thu, 19 Nov 2026 22:45:22 +0530
Message-ID: <33swlp3p.ritesh.list@gmail.com>
References: <20261119151520.2383226-1-m.szyprowski@samsung.com> <CGME20261119151531eucas1p2be2ec1360d1d94c80b200c53b25f292c@eucas1p2.samsung.com> <20261119151520.2383226-6-m.szyprowski@samsung.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Marek Szyprowski <m.szyprowski@samsung.com> writes:

> arch_dma_prep_coherent() performs the cache maintenance on the address
> returned by page_address(). On 32-bit powerpc with CONFIG_HIGHMEM that
> is NULL for a highmem page which is not kmapped, so the flush would
> operate on the wrong virtual range and leave the dirty lines of the
> buffer in place.
>
> The generic DMA code may pass highmem pages to this hook:
> dma_direct_alloc() handles a highmem page returned by
> dma_alloc_contiguous() by forcing the remap path, which calls
> arch_dma_prep_coherent() on that page before creating the uncached
> mapping. This cannot happen on powerpc today only because it does not
> select HAVE_DMA_CONTIGUOUS, so dma-direct never gets a highmem page
> there, but nothing in the hook's contract rules it out.

That is correct.

>
> Use __dma_sync_page() with DMA_BIDIRECTIONAL, which the
> arch_sync_dma_for_*() hooks already use and which kmaps highmem pages
> one at a time. Without CONFIG_HIGHMEM it does the same
> flush_dcache_range() on the linear mapping as before.
>
> Fixes: f2902a2fb40c ("powerpc: use the generic dma coherent remap allocator")

I don't think we need a Fixes tag here for the reason you quoted above.
I’m afraid that adding a Fixes tag might cause this patch to be
backported without the previous patch, which would result in extra work
for lowmem pages on highmem-enabled kernels

I think we should drop the "Fixes" tag here.

> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/powerpc/mm/dma-noncoherent.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Otherwise, LGTM. Feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

