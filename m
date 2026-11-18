Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.57
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795037248;
	b=xpNHIGkCMpEBdkxj65P25ZfUp9b7Ipm4RG/1rCkPGzpDw1u4sX70ZNwdYvcBiJJrloim
	 4YqUUvijfzxdGr5rAKMcb26/efCk9w+o/VJPxQWyy3Pgt9RTdjpeS7mqCEwE0kw7cMR2N
	 FmRoQlF0FIXRqBK7zXGNDJo0BmjkeUZq1RReFx0vh8bmGsj2Y7thqUVyCD6iGzcChRo2R
	 jUTg+1HGcEF3CXmLHvS4Sr08MF2o3DbBc1tamsQM1pQyMqoYckPnDR9ErjMj7iCPq5aH4
	 vDmJ+Z2Cw37nA1q+mcModr5r1vU4pvKbguKUVrzmBLvw7rmPmYZj6dzRUjnWmHnTYrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795037248;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mogADoqfrbMYaLMvgpMtuagWfc8Fc+oIhYZ0ChD1RsA=;
	b=0jy1+LZjRIcHzRJczguBOONAkZfHVbK/Q4t6T606oaf156QeQYOo8ZVxO6aqXTB50PEu
	 Q90m48C8zc2JOR2jRis2NS9sMFpRbiNYatdThRoYpU2whgPyqwFk/4RtlcgygzLx8Rqk/
	 k0FiaO/KBkYF4l8ds+ApUvEYAa/vZsl4SubSoYNYaw+Nh2Xw59aVx8BzQ8bAMywb4EoJy
	 R4QEiPHwrPCqCNfEN3arKvBxpikLtR+8tspMYJGGzPsJCgdyJ5WzxuDdyGstmocmPs1qH
	 xOVTWxu4yvEUzHFH2ZuSboalSiKa5bvwE+JJT8H71CFMzpoYmkxi2IArmWhQxO6CEew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dlsig+ad;
	arc=none smtp.remote-ip=91.218.175.57
Received: from mta0.migadu.com (out-57.mta0.migadu.com [91.218.175.57])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEEB606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEEEB606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dlsig+ad
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qDO+A0+DzQtZ1Jpw/GJ73qszkY+5+RWSqSSSXpqLzf8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795037244; v=1; x=1795642044;
 b=dlsig+adDIK23HTMVmpI32tmQcroVlpWzqBQbpdlScFHTB4uGVRchNnY8bt3qYe1+8yVmHPQ
 2FwSU+W/65HXMmoCOwjKJCMUA3VREeW+2h7VuO2QfHiCcNW8gPMUoMjBV3WQhWpPtWSmrM6gUOy
 xoSh1EFTjlj3C2cRnqxEgDfE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id f673159cc3706187;
	Wed, 18 Nov 2026 21:27:24 +0000
X-Mizu-Trace-ID: f673159cc3706187
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: "Nico Pache (Red Hat)" <nico.pache@linux.dev>
Cc: Usama Arif <usama.arif@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Kiryl Shutsemau <kas@kernel.org>,
	Yu Zhao <yuzhao@google.com>,
	Xu Xin <xu.xin@linux.dev>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Usama Arif <usamaarif642@gmail.com>,
	aarcange@redhat.com
Subject: Re: [PATCH v2 2/2] mm/ksm: prevent zero-page remapping during ksmd-triggered THP splits
Date: Wed, 18 Nov 2026 13:27:21 -0800
Message-ID: <20261118212722.3922741-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261025-b4-ksm_fixv2-v2-2-8b61ad0491f1@linux.dev>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 25 Oct 2026 11:39:47 -0600 "Nico Pache (Red Hat)" <nico.pache@linux.dev> wrote:

