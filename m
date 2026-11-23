Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.121.53.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795405424;
	b=Y3zeZQs5Nx2JW2/iPHzrHunI+JTGnOMb7BjbquQMaRmEzrHg97Q8jWmiy4H7iscL5CeP
	 Q3OA+24ST4YqUcLN3ZWik7ysJatMoGTeVmFXGLeaFH3NxHWFDuEK4NaK8ZYjed2//vT/6
	 VNDMjB4uYf3PROu4h/aOjeqwoLTe2mkn+PYvGA55XdN/GwFRoa3Ig+913/XPtAbNdtdX4
	 hF0C/2HR4uz5TmoirutsRIFcU7WAf2hE5POVSArLCPLhgmAYVYioWetj7QgZzIorFEqbN
	 AqncflGz0veFSt7XjWFJTkHE1+n4Cp1oct6VcLhByxs0NvRnDY5o5iHIidG3MRZ6qJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795405424;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=4NZNd9Ji2ZS1mTLorjjVdHGN6FwnQ2eRZygTpuOg12s=;
	b=mq0h1TFVq0M1dO/q2/68E5vV2wj1dP5xNTl7M9I4R+4Mgl/lJNBTupEIFd6i6jb/USDU
	 wzeZdRKevKx/NIcnNBYpAq1Ehmg2uIQYtaFiIXOAbY087dNjFhrzcBB1h78rPra8QwnGd
	 0MFJVfBvn0aIeM2Yt6w/1MyAj+zIyqPjgR1ELJ/U8dkpaF44pfKNpz6PRFYILoMnv++jY
	 6LpsvuNntzxqumsh2oPnERz2c19zlHg1vQCRFezz6V0SPffwl+4hiAxKYF3y2xXaSS/vq
	 11/NyzLF7ljcDuomogJxO1UTYlYRaEEwUyx/6PI9QtUv4TB7dJ5wrnzKTeI2yl0ASUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=eTqwUnix;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=TU9f0OZp;
	arc=none smtp.remote-ip=188.121.53.37
