Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169431;
	b=WCxAsI1gJ228O4JeyZKz1998Whe+nd81YGPp84N5aLp9dqHkuj4wX/etX5P3+aJC18MR
	 /26FN147r7MZ1q6bIoYRmPWIYuge6Uf8Ec+8x1jD3tt2SNmiQDj5S8To2T4dOPgf117GB
	 cYbbLHElWAf3irH2HUSHgKEHkPZrxkNaxlG+uTnMC3XxIzPql0W/TZtnLgz86kWMvDisQ
	 J41xI1CNlbD27+j49ekIJYl1ElBdaw7Votk5gMyroCg2TVA+bMumRyQbKMABd3xGM5586
	 UUrVX9JhNmOGTlHDM6+jjR5twJszP/fwHsDdDdtw1K2YmspJ7yTIbIz8C00rtpO3Mig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3h1F4bfrrG/5W0dnCqnhBL9+rOly79IhG+yujXIhJqY=;
	b=DKSLLzPV8w3uewQxLqDwJYi2Yct4bg2BEUk3W0IzUL1ikpnofQM9ZB8YKt5ascciFi01
	 JmFCMJM8gJXxsPbOUaBmS40DiX8dhMbybwPHY5lUVz7zvcI3u4JmnuGzbENzQwqIm4yGY
	 Snnxvr4A6M9PICitPZNNK4Ausn9IV3JrZNt8fCTvFi5Z0Xp9nx1HVR6kp2j0d0zniLZjw
	 1L3h5G92+WC4I1eNuAFMH5hXdcmbOOmCSUbr7ilYsc2UENP1UVoObv0/eBNCbvuKMfx9R
	 Ghpuei3AbbDnMzE+RDjwakZEYkXHJMV5UIk7G5z67hOF3zNkmAUWMK2v8vh5+nkOI4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b="K/rAHy+y";
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526A8606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:10:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 526A8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=K/rAHy+y
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso1676716a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795169431; x=1795774231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3h1F4bfrrG/5W0dnCqnhBL9+rOly79IhG+yujXIhJqY=;
        b=K/rAHy+yL2v7kapNiAjpAQBP6CYSWzBNJqXMhqqRrA5gv/XJU5cWLt5OcHxowrQteg
         SiEtVdJ3Np1wmc8DDzik4sagrkJeLwldes2M53OhtelTQ8KoC9LuAUw+ZLl3jTBtoKxU
         uFmHL1CgM4NPEzTsB6Uz2V0tslMUT7TsFRft3toYW9ASqZuv0OFQRKoWHpqmeHfYtT33
         vKRZYRLjM7Cm0bVGyJ/Vgbb/toFbKHqepInNj3w9AZ0fyABp9yxrjisnKlfLjStSAqn0
         rxdESjeqvizCQK5Fp1kDiyIAjCEHqVhEvoGlEl9tG8qlZG2DusLZKbv1QqtTMKfiuQjE
         Y+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169431; x=1795774231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3h1F4bfrrG/5W0dnCqnhBL9+rOly79IhG+yujXIhJqY=;
        b=Epg/iPY7EPP2l/SKDnEeW6B/IUwxvkpfQ5hxnp+vbEIv4ev2sxPyspRJVuQtYO7di7
         kegqOWOWSy9908kLwYWnY1U14KrT1KcFWSlZscKoS3no1UOlX3enAvs2ZikV3R3xlqo9
         lM7B8swI/So5HKse2eJHIFeAVTjtTHv+Ycvyea9g7R4lR0VuYYhim5KEn/3CnfZJVixs
         66CKyS7yXkwQvZhGEruM/bw5Ue1DOT09J97qm88IgDcD28QfwMvyIv+PG2URROU/KJb6
         m6jW1J6EDUjgkrPA3BlC9+ZSbR24sG8i1KX0k5Xm+CNDDimhGVD7JhE7PF486BvMzQeQ
         6v5w==
X-Forwarded-Encrypted: i=1; AL+hErEe3dmNxOM3lhtIrlUVi+4Cil1GCY4WvpZsMI/dzExc5sh/iy+c317TWpP9NEuk9MYN3Fwb9krEkk9G/zY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BaTXEYvpm19MEZfbFuhStRfgyQqeb0k2jw9UKyQw04j2geV2C
	crV0JPHvdNMGA0fpVhtvNV7yFZSK8KYqk7A3BKDG0jAMSB5SNzBnLsDwqq0kPC/hbEQ=
