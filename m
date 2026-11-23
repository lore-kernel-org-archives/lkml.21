Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443498;
	b=w6wCG7frsLRaFMXscbVOc2zMcamtMX1SsmYi1SxAHQX+rhoOqTWyUf/M45KzDhzZh9iy
	 7ibiFZ1CIP3/3/zK66XLM+3EdxfNmCGjLAsHV43DN/iJTtKEH/cnZ7EAQabdvelxux5YQ
	 /Y4Xlmm0ECXgcKRLgWEAu9YlVuXTDq+B+A1Q4oob/lV8c/MoSWkxzUFUlZyCxQG/ZzIbm
	 JtUxPL0dXvj5aOD7L45tl/vDA2hcNYl1s7R6Q9dlARXQAL/kSrkckCTV3K4lDxHXdgvxL
	 uQYvKbNAroaRYa6TG5bgB05gZ6lJiNQ3aNEeSI7+nQzhGVtLyd1aa1acnr6Qoq7bbhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443498;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wZPzpBpjg0sp41buwUabT4ELftt8au76u2ycWcMBhOA=;
	b=jkwTkEAq7R1jG7sGRGGAyBryXtm47nDdKLW8rhHZDI574dqgWC0IDAdoIt8opqKfpkqH
	 aUKagpwfV+/kNAI5xUJgLVTthsKeQcSbN0sPvOJVMYPjXgS4yGStJ641sdjME4U17B08u
	 X+6oI/W9bjWowT4WzQLTaOsHojF8Lg4h62i9mOoAAgGTzzGO1tdlCBkmAmaV7NBba94rs
	 qeykWuqMF+a/348r00bGUEbV8/Tmb5KkGgpLdzLVTrK4WmMS05fuhkUnTUJpUpnG4DSzY
	 yfE153KqgpO9ft9CxvEh78MOyyQRsolmLPPy8qYocejeK8g1//fpiVf+HziOP2Q6x+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pCxEOsGV;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6403E606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:18:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6403E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pCxEOsGV
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b3acec6677so4680169c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795443498; x=1796048298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wZPzpBpjg0sp41buwUabT4ELftt8au76u2ycWcMBhOA=;
        b=pCxEOsGVr5XuHbF/iMvo7/FyLjc1HsZAjtWgt+vlMft2dGdqOlEg4X4JSkVlLYN63V
         KAtxC8VeeDMnAwbeCrYcDcGxDIhrmBNniVeYg8iTEusEdWl24YmWLBzXg60v5N24OZzk
         5VzVEvE+Dyywb554MqHqPpcp+nTbM1pffOeowDfCwl15tpgOi8csgaseiGLNEGkQWfG4
         SRojr2LXCfCy6lik/n6A0eYDKAg27mLoRSp903jA4SY52mXKpffvC7aUw1Bs6pYktk5+
         1f22R6sgwFfrxkJTfZJib8emWnFAL9I//uqRDWgPix7teN/BH74b6IAph2I9mkVqNUh/
         GPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443498; x=1796048298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wZPzpBpjg0sp41buwUabT4ELftt8au76u2ycWcMBhOA=;
        b=p8ZXkuB4okTrxvQYLYzKyvV0AlaQdBF0js5gUn+ueBtFbyqZ9ayHHawvgzukRkpYR6
         omOe6B/FjjcNNlyIWRUNRAGUxCIIjAxgshG2T8mEzVwOX4ezdyqnbVj6PtYsPDq8dEkU
         sE9CW3c1SKtamGuOdbiiC74dFMH4LUsf5k3XwYAfEKobxyHPwTBlXOlnD5NCNOQNhman
         2SScJTbacz36EAqT+Aohw/vY+VBKSzBGnKQYYAaozmY3WmPCIEsmw9Jd6O/UZRE93nFs
         qN1KzsjziCKR1kMKjgeR4xbEih1fhsBQYMOXVV09EwdnpSyb9QE0aRT6exv9H8Rk6+3p
         NOFA==
X-Gm-Message-State: APuU4Z8znTt/UDqvKobf3Nrea8V1S93QX3YJwwUycL5waWi1WiCOGNSm
	6k9sHsBuK6MOv6GMTTSIQcB4QJ/C2202lo3nrbayznlztjAx1PKqWkaPpY2XIvIB
