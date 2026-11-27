Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795750412;
	b=DPKRQDbnLgg86OpcuQefUIwzt7uPZauWwXojut7LOM9FBeFH4aCwMuPyXC9HJdn777LE
	 dTiEA/qfmRRLin2B7f20Xt/XZS0nsJBNZM4zXLifDvJc0ucjVoGS8ENhPT/zaJjJZTzot
	 TCzqhz/kmIxoiUESUSUMeNP7e2CGscLfWgmxvUcMczwz+ZCR1rfRH7JcOed8vAENWEF62
	 GZ0Mw//TSE5r29+9FPi1zMrXbdi/JLNHY34BniCqZxb0BO1gxIlMaUtHRJt7Oyqi+oHWH
	 MBsLvaptPhVCR4GK+8mxGlptGIGRxhFmiZgZcszwnSszud+GonEyFdsD7stxDhydyhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795750412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3XfKcymPSGYY/hb4/CxUw8ruovTcqp8sS67S+DyuBX4=;
	b=pGcy0JNcpKoasxAGwMQ2pI7SyWCpnA9e0Nn+cFekuJAoQG4S70csgpVJ6qzmdQatL8ui
	 1tPm9vK61r86gXMMrfqSSMlumhAcuiIIb9+le5sVG0gBv6NSSTR7Z1MBoMYJKyyyP9gu8
	 tG1WerZ288d9MUgac4egogcEvYl/LxlASlqYlOV5xvUet0k3L+aIyLA5U6IB6LabAc3qu
	 /+ZUnScvgUmSkVsr3XrjiS4uCF9Da77R7ipz9F6LFKKoO760Ga5njFwY8Uwbw6DKrKJmm
	 ly+8Ldnj4BjjqBhSjIQl4Cfe7ZJaXB/9amzHwxS1eBvuidhlua4/71ZcCJP1lKJxV+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="Y/zaZSYv";
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65818606A337
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:33:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65818606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Y/zaZSYv
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b86bbbe954so1185234a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795750410; x=1796355210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3XfKcymPSGYY/hb4/CxUw8ruovTcqp8sS67S+DyuBX4=;
        b=Y/zaZSYvNR3joMVTKtEIDTRwSXpKkxms1yYUNdzhM2MjdVum0hClSpLXbeR3Co2R6n
         DUYk+va2zQ7CW2l4I8z3PGWw1qQp6vwkZaKGS11lZX+WvDMqlLiuMx5hCtBwvoYVdHjB
         spv07Rcpa/tmq4uqy3lQNHXWJ9AqgjLnDvlHE/4O7k/rAK9a8q4ru9xrINHXY1FWRnwh
         AdHYRdmKFKinBIXzT6g3qzsFuT0yi1rLgoUpj7Ci0EQoZnXIKVPbK1Nqh0z8ECjSqK5R
         1femLNYsk3u5obTV/XId8owcPKwg3llPc0t0WaCO2fQWlCC8ZZcC4Yd6DJxq30bgBcWV
         6Wew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795750410; x=1796355210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3XfKcymPSGYY/hb4/CxUw8ruovTcqp8sS67S+DyuBX4=;
        b=X5/D5g87P0cNpjVLy7aG/Ws1Tp+LJKNsk1SlGw423d9+Pe51U0JWTuC8fNj2NDG24a
         1pjspq7j/pUqTrlyY9R1jz4PMp8NmAIY75N2xyE42Fq5X305v15In3jS7dNbX0SgIjxl
         QwnRfGu9UPIwJJYG6dDRR5AjEjhV/oor0JZrkp+3V328vcUMz3RmfI/iZXJv2bxAmTMd
         m4+m2RTZazDQoIOTexL8P/bNzZc1rDFy+FY90u0dQkweuN9FUo0VyF6tffZ1cdv+RwDK
         EWFVdAgTvyhBc5VAEOxOIph8C1Ay6LPAmUHTWWrA3iDij9NLKePSp1NNaKMHNZBo9iDj
         vLew==
