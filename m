Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795035832;
	b=BS0aqs2jQqlaSgbruhK5dFh8NqnWphwDihPBnDSFjM0Dpp6QWp8QYTEqQAwmQMMJ54WB
	 gHZGFAUg4RVorON0zegZSqZvy3sDuIrdAgP9oL7wlyLjakNFdfv4qXbKyQ0Ieozgy/T+t
	 z5hdlWNx8C/Qh/pvO5gIE3OpnsTkbpUPMF8FtCi/Kc2Ppg/3jHHAlhRxvp7+8gBlBWNqn
	 SvcVDXkaLWMRvzvP8/xkRqMwytgeXbkFsf8TIWaD1kzVJsNsEw+fE4VIzXgDx+0Cr0O/a
	 +9Ou2fn429dv8jsXElngMUrrDpEJ8wThdCoateELBroSFr3njQ52q//apNGbH+Qc4kQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035832;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FZiehOo0Bf1P5SRqogf/poqTftsKsN8SeO2iYKxqJA4=;
	b=d+aaYHCCMx82jd3mnJUm/7l+iN82BR0K6h4k+fnvEwJwlpRmHsCwfJhXfAMVNGrpH0hV
	 vmRnB3hOh9u83K4g71vPakgZzHmy6IDQaIdZi3OsEYwKwwup20WT+jhTr42MDiu8QfdL0
	 ScjEmKzVClxSCfhNepCtjDjdfGqCJhnf1NzQD9lMfT9Fd8E9isYluDLS8fuzapUqdmLeh
	 w4hV2zXQecWTg3ohJ2QpcJjoPjG51Fe4kbT4NjU6T74ZYMj5XCn7TpBTK2d5Pk/lfj9Vg
	 YQiLLc6XeaiUIW/N+ipw0sswaJOj2dUde1AK459cgJXFVOuZ0izuzqAa5wjo6hYFPLw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PTz3ws8H;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E1D60A380F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PTz3ws8H
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795035832;
	b=XPb4PsKlcX8BssrfhVYBuL13tGMbZcfl+dZRTD0JW/3xwEyrJOmh9ZoFTbSzyfMVxEZE
	 4o7D1YpguyJvHlKanJAgUmpL8jB3tExgGKaO7lZj+GJ2YJ8NWpJUCM2b5/m0/5hYqxEVr
	 kZEw7xD9X3D8CFqSRiKMBKB1aSMbqhRGDD18Noeap5TzY3SBfdlW5orNTp33putcr2Rrr
	 SM9RJx+BsB6UA6TlHKtGjIlRTSN3TcnAtT0kxi8wIGFvMih5tDURrZ+rrE9irUCx7nSVl
	 5lLMo5jCcc0rafus2gJbu+wtGZu5M9txJgc3aFNh9Pvbzmkridcot8LoJmIWGsFOg5A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795035832;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FZiehOo0Bf1P5SRqogf/poqTftsKsN8SeO2iYKxqJA4=;
	b=1up9InLE/DqHzDL/kOYPCWNBJAKS6V4JT4YMlcYTsa37oToIuOA6lXXRUr42Q2oWsPeJ
	 jNJxjMixiLhFsAStzQV6HeGRJbW4ybMhq3XUHRE8JSj1lN3kAkAPZKgzB8nuF+LsKh3ZQ
	 sBO6zXoco5SYGeWfogWeVNcsWRXiB2hXYJ5BNMvCGHaRs1vx15EUqP2zIQvo2sBiPPPi/
	 sPAxgX9mLQ7LnUjUuxFEWf7STXjvfRvyoA/4GHg+WBgCeOh5RhskgOjBHc5rUH+Cg/u98
	 +UNpY8RCEYz8zGanDI3kMsvIdSFyjdGAH3q5443pY5UEy0pXJ/ACkKbOp4NvVoQ5x9w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9DE9B1F000C7;
	Wed, 18 Nov 2026 21:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795035832;
	bh=FZiehOo0Bf1P5SRqogf/poqTftsKsN8SeO2iYKxqJA4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=PTz3ws8H/NpJvf6OcYOrAMZZk1IFha7ydpYC++sxBvo9YF0ukVR1+0PAoJfMybocI
	 4RCzSCJig/5lXaYaV8rEziySfq3j4BG7IGMu/PcpyoMhzSlXQVDZi+crQhH7bB1T7O
	 L0G5lyDqqvvRpQGs1Ci9mB3ENk/efJpBNsoaD6HnSoS0AoNwV0NgbhPISNDCVlFSXn
	 xUULgA52npuoTSlYKxYYiH4Xw5QwjvVf5D61G0CIWuQFYBNJVW8YYewZgEJSYmo0W6
	 67j+rwxN52fFofL5EhdBVHKoxvl32W5howaIBg8W9JIiyzi0V+5wbUmDMm864mooxc
	 kolPZehZIOOZw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7E9D94AF94;
	Wed, 18 Nov 2026 21:03:43 +0000 (UTC)
