Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795143500;
	b=cWejokYqHxgd5eri8X38iF2+q+MBOP/onc2zYK3pXh8u4u+sW2b2Lg7y9t4rNlHSBJ7X
	 1cjnVdc1b7VanPoZ+U1vhwR2qvhVkE71jAFR0jHnTAAAv28D35h5GGTgVdboxq86OBIOT
	 nikkKy7aegsvYC8SXYIxydWUZuyxeZfdrg/NWtgYB/eagUrl8Dwmnrn/oInFTYiLUTGuK
	 JmregQBBk/wSuh6JywQLQgUM9XB2WZgZid0f4M2hk5ksnFvagUrSDOAC6cGEc/nmVWE76
	 zAHOJ+KhkEkHWDqrPy27103ykk9a7guy1YuFO0oLuamQyHHMok1Dmh905Wz///ugKNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795143500;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GItNRM5Gwx4ZrpXxGQ/srYtE9okvv9VZklFBQRdwF7A=;
	b=tGF3ssqA7ZqsgZ73STAJvEJ5zKpTO4/wRjA65ZSBYjv9iagWXwflcEocNGwe1oW4ADSs
	 cL4fSx7/1f8/uZ2nc5Dour/BoHOz7wM2czoMnckWHmLJz5RklXB6gu8g4RP3SAH7KFvyD
	 60M7ZANuf/HtzfBUXpbpJyHGkD2WyQ7Izn4JbzBL0gr33bjjv+ZaYpb9cpNyWwC7SBreR
	 nfpHEsuWyR6EGkY38xKP/Qz3uOoDggAkNqqJ4hF/5MdyAKHYBFgapNxrtrkE1TRIUng2V
	 u3DSmc6o7lD88hI6j+xDQ9h6uzlq24yVIeMJpiSvnWND12rr7EldXBpUMjRMbENql0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=smartx.com;
	spf=pass smtp.mailfrom=smartx.com;
	dkim=pass header.d=smartx-com.20260707.gappssmtp.com header.i=@smartx-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=DKG4tUqs;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8816606A334
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:58:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8816606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smartx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smartx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smartx-com.20260707.gappssmtp.com header.i=@smartx-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=DKG4tUqs
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8c700d6cc0bso936547b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smartx-com.20260707.gappssmtp.com; s=20260707; t=1795143499; x=1795748299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GItNRM5Gwx4ZrpXxGQ/srYtE9okvv9VZklFBQRdwF7A=;
        b=DKG4tUqs6g9Zc3zVC2z6Z38dtXfkImPTVH7SMnsl4ytfbukFIrpal+1BD/YDdf4x4r
         9SZNc+4f3IW9LpC/1qkkC/yS5Za/+pFzD1G/ZFZudEZxmRHiL9FCVQ1nPd+cCOZ9iJkN
         WPtKIhMk1tl24s0cuGo49qPTE+CWMki+JOekg3q4IDIn7WyQbVW/pMFIaJHb/77vhRK1
         edvCOEH1KkMM/KZFgQwTPN42EA2H6LEx3wsdAKikNZnQMlOB8cfRbINmOLu1aM5lxRDM
         e7w/vQJXro+TSzZkmlJovl7R1mSaM7rRcrj/tAM+R379MtTpSsQnVIGrDU+e1o3I7F1H
         a2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795143499; x=1795748299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GItNRM5Gwx4ZrpXxGQ/srYtE9okvv9VZklFBQRdwF7A=;
        b=PDI+N4CGysu1wwaoAGh+20v8jzQw1XqW5ZlmOULctFwkE7vs9KwjNTPkF1nMyL/axL
         lsEAJSDfLB6OM1WZEMXQbLOHhOrUr+irzRJJRfj8MY0RIq4FwqZeaOlXSaZwSW049GCT
         uEF2lEL0qxrC3MA63mcghvl99wJ6o4x9yY+m7doRCT8hWNVgpC98DZehnRLysVdVNZtF
         nJpTN3Dgl5zUfifsNZ9trhn8X2H2dUhS2EuPpE+EwVKE77lgRsSRZbqIK6ujkz42oPtb
         MsyXFuqIudSROLf8HMyL8SLBowktcv2i8Bo8KwO8GnxHobsI7ijfJYoR05RZn23V9/qD
         ylOA==
