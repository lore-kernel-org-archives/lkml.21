Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794962942;
	b=470n3hiPAHAiuuTqbROZj48hVg3mE7kGY7QFJrah9+kwkRMvHy7K9Aa1dgzR5YRDCnDu
	 8yp/gK/of4HmvYUoMBH4ykxGXOER8Sk5JSIAGxOgvbUEpd0fwMQAO0XDWQr1XBF/VjY6F
	 CI8FCTVsD/hnbE9LAQzrPCjAtIIcnnyRrKjEuU8qjlQu6wD9HYQp49KyB1Md9ss7toh/U
	 BDDLZmw1VsEnVonP69GLtdrig7ikCESTTJsivEYzGbNOYLcVH4S4sO7Uswzo1Y1Owi+Ui
	 ItZ9a4tq2Htql4OTX9HJ4Yx87vJSdETWfQTngkDjyWZULgJdGbuYa91NXTeOlypZrvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794962942;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TZeoHkr/pxx3BmTn/Pfgy9HpgaQN/+V8W+yqYyq3Xbg=;
	b=LnA1ZtuPg4bty9OR0vZlADHf3JbBZCJEqXsJTZi3XO/0PLTILOkLYrQBjp0ac2Oeft9y
	 TCsfa91KuPcjKMci+l13/+I2p04tIyt65ho30xjOdoozlJcjzdEbaYTXMd9ui6xcOVAG0
	 F/DdhXbkK3y+wHwSkVRYMPJl+kl/RGP32uZoyrJj7xJq+vr/1beq5g1RZJTAVImB1oeUp
	 0x9eFKpGN2hHW/fVNj2aEf38j2vN4jkOV1uj/XpmDfNui3JyME0wPWo2KhD6d4xpgM5ep
	 oU0kO/raRgakKM8OGXzEYsJSGtIyCzH1kpbhdBBHXSMGAdc3M/EMPjigopAsCJCCrOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dubeyko.com;
	spf=pass smtp.mailfrom=dubeyko.com;
	dkim=pass header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fbxVwi35;
	arc=none smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4474B606A894
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:49:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4474B606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fbxVwi35
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-675617e81f9so317081d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20260707.gappssmtp.com; s=20260707; t=1794962939; x=1795567739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TZeoHkr/pxx3BmTn/Pfgy9HpgaQN/+V8W+yqYyq3Xbg=;
        b=fbxVwi35SWKD4JkD9DHQJpbHpVC20TpvUheD4AlRcgsCmKKFcsEawPPiW7Z8dxUH5J
         /sVdDXmiIhV2zFJ8Ar+WoCE8L1YcKJBHI9IB2dozEB2rmbtF0fHcOPIjJJnShfcMtRgl
         Pt0gTtXFWVDdtNIVfF7KKvKQrCGwx8nh6PDJcWsHPQiv+SqMutL3G+0gv+n6vl+Ewqm2
         8h0lhidPzI7V4DmCYdM3vEyPLW9h734QBmiSyWa1dnRhv76nmRgHImRj+NTTTXolY8tB
         s6YxxV4iPQR3vchVck6bu6LOKLy195hp6dd/xPWz6u2uvrLr7heqePcSOR1DxPOQdDuW
         XQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794962939; x=1795567739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TZeoHkr/pxx3BmTn/Pfgy9HpgaQN/+V8W+yqYyq3Xbg=;
        b=jXlCGHeCDyWkk5yCFMNIYKHAGj42+a//9GKOJACkASKrRTSlqMttJc/r4N8wOd9wf2
         31PmyS4LcHWa1A3vUquaaFqZZRgnOQIFpwKPoxZlhvnCndte7P9rHKMcDz4NMJEU5G7j
         Jit0VhfPkOBR1KBdcquqURAqqNLBTzsnE1xblf3oN8BMR4o7pys6Z4w4Fv+lVuK9bmPP
         OuFv9SsKRGdfDlIdayGqITvirb92NNTCb1iucAhC0REaMAKFQlZosSCb0uja2/Q2f/jc
         oo9blEl3+nIdNFqF1NXgXlgce0nX8ods5zdJ4o9HjR8O8X45opC5JGHDoGQW9XwW07qu
         JFfw==
X-Forwarded-Encrypted: i=1; AL+hErGKjQIFcPnsJGyWNbcO0e1ZeGUXnjvuqOi0uZPIY5FSCG9AXL+3MSDvaDDttG6MH6NY3UcZNXfaB9oLdGA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UQuUEb+ZDqjq1ZR+K48ZdSp33H18oVNnGynA2Br1EabO/kfrt
	IlouBzMqYCneO4eycMhAHFMuKdZuQ0olzfDVfpA3FGMWJ8/j/af4t6iejRxTrNbwzHY=
