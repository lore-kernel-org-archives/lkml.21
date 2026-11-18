Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794975242;
	b=M5/99gOtUJIasFld2yeNC0u8kSFnggv41cjpVZA/h2H2WJn3GoaKYpcodgneTqrYQhn8
	 0Nz+2wAyveJICik+VMb3aahVD5ZLN3/Z8jdCB7zLVvjTZL4xwIAlGxbhmJZ6BnVy23d7Q
	 7wfOKgXPrOfzaRHtgSo8oI8J9fHbY3buNqb+68NXvO888DC5UYbdO4rvfW9MxU0/R4vje
	 n/6Dr2EDx4gM/HxBWifH4h72bCpSsMXng1PyDdtilWDcrxZ5HzRbSju7e3BZX6RX0W0mH
	 M73sQeoQOdIszSsNhcSgUAN+NrTigAySzmZCyKrFfCVOV1p9EOEfwYRJz2ASXwQjoxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794975242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1tGDjTxgOOQgjqUI4QLTxVZiaieo9oTy+UBHWYy4gNM=;
	b=b+cSA6s7sC3reatePaZl30AiTJwqpmA7wY0tCV7q0f7MjI5t8QtDs7MSh16Zmk9zltlb
	 xoXFsC1AaObQTWaChFfTCLKWsFG4ljyAX9eGjFOW6uojywpbDQ7w4yZnRdvP1EHNF/CqU
	 HbuiXroA1S3oj9KgX1UoCIZyQQ2QmNQNKqu05Mz+vTJ7YsQqynyisbSW6xCiZnO2gVcLm
	 sAJyfWdSSkScyy33NYtQ4jWWn5FKRVNzSf0GYFu7MrKW9abNgrZX7yiP9W1PQormhA0EC
	 wfBo7rDVDE5zsE9UmOC67JPZCiTbvRUUC/bwEVBX2RPYXJciGsC4udz/Zu4i5NOgWgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dwZrFfes;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633CA606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:14:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 633CA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dwZrFfes
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e977109392so3125425ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794975242; x=1795580042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1tGDjTxgOOQgjqUI4QLTxVZiaieo9oTy+UBHWYy4gNM=;
        b=dwZrFfescLuDyXqWVdT3f0QbKnWaUoxNOVfV4Tr58kL4+/kqtxPGF/NQ9gzn+bbQEO
         Qk7U+LEv4EiTBX/zvyZXtd3GU87PKyYURw8Q6+xehN0MYV58sDbxhGMbXw8rdOVJLgb+
         1iVpx+EmINmScwm0/mY/NAAbVQnoUHUjyIiAyYSKO8AGoCLwwuui1gh8dKL1WFdl/sUd
         vNCSn3PGagivZwYIcEJxx1JxTFvgjiygIxm0owT6kUUHR0vNdXfjLfKs6FqkZ4R+Va/Y
         63Aj0P0WygXlrHiA0p9bZRB62eIQXbIv+mkx7BcdaC6f/l66o450TSP3R8CI84z5XWIk
         HLGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975242; x=1795580042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1tGDjTxgOOQgjqUI4QLTxVZiaieo9oTy+UBHWYy4gNM=;
        b=e+nfYkPME/AgD5dC+pKMXXoZ0dd58fji8CvoNcPyUDyGan/CeQKkVuRRDNEtxM9R1F
         KgcniEJExik02RktHxGgvDimWtWiCtU3Fs2mJvzaRVLXw38/qJyDlp+0zw0M9qrI7m9v
         NndFKysoL23BvIDkchv+Wt81EvKWMd+I/0IWUMXmw+Lwa5UU/a0gW1blXkIILiwqpZKR
         vEGhRSAB4LIV9X8kLwDqI1R9Q6lDJiFCKz4cpze3DgEBqmRNOopGvFRMMkUvEVPOJoff
         Q7Hw8N/KsmP7s2fZYgzMyOV4JOOt1Cs2UMfNRCWlWSaG35UzmVFeIjWjlcEN9O60Mc/V
         l13A==
X-Forwarded-Encrypted: i=1; AL+hErFErJ592YsbIMo8X9168++/cyUrK0eKSE2qff5L53UOjtwQebe6r1Y/eDOpW2Et1HkCkGPaimfrVtvr4II=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ojWuQ8NIFf2Ehxiw3gRjAX6ZxNTX9djixIAcY2PqgiEmo9SzG
	gsMuF2+DsEccShZImK8NHFSrnrH4ypqZXJlcpi0c8ZMLjgAgZj5iJX2v
