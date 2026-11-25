Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.121.53.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795571316;
	b=yJDBslXdqHiSxvlydK/DlOfWGq6sE6E/AU/qYrCOD9qmxm7WcB4P9tdQ0il4FxSixb29
	 X/CUIkxWAEQEa4KgreAC9Pl+zJrm+w8XcGBnrzGrBbg0n1ThHL5hrUlexXbQwTo5IIZlE
	 1EN7OWDju7P13/bnP7BCgd01a/jUqKJC4uhQbU9FOLhRjMHAIdIuJCtDjuV6+xRhNLo0h
	 zH5AO/Xpbl+KNZJFvGcJ5mcwfsDTiLnLNCIkO7mIhd+cFf2bghkNP+/eSwys13Bv8Oay7
	 NhudhS+T8Pt16hPo7KBPLmAfJNxQIAGEPdXCzrj4nqJ4xJQXFtovNbXPBC965/SEvXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795571316;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=JF7d4xeUApWFpsUpTKM8U2EUNOIOSjX8I+6bcZivC2c=;
	b=V0/kskROlbv1b6lBRar8lrzg6KqWyMK+HV2F/h4346bwU+E/Tgx/rAM3TCRwQOsK+VBy
	 wnSKdk+UDiiikKtrcGV3zXQBEqbyvsah5DIgIajOqEnxIqwGIgl+tHEjKc8wIHjyDSj58
	 AO4xSGqC+wJJw+uHwpHQWe/R8km4BqL1AWG72rclLgSysmJbdMpDBOEOfEl+ZlhZvRJsE
	 +nXOlzwYgOWfG6AnZ2P+0ZrQ6hgPH4QuGDYPUVF/A4t1TdcHQuxKPnGbwVSpXr9kWpAa+
	 ist/0lwWXOZSE/rLp6gE+EzmW4/x+7+Wb0z0ogTYEPHfxdHXnzDnWGjLFMGecM/qX+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=RWBuTKcx;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b="pf52/Nt7";
	arc=none smtp.remote-ip=188.121.53.17
