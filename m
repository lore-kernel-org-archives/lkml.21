Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795585948;
	b=hmSltlC4z9ONSYBBYaPsiUWQ5SZXvlIEDX93Nzi3a0WVKjmnOsBm+ZSW4NxFL0+tqUIW
	 6Q6XsdfXEHpOGs3FZpMQH6u+nWLkbWrEKmgR2WRCdOlWbNoFWVc+K7IJzxncSnRCQRK4u
	 7berGHByMu8I9cMChEeYVAYi4S4vjiqOVDjnSCMQ2YDa1FO4rMM9TznnByMh60hvDIciP
	 3U0t0uCfOHa1kGygq9pVtgoFA2USU0AdF6uxtXbmuGeULAt79WK7KxqWN124d5umIKA35
	 1BXEQ0gEnYNe58PQeuG+bFIF5yd1hAtv2+S6SN3hwBU2tlbn8WiQu2aK/SQgKTnfC5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795585948;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Z6my1A9thsaz4NgN0A+Y25Es9f9MoLUQc4I1HG/sa0U=;
	b=lDiS0B4cdaA2mhQYim6gaYwwIys/R/+Kr4GzTti8A6n9f40EGsR7oDcBTHCQbd370FF1
	 HMxv3H48MMNz3ErbEocpecGekDBtw97jHmfQvBTwWwsKqmmUiUvxrYzWBSnOtJGk//r3e
	 9V02QW7lLU2vb5MZNjNa/yVBIgM7qMlQcndJyVtL7wtgmeWPuRZzbKO9e0z1s9Ys/cetw
	 pJlllL0Lrohgm0okyqKwO7TXmbKOZJ1RS7JaTD4MN/YtzKUIh4OLDSSGghsU8MCoSa6VC
	 V2mfuSuyX1v/LlXkykiCbDCeGMgJQqq/09vtafVauJEui4oxd4bPrCKLd2WSQcEU++A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=Pw3ye2kZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5578C606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=Pw3ye2kZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BE301F000CF;
	Wed, 25 Nov 2026 05:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1795585947;
	bh=Z6my1A9thsaz4NgN0A+Y25Es9f9MoLUQc4I1HG/sa0U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Pw3ye2kZV0VPUuqmdYwTZhjfWjNP8XEKVK83FxVboLbzLH/Z5iZrFF7VBROqYUXz/
	 NnIfymbGFzdaPl3YlJ4T9n2VA+MFbXGyJStmZHh0ALt0z3oZtegFCUNWwslf+vnism
	 uEFKE0L3aytf08zD23K10rW/gKU9xvVYIqi2YqEE=
Date: Tue, 24 Nov 2026 21:52:27 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Phillip Lougher <phillip@squashfs.org.uk>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 00/23] Squashfs: fix a lot of AI issues and AI style
 issues
Message-Id: <20261124215227.e23732bb6d1e30b8721099b7@linux-foundation.org>
In-Reply-To: <20261125014737.347231-1-phillip@squashfs.org.uk>
References: <20261125014737.347231-1-phillip@squashfs.org.uk>
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

On Wed, 25 Nov 2026 01:47:14 +0000 Phillip Lougher <phillip@squashfs.org.uk> wrote:

> Note: this is an intermediary patch-set, and not the final patch-set.
> It is intended to see if the issues Sashiko AI reported on the V3 patch-
> set have been dealt with in a way that stops the AI from complaining.
> 
> If that has been achieved then the next step will be to deal wih
> additional issues raised by other AIs, and which could cause Sashiko to
> start complaining again.
> 
> This is not so much see androids fighting but see androids conflicting
> which is much more boring.  Your understanding is appreciated.
>   
> This large patch-set is inspired by the recent spate of AI generated
> code reports.  Four of the patches directly fix AI reported issues, and
> the rest have been found manually by a read-through and testing of the
> code.

Yeah, that's fair enough.  It sucks that the only way to get Sashiko
review is to cc a mailing list.  But it's for good reasons - Sashiko is
already costing Google a ton of money and permitting people to use it
privately would permit all sorts of abuse.

I've suggested ways to get around this, such as "if sender has N
commits in the past M time then permit private review" but that idea
hasn't gone anywhere,

So the unhappy compromise is for Author to conduct their private
conversation with Sashiko while the rest of us are spectators. 
Fortunately nobody reads linux-kernel any more ;)


