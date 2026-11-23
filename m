Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443526;
	b=T4UnKwKfwj/J1Zf4p3nfBylhOlEbxGeNDF/pcySvh3qxx/vDvDeap8+6gyvi7/Q13htW
	 GrHiKPhkNbP10IkkvhGMtIaHsX7jXvVmQYoVmnfHfwctgUnKq46rqGq6lz6Fgw8B+Xfe0
	 W0I2Fxy4wh79jeXNHKI5hD21jN7gAo6OIAbKvzcmy2lGAhvowgpe2fWxR45mVsegtvZX8
	 KXcuerd2xAwaOm1Wq44X6naOap5aQyqZHjIzk16TcokVT5Z+LBzqpTFmAInsMXiObdK/n
	 TCV0D0UzMXaiVems+gJTEcPixNBbVXn42OOB/kzEam0D/kxjOYS/URscL8LBKPXuGmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443526;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JqQbNFCUHZA68tu7W/cFcA8xZJIzsGYbBrlERWsIurU=;
	b=0HR5KvLLOJM4VUMfE5+GPEbIPc1KxEy2M+EMIuE2lvaPRkExqXxeuMh6KCduDdpyq7lY
	 INcCqGKs7MsQTQOnFhadq8AZJNI6EDY4BHOBXAjeybBklrKsZmMiOJnAdw1fJ+2E5cBJ/
	 LUeyZVfoqvU0tyEY3VDmeqhR/trx+8wjKZY+f1rMNRaDKd06iYcydw1w6bAq4R7rg7Eyc
	 RWT/wYNb7BCh2NNu+av3m3pV/6uDe7WplUoHsg5XX26d9yN25y3ZKmPj2cbTdRbzPKrpY
	 Rf/9x0v/PobyjfklU2yqS1aSvKl0q6NEK3EqGBWOjwfJKsp9/KnbNvZWouDvooTQitQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YkoPKmID;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A54606A337
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:18:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53A54606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YkoPKmID
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-38587f3de36so4042582eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795443524; x=1796048324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JqQbNFCUHZA68tu7W/cFcA8xZJIzsGYbBrlERWsIurU=;
        b=YkoPKmIDIbL9LgHeIpkhE2zr8AJxTFWnpGhriEhqchhUhOJsTf2Psr4wL1n6Ra7JiB
         J5HAyjYgC5kcMEr3vc2o/5Y2Sku4VW/rNmT9a83IMX14g4yUDMUi7+nk2scptO9agsqk
         zWUeugNmO2pFjBq0XYLKj9Mu8jbn7xQ8W+betPpZTNRRYIyuf2I+sT/wGJylCgZZNLpn
         5Xl10SxVcMxnX/xzPkZv/wHTu4vEX6dXjyODK8CvBTPHrX3ZapPVsC6/gTOCo2pE/Stk
         lQiVdWCtCf0amltf5haFqOYeiATXDSixwCQuxmZG5bHNrzknIhKET4GM6MMjRAs8KkHa
         NZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443524; x=1796048324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JqQbNFCUHZA68tu7W/cFcA8xZJIzsGYbBrlERWsIurU=;
        b=bdfKwJB+NsU4VbZbH6UG3Z2dblgZKmCRWVpK9PlaPZ22L8GCgkPVVWTjXY/ut8nrwi
         jV1QbcvnMCLJQD1tNIVXLMeq41r2qNxDL2Ew6ZsQDydJBsYkQSnsjP8r3N235BIrzm/h
         L3W0CO/yt/u+j7SJ5aawBxeq2RSlmeR5qOd5f2IdVeuPbTnlLNwafuQEtQgP1plkmPfp
         aKvmTjrVG3PB2ny69zrZfPyT1CivFpc4R7fDQ2kXYGWQqmcXQ7TXWrZZ+NagLEfjI+zv
         0qrZImm0lhJshpdbUuzXhSVxsUfz64+lkvC40g+L2+/za0pekRyaMQXvwkNOYsvGgbCg
         AxtA==
X-Gm-Message-State: APuU4Z99xrR3U1U23p2Kh+wNBDwuAN/Q5oArGUw/Tccvs856gbntAf+J
	IoDvVyrt+Rg4vxm99a2qWLTwenxtGk/1TK1TTREHRWUMQaXZh+FSph7B