Received: from sxplsmtpa04-04.prod.sxb1.secureserver.net (sxplsmtpa04-04.prod.sxb1.secureserver.net [188.121.53.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4148C606A32D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:43:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4148C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=eTqwUnix;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=TU9f0OZp
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id VKxRxJoOeZuU3VKxsxiqQg; Mon, 23 Nov 2026 03:43:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1795405417;
	bh=4NZNd9Ji2ZS1mTLorjjVdHGN6FwnQ2eRZygTpuOg12s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eTqwUnixpeeRV/DtL3ltyEuL33HoPBSaRWb/12Mk1/MjGTCADNJRjTTLFT35dfLJu
	 N116WFrgpTicssJr85UUYfxPYw8l+88yAYK8tBSpMKS6ekgBHLSbnEoqq9o0DxpWA7
	 22Q7xHDm0GmEVkdf18L3MBprgy3SOMIIhxEzMXCzfxRO8wI2QfG9n3gHg/P+o9Dj0w
	 tseiKCP3d30zEkuOq3k7BJETjGAeffi+dSvkM2gKVVRFwS8i7SXabdvUJ0BMv2PUdI
	 qWFaLOIzw+gHIgjqmUVS8xTn5WWOSeuRWhra2lbidAppJ+8lWYcWf0Nr3V4ocCQuKu
	 YL1IpZL4gpLIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1795405417;
	bh=4NZNd9Ji2ZS1mTLorjjVdHGN6FwnQ2eRZygTpuOg12s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TU9f0OZp6zSg4xMH2X3jne1J3yIi9On3+xg4pXjfHJTMx/TrKvR0HNGe1tNPilb0w
	 X1eCjTc07vxAb8bMAEM3+4H+4XJzHVhGnXLjyNmuAcg7njemwbnj/53joy8IeRBBXq
	 Nf/wkqnlA+TyiMMispb7Yi8fBm8QSnJZQnfAZZ29U+Ok3NjScjluwiPSjHCDpkFI2V
	 E1J2qLl/k67zfS/sX0gQqNeg3oDJYM/GPZAF81XfCTGHHKMREkJnkwGqcWQSBzSP/y
	 ubIWOjNABrFIq3n6aj5GXXqv95sLFfCW4bH2SrwNvp1PfhLM1zh+tGAvgBCA8wSmS8
	 6uN3VaKUio4KA==
X-CMAE-Analysis: v=2.4 cv=CvYq4X4D c=1 sm=1 tr=0 ts=6b03b669
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=zrJx8fS5UJxIVRjR8XIA:9 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: 51d7b4bf2e6eaeabdb384046890b06a7:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH v3 08/23] Squashfs: don't compute start or alloc memory on empty directory or index
Date: Mon, 23 Nov 2026 03:42:49 +0000
Message-ID: <20261123034304.261742-9-phillip@squashfs.org.uk>
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
X-CMAE-Envelope: MS4xfDeoEjlzQ8nFBP3ZQ5yK35Zq48hwP2sYxXsd3y+tAIqHcxvAN3LPrnU7RVYyzQnjP0TwmdS5xzYWzeaxqohrKiX3FiBDtI7jm9QxvkCkyn6aPhgMYyaE
 BmNGmf6gMwlgR4422Nz8jdqNJ44TIIr75qXABCcc9t7uWLiwMsU5g66HpHZzMVV02z9Fa8lgOcv9LyYnEXqtEXZrFraOkINKlN9qSzXGfqAFfZXRBL7B4ha1
 CmWuQYNbBPvi5ZTZY+76ECp9tR7eoUAgAtqBEPBQrvi0tgHBu170oafeqiyzUTWG

If a directory is empty (length equals 3), then there is no data to be
read from the filesystem.

This means we can optimise directory reading and lookup with empty
directories by skipping allocating memory to read data into, and
also skip computing the start location.

If the directory index is also empty, we can also skip allocating
memory when reading the index.

This commit also fixes the TRACE statements to display the start
and offset of the directory data within the directory table,
rather than the computed location on disk, or the incremented values
after squashfs_read_metadata() has been called.

It also adds sanity checks to ensure that the directory length is not
less than 3 bytes.

Signed-off-by: Phillip Lougher <phillip@squashfs.org.uk>
---
 fs/squashfs/dir.c   | 32 +++++++++++++++++++++-----------
 fs/squashfs/inode.c | 16 ++++++++++++++--
 fs/squashfs/namei.c | 32 +++++++++++++++++++-------------
 3 files changed, 54 insertions(+), 26 deletions(-)

diff --git a/fs/squashfs/dir.c b/fs/squashfs/dir.c
index cd3598bd034f..7bbdfa438a32 100644
--- a/fs/squashfs/dir.c
+++ b/fs/squashfs/dir.c
@@ -99,19 +99,14 @@ static int squashfs_readdir(struct file *file, struct dir_context *ctx)
 {
 	struct inode *inode = file_inode(file);
 	struct squashfs_sb_info *msblk = inode->i_sb->s_fs_info;
-	u64 block = squashfs_i(inode)->start + msblk->directory_table;
-	int offset = squashfs_i(inode)->offset, length, err;
+	u64 block;
+	int offset, length, err;
 	unsigned int inode_number, dir_count, size, type;
 	struct squashfs_dir_header dirh;
 	struct squashfs_dir_entry *dire;
 
-	TRACE("Entered squashfs_readdir [%llx:%x]\n", block, offset);
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
@@ -142,6 +137,19 @@ static int squashfs_readdir(struct file *file, struct dir_context *ctx)
 		ctx->pos += size;
 	}
 
+	if (i_size_read(inode) == 3)
+		/* The directory is empty, nothing more to do */
+		goto finish;
+
+	dire = kmalloc(sizeof(*dire) + SQUASHFS_NAME_LEN + 1, GFP_KERNEL);
+	if (dire == NULL) {
+		ERROR("Failed to allocate squashfs_dir_entry\n");
+		goto finish;
+	}
+
+	block = squashfs_i(inode)->start + msblk->directory_table;
+	offset = squashfs_i(inode)->offset;
+
 	length = get_dir_index_using_offset(inode->i_sb, &block, &offset,
 				squashfs_i(inode)->dir_idx_start,
 				squashfs_i(inode)->dir_idx_offset,
@@ -206,12 +214,14 @@ static int squashfs_readdir(struct file *file, struct dir_context *ctx)
 		}
 	}
 
-finish:
 	kfree(dire);
+
+finish:
 	return 0;
 
 failed_read:
-	ERROR("Unable to read directory block [%llx:%x]\n", block, offset);
+	ERROR("Unable to read directory [%llx:%x]\n", squashfs_i(inode)->start,
+			squashfs_i(inode)->offset);
 	kfree(dire);
 	return 0;
 }
diff --git a/fs/squashfs/inode.c b/fs/squashfs/inode.c
index 66858fabed1a..96b5b9c336dd 100644
--- a/fs/squashfs/inode.c
+++ b/fs/squashfs/inode.c
@@ -257,8 +257,14 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 		if (err < 0)
 			goto failed_read;
 