Thanks, I've updated mm.git's mm-nonmm-unstable branch (and hence
linux-next) to this version.


Here's how v4 altered mm.git:



 fs/squashfs/dir.c           |   18 +++++++++---------
 fs/squashfs/file.c          |    8 +++-----
 fs/squashfs/inode.c         |    8 ++++++++
 fs/squashfs/namei.c         |   15 ++++++++-------
 fs/squashfs/squashfs_fs.h   |    3 +++
 fs/squashfs/squashfs_fs_i.h |    1 +
 6 files changed, 32 insertions(+), 21 deletions(-)

--- a/fs/squashfs/dir.c~b
+++ a/fs/squashfs/dir.c
@@ -79,10 +79,11 @@ static unsigned int get_dir_index_using_
 
 		/* Sanity check the directory index contents */
 
-		/* size should never be larger than SQUASHFS_NAME_LEN */
-		size = le32_to_cpu(dir_index.size) + 1;
-		if (size > SQUASHFS_NAME_LEN)
+		/* size should never be larger than SQUASHFS_DISK_NAME_LEN */
+		size = le32_to_cpu(dir_index.size);
+		if (size > SQUASHFS_DISK_NAME_LEN)
 			break;
+		++ size;
 
 		/* The stored index should not be larger than max_index */
 		index = le32_to_cpu(dir_index.index);
@@ -226,13 +227,13 @@ static int squashfs_readdir(struct file
 				goto failed_read;
 
 			length += sizeof(*dire);
-			size = le16_to_cpu(dire->size) + 1;
+			size = le16_to_cpu(dire->size);
 
-			/* size should never be larger than SQUASHFS_NAME_LEN */
-			if (size > SQUASHFS_NAME_LEN)
+			/* size should never be larger than SQUASHFS_DISK_NAME_LEN */
+			if (size > SQUASHFS_DISK_NAME_LEN)
 				goto failed_read;
 
-			if (!squashfs_dir_space(inode, length, size))
+			if (!squashfs_dir_space(inode, length, ++ size))
 				goto failed_read;
 
 			err = squashfs_read_metadata(inode->i_sb, dire->name,
@@ -262,9 +263,8 @@ static int squashfs_readdir(struct file
 		}
 	}
 
-	kfree(dire);
-
 finish:
+	kfree(dire);
 	return 0;
 
 failed_read:
--- a/fs/squashfs/file.c~b
+++ a/fs/squashfs/file.c
@@ -492,8 +492,7 @@ static int squashfs_read_folio(struct fi
 					PAGE_SHIFT))
 		goto out;
 
