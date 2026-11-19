Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795098977;
	b=2NxQHCDhHbHChZD9J6FBDt/GBmcSZ5TGbK9c+nuvwj7SDs/CgKiLgSB7bVkzjx7IPayY
	 r25M9K8NDkRk8mBJqhS85RiuGXK1zWZ0lCT7dsuHWv48fJC0w7SgVALJGa+0mYCxLvIuI
	 mEJr5MexN4JLUdI0QUC9rVKcGfK8boTNY0QVBXtcs/xHQ5L1UAIGo2kpsRUSTV8yQkSZ2
	 40EN+pWC/S0MIvT8oxXhJ5xlWvSGQzJAQJFFU29Z04O3OG7LGtYbXIrlJp/Lml8HadmuJ
	 HXsQ7O8tPCgPpFIJZFxRcMp2q+TOty2JXsyH9P453k3M4TjtAJHmWROGMvO6MDYpSrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795098977;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type:Content-Transfer-Encoding;
	bh=VnF6ja6VhKpFTfNVvE3jU57UL6Hk22nBfY4kDDWDjbs=;
	b=1Y4ZCTeYuFZYl5v1fX10iWLP6J3SGXr2O6nCYsO25nJZH1e6S6Ul6dfmGa7j09XOnhkp
	 guUNgMwhZ8oq8XAhJU4E3k9XBjghLar2fwUcQGpj8ul1LK0qJE7j4TcAhsb7KGmj5nUdt
	 yy8o367xIAFXXQ4MMnN/+6u72fA0UA8sbprnRhIGAWmizNPV/9Q9w5aK8ZJ++h9vTTmJu
	 zZBpwYzpJYy+cfd0JvLQ/qPuQkrPz/RpwQllPVVWVSbadZOUtN7I3LyAQHhfPzU/JUcHr
	 PFSQ9shEIrk5tiPQJus1ZqRxz/amjds0M9MEgNzrqWLMkqkNtvC3YbInuVjzasWyf/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nAjP9YlQ;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B012606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:36:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B012606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nAjP9YlQ
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso5216681eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795098976; x=1795703776; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VnF6ja6VhKpFTfNVvE3jU57UL6Hk22nBfY4kDDWDjbs=;
        b=nAjP9YlQhp87upLUjCnTWUK45A5Zxp7wBMkLLCTB6NgIQ2aegv9kHC2oURGZKk6/JW
         GCHF4AI706JepZlLo/xsRgjQFhsMAZ1RL9P/LM1+7PnvYbCMhB75Zkq1Db+JGi3HiaxS
         J2TqAn3eGZhfHhaEZdSB9Tsyw/lhPG0hYJAhLSA/smdfmPCwbKZ9Y8gFnx2Dyh7O5jPF
         NsbxOkfEs8gu8NOfTs4C/1w865lpJGwcyYC8Nk6lkcC52Bom06AhhSZW4YM1hqAGIhhw
         2AAfa2gw2OFXCK2tPGgWQ2TdgrYQ/us85wRvr6RZXCTqrC8lB6J26j85uOXfquLk1G7/
         7RLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795098976; x=1795703776;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VnF6ja6VhKpFTfNVvE3jU57UL6Hk22nBfY4kDDWDjbs=;
        b=t3DnI4kWKbjhwHNFSu6LGgP1THI1ujgd3tdYAAETXyhCPfeOILlTXsAWAaUsJNROwn
         0obuXI1GDo6L4rW3OEfzOC0Lg7Q8sb4hxeu7ENlMWAvS4PYdZI6vpjXYj83+bPMkvLxN
         jO1YT2GoqvqXGuyEVMkh+7VFwarrD0VmiWhCwUC4ZXf0YLH7qSgSJWzE7gk8o004XKeU
         OnJSN/pszMPvm+eLU6yFDnOFgk7O8eCpitmuGMWE8W/WaIuhmC4xl+R2lmadFXZhGwU3
         S2oK4y/AnY0UHqEf41D7drfuz/1FW9oZxS2rLA/TLl9JDUtH2vvdaBZp9+Sce187456I
         ZHOQ==
X-Forwarded-Encrypted: i=1; AL+hErGuDRu3kRUptnWtF+X1SftQJaJxiX18RFpP77fCt6ep0GH8akKVn42ky7IhEoG5n86uZ6Si0xIgM0lC5wI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xkMRhhH9+Rj12YzxqxNZajmAFMf/JriZPNzxxa6UyJACtLqBK
	ZJqIsx0lgXO3hcPoMJ7ooV6Q5B01u/0zf9+xOIeCsPlhzB8nId8T6B3e
