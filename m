Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.121.53.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795571304;
	b=Rdym5lR7RjbvSIH5Yx+9CfkHizCgyY8Z/c75yVei5Q+L8ioBdOCsKw3blVaEL+7y3pz+
	 zCVAAM1dRBvjan/mDu2siFdAiwFAKgEo9HESdwawqeskfhmRRr5AeOJxiwXF7nNDOK3Ad
	 uxAn+Q5+ZwExJa9BPjoyDye8mIlbCgaAZMEDNxuxnhc8L5H0OwqyVkbajJuRKWcxgkC1F
	 Duou7oNBQoW2QjCRyjQHMMH+3hghzcrgh/fpY74XqJy6RbUygYKFAN6VBYWgF1TDUSUeW
	 XsPIEZLXTIjI1D4qij6TYJ57bO++XxKTrLcPB0/YpHy7scAHLB2vlMC7DX3k2hSGVeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795571304;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=q3UvCa9I9SxglALDaPXAG6D+9mf24LuuOXRYC3IsXuU=;
	b=vfYgH+CcesszzqpSnY/jeB4XoAJgcnX8aOd2iHFy0taRyFeXUib43kX4AF7n65r7eXJf
	 TOmb/mWQTlQJzVEejKm7niBO+Ln35LxbtZNhLJodq/OHibXVU+aeqyVupqwLYFfc1m3+V
	 mm/5A2xPxjSLmFcuNAupFSLjLZ71/pSSKfcoyPyqJXxgW00IxTRDR065QC0CfDE40gchL
	 EyVoQrlbR23VBRdAH6RCZ8Bey8IFCQ5asekJRn1ozy4XpOK3G+8Dfq9r2XvQOSlEaGH4V
	 ObYCVEB8GjYGTyC2ILqUOUrM60y+6/p1LIqztfOsm6pd9JMr+/9sy8pa8q6QMDh9mcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=F8I24cOI;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=LwP1TR8C;
	arc=none smtp.remote-ip=188.121.53.22
