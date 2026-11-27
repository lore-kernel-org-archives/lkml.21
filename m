Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795750407;
	b=OvwshGlPJzBy1ub5yAt6Hl/5SGMGcsWVNDcS7CbHPND1sxkA/CyZ6r9+vSa76zMzFO/2
	 RhR9nfndxJDTZfNllGytSTxbpSxiZjmr53lOCSIAAyjKByFJOPw07Cdi8xaHuqCsdKK/L
	 Mp4sbeHQkl4dWpkrbXebC5JZuB4D1Z1O5sagMajf1mPyzla2aVGi671O5hzF0znS0azW7
	 JiEvuV5xr71QiNFvSJc9FaAo39lQ29Ny53crtxc5/p1ekUrI8Rvo6Is3lRbUXLA2nleKp
	 JvSh7CeIV4LKAoYEcFXXWvYWy1KEgKaywifvW7nbZ3kE1HFa3ModXvu3DmiKyH+09bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795750407;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lE2jr+C/a0Ay10r/FZq0822Qad9kjX+tBe/cryvO/EI=;
	b=JhZRZf05uydpDxv0KysLOAv2FHtVPsmN2ugIC+RTCyTOb3cXPDQu6qRniwo02axgo0c/
	 q5KZnLW8U3zaCg/Txc1VaMpSfAtMt4pLHcbUzl2BTV8OOPkUNO+v4irq6dSza95Y5hz9u
	 x7PucWKIJpxDbJ/W6U8rYqw5z4s3OShqg1mL5yJLMcT1GXO5usK9VAXn2SvC26qQdeKUA
	 SfPRVRLFbRBIhTDl4/18RQfc/JavDhYT7rfUj4mcgQ1QIUUxxe84yJJx9JW2A+XolRS4Z
	 ke0xlYTlFIWU+C4hbaq7krYDCCLd7WZ7a1AyQVSjaMn0Jams8XCCQnrlR8kH1thz3mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=AkGweZe6;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44ADE606A68B
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:33:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44ADE606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=AkGweZe6
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c506187deb9so125844266b.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795750406; x=1796355206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lE2jr+C/a0Ay10r/FZq0822Qad9kjX+tBe/cryvO/EI=;
        b=AkGweZe6m3KvFRWeF54kYwrWEDxdu7817SCAYmDNSYKuVlnvxJrQDsg8KQ0X0KskE7
         nXskJ3GTAnqjrg29hsJAD8c6IymLag5gX3rqJ+SFDTTUhIwEJJI0mn9zDH2I7U+0KhPn
         S40/WsI1kq+ucVbqcCjVcbpdk3DWn58AP/5hPoMJ9CORvP6W6xpONf4/b+JLTCAsLOPr
         rptV8wBpjjEjqF75cZFfQtpfNwJSz7yDS6U0kz8UE+6AV8x0T7Hw6cysgUlZArPSOfXD
         G7CnyUs2ac6HvzHQffY732xMsfbuAYGSvWa7btxx71bTIrDItUKmtqTEm8ZGPjQkn9Ef
         qH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795750406; x=1796355206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lE2jr+C/a0Ay10r/FZq0822Qad9kjX+tBe/cryvO/EI=;
        b=tqczUj51pgmOpQDYtXIk4m2CW9Sk4cms4BMzLWgzzHzDsVScqznm0oCcPZRa97C450
         s4b/evVjGhKBECsawNuBGtmrAyou6uWfUkL5W5jw9MsZILP31ysxdZ/FQ/A0kwMDCbs2
         xCje31zaN0kRhBxawpEsu1iWllqix//p0qsJdbbWihaM9KsBkUTw50edaAHr4ThVE0sT
         DHMoZj7FR3ISUbkndMxQk2WrcKd8OrDltfFhEeW2soIb4qTZj4oVAxEA6B+Lk1JYNSb3
         VeZ6yfhBCHC3DMB2OcKV+Tf4w8BAJxBRH9tc78DRbDubROyNPDwE4ZnefY0is8M10NHp
         ND1Q==
X-Forwarded-Encrypted: i=1; AL+hErHD2MJUcD+RevzSyhqaIdthrWN4SlhPA4kfqao7lIPXZobHn0X7aedS9pkKSangzScpY/jOKT7oMoLgkeI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3Cz+ohv+mTZXAonBvARgkhCAT3uu12tRVnfh0JGI4Kn8A+POz
	QZqmFxWxe7z4GYZQgTZWBc8agtvG8bGvdbLOfRmQAfJT+B3d3jAIcYNtFsILdakD3/k=
X-Gm-Gg: AZFdTZcvlTeo9AEKxDp5gza+P5iadnVfhl2vNuMudOYB2d7N3mlNWJ8dAPEvjYG3Ouo
	NAZyURqVviw7B9addBIRu1KVnQb2eKJkWD5Q8gCAVIkqDwDI33fPyJI/loCgN9y+iJaHNkscNZ1
	bUrCJrf45suutGmJKWKN/q6o1yJruEoLCo0pFXS+5det0wD06i+wW+g10Hq6h0VT5pln3ZYCbbH
	GEv3/Kd50Qp0bLXEttIL7qiPutjfUf8qWZf3DOhOCdIBZNMiMGr9FBNzmhGo3blDK7pPzKn/Ra1
	uv3XphjRoTEESOGbwPQlA1CdQk7RgoKKhyYbHbEMmqdSKHAegrMVYzIpQ4L/S63n36wof1o4dLx
	I0zFI2DPN82cKz1c/a32psWfi7Jf5/2LSXGka8shuzV/XldtdjywELLof7LlEeVD2Yqqg3TY3Jm
	M/WvcBlc0BEwAJDDSPulDdYix/9OzI3AaCWxtSxHqcM2HF5i8H9pBIaJ7kSQZFATTgvla8hzgaZ
	xoalwS07+CbDJZvgxkGHIMqrnWhNR86FMeq5GCIQ44AdxPWEs20+j4Ymsiw6JbbmQZWm+oAnbhc
	OhYkF8F5fkzCH3nlXD2EgDa5PQqoEwSoskOQtT+4gGY=
X-Received: by 2002:a17:906:26c5:b0:c51:3b84:6fb8 with SMTP id a640c23a62f3a-c513b84886cmr1663789566b.4.1795750405710;
        Thu, 26 Nov 2026 19:33:25 -0800 (PST)
Received: from localhost.localdomain ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d135e9sm38375797a91.4.2026.11.26.19.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 19:33:24 -0800 (PST)
From: Heming Zhao <heming.zhao@suse.com>
To: joseph.qi@linux.alibaba.com,
	mark@fasheh.com,
	jlbec@evilplan.org,
	hch@lst.de
Cc: Heming Zhao <heming.zhao@suse.com>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v12.1 1/3] ocfs2: Add new ocfs2_map_blocks() to introduce iomap feature
Date: Fri, 27 Nov 2026 11:33:10 +0800
Message-ID: <20261127033313.9169-2-heming.zhao@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261127033313.9169-1-heming.zhao@suse.com>
References: <20261127033313.9169-1-heming.zhao@suse.com>
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