X-Gm-Gg: AZFdTZfZt32jkKWNzcabPt45FPNzr6j3BfiaTSsUIHxt87fMGkoCPG0Wqc8da4h3k3m
	fcOY3exSKdxu6wujKfh5w7m8y+HDc3fXuIjWtdO2vyuzLdWenMVMOyztyUOx4f2/wt/cnSZr9tS
	2CZdjc4uAot1hxtznGxLrbkVs/yDKof330rzxqn6GFRfYZc5gXk5tcAQg2+1yH9waCKaKMeZKT6
	VfjBjUh72r6BSm7H884RalXvAzImCt7rxC+mW2pMvilRQwYqfG3ZojJHC5sYc9GbheHYFNvPkNF
	SJGIC04u2atIVDD2HxOXb8OzCfIrPRlkO6j7R6pVez3YEC7sfqLvVEBJN7etvMTiix/UkPUO/49
	iQnAvzUlAMf0p11/0LY4lTyVbOC5hj5jTobZjtVPxHBvvtzyE8oH1BvztT7/l3lfTLOL+a5nZ0G
	IchIS4g6Pk+EFIEvLWthA2anuWBv8VTTcf4czle4QmVWNpbDhiSYPlw+qSfJkfam43reDqedW2e
	EFn8fZp07bLP+ez4UL4/seoGFj0s8mQzsFD9+lhwkT5STYztllVf2LA/zW7K6m+kBeJFv27q2FI
	WRXKlW0euyRAVK5SlTMIiA4=
X-Received: by 2002:a17:903:2345:b0:2e9:5714:6079 with SMTP id d9443c01a7336-2eff754e83bmr14304455ad.31.1794975241606;
        Tue, 17 Nov 2026 20:14:01 -0800 (PST)
