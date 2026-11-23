Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795457917;
	b=YxDZCcSAWBVtVQWQhB6VyFhl751iToVXcP0g5MjG2GGr13VllyIIdjdPIVpI23rks3+w
	 BA0SgAARHId8K6HdJlDks0HD97y0vaB96vlYr7Wwot0WeN5SAxNVBMTsAlA6CDB+Q7B4K
	 i6v38pgiVsNo0xnm5ncE60Ds3XuDMiUyWZflMHoAI9rxYyGUUI0z1yUOvFHjVdZbWQRbF
	 5w37b+PuNgEUmZhzgiDQsZWMjZNUMmhVa42RJq9CnJ7Trw/PAIOu+EzcvHSkyiF+ZH+Qp
	 G7Lmzrl5W4JKcesgfWQA2uKq19PHYpvAXonPvtPVrrp3C6pHhqJzTgQ86NHfoBAoD1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795457917;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/43k5pTWIv/t2nwUcNlmOb5MgiAXp+k+bgS/lUNVtEA=;
	b=ZoQ0aPXI0WSVpm45HcPXfztAoBMT/q6RlTuo12um7nw8HRQ0ICy3G6nQZz/ZcJLgkYt2
	 ouILA0cK+6znnoDyl4kFiWQVm8Bg+megxAQY5yjDxUSb7GQaoABU5OLacce3x3eQxIYmL
	 lQWoIgW2pDH+6UOUULmVxq5BwYf2hsoCFtPHUARMY6+5ehWym+cCLNQmMRpQZcChicTxm
	 Y5IAcH1dRgBr4k3l7rmn8UCJ2IdKT0NpEfNzFGvBwafRa0erP4Nvs+ClMv9thBORyAdrc
	 xBt9MXxjeLk8N84m+5Jp1AYJvYUpB6z8Dx5AX/nxp8ZS7CApCZuJg3vZ/lzTEUcHd2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="jdhA/DBP";
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB5160A263A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:18:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CB5160A263A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jdhA/DBP
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-85a5455bd3cso2074541a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795457916; x=1796062716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/43k5pTWIv/t2nwUcNlmOb5MgiAXp+k+bgS/lUNVtEA=;
        b=jdhA/DBPwzhYF4GVC2f7orMYDFF3tGnzklGBiPXDddObtGcbJ7PDeUzlPf7Aaco5az
         30Nf9utFlcwpWG66x8p92GOpDS2ehcRMPD79TTC9QLISwxg1m61AT1Wso06edetsTRlA
         wRAJNI/RwGHCmGtMmxVTmjZE3ZZZW5dG6/XjfN25z+v1yA/eH5jl6FzW0x5RXsrwISNS
         n3nkkJfKCk44shr4L4ISH1p6Zv8/Sd/AZGGG5yae/oMEuxo/7yXGvJgU8KlcbIUYLrKg
         TmxBuNqBpJhZxIXoivSbQG3iVno8uvTIlxPM6TTenZpOhoVQsOvKUCq+8wR85IA4KNXU
         mc5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795457916; x=1796062716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/43k5pTWIv/t2nwUcNlmOb5MgiAXp+k+bgS/lUNVtEA=;
        b=nji8MB1v+6CqRaWaVf1S8+wXTEoVxcv8d+f/iEL4JKqHFAEzMV+aKZo1r9iGUCWMfu
         uKsJzlMB+zFoXjVAmpvhkBUNbFXxcTPpvL5EEQdXwoRr6iR8fsKmdRj66AUtkWpyoTgY
         CGQNzovFuPdD0S/RVseUM6pbFiNOvQV4uVxDVOo3LLQhSLE92qBmhQKFMUQhXb8EXA37
         gHZPrY1T3kRpFgdPikdj/Yp0ahgSZmbbiEV9yHhLe4THgn53P++we78JMHJKPj4i1qZY
         dQEkkLql1z5R+fCE1hZkEVXwsdUvEdEb1qV0pvnZVqiCkLjp+Wss3QxiiL2HHtrhjCH/
         7h6A==
