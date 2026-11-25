Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.121.53.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795571318;
	b=ByyPPjxyktWZXJezWSUpy60nUNlghjjStYN7DNfbGxJWfA1buP+aFi3vgby2G8K6VYnC
	 kOC5a8i+TELHtsZvziQshOII0F9yg6SR/p5U1ur92iEk+qVsIrdhpDTh8YqHCloxoqNSf
	 hY1WJfi3cSMBT1Yk/JpzA4V6OBp6GWoOCOEWCOtZVWra4QvqNEOdewBCWW5jKOtZxKO8q
	 PDW+np488NHnkpkTe1G5l52Y+hKCWoNO7C8ZaPATCDxFjjSC9t0oC5jw9/TlXgCCJuvyP
	 VbD7s6OYLTUtcyMFCS7/EBB0jzTSRVMkHRCRhguVmOwoWe09vgfvSfzy5nl3yuOYnKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795571318;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=mJ2SZ4stZtL4OlfHO8z0HCQEUDqXz4W61N8Vsq7qT9I=;
	b=RF5ur3NkTmbC0xZ/Vc7YTjUmONiLhB7tioI1kTpnr2BQ7BNkbg0xQTKjePqT8kw0OIbA
	 BOd9upQK0B6NEHiwYv82dXuZU2wmxqpak4OwOh2T0LdPFK+oKAxhC4q/hvOVQg6YlVXdX
	 pvROwkF4YNiA+TPo+QdAI752nEiykTnx3mbtU48lIzpP/iylk6LiRxhP91ZwDvndBNo3w
	 w1a/FQGhx9JOy4WDf9nwSoBb663oMiCNeHrr4G6gyoR5QmLyhavulkiN3p4BxOQInzc1k
	 Aeg6xZHDJBnj/WwjHLaZGbHYHo8s7HXIfGztaNRp9tLjniN93D8inlWDkKmTL+vPzhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b="n7/cQ3oz";
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=ovyGlz5L;
	arc=none smtp.remote-ip=188.121.53.19