X-Forwarded-Encrypted: i=1; AL+hErGZXBlG4mlaWUrsCA+ERIvfZ0wgKRJf/9tUaXTalqOtshKLUobU4969e4zYwlviUVmRrsPaRc+ifevMzMU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9h80HjaPfuh+fc14saIt1G01M7KHGU+0A7yzqbhMNmR7F4YwEa
	FU78SDPRAxLiQEB3enhVfEqcPZME8paC6sqMhUCEd2CTVEZbgSzDoO6ZFmeOgCAdGho=
X-Gm-Gg: AZFdTZcKF5Bgut29pQTKaWOXG+CH9ktW76ZIxx4BbV6Q/MUiqogAcVbGL4qivLGJF+c
	5jhOs6vJGbL9qjVwsShzQzQHiJa4TPA+IIF34J34fs/zVZ41PaUvNpplwjrl24qXwJOKLIScJFv
	BbNbYSAlMTibczvSRsPFiWbcMIMBevSlET0HQYebWzmwN9aXbEPy0expHhldetgAEW38SJa9c2T
	zRpiuAuhHtElhHizf2YRhrqTfMm6QMHFOAi+c/Ojo8fDVVCJ6nQTeZaRn4+XJ/M4TXbq0XWdkB3
	c6HjLPX2f+oQ/pYjqMsWfyywhu8TYv3/8TU5FtqLPexNYzEkdQrODRM4a92U+u/K+AexnJ6PDeT
	4rHupGr/4Ev036LlxLX72o0S39x7QpFmr6gZhtfVMevGhpyYioXBCXdec1F6K1n7rwTfk2IGrxX
	woilC7VSl953vi1IaoIVK88D7c5sUZEMbHMWfs9GxIhT6cYboFjvVvPqVOO6wG0sDrgl92mljP8
	oO0FvZJ2g55/hj8GWgNorqu7tmgeXhQmoS0UN2ro2BSlBBKAYN93Vd2sY2DYljZ+ceDbTGP2DO7
	y5POq+dB8kCsXSoztqfGnhtMY5QO2P2gpqAG1yXw9QY=
X-Received: by 2002:a17:906:68d5:b0:c51:4fd:1aef with SMTP id a640c23a62f3a-c513a50ab80mr1852409066b.2.1795750409647;
        Thu, 26 Nov 2026 19:33:29 -0800 (PST)
Received: from localhost.localdomain ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d135e9sm38375797a91.4.2026.11.26.19.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 19:33:28 -0800 (PST)
From: Heming Zhao <heming.zhao@suse.com>
To: joseph.qi@linux.alibaba.com,
	mark@fasheh.com,
	jlbec@evilplan.org,
	hch@lst.de
Cc: Heming Zhao <heming.zhao@suse.com>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v12.1 2/3] ocfs2: switch DIO read path from buffer_head to iomap
Date: Fri, 27 Nov 2026 11:33:11 +0800
Message-ID: <20261127033313.9169-3-heming.zhao@suse.com>
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

Migrates the DIO read path from the legacy buffer_head infrastructure
to the modern and more efficient iomap framework.

Under the current code, ocfs2 holds a cluster lock during DIO via
ocfs2_iocb_set_rw_locked(), and releases the cluster lock in
ocfs2_dio_end_io() via ocfs2_iocb_clear_rw_locked(). The lock level is
stashed in iocb->private.

However, iomap DIO owns that field (it stores a bio there for polled I/O
and unconditionally clears it before calling ->end_io). Any side-channel
state packed into iocb->private is corrupted, which trips the end_io
lock-state check.

Instead, encode the unlock level by passing distinct iomap_dio_ops methods
e.g.: ocfs2_iomap_dio_ops_r_pr ocfs2_iomap_dio_ops_w_pr for PRMODE or
ocfs2_iomap_dio_ops_w_ex for EXMODE. Also note that the ops_w_{pr|ex} are
defined in the next patch.

