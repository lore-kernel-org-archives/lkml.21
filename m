Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795496116;
	b=0VEpgx6OVW2E7nNNujfWw+BEqYdLKVWb+p2D4IZHLDkzQEZ0npl1L/iFNV+SiFf2Vt2O
	 iswGHYZIGzStJAVULg/oDLjFuoq+yejTuYi9RrPO84X1/T186wN+5lQPFp8DEbNqrdlmD
	 yY5oGnEa0/IOAQUJRSHTZlsTDVnMonwxZT5TDu/A/PJRoatI+eM4rQdLr1M6TUXKwgi0H
	 slDLjfBt1ZUmcfIRGgC8tbLMWQ6hgGw8TIdV+Wl1tSdsiK9WUgpOfpSmWa2zpyO9CNYLl
	 KIBVAMQb95eSkrDlHdxjn6/+LQcLCO/0xUanwuAlgQxeGUMe4kiBvtBCEsLt83k6XlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795496116;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lE2jr+C/a0Ay10r/FZq0822Qad9kjX+tBe/cryvO/EI=;
	b=GNj1XUQTfL5LbytUOn+02V0omnSuQhX3IR6XSf81zWPLZosdCDnOYR75qriWNpHbAkgJ
	 REkwHGAbmiyHXIEhHmY6LlKpM9GHiphmfZbKAcb4bC8vd5sOZ+v8VURX2D+hL/sGJYX7I
	 pK2h6B0oYA41OMmaghMnXIqR/rbZYHLMSI3VJZr5eS6bEj0+pbEOC9jaJnlmfE4FUz6BR
	 XZ883mz8dGu5dD1KjncXt/1M8HDMUvn+WOay6X0NXGvMC2CeAz+AL2rZqw8a7LtKsSeNH
	 lQ3/M4mSO7i97sp6xq6//2SSbLHRky3JTSer5MZHx5MoJj/MNaAVV/E6Z+zlmwaI+pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=bJLAmgSh;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A61606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:55:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91A61606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=bJLAmgSh
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b88aab58fdso369266a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795496114; x=1796100914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lE2jr+C/a0Ay10r/FZq0822Qad9kjX+tBe/cryvO/EI=;
        b=bJLAmgShoO1mTWCQuk+Zz5LKsi6DBQaWCkwS+mjjGla3l1kFr700Bjch1JyYCbSx8J
         1g3Lt/JXeOmiSTZfA2bborQOEwvTmBGw4ei5WCmzIh/usQCk+xMiTy6yGuQNOQOXlRnU
         zmsfQ+TGRUcFwEbwcE7wbdMmE2R2nyOZZv+EZvxiMfXLD6e7bWCyn5r7x72IG+1ohwJG
         jwYawaiIpL8U/yGGAQkiblirqe9AVBJ1yy+/fOtzZVghJq3w1N68JPwEFp4VIOXKfi/Z
         KGkzGkzx0GZbHoPOObdUDfNauwSPO6zy3LFI4OnDS3857CTyTHCpnr3WZ3vVkXIQutHu
         hC8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795496114; x=1796100914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lE2jr+C/a0Ay10r/FZq0822Qad9kjX+tBe/cryvO/EI=;
        b=AX5GHDymwfZwBGXXg9PQ4cyTplq8cImnhUU/ymlQfqLO6j40J46JIGy/nf2u2veNmt
         3OUpCqrSQLZs6X657Sc7/yqHGKTOvUDJ08kXJTxS9C0akMz9atgzGG0T/Eli+AaPLoZ1
         9IvwyMEg1LB9idjw5z0yPXmSUbymEEh1ba1gDduG+eW/f6qpT6zjCb09+7f5QEKzHtSK
         hosfOgN0jnyTkE79TZZkcz6DNWitaF8FUPh//VqY1qZPNaQM6YGbOOLQtGAGvOatXBo7
         31TyESeb1+wYXt8rCWPQF/4+Wfdjwki+Ln0K1Nz1PnmlWoU769aJNB+aF2cSNFPDCGTn
         Tdfw==
X-Forwarded-Encrypted: i=1; AL+hErEZ4L0g2/LDr/vRpWzNOm5AcW4J8PKMBri4ZSvKQH2ORKHZT06gGWqlFHosqAoQw+zKvvyXEuybDZppzrY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/scTtahqBx4yrgjcFWZ72C/A8vkaRsIHyg8xEvKHDDqtj8fEZW
	u32G/q9Nz3ZYQbzrF3K+pm9jV0B0/8BMSRbcF+FQr15Su7xpquDt04YlrwoAwdAypYM=
X-Gm-Gg: AZFdTZdWhWxUcBIH6PzIFk2kXXzPrxBzTD5DULInSx90FFplKxe6a0kEKmuS5vvIyjI
	O6O52/OvUxh5mgt6sntnhqyCI2os4HliKrORWnijR955VOuTHlzYXsAHKvRxMxmFFyLzapCb9NN
	Plou/oEV/rqqjLciIsh8Z/kb3q+CmWgbYVCnbLHFYZioQYW56LwsMpZo33gIYOsWVorEevOIPRE
	+GGe0/2K1YPfix19xFhPjsNXzOhTonQ+LUO7TFRJMqw/v1i7ZipH0m5rz2mi/8T6Mgxp8nyjqik
	ou9XtF2CNc0aZi/mk9PH70DkVxac2yPiniWpECwEUl6Zm8MbUCN9Bpv473q5BSQz4fGGr+623UB
	TM6cyNrxltIPlAiy1xLx0mJfDrEz565Q4c86YbNwG/jkfaoWyutXAEbfKnMcrz82VCZS/vcHJk4
	/WDXgY7x86t7P9bJGmQ4Hf8yNfXbNR80eYxEPVHR/AM/q24bbo5iMBJJhwT3lzFfYyw5geHuOvv
	VYT8/pNbG+sz1WWR+jOJ+6OV0Sn+wPVjjIuWqqtQl127B7QLogy2q3/+3I9893yCWOWYAsS/cT3
	n4QWIj9OeC7hbRjiFmOZB2HS73e45kJLhTs6QV9v5K8=
X-Received: by 2002:a17:906:3513:b0:c51:3808:8026 with SMTP id a640c23a62f3a-c513a53d964mr993256066b.3.1795496113042;
        Mon, 23 Nov 2026 20:55:13 -0800 (PST)
Received: from localhost.localdomain ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe23sm20989085a91.15.2026.11.23.20.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 20:55:12 -0800 (PST)
From: Heming Zhao <heming.zhao@suse.com>
To: joseph.qi@linux.alibaba.com,
	mark@fasheh.com,
	jlbec@evilplan.org,
	hch@lst.de
Cc: Heming Zhao <heming.zhao@suse.com>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v10 1/3] ocfs2: Add new ocfs2_map_blocks() to introduce iomap feature
Date: Tue, 24 Nov 2026 12:54:57 +0800
Message-ID: <20261124045501.10281-2-heming.zhao@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261124045501.10281-1-heming.zhao@suse.com>
References: <20261124045501.10281-1-heming.zhao@suse.com>
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

