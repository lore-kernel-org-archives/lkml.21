Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.121.53.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795571302;
	b=koheZW3PsEbaw2Jx5cgF/zWLpq5d2pK6/xkpAbWsxbM7qkqVjbb9gjMWUpg7FupxjKz7
	 kZQbBYQvgBY/B9bhtal92cb2TnYZLgiLoCUAUM4p0pEMjJOX3EtpgziLfGpKX0lxhoRyO
	 WswPGTDvAamnMOAB1VVeoP6cpSobFkGc89lKV/apnl7/qxQSSL/sKp76jyOLT6RqNE+mH
	 o0YQmmigAxF61qtfVR9zsk0729A+UDBo1f9YnEmFWvj3tUaf9Z1Rny+jvrr4ef4yvR0og
	 CeQwaR2RS7iW2N3APsCmoUYRqBItBMvx/v3MljE8yExPS01joJJ7AN9wv/Pgrp96oxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795571302;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=G1IbwqDTeq3hKJ+CZm8yxQinCv/5A5Bk1KuwF5ZCg4E=;
	b=YWZubShMmtN7dQN9j8aJZsECZ6Sjn91Lx4YafMUPh+/0NVkV4wV5baMAuTJt65OT5axD
	 O5flgnk/1X3vrCRjqS0Rv0R7lJP9zNtC0fBJdtugqTXBCMdlZbvUMvcZ8iRTjMYXfxodk
	 VDK4rqGiFy/DSUZASo5ZJ83kRvpSrkfTzpiLpAfP08ECHIIYBOj2/F8SeRlshwYcVsJoh
	 U2LubAogiambjY+b/Kh5KAW9hwhfkDKTHqH7yqhDejnjYSAfJ5TEcPEEQxGD3ceyXo5Uj
	 rvi1uEwaTNqRRQhb24pzFpJwq5B1pI1kgOIHsj64QYrQvgLtnCkXFZ2Rv3wVVtogs4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=MeB04GnN;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=QRnXc8Om;
	arc=none smtp.remote-ip=188.121.53.17
