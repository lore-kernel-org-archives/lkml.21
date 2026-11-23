Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443539;
	b=EOW2WMcR3y4TO4yj0U/y439VMOUelBN1IxwunJts3jz1WNemXqeuhPHvACGv6Kdwp4wo
	 HHuC4mfDPhb776XAvpE56EYTMFivTd0EdBE/lFEdwD52rbOzgy2nQ7JTGFhH4UgJ8Tre7
	 zdYyqyPdhiM+AZeZAkBUD+vTWb57ArOc7Vsu+p2x9a2NqHIzALJbdgFXDkvA8mSzcv8K9
	 r425gSEDm5Ba3T6AegtQXMBba97s3grxs3Htklhxtbrf7YMIBK8gc7By4/anlMVA+o/7i
	 FHHM5jrsTg4ctLOZrr9N1h3KCwRCloN1+DIq94aJCQfca+XLSAxBcSqPzKHEmkFfvgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hO5PksLazy10kxPAE/Z7AHdutWvEqaEjYn4t7ERodC8=;
	b=qZBAnNI2mWCIcEsbUin7Txf2xQLhWf/rze3Agi7X5SDRuyDjzXMNgVW8NtDHndfKs4YQ
	 VxRaNZZmvftv30tvABwKMobytielskIa/SNzWSgJG/2S8e7gwUvrfZC+G5wOFKH60Y0MD
	 YuttK+9suOFv/Gvk8WFZ8K//IkVVBqQgI+nKVkOH8CnPO6Q+spU3i6GR1AemHNZvfg016
	 mI4neFse4iHx/LZtkqZlEOiaGtmXfpgLtA24OyrowNtXEh/TDUo6I8HXvwCiWvwfTsT7g
	 drjFhD95au0pOfjEBtxdio7iLMQVQ2jODsThgHKnDPz5EafP5u//R8nM/uVpQnPN/Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aM+2ckh3;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBD1606A33E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBBD1606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aM+2ckh3
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-15ea896ddc8so5599037c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795443538; x=1796048338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hO5PksLazy10kxPAE/Z7AHdutWvEqaEjYn4t7ERodC8=;
        b=aM+2ckh3y273IQ7ayVdIQTkyjnZUXwEx2E/JKiKHcVEGgS3mJXmhZBFdHco/w7DAf6
         k2/iXs9iZb09RPwK4NXBc1XBjaNp2Dv49hIMBr6fKbVs0NMUP+gFKB/6aAwtSUlOVNS7
         IMl81yfWH+Hiv5R5bWpD5WIsHWMiT2FzdHh5Gp7WO+07ZYXH1IjK5dp7fqXcPMt3OqZn
         g+jZ6loLdx4fJG1joZ1qkgyBeqLC9IghWdqA3NOZO81N3XlMhgjkqSYasCdWZvsUZhlo
         j18wxnCcUYUIu+TtSejgmOkpyQYOf/f6lnDT5QkE6bTDqUvuNNeZLxZRtJRYu7INlT4G
         23ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443538; x=1796048338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hO5PksLazy10kxPAE/Z7AHdutWvEqaEjYn4t7ERodC8=;
        b=ll8v5ZLQgA12AAk1x+DIznWuiXW5Z7UPNeE2WZAuQr5t7QxPsEn3CylnQgo4u/LHRP
         U3jg2SxS5DmEWHUHKluUmMURwPPZGWnbDCrYwI2vWf3ketwg32rugzLNIDYDX2vrPImQ
         3qyosTylMXd3km9YTHd15ptFynADNiNW67oTCs9VYAwVjrA8t4m/bAZlf8gE/C0CmoNC
         petssmoU7d5by0oDFQ8h7Cqz4mfQ9/i1q/MJhMSgersaJJYFRcs35lJ44OtkEnEwTGc8
         mXP18ueXcQYkLDU0kZpCsv1SUM2u7plGVgxaMaq+wY4niaF99PZqaf8NbzkICyGTQI0i
         pqvQ==
