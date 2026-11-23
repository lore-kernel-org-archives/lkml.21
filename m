Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.121.53.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795405441;
	b=qpCZCkLHTkzTONhAwe0OT2ntgxshSKMgz5lyJFcGIWM0ATzSYF/tv73OVJH5PPNPkYfh
	 YBsn/t0zKWDZykIfx920ZCPXQfYHIOdENZZ04hIFxI9eMCvjue4LdC1wHlOf/6Fh1Wgs3
	 C/mXxm8Nve9HfUvtkmsxl+HOTb7jHCMj0xjy/ac5cX5jtbRUJ2Jkr41YjX4DW/E21PMIj
	 qkWjt7P/UOOuAITlNemTNHjmZS9CmpuZ6ZZvNLXc4rvjHwZ1SCj8HVJpATSG63X7exs2s
	 5BZ3FUMK3MHnG/tag6uBYC8fK74DBH0moOfYgS0vGZd0hkA7gZ+OhkyvB7OKj5P3SRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795405441;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=tHQKRBKPkROaDmvHOtkqmrZvzXdwJGdpW3JLkyRYSpI=;
	b=wrp55JLuXSZHBYNDZimuaec8JEATqQnMYyahQqCuQXxCxL9K37jpm/944BiyQoXVsrTF
	 MBD1Use5Dm88DVGLE/GjFMNi+DHidJQFc6tStfyxnywyd+AMYKAmbXjF7aXAZtmsB2iWe
	 p2BhTqxoUd4QBcaKDCwcd0iBYrR5Ql96WQgp4/Mrai9xjw04g/WcufD5y5Fk2D2AKkIl+
	 ZvN/jG0CTDZfF2p3v10yrIyFg7G0FYYDThGW1ETfKOOFdZLVfaWnnxOTIG08TAZMLnWdJ
	 ZZSV7OXx3edeUnT86KwZ+HsYgNoIdxde0OpD0RfzyyNwZKRfV0YkwDEb0udQF/yBe1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=fM+++Mdb;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=i7wnSnZk;
	arc=none smtp.remote-ip=188.121.53.35
