Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795412878;
	b=3u9TiNMSlc+wgyPykAyAwny7UZ0RVesQYkSTKuwFpJjHtOdnR4ZyFnQU2qk/VLlAlwnS
	 RETKV7B2SXmc9lnNyJDEEksIi7+d3+0pZDVbMpjNin/kujnBDXdDDvlZtocM0wsqB8Pl+
	 Crf4qXb/ifw59SK36PNdZiAEzl6pt5SSQWrVgWijRZGXPYNfsQLH8IZes+Zec7X4pY1q2
	 VRsPz93O0QwG2ozSQh2tylKFLaIlptmxCKpmK5LR9qTt4Cn+oKeVsnYx3fiZxq8aNtd/D
	 pM3rdipzhd4vnJXJFI7WHnRRIvMqeC5qIIIwkutlQRLcnhOrtxS3EDthdlrrZMfw17g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795412878;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NHVBusMJtgIHiAajWwbmDUyt5sZhsFSWPp0kKpvldow=;
	b=dnAgK0WfbDHGsf3LDN/OKDCaBhK+rc2rUsraBDAjXKtZn0TS5kh2qryuRSLuGJBZqQpB
	 bMzBwjm7UWjLLPzLhmDXpew/Xc88Zo6+Pbuxfh2l1OWRkomNrA6ruANLtBmT6CZCOYZ//
	 qKL6uFaTTmnG4DkaVZeXEnx6/jXQzQQP9nq0hsvyCQ+cg1L8NZZAfG6YWxkOF+unfOMN2
	 dD6BH92FS7/d2TMkHELO+AeTbA32Tw7cxuf6XdIWKNtN+4DURVBgGnHNvjC0A1gel/gNd
	 aCDaSqamk0K5jnZ/oNYuzqA991HJpbTPnnyrYHnzArfBtZfM6sinfutrwJ80U3GExTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VH16BOUM;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7621E606A689
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:47:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7621E606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VH16BOUM
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso1582792a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 21:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795412878; x=1796017678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NHVBusMJtgIHiAajWwbmDUyt5sZhsFSWPp0kKpvldow=;
        b=VH16BOUMNyzogG0tuaynDSqh7SK4bdb6Hz3bzdFilWoBrrX96EgOM9zB81EohbxsNG
         U5VUB3q1wLomyZZQvib5WkIHwUOldotHlDaEHmVOjS+QMkthv0mkI1s7B9o8Ge2SBJXV
         0wIGz1IeHMzWIrtdf7Ok8HVVOIUQHoBFQgQZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795412878; x=1796017678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NHVBusMJtgIHiAajWwbmDUyt5sZhsFSWPp0kKpvldow=;
        b=26EL5eTkGLSpLeMWQujHPuN59zqGTjxfn3tddCpiGGH+1UIwrAvUhBAygf5G5NQOHO
         ZXwFQhcZyVdKji0vqArXAYlcWApT0rlwHwveQn9V1MZrHovTNEexSfzX7GrpkljG1u/n
         XDWZIhSFOVBf5hSz6/P4+5Lfixmd1ULfA3HVwFy8xhk/nxN42UCm8QRfoLmYu2LMOSKM
         TlTnS43q3jlM5zQkD6CkQN+3S7sw9txFup4R09Piy0jWNPLvi2PdWp5fhP/sEmbrleJ+
         PUCOPQkduNcJ0n4pDLHwNRPECFiI77NB6HX83kyVlpkwBOCl8fx5Y1DzXE5ZqQfCuWPx
         zxZw==
X-Forwarded-Encrypted: i=1; AL+hErGB10h88N5CCMxULmdjLyYQIKRYLg6QvdEO4qFogUHOI16wnIeB7uOz7LoMN67FdCHBQ6SQQCkHH9EBAm0=@vger.kernel.org
X-Gm-Message-State: APuU4Z83pBT97UxmJP7KvEKlA7I11T+tmLSpEiz20ViDLTtMy7wzWVE1
	aYrJS/f1rFOp8gmHZ/CFASvmDIfyIjUIAZO6TWTzaOqrGmXvj2R7kGbhKp/CuGs442Spb1jTRqc
	MON4=