-	if (index < file_end || squashfs_i(inode)->fragment_block ==
-					SQUASHFS_INVALID_BLK) {
+	if (index < file_end || !squashfs_i(inode)->has_fragment) {
 		u64 block = 0;
 
 		res = read_blocklist(inode, index, &block);
@@ -633,7 +632,7 @@ static void squashfs_readahead(struct re
 			goto skip_pages;
 
 		if (start >> msblk->block_log == file_end &&
-				squashfs_i(inode)->fragment_block != SQUASHFS_INVALID_BLK) {
+				squashfs_i(inode)->has_fragment) {
 			res = squashfs_readahead_fragment(inode, pages,
 					nr_pages, expected, start);
 			if (res)
@@ -707,8 +706,7 @@ static loff_t seek_hole_data(struct file
 		return -ENXIO;
 
 	/* is offset within tailend and is tailend packed into a fragment? */
-	if (index + 1 == file_end &&
-			squashfs_i(inode)->fragment_block != SQUASHFS_INVALID_BLK) {
+	if (index + 1 == file_end && squashfs_i(inode)->has_fragment) {
 		if (whence == SEEK_DATA)
 			return offset;
 
--- a/fs/squashfs/inode.c~b
+++ a/fs/squashfs/inode.c
@@ -136,6 +136,7 @@ int squashfs_read_inode(struct inode *in
 	type = le16_to_cpu(sqshb_ino->inode_type);
 	switch (type) {
 	case SQUASHFS_REG_TYPE: {
+		char has_fragment;
 		unsigned int frag_offset, frag;
 		int frag_size;
 		u64 frag_blk;
@@ -161,7 +162,9 @@ int squashfs_read_inode(struct inode *in
 			err = squashfs_frag_lookup(sb, frag, &frag_blk, &frag_size);
 			if (err < 0)
 				goto failed_read;
+			has_fragment = true;
 		} else {
+			has_fragment = false;
 			frag_blk = SQUASHFS_INVALID_BLK;
 			frag_size = 0;
 			frag_offset = 0;
@@ -171,6 +174,7 @@ int squashfs_read_inode(struct inode *in
 		inode->i_fop = &squashfs_file_operations;
 		inode->i_mode |= S_IFREG;
 		inode->i_blocks = ((inode->i_size - 1) >> 9) + 1;
+		squashfs_i(inode)->has_fragment = has_fragment;
 		squashfs_i(inode)->fragment_block = frag_blk;
 		squashfs_i(inode)->fragment_size = frag_size;
 		squashfs_i(inode)->fragment_offset = frag_offset;
@@ -187,6 +191,7 @@ int squashfs_read_inode(struct inode *in
 		break;
 	}
 	case SQUASHFS_LREG_TYPE: {
+		char has_fragment;
 		unsigned int frag_offset, frag;
 		int frag_size;
 		u64 frag_blk;
@@ -216,7 +221,9 @@ int squashfs_read_inode(struct inode *in
 			err = squashfs_frag_lookup(sb, frag, &frag_blk, &frag_size);
 			if (err < 0)
 				goto failed_read;
+			has_fragment = true;
 		} else {
+			has_fragment = false;
 			frag_blk = SQUASHFS_INVALID_BLK;
 			frag_size = 0;
 			frag_offset = 0;
@@ -230,6 +237,7 @@ int squashfs_read_inode(struct inode *in
 		inode->i_blocks = (inode->i_size -
 				le64_to_cpu(sqsh_ino->sparse) + 511) >> 9;
 
+		squashfs_i(inode)->has_fragment = has_fragment;
 		squashfs_i(inode)->fragment_block = frag_blk;
 		squashfs_i(inode)->fragment_size = frag_size;
 		squashfs_i(inode)->fragment_offset = frag_offset;
--- a/fs/squashfs/namei.c~b
+++ a/fs/squashfs/namei.c
@@ -108,10 +108,11 @@ static unsigned int get_dir_index_using_
 
 		/* Sanity check the directory index contents */
 
-		/* size should never be larger than SQUASHFS_NAME_LEN */
-		size = le32_to_cpu(dir_index->size) + 1;
-		if (size > SQUASHFS_NAME_LEN)
+		/* size should never be larger than SQUASHFS_DISK_NAME_LEN */
+		size = le32_to_cpu(dir_index->size);
+		if (size > SQUASHFS_DISK_NAME_LEN)
 			break;
+		++ size;
 
 		/* The stored index should not be larger than max_index */
 		index = le32_to_cpu(dir_index->index);
@@ -236,13 +237,13 @@ static struct dentry *squashfs_lookup(st
 				goto read_failure;
 
 			length += sizeof(*dire);
-			size = le16_to_cpu(dire->size) + 1;
+			size = le16_to_cpu(dire->size);
 
-			/* size should never be larger than SQUASHFS_NAME_LEN */
-			if (size > SQUASHFS_NAME_LEN)
+			/* size should never be larger than SQUASHFS_DISK_NAME_LEN */
+			if (size > SQUASHFS_DISK_NAME_LEN)
 				goto data_error;
 
-			if (!squashfs_dir_space(dir, length, size))
+			if (!squashfs_dir_space(dir, length, ++ size))
 				goto data_error;
 
 			err = squashfs_read_metadata(dir->i_sb, dire->name,
--- a/fs/squashfs/squashfs_fs.h~b
+++ a/fs/squashfs/squashfs_fs.h
@@ -32,6 +32,9 @@
 /* Max length of filename (not 255) */
 #define SQUASHFS_NAME_LEN		256
 
+/* Max on-disk length of filename */
+#define SQUASHFS_DISK_NAME_LEN		255
+
 /* Max value for directory header count*/
 #define SQUASHFS_DIR_COUNT		256
 
--- a/fs/squashfs/squashfs_fs_i.h~b
+++ a/fs/squashfs/squashfs_fs_i.h
@@ -17,6 +17,7 @@ struct squashfs_inode_info {
 	unsigned int	xattr_size;
 	unsigned int	xattr_count;
 	int		parent;
+	bool		has_fragment;
 	union {
 		struct {
 			u64		fragment_block;
_

