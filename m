Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795533998;
	b=QTTX5zpbSjuhNMGC0RZZKUCEWEqnJR5xsLl8RstnuUSvPzR+oWehPBtUtoCOqRMxzl7k
	 fp1yJeWi04rI3ZBCB2YgQX+0U78Be8zLJZFSM+9jS9WaLSPckX4TnzhOD2V1HouxHeTXI
	 tYCOMQYvPboIH8DhxFgSEVVbS50irCYsJ0CsrnZkwjRPkHGApPOpqwU5DPEDZ4zhKVkKF
	 AKVi1krhP3y0YM2JujgZhYBT0MOeQaxShotIs077Zr/tqWZuTuzy+rdgoPW1uWHTEHZMK
	 Ku+AWFuFe/ea27LQCJTPozXF9tBa71J0U6Nj3AToxBdmNKGfpQpXcyjE8TUxCtIDN1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795533998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lE2jr+C/a0Ay10r/FZq0822Qad9kjX+tBe/cryvO/EI=;
	b=xN4v80b8+KoT7b/0LIgGSBUlbb+LT9Q10P49zVoyhDsz4jyaXvP6MkMna+kAooR8ql6z
	 jjMDH0hyWPtUzWiUDM+9G2eSmzoX5ODR/WwNjlF+jsrTfHPX2nZUNTlWEHy000qFfoSB3
	 SMpf7s2ZGjaFtfsqov7DkGd36Nc73SQ8ob4nlU3pBkmJP+KnYwxC+BIhwNdvM9NfiL9W3
	 9+M/ItK8sohx8sMAMKmYwAiDuJTWWf5HJFUuKAwK+kSXsqjVCBcHmAHiXSBdXcKsErxhv
	 MsALOP66Ucitzse0/P+oLTssXgaL2C+aF6vLF/App/lG1zHz7DJuI5htQlQtSgkf6Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HZW4pM3x;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE81606A331
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:26:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FE81606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HZW4pM3x
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b88aab58fdso455593a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795533996; x=1796138796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lE2jr+C/a0Ay10r/FZq0822Qad9kjX+tBe/cryvO/EI=;
        b=HZW4pM3xMPMWzEOTbg35V1VDPAEVBHpCkLFN0x8+tlu6j9EkqObjwYetarT8k1niv4
         mFOKd0WciM9WQT2H2b2Pr6gmaH+KZZoPAdAxfghoOofdisdv4XMIlcjL56QG/FbiVcEU
         2pYqziZCBiJwM3vsHXUttKE3n8D2iup0tOwMHpMDVyel8jaTGRBrk9zby4cvaABQmZc5
         WMnUBp6PnwihgVGoHjBMyAZbcB0MlGO9KZqDvG012ZDUAm1aJOnkVRnotYANaUYjpMV2
         ZkZnd4+N6ctmraOq/LkY7wynI6VxkH2gLtFohxVaGc/1Uj2E0gqwvY2uwai02cNWWtQe
         HASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795533996; x=1796138796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lE2jr+C/a0Ay10r/FZq0822Qad9kjX+tBe/cryvO/EI=;
        b=cw4IG220qXX6mGbAPiq1Zn0W7LSJC+Zpb+qClupaBS6Yjt0vCNXeztP6TIUlGb2Rfs
         FFNn1ctG/PpuL0vYChniI1P2t2Ft5mmnokP1oPMz8b2cmzSDiwwBXtgcP2i6ZNbwkdgN
         /l/AVhjCqCRXAlFhLhUr3ZOawGPd6DAV9g0TLilZmjNb9AC5sc7fFaV6xM4UGtP1jb//
         /IQ0nFuahYQbLOddmwQLILhSzh2Ayk3q8c3GjznmkGFJtAjZc4X1Ugc1uHuwhKqYeDAn
         6OBj4UNqQlNdhSSKenwO6IqnEylWVo0vpgQ8oa9M7P6PS6HSrp4AVzDcuH5GgyZ8Il0n
         zsJw==
X-Forwarded-Encrypted: i=1; AL+hErGGaOJnZC0MbHo30t28UdLrSO8ORBZNxhjhfqcG+ZtHVQqEWeEeXQI0mCjn4GBZe06WkcnnVG/A7SuDeUE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ivNGYql3l30MQ8ZRTGptSngfzAk/Qgto/zkdaPlmTyS4GSggG
	AD2ExFUc9ZA6vYdY86FF6VFCVGbwJA+SkA+H7NxJwUgrXPz6p8S74oyBKxbb0+0lg0E=