Received: from sxplsmtpa04-02.prod.sxb1.secureserver.net (sxplsmtpa04-02.prod.sxb1.secureserver.net [188.121.53.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64715606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64715606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=MeB04GnN;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=QRnXc8Om
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id W26zxdCHW8H3GW27DxX8MO; Wed, 25 Nov 2026 01:48:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1795571288;
	bh=G1IbwqDTeq3hKJ+CZm8yxQinCv/5A5Bk1KuwF5ZCg4E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MeB04GnN2QVYIeJIsSOY53gGUl+RclpDGXD50LFD54n7z2IZM2nG4VpQU6Vw0wQ32
	 zhOhsLYTwbTK4h8ZkROru6uz0hjMklqQoMtb0ofzoiY5jJ9o4pAlKokSW1Fd/Ctl3h
	 UfElaqEQzJq1PJdDyoSVXi0lWqxvOJ35zH24mR2yJvk7rFVjlW+8X+j+9YPCE+y3QA
	 baki5ZWqKwAiwj5u9TVCsdyHl6xsTzn/r0z54zF8rINpjjlBjfHrRF7CI1lQ0koh7J
	 mqdUiM6nADIUZiWMcoc8STccliLxbsmFwu+vshqQ8URAtGp3F37cKgtbSyc8Qd20nQ
	 yHYcbV2MpgieQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1795571288;
	bh=G1IbwqDTeq3hKJ+CZm8yxQinCv/5A5Bk1KuwF5ZCg4E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QRnXc8Om8RLbdTuhM3SEowYfkV0/pBXg/3PxjIIsjMnDf3ef8l53Ul888VuE9cRu3
	 y38+Nge9pq2qKUjEaVgQDyGSq9Ag+4vTeRhEy6ICdYJsJ2Fa5/d3Az9bgFIuwSnzlZ
	 3YxoO8lN6r53oZddI54O5mL4raXqEWEoAeO+c6ozqr1aMWkvQ4vKQIuloZXmrtmXhw
	 ry6oYsYjfllL6OljYB6P+Id5jEX1/4UhPGwu1LxPojoKYo8y/JTyjwmUIPvaF8WDDa
	 OhCobZeXzaQZJrIH4rVbfNXgAYbg92dzoeSvIPgkif6iEz/8gh0z3apDOpe9NnAGeG
	 VNV1ruZt8u6qA==
X-CMAE-Analysis: v=2.4 cv=Cuoq4X4D c=1 sm=1 tr=0 ts=6b063e58
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=blB7sX4d8Brpto9GhyAA:9 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: f14b235bb6be7cf4de0b3bb88ceee690:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH v4 02/23] Squashfs: convert SQUASHFS_INODE_* and SQUASHFS_MKINODE to inline functions
Date: Wed, 25 Nov 2026 01:47:16 +0000
Message-ID: <20261125014737.347231-3-phillip@squashfs.org.uk>
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
X-CMAE-Envelope: MS4xfEZv6j1AIfA4HCzhcTQa62u3M21Db5SbQErz2rpBrbUBa1ccbw4UKwCNMpGOFun3SgWlLVEyemaoQYqjA6ViL9vbOHy4EJ6PHST45SE380VpfjLO5f/i
 ttXzYY46QJ2jSrU3f7EMFCI/bx3MtRNrgjX5wEJOtb/R7O1DF05IKM8oZbCDROo4OqL8hoa+LIc9kEPqR7WtsyHhWLXzfcVN9aeSPWT0cVEmi+YHsGrwfbvx
 z2NSqqn2gi+E+YvCyZlaVhT/KgQQ/BDFouelByiZV9EOHzXnh3xLFppHzs63IVL0

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
v2:
  - Remove squashfs_inode_offset() additions to TRACE statements.
    This is now a separate patch.
---
 fs/squashfs/inode.c            | 24 +++++++++++++-----------
 fs/squashfs/namei.c            |  3 ++-
 fs/squashfs/squashfs_fs.h      | 11 -----------
 fs/squashfs/squashfs_helpers.h | 19 +++++++++++++++++++
 fs/squashfs/super.c            |  3 ++-
 5 files changed, 36 insertions(+), 24 deletions(-)

diff --git a/fs/squashfs/inode.c b/fs/squashfs/inode.c
index 82b687414e65..bc7c81d442f2 100644
--- a/fs/squashfs/inode.c
+++ b/fs/squashfs/inode.c
@@ -33,6 +33,7 @@
 #include "squashfs_fs.h"
 #include "squashfs_fs_sb.h"
 #include "squashfs_fs_i.h"
+#include "squashfs_helpers.h"
 #include "squashfs.h"
 #include "xattr.h"
 
@@ -108,8 +109,9 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 {
 	struct super_block *sb = inode->i_sb;
 	struct squashfs_sb_info *msblk = sb->s_fs_info;
-	u64 block = SQUASHFS_INODE_BLK(ino) + msblk->inode_table;
-	int err, type, offset = SQUASHFS_INODE_OFFSET(ino);
+	u64 block = squashfs_inode_blk(ino) + msblk->inode_table;
+	int offset = squashfs_inode_offset(ino);
+	int err, type;
 	union squashfs_inode squashfs_ino;
 	struct squashfs_base_inode *sqshb_ino = &squashfs_ino.base;
 	int xattr_id = SQUASHFS_INVALID_XATTR;
@@ -128,8 +130,8 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 	if (err)
 		goto failed_read;
 
-	block = SQUASHFS_INODE_BLK(ino) + msblk->inode_table;
-	offset = SQUASHFS_INODE_OFFSET(ino);
+	block = squashfs_inode_blk(ino) + msblk->inode_table;
+	offset = squashfs_inode_offset(ino);
 
 	type = le16_to_cpu(sqshb_ino->inode_type);
 	switch (type) {
@@ -181,7 +183,7 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 		inode->i_data.a_ops = &squashfs_aops;
 
 		TRACE("File inode %x:%x, start_block %llx, block_list_start "
-			"%llx, offset %x\n", SQUASHFS_INODE_BLK(ino),
+			"%llx, offset %x\n", squashfs_inode_blk(ino),
 			offset, squashfs_i(inode)->start, block, offset);
 		break;
 	}
@@ -241,7 +243,7 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 		inode->i_data.a_ops = &squashfs_aops;
 
 		TRACE("File inode %x:%x, start_block %llx, block_list_start "
-			"%llx, offset %x\n", SQUASHFS_INODE_BLK(ino),
+			"%llx, offset %x\n", squashfs_inode_blk(ino),
 			offset, squashfs_i(inode)->start, block, offset);
 		break;
 	}
@@ -264,7 +266,7 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 		squashfs_i(inode)->parent = le32_to_cpu(sqsh_ino->parent_inode);
 
 		TRACE("Directory inode %x:%x, start_block %llx, offset %x\n",
-				SQUASHFS_INODE_BLK(ino), offset,
+				squashfs_inode_blk(ino), offset,
 				squashfs_i(inode)->start,
 				le16_to_cpu(sqsh_ino->offset));
 		break;
@@ -291,7 +293,7 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 		squashfs_i(inode)->parent = le32_to_cpu(sqsh_ino->parent_inode);
 
 		TRACE("Long directory inode %x:%x, start_block %llx, offset "
-				"%x\n", SQUASHFS_INODE_BLK(ino), offset,
+				"%x\n", squashfs_inode_blk(ino), offset,
 				squashfs_i(inode)->start,
 				le16_to_cpu(sqsh_ino->offset));
 		break;
@@ -335,7 +337,7 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 		}
 
 		TRACE("Symbolic link inode %x:%x, start_block %llx, offset "
-				"%x\n", SQUASHFS_INODE_BLK(ino), offset,
+				"%x\n", squashfs_inode_blk(ino), offset,
 				block, offset);
 		break;
 	}