X-Gm-Gg: AZFdTZe1rUdwa9Rg5WxVkCYauiLURJH2NY9z/zz2cv/2Rp8Qt9eevfowbRdg0J7G0hL
	g6u9OMICJBccDZUxORadHyPu+1HoZCgNRCID2E842XexACEVovcE1yo7LtSKBAUN9LHHsvKUr0Y
	IdKCmE4EIOqBbGio2dqL2aDzr1VhEUp6KHOtok9SUrF3UeBp5Qkw7oxNeo3sE9TouGd1msYj9go
	Utv75kssE0pcmG8LFsK2Rr0YCxPkwhSnic3DBu5S5BodWDO7Tj8uFRS093aexzruCYubJwTX4OZ
	z62HhkXKUHr2m0XNdlaNOJoGS902Z2B9hSCNfFTxoN7cnesXkBogYmS9yk+IkonCfVyz++/QiIP
	9czU0h/Uy+SOhwLzVdPC7xZqGiI2VvDCP6ygdWVuFs/wMzQp3rUnEtp3ODl9zBcWBEH7ekHN31V
	4bYCyNE/4wW2GZSrS1pPHP8njqBbjGOXa0WenYIFsTs+Xwehtp27f/w46/IRouVe/mUxyQ4klbq
	+A0Nm10R3qpEJY4YRbvd3Y13Nptph0fvN8zurjr2J160S4HBN6ZKKZNkP40UTLt4deYAoc53ReK
	aN+A4/LoHrQ2Azr9HNx4mHFvfgzqobUDJm+n4vlQ5D1l/WfJyqgRwkls57CMdgtQX/V2jSyt/or
	mvZOhXJLbvqPT3FqF2+vX+pzOEi4BP0LDEoXYz2REDolYtewUB+Ts89tYI6fpLpxwpNmlxeR1
X-Received: by 2002:a05:690e:40c:b0:67d:c2d1:5f31 with SMTP id 956f58d0204a3-67dd3fe03d9mr410438d50.57.1794962939086;
        Tue, 17 Nov 2026 16:48:59 -0800 (PST)
Received: from system76-laptop.attlocal.net ([2600:1700:6476:1430:5fae:4d02:7055:94ad])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67dd56ead87sm729575d50.1.2026.11.17.16.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:48:58 -0800 (PST)
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com,
	hch@lst.de
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vdubeyko@coreweave.com,
	brauner@kernel.org,
	linux-xfs@vger.kernel.org,
	Viacheslav Dubeyko <slava@dubeyko.com>,
	"Darrick J. Wong" <djwong@kernel.org>
Subject: [PATCH v5 2/5] hfsplus: move file related operations to file.c
Date: Tue, 17 Nov 2026 16:48:41 -0800
Message-ID: <20261118004844.3849979-3-slava@dubeyko.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261118004844.3849979-1-slava@dubeyko.com>
References: <20261118004844.3849979-1-slava@dubeyko.com>
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

This patch introduces fs/hfsplus/file.c and moves
file related operations from fs/hfsplus/inode.c
into the new file.

cc: Christoph Hellwig <hch@lst.de>
cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Yangtao Li <frank.li@vivo.com>
cc: linux-fsdevel@vger.kernel.org
Reviewed-by: Christoph Hellwig <hch@lst.de>
Acked-by: Darrick J. Wong <djwong@kernel.org>
Signed-off-by: Viacheslav Dubeyko <slava@dubeyko.com>
---
 fs/hfsplus/Makefile     |   5 +-
 fs/hfsplus/file.c       | 127 ++++++++++++++++++++++++++++++++++++++++
 fs/hfsplus/hfsplus_fs.h |   7 ++-
 fs/hfsplus/inode.c      | 119 -------------------------------------
 4 files changed, 135 insertions(+), 123 deletions(-)
 create mode 100644 fs/hfsplus/file.c

diff --git a/fs/hfsplus/Makefile b/fs/hfsplus/Makefile
index f2a9ae697e81..82738ce7ca4d 100644
--- a/fs/hfsplus/Makefile
+++ b/fs/hfsplus/Makefile
@@ -5,8 +5,9 @@
 
 obj-$(CONFIG_HFSPLUS_FS) += hfsplus.o
 