X-Gm-Gg: AZFdTZfSXk/m19Ci9XowlB4aC3wIR+MAFLDKjgtulEhoe6xACivfCUag1My2SBm+6Mb
	QLY6x/nJXpkZqnczfW26pouLw8Y1/CZL7YJyZwfc/VVuZ1irhoxSTs0hUnsyVSVtPJxdrZcQrl2
	iPBnYSFxdD+ghDRAgvPNA9dFPoCdJeHTknStNew3usxTkFDYOO7k452xQqfn5gHfUlw74+VAoB4
	mvH7D1mndDU8E/71t6PmIrjg5g2j/ihubLlVMUr6kEkzrEoba40DbfCG18xihtse/PsmJ5MpRHK
	kbMYAJjmBSt08jcb6Svk2RVwcIbEybWKnaaE92AyABqy88sOWxSzmWgeZQI015yMAeWmnDohaI4
	ZWzb7s66SIA0t+zGYA/pGKvCzDVzpuAFGCg3IMhjkicIQEOtwUIywTAaxWFmwygx4DoPKoxZqTc
	QkfU3JImlyt1Cn5wUVRMcDu/nRcuBwnP0QTEZTri0EG6hXvx8qfdNJXDO6jEJFwLmTBlg3ztCtG
	qztWNEwuU5PORCjrmNTR8mUNDaCQCDOk4eyp7BBy8UA3HX90P9fOnltA9LNHwiJYfVL3A9HVZ2h
	Kqa1R5s8u+NS/eY+P9cYBSXZED5tXEcCwOPB9FizRV6sIy3itw8bwdm63kPIPVAj
X-Received: by 2002:a05:6402:a545:10b0:6b4:2960:d381 with SMTP id 4fb4d7f45d1cf-6ba37c76e50mr9724605a12.1.1795533996409;
        Tue, 24 Nov 2026 07:26:36 -0800 (PST)
Received: from localhost.localdomain ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d0575d9sm7182425a12.25.2026.11.24.07.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:26:35 -0800 (PST)
From: Heming Zhao <heming.zhao@suse.com>
To: joseph.qi@linux.alibaba.com,
	mark@fasheh.com,
	jlbec@evilplan.org,
	hch@lst.de
Cc: Heming Zhao <heming.zhao@suse.com>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v11 1/3] ocfs2: Add new ocfs2_map_blocks() to introduce iomap feature
Date: Tue, 24 Nov 2026 23:26:19 +0800
Message-ID: <20261124152623.7838-2-heming.zhao@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261124152623.7838-1-heming.zhao@suse.com>
References: <20261124152623.7838-1-heming.zhao@suse.com>
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

As part of migrating OCFS2 DIO read/write code paths towards the modern
and performant iomap framework, here introduces ocfs2_map_blocks() to
replace the legacy, high-overhead buffer_head based block mapping
routines.

In addition, OCFS2_MAP_* flags are defined to bridge OCFS2 internal block
mapping flags with the iomap API requirements.

Subsequent iomap integration patches will build on this core block mapping
routine. The implementation draws inspiration from ext4_map_blocks().

Signed-off-by: Heming Zhao <heming.zhao@suse.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 fs/ocfs2/aops.c  | 70 ++++++++++++++++++++++++++++++++++++++++++++++++
 fs/ocfs2/aops.h  |  2 ++
 fs/ocfs2/ocfs2.h | 25 ++++++++++++++++-
 3 files changed, 96 insertions(+), 1 deletion(-)

diff --git a/fs/ocfs2/aops.c b/fs/ocfs2/aops.c
index 4acdbb70882c..64fcf6eb3d89 100644
--- a/fs/ocfs2/aops.c
+++ b/fs/ocfs2/aops.c
@@ -126,6 +126,76 @@ static int ocfs2_lock_get_block(struct inode *inode, sector_t iblock,
 	return ret;
 }
 