X-Gm-Gg: AZFdTZeNp3ZCH1zkq/ta3Czrer7v2jMlH4Owzva6qd5VROcxmAgCpzFZFoJFkXOylmj
	CQZ+5vGPcItO34E9FaVb8GDchSl1097aMnfYYWHR18TLwEaHOu+R6cyWkby8zrCC+FZA40WzTsT
	eGkWzehoR8qM66T0h7nVfypDJvSDc3hkImaX74ekaAhRI0ikIKBvjCt8g1UjqJmKqPmA5sis/yU
	I9hHhrGQHSOxwEdOb/4b86lkY2pKRqvAAlR6fmxXA2utB+pu+WIZNIpHpid0hKMeGPETapNEBvO
	ueblxyDWutQQmwmZDhjAcVnkwojmDMrhejY48DJein4MctFv6QUTdVHCXTrCkcYVJi20TOgHr3F
	BF9xVBTBFNzzeAq9D7C7zM9AdR/W0IqsXpo5sxcMYzLEsGIHudHXVh5WB3wEGUCKY0QB3pJ+lpK
	7X0a1Vf+b33GrLu66yjAajdgoLGBU4lw+/+dodc3NcLsuOWgM8hlarLyGq1u7nNaywzCmfgEIXk
	FVEnoiNCJrS5xBwegZoNmGaOhydQWSmKe8hy5PmMn/wJChf2TTPKSwM0S3iovoHiFW3NZHKkvqR
	RTPzpWdjMvQSGrTfFlh1Z5xIp3v+d/hXVw8mdg2xfWbziHY+nqFZXPMXOz2VP9cxWqn6
X-Received: by 2002:a05:7300:c7ca:b0:386:964d:45d2 with SMTP id 5a478bee46e88-386964d5ddcmr10076844eec.11.1795443524121;
        Mon, 23 Nov 2026 06:18:44 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3866f299d0bsm29200009eec.19.2026.11.23.06.18.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 06:18:43 -0800 (PST)
From: Lian Wang <lianux.mm@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Kairui Song <kasong@tencent.com>,
	Jihan LIN <linjh22s@gmail.com>,
	Kunwu Chan <kunwu.chan@linux.dev>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [PATCH v5 11/19] mm/swap: add priority queue for swap device allocation
Date: Mon, 23 Nov 2026 22:18:34 +0800
Message-ID: <3c945c85ab8f57080afc7878ff5c6c783856fa07.1795439990.git.lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795439990.git.lianux.mm@gmail.com>
References: <cover.1795439990.git.lianux.mm@gmail.com>
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

From: Kairui Song <kasong@tencent.com>

Swap device selection rotates swap_avail_head with plist_requeue(),
serializing cluster transitions on swap_avail_lock. Separate selection
from device-local cluster allocation with same-priority device rings
ordered from highest priority to lowest.

Keep membership and sizes stable under swapon_rwsem during each
allocation walk. Full or disabled devices remain as masked pointers.
Serialize tag writers with swap_queue_update_lock and use READ_ONCE()
and WRITE_ONCE() for complete tagged-pointer accesses.

Each per-CPU reader holds one head per ring: a starting offset and a
base-page quota. A task-local cursor snapshots that offset so retries
visit every peer once even if another task advances the shared head.
Disable migration across the sleepable walk. Large folios retry same-priority peers before asking
the caller to split instead of falling through after one fragmented
device.

Prepare reader storage with GFP_NOIO outside the topology writer, then
recheck priority and required length before publication. Transfer the
prepared storage only on successful installation; otherwise free it
after unlocking. Keep per-CPU backing allocation outside the writer's
noreclaim scope because it filters caller GFP flags. Constrain small
queue/ring allocations with a scoped noreclaim context and
__GFP_NOMEMALLOC, restoring context before cleanup. Deletion keeps reader
storage until replacement or an empty queue, avoiding shrinking backing
allocations beneath the writer.

These boundaries prevent queue updates from reclaiming into a swap
allocation that would acquire a reader behind the same writer. The
cluster metadata fallback also avoids direct reclaim while the walk
retains its outer reader. These recursive paths were identified by
source inspection rather than reproduced hangs.

Publish swap_file, the live reference, queue membership and SWP_WRITEOK
under the same writer. Complete the disable flag and queue mask
transition before releasing that writer, so a new allocation reader
cannot select a device that is no longer writable.

Keep the old available plist in parallel while migrating its remaining
consumers.

