Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795754568;
	b=Mmh0z8qSpjWPZgJhiPVEqmUBiQL513WTOnVRqlwWH9Y8LHTOiWAg5n8cB3F5Nd3vTdfk
	 SBjycsnPdgW+XZZ21SIS+e+C5GGo7PSPybFdt4y2sWmwZaYiWY2eWyykaZs/32/tIByoa
	 5EjgV443fOrNGdltmDNObZq7WRdcJhbBUIhN//wArAJjK/kLI50olmS3nB2CtXFQuFb1g
	 UzV9SjJ70N0TG1/9K+v2zw0EfOO0EGHDWlqyxLPCbqpeKdxsfIu5Kdh4ObZ0TsmNk/BZb
	 K1YBzZzvCFauHpPJYQnWy5h9VhPv5l9hP3AnGd6xp4eyYR5Egr8tNsMwsbDGL3WpJgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795754568;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wxZ7OEfgfNDev33xHGMi4UZ3Y5PX0atgS1FE2+4Ewsk=;
	b=4k1rIRlgIfEClktMMomeQgd3O5kTSPw10Xgn8Fu/UMMb4wmw1ve8cflmxzrET46M8Q5+
	 8anzJgsxJFdZyl4z9cLGQQZEeLj+JN9KbO1ByAqOlU03XvJJpQogvqIlwEAwucns/h2ZX
	 gxdF5V73ktroIlxQZxmX/yVvnZh/W1K9TK8UWNaaIqhKDwpZsQhqLGtRQAwhnVUzz2Dcm
	 SW3QsHnXQMf1rRwCWr/6Xr1k8fqDM5YGGtVJOrL/K6GrJ9oMXy872GYhaqQzlcGPoJJWd
	 zJoFiVPtb23UPmmug/X3As86lrKnkWmN92936jQ2tCFrE6zxoS3mpXTYuKsWZFIz9cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SKdtRHKq;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C36E606A6A7
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:42:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C36E606A6A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SKdtRHKq
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so6616096c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 20:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795754566; x=1796359366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wxZ7OEfgfNDev33xHGMi4UZ3Y5PX0atgS1FE2+4Ewsk=;
        b=SKdtRHKqEzzbkxcfdiFHUW7uTJ+Tgd8zE3Ei7lV2IlwyFKiFuFAJb0qZBAx9XtKqUG
         tkKCznQB4nBr333OfZypYop4OUl0cGTc0zTHDt+Rsmv+DGDntmn6gmLg/AJda52nc3RE
         wXOEtmu5037CJgv/hoqkBXCFYOJucatmwNXimhGJhzzzwhj/Z1+YiZxGMCz8zqzGIF1j
         XwpiFv46n9jSva0VTsc3nub/oFEx+084T05WjZ1Unq9i/bJIeyw47H+2Cu9FaLa0uvbO
         Lq4luoPEytzlCmFDuxMP+lkszg/oHsWvd71Gdtbls1rDmqvizihHC5leV2sqoBrYnIQl
         tJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795754566; x=1796359366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wxZ7OEfgfNDev33xHGMi4UZ3Y5PX0atgS1FE2+4Ewsk=;
        b=fqBrN8FL3k0Eza0FX4gDunelOKnG3t5l/J0xoLvGTyj7iCGrUOQt2+p67t7CaDUv4h
         Au80Q3J3w2q41kDrUGHEJNh24omhBAgN8XOwn+rhEjcQVaVG7tB66TbeomPE8va4gQMp
         YAgKfYeOzRINiMlKe7JWZjNYBF9armzAnCsGw1X+JvBgkz1tXgeiMHD6UWWtxNer4F7I
         NJImw/usp6foxifvMl4qHlzLrL6e17dIPznRwbHTaDrc3VSJbHJTTQYIcrRZHaE8VV8n
         Y52MQbj/0bfblII54blzp0uTEzUmEFVYADIJ9XX+vKtxuRghdccPxJLBiZm9Qb6lAI7o
         e0EA==
X-Forwarded-Encrypted: i=1; AL+hErHIXtqzT/uyX9eT/V2Tcv4HvjPYTSeR8hO/gyNobd6Qd6durxnwUPwbwp1xVUGO1N0CsltjE3Hjhv6Bf94=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oR2fHGWqYAH8ZCQlaXx+8v8YNDidcpS7LltSrdzgc4wI4YhIW
	K4of/0LiUyPikUfYvgAPyHv+wemMO1J22cUTBA2sUGoZYM/e2gBolxmCzsP1MA==
X-Gm-Gg: AZFdTZfDcxIGWVfaoTJybESEiyI8wCZhweWfkHaxK79aBGi3VeSozEpqRN6M8mNf100
	MYiPNXProABJTVfWn+OanB83v1W2pgA22pRYK01cL8Gqb+0T6GorehRRbEkczNJcDqpNi4LCYy4
	ZSH+ruefD56DpViYNdcISnfANrlsuIV/t1aQF2qMyuC7fM4ULmpdJDGSnINIR3ohgf3ZG/IwgoU
	wcX5I1TtdhDPsup4t6PVganHJ6HWg8N3ElrJyCcXRwPGF+AoCkIYg8WwjMdRHgJY3LMpzuhQaFc
	zLhtdP9Y7BQ5N2qlu26BCmPumTqW8VXjBbNnrOK92Xs2+US6fF6ihjcGmaYvL4915HHWaJnDtKz
	2syMxAIMjA4qgro743GdbtodZIR3e5d+AomIIlbAIu/w4ReAHwxI/KMWuvoS7A5wLBdsm75Jr1p
	FwdJ9Wa3CsmHiGPvmnsRJ4UwdyeEEXGVq8x8uJqH0Bm/6xmg3tfrredZnxc7lBxWcECPoQ8FCNX
	nnCKyT/OYfC7BATEzUFRqp3CEYi1Ou9pRmO2vLhAyETWbKPH8T3oFlSPFhkgEupmWOlXolIZgkF
	VyTXkEI99A6sH4QLHdVgOW+7Wivt0xbwKgplob30w6vmR31PGe/PaJb8hj+UqmQ=
