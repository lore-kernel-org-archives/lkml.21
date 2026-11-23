Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443441;
	b=AvHDB1UfWvTHz8uI12rYKUFNNGCAYnN/b75gmiujGepxjKGKw77mYrfcuEh3Kh3K3MnX
	 U9WVpMiejAapVXQ78ReUbgHyonVkkrdextedmwfyLtNf9uLXSj4gI4ujS+OQ/29PEl8LW
	 WDbOVaDTBdwP1N1Ar0mLAJfU0m4ySUzzn/QoqzWiRgcaubE7V1WYWktnns0GyGuLfZGbD
	 w3oE6re5vxhI6b3H4s227DRBeJQbC6RhuO7q/kwAvgbGrsoQOynQcKoQUoIRdO7hQ8XVj
	 Eyx/RMltxcT26PIV0sGdAvK6rHaZJqpjs8iaSY+JVCvV5sJ4N76e5xn+KkgfuDrN+rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=przsGoNeXdp32y5+6ZBoctPoG5cTnWhcKcU3VSR8K0w=;
	b=Mtw+/sI8T7kcB/Pk7pPQ08rhKYWpZzpcIva//n1oruRBI2Br/LLLedJo3FcO+UFF3WkK
	 dNnbybXZtSJeEocwl2NosuXLnOp3gVuvqUf40hTiwMJMiuodCTks8FpcoGMWqE42UxidC
	 iXhoojsku3kqedGEzxHDL3Ism34Q6U6sc90IrL/URcOPUnMhQi6Rn4aYEqA3ZrO3Gwg7V
	 zJkXXbPbdzYuz462+I60skdpni06qxmFS+N4yK5FWFs6ljdCXhuHuLtWxUG7ewipA6Rqp
	 KtUe8P67S0RtClBXA/zEGFshPzjd/lwL9+Kt+f46cJMDZ3gwVvXBLoDBTxMezB4XF9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i2AizJe5;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B81C606A338
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:17:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B81C606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i2AizJe5
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3869b68caecso4369041eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795443441; x=1796048241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=przsGoNeXdp32y5+6ZBoctPoG5cTnWhcKcU3VSR8K0w=;
        b=i2AizJe5pyGTtPA2EL9klU9iQ0Oc61UHeyuM0N6V+wuADh4zRX/S+rsMqpGNyx1NVf
         G7TJOuPp7eXNu2eFEFA0a/UCoOB7o5v6+90vwIha1dPuWhBJN21x7ts3gRFeqEtkEVMN
         R4zGtk8C3ltRcbzlKVmZ8zqBstWuYUCTM5oQJf5HSLKDfEHycGxox3aEyfkro8jqGb9v
         V4lsB1HO678gm9waHfqr6CE0XGZtymfOsYRaX3kCG+e5KKizHWviEqYxzVPCF2/B1q86
         mOmLRPq3VP9BrFqN3Pf6HqKDMaqRwV5PL5/jKeuhc/BugRC6H2a0RoShhpX7Sv0ZSTzB
         oAEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443441; x=1796048241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=przsGoNeXdp32y5+6ZBoctPoG5cTnWhcKcU3VSR8K0w=;
        b=K013IYb+QtWZSAR3UwF4n8YxK6KoVjmB5QMKWsjfO/9/AitpXW6hOxxaQV0eajU+c/
         b9MzyI0Ls32gT7lEaDrCDqUlEO3GRApv8CdgYeLwtizfxQalU9dvMPF7mgoB8blkY58+
         lon0UjhpNkDcvnxOVRvcpwE8Ba/hJrZONLV0uCC6idb0sZg1TnxQ+36a3P2CHbmOY9DN
         ilblmlWYhjk9oZHrEgb4Op4eJv6vPTcs/U0+XoReVPlDAcNh9MspwD30qOU0rkz2udfI
         F77hjt6Gi1agXHN2g5A1LPfYDETDyKJgvnN7T1C+ZntqMPpKGv1C5wY0i5/bEeBlF/e8
         Jafw==
