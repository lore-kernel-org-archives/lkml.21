Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.121.53.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795405445;
	b=esLisBva3B63Xr89kl72zvA+JqVmkq93+qJ8ZGw+VtxPTT0Vd0J6vhZkZndpApe808Qt
	 t/vX6a4o/QDW2bx8zISOhCK5bT4zlGBBpPy1Ipu/JsKq5F/oDZraqurs9rj3z6cmpORNF
	 McDYUgjLhO7QSAHxJyCMFSBX5+DpsXY082U6Mf8x4RDYZ4EFwt+s/BALYph0R9ncxDC/k
	 0le4Zqmx1h3dB3rVs/EbHfx54F43ZCecGYcYu9ppeNyh+0vcrTSOQN38/HGslxTZ8hFlt
	 eAwR8RfoxYN71M0Stn8PjgZd0KqT3Il9JvOqCYnjF/Aw2V4059HHl1DPkWY/KQG0bnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795405445;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=sbWSJxuPvas/13hRi+AyjgnEBVy2grelu1Ifcn8xJtI=;
	b=aYTk4Fczr4AAw4HZTgh8yjmemumeus4zwrarNns2x3LkAQ5gfppEehpREjmNoGOUerbS
	 XjsQbOWoMOfgmmRDZSFYRAZ0YhrQ/4dNF3VxT09pf4LmkcTqsK+Emjr9xb122zvu+/pXZ
	 K4t8EXPXv4r619YI35JGEM4FBUphfOCwmCoPpouCnvNkLSlJjAzLUD+q0TG40bEC9tDbZ
	 G9s0XBzSHR/gXThvRs5t0O1e9kPtBqpW/Hr6UAl9x2kcMtMb/dV8svQNec0bOeUl7+Hwq
	 X6ZXbx3Q2QXTNmsmUxEmdWIaompYevu7V3EruPhdiYHp8jWl9Q8n8x9IN5jwopck2Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=igkM5Aoj;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=Ufml50IE;
	arc=none smtp.remote-ip=188.121.53.34
