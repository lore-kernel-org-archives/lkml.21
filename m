Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443564;
	b=YnQ1nRsSC9k2hIb6hwM7q1K993Z/7WxGFgXQn7I1h24t/w8zbLH86MVwnp8IhzTDwt9E
	 cKHbE9zBnpff83HSIsSdjoYvy3WAyv7Auft52pYAZVJ7pCgNO9r9Ae5GL7JZXZ8Dc6NpF
	 g09f5OeHi/g0Hl5tEXcHe18cTSa9MvDRM+WQqIPL6yMavowut9CYziNQC17B70HdARZZ+
	 jnXNJX7Laesqv19QIHcBrDeZgpCb0uYRUPSxhgOgKtvqI0zzIh8mUEOONex3sZeS59STf
	 uS1SYh7/+Vd1EI7KBWBHbJi936Ej0pZxI6Yco72ae+31vtZqA1Ec7w00tAEkr7Lsbqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443564;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AWoQ0K2b19xOIDahw7K8oHg1peK86ncFA9KLsX9V9fY=;
	b=KIjPFN3YXpr8arf9hLXwyCxKreTYgm5ua52FP0QpDKXUp/2LWCOLpPKEthgHYgKJ4u8L
	 mKIvqdaTSvXCyRtxuhCI6cgon3oydQHAl1pXj6KlQPsvF4y090QSTSyR041QLBUkJfVFQ
	 GRc1gvU19hFCTobbVFQ5k3mz82z+Mm5PWfskVNo1p5AUXpyg2AyUI6UxS3JChaGco6ab2
	 Je8be9Ko12kfKH/5hQ+lLwK7Oy0d8r/dOSekBTlDEgnXxy4GOOem/lf0OJEloLgpTxWZ6
	 Z7MHvMMlizErLzvz2qPzyPxbyjZa4xGzto9GDR8XmCz6R0d7Yp/mBQPuU3WFYe4q5mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dAlwWOW4;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13A4606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:19:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E13A4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dAlwWOW4
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b3acec6677so4682540c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795443563; x=1796048363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AWoQ0K2b19xOIDahw7K8oHg1peK86ncFA9KLsX9V9fY=;
        b=dAlwWOW4FZ9n7GhJSBSNH14ZMHykMNOgJZJPH5tZ4jM7PWJpaDKTb3mfDDPPcLaidq
         8Mx0MkahQy6wP+C+GksuuTVwGclhGd6w0G5cDRENmg8a8OglqSuoYLKubUXMIXrO4Tdh
         L3q5CixdD+WKPnY6XdtXt3a7A4CNtumD1hkcZDYRo3IKBTZJ+0tp89VQEA3jg91jVw9D
         IxUGaT2tpnydoEJPSqAGLhslfgKe3heSPoisHRQPMUIdI0GKVgKQ+acBcd/JAPb76bTm
         gkSTz2IXT5mGPq9strn64DLEMNY9eCp0MKbsydOD90KrTTbdAfTGPX1LY0gD26Uox9YP
         pPjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443563; x=1796048363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AWoQ0K2b19xOIDahw7K8oHg1peK86ncFA9KLsX9V9fY=;
        b=IdnhaMWaVYz/EbejhzpPcUmrIlJoHNVEC6gduOUN6w0z0RtqQ41UAcFM/pvOvThT35
         fANDpsJIgyVUPSRZ6hm5HXvxBet9MTFHOpuOI6lRvwlk6p7s//x9X7sWA7Rv+GGK6lBM
         t0Sxlq1lbCqLe6ufwaY8qY38OnsACfjuSbNlCETMKn/LeqB4SfD5vrmWFEHXDcLLRB5U
         M3PXeBLmRqVRyJWjBWwgSBaVrytuj/zzLhleISquxB+9i22O3wbpQ3hh+u9Z9DxPVDiz
         Gf0mDLLLh9G4U6yMlXDeD+3+LNvR6Olao9OHIF1qyo1abzXQabrTrSGo0hThKBAN792U
         DAhA==
X-Gm-Message-State: APuU4Z+09FCgFye/ezd6w7xsseceLa+JebftA78cEdXtr4GeZlnhCBbH
	o8s1URm6ClxBqivv04Jtbm5uiEopox7uXJ4MZz4nXRTzD88jiZrHQodp