X-Gm-Message-State: APuU4Z9Sh1xkXbT5KCVrR1aXihpiX6rs+0zZd9OGvnzmio+m+4yjx6vE
	9sLtURi6sZW1uIqqvxVGbxvuQFY1KHYiajQajNMY4gimKV5c91yF+zl8
X-Gm-Gg: AZFdTZdIS/P1sHgTapdsGu61etn97VXepuOaOeXM3yb8m8eTZcbwOo+6Q0sIAwfhUlk
	uYR778UvhW/j96LWhqRxotRUNc1z8y5NgZ7ivEkNwZWXq9j9NWyadwgYNoeL33SVNoBnV2afN8P
	zHJat164s7FtIv7WsbMQ+Y+HFYjA8ZFKxiBIXX9ADopFAhuQEIYHqne0WOXZdG/WWh4D3m+dhJ9
	I1snNXZENM54zRJhquRlahXXwAg4qMCWYfR/T2+163ufyRSLsa4HfZMR6CtKhiEL4OxY7WzRjYI
	9wMwt5rKyXwD9e6dB298mA1pMtHcdYMSkzG2/LKPQQzCqZ6X/rF8dd1ZkM7MScZrExouxcaopPn
	x5n2kwgnOB0QR8Qfqmfzg1+RecbeDbqiM7RZXfg6EwBFeaBzk3SfYGWLVU3FRC9pihUTTfV8BlF
	2cRfi6yY1OIx4wIsuLjued1mDmAE+yZJm8zk+EO/TKbAJkTuTBIz+XyIRrQE2YGOIHti3EI6P/w
	Riw2D/VXSpjmPmJllX/496XJ99QKAZy0HhluZ2yLQ0TtWNUlkm07gwLstuPpzgiWyhQP+qfScMG
	tptdJ360j9MVmKsSQyoXF36Z/F1S/LPqt8fCRsBhD51hisnShQmopv1D/GN9OrmOhUXz
X-Received: by 2002:a05:693c:880e:20b0:386:b54a:7f6e with SMTP id 5a478bee46e88-386b54a8032mr2033437eec.6.1795443440605;
        Mon, 23 Nov 2026 06:17:20 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm42979741eec.10.2026.11.23.06.17.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 06:17:20 -0800 (PST)
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
Subject: [PATCH v5 07/19] mm/swap: consolidate swap inuse accounting helpers
Date: Mon, 23 Nov 2026 22:17:06 +0800
Message-ID: <21e7cb1a16aed56568fa400f5385acd36513aa46.1795439990.git.lianux.mm@gmail.com>
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

Inline the swap_usage_add/sub helpers into their only callers and
rename the callers to better reflect what they actually do: track
per-device inuse page counts.

Keep the existing accounting and allocation policy. In the inlined
full-device path, reclaim work is scheduled before availability removal
rather than afterwards. Slot-free notifications and zswap invalidation
retain their existing order.

Signed-off-by: Kairui Song <kasong@tencent.com>
Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
Signed-off-by: Lian Wang <lianux.mm@gmail.com>
---
 mm/swapfile.c | 64 ++++++++++++++++++++++-----------------------------
 1 file changed, 27 insertions(+), 37 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 24f301ef4e3a..4fac894f8c2a 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -49,8 +49,8 @@
 #include "internal.h"
 #include "swap.h"
 
-static void swap_range_alloc(struct swap_info_struct *si,
-			     unsigned int nr_entries);
+static void swap_device_inuse_add(struct swap_info_struct *si,
+				  unsigned int nr_entries);
 static bool folio_swapcache_freeable(struct folio *folio);
 static void move_cluster(struct swap_info_struct *si,
 			 struct swap_cluster_info *ci, struct list_head *list,
@@ -1045,7 +1045,7 @@ static bool __swap_cluster_alloc_entries(struct swap_info_struct *si,
 	if (cluster_is_empty(ci))
 		ci->order = order;
 	ci->count += nr_pages;
-	swap_range_alloc(si, nr_pages);
+	swap_device_inuse_add(si, nr_pages);
 
 	return true;
 }
@@ -1363,53 +1363,36 @@ static void add_to_avail_list(struct swap_info_struct *si)
 }
 
 /*
- * swap_usage_add / swap_usage_sub of each slot are serialized by ci->lock
- * within each cluster, so the total contribution to the global counter should
- * always be positive and cannot exceed the total number of usable slots.
+ * swap_device_inuse_add / swap_device_inuse_sub are called within cluster
+ * update critical sections and serialized by ci->lock within each cluster,
+ * so the total contribution to the global counter should always be positive
+ * and cannot exceed the total number of usable slots.
  */