X-Forwarded-Encrypted: i=1; AL+hErFO9lZzlLFRZjpTyO6b41ErknSMnrEDPfyS5hkVgvnd4vO33n4eAzlmysGcoAyI5zTYMbgXJXEH22OQkaY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Zq8bgWQDjSeUnzftoPeM2Yw2tcn2o4TK7DeHfjJxX9aJC2jEC
	8r7Lh9PrNSgRrHpCEoXVcFc6g64TkTP3idQKfLyAyB4iBS3PsPgzFWWYhpAgFQ==
X-Gm-Gg: AZFdTZc7H1CsIW4qauEqIPPJ2dLBGWXisLxOqApYD9jz061Zl26lBVMGeGjDPjFmLbt
	Flj7skTE17ixO7jBnfkhtqRyysZMz9KeFX+/TnwltWl1+Sv1Ov5N9li4zGoos21fR+jmWDTTV9Y
	NSpWRw3xyf0lvN3yY6oyeM99W2Ds4cLdm8uomSzC7Cjt5D3YKH9bRPoD5LOoGfcZAOAh4ptW9yK
	0QnO9/1EPOCwBOVvInhAtunpz6LGeLmXXElxAZM0Ugox7AO7vw08ThXBG0AD4yMyDUXgBhGzhdT
	Vcpfzc84ID1zDsIIB07uAW9l4VhDfie+ZTudBlKklEpBiMAzZnNKmosXalaiEUTv7rlCATVZe6l
	G9k39SRH15HvnQvxkFW3PQpnrgllqZRt3C2kuAkDHxqyiofbqdyiHHZ3TJb+NQNy2Znm/iDOXqC
	75rmzkdz4jJloAQAkJNgZB1QF/TNwvhf1tVN+BJ6zj2UEPFc8gBDTqH+TZ2BvCx0U9Yvy/efBbC
	prPQFyYM4wYL3KyB0LBnk4z/z0ouEWEMHPxNvpTZh2JsJCQ+Bfa5QdThA/4VI57HZZyY/6Ghv4c
	IxWAqiWjWoG0K4nhsU/OXg/HvtdlqYjkQNOCmsWSmUTi4ReO0T840B9aK+CIYFZpfEYlacUBt2j
	cQoCw
X-Received: by 2002:a05:6808:508f:b0:4c4:c7cc:f8ee with SMTP id 5614622812f47-57a0a20af5fmr14670396b6e.13.1795457916164;
        Mon, 23 Nov 2026 10:18:36 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:8::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a350548ffsm8822372b6e.11.2026.11.23.10.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 10:18:35 -0800 (PST)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Zi Yan <ziy@nvidia.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Dev Jain <dev.jain@arm.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v4 2/2] mm/vmscan: consolidate promo vs. high watermark checks
Date: Mon, 23 Nov 2026 10:18:28 -0800
Message-ID: <20261123181829.4065581-3-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261123181829.4065581-1-joshua.hahnjy@gmail.com>
References: <20261123181829.4065581-1-joshua.hahnjy@gmail.com>
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

There are three sites which all check the watermark that kswapd reclaims
zones up to, which is the promo watermark when NUMA balancing memory
tiering is enabled, and the high watermark otherwise.

Consolidate the pattern into an inline helper and move the dependency
on the sysctl.h header into page_alloc.h.

No functional changes intended.

Reviewed-by: SJ Park <sj@kernel.org>
Reviewed-by: Chris Down <chris@chrisdown.name>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Gregory Price <gourry@gourry.net>
Reviewed-by: Dev Jain <dev.jain@arm.com>
Tested-by: Chris Down <chris@chrisdown.name>
Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
---
 mm/page_alloc.c |  6 +-----
 mm/page_alloc.h | 12 ++++++++++++
 mm/vmscan.c     | 11 ++---------
 3 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index e7a7863e381ab..31a670eb4832c 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -45,7 +45,6 @@
 #include <linux/mmu_notifier.h>
 #include <linux/migrate.h>
 #include <linux/sched/mm.h>