X-Gm-Gg: AZFdTZdJj8YNLox0JTuztgXYL1fuiq/adHsPSzoqLKmxRcVGWS8GGKyoZ94i4688NMr
	HX0O78s9jH8Pfn4Z9nUJe7f4LcN9gqHhtCHzExW0Q5CCnC6gxs4ZOkw7l9bjJyahS6VgHML9KNS
	8YW4JJ37JXAuGmiJ4aPMkrCLR+CIb+07F/yb3KavNiJR6v4fNRkfgeeFEjomMDcge23xDY5nat8
	Gco/js0bpMCUIJnHqjyoojXS9+qz0n8B0AToX/tHFo8Azsa2aOmRtmVgmJDkpud+Lj9I5n/Ptf+
	ENtIVnk94i1Sc+MGNA6YbOLiOAwZbFjFgUPhC1yIc5U1ZAhMR4zgc5Lh6yyQSW/XPUHWJfuIHtC
	5qiuIOLuar1Qh/bt6vm5b5VckCFs3jV7qVaR5K/FiYFG0FteEGbQFCL70eMMo9QE3QcJ6C7/vjv
	7MKLN34+jEOJh423joT4RWzZEfSR8y54PPr6e5XzKX1bTFYAABcJShWJY/eiS7Zw1s5tL7nP+YN
	YxTWeKnYVrlZxXftY/kJZgx5PSvNHxAeOyisY5xkgGNQT3sK/VcBl6vjXtAN2TmfwcOhs4M215a
	DuK+SRTfUcpWFQW0m4NV2vUY5NvI51+qH5gjvjns0zYaOrmpZPYRl6b/wPSVfKULZ/nevQ==
X-Received: by 2002:a17:90b:3f0f:b0:3b0:9409:6969 with SMTP id 98e67ed59e1d1-3b41c90813cmr1787586a91.19.1795169430523;
        Fri, 20 Nov 2026 02:10:30 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([203.208.167.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe16sm3727321a91.17.2026.11.20.02.10.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 02:10:29 -0800 (PST)
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
Subject: [PATCH v3 10/11] mm/cma: localize init_cma_pageblock() to cma.c
Date: Fri, 20 Nov 2026 18:08:55 +0800
Message-ID: <20261120100856.16929-11-songmuchun@bytedance.com>
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

Move init_cma_pageblock() from mm_init.c into cma.c so it lives
alongside the CMA code that uses it.

No functional change intended.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/cma.c     | 8 ++++++++
 mm/mm_init.c | 9 ---------
 mm/mm_init.h | 8 --------
 3 files changed, 8 insertions(+), 17 deletions(-)

diff --git a/mm/cma.c b/mm/cma.c
index 3e4366213b49..0c97aadcfea4 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -31,6 +31,7 @@
 #include <linux/kmemleak.h>
 #include <linux/hugetlb.h>
 #include <trace/events/cma.h>
+#include <linux/page-isolation.h>
 
 #include "internal.h"
 #include "cma.h"
@@ -149,6 +150,13 @@ bool cma_validate_zones(struct cma *cma)
 	return true;
 }
 
+static void __init init_cma_pageblock(struct page *page)
+{
+	init_pageblock_migratetype(page, MIGRATE_CMA, false);
+	adjust_managed_page_count(page, pageblock_nr_pages);
+	page_zone(page)->cma_pages += pageblock_nr_pages;
+}
+
 static void __init cma_activate_area(struct cma *cma)
 {
 	unsigned long pfn, end_pfn, early_pfn[CMA_MAX_RANGES];
diff --git a/mm/mm_init.c b/mm/mm_init.c
index a427477483d0..e0686b87fdb1 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -2202,15 +2202,6 @@ void __init init_cma_reserved_pageblock(struct page *page)
 	adjust_managed_page_count(page, pageblock_nr_pages);
 	page_zone(page)->cma_pages += pageblock_nr_pages;
 }
-/*
- * Similar to above, but only set the migrate type and stats.
- */
-void __init init_cma_pageblock(struct page *page)
-{
-	init_pageblock_migratetype(page, MIGRATE_CMA, false);
-	adjust_managed_page_count(page, pageblock_nr_pages);
-	page_zone(page)->cma_pages += pageblock_nr_pages;
-}
 #endif
 
 /*
diff --git a/mm/mm_init.h b/mm/mm_init.h
index c03413a090eb..9ee9bcb8e672 100644
--- a/mm/mm_init.h
+++ b/mm/mm_init.h
@@ -40,14 +40,6 @@ struct zone *pfn_to_zone(unsigned long pfn, int nid);
 void init_cma_reserved_pageblock(struct page *page);
 #endif
 
-#ifdef CONFIG_CMA
-void init_cma_pageblock(struct page *page);
-#else
-static inline void init_cma_pageblock(struct page *page)
-{
-}
-#endif
-
 /* Memory initialisation debug and verification */
 #ifdef CONFIG_DEFERRED_STRUCT_PAGE_INIT
 DECLARE_STATIC_KEY_TRUE(deferred_pages);
-- 
2.54.0

