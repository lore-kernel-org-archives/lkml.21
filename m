Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795090677;
	b=5Az46v208d4CmvDLn7evCtztde2kjr3VqpTkLAgp2VRCvmAm8d2oABvTYFzNF07fpAS/
	 x/X4nw0baiFNUMmoiS1rT+1JSmk5rg5Jnb4OL3xxMN0IGfGAkOjII5ncT1wr4Ml4tO+5m
	 buDSJgHmAp5HZ4vhYz0sOhW+HBVeWOXkfDCTJPOYm6zamTwPshetV6uw2fwkm1VAkBAHA
	 vc//d9pgcwk6zXxOgOvBmkdB7Y0VdwDlBQCeR3v+KTUa5Cd6mcosi3uYYZxvbMRl+esfF
	 Hh/FgqRoUEnzCnk1rOEuUPFbNdy/v3zXrCx34Wz6wa6wx6niUYTk7e78yRbxQ3FZpWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795090677;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References;
	bh=SsWTDqy6U/s3LdSWkLHVQ7n4MxNSxrVjauJtJeDqFQI=;
	b=Rq0rXdsK6LMsvdu5VbcyhI4/48oBty7KSrlFKc1tE+B7aahgGfQrYN/gj2XgxnUWZ5Cs
	 jeAjD3xV9kqND19OOfzXvVZMLxE5TdU27uhZRm5H5+0EpUBa7zhvp6hT3hTIBFjtqBGG6
	 4Rs7VDnmT/EoC+r8j8HGalsIVmrVYavGwSmWWiz78YQil+6KBCu860ycc5z3j+V4OQPet
	 4xKANCaibS0ORGvjcoTt+/t5SP5/+Re294hh/lz2Ay9qe4fsWSAJOPaPN3RD2Se4m5VTK
	 Arye71mUBXVhi1EwsP2AXNXtDeJ/4ufNbtziaAtYYJwh6tbqPsDwMdSj4qE92q8gGOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wIkQSdBe;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7037606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7037606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wIkQSdBe
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso2738275c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795090676; x=1795695476; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SsWTDqy6U/s3LdSWkLHVQ7n4MxNSxrVjauJtJeDqFQI=;
        b=wIkQSdBeKHGD9OHvdEKRNQHd2doiTGcjmt89soALJ+dPNIjXwxkOGo/m+1fOOXh2Di
         okQfvDHLmXLlrKlJzNFiLW4mI+MEL0syItZSnVg+DhTggqmohwpdB4R0pYXa8IFqchoo
         uMYa0wl70C4+RY6J89nJKTrPo5N8d4BABJXXyapoq18vc4pXBTD1o84dwep/gBQa0uuY
         HlEEi3AoKgmKDAS0dYBSLF/OgrI3Aere8AdLzTjpNhjEN1Lg0oaweukW/wYYnVkvwNZn
         1jrBPBT4vSS3A7i8QryHobyqc9Drlsvxb2IPziQOLHYgW3XG+DTQsRUFAXFwDHnou0q4
         p9Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795090676; x=1795695476;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SsWTDqy6U/s3LdSWkLHVQ7n4MxNSxrVjauJtJeDqFQI=;
        b=u7wBSuPywkt9MS8I0alhR67xti1l0zPyIsG65Bx1/bXSWfjJT2ARkg/aTrTDPxU7F9
         6k4ZxvC2EKTwnCpjzUp8sdOUvv4gtxrKWHdvVYLsKqLlbM+tjpSnbmQhmKwC0o0Xq/nZ
         H7p9g53xHqneNXnbOVdtyjI6AGoRPsluLDvx/IHg5j/S/Pt8wS9YSkDJCeH8bVbMAhyH
         MxmsFmzs1p5t4WbFhjh7MxtcDiAFILOkNyzE7Vv1lkuKHeJBj9NZEmQpS4ylK3PyAgUu
         6KFvTezYXwWvrOvjoEEMleF4pwfMRYVoL/F3AOebUM9c6poQ7GC212mZ4k3LLjm4Pm7d
         EXUg==