Additionally, the *_iter() functions use the split __iomap_dio_rw() +
iomap_dio_complete() API so they can determine unambiguously, from the
return value, whether the completion handler already dropped the lock
(real I/O, sync or -EIOCBQUEUED) or whether the caller must drop it
(no I/O issued, or buffered fallback).

The new function ocfs2_iomap_begin() performs a similar role to
ocfs2_get_block(). While ocfs2_get_block() retrieves only one block per
call, ocfs2_iomap_begin() can handle multiple blocks at once.

Co-developed-by: Joseph Qi <joseph.qi@linux.alibaba.com>
Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
Signed-off-by: Heming Zhao <heming.zhao@suse.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 fs/ocfs2/Kconfig |   1 +
 fs/ocfs2/aops.c  | 107 +++++++++++++++++++++++++++++++++++++++++++++--
 fs/ocfs2/aops.h  |   5 +++
 fs/ocfs2/file.c  |  60 ++++++++++++++++++++++----
 4 files changed, 161 insertions(+), 12 deletions(-)

diff --git a/fs/ocfs2/Kconfig b/fs/ocfs2/Kconfig
index 2514d36cbe01..bf1678a5eb01 100644
--- a/fs/ocfs2/Kconfig
+++ b/fs/ocfs2/Kconfig
@@ -7,6 +7,7 @@ config OCFS2_FS
 	select CRC32
 	select QUOTA
 	select QUOTA_TREE
+	select FS_IOMAP
 	select FS_POSIX_ACL
 	select LEGACY_DIRECT_IO
 	help
diff --git a/fs/ocfs2/aops.c b/fs/ocfs2/aops.c
index 64fcf6eb3d89..21cdc5c29331 100644
--- a/fs/ocfs2/aops.c
+++ b/fs/ocfs2/aops.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/fs.h>
+#include <linux/iomap.h>
 #include <linux/slab.h>
 #include <linux/highmem.h>
 #include <linux/pagemap.h>
@@ -126,6 +127,19 @@ static int ocfs2_lock_get_block(struct inode *inode, sector_t iblock,
 	return ret;
 }
 
+static int ocfs2_lock_map_blocks(struct inode *inode,
+				 struct ocfs2_map_block *map, int flags)
+{
+	int ret = 0;
+	struct ocfs2_inode_info *oi = OCFS2_I(inode);
+
+	down_read(&oi->ip_alloc_sem);
+	ret = ocfs2_map_blocks(inode, map, flags);
+	up_read(&oi->ip_alloc_sem);
+
+	return ret;
+}
+
 /* ocfs2 never allocates in this function */
 int ocfs2_map_blocks(struct inode *inode, struct ocfs2_map_block *map,
 		    int flags)
@@ -171,8 +185,11 @@ int ocfs2_map_blocks(struct inode *inode, struct ocfs2_map_block *map,
 			map->flags |= OCFS2_MAP_MAPPED;
 	}
 
