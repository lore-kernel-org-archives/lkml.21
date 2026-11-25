Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.121.53.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795571301;
	b=Rf0hBcVe41tmowHar37ZmCBiNIlk7iltVKg6eCI9ZYoasRMoOJhKWQvj1JzT7dUOrTDE
	 jQ72NawqWm4Bc31hgBetlMxQ+07qjWtkAJT5Bl781FTeW/gZnkKdpCFX3i+LTYEGPtvur
	 zyMJgTiR01PEjp7iG0IIsv75ZkIkfHRhdQYDySbpqqduBz67b0GW3th7mAq5u9ZhEbv7r
	 Z8s7JwIeJbJeU9H4Pf06xp2xGP3SSJLiMSLN/qzR2cj9MzQgHhEp4BFylj7/GaeNrMbEB
	 qQeTV4qctsNT8MfA2LnWhwcQNTd+ePLl7J9cjvs51qnZC7rv50AY5L/A0gcJZLRwk1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795571301;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=1h3X6RpCF0OfBgICFxXNRKGQx+0azyHiA/za5C0cZRw=;
	b=4jXQ9xCCtzUVl6mxS7VDEuolWI9yzNQ2RH0wD9OLJRaCd91lF+ff588lrASIwD2UHy/k
	 T7UdOXN4q6S9FKui3AIiIiYxeM7ufmn7jyj5SxsOuoXkJyVeDB1SdqdC0TAmquSGj6zyL
	 /EQCEd6VfMG8cN0F13/jgVKP/sXfkK32OZRAHV3OrbaCE6VcU69qAnGi+kDxW/ZoUg2FS
	 x5LyWiCQ2hkM6AZFOy0JpBirYZd9PpHI9gmBKE4KAwQOusTG0h7DS+rdZEPLWWT7V4aRB
	 xu6O1rw6JHBMhjC7LEgn/DSiGq4xwRtPdEaZ5gnIt3WgPIJPvVwvH5j7Qjy1QBIbQqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b="Hu/l3h+q";
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=gKMKSaGP;
	arc=none smtp.remote-ip=188.121.53.22