Received: from sxplsmtpa04-04.prod.sxb1.secureserver.net (sxplsmtpa04-04.prod.sxb1.secureserver.net [188.121.53.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716E5606A333
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:44:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 716E5606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=fM+++Mdb;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=i7wnSnZk
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id VKxRxJoOeZuU3VKy2xiqRi; Mon, 23 Nov 2026 03:43:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1795405427;
	bh=tHQKRBKPkROaDmvHOtkqmrZvzXdwJGdpW3JLkyRYSpI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fM+++MdbKujrbgeRoWFIg3PR4fJzxlwnxjO/Lnn75Y7qYxiyKFGpE3ijeQKRtLsjx
	 N7aa6V6j876MV8OL6FR96ivfC5k9f6unO5nGyVMT8e9O41jmeS0yreW/4+rYlRdV30
	 BjrQ0DzZa0QRdaSflUbr3oLNykpat8m8++FM4h7q4L4O7aD8GnzFTqvuUgmarlVbOV
	 v/hd1OH9nLjZXo9ho884k6lxTt3F+CBIYchHzUuME293cekolhiGE4FO/hEQau9fkG
	 vFKWHjTVQ+9kVOqGmuvkeJrbXVjbcrLQYrbJkUv5HyFsifidxYWSsYj2OWzQ8wnCf3
	 Gu849PwmQ/PtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1795405427;
	bh=tHQKRBKPkROaDmvHOtkqmrZvzXdwJGdpW3JLkyRYSpI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=i7wnSnZkLXijWaFm0SVKtmrQSWXs8B7LkA2cxWkER5YdYfekZfTJfSKNKEDp5AQEW
	 jFYIhpAgHpHIls4j8j2J3ilrdr04DHhh0wD/Tkr/o2vRO9g68JNoaXBvv+fhB4/eYw
	 VEg9h10Hka/5d8mlPM5NARnXg4Pp4N7VQhDundmgOWHrIWt4jBFvm/dua5t8ZPcaX4
	 a/ul7WVKX8kd1ekHx8NBY4f94c/jo2hRyo3kKxFGFs70fQbFln3bX/8z2YVvS6HHaS
	 rQBXZvWhWDDX4rmqijUPL6z0ht8aKyWaKvnxeujehtHJi23qUOBiTHtsF3tMo+atlB
	 uFfclfFqlfJjA==
X-CMAE-Analysis: v=2.4 cv=CvYq4X4D c=1 sm=1 tr=0 ts=6b03b673
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=RkH14jvAPMWmjoHUV8UA:9 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: 08681db3b055fee2072610ebdab10bda:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH v3 15/23] Squashfs: add more sanity checking to squashfs_block_size()
Date: Mon, 23 Nov 2026 03:42:56 +0000
Message-ID: <20261123034304.261742-16-phillip@squashfs.org.uk>
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
X-CMAE-Envelope: MS4xfLjyOzSqR3dzt+F959NZhD5tGUqv9wBRkm4R2Kl/4MTAV8/ypolP1KgZkkLt5HsW2cmhhnRD+k7Y6j7foQ9L6p8PCI/ApokBFoPFl3Hzpb3dmTJlTI6r
 tmTdIvwg15ObYuyaQNEVi1su+Gt99YZsmKjvJj6Dapm/H12E6sAnn7O/WBeljdjNESALaxNwAKUk/ZTcNrHjO5tN0B5SxRms4dqQy7dtwz8ZZNK1qOCkOOlS
 WNpeQBFw0IhwbJucBGhFonahtK+cQcFLLSjBadeHfkW7pc4s7giViYYhy+lVDuor

Squashfs_block_size() sanity checks the data and fragment block size
read from disk.  However, it doesn't do all the sanity checking that
it could do.  This means detectably invalid block sizes are passed
down to squashfs_read_data().

This situation is sub-optimal because in the case of fragment
blocks, a fragment cache buffer has to obtained (with possible
waits for a free buffer etc.) before squashfs_read_data() is called.

In both fragment and data block cases if the buffer is compressed, it
means a free decompressor may be obtained (with possible waits for a
decompressor) by squashfs_read_data(), only to have the decompression
fail.

In both these cases this adds unnecessary overhead which may impact
performance, and this is with values that should have been detected
earlier.

This commit adds extra sanity checking to trap additional incorrect
values.

Reproducer
==========

The reproducer generates a Squashfs filesystem and then corrupts the
block size value for file zero block 0.  If the exploit succeeds this
corrupted value is not detected, and it is passed to the decompressor
via squashfs_read_data() which then fails at that point.

====================================================================
#!/bin/bash

ARGS="-quiet -no-progress -no-fragments -noI -noD -no-sparse -comp gzip"

finish() {
	popd 2>&1 > /dev/null
	rm -rf $DIR
	exit 1
}

DIR=$(mktemp -d)

pushd $DIR 2>&1 > /dev/null

echo Create Squashfs filesystem with one file

echo "/ d 0777 0 0" > pseudo
echo "zero f 0777 0 0 dd if=/dev/zero bs=1024 count=128 2>/dev/null" >> pseudo

if ! mksquashfs - img.sqsh -pf pseudo $ARGS; then
	echo Failed to create Squashfs filesystem
	finish

fi

echo Corrupt the data block size for block 0 in file zero
echo Flip the compression bit from uncompressed to compressed.
echo "This is at byte offset 131207 (96 + 128 KiB + 37)"

dd if=/dev/zero of=img.sqsh seek=131205 bs=1 count=1 conv=notrunc status=none

echo Mount the filesystem to /mnt

if ! mount -t squashfs img.sqsh /mnt; then
	echo Mount of Squashfs filesystem failed
	finish
fi

echo Read the file zero.
echo If the exploit succeeds, dmesg should show the following:
echo "SQUASHFS error: zlib decompression failed, data probably corrupt"
echo "SQUASHFS error: Failed to read block 0x60: -5"
echo "SQUASHFS error: zlib decompression failed, data probably corrupt"
echo "SQUASHFS error: Failed to read block 0x60: -5"
echo "SQUASHFS error: Unable to read data cache entry [60]"
echo "SQUASHFS error: Unable to read page, block 60, size 20000"

dd if=/mnt/zero

popd 2>&1> /dev/null

rm -rf $DIR
==============================================================================

Fixes: 1701aecb6849c ("Squashfs: regular file operations")
Signed-off-by: Phillip Lougher <phillip@squashfs.org.uk>
---
v2:
  - Add additional sanity check, a zero size cannot have
    SQUASHFS_COMPRESSED_BIT_BLOCK set.
---
 fs/squashfs/file.c             |  8 +++++---
 fs/squashfs/fragment.c         |  2 +-
 fs/squashfs/squashfs_fs.h      |  6 ------
 fs/squashfs/squashfs_helpers.h | 36 ++++++++++++++++++++++++++++++++++
 4 files changed, 42 insertions(+), 10 deletions(-)

diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
index 5c976b20f316..76a61d2cc68c 100644
--- a/fs/squashfs/file.c
+++ b/fs/squashfs/file.c
@@ -166,6 +166,7 @@ static long long read_indexes(struct super_block *sb, s64 n,
 {
 	int err, i;
 	long long block = 0;
+	struct squashfs_sb_info *msblk = sb->s_fs_info;
 	__le32 *blist = kmalloc(PAGE_SIZE, GFP_KERNEL);
 
 	if (blist == NULL) {
@@ -185,7 +186,7 @@ static long long read_indexes(struct super_block *sb, s64 n,
 		}
 
 		for (i = 0; i < blocks; i++) {
-			int size = squashfs_block_size(blist[i]);
+			int size = squashfs_data_size(blist[i], msblk->block_size);
 			if (size < 0) {
 				err = size;
 				goto failure;
@@ -333,6 +334,7 @@ static int read_blocklist_ptrs(struct inode *inode, s64 index, u64 *start,
 {
 	long long blks;
 	__le32 size;
+	struct squashfs_sb_info *msblk = inode->i_sb->s_fs_info;
 	s64 res = fill_meta_index(inode, index, start, offset, block);
 
 	TRACE("read_blocklist: res %lld, index %lld, start 0x%llx, offset 0x%x, block 0x%llx\n",
@@ -362,7 +364,7 @@ static int read_blocklist_ptrs(struct inode *inode, s64 index, u64 *start,
 			sizeof(size));
 	if (res < 0)
 		return res;
-	return squashfs_block_size(size);
+	return squashfs_data_size(size, msblk->block_size);
 }
 
 static inline int read_blocklist(struct inode *inode, s64 index, u64 *block)
@@ -720,7 +722,7 @@ static loff_t seek_hole_data(struct file *file, loff_t offset, int whence)
 			goto finished;
 
 		for (i = 0; i < indexes; i++) {
-			length = squashfs_block_size(blist[i]);
+			length = squashfs_data_size(blist[i], msblk->block_size);
 			if (length < 0) {
 				offset = length;
 				goto finished;
diff --git a/fs/squashfs/fragment.c b/fs/squashfs/fragment.c
index 9f63e5b5c513..1f372374c29d 100644
--- a/fs/squashfs/fragment.c
+++ b/fs/squashfs/fragment.c
@@ -54,7 +54,7 @@ int squashfs_frag_lookup(struct super_block *sb, unsigned int fragment,
 		return size;
 
 	*fragment_block = le64_to_cpu(fragment_entry.start_block);
-	return squashfs_block_size(fragment_entry.size);
+	return squashfs_frag_size(fragment_entry.size, msblk->block_size);
 }
 
 
diff --git a/fs/squashfs/squashfs_fs.h b/fs/squashfs/squashfs_fs.h
index 3e7d0730b2d9..6ca8d7227a0e 100644
--- a/fs/squashfs/squashfs_fs.h
+++ b/fs/squashfs/squashfs_fs.h
@@ -101,12 +101,6 @@
 #define SQUASHFS_XATTR_VALUE_OOL        256
 #define SQUASHFS_XATTR_PREFIX_MASK      0xff
 
-static inline int squashfs_block_size(__le32 raw)
-{
-	u32 size = le32_to_cpu(raw);
-	return (size >> 25) ? -EIO : size;
-}
-
 /* cached data constants for filesystem */
 #define SQUASHFS_CACHED_BLKS		8
 
diff --git a/fs/squashfs/squashfs_helpers.h b/fs/squashfs/squashfs_helpers.h
index 124ee18ed8c9..dc7c64bf61ab 100644
--- a/fs/squashfs/squashfs_helpers.h
+++ b/fs/squashfs/squashfs_helpers.h
@@ -203,4 +203,40 @@ static inline s16 squashfs_xattr_offset(s64 xattr)
 {
 	return xattr & 0xffff;
 }
+
+static inline int squashfs_block_size(u32 size, s32 block_size)
+{
+	/* reject any size with bits set where they should not be */
+	if ((size & ~SQUASHFS_COMPRESSED_BIT_BLOCK) > block_size)
+		return -EIO;
+
+	/* a block can't be both full size and compressed */
+	if (size == block_size)
+		return -EIO;
+
+	/* a zero size block will never have SQUASHFS_COMPRESSED_BIT_BLOCK set */
+	if (size == SQUASHFS_COMPRESSED_BIT_BLOCK)
+		return -EIO;
+
+	return size;
+}
+
+static inline int squashfs_data_size(__le32 raw, s32 block_size)
+{
+	return squashfs_block_size(le32_to_cpu(raw), block_size);
+}
+
+static inline int squashfs_frag_size(__le32 raw, s32 block_size)
+{
+	int size = squashfs_block_size(le32_to_cpu(raw), block_size);
+
+	if (size < 0)
+		return size;
+
+	/* a fragment block can't be zero size */
+	if (size == 0)
+		return -EIO;
+
+	return size;
+}
 #endif
-- 
2.47.3