Received: from gmail.com ([2407:cdc0:d002:0:188:253:12:32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6214f4dsm5728685ad.43.2026.11.17.20.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:14:01 -0800 (PST)
From: Jia Jia <physicalmtea@gmail.com>
To: "Martin K . Petersen" <mkp@kernel.org>,
	Jan Engelhardt <jengelh@inai.de>,
	Hannes Reinecke <hare@suse.de>,
	James Bottomley <James.Bottomley@suse.de>,
	Akinobu Mita <akinobu.mita@gmail.com>
Cc: linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jia Jia <physicalmtea@gmail.com>
Subject: [PATCH v2 1/8] scsi: target: take COMPARE AND WRITE data from the write half
Date: Wed, 18 Nov 2026 12:13:04 +0800
Message-Id: <20261118041311.19011-2-physicalmtea@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118041311.19011-1-physicalmtea@gmail.com>
References: <20261118041311.19011-1-physicalmtea@gmail.com>
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

For block sizes smaller than a page, compare_and_write_callback() adds
block_size to the first data sg's offset to locate the write half.
This assumes that both halves fit in that sg. If the compare buffer
ends at a page boundary, the write entry points past the page even
though the write data is available in the following sg.

vhost-scsi splits guest buffers into sg entries that each stay within
one page, so the backend can read beyond the supplied data.

Skip the compare bytes across the data sgs and build a table covering
the write half. Pass its actual entry count to the backend and release
it with sg_free_table(), including any chained allocations.

KASAN reports:

  BUG: KASAN: slab-use-after-free in copy_folio_from_iter_atomic
  Read of size 512

  compare_and_write_callback
  __target_execute_cmd
  sbc_execute_rw
  fd_execute_rw
  fd_do_rw
  vfs_iter_write
  copy_folio_from_iter_atomic

Fixes: d94e5a61357a ("target: fix COMPARE_AND_WRITE non zero SGL offset data corruption")
Signed-off-by: Jia Jia <physicalmtea@gmail.com>
---
 drivers/target/target_core_sbc.c       | 100 +++++++++++++++++--------
 drivers/target/target_core_transport.c |  11 ++-
 2 files changed, 80 insertions(+), 31 deletions(-)

diff --git a/drivers/target/target_core_sbc.c b/drivers/target/target_core_sbc.c
index 21f5cb86d70c0..adef903652ac2 100644
--- a/drivers/target/target_core_sbc.c
+++ b/drivers/target/target_core_sbc.c
@@ -433,19 +433,74 @@ out:
 	return ret;
 }
 
+/*
+ * Data-out is compare bytes followed by write bytes.  Take the write
+ * half from whatever sg entries hold it.  Do not add block_size onto
+ * the first sg offset: that page may end before the write half.
+ */
+static int sbc_caw_build_write_sg(struct sg_table *tbl,
+				  struct scatterlist *data_sg,
+				  unsigned int data_nents, unsigned int skip,
+				  unsigned int len)
+{
+	struct scatterlist *sg, *out;
+	unsigned int nents = 0, left = len, left_skip = skip;
+	unsigned int avail, chunk;
+	int i;
+
+	for_each_sg(data_sg, sg, data_nents, i) {
+		if (!sg->length)
+			continue;
+		if (!left)
+			break;
+		if (left_skip >= sg->length) {
+			left_skip -= sg->length;
+			continue;
+		}
+		avail = sg->length - left_skip;
+		chunk = min(left, avail);
+		nents++;
+		left -= chunk;
+		left_skip = 0;
+	}
+	if (!nents || left)
+		return -EINVAL;
+
+	if (sg_alloc_table(tbl, nents, GFP_KERNEL))
+		return -ENOMEM;
+
+	left = len;
+	left_skip = skip;
+	out = tbl->sgl;
+	for_each_sg(data_sg, sg, data_nents, i) {
+		if (!sg->length)
+			continue;
+		if (!left)
+			break;
+		if (left_skip >= sg->length) {
+			left_skip -= sg->length;
+			continue;
+		}
+		avail = sg->length - left_skip;
+		chunk = min(left, avail);
+		sg_set_page(out, sg_page(sg), chunk, sg->offset + left_skip);
+		left -= chunk;
+		left_skip = 0;
+		out = sg_next(out);
+	}
+	return 0;
+}
+
 static sense_reason_t compare_and_write_callback(struct se_cmd *cmd, bool success,
 						 int *post_ret)
 {
 	struct se_device *dev = cmd->se_dev;
 	struct sg_table write_tbl = { };
 	struct scatterlist *write_sg;
-	struct sg_mapping_iter m;
-	unsigned int len;
-	unsigned int block_size = dev->dev_attrib.block_size;
-	unsigned int compare_len = (cmd->t_task_nolb * block_size);
+	unsigned int compare_len = (cmd->t_task_nolb * dev->dev_attrib.block_size);
 	unsigned int miscmp_off = 0;
 	sense_reason_t ret = TCM_NO_SENSE;
-	int i;
+	int rc;
 
 	if (!success) {
 		/*
@@ -499,34 +554,19 @@ static sense_reason_t compare_and_write_callback(struct se_cmd *cmd, bool succes
 	} else if (ret)
 		goto out;
 
-	if (sg_alloc_table(&write_tbl, cmd->t_data_nents, GFP_KERNEL) < 0) {
-		pr_err("Unable to allocate compare_and_write sg\n");
-		ret = TCM_OUT_OF_RESOURCES;
+	rc = sbc_caw_build_write_sg(&write_tbl, cmd->t_data_sg,
+				    cmd->t_data_nents, compare_len,
+				    compare_len);
+	if (rc) {
+		pr_err("Unable to build compare_and_write sg\n");
+		if (rc == -ENOMEM)
+			ret = TCM_OUT_OF_RESOURCES;
+		else
+			ret = TCM_LOGICAL_UNIT_COMMUNICATION_FAILURE;
 		goto out;
 	}
 	write_sg = write_tbl.sgl;
 
-	i = 0;
-	len = compare_len;
-	sg_miter_start(&m, cmd->t_data_sg, cmd->t_data_nents, SG_MITER_TO_SG);
-	/*
-	 * Currently assumes NoLB=1 and SGLs are PAGE_SIZE..
-	 */
-	while (len) {
-		sg_miter_next(&m);
-
-		if (block_size < PAGE_SIZE) {
-			sg_set_page(&write_sg[i], m.page, block_size,
-				    m.piter.sg->offset + block_size);
-		} else {
-			sg_miter_next(&m);
-			sg_set_page(&write_sg[i], m.page, block_size,
-				    m.piter.sg->offset);
-		}
-		len -= block_size;
-		i++;
-	}
-	sg_miter_stop(&m);
 	/*
 	 * Save the original SGL + nents values before updating to new
 	 * assignments, to be released in transport_free_pages() ->
@@ -535,7 +575,7 @@ static sense_reason_t compare_and_write_callback(struct se_cmd *cmd, bool succes
 	cmd->t_data_sg_orig = cmd->t_data_sg;
 	cmd->t_data_sg = write_sg;
 	cmd->t_data_nents_orig = cmd->t_data_nents;
-	cmd->t_data_nents = 1;
+	cmd->t_data_nents = write_tbl.nents;
 
 	cmd->sam_task_attr = TCM_HEAD_TAG;
 	cmd->transport_complete_callback = compare_and_write_post;
diff --git a/drivers/target/target_core_transport.c b/drivers/target/target_core_transport.c
index dcfe945949167..3cae5ed67d417 100644
--- a/drivers/target/target_core_transport.c
+++ b/drivers/target/target_core_transport.c
@@ -22,6 +22,7 @@
 #include <linux/module.h>
 #include <linux/ratelimit.h>
 #include <linux/vmalloc.h>
+#include <linux/scatterlist.h>
 #include <linux/unaligned.h>
 #include <net/sock.h>
 #include <net/tcp.h>
@@ -2724,10 +2725,18 @@ static inline void transport_reset_sgl_orig(struct se_cmd *cmd)
 	 * Check for saved t_data_sg that may be used for COMPARE_AND_WRITE
 	 * emulation, and free + reset pointers if necessary..
 	 */
+	struct sg_table table = { };
+
 	if (!cmd->t_data_sg_orig)
 		return;
 
-	kfree(cmd->t_data_sg);
+	/*
+	 * compare_and_write_callback() built this with sg_alloc_table().
+	 * Above SG_MAX_SINGLE_ALLOC the tail is a separate allocation.
+	 */
+	table.sgl = cmd->t_data_sg;
+	table.orig_nents = cmd->t_data_nents;
+	sg_free_table(&table);
 	cmd->t_data_sg = cmd->t_data_sg_orig;
 	cmd->t_data_sg_orig = NULL;
 	cmd->t_data_nents = cmd->t_data_nents_orig;
