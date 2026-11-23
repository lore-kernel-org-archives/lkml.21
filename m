Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795457915;
	b=JIKzAOi2s2NMEDdB5/rfyW9LmgiwBT7Pmxn16KnENsvQ825t+P6peD6HkyqCFK9m5Xbk
	 u+6eOa/08O5/77PSWv4sCTT2Gud7BweW8qmBM2IPzf63wZ/MgziN+8DXAxZAwGFIMcXpN
	 bH1xd/OpYNhsttjxtj0e9Xp0ka5+FNxKcQtRAFX+tmqstzOYS9c2pZLxSm/8JlBeBcHsN
	 uIPNXGfwcjCbwxlYTgGkdAgXUAsVeCITypmEPZ9YYnWro1Q4ki2eqvMn9I1Ne3qDSPSN1
	 ciWEsw7MToGiv0EK4Iw9qpwg+SEJDLbx25M5qvyu/6CaMftf6CDie6E1jxtaN5Z1YQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795457915;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CClaM17d8fZmvymfnrpm1hCIobp2fJDyOViMllLO/qU=;
	b=UeGDe6bCGhK4eMKQf1XIn5mZ65BUhJy/x5FO23wnoY2cc9eiNXW3IXvjSl6DjfovtK0/
	 oC/VTl2r3v9u+EOL3XSD9wtKAvnCavl3Ox7gT/IXP+AD/MyceMuXMsM6aOT5QfWVz5hzR
	 /D2kbxxXBItKFnKNs9GjecA1E4rfE5kV2dZygD0cWMSeyj5ecjLUmdgP7BJDXNoon7ESE
	 pvfmDiZy0pEKQz9zV0uQUdiIb4Do5ZolhGHEHn0T59H7QJSjDDDZXG4PdNkaWqPk0xQDb
	 KlE51HPw2HG4PSGfLLjlj770vkTWjv8a50x9LSoYQTm6giLeVIQzTfclgvcAXE6wn0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oo6en9sK;
	arc=none smtp.remote-ip=209.85.160.46
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBCA606A698
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:18:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CBCA606A698
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oo6en9sK
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-4b0348a4c79so2546677fac.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795457914; x=1796062714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CClaM17d8fZmvymfnrpm1hCIobp2fJDyOViMllLO/qU=;
        b=oo6en9sKFWkYeAXMOIiufETgqmMw9WFdic3TEvjpFNLH1A9ClyjdjvzZQmwgP25vrv
         LEgWNvSbQRxYxm98TOIaP48u0QfyWektwH/H8GH5VpcHyFkepU//U+DedU9/sOjergQq
         EILMEmCMeemfY2JC6TqusrvGl4Od7g5CsRRhP63gLPeJnPnraeng6p6Db2AnWdkwwCFx
         YKkFG2ekL7A9kmQP2n3ASNHZaKe8eubXrkA0+GvAHHeLEf9VLtfP2F0p5dIni9icZV8p
         gnz67mmvcQ6BHD3DkjtgA6reYlB/+XkHH3Fvyl1q7lFJPCwZHQEcgZBnUNKuii7ozFlm
         5W7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795457914; x=1796062714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CClaM17d8fZmvymfnrpm1hCIobp2fJDyOViMllLO/qU=;
        b=O7x/cLH9jpKeRRqIp7LdDaVGxK3LCQpRyb+F90p4E5/9oN0bJEAY3+9QMIItXfztBH
         GHCFnEdZvMPgwZEn/sPr0gGpL1VclX016xkHnu4EQbdVYx+M0Og1ScIBLDBbmQjSjpR6
         6K9L9/QU1Nnef6UqXI2rmzW4essX5xQrXmZ+ozI86nqccTQnnTR2slHBEDVsDT7bybID
         6qbbu/8jh210qDAYBzMIc8wfGp2u2LDbfbXnNvBbgyXz+HzrsBqFlXXe2iytU+b7Wh6s
         M7UiRzI+/po9hUOc1MQnlc3tP+TyyKDPsdm5xw/QzUfsPACGRbX/x0nj3nPL5+ESv5AU
         MedQ==
X-Forwarded-Encrypted: i=1; AL+hErFRKWAfcAqIZ+LAC5WykjHwTCPSjpQaayJwhR/1VCoVpkWZIzJ5AFYZNUnhqrnxTPCqm+2wuL3c1s7reqw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PPL7V5Dj9SoUxcf9oKHR6s5a7dl5yRHLkglm4Cypetc527k8T
	Gx+4yu9K1l5omgNsJNd5AaUsoZYguKMpCvM7BO75ucUSObKqLVedAUml
X-Gm-Gg: AZFdTZesEUkt/VFCfB/3ScFihT+eFJlRL9FiU29FrGcLeOFlyT+SGiiqxEAOjr4kkvQ
	qq+sgyanxQnCXsRGmQEaBdjMaHVoaAPJVZ7sIiIroxnKW3R/A7qIjqhr6X2IVZchnECxjGkgnEH
	+Ybjj0Jyqe0gZHuy53oLlL7V+ykOIGWTrGpgYqS5B0Kt4kJq/++6hte4z1HIpW6OrsE3cZO3UoP
	1NpJlHRChFEXxxUmXTm8VHeXth5SVACkevHqqvz1qSHBtMZ6uMPyD0lJUcL6jjJDzporv2dfJqY
	N/n0PlGCDYmqoHGf8TthWH3TtsXP/qR8R/rWPAf6MKrwcaRKX57i/e9mUkLlmPBRVes0jM0zqE+
	SOABQ/aRUz56Cs8p9CEvs7k8eSI6p0508ZYYJQ76boRNhP/02kUJhn9E8SEtU+eOYGCad8yunGZ
	Mc2o9fzW18H3B18wjxX5fZaqQ3EO7DEdQOyjT/y4frcRMZwZy7EyzzZrh0NwvXYbvesbFSRzeSv
	yGy/BK9j1MM7QKzXf4ijMEFt9fH0J6iTDc9LInb6PoH2syK1x/dJMm+g8aL81bM1YJyZcXc7c36
	UDzX5rQbHU4DoLn3a9DYwZW4UyKrGgIPOKPfrIeeH4/61MTDFEVN3ihN2fU=
X-Received: by 2002:a05:6808:308b:b0:55c:836:5950 with SMTP id 5614622812f47-57a0a91fc0dmr13549947b6e.27.1795457913993;
        Mon, 23 Nov 2026 10:18:33 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:8::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a347636b9sm9601935b6e.7.2026.11.23.10.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 10:18:33 -0800 (PST)
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
Subject: [PATCH v4 1/2] mm/page_alloc: move the kswapd node skip check into a helper
Date: Mon, 23 Nov 2026 10:18:27 -0800
Message-ID: <20261123181829.4065581-2-joshua.hahnjy@gmail.com>
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

