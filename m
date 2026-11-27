Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795754579;
	b=4SWpyJLSep1dA2BC0lFfpJ5hoK3XWJY0fraidwH/SXv+0BJinQGFU4/zB3cu3F7zYTjS
	 sYJw1mBFM/HN6SUURTt9FhCSkeoNT2ZH9usxdH6SZuvHbv1pxoTd8H7dDUJn/qwncCRM3
	 ceW17cJSOzLWSAy4uHFLWdKzvNonoKzm0HgBszk9Al6K65j3gF3ZYE44bBxGfr5KXTZrg
	 zlL3mkUNHVx5RJU/pF8AmBnHiKczH7v3Xcf8WlZeUogT2J46Asrg0aeiSQKOpwMOltyuX
	 FOlTpYpbeq74T4cOB2C1CoMRMN8SQsSilGIhXw0MLR0BMkmjMIBTrY88or3ANTRTqWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795754579;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=k0rYRyrD1fMCKRAq6G01uKOV/1M1ZNsc6U0xUKlxk/8=;
	b=su/7Exw2sH56oJPJm/4lb7K5uD1cPMVolJ9ML/ZCAOQA1Wm1GpmEZg1IQ4zQlQFDX3+z
	 bgWAm9Uh5wKAjInXuUmUWGL8xwHIpYo2ptvxVCrzTv1TVx07jNc+gsIBfAyENUrNv1SSR
	 ioIe9f5OUXA8mhnxj9tskQVXQdTCFTARyGwcfxrBenpwtHsMCvdJokoZJnyjg3gPSbX1I
	 8wl9qhdzYGv49RlCPhJ3kFD49ur8DIi3pjtaBblqKMGkzavtq1dTdmAVhqSKBVoVLUf0Y
	 Z10EZhhjKGLm5ROpjTjm2Fl9IkWHjh3lNFsfLBBRiQgjYg90lEnxoCYl4osQjkscUPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uj9U0lvJ;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74300606A339
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:42:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74300606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uj9U0lvJ
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1a3c08d6928so11447807c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 20:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795754571; x=1796359371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k0rYRyrD1fMCKRAq6G01uKOV/1M1ZNsc6U0xUKlxk/8=;
        b=Uj9U0lvJW0hn+15LlcVLiuocGYdZQUYHXub06SdKvfkyUvGIrtmzJzESL6V4YJIcsV
         1Qsz7YQ5qSpZ0jk+bZPMau4xGOvzxcg6azaD41FPjXsmGJc8fyjP4SNUtHVUjmXF434Y
         sK5l5pb1acke3oS4xBBJQSbDpKxAWUskoWZRgxdpY00wONwhu8DmMr36O5WGIfbP8rae
         3/zAOW42cr/qj7DSRiiXb4NA6XebtSPpDub9xh1arh4B79TLPpXiaDFfQmaXaIKPa4eC
         PcJlqmEGk5RHNaXuRwhgx+X3fQ7f5FX0jps1mvBqPUp/DNEvu+moycTbnzA+rJ7xlDbY
         /72g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795754571; x=1796359371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k0rYRyrD1fMCKRAq6G01uKOV/1M1ZNsc6U0xUKlxk/8=;
        b=UYZ2VNLGwn/kmpnQk1b1+PlhuMZxI0zLyZbwmIIjB5t3DiUL4EhELnYxOQ08tkupDw
         +GFE7PEZWSdJuP6Vdo4LuAut8JINYpdhDti4OcY5CDcFZhTbrCbvLRXt37LYYxWv/dM/
         NX9apMlBo/lW7O6jZhVhqCYLSaOoYW8qgVCnxxWkGgFEYhPD3s654wNsrs2DvLRw2O99
         JsLlxWBX7/qSXtYkU02K6FAaq4HZsz/wsS24OevkVDfJ9v09XHvEX5SUfyL7ZJ6Ku9YR
         H2Cf87FN39I9HnrW4ngpbhqhbK7ugjlqj7z6IE3jQvdpgSxBoRkuLBLnGSQWQ18Q8BfR
         eOuA==
