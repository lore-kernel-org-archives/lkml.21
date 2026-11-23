Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.121.53.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795405444;
	b=a3Kh8qXtZbFWL+kDb/rk6dqy5gOumkpZCr2fFzAeqQMg/Bo+esDoe1TONX5+9VZjFB+t
	 cmGXohx/Jb91hojGoguY3DxkmLSxobJubpThMb3S3m/xTbKwmFwwsgk8Abbx1pwgeJ64u
	 pfK1OXx0e34OTyZ1aTWOazGdfAy9UhN5yQc0cCiyL0CR9Pmdlclg69t6ZlvMZmZpBxBrQ
	 22QcA/NjLkN10bjEwpSPz/KLc7cGJAJXyWiSbaPa3rKrqzxJshvmTPCpgMy47PyLL1Bx5
	 /M8IBGO2eDygGl8LFoRHgibC8xbjoklDr/qWV/5tBbJnOcGTrAfU1ghiClNh+xF014Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795405444;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=3L8m3KPGrgGTkKs2Wln4IR6nVwKKAjRoHX7V481q4Yc=;
	b=CD/oKApFvBt3szfsaJC88QT7rEPn+lbT1ccQZ15TwW78kDNudCT7qr1PcwQzo+nkYdQi
	 BrCTP3EOFMSarGl6nT3+EgDCuRa4jdtHDsxNF/DojKqk6Sm2CQog9ylBgfH7IQqi3UjYk
	 BX9ejOWxugaQnAuUMtHCM+PWMhILHQNPWLngWPtE2Al7G1bTRbeiVP58wdVQ48uoFqNz6
	 xG23hTXvcsFw1tf3iRPQwZrp3ycasFxpvRuU0RzbZgN2/3aseUiFwOGUcU/bHGuztrZO5
	 6/uC9jOY7aq3wemfUgEt9m5INIZtEcLo0vv1MykjdflB13ZMdQ/Wxeqx5+Ahx0YjFAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=KDrKEPkH;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=At7h5fnl;
	arc=none smtp.remote-ip=188.121.53.34
