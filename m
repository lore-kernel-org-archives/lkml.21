Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795351724;
	b=QYkb5VUMfLkKOc37XYh6lRxedrmtPIAnZBSrP2oq3jJehtR3A9U5628XDNekHmXumvc2
	 VQghPAnqyZSa1Cq5QejZr0Yet9u3aabMviiNgjSu4gbKtq31oRn6iVKvZxwDaRNTInzY6
	 4aZrGwJfr/jCHvD03mxLFefV2wJdrmrK7MTxveepIFRHXH/jNHi4KopIgebr3EdE/bkEw
	 XkzaJ/IioY3NpAm/zguzP17/qiCkaT4RlbJt9X8psSmMfmVFgASVHFpsuBgTdhqeKTqo/
	 rXOPJJwHyNIXIQbdUWMpw2beUtw3iOJsD82w+pJiW+6OtewSXhSwFqw5lJaKVGs9yWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795351724;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-type:
	 Content-Transfer-Encoding;
	bh=mamQiHx1S+rM6/wse/M+cvChqIyNrpBo8EiBe0rO+vw=;
	b=hQ7UxfGo9uqfJOZm8OMiaPrI7pUaygxbRny2figj6CDs04xBxV7WP5c242+jIEfs44Ta
	 30sIQZFmZCn1FhFKxSuiuBgSugdVu4+vf7eEyA64etLuwOl3OU73cWjOjLM0jKnJVNAbm
	 qxFmUZaPnoQwYaaGNSkg+k9PtEdq1lpocuUU2OlWGq/Xnb0ILW/7z78OZ7ElEb8iiiA+d
	 imdL9WZVJLEwYpWbZ2mMQgU6BdwKEl9OVNxgUgbONg14/8YOsp0NJ70TzKYFYFu+JS1eg
	 rBXxhN0i2YyZcGbQ8TiuDlHQuLDlaCBTp/g94DZ0tmFwsBZyrQ7Ct8tOo5R5TcoxhEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tx98uMwC;
	arc=none smtp.remote-ip=91.218.175.112
Received: from mta0.migadu.com (out-112.mta0.migadu.com [91.218.175.112])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FBF606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:48:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8FBF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tx98uMwC
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nu0dicTLjst8u+/L1vGewxsOnB12Omss4t6mzzyIEZs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795351721; v=1; x=1795956521;
 b=tx98uMwCK/iKiMHHVWPj1CpcA6h90u8ztGoJR+blTsy5tQ5yVPBg6EfJKUhNCCRykXcXrJkM
 QkQW/4YX1VWpG6VvYLJs/KcEyl5BVqppjrQVmWBI+ttSkNaOyrv78yqOE5aIYxZaxV6qNAQmoo9
 fu//mM3KYOP9uY3uCkk5zQjA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 829fdfb4fa3c0e22;
	Sun, 22 Nov 2026 12:48:41 +0000
X-Mizu-Trace-ID: 829fdfb4fa3c0e22
X-Migadu-Flow: FLOW_OUT
From: Baoquan He <baoquan.he@linux.dev>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	urezki@gmail.com,
	chrisl@kernel.org,
	kasong@tencent.com,
	nphamcs@gmail.com,
	baohua@kernel.org,
	youngjun.park@lge.com,
	shikemeng@huaweicloud.com,
	hannes@cmpxchg.org,
	yosry@kernel.org,
	chengming.zhou@linux.dev,
	corbet@lwn.net,
	kunwu.chan@gmail.com,
	klarasmodin@gmail.com,
	linux-kernel@vger.kernel.org,
	baoquan.he@linux.dev,
	Baoquan He <hebaoquan@kylinos.cn>
Subject: [PATCH v6 13/14] mm, swap: do not give an xswap slot to a cgroup that cannot zswap
Date: Sun, 22 Nov 2026 20:48:13 +0800
Message-ID: <20261122124814.3489077-4-baoquan.he@linux.dev>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261122124814.3489077-1-baoquan.he@linux.dev>
References: <20261122123918.3486916-1-baoquan.he@linux.dev>
 <20261122124814.3489077-1-baoquan.he@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

From: Baoquan He <hebaoquan@kylinos.cn>

At this point, an xswap slot holds only a zswap-backed page. It has no
storage of its own. If the folio's cgroup cannot take another zswap
page, giving it an xswap slot is wasted: zswap refuses the page and the
slot cannot hold it.

Skip xswap devices when the cgroup cannot zswap, and try a physical swap
device instead.

The check is obj_cgroup_may_zswap(): zswap_store() uses the same check
but first tries to shrink the memcg, while the allocation-time check does
not, so it is stricter.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 mm/swapfile.c | 72 ++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 66 insertions(+), 6 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 462efeef887a..90f17edce1d0 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -226,6 +226,8 @@ static DEFINE_SPINLOCK(swap_lock);
 static unsigned int nr_swapfiles;
 atomic_long_t nr_swap_pages;
 atomic_t nr_real_swapfiles;
+/* Active xswap devices, as in nr_real_swapfiles. */
+static atomic_t nr_xswap_files;
 /*
  * Some modules use swappable objects and may try to swap them out under
  * memory pressure (via the shrinker). Before doing so, they may wish to
@@ -1452,7 +1454,9 @@ static void del_from_avail_list(struct swap_info_struct *si, bool swapoff)
 		lockdep_assert_held(&si->lock);
 		si->flags &= ~SWP_WRITEOK;
 		/* Count active devices, not merely those on the avail list. */