+	past_eof = ocfs2_blocks_for_bytes(inode->i_sb, i_size_read(inode));
+
 	if (!ocfs2_sparse_alloc(osb)) {
-		if (map->pblk == 0) {
+		/* detected a hole (unallocated extent) in a file */
+		if (map->pblk == 0 && map->lblk < past_eof) {
 			err = -EIO;
 			mlog(ML_ERROR,
 			     "iblock = %llu p_blkno = %llu blkno=(%llu)\n",
@@ -187,8 +204,6 @@ int ocfs2_map_blocks(struct inode *inode, struct ocfs2_map_block *map,
 		}
 	}
 
-	past_eof = ocfs2_blocks_for_bytes(inode->i_sb, i_size_read(inode));
-
 	if (create && (map->lblk >= past_eof))
 		map->flags |= OCFS2_MAP_NEW;
 
@@ -2532,6 +2547,92 @@ static ssize_t ocfs2_direct_IO(struct kiocb *iocb, struct iov_iter *iter)
 				    ocfs2_dio_end_io, 0);
 }
 
+static int ocfs2_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
+		unsigned int flags, struct iomap *iomap, struct iomap *srcmap)
+{
+	int ret;
+	struct ocfs2_map_block map;
+	u8 blkbits = inode->i_blkbits;
+	u64 max_lblk = (inode->i_sb->s_maxbytes - 1) >> blkbits;
+
+	if ((offset >> blkbits) > max_lblk)
+		return -EINVAL;
+
+	/*
+	 * Calculate the first and last logical blocks respectively.
+	 */
+	map.lblk = offset >> blkbits;
+	map.len = min_t(loff_t, (offset + length - 1) >> blkbits,
+			max_lblk) - map.lblk + 1;
+	map.flags = 0;
+
+	if (flags & IOMAP_WRITE) {
+		return -EOPNOTSUPP;
+	}
+
+	ret = ocfs2_lock_map_blocks(inode, &map, 0);
+	if (ret < 0)
+		return ret;
+
+	iomap->bdev = inode->i_sb->s_bdev;
+	iomap->offset = (u64)map.lblk << blkbits;
+	iomap->length = (u64)map.len << blkbits;
+
+	if (map.pblk == 0) {
+		iomap->type = IOMAP_HOLE;
+		iomap->addr = IOMAP_NULL_ADDR;
+	} else {
+		if (map.flags & OCFS2_MAP_UNWRITTEN) {
+			iomap->type = IOMAP_UNWRITTEN;
+		} else if (map.flags & OCFS2_MAP_MAPPED) {
+			iomap->type = IOMAP_MAPPED;
+		} else {
+			WARN_ON_ONCE(1);
+			return -EIO;
+		}
+		iomap->addr = (sector_t)map.pblk << blkbits;
+	}
+
+	if (map.flags & OCFS2_MAP_NEW)
+		iomap->flags |= IOMAP_F_NEW;
+
+	return 0;
+}
+
+int ocfs2_iomap_next(const struct iomap_iter *iter, struct iomap *iomap,
+			    struct iomap *srcmap)
+{
+	int ret;
+
+	if (iomap->length) {
+		ret = iomap_iter_continue(iter, iomap, srcmap, 0);
+		if (ret <= 0)
+			return ret;
+	}
+
+	ret = ocfs2_iomap_begin(iter->inode, iter->pos, iter->len, iter->flags,
+				iomap, srcmap);
+	return ret < 0 ? ret : 1;
+}
+
+static int ocfs2_dio_end_io_r_pr(struct kiocb *iocb, ssize_t size,
+				int error, unsigned int flags)
+{
+	struct inode *inode = file_inode(iocb->ki_filp);
+
+	if (error)
+		mlog_ratelimited(ML_ERROR, "Direct IO failed, bytes = %lld errno:%d",
+				 (long long)size, error);
+
+	ocfs2_rw_unlock(inode, 0);
+
+	return error;
+}
+
+const struct iomap_dio_ops ocfs2_iomap_dio_ops_r_pr = {
+	.end_io = ocfs2_dio_end_io_r_pr,
+};
+
 const struct address_space_operations ocfs2_aops = {
 	.dirty_folio		= block_dirty_folio,
 	.read_folio		= ocfs2_read_folio,
diff --git a/fs/ocfs2/aops.h b/fs/ocfs2/aops.h
index 8dd6edd7c1a1..72de1e764a57 100644
--- a/fs/ocfs2/aops.h
+++ b/fs/ocfs2/aops.h
@@ -7,6 +7,11 @@
 #define OCFS2_AOPS_H
 
 #include <linux/fs.h>
+#include <linux/iomap.h>
+
+extern const struct iomap_dio_ops ocfs2_iomap_dio_ops_r_pr;
+int ocfs2_iomap_next(const struct iomap_iter *iter, struct iomap *iomap,
+			    struct iomap *srcmap);
 
 int ocfs2_map_folio_blocks(struct folio *folio, u64 *p_blkno,
 			  struct inode *inode, unsigned int from,
diff --git a/fs/ocfs2/file.c b/fs/ocfs2/file.c
index 82c88fa8e98f..e309ff9a56e5 100644
--- a/fs/ocfs2/file.c
+++ b/fs/ocfs2/file.c
@@ -9,6 +9,7 @@
 
 #include <linux/capability.h>
 #include <linux/fs.h>
+#include <linux/iomap.h>
 #include <linux/types.h>
 #include <linux/slab.h>
 #include <linux/highmem.h>
@@ -2399,6 +2400,26 @@ static int ocfs2_prepare_inode_for_write(struct file *file,
 	return ret;
 }
 
+static bool ocfs2_should_use_dio(struct kiocb *iocb, struct iov_iter *iter,
+				struct inode *inode)
+{
+	struct ocfs2_super *osb = OCFS2_SB(inode->i_sb);
+
+	/*
+	 * Fallback to buffered I/O if we see an inode without
+	 * extents.
+	 */
+	if (OCFS2_I(inode)->ip_dyn_features & OCFS2_INLINE_DATA_FL)
+		return false;
+
+	/* Fallback to buffered I/O if we do not support append dio. */
+	if (iocb->ki_pos + iter->count > i_size_read(inode) &&
+	    !ocfs2_supports_append_dio(osb))
+		return false;
+
+	return true;
+}
+
 static ssize_t ocfs2_file_write_iter(struct kiocb *iocb,
 				    struct iov_iter *from)
 {
@@ -2588,7 +2609,8 @@ static ssize_t ocfs2_file_read_iter(struct kiocb *iocb,
 	if (!direct_io && nowait)
 		return -EOPNOTSUPP;
 
-	ocfs2_iocb_init_rw_locked(iocb);
+	if (!iov_iter_count(to))
+		return 0; /* skip atime */
 
 	/*
 	 * buffered reads protect themselves in ->read_folio().  O_DIRECT reads
@@ -2606,8 +2628,6 @@ static ssize_t ocfs2_file_read_iter(struct kiocb *iocb,
 			goto bail;
 		}
 		rw_level = 0;
-		/* communicate with ocfs2_dio_end_io */
-		ocfs2_iocb_set_rw_locked(iocb, rw_level);
 	}
 
 	/*
@@ -2628,17 +2648,39 @@ static ssize_t ocfs2_file_read_iter(struct kiocb *iocb,
 	}
 	ocfs2_inode_unlock(inode, lock_level);
 
-	ret = generic_file_read_iter(iocb, to);
+	if (direct_io && ocfs2_should_use_dio(iocb, to, inode)) {
+		/*
+		 * Use the split iomap DIO API so we can tell who owns the
+		 * rw_lock on return; reads always hold it at PR level, dropped
+		 * by ocfs2_iomap_dio_ops_r_pr(). Call it directly rather than
+		 * through generic_file_read_iter(): iomap advances iocb->ki_pos
+		 * itself, so the generic helper would advance ki_pos twice.
+		 */
+		struct iomap_dio *dio;
+
+		dio = __iomap_dio_rw(iocb, to, ocfs2_iomap_next,
+				&ocfs2_iomap_dio_ops_r_pr, 0, NULL, 0);
+		if (dio == NULL) {
+			/* No I/O issued; rw_lock still held. */
+			ret = 0;
+		} else if (IS_ERR(dio)) {
+			ret = PTR_ERR(dio);
+			if (ret == -EIOCBQUEUED)
+				rw_level = -1;
+		} else {
+			ret = iomap_dio_complete(dio);
+			rw_level = -1;
+		}
+		/* never fall back to buffered read */
+	} else {
+		iocb->ki_flags &= ~IOCB_DIRECT;
+		ret = generic_file_read_iter(iocb, to);
+	}
 	trace_generic_file_read_iter_ret(ret);
 
 	/* buffered aio wouldn't have proper lock coverage today */
 	BUG_ON(ret == -EIOCBQUEUED && !direct_io);
 
-	/* see ocfs2_file_write_iter */
-	if (ret == -EIOCBQUEUED || !ocfs2_iocb_is_rw_locked(iocb)) {
-		rw_level = -1;
-	}
-
 bail:
 	if (rw_level != -1)
 		ocfs2_rw_unlock(inode, rw_level);
-- 
2.55.0

