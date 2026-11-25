Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.121.53.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795571302;
	b=rMEEB++yAmUqabuePTU5CGpzaZCxlDSOIu/JjUSj+Ptts/Ve5jB+Gh1BI/XLfD2cYI00
	 hbcM6op71hiKNokqdEF36p9ctM+0F0HcBzBmaAClEba5dwOl8Odks34alTsyu1Gg/334H
	 AVoXYIRC+Fmb9ssgOJff0PYvxfQfFzRqnu/aSe9uHBlIeaUYlXsC389Qv5zfKBNUqd37o
	 eKd/rJqGbSPgxmjmPmqR73ez82cK0/8xKn+xvdQoAg2kk/YjSJl+N0rG9kNM1dyXp1nKw
	 gjLUoi9xeCLsUDgj7HKqEvG7mKIgIeuAu52YkTfrZVUzJ0kzdN2W4ZTSdE1bd57YHXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795571302;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=aqRtGXWkaC7PCxP2PmJbUP8tctz7ibhbTRejaXlW1Gk=;
	b=vDpfW6YkhBmVmX9VC8STIyK9EEsDtOWkXcXFDojdXDa32BZTKtUcthgjTamATr88pQx8
	 gUIJmFFgNtmgoPpugEtNfH/4OLxEA4pry1/JvEQM7MaKQCLyq7lF0x4EJ4GQZDH76DbqI
	 M/HYEGEDZmJZoALh9s+c1B8s54UYSMFAGTMvsUhy7pR/aX7EOWroluLX9v8//IvVR+/Za
	 hikMPtmM9/zxUWpbCSlTLm19BRneaepFhBQu/khdXSf9l7iJ7WQgRSWadmdCRKRmBQ3Aa
	 WGUSV68iTnsqTuiJXpZxyGZwXwsErtTYV4L7Q17I980A7aPKmxLdujrdj/TPNptBSBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b="LFdkge/6";
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=a+CxOTW9;
	arc=none smtp.remote-ip=188.121.53.22
Received: from sxplsmtpa04-02.prod.sxb1.secureserver.net (sxplsmtpa04-02.prod.sxb1.secureserver.net [188.121.53.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2930606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2930606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=LFdkge/6;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=a+CxOTW9
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id W26zxdCHW8H3GW27JxX8N3; Wed, 25 Nov 2026 01:48:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1795571294;
	bh=aqRtGXWkaC7PCxP2PmJbUP8tctz7ibhbTRejaXlW1Gk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LFdkge/6dARpwIkPryQrrbSbV3o3uw19Gz+KdeQR0c1aizoi1uQ089og9OLkocYZV
	 SlzuJq+YZwqpl7qYBxXDVx0iJePFevCLou/f/+e+hbztdcOSpGJV9EPymwdcGIgHg7
	 gRMp6rPvVjRf4YvbpW/624dZ1Fqdpk+SDh5D4AB5dLNoX80OJKA/Y8ngyVDMJe6HM7
	 lDlGfJF+vxCrDY4oel7mH1YZp9UpDTcWW7GIdirIL/MQgU8tC9qlGXJDOfn+3fOfnx
	 /IMpHX8W2r4XcoTSJiZkY8SLKPj65wjD42MaBsiMpWjCyvyLMBwX5INnzDftQV3bvO
	 rLz4/ha4Rdhtg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1795571294;
	bh=aqRtGXWkaC7PCxP2PmJbUP8tctz7ibhbTRejaXlW1Gk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=a+CxOTW9rPtM468f8eJAVXA6/xY7PFc9zOHqcblm+9QWxwjrEkjOVAwqFA02GGGZj
	 1fEO2bjQq/yE2B7ff10z8HNZdQtU9wpo0P0rPIxzd2MFuwiCL8SN/5xo6VLzshm3qP
	 twpfQVKErISyV6ZUYTJM7/+jUsYRzbT7IXrGWq0rNC+V1RCdIfTV3q1TFIpr4hLW9B
	 /9fVN8HADKZmW5woduHRT00b8uaJL3/AkgV7l936GslOSds+g42msEVvlzaSUeDlRg
	 euOh+YjvTnXNYrX2nQwlGKwztv9AdhH+5eFMdR8lCyvyybM+LQaDrJgNC5xz2C1LHj
	 woDrTm0dU+zSw==
X-CMAE-Analysis: v=2.4 cv=Cuoq4X4D c=1 sm=1 tr=0 ts=6b063e5e
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=dA03S5-tUKIFcmplmssA:9 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: ba612a39feaede9b5eaf2b542fcc0a05:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH v4 06/23] Squashfs: convert SQUASHFS_XATTR_* to inline functions
Date: Wed, 25 Nov 2026 01:47:20 +0000
Message-ID: <20261125014737.347231-7-phillip@squashfs.org.uk>
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
X-CMAE-Envelope: MS4xfCvkTa5I67DU3fCFYxMr8wNPnPTjqX8ISww2stLa80pSxNkF1sq1+x+X+0zGNrg3VvHsaFygDO36t5ZgxS7txkd4dKPByQt7e032uGGPKnKp16oOs+oC
 8lUM8mMnglWvyiupWmCOv7Jc4aR59w8jeJn0LFzPbHFyHRD1hMcrt8xmSq3tpPxlWLZvSKSEoxUlPC3mspvL2TDfJz/k/3McilElO8keVy/5bnQjl1YI/gys
 D0CViZqRttY75BE0MaryFfr4/SIUYvN+bGXxjixR7Z+2K2iW6mu2Bk8Ydd/taMRR

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
 fs/squashfs/squashfs_fs.h      | 19 -----------------
 fs/squashfs/squashfs_helpers.h | 37 ++++++++++++++++++++++++++++++++++
 fs/squashfs/xattr.c            | 18 ++++++++---------
 fs/squashfs/xattr_id.c         |  9 +++++----
 4 files changed, 51 insertions(+), 32 deletions(-)

diff --git a/fs/squashfs/squashfs_fs.h b/fs/squashfs/squashfs_fs.h
index 25dd89a2c6ad..3e7d0730b2d9 100644
--- a/fs/squashfs/squashfs_fs.h
+++ b/fs/squashfs/squashfs_fs.h
@@ -107,25 +107,6 @@ static inline int squashfs_block_size(__le32 raw)
 	return (size >> 25) ? -EIO : size;
 }
 
