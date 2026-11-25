Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596151;
	b=YDU8PnZZAG+yWliIwbBqmqQd79GdOLAJ97MyJ3MZUgK36GI91jNCLXKHKvLHgvaP7Dwr
	 IW/GM0oKjXeauG+CzEfVXRaiO2mGMmL5d77JUI95awnr4fF1LCr6BnMB16oRJbE1U0XPV
	 63BrvbNptcXRGZpPN5uP2K3NjJxbudosdPyarI7wwfShrmq7CfzzN7C7YN4cpvqCuubD7
	 xX5RKBR4U9YY2eUIbHLlzhLaPSInY1dccK9OabZ3BrawrIRAViqv1IzXmbzb8U5aFa4g3
	 aTsnFFPCEU3QfsljMcRcnW2klRhyUBKTjVzy5IMoIIJydB7rukLA/gZPoDaMeHopzdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596151;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ZSvh4Qwu0h8OJdR8+MiT1ZzApUDwrQReChmK7wamOaE=;
	b=0lRy4KEO4mtj5nrMCWaK8Nrt+THWxsVg2R0p+yt80I/eS0t3ow4cLHhMOy/7f2cZBHZS
	 LZlFEui2/l9ffGBOSPjNTFT41Nji9phGBZziaCjNtW/JoaykdBHxYI8DH3l8+VZdka1LI
	 2X4a5bpf4Kx2yZIXRo8oK2iKy4BJQcPDwv3Y0J5xK9QpHbd7JOe+YyZUZn9SlXaF9B5Ge
	 KkVVOypP4F5GvUNQjNfzxXNL7OlXbqdP5wpalhVolMe94X6oO0nAc1ppIcA85h28KdBmo
	 D47M9GQVtzf+xGiEUZhYJB4Fv/1vBH+Yu0XdtBfr/Ku4aPbePc35Gkk9FzdRDoztqcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=h3IiHOrW;
	arc=none smtp.remote-ip=95.215.58.121
Received: from mta1.migadu.com (out-121.mta1.migadu.com [95.215.58.121])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B034606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B034606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=h3IiHOrW
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=sJ/2ZbzaqcfeCaxGMm3EfPm8Ar39j5+iRnGJrB7nvUs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795596149; v=1; x=1796200949;
 b=h3IiHOrWRs95/O+DTtGWrpA7RlLiQN4DX9yNaBXtQn4TeFCQXUAVhGZN/LP2F1S4OOJxgXVe
 TFkSbuc1YQlCNGGMVHT9jlv6GbgMYgqWOSsa0vDmMwTwVCqksQy6SbCcLH1o4ptvAmtxXOUuGDB
 MfTeTiatzOffL46ErvwqHVdw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 8fa35624655c959f;
	Wed, 25 Nov 2026 08:42:28 +0000
X-Mizu-Trace-ID: 8fa35624655c959f
X-Migadu-Flow: FLOW_OUT
From: xu.xin@linux.dev
To: david@kernel.org
Cc: ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	akpm@linux-foundation.org,
	xu.xin@linux.dev,
	chengming.zhou@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mm/mm_slot: introduce mm_slot_next() helper
Date: Wed, 25 Nov 2026 16:42:05 +0800
Message-Id: <20261125084205.345860-1-xu.xin@linux.dev>
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

From: "Xu Xin (vivo)" <xu.xin@linux.dev>

Add a generic mm_slot_next() macro to simplify getting the next
mm_slot container entry from the list, and use it in khugepaged.c
and ksm.c, just for cleaning up.

No functional change intended.

