Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993124;
	b=vAWvPajvq2pe/tzi6TVdeeS4lk2ORApL1CwEAmAwVudDl4pxTx3emZ3/CPPbQcunR+xr
	 CeNnlFLm1ottAQvaUKyHtC4CBCLSMhujK76OYXlmaBCKxALEoW2lnFYvGyeprhPb4iwZf
	 JWA8OyralA7JywyuVpuUqVgduKa4wOhLNgWj+7L0cyEnsIg3aTpvOU5xquEvtK5SYU73l
	 v+rr3DiItRkTinCnuu/Piq/KTPwtJbbgtuc+Vuzaj+x4wMc6MAnd+AwBPr0SA5dOCNYaB
	 q3vG0NBkc3a506TA+wD7EfF+oDzM6cZihZ00mBcBntG0kO5Vsjg0+IMObDqS5OVUcKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993124;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=UHDkxn2msSfp62gJZEjez69Jd03Lj80/6aHBB9PIr9I=;
	b=5Dv66Spl0UQJd7URlSgL3qfu+ng2s2P0K1lPa5ddja47N3TJId88aVozfY6xF0P41cqf
	 o+62kYO2Keq7oJ6Q9T5K0vMHNTCCiYq1y6EV7MHcj469qejKvh2w/kCe6tdYdRftCOfdk
	 lzQXg4GA4R5njnu/gZpBClMmRu1mNr36EZJsLo8AwGSh8luLsZKC3qgxZHuQiN6ZV0Drc
	 eczqqX9suKF0F2rwYlqOf0N/DKKZGRidOuoyYt3Srm/A1K/zmXo3p9ensf1BRpVqubcJc
	 EtAyMKFv95Yj+DUHa/k9XuikGvTK5ZGgrhubZ3wAAX0eLkF+BPaqZLnBRHOkB6ux7aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=OXh9LcBP;
	arc=none smtp.remote-ip=220.197.31.5
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A314C606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:12:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A314C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=OXh9LcBP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=UH
	Dkxn2msSfp62gJZEjez69Jd03Lj80/6aHBB9PIr9I=; b=OXh9LcBPV/cLT3Xkdc
	7/9Fj1PCtLmIUTFKvgrr3EIbEjyslYFvIrJ8nAI9uF258KRqpSOW4Jlxum4w2DoF
	mjQ1+RtcN/DDjxuY98BMHDeYxuRfP2J0MDAEtLOIcAzFtPjZeHyyf61L9FePtRc7
	L7mdZBaouCKaXjJnO+zeHCVh0=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3v0nSa_1qVwxBIg--.34758S2;
	Wed, 18 Nov 2026 17:11:47 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com,
	liubaolin12138@163.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v6 32/37] ntfs: report MFT writeback errors to fsnotify
Date: Wed, 18 Nov 2026 17:06:56 +0800
Message-Id: <20261118090701.1858849-33-wangxuewen_ky@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261118090701.1858849-1-wangxuewen_ky@163.com>
References: <20261118090701.1858849-1-wangxuewen_ky@163.com>
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
X-CM-TRANSID:_____wD3v0nSa_1qVwxBIg--.34758S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxtFW8tFyDuF45Xry8WF4xCrg_yoW7tF13pF
	9xG393JrWktr42qwn7tF4jva4ak34xK3yUCrWxG3Wxuws5tr1jqF4DtrZYgFyrKr93Gw4r
	Jw4DKrZ8uF1UZr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U8wIgUUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbCzhMpEmr9a9MNZQAA3h

From: Baolin Liu <liubaolin@kylinos.cn>

MFT write failures mark the volume without notifying error listeners.
Report device failures from the existing BIO completion callback for
both synchronous and asynchronous writes. Use blk_status_to_errno(),
matching the error recorded in the address_space.

Also report mirror and write-preparation failures. Use EFSCORRUPTED for
invalid record geometry, mappings and MST preparation, preserving the
errno through the affected error exits and mapping_set_error(). Keep
ENOMEM redirty and retry behavior.

Use the generic deferred reporter for completion-context notifications.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
---
Changes in v6:
Retain the upstream metadata-folio reader for MFT mirror I/O.

Validation:
- Compiled and linked the NTFS module object with W=1 at this stage.

 fs/ntfs/mft.c | 56 ++++++++++++++++++++++++++++++++++-----------------
 1 file changed, 37 insertions(+), 19 deletions(-)

diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index 0f33ecd1fc30..8c58f5e0314f 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -479,9 +479,11 @@ static void ntfs_mft_end_io(struct bio *bio)
 		err = blk_status_to_errno(bio->bi_status);
 	else
 		err = ctx->error;
+	/* Report device errors from both synchronous and asynchronous writes. */
+	if (bio->bi_status)
+		ntfs_report_file_metadata_error(ctx->mapping->host, err);
 	if (err) {
 		mapping_set_error(ctx->mapping, err);
-		NVolSetErrors(ctx->vol);
 		ntfs_error(ctx->vol->sb, "I/O error while writing MFT: %d",
 			   err);
 	}
