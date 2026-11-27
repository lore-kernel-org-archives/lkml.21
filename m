Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795777007;
	b=ep8WnbcNeL3Sfd+E4VXGViN+0Vl9OcqIIi4m4P/52WrDlFwJkTX7bzWguelPL42bqmjz
	 /rSu8M9m5EbjvUni9IliMZPb6cFgGTqNdfxFq/Nu+MjTk71lsKomuiDsFefdzMk42PRQ/
	 shmbxyDn4xqf754s/8ifS9KGY5KvcQ0l+iH8LUQd8dFcro/iGdKgE2Vs21HSpakmaPZhn
	 1RQ0zjihrx66XHB1VBIm8eXbzh9A9dHv+yMApdB9uCZnxa1iXm5t0NFmozc/aCnNrIofA
	 xOFRI8N9AuvqAiI7MNeathkU27EGEe04e2YmuxZq2KW/I42d9cOejAx4GrMrzEdTAng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777007;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=nKxvd4Whhjy3nNlqgbUalcl3CVEmFt+eAZC9xwLFB5A=;
	b=38kyTk7RxKxGnQZtAPoUOajfn3MZoA28bj7mvYE+sZ7rX4sBEHy76T0V7Nk/uvVeByMN
	 QtARJ/50Fg3xy24qra7aOD0+9tuf12cBDm7izSwmRgLuoyEBGezbgVw4zSR0af1C7fcYO
	 6M2RfsUBUCTNjJg1UiWbubqBmj5khcxVyqSrSHCn5f1O67iTbvFQ6UOEThvA+bMqduhbN
	 nK9QBFKHCpVnZj0orlcSbs+YIA/b9SZBhMAJz8JS6J9hQZtX+5kPsQOnB5uHK/lGAg6qD
	 Z4h0s2ckfzTArzJa+EK16Y9faMDBQuvvHSh1jI5mDvxNTjtX2fqGkqwR7RpqpGr6eCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jmXI6omU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3757A606A6B9
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jmXI6omU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 107341F00936;
	Fri, 27 Nov 2026 10:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795777006;
	bh=nKxvd4Whhjy3nNlqgbUalcl3CVEmFt+eAZC9xwLFB5A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jmXI6omUjSUpWB1kL1kVNZbz2cRNyFfzCS1Z+uKLR3VyuRkLrG2E6ZC+LmjNmCCDL
	 5wqXbP4FtGrbqxp+RLDJSV2Sq3uLMDFjpt/SwYmG0rXHDDYvVhtX5qndwLZ0WmowSM
	 HuQQifQOzUaq/TCged2ESyJYzJ/eaI5A0Ivc7gTI95ilCzLMhhH/j8cTfyUSjzwPZs
	 aolJL+usrieqwrBWSFet7wuYS8q39R4xM69GqY6QVEum5rb3HQZoGxEodH6sTdSA3v
	 YHp6+Lv47+mKiILqqzjKUKJb9EcxYyTOhyt2QAtEDUtfarQ1c4SJTn3r6sz7CUsDX4
	 Xkk3QdsQ62i5A==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH v2 3/3] f2fs: remove max_atc_write_bio_size
Date: Fri, 27 Nov 2026 10:56:43 +0000
Message-ID: <20261127105640.537608-6-chao@kernel.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261127105640.537608-4-chao@kernel.org>
References: <20261127105640.537608-4-chao@kernel.org>
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

From: Chao Yu <chao@kernel.org>

Commit 3de6b8094115 ("f2fs: Run f2fs_write_end_io() asynchronously")
introduced max_atc_write_bio_size to offload the completion of large
write bios to sbi->wq when f2fs_write_end_io() is called in atomic
context.

However, relying on bio->bi_iter.bi_size has two issues:
1. bi_size is not reliable at completion time: on a direct blk-mq path
   (e.g. SCSI or UFS), blk_update_request() consumes the bio iterator
   via bio_advance() before calling bio_endio(), so bi_size is already 0
   in f2fs_write_end_io(), whereas on a DM / zoned path (e.g. dm-linear)
   only the clone bio is advanced and orig_bio->bi_iter.bi_size stays
   intact.
2. With large folios enabled, folio size may be larger than 4KB, so
   bi_size cannot indicate how many folios are in a bio.

