Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794962942;
	b=lLh8fsiLn/AIaYb9HZGMjFa0eXUqBIBqg7K53F1qjDPFdfvB1L/4buy3/Xr96RqN0vMJ
	 vOX8QBKy6JWHQmPCqUu+myp6kaXZEN5hk6Ce1XN6OfIdopzGJqktbQ+czt81F+wkRTUjv
	 ouxGF6BT/7g4BVjfgiJXmKb9Cgrb8EqkxImKpaxj6qQ2bF6zzJ84U/e8tewl/KVqlibTE
	 Zbjfe3uA/qUUEMyTdP+VOOlTeJRzDLFCl5CXbBta7HE+grD6CEHyfxD13RyeJmUdpDr0a
	 Stm7Izal4yvvMeB1Dr7aM2CtCewytF/O+20IyWN4Vxvvu8jGhy41Yg5L+CSMiBxkiNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794962942;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=treAuPWg+nKRf97mTBv/ahVAZRlgUNZED9ulS1pYeAk=;
	b=ZrWCOe7vXROYpR4Ydr6VTUZG6P2PFfRfhtwjefgaE+H4F7SiPYen57ypPVKQcVMxSLp5
	 BubOMNHDA7iPkIVWb0ffP2XPIypybCnoyqLhnEU5b6cLb4DJDzjgxzaU01KcKliZ9XJKP
	 dFQtd3Asjud/xhDtW0Qljo9VIykMkjjZZX0ATbJ1pccxlJIa4pXiYYVJsHbdQvS2L8HhK
	 WG+6CRwea3kkQOKoAcflsfXY9hbngGHP7BeTvqnJtb1ULlyg1m0H+VrApWKd7vJoTqwCl
	 FYSPaRGb+uj3INxuegwgkjJZl+N2pPv4kj1G7clDMyANxzxLYwt5JYUc9EmzRlb6Kpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dubeyko.com;
	spf=pass smtp.mailfrom=dubeyko.com;
	dkim=pass header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="dV/D+1lA";
	arc=none smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA386606A89F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:49:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA386606A89F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=dV/D+1lA
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-67c0bd676eeso252217d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20260707.gappssmtp.com; s=20260707; t=1794962941; x=1795567741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=treAuPWg+nKRf97mTBv/ahVAZRlgUNZED9ulS1pYeAk=;
        b=dV/D+1lAEUxsNm/7Hy+JJ7VRKVMTS9E5RhXEsZjMyjom58OBUctpJbmNZeCNwbaLRo
         g0ellPOR5L18dXUyzydNNly63wJtRHp8W+aiUQi1awyIWZS9i4kal8juKRlQJQtBi26W
         odzI5h+Ium1feLGkUR/21+WitQtUDqGJsBz5NHPepleXKaKhHbymsoy817nAOtGvcuN1
         st/o3Z+70oW/eaZI2M1PJpnz+o7gfmbQL1JYn9qmUGY/fxzlkkQrsG5wQauu3NqTNKov
         SaTs856jddoIVZXrUwSmbQG0ivjbrrwsC+c0H7BUywJD+sPPF0o9+sLUtMGoSwZ2ZYH6
         1Rnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794962941; x=1795567741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=treAuPWg+nKRf97mTBv/ahVAZRlgUNZED9ulS1pYeAk=;
        b=MvUD+oq33KSXIVHIhb1mROtz6i09AiwZI0ZazIE/WWAhvusyFIfWSV6XAjjzRoks/a
         rhfWzLtH6cXRxTal4RWrYDn6N9iiAG9uepqdBB68DI111crl3r+Wr4T3BukxFPB4+MM1
         4e+JrZnKTv8RLTMtbaBVQPGMVr4gvhWfjm2k+/5GMBQShpysO7AgYirHBriauOKEG3Fh
         IV2NFg693GvTInohYfDcYH09Hkqj5cnJ72tUaz6eKRtHWfGMyO5TK0gyxLDOLK+7w0el
         xTOWAhQuAgzkuTKdhhWW0AYxJ9iwqqvaJ3JqzTbremKA7s5cDfdE+hVIVJTqPNRJw2PI
         D2Mg==
