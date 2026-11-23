Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795412876;
	b=2ZHIpCe2ZTfM3lzFUt/G/mtJ6YkzdlmhuUMNK3EL1d1WGaqKmlHt0I7ChH2hWOEJOl9/
	 ibQcziRoXpvtXcmd+Ji7i4jNhjuga+Cr+7OXXc14zZhqnwc1vMQCU0aDaeSocGR9N6XDN
	 lKwaK4NPTAAG95DiLcKvL5Kn63bNY7Ef31BGKit36r/EwshdBfIjJogYbO1iO3UmWuY9d
	 uQsJxqTUe2dPJ0FsG6vjNSE5a9XtXAXNNcXmoKOxPOIZFUFW72dSyZbSTTrE8ScDV+ajs
	 R8mOdVjTeRiLNiW1YpfD32zFjV9/y0AxlvrfcAzEqT5r+q1TvkBG09kDMJd8qHXa8dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795412876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KnMxzhHOEHpbsDB95jN4ZokxNKIXrj2a5/W65iB8kpI=;
	b=F1P9vGLf7SqWK819TWqXkZqpXKi97oZDaI0w+ApcZ+z63Zvc5iT5vj+ajLDqenHSSSVZ
	 Bz3tx9MI0ixNfWBDVO2zJg2NMQEF/FrAyJ+LhaJ+6FMW93KwX6BVh7YfmR/Kn0LQ2XzsB
	 safn2lJg7UvUywv9lJhYudNHRoZvDFeUPQadAVx8st50OiWzyCBS6xhCyRQ0cfHMeXt7J
	 k+Nmf9kUuR7+9slhhLEsCJU7zvj7qHetbhf5UGgtbPGVsl2Ebgte1/InwiPSCPaNkySAY
	 JLmdN+5JC52HTA+q3BOTnlvIoS2hKRPAzEvTmgFLTh0qqrLnwe3QTB26gKkpJuKo9og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SuKnBF04;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27673606A334
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:47:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27673606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=SuKnBF04
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cde7e8abf9cso602244a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 21:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795412875; x=1796017675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KnMxzhHOEHpbsDB95jN4ZokxNKIXrj2a5/W65iB8kpI=;
        b=SuKnBF04Inopcx81Wt0h0PDp8wyaQDzpDWTE8Wz7JjCu1Q4qdNQ8x9zaSN4XfC+9Cd
         ax+hJPpgQUCCtQuprcaXuT4ecPJqQ1j30188HeB8QsivXQqPjDCzEoTFkNl3MMsNvQXT
         G2BTu4jjA+DsRpegdwgMMrlOO37N25OPX2qnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795412875; x=1796017675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KnMxzhHOEHpbsDB95jN4ZokxNKIXrj2a5/W65iB8kpI=;
        b=z8j1hATQ5QzJXI1LywrbEyYQ8icCgnX+qsh8qZExsdvokeb5Eukmd+FCsGXhE9Ntbu
         kXh6C5tYHaEz56DMMFt/34Kf2fodv6uTY4DyjG0JBOg1K3Vyf8Xy9T5jBGDyElsjhGXr
         4g5Xt89rMiA3frFZvIs+oj/pFv8eU+HcSPnyDGlpOvzzS1VzanZzTzjwV2RP53/9R31Z
         VY4e5mQtX0xrHiaEK00jW3D2txvME2JK/BEi+oARCjkfWqx3uhaWdxuhKJ7b70VwKhxX
         RjCEcxIkVR6w3JEhBOudvZfD0AtdfinkdekFewYp2UjO5lf5D2jKTBjSSZxdY3L6XZyK
         gAiw==
X-Forwarded-Encrypted: i=1; AL+hErEWK0gHJlZUw5gDS99ou5b7NhsOPYoOcr9HGShpQOo7iUfShY9abY+TgtPFah5hHMxh0XPHfP7tLQeyy9g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OAoln3FJji75EXz31+RcRX9V6Xq8dUNoGyWF8qYmatZP/eLhp
	N5kvC+ti5HZLtgw1JV8RLMl1/JFTEd1DTzyNHPRakN0z4LuD+Yy08iwtBYd1D2TIsw==
X-Gm-Gg: AZFdTZevSNlZWa+EGekP38KHluLEJuo8Zbl8ivt70Kt4CD1CfkQQo19Fo4wxCYPGVIv
	b7bxr57sShWjsHplxcejpgEYrgkPc6P7F6Z+f8Ij4iRL0hsQRs2VT8SOueD18d5amEq8uIvJzXm
	WDr7EQe1UuEsV8MIv9k5q8+vQBS2KVIqfQxCBbk9MU+NmhFhF1u35wtyCjw9zYfBPcthmzYcI/G
	nuZxNKn0in2NKWG9T0Bjjr0Yy9PEkGpGusCAomE7K7+GnbqXCWrUJt7DWkdgpsmadLc+Igcv6tO
	D0NxIM7Oyc2Z/y6giEW/WF6aNXq8BLsSEzJqg/EVJH/vG0dVagItZk60tGerXBJ9e51jXyt/uw1
	5gSN9y2fNxnctLJxH1pMG7t4JnZO1F1cz8bDYGO1s0iZmhSzTaryn37/pJXjq+ffwPwW9TYUhQl
	3pBjxJyRPGjeLxOIYd0ftKsszYAUGthFnDRzAikS/Q8TocFKms6841ia+Vb+fd5bICCRUYJepX1
	ksCA/Bzg2g+EBjPgjtNS+HdG7Uzv02Pq4QCX2FIOWkyTMwH4SC7CeTg5gSP2BmY90Iayt0p+Pvf
	5fMAHcreLhX5XP90TzJq5RQPXCP5WmVieHcTvLVorVmfHBSIZ2PR0cQBnNtIzvm9yfS2bktQpgc
	XBFjzgZxmlgoOJJXBRQ==
X-Received: by 2002:a17:90b:3f0e:b0:3ab:1481:69e5 with SMTP id 98e67ed59e1d1-3b41c8ffb06mr9953948a91.11.1795412875450;
        Sun, 22 Nov 2026 21:47:55 -0800 (PST)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:d8fa:c511:e415:e0d0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad92c07sm16240267a91.13.2026.11.22.21.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:47:55 -0800 (PST)
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
Subject: [PATCH v3 1/2] zsmalloc: free a zspage's pages in one batch
Date: Mon, 23 Nov 2026 14:47:36 +0900
Message-ID: <20261123054746.2579253-2-senozhatsky@chromium.org>
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