-		set_nlink(inode, le32_to_cpu(sqsh_ino->nlink));
+		/* The directory size must be 3 or larger, as it includes "." and ".." entries */
 		inode->i_size = le16_to_cpu(sqsh_ino->file_size);
+		if (inode->i_size < 3) {
+			err = -EINVAL;
+			goto failed_read;
+		}
+
+		set_nlink(inode, le32_to_cpu(sqsh_ino->nlink));
 		inode->i_op = &squashfs_dir_inode_ops;
 		inode->i_fop = &squashfs_dir_ops;
 		inode->i_mode |= S_IFDIR;
@@ -282,9 +288,15 @@ int squashfs_read_inode(struct inode *inode, long long ino)
 		if (err < 0)
 			goto failed_read;
 
+		/* The directory size must be 3 or larger, as it includes "." and ".." entries */
+		inode->i_size = le32_to_cpu(sqsh_ino->file_size);
+		if (inode->i_size < 3) {
+			err = -EINVAL;
+			goto failed_read;
+		}
+
 		xattr_id = le32_to_cpu(sqsh_ino->xattr);
 		set_nlink(inode, le32_to_cpu(sqsh_ino->nlink));
-		inode->i_size = le32_to_cpu(sqsh_ino->file_size);
 		inode->i_op = &squashfs_dir_inode_ops;
 		inode->i_fop = &squashfs_dir_ops;
 		inode->i_mode |= S_IFDIR;
diff --git a/fs/squashfs/namei.c b/fs/squashfs/namei.c
index 2260a3f05fde..c8009e0b2edd 100644
--- a/fs/squashfs/namei.c
+++ b/fs/squashfs/namei.c
@@ -72,6 +72,9 @@ static int get_dir_index_using_name(struct super_block *sb,
 
 	TRACE("Entered get_dir_index_using_name, i_count %d\n", i_count);
 
+	if (i_count == 0)
+		goto out;
+
 	index = kmalloc(sizeof(*index) + SQUASHFS_NAME_LEN + 1, GFP_KERNEL);
 	if (index == NULL) {
 		ERROR("Failed to allocate squashfs_dir_index\n");
@@ -126,13 +129,20 @@ static struct dentry *squashfs_lookup(struct inode *dir, struct dentry *dentry,
 	struct inode *inode = NULL;
 	struct squashfs_sb_info *msblk = dir->i_sb->s_fs_info;
 	struct squashfs_dir_header dirh;
-	struct squashfs_dir_entry *dire;
-	u64 block = squashfs_i(dir)->start + msblk->directory_table;
-	int offset = squashfs_i(dir)->offset;
-	int err, length;
+	struct squashfs_dir_entry *dire = NULL;
+	u64 block;
+	int offset, err, length;
 	unsigned int dir_count, size;
 
-	TRACE("Entered squashfs_lookup [%llx:%x]\n", block, offset);
+	TRACE("Entered squashfs_lookup [%llx:%x]\n", squashfs_i(inode)->start,
+			squashfs_i(inode)->offset);
+
+	if (len > SQUASHFS_NAME_LEN)
+		return ERR_PTR(-ENAMETOOLONG);
+
+	if (i_size_read(dir) == 3)
+		/* The directory is empty, and so there's nothing to do */
+		goto exit_lookup;
 
 	dire = kmalloc(sizeof(*dire) + SQUASHFS_NAME_LEN + 1, GFP_KERNEL);
 	if (dire == NULL) {
@@ -140,10 +150,8 @@ static struct dentry *squashfs_lookup(struct inode *dir, struct dentry *dentry,
 		return ERR_PTR(-ENOMEM);
 	}
 
-	if (len > SQUASHFS_NAME_LEN) {
-		err = -ENAMETOOLONG;
-		goto failed;
-	}
+	block = squashfs_i(dir)->start + msblk->directory_table;
+	offset = squashfs_i(dir)->offset;
 
 	length = get_dir_index_using_name(dir->i_sb, &block, &offset,
 				squashfs_i(dir)->dir_idx_start,
@@ -218,10 +226,8 @@ static struct dentry *squashfs_lookup(struct inode *dir, struct dentry *dentry,
 	err = -EIO;
 
 read_failure:
-	ERROR("Unable to read directory block [%llx:%x]\n",
-		squashfs_i(dir)->start + msblk->directory_table,
-		squashfs_i(dir)->offset);
-failed:
+	ERROR("Unable to read directory [%llx:%x]\n", squashfs_i(dir)->start,
+			squashfs_i(dir)->offset);
 	kfree(dire);
 	return ERR_PTR(err);
 }
-- 
2.47.3

