Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795404167;
	b=m42mggUzU3LDjqf+1DPgjrFKqy8LPJe9Nsnut333xErnm21tlSqPYDELV8Wjw1sP60wn
	 c0G8yfGhM7hWTc5blWlyoAvbhSPfhRCRzzdDUypZRjK9W36zrMZqlQ0quft7LMIbcwT4R
	 AYNp1ZDIze1iYXBiFC2b+RApag0cY42BA3zJsQjJxKA/lcs+pQjkpCU1LcXX3aSIewlxM
	 yM9vjZEDuDZIU9Xs0CKpMmX0sB5fLIt5dOKlXWHUvyzPV4he5MXYV4be8ZhuIQevP2sH5
	 ZaE0WeXZwrrx8KVBQ1W7UJ7xgvKXSHJ9hNKUvnVGT8whN97c8+PkhpVxk/3jAJ5JOow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795404167;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=mmVRvdK02N6AgoL3Fkb1Slsd4s0/SBaF5vDPeDu6iRw=;
	b=C2bwXJBc/nen1rQz+nvPkjzpN881x87w2ABaL4dnk/t6o6yoR/q9Y57RD6/OeaCaoXvw
	 77oTB6JmDAk7mC1PVWUPhjv2OA1BMK2GPxhAnRbgCuNFb7KvSI6Gty3sicrpuOwKnEJUG
	 y1eXxp16U9xYay9DPYr5JnG7QSeDR48VsrT+mYWqSTVf6mtMU6dxnaOQRfGqQ5nWxDorG
	 +Gll3VbAbJHK186zAaPSdXqaAnLcITHiDcPVnygkYYxlwRPtaauBBN9ubhbDoG9BzrtRj
	 RJSCAr2wSz4/bsOXXeF+Uk6K1CiikQc4hDrl3YGoRBJ09WFXig5RDCVT1c8tx2esuew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MbmIxTcQ;
	arc=none smtp.remote-ip=95.215.58.3
Received: from mta1.migadu.com (out-3.mta1.migadu.com [95.215.58.3])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40D7606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:22:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A40D7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MbmIxTcQ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/mnPk6TbiEx963fDemDdeJymjABb+Fn9UESDkxFlWro=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795404164; v=1; x=1796008964;
 b=MbmIxTcQ3G8tt5wpa6I92LbDuMVfs1806E7cCC5PBI2vMou21aB8rNHj0nuJts8H03VVD2PI
 9TAupc99w0fWffVFDQy168Kz8ejfAY9iYpPuItzqQ6Uyb/Izcz9NyUgvR3SABuMbZKKvSgRXEae
 vJQh1W78cvOAENKbObhR4Edc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a40b5ee157b951a8;
	Mon, 23 Nov 2026 03:22:43 +0000
X-Mizu-Trace-ID: a40b5ee157b951a8
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v3 11/19] arm64/mm: Align vmemmap to maximal folio size
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261122184453.2668189-12-jthoughton@google.com>
Date: Mon, 23 Nov 2026 11:22:18 +0800
Cc: Muchun Song <muchun.song@linux.dev>,
 Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Nikos Nikoleris <nikos.nikoleris@arm.com>,
 Linu Cherian <linu.cherian@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 David Hildenbrand <david@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Nanyong Sun <sunnanyong@huawei.com>,
 Yu Zhao <yuzhao@google.com>,
 Frank van der Linden <fvdl@google.com>,
 David Rientjes <rientjes@google.com>,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <ED44F18E-E7FF-4B53-9B5B-3201F1100154@linux.dev>
References: <20261122184453.2668189-1-jthoughton@google.com>
 <20261122184453.2668189-12-jthoughton@google.com>