Since max_write_bio_{folio,entry}_cnt module parameters have been
introduced to limit the number of folios or cached blocks completed in
atomic context without depending on the bio iterator, let's remove
max_atc_write_bio_size logic and its sysfs entry.

Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- rebase to the latest dev-test branch.

 Documentation/ABI/testing/sysfs-fs-f2fs | 10 ----------
 fs/f2fs/data.c                          |  3 +--
 fs/f2fs/f2fs.h                          |  2 --
 fs/f2fs/super.c                         |  1 -
 fs/f2fs/sysfs.c                         |  2 --
 5 files changed, 1 insertion(+), 17 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 65d45d8edc68..7b7843d3d67b 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -1004,16 +1004,6 @@ Description:	It can be used to tune priority of f2fs critical task, e.g. f2fs_ck
 		- it requires user has CAP_SYS_NICE capability.
 		- the range is [100, 139], by default the value is 120.
 
-What:		/sys/fs/f2fs/<disk>/max_atc_write_bio_size
-Date:		June 2026
-Contact:	Bart Van Assche <bvanassche@acm.org>
-Description:	Every time a write operation completes f2fs_write_end_io() is
-		called. This function may be called from an atomic context,
-		e.g. from inside an interrupt handler. This attribute controls
-		the maximum size of a write bio that is completed in atomic
-		(atc) context. The default value for this attribute is UINT_MAX
-		which means that this functionality is disabled by default.
-
 What:		/sys/fs/f2fs/<disk>/pinned_area_max_secno
 Date:		August 2026
 Contact:	"Daeho Jeong" <daehojeong@google.com>
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index dbc21e4f147e..aecedd3a4298 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -497,8 +497,7 @@ static void f2fs_write_end_io(struct bio *bio)
 	sbi = bio->bi_private;
 
 	if (bio_in_atomic() &&
-	    (bio->bi_iter.bi_size > sbi->max_atc_write_bio_size ||
-	     F2FS_BIO(bio)->entry_cnt > f2fs_max_write_bio_cnt(bio))) {
+		F2FS_BIO(bio)->entry_cnt > f2fs_max_write_bio_cnt(bio)) {
 		struct work_struct *w;
 
 		w = &container_of(bio, struct f2fs_bio, bio)->work;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 7f6ca03baa8f..07285f9aa1e9 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1833,8 +1833,6 @@ struct f2fs_sb_info {
 	struct f2fs_sm_info *sm_info;		/* segment manager */
 
 	/* for bio operations */
-	/* Largest write bio size completed in atomic context (atc). */
-	u32 max_atc_write_bio_size;
 	struct f2fs_bio_info *write_io[NR_PAGE_TYPE];	/* for write bios */
 	/* keep migration IO order for LFS mode */
 	struct f2fs_rwsem io_order_lock;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 392d5a76d26e..5e29da6e0371 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -5354,7 +5354,6 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 		err = -EINVAL;
 		goto free_sb_buf;
 	}
-	sbi->max_atc_write_bio_size = UINT_MAX;
 
 	INIT_WORK(&sbi->s_error_work, f2fs_record_error_work);
 	memcpy(sbi->errors, raw_super->s_errors, MAX_F2FS_ERRORS);
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 81de27bebaaa..e0b28c9f1c98 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -1293,7 +1293,6 @@ F2FS_SBI_RW_ATTR(gc_idle_interval, interval_time[GC_TIME]);
 F2FS_SBI_RW_ATTR(umount_discard_timeout, interval_time[UMOUNT_DISCARD_TIMEOUT]);
 F2FS_SBI_RW_ATTR(gc_pin_file_thresh, gc_pin_file_threshold);
 F2FS_SBI_RW_ATTR(gc_reclaimed_segments, gc_reclaimed_segs);
-F2FS_SBI_RW_ATTR(max_atc_write_bio_size, max_atc_write_bio_size);
 F2FS_SBI_GENERAL_RW_ATTR(max_victim_search);
 F2FS_SBI_GENERAL_RW_ATTR(migration_granularity);
 F2FS_SBI_GENERAL_RW_ATTR(migration_window_granularity);
@@ -1545,7 +1544,6 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(seq_file_ra_mul),
 	ATTR_LIST(gc_segment_mode),
 	ATTR_LIST(gc_reclaimed_segments),
-	ATTR_LIST(max_atc_write_bio_size),
 	ATTR_LIST(max_fragment_chunk),
 	ATTR_LIST(max_fragment_hole),
 	ATTR_LIST(current_atomic_write),
-- 
2.49.0