X-Forwarded-Encrypted: i=1; AL+hErEVwn9pdVCX4GvtA9XDaP+M5g3glDGLnD5Snmyl4WIiG8dY8SfD97qyquI2Y8kZhOcQAKe6g4lldpJeK58=@vger.kernel.org
X-Gm-Message-State: APuU4Z95TQXWlqCAKZH9usaMaA4FQWllg3fOLzphAoz7YFkFqIt1r3Jm
	zzGdDgQTUCEpfMutJ8Yo+8JFswJcaKFzYoZq0agZBRGaocUuOm3jQmAchTD1lFixnUo/zybVgzv
	u+e/mLllVdeug3X2uEsDLG4aApZZ/5o1QEJp48QDfpqOwTrnR9d4VmFlgLg/gDQ+Fstzc4LZquS
	L845j/
X-Gm-Gg: AYBFou2U8Cl3LveMwzleJdwTHNS92eXhW8GNykS5I24aMzq/xGbw6K6BAdCTr2cZk/S
	NonEK2axUvgZPLz0sfN+HklWO72Znej24LKgtNTGXtILKNyEXIutvYc5mPF3EalTNdUrS8++vbR
	pqKooNDrbeMVccztNxzYDj9N2bvtxG9uPnGYU60R3g6BeEYq6YGPodv4Z0hB3Ep9YAucRrsouFA
	FqMJZUDFEw5zXz1eYwN/0n9ttIdvsKIYyOnueA4jYNAjCWB+/UfVQT525PoU2iA2QG6syLu10k6
	NOr6gnn1OSFJEk35Ybck26P0EZlqwR4N7antuLcCPDxtHlAK6s4eY4FMk1BtCLRHaYdRrBv4sdC
	zpfxZ9GjEuJGzNJ8Tqnyhggxevnx78W7wPxXI1M2SFPai7gQ2eOcQYoK1b71PQf/DU1HPydlJyN
	2LUtikhPv8x/LMMRF5ATkcWlzszhuA87TH0yKV5CTzZnyOGyW4FbhwyvfH6v3BGCoIaXQBV7uva
	W2DLcsCIVHblTxcmyrCAzqLbx7n0gtJ0/7jlTGVbvqY3QP0/luyLhIrcoOMeCWuVWONgqeKNQSb
	By8hUKs6FraL8Hi7hMuGrOKwzfWcws4JqQyU6A==
X-Received: by 2002:a05:6300:404c:b0:3e2:26fc:2e01 with SMTP id adf61e73a8af0-4014ec3e2f2mr1102176637.40.1795143499258;
        Thu, 19 Nov 2026 18:58:19 -0800 (PST)
Received: from localhost.localdomain ([103.26.8.217])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-8c872e45eccsm749647b3a.31.2026.11.19.18.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 18:58:18 -0800 (PST)
From: Lei Chen <lei.chen@smartx.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Chen <lei.chen@smartx.com>
Subject: [RESEND PATCH v1 2/4] blk-mq: manage driver tags at the tag set level
Date: Fri, 20 Nov 2026 10:58:04 +0800
Message-ID: <20261120025806.1065295-3-lei.chen@smartx.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120025806.1065295-1-lei.chen@smartx.com>
References: <20261009030111.57784-1-lei.chen@smartx.com>
 <20261120025806.1065295-1-lei.chen@smartx.com>
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

blk_mq_map_swqueue() allocates and frees driver tags while initializing
an individual request queue, even though those tags are shared by all
queues using the tag set. Which hardware queues need tags is determined
by the tag set's CPU maps, so manage their lifetime at that level.

