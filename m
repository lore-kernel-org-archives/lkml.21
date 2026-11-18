Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795043142;
	b=hmCjrhvcDh7WnSF18z+DFJRYPVxvw+ACJOBEehwJYbHC1Grwa87xUkGfWgV5sNiQFtzh
	 Z4QLxnlNz50b0ebz0Ejb+QFAI7EuLXdisn7NGM0m5Qm7h6f+oH9VZlKhUAN6xXQm4I7jq
	 kJI7Z0RkS1k7Dd2ya8sR4m2BFElDS8/Nr+OSGM/g7wgdEd8IZJe6Dowgjh+QlpTSyKmwX
	 mjQAbMR4jiliQRwacEupjVAEC3evcUWUnMu+IfXeZXz1b4mH5HP7296lsN9ZclZZp9mwi
	 RhBquHWscYI7XukWJ8uUzxMtCGO/6PqPmpD60WDbT+DHc6NdVgSqb/HetYznsnCzZrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795043142;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CClaM17d8fZmvymfnrpm1hCIobp2fJDyOViMllLO/qU=;
	b=LchJOZn/dNskBJzeJ4HGCXKWjGKqYOpeL8U9yWZnhSSNIc2LQE4keZstHEo/9Srsclpe
	 nynu+dtPLC5anoSYcDEMRksudeKm5nEw0zYDuxCZkPkirYSNVIk52uxH4IACVg4VKG/RD
	 UT/GRSUSIjtky2DaVo6w7Jak4QgfMGpHgYqoeDBCAvd6qmxRwHsRy9SEVUg3xrCoOtBwV
	 8TIBlYjaSKFP9DrkCQFF0SwJDC+E3B5hDNLM/a4Ik/b+FuBoaLPCNeN/xoauvR3Nbul94
	 F1yxfbrvo6YYVBV/hjLj+xhJ3zoBPiwOFkdVli5e43oxcUdDkHTPhBzznbF4qyDG3rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YCqTSEFw;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58901606A339
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:05:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58901606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YCqTSEFw
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-70b875f6f1fso1379431eaf.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795043141; x=1795647941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CClaM17d8fZmvymfnrpm1hCIobp2fJDyOViMllLO/qU=;
        b=YCqTSEFwMIYfKqA2diSnjjWk66XcUlNuSANHqRXX6XdX5D3xL8u+HMjifnjNIV9bIg
         rLaOvEF8jxxppFx1qhLW433ECCC5REwh7Lrnwu1p88UTi7u+ugw6rmOQ7BO1Y0p7wvhv
         BFhrMC7DOiTKVpGgxzeAMez9X/cTfwk/z803Jb4GxQlGxPBOYj9CRjXcVlDwDJi6szBF
         Zb6mKFsEibtmTTmAzCnOFCdS8TIO4Hv6tRACjIL5PIlWP/LD35PgJnEMoIxUXTh0ujjp
         VWqSe9mWIxEe4v/X9pmpmGYAfKPISlb0GJWDYROiC3OkxFCXI4GW/JRTtbSUcLTIX627
         ICaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795043141; x=1795647941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CClaM17d8fZmvymfnrpm1hCIobp2fJDyOViMllLO/qU=;
        b=v4E5YOi9XVmZoIPLBZVcLbRCfjvB4q/lzmkacba824YjRnQcutA+Lbw8ZwzUucqZMg
         TBnwNHTp3f587Qi3oFLaBoflL31yHnGO3DLIbOoO4WW0IPnNKw9+V44OezcKA/HENK1t
         XuX40ljeOiYr4j4UzYjimyAezmNzhj2MRw+4n1RI2JotwMaVMw0TaceeXfi5nCgcHuoZ
         40+VMWeidrW3rD4S0DwdCdOeCazEtsps5FZoHv7+e+ejNbnCNhFu+kmpH7CbcEwcAJCT
         mwWsIwQUpW8McgcSr9ta7/r6Vi6fS+WPViDTjM4uu0AHVkNyaOqShlBN4dBjxUDlWlZm
         v9MQ==
X-Forwarded-Encrypted: i=1; AL+hErEZbLCt0H4/XQa1il7SgoLzcej3/OYEm8RgCqiUr2XZZgEORUYBU/P/wphNpQh42CgNMqz2oELnOXfibgM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Qtj0tyr3DCzVD2sluB/FOW2FwwV2nlTYRnL3ERfJ6rvT39n4H
	anuA97ka3X3SsLtocW1mNKe+fGMFMJZnwsyGRHRNhgst99Rvxicyd30s
