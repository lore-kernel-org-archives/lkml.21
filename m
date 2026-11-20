Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169423;
	b=tWQA96XOh5e3wYrEJaVCXyEUNlXptnFkETR10QQck0NW1lWc/4R8/ptRlyViY/iJcWy6
	 1dtJFTvWNq3TR0a5m2Zv5JfHZkgUsTI/OGKOHqfLCInPccl4aJ6YL6QYFeG1+wl5UINrM
	 isb3GLO/EnyJlptOTh25RgJH4+iYGDnFWuUbt85ynwdkqDhhPbv8bpbiulUwozgwiacoJ
	 PXNHSCe5TM+M7FODTj2r1+oK6vIH1oifDZ77Y2KARLyiud7NaJt6Oy5LztaTeClALzJ/c
	 MO8BleVlfI2P0GX75ezedsZpBWdkN8xny8lnToZQjmB0q9LDdcevz5Mrxdd6wOuTRJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Nr35iIMLyd10/NozvM5fMxHhJ/DSRkplZFTVJM0aV2Q=;
	b=21543ozibvK7J0zXZ+9mNU1AnSEJP9fRB5sdE7o8ladlv/OKhjxET+0wJuhwlcz69i9O
	 qzXwYQDMonvyq/IWVfyQXRNXmCpC6ou58YE75z4FjHA485CKPcypIeir8F8OrkGxuf4HH
	 5CYfe4tKb1KxHpIdfDc+ssemeWCSGcO4eyRfksj8dPxVAPOUAeVSqCtSwMFCD6K5QV4nh
	 4dIO/siDlxgsOas53VHZQ10Fv3kaHVft2b7e9qsSfJ/b2+HZaPmD0+ehoa3/wzozGZju2
	 qTg7h3B9CEV6NxsLb9oRzMW++XTL5+R6r+Yabhvpds6p2Q/+qaV+HhNumCL8IwYMVxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=di9qdKoI;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEB9606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:10:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CEB9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=di9qdKoI
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b40470fdd8so366872a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795169422; x=1795774222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nr35iIMLyd10/NozvM5fMxHhJ/DSRkplZFTVJM0aV2Q=;
        b=di9qdKoImdlM8j7rDYeD1/xEuMfkijB7E0r4MYFFKrMOKtEzBAQPRJ9ftyYVw1Pqa5
         9q/RN/olN7KujWB7Ghkzkice9EbWBQpzMfwZF+t3XxVfo4Us5qE/Tci2bPNoPVxKKHAW
         mu+g7aiOoVKiw1UvfowVUmcidyOY37FFIM4yuSMdvBRhKBIUhpVuc6yuzSljqFjyy20l
         vQfW4fKmpUaOnk6e92l+HFcBfrCVls9mnzZkoapzWzL6c3ycBX5XeM2Ff6pUmc4G+BGs
         vMk9Pb/h1QfrLHoHRDfdU6lkGrGvqmu3RStVhxPp8xd5ZF1kg2dJOTNp6ue9rmz/xmoy
         Zo5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169422; x=1795774222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nr35iIMLyd10/NozvM5fMxHhJ/DSRkplZFTVJM0aV2Q=;
        b=Dgkf75wmXb4eqqiYHk69HNTV63VZVhM4hegbPRYeZNHMN1I//x01E906vdfnAuKaK+
         NcZ1rSwl86qO3Ja2STjNQZci3CZf+yrC6SkjO7QYRE1UJ5aHYbrMl3gkIb6lgDAeNQz0
         mE7zNSgXacobY+JKHc7X7X3H8h18RzmydeolWmtggdRriWRV9m6j5MtYV98hyDcyqQ7k
         hpimbeDNS5UXljsVW4sB32n4KbWl8c6mrWOOwHJ3kQHPW8XmI5ysAbFSFvkjbO9JD/xh
         6y6LpgOxhRl++CHu7PnoPdJ8F/DYHFa0CVQ8NQJb+INlFVsAMuzvLwayI/ffGM7wzS1d
         4Pxg==