X-Forwarded-Encrypted: i=1; AL+hErGixqn+NoPsvMJ+Mfr3RnGZVFGwbrshHecFfKZY5r5v3lDHdWT1+XRSdp9iMOmcwMmrEs1MNR9Xw11Jnqo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TgtpHqg4tO7CQApjuiteP4v2pNkmXKap+yegZc8S5EUuXG7OT
	a24etb4DSCZNauxJLv4FJfar6cwtxfo7bb+V7SrMcS3rWpgsE3wQ58Ok
X-Gm-Gg: AZFdTZctmGYCaTHkf+ptmiJMMLxDmafeGudpqGDRWFGv+xo1GobgOX1j1yxx1xVsGb8
	mvBlnbHkodplK/VIqw4e6X1Nrd7na3JTxjfYP8HfTHHCc8ZWAvz9qe+o1nIeeH0bTKz9Bg/uo/3
	qghha7+B5CFOXBYYaG9BlnjSVglpU3WQRUzO52TE8kC6cczE6T0syIz1yQQV+JhTSbZWOMGnSbS
	YBWMFkC+vW+IvVDYdu53DuU5bqGLgL3i5AdqEYU7STOOLvH0EjFujf+I01SkTL7T6eHsR/mpzVP
	b6N6dFRrTUt9XYPOQRU6hBmD3kdifDPXRJ3oiegv19Dqrijs9HQHqOOJK0YpDY58hv0HCUEGK64
	B8zsHlacKHPFIzu6JbTPrJV8DXS+sjC4WxDEJlWv8XKLuIyPf8C02szmL1VJQFPovk12mYERlmL
	0BteP4s+i3TM0QiWk0kvZhtt8E4yzRKoNYmDnc73EJ1+qPbcTk16IOqn0kMur24XVQJS5Oupuba
	lWpnvlX/dXRvourbTAjZ5AvRxlPnQwsP8dk+RurXbHZUtkOzJ0e+NVNEwtwG1ZIYVLzxPxfPk6D
	Aq9kjUFC1gBIYRucwJSM9vmykLY+XH2EeXymnP9+c+jsWMFZ/1od5wccvm1WK+Q=
X-Received: by 2002:a05:701b:4588:10b0:195:76af:b810 with SMTP id a92af1059eb24-1b5972b4691mr1650412c88.25.1795754570587;
        Thu, 26 Nov 2026 20:42:50 -0800 (PST)
Received: from carrot.home.local (madb688455.ap.nuro.jp. [219.104.132.85])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm88000388c88.9.2026.11.26.20.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:42:49 -0800 (PST)
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: Wang Jianjian <wangjianjian3@huawei.com>,
	linux-nilfs <linux-nilfs@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Zheng Zheng <fengaojigui88@gmail.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [PATCH 6/8] nilfs2: restore removed DAT entries when aborting GC
Date: Fri, 27 Nov 2026 13:40:59 +0900
Message-ID: <20261127044231.37630-7-konishi.ryusuke@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127044231.37630-1-konishi.ryusuke@gmail.com>
References: <20261127044231.37630-1-konishi.ryusuke@gmail.com>
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