-static bool swap_usage_add(struct swap_info_struct *si, unsigned int nr_entries)
+static void swap_device_inuse_add(struct swap_info_struct *si,
+				  unsigned int nr_entries)
 {
-	long val = atomic_long_add_return_relaxed(nr_entries, &si->inuse_pages);
+	long inuse_pages;
 
 	/*
 	 * If device is full, and SWAP_USAGE_OFFLIST_BIT is not set,
 	 * remove it from the plist.
 	 */
-	if (unlikely(val == si->pages)) {
-		del_from_avail_list(si, false);
-		return true;
-	}
-
-	return false;
-}
-
-static void swap_usage_sub(struct swap_info_struct *si, unsigned int nr_entries)
-{
-	long val = atomic_long_sub_return_relaxed(nr_entries, &si->inuse_pages);
-
-	/*
-	 * If device is not full, and SWAP_USAGE_OFFLIST_BIT is set,
-	 * add it to the plist.
-	 */
-	if (unlikely(val & SWAP_USAGE_OFFLIST_BIT))
-		add_to_avail_list(si);
-}
-
-static void swap_range_alloc(struct swap_info_struct *si,
-			     unsigned int nr_entries)
-{
-	if (swap_usage_add(si, nr_entries)) {
+	inuse_pages = atomic_long_add_return_relaxed(nr_entries, &si->inuse_pages);
+	if (unlikely(inuse_pages == si->pages)) {
 		if (vm_swap_full())
 			schedule_work(&si->reclaim_work);
+		del_from_avail_list(si, false);
 	}
+
 	atomic_long_sub(nr_entries, &nr_swap_pages);
 }
 
-static void swap_range_free(struct swap_info_struct *si, unsigned long offset,
-			    unsigned int nr_entries)
+static void swap_device_inuse_sub(struct swap_info_struct *si, unsigned long offset,
+				  unsigned int nr_entries)
 {
 	unsigned long end = offset + nr_entries - 1;
 	void (*swap_slot_free_notify)(struct block_device *, unsigned long);
+	long inuse_pages;
 
 	zswap_invalidate(si->type, offset, nr_entries);
 
@@ -1431,7 +1414,14 @@ static void swap_range_free(struct swap_info_struct *si, unsigned long offset,
 	 */
 	smp_wmb();
 	atomic_long_add(nr_entries, &nr_swap_pages);
-	swap_usage_sub(si, nr_entries);
+
+	/*
+	 * If device is not full, and SWAP_USAGE_OFFLIST_BIT is set,
+	 * add it back to the plist.
+	 */
+	inuse_pages = atomic_long_sub_return_relaxed(nr_entries, &si->inuse_pages);
+	if (unlikely(inuse_pages & SWAP_USAGE_OFFLIST_BIT))
+		add_to_avail_list(si);
 }
 
 static bool get_swap_device_info(struct swap_info_struct *si)
@@ -2059,7 +2049,7 @@ void __swap_cluster_free_entries(struct swap_info_struct *si,
 	if (batch_id)
 		mem_cgroup_uncharge_swap(batch_id, ci_off - batch_off);
 
-	swap_range_free(si, ci_head + ci_start, nr_pages);
+	swap_device_inuse_sub(si, ci_head + ci_start, nr_pages);
 	swap_cluster_assert_empty(ci, ci_start, nr_pages, false);
 
 	if (!ci->count)
@@ -2999,7 +2989,7 @@ static int try_to_unuse(unsigned int type)
 success:
 	/*
 	 * Make sure that further cleanups after try_to_unuse() returns happen
-	 * after swap_range_free() reduces si->inuse_pages to 0.
+	 * after swap_device_inuse_sub() reduces si->inuse_pages to 0.
 	 */
 	smp_mb();
 	return 0;
