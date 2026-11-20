Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169407;
	b=g0e2OvOcy0ydnMQ4P72MseaNB9X51r+WE/dIS0BuJqhzKc/AZKKLitnxvLFjukXGfAP6
	 oLdH9+ZKJzoV0Ghx4GOOE3Oe3HJHuZomAVms0nk3SJ7fF2i0iamQ/8bngxjUf08fCFZ/i
	 Pgl+s3E28dOKooMEN0srqKspwO7O398vZLVb5XVk7Z8D/IjN7saEOsTqby/5KZJV5PwDK
	 hbK8qEyXgWx8m6THba+fgP4P1gaI3zNU+GfxrUUOj4ckNAbkNQ7TQLN9PZKi4kRanSMw4
	 fZSPvPZiiFdTX26Q+bHJs44E4G0HNqWhkPqg30EFHed/VMursS1+218FvsZeNi9ffRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169407;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BpB4Cf8Msxqted62VSuaCjYK1J3mdOhPDcGy1wxJblA=;
	b=uVBgSBrOA/rrIsBkZaRBoe3yXHGhAW9Z+v2/Mt6UwousQjq+AniKFamf6mkbL3MZ5O93
	 eiCXfsqWA2C6D/Bc5CDLzp6InHoBKug8aOzzu87YVay5h/1zZPiiPJEqEotUnfa9iy2qD
	 DQnnLZ4ZHKxGpGw/Itkb0BZCS0Cu+AAO8rrCrVqYMO6bhdiMCFzbkUrCPxuVRR8E7lBBX
	 BQwmrcDeCMH2q8EdBA+aJts3LNttV+H/8c1/fd+qqoexa9kgyTsc0Hr+/kliLQq2hc67/
	 diqRkM7HBnPIggg97zGNXnPtOs8LhhXeJrX0MC8SKtFwdjHspZs/qWe3Fdsw+d6Vv8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=QfQqKZOY;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB6B606A331
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:10:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FB6B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=QfQqKZOY
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cd69954c755so538993a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795169407; x=1795774207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BpB4Cf8Msxqted62VSuaCjYK1J3mdOhPDcGy1wxJblA=;
        b=QfQqKZOYQO9xUjgFEtILJ9XHoavhNtSXIJlNBDYDdcweKUrcr9IkabODQUTr1rUBWv
         PHnXADHZXHMvBwSVbOq9IZIo+dCL11D3dowPU5YokFDy+hpEPax+foAqsNha1Appxgid
         FEsMpADbmbisdwHa3hjs8AOFxwiGbD/jW2qgB8NHlqfHY5alZC8D773R56+KJ2Lbjhet
         JejsKBKfZrGGfqdqGMm36iypcn+UvcNvQ+4syBnZI0/9GmtHTwoE7fAiFfN5rt9Sn4np
         vMAgItMF6CekiyC9WjhRTdFyIdojnHacKeSjLOnLyiZpXDkc8ZvXygHv01YFEBofUymu
         EW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169407; x=1795774207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BpB4Cf8Msxqted62VSuaCjYK1J3mdOhPDcGy1wxJblA=;
        b=UsbgNqfTHJXP3omwN7kpOL4wxmkVHRskUhqbAa2TURXomXgu3ZIykARnP6WQA/CEoB
         Z561+Wx+goIOz2w2HKuNFkXsHZPeG7kKSM65brTEJyfIMK9cFuYL2irqqB602IMnIt/r
         Mq2cw9I3g7xqB3FJb4MCg+00zjIeLTv9swwnVOyCRbNN/PgBMDf+v5KUFW39VnB9fWNK
         f1TRbnrYu4/wOGVS89v8VKkDvu7bFWYRMqyO77yq/1rYz/QGZXgTIbgwTrk4oSsopXpm
         iUU9bbM7AS8BR4M1EBaQflGGoV7EJ+6PbVP/5joF6xQV/ffleY2e4TaJWIKu2NfRUL2h
         HfbQ==
X-Forwarded-Encrypted: i=1; AL+hErH96+HkTFtlCurzjRoYIiFWQ7PLDA7O9lxhqLZm3iVFRZFzaQ2DiK81bsmcxLealXjaMY/Lu4T/aUDAltQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Rr4Q8F/halHh0o+vd4JS40VfDd9ap5TeqyCUAPOdJ5ppzQxui
	bzR0Ogo1mdPeBMyUtpTf+ZaHXJyt+N12CT/ljtpU5d0PzAJCVB4NmWkX91SzMBmkT2o=
