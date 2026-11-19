Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.29
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795071066;
	b=Ukiqyik/+1xQ9ayw9NUs9iBVO/xB2mNV+3q8lEPcf2BsaDTB/KbyDDtLenYEzKM4eszG
	 lLI3Bs1lfeZCCrbSWVIXvvTrCKJDFrKYecjOIDR+0QVP0kBoQsTy61/n/gaRXiHV7AE8U
	 NvxpEVg8M3A7oLUkKbT2CDelmbUlQ8TR4ooEp5ISCmnNyWW2SXXGDxYwk9bBIkgH/Wv1F
	 K8gv0wRsAIJ2jAR/RLVA2zNnsQMlBuFGHaFKwHNX0tsQzWVNar4Rb4ddXUPdajINQ+3Q2
	 UmeW02ms9pyFv0HBsZEg9SSWmHE7gcq2RQXYq1lcmh47UXIjhfYfXNF2Q+DTgu+6W0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795071066;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=oxe9tcjSi0QCiPtTzsid5HMhZRPZANjJh4JprpeMQdM=;
	b=HCaFJk+9pL4r1Sv4DUc6MecUEgJ0EOWH2mLDq85kk/hXjI26o2EW3zy306Y4srQpe2VF
	 ttxWeOJ3M8SZ4EC+gNW5b9FCfYEnSN1RwN+LT76+x2AuF9Sv31mox4tDVv9dovLS04Sit
	 d7E6FTHqz85m/rm0NXeKqzeY+2wnpsEVIBK4HatP7Y8OwdCIdg5AZF3WyJUwJ8fuetMxB
	 t5ilONE48DvS3aX7tOkQmEV7fHbui0L8mZcHNegpRXr7nCweuVIl7eZozgCD8crBP7SBv
	 TRiWsIw7znvRJtuBE0DQT8JHTiHwgD7ZxbC6Rm8PwVBJtSOX7Ub6lLYUyHBWe4R26hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QYgS7wPd;
	arc=none smtp.remote-ip=95.215.58.29
Received: from mta1.migadu.com (out-29.mta1.migadu.com [95.215.58.29])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC380606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:51:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC380606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QYgS7wPd
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Kifhb9KzRshoED1TAZ/g0GQIA1JTT3G4naGWm6atlWg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795071063; v=1; x=1795675863;
 b=QYgS7wPdtqbOpiv+sjDhqPnJQz8LzEbH1mHr3sJzs9KAtlUamvGTHxU/vWXvaqOMNCbrVnsR
 YFkHXj1+wXs00TSp2BeMf0MCkzwlULvxkhTLdFWtmGnXyMPILTKEXrX85c8DPLu1/vUIYHVIMwk
 imC5kid+U22dj9jA6Qn5+SmQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8729af0b12027f20;
	Thu, 19 Nov 2026 06:51:02 +0000
X-Mizu-Trace-ID: 8729af0b12027f20
X-Migadu-Flow: FLOW_OUT
From: Ridong Chen <ridong.chen@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>
Cc: Kairui Song <kasong@tencent.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-mm@kvack.org (open list:MEMORY MANAGEMENT - MGLRU (MULTI-GEN LRU)),
	linux-kernel@vger.kernel.org,
	Ridong Chen <ridong.chen@linux.dev>,
	Ridong Chen <chenridong@xiaomi.com>
Subject: [RFC patch] mm/mglru: advance memcg generation when reclaimers pile up
Date: Thu, 19 Nov 2026 14:50:43 +0800
Message-Id: <20261119065043.398-1-ridong.chen@linux.dev>
X-Mailer: git-send-email 2.34.1
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

From: Ridong Chen <chenridong@xiaomi.com>

On Android, memcgs are used to group and account memory rather than to
limit it, so direct reclaim never hits a memcg limit and is always
global reclaim through shrink_many(). We observed long direct reclaim
latency on Android devices under memory pressure, when many tasks enter
direct reclaim at the same time and all of them walk the same per-node
memcg LRU. Some of the slow calls piled up on a few memcgs.

shrink_many() picks a random bin in the old memcg generation and moves
on to the next bin if it is empty. When only a few old bins still hold
memcgs, all reclaimers end up on those bins and pile up on the same
memcgs, which makes direct reclaim take much longer.

Count the reclaimers in shrink_many() per node. Before walking a bin,
advance the memcg generation when there are more reclaimers than
non-empty old bins and advancing would add bins: splice each old bin in
front of the young bin with the same index, so in each bin the
remaining old memcgs are still reclaimed first in the same order, and
bump the generation counter. The condition is checked again under
memcg_lru->lock before splicing. The per-memcg segment is kept, so a
memcg already moved to the tail segment (below memory.low or too small)
still gets its second visit before the young memcgs in its bin.