X-Forwarded-Encrypted: i=1; AL+hErHxzUPfRNkj/9XDX6UwYPkb4I0gx2saUM1vCWKhhvAfrt1929ekvQbSpcppyLNH9lvNoBbx9rYR361bZ8k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6pUe6Abiy5NOgRwE+GWNV3luDv3anjFIZbKYaUMA0rWpPpbl3
	dAtygeBl86DJD3umWn6vUUTBvBk2XNSVCbyB4TSRdjTduXDIzcYoKde8
X-Gm-Gg: AZFdTZelHBqB+xw70o4mDgAyzGZmQGvoiCR4hbplvSuPditMuCzl3Y7IH91Rab6MQYV
	EldyACP5z4COzM/Tn0AzcI1xLJpnwL1z2J9Qj1eHPY2uISCEwEfhDYqojQWl73zRgMqClMlkSGw
	ZnK4uIYk8JaH7Uk8fVShkqpKUFTuW890yQC+m7+vDsN8FtDW54h2etelCvB+4RNNlMAcBUYTD3D
	RMcQq/Dx7bAV/X05ScjlXGICPaMBxlsO7TuF5OjuuQyvayJY1zGopJsvfYpGJ7pDxT0mRuha7GK
	WfnZo3nNNnzyR6A2Z5ZcUtyUer106sDAIcf73PEG+wlfwyalNH/TmmxdAuf6y0GNgYf79NAIl5O
	z4evPnfAxlXP/tXi7WU8u/jbOWmdQv4XQrlG22RM0JEbGjhS60a7Mz0ZvBgrNRegP+sqvJtAUeY
	4kk27bT7EO0R3ex5iKvGC0BRnloEWe5108mRmarIRH5VoQqo/tDjzoOIhtAvQ7kNhg7N41tHeJ/
	+htdrCZXn4NbEYuSYNWmBo+uNdbdaEvDxia1uE+HDVZkjucTUwlXSnsXvtLAO5j6D6mWuXUzW83
	yghR0x4Yp/pH0x82zPFl+HYF9+APjDj3VOSjUL8+5WcUPMRhTA==
X-Received: by 2002:a05:7300:1c9c:b0:361:1dd6:531b with SMTP id 5a478bee46e88-38281025c89mr5440546eec.26.1795090675937;
        Thu, 19 Nov 2026 04:17:55 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a80bc19bsm17656695eec.29.2026.11.19.04.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:17:54 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@infradead.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: [PATCH v2 4/7] powerpc/mm: handle highmem pages in arch_dma_prep_coherent()
In-Reply-To: <20261110094830.2081847-5-m.szyprowski@samsung.com>
Date: Thu, 19 Nov 2026 17:37:02 +0530
Message-ID: <jym96n4p.ritesh.list@gmail.com>
References: <20261110094830.2081847-1-m.szyprowski@samsung.com> <CGME20261110094850eucas1p1f10fa1473aca341473077f60a088b490@eucas1p1.samsung.com> <20261110094830.2081847-5-m.szyprowski@samsung.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

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
>
> Use __dma_sync_page() with DMA_BIDIRECTIONAL, which the
> arch_sync_dma_for_*() hooks already use and which kmaps highmem pages
> one at a time. Without CONFIG_HIGHMEM it does the same
> flush_dcache_range() on the linear mapping as before.
>

Does that mean, this change can add additional overhead for
CONFIG_HIGHMEM=y kernels, where the buffer received still belongs to
lowmem? (Because of extra per-page book keeping like
local_irq_save/restore, kmap_xxx). Thoughts?

Although functionally the change looks correct to me. But maybe
__dma_sync_page() on powerpc side could use some cleanups (outside of
this patch series perhaps).


-ritesh

> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/powerpc/mm/dma-noncoherent.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/mm/dma-noncoherent.c b/arch/powerpc/mm/dma-noncoherent.c
> index 30260b5d146d..e646256365d5 100644
> --- a/arch/powerpc/mm/dma-noncoherent.c
> +++ b/arch/powerpc/mm/dma-noncoherent.c
> @@ -118,7 +118,5 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
>  
>  void arch_dma_prep_coherent(struct page *page, size_t size)
>  {
> -	unsigned long kaddr = (unsigned long)page_address(page);
> -
> -	flush_dcache_range(kaddr, kaddr + size);
> +	__dma_sync_page(page_to_phys(page), size, DMA_BIDIRECTIONAL);
>  }
> -- 
> 2.43.0