X-Gm-Gg: AZFdTZeGhG8Xu1oEqO+GCKc1zTfWVUX1s/q1uAf9ZyI/3TiqN+psTzieERVuH//yRmd
	NOzGb2QVSfWAEyqtWhInmq1rEmwepQjdsc6ya8va2ZKzh3EnNqs6M2vdV22gGBsF4Lhl7LRo6MD
	eZaC/dd8O1VJqlnXGtUix7uCo7ZVQpSSrnge5yuNzBE4wrvRg3jiuWmPObt/N5xDBE3JuA/jFdc
	USnc0pCFalMpL7Dd0p0gcmQEWgWN5sC7o+0i6IKwgYI2cwf0v8OGis3NcBgixpofnM+g3Vik0HB
	HPCMdnv7fBwmjYi6YabCGKnzSyt2CxdaVTlg8ymJyvA1BcsOKsTa8TMIcjS6Xfp4LzgRrGMb9Z/
	w1ZzFPrvHCgW0SZr4Ze/8Qn4tjwR03tkFnPV/ZffnKbdpGY5eNUIsmtQrOuzmF97carYT+H40Jl
	iZsxe6OTLjvVrtTufEl+6qzHSv8ifov/mbxlIH0nC3/7EJW/DhIgsBiSjWgkD589q5ExwD9B8zF
	MZzGis/oL5y7IGz5GvPa069nGhkhS9KHDydoAhnrC8uEtms5VtP3X1qc67CGcO2bvMtDNjGutMK
	pnncVZF/E9FJpWRnvRso1apQvJuk5l04Fz1/ARgJUzgMfMJTq5OD+OeXAW07J2882szSLkyHQ5e
	8XFqUo62ZUPib2Q4T2A==
X-Received: by 2002:a17:90b:1f91:b0:3b4:1cb1:e7ae with SMTP id 98e67ed59e1d1-3b41cb1e88bmr10806557a91.45.1795412877665;
        Sun, 22 Nov 2026 21:47:57 -0800 (PST)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:d8fa:c511:e415:e0d0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad92c07sm16240267a91.13.2026.11.22.21.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:47:57 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Nhat Pham <nphamcs@gmail.com>,
	Yosry Ahmed <yosry@kernel.org>,
	Hongfeng Chen <hongfengchen@xiaomi.com>,
	Brian Geffon <bgeffon@google.com>,
	Minchan Kim <minchan@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v3 2/2] zram: keep the hot statistics per CPU
Date: Mon, 23 Nov 2026 14:47:37 +0900
Message-ID: <20261123054746.2579253-3-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
In-Reply-To: <20261123054746.2579253-1-senozhatsky@chromium.org>
References: <20261123054746.2579253-1-senozhatsky@chromium.org>
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

When several processes free swapped out memory at the same time, e.g.
on munmap() or exit, all CPUs update pages_stored, compr_data_size,
same_pages, huge_pages, huge_pages_since and notify_free stats, so
the cachelines bounce a lot [1].  Keep the six counters per CPU
instead, as local64_t updated with preemption disabled.

munmap() test:
                  before     after
  4 x 256 MiB     18.69 ms   14.12 ms   (-24%)
  8 x 128 MiB     14.82 ms   10.09 ms   (-32%)

[1] https://lore.kernel.org/20261017031542.3504947-1-hongfengchen@xiaomi.com

Co-developed-by: Hongfeng Chen <hongfengchen@xiaomi.com>
Signed-off-by: Hongfeng Chen <hongfengchen@xiaomi.com>
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/zram_drv.c | 99 ++++++++++++++++++++++++++---------
 drivers/block/zram/zram_drv.h | 26 ++++++---
 2 files changed, 93 insertions(+), 32 deletions(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 54eb691f1409..96b135e3f727 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -95,6 +95,38 @@ static void slot_unlock(struct zram *zram, unsigned long index)
 	clear_and_wake_up_bit(ZRAM_ENTRY_LOCK_BIT, lock);
 }
 