X-Gm-Gg: AZFdTZfmuWgtM2B5VJ5fKoGrW0E8uKNs0cYa3xVRmi3gCk0ZcNOdkj2Z7ZgAHX52S0n
	/m4Z13vwus/NcH3BFysi8ASXwvohxQcWlZLU7jcZJy/HkiA0HSnE4w74Nb1A6jsSZr+f/NL14iU
	KZ19pXaGquRkmtgVnG1Cr15NZLl72zKwtBlJ272SjueNwVK1f6ZJmamW5Cs3fSnlSk5IGnISX0U
	ne4aMJ+MaK8pZs52HaXXN1+UitHjxeXnweeEg9uDgTLJKvKCDlfo4VZuPOOYie8GC0/+wth7EY7
	AfgyXlF+k5jbdAIZYF8tJDNeLt4Ja6B0il0X86wfHvuMJTYnqv5OM1Eumai+tVM2AgDEnPMmVTf
	SReQveT4jrtdWzvc8IU8wO6vihY1rkSw68gRUcIbYrHNJozFtnj5oZmQPX+ODn3mcVS8FSKFsa2
	9u+hiUI+9WKGllOKvbKVmWcCxSZXAFUSGkqIzG2l9aclKgjZKN56ABw1OFCl9bt+77kr7rERgrB
	2O67zcxA+CS23GIuw/7dgzR51CRHxy9lsc94RDsMUpfGNZue+03SYo03cdXvD50DPkPg8sVp1tk
	mSumfTS+GlhfUxw67dvY7gu2G00tAUCovK+D/6qDN6+6b5zIHsc5FV9t2ibCRDb9egzr
X-Received: by 2002:a05:7022:299:20b0:1b5:7c7b:c1f3 with SMTP id a92af1059eb24-1b57c7bc2a9mr256829c88.15.1795443562761;
        Mon, 23 Nov 2026 06:19:22 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm32516063c88.13.2026.11.23.06.19.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 06:19:22 -0800 (PST)
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
Subject: [PATCH v5 14/19] mm/swap: drop swap active plist
Date: Mon, 23 Nov 2026 22:19:11 +0800
Message-ID: <31eee155bb6d4100e78a071cc101b6afd48feb17.1795439990.git.lianux.mm@gmail.com>
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

Remove swap_active_head and the associated plist_node. Device identity
lookups can use the writable swap_info iterator without ordering.

Keep priority ordering for the block-cgroup swap throttle target by
walking the priority queue under the topology reader. Choose the first
unmasked, writable, non-offlist device with a backing block device.
Check OFFLIST as well as the pointer tag because full transitions can
temporarily leave an unmasked entry, and keep the explicit WRITEOK
check. The disable transition already publishes its mask before
releasing the topology writer.

This read-only lookup does not consume per-CPU allocation quotas or
change retry cursors. It avoids making the throttle disk depend on
swapon's swap-type assignment order when devices have different
priorities.

