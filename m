Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795412203;
	b=T7Te0VXTueJcKxHJpGQd3jRczFo5/dbKt91WPFQ5lO7QbaIG0Cz6ArGDRx1wQB7+aYDK
	 To8vnSigowHIcNcXL9lxKLnd/YXYHUwT+oKUBDwZ1MevYGbpgwUzeTGbgb5ezI+oEfhnC
	 GMMcqR/nedNCnUMDoAyjRnqj5rY845uKoQ0ikl7Ptp/wyKx/e+L12GZgOvLATfBhwi8gS
	 woyJLFv5fuE3pgBu9u/0V3TFozbQ4r6B0gTf2MdaCVxOiwVvVvTYrZ9JJroVcWeUCdBpB
	 qN0jZEM8uzY7P5xcJzAI6OLjnqW2AzBkUBIIGJb78OKYPEV/op9jw/JFuEu/HzvNHfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795412203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KnMxzhHOEHpbsDB95jN4ZokxNKIXrj2a5/W65iB8kpI=;
	b=MpsLvas+WKbXtK6AmcKW3BRlxq703TKuEzF+6Vf3IjjQbSuOOnDaMKb1hRCpsk53uCaM
	 AniA4uBvbYlfN8A5yWI1Xa19KP6AzadrJeypeLKLwUjtOj1pQc7e261bLFqp4L/twQUgD
	 dcfB/P5sVHAHMeW+oyfRDfqi0qmV5ZeVnKKL3dTvfLIFb8fX4NwttOYCPJPacUhzZgLUF
	 287F5dAB3ZvgeSWMUUUY1T1RIHbGSkhZel6Hkt37SsYuiwq6m4Z0iAIYcvjCIt62UYBPq
	 BbpL3bbZPYBWIpBxrdJJe8TtBs1tXnRZ5pxd1HymjBnVsHKXb7bN4zobgeOAJDuXIpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="FROH/d5A";
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4DC606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:36:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C4DC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FROH/d5A
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdb628232d2so1582022a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 21:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795412202; x=1796017002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KnMxzhHOEHpbsDB95jN4ZokxNKIXrj2a5/W65iB8kpI=;
        b=FROH/d5A+4MWwKPhgc4NmbqjIc79nO2WpJllGoHK7iggmMjxoUyYnoA0XBG8fe3xGF
         Fghk099M5QeK6zVC0ZudIgN9uAjy5EQAYw5M8fTpwFRLNVFfWyd56IkZJLmU5m4JzLLH
         UUsBUFUaviJVCY66UwyoHBRbh5ljO8W8GiMmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795412202; x=1796017002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KnMxzhHOEHpbsDB95jN4ZokxNKIXrj2a5/W65iB8kpI=;
        b=y08Mg7GyYUXeq+xY5/DHiEcT9miY73Jb2QSbO190bNlyzGnaWT52o+QP0wc/PaDJ4k
         nCKbyBMHcW5iakNyYhRLA0I6bHlFLD9X8fGQMTo5oqI3uP4yPbZp7qxgmJwH1+ODGE0k
         nYXxNVlz6Wtwwx9hKpeRgWZWLhiuRILdIy82uehCmzu67UFc6waWQwz33G9W8K9qflzp
         uUMJaW14NWOe45r1Z/g0KiImTXJCy8p8MI1RgTIEnt09xDjiL1vj3vQPzDsKsnCc2vAX
         kzLWqa2Z9Or/0qh9w5tsPAJRpevqv5Xd1EMt7BTh7FZ119W3LDdys+94QxNFHF2g/pos
         n16w==
X-Forwarded-Encrypted: i=1; AL+hErG+X1kAGEdfR3mZtidJJH6psSUE/saPfXIJiq7GGg+/JkPBEzFkN0+CS0BDK9p0UJ/mhmzZBweAmitvV8o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZmWRQ4EngWNDTEWDl5STq/Vjq1l+BmXh/s7y/gXsECJC2ycmj
	5nBSPHBXhaa/GfNwngMZqMrNbKeaGjgqDpYCvKwDETCdOkipH0g5a1FssQqFAd/qjQ==
X-Gm-Gg: AZFdTZc5+mM5rR1LVVi7bPxzuqiQskDXu7CGMLNBaqTPq8cWt9z0vDxNwrH2xsQGMYn
	NGh+cAp3DostV/yuCgudnM3cNHrJBmKTc39hniToFe18zseI05v0qt8LUE6+unIkGxTi7AKkMoI
	pNrSTlkcP21c9zGO8A4/nWjALA2xXc3R6kx8i2xJQtaR9NlL0CPy6mpLvtZhNiLF3oDWj/ZmZ/u
	lML18nlyNOk71YH0wXSx2zNYKytfcy1ll0UV+RMK3nlanq0spIc47oEYJM1bMnuIL0mBNSJwkyM
	T7/LYCSYEJxTwGGaGhwvCK93c4ClB+ALjvZuHZywSoWMghqLYpNx038xZbNwKRW2ZWxAlFA1WH+
	kosFXLsrlDYWf16Yi9Paky0PFMEk95T/U2NMABfCF3ZO2VQTgE3daI3KMt4xVBkJoUncoCqEtzz
	hXv5MdFvkSI6Mu6lC6dUR0cVDuP37MFmSq1ehDIB4+fLowAYEW4QBKaY7s6JqXIWEdRDAkpJv23
	ERTGqBYBCDnyqufQZCLSxljsr7I954DnVd4mTZ5rNzYEOcDCv1A3A2O6Vg0qt3pTDGqMBxAzXdq
	ZD6Lz5jc6NukbahmP/XN26nXcQ0kU4gVhZEDJNV/RfbfKPzDH3g1yhSQX8F21gUYSRrVCG1UlCr
	dL2Gh6oa9farrnanxxQ==
X-Received: by 2002:a17:90b:442c:b0:3b4:12a9:2e9 with SMTP id 98e67ed59e1d1-3b41c7d17e4mr9833343a91.6.1795412202399;
        Sun, 22 Nov 2026 21:36:42 -0800 (PST)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:d8fa:c511:e415:e0d0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cea7c38sm4636531a12.2.2026.11.22.21.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:36:41 -0800 (PST)
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
Subject: [PATCH v2 1/2] zsmalloc: free a zspage's pages in one batch
Date: Mon, 23 Nov 2026 14:36:24 +0900
Message-ID: <a74aca7a3d27333972782b29786c7b33861a56f1.1795412161.git.senozhatsky@chromium.org>
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
folio_batch is not free, hence the batch path lives in its own
noinline function.

munmap() test:
                    next-20261119      v7.4-rc3
  256 MiB           -2.0% .. -4.1%     -4.4%
  1 GiB             -2.8% .. -4.4%     -3.8%

[1] https://lore.kernel.org/20261109105957.2577351-1-chenhongfeng0212@gmail.com

Reported-by: Hongfeng Chen <hongfengchen@xiaomi.com>
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 mm/zsmalloc.c | 52 +++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 46 insertions(+), 6 deletions(-)

diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index d5f313754934..a1b6161fd237 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -37,6 +37,7 @@
 #include <linux/debugfs.h>
 #include <linux/zsmalloc.h>
 #include <linux/fs.h>
+#include <linux/folio_batch.h>
 #include <linux/workqueue.h>
 #include "zpdesc.h"
 
@@ -837,6 +838,44 @@ static int trylock_zspage(struct zspage *zspage)
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
@@ -855,21 +894,22 @@ static int trylock_zspage(struct zspage *zspage)
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

