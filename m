Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.121.53.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795405436;
	b=gjTa3pP6z3xfbEPvVkhylgh8JOCZxYuZ+H5OFRXV2RZncXxGBysmP43VQvbGxSCxiuYS
	 t8N6N0/3CihPh5YPBL2e6EtB2K8mFeYcz/o8qg7bTu+iBSSnSCRXzyYj5t8S07hpohswA
	 8g2MbrWI5LvXPzIkyAzaZwuGe865f8o1xPnKrAlEV4omd23IoOy/hlNiQkqAC5aIs09LB
	 jWq7ddlF0H5bvJU0f6hddYevU60YCtvGcOwI+8Ed/GJO2ewO/0xYd66dtKTVpFhcVolEK
	 /jQHTOOW0YTaMCr5a+/7RCXHAGlK9VxpkW/oLtCB2C4Q7m9AXT71r/uNVfrC0EPYG4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795405436;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=+bVwYPBwKeRDjNONhkFwlNhZrMBxgM5TLuYFj5mKrhw=;
	b=Z6jnhztf4wzVU/yf4vCxS7N3CnAxnKkeEwj6tFxm0b57s/qium+SUOaJw7vjAEi8DBKf
	 jA2pGe1bwQfH+hW9FtYhhnzsEgSQ071DBiLaQnMN2DdbsqpMwiIaE1k51mmNIYjg61cul
	 vJUY2GHVP2JgqUUFAZvg+yWneQexqjzypv05Lzi7Y2dBQ88x2VF4npiEQEG6YGIf3ux3s
	 SxnN2R//y9SyJRZ1X0NcA/prcRpUrGgVg+8ug7ZnOTKJqAlNvpU+c5M7ma5D9n8Gb4SJE
	 RWjUc51Z5wFY+4Py10Gl4RU+UTr/rBe1PUS5BVEvOuNear/1BfvP4Vb92+hrN2yJ51g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=mTjfIuXO;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=MK2SQyzG;
	arc=none smtp.remote-ip=188.121.53.42
Received: from sxplsmtpa04-04.prod.sxb1.secureserver.net (sxplsmtpa04-04.prod.sxb1.secureserver.net [188.121.53.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F9560A2604
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:43:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44F9560A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=mTjfIuXO;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=MK2SQyzG
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id VKxRxJoOeZuU3VKy3xiqRm; Mon, 23 Nov 2026 03:43:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1795405429;
	bh=+bVwYPBwKeRDjNONhkFwlNhZrMBxgM5TLuYFj5mKrhw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mTjfIuXOhtpZ+NMAz3q5yZ/DJZx+7whgEafzlS7k+26E74GxY8TeeytaMNbQpbY0P
	 /4xVvgeaIDnwt2pqy2dqeNszP9m1J3U7HxSabrVE2NLz8h+ZMG8+1YHrZElwygCqX4
	 EdtehwpEpRu5aSN2VhWceUU7tipFG3VgP8wbeQAoGaVKKjYB80LOrcDdGkST0y83wi
	 FI2nEalhKz4KPFU5dlbeq1j4WvjDIlkK9al8lxR7bLxaAM2/SudPvhQ+RFHctK8vLO
	 zM+nmA+ODtqfUK50LfkVxx5xFPWbWVpn7xtWwNjl+3kjUac4UG9NRt6U+rC31iwwQo
	 DSX+5CT+VpUbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1795405429;
	bh=+bVwYPBwKeRDjNONhkFwlNhZrMBxgM5TLuYFj5mKrhw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MK2SQyzGuouJTtGSBYqwcti4JQgpOfsnrlVkayRKZ1R2J2ELF9VHbKGzg1xmj8ml7
	 2LTA4JXG7br5vOuR7U1vHYSDTydwyzYD5TzYUUuQaly+zkGGD3en56uJf5OsaPvnji
	 RYKnzZVB1l8nkA0MuXMG7NwQ7o9hGPhGAH+PEuDmVx5cc1JkX1iOFZVYO7fO3dLw9p
	 sY/X+IbPMv08/KFGrkmrsl+mFF9/Hb2NtKj9EJsxINpuB8grKDjPf66bf9RF5+r+eY
	 rO3mIRK4eChcG5eBK8HDKxVrmuFVjpi2ARpTDl76vKw3p27SqRLEePNYI0y6aQQDD8
	 AOXa8wkUWLq3w==
X-CMAE-Analysis: v=2.4 cv=CvYq4X4D c=1 sm=1 tr=0 ts=6b03b674
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=LnEXa2z1ofUun6N17OIA:9 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: 4d3832ab363d3d7270f2729b7d7a3ce6:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH v3 16/23] Squashfs: sanity check fragment block location and range
Date: Mon, 23 Nov 2026 03:42:57 +0000
Message-ID: <20261123034304.261742-17-phillip@squashfs.org.uk>
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
X-CMAE-Envelope: MS4xfGkjZMCFi/IqesCwzqH/ti4YWNvaj7aKdRxZctFTJEj1oxNMdw/P/kjqOaDPL9ilMiUzlZ4EOHoufsbgESj8cMG/EJ4MPh+mlAZd/is/Rjdcsxx2KUBq
 sFEVk+RM7w+PLWfHs/HgPrTYx/fp1jYt/fdLlvr/RwCXoFzDj5xmodMLuFUUJ7Nj2PqooOztZM4HXaGnHFP+dwpBCfZLHYl0it68aKts3wCfFGUk4np2B1/e
 EoPxm5TXx15gwEvfidy/gH2VdjSUQwojVib+qB2UOIs2CYWBakNS7AMSTPofIZpm

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

Fixes: f400e12656ab5 ("Squashfs: cache operations")
Signed-off-by: Phillip Lougher <phillip@squashfs.org.uk>
---
v2:
  - Don't return frag_size as the return value of squashfs_frag_lookup()
    This ensures the frag_size cannot be treated as a negative error
    result.
---
 fs/squashfs/cache.c            |  7 +++++--
 fs/squashfs/file.c             |  8 ++++++--
 fs/squashfs/fragment.c         |  5 +++--
 fs/squashfs/inode.c            | 12 ++++--------
 fs/squashfs/squashfs.h         |  3 ++-
 fs/squashfs/squashfs_helpers.h | 24 ++++++++++++++++++++++--
 6 files changed, 42 insertions(+), 17 deletions(-)

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
index 76a61d2cc68c..5619828ab66f 100644
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
 
@@ -519,6 +520,9 @@ static int squashfs_readahead_fragment(struct inode *inode, struct page **page,
 	void *addr;
 	struct page *last_page;
 
+	if (IS_ERR(buffer))
+		return 1;
+
 	if (buffer->error)
 		goto out;
 
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
index 380714ac4d34..15db4ac3fa75 100644
--- a/fs/squashfs/inode.c
+++ b/fs/squashfs/inode.c
@@ -158,11 +158,9 @@ int squashfs_read_inode(struct inode *inode, long long ino)
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
 		} else {
 			frag_blk = SQUASHFS_INVALID_BLK;
 			frag_size = 0;
@@ -215,11 +213,9 @@ int squashfs_read_inode(struct inode *inode, long long ino)
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
 		} else {
 			frag_blk = SQUASHFS_INVALID_BLK;
 			frag_size = 0;
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