Signed-off-by: Kairui Song <kasong@tencent.com>
Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
Signed-off-by: Lian Wang <lianux.mm@gmail.com>
---
 include/linux/swap.h |  1 -
 mm/swapfile.c        | 60 +++++++++++++++++++++++---------------------
 2 files changed, 32 insertions(+), 29 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index d31f3f023d36..ce8a800751ca 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -263,7 +263,6 @@ struct swap_info_struct {
 	struct percpu_ref users;	/* indicate and keep swap device valid. */
 	unsigned long	flags;		/* SWP_USED etc: see above */
 	signed short	prio;		/* swap priority of this type */
-	struct plist_node list;		/* entry in swap_active_head */
 	signed char	type;		/* strange name for an index */
 	unsigned int	max;		/* size of this swap device */
 	struct swap_cluster_info *cluster_info; /* array, one entry per cluster */
diff --git a/mm/swapfile.c b/mm/swapfile.c
index d28dd10c92cc..7d932035c961 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -42,7 +42,6 @@
 #include <linux/completion.h>
 #include <linux/suspend.h>
 #include <linux/zswap.h>
-#include <linux/plist.h>
 
 #include <asm/tlbflush.h>
 #include <linux/leafops.h>
@@ -91,12 +90,6 @@ bool swap_migration_ad_supported;
 static const char Bad_file[] = "Bad swap file entry ";
 static const char Bad_offset[] = "Bad swap offset entry ";
 
-/*
- * all active swap_info_structs
- * protected with swapon_rwsem, and ordered by priority.
- */
-static PLIST_HEAD(swap_active_head);
-
 static inline struct swap_info_struct *__swap_iter(int *i, unsigned long flag)
 {
 	lockdep_assert_held(&swapon_rwsem);
@@ -3533,7 +3526,6 @@ static void __swap_device_enable(struct swap_info_struct *si)
 	spin_unlock(&si->lock);
 	atomic_long_add(si->pages, &nr_swap_pages);
 	total_swap_pages += si->pages;
-	plist_add(&si->list, &swap_active_head);
 	add_to_avail_list(si);
 }
 
@@ -3553,9 +3545,8 @@ static int swap_device_disable(struct address_space *mapping,
 	int err = -EINVAL;
 
 	percpu_down_write(&swapon_rwsem);
-	plist_for_each_entry(si, &swap_active_head, list) {
-		if ((si->flags & SWP_WRITEOK) &&
-		    si->swap_file->f_mapping == mapping) {
+	for_each_avail_swap(si) {
+		if (si->swap_file->f_mapping == mapping) {
 			err = 0;
 			break;
 		}
@@ -3581,8 +3572,6 @@ static int swap_device_disable(struct address_space *mapping,
 	spin_lock(&si->lock);
 	del_from_avail_list(si, true);
 	spin_unlock(&si->lock);
-
-	plist_del(&si->list, &swap_active_head);
 	total_swap_pages -= si->pages;
 	atomic_long_sub(si->pages, &nr_swap_pages);
 
@@ -3907,7 +3896,6 @@ static struct swap_info_struct *alloc_swap_info(void)
 		 */
 	}
 	p->swap_extent_root = RB_ROOT;
-	plist_node_init(&p->list, 0);
 	p->flags = SWP_USED;
 	percpu_up_write(&swapon_rwsem);
 	if (defer) {
@@ -4317,12 +4305,7 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 	if (swap_flags & SWAP_FLAG_PREFER)
 		prio = swap_flags & SWAP_FLAG_PRIO_MASK;
 
-	/*
-	 * The plist prio is negated because plist ordering is
-	 * low-to-high, while swap ordering is high-to-low
-	 */
 	si->prio = prio;
-	si->list.prio = -si->prio;
 
 	/*
 	 * Publish swap_file before making the percpu ref live, then add the device
@@ -4450,7 +4433,33 @@ int swap_dup_entry_direct(swp_entry_t entry)
 #if defined(CONFIG_MEMCG) && defined(CONFIG_BLK_CGROUP)
 static bool __has_usable_swap(void)
 {
-	return !plist_head_empty(&swap_active_head);
+	return READ_ONCE(total_swap_pages) > 0;
+}
+
+static struct swap_info_struct *swap_queue_first_usable_bdev(void)
+{
+	struct swap_prio_ring *ring;
+	struct swap_info_struct *si;
+	unsigned int ring_idx, dev_idx;
+
+	lockdep_assert_held(&swapon_rwsem);
+	for (ring_idx = 0; ring_idx < swap_queue_len; ring_idx++) {
+		ring = swap_queue[ring_idx];
+		for (dev_idx = 0; dev_idx < ring->size; dev_idx++) {
+			si = READ_ONCE(ring->dev[dev_idx]);
+			if (swap_device_masked(si))
+				continue;
+			si = swap_device_unmask_ptr(si);
+			if (!(READ_ONCE(si->flags) & SWP_WRITEOK))
+				continue;
+			if (atomic_long_read(&si->inuse_pages) &
+			    SWAP_USAGE_OFFLIST_BIT)
+				continue;
+			if (si->bdev)
+				return si;
+		}
+	}
+	return NULL;
 }
 
 void __folio_throttle_swaprate(struct folio *folio, gfp_t gfp)
@@ -4474,14 +4483,9 @@ void __folio_throttle_swaprate(struct folio *folio, gfp_t gfp)
 		return;
 
 	percpu_down_read(&swapon_rwsem);
-	plist_for_each_entry(si, &swap_active_head, list) {
-		if ((si->flags & SWP_WRITEOK) &&
-		    !(atomic_long_read(&si->inuse_pages) &
-		      SWAP_USAGE_OFFLIST_BIT) && si->bdev) {
-			blkcg_schedule_throttle(si->bdev->bd_disk, true);
-			break;
-		}
-	}
+	si = swap_queue_first_usable_bdev();
+	if (si)
+		blkcg_schedule_throttle(si->bdev->bd_disk, true);
 	percpu_up_read(&swapon_rwsem);
 }
 #endif
