Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.121.53.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795405422;
	b=Waye6k20iOl0Ld5xlkgJE94SiHW6YuX2Yjw0vIeJ/mAS/WVE+FmoEN98piVJ2nmy7YOj
	 dGB+h6K7DbZSQ89SVephliXell//CW7kHmCDIPeiJ9QSKyrkWjsOXPczH8cHy1tTM4PVQ
	 mxxMdepAR6hzgJFkxan/WptF0gfVQ5g0aBpoAxHsMlF/k3s7EfFYp+C1qkVbyojnOuGGS
	 BYrSuX9oV1omE6KOS8gYpC2nASm94A7/iBHTS18wjONvIn8/FfrYcgl7shEtGKu7IrFDX
	 l6JYzxRzAtU/8Vt00Kq9Ba6K3jHcCZ525VdAak/wOxvJ+SO3LSwnSv40QG3+Bmj8ihw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795405422;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=1h3X6RpCF0OfBgICFxXNRKGQx+0azyHiA/za5C0cZRw=;
	b=PVR0TgrSg+C1MOJMLxnoANZ32toPB8/3i4L5oYpxyaCxo42ieCjdopGmFSBMJKjGUFyU
	 eSPK5O9gwaUN8UxwHo2jybgyppgqeNcpVDraofT3KaCGsJ8MgVl1gHmWcmnaXcySRpXzt
	 Vxxuw9BCYkLkBN6QZtweysEb4H2V5Vls5ZmMhX2CWcs6lRoljcWxocXoPhG69El2A0JYZ
	 FgloCeR+G2KzPqw99mfWIP1S6+i0lgiMX/klNVD01uJFeAl5BYXhHJCY9uVBLJWG/h0cX
	 tyeNQr+8zyixS7+QQbzGjGpqmEH2Gr30gArjJjGvsmJrboeXARhAIQRFzhNfy5TXYNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=nzPK2L66;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=WMBZvbNB;
	arc=none smtp.remote-ip=188.121.53.43
Received: from sxplsmtpa04-04.prod.sxb1.secureserver.net (sxplsmtpa04-04.prod.sxb1.secureserver.net [188.121.53.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFC4606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:43:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AFC4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=nzPK2L66;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=WMBZvbNB
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id VKxRxJoOeZuU3VKxixiqPo; Mon, 23 Nov 2026 03:43:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1795405408;
	bh=1h3X6RpCF0OfBgICFxXNRKGQx+0azyHiA/za5C0cZRw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nzPK2L66ptjZ7DdoWCN1Ph/ySMr1pzED/KOJutghdqFy+fqLjckkFj4DH1omtCqfL
	 nWghkdbQpU3dw0LXGj+vyHQZtS/Swc0y/NCS9K/a0VxeMoJOqKR658/vGpZHixOIat
	 TgRuh7AZi/OIfSAc93b4IqQ4NGO2xrX8WtGX5+wlpvDdj3CpeNkJQI7Rjf6GabcDNs
	 5XMz7+/P8LXpG/mEFsZlo/SMEgzY7P0t+ZUKnfeNhYjG8fVtlrLlWpERxVedWWc2su
	 XMsDsIkrkzBWkO0JPeyPrdxgDmH+s8mMq//G/wPldRmxaUfuvji+v/YJr0c08JLVmb
	 zpS6NyTstl9pA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1795405408;
	bh=1h3X6RpCF0OfBgICFxXNRKGQx+0azyHiA/za5C0cZRw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WMBZvbNBZC20tAt1s6O0XtFQC6dl5gAJwOubB4BP4CiJGO6SOP0YFzSZ9JgjRQpcV
	 l/q2hGQLqek70iDborYNg4L11FHcM+m9Hrui25SnNwUKR08skC3Fl8hGu4iGycFDLd
	 XJxmW3Qcglq03Bv5hWAQJJSQRpaG1rDyUkYd88aKZmn7/9hfzfdLg+/YxWFVT8Y5h+
	 JnJO4oX4WUO7++3bB29Ic1Af853EbceuW11KiXUkCHxzuaZRXmlCM3E12JdxaLDkGA
	 jO0egSHXW4J7ApV+CKgKaaycIYBZrkxx74XpVFeoqmOUfqprugyXmGsyQUymwqjioz
	 aUaW7J0KvLP0Q==
X-CMAE-Analysis: v=2.4 cv=CvYq4X4D c=1 sm=1 tr=0 ts=6b03b65f
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=sSupuuxbErciYv1SbbcA:9 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: 3e8f7cfad0b2acc3369648ed5df84c1d:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH v3 01/23] Squashfs: convert SQUASHFS_COMPRESSED_* to inline functions
Date: Mon, 23 Nov 2026 03:42:42 +0000
Message-ID: <20261123034304.261742-2-phillip@squashfs.org.uk>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123034304.261742-1-phillip@squashfs.org.uk>
References: <20261123034304.261742-1-phillip@squashfs.org.uk>
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
X-CMAE-Envelope: MS4xfOsXlsI1pLDlAwYq1vCEL1d+GnWOZmnqXggxxq3XEKYxKBLj0rVIcMkBoh2mBEeiLE6UI0QdUIMsgFuz+oQvH+UAH5IDnyIuLmY3t4bxxHjOVYwPNMWG
 49NERLhdAelT1k2CBJaKHPiPUbDHlEDn5GOwfpXxLYqNN934pDjsxInLCK/Y4J/MxSO5P2sayeSFiNSPbwVCQhwqQeC00jU+FY83vZy4xUup0lrToiUkq4ec
 DYygx9eQY5nLQLODWlgqDf+XVmFfUWSDqm8LenuwXgQUtg9Kjx/jGeVtjBsB7R04

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