From: Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org>
Date: Thu, 19 Nov 2026 05:03:36 +0800
Subject: [PATCH v5 04/17] mm/memcg: add folio-based lruvec live helper
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261119-mglru-fg-v5-4-9eee2fe97a2d@tencent.com>
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com>
In-Reply-To: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com>
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Johannes Weiner <hannes@cmpxchg.org>, Muchun Song <muchun.song@linux.dev>, 
 Qi Zheng <qi.zheng@linux.dev>, Ying Huang <ying.huang@linux.alibaba.com>, 
 Chris Li <chrisl@kernel.org>, Baoquan He <baoquan.he@linux.dev>, 
 Nico Pache <nico.pache@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
 Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>, 
 Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
 Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Nhat Pham <nphamcs@gmail.com>, Youngjun Park <youngjun.park@lge.com>, 
 Zi Yan <ziy@nvidia.com>, Gregory Price <gourry@gourry.net>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
 Lance Yang <lance.yang@linux.dev>, Hugh Dickins <hughd@google.com>, 
 SJ Park <sj@kernel.org>, David Rientjes <rientjes@google.com>, 
 Yu Zhao <yuzhao@google.com>, Vernon Yang <vernon2gm@gmail.com>, 
 Zicheng Wang <wangzicheng@honor.com>, Chen Ridong <chenridong@xiaomi.com>, 
 Tal Zussman <tz2294@columbia.edu>, Kairui Song <ryncsn@gmail.com>, 
 Xiang Liu <liuxiang.277@bytedance.com>, 
 Ehab Ababneh <ehab.ababneh@intel.com>, 
 Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>, 
 Lian Wang <lianux.mm@gmail.com>, Joanne Koong <joannelkoong@gmail.com>, 
 Kunwu Chan <kunwu.chan@gmail.com>, Hui Zhu <hui.zhu@linux.dev>, 
 linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
 damon@lists.linux.dev, linux-doc@vger.kernel.org, 
 Kairui Song <kasong@tencent.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795035819; l=5345;
 i=kasong@tencent.com; s=kasong-sign-tencent; h=from:subject:message-id;
 bh=UPy3pGE6319hHgjCcjHs3BYbIQXEmhnHCnBETYV6U1U=;
 b=AqfXtl+0yCpQiqyIhsARAmmg2Fsm9mLz1qO5V+JmtA+2ZDtZgTGXqyJCmNSR+dvfy8goUaZ48
 3vrkNo74McRCI5QhGsRrjoUyRufQBCMaywpKJnzlOrA+BydE3iJC3FC
X-Developer-Key: i=kasong@tencent.com; a=ed25519;
 pk=kCdoBuwrYph+KrkJnrr7Sm1pwwhGDdZKcKrqiK8Y1mI=
X-Endpoint-Received: by B4 Relay for kasong@tencent.com/kasong-sign-tencent
 with auth_id=562
X-Original-From: Kairui Song <kasong@tencent.com>
Reply-To: kasong@tencent.com
Content-Transfer-Encoding: 7bit

From: Kairui Song <kasong@tencent.com>

Add a helper that resolves a live lruvec for a folio under RCU
without taking the lruvec lock.  It takes a folio directly so the
lruvec lookup happens inside the RCU read-side critical section,
which a lruvec-based interface cannot guarantee.  The first user is
the lockless folio_inc_lru_refs() path later in the series.

Factor the ancestor walk out of lruvec_live_lock_irq() into
__lruvec_get_live(), so that both entry points share it, and spell
out why the walk is enough while only the RCU read lock is held:
reparenting of a memcg that starts dying waits for a grace period,
so it cannot race with the caller until the lock is released.

Move memcg_is_dying() up in memcontrol.h, next to the other memcg state
predicates, and use it for the walk rather than repeating the open coded
css_is_dying() test a few definitions away from where it is explained.

No functional change for existing callers.

Tested-by: Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>
Signed-off-by: Kairui Song <kasong@tencent.com>
---
 include/linux/memcontrol.h | 71 ++++++++++++++++++++++++++++++++++++----------
 1 file changed, 56 insertions(+), 15 deletions(-)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index 980358bc6f49..441a5d57e723 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -571,6 +571,11 @@ static inline bool mem_cgroup_disabled(void)
 	return !cgroup_subsys_enabled(memory_cgrp_subsys);
 }
 