X-Forwarded-Encrypted: i=1; AL+hErH263gL0CEDBpPGtOQW5Rcygs4YpRQO4o14x3BQAaKnQPNfATTQhMaOFwp3apv4N4ciUq/c5+QdMnp8T3E=@vger.kernel.org
X-Gm-Message-State: APuU4Z94W8SEA5CIDl8yfNT9/xfZbOFUUs+TYTk6Tv+SKalRBDvbEKOC
	6lzUvq/5mnusDOR1cICH+40Gyc86So+1LB2f+RgkEGcyaZbj0i7ur5bsgVKo5Ijjxic=
X-Gm-Gg: AZFdTZeZhlkJXQ5qzp0RBI7m7Z0pzSlcCL3sJR1hNZ8N5iDhtd0zbA7bYLSQEltqtg7
	AGuOwLwdFGYFzY3AhvosHn3W9VgBkc7HU2RVIa1V4ma5OxV2IdMa2lXNQUnUlavK9M2X2EsJvJj
	CnuB49e2jis55aBLsKVqwVZijCQIJAKyoE+MSGOYWs5b9L4TLGQeFf0ArpRJjZ0f756WavLbD21
	eWb3wB55vsg8O4CApraPqd9C7LpbY6EwnWwoPqjvFqQsEOXe21zCwyJIAqNxyaiz7whRfJqIs+U
	TINe6ZUOiB2mky295Jbgi7zyN227hSS8ObvHYmE6jsRm0GLsCDnogs9avM+Jn2jEoGi1KwP+SNh
	eT8RXjPEM51kLQ3lf3MbLTyKIbd3jCMq7sxil20S1/LDxZD0uJSt8IBXT0tddvMNErPELGbzajg
	MpUITLlY5wxSQTDhSvVlrcFmg/zM1FELXyckBgaCgtYPebxf0mq2diKUPphYVVL0qPCZXvWx7iH
	Q7dnJGJzz+43p7FjelSZBKvVZnhpOdNLnHmiw9oBfZZigWaPmhqIeGqOE6l/DenHRxLNw/8zxfP
	XSoTB38uLtOyT4Vi3dB4utyAFsPmhcQPyl9c42LBuuo2N7Fqkj/TF/WHSTNBRrJNH+3c+mwNgq2
	XtM7LGtNitFn329aWTru54sFmZbenPnoRRZZNLz3yicdEJ0TzeRi0DxbCvRCKXwQlcPPadfw=
X-Received: by 2002:a05:690e:169b:b0:67d:b449:8572 with SMTP id 956f58d0204a3-67dd3cf9a91mr688414d50.13.1794962940767;
        Tue, 17 Nov 2026 16:49:00 -0800 (PST)
Received: from system76-laptop.attlocal.net ([2600:1700:6476:1430:5fae:4d02:7055:94ad])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67dd56ead87sm729575d50.1.2026.11.17.16.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:49:00 -0800 (PST)
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com,
	hch@lst.de
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vdubeyko@coreweave.com,
	brauner@kernel.org,
	linux-xfs@vger.kernel.org,
	Viacheslav Dubeyko <slava@dubeyko.com>,
	"Darrick J. Wong" <djwong@kernel.org>
Subject: [PATCH v5 3/5] hfsplus: rework hfsplus_get_block() logic
Date: Tue, 17 Nov 2026 16:48:42 -0800
Message-ID: <20261118004844.3849979-4-slava@dubeyko.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261118004844.3849979-1-slava@dubeyko.com>
References: <20261118004844.3849979-1-slava@dubeyko.com>
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

Split the extent-lookup/allocate logic out of hfsplus_get_block() into
a new hfsplus_map_extent(), which reports the mapping as
(dblock, max_blocks, balloc) instead of filling in a buffer_head.
hfsplus_get_block() becomes a thin wrapper around it for the
buffer_head-based callers (B-tree metadata, symlinks).

No functional change to the existing buffer_head path. This is
preparation for the iomap-based regular file I/O path added in a
later patch, which will call hfsplus_map_extent() directly.

