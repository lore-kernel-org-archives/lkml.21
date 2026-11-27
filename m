Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795777005;
	b=jeSolQgXWPAnK68/bKUM0qS/Lno3n5vAW0qw1+kBhRIgLNISWwk3V6mENvCrZ2jpldRw
	 lOXCs2vEvrGL7GaDofwdRNFoQ2MZqW3+GqcUx19EjL88ablk1nnJWKTv9V1nozC7zLrHX
	 KtOkke2mbSv6r2JbzlyhwdUeUaMHZDrfCcMrhuTY9M5oBH2JoEjiJbk38DOUL98BcR2k7
	 rDlcHgRarr7OAA64iogPNS1bsxKrPswBc/3kzog8rWAdHi+xuV1IiITX/nxOLFOFJBobm
	 mglra3fflGf3SiB3WtROYlcCq/Gln7nij+n6rlDXVyOmUgx3lCXpc7f4MX9gxGpjPMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777005;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=CHN6KXnTS23nYEHkKbB8iinceo2+xcsNFrggmAImSbM=;
	b=wcbBn2OEXinXzAsuPCsnaytkVm3kI50+XNS4jxJh2iW12Jw/31DCmgbWlwwLkBFpR342
	 19QWSf0tmCu3+uhDlp5HXy/SY6dSfAoxxVDo/61QJf5JxHFMMRtUvNHUBf0K0D1W5AKxT
	 UxQ2WB5sQDJO0623GdgTo0JyRpGIawNluTudM7TuXdfJ5GGVOAFs1l+eam/jgim745550
	 wfE4SbyQKeMqIEyGVvN94a5fvqTd/b6TJkRVLxvWBAeI9ULem7w5G1/oTl/8rL3o3i5hF
	 lYJyCgXw57MMicSpoqjljSsKRe9oD62upBJsHKB+a0//R3LkqZ9FW+rn7bNhEYWZv1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZKFriKmM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655B7606A690
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZKFriKmM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36A0C1F00919;
	Fri, 27 Nov 2026 10:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795777004;
	bh=CHN6KXnTS23nYEHkKbB8iinceo2+xcsNFrggmAImSbM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZKFriKmM8BgGfH30pJsXD1m3ONDdXkKNs7+kX7bB9M90yEQSaBvUES1CXJLFVhg10
	 fM7TgFF/56eH9lTWn3Q6iKt9NWm0QybRLfu71ZrQLZkSnvBdiSL/Wri8zh97Hg57dC
	 E5hSb1d3z4IWWrV9gItlgx2pw6SY1fzq6yQFkobtwgUEWkjQaBcmXQFwipgM6e6Q50
	 b75Fghs1EoKk8RYKeg+Sk8VI2iSdAu52fQP29s1d4aQx+mRVLS1jvxJeASWtSuCte4
	 eI/qqs6BYL8iuUzTh9V6EqrgcySbjqnJz1tSBCiPFBaVw/e9OCKVsCaNufTJRGGuxy
	 UTrxEVJzAnUug==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Subject: [PATCH v2 2/3] f2fs: introduce max_write_bio_{folio,entry}_cnt module parameters
Date: Fri, 27 Nov 2026 10:56:42 +0000
Message-ID: <20261127105640.537608-5-chao@kernel.org>
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

Commit f32744a8b83d ("f2fs: introduce max_atc_write_bio_entry_cnt")
added a per-superblock sysfs entry, max_atc_write_bio_entry_cnt, to
offload the completion of a write bio to sbi->wq if it contains too
many entries and f2fs_write_end_io() is called in atomic context.

However, it has two issues:

1. The limit is used to bound the CPU latency of f2fs_write_end_io() in
   atomic context, which is a property of the platform (CPU and storage
   completion path) rather than of each f2fs instance, so a global knob
   set once at boot fits better than a per-superblock sysfs entry.

