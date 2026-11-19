Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795094016;
	b=NtufClWhDpFHjVD19TAdgIE7N+XiQb6J1QvQKOBvNV76v9ZuJ3dAa9CrERaoKkypOBmN
	 GjXH5AJnciC4mP+4/Tjuo/8fPnux4m420xaxOtMiPZAGC6yYxQZJ30yOIYM9pn3eVtpWr
	 gJsYrlFQxIteGXOYWMHYK/Oyoz7r7HebYgnnex4CtuJ1wPONlDzVzGWQjCDK5rtFgVC2c
	 gSg1FHlXxWJPrky8+DMGvOtrLvzM9tOUpRNkqnQltOM9918Z2nvsWnb1XbdZ3s+XrJh50
	 ku20LpSU+OtRFF3zk8OotJGzWu+pNVPt/wiFP0agbvAy+Tw5sOgomDu5NMHibi171kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795094016;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UhOenxHkXTJXohukC1vI//PmlFbZZlOM6f8rclEtEAw=;
	b=ZtsQ8BCBFaf5Etn1rQyAEhFnHw59S8VhEKeXGXKS5xWa8V8dNJk6Y5FoDLXkCF75h5pq
	 eJ1r3nO+eA4qugeaRF3gbcNM0kFQXXFIS7uqDNe0YUtNmbk/dgY41QAaEIqMz7mJBsm93
	 2Z6fK+FXy8+MSZnMbklC/HO3x8SJpH3T1OB1+MyDTVDRLH3ryG+oPKN3PdMbp72/YyFO1
	 Vy4Pmu9p3X/4mCjhGs5F3A1cBt4FF7Mv5rQA5KzRX6yl1Wt+oRZMVbLt7uGI0ViES7E5V
	 kM3UInhPWpUTvS9Vn1e9YDWOfgLRvEiXVZkKdzSMcBFIbBkJIJ5wWxj7murKTU648IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sTMVL7sc;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D2260A260F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:13:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8D2260A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sTMVL7sc
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-491971ac844so2208829f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795094014; x=1795698814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UhOenxHkXTJXohukC1vI//PmlFbZZlOM6f8rclEtEAw=;
        b=sTMVL7scHgltYF1dYc08ALwIqujSWX07/co9V4HmZnSYWM8NBWSTJvGPBvpvNF8zeQ
         2rwm1GUsUkr6EtN003qCXL8n6E1Xp+vzVA47EWi52VuJIw7KtNQ8iICtoENj7HadvKBZ
         GtS3Q9CUVYioLSPXFT3zhEU3ngshmweAjYgSpX6YXRZdCT+9HrcVPhYIv+90TXfsDe70
         doZsqqCsGtwKpIHvNrbWuP3jcskKcHJSkz/ADfeC2cF4mK7uaZfgTij27yMsejhqkDc4
         TrprTtyrAHpArLIm/JyQO7PzII7NMnLpI2mzjQXZTz335tzTaRi0sR2KYIKIe9c1VcE/
         ZEDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795094014; x=1795698814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UhOenxHkXTJXohukC1vI//PmlFbZZlOM6f8rclEtEAw=;
        b=xJqI4qKpK1BL8b7iiaHu2C3q8q3hynU96I9y66u9x+RvoBqzcZfmuGQNNR4F/7sJ4f
         a2gZdurTiydM38C2Sd5QEDGcShIEPsbHGbUbI2Ll/DWbYYB4mPKlADCA/6zQxu+oy43V
         PE7GKHLw4Rq55bMaEEO1FpuBmycPTVe9+le8/SrPI3eC6pNdcOcp92JqIDeRB7i46IZA
         D7WEWRCVUGTnvdyAKsSLDiUlaM8PvSR0l73NqKtrILD0mjvzxOTJ2SZrstlrrPYtqYeY
         tk3Vt0e+Z4gNFKo1SFKcoriSrwC3LgH3q6shrLWZuAASx3zMNWM4Ly3q4EbLpJ7rpeYC
         P0Iw==
X-Forwarded-Encrypted: i=1; AL+hErG62QzvR62KpxGChcsWycS+bcGh/kBtBY1ma5MQv9ui2iG9AJQVLK46VGRSWKEZ97aWbG2AMbO6bXPJ2jk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JcwiIYscYdbI2Ps5M8zYdBRL9hiB0kFpGPNjehBvIigI+SEvv
	q/GJi/WOeV4nWJv0YEzAMtHozIZBhYPj3ULpCF05utkUZmwUefh6mRe5