cc: Christoph Hellwig <hch@lst.de>
cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Yangtao Li <frank.li@vivo.com>
cc: linux-fsdevel@vger.kernel.org
Reviewed-by: Christoph Hellwig <hch@lst.de>
Acked-by: Darrick J. Wong <djwong@kernel.org>
Signed-off-by: Viacheslav Dubeyko <slava@dubeyko.com>
---
 fs/hfsplus/extents.c    | 116 ++++++++++++++++++++++++++++------------
 fs/hfsplus/hfsplus_fs.h |   2 +
 2 files changed, 85 insertions(+), 33 deletions(-)

diff --git a/fs/hfsplus/extents.c b/fs/hfsplus/extents.c
index 924941440066..cdb337ba3924 100644
--- a/fs/hfsplus/extents.c
+++ b/fs/hfsplus/extents.c
@@ -48,18 +48,27 @@ static void hfsplus_ext_build_key(hfsplus_btree_key *key, u32 cnid,
 	key->ext.pad = 0;
 }
 
-static u32 hfsplus_ext_find_block(struct hfsplus_extent *ext, u32 off)
+/*
+ * Find the disk allocation block for 'off' within an 8-entry
+ * extent record, and the number of further allocation blocks
+ * that are contiguous with it in the same extent entry.
+ */
+static u32 hfsplus_ext_find_block(struct hfsplus_extent *ext, u32 off,
+				  u32 *dblock)
 {
 	int i;
 	u32 count;
 
-	for (i = 0; i < 8; ext++, i++) {
+	for (i = 0; i < HFSPLUS_FORK_EXTENT_COUNT; ext++, i++) {
 		count = be32_to_cpu(ext->block_count);
-		if (off < count)
-			return be32_to_cpu(ext->start_block) + off;
+		if (off < count) {
+			*dblock = be32_to_cpu(ext->start_block) + off;
+			return count - off;
+		}
 		off -= count;
 	}
 	/* panic? */
+	*dblock = 0;
 	return 0;
 }
 
@@ -68,7 +77,7 @@ static int hfsplus_ext_block_count(struct hfsplus_extent *ext)
 	int i;
 	u32 count = 0;
 
-	for (i = 0; i < 8; ext++, i++)
+	for (i = 0; i < HFSPLUS_FORK_EXTENT_COUNT; ext++, i++)
 		count += be32_to_cpu(ext->block_count);
 	return count;
 }
@@ -225,37 +234,46 @@ static int hfsplus_ext_read_extent(struct inode *inode, u32 block)
 	return res;
 }
 