> Since commit b1f202060afe ("mm: remap unused subpages to shared zeropage
> when splitting isolated thp"), splitting an anonymous THP remaps all
> zero-filled subpages to the shared zeropage via TTU_USE_SHARED_ZEROPAGE.
> This flag is set unconditionally for every anonymous folio split,
> including splits triggered by KSM.
> 
> When KSM is enabled with THP=always, this causes two regressions:
> 
> 1. use_zero_pages=1: KSM calls try_to_merge_one_page() which triggers
>    split_huge_page(). The split remaps all 512 zero-filled subpages to
>    the shared zeropage at once, freeing the entire 2MB THP when KSM only
>    intended to process a single 4KB page. This bypasses KSM's
>    pages_to_scan rate limiting, causing ~1GB to be freed almost
>    instantly.

Hey Nico,

I think I have had this conversation either on the previous revision
or the mailing list somewhere else before, so sorry for restarting this
again.

Isnt above a good thing? KSM is a memory saving feature, and this
is resulting in 1G being freed instantly?

> 
> 2. use_zero_pages=0: The same split side-effect occurs through the
>    stable/unstable tree merge paths. Each pages_to_scan iteration
>    triggers an expensive split_huge_page() that silently frees 2MB,
>    while the scanner wastes cycles on tree searches for zero-filled
>    pages that were already freed as a side-effect.

As an alternate to having this patch, should we just have patch 1
and users should turn off split_underused_thp when using KSM.

If you have a large number of THPs on your machine, using KSM is a very
bad idea IMO due to all the splits that happen.
IMO, there are 2 optimum host conditions:
- A large number of THPs, and KSM disabled, hence shrinker can stay on.
- Very low number of THPs, KSM can be enabled or disabled, but as there
are a low number of THPs, the shrinker can be turned off.

> 
> Introduce current_is_ksmd(), which uses kthread_func() to check whether
> the current task is the KSM scanning thread, and use it in
> try_to_map_unused_to_zeropage() to skip zero-page remapping when the
> split is triggered by ksmd.
> 
> Fixes: b1f202060afe ("mm: remap unused subpages to shared zeropage when splitting isolated thp")
> Signed-off-by: Nico Pache (Red Hat) <nico.pache@linux.dev>
> ---
>  include/linux/ksm.h | 6 ++++++
>  mm/ksm.c            | 5 +++++
>  mm/migrate.c        | 3 +++
>  3 files changed, 14 insertions(+)
> 
> diff --git a/include/linux/ksm.h b/include/linux/ksm.h
> index d39d0d5483a2..41c06a6abf60 100644
> --- a/include/linux/ksm.h
> +++ b/include/linux/ksm.h
> @@ -17,6 +17,7 @@
>  #ifdef CONFIG_KSM
>  int ksm_madvise(struct vm_area_struct *vma, unsigned long start,
>  		unsigned long end, int advice, vm_flags_t *vm_flags);
> +bool current_is_ksmd(void);
>  vma_flags_t ksm_vma_flags(struct mm_struct *mm, const struct file *file,
>  			  vma_flags_t vma_flags);
>  int ksm_enable_merge_any(struct mm_struct *mm);
> @@ -144,6 +145,11 @@ static inline int ksm_madvise(struct vm_area_struct *vma, unsigned long start,
>  	return 0;
>  }
>  
> +static inline bool current_is_ksmd(void)
> +{
> +	return false;
> +}
> +
>  static inline struct folio *ksm_might_need_to_copy(struct folio *folio,
>  			struct vm_area_struct *vma, unsigned long addr)
>  {
> diff --git a/mm/ksm.c b/mm/ksm.c
> index 910a1307ac9f..e3ab037b1ebe 100644
> --- a/mm/ksm.c
> +++ b/mm/ksm.c
> @@ -2866,6 +2866,11 @@ static int ksm_scan_thread(void *nothing)
>  	return 0;
>  }
>  
> +bool current_is_ksmd(void)
> +{
> +	return kthread_func(current) == ksm_scan_thread;
> +}
> +
>  static bool __ksm_should_add_vma(const struct file *file, vma_flags_t vma_flags)
>  {
>  	if (vma_flags_test(&vma_flags, VMA_MERGEABLE_BIT))
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 7bdcdb57652f..c33ae3fa1043 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -305,6 +305,9 @@ static bool try_to_map_unused_to_zeropage(struct page_vma_mapped_walk *pvmw,
>  	if (PageCompound(page) || PageHWPoison(page))
>  		return false;
>  
> +	if (current_is_ksmd())
> +		return false;
> +
>  	VM_BUG_ON_PAGE(!PageAnon(page), page);
>  	VM_BUG_ON_PAGE(!PageLocked(page), page);
>  	VM_BUG_ON_PAGE(pte_present(old_pte), page);
> 
> -- 
> 2.56.0
> 
> 