Received: from sxplsmtpa04-02.prod.sxb1.secureserver.net (sxplsmtpa04-02.prod.sxb1.secureserver.net [188.121.53.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B03606A6B0
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:48:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45B03606A6B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=RWBuTKcx;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=pf52/Nt7
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id W26zxdCHW8H3GW27XxX8OO; Wed, 25 Nov 2026 01:48:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1795571309;
	bh=JF7d4xeUApWFpsUpTKM8U2EUNOIOSjX8I+6bcZivC2c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RWBuTKcxD7OzEbGVFgLNKBoQNYpjd5T0x9Wdcg0ElAF2mjTbeNWWfE6HznESET/Oa
	 EmGWPq/Yvl1DpRTm7azCq6q9YChvX2ci387P6do3eQJDEh9rUUG8MZV5BYwAiNds9L
	 poqcVwBOPSZ77BCBEnROm13OJo7w/5NiAr0XRwF4hv4j33mD37wlKqYUq2icKJ+pq4
	 1iYg5IV6cSY1fRBn2XXgfcNu0NnabEJD1N9LANkw9H707QBuUkCDM31cRo0AAeGrUZ
	 2k7B0K/E4fNo+LtnfCFAeaQnfpCe5FFkko/+6+2rZnNmnalogvXYemesWrx3P1c8dp
	 1pUQKNdDh9DIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1795571309;
	bh=JF7d4xeUApWFpsUpTKM8U2EUNOIOSjX8I+6bcZivC2c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=pf52/Nt76JHHGEbrzm2PZUruzeMoeyNfl+amI7gLbAhgIDahFcM9uogCOJuKhUXXp
	 XDJ2KFueIEFWMl5c4ZqNQQhjhoeYAFxeqmhJ5LZxcqRjmDCdQxmZxz/f1UPyVcv7RX
	 b7oEVO6KlBNs+MQSAM8m/8oIY6Plwqh1eapVnMOCsZuPWvYb/PQD5A+P1Ly15xlG0U
	 sQsdiQcoiHP4vYWb7KLKn0ZMEk+Wqw55MYzf6fGH1WJnjnxfALAPYkxXFluU0NgLgr
	 D9UABK3TIVepbt8urVsX1YD6X4hMP6IT+MhFei3CyVZMLXx3Cy0SSHn2Yq/ZU8Abrq
	 BAhpkVf5PIZZA==
X-CMAE-Analysis: v=2.4 cv=Cuoq4X4D c=1 sm=1 tr=0 ts=6b063e6c
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=LfzjP0gfRlKVKHXjjMMA:9 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: 24fe4d31855cc815fc52e454ec9b4653:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH v4 16/23] Squashfs: sanity check fragment block location and range
Date: Wed, 25 Nov 2026 01:47:30 +0000
Message-ID: <20261125014737.347231-17-phillip@squashfs.org.uk>
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
X-CMAE-Envelope: MS4xfA/LR4fTJZ9ILnr7uZXRLkWe9y0IuDpA0splmGiiSg6HWIySRL6wtEJqrLaKzBZ4TY9nuORE++h9gNjBOzaaAwaVNbSKSKuoyCxLXeIRjYzOhjTB62PQ
 +eFTNRM4F4LWXF+1FXGUj0jRA0FO99tjCbBsHHzoOJWJxO5JCZzxoA4FTFtCI8vricBW5EFPdtFwCNX0tp6Rq+xYQBXe60UKpdxJm6bRmMdWwGs9x2dN0H64
 FIeiy5JoZC8AU8Yr2OoUAKhfoSC1jNO8CY14tZszo9pO97j837ohkVzV7+QRfMty

When reading fragment blocks from disk the location and range of the
fragment block is not sanity checked before it is passed down to
squashfs_read_data().

In squashfs_read_data() the block location and range are sanity checked
to the extent that the location plus block length does not go beyond the
end of the filesystem.  But, a block location can be crafted to be close
to 2^64, and so the addition of the location and the length can cause
arthimetic overflow, and thereby evade the sanity check.

This evasion, however, will be caught when the code after the sanity
check tries to read the block from the filesystem.  This is because
it is the block location that is passed to the I/O read, and not
the result of the overflowed sanity check.  This will return error
because it will be beyond the end of the device.

The real issue here is that leaving the sanity checking of the fragment
block location and range to squashfs_read_data() is sub-optimal.  This
is because a fragment cache buffer has to be obtained (with possible
waits fop a free buffer, and then the eviction of the original cached
contents) before squashfs_read_data() is called.

This adds unnecessary overhead and contention, which could be exploited
to reduce performance, and this is for incorrect values that should have
been detected earlier.

This commit adds extra sanity checking to ensure the fragment block
location and range are within bounds before a free fragment block is
obtained.

Also because the fragment block value is unchecked, a false value of
SQUASHFS_INVALID_BLK read off disk, will trick the code into believing
the file doesn't have a fragment, because that value is later used to
indicate if a file has a fragment.  To avoid this, this commit adds and
uses an inode flag.
  
Reproducer
==========

The reproducer generates a Squashfs filesytem with a fragment block, and
then corrupts the location of the fragment block to 2^64 - 32 KiB.  If
the exploit succeeds this corrupted value is paased to
squaashfs_read_data() and it is not detected until the I/O read fails.

=====================================================================
#!/bin/bash

ARGS="-quiet -no-progress -noI -noD -noF -no-sparse -comp gzip"

finish() {
	popd 2>&1 > /dev/null
	rm -rf $DIR
	exit 1
}

DIR=$(mktemp -d)

pushd $DIR 2>&1 > /dev/null

echo Create Squashfs filesystem with one file

echo "/ d 0777 0 0" > pseudo
echo "zero f 0777 0 0 dd if=/dev/zero bs=1024 count=32 2>/dev/null" >> pseudo

if ! mksquashfs - img.sqsh -pf pseudo $ARGS; then
	echo Failed to create Squashfs filesystem
	finish

fi

echo "Corrupt the location of fragment block 0"
echo "Alter it to the value 0xFFFFFFFFFFFF8000 (2^64 - 32 KiB)"
echo "The block location is stored at byte offset 32958"

/usr/bin/echo -en "\x00\x80\xff\xff\xff\xff\xff\xff" > file
dd if=file of=img.sqsh seek=32958 bs=1 count=8 conv=notrunc status=none

echo Mount the filesystem to /mnt

if ! mount -t squashfs img.sqsh /mnt; then
	echo Mount of Squashfs filesystem failed
	finish
fi

echo Read the file zero.
echo If the exploit succeeds, dmesg should show the following:
echo "dd: attempt to access beyond end of device"
echo "	loop20: rw=2048, sector=36028797018963904, nr_sectors = 64 limit=72"
echo "SQUASHFS error: Failed to read block 0xffffffffffff8000: -5"
echo "SQUASHFS error: Unable to read fragment cache entry [ffffffffffff8000]"
echo "SQUASHFS error: Unable to read fragment cache entry [ffffffffffff8000]"
echo "SQUASHFS error: Unable to read page, block ffffffffffff8000, size 1008000"

dd if=/mnt/zero

popd 2>&1> /dev/null

rm -rf $DIR
=========================================================================

Signed-off-by: Phillip Lougher <phillip@squashfs.org.uk>
---
v4:
  - Don't treat squashfs_i(inode)->frament_block == SQUASHFS_INVALID_BLK
    as indicating a file doesn't have a fragment, as this value is
    read off disk, and could hold SQUASHFS_INVALID_BLK. Instead add an
    inode flag.
v2:
  - Don't return frag_size as the return value of squashfs_frag_lookup()
    This ensures the frag_size cannot be treated as a negative error
    result.
---
 fs/squashfs/cache.c            |  7 +++++--
 fs/squashfs/file.c             | 16 +++++++++-------
 fs/squashfs/fragment.c         |  5 +++--
 fs/squashfs/inode.c            | 20 ++++++++++++--------
 fs/squashfs/squashfs.h         |  3 ++-
 fs/squashfs/squashfs_fs_i.h    |  1 +
 fs/squashfs/squashfs_helpers.h | 24 ++++++++++++++++++++++--
 7 files changed, 54 insertions(+), 22 deletions(-)

diff --git a/fs/squashfs/cache.c b/fs/squashfs/cache.c
index 7cb16414cd23..4b6ef8838bc6 100644
--- a/fs/squashfs/cache.c
+++ b/fs/squashfs/cache.c
@@ -490,9 +490,12 @@ struct squashfs_cache_entry *squashfs_get_fragment(struct super_block *sb,
 				u64 start_block, int length)
 {
 	struct squashfs_sb_info *msblk = sb->s_fs_info;
+	int res = squashfs_check_range(start_block, length, msblk);
 
-	return squashfs_cache_get(sb, msblk->fragment_cache, start_block,
-		length);
+	if (res < 0)
+		return ERR_PTR(res);
+
+	return squashfs_cache_get(sb, msblk->fragment_cache, start_block, res);
 }
 
 
diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
index 76a61d2cc68c..550a68c27d7d 100644
--- a/fs/squashfs/file.c
+++ b/fs/squashfs/file.c
@@ -443,7 +443,7 @@ static int squashfs_readpage_fragment(struct folio *folio, int expected)
 	struct squashfs_cache_entry *buffer = squashfs_get_fragment(inode->i_sb,
 		squashfs_i(inode)->fragment_block,
 		squashfs_i(inode)->fragment_size);
-	int res = buffer->error;
+	int res = IS_ERR(buffer) ? PTR_ERR(buffer) : buffer->error;
 
 	if (res)
 		ERROR("Unable to read page, block %llx, size %x\n",
@@ -453,7 +453,8 @@ static int squashfs_readpage_fragment(struct folio *folio, int expected)
 		squashfs_copy_cache(folio, buffer, expected,
 			squashfs_i(inode)->fragment_offset);
 
-	squashfs_cache_put(buffer);
+	if (!IS_ERR(buffer))
+		squashfs_cache_put(buffer);
 	return res;
 }
 
@@ -481,8 +482,7 @@ static int squashfs_read_folio(struct file *file, struct folio *folio)
 					PAGE_SHIFT))
 		goto out;
 