Received: from sxplsmtpa04-02.prod.sxb1.secureserver.net (sxplsmtpa04-02.prod.sxb1.secureserver.net [188.121.53.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41531606A688
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:48:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41531606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=F8I24cOI;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=LwP1TR8C
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id W26zxdCHW8H3GW27MxX8NI; Wed, 25 Nov 2026 01:48:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1795571297;
	bh=q3UvCa9I9SxglALDaPXAG6D+9mf24LuuOXRYC3IsXuU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=F8I24cOIm4YiN3KV9w9dGV9kshmZEMzlWYKLdJ2Aprdc81ox91dHZCkFg4bheF1ts
	 fMaJiL22DdoVcT99YtPRJ9YKgyM3re6Yk72UXnkY7LAOLgWqOzTaUWQrZh0OEm1AjZ
	 qMkMpGvJtVX3ScL0SagUYV8QS0bsvn0Q6LESaA2nTMi7DH7l0MPMSot8SKTfEezf9G
	 EwbkWwju21MtY1wFDaAS1iiLDVO7R3gxAG4chfBWlxHRRZUvGI+7qOB/0dBco48PTU
	 lzFia7P6D90azGG1lSWuI4a3Dt4M4iWTuNlh8cFhjxStfKkiWXKUS6TWPrpgb7x/LF
	 I2GR0GB6FyHfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1795571297;
	bh=q3UvCa9I9SxglALDaPXAG6D+9mf24LuuOXRYC3IsXuU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LwP1TR8CyEXPXBtye6x3P5Jo+HmP2ShClOIWLIGV/4q8n5OOYTmdWXBhi69kL7vCt
	 yy216Sck9J/eAWvwXTmHEO/UFEh4umpuJhLV4WhHDnW4raEtcPLmvBSPu0bBYwx+jL
	 unNJisxZve6X/WblEqgsuSbUaf86jO7hQxPsfGMgmeJwxFZrGNMVN0cZAYgUrNwGsz
	 CeYHVbXYPDJRALsO/kN21VkvdOyEg87O+4e4ci/Hla2ARUQ/YyNoDKBg1f8RVik9YR
	 cugXf5Y03FJyiavfWsK1Itzb261YaR7Wq4g5j6TZmr6s/O6+NjIuYAX01W4SVep3H4
	 9u1cNT3TKUkZQ==
X-CMAE-Analysis: v=2.4 cv=Cuoq4X4D c=1 sm=1 tr=0 ts=6b063e61
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=zrJx8fS5UJxIVRjR8XIA:9 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: fa19a12c3dc3068e8a728f37c353e99c:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH v4 08/23] Squashfs: don't compute start or alloc memory on empty directory or index
Date: Wed, 25 Nov 2026 01:47:22 +0000
Message-ID: <20261125014737.347231-9-phillip@squashfs.org.uk>
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
X-CMAE-Envelope: MS4xfKrj397Ek9mZTGGGEkcA6blJ4gO9Uk8Q1EW10OA2sKImMSrE9R2y8ARcuu0Je00Nth0HLGERITg8RH8CNhs7hFouJ7zI5ofGlxmgelUpyZQCvgKJfISN
 vfWQoxOs0C6U2Ucr1UvtuNcFK7Is6lU3kyUpLSIzO3M6OolDdn3g98wS82box2+6SYsqo5HiymcfRqYTqRx5YdcFyWt7Wrk5mXk7BGu51qNBUQ+pIDT8dnIz
 +Y2TWo30vxwmUzEkF9mbepCVDxSULnmd3y8a+4xGoaiqINH1CulzzqnxcHRyDSeL

If a directory is empty (length equals 3), then there is no data to be
read from the filesystem.

This means we can optimise directory reading and lookup with empty
directories by skipping allocating memory to read data into, and
also skip computing the start location.

If the directory index is also empty, we can also skip allocating
memory when reading the index.

This commit also fixes the TRACE statements to display the start
and offset of the directory data within the directory table,
rather than the computed location on disk, or the incremented values
after squashfs_read_metadata() has been called.

It also adds sanity checks to ensure that the directory length is not
less than 3 bytes.

Signed-off-by: Phillip Lougher <phillip@squashfs.org.uk>
---
v4:
  - Ensure allocation is freed when jumping to finish label in
    squashfs_readdir()
  - Correct TRACE statement to use dir in squashfs_lookup()
---
 fs/squashfs/dir.c   | 31 ++++++++++++++++++++-----------
 fs/squashfs/inode.c | 16 ++++++++++++++--
 fs/squashfs/namei.c | 32 +++++++++++++++++++-------------
 3 files changed, 53 insertions(+), 26 deletions(-)

diff --git a/fs/squashfs/dir.c b/fs/squashfs/dir.c
index cd3598bd034f..28b4e5f2b90b 100644
--- a/fs/squashfs/dir.c
+++ b/fs/squashfs/dir.c
@@ -99,19 +99,14 @@ static int squashfs_readdir(struct file *file, struct dir_context *ctx)
 {
 	struct inode *inode = file_inode(file);
 	struct squashfs_sb_info *msblk = inode->i_sb->s_fs_info;
-	u64 block = squashfs_i(inode)->start + msblk->directory_table;
-	int offset = squashfs_i(inode)->offset, length, err;
+	u64 block;
+	int offset, length, err;
 	unsigned int inode_number, dir_count, size, type;
 	struct squashfs_dir_header dirh;
-	struct squashfs_dir_entry *dire;
+	struct squashfs_dir_entry *dire = NULL;
 
-	TRACE("Entered squashfs_readdir [%llx:%x]\n", block, offset);
-
-	dire = kmalloc(sizeof(*dire) + SQUASHFS_NAME_LEN + 1, GFP_KERNEL);
-	if (dire == NULL) {
-		ERROR("Failed to allocate squashfs_dir_entry\n");
-		goto finish;
-	}
+	TRACE("Entered squashfs_readdir [%llx:%x]\n", squashfs_i(inode)->start,
+			squashfs_i(inode)->offset);
 
 	/*
 	 * Return "." and  ".." entries as the first two filenames in the
@@ -142,6 +137,19 @@ static int squashfs_readdir(struct file *file, struct dir_context *ctx)
 		ctx->pos += size;
 	}
 
+	if (i_size_read(inode) == 3)
+		/* The directory is empty, nothing more to do */
+		goto finish;
+
+	dire = kmalloc(sizeof(*dire) + SQUASHFS_NAME_LEN + 1, GFP_KERNEL);
+	if (dire == NULL) {
+		ERROR("Failed to allocate squashfs_dir_entry\n");
+		goto finish;
+	}
+
+	block = squashfs_i(inode)->start + msblk->directory_table;
+	offset = squashfs_i(inode)->offset;
+
 	length = get_dir_index_using_offset(inode->i_sb, &block, &offset,
 				squashfs_i(inode)->dir_idx_start,
 				squashfs_i(inode)->dir_idx_offset,
@@ -211,7 +219,8 @@ static int squashfs_readdir(struct file *file, struct dir_context *ctx)
 	return 0;
 
 failed_read:
-	ERROR("Unable to read directory block [%llx:%x]\n", block, offset);
+	ERROR("Unable to read directory [%llx:%x]\n", squashfs_i(inode)->start,
+			squashfs_i(inode)->offset);
 	kfree(dire);
 	return 0;
 }
diff --git a/fs/squashfs/inode.c b/fs/squashfs/inode.c
index 66858fabed1a..96b5b9c336dd 100644
--- a/fs/squashfs/inode.c
+++ b/fs/squashfs/inode.c
@@ -257,8 +257,14 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 		if (err < 0)
 			goto failed_read;
 
-		set_nlink(inode, le32_to_cpu(sqsh_ino->nlink));
+		/* The directory size must be 3 or larger, as it includes "." and ".." entries */
 		inode->i_size = le16_to_cpu(sqsh_ino->file_size);
+		if (inode->i_size < 3) {
+			err = -EINVAL;
+			goto failed_read;
+		}
+
+		set_nlink(inode, le32_to_cpu(sqsh_ino->nlink));
 		inode->i_op = &squashfs_dir_inode_ops;
 		inode->i_fop = &squashfs_dir_ops;
 		inode->i_mode |= S_IFDIR;
@@ -282,9 +288,15 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 		if (err < 0)
 			goto failed_read;
 
+		/* The directory size must be 3 or larger, as it includes "." and ".." entries */
+		inode->i_size = le32_to_cpu(sqsh_ino->file_size);
+		if (inode->i_size < 3) {
+			err = -EINVAL;
+			goto failed_read;
+		}
+
 		xattr_id = le32_to_cpu(sqsh_ino->xattr);
 		set_nlink(inode, le32_to_cpu(sqsh_ino->nlink));
-		inode->i_size = le32_to_cpu(sqsh_ino->file_size);
 		inode->i_op = &squashfs_dir_inode_ops;
 		inode->i_fop = &squashfs_dir_ops;
 		inode->i_mode |= S_IFDIR;
diff --git a/fs/squashfs/namei.c b/fs/squashfs/namei.c
index 2260a3f05fde..30e9383f0992 100644
--- a/fs/squashfs/namei.c
+++ b/fs/squashfs/namei.c
@@ -72,6 +72,9 @@ static int get_dir_index_using_name(struct super_block *sb,
 
 	TRACE("Entered get_dir_index_using_name, i_count %d\n", i_count);
 
+	if (i_count == 0)
+		goto out;
+
 	index = kmalloc(sizeof(*index) + SQUASHFS_NAME_LEN + 1, GFP_KERNEL);
 	if (index == NULL) {
 		ERROR("Failed to allocate squashfs_dir_index\n");
@@ -126,13 +129,20 @@ static struct dentry *squashfs_lookup(struct inode *dir, struct dentry *dentry,
 	struct inode *inode = NULL;
 	struct squashfs_sb_info *msblk = dir->i_sb->s_fs_info;
 	struct squashfs_dir_header dirh;
-	struct squashfs_dir_entry *dire;
-	u64 block = squashfs_i(dir)->start + msblk->directory_table;
-	int offset = squashfs_i(dir)->offset;
-	int err, length;
+	struct squashfs_dir_entry *dire = NULL;
+	u64 block;
+	int offset, err, length;
 	unsigned int dir_count, size;
 
-	TRACE("Entered squashfs_lookup [%llx:%x]\n", block, offset);
+	TRACE("Entered squashfs_lookup [%llx:%x]\n", squashfs_i(dir)->start,
+			squashfs_i(dir)->offset);
+
+	if (len > SQUASHFS_NAME_LEN)
+		return ERR_PTR(-ENAMETOOLONG);
+
+	if (i_size_read(dir) == 3)
+		/* The directory is empty, and so there's nothing to do */
+		goto exit_lookup;
 
 	dire = kmalloc(sizeof(*dire) + SQUASHFS_NAME_LEN + 1, GFP_KERNEL);
 	if (dire == NULL) {
@@ -140,10 +150,8 @@ static struct dentry *squashfs_lookup(struct inode *dir, struct dentry *dentry,
 		return ERR_PTR(-ENOMEM);
 	}
 
-	if (len > SQUASHFS_NAME_LEN) {
-		err = -ENAMETOOLONG;
-		goto failed;
-	}
+	block = squashfs_i(dir)->start + msblk->directory_table;
+	offset = squashfs_i(dir)->offset;
 
 	length = get_dir_index_using_name(dir->i_sb, &block, &offset,
 				squashfs_i(dir)->dir_idx_start,
@@ -218,10 +226,8 @@ static struct dentry *squashfs_lookup(struct inode *dir, struct dentry *dentry,
 	err = -EIO;
 
 read_failure:
-	ERROR("Unable to read directory block [%llx:%x]\n",
-		squashfs_i(dir)->start + msblk->directory_table,
-		squashfs_i(dir)->offset);
-failed:
+	ERROR("Unable to read directory [%llx:%x]\n", squashfs_i(dir)->start,
+			squashfs_i(dir)->offset);
 	kfree(dire);
 	return ERR_PTR(err);
 }
-- 
2.47.3

