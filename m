Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795754565;
	b=aUbkCaos8DfMKJamPNgo9XYkovgmQre8T+QsKbsY/6S5mCVBCUwNYoZ5UgsH5zD1M8KT
	 cIZX6QX+fsh05DNGXIEgiSD6Uv/lfMhEPlyOgAAQWAokW+JAWz6H7/RIvIVEJyjQRbITW
	 S6PHaPLiQ/ddpVY/eDasJchxlZ/TGO4E0+2t3Gn/W3YSEmVCpv1dql9CzReJY1SuVMjId
	 T/OO7ovSInb3nMEa8BNTOviW36DFMjHnfnhG4uRkBVrAwH8NLpXAghCOPb6eCbgrf0PUh
	 ORXidyIOk5WuYOb6c+/7LtvTfz5atm2Sf/cuVsTseD6E+mZiKxSncvFaBPeo65OUI8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795754565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ts4d62TlNeF6R9HA94Yn5R1YjmdU+DrvQd+qWJIsSJY=;
	b=4UMHMOpGZxT1HOoXkP72mk7g5Wrd5XsqmX/UpIISRcFR3AQ9vqKjkNkrPD9QN+TSJEkd
	 YXZE+AqMo6o2hK67gAzxqJl3v0Wl6oPo2vqSs91o9lkRW1XefSvzBnd6N3B8/AvLJbeCd
	 +SW9pU3eiN923PgTpY67rapg9HdeF653/EmjCrJx5rD/6MKzfN/62I4s6qiDr+XhUWUwx
	 gUmFIXEDwdlOGaTY96pahqeu1bEeT2DjXFl0XKquqaUtAh0sHRlKEvZ7cWWdt2YCp7yBx
	 z9tLlxgbKCs39GUhU+4c+tOxbe/69j9+Tb3NfY4PO+NLRa7UEsQxx8vPSSl6Z0KPPHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SQZ1SVRi;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C7A606A331
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:42:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94C7A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SQZ1SVRi
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b546061d58so17792732c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 20:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795754564; x=1796359364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ts4d62TlNeF6R9HA94Yn5R1YjmdU+DrvQd+qWJIsSJY=;
        b=SQZ1SVRipNY3ZMQjGVbjxUB+b24+MnLf8a5S7pGsy1ZkJhLXQP2uPpRxj1bv1q3tdl
         GhUBbdLhCq0kSr+WClPq8qJerMBJHOFBkG//5OGOJCtF0ssDw443Vql839DbhFIOTnlr
         brU2bL0z979HWHYQJflsaRuh97UANJXGSAwljx9LDgY4MZ/KcCu/nvxYrl0oNeqvHHlV
         XKlX2V8qZRoGUqEoR82LosoZhgmuzRxwN3C2RYYPqKjYAJ0Aqo5yyhwwg8a3YrERRtDt
         eShnDNPJc6PxoRZh/KGX/+LIDDqU5qfIqw4qUoyLMxtGGwATNLTYR3SiUdEH83dNzNFz
         HoOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795754564; x=1796359364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ts4d62TlNeF6R9HA94Yn5R1YjmdU+DrvQd+qWJIsSJY=;
        b=Epb0kKBb0E0VkBwTcCivrTcYL6MHJWWVHQ/ZyzQJP+su7+g/fDaxfvl0UWgGWpGWBI
         sNNI9YjWJEW7hOh/MC7QDUPdhv9B1MWaIuXaMt3UiwuQRaeqCoKKVX5lbMR0A9P2FASh
         PZa7Ry/5M8auOtg8hc49E8YgXkO+s1kht7upWFWzuy5BYxgDPX1DwOnuDuQEFXyKWk8f
         Dpg6SCtAkoiOEC6dnpPVn/DdAwxmo1AhyU2X1L1OvV9YVMTsFBKUaLjCerPwkxmhtFvW
         Kiw3A0zGFXIUrRrBzRNh69on3KKYmYohUza2d3LhRZ9p59WkrF4sY12v6mPabA/+fGPk
         n88Q==