-#include <linux/sched/sysctl.h>
 #include <linux/page_owner.h>
 #include <linux/page_table_check.h>
 #include <linux/memcontrol.h>
@@ -3805,10 +3804,7 @@ should_skip_kswapd_zone(struct zone *zone, unsigned int order,
 	if (waitqueue_active(&zone->zone_pgdat->kswapd_wait))
 		return false;
 
-	if (sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING)
-		mark = promo_wmark_pages(zone);
-	else
-		mark = high_wmark_pages(zone);
+	mark = kswapd_wmark_pages(zone);
 	return !zone_watermark_fast(zone, order, mark, ac->highest_zoneidx,
 				    0, gfp_mask);
 }
diff --git a/mm/page_alloc.h b/mm/page_alloc.h
index e238ee91ed245..4fed0342a99f2 100644
--- a/mm/page_alloc.h
+++ b/mm/page_alloc.h
@@ -9,6 +9,7 @@
 #include <linux/mm.h>
 #include <linux/mmzone.h>
 #include <linux/nodemask.h>
+#include <linux/sched/sysctl.h>
 #include <linux/types.h>
 
 #define ALLOC_DEFAULT		0
@@ -304,6 +305,17 @@ static inline int gfp_migratetype(const gfp_t gfp_flags)
 #undef GFP_MOVABLE_MASK
 #undef GFP_MOVABLE_SHIFT
 
+/*
+ * The watermark kswapd reclaims zones up to. With NUMA balancing memory
+ * tiering, kswapd keeps room above the high watermark for promotions.
+ */
+static inline unsigned long kswapd_wmark_pages(const struct zone *zone)
+{
+	if (sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING)
+		return promo_wmark_pages(zone);
+	return high_wmark_pages(zone);
+}
+
 bool decay_pcp_high(struct zone *zone, struct per_cpu_pages *pcp);
 void drain_zone_pages(struct zone *zone, struct per_cpu_pages *pcp);
 void drain_all_pages(struct zone *zone);
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 9959ca158ce83..158b888ab370d 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -5212,7 +5212,6 @@ static long get_nr_to_scan(struct lruvec *lruvec, struct scan_control *sc,
 static bool should_abort_scan(struct lruvec *lruvec, struct scan_control *sc)
 {
 	int i;
-	enum zone_watermarks mark;
 
 	if (unlikely(sc->proactive && signal_pending(current)))
 		return true;
@@ -5224,12 +5223,9 @@ static bool should_abort_scan(struct lruvec *lruvec, struct scan_control *sc)
 	if (!current_is_kswapd() || sc->order)
 		return false;
 
-	mark = sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING ?
-	       WMARK_PROMO : WMARK_HIGH;
-
 	for (i = 0; i <= sc->reclaim_idx; i++) {
 		struct zone *zone = lruvec_pgdat(lruvec)->node_zones + i;
-		unsigned long size = wmark_pages(zone, mark) + MIN_LRU_BATCH;
+		unsigned long size = kswapd_wmark_pages(zone) + MIN_LRU_BATCH;
 
 		if (managed_zone(zone) && !zone_watermark_ok(zone, 0, size, sc->reclaim_idx, 0))
 			return false;
@@ -7131,10 +7127,7 @@ static bool pgdat_balanced(pg_data_t *pgdat, int order, int highest_zoneidx)
 		enum zone_stat_item item;
 		unsigned long free_pages;
 
-		if (sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING)
-			mark = promo_wmark_pages(zone);
-		else
-			mark = high_wmark_pages(zone);
+		mark = kswapd_wmark_pages(zone);
 
 		/*
 		 * In defrag_mode, watermarks must be met in whole
-- 
2.53.1-Meta