X-Forwarded-Encrypted: i=1; AL+hErH29/Z+wPeCX7iupvGnU9tD0QK3aF5IRp0XWP6QMGAfl6aqIjr7LA89wCCUVuyzdLXS/vgh7LzDb88g8/Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LVMOUeL6ox8FnDns/Wc2ytLxE9UyrVwtKq+CY5MAI+LbH2hQU
	epDtmrEnCtJCDBfQDvQ7k1l9FIX/he8VZ3a8mo2muUyviSZ6ujsfIsyIF2kcenTBJxQ=
X-Gm-Gg: AZFdTZdbtwKJQqZ+WHHu7xpzyvmcYs79Pk7VB1LhG1wnEI2yKPm6h9EABnqzRvsXyXf
	gNyq/Eb5iCSTu2YNXOrC2Qiu8II5LpI52/Bo9ArReVObau0rm+gwRVGLBdycWVBgzY6ola18YVa
	IH3k2NUosfN+W1rObfSXecuV71+Vvv+3ZO3ej2saFueDEsrjds1d7gm97FyN5xpYtnYauAxsAsX
	S3oxqSyrGBrh19Z+d2Ld9xfR9KwjV0cb3ze6S/cbsJIbk7whi34IRCdVz6p/SZkPe4WnyXj5p26
	emPyr1QTSVXqvzlRRCxdwvJ5JwoilNVTXG73enD5QIV1PnVD6+56FMBMPa6X+DK1gPi2XRvfmiA
	ci78TCOVg+NrNwDxUAelvhcQoD8sFU/f/U+CP4iA/9HhG7c7uXwKprxVWB2BN9WVc3JfUow9mdc
	/bcn3XLfvt9uCPrUiDB9H6OZOPTKE3r+8a7XWn4sBz/x85D4yzXP6Qjptd5ULzDAnxomqenfsX3
	NYhd8ZhmpdbJ8etb+ZTq7SIMVwRNO98DDLY+8sRow7XFiiVayiJWZsXPQxMKsq362Bfgq4C9L2P
	8PZDZmdzglWdbZxF+nkzFtHT1MJzJn160IqOx9cbnKrfuQ2jJcVsnAY5D++jqlTDlLAHCQ==