+/* ocfs2 never allocates in this function */
+int ocfs2_map_blocks(struct inode *inode, struct ocfs2_map_block *map,
+		    int flags)
+{
+	int err = 0;
+	unsigned int ext_flags;
+	u64 max_blocks = map->len;
+	u64 p_blkno, count, past_eof;
+	struct ocfs2_super *osb = OCFS2_SB(inode->i_sb);
+	int create = flags & OCFS2_GET_BLOCKS_CREATE;
+
+	if (OCFS2_I(inode)->ip_flags & OCFS2_INODE_SYSTEM_FILE)
+		mlog(ML_NOTICE, "map_block on system inode 0x%p (%llu)\n",
+		     inode, inode->i_ino);
+
+	err = ocfs2_extent_map_get_blocks(inode, map->lblk, &p_blkno, &count,
+					  &ext_flags);
+	if (err) {
+		mlog(ML_ERROR, "get_blocks() failed, inode: 0x%p, "
+		     "block: %llu\n", inode, map->lblk);
+		goto bail;
+	}
+
+	if (max_blocks < count)
+		count = max_blocks;
+
+	map->pblk = p_blkno;
+	map->len = count;
+
+	/*
+	 * If we see this on a sparse file system, then a truncate has
+	 * raced us and removed the cluster. We treat this as a hole
+	 * and skip setting the iomap flags. The caller will set
+	 * iomap->type to IOMAP_HOLE.
+	 */
+	if (create && map->pblk == 0 && ocfs2_sparse_alloc(osb))
+		goto bail;
+
+	if (p_blkno) {
+		if (ext_flags & OCFS2_EXT_UNWRITTEN)
+			map->flags |= OCFS2_MAP_UNWRITTEN;
+		else
+			map->flags |= OCFS2_MAP_MAPPED;
+	}
+
+	if (!ocfs2_sparse_alloc(osb)) {
+		if (map->pblk == 0) {
+			err = -EIO;
+			mlog(ML_ERROR,
+			     "iblock = %llu p_blkno = %llu blkno=(%llu)\n",
+			     (unsigned long long)map->lblk,
+			     (unsigned long long)map->pblk,
+			     (unsigned long long)OCFS2_I(inode)->ip_blkno);
+			mlog(ML_ERROR, "Size %llu, clusters %u\n",
+			     (unsigned long long)i_size_read(inode),
+			     OCFS2_I(inode)->ip_clusters);
+			dump_stack();
+			goto bail;
+		}
+	}
+
+	past_eof = ocfs2_blocks_for_bytes(inode->i_sb, i_size_read(inode));
+
+	if (create && (map->lblk >= past_eof))
+		map->flags |= OCFS2_MAP_NEW;
+
+bail:
+	return err;
+}
+
 int ocfs2_get_block(struct inode *inode, sector_t iblock,
 		    struct buffer_head *bh_result, int create)
 {
diff --git a/fs/ocfs2/aops.h b/fs/ocfs2/aops.h
index 114efc9111e4..8dd6edd7c1a1 100644
--- a/fs/ocfs2/aops.h
+++ b/fs/ocfs2/aops.h
@@ -42,6 +42,8 @@ int ocfs2_size_fits_inline_data(struct buffer_head *di_bh, u64 new_size);
 
 int ocfs2_get_block(struct inode *inode, sector_t iblock,
 		    struct buffer_head *bh_result, int create);
+int ocfs2_map_blocks(struct inode *inode, struct ocfs2_map_block *map,
+		    int flags);
 /* all ocfs2_dio_end_io()'s fault */
 #define ocfs2_iocb_is_rw_locked(iocb) \
 	test_bit(0, (unsigned long *)&iocb->private)
diff --git a/fs/ocfs2/ocfs2.h b/fs/ocfs2/ocfs2.h
index e3bb3cc0b25a..b4583b3170e2 100644
--- a/fs/ocfs2/ocfs2.h
+++ b/fs/ocfs2/ocfs2.h
@@ -514,7 +514,30 @@ struct ocfs2_super
 	struct ocfs2_filecheck_sysfs_entry osb_fc_ent;
 };
 
-#define OCFS2_SB(sb)	    ((struct ocfs2_super *)(sb)->s_fs_info)
+/*
+ * Logical to physical block mapping, used by ocfs2_map_blocks()
+ *
+ * This structure is used to pass requests into ocfs2_map_blocks()
+ * as well as to store the information returned by ocfs2_map_blocks().
+ * It takes less room on the stack than a struct buffer_head.
+ */
+#define OCFS2_MAP_NEW			BIT(BH_New)
+#define OCFS2_MAP_MAPPED		BIT(BH_Mapped)
+#define OCFS2_MAP_UNWRITTEN		BIT(BH_Unwritten)
+#define OCFS2_MAP_FLAGS		(OCFS2_MAP_NEW | OCFS2_MAP_MAPPED |\
+				 OCFS2_MAP_UNWRITTEN)
+
+struct ocfs2_map_block {
+	u64 pblk; /* physical block# */
+	u64 lblk; /* logical block# */
+	u64 len;  /* number of block */
+	unsigned int flags;
+};
+
+/* Flags used by ocfs2_map_blocks() */
+#define OCFS2_GET_BLOCKS_CREATE	(0x0001)
+
+#define OCFS2_SB(sb)	((struct ocfs2_super *)(sb)->s_fs_info)
 
 /* Useful typedef for passing around journal access functions */
 typedef int (*ocfs2_journal_access_func)(handle_t *handle,
-- 
2.55.0