shrink_many() now reads the generation again at each restart instead of
once at entry, so reclaimers in the loop follow the new old generation
instead of walking drained bins. A walker can also go more than one
generation stale while it is in shrink_one(), and two advances would
wrap its stale generation around to the young one. Skip the rest of the
walk once the generation no longer matches the counter.

Advancing earlier means memcgs that were just rotated to the young
generation become eligible for reclaim sooner than before, when the old
generation had to drain first, and the order is only kept within each
bin. The splice walks the remaining old memcgs under memcg_lru->lock
with interrupts off; it only runs when some old bin is empty while the
young bin with the same index is not.

The pattern can be reproduced on x86. Test on an x86_64 machine
(i7-13700HX, 24 CPUs, zram swap): 64 memcgs each churning 24MiB of anon
memory, 16 threads writing 128K to the root memory.reclaim in a loop,
which goes through shrink_many(). Each run is 120s; the patch is turned
off (A) and on (B) at runtime with a debug knob that is not part of this
patch, alternating A B A B A B in the same boot.
Latency of each memory.reclaim write, in ms, averaged over the three
runs:

                    A        B      change
    p50          1.95     2.08       +6%
    p95          4.88     4.29      -12%
    p99          8.06     6.25      -22%
    p99.9       13.08    10.40      -20%
    avg          2.32     2.32        0%
    >= 10ms      3240      894      -72%  (calls per run)