Move tag allocation and reclamation out of blk_mq_map_swqueue(). Reclaim
unmapped tags before returning a newly allocated tag set. When updating
the hardware queue count, allocate missing tags after rebuilding the CPU
maps and before rebuilding hardware contexts. Free unused tags only after
all request queues have been remapped, while they are still frozen, since
old hardware contexts may still reference them during teardown. Serialize
these runtime changes with update_nr_hwq_lock.

Track hardware queue indices referenced by the CPU maps in a bitmap to
avoid rescanning every CPU and map for each tag being reclaimed. Keep
queue 0's tags for allocation failure fallback and rebuild the bitmap
when fallback changes the mappings.

This leaves request queue initialization to associate software and
hardware contexts without changing the shared driver tags or CPU maps.

Signed-off-by: Lei Chen <lei.chen@smartx.com>
---
 block/blk-mq.c         | 129 ++++++++++++++++++++++++++++++++---------
 include/linux/blk-mq.h |   5 ++
 2 files changed, 108 insertions(+), 26 deletions(-)

diff --git a/block/blk-mq.c b/block/blk-mq.c
index 59452b855afe..12e28d779e2c 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -9,6 +9,7 @@
 #include <linux/module.h>
 #include <linux/backing-dev.h>
 #include <linux/bio.h>
+#include <linux/bitmap.h>
 #include <linux/blkdev.h>
 #include <linux/blk-integrity.h>
 #include <linux/kmemleak.h>
@@ -4159,9 +4160,74 @@ static void __blk_mq_free_map_and_rqs(struct blk_mq_tag_set *set,
 	set->tags[hctx_idx] = NULL;
 }
 
+static void blk_mq_update_mapped_tags_bitmap(struct blk_mq_tag_set *set)
+{
+	unsigned int i, cpu;
+
+	bitmap_zero(set->mapped_tags_bitmap, set->nr_hw_queues);
+	if (set->nr_hw_queues == 1) {
+		__set_bit(0, set->mapped_tags_bitmap);
+		return;
+	}
+
+	for (i = 0; i < set->nr_maps; i++) {
+		struct blk_mq_queue_map *map = &set->map[i];
+
+		if (!map->nr_queues)
+			continue;
+		for_each_possible_cpu(cpu)
+			__set_bit(map->mq_map[cpu], set->mapped_tags_bitmap);
+	}
+}
+
+static void blk_mq_alloc_mapped_tags(struct blk_mq_tag_set *set)
+{
+	unsigned int cpu, i;
+	bool remapped = false;
+
+	lockdep_assert_held_write(&set->update_nr_hwq_lock);
+
+	for_each_possible_cpu(cpu) {
+		for (i = 0; i < set->nr_maps; i++) {
+			struct blk_mq_queue_map *map = &set->map[i];
+			unsigned int hctx_idx;
+
+			if (!map->nr_queues)
+				continue;
+			hctx_idx = map->mq_map[cpu];
+			if (!set->tags[hctx_idx] &&
+			    !__blk_mq_alloc_map_and_rqs(set, hctx_idx)) {
+				/* Queue 0 always has tags available for fallback. */
+				map->mq_map[cpu] = 0;
+				remapped = true;
+			}
+		}
+	}
+	if (remapped)
+		blk_mq_update_mapped_tags_bitmap(set);
+}
+
+static bool blk_mq_tagset_tags_mapped(struct blk_mq_tag_set *set,
+				      unsigned int hctx_idx)
+{
+	return test_bit(hctx_idx, set->mapped_tags_bitmap);
+}
+
+/* The queue maps must be stable and the unused tags no longer in use. */
+static void blk_mq_free_unmapped_tags(struct blk_mq_tag_set *set)
+{
+	unsigned int i;
+
+	/* Keep queue 0 as a fallback if a later tag allocation fails. */
+	for (i = 1; i < set->nr_hw_queues; i++) {
+		if (set->tags[i] && !blk_mq_tagset_tags_mapped(set, i))
+			__blk_mq_free_map_and_rqs(set, i);
+	}
+}
+
 static void blk_mq_map_swqueue(struct request_queue *q)
 {
-	unsigned int j, hctx_idx;
+	unsigned int j;
 	unsigned long i;
 	struct blk_mq_hw_ctx *hctx;
 	struct blk_mq_ctx *ctx;
@@ -4183,19 +4249,6 @@ static void blk_mq_map_swqueue(struct request_queue *q)
 						HCTX_TYPE_DEFAULT, i);
 				continue;
 			}
