Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.245.243.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795526127;
	b=mG2O1CGutB8zrAQ8ewlPfaoCu0B99YONCeizqVy9hRHkv2gN8BezwgZb9iLtgURkRgAi
	 RUgANDBWNeW7pX8wNYLY7wc1aYQD4I4OYsgYJWcx6JXZsUBCJNF2cR52q95sP7GeBXX8i
	 Pl0wJb6T00g/WLptA9KXq3kYVRSZSai3sERnXc91gPVuqsLW+EY8aQU00Qnun3erdOi0r
	 SHsTVhxxTsrFQNNktJhNqtdK86qkVgIxnphqVXSu13TYj9hCkARwGgcrMCW2xf0hFH7tR
	 cB51KYdZNQwIhL9QzQpdG4gYIBVNjSG9Io42k7oOnvRboLpBF7KZIvs64KFE3yFr5gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526127;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=VNuS0lBjIFijyu46SepBHc+tPpnYKfW52FKxyqAg/Cw=;
	b=zY9or0L8w8USAvdha9qU9dNhoI5C3mWmXY45MuObvKWmF16eHiF8WcMJDrjOJCXhGCkj
	 N61d9O3sDU/xh+bCHsY4zrLQ2iUjlaqQzwOMuYELM+ToGHF8eHj2xzYPokcK0NuSN2XYP
	 q+INKxGrk/ZorFr+2AmuNvw2axaWvu+AyA02yl9LoQjGrcnfWy6x++u0coZHhX70vqO7Z
	 REa4sxmRfeDa34Fpq98nrZYm4DntGqPHbkXiGBQB8bYPMn48oF5mg/77otMWMotfbnOl2
	 09P9ow95T1Mo/q5kUydnr16E8BRIPg2Vcd2siG7+8BOoTzEsuxBg0EzJtxjCCHpy60g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=j674ZVdY;
	arc=none smtp.remote-ip=44.245.243.92
Received: from pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.245.243.92])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85725606A335
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:15:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85725606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=j674ZVdY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1795526127; x=1827062127;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VNuS0lBjIFijyu46SepBHc+tPpnYKfW52FKxyqAg/Cw=;
  b=j674ZVdYG97P59Xr9999knAONpQMsSL25CZRgyHhPEu257hBq5EBe99M
   08HtJsBVqoUaqJBq/bWqwIssANVtebjuzZ4hjFVi2sTkmTEsVNkIWQ2IT
   5tb5vms3GBwFDk/3QcQ3nGUUy0brZAGbY9d6OeV9bor6KVPuBWwHlR3ii
   cnbUxvQANUJu5iTVt3+LLYotez2DVMxCZo669TOorTs6vQilsMmSClx/i
   3hR7RX/ViyXmhNZFAPhUaGYzKkTiLl/cHeZa4TwcwhTgher1nPqBlDt7X
   U/5B2O8ARqUgb/tVDZIniolp9N40OOAnkeRW+k2m08McVEi+gUTM4oCyF
   w==;
X-CSE-ConnectionGUID: An0KgjPjSQGsqnVwoTzS5Q==
X-CSE-MsgGUID: 5COEIKYLRxmN9KNooaAD5A==
X-IronPort-AV: E=Sophos;i="6.27,230,1787011200"; 
   d="scan'208";a="34527308"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 13:15:25 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.182:9909]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.8.86:2525] with esmtp (Farcaster)
 id aec97299-e563-4f7d-b58f-1bdd4e0c26b7; Tue, 24 Nov 2026 13:15:24 +0000 (UTC)
X-Farcaster-Flow-ID: aec97299-e563-4f7d-b58f-1bdd4e0c26b7
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.57;
 Tue, 24 Nov 2026 13:15:24 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.57; Tue, 24 Nov 2026
 13:15:21 +0000
From: Eliav Farber <farbere@amazon.com>
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand
	<david@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Zi Yan
	<ziy@nvidia.com>
CC: Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, "Suren
 Baghdasaryan" <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jann Horn
	<jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, Baolin Wang
	<baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, "Ryan
 Roberts" <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song
	<baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif
	<usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
	<linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, Eliav Farber
	<farbere@amazon.com>