X-Forwarded-Encrypted: i=1; AL+hErFSJnJ9+7xoc+YkgNZvkJxG/xWaCFjBzYEqXUMok+FrVfSQ2LBPswwdCsU+J9L5dONhPX14JnbcfLMJMWA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JqRD1xb8S7kyWlUTvxHLLRXUlyEkn7AyWnLd0b+AVu/xK0jP4
	T7V7cKybljs79eFosDJeiuVUXoMyu6F+y6Y4HJ2D1Um8yU79wBDd5pHO
X-Gm-Gg: AZFdTZf0+2fHWmoPjdwmY6uzib7W4akUZDLfLGf34M7XWR//M4laGEqv1cWHSIsReUe
	PySR0YtzVh6qmadRUHtSEEZ3JDlcK9xd89Bl9XvwSTIDPy8c4jqJK4Y6fUYiX1omQ2kW++5trUh
	UUTdtmlLZM1jHSMTegjMDmp5+xDvk4Gc0KahwFwmNMu3g78HzYSmESy2Lsn4P+Tzvg4ys2Dimdg
	Gj+LmdtVR0/8E2ga6Urkyao30QyhxsXGy1EztsCChGuf8NWdelSoVWXLjtYjckBjW8ub2Pta1WW
	h99oqPFv4PsHwPXXTdnJlgfvX3BXuLRfOaz66RUZbh/1+bxsyjjeoOiHghH7PVqYRefzVKl2csn
	e+OxRPfzGCGIzJnSLqgV4uVo0lqGl8LwNDl/T29lmg1gAapan2AMSv7zXyTSJFzDgCXVg024INJ
	0PWghetHGdezrWmhRYe89xqyjpG+qen6kSTyoRVJV0DyyK/4E0J0rG6yE+5DNBpGGJ1T7ULia/+
	9tRaQkBdm0X2K4eZ7xjlKfdGDZjbpyfZWumd/pXyIhQrk3m70RXzgoVaxy/Af9qavbQJ+9YrnOO
	8AFWJ9LNv9hxPZF/dc3Nh3O4NxrYpVDQQHprWllObNPERmvEvF5/lbOX3cLUKCI=
X-Received: by 2002:a05:7022:150e:b0:1ac:9da7:e881 with SMTP id a92af1059eb24-1b55690bc2fmr25249069c88.36.1795754563614;
        Thu, 26 Nov 2026 20:42:43 -0800 (PST)
Received: from carrot.home.local (madb688455.ap.nuro.jp. [219.104.132.85])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm88000388c88.9.2026.11.26.20.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:42:42 -0800 (PST)
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: Wang Jianjian <wangjianjian3@huawei.com>,
	linux-nilfs <linux-nilfs@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Zheng Zheng <fengaojigui88@gmail.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [PATCH 3/8] nilfs2: restore segment usage from the save buffer when aborting GC
Date: Fri, 27 Nov 2026 13:40:56 +0900
Message-ID: <20261127044231.37630-4-konishi.ryusuke@gmail.com>
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
in nilfs_clean_segments() when GC fails.  However, if log writing is
aborted during GC, the segment usage entries of the target segments that
were temporarily freed for GC are left in a corrupted state, losing
metadata such as timestamps and block counts.

This happens because nilfs_sufile_cancel_freev(), which is called to
cancel the segment release performed by nilfs_sufile_freev(), only marks
the segment usage as dirty again without restoring its original
metadata.

To allow GC to safely abort on error after starting, the pair of
nilfs_sufile_freev() and nilfs_sufile_cancel_freev() must be able to
fully restore the segment usage entries.

Fix this by passing a save buffer for segment usage entries to the
batch update functions of the segment usage metadata file (sufile) so
that the original entries are saved on release and properly restored on
failure.  The save buffer is allocated and freed in
nilfs_clean_segments().

Fixes: ce5a5ad1a833 ("nilfs2: fix infinite loop in nilfs_clean_segments()")
Cc: stable@vger.kernel.org
Signed-off-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>
---
 fs/nilfs2/segment.c | 30 ++++++++++++++++++++++++------
 fs/nilfs2/segment.h |  2 ++
 fs/nilfs2/sufile.c  | 27 +++++++++++++++++----------
 fs/nilfs2/sufile.h  | 37 ++++++++++++++++++++-----------------
 4 files changed, 63 insertions(+), 33 deletions(-)

