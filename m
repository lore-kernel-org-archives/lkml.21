Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=92.204.81.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795405448;
	b=3TyyMQCmUZctY5dj11KLzYUnuTOdlZ0H7GybRybszLYA3WyUxgYBndPLUfRbXuAfApoO
	 0YzYG8jG6r6k1K9IkxcL3ij8eFApy5Oi+Tjnw8xga6yVhM6ut0t6g2gUsEENW64YQ0Og5
	 Jgu+GeWieOf6wksn0bnZVt18YmD/uPJqwU4PVhOPMo8aUDiG4GUWHUGLQ5qoPBS9fjEct
	 gSVQE54rP/H1gWWIq6hDe1z4wwKa05OE//b74yjYNehKHlUEjJFoweIkdBy2ooL3gmmUo
	 Q6TOMhA+OWkKU2P4D1W+NdUwTGTrFOPBFO/yk2N9N36U1x2gJDl1YTUZgfhyqMSAqEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795405448;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=72RT40OaXhCYaHSIp8Jr4ac5DhP5yK0LfSmHS1h6B00=;
	b=avFWBm6PG4VSZ73eVJ/TFzkNdGdJBLGSetnZbBmvwdB/fpDsvimRaIP3r7HwOSbTqEk7
	 1D3DWh1b+h3Bf2Q7XzNtSrtdxFFL07Wkwb/Weilj+RtSjEncEd0G0KS636qomhVVwOus/
	 C1nMWiXLCVprmiGTMYV2MTaL3r7BKAxW8hw6UUwNkuCCDfrIx2QB00HaeMtr61F55XGWi
	 6rp9fOFifqiWfqb3UPxhDRpeEUb7VuYZe1fS/nuYHrs9vQWNAUT3b5tEBjEU6JJHpLKzv
	 FbwGco9gWx0yt++LibrrW0eZdExFtKuaHsFJyMoNfHH/xcJNsq/c+6PHV7rabmQPKjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=ltpgf13h;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=oNkzDp3a;
	arc=none smtp.remote-ip=92.204.81.44