X-Gm-Gg: AZFdTZfF9Z+SWTcaW7Vxeruk0we4//eF6DoDng7tICabM9kGyh+ciigWpUAwLZWShbW
	AA/x++uen98KNezzj95h9tnMFePZLnsLa3EAZDaEZ1WDjoxYP6kijGR11th76MhvEsuusGmA1a2
	VScwXAXqP07FoPxYLKfx/z21L0EMLPDFHitwTw16jfBYiuinQbsi7pnHPXb2nnEq5YiACIxOyYC
	NjiY2fA6Bc8MTy3TyDhWA5GQL43zgV+MAkM6CDan0wcf5U1bE2XVr3dejo+jxUZKMeMh91o7rIB
	2FPSUJK4fek40Nc0cdK4zCt29C9uxLu9o5L227Lx1J8n0DKAlfaZLuw3jO2DsNizTc0p7KVPZ54
	fBBoeO4WDpYM8zN9cbovVQaQZ+eKpTv7zC14W1ckugKruP0+HIC8zx5urLhWYfTgXoPwf4vrMT4
	VIDmMaK0W/J8ZwVIf0h7lTxW5yvlw9iKmWGofq3OwfuLytCAhbmWHHWMAnJO4DuUyfQXDXP7581
	nEvwsWEcKkqf7mioPvpB9hOqCIgFeFjnOV7dYQRqnJgzPj860heUPRl1fhKAZGzD8FP6r27vEeK
	92emNRKy/Xr/SXrQfGG1MlhjKGzedHn6VNSKNYRFQgS2n5WCDHde5EzvfsGf9etouo2wA2HW3Tq
	Ijzg6BcaPSBTYHzo=
X-Received: by 2002:a05:7022:f509:b0:1b2:41af:c21c with SMTP id a92af1059eb24-1b55694689amr10214838c88.39.1795443496157;
        Mon, 23 Nov 2026 06:18:16 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5569bffd2sm26797807c88.0.2026.11.23.06.18.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 06:18:15 -0800 (PST)
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
Subject: [PATCH v5 09/19] mm/swap: avoid direct reclaim when populating swap cluster metadata
Date: Mon, 23 Nov 2026 22:18:03 +0800
Message-ID: <e920cffdb3a65905dbcf51fa3520785a8c49fcb4.1795439990.git.lianux.mm@gmail.com>
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

Swap cluster population is entered from swap allocation and may itself
need memory for slot metadata. Its fallback drops the device and cluster
locks before allocating with GFP_KERNEL, which can reenter swap
allocation through direct reclaim.

Make this allocation boundary explicitly non-reclaiming so callers can
retain outer synchronization without a recursive swap allocation.
Clear __GFP_DIRECT_RECLAIM from the fallback request while retaining
__GFP_HIGH and __GFP_NOMEMALLOC. The retry can still wake kswapd, but
fails without direct reclaim when memory is unavailable.

This can make metadata allocation fail earlier under memory pressure.
Keep the existing isolated-cluster rollback and restrict this request
without adding a task-wide PF_MEMALLOC scope.

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>
Signed-off-by: Lian Wang <lianux.mm@gmail.com>
---
 mm/swapfile.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index cd2cb360f274..70913402a265 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -586,13 +586,14 @@ static void swap_cluster_assert_empty(struct swap_cluster_info *ci,
 }
 
 /*
- * Allocate swap table for one cluster. Attempt an atomic allocation first,
- * then fallback to sleeping allocation.
+ * Allocate swap table for one cluster. Attempt allocation under the locks
+ * first, then retry with the locks dropped without entering direct reclaim.
  */
 static struct swap_cluster_info *
 swap_cluster_populate(struct swap_info_struct *si,
 			 struct swap_cluster_info *ci)
 {
+	gfp_t gfp;
 	int ret;
 
 	/*
@@ -610,9 +611,11 @@ swap_cluster_populate(struct swap_info_struct *si,
 		return ci;
 
 	/*
-	 * Try a sleep allocation. Each isolated free cluster may cause
-	 * a sleep allocation, but there is a limited number of them, so
-	 * the potential recursive allocation is limited.
+	 * Drop the device and cluster locks before retrying. Metadata allocation
+	 * must not recurse into swap allocation through direct reclaim: callers
+	 * can retain outer synchronization across cluster population. Restrict
+	 * this request instead of granting the task PF_MEMALLOC, which could
+	 * give allocator hooks and failure cleanup reserve access.
 	 */
 	spin_unlock(&ci->lock);
 	if (si->flags & SWP_SOLIDSTATE)
@@ -620,8 +623,9 @@ swap_cluster_populate(struct swap_info_struct *si,
 	else
 		spin_unlock(&si->global_cluster->lock);
 
-	ret = swap_cluster_alloc_table(si, ci, __GFP_HIGH | __GFP_NOMEMALLOC |
-					     GFP_KERNEL, false);
+	gfp = (GFP_KERNEL | __GFP_HIGH | __GFP_NOMEMALLOC) &
+		~__GFP_DIRECT_RECLAIM;
+	ret = swap_cluster_alloc_table(si, ci, gfp, false);
 
 	/*
 	 * Back to atomic context. We might have migrated to a new CPU with a
@@ -3160,9 +3164,8 @@ static int swap_device_disable(struct address_space *mapping,
 		return err;
 
 	/*
-	 * The swap allocator doesn't take swapon_rwsem. Looping through every
-	 * cluster lock after clearing SWP_WRITEOK ensures that allocators see
-	 * the updated flag and that no allocation remains in flight.
+	 * Drain cluster-lock users after clearing SWP_WRITEOK, so swapoff
+	 * does not race with operations that started before the transition.
 	 */
 	for (offset = 0; offset < end; offset += SWAPFILE_CLUSTER) {
 		ci = swap_cluster_lock(si, offset);