To: James Houghton <jthoughton@google.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 23, 2026, at 02:44, James Houghton <jthoughton@google.com> =
wrote:
>=20
> With CONFIG_VMEMMAP_OPTIMIZATION, compound_head() derives a tail =
page's
> head by masking its address. This requires the head struct page of =
every
> folio to be naturally aligned to the folio's vmemmap size, up to
> MAX_FOLIO_VMEMMAP_ALIGN.
>=20
> On arm64, the vmemmap is offset by memstart_addr, which is only =
aligned
> to ARM64_MEMSTART_ALIGN: as little as 512M with 64K pages, where 16G
> CONT_PMD hugetlb folios exist. VMEMMAP_START itself is sufficiently
> aligned for all supported page sizes and VA sizes.
>=20
> Raise ARM64_MEMSTART_ALIGN to cover MAX_FOLIO_VMEMMAP_ALIGN, and =
assert
> at build time that VMEMMAP_START is suitably aligned. This is a no-op
> until arm64 enables HVO, which selects CONFIG_VMEMMAP_OPTIMIZATION.
>=20
> Signed-off-by: James Houghton <jthoughton@google.com>
> ---
> arch/arm64/mm/init.c | 18 ++++++++++++++++--
> 1 file changed, 16 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index 4e7682dfe366..7186d86afc41 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -35,6 +35,7 @@
> #include <linux/kmemleak.h>
> #include <linux/execmem.h>
> #include <linux/arm-rsi-cmds.h>
> +#include <linux/vmemmap-optimization.h>
>=20
>=20
> #include <asm/boot.h>
> @@ -92,11 +93,22 @@ phys_addr_t __ro_after_init arm64_dma_phys_limit;
>  * in the virtual address space.
>  */
> #if ARM64_MEMSTART_SHIFT < SECTION_SIZE_BITS
> -#define ARM64_MEMSTART_ALIGN	(1UL << SECTION_SIZE_BITS)
> +#define ARM64_MEMSTART_BASE_ALIGN	(1UL << SECTION_SIZE_BITS)
> #else
> -#define ARM64_MEMSTART_ALIGN	(1UL << ARM64_MEMSTART_SHIFT)
> +#define ARM64_MEMSTART_BASE_ALIGN	(1UL << ARM64_MEMSTART_SHIFT)
> #endif
>=20
> +/*
> + * With CONFIG_VMEMMAP_OPTIMIZATION, compound_head() masks the =
address of a
> + * tail page to find its head, so the head struct page of every folio =
must be
> + * naturally aligned to the folio's vmemmap size. The vmemmap is =
offset by
> + * memstart_addr, so memstart_addr must be aligned to the largest =
folio size.
> + */
> +#define ARM64_VMEMMAP_OPT_ALIGN						=
\
> +	PFN_PHYS(MAX_FOLIO_VMEMMAP_ALIGN / sizeof(struct page))
> +#define ARM64_MEMSTART_ALIGN						=
\
> +	max_t(phys_addr_t, ARM64_MEMSTART_BASE_ALIGN, =
ARM64_VMEMMAP_OPT_ALIGN)
> +
> static void __init arch_reserve_crashkernel(void)
> {
> 	unsigned long long crash_base, crash_size, cma_size =3D 0;
> @@ -218,6 +230,8 @@ void __init arm64_memblock_init(void)
> 	/*
> 	 * Select a suitable value for the base of physical memory.
> 	 */
> +	BUILD_BUG_ON(MAX_FOLIO_VMEMMAP_ALIGN &&
> +		     !IS_ALIGNED(VMEMMAP_START, =
MAX_FOLIO_VMEMMAP_ALIGN));

We already have a sanity check in spares_init(). Doesn't it work? If we =
really
need a check here, I think we should use compound_info_has_mask() for =
the guard
instead of MAX_FOLIO_VMEMMAP_ALIGN.

Thanks,
Muchun

> 	memstart_addr =3D round_down(memblock_start_of_DRAM(),
> 				   ARM64_MEMSTART_ALIGN);
>=20
> --=20
> 2.56.1.809.ga0b61035b5-goog
>=20