Received: from sxplsmtpa04-04.prod.sxb1.secureserver.net (sxplsmtpa04-04.prod.sxb1.secureserver.net [92.204.81.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0A9606A698
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:44:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F0A9606A698
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=ltpgf13h;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=oNkzDp3a
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id VKxRxJoOeZuU3VKy9xiqSA; Mon, 23 Nov 2026 03:43:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1795405434;
	bh=72RT40OaXhCYaHSIp8Jr4ac5DhP5yK0LfSmHS1h6B00=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ltpgf13hbfhe+552qQByEdf9ekCUxLro6bKGASXyQsofMNNsa7f+dfydj9cx40j7w
	 qztgyTplP8JzaR3ryZ9uIskUAJfWE/CCzUuxyPPgwd7eas4hwktZddS+N88KEes824
	 /jQdLQyG8MvyEDQDkhT+QV0ksHs804t4I95cHDHC8poht+7HxQ/lmiiAa8HZbICvc8
	 MWWPXcxxABhS4Qich3rGviIu6qY25EZZYy0aPiEJ5m3XU6nK2FTjZyPo5EjCSI9vtI
	 wtagqxgT/Y6y9qh3OF5gWU9PDmG/D0jAt5JjJT7LCE/vFzYuBKqfahIsChXBJqmK+u
	 kz/b1ehWxguYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1795405434;
	bh=72RT40OaXhCYaHSIp8Jr4ac5DhP5yK0LfSmHS1h6B00=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oNkzDp3a5A39xrgfWCuk4F0Wkjchnb2UwGt5E8ptJEl61zNbTLX7brZPGvzuSKg3z
	 XflDCsLF9jjIfVUbYr/UaRO1aYCyQa+Na7QKPIgq+tC8NclAuBifB2JWrWaBqTYQjk
	 tKdGk1eLTMaSXHzm4v7qa3vPAPqFRXEpetcsxkY5gu5HB/DTg2rlSATUy9avBMFzXr
	 RIgu6Kgb7jQQMGj6/QCFQYrpbxH2emq3Ry/y/4PappG8lbS5Oo3Cd9XONwLOpT3+rz
	 MEf00LuPLwetuKpptyANaJfURL5PkB382LhHPJELzLsgQR6wR4rKhp177BEYCs0X+P
	 Y3ugQIlH566OQ==
X-CMAE-Analysis: v=2.4 cv=CvYq4X4D c=1 sm=1 tr=0 ts=6b03b67a
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=BjB-n3F9ADh-iJCbTToA:9 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: 7c19ae41247f5f82d3f679224c016e3c:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH v3 20/23] Squashfs: don't store large xattr id table indexes in memory
Date: Mon, 23 Nov 2026 03:43:01 +0000
Message-ID: <20261123034304.261742-21-phillip@squashfs.org.uk>
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
X-CMAE-Envelope: MS4xfEMSiCR+dfMie9xKtxBuVJuRCHn5AyNW/KtjRoZPIvc+waIUqVXULDC2o1HpOAsMeuGjlvYyNF13O/fLkSK0qY9ADD/YL9kgUzB1hKCObxiaeNdlQ/V3
 KnGtzdGEKa+hQCLog46pi5Q26C5L2DaNIUu6yJxvdsFfIM7bSqqpjyT+aN0I/Vn7qrLOMWrsDC9TZyZU13ZC3b3CZQG1dICxHXKyPvy7fFTi3VobhSMlgt1b
 GkfVAiT8PRm1AX0ocFFacZ5lwnVyLZTdwPH6KzuVQh0Ukqxui2ATLnIUBVMdwEFi

When mounting a Squashfs filesystem, the code reads the entire xattr id
table indexes into memory.  Their size is determined by the number of
xattr ids in the filesystem, where the maximum number of xattr ids is
2^32, and this will allocate and read 64 MiB.

This is an excessive and unnecessary amount of memory because the
indexes do not need to be read into memory in their entirety.  In
addition kmalloc() is used to allocate memory, and this can fail when
large amounts of memory are requested.  Kmalloc() on modern kernels is
usually limited to 4096 KiB.  If panic-on-warn is set, then failure to
allocate memory will result in a kernel panic.

This commit uses a 4 page cache if the size of the xattr id table
indexes are 4 pages or larger.  A simple and fast lookup array is
retained where the total index size is less than 4 pages in size, which
is the vast majority of Squashfs filesystems.

Reproducer
==========

The following reproducer will create a Squashfs filesystem with
280 million xattr ids, which will cause the xattr id table indexes to
exceed 4096 KiB, and the kmalloc() should fail when the filesystem is
mounted.

=====================================================================
#!/bin/bash

ARGS="-pf pseudo -mem 100m -no-hardlinks -no-sparse -no-duplicates "
ARGS+="-no-exports -no-recovery -no-progress -no-xattr-dups"

finish() {
	popd 2>&1 > /dev/null
	rm -rf $DIR
	exit 1
}

IMG=$PWD/reproducer.sqsh
DIR=$(mktemp -d)

if [ -e $IMG ]; then
	rm $IMG
fi

pushd $DIR 2>&1 > /dev/null

# create 20 million pseudo file links to empty file
touch a
a=0
while [ $a -le 19 ]; do
	b=0
	while [ $b -le 999 ]; do
		c=0
		while [ $c -le 999 ]; do
			echo "X/$a/$b/$c l a" >> file
			echo "X/$a/$b/$c x user.x=1" >> file
			(( c ++ ))
		done
		(( b ++ ))
	done
	(( a ++ ))
done

for i in $(seq 1 14); do
	sed "s/X/$i/g" file > pseudo
	echo
	echo Iteration $i - appending 20 million files to Squashfs filesystem
	echo
	if ! mksquashfs - $IMG -pd "d 0777 0 0" $ARGS; then
		echo Appending to Squashfs filesystem failed
		finish
	fi
done

popd 2>&1 > /dev/null
rm -rf $DIR

echo Generated Squashfs filesystem $IMG
=====================================================================

Fixes: 4b5397dc24ab1 ("squashfs: add xattr id support")
Signed-off-by: Phillip Lougher <phillip@squashfs.org.uk>
---
v3:
  - Widen return value of squashfs_xattr_blocks_offset() to s32.
v2:
  - Widen offset in squashfs_xattr_lookup_start() to s32, to prevent
    overflow when PAGE_SIZE is 64 KiB or larger.
---
 fs/squashfs/inode.c            |   2 +-
 fs/squashfs/squashfs_fs_sb.h   |   8 +-
 fs/squashfs/squashfs_helpers.h |  29 +++++-
 fs/squashfs/super.c            |  26 +++--
 fs/squashfs/xattr.c            |  22 +++--
 fs/squashfs/xattr.h            |  15 ++-
 fs/squashfs/xattr_id.c         | 169 +++++++++++++++++++++++----------
 7 files changed, 198 insertions(+), 73 deletions(-)

diff --git a/fs/squashfs/inode.c b/fs/squashfs/inode.c
index 15db4ac3fa75..4cf8a41b5859 100644
--- a/fs/squashfs/inode.c
+++ b/fs/squashfs/inode.c
@@ -446,7 +446,7 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 		return -EINVAL;
 	}
 