diff --git a/fs/nilfs2/segment.c b/fs/nilfs2/segment.c
index 24f8fa8cf864..263f9ff00193 100644
--- a/fs/nilfs2/segment.c
+++ b/fs/nilfs2/segment.c
@@ -1109,6 +1109,7 @@ static int nilfs_segctor_scan_file_dsync(struct nilfs_sc_info *sci,
  * @nilfs:   nilfs object
  * @segnumv: array of segment numbers to be freed
  * @nsegs:   number of segments to be freed in @segnumv
+ * @subuf:   buffer for saving and restoring segment usage entries
  *
  * nilfs_free_segments() wraps nilfs_sufile_freev() and
  * nilfs_sufile_cancel_freev(), and edits the segment usage metadata file
@@ -1127,7 +1128,7 @@ static int nilfs_segctor_scan_file_dsync(struct nilfs_sc_info *sci,
  * * %-ENOMEM	- Insufficient memory available.
  */
 static int nilfs_free_segments(struct the_nilfs *nilfs, __u64 *segnumv,
-			       size_t nsegs)
+			size_t nsegs, void *subuf)
 {
 	size_t ndone;
 	int ret;
@@ -1135,10 +1136,11 @@ static int nilfs_free_segments(struct the_nilfs *nilfs, __u64 *segnumv,
 	if (!nsegs)
 		return 0;
 
-	ret = nilfs_sufile_freev(nilfs->ns_sufile, segnumv, nsegs, &ndone);
+	ret = nilfs_sufile_freev(nilfs->ns_sufile, segnumv, nsegs, &ndone,
+				subuf);
 	if (unlikely(ret)) {
 		nilfs_sufile_cancel_freev(nilfs->ns_sufile, segnumv, ndone,
-					  NULL);
+					NULL, subuf);
 		/*
 		 * If a segment usage of the segments to be freed is in a
 		 * hole block, nilfs_sufile_freev() will return -ENOENT.
@@ -1257,7 +1259,7 @@ static int nilfs_segctor_collect_blocks(struct nilfs_sc_info *sci, int mode)
 		fallthrough;
 	case NILFS_ST_SUFILE:
 		err = nilfs_free_segments(nilfs, sci->sc_freesegs,
-					  sci->sc_nfreesegs);
+					sci->sc_nfreesegs, sci->sc_subuf);
 		if (unlikely(err))
 			break;
 		sci->sc_stage.flags |= NILFS_CF_SUFREED;
@@ -1565,7 +1567,7 @@ static int nilfs_segctor_collect(struct nilfs_sc_info *sci,
 			err = nilfs_sufile_cancel_freev(nilfs->ns_sufile,
 							sci->sc_freesegs,
 							sci->sc_nfreesegs,
-							NULL);
+							NULL, sci->sc_subuf);
 			nilfs_sufile_warn_on_error(nilfs->ns_sufile, err);
 			sci->sc_stage.flags &= ~NILFS_CF_SUFREED;
 		}
@@ -1916,7 +1918,7 @@ static void nilfs_segctor_abort_construction(struct nilfs_sc_info *sci,
 		ret = nilfs_sufile_cancel_freev(nilfs->ns_sufile,
 						sci->sc_freesegs,
 						sci->sc_nfreesegs,
-						NULL);
+						NULL, sci->sc_subuf);
 		nilfs_sufile_warn_on_error(nilfs->ns_sufile, ret);
 	}
 
@@ -2552,11 +2554,24 @@ int nilfs_clean_segments(struct super_block *sb, struct nilfs_argv *argv,
 	struct nilfs_transaction_info ti;
 	int err;
 	size_t i, nfreesegs = argv[4].v_nmembs;
+	size_t susz = NILFS_MDT(nilfs->ns_sufile)->mi_entry_size;
 	__u64 *segnumv = kbufs[4];
+	void *subuf = NULL;
 
 	if (unlikely(!sci))
 		return -EROFS;
 
+	if (likely(nfreesegs > 0)) {
+		size_t bytes;
+
+		if (check_mul_overflow(nfreesegs, susz, &bytes))
+			return -EINVAL;
+
+		subuf = kvzalloc(bytes, GFP_KERNEL);
+		if (unlikely(!subuf))
+			return -ENOMEM;
+	}
+
 	nilfs_transaction_lock(sb, &ti, 1);
 
 	/*
@@ -2590,6 +2605,7 @@ int nilfs_clean_segments(struct super_block *sb, struct nilfs_argv *argv,
 
 	sci->sc_freesegs = kbufs[4];
 	sci->sc_nfreesegs = argv[4].v_nmembs;
+	sci->sc_subuf = subuf;
 	list_splice_tail_init(&nilfs->ns_gc_inodes, &sci->sc_gc_inodes);
 
 	for (;;) {
@@ -2619,12 +2635,14 @@ int nilfs_clean_segments(struct super_block *sb, struct nilfs_argv *argv,
 	}
 
  out_unlock:
+	sci->sc_subuf = NULL;
 	sci->sc_freesegs = NULL;
 	sci->sc_nfreesegs = 0;
 	list_splice_tail_init(&sci->sc_gc_inodes, &nilfs->ns_gc_inodes);
 	nilfs_mdt_clear_shadow_map(nilfs->ns_dat);
  bail_unlock:
 	nilfs_transaction_unlock(sb);
+	kvfree(subuf);
 	return err;
 }
 
diff --git a/fs/nilfs2/segment.h b/fs/nilfs2/segment.h
index 4b39ed43ae72..e67afc14a82c 100644
--- a/fs/nilfs2/segment.h
+++ b/fs/nilfs2/segment.h
@@ -84,6 +84,7 @@ struct nilfs_segsum_pointer {
  * @sc_iput_work: work struct to defer iput call
  * @sc_freesegs: array of segment numbers to be freed
  * @sc_nfreesegs: number of segments on @sc_freesegs
+ * @sc_subuf: buffer used to save segment entries
  * @sc_dsync_inode: inode whose data pages are written for a sync operation
  * @sc_dsync_start: start byte offset of data pages
  * @sc_dsync_end: end byte offset of data pages (inclusive)
@@ -129,6 +130,7 @@ struct nilfs_sc_info {
 
 	__u64		       *sc_freesegs;
 	size_t			sc_nfreesegs;
+	void		       *sc_subuf;
 
 	struct nilfs_inode_info *sc_dsync_inode;
 	loff_t			sc_dsync_start;
diff --git a/fs/nilfs2/sufile.c b/fs/nilfs2/sufile.c
index fec5af70c6dd..c8010b9e6d67 100644
--- a/fs/nilfs2/sufile.c
+++ b/fs/nilfs2/sufile.c
@@ -148,6 +148,7 @@ unsigned long nilfs_sufile_get_ncleansegs(struct inode *sufile)
  * @nsegs: size of @segnumv array
  * @create: creation flag
  * @ndone: place to store number of modified segments on @segnumv
+ * @suv: buffer for saving or restoring segment usage entries
  * @dofunc: primitive operation for the update
  *
  * Description: nilfs_sufile_updatev() repeatedly calls @dofunc
@@ -166,15 +167,17 @@ unsigned long nilfs_sufile_get_ncleansegs(struct inode *sufile)
  * * %-ENOMEM	- Insufficient memory available.
  */
 int nilfs_sufile_updatev(struct inode *sufile, __u64 *segnumv, size_t nsegs,
-			 int create, size_t *ndone,
+			 int create, size_t *ndone, void *suv,
 			 void (*dofunc)(struct inode *, __u64,
 					struct buffer_head *,
-					struct buffer_head *))
+					struct buffer_head *, void *))
 {
 	struct buffer_head *header_bh, *bh;
 	unsigned long blkoff, prev_blkoff;
 	__u64 *seg;
 	size_t nerr = 0, n = 0;
+	size_t susz = NILFS_MDT(sufile)->mi_entry_size;
+	void *su;
 	int ret = 0;
 
 	if (unlikely(nsegs == 0))
@@ -204,8 +207,8 @@ int nilfs_sufile_updatev(struct inode *sufile, __u64 *segnumv, size_t nsegs,
 	if (ret < 0)
 		goto out_header;
 
-	for (;;) {
-		dofunc(sufile, *seg, header_bh, bh);
+	for (su = suv; ; su = su ? su + susz : NULL) {
+		dofunc(sufile, *seg, header_bh, bh, su);
 
 		if (++seg >= segnumv + nsegs)
 			break;
@@ -236,7 +239,7 @@ int nilfs_sufile_updatev(struct inode *sufile, __u64 *segnumv, size_t nsegs,
 int nilfs_sufile_update(struct inode *sufile, __u64 segnum, int create,
 			void (*dofunc)(struct inode *, __u64,
 				       struct buffer_head *,
-				       struct buffer_head *))
+				       struct buffer_head *, void *))
 {
 	struct buffer_head *header_bh, *bh;
 	int ret;
@@ -254,7 +257,7 @@ int nilfs_sufile_update(struct inode *sufile, __u64 segnum, int create,
 
 	ret = nilfs_sufile_get_segment_usage_block(sufile, segnum, create, &bh);
 	if (!ret) {
-		dofunc(sufile, segnum, header_bh, bh);
+		dofunc(sufile, segnum, header_bh, bh, NULL);
 		brelse(bh);
 	}
 	brelse(header_bh);
@@ -407,7 +410,7 @@ int nilfs_sufile_alloc(struct inode *sufile, __u64 *segnump)
 
 void nilfs_sufile_do_cancel_free(struct inode *sufile, __u64 segnum,
 				 struct buffer_head *header_bh,
-				 struct buffer_head *su_bh)
+				 struct buffer_head *su_bh, void *buf)
 {
 	struct nilfs_segment_usage *su;
 	size_t offset;
@@ -420,6 +423,8 @@ void nilfs_sufile_do_cancel_free(struct inode *sufile, __u64 segnum,
 		kunmap_local(su);
 		return;
 	}
+	if (buf)
+		memcpy(su, buf, NILFS_MDT(sufile)->mi_entry_size);
 	nilfs_segment_usage_set_dirty(su);
 	kunmap_local(su);
 
@@ -432,7 +437,7 @@ void nilfs_sufile_do_cancel_free(struct inode *sufile, __u64 segnum,
 
 void nilfs_sufile_do_scrap(struct inode *sufile, __u64 segnum,
 			   struct buffer_head *header_bh,
-			   struct buffer_head *su_bh)
+			   struct buffer_head *su_bh, void *buf)
 {
 	struct nilfs_segment_usage *su;
 	size_t offset;
@@ -463,7 +468,7 @@ void nilfs_sufile_do_scrap(struct inode *sufile, __u64 segnum,
 
 void nilfs_sufile_do_free(struct inode *sufile, __u64 segnum,
 			  struct buffer_head *header_bh,
-			  struct buffer_head *su_bh)
+			  struct buffer_head *su_bh, void *buf)
 {
 	struct nilfs_segment_usage *su;
 	size_t offset;
@@ -486,6 +491,8 @@ void nilfs_sufile_do_free(struct inode *sufile, __u64 segnum,
 		nilfs_warn(sufile->i_sb, "free unallocated segment %llu",
 			   (unsigned long long)segnum);
 
+	if (buf)
+		memcpy(buf, su, NILFS_MDT(sufile)->mi_entry_size);
 	nilfs_segment_usage_set_clean(su);
 	kunmap_local(su);
 	mark_buffer_dirty(su_bh);
@@ -646,7 +653,7 @@ int nilfs_sufile_get_stat(struct inode *sufile, struct nilfs_sustat *sustat)
 
 void nilfs_sufile_do_set_error(struct inode *sufile, __u64 segnum,
 			       struct buffer_head *header_bh,
-			       struct buffer_head *su_bh)
+			       struct buffer_head *su_bh, void *buf)
 {
 	struct nilfs_segment_usage *su;
 	size_t offset;
diff --git a/fs/nilfs2/sufile.h b/fs/nilfs2/sufile.h
index 5888ed479c8b..34a429664712 100644
--- a/fs/nilfs2/sufile.h
+++ b/fs/nilfs2/sufile.h
@@ -33,22 +33,23 @@ ssize_t nilfs_sufile_get_suinfo(struct inode *, __u64, void *, unsigned int,
 				size_t);
 ssize_t nilfs_sufile_set_suinfo(struct inode *, void *, unsigned int, size_t);
 
-int nilfs_sufile_updatev(struct inode *, __u64 *, size_t, int, size_t *,
+int nilfs_sufile_updatev(struct inode *sufile, __u64 *segnumv, size_t nsegs,
+			 int create, size_t *ndone, void *suv,
 			 void (*dofunc)(struct inode *, __u64,
 					struct buffer_head *,
-					struct buffer_head *));
+					struct buffer_head *, void *));
 int nilfs_sufile_update(struct inode *, __u64, int,
 			void (*dofunc)(struct inode *, __u64,
 				       struct buffer_head *,
-				       struct buffer_head *));
+				       struct buffer_head *, void *));
 void nilfs_sufile_do_scrap(struct inode *, __u64, struct buffer_head *,
-			   struct buffer_head *);
+			   struct buffer_head *, void *);
 void nilfs_sufile_do_free(struct inode *, __u64, struct buffer_head *,
-			  struct buffer_head *);
+			  struct buffer_head *, void *);
 void nilfs_sufile_do_cancel_free(struct inode *, __u64, struct buffer_head *,
-				 struct buffer_head *);
+				 struct buffer_head *, void *);
 void nilfs_sufile_do_set_error(struct inode *, __u64, struct buffer_head *,
-			       struct buffer_head *);
+			       struct buffer_head *, void *);
 
 int nilfs_sufile_resize(struct inode *sufile, __u64 newnsegs);
 int nilfs_sufile_read(struct super_block *sb, size_t susize,
@@ -108,34 +109,36 @@ static inline int nilfs_sufile_free(struct inode *sufile, __u64 segnum)
 
 /**
  * nilfs_sufile_freev - free segments
- * @sufile: inode of segment usage file
+ * @sufile:  inode of segment usage file
  * @segnumv: array of segment numbers
- * @nsegs: size of @segnumv array
- * @ndone: place to store the number of freed segments
+ * @nsegs:   size of @segnumv array
+ * @ndone:   place to store the number of freed segments
+ * @suv:     buffer to save segment usage entries
  *
  * Return: 0 on success, or a negative error code on failure.
  */
 static inline int nilfs_sufile_freev(struct inode *sufile, __u64 *segnumv,
-				     size_t nsegs, size_t *ndone)
+				     size_t nsegs, size_t *ndone, void *suv)
 {
-	return nilfs_sufile_updatev(sufile, segnumv, nsegs, 0, ndone,
+	return nilfs_sufile_updatev(sufile, segnumv, nsegs, 0, ndone, suv,
 				    nilfs_sufile_do_free);
 }
 
 /**
  * nilfs_sufile_cancel_freev - reallocate freeing segments
- * @sufile: inode of segment usage file
+ * @sufile:  inode of segment usage file
  * @segnumv: array of segment numbers
- * @nsegs: size of @segnumv array
- * @ndone: place to store the number of cancelled segments
+ * @nsegs:   size of @segnumv array
+ * @ndone:   place to store the number of cancelled segments
+ * @suv:     buffer containing saved segment usage entries
  *
  * Return: 0 on success, or a negative error code on failure.
  */
 static inline int nilfs_sufile_cancel_freev(struct inode *sufile,
 					    __u64 *segnumv, size_t nsegs,
-					    size_t *ndone)
+					    size_t *ndone, void *suv)
 {
-	return nilfs_sufile_updatev(sufile, segnumv, nsegs, 0, ndone,
+	return nilfs_sufile_updatev(sufile, segnumv, nsegs, 0, ndone, suv,
 				    nilfs_sufile_do_cancel_free);
 }
 
-- 
2.53.0

