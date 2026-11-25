Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=92.204.81.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795571305;
	b=B5EKzbrlXYLkMeQ41Ibj80oVavoYOwHkxEqzCZoVAwPFYp2MrbjuOxw8uBRI8VC9M8P2
	 YvXMX2mRFs4Jlnv/tLrqMG78eDs06sJLuaPrfAWjznPwJP8dRvf9FdXF5oXrx5R0ICoa/
	 +1XNH4Pewf8JG79Mc76vMPb4PJXq55TWrNDsf47PJyPYBvvD7XwRB9oLi+CHe4vtBNgYT
	 fme8DL0pXQGYb93aOagztAi1OOpouZe1zEJUgp0waehbSjCRCm7aLMV75DHJ2JoPNHsXH
	 Hc8AsuQnKq5Fuj2dkwqLnd4gQH3o3B9ulevrOdydQSXHBnG4bIoqtchz5J1K+x80+tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795571305;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=Oshb1N+7d3ShFEV384GRopcqnhrg8u+YSeIPC40XOVU=;
	b=FMtRLmGhk+22aTCOit7brxj98YhEHhgbRxjz7Nwgj11VvARvmrFUIOOR11ylqYR4hq8b
	 uBbTZcRh0MhH+x8dDUWlerMub2DOTaewyWGLFwgWqYnZPBwgQcYDrO8Ay1zZUuqdWe4uI
	 z7FN4blZYxVo1fRgjZWLGHlSyMmyzEBSUWlP8Eg0fvXML2HmWWNEhNu+Ic1xGKu6SFLeL
	 hENtjxUUMpzoJTQJ69wO5eJCTZs4fntuK0nlMyHl7eKJhFxAfa0SZ+KmjS8F5Upzxq9H9
	 w7l2faix/WEtwZeH30jpxEHPRNNe4+eXs0nr7uoTMdLXHm/hIMX09yapVSU42qDaPQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=PXrZ6sXu;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=heA4aaZC;
	arc=none smtp.remote-ip=92.204.81.37