-	if (xattr_id != SQUASHFS_INVALID_XATTR && msblk->xattr_id_table) {
+	if (xattr_id != SQUASHFS_INVALID_XATTR && msblk->xattr_id_array) {
 		err = squashfs_xattr_lookup(sb, xattr_id,
 					&squashfs_i(inode)->xattr_count,
 					&squashfs_i(inode)->xattr_size,
diff --git a/fs/squashfs/squashfs_fs_sb.h b/fs/squashfs/squashfs_fs_sb.h
index 77f7085ad2d0..52ff4f270939 100644
--- a/fs/squashfs/squashfs_fs_sb.h
+++ b/fs/squashfs/squashfs_fs_sb.h
@@ -63,7 +63,10 @@ struct squashfs_sb_info {
 		__le64				*fragment_index_array;
 		struct squashfs_cache		*fragment_index_cache;
 	};
-	__le64					*xattr_id_table;
+	union {
+		__le64				*xattr_id_array;
+		struct squashfs_cache		*xattr_id_cache;
+	};
 	struct mutex				meta_index_mutex;
 	struct meta_index			*meta_index;
 	void					*stream;
@@ -79,6 +82,8 @@ struct squashfs_sb_info {
 	u64					xattr_table;
 	u64					lookup_table;
 	u64					lookup_table_start;
+	u64					xattr_id_table;
+	u64					xattr_id_table_start;
 	unsigned int				block_size;
 	unsigned short				block_log;
 	long long				bytes_used;
@@ -91,5 +96,6 @@ struct squashfs_sb_info {
 	int					max_thread_num;
 	bool					lookup_table_is_cache;
 	bool					fragment_index_is_cache;
+	bool					xattr_id_is_cache;
 };
 #endif
diff --git a/fs/squashfs/squashfs_helpers.h b/fs/squashfs/squashfs_helpers.h
index 8615228914b9..9423d5a0a700 100644
--- a/fs/squashfs/squashfs_helpers.h
+++ b/fs/squashfs/squashfs_helpers.h
@@ -241,11 +241,38 @@ static inline s32 squashfs_xattr_blocks(u32 xattrs)
 		SQUASHFS_METADATA_SIZE;
 }
 
-static inline s32 squashfs_xattr_block_bytes(u32 xattrs)
+static inline s32 squashfs_xattr_blocks_bytes(u32 xattrs)
 {
 	return squashfs_xattr_blocks(xattrs) * sizeof(long long);
 }
 
+static inline s32 squashfs_xattr_blocks_base(u32 xattrs)
+{
+	return (squashfs_xattr_block(xattrs) * sizeof(long long)) & ~(PAGE_SIZE - 1);
+}
+
+static inline s64 squashfs_xattr_blocks_start(u32 xattrs, struct squashfs_sb_info *msblk)
+{
+	s32 base = squashfs_xattr_blocks_base(xattrs);
+	s64 table_start = msblk->xattr_id_table + sizeof(struct squashfs_xattr_id_table);
+	s64 start;
+
+	if (S64_MAX - table_start < base)
+		return -EINVAL;
+
+	start = table_start + base;
+
+	if (start > msblk->bytes_used)
+		return -EINVAL;
+
+	return start;
+}
+
+static inline s32 squashfs_xattr_blocks_offset(u32 xattrs)
+{
+	return (squashfs_xattr_block(xattrs) * sizeof(long long)) & (PAGE_SIZE - 1);
+}
+
 static inline u32 squashfs_xattr_blk(s64 xattr)
 {
 	return xattr >> 16;
diff --git a/fs/squashfs/super.c b/fs/squashfs/super.c
index 287cbc6ad41c..b7deedb0850f 100644
--- a/fs/squashfs/super.c
+++ b/fs/squashfs/super.c
@@ -193,6 +193,14 @@ static void squashfs_free_fragment_indexes(struct squashfs_sb_info *msblk)
 		kfree(msblk->fragment_index_array);
 }
 
+static void squashfs_free_xattr_indexes(struct squashfs_sb_info *msblk)
+{
+	if (msblk->xattr_id_is_cache)
+		squashfs_cache_delete(msblk->xattr_id_cache);
+	else
+		kfree(msblk->xattr_id_array);
+}
+
 static int squashfs_fill_super(struct super_block *sb, struct fs_context *fc)
 {
 	struct squashfs_mount_opts *opts = fc->fs_private;
@@ -202,7 +210,7 @@ static int squashfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	long long root_inode;
 	unsigned short flags;
 	unsigned int fragments;
-	u64 xattr_id_table_start, next_table;
+	u64 next_table;
 	s64 err;
 	int devblksize = sb_min_blocksize(sb, SQUASHFS_DEVBLK_SIZE);
 
@@ -376,19 +384,17 @@ static int squashfs_fill_super(struct super_block *sb, struct fs_context *fc)
 
 	/* Handle xattrs */
 	sb->s_xattr = squashfs_xattr_handlers;
-	xattr_id_table_start = le64_to_cpu(sblk->xattr_id_table_start);
-	if (xattr_id_table_start == SQUASHFS_INVALID_BLK) {
+	msblk->xattr_id_table = le64_to_cpu(sblk->xattr_id_table_start);
+	if (msblk->xattr_id_table == SQUASHFS_INVALID_BLK) {
 		next_table = msblk->bytes_used;
 		goto allocate_id_index_table;
 	}
 
 	/* Allocate and read xattr id lookup table */
-	msblk->xattr_id_table = squashfs_read_xattr_id_table(sb,
-		xattr_id_table_start, &msblk->xattr_table, &msblk->xattr_ids);
-	if (IS_ERR(msblk->xattr_id_table)) {
+	err = squashfs_read_xattr_id_table(sb, msblk->xattr_id_table,
+				&msblk->xattr_table, &msblk->xattr_ids);
+	if (err < 0) {
 		errorf(fc, "unable to read xattr id index table");
-		err = PTR_ERR(msblk->xattr_id_table);
-		msblk->xattr_id_table = NULL;
 		if (err != -ENOTSUPP)
 			goto failed_mount;
 	}
@@ -507,7 +513,7 @@ static int squashfs_fill_super(struct super_block *sb, struct fs_context *fc)
 	squashfs_free_inode_table(msblk);
 	squashfs_free_fragment_indexes(msblk);
 	kfree(msblk->id_table);
-	kfree(msblk->xattr_id_table);
+	squashfs_free_xattr_indexes(msblk);
 	kfree(sb->s_fs_info);
 	sb->s_fs_info = NULL;
 	kfree(sblk);
@@ -628,7 +634,7 @@ static void squashfs_put_super(struct super_block *sb)
 		squashfs_free_fragment_indexes(sbi);
 		kfree(sbi->meta_index);
 		squashfs_free_inode_table(sbi);
-		kfree(sbi->xattr_id_table);
+		squashfs_free_xattr_indexes(sbi);
 		kfree(sb->s_fs_info);
 		sb->s_fs_info = NULL;
 	}
diff --git a/fs/squashfs/xattr.c b/fs/squashfs/xattr.c
index d7247648ac35..18ab9b67a0e6 100644
--- a/fs/squashfs/xattr.c
+++ b/fs/squashfs/xattr.c
@@ -30,10 +30,9 @@ ssize_t squashfs_listxattr(struct dentry *d, char *buffer,
 	struct inode *inode = d_inode(d);
 	struct super_block *sb = inode->i_sb;
 	struct squashfs_sb_info *msblk = sb->s_fs_info;
-	u64 start = squashfs_xattr_blk(squashfs_i(inode)->xattr)
-						+ msblk->xattr_table;
-	int offset = squashfs_xattr_offset(squashfs_i(inode)->xattr);
-	unsigned int count = squashfs_i(inode)->xattr_count;
+	u64 start;
+	int offset;
+	unsigned int count;
 	size_t rest = buffer_size;
 	int err;
 
@@ -41,9 +40,13 @@ ssize_t squashfs_listxattr(struct dentry *d, char *buffer,
 	if (squashfs_i(inode)->xattr == SQUASHFS_INVALID_BLK)
 		return 0;
 
+	count = squashfs_i(inode)->xattr_count;
 	if (count == 0 || count > squashfs_i(inode)->xattr_size)
 		return -EIO;
 
+	start = squashfs_xattr_blk(squashfs_i(inode)->xattr) + msblk->xattr_table;
+	offset = squashfs_xattr_offset(squashfs_i(inode)->xattr);
+
 	/* loop reading each xattr name */
 	while (count--) {
 		struct squashfs_xattr_entry entry;
@@ -111,10 +114,9 @@ static int squashfs_xattr_get(struct inode *inode, int name_index,
 {
 	struct super_block *sb = inode->i_sb;
 	struct squashfs_sb_info *msblk = sb->s_fs_info;
-	u64 start = squashfs_xattr_blk(squashfs_i(inode)->xattr)
-						+ msblk->xattr_table;
-	int offset = squashfs_xattr_offset(squashfs_i(inode)->xattr);
-	unsigned int count = squashfs_i(inode)->xattr_count;
+	u64 start;
+	int offset;
+	unsigned int count;
 	int name_len = strlen(name);
 	int err, vsize;
 	char *target;
@@ -123,6 +125,7 @@ static int squashfs_xattr_get(struct inode *inode, int name_index,
 	if (squashfs_i(inode)->xattr == SQUASHFS_INVALID_BLK)
 		return -ENODATA;
 
+	count = squashfs_i(inode)->xattr_count;
 	if (count == 0 || count > squashfs_i(inode)->xattr_size)
 		return -EIO;
 
@@ -130,6 +133,9 @@ static int squashfs_xattr_get(struct inode *inode, int name_index,
 	if (target == NULL)
 		return -ENOMEM;
 
+	start = squashfs_xattr_blk(squashfs_i(inode)->xattr) + msblk->xattr_table;
+	offset = squashfs_xattr_offset(squashfs_i(inode)->xattr);
+
 	/* loop reading each xattr name */
 	for (; count; count--) {
 		struct squashfs_xattr_entry entry;
diff --git a/fs/squashfs/xattr.h b/fs/squashfs/xattr.h
index b33e9ad4057f..799b328b0e6c 100644
--- a/fs/squashfs/xattr.h
+++ b/fs/squashfs/xattr.h
@@ -9,25 +9,26 @@
  */
 
 #ifdef CONFIG_SQUASHFS_XATTR
-extern __le64 *squashfs_read_xattr_id_table(struct super_block *, u64,
+extern int squashfs_read_xattr_id_table(struct super_block *, u64,
 		u64 *, unsigned int *);
 extern int squashfs_xattr_lookup(struct super_block *, unsigned int,
 		unsigned int *, unsigned int *, unsigned long long *);
+extern s64 squashfs_xattr_lookup_start(struct super_block *sb, u32 index);
 #else
-static inline __le64 *squashfs_read_xattr_id_table(struct super_block *sb,
+static inline int squashfs_read_xattr_id_table(struct super_block *sb,
 		u64 start, u64 *xattr_table_start, unsigned int *xattr_ids)
 {
 	struct squashfs_xattr_id_table *id_table;
 
 	id_table = squashfs_read_table(sb, start, sizeof(*id_table));
 	if (IS_ERR(id_table))
-		return (__le64 *) id_table;
+		return PTR_ERR(id_table);
 
 	*xattr_table_start = le64_to_cpu(id_table->xattr_table_start);
 	kfree(id_table);
 
 	ERROR("Xattrs in filesystem, these will be ignored\n");
-	return ERR_PTR(-ENOTSUPP);
+	return -ENOTSUPP;
 }
 
 static inline int squashfs_xattr_lookup(struct super_block *sb,
@@ -36,6 +37,12 @@ static inline int squashfs_xattr_lookup(struct super_block *sb,
 {
 	return 0;
 }
+
+static inline s64 squashfs_xattr_lookup_start(struct super_block *sb, u32 index)
+{
+	return 0;
+}
+
 #define squashfs_listxattr NULL
 #define squashfs_xattr_handlers NULL
 #endif
diff --git a/fs/squashfs/xattr_id.c b/fs/squashfs/xattr_id.c
index 621777e0a3b4..bf6efc604bd3 100644
--- a/fs/squashfs/xattr_id.c
+++ b/fs/squashfs/xattr_id.c
@@ -23,6 +23,45 @@
 #include "squashfs.h"
 #include "xattr.h"
 
+s64 squashfs_xattr_lookup_start(struct super_block *sb, u32 index)
+{
+	struct squashfs_sb_info *msblk = sb->s_fs_info;
+	s64 start;
+
+	if (msblk->xattr_id_is_cache) {
+		s32 length = squashfs_xattr_blocks_bytes(msblk->xattr_ids);
+		s32 base = squashfs_xattr_blocks_base(index);
+		s32 offset = squashfs_xattr_blocks_offset(index);
+		s32 avail = min_t(int, length - base, PAGE_SIZE);
+		struct squashfs_cache_entry *entry;
+
+		start = squashfs_xattr_blocks_start(index, msblk);
+		if (start < 0)
+			return start;
+
+		entry = squashfs_cache_get(sb, msblk->xattr_id_cache, start,
+				avail | SQUASHFS_COMPRESSED_BIT_BLOCK);
+		if (entry->error < 0) {
+			int err = entry->error;
+
+			squashfs_cache_put(entry);
+			return err;
+		}
+
+		start = le64_to_cpu(((__le64 *)entry->data[0])[offset >> 3]);
+		squashfs_cache_put(entry);
+	} else {
+		s32 block = squashfs_xattr_block(index);
+
+		start = le64_to_cpu(msblk->xattr_id_array[block]);
+	}
+
+	if (start < msblk->xattr_id_table_start || start >= msblk->xattr_id_table)
+		return -EIO;
+
+	return start;
+}
+
 /*
  * Map xattr id using the xattr id look up table
  */
@@ -31,19 +70,19 @@ int squashfs_xattr_lookup(struct super_block *sb, unsigned int index,
 		unsigned long long *xattr)
 {
 	struct squashfs_sb_info *msblk = sb->s_fs_info;
-	int block = squashfs_xattr_block(index);
-	int offset = squashfs_xattr_block_offset(index);
-	u64 start_block;
+	s32 offset = squashfs_xattr_block_offset(index);
+	s64 start;
 	struct squashfs_xattr_id id;
 	int err;
 
 	if (index >= msblk->xattr_ids)
 		return -EINVAL;
 
-	start_block = le64_to_cpu(msblk->xattr_id_table[block]);
+	start = squashfs_xattr_lookup_start(sb, index);
+	if (start < 0)
+		return start;
 
-	err = squashfs_read_metadata(sb, &id, &start_block, &offset,
-							sizeof(id));
+	err = squashfs_read_metadata(sb, &id, &start, &offset, sizeof(id));
 	if (err < 0)
 		return err;
 
@@ -57,19 +96,19 @@ int squashfs_xattr_lookup(struct super_block *sb, unsigned int index,
 /*
  * Read uncompressed xattr id lookup table indexes from disk into memory
  */
-__le64 *squashfs_read_xattr_id_table(struct super_block *sb, u64 table_start,
+int squashfs_read_xattr_id_table(struct super_block *sb, u64 table_start,
 		u64 *xattr_table_start, unsigned int *xattr_ids)
 {
 	struct squashfs_sb_info *msblk = sb->s_fs_info;
-	unsigned int len, indexes;
+	s32 len;
 	struct squashfs_xattr_id_table *id_table;
-	__le64 *table;
 	u64 start, end;
-	int n;
+	s64 res;
 
+	/* Untrusted table_start will be validated by squashfs_read_data() */
 	id_table = squashfs_read_table(sb, table_start, sizeof(*id_table));
 	if (IS_ERR(id_table))
-		return (__le64 *) id_table;
+		return PTR_ERR(id_table);
 
 	*xattr_table_start = le64_to_cpu(id_table->xattr_table_start);
 	*xattr_ids = le32_to_cpu(id_table->xattr_ids);
@@ -79,10 +118,9 @@ __le64 *squashfs_read_xattr_id_table(struct super_block *sb, u64 table_start,
 
 	/* there is always at least one xattr id */
 	if (*xattr_ids == 0)
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
 
-	len = squashfs_xattr_block_bytes(*xattr_ids);
-	indexes = squashfs_xattr_blocks(*xattr_ids);
+	len = squashfs_xattr_blocks_bytes(*xattr_ids);
 
 	/*
 	 * The computed size of the index table (len bytes) should exactly
@@ -92,43 +130,78 @@ __le64 *squashfs_read_xattr_id_table(struct super_block *sb, u64 table_start,
 	end = msblk->bytes_used;
 
 	if (len != (end - start))
-		return ERR_PTR(-EINVAL);
-
-	table = squashfs_read_table(sb, start, len);
-	if (IS_ERR(table))
-		return table;
-
-	/* table[0], table[1], ... table[indexes - 1] store the locations
-	 * of the compressed xattr id blocks.  Each entry should be less than
-	 * the next (i.e. table[0] < table[1]), and the difference between them
-	 * should be SQUASHFS_METADATA_SIZE or less.  table[indexes - 1]
-	 * should be less than table_start, and again the difference
-	 * shouls be SQUASHFS_METADATA_SIZE or less.
-	 *
-	 * Finally xattr_table_start should be less than table[0].
-	 */
-	for (n = 0; n < (indexes - 1); n++) {
-		start = le64_to_cpu(table[n]);
-		end = le64_to_cpu(table[n + 1]);
-
-		if (start >= end || (end - start) >
-				(SQUASHFS_METADATA_SIZE + SQUASHFS_BLOCK_OFFSET)) {
-			kfree(table);
-			return ERR_PTR(-EINVAL);
+		return -EINVAL;
+
+	if (len <= (PAGE_SIZE * 4)) {
+		/* Read fragment indexes into memory */
+		s32 n, indexes = squashfs_xattr_blocks(*xattr_ids);
+		__le64 *array = squashfs_read_table(sb, start, len);
+
+		if (IS_ERR(array))
+			return PTR_ERR(array);
+
+		/* array[0], array[1], ... array[indexes - 1] store the locations
+		 * of the compressed xattr id blocks.  Each entry should be less than
+		 * the next (i.e. array[0] < array[1]), and the difference between them
+		 * should be SQUASHFS_METADATA_SIZE or less.  array[indexes - 1]
+		 * should be less than array_start, and again the difference
+		 * shouls be SQUASHFS_METADATA_SIZE or less.
+		 *
+		 * Finally xattr_array_start should be less than array[0].
+		 */
+		for (n = 0; n < (indexes - 1); n++) {
+			start = le64_to_cpu(array[n]);
+			end = le64_to_cpu(array[n + 1]);
+
+			if (start >= end || (end - start) >
+					(SQUASHFS_METADATA_SIZE + SQUASHFS_BLOCK_OFFSET)) {
+				kfree(array);
+				return -EINVAL;
+			}
 		}
-	}
 
-	start = le64_to_cpu(table[indexes - 1]);
-	if (start >= table_start || (table_start - start) >
-				(SQUASHFS_METADATA_SIZE + SQUASHFS_BLOCK_OFFSET)) {
-		kfree(table);
-		return ERR_PTR(-EINVAL);
-	}
+		start = le64_to_cpu(array[indexes - 1]);
+		if (start >= table_start || (table_start - start) >
+					(SQUASHFS_METADATA_SIZE + SQUASHFS_BLOCK_OFFSET)) {
+			kfree(array);
+			return -EINVAL;
+		}
+
+		msblk->xattr_id_table_start = le64_to_cpu(array[0]);
+		if (*xattr_table_start >= msblk->xattr_id_table_start) {
+			kfree(array);
+			return -EINVAL;
+		}
+
+		msblk->xattr_id_array = array;
+		msblk->xattr_id_is_cache = false;
+	} else {
+		/* Use a cache to store the last 16Kbytes of indexes read */
+		struct squashfs_cache *cache = squashfs_cache_init("xattr index", 4, PAGE_SIZE);
+
+		if (IS_ERR(cache))
+			return PTR_ERR(cache);
 
-	if (*xattr_table_start >= le64_to_cpu(table[0])) {
-		kfree(table);
-		return ERR_PTR(-EINVAL);
+		msblk->xattr_id_cache = cache;
+		msblk->xattr_id_is_cache = true;
+		msblk->xattr_id_table_start = 0;
+
+		res = squashfs_xattr_lookup_start(sb, 0);
+		if (res < 0)
+			goto corrupted;
+
+		if (*xattr_table_start >= res) {
+			res = -EINVAL;
+			goto corrupted;
+		}
+
+		msblk->xattr_id_table_start = res;
 	}
 
-	return table;
+	return 0;
+
+corrupted:
+	squashfs_cache_delete(msblk->xattr_id_cache);
+	msblk->xattr_id_cache = NULL;
+	return res;
 }
-- 
2.47.3

