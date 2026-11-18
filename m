Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795043144;
	b=ICAc4Et8LtZbzkuGIk4smrY2jJbEvZny8P+msGzUwizC6Xck01YOtbZRRhVfubTiLWJc
	 maOd8iaYb6CiuoaAqbWP8wgCY/8JPI0CVnmOTlsOPOnKv9JAjKivWguimgPBp07IpFG9A
	 lRVrXQrvNUQzOfgSoiIr3Gi4BOE6jzc+hhTG8lq/wHjqIpCvsQOmhup7eUITDLmiHqU/S
	 t4/jsirae0BOQ5x74pFXDPL8/Op/W9VqdHNtw8G4oeLjgpMtAW6Nt2pSn5cy2OJylPYK2
	 Nu0FXyFEUlR75oCdI0yjpd76/+IHf7Je5j18s4mYnqwrI2RALLMOaLSWt/BFT+nnX/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795043144;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zhtdKe7IzyQSMaL2wH5+FyLh/ssntw5xQsfVmpbTGVw=;
	b=pIzQFtDkqpKHO1wsJ4LqbblKdkDEJTX33Xt9J0eH48gW3Ld8d0O0Ai+ZTgHyRmVTRaMC
	 ey55spIfddZntQ8jvsKCz9W7DeJA63vsJIOr6PQ9/lUtGMSaPMygPVOIc61b3cqIF67od
	 QV6JvJbgCt5pqgmoThcHpreWKZw0vkbXbBRo2SfxoyrYVWIITt4UogqG/hPC/3HyTzVE0
	 GkgFINqoT63RSz5iqBC/W/gCAEYdCnQk7uHJUNOp0MCha1crF60mKwMdoJgcCnsCEOi+f
	 xHLe5rmwlSX50L78L8f+KXM5f81r+kBM67TMZvdIW0AapmRPCxAUxcRi4iwzHF0io0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C+RemPaO;
	arc=none smtp.remote-ip=209.85.167.182
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5257606A331
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:05:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5257606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C+RemPaO
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4c5d8c7f326so683427b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795043142; x=1795647942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zhtdKe7IzyQSMaL2wH5+FyLh/ssntw5xQsfVmpbTGVw=;
        b=C+RemPaOXJeW2y3emjpGhju4fLIijRcvzMZU5eCpGopY3/bjF+ZkPKCWpyCAlBrUw5
         XQ4I8qGXrac5NN0MhqRr06Cn/iKppQoLk+Vh532Hznhs69JzEuhMA48Wrzs29qhEB7Ke
         yZc0PePB3We/EJv8hc9SJG1VRvCiY7ZwY3C64EpTiTYG6ZlyaMmIJpAYkBMRfJOEacSe
         6wG/lP+IYzYgZqjKjzp/JW34aJnmny8aKgYi5ubQ5T5puI3vjhraIR5GJUVfcvNCW42B
         sKB7YF5uwcBg4DdP9RA+w4jS9vKYZjrejheEkXlYK4mWIOyDaFdwJwolw2+oGXDpu1wh
         qcTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795043142; x=1795647942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zhtdKe7IzyQSMaL2wH5+FyLh/ssntw5xQsfVmpbTGVw=;
        b=RppSTDlAU625WMGiifY+YcA1O2XZ18pM5M+myOHpu2H4PsgL+Hja7MFol47gixfPbQ
         r+J6kXlSBGTKgM7UgB7SGNN6bdvyKRGGYtSmszDBgP5QZwMm2M4wpAKYfgCWe7oHnBGt
         i7h809/GFXoPIiTH8fuHV4qIkWk7h4i9HJXEGf8G/X+ZoJ6NVJ7KvpEvLYfuoPYzjJZu
         LAk6ikkTpIKkc7iKOji9HJAdPfQvy0HszySJoMtqzg+dgkqT3pFXGd843CAZlqcbHGTe
         uJIkHVRVW0lXPcg9vIp9cjJfnhNy5bt7dBN8fSEEKqcoJuz5rM76eCtRVE0y9DtQUosG
         Na7A==
X-Forwarded-Encrypted: i=1; AL+hErEMCCl6whwIdBMFvU9EOuqLb/NMsBjko5s3UXL6cVNQc3y49ANcCaOVwfLMX7YvSvZKDL1P4PXkY7jItEg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6qM0x7S3DpTfzMuTBpX9unVY5PiSNLvZZJwDQMSUJt5lFv/Wo
	1VpRBl4xQlBp1ccHx8PqllFUv6Ku2iiCfmzyfeQFEac7JwZiYECKtcaQ
