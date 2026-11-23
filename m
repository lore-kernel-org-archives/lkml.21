Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795403488;
	b=I6h2cXADOjRSYU8/UVubAUUb6qXCqv4Ezze1jshgWAFxp2DZYY18GavUbcgwHtmk1Q99
	 hmRc7pBOnFLushkeYRYKuZo7ieXONmmS5RbufO5rXn98sZD5dff3NFDXgA/2BYLWsem4d
	 +skJOn792YYiXCibqE0iiBh5yyXfJ85WSgGUO2QLLRieskiJJHoiLskZ7IJ50npV9Zpv6
	 haLSYbpRF5cgLiQYsLQyXPZAa8cqswNCiAZkMeNT3SEj5RSpIaoa6WWFJJ9epnOYoHSaS
	 Mpj7hzYsi4S3HzOIBXueBmmE1bfUbMZbR/qtpyzq3y1rgMv3Sr4o3FO1HMRcbD9tiNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795403488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5xwbvs9dbFOKA8I/2QnQJ3qTyNUOhR9OO7JyO6aGPgk=;
	b=RA6CpyWBjBtmZvJE3NdaaB+tpOROAHYfCYH0syR6zphVDZJMEHZSC+X5uq6dTswU0Rfj
	 ea1Vnub9MiCHcPp02SvF48PyIbsAaq3yklKYuFcTuYo042U7luZd2Smkdds36c+Dz+q/W
	 y6o8+XQKfgGnpFFr20YmUUldqHIJQExdjbCuz+2VHzTqSKIrOamwghBs9L9Q33xaXMfQG
	 t6Cay35566bMZjawZtDapZKzN/Ojnac9KrC8aswI98ya4Nywql2xDTq58QhbvjijMKHrC
	 KA54f7JDIwTsYmJwA6DXunq1tF281+sYs7yus0mlw19XU3hsFtLBDDfSuZg2ITHHu8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=clSNMRH0;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9F7606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B9F7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=clSNMRH0
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so2240242a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795403488; x=1796008288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5xwbvs9dbFOKA8I/2QnQJ3qTyNUOhR9OO7JyO6aGPgk=;
        b=clSNMRH05ChsMPIodcRhLgP9oQRrpoI20hpxFngJSARyXR92jQHY7oDGUXafan9KWs
         epgNa84iSki2LQZf25tJIUYft4gYjVLzLAKOmew1OjK7e9TNvOmkdwIJCCfAhYn1mV4n
         /R+flvn1Rf6iS+jWn5C6DuFzJzH62qwCOhsTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795403488; x=1796008288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5xwbvs9dbFOKA8I/2QnQJ3qTyNUOhR9OO7JyO6aGPgk=;
        b=X8JoVUHEETaGaqqLFhlt0C2LdvaAZ4guSixQXJ0p6bXVVRg8a3rVp5/M0K/rgdYOFH
         JCSEu32CRgYOTkAZSJOVSTB6wJJDeryT217PnzCVEvSHHrz29Izl4+WDa1M0DIrL09eC
         Dcl+5ga1/uk5o2y+sVlF3h8YTVCqmnBmYiksqxClHTu69i+JgfDuNY9zNUouGkuUCanM
         KBF+YUh/A5ZqwtQTQwMIs9u48w1LgmO0lh3LrD1upBZpOaUOBlf/iYvjz6ZkQ2rjgxZ5
         eoCsBG2e4jfnfaM+Uj04+FnpXn2Iov7b1yEhjNjXcVOfzbq1SBeBPO0F6XcC1ndu37yD
         4Qww==
X-Forwarded-Encrypted: i=1; AL+hErG+2hUOIUJOGYdv0aUgHVXM9Q1P5gR47uOrX4eftuIzCqH2tGb+F6DIHoiTM+QWsfMeCLdDpA+IuAI1N9g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gLP2SmFmwVZ74/7rbl7lDkE7EBAy9+kdCgKIw50H2Kfs59vEP
	2TPTi2AEz3Tth8jGA+h2sURUg+K13nWAVA/ABuHDSwGYyReeHZDt+ceenr7HYQYV4A==
X-Gm-Gg: AZFdTZeQleA0v92m9Xv/jUx33Z6VxcV1/2Xs0AOBPeN4WFFWViEXv/MPmzeYj5zOv4P
	2fPDdO4TXsurhqYS0qW9eOYLqQKgAHWd/lzLvDEzeeA6EiWianrlUDjOmV2gHq1lQXi6OkLL+J4
	9TQvfZ2Vsm2u7xPcjvtie79XsWVE8gvFVfIsn8M49/iU8w9CBg3GzFEOWx/V1Ad655sg8leMokt
	g8nBhtWxXxLEn+SJpVshTx8NaEiIDBgSW59dXxkyI1Y4MzYhVkNd15fn3Rx9655Hd7IBN35CgJu
	jLorFCWJINDXb5d/NOTLPTuj1h7U03dFa/KU0Jh/ClEafDGHKRNSoCfDexeKc2m7o4HBriLxUlO
	UZ04S3cxuZ+rXeIeIWnXmQ50F2/XkBpS/2iDM1S3/YSAy3sJHA6HZ59iQgsxi/TRcFSIje6WScQ
	S3DlKQYQrOJVMHZnYH/NRy/6XtIpQC1A30iVw2rS+hPgbtz6p/poUaWML5QrVnWn8oNs1hdnEfv
	295FXbBiGwUnINbVK42r1G8ARK2CuKZLbfUE7p6HGqvwCF1ZHrw9tqpuH3HVKZ0hXwD7ecTf8BS
	R7UALmUjc9u15F6qxSIrgCGz8q+4WK2V5yJHGFxUj+G9KPIOYKlC+Pyz9DOZfosw58szyAnWbpM
	HSnVOo2me9UxOj2oA2g==