+static void zram_stat_add(struct zram *zram, enum zram_pcpu_stat item,
+			  s64 amount)
+{
+	struct zram_pcpu_stats *stats = get_cpu_ptr(zram->pcpu_stats);
+
+	local64_add(amount, &stats->stat[item]);
+	put_cpu_ptr(zram->pcpu_stats);
+}
+
+static void zram_stat_sub(struct zram *zram, enum zram_pcpu_stat item,
+			  s64 amount)
+{
+	struct zram_pcpu_stats *stats = get_cpu_ptr(zram->pcpu_stats);
+
+	local64_sub(amount, &stats->stat[item]);
+	put_cpu_ptr(zram->pcpu_stats);
+}
+
+static u64 zram_stat_read(struct zram *zram, enum zram_pcpu_stat item)
+{
+	struct zram_pcpu_stats *stats;
+	s64 sum = 0;
+	int cpu;
+
+	for_each_possible_cpu(cpu) {
+		stats = per_cpu_ptr(zram->pcpu_stats, cpu);
+		sum += local64_read(&stats->stat[item]);
+	}
+
+	return sum < 0 ? 0 : sum;
+}
+
 static inline bool init_done(struct zram *zram)
 {
 	return zram->disksize;
@@ -944,8 +976,9 @@ static int zram_writeback_complete(struct zram *zram, struct zram_wb_req *req)
 
 	clear_slot_flag(zram, index, ZRAM_IDLE);
 	if (test_slot_flag(zram, index, ZRAM_HUGE))
-		atomic64_dec(&zram->stats.huge_pages);
-	atomic64_sub(get_slot_size(zram, index), &zram->stats.compr_data_size);
+		zram_stat_sub(zram, ZRAM_STAT_HUGE_PAGES, 1);
+	zram_stat_sub(zram, ZRAM_STAT_COMPR_DATA_SIZE,
+		      get_slot_size(zram, index));
 	zs_free(zram->mem_pool, &zram->table[index].handle);
 	zram->table[index].blk_idx = req->blk_idx;
 	set_slot_flag(zram, index, ZRAM_WB);
@@ -1927,7 +1960,7 @@ static ssize_t io_stat_show(struct device *dev, struct device_attribute *attr,
 			"%8llu %8llu 0 %8llu\n",
 			(u64)atomic64_read(&zram->stats.failed_reads),
 			(u64)atomic64_read(&zram->stats.failed_writes),
-			(u64)atomic64_read(&zram->stats.notify_free));
+			zram_stat_read(zram, ZRAM_STAT_NOTIFY_FREE));
 
 	return ret;
 }
@@ -1949,20 +1982,20 @@ static ssize_t mm_stat_show(struct device *dev, struct device_attribute *attr,
 		zs_pool_stats(zram->mem_pool, &pool_stats);
 	}
 
-	orig_size = atomic64_read(&zram->stats.pages_stored);
+	orig_size = zram_stat_read(zram, ZRAM_STAT_PAGES_STORED);
 	max_used = atomic_long_read(&zram->stats.max_used_pages);
 
 	ret = sysfs_emit(buf,
 			"%8llu %8llu %8llu %8lu %8ld %8llu %8lu %8llu %8llu\n",
 			orig_size << PAGE_SHIFT,
-			(u64)atomic64_read(&zram->stats.compr_data_size),
+			zram_stat_read(zram, ZRAM_STAT_COMPR_DATA_SIZE),
 			mem_used << PAGE_SHIFT,
 			zram->limit_pages << PAGE_SHIFT,
 			max_used << PAGE_SHIFT,
-			(u64)atomic64_read(&zram->stats.same_pages),
+			zram_stat_read(zram, ZRAM_STAT_SAME_PAGES),
 			atomic_long_read(&pool_stats.pages_compacted),
-			(u64)atomic64_read(&zram->stats.huge_pages),
-			(u64)atomic64_read(&zram->stats.huge_pages_since));
+			zram_stat_read(zram, ZRAM_STAT_HUGE_PAGES),
+			zram_stat_read(zram, ZRAM_STAT_HUGE_PAGES_SINCE));
 
 	return ret;
 }
@@ -2045,7 +2078,7 @@ static void slot_free(struct zram *zram, unsigned long index)
 		 * ZRAM_HUGE flag for deferred decompression path.
 		 */
 		if (!test_slot_flag(zram, index, ZRAM_WB))
-			atomic64_dec(&zram->stats.huge_pages);
+			zram_stat_sub(zram, ZRAM_STAT_HUGE_PAGES, 1);
 		clear_slot_flag(zram, index, ZRAM_HUGE);
 	}
 
@@ -2061,7 +2094,7 @@ static void slot_free(struct zram *zram, unsigned long index)
 	 */
 	if (test_slot_flag(zram, index, ZRAM_SAME)) {
 		clear_slot_flag(zram, index, ZRAM_SAME);
-		atomic64_dec(&zram->stats.same_pages);
+		zram_stat_sub(zram, ZRAM_STAT_SAME_PAGES, 1);
 		goto out;
 	}
 
