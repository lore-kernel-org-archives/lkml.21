Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795070446;
	b=sP864C8bpogBUvlPVPAH4jwedj71dJLxGnAH5IrjeGXLaRX4lP56a4Z91Qo3l8eGPAxT
	 6fvZtfRizzBp1q75w48vHHgVn4h2X66K/XjxyFgAeKquZJ4rfBAccF+aQJ9y0AeaqfyIf
	 C4sH3NUW1ODvheDMornNaE27B1Iqdmur6BZIO+wb2RooK/wEeYODHolVREIuYQtjzMQas
	 8CWQjb151phukEI26xyiH1qJzqpF8tLGga6kUGFKl0qkslmcptYobF/bxowFbbEl+oaUM
	 6/1EQq+vYTV6nOjSQDs2P2AX2e5lZsK8imhnv84nD3EZ+4lXk9lwD6lUuZSFHlGj02g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795070446;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HslZ026Sqb2wA5Yz5eYmxBepFwcsw9Bo6wmDwgf0aso=;
	b=CThfMQCbmKZ7ETWz2A0AXLZFbfHunvEjNSWejSqJItSYxykEhygUzGYq1txUGA3kifHa
	 vfDAo5AJ5QIrMpYbcEd5vofUTAfBw9o96K8o5F+1N+h7Gtwr6Jl40t56O1eWDV2rLx1q4
	 EoXR9MhPV1+gd0ZZuG5SIcUgG3Zw4DOsBekNdcXZRgsZziqVmBOMiIUbpFnzQlcyFtIVu
	 wUOAhJpkToJTeXOk1bu3kI+sC7H/ZA7/6sXRjCS2A0Jny32prnrtBt9CI36s8fYw544Id
	 bxJy2bO5y9zRpEt+zsyksrYKywSCvBQ1I0m1B+lIR/53/neT2X/ORtFBfd3dScfJymg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=avUhUMnd;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E617A606A335
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:40:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E617A606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=avUhUMnd
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a7a3b29c11so1331765e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 22:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795070444; x=1795675244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HslZ026Sqb2wA5Yz5eYmxBepFwcsw9Bo6wmDwgf0aso=;
        b=avUhUMnd2Q3LrC3lC2qrBD4iT7sTUUAhtv6SWMB0N9GDNYYeZWi4XCAZAp4nQkZltD
         gHQ4t/SkJFKCOe+QhWkmToxdYNRDLhSLFfFhhye9EjOKiZn1/LNaM1nAfwt7hIkYsLdl
         xZLhoWR9dzgHnuT7RoiiCKwcUT16RKs4G7WTPrhvp7dfkT682CWSPnw2ZYYZbgVJzJ57
         NAjhekfl/ipm27C3XfeZSJbW4gheZtdH+Eomvq+PVJZKD6jPWDz3mlHOIPe2McK6vOl3
         vgPyd3PSwoihtTa2HVKbw6Y6ZdGkhSvnRwP3tV5ib7bAqDjvHfGX91qjTtT2WhMrAZXh
         N4jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795070444; x=1795675244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HslZ026Sqb2wA5Yz5eYmxBepFwcsw9Bo6wmDwgf0aso=;
        b=LHt4oAu+8IxEfoTSLhK2cz55Mf5fG32i+TFOCp+PSqRAvM2zICpY1Cf2+GOtVSLGta
         5rF5QwHDZnNO2//WkI7oLRUQoQa9fJFxMI+StZCbnb5CNWDJ8Ymm/WbQnU1G3r9LlEq/
         ydwUjvC1fB/eID461jARPKbz4OhRMUOzrrJrexWV5Xzrjjb5D+bezjkbNBM20xXlGHOd
         2HrnX6xW+KA2XNmcalZSgQXgEBi6+Q8/Rv8S8qH/UAFKmTDqTxjCbCETKLy012jqv+WF
         WWNvRLnOyVo9CJIzwGPumQGWT13MxzWeNRY2nULG+klob+/mLfkBybPWrm2HF78sOITx
         qjCw==
X-Forwarded-Encrypted: i=1; AL+hErFQq5Iy+K0JEQZTRdPvj7LMxfNoV3R0ynGu2LGkcs9DYyWrMstDVTG0DDIfY2Hyx6mNTzmaMqATPlvEmXU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oR0mBJaMbrr2S4q/m/teq6YwC7wQULAfBeKPGOXdWtgVtB5+h
	yPT5pCH9NQnBE/THcQLunGQAwLv9dt7LNo+lvrXqdQSt3ONqdxrA4JFYpO4AVU/a0fI=
X-Gm-Gg: AYBFou08AVh3QB1ER+pFAr5N3oVSOjONRp/43nHeTN1C5P1jNTJXIBpC4MSYbUl98QA
	/IV/tLRP6luYZV4Ell2RTEkdNVNJJgUwD1BSl+oBgUvS5UvdsdGpnOQogWpCuutu4Cm0WgV2x42
	mOVbomvyD7hJSuyq9z5qN2nkkfqxr2CxyoqROQjuPmSRgl+Y6Eum0aW7r7FELstH+iTYRV8n7WM
	iapI7flByAB+llaZKrjD1htAieMVDBVnkX6m26T2XcK9DiJzGp83tIhVvpXVdzl67kNwYG9qfy9
	oLalHmI5XJ9lpAL3JCVJCJPChqfsDaqKt1pJVqF2Z/ymNjBZtwnU6Z600pZwHvANIGAWrmQoImg
	TGQDYL8B88Fioe4FQcFHRWTMbJir38Qmz7uGHNek7yrw+SWUPoKiqbdL5OBlLWZQIm2TXoOdaF9
	pJ1S6+c5OYEjzXD+7EO9JRfBsyaiSBrGKE0gsL3Om/KmERZ93ZtUOdYxsWLl3UTw7nHaXh3t3VA
	GSufbPxV5QfnMU1IRUqhj/T9tIDxbogcuO4Cm/ezcZd3xo/6evdvYJvb3s1NI8VOdwN3OZsr3tH
	eXKCLIn6D7QQivA+NRVSSoqc6WPm+IMSLmq0V6ckhtUQL0dX1mKldtxcNoE8N6b/
X-Received: by 2002:a05:600c:8012:b0:4ad:5ec2:d3b3 with SMTP id 5b1f17b1804b1-4bb7d7167d1mr84936215e9.1.1795070444271;
        Wed, 18 Nov 2026 22:40:44 -0800 (PST)
Received: from localhost.localdomain ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca7aa769sm2286469b3a.18.2026.11.18.22.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 22:40:43 -0800 (PST)
From: Heming Zhao <heming.zhao@suse.com>
To: joseph.qi@linux.alibaba.com,
	mark@fasheh.com,
	jlbec@evilplan.org,
	hch@lst.de
Cc: Heming Zhao <heming.zhao@suse.com>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v8 1/3] ocfs2: Add new ocfs2_map_blocks() to introduce iomap feature
Date: Thu, 19 Nov 2026 14:40:25 +0800
Message-ID: <20261119064029.11910-2-heming.zhao@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261119064029.11910-1-heming.zhao@suse.com>
References: <20261119064029.11910-1-heming.zhao@suse.com>
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

In addition, OCFS2_MAP_* flags are defined to gridge OCFS2 internal block
mapping flags with the iomap API requirements.

Subsequent iomap integration patches will build on this core block mapping
routine. The implementation draws inspiration from ext4_map_blocks().

Signed-off-by: Heming Zhao <heming.zhao@suse.com>
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