Subject: [PATCH v3 2/5] mm/huge_memory: check the window and the pfn alignment before inserting
Date: Tue, 24 Nov 2026 13:15:07 +0000
Message-ID: <20261124131510.38745-3-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124131510.38745-1-farbere@amazon.com>
References: <20261124131510.38745-1-farbere@amazon.com>
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
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWC004.ant.amazon.com (10.13.139.246) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

insert_pmd() and insert_pud() check that addr is inside the VMA, but not
that the whole PMD or PUD is. A VMA ending part-way through one gets
mapped past its end. Neither checks the pfn, and pfn_pmd() on x86 rounds
an unaligned pfn down, mapping the wrong memory.

No caller can reach either case today; each checks the geometry first.
The next patch adds vmf_insert_pfn_order(), whose callers do not.

Check both ends of the window, and the pfn alignment in
vmf_insert_pfn_pmd() and vmf_insert_pfn_pud(). Fall back rather than
SIGBUS: a VMA that does not span a whole PMD is ordinary.

Several callers open-code the same test; vfio-pci and nvgrace-gpu share
one as is_aligned_for_order() in a vfio-private header. The callers'
checks stay: some do more than mm can, as device-dax turns a window
failure into SIGBUS and the fsdax check also gates its PMD-order mapping
entry.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---

New in v3. In v2 these checks sat in vmf_insert_pfn_order(), where only
my own callers got them.

 mm/huge_memory.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 75e8641bf9ff..909db70aeba2 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1630,8 +1630,9 @@ static vm_fault_t insert_pmd(struct vm_area_struct *vma, unsigned long addr,
 	spinlock_t *ptl;
 	pmd_t entry;
 
-	if (addr < vma->vm_start || addr >= vma->vm_end)
-		return VM_FAULT_SIGBUS;
+	/* If the whole PMD doesn't fit in the VMA, fall back to 4KiB pages */
+	if (addr < vma->vm_start || addr + HPAGE_PMD_SIZE > vma->vm_end)
+		return VM_FAULT_FALLBACK;
 
 	if (arch_needs_pgtable_deposit()) {
 		pgtable = pte_alloc_one(vma->vm_mm);
@@ -1729,6 +1730,10 @@ vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, unsigned long pfn,
 	if (unlikely(is_huge_zero_pfn(pfn)))
 		return VM_FAULT_SIGBUS;
 
+	/* pfn_pmd() would round an unaligned pfn down and map the wrong memory */
+	if (!IS_ALIGNED(pfn, HPAGE_PMD_NR))
+		return VM_FAULT_FALLBACK;
+
 	pfnmap_setup_cachemode_pfn(pfn, &pgprot);
 
 	return insert_pmd(vma, addr, vmf->pmd, fop, pgprot, write);
@@ -1768,8 +1773,9 @@ static vm_fault_t insert_pud(struct vm_area_struct *vma, unsigned long addr,
 	spinlock_t *ptl;
 	pud_t entry;
 
-	if (addr < vma->vm_start || addr >= vma->vm_end)
-		return VM_FAULT_SIGBUS;
+	/* If the whole PUD doesn't fit in the VMA, fall back to smaller pages */
+	if (addr < vma->vm_start || addr + HPAGE_PUD_SIZE > vma->vm_end)
+		return VM_FAULT_FALLBACK;
 
 	ptl = pud_lock(mm, pud);
 	if (!pud_none(*pud)) {
@@ -1842,6 +1848,10 @@ vm_fault_t vmf_insert_pfn_pud(struct vm_fault *vmf, unsigned long pfn,
 						(VM_PFNMAP|VM_MIXEDMAP));
 	BUG_ON((vma->vm_flags & VM_PFNMAP) && vma_is_cow_mapping(vma));
 
+	/* pfn_pud() would round an unaligned pfn down and map the wrong memory */
+	if (!IS_ALIGNED(pfn, HPAGE_PUD_NR))
+		return VM_FAULT_FALLBACK;
+
 	pfnmap_setup_cachemode_pfn(pfn, &pgprot);
 
 	return insert_pud(vma, addr, vmf->pud, fop, pgprot, write);
-- 
2.47.3