-/* Get a block at iblock for inode, possibly allocating if create */
-int hfsplus_get_block(struct inode *inode, sector_t iblock,
-		      struct buffer_head *bh_result, int create)
+/*
+ * Find or allocate a sequence of allocation blocks.
+ *
+ * Looks up the allocation block at 'ablock' for inode, extending the
+ * file (via hfsplus_file_extend(), in clump_blocks-sized chunks) when
+ * 'create' is set and 'ablock' lies beyond the current allocation.
+ *
+ * On success, *dblock is the disk allocation block backing 'ablock',
+ * and *max_blocks is the number of further allocation blocks that are
+ * contiguous with it (i.e. the remaining length of the extent entry
+ * that contains 'ablock'), which may be smaller than the whole file's
+ * remaining allocation when the fork is fragmented across several
+ * extent entries. If a new extent had to be allocated to satisfy the
+ * request, *balloc (when non-NULL) is set to true.
+ */
+int hfsplus_map_extent(struct inode *inode, u32 ablock, int create,
+			u32 *dblock, u32 *max_blocks, bool *balloc)
 {
-	struct super_block *sb = inode->i_sb;
-	struct hfsplus_sb_info *sbi = HFSPLUS_SB(sb);
 	struct hfsplus_inode_info *hip = HFSPLUS_I(inode);
-	int res = -EIO;
-	u32 ablock, dblock, mask;
-	sector_t sector;
-	int was_dirty = 0;
+	int was_dirty;
+	int res;
 
-	/* Convert inode block to disk allocation block */
-	ablock = iblock >> sbi->fs_shift;
+	if (balloc)
+		*balloc = false;
 
-	if (iblock >= hip->fs_blocks) {
+	if (ablock >= hip->alloc_blocks) {
 		if (!create)
-			return 0;
-		if (iblock > hip->fs_blocks)
 			return -EIO;
-		if (ablock >= hip->alloc_blocks) {
-			res = hfsplus_file_extend(inode, false);
-			if (res)
-				return res;
-		}
-	} else
-		create = 0;
+		res = hfsplus_file_extend(inode, false);
+		if (res)
+			return res;
+		if (balloc)
+			*balloc = true;
+	}
 
 	if (ablock < hip->first_blocks) {
-		dblock = hfsplus_ext_find_block(hip->first_extents, ablock);
-		goto done;
+		*max_blocks = hfsplus_ext_find_block(hip->first_extents,
+						     ablock,
+						     dblock);
+		return 0;
 	}
 
 	if (inode->i_ino == HFSPLUS_EXT_CNID)
@@ -274,11 +292,44 @@ int hfsplus_get_block(struct inode *inode, sector_t iblock,
 		mutex_unlock(&hip->extents_lock);
 		return -EIO;
 	}
-	dblock = hfsplus_ext_find_block(hip->cached_extents,
-					ablock - hip->cached_start);
+	*max_blocks = hfsplus_ext_find_block(hip->cached_extents,
+					     ablock - hip->cached_start,
+					     dblock);
 	mutex_unlock(&hip->extents_lock);
 
-done:
+	if (was_dirty)
+		mark_inode_dirty(inode);
+
+	return 0;
+}
+
+/* Get a block at iblock for inode, possibly allocating if create */
+int hfsplus_get_block(struct inode *inode, sector_t iblock,
+		      struct buffer_head *bh_result, int create)
+{
+	struct super_block *sb = inode->i_sb;
+	struct hfsplus_sb_info *sbi = HFSPLUS_SB(sb);
+	struct hfsplus_inode_info *hip = HFSPLUS_I(inode);
+	u32 ablock, dblock, mask, max_blocks;
+	sector_t sector;
+	int res;
+
+	/* Convert inode block to disk allocation block */
+	ablock = iblock >> sbi->fs_shift;
+
+	if (iblock >= hip->fs_blocks) {
+		if (!create)
+			return 0;
+		if (iblock > hip->fs_blocks)
+			return -EIO;
+	} else
+		create = 0;
+
+	res = hfsplus_map_extent(inode, ablock, create, &dblock, &max_blocks,
+				  NULL);
+	if (res)
+		return res;
+
 	hfs_dbg("ino %llu, iblock %llu - dblock %u\n",
 		inode->i_ino, (long long)iblock, dblock);
 
@@ -292,9 +343,8 @@ int hfsplus_get_block(struct inode *inode, sector_t iblock,
 		hip->phys_size += sb->s_blocksize;
 		hip->fs_blocks++;
 		inode_add_bytes(inode, sb->s_blocksize);
-	}
-	if (create || was_dirty)
 		mark_inode_dirty(inode);
+	}
 	return 0;
 }
 
diff --git a/fs/hfsplus/hfsplus_fs.h b/fs/hfsplus/hfsplus_fs.h
index 554733128fed..0b07259041f9 100644
--- a/fs/hfsplus/hfsplus_fs.h
+++ b/fs/hfsplus/hfsplus_fs.h
@@ -447,6 +447,8 @@ int hfsplus_ext_cmp_key(const hfsplus_btree_key *k1,
 int hfsplus_ext_write_extent(struct inode *inode);
 int hfsplus_get_block(struct inode *inode, sector_t iblock,
 		      struct buffer_head *bh_result, int create);
+int hfsplus_map_extent(struct inode *inode, u32 ablock, int create,
+			u32 *dblock, u32 *max_blocks, bool *balloc);
 int hfsplus_free_fork(struct super_block *sb, u32 cnid,
 		      struct hfsplus_fork_raw *fork, int type);
 int hfsplus_file_extend(struct inode *inode, bool zeroout);
-- 
2.53.0