X-Received: by 2002:a17:90b:1c03:b0:3b4:1bf1:988f with SMTP id 98e67ed59e1d1-3b41cb138f0mr2343147a91.54.1795169422392;
        Fri, 20 Nov 2026 02:10:22 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([203.208.167.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe16sm3727321a91.17.2026.11.20.02.10.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 02:10:21 -0800 (PST)
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
Subject: [PATCH v3 09/11] mm/cma: centralize CMA pageblock initialization
Date: Fri, 20 Nov 2026 18:08:54 +0800
Message-ID: <20261120100856.16929-10-songmuchun@bytedance.com>
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

Early CMA reservations currently require callers to maintain CMA state.
This exposes internal bookkeeping requirements and splits responsibility
for the same area between CMA and its users.

Make CMA fully responsible for the state of early reservations. Pages
already handed to a caller remain owned by that caller if activation
fails, so keep their managed-page accounting intact regardless of whether
CMA retains the rest of the area.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v3:
- Restore managed-page accounting for early-reserved pages regardless of
  CMA_RESERVE_PAGES_ON_ERROR (reported by Sashiko)
---
 mm/cma.c     | 30 ++++++++++++++++++------------
 mm/hugetlb.c |  8 +++-----
 2 files changed, 21 insertions(+), 17 deletions(-)

diff --git a/mm/cma.c b/mm/cma.c
index 61fc59fa70f8..3e4366213b49 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -174,6 +174,10 @@ static void __init cma_activate_area(struct cma *cma)
 			count = early_pfn[r] - cmr->base_pfn;
 			bitmap_count = cma_bitmap_pages_to_bits(cma, count);
 			bitmap_set(cmr->bitmap, 0, bitmap_count);
+
+			for (pfn = cmr->base_pfn; pfn < early_pfn[r];
+			     pfn += pageblock_nr_pages)
+				init_cma_pageblock(pfn_to_page(pfn));
 		}
 
 		WARN_ON_ONCE(!pfn_valid(cmr->base_pfn));
@@ -199,17 +203,20 @@ static void __init cma_activate_area(struct cma *cma)
 	for (r = 0; r < allocrange; r++)
 		bitmap_free(cma->ranges[r].bitmap);
 
-	/* Expose all pages to the buddy, they are useless for CMA. */
-	if (!test_bit(CMA_RESERVE_PAGES_ON_ERROR, &cma->flags)) {
-		for (r = 0; r < cma->nranges; r++) {
-			unsigned long start_pfn;
+	for (r = 0; r < cma->nranges; r++) {
+		cmr = &cma->ranges[r];
+		end_pfn = r <= allocrange ? early_pfn[r] : cmr->early_pfn;
+		/* Restore managed page accounting for early-reserved pages. */
+		for (pfn = cmr->base_pfn; pfn < end_pfn; pfn++)
+			adjust_managed_page_count(pfn_to_page(pfn), 1);
 
-			cmr = &cma->ranges[r];
-			start_pfn = r <= allocrange ? early_pfn[r] : cmr->early_pfn;
-			end_pfn = cmr->base_pfn + cmr->count;
-			for (pfn = start_pfn; pfn < end_pfn; pfn++)
-				free_reserved_page(pfn_to_page(pfn));
-		}
+		if (test_bit(CMA_RESERVE_PAGES_ON_ERROR, &cma->flags))
+			continue;
+
+		/* Expose the remaining pages to the buddy. */
+		end_pfn = cmr->base_pfn + cmr->count;
+		for (; pfn < end_pfn; pfn++)
+			free_reserved_page(pfn_to_page(pfn));
 	}
 	totalcma_pages -= cma->count;
 	cma->available_count = cma->count = 0;
@@ -1020,8 +1027,7 @@ bool cma_intersects(struct cma *cma, unsigned long start, unsigned long end)
  *
  * The caller is responsible for initializing the page structures
  * in the area properly, since this just points to memblock-allocated
- * memory. The caller should subsequently use init_cma_pageblock to
- * set the migrate type and CMA stats  the pageblocks that were reserved.
+ * memory.
  *
  * If the CMA area fails to activate later, memory obtained through
  * this interface is not handed to the page allocator, this is
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 6a613d9c9332..7de65b540438 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3337,9 +3337,7 @@ static void __init hugetlb_bootmem_init_migratetype(struct folio *folio,
 	WARN_ON_ONCE(!pageblock_aligned(folio_pfn(folio)));
 
 	for (i = 0; i < nr_pages; i += pageblock_nr_pages) {
-		if (folio_test_hugetlb_cma(folio))
-			init_cma_pageblock(folio_page(folio, i));
-		else
+		if (!folio_test_hugetlb_cma(folio))
 			init_pageblock_migratetype(folio_page(folio, i),
 					  MIGRATE_MOVABLE, false);
 	}
@@ -3402,8 +3400,8 @@ static void __init gather_bootmem_prealloc_node(unsigned long nid)
 		 * in order to fix confusing memory reports from free(1) and
 		 * other side-effects, like CommitLimit going negative.
 		 *
-		 * For CMA pages, this is done in init_cma_pageblock
-		 * (via hugetlb_bootmem_init_migratetype), so skip it here.
+		 * For CMA pages, this is done in cma_activate_area(), so skip
+		 * it here.
 		 */
 		if (hugetlb_early_cma(h))
 			folio_set_hugetlb_cma(folio);
-- 
2.54.0