Received: from sxplsmtpa04-04.prod.sxb1.secureserver.net (sxplsmtpa04-04.prod.sxb1.secureserver.net [188.121.53.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19680606A6A6
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:44:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19680606A6A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=igkM5Aoj;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=Ufml50IE
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id VKxRxJoOeZuU3VKyAxiqSH; Mon, 23 Nov 2026 03:43:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1795405436;
	bh=sbWSJxuPvas/13hRi+AyjgnEBVy2grelu1Ifcn8xJtI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=igkM5Aoj9LxB7qXXOHOnrYXGd5Be7treWAKAlxdWKLDHR4MtgyiOHRwUb+4RzsP+t
	 OCrPzTaWZerQGmQNcvhPZ2cplukgJP9x95cPTHHx64lLynDqGdKSvXPELm8wtZTLoa
	 WuWdxfS8PZCuZ1QHkl3/du5xkxWJ3gyHoTveDe3Ycxv+F5KDhPw+WIy82egjlZ2Sg9
	 1z17B0GihjOqOPX+sikvY2yEtjG4zzki3l+LJdZcToeQZsbUoyca/R3L20u56OFBtV
	 EeRmmiT3faJOGJRq2LZxGLfU4XWr/53tddnGwgNfHoOFgAHNrPWCE5sdMMkM3I/gh0
	 LBvDF7A9c5GLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1795405436;
	bh=sbWSJxuPvas/13hRi+AyjgnEBVy2grelu1Ifcn8xJtI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ufml50IE+9TM6maGhll55khCx5JmdR5w3tk3regGLa6nUDCF2HRLVz8anXQtiJ8yO
	 l9ns4ymFK+03ZoiYzvNh8O/OdfV48O6ajrnIvh2rqj9wqAf4Dw5Wwajd2bKxGYr2PS
	 1WsQ5OtYcFU8qKKfE1kIxRMPU6Zahx5KfwfPiufbqciCZ2Ut8u3+nNLh5EIJHGC6NZ
	 AiqtBrmfScjIPxLztILQw+BJ89wiXcRO8GaU119Ig9mYLht2jeWqqRr1X4+6ST1i37
	 GIJaM17mI0A8qoLlxGyQimp3v87jlpY6AZ8PXbN0ocYc4ZOv49SLdpNvdcA2A/7Moq
	 1ySLzP+EitTAw==
X-CMAE-Analysis: v=2.4 cv=CvYq4X4D c=1 sm=1 tr=0 ts=6b03b67b
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=s_LaVScA0W0p5u1UVmwA:9 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: b7d0e354493f31dc0bf3dc256b108c9c:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH v3 21/23] Squashfs: fix variables in directory code and add more sanity checks
Date: Mon, 23 Nov 2026 03:43:02 +0000
Message-ID: <20261123034304.261742-22-phillip@squashfs.org.uk>
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
X-CMAE-Envelope: MS4xfCqh+nxqISKwM4RE6bP1BN5KbsRBvHAgf6r6dSuAvUjmPapslTHam2kWnGC6mvJrei8KdVOudbVR6bB6oi1pDSNp+TO/h/lhFkaFVvM6GvjoM72BN2wQ
 vOPHy8B4YExe1DkmCTtY8K3FXMQuYHN3CZDaEhZSp0VzYQsKmyOPfpNL0LYJkFjMLdSeWiIMcVqcEXDgZAlZ7QCELUcPxtSnCwUT3ecipZ6osBeKmLlGd654
 3LCDiH7QUOzH+0e/1l3bZ9ztvrQ1MTdRYG70mdkWtFltrLS6pTVesvgtUc30HMea

A directory larger than a metadata block (8192 bytes) will have a
directory index to allow faster reading and lookup of names.  This
index allows the code to jump to the desired compressed metadata block,
without requiring the directory to be scanned from the beginning.

But the index handling code has a defect in that multiple variables
including those used to read and track directory indexes from disk are
signed ints.  This means any index which is 2^31 or larger will be
treated as a negative value.  The knock on efect of this is that the
offset into the desired metadata block is incorrectly computed, with the
result the directory fails to be read, and an I/O error is returned.

This commit corrects the variables (and function return value) to be
unsigned int, and it also adds more sanity checking of the values read
off disk (including directory size to avoid underflow in subtraction).
Now if a directory index is found to be incorrect, the index is
discarded and the previous index read from disk is used.  This allows
the directory to be read correctly without throwing an I/O error.

Reproducer
==========

The following reproducer creates a Squashfs filesystem with a root
directory which has a directory index.  The reproducer then corrupts
root directory index 0 with an index value of -1.  The filesystem is
then mounted, and stat run on file /mnt/filename-490.

If the exploit succeeds stat will report an I/O error and dmesg will
contain Squashfs error reports.

=====================================================================
#!/bin/bash

finish() {
	popd 2>&1 > /dev/null
	rm -rf $DIR
	exit 1
}

DIR=$(mktemp -d)

pushd $DIR 2>&1 > /dev/null

for i in $(seq 1 1000); do
	echo "filename-$i f 0700 0 0 echo hello" >> pseudo
done

echo "Create a Squashfs filesystem"
if ! mksquashfs - img.sqsh -pf pseudo -pd "d 0777 0 0" -noI -no-progress -quiet; then
	echo Creating the Squashfs filesystem failed
	finish
fi

# Write -1 in little-endian format to file
/usr/bin/echo -en "\xff\xff\xff\xff" > file

echo "Over-write the root directory index 0, with an index value of -1."
echo "This because the metadata is uncompressed can be over-written directly,"
echo "but, normally the metadata will be compressed."
echo "The location of the 4 byte index is 32150"

dd bs=1 seek=32150 if=file of=img.sqsh count=4 conv=notrunc status=none

echo
echo "Mount the filesystem on /mnt"

if ! mount -t squashfs img.sqsh /mnt; then
	echo Mount of Squashfs filesystem failed
	finish
fi

echo
echo "Run stat /mnt/filename-490 on the mounted filesystem"
echo
echo "If the exploit works stat will report I/O error, and dmesg will"
echo "contain Squashfs error reports"
echo

stat /mnt/filename-490
umount /mnt
popd 2>&1 > /dev/null

rm -rf $DIR
exit 0
=====================================================================

Fixes: 07972dde75c32 ("Squashfs: directory readdir operations")
Fixes: c88da2c979369 ("Squashfs: directory lookup operations")
Signed-off-by: Phillip Lougher <phillip@squashfs.org.uk>
---
v3:
  - Definition of start changed from u64 to s64 in squashfs_lookup(),
    changed in patch 12.
  - squashfs_dir_space() jumps to data_error, rather than read_failure,
    setting err to -EIO.
---
 fs/squashfs/dir.c              | 73 ++++++++++++++++++++------
 fs/squashfs/namei.c            | 94 ++++++++++++++++++++++++++--------
 fs/squashfs/squashfs_helpers.h |  7 +++
 3 files changed, 136 insertions(+), 38 deletions(-)

diff --git a/fs/squashfs/dir.c b/fs/squashfs/dir.c
index e961af7490dc..b688e92a4efa 100644
--- a/fs/squashfs/dir.c
+++ b/fs/squashfs/dir.c
@@ -37,17 +37,17 @@ static const unsigned char squashfs_filetype_table[] = {
  * (if any) we have managed to read - the index isn't essential, just
  * quicker.
  */
-static int get_dir_index_using_offset(struct super_block *sb,
+static unsigned int get_dir_index_using_offset(struct super_block *sb,
 	u64 *next_block, int *next_offset, u64 index_start, int index_offset,
-	int i_count, u64 f_pos)
+	unsigned int i_count, loff_t max_index, u64 f_pos)
 {
 	struct squashfs_sb_info *msblk = sb->s_fs_info;
 	s64 res;
-	int err, i, index, length = 0;
-	unsigned int size;
+	int err;
+	unsigned int i, index, length = 0, size, start_block, block;
 	struct squashfs_dir_index dir_index;
 
-	TRACE("Entered get_dir_index_using_offset, i_count %d, f_pos %lld\n",
+	TRACE("Entered get_dir_index_using_offset, i_count %u, f_pos %lld\n",
 					i_count, f_pos);
 
 	/*
@@ -58,6 +58,18 @@ static int get_dir_index_using_offset(struct super_block *sb,
 	if (f_pos <= 3)
 		return f_pos;
 	f_pos -= 3;
+	max_index -= 3;
+
+	/*
+	 * A valid index starts at a directory header, and there must be enough
+	 * room for a directory header and one directory entry.
+	 */
+	if (max_index < sizeof(struct squashfs_dir_header) +
+					sizeof(struct squashfs_dir_entry) + 1)
+		return 3;
+
+	max_index -= sizeof(struct squashfs_dir_header) +
+					sizeof(struct squashfs_dir_entry) + 1;
 
 	for (i = 0; i < i_count; i++) {
 		err = squashfs_read_metadata(sb, &dir_index, &index_start,
@@ -65,33 +77,51 @@ static int get_dir_index_using_offset(struct super_block *sb,
 		if (err < 0)
 			break;
 
+		/* Sanity check the directory index contents */
+
+		/* size should never be larger than SQUASHFS_NAME_LEN */
+		size = le32_to_cpu(dir_index.size) + 1;
+		if (size > SQUASHFS_NAME_LEN)
+			break;
+
+		/* The stored index should not be larger than max_index */
 		index = le32_to_cpu(dir_index.index);
+		if (index > max_index)
+			break;
+
+		block = le32_to_cpu(dir_index.start_block);
+
+		if (i > 0) {
+			/* The stored index should be larger than the previous index */
+			if (index <= length)
+				break;
+
+			/* The start_block should not be less than the previous start_block */
+			if (block < start_block)
+				break;
+		}
+
 		if (index > f_pos)
 			/*
 			 * Found the index we're looking for.
 			 */
 			break;
 
-		size = le32_to_cpu(dir_index.size) + 1;
-
-		/* size should never be larger than SQUASHFS_NAME_LEN */
-		if (size > SQUASHFS_NAME_LEN)
-			break;
-
 		err = squashfs_read_metadata(sb, NULL, &index_start,
 				&index_offset, size);
 		if (err < 0)
 			break;
 
-		res = squashfs_dir_start(le32_to_cpu(dir_index.start_block), msblk);
+		res = squashfs_dir_start(block, msblk);
 		if (res < 0)
 			break;
 
+		start_block = block;
 		length = index;
 		*next_block = res;
 	}
 
-	*next_offset = (length + *next_offset) % SQUASHFS_METADATA_SIZE;
+	*next_offset = ((u64)length + *next_offset) % SQUASHFS_METADATA_SIZE;
 
 	/*
 	 * Translate back from internal f_pos to external f_pos.
@@ -105,7 +135,8 @@ static int squashfs_readdir(struct file *file, struct dir_context *ctx)
 	struct inode *inode = file_inode(file);
 	struct squashfs_sb_info *msblk = inode->i_sb->s_fs_info;
 	s64 block;
-	int offset, length, err;
+	int offset, err;
+	loff_t length;
 	unsigned int inode_number, dir_count, size, type;
 	struct squashfs_dir_header dirh;
 	struct squashfs_dir_entry *dire = NULL;
@@ -161,12 +192,15 @@ static int squashfs_readdir(struct file *file, struct dir_context *ctx)
 				squashfs_i(inode)->dir_idx_start,
 				squashfs_i(inode)->dir_idx_offset,
 				squashfs_i(inode)->dir_idx_cnt,
-				ctx->pos);
+				i_size_read(inode), ctx->pos);
 
 	while (length < i_size_read(inode)) {
 		/*
 		 * Read directory header
 		 */
+		if (!squashfs_dir_space(inode, length, sizeof(dirh)))
+			goto failed_read;
+
 		err = squashfs_read_metadata(inode->i_sb, &dirh, &block,
 					&offset, sizeof(dirh));
 		if (err < 0)
@@ -183,23 +217,30 @@ static int squashfs_readdir(struct file *file, struct dir_context *ctx)
 			/*
 			 * Read directory entry.
 			 */
+			if (!squashfs_dir_space(inode, length, sizeof(*dire)))
+				goto failed_read;
+
 			err = squashfs_read_metadata(inode->i_sb, dire, &block,
 					&offset, sizeof(*dire));
 			if (err < 0)
 				goto failed_read;
 
+			length += sizeof(*dire);
 			size = le16_to_cpu(dire->size) + 1;
 
 			/* size should never be larger than SQUASHFS_NAME_LEN */
 			if (size > SQUASHFS_NAME_LEN)
 				goto failed_read;
 
+			if (!squashfs_dir_space(inode, length, size))
+				goto failed_read;
+
 			err = squashfs_read_metadata(inode->i_sb, dire->name,
 					&block, &offset, size);
 			if (err < 0)
 				goto failed_read;
 
-			length += sizeof(*dire) + size;
+			length += size;
 
 			if (ctx->pos >= length)
 				continue;
diff --git a/fs/squashfs/namei.c b/fs/squashfs/namei.c
index 40114813f51f..b530d3e9ddab 100644
--- a/fs/squashfs/namei.c
+++ b/fs/squashfs/namei.c
@@ -61,59 +61,97 @@
  * (if any) we have managed to read - the index isn't essential, just
  * quicker.
  */
-static int get_dir_index_using_name(struct super_block *sb,
+static unsigned int get_dir_index_using_name(struct super_block *sb,
 			u64 *next_block, int *next_offset, u64 index_start,
-			int index_offset, int i_count, const char *name)
+			int index_offset, unsigned int i_count,
+			loff_t max_index, const char *name)
 {
 	struct squashfs_sb_info *msblk = sb->s_fs_info;
 	s64 res;
-	int i, length = 0, err;
-	unsigned int size;
-	struct squashfs_dir_index *index;
+	int err;
+	unsigned int i, index, length = 0, size, start_block, block;
+	struct squashfs_dir_index *dir_index;
 
-	TRACE("Entered get_dir_index_using_name, i_count %d\n", i_count);
+	TRACE("Entered get_dir_index_using_name, i_count %u\n", i_count);
 
 	if (i_count == 0)
 		goto out;
 
-	index = kmalloc(sizeof(*index) + SQUASHFS_NAME_LEN + 1, GFP_KERNEL);
-	if (index == NULL) {
+	/*
+	 * Translate from external index to internal index.  This is offset by
+	 * 3 because we invent "." and ".." entries.
+	 */
+	max_index -= 3;
+
+	/*
+	 * A valid index starts at a directory header, and there must be enough
+	 * room for a directory header and one directory entry.
+	 */
+	if (max_index < sizeof(struct squashfs_dir_header) +
+				sizeof(struct squashfs_dir_entry) + 1)
+		goto out;
+
+	max_index -= sizeof(struct squashfs_dir_header) +
+				sizeof(struct squashfs_dir_entry) + 1;
+
+	dir_index = kmalloc(sizeof(*dir_index) + SQUASHFS_NAME_LEN + 1, GFP_KERNEL);
+	if (dir_index == NULL) {
 		ERROR("Failed to allocate squashfs_dir_index\n");
 		goto out;
 	}
 
 	for (i = 0; i < i_count; i++) {
-		err = squashfs_read_metadata(sb, index, &index_start,
-					&index_offset, sizeof(*index));
+		err = squashfs_read_metadata(sb, dir_index, &index_start,
+					&index_offset, sizeof(*dir_index));
 		if (err < 0)
 			break;
 
+		/* Sanity check the directory index contents */
 
-		size = le32_to_cpu(index->size) + 1;
+		/* size should never be larger than SQUASHFS_NAME_LEN */
+		size = le32_to_cpu(dir_index->size) + 1;
 		if (size > SQUASHFS_NAME_LEN)
 			break;
 
-		err = squashfs_read_metadata(sb, index->name, &index_start,
+		/* The stored index should not be larger than max_index */
+		index = le32_to_cpu(dir_index->index);
+		if (index > max_index)
+			break;
+
+		block = le32_to_cpu(dir_index->start_block);
+
+		if (i > 0) {
+			/* The stored index should be larger than the previous index */
+			if (index <= length)
+				break;
+
+			/* The start_block should not be less than the previous start_block */
+			if (block < start_block)
+				break;
+		}
+
+		err = squashfs_read_metadata(sb, dir_index->name, &index_start,
 					&index_offset, size);
 		if (err < 0)
 			break;
 
-		index->name[size] = '\0';
+		dir_index->name[size] = '\0';
 
-		if (strcmp(index->name, name) > 0)
+		if (strcmp(dir_index->name, name) > 0)
+			/* Found the index we're looking for. */
 			break;
 
-		res = squashfs_dir_start(le32_to_cpu(index->start_block), msblk);
+		res = squashfs_dir_start(block, msblk);
 		if (res < 0)
 			break;
 
-		length = le32_to_cpu(index->index);
+		start_block = block;
+		length = index;
 		*next_block = res;
 	}
 
-	*next_offset = (length + *next_offset) % SQUASHFS_METADATA_SIZE;
-	kfree(index);
-
+	*next_offset = ((u64)length + *next_offset) % SQUASHFS_METADATA_SIZE;
+	kfree(dir_index);
 out:
 	/*
 	 * Return index (f_pos) of the looked up metadata block.  Translate
@@ -135,7 +173,8 @@ static struct dentry *squashfs_lookup(struct inode *dir, struct dentry *dentry,
 	struct squashfs_dir_header dirh;
 	struct squashfs_dir_entry *dire = NULL;
 	s64 block;
-	int offset, err, length;
+	int offset, err;
+	loff_t length;
 	unsigned int dir_count, size;
 
 	TRACE("Entered squashfs_lookup [%llx:%x]\n", squashfs_i(inode)->start,
@@ -162,12 +201,16 @@ static struct dentry *squashfs_lookup(struct inode *dir, struct dentry *dentry,
 	length = get_dir_index_using_name(dir->i_sb, &block, &offset,
 				squashfs_i(dir)->dir_idx_start,
 				squashfs_i(dir)->dir_idx_offset,
-				squashfs_i(dir)->dir_idx_cnt, name);
+				squashfs_i(dir)->dir_idx_cnt,
+				i_size_read(dir), name);
 
 	while (length < i_size_read(dir)) {
 		/*
 		 * Read directory header.
 		 */
+		if (!squashfs_dir_space(dir, length, sizeof(dirh)))
+			goto data_error;
+
 		err = squashfs_read_metadata(dir->i_sb, &dirh, &block,
 				&offset, sizeof(dirh));
 		if (err < 0)
@@ -184,23 +227,30 @@ static struct dentry *squashfs_lookup(struct inode *dir, struct dentry *dentry,
 			/*
 			 * Read directory entry.
 			 */
+			if (!squashfs_dir_space(dir, length, sizeof(*dire)))
+				goto data_error;
+
 			err = squashfs_read_metadata(dir->i_sb, dire, &block,
 					&offset, sizeof(*dire));
 			if (err < 0)
 				goto read_failure;
 
+			length += sizeof(*dire);
 			size = le16_to_cpu(dire->size) + 1;
 
 			/* size should never be larger than SQUASHFS_NAME_LEN */
 			if (size > SQUASHFS_NAME_LEN)
 				goto data_error;
 
+			if (!squashfs_dir_space(dir, length, size))
+				goto data_error;
+
 			err = squashfs_read_metadata(dir->i_sb, dire->name,
 					&block, &offset, size);
 			if (err < 0)
 				goto read_failure;
 
-			length += sizeof(*dire) + size;
+			length += size;
 
 			if (name[0] < dire->name[0])
 				goto exit_lookup;
diff --git a/fs/squashfs/squashfs_helpers.h b/fs/squashfs/squashfs_helpers.h
index 9423d5a0a700..59778eb5a8d5 100644
--- a/fs/squashfs/squashfs_helpers.h
+++ b/fs/squashfs/squashfs_helpers.h
@@ -352,4 +352,11 @@ static inline s64 squashfs_add_indexes(u64 block, s64 blks, struct squashfs_sb_i
 
 	return block + blks;
 }
+
+static inline bool squashfs_dir_space(struct inode *inode, loff_t length, int size)
+{
+	loff_t space = i_size_read(inode) - length;
+
+	return space >= size;
+}
 #endif
-- 
2.47.3