X-Received: by 2002:a05:701b:4308:b0:1b5:1a6e:1bec with SMTP id a92af1059eb24-1b5568779e3mr22845055c88.10.1795754566197;
        Thu, 26 Nov 2026 20:42:46 -0800 (PST)
Received: from carrot.home.local (madb688455.ap.nuro.jp. [219.104.132.85])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm88000388c88.9.2026.11.26.20.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:42:44 -0800 (PST)
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: Wang Jianjian <wangjianjian3@huawei.com>,
	linux-nilfs <linux-nilfs@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Zheng Zheng <fengaojigui88@gmail.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [PATCH 4/8] nilfs2: drop redirected buffer flag from DAT when clearing shadow map
Date: Fri, 27 Nov 2026 13:40:57 +0900
Message-ID: <20261127044231.37630-5-konishi.ryusuke@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127044231.37630-1-konishi.ryusuke@gmail.com>
References: <20261127044231.37630-1-konishi.ryusuke@gmail.com>
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

During garbage collection, the nilfs_redirected flag is set on buffer
heads in the primary mapping of the DAT inode when their blocks are
frozen into the shadow map.  Normally, this flag is cleared when the
DAT blocks are written out, so it did not cause issues before.

However, since commit ce5a5ad1a833 ("nilfs2: fix infinite loop in
nilfs_clean_segments()"), if GC is aborted due to an error before the
DAT blocks are written, nilfs_mdt_clear_shadow_map() releases the frozen
buffers without clearing the nilfs_redirected flag from the corresponding
primary buffer heads.  As a result, stale nilfs_redirected flags remain
on the DAT buffers, causing subsequent GC operations to skip freezing
those buffers into the shadow map.

Fix this by looking up the corresponding buffer head in the primary
mapping of @inode and clearing its nilfs_redirected flag inside
nilfs_release_frozen_buffers().

Fixes: ce5a5ad1a833 ("nilfs2: fix infinite loop in nilfs_clean_segments()")
Cc: stable@vger.kernel.org
Signed-off-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>
---
 fs/nilfs2/mdt.c | 41 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 34 insertions(+), 7 deletions(-)

diff --git a/fs/nilfs2/mdt.c b/fs/nilfs2/mdt.c
index 77dc2be2ce65..91b8455e7f94 100644
--- a/fs/nilfs2/mdt.c
+++ b/fs/nilfs2/mdt.c
@@ -602,16 +602,43 @@ nilfs_mdt_get_frozen_buffer(struct inode *inode, struct buffer_head *bh)
 	return bh_frozen;
 }
 
-static void nilfs_release_frozen_buffers(struct nilfs_shadow_map *shadow)
+static void nilfs_release_frozen_buffers(struct inode *inode,
+					struct nilfs_shadow_map *shadow)
 {
 	struct list_head *head = &shadow->frozen_buffers;
-	struct buffer_head *bh;
+	unsigned int blkbits = inode->i_blkbits;
 
 	while (!list_empty(head)) {
-		bh = list_first_entry(head, struct buffer_head,
-				      b_assoc_buffers);
-		list_del_init(&bh->b_assoc_buffers);
-		brelse(bh); /* drop ref-count to make it releasable */
+		struct buffer_head *bh_frozen, *bh;
+		struct folio *folio;
+		unsigned int n;
+
+		bh_frozen = list_first_entry(head, struct buffer_head,
+					b_assoc_buffers);
+
+		/*
+		 * Clear the nilfs_redirected flag from the primary buffer head
+		 * corresponding to bh_frozen to ensure that the flag does not
+		 * remain on the non-shadow DAT blocks when a GC operation
+		 * terminates due to an error.
+		 */
+		folio = filemap_lock_folio(inode->i_mapping,
+					bh_frozen->b_folio->index);
+		if (!IS_ERR(folio)) {
+			bh = folio_buffers(folio);
+			if (bh) {
+				n = offset_in_folio(bh_frozen->b_folio,
+						bh_frozen->b_data) >> blkbits;
+				bh = get_nth_bh(bh, n);
+				clear_buffer_nilfs_redirected(bh);
+				brelse(bh);
+			}
+			folio_unlock(folio);
+			folio_put(folio);
+		}
+
+		list_del_init(&bh_frozen->b_assoc_buffers);
+		brelse(bh_frozen); /* drop ref-count to make it releasable */
 	}
 }
 
@@ -653,7 +680,7 @@ void nilfs_mdt_clear_shadow_map(struct inode *inode)
 	struct inode *shadow_btnc_inode = NILFS_I(shadow->inode)->i_assoc_inode;
 
 	down_write(&mi->mi_sem);
-	nilfs_release_frozen_buffers(shadow);
+	nilfs_release_frozen_buffers(inode, shadow);
 	truncate_inode_pages(shadow->inode->i_mapping, 0);
 	truncate_inode_pages(shadow_btnc_inode->i_mapping, 0);
 	up_write(&mi->mi_sem);
-- 
2.53.0