Received: from sxplsmtpa04-02.prod.sxb1.secureserver.net (sxplsmtpa04-02.prod.sxb1.secureserver.net [188.121.53.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6241D606A692
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:48:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6241D606A692
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=n7/cQ3oz;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=ovyGlz5L
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id W26zxdCHW8H3GW27TxX8O1; Wed, 25 Nov 2026 01:48:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1795571304;
	bh=mJ2SZ4stZtL4OlfHO8z0HCQEUDqXz4W61N8Vsq7qT9I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=n7/cQ3ozHpgPe67i0WXiQ6bri59cMjBdWjrJRB3uJfNe3z+rgm2Xjc/Cc06Lxe/aR
	 ik7BM5c19wRChcFa5AgdzpeUrwuC8tVKSQ4282ChLVhcIm9QhP0OejO07g6/+eNHl8
	 Q/8F1ZFCFtCXLoSuvdiTflS7VTrl/coZMgPjaYWIm6mG0rvYHWjSGszvdeCED57h71
	 edFBXcoyZJ63zBl/tkWhXwkWy4NnGm7aAG1/xP/M5cWGGU+DVzmsO5UCpLwXAJ/eLq
	 YhpwPrzhERKvcrHWoZ3sXyx2hHZ8X7pq2KpYYfY1hAhLsCKLM2kvzUUGcS/crBlAYf
	 82l3gPbmIUYxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1795571304;
	bh=mJ2SZ4stZtL4OlfHO8z0HCQEUDqXz4W61N8Vsq7qT9I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ovyGlz5L9HcYJjJzs7J7R+obW8dK0i5TWsfaVy65FTUcpNpgjiczXOV4VPUENUNUa
	 cx2JBKPvB0AtyFAYym9Rg///1cPy4ROts3eeq977/TjoAKPL5DqGAizl9P/hA/fmTw
	 G2VeC7MVD7mDn5TPMKrB2X5vrv0K+kZ6yC8tHULpXFe0LJ/F21OG6r4zeQNSV+oNwm
	 aLD5ZpiOphT58dqIyr/N5yfqBV2ESLIrUWPhI5VhQ45O1Q/ugABlMDcIy8rWc4sjlY
	 +QnxdFi+HgPvcvz+ieqMD0ohCwkn92HHI8jYd9ip+6FxKjibqu2gf4Fl8YT0Nsjk0A
	 aYTrllrrn1q+A==
X-CMAE-Analysis: v=2.4 cv=Cuoq4X4D c=1 sm=1 tr=0 ts=6b063e68
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=ZOMSaLFJ8s2LZnWzWLIA:9 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: 6b6c183aa51083147e542e965cfe9720:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH v4 13/23] Squashfs: widen xattr count variables and add sanity check
Date: Wed, 25 Nov 2026 01:47:27 +0000
Message-ID: <20261125014737.347231-14-phillip@squashfs.org.uk>
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
X-CMAE-Envelope: MS4xfERGrBhrYQnsBqI/yJb/dFa0rugI1DXs4GaN0Da1+digyoCgBQ0oBHGr+S1dRftfb/3a19CYu2rvIyKeWcnzYReMUI4DMnsYqyi5bNdw20JtxWqeShel
 QsY1ibkR1MSTWSQTxhrBv6FmKbEdi+hXuhyL1ktJCs5JxpdwdwdoREcKbVr5v7e2DAZTRx+XfpTeAfWZY067l2XzLXDHzKHTgTd9rfQctTDUPozagb0JIjw9
 gLKveWFf6rNqZhVcGnN1mbtoPKnmC15hDytZ8T0HZbQPq4hbLobeb+s98T5Jxac3

The maximum number of Xattrs in an inode is 2^32-1 in Squashfs.  However
the code incorrectly treats the count as signed, or 2^31-1.

This means any value above 2^31-1 becomes a negative number, and it
means loops will not terminate due to the negative comparison.  This
means the code will continue reading the filesystem until either the
data is incorrect, or the end of the filesystem is reached.

The code also lacks a check that the count is too large, which will
again mean that the code will continue reading the filesystem.

Finally, the code also lacks a check for a zero count, this means
anything reading xattrs from the inode will successfully read no xattrs,
even though this should have returned error due to corruption.

This commit changes the variables to be unsigned, and so negative values
do not occur, and it first adds a sanity check for a zero xattr count,
and second checks that the count isn't larger than the xattr size.

Reproducer
==========

This reproducer allows both zero, negative and large xattr count to be
reproduced.  In the case of a negative or large count, the exploit
succeeds if dmesg shows the code failed to read a metadata block, due to
the loop not terminating.  In the case of a zero count, the exploit
succeeds if gerfattr successfully returns with no xattrs.

====================================================================
#!/bin/bash

finish() {
	popd 2>&1 > /dev/null
	rm -rf $DIR
	exit 1
}

if [ $# -lt 1 ]; then
	echo This needs a parameter
	echo $0 N/0/L 
	echo N reproduce negative xattr count
	echo 0 reproduce 0 xattr count
	echo L reproduce a large count
	exit 1
fi

if [ $1 = "N" ]; then
	echo Reproducing negative xattr count
elif [ $1 = "0" ]; then
	echo Reproducing 0 xattr count
elif [ $1 = "L" ]; then
	echo Reproducing large xattr count
else
	echo Input not N, 0 or L
	exit 1
fi

DIR=$(mktemp -d)

pushd $DIR 2>&1 > /dev/null

# Create a Squashfs pseudo file which is fed to Mksquashfs
echo Create a Squashfs pseudo file which is fed to Mksquashfs

echo "/ d 0777 0 0" > pseudo
echo "example f 0777 0 0 echo example data" >> pseudo
echo "example x user.comment=example xattr" >> pseudo

# Generate the Squashfs filesystem
echo Generate the Squashfs filesystem

mksquashfs - img.sqsh -pf pseudo -quiet -no-progress -noX

# The xattr_id_table_start is at offset 56 in the superblock, 32-bit little-endian.
# For such a small filesystem, we only need to read the first two bytes.
low=$(dd if=img.sqsh bs=1 skip=56 count=1 status=none | od -An -v -tu1 | tr -d '\n')
hi=$(dd if=img.sqsh bs=1 skip=57 count=1 status=none | od -An -v -tu1 | tr -d '\n')
start=$(( $hi * 256 + $low ))

# The start of the single xattr id is 16 bytes before the xattr_id_table, and the
# count field is 8 bytes before
(( start -= 8 ))

if [ $1 = "N" ]; then
	# Write -1 to the count field
	echo Writing -1 to the count field
	echo -ne "\xff\xff\xff\xff" > file
elif [ $1 = "0" ]; then
	# Write 0 to the count field
	echo Writing 0 to the count field
	echo -ne "\x00\x00\x00\x00" > file
else
	# Write 255 to the count field
	echo Writing 255 to the count field
	echo -ne "\xff\x00\x00\x00" > file
fi

dd if=file of=img.sqsh bs=1 seek=$start count=4 conv=notrunc status=none

# Mount the filesystem to /mnt
echo Mount the filesystem to /mnt

if ! mount -t squashfs img.sqsh /mnt; then
	echo Mount of Squashfs filesystem failed
	finish
fi

if [ $1 = "0" ]; then
	if ! getfattr /mnt/example > output; then
		echo Exploit failed, getfattr returned error
	elif [ ! -s output ]; then
		echo Exploit succeeded, getfattr returned success with no xattrs
	else
		echo Getfattr succeeded with some xattrs.  The filesystem was not corrupted
	fi
else
	if ! getfattr /mnt/example; then
		echo Getfattr failed, this is expected.
		echo If dmesg shows the following, then the exploit succeeded
		echo SQUASHFS error: Failed to read block 0x124: -5
		echo SQUASHFS error: Unable to read metadata cache entry [122]
	else
		echo Getfattr succeeded with some xattrs.  The filesystem was not corrupted
	fi
fi

popd 2>&1 > /dev/null
rm -rf $DIR
exit 0
====================================================================

Signed-off-by: Phillip Lougher <phillip@squashfs.org.uk>
---
 fs/squashfs/inode.c         |  2 +-
 fs/squashfs/squashfs_fs_i.h |  2 +-
 fs/squashfs/xattr.c         | 27 ++++++++++++++++++++-------
 fs/squashfs/xattr.h         |  6 +++---
 fs/squashfs/xattr_id.c      |  3 ++-
 5 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/fs/squashfs/inode.c b/fs/squashfs/inode.c
index 7c262be4a644..380714ac4d34 100644
--- a/fs/squashfs/inode.c
+++ b/fs/squashfs/inode.c
@@ -460,7 +460,7 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 		inode->i_blocks += ((squashfs_i(inode)->xattr_size - 1) >> 9)
 				+ 1;
 	} else
-		squashfs_i(inode)->xattr_count = 0;
+		squashfs_i(inode)->xattr = SQUASHFS_INVALID_BLK;
 
 	return 0;
 
diff --git a/fs/squashfs/squashfs_fs_i.h b/fs/squashfs/squashfs_fs_i.h
index 8e497ac07b9a..90c3b085ac0e 100644
--- a/fs/squashfs/squashfs_fs_i.h
+++ b/fs/squashfs/squashfs_fs_i.h
@@ -15,7 +15,7 @@ struct squashfs_inode_info {
 	int		offset;
 	u64		xattr;
 	unsigned int	xattr_size;
-	int		xattr_count;
+	unsigned int	xattr_count;
 	int		parent;
 	union {
 		struct {
diff --git a/fs/squashfs/xattr.c b/fs/squashfs/xattr.c
index f9ef669544f8..d7247648ac35 100644
--- a/fs/squashfs/xattr.c
+++ b/fs/squashfs/xattr.c
@@ -33,13 +33,16 @@ ssize_t squashfs_listxattr(struct dentry *d, char *buffer,
 	u64 start = squashfs_xattr_blk(squashfs_i(inode)->xattr)
 						+ msblk->xattr_table;
 	int offset = squashfs_xattr_offset(squashfs_i(inode)->xattr);
-	int count = squashfs_i(inode)->xattr_count;
+	unsigned int count = squashfs_i(inode)->xattr_count;
 	size_t rest = buffer_size;
 	int err;
 
-	/* check that the file system has xattrs */
-	if (msblk->xattr_id_table == NULL)
-		return -EOPNOTSUPP;
+	/* check that the file has xattrs */
+	if (squashfs_i(inode)->xattr == SQUASHFS_INVALID_BLK)
+		return 0;
+
+	if (count == 0 || count > squashfs_i(inode)->xattr_size)
+		return -EIO;
 
 	/* loop reading each xattr name */
 	while (count--) {
@@ -111,12 +114,21 @@ static int squashfs_xattr_get(struct inode *inode, int name_index,
 	u64 start = squashfs_xattr_blk(squashfs_i(inode)->xattr)
 						+ msblk->xattr_table;
 	int offset = squashfs_xattr_offset(squashfs_i(inode)->xattr);
-	int count = squashfs_i(inode)->xattr_count;
+	unsigned int count = squashfs_i(inode)->xattr_count;
 	int name_len = strlen(name);
 	int err, vsize;
-	char *target = kmalloc(name_len, GFP_KERNEL);
+	char *target;
+
+	/* check that the file has xattrs */
+	if (squashfs_i(inode)->xattr == SQUASHFS_INVALID_BLK)
+		return -ENODATA;
+
+	if (count == 0 || count > squashfs_i(inode)->xattr_size)
+		return -EIO;
+
+	target = kmalloc(name_len, GFP_KERNEL);
 	if (target == NULL)
-		return  -ENOMEM;
+		return -ENOMEM;
 
 	/* loop reading each xattr name */
 	for (; count; count--) {
@@ -169,6 +181,7 @@ static int squashfs_xattr_get(struct inode *inode, int name_index,
 				goto failed;
 
 			vsize = le32_to_cpu(val.vsize);
+
 			if (buffer) {
 				if (vsize > buffer_size) {
 					err = -ERANGE;
diff --git a/fs/squashfs/xattr.h b/fs/squashfs/xattr.h
index f1a463d8bfa0..b33e9ad4057f 100644
--- a/fs/squashfs/xattr.h
+++ b/fs/squashfs/xattr.h
@@ -11,8 +11,8 @@
 #ifdef CONFIG_SQUASHFS_XATTR
 extern __le64 *squashfs_read_xattr_id_table(struct super_block *, u64,
 		u64 *, unsigned int *);
-extern int squashfs_xattr_lookup(struct super_block *, unsigned int, int *,
-		unsigned int *, unsigned long long *);
+extern int squashfs_xattr_lookup(struct super_block *, unsigned int,
+		unsigned int *, unsigned int *, unsigned long long *);
 #else
 static inline __le64 *squashfs_read_xattr_id_table(struct super_block *sb,
 		u64 start, u64 *xattr_table_start, unsigned int *xattr_ids)
@@ -31,7 +31,7 @@ static inline __le64 *squashfs_read_xattr_id_table(struct super_block *sb,
 }
 
 static inline int squashfs_xattr_lookup(struct super_block *sb,
-		unsigned int index, int *count, unsigned int *size,
+		unsigned int index, unsigned int *count, unsigned int *size,
 		unsigned long long *xattr)
 {
 	return 0;
diff --git a/fs/squashfs/xattr_id.c b/fs/squashfs/xattr_id.c
index ff85247e2d80..621777e0a3b4 100644
--- a/fs/squashfs/xattr_id.c
+++ b/fs/squashfs/xattr_id.c
@@ -27,7 +27,8 @@
  * Map xattr id using the xattr id look up table
  */
 int squashfs_xattr_lookup(struct super_block *sb, unsigned int index,
-		int *count, unsigned int *size, unsigned long long *xattr)
+		unsigned int *count, unsigned int *size,
+		unsigned long long *xattr)
 {
 	struct squashfs_sb_info *msblk = sb->s_fs_info;
 	int block = squashfs_xattr_block(index);
-- 
2.47.3

