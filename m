Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.121.53.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795405426;
	b=0w51CUEbfEzsHpqVxgB6r9b40EQAztmZC/ZtoeodF8GuZ01VxxrTerrNlPr+hDL7QDAM
	 hWblCmkIWRjZS9WdFyxPP6eQGXuBDWnDaOjPG6/G20KG0GGUetrciTMWmIcjNlD8H3FGO
	 xJxa7jTbVn/UYXuomkWGY4oYotFW4d8aetLYv20srvCWjxsgu1FY3w+T43vliw6ud6E+1
	 J6OpNOX1iwsb7HTaZukQWLIMo2zPjmWnswIJqGTdNdPk7liSlxGrON3p6gPoeVgO3rhiQ
	 0VQlvgZrORobKvG4yiNAlf7F+8LXixUKEpnvm+kpArnj9ImgnwpyChrc5fKq45+dygQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795405426;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=Oshb1N+7d3ShFEV384GRopcqnhrg8u+YSeIPC40XOVU=;
	b=iNDv84l+/1/Elb5swznbnSLLCdJnrliQCNR4MtzNVPuz2k8uqAT9eDBmJm1UkGDaFqG7
	 mp20jmRJxwQ6kHXW020zahKS1kcn1sfb3FARlokUwZ6v5OUAhNZSVFpe5qwTycTqORa9P
	 2hY7JIOXVQ42FxlDB9aTQ80kZN3jz28oCEer7EHNw4OPjt7+N/+sRmFM7GeXUT8yC0BDe
	 brnMBArDASlv2JVitmZB0p0ZWGX3+/FDCNTwuxEszAbeaSD3lxXdxvXTTGU71GA5cPe3p
	 Q5U2Y9s31tAW//A25BM6wDw5T+dsqPAO6Q3OT+v+5Ohk4CdFSiYVIaIRPIJTakRfTNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=ReFTMixp;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=pxM7noPj;
	arc=none smtp.remote-ip=188.121.53.42
Received: from sxplsmtpa04-04.prod.sxb1.secureserver.net (sxplsmtpa04-04.prod.sxb1.secureserver.net [188.121.53.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D369B606A685
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:43:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D369B606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=ReFTMixp;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=pxM7noPj
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id VKxRxJoOeZuU3VKxnxiqQL; Mon, 23 Nov 2026 03:43:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1795405412;
	bh=Oshb1N+7d3ShFEV384GRopcqnhrg8u+YSeIPC40XOVU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ReFTMixpRZqYDpYiE6h0tjbj6R5FO6NPjteRvmZzguVyeNp2G7kfHkOSigihjKstM
	 YmC2oH7mcGcSJYOmM/jmUg7SaY+TwsdM0VhTAREAK9TDmd5wR9i2yNHyLUpJoNs9SH
	 qoEkz7cLS/SxAn8y+BhdOlxrFloQbIJeZyIK00EMmiIfy/mv571RXfApH2FkYqc+Rz
	 6V6QUTa5a3yPKKprCFAZtJzsBxxwk8P65SwXmvYWWKyxabgvXgvtFwEwP+YNWHX4jm
	 11Jb8ostSLBkWFObnWIpNuyOzVAWAF3Z/U2Avm0EuFAzjy/vtVfm3L6VcYqysJWhpp
	 2Du4OsQGH2Jeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1795405412;
	bh=Oshb1N+7d3ShFEV384GRopcqnhrg8u+YSeIPC40XOVU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=pxM7noPjJk8tVFQhGTVARlvt9Rp/yg/rn9nk7J98HtcGDG5WHs9VRfykkLkrKOfv2
	 Klz0e9rwaKWQ6sEL7Pt7TC61YKnU4z3fmmlLJ9ynI3jSLN2bLzxXfOhFCrkAHhDh+f
	 Eu40RsgGrAEfA0U7Mb9PZNuo1xgOwB3MyzHWJ7RmL7nNq62KPaA7M2/JGjYokYdPmm
	 qXTS4c9GgKjChJAjBSEbomTjg3BveTRLgJVirZvD9y9UJghJ6xDNRXZVjjG4ufbrOK
	 2bvIXVPsGqUPy6KwNQeefGSGcAAAVn9F4f4qp7vxLsbWk3CufE7UeDo2asxKhSyvzm
	 bjUi4uYQ1pMoQ==
X-CMAE-Analysis: v=2.4 cv=CvYq4X4D c=1 sm=1 tr=0 ts=6b03b663
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=_bInhHkTttLfAsG6xnIA:9 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: 1fdab1a336b49cbd43da0b966ac5bc4e:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH v3 04/23] Squashfs: convert SQUASHFS_LOOKUP_* to inline functions
Date: Mon, 23 Nov 2026 03:42:45 +0000
Message-ID: <20261123034304.261742-5-phillip@squashfs.org.uk>
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
X-CMAE-Envelope: MS4xfNRePthvxLMr7gkzti9bEDj+K0KQo8mgKpSRLRqTvbnubIG94vJPs5vFxEsF7jc42DfBw7Y+76Mi5IChcYWG0w6PTEctsL0Z+ASZcy6/RTHri2dCNg83
 CcC4DnS2bta8v6TfOWSupj3zIciuoPULLs6M7Y23Inq15YHVw2jKDinIWYdfUbr08XHuTLTCFIWP9kYmn9SF8huTY9TtV5yBdqGbUGcced+ASKSZ8aEmfaKT
 f8G6eoIXFAcSSj54SF1WD2gTz/qLfp13NspzRVw7FnhStDLUyOyL4jmUYbDMb3xB

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