+static inline bool memcg_is_dying(struct mem_cgroup *memcg)
+{
+	return memcg ? css_is_dying(&memcg->css) : false;
+}
+
 static inline void mem_cgroup_protection(const struct mem_cgroup *root,
 					 const struct mem_cgroup *memcg,
 					 unsigned long *min,
@@ -1349,6 +1354,11 @@ static inline bool mem_cgroup_online(struct mem_cgroup *memcg)
 	return true;
 }
 
+static inline bool memcg_is_dying(struct mem_cgroup *memcg)
+{
+	return false;
+}
+
 static inline
 unsigned long mem_cgroup_get_zone_lru_size(const struct lruvec *lruvec,
 		enum lru_list lru, int zone_idx)
@@ -1510,28 +1520,41 @@ static inline void lruvec_lock_irq(struct lruvec *lruvec)
 	spin_lock_irq(&lruvec->lru_lock);
 }
 
-static inline struct lruvec *lruvec_live_lock_irq(struct lruvec *lruvec)
+/*
+ * Reparenting moves a dying memcg's LRU state to its parent at any time,
+ * so anything added to that LRU afterwards would be lost.  This helper
+ * walks up to the nearest live ancestor while the caller must hold the
+ * RCU read lock: reparenting of a memcg that starts dying waits for a
+ * grace period, so it cannot race with the caller until the lock is
+ * released.
+ */
+static inline struct lruvec *__lruvec_get_live(struct lruvec *lruvec)
 {
 #ifdef CONFIG_MEMCG
 	struct pglist_data *pgdat = lruvec_pgdat(lruvec);
 	struct mem_cgroup *memcg = lruvec_memcg(lruvec);
 
-	rcu_read_lock();
-
 	/*
 	 * The memcg can be NULL when the memory controller is disabled.
 	 * Otherwise, the caller keeps the memcg owning @lruvec alive.
 	 */
-	while (unlikely(memcg && css_is_dying(&memcg->css))) {
+	while (unlikely(memcg_is_dying(memcg))) {
 		memcg = parent_mem_cgroup(memcg);
 		lruvec = mem_cgroup_lruvec(memcg, pgdat);
 	}
+#endif
+	return lruvec;
+}
 
+static inline struct lruvec *lruvec_live_lock_irq(struct lruvec *lruvec)
+{
+#ifdef CONFIG_MEMCG
+	rcu_read_lock();
+	lruvec = __lruvec_get_live(lruvec);
 	spin_lock_irq(&lruvec->lru_lock);
 #else
 	lruvec_lock_irq(lruvec);
 #endif
-
 	return lruvec;
 }
 
@@ -1561,6 +1584,34 @@ static inline bool folio_matches_lruvec(const struct folio *folio,
 	       lruvec_memcg(lruvec) == folio_memcg(folio);
 }
 
+/**
+ * folio_lruvec_live_get - get a live lruvec for a folio under RCU
+ * @folio: the folio
+ *
+ * Same as folio_lruvec(), except that a folio whose memcg is dying is
+ * accounted to the nearest live ancestor, which is where reparenting
+ * would put it anyway.
+ *
+ * Return: the live lruvec, with rcu_read_lock() held.  Pair it with
+ * folio_lruvec_live_put().
+ */
+static inline struct lruvec *folio_lruvec_live_get(struct folio *folio)
+{
+#ifdef CONFIG_MEMCG
+	rcu_read_lock();
+	return __lruvec_get_live(folio_lruvec(folio));
+#else
+	return folio_lruvec(folio);
+#endif
+}
+
+static inline void folio_lruvec_live_put(struct lruvec *lruvec)
+{
+#ifdef CONFIG_MEMCG
+	rcu_read_unlock();
+#endif
+}
+
 /* Don't lock again iff page's lruvec locked */
 static inline struct lruvec *folio_lruvec_relock_irq(const struct folio *folio,
 		struct lruvec *locked_lruvec)
@@ -1826,11 +1877,6 @@ void mem_cgroup_node_filter_allowed(struct mem_cgroup *memcg, nodemask_t *mask);
 
 void mem_cgroup_show_protected_memory(struct mem_cgroup *memcg);
 
-static inline bool memcg_is_dying(struct mem_cgroup *memcg)
-{
-	return memcg ? css_is_dying(&memcg->css) : false;
-}
-
 #else
 static inline bool mem_cgroup_kmem_disabled(void)
 {
@@ -1901,11 +1947,6 @@ static inline void mem_cgroup_node_filter_allowed(struct mem_cgroup *memcg,
 static inline void mem_cgroup_show_protected_memory(struct mem_cgroup *memcg)
 {
 }
-
-static inline bool memcg_is_dying(struct mem_cgroup *memcg)
-{
-	return false;
-}
 #endif /* CONFIG_MEMCG */
 
 #if defined(CONFIG_MEMCG) && defined(CONFIG_LRU_GEN)

-- 
2.56.1


