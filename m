Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795407193;
	b=GCJnBCry99KAn4qzSu6tm87C4P1vx+cY2THrXUMKLn59cJu9fSLxXfU5OR6a24UFR2ZK
	 VCCxbcSefp4sgisrpWab4MBeTU6K8bkiO8vvlo2ka+wl9ysYOMPdQLmC2wv5OzjisVUsF
	 dvrrpf/ysFJdymAkTGeLcaiJi+TCKGVbzMuHWJiHYK6An34V+PekXrNl1DWpDzMHvgaRR
	 LUlOfxr7ilKuSUF48X/8kUryDl3xFrTRWjiQuVpZGgMobJWwa2Aw15jdJJ37HVVuuNNMg
	 w827kYJofUbbMMcpEGPF5OZFOTVqJJrFejLuAmLSimrTcaZKpVPQSFYSVBlWcFfAy5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795407193;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=9lgOnorQe966k3rJDNVdEmX75DzDa1voIxV8+AwyxjU=;
	b=Wed7qcPaQz2zPBduxxzdrPks6JkischYd/Rf43JxKh2t7Zvre5UwZFXjQ3on99aFQcnk
	 m1MygjdNRwd8j/bOsHG5nl+nRc1E8VO6mXDEfz1lYGSt+J8oFJMNqoUexWx/TWSjACdgR
	 cYeuijzW+7Rfg6lxIJGrC3kFxyVcCDHDO/lZAElQ72W4JXRQWNKmE4q1tqTSpSKP9s2DG
	 nkRpZgEQWg4HWfs7dV8fR1JIcYiW2G8gDej8KkCqZsrqYvquxKSAyMonrFUlOljR7r1Py
	 zqJqFOsS8M6peEoQvvblwmARJqeEf8tYppqxC0Wsp7IK812wX9Be6sIw/nEGcR4/Ugw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=UiV1W6I3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1064A606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=UiV1W6I3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 831081F000CA;
	Mon, 23 Nov 2026 04:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1795407191;
	bh=9lgOnorQe966k3rJDNVdEmX75DzDa1voIxV8+AwyxjU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=UiV1W6I3It+ZyJL2wJAcnkaSnXHuZRAolI/vOg2xZYS4d8XBGUD7tZAPtx0D9vtbi
	 fFzZwKSaQiYa/NAikICHQClXOIL6ZRY8K1lGUUM2j3a6XPFGjXv5OVVnjCEH69riUX
	 KKfzY3MqK1rvNP7VjX6IrxNT/U4mOZDRReCjsAZI=
Date: Sun, 22 Nov 2026 20:13:11 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Phillip Lougher <phillip@squashfs.org.uk>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/23] Squashfs: fix a lot of AI issues and AI style
 issues
Message-Id: <20261122201311.89fa22450c58843f31ecf56d@linux-foundation.org>
In-Reply-To: <20261123034304.261742-1-phillip@squashfs.org.uk>
References: <20261123034304.261742-1-phillip@squashfs.org.uk>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 23 Nov 2026 03:42:41 +0000 Phillip Lougher <phillip@squashfs.org.uk> wrote:

> This large patch-set is inspired by the recent spate of AI generated
> code reports.  Four of the patches directly fix AI reported issues, and
> the rest have been found manually by a read-through and testing of the
> code.
> 

Thanks.  I've updated mm.git's mm-nonmm-unstable branch to this version.

Here's how v3 altered mm.git:


 fs/squashfs/dir.c              |   37 ++++++++++++--------
 fs/squashfs/file.c             |    4 +-
 fs/squashfs/inode.c            |    8 +++-
 fs/squashfs/namei.c            |   57 +++++++++++++++----------------
 fs/squashfs/squashfs_helpers.h |   11 ++---
 5 files changed, 65 insertions(+), 52 deletions(-)