-			hctx_idx = set->map[j].mq_map[i];
-			/* unmapped hw queue can be remapped after CPU topo changed */
-			if (!set->tags[hctx_idx] &&
-			    !__blk_mq_alloc_map_and_rqs(set, hctx_idx)) {
-				/*
-				 * If tags initialization fail for some hctx,
-				 * that hctx won't be brought online.  In this
-				 * case, remap the current ctx to hctx[0] which
-				 * is guaranteed to always have tags allocated
-				 */
-				set->map[j].mq_map[i] = 0;
-			}
-
 			hctx = blk_mq_map_queue_type(q, j, i);
 			ctx->hctxs[j] = hctx;
 			/*
@@ -4226,18 +4279,8 @@ static void blk_mq_map_swqueue(struct request_queue *q)
 	queue_for_each_hw_ctx(q, hctx, i) {
 		int cpu;
 
-		/*
-		 * If no software queues are mapped to this hardware queue,
-		 * disable it and free the request entries.
-		 */
+		/* Disable hardware queues with no mapped software queues. */
 		if (!hctx->nr_ctx) {
-			/* Never unmap queue 0.  We need it as a
-			 * fallback in case of a new remap fails
-			 * allocation
-			 */
-			if (i)
-				__blk_mq_free_map_and_rqs(set, i);
-
 			hctx->tags = NULL;
 			continue;
 		}
@@ -4778,12 +4821,18 @@ static void blk_mq_update_queue_map(struct blk_mq_tag_set *set)
 		BUG_ON(set->nr_maps > 1);
 		blk_mq_map_queues(&set->map[HCTX_TYPE_DEFAULT]);
 	}
+	blk_mq_update_mapped_tags_bitmap(set);
 }
 
+/*
+ * On successful growth, also install a larger mapped_tags_bitmap. The caller
+ * rebuilds its contents when updating the queue maps under update_nr_hwq_lock.
+ */
 static struct blk_mq_tags **blk_mq_prealloc_tag_set_tags(
 				struct blk_mq_tag_set *set,
 				int new_nr_hw_queues)
 {
+	unsigned long *new_mapped_tags_bitmap;
 	struct blk_mq_tags **new_tags;
 	int i;
 
@@ -4795,6 +4844,13 @@ static struct blk_mq_tags **blk_mq_prealloc_tag_set_tags(
 	if (!new_tags)
 		return ERR_PTR(-ENOMEM);
 
+	new_mapped_tags_bitmap = bitmap_zalloc_node(new_nr_hw_queues, GFP_KERNEL,
+						    set->numa_node);
+	if (!new_mapped_tags_bitmap) {
+		kfree(new_tags);
+		return ERR_PTR(-ENOMEM);
+	}
+
 	if (set->tags)
 		memcpy(new_tags, set->tags, set->nr_hw_queues *
 		       sizeof(*set->tags));
@@ -4811,12 +4867,15 @@ static struct blk_mq_tags **blk_mq_prealloc_tag_set_tags(
 		cond_resched();
 	}
 
+	bitmap_free(set->mapped_tags_bitmap);
+	set->mapped_tags_bitmap = new_mapped_tags_bitmap;
 	return new_tags;
 out_unwind:
 	while (--i >= set->nr_hw_queues) {
 		if (!blk_mq_is_shared_tags(set->flags))
 			blk_mq_free_map_and_rqs(set, new_tags[i], i);
 	}
+	bitmap_free(new_mapped_tags_bitmap);
 	kfree(new_tags);
 	return ERR_PTR(-ENOMEM);
 }
@@ -4880,9 +4939,17 @@ int blk_mq_alloc_tag_set(struct blk_mq_tag_set *set)
 		if (ret)
 			goto out_free_srcu;
 	}