X-Gm-Gg: AYBFou3IzfT6UthGk1YGt2+i52q47+DymGlIFEXsI4nQq23oXDArfIcrwSWsSzuKg1q
	1JA35lYNLvrua7ZWgLpt1bU57l397l4mcBtFGrMgwLYeoKBmKOGJCZKDsHXVT2b8Y8pG8JLwTor
	YJKU/rmnrDgLQfrzJz9X6jSqL+K0UtXEHm0pmeLZpMoNeUS88xsyu+OcXmy6kmwOfs9V5q31cjY
	rWfmvfLSsy+TaeNXypVdtmTVu5eH8J/EcroN6oJZmde1TbFnp6MkW9Vt8B7J4b0FKDLlve6pE0r
	vPMzbtqbWCbwmeNn+xQUjdwwV5WL83Zb2B0tE3qsLOEfXFXuK8jnRrha0991A1Cojs1s5BJc6sj
	x5UewgKcdILTclwEuA7NrejxwsLpDcU2N+PMPa+MKHefEGD8lZLzrQAx5Ze4F99Kxhvp5B2Nf8u
	zglimekptD8pBblcDAzG4DM1mArGuCyBho/IuOiM2Br41Si2YEwRuCYgpFyhvKYORCX5mER9EGJ
	Tm9royKR48SkRVckQIEF2rNLx9WQGaAwwAMbVS70c7Svz8G112phodm28mqTJq0CPV7XAPWoFuw
	HzNan9Y7E/3TWyQJwtttMoYNLBEo43AYLlG5ECLj6iAVbhdj8+wyJjlUlF7AWQ==
X-Received: by 2002:a05:6820:a510:20b0:71a:eb23:a7d1 with SMTP id 006d021491bc7-71b1864ee8dmr2434637eaf.53.1795043141166;
        Wed, 18 Nov 2026 15:05:41 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:41::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b744126dfdsm3565223fac.10.2026.11.18.15.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 15:05:40 -0800 (PST)
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
Subject: [PATCH v3 1/2] mm/page_alloc: move the kswapd node skip check into a helper
Date: Wed, 18 Nov 2026 15:05:34 -0800
Message-ID: <20261118230539.3789231-2-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261118230539.3789231-1-joshua.hahnjy@gmail.com>
References: <20261118230539.3789231-1-joshua.hahnjy@gmail.com>
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

get_page_from_freelist() checks many conditions for each zone, often
with a big comment block explaining the conditions.

Move the kswapd check and its comment into should_skip_kswapd_zone() to
make the zone iteration cleaner to read.

While moving this, also resolve a checkpatch warning which complains of
a waitqueue_active() call with no corresponding comment explaining why
the lockless use is OK in this case.

No functional change intended.

Reviewed-by: SJ Park <sj@kernel.org>
Reviewed-by: Chris Down <chris@chrisdown.name>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Gregory Price <gourry@gourry.net>
Reviewed-by: Dev Jain <dev.jain@arm.com>
Tested-by: Chris Down <chris@chrisdown.name>
Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
---
 mm/page_alloc.c | 49 +++++++++++++++++++++++++++++++------------------
 1 file changed, 31 insertions(+), 18 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 9e1261521b6a3..e7a7863e381ab 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -3785,6 +3785,34 @@ static inline unsigned int alloc_flags_cma(gfp_t gfp_mask)
 	return ALLOC_DEFAULT;
 }
 
+/*
+ * If kswapd is already active on a node and the zone is below its kswapd
+ * watermark for this request, keep looking for other nodes that might be idle.
+ * This can happen if another process has NUMA bindings and is causing kswapd
+ * wakeups on only some nodes. Avoid accidental "node_reclaim_mode"-like
+ * behavior in this case.
+ */
+static inline bool
+should_skip_kswapd_zone(struct zone *zone, unsigned int order,
+			const struct alloc_context *ac, gfp_t gfp_mask)
+{
+	unsigned long mark;
+
+	/*
+	 * This means kswapd is asleep, so don't skip the zone. This is a
+	 * lockless check, since a stale result only affects zone selection.
+	 */
+	if (waitqueue_active(&zone->zone_pgdat->kswapd_wait))
+		return false;
+
+	if (sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING)
+		mark = promo_wmark_pages(zone);
+	else
+		mark = high_wmark_pages(zone);
+	return !zone_watermark_fast(zone, order, mark, ac->highest_zoneidx,
+				    0, gfp_mask);
+}
+
 /*
  * get_page_from_freelist goes through the zonelist trying to allocate
  * a page.
@@ -3796,9 +3824,6 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
 	struct zoneref *z;
 	struct zone *zone;
 	struct pglist_data *last_pgdat = NULL;
-	enum zone_watermarks kswapd_watermark =
-		sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING ?
-		WMARK_PROMO : WMARK_HIGH;
 	bool last_pgdat_dirty_ok = false;
 	bool no_fallback;
 	bool skip_kswapd_nodes = nr_online_nodes > 1;
@@ -3865,22 +3890,10 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
 			}
 		}
 
-		/*
-		 * If kswapd is already active on a node and the zone is below
-		 * its kswapd watermark for this request, keep looking for
-		 * other nodes that might be idle. This can happen if another
-		 * process has NUMA bindings and is causing kswapd wakeups on
-		 * only some nodes. Avoid accidental "node_reclaim_mode"-like
-		 * behavior in this case.
-		 */
 		if (skip_kswapd_nodes &&
-		    !waitqueue_active(&zone->zone_pgdat->kswapd_wait)) {
-			mark = wmark_pages(zone, kswapd_watermark);
-			if (!zone_watermark_fast(zone, order, mark,
-					ac->highest_zoneidx, 0, gfp_mask)) {
-				skipped_kswapd_nodes = true;
-				continue;
-			}
+		    should_skip_kswapd_zone(zone, order, ac, gfp_mask)) {
+			skipped_kswapd_nodes = true;
+			continue;
 		}
 
 		cond_accept_memory(zone, order, alloc_flags);
-- 
2.53.1-Meta