-	if (index < file_end || squashfs_i(inode)->fragment_block ==
-					SQUASHFS_INVALID_BLK) {
+	if (index < file_end || !squashfs_i(inode)->has_fragment) {
 		u64 block = 0;
 
 		res = read_blocklist(inode, index, &block);
@@ -519,6 +519,9 @@ static int squashfs_readahead_fragment(struct inode *inode, struct page **page,
 	void *addr;
 	struct page *last_page;
 
+	if (IS_ERR(buffer))
+		return 1;
+
 	if (buffer->error)
 		goto out;
 
@@ -616,7 +619,7 @@ static void squashfs_readahead(struct readahead_control *ractl)
 			goto skip_pages;
 
 		if (start >> msblk->block_log == file_end &&
-				squashfs_i(inode)->fragment_block != SQUASHFS_INVALID_BLK) {
+				squashfs_i(inode)->has_fragment) {
 			res = squashfs_readahead_fragment(inode, pages,
 					nr_pages, expected, start);
 			if (res)
@@ -686,8 +689,7 @@ static loff_t seek_hole_data(struct file *file, loff_t offset, int whence)
 		return -ENXIO;
 
 	/* is offset within tailend and is tailend packed into a fragment? */
-	if (index + 1 == file_end &&
-			squashfs_i(inode)->fragment_block != SQUASHFS_INVALID_BLK) {
+	if (index + 1 == file_end && squashfs_i(inode)->has_fragment) {
 		if (whence == SEEK_DATA)
 			return offset;
 
diff --git a/fs/squashfs/fragment.c b/fs/squashfs/fragment.c
index 1f372374c29d..429dbeba9c21 100644
--- a/fs/squashfs/fragment.c
+++ b/fs/squashfs/fragment.c
@@ -34,7 +34,7 @@
  * location of the fragment and its compressed size
  */
 int squashfs_frag_lookup(struct super_block *sb, unsigned int fragment,
-				u64 *fragment_block)
+				u64 *fragment_block, int *fragment_size)
 {
 	struct squashfs_sb_info *msblk = sb->s_fs_info;
 	int block, offset, size;
@@ -54,7 +54,8 @@ int squashfs_frag_lookup(struct super_block *sb, unsigned int fragment,
 		return size;
 
 	*fragment_block = le64_to_cpu(fragment_entry.start_block);
-	return squashfs_frag_size(fragment_entry.size, msblk->block_size);
+	*fragment_size = le32_to_cpu(fragment_entry.size);
+	return 0;
 }
 
 
diff --git a/fs/squashfs/inode.c b/fs/squashfs/inode.c
index 380714ac4d34..418dd58bdc7c 100644
--- a/fs/squashfs/inode.c
+++ b/fs/squashfs/inode.c
@@ -136,6 +136,7 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 	type = le16_to_cpu(sqshb_ino->inode_type);
 	switch (type) {
 	case SQUASHFS_REG_TYPE: {
+		char has_fragment;
 		unsigned int frag_offset, frag;
 		int frag_size;
 		u64 frag_blk;
@@ -158,12 +159,12 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 				goto failed_read;
 			}
 			frag_offset = le32_to_cpu(sqsh_ino->offset);
-			frag_size = squashfs_frag_lookup(sb, frag, &frag_blk);
-			if (frag_size < 0) {
-				err = frag_size;
+			err = squashfs_frag_lookup(sb, frag, &frag_blk, &frag_size);
+			if (err < 0)
 				goto failed_read;
-			}
+			has_fragment = true;
 		} else {
+			has_fragment = false;
 			frag_blk = SQUASHFS_INVALID_BLK;
 			frag_size = 0;
 			frag_offset = 0;
@@ -173,6 +174,7 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 		inode->i_fop = &squashfs_file_operations;
 		inode->i_mode |= S_IFREG;
 		inode->i_blocks = ((inode->i_size - 1) >> 9) + 1;
+		squashfs_i(inode)->has_fragment = has_fragment;
 		squashfs_i(inode)->fragment_block = frag_blk;
 		squashfs_i(inode)->fragment_size = frag_size;
 		squashfs_i(inode)->fragment_offset = frag_offset;
@@ -189,6 +191,7 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 		break;
 	}
 	case SQUASHFS_LREG_TYPE: {
+		char has_fragment;
 		unsigned int frag_offset, frag;
 		int frag_size;
 		u64 frag_blk;
@@ -215,12 +218,12 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 				goto failed_read;
 			}
 			frag_offset = le32_to_cpu(sqsh_ino->offset);
-			frag_size = squashfs_frag_lookup(sb, frag, &frag_blk);
-			if (frag_size < 0) {
-				err = frag_size;
+			err = squashfs_frag_lookup(sb, frag, &frag_blk, &frag_size);
+			if (err < 0)
 				goto failed_read;
-			}
+			has_fragment = true;
 		} else {
+			has_fragment = false;
 			frag_blk = SQUASHFS_INVALID_BLK;
 			frag_size = 0;
 			frag_offset = 0;
@@ -234,6 +237,7 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 		inode->i_blocks = (inode->i_size -
 				le64_to_cpu(sqsh_ino->sparse) + 511) >> 9;
 
+		squashfs_i(inode)->has_fragment = has_fragment;
 		squashfs_i(inode)->fragment_block = frag_blk;
 		squashfs_i(inode)->fragment_size = frag_size;
 		squashfs_i(inode)->fragment_offset = frag_offset;
diff --git a/fs/squashfs/squashfs.h b/fs/squashfs/squashfs.h
index 4851bd964502..1947a469a0b4 100644
--- a/fs/squashfs/squashfs.h
+++ b/fs/squashfs/squashfs.h
@@ -68,7 +68,8 @@ extern __le64 *squashfs_read_inode_lookup_table(struct super_block *, u64, u64,
 				unsigned int);
 
 /* fragment.c */
-extern int squashfs_frag_lookup(struct super_block *, unsigned int, u64 *);
+extern int squashfs_frag_lookup(struct super_block *sb, unsigned int fragment,
+				u64 *fragment_block, int *fragment_size);
 extern __le64 *squashfs_read_fragment_index_table(struct super_block *,
 				u64, u64, unsigned int);
 
diff --git a/fs/squashfs/squashfs_fs_i.h b/fs/squashfs/squashfs_fs_i.h
index 90c3b085ac0e..d69bc9d15d9c 100644
--- a/fs/squashfs/squashfs_fs_i.h
+++ b/fs/squashfs/squashfs_fs_i.h
@@ -17,6 +17,7 @@ struct squashfs_inode_info {
 	unsigned int	xattr_size;
 	unsigned int	xattr_count;
 	int		parent;
+	bool		has_fragment;
 	union {
 		struct {
 			u64		fragment_block;
diff --git a/fs/squashfs/squashfs_helpers.h b/fs/squashfs/squashfs_helpers.h
index dc7c64bf61ab..6481ac236357 100644
--- a/fs/squashfs/squashfs_helpers.h
+++ b/fs/squashfs/squashfs_helpers.h
@@ -226,9 +226,9 @@ static inline int squashfs_data_size(__le32 raw, s32 block_size)
 	return squashfs_block_size(le32_to_cpu(raw), block_size);
 }
 
-static inline int squashfs_frag_size(__le32 raw, s32 block_size)
+static inline int squashfs_frag_size(u32 disk_size, s32 block_size)
 {
-	int size = squashfs_block_size(le32_to_cpu(raw), block_size);
+	int size = squashfs_block_size(disk_size, block_size);
 
 	if (size < 0)
 		return size;
@@ -239,4 +239,24 @@ static inline int squashfs_frag_size(__le32 raw, s32 block_size)
 
 	return size;
 }
+
+static inline int squashfs_check_range(u64 start_block, s32 disk_size, struct squashfs_sb_info *msblk)
+{
+	int size = squashfs_frag_size(disk_size, msblk->block_size);
+
+	if (size < 0)
+		return size;
+
+	if (start_block >= msblk->inode_table)
+		return -EIO;
+
+	/*
+	 * the above check ensured start_block is not 2^63 or larger, and so
+	 * this addition will not overflow
+	 */
+	if (start_block + squashfs_compressed_size_block(size) > msblk->inode_table)
+		return -EIO;
+
+	return size;
+}
 #endif
-- 
2.47.3