-		if (!(si->flags & SWP_XSWAP))
+		if (si->flags & SWP_XSWAP)
+			atomic_sub(1, &nr_xswap_files);
+		else
 			atomic_sub(1, &nr_real_swapfiles);
 		atomic_long_or(SWAP_USAGE_OFFLIST_BIT, &si->inuse_pages);
 	} else {
@@ -1488,7 +1492,9 @@ static void add_to_avail_list(struct swap_info_struct *si, bool swapon)
 		lockdep_assert_held(&si->lock);
 		si->flags |= SWP_WRITEOK;
 		/* A full device is still active and skips the add below. */
-		if (!(si->flags & SWP_XSWAP))
+		if (si->flags & SWP_XSWAP)
+			atomic_add(1, &nr_xswap_files);
+		else
 			atomic_add(1, &nr_real_swapfiles);
 	} else {
 		if (!(READ_ONCE(si->flags) & SWP_WRITEOK))
@@ -1612,7 +1618,7 @@ static bool get_swap_device_info(struct swap_info_struct *si)
  * Fast path try to get swap entries with specified order from current
  * CPU's swap entry pool (a cluster).
  */
-static bool swap_alloc_fast(struct folio *folio)
+static bool swap_alloc_fast(struct folio *folio, bool may_zswap)
 {
 	unsigned int order = folio_order(folio);
 	struct swap_cluster_info *ci;
@@ -1628,6 +1634,11 @@ static bool swap_alloc_fast(struct folio *folio)
 	if (!si || !offset || !get_swap_device_info(si))
 		return false;
 
+	if (!may_zswap && (si->flags & SWP_XSWAP)) {
+		put_swap_device(si);
+		return false;
+	}
+
 	ci = swap_cluster_lock(si, offset);
 	if (cluster_is_usable(ci, order)) {
 		if (cluster_is_empty(ci))
@@ -1642,13 +1653,19 @@ static bool swap_alloc_fast(struct folio *folio)
 }
 
 /* Rotate the device and switch to a new cluster */
-static void swap_alloc_slow(struct folio *folio)
+static void swap_alloc_slow(struct folio *folio, bool may_zswap)
 {
 	struct swap_info_struct *si, *next;
 
 	spin_lock(&swap_avail_lock);
 start_over:
 	plist_for_each_entry_safe(si, next, &swap_avail_head, avail_list) {
+		/*
+		 * Do not rotate a skipped device: the walk follows the
+		 * rotation and would spin forever.
+		 */
+		if (!may_zswap && (si->flags & SWP_XSWAP))
+			continue;
 		/* Rotate the device and switch to a new cluster */
 		plist_requeue(&si->avail_list, &swap_avail_head);
 		spin_unlock(&swap_avail_lock);
@@ -1971,6 +1988,17 @@ static int swap_dup_entries_cluster(struct swap_info_struct *si,
 	return err;
 }
 
+/* Can the folio's cgroup take another zswap page? */
+static bool folio_may_zswap(struct folio *folio)
+{
+	struct obj_cgroup *objcg = get_obj_cgroup_from_folio(folio);
+	bool may_zswap = !objcg || obj_cgroup_may_zswap(objcg);
+
+	if (objcg)
+		obj_cgroup_put(objcg);
+	return may_zswap;
+}
+
 /**
  * folio_alloc_swap - allocate swap space for a folio
  * @folio: folio we want to move to swap
@@ -1987,10 +2015,21 @@ int folio_alloc_swap(struct folio *folio)
 {
 	unsigned int order = folio_order(folio);
 	unsigned int size = 1 << order;
+	bool may_zswap = true;
+	bool zswap_checked = false;
 
 	VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
 	VM_BUG_ON_FOLIO(!folio_test_uptodate(folio), folio);
 
+	/*
+	 * A folio zswap will not take must not get an xswap slot; without
+	 * a device to route away from, skip the lookup.
+	 */
+	if (atomic_read(&nr_xswap_files)) {
+		may_zswap = folio_may_zswap(folio);
+		zswap_checked = true;
+	}
+
 	if (order) {
 		/*
 		 * Reject large allocation when THP_SWAP is disabled. Check below
@@ -2011,8 +2050,8 @@ int folio_alloc_swap(struct folio *folio)
 
 again:
 	local_lock(&percpu_swap_cluster.lock);
-	if (!swap_alloc_fast(folio))
-		swap_alloc_slow(folio);
+	if (!swap_alloc_fast(folio, may_zswap))
+		swap_alloc_slow(folio, may_zswap);
 	local_unlock(&percpu_swap_cluster.lock);
 
 	if (!order && unlikely(!folio_test_swapcache(folio))) {
@@ -2020,6 +2059,20 @@ int folio_alloc_swap(struct folio *folio)
 			goto again;
 	}
 
+	/*
+	 * The gate was skipped when there was no device; one may have
+	 * appeared since, so ask the slot itself.
+	 */
+	if (unlikely(!zswap_checked && folio_test_swapcache(folio) &&
+		     (__swap_entry_to_info(folio->swap)->flags & SWP_XSWAP))) {
+		zswap_checked = true;
+		may_zswap = folio_may_zswap(folio);
+		if (!may_zswap) {
+			swap_cache_del_folio(folio);
+			goto again;
+		}
+	}
+
 	/* Need to call this even if allocation failed, for MEMCG_SWAP_FAIL. */
 	if (unlikely(mem_cgroup_try_charge_swap(folio))) {
 		swap_cache_del_folio(folio);
@@ -2037,6 +2090,13 @@ int folio_alloc_swap(struct folio *folio)
 	if (mem_cgroup_get_folio_swap_margin(folio) <= 0)
 		return -ENOMEM;
 
+	/*
+	 * Only xswap devices exist and the folio cannot use them; splitting
+	 * cannot help.
+	 */
+	if (!may_zswap && !atomic_read(&nr_real_swapfiles))
+		return -ENOMEM;
+
 	return order ? -E2BIG : -ENOMEM;
 }
 
-- 
2.54.0