@@ -2071,10 +2104,10 @@ static void slot_free(struct zram *zram, unsigned long index)
 
 	zs_free(zram->mem_pool, handle);
 
-	atomic64_sub(get_slot_size(zram, index),
-		     &zram->stats.compr_data_size);
+	zram_stat_sub(zram, ZRAM_STAT_COMPR_DATA_SIZE,
+		      get_slot_size(zram, index));
 out:
-	atomic64_dec(&zram->stats.pages_stored);
+	zram_stat_sub(zram, ZRAM_STAT_PAGES_STORED, 1);
 	zram->table[index].element = 0;
 	set_slot_size(zram, index, 0);
 }
@@ -2246,8 +2279,8 @@ static int write_same_filled_page(struct zram *zram, unsigned long fill,
 	mark_slot_accessed(zram, index);
 	slot_unlock(zram, index);
 
-	atomic64_inc(&zram->stats.same_pages);
-	atomic64_inc(&zram->stats.pages_stored);
+	zram_stat_add(zram, ZRAM_STAT_SAME_PAGES, 1);
+	zram_stat_add(zram, ZRAM_STAT_PAGES_STORED, 1);
 
 	return 0;
 }
@@ -2277,10 +2310,10 @@ static int write_incompressible_page(struct zram *zram, struct page *page,
 	mark_slot_accessed(zram, index);
 	slot_unlock(zram, index);
 
-	atomic64_add(PAGE_SIZE, &zram->stats.compr_data_size);
-	atomic64_inc(&zram->stats.huge_pages);
-	atomic64_inc(&zram->stats.huge_pages_since);
-	atomic64_inc(&zram->stats.pages_stored);
+	zram_stat_add(zram, ZRAM_STAT_COMPR_DATA_SIZE, PAGE_SIZE);
+	zram_stat_add(zram, ZRAM_STAT_HUGE_PAGES, 1);
+	zram_stat_add(zram, ZRAM_STAT_HUGE_PAGES_SINCE, 1);
+	zram_stat_add(zram, ZRAM_STAT_PAGES_STORED, 1);
 
 	return 0;
 }
@@ -2340,8 +2373,8 @@ static int zram_write_page(struct zram *zram, struct page *page,
 	slot_unlock(zram, index);
 
 	/* Update stats */
-	atomic64_inc(&zram->stats.pages_stored);
-	atomic64_add(comp_len, &zram->stats.compr_data_size);
+	zram_stat_add(zram, ZRAM_STAT_PAGES_STORED, 1);
+	zram_stat_add(zram, ZRAM_STAT_COMPR_DATA_SIZE, comp_len);
 
 	return ret;
 }
@@ -2532,8 +2565,8 @@ static int recompress_slot(struct zram *zram, unsigned long index,
 	set_slot_size(zram, index, comp_len_new);
 	set_slot_comp_priority(zram, index, prio);
 
-	atomic64_add(comp_len_new, &zram->stats.compr_data_size);
-	atomic64_inc(&zram->stats.pages_stored);
+	zram_stat_add(zram, ZRAM_STAT_COMPR_DATA_SIZE, comp_len_new);
+	zram_stat_add(zram, ZRAM_STAT_PAGES_STORED, 1);
 
 	return 0;
 }
@@ -2711,7 +2744,7 @@ static void zram_bio_discard(struct zram *zram, struct bio *bio)
 		slot_lock(zram, index);
 		slot_free(zram, index);
 		slot_unlock(zram, index);
-		atomic64_inc(&zram->stats.notify_free);
+		zram_stat_add(zram, ZRAM_STAT_NOTIFY_FREE, 1);
 		index++;
 		n -= PAGE_SIZE;
 	}