Since commit ce5a5ad1a833 ("nilfs2: fix infinite loop in
nilfs_clean_segments()"), an escape path was added to exit the GC loop
in nilfs_clean_segments() when GC fails.  However, if GC is aborted
due to an error, obsolete virtual block numbers freed from the DAT
metadata file are left deleted, causing subsequent GC runs or userland
tools such as lssu -l (which relies on the DAT to evaluate live blocks)
to fail due to missing DAT entries.

Fix this by restoring the removed DAT entries from the shadow mapping
saved by nilfs_dat_freev() when log construction is aborted during GC.

Fixes: ce5a5ad1a833 ("nilfs2: fix infinite loop in nilfs_clean_segments()")
Cc: stable@vger.kernel.org
Signed-off-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>
---
 fs/nilfs2/dat.c     | 72 +++++++++++++++++++++++++++++++++++++++++++++
 fs/nilfs2/dat.h     |  1 +
 fs/nilfs2/segment.c | 10 ++++++-
 fs/nilfs2/segment.h |  4 +++
 4 files changed, 86 insertions(+), 1 deletion(-)

diff --git a/fs/nilfs2/dat.c b/fs/nilfs2/dat.c
index b4156945e433..94d358d9d5b0 100644
--- a/fs/nilfs2/dat.c
+++ b/fs/nilfs2/dat.c
@@ -352,6 +352,78 @@ int nilfs_dat_freev(struct inode *dat, __u64 *vblocknrs, size_t nitems)
 	return nilfs_palloc_freev(dat, vblocknrs, nitems);
 }
 
+/**
+ * nilfs_dat_cancel_freev - undo removal of DAT entries
+ * @dat:       DAT file inode
+ * @vblocknrs: array of virtual block numbers
+ * @nitems:    number of virtual block numbers
+ *
+ * nilfs_dat_cancel_freev() restores freed virtual block numbers specified by
+ * @vblocknrs and @nitems from the shadow mapping.
+ */
+void nilfs_dat_cancel_freev(struct inode *dat, __u64 *vblocknrs, size_t nitems)
+{
+	unsigned long entries_per_block = NILFS_MDT(dat)->mi_entries_per_block;
+	unsigned int entry_size = NILFS_MDT(dat)->mi_entry_size;
+	struct buffer_head *entry_bh = NULL, *saved_bh = NULL;
+	struct nilfs_palloc_req req;
+	__u64 start_vblocknr = 0, end_vblocknr = 0;
+	size_t i;
+
+	for (i = 0; i < nitems; i++) {
+		size_t offset;
+		int ret;
+
+		req.pr_entry_nr = vblocknrs[i];
+		ret = nilfs_palloc_prepare_alloc_entry(dat, &req, false);
+		if (ret < 0)
+			continue;
+
+		if (req.pr_entry_nr != vblocknrs[i])
+			goto abort_alloc_entry;
+
+		if (!saved_bh || vblocknrs[i] < start_vblocknr ||
+			vblocknrs[i] >= end_vblocknr) {
+			u64 rem;
+
+			brelse(saved_bh);
+			saved_bh = NULL;
+			brelse(entry_bh);
+			entry_bh = NULL;
+
+			ret = nilfs_dat_prepare_entry(dat, &req, true);
+			if (ret < 0)
+				goto abort_alloc_entry;
+
+			entry_bh = req.pr_entry_bh;
+
+			saved_bh = nilfs_mdt_get_frozen_buffer(dat, entry_bh);
+			if (!saved_bh) {
+				brelse(entry_bh);
+				entry_bh = NULL;
+				goto abort_alloc_entry;
+			}
+
+			div64_u64_rem(vblocknrs[i], entries_per_block, &rem);
+			start_vblocknr = vblocknrs[i] - rem;
+			end_vblocknr = start_vblocknr + entries_per_block;
+		}
+
+		offset = nilfs_palloc_entry_offset(dat,	vblocknrs[i], entry_bh);
+		memcpy_folio(entry_bh->b_folio, offset, saved_bh->b_folio,
+			offset, entry_size);
+		mark_buffer_dirty(entry_bh);
+		nilfs_palloc_commit_alloc_entry(dat, &req);
+		continue;
+
+abort_alloc_entry:
+		nilfs_palloc_abort_alloc_entry(dat, &req);
+	}
+
+	brelse(saved_bh);
+	brelse(entry_bh);
+}
+
 /**
  * nilfs_dat_move - change a block number
  * @dat: DAT file inode
diff --git a/fs/nilfs2/dat.h b/fs/nilfs2/dat.h
index 4f67f31f928b..8e1e52aa9cf7 100644
--- a/fs/nilfs2/dat.h
+++ b/fs/nilfs2/dat.h
@@ -38,6 +38,7 @@ void nilfs_dat_abort_update(struct inode *, struct nilfs_palloc_req *,
 
 int nilfs_dat_mark_dirty(struct inode *, __u64);
 int nilfs_dat_freev(struct inode *, __u64 *, size_t);
+void nilfs_dat_cancel_freev(struct inode *dat, __u64 *vblocknrs, size_t items);
 int nilfs_dat_move(struct inode *, __u64, sector_t);
 void nilfs_dat_undo_move(struct inode *dat, __u64 vblocknr);
 ssize_t nilfs_dat_get_vinfo(struct inode *, void *, unsigned int, size_t);
diff --git a/fs/nilfs2/segment.c b/fs/nilfs2/segment.c
index 263f9ff00193..f3c12c14c750 100644
--- a/fs/nilfs2/segment.c
+++ b/fs/nilfs2/segment.c
@@ -1909,8 +1909,12 @@ static void nilfs_segctor_abort_construction(struct nilfs_sc_info *sci,
 	if (list_empty(&logs))
 		return; /* if the first segment buffer preparation failed */
 