Signed-off-by: Xu Xin (vivo) <xu.xin@linux.dev>
---
 mm/khugepaged.c |  5 ++---
 mm/ksm.c        | 18 ++++--------------
 mm/mm_slot.h    |  3 +++
 3 files changed, 9 insertions(+), 17 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 4ceb1b16c03c..0a5c78d01159 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -3074,9 +3074,8 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
 		 * mm_slot not pointing to the exiting mm.
 		 */
 		if (!list_is_last(&slot->mm_node, &khugepaged_scan.mm_head)) {
-			slot = list_next_entry(slot, mm_node);
-			khugepaged_scan.mm_slot =
-				mm_slot_entry(slot, struct khugepaged_mm_slot, slot);
+			khugepaged_scan.mm_slot = mm_slot_next(slot,
+						struct khugepaged_mm_slot, slot);
 		} else {
 			khugepaged_scan.mm_slot = NULL;
 			khugepaged_full_scans++;
diff --git a/mm/ksm.c b/mm/ksm.c
index fd2d212cae79..11914f649a73 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -1217,15 +1217,12 @@ static int remove_all_stable_nodes(void)
 static int unmerge_and_remove_all_rmap_items(void)
 {
 	struct ksm_mm_slot *mm_slot;
-	struct mm_slot *slot;
 	struct mm_struct *mm;
 	struct vm_area_struct *vma;
 	int err = 0;
 
 	spin_lock(&ksm_mmlist_lock);
-	slot = list_entry(ksm_mm_head.slot.mm_node.next,
-			  struct mm_slot, mm_node);
-	ksm_scan.mm_slot = mm_slot_entry(slot, struct ksm_mm_slot, slot);
+	ksm_scan.mm_slot = mm_slot_next(&ksm_mm_head.slot, struct ksm_mm_slot, slot);
 	spin_unlock(&ksm_mmlist_lock);
 
 	for (mm_slot = ksm_scan.mm_slot; mm_slot != &ksm_mm_head;
@@ -1256,9 +1253,7 @@ static int unmerge_and_remove_all_rmap_items(void)
 		mmap_read_unlock(mm);
 
 		spin_lock(&ksm_mmlist_lock);
-		slot = list_entry(mm_slot->slot.mm_node.next,
-				  struct mm_slot, mm_node);
-		ksm_scan.mm_slot = mm_slot_entry(slot, struct ksm_mm_slot, slot);
+		ksm_scan.mm_slot = mm_slot_next(&mm_slot->slot, struct ksm_mm_slot, slot);
 		if (ksm_test_exit(mm)) {
 			mm_slot_remove(&mm_slot->slot);
 			spin_unlock(&ksm_mmlist_lock);
@@ -2647,12 +2642,9 @@ static bool scan_should_start_new_cycle(void)
 static struct ksm_mm_slot *scan_get_first_mm(void)
 {
 	struct ksm_mm_slot *mm_slot = &ksm_mm_head;
-	struct mm_slot *slot;
 
 	scoped_guard(spinlock, &ksm_mmlist_lock) {
-		slot = list_entry(mm_slot->slot.mm_node.next,
-				  struct mm_slot, mm_node);
-		mm_slot = mm_slot_entry(slot, struct ksm_mm_slot, slot);
+		mm_slot = mm_slot_next(&mm_slot->slot, struct ksm_mm_slot, slot);
 		ksm_scan.mm_slot = mm_slot;
 	}
 
@@ -2789,9 +2781,7 @@ static struct ksm_rmap_item *scan_get_next_rmap_item(struct page **page)
 	remove_trailing_rmap_items(ksm_scan.rmap_list);
 
 	spin_lock(&ksm_mmlist_lock);
-	slot = list_entry(mm_slot->slot.mm_node.next,
-			  struct mm_slot, mm_node);
-	ksm_scan.mm_slot = mm_slot_entry(slot, struct ksm_mm_slot, slot);
+	ksm_scan.mm_slot = mm_slot_next(&mm_slot->slot, struct ksm_mm_slot, slot);
 	if (ksm_scan.address == 0) {
 		/*
 		 * We've completed a full scan of all vmas, holding mmap_lock
diff --git a/mm/mm_slot.h b/mm/mm_slot.h
index 9b09b68e5742..303da2cef759 100644
--- a/mm/mm_slot.h
+++ b/mm/mm_slot.h
@@ -33,6 +33,9 @@ static inline void mm_slot_free(struct kmem_cache *cache, void *objp)
 	kmem_cache_free(cache, objp);
 }
 
+#define mm_slot_next(ptr, type, member) \
+	mm_slot_entry(list_next_entry(ptr, mm_node), type, member)
+
 /*
  * Note: mm_slot_lookup and mm_slot_insert cannot be converted to static inline
  * functions because the hash helpers (hash_for_each_possible and hash_add) rely
-- 
2.34.1