+
+	set->mapped_tags_bitmap = bitmap_zalloc_node(set->nr_hw_queues, GFP_KERNEL,
+						     set->numa_node);
+	if (!set->mapped_tags_bitmap) {
+		ret = -ENOMEM;
+		goto out_cleanup_srcu;
+	}
+
 	ret = init_srcu_struct(&set->tags_srcu);
 	if (ret)
-		goto out_cleanup_srcu;
+		goto out_free_mapped_tags_bitmap;
 
 	init_rwsem(&set->update_nr_hwq_lock);
 
@@ -4907,6 +4974,7 @@ int blk_mq_alloc_tag_set(struct blk_mq_tag_set *set)
 	ret = blk_mq_alloc_set_map_and_rqs(set);
 	if (ret)
 		goto out_free_mq_map;
+	blk_mq_free_unmapped_tags(set);
 
 	mutex_init(&set->tag_list_lock);
 	INIT_LIST_HEAD(&set->tag_list);
@@ -4922,6 +4990,9 @@ int blk_mq_alloc_tag_set(struct blk_mq_tag_set *set)
 	set->tags = NULL;
 out_cleanup_tags_srcu:
 	cleanup_srcu_struct(&set->tags_srcu);
+out_free_mapped_tags_bitmap:
+	bitmap_free(set->mapped_tags_bitmap);
+	set->mapped_tags_bitmap = NULL;
 out_cleanup_srcu:
 	if (set->flags & BLK_MQ_F_BLOCKING)
 		cleanup_srcu_struct(set->srcu);
@@ -4968,6 +5039,9 @@ void blk_mq_free_tag_set(struct blk_mq_tag_set *set)
 	kfree(set->tags);
 	set->tags = NULL;
 
+	bitmap_free(set->mapped_tags_bitmap);
+	set->mapped_tags_bitmap = NULL;
+
 	srcu_barrier(&set->tags_srcu);
 	cleanup_srcu_struct(&set->tags_srcu);
 	if (set->flags & BLK_MQ_F_BLOCKING) {
@@ -5158,6 +5232,7 @@ static void __blk_mq_update_nr_hw_queues(struct blk_mq_tag_set *set,
 
 fallback:
 	blk_mq_update_queue_map(set);
+	blk_mq_alloc_mapped_tags(set);
 	list_for_each_entry(q, &set->tag_list, tag_set_list) {
 		__blk_mq_realloc_hw_ctxs(set, q);
 
@@ -5174,6 +5249,8 @@ static void __blk_mq_update_nr_hw_queues(struct blk_mq_tag_set *set,
 		}
 		blk_mq_map_swqueue(q);
 	}
+	/* All queues have stopped using tags excluded by the new maps. */
+	blk_mq_free_unmapped_tags(set);
 switch_back:
 	/* The blk_mq_elv_switch_back unfreezes queue for us. */
 	list_for_each_entry(q, &set->tag_list, tag_set_list) {
diff --git a/include/linux/blk-mq.h b/include/linux/blk-mq.h
index af878597afb8..3ef989dc4f99 100644
--- a/include/linux/blk-mq.h
+++ b/include/linux/blk-mq.h
@@ -517,6 +517,10 @@ enum hctx_type {
  *		   tag set.
  * @tags:	   Tag sets. One tag set per hardware queue. Has @nr_hw_queues
  *		   elements.
+ * @mapped_tags_bitmap: Bitmap of hardware queue indices referenced by active
+ *		   CPU maps. Rebuilt before publication or with update_nr_hwq_lock
+ *		   held for writing. Tags for index 0 are retained as a fallback
+ *		   even when its bit is clear.
  * @shared_tags:
  *		   Shared set of tags. Has @nr_hw_queues elements. If set,
  *		   shared by all @tags.
@@ -545,6 +549,7 @@ struct blk_mq_tag_set {
 	void			*driver_data;
 
 	struct blk_mq_tags	**tags;
+	unsigned long		*mapped_tags_bitmap;
 
 	struct blk_mq_tags	*shared_tags;
 
-- 
2.43.0