@@ -2804,7 +2837,7 @@ static void zram_slot_free_notify(struct block_device *bdev,
 
 	zram = bdev->bd_disk->private_data;
 
-	atomic64_inc(&zram->stats.notify_free);
+	zram_stat_add(zram, ZRAM_STAT_NOTIFY_FREE, 1);
 	if (!slot_trylock(zram, index)) {
 		atomic64_inc(&zram->stats.miss_free);
 		return;
@@ -2845,6 +2878,8 @@ static void zram_destroy_comps(struct zram *zram)
 
 static void zram_reset_device(struct zram *zram)
 {
+	int cpu;
+
 	guard(rwsem_write)(&zram->dev_lock);
 
 	zram->limit_pages = 0;
@@ -2857,6 +2892,9 @@ static void zram_reset_device(struct zram *zram)
 	zram->disksize = 0;
 	zram_destroy_comps(zram);
 	memset(&zram->stats, 0, sizeof(zram->stats));
+	for_each_possible_cpu(cpu)
+		memset(per_cpu_ptr(zram->pcpu_stats, cpu), 0,
+		       sizeof(struct zram_pcpu_stats));
 	reset_bdev(zram);
 #ifdef CONFIG_ZRAM_WRITEBACK
 	zram->wb_limit_enable = false;
@@ -3075,9 +3113,15 @@ static int zram_add(void)
 	if (!zram)
 		return -ENOMEM;
 
+	zram->pcpu_stats = alloc_percpu(struct zram_pcpu_stats);
+	if (!zram->pcpu_stats) {
+		ret = -ENOMEM;
+		goto out_free_dev;
+	}
+
 	ret = idr_alloc(&zram_index_idr, zram, 0, 0, GFP_KERNEL);
 	if (ret < 0)
-		goto out_free_dev;
+		goto out_free_stats;
 	device_id = ret;
 
 	init_rwsem(&zram->dev_lock);
@@ -3119,6 +3163,8 @@ static int zram_add(void)
 	put_disk(zram->disk);
 out_free_idr:
 	idr_remove(&zram_index_idr, device_id);
+out_free_stats:
+	free_percpu(zram->pcpu_stats);
 out_free_dev:
 	kfree(zram);
 	return ret;
@@ -3168,6 +3214,7 @@ static int zram_remove(struct zram *zram)
 	zram_reset_device(zram);
 
 	put_disk(zram->disk);
+	free_percpu(zram->pcpu_stats);
 	kfree(zram);
 	return 0;
 }
diff --git a/drivers/block/zram/zram_drv.h b/drivers/block/zram/zram_drv.h
index 724f8ce6709b..a3fa6e3d007f 100644
--- a/drivers/block/zram/zram_drv.h
+++ b/drivers/block/zram/zram_drv.h
@@ -10,6 +10,7 @@
 #define _ZRAM_DRV_H_
 
 #include <asm/byteorder.h>
+#include <asm/local64.h>
 #include <linux/rwsem.h>
 #include <linux/zsmalloc.h>
 
@@ -88,15 +89,27 @@ struct zram_table_entry {
 	};
 };
 
+/*
+ * Updated for every page that is stored or freed, so kept per CPU: with
+ * shared counters, concurrent swap frees bounce their cacheline.
+ */
+enum zram_pcpu_stat {
+	ZRAM_STAT_PAGES_STORED,		/* no. of pages currently stored */
+	ZRAM_STAT_COMPR_DATA_SIZE,	/* compressed size of pages stored */
+	ZRAM_STAT_SAME_PAGES,		/* no. of same element filled pages */
+	ZRAM_STAT_HUGE_PAGES,		/* no. of huge pages */
+	ZRAM_STAT_HUGE_PAGES_SINCE,	/* no. of huge pages since set up */
+	ZRAM_STAT_NOTIFY_FREE,		/* no. of slot free notifications */
+	NR_ZRAM_PCPU_STATS,
+};
+
+struct zram_pcpu_stats {
+	local64_t stat[NR_ZRAM_PCPU_STATS];
+};
+
 struct zram_stats {
-	atomic64_t compr_data_size;	/* compressed size of pages stored */
 	atomic64_t failed_reads;	/* can happen when memory is too low */
 	atomic64_t failed_writes;	/* can happen when memory is too low */
-	atomic64_t notify_free;	/* no. of swap slot free notifications */
-	atomic64_t same_pages;		/* no. of same element filled pages */
-	atomic64_t huge_pages;		/* no. of huge pages */
-	atomic64_t huge_pages_since;	/* no. of huge pages since zram set up */
-	atomic64_t pages_stored;	/* no. of pages currently stored */
 	atomic_long_t max_used_pages;	/* no. of maximum pages stored */
 	atomic64_t miss_free;		/* no. of missed free */
 #ifdef	CONFIG_ZRAM_WRITEBACK
@@ -132,6 +145,7 @@ struct zram {
 	unsigned long limit_pages;
 
 	struct zram_stats stats;
+	struct zram_pcpu_stats __percpu *pcpu_stats;
 	/*
 	 * This is the limit on amount of *uncompressed* worth of data
 	 * we can store in a disk.
-- 
2.56.1.750.gf70dc682cf-goog