X-Gm-Gg: AZFdTZffJhqYEoIxHID02vagk6PeuDJraMv7eYGNJwLLmOBXXvhQ6nYutVdqdbZiA93
	0v7qt8OWvnKXCabEl0ARd1tQo5NoJGValeLGgaoP7uSqZbciV08mGod7ZaOLpeJ3DGShwIP1l0K
	qcAPpTM9fp4IctJgf9iM6uMuz2WPsriIl9GVaz8fLMRdCaHWZKovpZy6SDRlkYIkmpaA2hj9+V+
	1CxvWgtZfuniPjr70VXaXODXKpsAOuVlS7fiHxTXzersKagrrxd5ttwgHBB0U/1aaIQsI3to3xU
	oBXGqzGyVDxyg/NW1zW2cFxoLnrwePxSemoITqgdhZJTG/oViufiSqLS2ktnNb/VaMjAKJN8tvo
	xx/HHpuyd+rO0VPH75Fx6SpvgJHOPgT5u3b99q6wHrEIVltQx4lXwMdVDBRT//CVatuwZCnEu3K
	JtTJbwlQIg3JQ9w0k/us1rXhJnNeLMuRgERvUN93TSHxLf6gQJU0FbKIUkf8RZwDMAUpqIfTtcp
	XBpTILTZVMLIUJIq9Q+6Vsz7yk9OXhuCgI3qa5a0/f5/EikYxzdH9FhXrBqysh72Vga4NPsXgai
	Awyr3rrExsQ52/hb5YBal1kqfAz0EnI6AY2Gov7Yb0w+pRYdS38D/Gd7Rs+dDYJiOX+r5sNvIO5
	D9HjJhBgLAoHGwsI=
X-Received: by 2002:a17:90b:388c:b0:3b0:a378:1cf with SMTP id 98e67ed59e1d1-3b41c9b2d39mr2369530a91.22.1795169406584;
        Fri, 20 Nov 2026 02:10:06 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([203.208.167.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe16sm3727321a91.17.2026.11.20.02.09.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 02:10:05 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Mike Rapoport <rppt@kernel.org>
Cc: "Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Muchun Song <muchun.song@linux.dev>,
	Li Zhe <lizhe.67@bytedance.com>,
	Andrew Popple <apopple@nvidia.com>,
	Balbir Singh <balbirs@nvidia.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	James Houghton <jthoughton@google.com>,
	Lance Yang <lance.yang@linux.dev>,
	Qi Zheng <qi.zheng@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v3 07/11] mm/hugetlb: use common compound page initialization helper
Date: Fri, 20 Nov 2026 18:08:52 +0800
Message-ID: <20261120100856.16929-8-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261120100856.16929-1-songmuchun@bytedance.com>
References: <20261120100856.16929-1-songmuchun@bytedance.com>
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

Boot-time gigantic hugetlb folios currently use a separate path to
initialize their compound struct pages.

Use memmap_init_compound_page() for these folios so that HugeTLB and
ZONE_DEVICE share the common compound page initialization path. This
removes the HugeTLB-specific implementation and improves initialization
performance.

ZONE_DEVICE initializes struct pages by walking one contiguous memory
range. Boot-time HugeTLB instead initializes multiple disjoint ranges,
one for each contiguous hugepage. Measurements showed that memcpy()
performed better than memcpy_nontemporal() for the latter access pattern.
Therefore, use memcpy() for normal memory while retaining
memcpy_nontemporal() for ZONE_DEVICE.

The initialization time for 64 boot-time 1G hugepages with 4K base
pages was measured as follows:

  arch    without this patch  with this patch  reduction
  x86-64          195.60 ms          170.40 ms      12.88%
  arm64           374.40 ms          237.60 ms      36.54%

Co-developed-by: Li Zhe <lizhe.67@bytedance.com>
Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v3:
- Integrate the template-copy optimization into the common helper switch
  (suggested by Mike Rapoport)
- Use memcpy() for normal memory and keep memcpy_nontemporal() for
  ZONE_DEVICE
- Update performance results for the integrated implementation (measured
  by Li Zhe)
- Add Co-developed-by for Li Zhe
---
 mm/hugetlb.c | 52 ++--------------------------------------------------
 mm/mm_init.c | 10 ++++++----
 2 files changed, 8 insertions(+), 54 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 2a94f8f60870..6a613d9c9332 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3319,50 +3319,6 @@ static bool __init alloc_bootmem_huge_page(struct hstate *h, int nid)
 	return true;
 }
 