Received: from sxplsmtpa04-02.prod.sxb1.secureserver.net (sxplsmtpa04-02.prod.sxb1.secureserver.net [188.121.53.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DB3606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:48:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1DB3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=Hu/l3h+q;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=gKMKSaGP
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id W26zxdCHW8H3GW27BxX8MB; Wed, 25 Nov 2026 01:48:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1795571287;
	bh=1h3X6RpCF0OfBgICFxXNRKGQx+0azyHiA/za5C0cZRw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Hu/l3h+qCWqDvWo6MxvGO3whroj2nDgm7hKulX2+YFm+VB4diSAA8ozHhPnzr9aSH
	 YLaFu2F77hNfvr1qtiMX1j7vwc8S87TVTtWA8ljcWV1dj4dPD0vZX0C162AUk8Pi9b
	 sxjM9Li9Ezy5HNAmNtwOUcr2YVCpynIDsBr7F8we/wz4jH3dY1/BhY5BLAtNMNUnHx
	 tCqJ+7nG+i5VYF273bqweyAwy67A4BK4ttR+Eeo65ziPPyok5tj81KPN4MKT2eP65c
	 R8H77mgzp13DCbiJhJCuSBH621Ts9dO+dB9zxyJrsxlMi5nrT1BsRLb9gQpK4qhHfm
	 eV8gKBjb6EAqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1795571287;
	bh=1h3X6RpCF0OfBgICFxXNRKGQx+0azyHiA/za5C0cZRw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gKMKSaGPyJOCSr4M5v17iWE9Vk2jPJmKWHZR9QnA5C5e5TNHOJglQBDr3ySz05OvO
	 NDUXZYZT+vqMDugsjSKTcMfPIzEjt6hewMe+M5Jaw/BmBOyjYuVAeMpVyxEg0qYJg3
	 +Jb6ODvlwFhSdp3RfirUHZWbKpU+drUb9mBR9pefb+laCyGrF9O92w1x1mcaDDokKj
	 4kqXhtKs7tqTHfz48TQMVZinu91HAGSWTThCdxifEqXYLqdHseZ70edvktw09Y6EUK
	 VYGVaNwW+gr/yIpInNROG7V/IBRAqtJ1EvINw2TuaDWj/oE1sFSoMJLzsdyQoDkstz
	 D2aQVoEAGeqGQ==
X-CMAE-Analysis: v=2.4 cv=Cuoq4X4D c=1 sm=1 tr=0 ts=6b063e56
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=sSupuuxbErciYv1SbbcA:9 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: 0cec424a797bae199a204fc31d362ac6:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH v4 01/23] Squashfs: convert SQUASHFS_COMPRESSED_* to inline functions
Date: Wed, 25 Nov 2026 01:47:15 +0000
Message-ID: <20261125014737.347231-2-phillip@squashfs.org.uk>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125014737.347231-1-phillip@squashfs.org.uk>
References: <20261125014737.347231-1-phillip@squashfs.org.uk>
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
X-CMAE-Envelope: MS4xfEhqQoyDPMkYTWLIlmtuYCP/4r6zJefMu9lAqBgtl7kyobw+8FXKBmRhFKQ9vsp92ZcMK9R1NpcWNU5hVOiRSV7YjLRvQSscQ9VuKDxGab+v+9rnZzqY
 3IYd66WV6qhjaWHhkXo8GDNqbYTJPI4TDge+7FOtro1INbLQ3pcuXwbgt0QDkwmlW7e67lk+922K1xZ1HzSbftJog5uJXD8Wn4MbKqZkJ9mcG3L80pnqiTOw
 XQj+e8bYJWdNe5TqQE3vA/vE0ug5GXYZuD6YXXfQkQTJlBEV5ZS2dyotSoIOEKhk

Convert old fashioned #define macros into inline functions.  This has
the following improvements:

1. Inline functions are typed, which makes the width and signedness of
   input and outputs explicit, which reduces errors.

2. The inline functions enable more sanity checking to be added in
   later commits.

3. Inline functions are easier to read than #define macros, which
   improves code comprehension.

Signed-off-by: Phillip Lougher <phillip@squashfs.org.uk>
---
 fs/squashfs/block.c            | 11 ++++++-----
 fs/squashfs/cache.c            |  1 +
 fs/squashfs/file.c             |  3 ++-
 fs/squashfs/squashfs_fs.h      | 17 -----------------
 fs/squashfs/squashfs_helpers.h | 35 ++++++++++++++++++++++++++++++++++
 5 files changed, 44 insertions(+), 23 deletions(-)
 create mode 100644 fs/squashfs/squashfs_helpers.h

diff --git a/fs/squashfs/block.c b/fs/squashfs/block.c
index 2d5850168026..20c3030b4f96 100644
--- a/fs/squashfs/block.c
+++ b/fs/squashfs/block.c
@@ -23,6 +23,7 @@
 
 #include "squashfs_fs.h"
 #include "squashfs_fs_sb.h"
+#include "squashfs_helpers.h"
 #include "squashfs.h"
 #include "decompressor.h"
 #include "page_actor.h"
@@ -292,7 +293,7 @@ int squashfs_read_data(struct super_block *sb, u64 index, int length,
 {
 	struct squashfs_sb_info *msblk = sb->s_fs_info;
 	struct bio *bio = NULL;
-	int compressed;
+	bool compressed;
 	int res;
 	int offset;
 
@@ -300,8 +301,8 @@ int squashfs_read_data(struct super_block *sb, u64 index, int length,
 		/*
 		 * Datablock.
 		 */
-		compressed = SQUASHFS_COMPRESSED_BLOCK(length);
-		length = SQUASHFS_COMPRESSED_SIZE_BLOCK(length);
+		compressed = squashfs_compressed_block(length);
+		length = squashfs_compressed_size_block(length);
 		TRACE("Block @ 0x%llx, %scompressed size %d, src size %d\n",
 			index, compressed ? "" : "un", length, output->length);
 	} else {
@@ -341,8 +342,8 @@ int squashfs_read_data(struct super_block *sb, u64 index, int length,
 		bio_uninit(bio);
 		kfree(bio);
 
-		compressed = SQUASHFS_COMPRESSED(length);
-		length = SQUASHFS_COMPRESSED_SIZE(length);
+		compressed = squashfs_compressed(length);
+		length = squashfs_compressed_size(length);
 		index += 2;
 
 		TRACE("Block @ 0x%llx, %scompressed size %d\n", index - 2,
diff --git a/fs/squashfs/cache.c b/fs/squashfs/cache.c
index c1a83bb0e519..7cb16414cd23 100644
--- a/fs/squashfs/cache.c
+++ b/fs/squashfs/cache.c
@@ -42,6 +42,7 @@
 
 #include "squashfs_fs.h"
 #include "squashfs_fs_sb.h"
+#include "squashfs_helpers.h"
 #include "squashfs.h"
 #include "page_actor.h"
 
diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
index d83594ce91d2..ad6382cd22d3 100644
--- a/fs/squashfs/file.c
+++ b/fs/squashfs/file.c
@@ -39,6 +39,7 @@
 #include "squashfs_fs.h"
 #include "squashfs_fs_sb.h"
 #include "squashfs_fs_i.h"
+#include "squashfs_helpers.h"
 #include "squashfs.h"
 #include "page_actor.h"
 
@@ -188,7 +189,7 @@ static long long read_indexes(struct super_block *sb, int n,
 				err = size;
 				goto failure;
 			}
-			block += SQUASHFS_COMPRESSED_SIZE_BLOCK(size);
+			block += squashfs_compressed_size_block(size);
 		}
 		n -= blocks;
 	}
diff --git a/fs/squashfs/squashfs_fs.h b/fs/squashfs/squashfs_fs.h
index a955d9369749..b406e52a83c2 100644
--- a/fs/squashfs/squashfs_fs.h
+++ b/fs/squashfs/squashfs_fs.h
@@ -101,22 +101,6 @@
 #define SQUASHFS_XATTR_VALUE_OOL        256
 #define SQUASHFS_XATTR_PREFIX_MASK      0xff
 
-/* Flag whether block is compressed or uncompressed, bit is set if block is
- * uncompressed */
-#define SQUASHFS_COMPRESSED_BIT		(1 << 15)
-
-#define SQUASHFS_COMPRESSED_SIZE(B)	(((B) & ~SQUASHFS_COMPRESSED_BIT) ? \
-		(B) & ~SQUASHFS_COMPRESSED_BIT :  SQUASHFS_COMPRESSED_BIT)
-
-#define SQUASHFS_COMPRESSED(B)		(!((B) & SQUASHFS_COMPRESSED_BIT))
-
-#define SQUASHFS_COMPRESSED_BIT_BLOCK	(1 << 24)
-
-#define SQUASHFS_COMPRESSED_SIZE_BLOCK(B)	((B) & \
-						~SQUASHFS_COMPRESSED_BIT_BLOCK)
-
-#define SQUASHFS_COMPRESSED_BLOCK(B)	(!((B) & SQUASHFS_COMPRESSED_BIT_BLOCK))
-
 static inline int squashfs_block_size(__le32 raw)
 {
 	u32 size = le32_to_cpu(raw);
@@ -449,5 +433,4 @@ struct squashfs_xattr_id_table {
 	__le32			xattr_ids;
 	__le32			unused;
 };
-
 #endif
diff --git a/fs/squashfs/squashfs_helpers.h b/fs/squashfs/squashfs_helpers.h
new file mode 100644
index 000000000000..94edc7f46ae4
--- /dev/null
+++ b/fs/squashfs/squashfs_helpers.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef SQUASHFS_HELPERS_H
+#define SQUASHFS_HELPERS_H
+/*
+ * Copyright (c) 2026
+ * Phillip Lougher <phillip@squashfs.org.uk>
+ */
+
+/* Flag whether block is compressed or uncompressed, bit is set if block is
+ * uncompressed
+ */
+#define SQUASHFS_COMPRESSED_BIT		(1 << 15)
+
+static inline s16 squashfs_compressed_size(s16 size)
+{
+	return size & ~SQUASHFS_COMPRESSED_BIT;
+}
+
+static inline bool squashfs_compressed(s16 size)
+{
+	return (size & SQUASHFS_COMPRESSED_BIT) == 0;
+}
+
+#define SQUASHFS_COMPRESSED_BIT_BLOCK		(1 << 24)
+
+static inline s32 squashfs_compressed_size_block(s32 size)
+{
+	return size & ~SQUASHFS_COMPRESSED_BIT_BLOCK;
+}
+
+static inline bool squashfs_compressed_block(s32 size)
+{
+	return (size & SQUASHFS_COMPRESSED_BIT_BLOCK) == 0;
+}
+#endif
-- 
2.47.3

