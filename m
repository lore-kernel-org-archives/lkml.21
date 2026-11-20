Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795154437;
	b=Gs5gs14WeyTu4CXrpUsT3eqOE0cPikM+eSUcMkqFwpFnEOqMZ6spIVdXK/4BjBcbGVEv
	 KUdHoa2z6mUqgC6FbU9kNLVQKoAUDQgAIf90Eq9+AE+lLJWcTGFqo1VVN2w8/+IS4LPi+
	 AzbI3Do1lrhxikDD08FDLrLVkxvnZIPZPB6Ep+Juf9jMxvIZHKQY6XdNLYxSyyfutLqda
	 StoSZgtW8Zg78w6URKksJX3DhEjIMoOWWhooA2OOQkeTXajJ16ohN1BtHQBVSf3zxLzTk
	 VcMEVcoPHZSGSRPtb9vKGmTh45Sf+Q3Y4VeJHxk20zEpWPF0G506V2Kc/6ploGbYB0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795154437;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HslZ026Sqb2wA5Yz5eYmxBepFwcsw9Bo6wmDwgf0aso=;
	b=m3HPcNPIDXIs2Kv6CRzEkxIsMW2J84SWs5I94VsC1pZBgnBO6JJAKDw+k+fdexVMcdv7
	 87pYAzdLu3K2SRszoZp1CKpA9Zf0a+HT9eq5zdbV3m3NvBE2ZYx2c4PNLe4xnXqUvP+sI
	 jd/FsZ1Cgns/lQQuAT0J2tD1C77hNoYzkNDaZoUkrUk9auoM9LwhGspNjSB3+nxNUHUGN
	 r+/qv0BGjH/sq+FAPz445LpyWsYhx6sFp5uQVIppwbHhIgN5DKaO93DW4onHj8zT/BViF
	 bKJC0S0sDMe7TwaW35c4/aLwEWHeD0SpW314fq+2BCyea2WassPuJNctPzgt6OWDRAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=PNvHWFUO;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6384F606A52B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:00:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6384F606A52B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=PNvHWFUO
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c50737c64c8so2187266b.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795154431; x=1795759231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HslZ026Sqb2wA5Yz5eYmxBepFwcsw9Bo6wmDwgf0aso=;
        b=PNvHWFUOy/Q7xrrIc+CIgTAb0VwpAAYgXKR/obweSPJyEW9C2uzk6L4PvHpCIl2MCs
         AhlEk1tSaUZi2wAnDX7xMf1u+pOXH9mWKQU+5tZYtJLvx3F03C98me5xtkjIHWMKa7yU
         a3VYFp6Ft7TAbY5yBNzPBwgpaUJaCH72JLCIuN7mde2RfhxsC7UScwtPrAl7BBDuXFd9
         Rh7/+2BwgHk3Z8QUJB0iHbz+EXCbsJkKsOb6CPzatxH5PQ2+x5qPJceestCyMYGt7CCJ
         Ryp7YW5PCdwoujD+Cp4ioyFGRe0JUC8CN/FQYqPpwxntdUVI3nNfaXU22TUBBqsKNV7W
         UEhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795154431; x=1795759231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HslZ026Sqb2wA5Yz5eYmxBepFwcsw9Bo6wmDwgf0aso=;
        b=VYhy1Slzh/uZfyxn4PmxiaUeiNhOSPQqEqoWgv/hYAPz/99XXomD6qRmY2EcFag+Oe
         zGHLoE81oSuLXkaicBTjLOEmifuWdVN/meXbnl80b0vh9pfgUcc08uukghpuXgDa0kZS
         FHxBclJRmz88zVb3CMF57E5SoMpX6ltbAIlINIZeUz7fpzmzxufd5+Cl98J84XvgrwvU
         WrQOUCrFEd0wW3C03QZtg9pYHk8RhZnJw/LLfCKTfDd7d3jMvLMXx2AFaJGlQ/StCd1K
         TnhIlKJjid99jTsCHwF1X4jtUB9xz1CciuOF7P9Us3jCIJsEhNWryimzHsebC9yfMEn0
         hihw==
X-Forwarded-Encrypted: i=1; AL+hErHlGClWXRsnUzIKXxXE+xO4r6g60AX1LM2nkPUw3Gcla8W+lsVHCTU5SGXIQDWF9cYGQTtEivYMM0+bj2k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1ksR+X/pcHCjipaxC68Kss7mkH1xwQdlTiBuRvuLc+mG5YNEs
	PzDd2ssBFMLyGRSIQxBKcHwXxL6et9U8EKL21QuYfJo7tm7P787xWYe8qTPcD3YvnT8=
X-Gm-Gg: AZFdTZfPYNuav7TBptPQUUvkoIKTgYUL5Yo4wjmXpsh9jNQHyU/9F9PUKFKXq1DKODM
	d7axppo996aABs8+IKn2ngHUWLtv/pCQvXC4VlLdcWnvDEfQm4fs3tS0ngpZQlfDwa6WNt5e2wA
	1pY90HswwHCpgAvJepo7fW8O1Znqymt6CpmE5tI41JB+SvjZr2Ez+rAMpFMxxsiRSqFZQMWVun5
	SpRptBG/AgIWMI04kKvXHuTQ5xdxZCL8aOryKjS5YuMPCEGj/E7BjbAc8qz7axv3xYbQDvZuVeS
	4EMsLN98IiEJ0kDqtuBID6JLDVuKqY2cLNlkSn2+5MSzVe9PAnUyrWiAxYBQHqXKjcaG+uTZiPA
	qrdSNyNj9EVX2d3P4xM9q6dDXxYrsn/mn0VQeh6N+sCwwHAr8uohLh3DHP3B6NqZ1A3sdeThkXT
	tVrWf+1C+ciFYcqGyHwuX49WmN2aHYvI81VQ24kELyTYmeTfjZr2scOZ9sYdbuMKFcuhtzkuqtu
	l0RmCTaTZ72wx45R3deatMPNwu1NmzR0TbFVhVmnXBy71IRIUy37oU1gxbvX3EPIf/UlNzOIpJV
	t5bR0pZ7m7Uv7O6twTSBTgujTLJeDIkIU7L/vqEQkd4=
X-Received: by 2002:a17:906:3e41:b0:c46:ae89:cd3c with SMTP id a640c23a62f3a-c513a3971a7mr168113466b.1.1795154430829;
        Thu, 19 Nov 2026 22:00:30 -0800 (PST)
Received: from localhost.localdomain ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343f571sm918597b3a.34.2026.11.19.22.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 22:00:29 -0800 (PST)
From: Heming Zhao <heming.zhao@suse.com>
To: joseph.qi@linux.alibaba.com,
	mark@fasheh.com,
	jlbec@evilplan.org,
	hch@lst.de
Cc: Heming Zhao <heming.zhao@suse.com>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v9 1/3] ocfs2: Add new ocfs2_map_blocks() to introduce iomap feature
Date: Fri, 20 Nov 2026 14:00:11 +0800
Message-ID: <20261120060014.12087-2-heming.zhao@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261120060014.12087-1-heming.zhao@suse.com>
References: <20261120060014.12087-1-heming.zhao@suse.com>
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