X-Gm-Gg: AYBFou2aOlZOTX+rsSSBZxPr+hQaaJY6SDjzLpWfyds+hHukQ0ATbA2lVerqh4ROF0m
	gxef4Sj0xa5FTtq1cN36bQuFyZEYcsoanrHZz48A+KBYdBumtYEjJGbnBUtUey68kxLbxGQIYHP
	kqX/ZN0W016ATfXOOq8lfAaz1ICFuUEMkVgZM21l42HRU0mJQ0kPzCTP6dexTYv8/MtfaXgF0mX
	248NjQM4hqgGI/plU0GTdrj8v3Cb+jwDADmWAFyQBNqFSRAoLKB3hYtd8JKF+axtV3hsfwqBKyT
	YyWWg5RVdM9rwunZMSmu4YdVKFEE2MbOoKUo6PrDpCYZeLgTHgZhQ2Ufhq+G1LYjPoiFkutxp5v
	Y+fFrdEclju4CJVnn8k8mBCt4CoJ0/DiNSDr82D34ophL1Un8Wxm7zlVoPjIzMeHbHCSB0oWwP8
	x7hDJ2Qbcdh7VD93pbpMZyyLtLwvVJIhsfLlt+0T5dckKCreIAwcLxjcuidIrOOCPzLdjgeRvuA
	mv7mcG40OXyIBMHFkmxkjyFRrcwLOheJ/v3YeSf8nqj/0jIoFEX5CDOulsKf3Zy74KDf9IWD1P/
	NTJ8F0JSf0LnaHIwt5LDC9qEHhHAN22r7qNW
X-Received: by 2002:a05:600c:1395:b0:4bb:5de1:e92c with SMTP id 5b1f17b1804b1-4bb7da3947emr122657995e9.26.1795094014044;
        Thu, 19 Nov 2026 05:13:34 -0800 (PST)
Received: from LAPTOP-AVI.lan ([2a06:c701:477f:ff00:c2fd:f9b8:4971:d270])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e5edf5sm18258045e9.4.2026.11.19.05.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:13:33 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: m.szyprowski@samsung.com,
	robin.murphy@arm.com
Cc: ailiop@suse.com,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH v2 2/2] dma-debug: Remove obsolete mapping dump helper
Date: Thu, 19 Nov 2026 15:13:25 +0200
Message-ID: <8d79f918823590770607279958d16fdd750d5829.1795093513.git.thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795093513.git.thnkslprpt@gmail.com>
References: <cover.1795093513.git.thnkslprpt@gmail.com>
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

debug_dma_dump_mappings() is only called by the legacy AMD GART IOMMU
leak diagnostic. The helper traverses DMA-debug hash buckets even when
DMA debugging was never initialized.

Remove the helper, its declarations and the GART call. Keep the GART
stack trace for diagnosing IOMMU exhaustion.

Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 arch/x86/kernel/amd_gart_64.c |  1 -
 include/linux/dma-map-ops.h   |  4 ----
 kernel/dma/debug.c            | 33 ---------------------------------
 3 files changed, 38 deletions(-)

diff --git a/arch/x86/kernel/amd_gart_64.c b/arch/x86/kernel/amd_gart_64.c
index b5f1f031d45b..965844299a1b 100644
--- a/arch/x86/kernel/amd_gart_64.c
+++ b/arch/x86/kernel/amd_gart_64.c
@@ -157,7 +157,6 @@ static void dump_leak(void)
 	dump = 1;
 
 	show_stack(NULL, NULL, KERN_ERR);
-	debug_dma_dump_mappings(NULL);
 }
 #endif
 
diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index afaf2c12189b..eb32ed923455 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -418,14 +418,10 @@ static inline void arch_teardown_dma_ops(struct device *dev)
 
 #ifdef CONFIG_DMA_API_DEBUG
 void dma_debug_add_bus(const struct bus_type *bus);
-void debug_dma_dump_mappings(struct device *dev);
 #else
 static inline void dma_debug_add_bus(const struct bus_type *bus)
 {
 }
-static inline void debug_dma_dump_mappings(struct device *dev)
-{
-}
 #endif /* CONFIG_DMA_API_DEBUG */
 
 extern const struct dma_map_ops dma_dummy_ops;
diff --git a/kernel/dma/debug.c b/kernel/dma/debug.c
index 6e554dcfc9b9..f1b6f7b9aa14 100644
--- a/kernel/dma/debug.c
+++ b/kernel/dma/debug.c
@@ -535,39 +535,6 @@ static void active_cacheline_remove(struct dma_debug_entry *entry)
 	spin_unlock_irqrestore(&radix_lock, flags);
 }
 
-/*
- * Dump mappings entries on kernel space for debugging purposes
- */
-void debug_dma_dump_mappings(struct device *dev)
-{
-	int idx;
-	phys_addr_t cln;
-
-	for (idx = 0; idx < HASH_SIZE; idx++) {
-		struct hash_bucket *bucket = &dma_entry_hash[idx];
-		struct dma_debug_entry *entry;
-		unsigned long flags;
-
-		spin_lock_irqsave(&bucket->lock, flags);
-		list_for_each_entry(entry, &bucket->list, list) {
-			if (!dev || dev == entry->dev) {
-				cln = to_cacheline_number(entry);
-				dev_info(entry->dev,
-					 "%s idx %d P=%pa D=%llx L=%llx cln=%pa %s %s attrs=0x%lx\n",
-					 type2name[entry->type], idx,
-					 &entry->paddr, entry->dev_addr,
-					 entry->size, &cln,
-					 dir2name[entry->direction],
-					 maperr2str[entry->map_err_type],
-					 entry->attrs);
-			}
-		}
-		spin_unlock_irqrestore(&bucket->lock, flags);
-
-		cond_resched();
-	}
-}
-
 /*
  * Dump mappings entries on user space via debugfs
  */
-- 
2.43.0