Received: from sxplsmtpa04-04.prod.sxb1.secureserver.net (sxplsmtpa04-04.prod.sxb1.secureserver.net [188.121.53.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19665606A6A5
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:44:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19665606A6A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=KDrKEPkH;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=At7h5fnl
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id VKxRxJoOeZuU3VKy5xiqRr; Mon, 23 Nov 2026 03:43:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1795405430;
	bh=3L8m3KPGrgGTkKs2Wln4IR6nVwKKAjRoHX7V481q4Yc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KDrKEPkH0PQtQ84f15QfA3rlDhn9fHPcQ2btjG4Zgr4s96TIcJ7ZsZzIxYIAO7821
	 TqMKA1fYvaWx2R/DD+gUPbJiBy73aY/+F8SafIcZHe2LASHHIuZfUR3qTDE/UwcbFB
	 K1PEHElWNdCapymJpniTL64mRBBtnBgzV1NIFeJKHdTe2NQF1Kg5TjB0LbwaufUFQ5
	 wdR+SDzsYTmCoaXEpBq5l+W2LwxupRrKl2nI5WqrnOkDXk3viSBRSQ9NN0d3cguo1o
	 tlN4m2oGA8syPGUJ7osxOJqfDiKBh+lJ5X+lMDwTKiEtnoafmOxKeFsJfwflmkMBhb
	 jwxbZRTmGBM/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1795405430;
	bh=3L8m3KPGrgGTkKs2Wln4IR6nVwKKAjRoHX7V481q4Yc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=At7h5fnlGNXL8Z3NMHJPTBAMlIuAEg8DfrY97dlNmOb5S0qufFAgHio/lQ9VpDzgt
	 xPQweTJVlKy3BxNu6DoObDbbYqqc5C5/0WUNcXtW1/f4Ba4csZ0t1NYurPT2zrlSoF
	 cmhehSoVOA+3OIah5B4ZDXETRuKuzqSWrciDbrFqlYOnMHWibpQ2XMfhkf9XB8y1Jt
	 iXLoBH4/qTQVluHa9yTwh4bKgZ0zP27qkFBkP/8rtg+XRvuF05+5EXOyQh5/CTyDcI
	 xTZGgz9XWFTILPWmdAz6Gsds5DzNmTJc7JN79/02heeh+RyUs0ZhqLmj50VV4dZ5B6
	 n3kmpb6ykjReQ==
X-CMAE-Analysis: v=2.4 cv=CvYq4X4D c=1 sm=1 tr=0 ts=6b03b676
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=TSaEOjpj3gRMpAirYekA:9 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: 30d8b338453d304160acccafed3ea056:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH v3 17/23] Squashfs: sanity check block list sizes and range
Date: Mon, 23 Nov 2026 03:42:58 +0000
Message-ID: <20261123034304.261742-18-phillip@squashfs.org.uk>
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
X-CMAE-Envelope: MS4xfEADf/PuDNQBjeQEZt3eLTDK8+nrp6uSILLcyscILARG2Sox9r8YWG+9W/9kn/kHVJGDZItvtGGMdA1+P3HghODeVwbn0ugUEXN4Wpz2vqk1EERg9Gs2
 ZrIYSYvr+AdzGdFLa8gqEUYbPgpY2D8IGQT9QUTDabnfs21p6VYnEhXj8+oijkvc0F1g3ep6lEjF/bug7yGzd2/WFmjeI/LaCaRthGqowbZ1csw4OS4ZjC49
 IYQyWbhVH11qr6YjxjofBbEZ8KQ7YwIqToIbkC7+n86Cj6SdW1007o9Mq9dCKPal

A Squashfs file has a list of block sizes, storing the compressed size
of each data block.  This block list is scanned to discover the size and
location of block x, where the sizes of previous data blocks are added
to the start of the data blocks to produce the location.

But, when scanning this block list and adding the block sizes, the code
does not check for arithmetic overflow.  This means the data block start
location can be crafted to be close to 2^64, and so the addition of the
block sizes can cause arithmetic overflow and thereby evade any sanity
checks.

Additionally, the range (start and end) of the data block that is to be
read from the filesystem is not checked for correctness before
squasfs_read_data().

This commit adds checks for arithmetic overflow and sanity checks the
range of the data block before attempting to read from disk.

Reproducer
==========

The reproducer generates a Squashfs filesystem with a file with two
data blocks, and then corrupts the location of the start of the data
blocks to 2^64 - 128 KiB.  This added to the size of data block 0 (128
KiB) will overflow, producing a location of 0.  If the exploit succeeds,
when the second block is read, Squashfs will not produce an I/O error
and instead print the Squashfs filesystem superblock starting with hsqs.

====================================================================
#!/bin/bash

ARGS="-quiet -no-progress -noI -noD -no-sparse -no-fragments -comp gzip"

finish() {
	popd 2>&1 > /dev/null
	rm -rf $DIR
	exit 1
}

DIR=$(mktemp -d)

pushd $DIR 2>&1 > /dev/null

echo "Create Squashfs filesystem with one file, with 2 data blocks"
echo "Create a hard link to it, to force Mksquashfs to use an extended inode"
echo "(more than one nlink).  This means the start_block field will"
echo "be 64-bits"

echo "/ d 0777 0 0" > pseudo
echo "zero f 0777 0 0 dd if=/dev/zero bs=1024 count=256 2>/dev/null" >> pseudo
echo "hardlink L zero" >> pseudo

if ! mksquashfs - img.sqsh -pf pseudo $ARGS; then
	echo Failed to create Squashfs filesystem
	finish

fi

echo "Corrupt the start_block field of file zero's inode, which"
echo "points to the start of the file's data blocks."
echo "Alter it to the value 0xFFFFFFFFFFFE0000 (2^64 - 128 KiB)."
echo "That value added to the size of the first data block (128 KiB)"
echo "will overflow"
echo "The inode start_block field is stored at byte offset 262258"

/usr/bin/echo -en "\x00\x00\xfe\xff\xff\xff\xff\xff" > file
dd if=file of=img.sqsh seek=262258 bs=1 count=8 conv=notrunc status=none

echo Mount the filesystem to /mnt

if ! mount -t squashfs img.sqsh /mnt; then
	echo Mount of Squashfs filesystem failed
	finish
fi

echo Read the file zero.
echo If the exploit succeeds, dd will not fail, and it will display the Squashfs
echo superblock, beginning with hsqs
echo

dd if=/mnt/zero bs=1024 skip=128

popd 2>&1> /dev/null

rm -rf $DIR
====================================================================

Fixes: 1701aecb6849c ("Squashfs: regular file operations")
Signed-off-by: Phillip Lougher <phillip@squashfs.org.uk>
---
v2:
  - Ensure sparse blocks at the end of the inode table do not trigger
    new sanity checks.
---
 fs/squashfs/cache.c            |  2 +-
 fs/squashfs/file.c             | 27 +++++++++++++++++++++------
 fs/squashfs/squashfs_helpers.h | 20 +++++++++++++++++---
 3 files changed, 39 insertions(+), 10 deletions(-)

diff --git a/fs/squashfs/cache.c b/fs/squashfs/cache.c
index 4b6ef8838bc6..a81a1d396074 100644
--- a/fs/squashfs/cache.c
+++ b/fs/squashfs/cache.c
@@ -490,7 +490,7 @@ struct squashfs_cache_entry *squashfs_get_fragment(struct super_block *sb,
 				u64 start_block, int length)
 {
 	struct squashfs_sb_info *msblk = sb->s_fs_info;
-	int res = squashfs_check_range(start_block, length, msblk);
+	int res = squashfs_check_range(start_block, squashfs_frag_size(length, msblk->block_size), msblk);
 
 	if (res < 0)
 		return ERR_PTR(res);
diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
index 5619828ab66f..0a8288a53b25 100644
--- a/fs/squashfs/file.c
+++ b/fs/squashfs/file.c
@@ -281,6 +281,9 @@ static s64 fill_meta_index(struct inode *inode, s64 index,
 			long long res = read_indexes(inode->i_sb, blocks,
 					&cur_index_block, &cur_offset);
 
+			if (res >= 0)
+				res = squashfs_add_indexes(cur_data_block, res, msblk);
+
 			if (res < 0) {
 				if (meta->entries == 0)
 					/*
@@ -292,7 +295,7 @@ static s64 fill_meta_index(struct inode *inode, s64 index,
 				goto failed;
 			}
 
-			cur_data_block += res;
+			cur_data_block = res;
 			meta_entry = &meta->meta_entry[i - meta->offset];
 			meta_entry->index_block = cur_index_block -
 				msblk->inode_table;
@@ -353,8 +356,13 @@ static int read_blocklist_ptrs(struct inode *inode, s64 index, u64 *start,
 		blks = read_indexes(inode->i_sb, index - res, start, offset);
 		if (blks < 0)
 			return (int) blks;
-		if (block)
-			*block += blks;
+		if (block) {
+			res = squashfs_add_indexes(*block, blks, msblk);
+			if (res < 0)
+				return (int) res;
+
+			*block = res;
+		}
 	}
 
 	/*
@@ -492,8 +500,11 @@ static int squashfs_read_folio(struct file *file, struct folio *folio)
 
 		if (res == 0)
 			res = squashfs_readpage_sparse(folio, expected);
-		else
-			res = squashfs_readpage_block(folio, block, res, expected);
+		else {
+			res = squashfs_check_range(block, res, msblk);
+			if (res >= 0)
+				res = squashfs_readpage_block(folio, block, res, expected);
+		}
 	} else
 		res = squashfs_readpage_fragment(folio, expected);
 
@@ -629,7 +640,11 @@ static void squashfs_readahead(struct readahead_control *ractl)
 		}
 
 		bsize = read_blocklist(inode, start >> msblk->block_log, &block);
-		if (bsize == 0)
+		if (bsize <= 0)
+			goto skip_pages;
+
+		bsize = squashfs_check_range(block, bsize, msblk);
+		if (bsize < 0)
 			goto skip_pages;
 
 		actor = squashfs_page_actor_init_special(msblk, pages, nr_pages,
diff --git a/fs/squashfs/squashfs_helpers.h b/fs/squashfs/squashfs_helpers.h
index 6481ac236357..2be1263d33bd 100644
--- a/fs/squashfs/squashfs_helpers.h
+++ b/fs/squashfs/squashfs_helpers.h
@@ -240,10 +240,8 @@ static inline int squashfs_frag_size(u32 disk_size, s32 block_size)
 	return size;
 }
 
-static inline int squashfs_check_range(u64 start_block, s32 disk_size, struct squashfs_sb_info *msblk)
+static inline int squashfs_check_range(u64 start_block, s32 size, struct squashfs_sb_info *msblk)
 {
-	int size = squashfs_frag_size(disk_size, msblk->block_size);
-
 	if (size < 0)
 		return size;
 
@@ -259,4 +257,20 @@ static inline int squashfs_check_range(u64 start_block, s32 disk_size, struct sq
 
 	return size;
 }
+
+static inline s64 squashfs_add_indexes(u64 block, s64 blks, struct squashfs_sb_info *msblk)
+{
+
+	if (block > S64_MAX)
+		return -EIO;
+
+	/*
+	 * the above check ensured block is not 2^63 or larger, and so
+	 * this addition will not overflow
+	 */
+	if (block + blks > msblk->inode_table)
+		return -EIO;
+
+	return block + blks;
+}
 #endif
-- 
2.47.3