2. Pagecache folios and cached metadata blocks are completed in
   different loops with different per-entry costs, i.e.
   f2fs_write_end_bio() and f2fs_cache_write_end_bio(), so it's better
   to tune them separately rather than sharing a single threshold.

To address these issues, let's replace max_atc_write_bio_entry_cnt
sysfs entry with two module parameters:

- max_write_bio_folio_cnt: for write bios of pagecache folios, which
  are completed in f2fs_write_end_bio().
- max_write_bio_entry_cnt: for write bios of cached metadata blocks,
  which are completed in f2fs_cache_write_end_bio().

Both parameters are read-only at runtime, they can be set via
f2fs.max_write_bio_{folio,entry}_cnt=<n> in the kernel command line, or
via modprobe, and apply to all f2fs instances. The default value is
UINT_MAX, which means this functionality is disabled by default.

Suggested-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- add document for max_write_bio_{folio,entry}_cnt module parameters in
  Documentation/filesystems/f2fs.rst.
- rebase to the latest dev-test branch.

 Documentation/ABI/testing/sysfs-fs-f2fs | 11 -----------
 Documentation/filesystems/f2fs.rst      | 18 ++++++++++++++++++
 fs/f2fs/data.c                          | 18 +++++++++++++++++-
 fs/f2fs/f2fs.h                          |  2 --
 fs/f2fs/super.c                         |  1 -
 fs/f2fs/sysfs.c                         |  2 --
 6 files changed, 35 insertions(+), 17 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index e7e968c6df92..65d45d8edc68 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -1014,17 +1014,6 @@ Description:	Every time a write operation completes f2fs_write_end_io() is
 		(atc) context. The default value for this attribute is UINT_MAX
 		which means that this functionality is disabled by default.
 
-What:		/sys/fs/f2fs/<disk>/max_atc_write_bio_entry_cnt
-Date:		October 2026
-Contact:	Chao Yu <chao@kernel.org>
-Description:	Every time a write operation completes f2fs_write_end_io() is
-		called. This function may be called from an atomic context,
-		e.g. from inside an interrupt handler. This attribute controls
-		the maximum number of entries (folios or cached blocks) in a
-		write bio that is completed in atomic (atc) context. The default
-		value for this attribute is UINT_MAX which means that this
-		functionality is disabled by default.
-
 What:		/sys/fs/f2fs/<disk>/pinned_area_max_secno
 Date:		August 2026
 Contact:	"Daeho Jeong" <daehojeong@google.com>
diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 4d827c8a98d8..22677bf54a01 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -453,6 +453,24 @@ The files in each per-device directory are shown in table below.
 Files in /sys/fs/f2fs/<devname>
 (see also Documentation/ABI/testing/sysfs-fs-f2fs)
 
+Module Parameters
+=================
+
+Module parameters apply to all f2fs instances. They can be set via
+"f2fs.<parameter>=<value>" in the kernel command line, or via modprobe
+if f2fs is built as a module, and are read-only at runtime.
+
+======================== ============================================================
+max_write_bio_folio_cnt	 Maximum number of pagecache folios in a write bio whose
+			 completion is done in atomic context, a write bio w/ more
+			 folios will be completed in a workqueue instead, to bound
+			 the latency of f2fs_write_end_io() in atomic context.
+			 Default: UINT_MAX, i.e. disabled.
+max_write_bio_entry_cnt	 Same as max_write_bio_folio_cnt, but for write bios of
+			 cached metadata blocks.
+			 Default: UINT_MAX, i.e. disabled.
+======================== ============================================================
+
 Usage
 =====
 
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 6be0cadc511e..dbc21e4f147e 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -35,6 +35,16 @@ static struct kmem_cache *bio_entry_slab;
 static mempool_t *bio_post_read_ctx_pool;
 static struct bio_set f2fs_bioset;
 