X-Gm-Message-State: APuU4Z8WbAgDPOP1IC0h1dZwOYzgn9OudV9wcfpgPiV39T0gxrXy8c/i
	Gt6DCaCZE8onBsxhvi6eruTV58g71wis8hEi0SouhpSGhYi4lKx66W3T
X-Gm-Gg: AZFdTZdh68P3igllcztIbCUovXsvMFGyMdWfMDmgmoudNj8v698569hQHjrM+rfxbBF
	7ZSWeh0WHRPLSdsESx3Ao5Vvoe+oUInTalFXHi3mPSq8bfgKDYRWm1gOlwhXfBgoJHEC2rgCdmG
	yZeUvYzKQRDcMcf+k9Ml7Txal9v4BG4pE3T5AnxBpXW7ZF///xEljjI4UclCLVmQRZhzZ9KbLj2
	QtknfIb+1olZ9zC1lvGMCBexDHGEHIW6TZ4LTudBqEzaD646BA6mKhmF1vfUvBjjVgHRK06u1/f
	qRM2tASHU/K7MEZq/FxR0hkxQSu2OG2N92Md/QZtn5qYwUZQfqV2g1VH2gKHip/OUFrhVUP3CN8
	WZYQStv82nvkpgZ6jP7IiOm8hbElelDHY+I/O4EZahfJoSnIrmLE1TiwC6a4jdoeEo9rCYsS2pM
	NmK9FhzOp2Hkx6jMC2nAyPJ5RCcEQEpYcZvs3duefH+9FkwAoupfwj6/4UVUyjPIo4hjXqOchb3
	NTkqHDiQ4P7j+Fo9wE/k9vzp4o/MksfpcG+aMfeqB2K+wAlnKQrqAJCup8rdoHzhfXPbY/HvNzf
	hy2owtz/zFmQXAXcD4dshRF/TwOCUtNN24etOvE6uyR36TzPKzCehoCQKjoZRJJDR7LOew==
X-Received: by 2002:a05:7022:290:b0:1b5:dc3:209b with SMTP id a92af1059eb24-1b5568ac6b0mr11174075c88.22.1795443537970;
        Mon, 23 Nov 2026 06:18:57 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm15243105c88.4.2026.11.23.06.18.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 06:18:57 -0800 (PST)
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
Subject: [PATCH v5 12/19] mm/swap: remove available list
Date: Mon, 23 Nov 2026 22:18:44 +0800
Message-ID: <7a2be9c40cc82bf1bc1036ae7879ddfa9ac9a015.1795439990.git.lianux.mm@gmail.com>
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

The allocator now selects devices from the priority queue. Move the
remaining block-cgroup throttle traversal from swap_avail_head to
swap_active_head under swapon_rwsem. Check SWP_WRITEOK, the off-list
state and the backing block device to retain priority-ordered target
selection.

Remove swap_avail_head, swap_avail_lock, the per-device avail_list field
and their maintenance now that no consumer needs the available plist.
Queue masking and the embedded availability state remain serialized by
swap_queue_update_lock.

Signed-off-by: Kairui Song <kasong@tencent.com>
Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
Signed-off-by: Lian Wang <lianux.mm@gmail.com>
---
 include/linux/swap.h |  1 -
 mm/swapfile.c        | 33 ++++++---------------------------
 2 files changed, 6 insertions(+), 28 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 6f32de173fb9..d31f3f023d36 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -289,7 +289,6 @@ struct swap_info_struct {
 	struct work_struct discard_work; /* discard worker */
 	struct work_struct reclaim_work; /* reclaim worker */
 	struct list_head discard_clusters; /* discard clusters list */
-	struct plist_node avail_list;   /* entry in swap_avail_head */
 	const struct swap_ops *ops;
 };
 
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 1e5f88f516c1..1f31a3ae75d6 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -96,21 +96,6 @@ static const char Bad_offset[] = "Bad swap offset entry ";
  */
 static PLIST_HEAD(swap_active_head);
 