-/* Initialize [start_page:end_page_number] tail struct pages of a hugepage */
-static void __init hugetlb_folio_init_tail_vmemmap(struct folio *folio,
-					struct hstate *h,
-					unsigned long start_page_number,
-					unsigned long end_page_number)
-{
-	enum zone_type zone = folio_zonenum(folio);
-	int nid = folio_nid(folio);
-	struct page *page = folio_page(folio, start_page_number);
-	unsigned long head_pfn = folio_pfn(folio);
-	unsigned long pfn, end_pfn = head_pfn + end_page_number;
-	unsigned int order = huge_page_order(h);
-
-	/*
-	 * As we marked all tail pages with memblock_reserved_mark_noinit(),
-	 * we must initialize them ourselves here.
-	 */
-	for (pfn = head_pfn + start_page_number; pfn < end_pfn; page++, pfn++) {
-		__init_single_page(page, pfn, zone, nid);
-		prep_compound_tail(page, &folio->page, order);
-		set_page_count(page, 0);
-	}
-}
-
-static void __init hugetlb_folio_init_vmemmap(struct folio *folio,
-					      unsigned long pfn,
-					      struct hstate *h,
-					      enum zone_type zone, int nid,
-					      unsigned long nr_pages)
-{
-	struct page *head = &folio->page;
-
-	/*
-	 * This is an open-coded prep_compound_page() whereby we avoid
-	 * walking pages twice by initializing/preparing+freezing them in the
-	 * same go.
-	 */
-	__init_single_page(head, pfn, zone, nid);
-	__folio_set_head(folio);
-	set_page_count(head, 0);
-	hugetlb_folio_init_tail_vmemmap(folio, h, 1, nr_pages);
-	prep_compound_head(head, huge_page_order(h));
-}
-
 /*
  * memblock-allocated pageblocks might not have the migrate type set
  * if marked with the 'noinit' flag. Set it to the default (MIGRATE_MOVABLE)
@@ -3420,8 +3376,7 @@ static void __init gather_bootmem_prealloc_node(unsigned long nid)
 		struct folio *folio = (void *)page;
 		const unsigned long pfn = PHYS_PFN(__pa(m));
 		const unsigned long nr_pages = pages_per_huge_page(m->hstate);
-		const enum zone_type zone = zone_idx(pfn_to_zone(pfn, nid));
-		unsigned long nr_struct_pages = nr_pages;
+		const struct zone *zone = pfn_to_zone(pfn, nid);
 
 		h = m->hstate;
 		/*
@@ -3433,10 +3388,7 @@ static void __init gather_bootmem_prealloc_node(unsigned long nid)
 		prev_h = h;
 
 		VM_BUG_ON(!hstate_is_gigantic(h));
-
-		if (vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)))
-			nr_struct_pages = VMEMMAP_OPTIMIZATION_NR_STRUCT_PAGES;
-		hugetlb_folio_init_vmemmap(folio, pfn, h, zone, nid, nr_struct_pages);
+		memmap_init_compound_page(page, pfn, zone, huge_page_order(h));
 		init_new_hugetlb_folio(folio);
 
 		if (vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)))
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 3e645302377e..8bf350d5a695 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -722,16 +722,18 @@ static void __meminit memmap_init_page_from_template(struct page *page,
 		unsigned long pfn, const struct zone *zone, struct page *template)
 {
 	/*
-	 * Refresh PFN-dependent fields in the template before the non-temporal
-	 * copy, so the destination page does not need cached stores after
-	 * memcpy_nontemporal().
+	 * Refresh PFN-dependent fields in the template before copying it, so
+	 * the destination page does not need follow-up stores.
 	 */
 	set_page_section_from_pfn(template, pfn);
 #ifdef WANT_PAGE_VIRTUAL
 	if (!is_highmem_idx(zone_idx(zone)))
 		set_page_address(template, __va(pfn << PAGE_SHIFT));
 #endif
-	memcpy_nontemporal(page, template, sizeof(*page));
+	if (zone_is_zone_device(zone))
+		memcpy_nontemporal(page, template, sizeof(*page));
+	else
+		memcpy(page, template, sizeof(*page));
 	vmemmap_optimization_verify_zone(page);
 }
 
-- 
2.54.0