Link: https://lore.kernel.org/20260714-swap-pcp-priq-v1-9-de9b164ed419@tencent.com
Link: https://lore.kernel.org/alZ7UBXweuuOX4qz@yjaykim-PowerEdge-T330
Link: https://lore.kernel.org/77d6da3d-10af-49a1-a356-72aa8b462e85@gmail.com
Signed-off-by: Kairui Song <kasong@tencent.com>
Co-developed-by: Lian Wang <lianux.mm@gmail.com>
Signed-off-by: Lian Wang <lianux.mm@gmail.com>
---
 include/linux/swap.h |   3 +-
 mm/swapfile.c        | 576 ++++++++++++++++++++++++++++++++++++++-----
 2 files changed, 515 insertions(+), 64 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index c8a5684b2f4f..6f32de173fb9 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -196,7 +196,8 @@ struct swap_extent {
  * - SWP_USED: Protected by swapon_rwsem. Indicates the device is inuse. Once
  *   set, won't be cleared unless all reference to this device is freed and
  *   swapoff finished.
- * - SWP_WRITEOK: Protected by swapon_rwsem, si->lock and swap_avail_lock.
+ * - SWP_WRITEOK: Protected by swapon_rwsem, si->lock and
+ *   swap_queue_update_lock.
  *   Clearing this flag is followed by waiting for all current cluster lock
  *   users to exit, so
  *   checking this flag while holding any of these locks ensures the device
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 1ef5f1ead656..1e5f88f516c1 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -55,12 +55,14 @@ static bool folio_swapcache_freeable(struct folio *folio);
 static void move_cluster(struct swap_info_struct *si,
 			 struct swap_cluster_info *ci, struct list_head *list,
 			 enum swap_cluster_flags new_flags);
+static bool get_swap_device_info(struct swap_info_struct *si);
 
 /*
  * Serializes swapon/swapoff (writers) and protects the swap_info
  * array, nr_swapfiles, total_swap_pages, and part of swap device
- * info content (see comment of swap_info_struct). Read-side users
- * take percpu_down_read() while inspecting this protected state.
+ * info content (see comment of swap_info_struct).  Readers
+ * (allocation, /proc/swaps, etc.) take percpu_down_read() which
+ * is cheap as the hot path.
  */
 DEFINE_STATIC_PERCPU_RWSEM(swapon_rwsem);
 /*
@@ -159,18 +161,435 @@ static struct swap_info_struct *swap_entry_to_info(swp_entry_t entry)
 	return swap_type_to_info(swp_type(entry));
 }
 
+/*
+ * All available swap_info_structs are grouped by priority rings, the rings
+ * are ordered in a queue by priority (higher prio value = higher priority).
+ * The allocator iterates and rotates devices within each priority ring.
+ * When all devices in a ring are iterated, it goes to the next lower
+ * priority ring.
+ */
+struct swap_prio_ring {
+	int prio;
+	unsigned int size;
+	struct swap_info_struct *dev[] __counted_by(size);
+};
+
+/*
+ * The ring is protected by swapon_rwsem so updating it is costly. To make
+ * the allocator and other users skip full devices faster, the lowest bit of
+ * a device pointer is used to mark it disabled (temporarily unavailable).
+ * This relies on the natural alignment of struct swap_info_struct.
+ */
+#define SWAP_DEVICE_MASKED_SHIFT	0
+#define SWAP_DEVICE_MASKED_BIT		BIT(SWAP_DEVICE_MASKED_SHIFT)
+static_assert(__alignof__(struct swap_info_struct) >= 2);
+
+/*
+ * Serializes queue content mutations and keeps SWAP_USAGE_OFFLIST_BIT
+ * consistent with the masked state of each device pointer.
+ */
+static DEFINE_SPINLOCK(swap_queue_update_lock);
+
+/*
+ * Swap queue is protected by both swap_queue_update_lock and swapon_rwsem.
+ * Only swapon/swapoff will take the write lock, and modify the queue length
+ * or any ring's length. swap_queue_update_lock protects the content so
+ * devices can be masked easily without taking the writelock, which is heavy.
+ */
+static struct swap_prio_ring **swap_queue;
+static unsigned int swap_queue_len;
+
+/*
+ * Each CPU keeps a rotation head per priority ring. Its offset and
+ * base-page quota are shared by allocations on that CPU.
+ */
+#define SWAP_ROUND_ROBIN_QUOTA SWAPFILE_CLUSTER
+struct swap_queue_reader_head {
+	int offset;
+	long rr_counter;
+};
+
+struct swap_queue_reader {
+	local_lock_t lock;
+	struct swap_queue_reader_head heads[];
+};
+
+struct swap_queue_cursor {
+	bool valid;
+	bool no_fallback; /* Do not descend to a lower priority ring. */
+	unsigned int ring_idx;
+	unsigned int offset;
+};
+
+static __percpu struct swap_queue_reader *swap_queue_readers;
+
+static inline bool swap_device_masked(struct swap_info_struct *si)
+{
+	return (unsigned long)si & SWAP_DEVICE_MASKED_BIT;
+}
+
+static inline struct swap_info_struct *swap_device_mask_ptr(struct swap_info_struct *si)
+{
+	return (struct swap_info_struct *)((unsigned long)si |
+					   SWAP_DEVICE_MASKED_BIT);
+}
+
+static inline struct swap_info_struct *swap_device_unmask_ptr(struct swap_info_struct *si)
+{
+	return (struct swap_info_struct *)((unsigned long)si & ~SWAP_DEVICE_MASKED_BIT);
+}
+
+static struct swap_queue_reader __percpu *swap_queue_prealloc_readers(int nr_rings, gfp_t gfp)
+{
+	struct swap_queue_reader __percpu *readers;
+
+	if (!nr_rings)
+		return NULL;
+
+	readers = __alloc_percpu_gfp(struct_size(readers, heads, nr_rings),
+				     __alignof__(*readers), gfp);
+	return readers;
+}
+
+static bool swap_queue_needs_readers(int prio)
+{
+	unsigned int i;
+
+	lockdep_assert_held_write(&swapon_rwsem);
+	for (i = 0; i < swap_queue_len; i++) {
+		if (swap_queue[i]->prio == prio)
+			return false;
+	}
+
+	return true;
+}
+
+/*
+ * Return with swapon_rwsem held for writing, or unlocked on allocation failure.
+ * Per-CPU backing allocations may reclaim, so prepare them before publishing
+ * the device and outside the topology lock and our noreclaim scope. Keep NOIO
+ * because the swapon caller still holds the swapfile's inode lock.
+ */
+static int swap_queue_lock_for_add(int prio,
+				   struct swap_queue_reader __percpu **readers,
+				   unsigned int *nr_readers)
+{
+	*readers = NULL;
+	*nr_readers = 0;
+	for (;;) {
+		percpu_down_write(&swapon_rwsem);
+		if (!swap_queue_needs_readers(prio) ||
+		    *nr_readers > swap_queue_len)
+			return 0;
+
+		*nr_readers = swap_queue_len + 1;
+		percpu_up_write(&swapon_rwsem);
+		free_percpu(*readers);
+		*readers = swap_queue_prealloc_readers(*nr_readers, GFP_NOIO);
+		if (!*readers)
+			return -ENOMEM;
+	}
+}
+
+static void swap_queue_reset_readers(void)
+{
+	int ring_idx, cpu;
+	struct swap_prio_ring *ring;
+
+	lockdep_assert_held_write(&swapon_rwsem);
+	/* A new topology starts a fresh, distributed rotation on every CPU. */
+	for_each_possible_cpu(cpu) {
+		for (ring_idx = 0; ring_idx < swap_queue_len; ring_idx++) {
+			ring = swap_queue[ring_idx];
+			per_cpu_ptr(swap_queue_readers, cpu)->heads[ring_idx].offset =
+				    cpu % ring->size;
+			per_cpu_ptr(swap_queue_readers, cpu)->heads[ring_idx].rr_counter =
+				    SWAP_ROUND_ROBIN_QUOTA;
+		}
+	}
+}
+
+static void swap_queue_install_readers(struct swap_queue_reader __percpu *readers)
+{
+	int cpu;
+
+	lockdep_assert_held_write(&swapon_rwsem);
+	free_percpu(swap_queue_readers);
+	swap_queue_readers = readers;
+	if (!readers)
+		return;
+
+	for_each_possible_cpu(cpu)
+		local_lock_init(&per_cpu_ptr(readers, cpu)->lock);
+	swap_queue_reset_readers();
+}
+
+static struct swap_info_struct *swap_queue_get_device(long nr_alloc, int nr_iter,
+						      struct swap_queue_cursor *cursor)
+{
+	bool rotate = false;
+	struct swap_info_struct *si;
+	struct swap_queue_reader_head *head;
+	struct swap_prio_ring *ring;
+	unsigned int dev_idx, queue_idx;
+
+	if (!swap_queue_len)
+		return ERR_PTR(-ENOENT);
+
+	queue_idx = 0;
+	while (nr_iter >= swap_queue[queue_idx]->size) {
+		nr_iter -= swap_queue[queue_idx]->size;
+		if (++queue_idx >= swap_queue_len)
+			return ERR_PTR(cursor->no_fallback ? -E2BIG : -ENOENT);
+	}
+	if (cursor->no_fallback && cursor->ring_idx != queue_idx)
+		return ERR_PTR(-E2BIG);
+
+	ring = swap_queue[queue_idx];
+	local_lock(&swap_queue_readers->lock);
+	head = this_cpu_ptr(&swap_queue_readers->heads[queue_idx]);
+	/*
+	 * Snapshot the starting offset for this walk. Other allocations on
+	 * this CPU can move the shared head between retries.
+	 */
+	if (!cursor->valid || cursor->ring_idx != queue_idx) {
+		cursor->valid = true;
+		cursor->ring_idx = queue_idx;
+		if (head->rr_counter < nr_alloc)
+			rotate = true;
+		else if (head->offset >= ring->size)
+			rotate = true;
+		if (rotate) {
+			head->offset++;
+			head->offset %= ring->size;
+			head->rr_counter = SWAP_ROUND_ROBIN_QUOTA;
+		}
+		cursor->offset = head->offset;
+	}
+
+	dev_idx = (cursor->offset + nr_iter) % ring->size;
+	if (nr_iter) {
+		head->offset = dev_idx;
+		head->rr_counter = SWAP_ROUND_ROBIN_QUOTA;
+	}
+	head->rr_counter -= nr_alloc;
+	si = READ_ONCE(ring->dev[dev_idx]);
+	local_unlock(&swap_queue_readers->lock);
+
+	if (swap_device_masked(si))
+		return ERR_PTR(-EBUSY);
+
+	si = swap_device_unmask_ptr(si);
+	return si;
+}
+
+static bool swap_queue_find(struct swap_info_struct *si,
+			    unsigned int *ring_idx, unsigned int *dev_idx)
+{
+	unsigned int i, j;
+	struct swap_prio_ring *ring;
+
+	lockdep_assert(lockdep_is_held(&swapon_rwsem) ||
+		       lockdep_is_held(&swap_queue_update_lock));
+
+	for (i = 0; i < swap_queue_len; i++) {
+		ring = swap_queue[i];
+		if (ring->prio != si->prio)
+			continue;
+		for (j = 0; j < ring->size; j++) {
+			if (swap_device_unmask_ptr(READ_ONCE(ring->dev[j])) != si)
+				continue;
+			*ring_idx = i;
+			*dev_idx = j;
+			return true;
+		}
+	}
+	return false;
+}
+
+static void swap_queue_mask(struct swap_info_struct *si)
+{
+	unsigned int ring_idx, dev_idx;
+
+	lockdep_assert_held(&swap_queue_update_lock);
+	if (swap_queue_find(si, &ring_idx, &dev_idx))
+		WRITE_ONCE(swap_queue[ring_idx]->dev[dev_idx],
+			   swap_device_mask_ptr(si));
+}
+
+static void swap_queue_unmask(struct swap_info_struct *si)
+{
+	unsigned int ring_idx, dev_idx;
+
+	lockdep_assert_held(&swap_queue_update_lock);
+	if (swap_queue_find(si, &ring_idx, &dev_idx))
+		WRITE_ONCE(swap_queue[ring_idx]->dev[dev_idx], si);
+}
+
+/* Prepared readers remain caller-owned unless installed successfully. */
+static int swap_queue_add(struct swap_info_struct *si,
+			  struct swap_queue_reader __percpu **readers,
+			  unsigned int nr_readers)
+{
+	struct swap_prio_ring **new_queue = NULL, **old_queue = NULL;
+	struct swap_prio_ring *ring, *new_ring = NULL, *old_ring = NULL;
+	int prio = si->prio;
+	int i, pos, err = -ENOMEM;
+	unsigned int noreclaim_flag;
+	gfp_t gfp;
+
+	/* A writer must not reclaim into another swap allocation. */
+	gfp = GFP_NOIO | __GFP_HIGH | __GFP_NOMEMALLOC;
+	lockdep_assert_held_write(&swapon_rwsem);
+	noreclaim_flag = memalloc_noreclaim_save();
+
+	for (pos = 0; pos < swap_queue_len; pos++) {
+		if (swap_queue[pos]->prio == prio)
+			goto add_to_ring;
+		if (swap_queue[pos]->prio < prio)
+			break;
+	}
+
+	/* No ring at this priority: insert a new one at pos. */
+	if (!*readers || nr_readers <= swap_queue_len)
+		goto failed;
+	new_queue = kmalloc_array(swap_queue_len + 1, sizeof(*swap_queue), gfp);
+	if (!new_queue)
+		goto failed;
+	new_ring = kmalloc(struct_size(new_ring, dev, 1), gfp);
+	if (!new_ring)
+		goto failed;
+	if (!get_swap_device_info(si))
+		goto failed;
+
+	new_ring->prio = prio;
+	new_ring->size = 1;
+	new_ring->dev[0] = si;
+	for (i = 0; i < pos; i++)
+		new_queue[i] = swap_queue[i];
+	new_queue[pos] = new_ring;
+	for (i = pos; i < swap_queue_len; i++)
+		new_queue[i + 1] = swap_queue[i];
+
+	spin_lock(&swap_queue_update_lock);
+	old_queue = swap_queue;
+	swap_queue = new_queue;
+	swap_queue_len++;
+	spin_unlock(&swap_queue_update_lock);
+	memalloc_noreclaim_restore(noreclaim_flag);
+	kfree(old_queue);
+
+	swap_queue_install_readers(*readers);
+	*readers = NULL;
+	return 0;
+
+add_to_ring:
+	ring = swap_queue[pos];
+	new_ring = kmalloc(struct_size(ring, dev, ring->size + 1), gfp);
+	if (!new_ring)
+		goto failed;
+	if (!get_swap_device_info(si))
+		goto failed;
+	spin_lock(&swap_queue_update_lock);
+	memcpy(new_ring, ring, struct_size(ring, dev, ring->size));
+	new_ring->size++;
+	new_ring->dev[new_ring->size - 1] = si;
+	old_ring = swap_queue[pos];
+	swap_queue[pos] = new_ring;
+	spin_unlock(&swap_queue_update_lock);
+	memalloc_noreclaim_restore(noreclaim_flag);
+	kfree(old_ring);
+	return 0;
+
+failed:
+	memalloc_noreclaim_restore(noreclaim_flag);
+	kfree(new_queue);
+	kfree(new_ring);
+	return err;
+}
+
+static void swap_queue_del(struct swap_info_struct *si)
+{
+	gfp_t gfp;
+	unsigned int noreclaim_flag;
+	unsigned int ring_idx, dev_idx;
+	struct swap_prio_ring *ring, *new_ring = NULL, *old_ring = NULL;
+	struct swap_prio_ring **new_queue = NULL, **old_queue = NULL;
+
+	lockdep_assert_held_write(&swapon_rwsem);
+	if (!swap_queue_find(si, &ring_idx, &dev_idx)) {
+		WARN_ON(1);
+		return;
+	}
+
+	/*
+	 * Shrinking the small topology arrays is optional. Keep reader storage
+	 * until a new priority is inserted or the queue is empty: per-CPU
+	 * allocation must not run under this writer's noreclaim scope, which
+	 * can grant backing pages reserve access.
+	 */
+	gfp = GFP_NOIO | __GFP_HIGH | __GFP_NOMEMALLOC;
+	noreclaim_flag = memalloc_noreclaim_save();
+	ring = swap_queue[ring_idx];
+	if (ring->size > 1)
+		new_ring = kmalloc(struct_size(ring, dev, ring->size - 1), gfp);
+	if (ring->size == 1 && swap_queue_len > 1) {
+		new_queue = kmalloc(sizeof(*swap_queue) *
+				    (swap_queue_len - 1), gfp);
+	}
+	memalloc_noreclaim_restore(noreclaim_flag);
+
+	spin_lock(&swap_queue_update_lock);
+	if (ring->size > 1) {
+		/* Shift trailing devices left to fill the gap. */
+		while (++dev_idx < ring->size)
+			ring->dev[dev_idx - 1] =
+				ring->dev[dev_idx];
+		ring->size--;
+		if (new_ring) {
+			memcpy(new_ring, ring,
+			       struct_size(ring, dev, ring->size));
+			old_ring = ring;
+			swap_queue[ring_idx] = new_ring;
+		}
+	} else {
+		/* Last device in this ring: remove the ring. */
+		old_ring = ring;
+		swap_queue_len--;
+		while (++ring_idx <= swap_queue_len)
+			swap_queue[ring_idx - 1] =
+				swap_queue[ring_idx];
+		if (new_queue) {
+			memcpy(new_queue, swap_queue,
+			       sizeof(*swap_queue) * swap_queue_len);
+			old_queue = swap_queue;
+			swap_queue = new_queue;
+		} else if (!swap_queue_len) {
+			old_queue = swap_queue;
+			swap_queue = NULL;
+		}
+		if (!swap_queue_len)
+			swap_queue_install_readers(NULL);
+	}
+	spin_unlock(&swap_queue_update_lock);
+
+	kfree(old_ring);
+	kfree(old_queue);
+	put_swap_device(si);
+}
+
 /*
  * Use the second highest bit of inuse_pages counter as the indicator
- * if one swap device is on the available plist, so the atomic can
+ * if one swap device is unavailable for allocation, so the atomic can
  * still be updated arithmetically while having special data embedded.
  *
  * inuse_pages counter is the only thing indicating if a device should
- * be on avail_lists or not (except swapon / swapoff). By embedding the
- * off-list bit in the atomic counter, updates no longer need any lock
- * to check the list status.
+ * be in the available queue or not (except swapon / swapoff). By
+ * embedding the off-list bit in the atomic counter, updates no longer
+ * need any lock to check the list status.
  *
- * This bit will be set if the device is not on the plist and not
- * usable, will be cleared if the device is on the plist.
+ * This bit will be set if the device is not in the available queue
+ * and not usable, will be cleared if the device is in the queue.
  */
 #define SWAP_USAGE_OFFLIST_BIT (1UL << (BITS_PER_TYPE(atomic_long_t) - 2))
 #define SWAP_USAGE_COUNTER_MASK (~SWAP_USAGE_OFFLIST_BIT)
@@ -611,11 +1030,11 @@ swap_cluster_populate(struct swap_info_struct *si,
 		return ci;
 
 	/*
-	 * Drop the device and cluster locks before retrying. Metadata allocation
-	 * must not recurse into swap allocation through direct reclaim: callers
-	 * can retain outer synchronization across cluster population. Restrict
-	 * this request instead of granting the task PF_MEMALLOC, which could
-	 * give allocator hooks and failure cleanup reserve access.
+	 * Retry with the local and cluster locks dropped. The allocator can
+	 * still hold swapon_rwsem for reading: direct reclaim could enter
+	 * swap allocation again while a writer is waiting for this reader.
+	 * Restrict this request instead of granting the task PF_MEMALLOC,
+	 * which could give allocator hooks and failure cleanup reserve access.
 	 */
 	spin_unlock(&ci->lock);
 	if (si->flags & SWP_SOLIDSTATE)
@@ -1293,6 +1712,7 @@ static void del_from_avail_list(struct swap_info_struct *si, bool swapoff)
 	unsigned long pages;
 
 	spin_lock(&swap_avail_lock);
+	spin_lock(&swap_queue_update_lock);
 
 	/*
 	 * Force remove it only for swapoff. Else, take it off-list only if
@@ -1313,9 +1733,10 @@ static void del_from_avail_list(struct swap_info_struct *si, bool swapoff)
 		atomic_long_or(SWAP_USAGE_OFFLIST_BIT, &si->inuse_pages);
 	}
 
+	swap_queue_mask(si);
 	plist_del(&si->avail_list, &swap_avail_head);
-
 skip:
+	spin_unlock(&swap_queue_update_lock);
 	spin_unlock(&swap_avail_lock);
 }
 
@@ -1326,12 +1747,12 @@ static void add_to_avail_list(struct swap_info_struct *si)
 	unsigned long pages;
 
 	spin_lock(&swap_avail_lock);
+	spin_lock(&swap_queue_update_lock);
 
 	/*
-	 * Add the device to the avail list if SWP_WRITEOK is set and
-	 * SWAP_USAGE_OFFLIST_BIT is still set. Swapoff clears
-	 * SWP_WRITEOK first, so the device won't be re-added after
-	 * swapoff starts unless swap_device_enable resurrects it.
+	 * Mark the device as avail if SWP_WRITEOK is set. Swapoff clears
+	 * SWP_WRITEOK first, so check that first so the device won't be
+	 * re-added after swapoff started.
 	 */
 	if (!(READ_ONCE(si->flags) & SWP_WRITEOK))
 		goto skip;
@@ -1342,9 +1763,10 @@ static void add_to_avail_list(struct swap_info_struct *si)
 	val = atomic_long_fetch_and_relaxed(~SWAP_USAGE_OFFLIST_BIT, &si->inuse_pages);
 
 	/*
-	 * When device is full and device is on the plist, only one updater will
-	 * see (inuse_pages == si->pages) and will call del_from_avail_list. If
-	 * that updater happen to be here, just skip adding.
+	 * When device is full and marked as available, one reader will see
+	 * (inuse_pages == si->pages) and should mark it as unavailable and
+	 * set SWAP_USAGE_OFFLIST_BIT. If that updater happens to be here, just
+	 * skip the rest.
 	 */
 	pages = si->pages;
 	if ((val & SWAP_USAGE_COUNTER_MASK) == pages) {
@@ -1354,9 +1776,10 @@ static void add_to_avail_list(struct swap_info_struct *si)
 			goto skip;
 	}
 
+	swap_queue_unmask(si);
 	plist_add(&si->avail_list, &swap_avail_head);
-
 skip:
+	spin_unlock(&swap_queue_update_lock);
 	spin_unlock(&swap_avail_lock);
 }
 
@@ -1373,7 +1796,7 @@ static void swap_device_inuse_add(struct swap_info_struct *si,
 
 	/*
 	 * If device is full, and SWAP_USAGE_OFFLIST_BIT is not set,
-	 * remove it from the plist.
+	 * mark it unavailable.
 	 */
 	inuse_pages = atomic_long_add_return_relaxed(nr_entries, &si->inuse_pages);
 	if (unlikely(inuse_pages == si->pages)) {
@@ -1415,7 +1838,7 @@ static void swap_device_inuse_sub(struct swap_info_struct *si, unsigned long off
 
 	/*
 	 * If device is not full, and SWAP_USAGE_OFFLIST_BIT is set,
-	 * add it back to the plist.
+	 * add it back to the available queue.
 	 */
 	inuse_pages = atomic_long_sub_return_relaxed(nr_entries, &si->inuse_pages);
 	if (unlikely(inuse_pages & SWAP_USAGE_OFFLIST_BIT))
@@ -1438,41 +1861,44 @@ static bool get_swap_device_info(struct swap_info_struct *si)
 	return true;
 }
 
-/* Rotate the device and switch to a new cluster */
-static void swap_alloc_entry(struct folio *folio)
+static int swap_alloc_entry(struct folio *folio)
 {
-	struct swap_info_struct *si, *next;
+	struct swap_queue_cursor cursor = {};
+	long nr_pages = folio_nr_pages(folio);
+	struct swap_info_struct *si;
+	int nr_iter, ret;
 
-	spin_lock(&swap_avail_lock);
-start_over:
-	plist_for_each_entry_safe(si, next, &swap_avail_head, avail_list) {
-		/* Rotate the device and switch to a new cluster */
-		plist_requeue(&si->avail_list, &swap_avail_head);
-		spin_unlock(&swap_avail_lock);
-		if (get_swap_device_info(si)) {
-			cluster_alloc_swap_entry(si, folio);
-			put_swap_device(si);
-			if (folio_test_swapcache(folio))
-				return;
-			if (folio_test_large(folio))
-				return;
+	percpu_down_read(&swapon_rwsem);
+	migrate_disable();
+	for (nr_iter = 0;; nr_iter++) {
+		si = swap_queue_get_device(nr_pages, nr_iter, &cursor);
+		if (IS_ERR(si)) {
+			ret = PTR_ERR(si);
+			if (ret == -EBUSY)
+				continue;
+			break;
+		}
+		cluster_alloc_swap_entry(si, folio);
+
+		if (folio_test_swapcache(folio)) {
+			ret = 0;
+			break;
 		}
 
-		spin_lock(&swap_avail_lock);
 		/*
-		 * if we got here, it's likely that si was almost full before,
-		 * multiple callers probably all tried to get a page from the
-		 * same si and it filled up before we could get one; or, the si
-		 * filled up between us dropping swap_avail_lock.
-		 * Since we dropped the swap_avail_lock, the swap_avail_list
-		 * may have been modified; so if next is still in the
-		 * swap_avail_head list then try it, otherwise start over if we
-		 * have not gotten any slots.
+		 * For large allocations, try every device at the same priority,
+		 * but ask the caller to split instead of falling back to a lower
+		 * priority ring.
 		 */
-		if (plist_node_empty(&next->avail_list))
-			goto start_over;
+		if (folio_test_large(folio)) {
+			cursor.no_fallback = true;
+			continue;
+		}
 	}
-	spin_unlock(&swap_avail_lock);
+
+	migrate_enable();
+	percpu_up_read(&swapon_rwsem);
+	return ret;
 }
 
 /*
@@ -3090,18 +3516,17 @@ static int setup_swap_extents(struct swap_info_struct *sis,
 }
 
 /*
- * Mark a fully initialized swap device writable and expose it to the
- * allocator. The caller must have resurrected its percpu ref first.
+ * Mark a fully initialized swap device writable and expose it to the allocator.
+ * The caller must have resurrected its percpu ref before entering this helper.
  */
 static void __swap_device_enable(struct swap_info_struct *si)
 {
 	lockdep_assert_held_write(&swapon_rwsem);
 	spin_lock(&si->lock);
-	spin_lock(&swap_avail_lock);
+	spin_lock(&swap_queue_update_lock);
 	si->flags |= SWP_WRITEOK;
-	spin_unlock(&swap_avail_lock);
+	spin_unlock(&swap_queue_update_lock);
 	spin_unlock(&si->lock);
-
 	atomic_long_add(si->pages, &nr_swap_pages);
 	total_swap_pages += si->pages;
 	plist_add(&si->list, &swap_active_head);
@@ -3234,6 +3659,11 @@ SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 		return err;
 	}
 
+	percpu_down_write(&swapon_rwsem);
+	swap_queue_del(p);
+	percpu_ref_kill(&p->users);
+	percpu_up_write(&swapon_rwsem);
+
 	/*
 	 * Wait for swap operations protected by get/put_swap_device()
 	 * to complete.  Because of synchronize_rcu() here, all swap
@@ -3242,7 +3672,6 @@ SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 	 * prevent folio_test_swapcache() and the following swap cache
 	 * operations from racing with swapoff.
 	 */
-	percpu_ref_kill(&p->users);
 	synchronize_rcu();
 	wait_for_completion(&p->comp);
 
@@ -3704,6 +4133,8 @@ static int setup_swap_clusters_info(struct swap_info_struct *si,
 SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 {
 	struct swap_info_struct *si;
+	struct swap_queue_reader __percpu *readers;
+	unsigned int nr_readers;
 	struct file *swap_file = NULL;
 	struct address_space *mapping;
 	struct dentry *dentry;
@@ -3890,14 +4321,33 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 	si->prio = prio;
 	si->list.prio = -si->prio;
 	si->avail_list.prio = -si->prio;
-	/* Publish the file, live reference and writable state together. */
-	percpu_down_write(&swapon_rwsem);
-	si->swap_file = swap_file;
 
-	/* Make the reference live before exposing the writable device. */
+	/*
+	 * Publish swap_file before making the percpu ref live, then add the device
+	 * to the queue and make it writable under the same write-side lock. This
+	 * keeps lockless ref users and /proc/swaps from observing partial state.
+	 */
+	error = swap_queue_lock_for_add(prio, &readers, &nr_readers);
+	if (error) {
+		inode->i_flags &= ~S_SWAPFILE;
+		goto free_swap_zswap;
+	}
+	si->swap_file = swap_file;
 	percpu_ref_resurrect(&si->users);
-	__swap_device_enable(si);
+	error = swap_queue_add(si, &readers, nr_readers);
+	if (error) {
+		si->swap_file = NULL;
+		percpu_ref_kill(&si->users);
+	} else {
+		__swap_device_enable(si);
+	}
 	percpu_up_write(&swapon_rwsem);
+	free_percpu(readers);
+	if (error) {
+		wait_for_completion(&si->comp);
+		inode->i_flags &= ~S_SWAPFILE;
+		goto free_swap_zswap;
+	}
 
 	pr_info("Adding %luk swap on %s.  Priority:%d extents:%d across:%lluk %s%s%s%s\n",
 		K((unsigned long)si->pages), name->name, si->prio, nr_extents,