@@ -542,29 +544,31 @@ static int ntfs_sync_mft_mirror_unit(struct ntfs_volume *vol,
 	u64 mirror_size;
 	unsigned int mirror_ofs;
 	u8 *src, *dst;
-	int err;
+	int err = -EFSCORRUPTED;
 
 	if (unlikely(!vol->mftmirr_ino))
-		return -EIO;
+		goto out_report;
 
 	mirror_size = (u64)vol->mftmirr_size * vol->mft_record_size;
 	if (mirror_file_ofs >= mirror_size ||
 	    unit->len > mirror_size - mirror_file_ofs)
-		return -EIO;
+		goto out_report;
 	if (unit->folio_ofs + unit->len > folio_size(source))
-		return -EIO;
+		goto out_report;
 
 	mirror = ntfs_read_metadata_folio(vol->mftmirr_ino->i_mapping,
-					  mirror_file_ofs >> PAGE_SHIFT);
-	if (IS_ERR(mirror))
-		return PTR_ERR(mirror);
+				    mirror_file_ofs >> PAGE_SHIFT);
+	if (IS_ERR(mirror)) {
+		err = PTR_ERR(mirror);
+		goto out_report;
+	}
 
 	folio_lock(mirror);
 	if (folio_test_writeback(mirror))
 		folio_wait_writeback(mirror);
 	mirror_ofs = mirror_file_ofs - folio_pos(mirror);
 	if (mirror_ofs + unit->len > folio_size(mirror)) {
-		err = -EIO;
+		err = -EFSCORRUPTED;
 		goto out_unlock;
 	}
 
@@ -596,6 +600,9 @@ static int ntfs_sync_mft_mirror_unit(struct ntfs_volume *vol,
 out_unlock:
 	folio_unlock(mirror);
 	folio_put(mirror);
+out_report:
+	if (err)
+		ntfs_report_metadata_error(vol, err);
 	return err;
 }
 
@@ -627,10 +634,10 @@ static int ntfs_prepare_mft_record_io_units(struct ntfs_inode *ni,
 	unsigned int i;
 
 	if (!nr_units || nr_units > ARRAY_SIZE(ni->mft_lcn))
-		return -EIO;
+		return -EFSCORRUPTED;
 	for (i = 0; i < nr_units; i++)
 		if (ni->mft_lcn[i] < 0)
-			return -EIO;
+			return -EFSCORRUPTED;
 
 	cluster_ofs = ntfs_bytes_to_cluster_off(vol, record_byte);
 	if (vol->mft_io_unit_size > vol->mft_record_size) {
@@ -715,8 +722,10 @@ int write_mft_record_nolock(struct ntfs_inode *ni, struct mft_record *m, int syn
 		goto done;
 
 	err = ntfs_prepare_mft_record_io_units(ni, units);
-	if (err < 0)
+	if (err < 0) {
+		err = -EFSCORRUPTED;
 		goto err_out;
+	}
 	nr_units = err;
 
 	kaddr = kmap_local_folio(folio, 0);
@@ -727,6 +736,7 @@ int write_mft_record_nolock(struct ntfs_inode *ni, struct mft_record *m, int syn
 	err = pre_write_mst_fixup((struct ntfs_record *)fixup_m, vol->mft_record_size);
 	if (err) {
 		ntfs_error(vol->sb, "Failed to apply mst fixups!");
+		err = -EFSCORRUPTED;
 		goto unmap_err_out;
 	}
 
@@ -813,8 +823,13 @@ int write_mft_record_nolock(struct ntfs_inode *ni, struct mft_record *m, int syn
 		mark_mft_record_dirty(ni);
 		if (!sync)
 			err = 0;
-	} else
-		NVolSetErrors(vol);
+	} else {
+		struct ntfs_inode *base_ni = ntfs_inode_base(ni);
+
+		mapping_set_error(folio->mapping, err);
+		ntfs_report_file_metadata_error(VFS_I(base_ni),
+						err);
+	}
 	return err;
 }
 
@@ -3180,7 +3195,7 @@ static int ntfs_map_mft_io_locked(struct ntfs_inode *ni, u64 folio_byte,
 
 	lockdep_assert_held(&ni->runlist.lock);
 	if (!ni->runlist.rl)
-		return -EIO;
+		return -EFSCORRUPTED;
 
 	vcn = ntfs_bytes_to_cluster(vol, file_ofs);
 	/*
@@ -3192,10 +3207,10 @@ static int ntfs_map_mft_io_locked(struct ntfs_inode *ni, u64 folio_byte,
 	if (lcn == LCN_RL_NOT_MAPPED)
 		return -EAGAIN;
 	if (lcn < 0)
-		return -EIO;
+		return -EFSCORRUPTED;
 	if (ntfs_bytes_to_cluster_off(vol, file_ofs) + unit->len >
 	    vol->cluster_size)
-		return -EIO;
+		return -EFSCORRUPTED;
 
 	unit->sector = ntfs_bytes_to_bio_sector(
 		NTFS_CLU_TO_B(vol, lcn) +
@@ -3286,7 +3301,7 @@ static void ntfs_mft_write_error(struct ntfs_volume *vol,
 				 struct address_space *mapping, int err)
 {
 	mapping_set_error(mapping, err);
-	NVolSetErrors(vol);
+	ntfs_report_file_metadata_error(mapping->host, err);
 	ntfs_error(vol->sb, "Error while writing MFT folio: %d", err);
 }
 
@@ -3390,8 +3405,10 @@ static int ntfs_write_mft_block(struct folio *folio, struct writeback_control *w
 	err = ntfs_prepare_mft_folio_units(ni, folio_byte, file_limit,
 					   record_selected, units, &nr_units,
 					   max_units, &defer);
-	if (err)
+	if (err) {
+		err = -EFSCORRUPTED;
 		goto out_noio;
+	}
 	if (!nr_units) {
 		if (defer)
 			goto out_noio;
@@ -3444,6 +3461,7 @@ static int ntfs_write_mft_block(struct folio *folio, struct writeback_control *w
 						ctx->error = -EIO;
 					redirty = true;
 					err = -EIO;
+					ntfs_mft_write_error(vol, mapping, err);
 					break;
 				}
 			}
-- 
2.51.0

