Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795643377;
	b=llvalZosM6N2Y+AN51h2GGos3s5I+JMkMYlBjH2f8ygcPyu194yTa5kBf2tm/dvOBxPF
	 jWNUKflFRyCee+WkDgzHSkGBabMfo0F7Z4Z0sqwc//4CsuEf8+i2vkeXT97axwVRHPKfV
	 OPcsjQAwqHYXOl61QXxyM97Git+sE5hKO8NL3P7I+o934zcLf3SFJIsMiP7qIqpXDZo4W
	 IP5P8BP5GBePPGMBvNl/Gb0gR4uzQLS1P/BRxdDa0mCDF/nw1pYwJe4yXwnIOZDrPv1xW
	 lNqLkN5DiTHsLZ6kFZeAfb3Y8SPWZv/Y8HpfMJ5uvg1hraxRFI7geIh7U3dHjGuGulQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795643377;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=kKJKbMnJNOGoE6D91lLl+V2hqik3/+jrS4TaB+PdqrY=;
	b=lRUFyv9OkbgFMmQ2qF6ellWepk2NfGfkqkf5tsAB1bdpAjYYsUcfOFQdpJHpirq1bP89
	 OAWQmCroiLHFdhuJLC25dcrzEpfLEZtcqgpskcqQuXr7ADKrscCt4HQGUgtACx6D99rl6
	 c/WmX88PWFlctb3IJD37ZAMWHxSy2Xi58ru5hN5hHm8Z8dziDYM0+pvtAkkSrB5Pl1Q4M
	 GqpCFQZ2BQ5YfmfU5ss4pfQD5s8kYWHsXB57F406Ttl9F0un2gWhRIW6s2vn6XvTrPofS
	 oAaNUnfcNI7Kjh5i7isnqzEryO3PjEpKbDAgmJomWBx72sNoTQLUnhrI6OKywZAxtEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=g4ilV5O3;
	arc=none smtp.remote-ip=95.215.58.7
Received: from mta1.migadu.com (out-7.mta1.migadu.com [95.215.58.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F3D606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07F3D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=g4ilV5O3
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=23ukelReVlQPxc727XgPBvL052sL8fB47EA5Oas4FGk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795643375; v=1; x=1796248175;
 b=g4ilV5O3yYC6yhOJGtP90BvpNeDZQqHMwkolMBewnNYzg30dUDCcynwOM/kniC0MeppIG7iM
 S9hfp0ktxWi61dLPhnb4UFjObzp89imJxrRUEwaKJBUxP2SqkmSyXCOgQDmcQV3MEWrCKQ7HY5i
 395jK0IkAEgoiiNv3X7Z5bXE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 61dfde814fe69c93;
	Wed, 25 Nov 2026 21:49:34 +0000
X-Mizu-Trace-ID: 61dfde814fe69c93
X-Migadu-Flow: FLOW_OUT
Message-ID: <1b0242ef-49ad-4d7d-820e-d1e6569eacf8@linux.dev>
Date: Wed, 25 Nov 2026 21:49:34 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/cma: reject long-term pins of HugeTLB folios
 overlapping crashkernel CMA
To: Sang-Heon Jeon <ekffu200098@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>
Cc: "Liam R. Howlett" <liam@infradead.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Vlastimil Babka <vbabka@kernel.org>,
 Qi Zheng <zhengqi.arch@bytedance.com>, Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>, Frank van der Linden <fvdl@google.com>,
 Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Pratyush Yadav <pratyush@kernel.org>, Jiri Bohac <jbohac@suse.cz>,
 kexec@lists.infradead.org
References: <20261125155108.24098-1-ekffu200098@gmail.com>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <20261125155108.24098-1-ekffu200098@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 25/11/2026 07:51, Sang-Heon Jeon wrote:
> crashkernel=size,cma uses existing hugetlb_cma memory, so
> crashk_cma_ranges[] may contain HugeTLB folios. HugeTLB folios allocated
> from hugetlb_cma can be long-term pinned without being migrated.
> 
> After a crash, the crash kernel uses the memory in crashk_cma_ranges[],
> but a device can still write to a long-term pinned folio.
> 
> So reject long-term pins of HugeTLB folios overlapping
> crashk_cma_ranges[].
> 

Is spending the workload to protect the dump the right way round for this
option?  kdump.rst describes it as

	This reservation method is intended for systems that can't afford to
	sacrifice enough memory for standard crashkernel reservation and where
	less reliable and possibly incomplete kdump is preferable to no kdump at
	all.

so the dump is the part the admin has already agreed to give up.

> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> ---
> The above scenario is only possible with the two patches below applied.
> Currently only linux-next, which is targeting v7.5, has both of them.
> 
>   "mm/hugetlb: allow crashkernel to reuse hugetlb CMA memory" (kexec-next)
>   "mm: gup: allow long-term pins of CMA-allocated HugeTLB folios" (mm-unstable)
> ---
>  mm/cma.c | 25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/cma.c b/mm/cma.c
> index 0c97aadcfea4..cb4a92e2b9f5 100644
> --- a/mm/cma.c
> +++ b/mm/cma.c
> @@ -32,6 +32,8 @@
>  #include <linux/hugetlb.h>
>  #include <trace/events/cma.h>
>  #include <linux/page-isolation.h>
> +#include <linux/crash_reserve.h>
> +#include <linux/range.h>
>  
>  #include "internal.h"
>  #include "cma.h"
> @@ -42,12 +44,33 @@ unsigned int cma_area_count;
>  
>  bool cma_folio_is_longterm_pinnable(struct folio *folio)
>  {
> +	struct range r;
> +	int i;
> +
>  	/*
>  	 * Explicitly allocated CMA folios own their CMA memory and can be
>  	 * pinned even in ZONE_MOVABLE, as CMA memory cannot be offlined.
>  	 * For now, only HugeTLB tracks these allocations with a folio flag.
>  	 */
> -	return folio_test_hugetlb(folio) && folio_test_hugetlb_cma(folio);
> +	if (!folio_test_hugetlb(folio) || !folio_test_hugetlb_cma(folio))
> +		return false;
> +
> +	/*
> +	 * The crash kernel uses the memory in crashk_cma_ranges[], but a
> +	 * device can still write to a long-term pinned folio after a crash.
> +	 */
> +	if (!crashk_cma_cnt)
> +		return true;
> +
> +	r.start = PFN_PHYS(folio_pfn(folio));
> +	r.end = r.start + folio_size(folio) - 1;
> +
> +	for (i = 0; i < crashk_cma_cnt; i++) {
> +		if (range_overlaps(&crashk_cma_ranges[i], &r))
> +			return false;
> +	}
> +
> +	return true;
>  }
>  
>  phys_addr_t cma_get_base(const struct cma *cma)
> 
> base-commit: a036649714c3446abfdc36d0ae483046432b16c5