Received: from sxplsmtpa04-02.prod.sxb1.secureserver.net (sxplsmtpa04-02.prod.sxb1.secureserver.net [92.204.81.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70248606A69C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:48:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70248606A69C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=PXrZ6sXu;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=heA4aaZC
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id W26zxdCHW8H3GW27GxX8Mh; Wed, 25 Nov 2026 01:48:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1795571291;
	bh=Oshb1N+7d3ShFEV384GRopcqnhrg8u+YSeIPC40XOVU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PXrZ6sXu3T/Z7idYmL+O/RQOuh6EnICrGEjfaJTfBfnjeJHsp7jrJUlhYWshuojA/
	 yZV4CFPp1TYGt/6pmzA1mzSj0yyFj9qTZmR/ecoD4lNfRHrVajX54/7EBPvqrZCXwy
	 jKLjjezAJDA0JnIf32+qlZt4rl7+1mZNIIsq9/FKElcs3iSzc70pb4CWUIxX3okC+F
	 34F84Y8ZdLRsGPe5N8COVCvpOfMGbTliHg+pQMaUdVvw4D/KDF+ZeMJUbnhUlJx2CP
	 7R1tBdiJpvZxQ/h+p03+61Y4wgK3S1v4BSYf2Qh+oZerdGNh5mZkZjHutmnyowlQfA
	 XA0l23bl0m/Gg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1795571291;
	bh=Oshb1N+7d3ShFEV384GRopcqnhrg8u+YSeIPC40XOVU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=heA4aaZCFkj8po8P7bT5Qx3Qs5o+q61iW9xI48/DLOF7pqyGSarwGC2HGSkxfQhSJ
	 I3GLhZK+Lpeeq9k4g0QLrZ/xRJJGmCGyihIXx29sVS/1pcRmwn/CQ0J8K7FC+JEO7d
	 cakqp+A7cFCYNAqSdQgft2KY7Z6wF73WBOuiSv3kTzqtsM7Bbd5ARSYPuTT4uCFHxC
	 gDJlB1R4poiNwX6vuu/BjPB184hBGLf2j2sCOe903gd3jhR+KV07cVmAeoFCYwZJhM
	 ixOz39LeAnYymNH4C3Og+JHionHScx6z0ptXZKPSebWY5glWCv73N6WRJAJ2yHzxOA
	 rbm8KF3tPMb3A==
X-CMAE-Analysis: v=2.4 cv=Cuoq4X4D c=1 sm=1 tr=0 ts=6b063e5b
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=_bInhHkTttLfAsG6xnIA:9 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: 6533eca6e82a186b9bc3104e335d53b0:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH v4 04/23] Squashfs: convert SQUASHFS_LOOKUP_* to inline functions
Date: Wed, 25 Nov 2026 01:47:18 +0000
Message-ID: <20261125014737.347231-5-phillip@squashfs.org.uk>
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
X-CMAE-Envelope: MS4xfE/nRRwlXoC4pMgxY58jXQQqzHKWZ144OGB0cJ1Aje1d/r8p/9IuvnehYJHSrY5UIVyqqmyPhOt0/WYJ3UqKJSCRrS9kERyfGSueIPlU2Df6RWxC102f
 Cum0jB13B27Rte8GTb08QD+nn7tFE+kqcxhhelWPb7L06tmSCkwlae3kLXQwI1wTa0VQYlLDgmS2znj/0uOciqHx25mJHNI5/evQ57POvFGZPssekZsXFuO9
 ZQyALCsUy5H2qfzDVixd41XRwgX0hdPCusUIRRaE2OBe+S0S9iK766jlTr7eipAs

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
 fs/squashfs/export.c           |  9 +++++----
 fs/squashfs/squashfs_fs.h      | 16 ----------------
 fs/squashfs/squashfs_helpers.h | 27 +++++++++++++++++++++++++++
 3 files changed, 32 insertions(+), 20 deletions(-)

diff --git a/fs/squashfs/export.c b/fs/squashfs/export.c
index 62972f0ff868..ad7cc882d789 100644
--- a/fs/squashfs/export.c
+++ b/fs/squashfs/export.c
@@ -31,6 +31,7 @@
 #include "squashfs_fs.h"
 #include "squashfs_fs_sb.h"
 #include "squashfs_fs_i.h"
+#include "squashfs_helpers.h"
 #include "squashfs.h"
 
 /*
@@ -39,8 +40,8 @@
 static long long squashfs_inode_lookup(struct super_block *sb, int ino_num)
 {
 	struct squashfs_sb_info *msblk = sb->s_fs_info;
-	int blk = SQUASHFS_LOOKUP_BLOCK(ino_num - 1);
-	int offset = SQUASHFS_LOOKUP_BLOCK_OFFSET(ino_num - 1);
+	int blk = squashfs_lookup_block(ino_num - 1);
+	int offset = squashfs_lookup_block_offset(ino_num - 1);
 	u64 start;
 	__le64 ino;
 	int err;
@@ -115,8 +116,8 @@ static struct dentry *squashfs_get_parent(struct dentry *child)
 __le64 *squashfs_read_inode_lookup_table(struct super_block *sb,
 		u64 lookup_table_start, u64 next_table, unsigned int inodes)
 {
-	unsigned int length = SQUASHFS_LOOKUP_BLOCK_BYTES(inodes);
-	unsigned int indexes = SQUASHFS_LOOKUP_BLOCKS(inodes);
+	unsigned int length = squashfs_lookup_block_bytes(inodes);
+	unsigned int indexes = squashfs_lookup_blocks(inodes);
 	int n;
 	__le64 *table;
 	u64 start, end;
diff --git a/fs/squashfs/squashfs_fs.h b/fs/squashfs/squashfs_fs.h
index 3dbd174b5f21..89b998f57a2b 100644
--- a/fs/squashfs/squashfs_fs.h
+++ b/fs/squashfs/squashfs_fs.h
@@ -107,22 +107,6 @@ static inline int squashfs_block_size(__le32 raw)
 	return (size >> 25) ? -EIO : size;
 }
 
-/* inode lookup table defines */
-#define SQUASHFS_LOOKUP_BYTES(A)	((A) * sizeof(u64))
-
-#define SQUASHFS_LOOKUP_BLOCK(A)	(SQUASHFS_LOOKUP_BYTES(A) / \
-					SQUASHFS_METADATA_SIZE)
-
-#define SQUASHFS_LOOKUP_BLOCK_OFFSET(A)	(SQUASHFS_LOOKUP_BYTES(A) % \
-					SQUASHFS_METADATA_SIZE)
-
-#define SQUASHFS_LOOKUP_BLOCKS(A)	((SQUASHFS_LOOKUP_BYTES(A) + \
-					SQUASHFS_METADATA_SIZE - 1) / \
-					SQUASHFS_METADATA_SIZE)
-
-#define SQUASHFS_LOOKUP_BLOCK_BYTES(A)	(SQUASHFS_LOOKUP_BLOCKS(A) *\
-					sizeof(u64))
-
 /* uid/gid lookup table defines */
 #define SQUASHFS_ID_BYTES(A)		((A) * sizeof(unsigned int))
 
diff --git a/fs/squashfs/squashfs_helpers.h b/fs/squashfs/squashfs_helpers.h
index b99ca67c729a..aafc75a3a435 100644
--- a/fs/squashfs/squashfs_helpers.h
+++ b/fs/squashfs/squashfs_helpers.h
@@ -78,4 +78,31 @@ static inline s32 squashfs_fragment_index_bytes(u32 fragments)
 {
 	return squashfs_fragment_indexes(fragments) * sizeof(long long);
 }
+
+/* inode lookup table defines */
+static inline s64 squashfs_lookup_bytes(u32 inodes)
+{
+	return (s64) inodes * sizeof(s64);
+}
+
+static inline s32 squashfs_lookup_block(u32 inodes)
+{
+	return squashfs_lookup_bytes(inodes) / SQUASHFS_METADATA_SIZE;
+}
+
+static inline s16 squashfs_lookup_block_offset(u32 inodes)
+{
+	return squashfs_lookup_bytes(inodes) % SQUASHFS_METADATA_SIZE;
+}
+
+static inline s32 squashfs_lookup_blocks(u32 inodes)
+{
+	return (squashfs_lookup_bytes(inodes) + (SQUASHFS_METADATA_SIZE - 1)) /
+		SQUASHFS_METADATA_SIZE;
+}
+
+static inline s32 squashfs_lookup_block_bytes(u32 inodes)
+{
+	return squashfs_lookup_blocks(inodes) * sizeof(long long);
+}
 #endif
-- 
2.47.3