@@ -359,7 +361,7 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 		squashfs_i(inode)->parent = 0;
 
 		TRACE("Device inode %x:%x, rdev %x\n",
-				SQUASHFS_INODE_BLK(ino), offset, rdev);
+				squashfs_inode_blk(ino), offset, rdev);
 		break;
 	}
 	case SQUASHFS_LBLKDEV_TYPE:
@@ -384,7 +386,7 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 		squashfs_i(inode)->parent = 0;
 
 		TRACE("Device inode %x:%x, rdev %x\n",
-				SQUASHFS_INODE_BLK(ino), offset, rdev);
+				squashfs_inode_blk(ino), offset, rdev);
 		break;
 	}
 	case SQUASHFS_FIFO_TYPE:
diff --git a/fs/squashfs/namei.c b/fs/squashfs/namei.c
index 65aae7e2a859..2260a3f05fde 100644
--- a/fs/squashfs/namei.c
+++ b/fs/squashfs/namei.c
@@ -49,6 +49,7 @@
 #include "squashfs_fs.h"
 #include "squashfs_fs_sb.h"
 #include "squashfs_fs_i.h"
+#include "squashfs_helpers.h"
 #include "squashfs.h"
 #include "xattr.h"
 
@@ -197,7 +198,7 @@ static struct dentry *squashfs_lookup(struct inode *dir, struct dentry *dentry,
 				off = le16_to_cpu(dire->offset);
 				ino_num = le32_to_cpu(dirh.inode_number) +
 					(short) le16_to_cpu(dire->inode_number);
-				ino = SQUASHFS_MKINODE(blk, off);
+				ino = squashfs_mkinode(blk, off);
 
 				TRACE("calling squashfs_iget for directory "
 					"entry %s, inode  %x:%x, %d\n", name,
diff --git a/fs/squashfs/squashfs_fs.h b/fs/squashfs/squashfs_fs.h
index b406e52a83c2..6d993531a5df 100644
--- a/fs/squashfs/squashfs_fs.h
+++ b/fs/squashfs/squashfs_fs.h
@@ -107,17 +107,6 @@ static inline int squashfs_block_size(__le32 raw)
 	return (size >> 25) ? -EIO : size;
 }
 
-/*
- * Inode number ops.  Inodes consist of a compressed block number, and an
- * uncompressed offset within that block
- */
-#define SQUASHFS_INODE_BLK(A)		((unsigned int) ((A) >> 16))
-
-#define SQUASHFS_INODE_OFFSET(A)	((unsigned int) ((A) & 0xffff))
-
-#define SQUASHFS_MKINODE(A, B)		((long long)(((long long) (A)\
-					<< 16) + (B)))
-
 /* fragment and fragment table defines */
 #define SQUASHFS_FRAGMENT_BYTES(A)	\
 				((A) * sizeof(struct squashfs_fragment_entry))
diff --git a/fs/squashfs/squashfs_helpers.h b/fs/squashfs/squashfs_helpers.h
index 94edc7f46ae4..afef13cd6dc0 100644
--- a/fs/squashfs/squashfs_helpers.h
+++ b/fs/squashfs/squashfs_helpers.h
@@ -32,4 +32,23 @@ static inline bool squashfs_compressed_block(s32 size)
 {
 	return (size & SQUASHFS_COMPRESSED_BIT_BLOCK) == 0;
 }
+
+/*
+ * Inode number ops.  Inodes consist of a compressed block number, and an
+ * uncompressed  offset within that block
+ */
+static inline u32 squashfs_inode_blk(s64 inode)
+{
+	return inode >> 16;
+}
+
+static inline u16 squashfs_inode_offset(s64 inode)
+{
+	return inode & 0xffff;
+}
+
+static inline s64 squashfs_mkinode(u32 start, u16 offset)
+{
+	return ((s64)start << 16) | offset;
+}
 #endif
diff --git a/fs/squashfs/super.c b/fs/squashfs/super.c
index 5dabc5770f1b..0e511dd29d58 100644
--- a/fs/squashfs/super.c
+++ b/fs/squashfs/super.c
@@ -33,6 +33,7 @@
 #include "squashfs_fs.h"
 #include "squashfs_fs_sb.h"
 #include "squashfs_fs_i.h"
+#include "squashfs_helpers.h"
 #include "squashfs.h"
 #include "decompressor.h"
 #include "xattr.h"
@@ -286,7 +287,7 @@ static int squashfs_fill_super(struct super_block *sb, struct fs_context *fc)
 
 	/* Check the root inode for sanity */
 	root_inode = le64_to_cpu(sblk->root_inode);
-	if (SQUASHFS_INODE_OFFSET(root_inode) > SQUASHFS_METADATA_SIZE)
+	if (squashfs_inode_offset(root_inode) > SQUASHFS_METADATA_SIZE)
 		goto insanity;
 
 	msblk->inode_table = le64_to_cpu(sblk->inode_table_start);
-- 
2.47.3