-/*
- * all available (active, not full) swap_info_structs
- * protected with swap_avail_lock, ordered by priority.
- * This is used by folio_alloc_swap() instead of swap_active_head
- * because swap_active_head includes all swap_info_structs,
- * but folio_alloc_swap() doesn't need to look at full ones.
- * This uses its own lock instead of swapon_rwsem because when a
- * swap_info_struct changes between not-full/full, it needs to
- * add/remove itself to/from this list, but the swap_info_struct->lock
- * is held and the locking order requires swapon_rwsem to be taken
- * before any swap_info_struct->lock.
- */
-static PLIST_HEAD(swap_avail_head);
-static DEFINE_SPINLOCK(swap_avail_lock);
-
 static inline struct swap_info_struct *__swap_iter(int *i, unsigned long flag)
 {
 	lockdep_assert_held(&swapon_rwsem);
@@ -1711,7 +1696,6 @@ static void del_from_avail_list(struct swap_info_struct *si, bool swapoff)
 {
 	unsigned long pages;
 
-	spin_lock(&swap_avail_lock);
 	spin_lock(&swap_queue_update_lock);
 
 	/*
@@ -1734,10 +1718,8 @@ static void del_from_avail_list(struct swap_info_struct *si, bool swapoff)
 	}
 
 	swap_queue_mask(si);
-	plist_del(&si->avail_list, &swap_avail_head);
 skip:
 	spin_unlock(&swap_queue_update_lock);
-	spin_unlock(&swap_avail_lock);
 }
 
 /* SWAP_USAGE_OFFLIST_BIT can only be cleared by this helper. */
@@ -1746,7 +1728,6 @@ static void add_to_avail_list(struct swap_info_struct *si)
 	long val;
 	unsigned long pages;
 
-	spin_lock(&swap_avail_lock);
 	spin_lock(&swap_queue_update_lock);
 
 	/*
@@ -1777,10 +1758,8 @@ static void add_to_avail_list(struct swap_info_struct *si)
 	}
 
 	swap_queue_unmask(si);
-	plist_add(&si->avail_list, &swap_avail_head);
 skip:
 	spin_unlock(&swap_queue_update_lock);
-	spin_unlock(&swap_avail_lock);
 }
 
 /*
@@ -3904,7 +3883,6 @@ static struct swap_info_struct *alloc_swap_info(void)
 	}
 	p->swap_extent_root = RB_ROOT;
 	plist_node_init(&p->list, 0);
-	plist_node_init(&p->avail_list, 0);
 	p->flags = SWP_USED;
 	percpu_up_write(&swapon_rwsem);
 	if (defer) {
@@ -4320,7 +4298,6 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 	 */
 	si->prio = prio;
 	si->list.prio = -si->prio;
-	si->avail_list.prio = -si->prio;
 
 	/*
 	 * Publish swap_file before making the percpu ref live, then add the device
@@ -4471,14 +4448,16 @@ void __folio_throttle_swaprate(struct folio *folio, gfp_t gfp)
 	if (current->throttle_disk)
 		return;
 
-	spin_lock(&swap_avail_lock);
-	plist_for_each_entry(si, &swap_avail_head, avail_list) {
-		if (si->bdev) {
+	percpu_down_read(&swapon_rwsem);
+	plist_for_each_entry(si, &swap_active_head, list) {
+		if ((si->flags & SWP_WRITEOK) &&
+		    !(atomic_long_read(&si->inuse_pages) &
+		      SWAP_USAGE_OFFLIST_BIT) && si->bdev) {
 			blkcg_schedule_throttle(si->bdev->bd_disk, true);
 			break;
 		}
 	}
-	spin_unlock(&swap_avail_lock);
+	percpu_up_read(&swapon_rwsem);
 }
 #endif
 