-/* xattr id lookup table defines */
-#define SQUASHFS_XATTR_BYTES(A)		(((u64) (A)) * sizeof(struct squashfs_xattr_id))
-
-#define SQUASHFS_XATTR_BLOCK(A)		(SQUASHFS_XATTR_BYTES(A) / \
-					SQUASHFS_METADATA_SIZE)
-
-#define SQUASHFS_XATTR_BLOCK_OFFSET(A)	(SQUASHFS_XATTR_BYTES(A) % \
-					SQUASHFS_METADATA_SIZE)
-
-#define SQUASHFS_XATTR_BLOCKS(A)	((SQUASHFS_XATTR_BYTES(A) + \
-					SQUASHFS_METADATA_SIZE - 1) / \
-					SQUASHFS_METADATA_SIZE)
-
-#define SQUASHFS_XATTR_BLOCK_BYTES(A)	(SQUASHFS_XATTR_BLOCKS(A) *\
-					sizeof(u64))
-#define SQUASHFS_XATTR_BLK(A)		((unsigned int) ((A) >> 16))
-
-#define SQUASHFS_XATTR_OFFSET(A)	((unsigned int) ((A) & 0xffff))
-
 /* cached data constants for filesystem */
 #define SQUASHFS_CACHED_BLKS		8
 
diff --git a/fs/squashfs/squashfs_helpers.h b/fs/squashfs/squashfs_helpers.h
index b9c517a50642..4088e598400f 100644
--- a/fs/squashfs/squashfs_helpers.h
+++ b/fs/squashfs/squashfs_helpers.h
@@ -132,4 +132,41 @@ static inline s16 squashfs_id_block_bytes(u16 ids)
 {
 	return squashfs_id_blocks(ids) * sizeof(long long);
 }
+
+/* xattr id lookup table defines */
+static inline s64 squashfs_xattr_bytes(u32 xattrs)
+{
+	return (s64) xattrs * sizeof(struct squashfs_xattr_id);
+}
+
+static inline s32 squashfs_xattr_block(u32 xattrs)
+{
+	return squashfs_xattr_bytes(xattrs) / SQUASHFS_METADATA_SIZE;
+}
+
+static inline s16 squashfs_xattr_block_offset(u32 xattrs)
+{
+	return squashfs_xattr_bytes(xattrs) % SQUASHFS_METADATA_SIZE;
+}
+
+static inline s32 squashfs_xattr_blocks(u32 xattrs)
+{
+	return (squashfs_xattr_bytes(xattrs) + SQUASHFS_METADATA_SIZE - 1) /
+		SQUASHFS_METADATA_SIZE;
+}
+
+static inline s32 squashfs_xattr_block_bytes(u32 xattrs)
+{
+	return squashfs_xattr_blocks(xattrs) * sizeof(long long);
+}
+
+static inline u32 squashfs_xattr_blk(s64 xattr)
+{
+	return xattr >> 16;
+}
+
+static inline s16 squashfs_xattr_offset(s64 xattr)
+{
+	return xattr & 0xffff;
+}
 #endif