-	if (nilfs_doing_gc())
+	if (nilfs_doing_gc()) {
 		nilfs_cancel_block_relocation(&logs);
+		nilfs_dat_cancel_freev(nilfs->ns_dat, sci->sc_freevblks,
+				sci->sc_nfreevblks);
+	}
+
 	nilfs_cancel_segusage(&logs, nilfs->ns_sufile);
 	nilfs_free_incomplete_logs(&logs, nilfs);
 
@@ -2605,6 +2609,8 @@ int nilfs_clean_segments(struct super_block *sb, struct nilfs_argv *argv,
 
 	sci->sc_freesegs = kbufs[4];
 	sci->sc_nfreesegs = argv[4].v_nmembs;
+	sci->sc_freevblks = kbufs[2];
+	sci->sc_nfreevblks = argv[2].v_nmembs;
 	sci->sc_subuf = subuf;
 	list_splice_tail_init(&nilfs->ns_gc_inodes, &sci->sc_gc_inodes);
 
@@ -2636,6 +2642,8 @@ int nilfs_clean_segments(struct super_block *sb, struct nilfs_argv *argv,
 
  out_unlock:
 	sci->sc_subuf = NULL;
+	sci->sc_freevblks = NULL;
+	sci->sc_nfreevblks = 0;
 	sci->sc_freesegs = NULL;
 	sci->sc_nfreesegs = 0;
 	list_splice_tail_init(&sci->sc_gc_inodes, &nilfs->ns_gc_inodes);
diff --git a/fs/nilfs2/segment.h b/fs/nilfs2/segment.h
index e67afc14a82c..711c69e24575 100644
--- a/fs/nilfs2/segment.h
+++ b/fs/nilfs2/segment.h
@@ -83,7 +83,9 @@ struct nilfs_segsum_pointer {
  * @sc_iput_queue: list of inodes for which iput should be done
  * @sc_iput_work: work struct to defer iput call
  * @sc_freesegs: array of segment numbers to be freed
+ * @sc_freevblks: array of virtual block numbers to be freed
  * @sc_nfreesegs: number of segments on @sc_freesegs
+ * @sc_nfreevblks: number of virtual block numbers on @sc_freevblks
  * @sc_subuf: buffer used to save segment entries
  * @sc_dsync_inode: inode whose data pages are written for a sync operation
  * @sc_dsync_start: start byte offset of data pages
@@ -129,7 +131,9 @@ struct nilfs_sc_info {
 	struct work_struct	sc_iput_work;
 
 	__u64		       *sc_freesegs;
+	__u64		       *sc_freevblks;
 	size_t			sc_nfreesegs;
+	size_t			sc_nfreevblks;
 	void		       *sc_subuf;
 
 	struct nilfs_inode_info *sc_dsync_inode;
-- 
2.53.0