X-Gm-Gg: AZFdTZenykh80r40KPTn9qJ6BwU3C5jFexFldUNq/20HIRNYsC9M77dx1OQ2uXRdVef
	sJgunPEbMn/GSjwhrYnLUQLEQQFvj5jSbs1vXdoa7pMAUzmMczQVG93shUtZ5AaKIhYa6BTSrqx
	Ccmw4eFlDvxd3/Ji6/0uGMYDhkOU/iohhARaFx/avCgavR1Lfe92HVWRvFTo9kW9OEIxJGHTQjS
	vJFJGtFsp2Ks0Co+je7LkrqcNihNzyiCKb2Tbh14taxatBU0kn/Pa0ibarV/w/4rkl8Fu10ME54
	4G7hufcb9nxzV5zaDsuzmcXyDeOiPMNmZVrXIw+UElYfXoGMBlT8F9doCCmDEyfOCxVUCZRrHS+
	y0OprCROALR4+bymyEryOB1ZWdsn2XCgLafnmnKEpeS2t8FJAcZATuIXq2LJzFYfj1KfCiz5N4I
	vLFCiB50+Fe5jh33Xl7vdI/lpNi/ciGTmp1bAJ4RCLRTC8dIVUzBdzmvPSbiNIiD6VB3wv+fOoi
	vpBm/xuafSjNse5i11p14sRL6GAF74tzaTVltmSqvmd1Cktzv3jJPomZ37+UZXyMiqNt3BYOQOs
	Qf1d48XTGFz+zCOPV9WqMG8iuKmbpwQoVBRiNadaYsqpgpgi
X-Received: by 2002:a05:7300:bc19:b0:36a:18e2:64c with SMTP id 5a478bee46e88-3827f98ff0cmr7469514eec.11.1795098976262;
        Thu, 19 Nov 2026 06:36:16 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7fbceffsm19156884eec.28.2026.11.19.06.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:36:15 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, "Christophe Leroy (CS
 GROUP)" <chleroy@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@infradead.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: [PATCH v2 4/7] powerpc/mm: handle highmem pages in arch_dma_prep_coherent()
In-Reply-To: <2b64e853-89a7-4fa5-a4f8-2c6b0b62bf74@samsung.com>
Date: Thu, 19 Nov 2026 19:59:02 +0530
Message-ID: <5wxslwsx.ritesh.list@gmail.com>
References: <20261110094830.2081847-1-m.szyprowski@samsung.com> <CGME20261110094850eucas1p1f10fa1473aca341473077f60a088b490@eucas1p1.samsung.com> <20261110094830.2081847-5-m.szyprowski@samsung.com> <jym96n4p.ritesh.list@gmail.com> <2b64e853-89a7-4fa5-a4f8-2c6b0b62bf74@samsung.com>
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

> On 19.11.2026 13:07, Ritesh Harjani (IBM) wrote:
>> Marek Szyprowski <m.szyprowski@samsung.com> writes:
>>
>>> arch_dma_prep_coherent() performs the cache maintenance on the address
>>> returned by page_address(). On 32-bit powerpc with CONFIG_HIGHMEM that
>>> is NULL for a highmem page which is not kmapped, so the flush would
>>> operate on the wrong virtual range and leave the dirty lines of the
>>> buffer in place.
>>>
>>> The generic DMA code may pass highmem pages to this hook:
>>> dma_direct_alloc() handles a highmem page returned by
>>> dma_alloc_contiguous() by forcing the remap path, which calls
>>> arch_dma_prep_coherent() on that page before creating the uncached
>>> mapping. This cannot happen on powerpc today only because it does not
>>> select HAVE_DMA_CONTIGUOUS, so dma-direct never gets a highmem page
>>> there, but nothing in the hook's contract rules it out.
>>>
>>> Use __dma_sync_page() with DMA_BIDIRECTIONAL, which the
>>> arch_sync_dma_for_*() hooks already use and which kmaps highmem pages
>>> one at a time. Without CONFIG_HIGHMEM it does the same
>>> flush_dcache_range() on the linear mapping as before.
>>>
>> Does that mean, this change can add additional overhead for
>> CONFIG_HIGHMEM=y kernels, where the buffer received still belongs to
>> lowmem? (Because of extra per-page book keeping like
>> local_irq_save/restore, kmap_xxx). Thoughts?
>>
>> Although functionally the change looks correct to me. But maybe
>> __dma_sync_page() on powerpc side could use some cleanups (outside of
>> this patch series perhaps).
> Indeed, __dma_sync_page() could be improved by calling __dma_sync_page_highmem()
> only for highmem pages. Something like:
>
>
> diff --git a/arch/powerpc/mm/dma-noncoherent.c b/arch/powerpc/mm/dma-noncoherent.c
> index e646256365d5..199ce0467b58 100644
> --- a/arch/powerpc/mm/dma-noncoherent.c
> +++ b/arch/powerpc/mm/dma-noncoherent.c
> @@ -97,11 +97,12 @@ static void __dma_sync_page(phys_addr_t paddr, size_t size, int dir)
>         unsigned offset = paddr & ~PAGE_MASK;
>

Should we return early if size=0 is passed. Although I couldn't find any
caller where this could happen, but since we are doing "paddr + size - 1",
hence wanted to flag it.


>  #ifdef CONFIG_HIGHMEM
> -       __dma_sync_page_highmem(page, offset, size, dir);
> -#else
> -       unsigned long start = (unsigned long)page_address(page) + offset;
> -       __dma_sync((void *)start, size, dir);
> +       if (PageHighMem(pfn_to_page(PHYS_PFN(paddr + size - 1)))) {
> +               __dma_sync_page_highmem(page, offset, size, dir);
> +               return;
> +       }
>  #endif
> +       __dma_sync(page_address(page) + offset, size, dir);
>  }
>
>  void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
>
>
> Do You want me to add it as another patch for this series?

I think this should work. I guess we should add this patch first and
then patch-4 on top of it.

Thanks for taking care of it. This at least will avoid the extra work
which we would have done otherwise for highmem kernels, where the buffer
passed to this still comes from lowmem.

-ritesh