X-Gm-Gg: AYBFou01IRkpHQm8PPaU80NqGeJFp7DEkY5CUugjJSIL421gWkPCrMr+bwffCEzsf6W
	9FGRJRtLk+A97EHYbrdInmyVmhYXGV0fZRyS61uRs0w0hkI+9Z/PgRajleMiodH5STm5OOuDPHt
	cMs3SkbxD0nfLBNvVvUpBtaD78XavLte6136XjxC6Wca5j8nKX5UDb8MQCurSy8KX/iPVMNYSeC
	lFIXXulhzxdlYP/Tu3RY8fjdV3MS4gP8yGIDHv4cwL8HWTS0CJuusoxPLt6ZDdT9/q9fblIm+Qk
	3GGvUDpDt1xvVGUhgSxKhEMKvyb+3b5fPJj6x8qu5xBW+EjAVVqfFpx0VauFtFDiSNlSxuLJT7F
	FsBlITU89D8eX7eH4OdPp2g2JYLrNoFmwPFN+KHJFXkBZLaQxES4X7rSyAJhjvZAoTx+IndalWa
	A1sSpP4pEWpcGIk6+nKz3+vGZxG6jm2FSkK4gAky1koxqAG6Q9WLW6V8LiRoV/cgpQ75vaS71gg
	66E9DvXAYilBwsTm+M3EAwNPU4rP6OrC5Pgpvfr/2ylCR+PdU72YLEczIfCMcwLLGGRzV4O8owl
	TYaAXUm7MAOs0w6XjeTjp04ObOFsB+p/z9JZnoA49vgSYEBWQtlXN2+hawin
X-Received: by 2002:a05:6808:c123:b0:4d3:6be7:c64a with SMTP id 5614622812f47-57736f96339mr4621068b6e.0.1795043142543;
        Wed, 18 Nov 2026 15:05:42 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:70::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5777ad9b96fsm2402083b6e.12.2026.11.18.15.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 15:05:42 -0800 (PST)
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
Subject: [PATCH v3 2/2] mm/vmscan: consolidate promo vs. high watermark checks
Date: Wed, 18 Nov 2026 15:05:35 -0800
Message-ID: <20261118230539.3789231-3-joshua.hahnjy@gmail.com>
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

There are three sites which all check the watermark that kswapd reclaims
zones up to, which is the promo watermark when NUMA balancing memory
tiering is enabled, and the high watermark otherwise.

Consolidate the pattern into a helper function. While at it, remove the
include for <linux/sched/sysctl.h> in mm/page_alloc.c now that the
dependency on sysctl_numa_balancing_mode has been abstracted into
vmscan code.

No functional changes intended.

Reviewed-by: SJ Park <sj@kernel.org>
Reviewed-by: Chris Down <chris@chrisdown.name>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Gregory Price <gourry@gourry.net>
Reviewed-by: Dev Jain <dev.jain@arm.com>
Tested-by: Chris Down <chris@chrisdown.name>
Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
---
 mm/internal.h   |  1 +
 mm/page_alloc.c |  6 +-----
 mm/vmscan.c     | 22 +++++++++++++---------
 3 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index 566cbd2dce485..8beb5b263ca1f 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -68,6 +68,7 @@ unsigned long try_to_free_pages(struct zonelist *zonelist, int order,
 				gfp_t gfp_mask, const nodemask_t *mask);
 unsigned long lruvec_lru_size(struct lruvec *lruvec, enum lru_list lru,
 			      int zone_idx);
+unsigned long kswapd_wmark_pages(const struct zone *zone);
 
 #define MEMCG_RECLAIM_MAY_SWAP (1 << 1)
 #define MEMCG_RECLAIM_PROACTIVE (1 << 2)
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
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 9959ca158ce83..9af50783fc824 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -478,6 +478,17 @@ unsigned long lruvec_lru_size(struct lruvec *lruvec, enum lru_list lru, int zone
 	return size;
 }
 
+/*
+ * The watermark kswapd reclaims zones up to. With NUMA balancing memory
+ * tiering, kswapd keeps room above the high watermark for promotions.
+ */
+unsigned long kswapd_wmark_pages(const struct zone *zone)
+{
+	if (sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING)
+		return promo_wmark_pages(zone);
+	return high_wmark_pages(zone);
+}
+
 static unsigned long drop_slab_node(int nid)
 {
 	unsigned long freed = 0;
@@ -5212,7 +5223,6 @@ static long get_nr_to_scan(struct lruvec *lruvec, struct scan_control *sc,
 static bool should_abort_scan(struct lruvec *lruvec, struct scan_control *sc)
 {
 	int i;
-	enum zone_watermarks mark;
 
 	if (unlikely(sc->proactive && signal_pending(current)))
 		return true;
@@ -5224,12 +5234,9 @@ static bool should_abort_scan(struct lruvec *lruvec, struct scan_control *sc)
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
@@ -7131,10 +7138,7 @@ static bool pgdat_balanced(pg_data_t *pgdat, int order, int highest_zoneidx)
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

