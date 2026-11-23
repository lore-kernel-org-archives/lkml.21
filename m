Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=92.204.81.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795405423;
	b=QNPaxKNO4kCuyS6dsrWxHcLoWrvTB6/L525F+o3Y36VW7XIeDHFJWrycEfFnINpqZzY0
	 KwBpUDkU4szWaEuKpJyLJZaGnkfifSGkQv+/1Y5ymSEFN8zfF4+o6Ub8fFINDHIRoZ60g
	 Gx1MWk8ltbVJKpoW87lOoHLEjPFtdh0EW/hgndNroIcpA5HcT1x9WMTRhwPpoPxyGUJCg
	 D95HkdQmlT5D0ozxkZTwc5xHer2g9OK1RUEGOVib627/dv29bQ2VF7UfG96966FNMKfS4
	 RjKrdp+mFO4Spt2fHDifmwB5fgWWbnDa7orCVH9HX1aVYnknvfwjyXMxkyi6aW0rqxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795405423;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=aqRtGXWkaC7PCxP2PmJbUP8tctz7ibhbTRejaXlW1Gk=;
	b=R/n1LAD4sDGhL94VpJfhONSzUQsXoRmUK1swE1yTbVOxR/rdnCfSs6bepogHASOpGB9R
	 EPBe9Cqj5wCf3mSC9IkyHCn/DXi+PiDsS2ukVtGDKo727CxYfj3H4XaVHckK08rPvp7Qk
	 UsklGFf6a7SijJShnH1Io7OA2Tdud35BE3F/qYlZ3r/x0CSf/fcKcGVzlJaoCkP60f9IA
	 ncEJsZr/IBeyzMgGJuJVJ5vA5x7bpLbPkRcFrlHEr0kXyt8aqn2+msJBMSa3HkFh6anve
	 O4EcdO4MjOOaU03g0z1WxSOqQRWJBBYCOnHEIL4jVgYaluV4saD+iaejmEGDNcCxNuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b="XXP/g540";
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=bbcfLkdM;
	arc=none smtp.remote-ip=92.204.81.45
Received: from sxplsmtpa04-04.prod.sxb1.secureserver.net (sxplsmtpa04-04.prod.sxb1.secureserver.net [92.204.81.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A95D606A333
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A95D606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=XXP/g540;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=bbcfLkdM
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id VKxRxJoOeZuU3VKxpxiqQW; Mon, 23 Nov 2026 03:43:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1795405415;
	bh=aqRtGXWkaC7PCxP2PmJbUP8tctz7ibhbTRejaXlW1Gk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XXP/g540SVObMt7fDWAItji8J5U1JjEJMSavy363UPlBcEVxIiInUwRwprWz2C2Qj
	 u9UMgjOcqTgKnfXCwffwn5aCnaLknl7sxl/W4zjgVzel+Sx55J10Q90X8RjggUNFUA
	 kQoxMGzsy8fpXcMxM0HXeeyYanztK1FLlChORDVx+v7b12EkTIzTwb81nWThG6j0z6
	 stTFcZKsQbfIKkdu8o/xRKmjsLq4xneQG/sRBLwSCrKnB+f0Kmpj5LmKGdthubkgey
	 N11t8dV6+bPXOaKN12FZiro7GTqJjzNV1cb1snFD9qDAR9NK4KQfbGdfYC/hM52JWL
	 nbLojv4ddtKWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1795405415;
	bh=aqRtGXWkaC7PCxP2PmJbUP8tctz7ibhbTRejaXlW1Gk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bbcfLkdMW5dvkzwTOLxugxrI8LYb4VABybw+ukZ7GBwCuwGO8eXtZMR0Nw0NqrvLn
	 2MzheooXKjWvYxa7xw0gEOmbwBIrxIj06taTENouIRRtYpsBJcjRv1MEvHbyGTiEYg
	 FVP0ixKPifIBL94ix8+/V31bW4BCihVCVF3XcEm3cy2lZN+Mx1d2ijTzYp/2rtTWQo
	 1Rol/bOvV61dhnjS4yHJbBir4ViS33uRxiPL0a7z3nmBmJzkpKmrIV+qstmiCO+Y+S
	 FZUGHL71jinwrZsxCeCLbzFgBT8/Kdi3l+5NJUhpdvhnn6/HK5pD8M3OgQGlJnsCZZ
	 mdp6j8l/WQf/g==
X-CMAE-Analysis: v=2.4 cv=CvYq4X4D c=1 sm=1 tr=0 ts=6b03b666
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=dA03S5-tUKIFcmplmssA:9 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: 243f5b758cf94337f0ecd98a859c731e:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH v3 06/23] Squashfs: convert SQUASHFS_XATTR_* to inline functions
Date: Mon, 23 Nov 2026 03:42:47 +0000
Message-ID: <20261123034304.261742-7-phillip@squashfs.org.uk>
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
X-CMAE-Envelope: MS4xfFB/wmdjuNjW5kBUINnb9ZPGpPDT+7aJ3xEfLP/lo+6Jv7cS0jTfFejaYlJS42Fq2LFM9uoaw0EyM17ubfChaVcWpgIdzi81/ODUfKSvSaTxo1bCbKTH
 AQZvHmn/5i52l3tJzekbvWA4eUIuC9fazdN8OftnlQHR+e3JX9rqgZHuzIoQbS3di1zQuFwAac8ZmsVwrjcA0QXTTJTOEf1YgrcqRecu6Dew0s8eaJ8xBeoT
 9joVvG5by6J+Xya8TdF16zeDxO9oIzFUsu9BPbRWVdiLWB1zuCK9aIUb6m2yTchU

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