+static unsigned int max_write_bio_folio_cnt = UINT_MAX;
+module_param(max_write_bio_folio_cnt, uint, 0444);
+MODULE_PARM_DESC(max_write_bio_folio_cnt,
+		"Maximum number of folios in a write bio completed in atomic context");
+
+static unsigned int max_write_bio_entry_cnt = UINT_MAX;
+module_param(max_write_bio_entry_cnt, uint, 0444);
+MODULE_PARM_DESC(max_write_bio_entry_cnt,
+		"Maximum number of cache entries in a write bio completed in atomic context");
+
 #define	F2FS_BIO_POOL_SIZE	NR_CURSEG_TYPE
 
 int __init f2fs_init_bioset(void)
@@ -472,6 +482,12 @@ static void f2fs_write_end_io_work(struct work_struct *work)
 	f2fs_write_end_bio(bio);
 }
 
+static unsigned int f2fs_max_write_bio_cnt(struct bio *bio)
+{
+	return f2fs_is_cache_bio(bio) ? max_write_bio_entry_cnt :
+					max_write_bio_folio_cnt;
+}
+
 static void f2fs_write_end_io(struct bio *bio)
 {
 	struct f2fs_sb_info *sbi;
@@ -482,7 +498,7 @@ static void f2fs_write_end_io(struct bio *bio)
 
 	if (bio_in_atomic() &&
 	    (bio->bi_iter.bi_size > sbi->max_atc_write_bio_size ||
-	     F2FS_BIO(bio)->entry_cnt > sbi->max_atc_write_bio_entry_cnt)) {
+	     F2FS_BIO(bio)->entry_cnt > f2fs_max_write_bio_cnt(bio))) {
 		struct work_struct *w;
 
 		w = &container_of(bio, struct f2fs_bio, bio)->work;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index d35149191625..7f6ca03baa8f 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1835,8 +1835,6 @@ struct f2fs_sb_info {
 	/* for bio operations */
 	/* Largest write bio size completed in atomic context (atc). */
 	u32 max_atc_write_bio_size;
-	/* Largest write bio entry count completed in atomic context (atc). */
-	u32 max_atc_write_bio_entry_cnt;
 	struct f2fs_bio_info *write_io[NR_PAGE_TYPE];	/* for write bios */
 	/* keep migration IO order for LFS mode */
 	struct f2fs_rwsem io_order_lock;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 3fd8a18ac482..392d5a76d26e 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -5355,7 +5355,6 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 		goto free_sb_buf;
 	}
 	sbi->max_atc_write_bio_size = UINT_MAX;
-	sbi->max_atc_write_bio_entry_cnt = UINT_MAX;
 
 	INIT_WORK(&sbi->s_error_work, f2fs_record_error_work);
 	memcpy(sbi->errors, raw_super->s_errors, MAX_F2FS_ERRORS);
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 8ab9a5098f1c..81de27bebaaa 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -1294,7 +1294,6 @@ F2FS_SBI_RW_ATTR(umount_discard_timeout, interval_time[UMOUNT_DISCARD_TIMEOUT]);
 F2FS_SBI_RW_ATTR(gc_pin_file_thresh, gc_pin_file_threshold);
 F2FS_SBI_RW_ATTR(gc_reclaimed_segments, gc_reclaimed_segs);
 F2FS_SBI_RW_ATTR(max_atc_write_bio_size, max_atc_write_bio_size);
-F2FS_SBI_RW_ATTR(max_atc_write_bio_entry_cnt, max_atc_write_bio_entry_cnt);
 F2FS_SBI_GENERAL_RW_ATTR(max_victim_search);
 F2FS_SBI_GENERAL_RW_ATTR(migration_granularity);
 F2FS_SBI_GENERAL_RW_ATTR(migration_window_granularity);
@@ -1547,7 +1546,6 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(gc_segment_mode),
 	ATTR_LIST(gc_reclaimed_segments),
 	ATTR_LIST(max_atc_write_bio_size),
-	ATTR_LIST(max_atc_write_bio_entry_cnt),
 	ATTR_LIST(max_fragment_chunk),
 	ATTR_LIST(max_fragment_hole),
 	ATTR_LIST(current_atomic_write),
-- 
2.49.0