-hfsplus-objs := super.o options.o inode.o ioctl.o extents.o catalog.o dir.o btree.o \
-		bnode.o brec.o bfind.o tables.o unicode.o wrapper.o bitmap.o part_tbl.o \
+hfsplus-objs := super.o options.o inode.o file.o ioctl.o extents.o catalog.o dir.o \
+		btree.o bnode.o brec.o bfind.o tables.o unicode.o wrapper.o bitmap.o \
+		part_tbl.o \
 		attributes.o xattr.o xattr_user.o xattr_security.o xattr_trusted.o
 
 # KUnit tests
diff --git a/fs/hfsplus/file.c b/fs/hfsplus/file.c
new file mode 100644
index 000000000000..6b14095b2aa6
--- /dev/null
+++ b/fs/hfsplus/file.c
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/fs.h>
+#include <linux/uio.h>
+#include <linux/mount.h>
+
+#include "hfsplus_fs.h"
+#include "hfsplus_raw.h"
+
+static int hfsplus_file_open(struct inode *inode, struct file *file)
+{
+	if (HFSPLUS_IS_RSRC(inode))
+		inode = HFSPLUS_I(inode)->rsrc_inode;
+	if (!(file->f_flags & O_LARGEFILE) && i_size_read(inode) > MAX_NON_LFS)
+		return -EOVERFLOW;
+	atomic_inc(&HFSPLUS_I(inode)->opencnt);
+	return 0;
+}
+
+static int hfsplus_file_release(struct inode *inode, struct file *file)
+{
+	struct super_block *sb = inode->i_sb;
+
+	if (HFSPLUS_IS_RSRC(inode))
+		inode = HFSPLUS_I(inode)->rsrc_inode;
+	if (atomic_dec_and_test(&HFSPLUS_I(inode)->opencnt)) {
+		inode_lock(inode);
+		hfsplus_file_truncate(inode);
+		if (inode->i_flags & S_DEAD) {
+			hfsplus_delete_cat(inode->i_ino,
+					   HFSPLUS_SB(sb)->hidden_dir, NULL);
+			hfsplus_delete_inode(inode);
+		}
+		inode_unlock(inode);
+	}
+	return 0;
+}
+
+int hfsplus_file_fsync(struct file *file, loff_t start, loff_t end,
+		       int datasync)
+{
+	struct inode *inode = file->f_mapping->host;
+	struct hfsplus_inode_info *hip = HFSPLUS_I(inode);
+	struct super_block *sb = inode->i_sb;
+	struct hfsplus_sb_info *sbi = HFSPLUS_SB(inode->i_sb);
+	struct hfsplus_vh *vhdr = sbi->s_vhdr;
+	int error = 0, error2;
+
+	hfs_dbg("inode->i_ino %llu, start %llu, end %llu\n",
+		inode->i_ino, start, end);
+
+	error = file_write_and_wait_range(file, start, end);
+	if (error)
+		return error;
+
+	/*
+	 * Sync inode metadata into the catalog and extent trees.
+	 */
+	sync_inode_metadata(inode, 1);
+
+	/*
+	 * And explicitly write out the btrees.
+	 */
+	if (test_and_clear_bit(HFSPLUS_I_CAT_DIRTY,
+				&HFSPLUS_I(HFSPLUS_CAT_TREE_I(sb))->flags)) {
+		clear_bit(HFSPLUS_I_CAT_DIRTY, &hip->flags);
+		error = filemap_write_and_wait(sbi->cat_tree->inode->i_mapping);
+	}
+
+	if (test_and_clear_bit(HFSPLUS_I_EXT_DIRTY,
+				&HFSPLUS_I(HFSPLUS_EXT_TREE_I(sb))->flags)) {
+		clear_bit(HFSPLUS_I_EXT_DIRTY, &hip->flags);
+		error2 =
+			filemap_write_and_wait(sbi->ext_tree->inode->i_mapping);
+		if (!error)
+			error = error2;
+	}
+
+	if (sbi->attr_tree) {
+		if (test_and_clear_bit(HFSPLUS_I_ATTR_DIRTY,
+				&HFSPLUS_I(HFSPLUS_ATTR_TREE_I(sb))->flags)) {
+			clear_bit(HFSPLUS_I_ATTR_DIRTY, &hip->flags);
+			error2 =
+				filemap_write_and_wait(
+					    sbi->attr_tree->inode->i_mapping);
+			if (!error)
+				error = error2;
+		}
+	} else {
+		if (test_and_clear_bit(HFSPLUS_I_ATTR_DIRTY, &hip->flags))
+			pr_err("sync non-existent attributes tree\n");
+	}
+
+	if (test_and_clear_bit(HFSPLUS_I_ALLOC_DIRTY,
+				&HFSPLUS_I(sbi->alloc_file)->flags)) {
+		clear_bit(HFSPLUS_I_ALLOC_DIRTY, &hip->flags);
+		error2 = filemap_write_and_wait(sbi->alloc_file->i_mapping);
+		if (!error)
+			error = error2;
+	}
+
+	mutex_lock(&sbi->vh_mutex);
+	hfsplus_prepare_volume_header_for_commit(vhdr);
+	mutex_unlock(&sbi->vh_mutex);
+
+	error2 = hfsplus_commit_superblock(inode->i_sb);
+	if (!error)
+		error = error2;
+
+	if (!test_bit(HFSPLUS_SB_NOBARRIER, &sbi->flags))
+		blkdev_issue_flush(inode->i_sb->s_bdev);
+
+	return error;
+}
+
+const struct file_operations hfsplus_file_operations = {
+	.llseek		= generic_file_llseek,
+	.read_iter	= generic_file_read_iter,
+	.write_iter	= generic_file_write_iter,
+	.mmap_prepare	= generic_file_mmap_prepare,
+	.splice_read	= filemap_splice_read,
+	.splice_write	= iter_file_splice_write,
+	.fsync		= hfsplus_file_fsync,
+	.open		= hfsplus_file_open,
+	.release	= hfsplus_file_release,
+	.unlocked_ioctl = hfsplus_ioctl,
+};
diff --git a/fs/hfsplus/hfsplus_fs.h b/fs/hfsplus/hfsplus_fs.h
index dd88053cc9b3..554733128fed 100644
--- a/fs/hfsplus/hfsplus_fs.h
+++ b/fs/hfsplus/hfsplus_fs.h
@@ -436,6 +436,11 @@ int hfsplus_rename_cat(u32 cnid, struct inode *src_dir, const struct qstr *src_n
 extern const struct inode_operations hfsplus_dir_inode_operations;
 extern const struct file_operations hfsplus_dir_operations;
 
+/* file.c */
+extern const struct file_operations hfsplus_file_operations;
+int hfsplus_file_fsync(struct file *file, loff_t start, loff_t end,
+		       int datasync);
+
 /* extents.c */
 int hfsplus_ext_cmp_key(const hfsplus_btree_key *k1,
 			const hfsplus_btree_key *k2);
@@ -468,8 +473,6 @@ int hfsplus_cat_write_inode(struct inode *inode);
 int hfsplus_getattr(const struct mnt_idmap *idmap, const struct path *path,
 		    struct kstat *stat, u32 request_mask,
 		    unsigned int query_flags);
-int hfsplus_file_fsync(struct file *file, loff_t start, loff_t end,
-		       int datasync);
 int hfsplus_fileattr_get(struct dentry *dentry, struct file_kattr *fa);
 int hfsplus_fileattr_set(const struct mnt_idmap *idmap,
 			 struct dentry *dentry, struct file_kattr *fa);
diff --git a/fs/hfsplus/inode.c b/fs/hfsplus/inode.c
index 8073fb99217d..b43422155e7e 100644
--- a/fs/hfsplus/inode.c
+++ b/fs/hfsplus/inode.c
@@ -269,35 +269,6 @@ static int hfsplus_get_perms(struct inode *inode,
 	return -EIO;
 }
 
-static int hfsplus_file_open(struct inode *inode, struct file *file)
-{
-	if (HFSPLUS_IS_RSRC(inode))
-		inode = HFSPLUS_I(inode)->rsrc_inode;
-	if (!(file->f_flags & O_LARGEFILE) && i_size_read(inode) > MAX_NON_LFS)
-		return -EOVERFLOW;
-	atomic_inc(&HFSPLUS_I(inode)->opencnt);
-	return 0;
-}
-
-static int hfsplus_file_release(struct inode *inode, struct file *file)
-{
-	struct super_block *sb = inode->i_sb;
-
-	if (HFSPLUS_IS_RSRC(inode))
-		inode = HFSPLUS_I(inode)->rsrc_inode;
-	if (atomic_dec_and_test(&HFSPLUS_I(inode)->opencnt)) {
-		inode_lock(inode);
-		hfsplus_file_truncate(inode);
-		if (inode->i_flags & S_DEAD) {
-			hfsplus_delete_cat(inode->i_ino,
-					   HFSPLUS_SB(sb)->hidden_dir, NULL);
-			hfsplus_delete_inode(inode);
-		}
-		inode_unlock(inode);
-	}
-	return 0;
-}
-
 static int hfsplus_setattr(const struct mnt_idmap *idmap,
 			   struct dentry *dentry, struct iattr *attr)
 {
@@ -354,83 +325,6 @@ int hfsplus_getattr(const struct mnt_idmap *idmap, const struct path *path,
 	return 0;
 }
 
-int hfsplus_file_fsync(struct file *file, loff_t start, loff_t end,
-		       int datasync)
-{
-	struct inode *inode = file->f_mapping->host;
-	struct hfsplus_inode_info *hip = HFSPLUS_I(inode);
-	struct super_block *sb = inode->i_sb;
-	struct hfsplus_sb_info *sbi = HFSPLUS_SB(inode->i_sb);
-	struct hfsplus_vh *vhdr = sbi->s_vhdr;
-	int error = 0, error2;
-
-	hfs_dbg("inode->i_ino %llu, start %llu, end %llu\n",
-		inode->i_ino, start, end);
-
-	error = file_write_and_wait_range(file, start, end);
-	if (error)
-		return error;
-
-	/*
-	 * Sync inode metadata into the catalog and extent trees.
-	 */
-	sync_inode_metadata(inode, 1);
-
-	/*
-	 * And explicitly write out the btrees.
-	 */
-	if (test_and_clear_bit(HFSPLUS_I_CAT_DIRTY,
-				&HFSPLUS_I(HFSPLUS_CAT_TREE_I(sb))->flags)) {
-		clear_bit(HFSPLUS_I_CAT_DIRTY, &hip->flags);
-		error = filemap_write_and_wait(sbi->cat_tree->inode->i_mapping);
-	}
-
-	if (test_and_clear_bit(HFSPLUS_I_EXT_DIRTY,
-				&HFSPLUS_I(HFSPLUS_EXT_TREE_I(sb))->flags)) {
-		clear_bit(HFSPLUS_I_EXT_DIRTY, &hip->flags);
-		error2 =
-			filemap_write_and_wait(sbi->ext_tree->inode->i_mapping);
-		if (!error)
-			error = error2;
-	}
-
-	if (sbi->attr_tree) {
-		if (test_and_clear_bit(HFSPLUS_I_ATTR_DIRTY,
-				&HFSPLUS_I(HFSPLUS_ATTR_TREE_I(sb))->flags)) {
-			clear_bit(HFSPLUS_I_ATTR_DIRTY, &hip->flags);
-			error2 =
-				filemap_write_and_wait(
-					    sbi->attr_tree->inode->i_mapping);
-			if (!error)
-				error = error2;
-		}
-	} else {
-		if (test_and_clear_bit(HFSPLUS_I_ATTR_DIRTY, &hip->flags))
-			pr_err("sync non-existent attributes tree\n");
-	}
-
-	if (test_and_clear_bit(HFSPLUS_I_ALLOC_DIRTY,
-				&HFSPLUS_I(sbi->alloc_file)->flags)) {
-		clear_bit(HFSPLUS_I_ALLOC_DIRTY, &hip->flags);
-		error2 = filemap_write_and_wait(sbi->alloc_file->i_mapping);
-		if (!error)
-			error = error2;
-	}
-
-	mutex_lock(&sbi->vh_mutex);
-	hfsplus_prepare_volume_header_for_commit(vhdr);
-	mutex_unlock(&sbi->vh_mutex);
-
-	error2 = hfsplus_commit_superblock(inode->i_sb);
-	if (!error)
-		error = error2;
-
-	if (!test_bit(HFSPLUS_SB_NOBARRIER, &sbi->flags))
-		blkdev_issue_flush(inode->i_sb->s_bdev);
-
-	return error;
-}
-
 static const struct inode_operations hfsplus_file_inode_operations = {
 	.setattr	= hfsplus_setattr,
 	.getattr	= hfsplus_getattr,
@@ -452,19 +346,6 @@ static const struct inode_operations hfsplus_special_inode_operations = {
 	.listxattr	= hfsplus_listxattr,
 };
 
-static const struct file_operations hfsplus_file_operations = {
-	.llseek		= generic_file_llseek,
-	.read_iter	= generic_file_read_iter,
-	.write_iter	= generic_file_write_iter,
-	.mmap_prepare	= generic_file_mmap_prepare,
-	.splice_read	= filemap_splice_read,
-	.splice_write	= iter_file_splice_write,
-	.fsync		= hfsplus_file_fsync,
-	.open		= hfsplus_file_open,
-	.release	= hfsplus_file_release,
-	.unlocked_ioctl = hfsplus_ioctl,
-};
-
 struct inode *hfsplus_new_inode(struct super_block *sb, struct inode *dir,
 				umode_t mode)
 {
-- 
2.53.0