--- a/fs/squashfs/dir.c~b
+++ a/fs/squashfs/dir.c
@@ -134,23 +134,15 @@ static int squashfs_readdir(struct file
 {
 	struct inode *inode = file_inode(file);
 	struct squashfs_sb_info *msblk = inode->i_sb->s_fs_info;
-	s64 block = squashfs_dir_start(squashfs_i(inode)->start, msblk);
-	int offset = squashfs_i(inode)->offset, err;
+	s64 block;
+	int offset, err;
 	loff_t length;
 	unsigned int inode_number, dir_count, size, type;
 	struct squashfs_dir_header dirh;
 	struct squashfs_dir_entry *dire = NULL;
 
-	TRACE("Entered squashfs_readdir [%llx:%x]\n", squashfs_i(inode)->start, offset);
-
-	if (block < 0)
-		goto failed_read;
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
@@ -181,6 +173,21 @@ static int squashfs_readdir(struct file
 		ctx->pos += size;
 	}
 
+	if (i_size_read(inode) == 3)
+		/* The directory is empty, nothing more to do */
+		goto finish;
+
+	block = squashfs_dir_start(squashfs_i(inode)->start, msblk);
+	if (block < 0)
+		goto failed_read;
+
+	dire = kmalloc(sizeof(*dire) + SQUASHFS_NAME_LEN + 1, GFP_KERNEL);
+	if (dire == NULL) {
+		ERROR("Failed to allocate squashfs_dir_entry\n");
+		goto finish;
+	}
+
+	offset = squashfs_i(inode)->offset;
 	length = get_dir_index_using_offset(inode->i_sb, &block, &offset,
 				squashfs_i(inode)->dir_idx_start,
 				squashfs_i(inode)->dir_idx_offset,
@@ -255,12 +262,14 @@ static int squashfs_readdir(struct file
 		}
 	}
 
-finish:
 	kfree(dire);
+
+finish:
 	return 0;
 
 failed_read:
-	ERROR("Unable to read directory block [%llx:%x]\n", squashfs_i(inode)->start, offset);
+	ERROR("Unable to read directory [%llx:%x]\n", squashfs_i(inode)->start,
+			squashfs_i(inode)->offset);
 	kfree(dire);
 	return 0;
 }
--- a/fs/squashfs/file.c~b
+++ a/fs/squashfs/file.c
@@ -596,10 +596,10 @@ static void squashfs_readahead(struct re
 {
 	struct inode *inode = ractl->mapping->host;
 	struct squashfs_sb_info *msblk = inode->i_sb->s_fs_info;
-	size_t mask = (1UL << msblk->block_log) - 1;
+	s64 mask = (1UL << msblk->block_log) - 1;
 	unsigned short shift = msblk->block_log - PAGE_SHIFT;
 	loff_t start = readahead_pos(ractl) & ~mask;
-	size_t len = readahead_length(ractl) + readahead_pos(ractl) - start;
+	s64 len = readahead_length(ractl) + readahead_pos(ractl) - start;
 	struct squashfs_page_actor *actor;
 	unsigned int nr_pages = 0;
 	struct page **pages;
--- a/fs/squashfs/inode.c~b
+++ a/fs/squashfs/inode.c
@@ -255,8 +255,10 @@ int squashfs_read_inode(struct inode *in
 
 		/* The directory size must be 3 or larger, as it includes "." and ".." entries */
 		inode->i_size = le16_to_cpu(sqsh_ino->file_size);
-		if (inode->i_size < 3)
+		if (inode->i_size < 3) {
+			err = -EINVAL;
 			goto failed_read;
+		}
 
 		set_nlink(inode, le32_to_cpu(sqsh_ino->nlink));
 		inode->i_op = &squashfs_dir_inode_ops;
@@ -284,8 +286,10 @@ int squashfs_read_inode(struct inode *in
 
 		/* The directory size must be 3 or larger, as it includes "." and ".." entries */
 		inode->i_size = le32_to_cpu(sqsh_ino->file_size);
-		if (inode->i_size < 3)
+		if (inode->i_size < 3) {
+			err = -EINVAL;
 			goto failed_read;
+		}
 
 		xattr_id = le32_to_cpu(sqsh_ino->xattr);
 		set_nlink(inode, le32_to_cpu(sqsh_ino->nlink));
--- a/fs/squashfs/namei.c~b
+++ a/fs/squashfs/namei.c
@@ -74,11 +74,8 @@ static unsigned int get_dir_index_using_
 
 	TRACE("Entered get_dir_index_using_name, i_count %u\n", i_count);
 
-	dir_index = kmalloc(sizeof(*dir_index) + SQUASHFS_NAME_LEN + 1, GFP_KERNEL);
-	if (dir_index == NULL) {
-		ERROR("Failed to allocate squashfs_dir_index\n");
+	if (i_count == 0)
 		goto out;
-	}
 
 	/*
 	 * Translate from external index to internal index.  This is offset by
@@ -97,6 +94,12 @@ static unsigned int get_dir_index_using_
 	max_index -= sizeof(struct squashfs_dir_header) +
 				sizeof(struct squashfs_dir_entry) + 1;
 
+	dir_index = kmalloc(sizeof(*dir_index) + SQUASHFS_NAME_LEN + 1, GFP_KERNEL);
+	if (dir_index == NULL) {
+		ERROR("Failed to allocate squashfs_dir_index\n");
+		goto out;
+	}
+
 	for (i = 0; i < i_count; i++) {
 		err = squashfs_read_metadata(sb, dir_index, &index_start,
 					&index_offset, sizeof(*dir_index));
@@ -147,10 +150,9 @@ static unsigned int get_dir_index_using_
 		*next_block = res;
 	}
 
-out:
 	*next_offset = ((u64)length + *next_offset) % SQUASHFS_METADATA_SIZE;
 	kfree(dir_index);
-
+out:
 	/*
 	 * Return index (f_pos) of the looked up metadata block.  Translate
 	 * from internal f_pos to external f_pos which is offset by 3 because
@@ -170,15 +172,23 @@ static struct dentry *squashfs_lookup(st
 	struct squashfs_sb_info *msblk = dir->i_sb->s_fs_info;
 	struct squashfs_dir_header dirh;
 	struct squashfs_dir_entry *dire = NULL;
-	u64 block = squashfs_dir_start(squashfs_i(dir)->start, msblk);
-	int offset = squashfs_i(dir)->offset;
-	int err;
+	s64 block;
+	int offset, err;
 	loff_t length;
 	unsigned int dir_count, size;
 
-	TRACE("Entered squashfs_lookup [%llx:%x]\n", squashfs_i(dir)->start, offset);
+	TRACE("Entered squashfs_lookup [%llx:%x]\n", squashfs_i(inode)->start,
+			squashfs_i(inode)->offset);
 
-	if ((s64)block < 0)
+	if (len > SQUASHFS_NAME_LEN)
+		return ERR_PTR(-ENAMETOOLONG);
+
+	if (i_size_read(dir) == 3)
+		/* The directory is empty, and so there's nothing to do */
+		goto exit_lookup;
+
+	block = squashfs_dir_start(squashfs_i(dir)->start, msblk);
+	if (block < 0)
 		goto data_error;
 
 	dire = kmalloc(sizeof(*dire) + SQUASHFS_NAME_LEN + 1, GFP_KERNEL);
@@ -187,11 +197,7 @@ static struct dentry *squashfs_lookup(st
 		return ERR_PTR(-ENOMEM);
 	}
 
-	if (len > SQUASHFS_NAME_LEN) {
-		err = -ENAMETOOLONG;
-		goto failed;
-	}
-
+	offset = squashfs_i(dir)->offset;
 	length = get_dir_index_using_name(dir->i_sb, &block, &offset,
 				squashfs_i(dir)->dir_idx_start,
 				squashfs_i(dir)->dir_idx_offset,
@@ -203,7 +209,7 @@ static struct dentry *squashfs_lookup(st
 		 * Read directory header.
 		 */
 		if (!squashfs_dir_space(dir, length, sizeof(dirh)))
-			goto read_failure;
+			goto data_error;
 
 		err = squashfs_read_metadata(dir->i_sb, &dirh, &block,
 				&offset, sizeof(dirh));
@@ -221,10 +227,8 @@ static struct dentry *squashfs_lookup(st
 			/*
 			 * Read directory entry.
 			 */
-			if (!squashfs_dir_space(dir, length, sizeof(*dire))) {
-				err = -ENOSPC;
-				goto read_failure;
-			}
+			if (!squashfs_dir_space(dir, length, sizeof(*dire)))
+				goto data_error;
 
 			err = squashfs_read_metadata(dir->i_sb, dire, &block,
 					&offset, sizeof(*dire));
@@ -238,10 +242,8 @@ static struct dentry *squashfs_lookup(st
 			if (size > SQUASHFS_NAME_LEN)
 				goto data_error;
 
-			if (!squashfs_dir_space(dir, length, size)) {
-				err = -ENOSPC;
-				goto read_failure;
-			}
+			if (!squashfs_dir_space(dir, length, size))
+				goto data_error;
 
 			err = squashfs_read_metadata(dir->i_sb, dire->name,
 					&block, &offset, size);
@@ -280,9 +282,8 @@ data_error:
 	err = -EIO;
 
 read_failure:
-	ERROR("Unable to read directory block [%llx:%x]\n",
-		squashfs_i(dir)->start, squashfs_i(dir)->offset);
-failed:
+	ERROR("Unable to read directory [%llx:%x]\n", squashfs_i(dir)->start,
+			squashfs_i(dir)->offset);
 	kfree(dire);
 	return ERR_PTR(err);
 }
--- a/fs/squashfs/squashfs_helpers.h~b
+++ a/fs/squashfs/squashfs_helpers.h
@@ -59,7 +59,7 @@ static inline s64 squashfs_inode_start(s
 
 	start = msblk->inode_table + squashfs_inode_blk(inode);
 
-	if (start > msblk->directory_table)
+	if (start >= msblk->directory_table)
 		return -EINVAL;
 
 	return start;
@@ -80,8 +80,7 @@ static inline s64 squashfs_dir_start(u32
 
 	start = msblk->directory_table + blk;
 
-	if (msblk->directory_table < msblk->directory_table_end &&
-				start >= msblk->directory_table_end)
+	if (start >= msblk->directory_table_end)
 		return -EINVAL;
 
 	return start;
@@ -135,7 +134,7 @@ static inline s64 squashfs_fragment_inde
 	return start;
 }
 
-static inline s16 squashfs_fragment_indexes_offset(u32 fragments)
+static inline s32 squashfs_fragment_indexes_offset(u32 fragments)
 {
 	return (squashfs_fragment_index(fragments) * sizeof(long long)) & (PAGE_SIZE - 1);
 }
@@ -188,7 +187,7 @@ static inline s64 squashfs_lookup_blocks
 	return start;
 }
 
-static inline s16 squashfs_lookup_blocks_offset(u32 inodes)
+static inline s32 squashfs_lookup_blocks_offset(u32 inodes)
 {
 	return (squashfs_lookup_block(inodes) * sizeof(long long)) & (PAGE_SIZE - 1);
 }
@@ -269,7 +268,7 @@ static inline s64 squashfs_xattr_blocks_
 	return start;
 }
 
-static inline s16 squashfs_xattr_blocks_offset(u32 xattrs)
+static inline s32 squashfs_xattr_blocks_offset(u32 xattrs)
 {
 	return (squashfs_xattr_block(xattrs) * sizeof(long long)) & (PAGE_SIZE - 1);
 }
_