diff --git a/fs/squashfs/xattr.c b/fs/squashfs/xattr.c
index ce6608cabd49..f9ef669544f8 100644
--- a/fs/squashfs/xattr.c
+++ b/fs/squashfs/xattr.c
@@ -19,6 +19,7 @@
 #include "squashfs_fs.h"
 #include "squashfs_fs_sb.h"
 #include "squashfs_fs_i.h"
+#include "squashfs_helpers.h"
 #include "squashfs.h"
 
 static const struct xattr_handler *squashfs_xattr_handler(int);
@@ -29,9 +30,9 @@ ssize_t squashfs_listxattr(struct dentry *d, char *buffer,
 	struct inode *inode = d_inode(d);
 	struct super_block *sb = inode->i_sb;
 	struct squashfs_sb_info *msblk = sb->s_fs_info;
-	u64 start = SQUASHFS_XATTR_BLK(squashfs_i(inode)->xattr)
-						 + msblk->xattr_table;
-	int offset = SQUASHFS_XATTR_OFFSET(squashfs_i(inode)->xattr);
+	u64 start = squashfs_xattr_blk(squashfs_i(inode)->xattr)
+						+ msblk->xattr_table;
+	int offset = squashfs_xattr_offset(squashfs_i(inode)->xattr);
 	int count = squashfs_i(inode)->xattr_count;
 	size_t rest = buffer_size;
 	int err;
@@ -107,14 +108,13 @@ static int squashfs_xattr_get(struct inode *inode, int name_index,
 {
 	struct super_block *sb = inode->i_sb;
 	struct squashfs_sb_info *msblk = sb->s_fs_info;
-	u64 start = SQUASHFS_XATTR_BLK(squashfs_i(inode)->xattr)
-						 + msblk->xattr_table;
-	int offset = SQUASHFS_XATTR_OFFSET(squashfs_i(inode)->xattr);
+	u64 start = squashfs_xattr_blk(squashfs_i(inode)->xattr)
+						+ msblk->xattr_table;
+	int offset = squashfs_xattr_offset(squashfs_i(inode)->xattr);
 	int count = squashfs_i(inode)->xattr_count;
 	int name_len = strlen(name);
 	int err, vsize;
 	char *target = kmalloc(name_len, GFP_KERNEL);
-
 	if (target == NULL)
 		return  -ENOMEM;
 
@@ -158,9 +158,9 @@ static int squashfs_xattr_get(struct inode *inode, int name_index,
 				if (err < 0)
 					goto failed;
 				xattr = le64_to_cpu(xattr_val);
-				start = SQUASHFS_XATTR_BLK(xattr) +
+				start = squashfs_xattr_blk(xattr) +
 							msblk->xattr_table;
-				offset = SQUASHFS_XATTR_OFFSET(xattr);
+				offset = squashfs_xattr_offset(xattr);
 			}
 			/* read xattr value */
 			err = squashfs_read_metadata(sb, &val, &start, &offset,
diff --git a/fs/squashfs/xattr_id.c b/fs/squashfs/xattr_id.c
index c8469c656e0d..ff85247e2d80 100644
--- a/fs/squashfs/xattr_id.c
+++ b/fs/squashfs/xattr_id.c
@@ -19,6 +19,7 @@
 
 #include "squashfs_fs.h"
 #include "squashfs_fs_sb.h"
+#include "squashfs_helpers.h"
 #include "squashfs.h"
 #include "xattr.h"
 
@@ -29,8 +30,8 @@ int squashfs_xattr_lookup(struct super_block *sb, unsigned int index,
 		int *count, unsigned int *size, unsigned long long *xattr)
 {
 	struct squashfs_sb_info *msblk = sb->s_fs_info;
-	int block = SQUASHFS_XATTR_BLOCK(index);
-	int offset = SQUASHFS_XATTR_BLOCK_OFFSET(index);
+	int block = squashfs_xattr_block(index);
+	int offset = squashfs_xattr_block_offset(index);
 	u64 start_block;
 	struct squashfs_xattr_id id;
 	int err;
@@ -79,8 +80,8 @@ __le64 *squashfs_read_xattr_id_table(struct super_block *sb, u64 table_start,
 	if (*xattr_ids == 0)
 		return ERR_PTR(-EINVAL);
 
-	len = SQUASHFS_XATTR_BLOCK_BYTES(*xattr_ids);
-	indexes = SQUASHFS_XATTR_BLOCKS(*xattr_ids);
+	len = squashfs_xattr_block_bytes(*xattr_ids);
+	indexes = squashfs_xattr_blocks(*xattr_ids);
 
 	/*
 	 * The computed size of the index table (len bytes) should exactly
-- 
2.47.3