X-Received: by 2002:a17:90b:3b52:b0:3b3:b9e4:e3f5 with SMTP id 98e67ed59e1d1-3b41c92a524mr9488083a91.30.1795403487780;
        Sun, 22 Nov 2026 19:11:27 -0800 (PST)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:d8fa:c511:e415:e0d0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad92c13sm15330240a91.14.2026.11.22.19.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 19:11:27 -0800 (PST)
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
Subject: [PATCH 1/2] zsmalloc: free a zspage's pages in one batch
Date: Mon, 23 Nov 2026 12:10:58 +0900
Message-ID: <5666c1c8c04998784c81fc8fe751e35aa40af578.1795403342.git.senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
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

__free_frozen_pages() and dec_zone_page_state() take about 22% of the
profile [1].

Collect the pages of a multi-page zspage in a folio_batch and free
them with folios_put(), which takes the pcp lock once per run of
same-zone pages, and update NR_ZSPAGES once per such run as well
A zspage never has more pages than a folio_batch holds.

Single-page zspages, incompressible or power of 2 size classes, use
the current inline path.  There is nothing to batch there, and
folio_batch is not free.  The batch lives in its own noinline
function, which also keeps.

munmap() test:
                    next-20261119      v7.4-rc3
  256 MiB           -2.0% .. -4.1%     -4.4%
  1 GiB             -2.8% .. -4.4%     -3.8%

Link: https://lore.kernel.org/20261109105957.2577351-1-chenhongfeng0212@gmail.com
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 mm/zsmalloc.c | 52 +++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 46 insertions(+), 6 deletions(-)

diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index f571b3c9e9ca..9dcd1549c2fb 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -37,6 +37,7 @@
 #include <linux/debugfs.h>
 #include <linux/zsmalloc.h>
 #include <linux/fs.h>
+#include <linux/folio_batch.h>
 #include <linux/workqueue.h>
 #include "zpdesc.h"
 
@@ -866,6 +867,44 @@ static int trylock_zspage(struct zspage *zspage)
 	return 0;
 }
 
+/*
+ * Free the pages of a multi-page zspage in one go, see folios_put().
+ * Not inlined, so that the folio_batch is only set up (and, with
+ * CONFIG_INIT_STACK_ALL_ZERO, zero-filled) when there is something
+ * to batch.
+ */
+static noinline void free_page_chain(struct zpdesc *zpdesc)
+{
+	struct zone *zone = zpdesc_zone(zpdesc);
+	struct folio_batch fbatch;
+	int nr = 0;
+
+	static_assert(ZS_MAX_PAGES_PER_ZSPAGE <= FOLIO_BATCH_SIZE);
+
+	folio_batch_init(&fbatch);
+	do {
+		struct zpdesc *next = get_next_zpdesc(zpdesc);
+
+		VM_BUG_ON_PAGE(!zpdesc_is_locked(zpdesc), zpdesc_page(zpdesc));
+		reset_zpdesc(zpdesc);
+		zpdesc_unlock(zpdesc);
+
+		/* NR_ZSPAGES is per zone: one update per same-zone run */
+		if (unlikely(zpdesc_zone(zpdesc) != zone)) {
+			mod_zone_page_state(zone, NR_ZSPAGES, -nr);
+			zone = zpdesc_zone(zpdesc);
+			nr = 0;
+		}
+		nr++;
+
+		folio_batch_add(&fbatch, zpdesc_folio(zpdesc));
+		zpdesc = next;
+	} while (zpdesc);
+
+	mod_zone_page_state(zone, NR_ZSPAGES, -nr);
+	folios_put(&fbatch);
+}
+
 /*
  * Three free helpers, kept apart here:
  *
@@ -884,21 +923,22 @@ static int trylock_zspage(struct zspage *zspage)
  */
 static inline void __free_zspage_lockless(struct zspage *zspage)
 {
-	struct zpdesc *zpdesc, *next;
+	struct zpdesc *zpdesc;
 
 	VM_BUG_ON(get_zspage_inuse(zspage));
 	VM_BUG_ON(zspage->fullness != ZS_INUSE_RATIO_0);
 
-	next = zpdesc = get_first_zpdesc(zspage);
-	do {
+	zpdesc = get_first_zpdesc(zspage);
+	if (get_next_zpdesc(zpdesc)) {
+		free_page_chain(zpdesc);
+	} else {
+		/* Single-page zspage, e.g. a huge object: nothing to batch */
 		VM_BUG_ON_PAGE(!zpdesc_is_locked(zpdesc), zpdesc_page(zpdesc));
-		next = get_next_zpdesc(zpdesc);
 		reset_zpdesc(zpdesc);
 		zpdesc_unlock(zpdesc);
 		zpdesc_dec_zone_page_state(zpdesc);
 		zpdesc_put(zpdesc);
-		zpdesc = next;
-	} while (zpdesc != NULL);
+	}
 
 	cache_free_zspage(zspage);
 }
-- 
2.56.1.750.gf70dc682cf-goog

