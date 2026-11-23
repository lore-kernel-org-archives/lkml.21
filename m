Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=92.204.81.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795405423;
	b=0402OHAow/A+TOqJZGnay6pb7TPmthYrPmRZeMg5pmSsW3xRDgDLzRc+GUlXRsDotdZY
	 WzkS6AuePzCT44QsG+KZT0JAvAJ6PdfYRp4YANZ4Mmg15ef8Ac+EWUuVZwloTOBrqBPei
	 tVmaFMrvFsyrWO6Nckwv4OUt8XKy2QpULfyDcKWSVp673I5H7XVmLsQqFVkaJHc9xYCXx
	 GubmcPIgpAYRfD0zCx11Op2UHI+wzEdeOYVQxXhJFtMX7wbUc58KW9/4tALx3SnTZmVRh
	 Fj5Y9J/O4b0xc+hLZfhu0vHDRDDb8TjTsASMnNVklJxRE63fcFDsFagJw3Do5ePkS8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795405423;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=G1IbwqDTeq3hKJ+CZm8yxQinCv/5A5Bk1KuwF5ZCg4E=;
	b=j4K4tcVb1fdotfYz62DLOkbJdz0/T/RWvF47r1GwKfhDZ1I/QqT0B51sfoiGaJPvRDR7
	 nh9sN/GQ6JN26kx0O6PZ48BiEYyanLpE9G8sWVAN1+sJVPFraZqCW8hksSjuT1kYmwQp/
	 rEAkg4db87tQrpeW3yhfWmEdKcWzOhX+qtXN8vW5zmyaNFrYuc5Rl3GVlHposn/ZvD0Lo
	 JK1yNpWszIrSnefhj751WFytkap12eEE44TgI3PhrBM7jkXFPXvQYO0Yrh8diz9rOY1jJ
	 7VkEaqKk2ucg309Go5e+Iq3eUsIEGj4gw9PE9TvgkO4ZpHlp49FqtTScFo6BBu3Fw9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=h56pV5CT;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=f15mgTbH;
	arc=none smtp.remote-ip=92.204.81.45
Received: from sxplsmtpa04-04.prod.sxb1.secureserver.net (sxplsmtpa04-04.prod.sxb1.secureserver.net [92.204.81.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B20606A332
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99B20606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=h56pV5CT;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=f15mgTbH
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id VKxRxJoOeZuU3VKxkxiqQ6; Mon, 23 Nov 2026 03:43:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1795405409;
	bh=G1IbwqDTeq3hKJ+CZm8yxQinCv/5A5Bk1KuwF5ZCg4E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=h56pV5CTKs7X69IQM4/zPde3T19qphDMLQLVnIeYyw3RJjRsMg9NTP+NOwnvPUr/h
	 7fmJQT3LC0RWXCtPSma5qle8Xy85jZwOSCg3DLDbw0IswN0FwsFHj05s5veGYQz5Qp
	 KI9Ak5DB16aqTxmS9j1MO1H3bEV4H9bH18gQQUfbJ28g34Kk3GwpgtfWnCpnQeHtNd
	 l/CXv2P1wZl+PcFWWcccwKfTuSDkZJzAYWkY8rjIee4KpzTKUDDypJX78zJvbrOvjB
	 H36hZrGCQ1TOya+Ma5CEhXigYjCkNHUjKu3m4oYfVnTO1JNdU5JZni14wsVEHvKkd1
	 tmdqFBiJB0zlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1795405409;
	bh=G1IbwqDTeq3hKJ+CZm8yxQinCv/5A5Bk1KuwF5ZCg4E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=f15mgTbHxDPBzRHvAepvqzwX6nLiOpS/e8l6ZQaJf80AWaCYuHb6k32aiBYBVVKA2
	 t/iDsywPzFWIEVjkk2NPCjG3BvOue+b2DKDXA3XIMZvGf2KRvatQbeQ5mxrN5UudRR
	 lp/qKscp8wBbeCrITv+ASMYxtAWVd4lNAmhTleP+SDEF4Mvs74QYaPGwvMzrQh3Cq8
	 lDOiXSZNFD9SA0V3Zqu/gvlfM2x0+KXQ1YJwBgoNPu/Zcwx5+9xeIcVIFDRkuze1Az
	 58QXP6ZQhGH4HSjmdNmjIU1+nVG3AiYZVIYZMkbzB3vGVW9d2QwndNJ5jV53m32PYL
	 l+lkpHFXmoWTw==
X-CMAE-Analysis: v=2.4 cv=CvYq4X4D c=1 sm=1 tr=0 ts=6b03b661
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=blB7sX4d8Brpto9GhyAA:9 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: 189e7cda0857392097587bece6283094:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH v3 02/23] Squashfs: convert SQUASHFS_INODE_* and SQUASHFS_MKINODE to inline functions
Date: Mon, 23 Nov 2026 03:42:43 +0000
Message-ID: <20261123034304.261742-3-phillip@squashfs.org.uk>
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
X-CMAE-Envelope: MS4xfLcni997qr68blTvAospYwjSSrkd5KvIYTdVcjnZ1oSq9OkmS9qL8R4u/tLeiIwBJwcziYPaRyzGPcSCwwM5ey/ZpdpNqfqcI+RLUU0GdHn1/Z034W/6
 mcgBrbLxAGjxIyzbHunsr4ZPPio9TYY8J7XK8DNDG/w6E8MZNX7RL1MsQJX2bjdYcb41KOUT/Hkj5UFSyWajjy6tkZ3NDcqiwspm6DftizQ4IW7DIxrT57gu
 hm4FjiD+DGKDxmpCBaVL2BGKAJHCSFFw6aH4lHAOMfRAJIROxoEZjAzDAza92Ez0

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