The time with at most 4 non-empty old bins drops from 2.6% to 0.02%.
The cost is that each call visits about 7% more memcgs (shrink_one()
calls per call 118 -> 126), since reclaimers following the new old
generation may revisit memcgs they rotated earlier in the same call,
which shows up as the higher p50. Anon refaults, pswpin and pswpout
are within 2% between A and B.

Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
---
 include/linux/mmzone.h |  9 ++++-
 mm/vmscan.c            | 86 ++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 90 insertions(+), 5 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 7d6e830c2420..bc9f9224bf79 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -624,7 +624,9 @@ struct lru_gen_mm_walk {
  * An onlining memcg is added to the tail of a random bin in the old generation.
  * The eviction starts at the head of a random bin in the old generation. The
  * per-node memcg generation counter, whose reminder (mod MEMCG_NR_GENS) indexes
- * the old generation, is incremented when all its bins become empty.
+ * the old generation, is incremented when all its bins become empty, or when
+ * there are more reclaimers than non-empty old bins and advancing adds bins
+ * (see try_to_inc_memcg_seq()).
  *
  * There are two operations:
  * 1. MEMCG_LRU_TAIL, which moves a memcg to the tail of a random bin in its
@@ -649,7 +651,8 @@ struct lru_gen_mm_walk {
  *    memcgs. For memcg reclaim, it still relies on mem_cgroup_iter().
  * 2. There are only two valid generations: old (seq) and young (seq+1).
  *    MEMCG_NR_GENS is set to three so that when reading the generation counter
- *    locklessly, a stale value (seq-1) does not wraparound to young.
+ *    locklessly, a stale value (seq-1) does not wraparound to young. Walkers
+ *    that can be more stale, e.g. across shrink_one(), recheck seq.
  */
 #define MEMCG_NR_GENS	3
 #define MEMCG_NR_BINS	8
@@ -663,6 +666,8 @@ struct lru_gen_memcg {
 	struct hlist_nulls_head	fifo[MEMCG_NR_GENS][MEMCG_NR_BINS];
 	/* protects the above */
 	spinlock_t lock;
+	/* the number of reclaimers in shrink_many() */
+	atomic_t nr_reclaimers;
 };
 
 void lru_gen_init_pgdat(struct pglist_data *pgdat);
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 2d061439a863..cd8ceadbe74a 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -5337,6 +5337,76 @@ static int shrink_one(struct lruvec *lruvec, struct scan_control *sc)
 	       MEMCG_LRU_TAIL : MEMCG_LRU_YOUNG;
 }
 
+/*
+ * Advance the memcg generation when there are more reclaimers than non-empty
+ * old bins and advancing adds bins, so that they spread over more bins.
+ */
+static bool should_inc_memcg_seq(struct lru_gen_memcg *memcg_lru, int old)
+{
+	int bin;
+	int nr_old = 0, nr_new = 0;
+	int young = get_memcg_gen(old + 1);
+
+	/* non-empty old bins now and after the splice */
+	for (bin = 0; bin < MEMCG_NR_BINS; bin++) {
+		bool o = !hlist_nulls_empty(&memcg_lru->fifo[old][bin]);
+		bool y = !hlist_nulls_empty(&memcg_lru->fifo[young][bin]);
+
+		nr_old += o;
+		nr_new += o || y;
+	}
+
+	return atomic_read(&memcg_lru->nr_reclaimers) > nr_old && nr_new > nr_old;
+}
+
+static void try_to_inc_memcg_seq(struct pglist_data *pgdat)
+{
+	int old, young, bin;
+	unsigned long flags;
+	struct lru_gen_memcg *memcg_lru = &pgdat->memcg_lru;
+
+	old = get_memcg_gen(READ_ONCE(memcg_lru->seq));
+	if (!should_inc_memcg_seq(memcg_lru, old))
+		return;
+
+	young = get_memcg_gen(old + 1);
+
+	spin_lock_irqsave(&memcg_lru->lock, flags);
+
+	/* recheck under the lock, the bins may have changed */
+	if (old != get_memcg_gen(memcg_lru->seq) ||
+	    !should_inc_memcg_seq(memcg_lru, old))
+		goto unlock;
+
+	for (bin = 0; bin < MEMCG_NR_BINS; bin++) {
+		struct hlist_nulls_head *src = &memcg_lru->fifo[old][bin];
+		struct hlist_nulls_head *dst = &memcg_lru->fifo[young][bin];
+		struct hlist_nulls_node *node, *last = NULL;
+		struct lru_gen_folio *lrugen;
+
+		hlist_nulls_for_each_entry(lrugen, node, src, list) {
+			WRITE_ONCE(lrugen->gen, young);
+			last = node;
+		}
+		if (!last)
+			continue;
+
+		/* splice src in front of dst */
+		WRITE_ONCE(last->next, dst->first);
+		if (!is_a_nulls(dst->first))
+			WRITE_ONCE(dst->first->pprev, &last->next);
+		WRITE_ONCE(src->first->pprev, &dst->first);
+		rcu_assign_pointer(hlist_nulls_first_rcu(dst), src->first);
+		WRITE_ONCE(src->first, (struct hlist_nulls_node *)NULLS_MARKER(old));
+	}
+
+	memcg_lru->nr_memcgs[young] += memcg_lru->nr_memcgs[old];
+	memcg_lru->nr_memcgs[old] = 0;
+	WRITE_ONCE(memcg_lru->seq, memcg_lru->seq + 1);
+unlock:
+	spin_unlock_irqrestore(&memcg_lru->lock, flags);
+}
+
 static void shrink_many(struct pglist_data *pgdat, struct scan_control *sc)
 {
 	int op;
@@ -5348,9 +5418,14 @@ static void shrink_many(struct pglist_data *pgdat, struct scan_control *sc)
 	struct mem_cgroup *memcg;
 	struct hlist_nulls_node *pos;
 
-	gen = get_memcg_gen(READ_ONCE(pgdat->memcg_lru.seq));
+	atomic_inc(&pgdat->memcg_lru.nr_reclaimers);
+
 	bin = first_bin = get_random_u32_below(MEMCG_NR_BINS);
 restart:
+	/* advance the generation if needed and walk the current old one */
+	try_to_inc_memcg_seq(pgdat);
+	gen = get_memcg_gen(READ_ONCE(pgdat->memcg_lru.seq));
+
 	op = 0;
 	memcg = NULL;
 
@@ -5365,7 +5440,9 @@ static void shrink_many(struct pglist_data *pgdat, struct scan_control *sc)
 		mem_cgroup_put(memcg);
 		memcg = NULL;
 
-		if (gen != READ_ONCE(lrugen->gen))
+		/* skip the rest if gen has gone stale, e.g. across shrink_one() */
+		if (gen != READ_ONCE(lrugen->gen) ||
+		    gen != get_memcg_gen(READ_ONCE(pgdat->memcg_lru.seq)))
 			continue;
 
 		lruvec = container_of(lrugen, struct lruvec, lrugen);
@@ -5395,7 +5472,7 @@ static void shrink_many(struct pglist_data *pgdat, struct scan_control *sc)
 	mem_cgroup_put(memcg);
 
 	if (!is_a_nulls(pos))
-		return;
+		goto done;
 
 	/* restart if raced with lru_gen_rotate_memcg() */
 	if (gen != get_nulls_value(pos))
@@ -5405,6 +5482,8 @@ static void shrink_many(struct pglist_data *pgdat, struct scan_control *sc)
 	bin = get_memcg_bin(bin + 1);
 	if (bin != first_bin)
 		goto restart;
+done:
+	atomic_dec(&pgdat->memcg_lru.nr_reclaimers);
 }
 
 static void lru_gen_shrink_lruvec(struct lruvec *lruvec, struct scan_control *sc)
@@ -6081,6 +6160,7 @@ void lru_gen_init_pgdat(struct pglist_data *pgdat)
 	int i, j;
 
 	spin_lock_init(&pgdat->memcg_lru.lock);
+	atomic_set(&pgdat->memcg_lru.nr_reclaimers, 0);
 
 	for (i = 0; i < MEMCG_NR_GENS; i++) {
 		for (j = 0; j < MEMCG_NR_BINS; j++)
-- 
2.34.1

