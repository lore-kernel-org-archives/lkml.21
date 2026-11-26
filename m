Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795660544;
	b=Hr9t4wglzNPIG8l9Wp/JleMxkGyI2+NS14C+J2X1bN4XMeCbcZEm2GrirXGsMFvDyO7n
	 EUabRJUrvtssg8EQhZ3Mi5sHGuMihJOP2Drjho1tCe/GS0f+DT6YdOst5NIO1kGuM8OJ8
	 rNKxjUFThGuz8V1WCMy33cH9vUy2ClB1YpkmxCVKpqi+iw6z8ee9FKqFUP5XA3XCuNGvT
	 EQbboCtfZsy9v5SFvtN/2xEW6LmSUI7tszz6DlBqQ88yoHQSG7jW7neFefe6/ExiJSCVO
	 zAJ8uPMPOuSKjsGzWrOUc8pWQqO1Sx6sAOSm4SDC2oKIyTi7kXhLhw5grfJx9WVewzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795660544;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=c6GsLhHPsz7MggNwvAtHjw6vDwkQYlZStNNgVvITAvw=;
	b=isv64ZtztZzqxVIMTr+UzsHmoKfDnNqBi+4t3eXNekCh+By7lhbrpfB/xYYP/+VpmNsh
	 GywI7nVm9fMydyIxLChd35MA125L+VdxnEa9omt2v3P42SrIH0YgjgCAqJCgZ7GSzbaX0
	 F7Cmybvj2tuWa3wieC8pi+TBkHsXMOjyWtmVLn2mPeZWxmJvNCwHRZi3s50fQIpNDolWQ
	 314OQg4IETWtAQDbAvlpcgcxN9/0pbowbA2tPvOaV4b+CaquuF5502fCvJJuBQoZp1PeK
	 Gn0sQLf0EYHF641kD0e+ZPU8FS9GDWdhv1a05FYU0xnibtiOPkzYllVVpahQv0AmrSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=korea.io;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DDA606A334
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:35:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92DDA606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.io
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-38431138772so8469035eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:35:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795660544; x=1796265344;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c6GsLhHPsz7MggNwvAtHjw6vDwkQYlZStNNgVvITAvw=;
        b=xDxFjD+2SklNKO/oCHg0M4lQzLwZZJbLa0v73f4vGIswVROSPWgj+Dq3uvN6Ndqoee
         SxQeJXf2ZpSfrBVBrToFQuHlRe34f9+nFhqDrGo80K/QXX5ALsQKcThIkjgJlCQfelqf
         2Zif+zFwgpHaYqkPDixK2tMMqEqik65aaAuPc4sk9LbREdkDRCylRxtkTZ7MYVWyb9op
         zS+I6DcK+BZmM4olFRGQGJTpptSk4sgfzz2UVfzMuYeYdFKghqgJOpvhpEkgmGgSM5aa
         hlJag1CA+wcU9W5LSX39d7mlpR0dZ6hEavNVOToFIahugfwXO8+7w6CWA3w8QZMYh5EI
         jKtg==
X-Forwarded-Encrypted: i=1; AL+hErEb1LIFtMkn0r4Gne+LUgm+yiWVS+8IrT9s6tLGPK0pBjsFHlnk1/f6mufyKMnacszbu7eJFs328FjnL10=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WPMSZZUHthSnBHRdQS/1WoxqXpyBiEvJNDmKxNyDg6qMZ2WCQ
	Gnk8kU0lOylIPHpR6jHAYrjL68PwWmFIfk5XRXl5JaKY9T7kR4+mNpx/c5hWyF21EzFI
X-Gm-Gg: AZFdTZcYJRP/rVL3+WIRMt/M8LRYd1db5r79lUrP1xXvrN1HBi5u4gjbCZWzorFrW90
	i8WmS3SsM1eR8JNpzHPIKDBCFaahCkWNgReo7B7B9HNEjTtqyb0HVvl4Mr3gBfhKVHVUxoF4x5K
	ebkk4zhrpPWDzYZuqgvhjeKzp3rozkv38Q+c9Ds+3buD4Rru+0mqstTx5LJrDzyCrzQata+IQv2
	kSKw2o2FpvRqyneMBO9nenP9QPfohLYESdBJuOMkoa79pjIsOp7+gExDH1fiFAIQiJShdjiBXA5
	vMKRggLfMnvRHcAyirHXdJXysXD+BJRUrKmaL0/ZwbLCGp4aUKrFh/OIoGmZkpncBjI+R86YsvZ
	PmwYTPPFn0uzVSqz5mqMfqLpEU1U1mucvpAg4kHKUSrhhr5fXXzeJXgIPTQ42BvWfQXOq51pvzY
	1lVNSlXx11af11Y2Q68MxHJo5zqpdog+lfEZjaCYmbOyM69pRXCzCM31WbjsZA+d+YlsqhdNj58
	0CNOihM6Jz7ZEvDHuE+X76rO/uKUJkUOz3DW64S4Hr6YGmzWSnmGOQ0YEE66iRUF4t9cfnmVsWF
	Mjykx9v9ZZOTL5YDzAv8PGzTpSGgrcAfhKBncl1hmwksnfX3PA==
X-Received: by 2002:a05:7300:ce8f:b0:369:f035:661 with SMTP id 5a478bee46e88-38570450918mr16416084eec.15.1795660543302;
        Wed, 25 Nov 2026 18:35:43 -0800 (PST)
Received: from alanui-MacBookPro.local ([118.217.70.161])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b1965c02sm26703230eec.27.2026.11.25.18.35.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Nov 2026 18:35:42 -0800 (PST)
From: Jongwon Lee <ai@linux.com>
To: Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jic23@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>
Cc: Dan Williams <djbw@kernel.org>, Ira Weiny <iweiny@kernel.org>,
 Li Ming <ming.li@zohomail.com>, Richard Cheng <icheng@nvidia.com>,
 Ben Cheatham <benjamin.cheatham@amd.com>,
 Michal Schmidt <mschmidt@redhat.com>, linux-cxl@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 [PATCH v6 1/3] cxl/edac: Read cached DRAM event records under the xarray lock
Date: Thu, 26 Nov 2026 11:35:21 +0900
Message-ID: <20261126023520.39368-2-ai@linux.com>
In-Reply-To: <20261126023520.39368-1-ai@linux.com>
References: <20261126023520.39368-1-ai@linux.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

The event path caches DRAM event records in an xarray. It frees a record
when xa_store() replaces it, when the record expires, and when the cache
overflows. The event path runs with device_lock() and cxl_rwsem held for
read.

The repair path looks up records with cxl_find_rec_dram() while holding
only cxl_rwsem for read, so both paths can run at the same time.
cxl_find_rec_dram() reads the record after xa_load() returns, and
cxl_mem_perform_sparing() reads validity_flags from the returned record
again later. Both reads can hit a record that the event path has just
freed.

Move the lookup into __cxl_find_rec_dram(), which is called with the
xarray lock held. cxl_find_rec_dram() now returns whether a record
matched, and copies the matching record into a buffer passed in by the
caller. The PPR path only needs to know whether there is a match, so it
passes NULL. No caller keeps a pointer to the record after the lock is
dropped. The event path frees a record only after xa_store() or
xa_erase() has removed it from the xarray, and both of them take the
same lock.

Fixes: 0b5ccb0de1e2 ("cxl/edac: Support for finding memory operation attributes from the current boot")
Fixes: 588ca944c277 ("cxl/edac: Add CXL memory device memory sparing control feature")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-192042@kernel.org
Reviewed-by: Richard Cheng <icheng@nvidia.com>
Reviewed-by: Li Ming <ming.li@zohomail.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Reviewed-by: Alison Schofield <alison.schofield@intel.com>
Signed-off-by: Jongwon Lee <ai@linux.com>
---
 drivers/cxl/core/edac.c | 70 +++++++++++++++++++++++++++--------------
 1 file changed, 47 insertions(+), 23 deletions(-)

diff --git a/drivers/cxl/core/edac.c b/drivers/cxl/core/edac.c
index 56e50eea3994..bd217dccf119 100644
--- a/drivers/cxl/core/edac.c
+++ b/drivers/cxl/core/edac.c
@@ -945,18 +945,17 @@ cxl_find_rec_gen_media(struct cxl_memdev *cxlmd,
 	return NULL;
 }
 
+/* Caller holds the xarray lock. The record may be freed once it is dropped. */
 static struct cxl_event_dram *
-cxl_find_rec_dram(struct cxl_memdev *cxlmd,
-		  struct cxl_mem_repair_attrbs *attrbs)
+__cxl_find_rec_dram(struct xarray *rec_xarray,
+		    struct cxl_mem_repair_attrbs *attrbs)
 {
-	struct cxl_mem_err_rec *array_rec = cxlmd->err_rec_array;
 	struct cxl_event_dram *rec;
 	u16 validity_flags;
 
-	if (!array_rec)
-		return NULL;
+	lockdep_assert_held(&rec_xarray->xa_lock);
 
-	rec = xa_load(&array_rec->rec_dram, attrbs->dpa);
+	rec = xa_load(rec_xarray, attrbs->dpa);
 	if (!rec)
 		return NULL;
 
@@ -1036,6 +1035,30 @@ cxl_find_rec_dram(struct cxl_memdev *cxlmd,
 	return NULL;
 }
 
+/*
+ * cxl_store_rec_dram() replaces and frees records while the repair path only
+ * holds cxl_rwsem for read, so look the record up and read it under the
+ * xarray lock, and hand back a copy of the record.
+ */
+static bool cxl_find_rec_dram(struct cxl_memdev *cxlmd,
+			      struct cxl_mem_repair_attrbs *attrbs,
+			      struct cxl_event_dram *out)
+{
+	struct cxl_mem_err_rec *array_rec = cxlmd->err_rec_array;
+	struct cxl_event_dram *rec;
+
+	if (!array_rec)
+		return false;
+
+	xa_lock(&array_rec->rec_dram);
+	rec = __cxl_find_rec_dram(&array_rec->rec_dram, attrbs);
+	if (rec && out)
+		*out = *rec;
+	xa_unlock(&array_rec->rec_dram);
+
+	return rec;
+}
+
 #define CXL_MAX_STORAGE_DAYS 10
 #define CXL_MAX_STORAGE_TIME_SECS (CXL_MAX_STORAGE_DAYS * 24 * 60 * 60)
 
@@ -1305,9 +1328,9 @@ cxl_mem_sparing_get_attrbs(struct cxl_mem_sparing_context *cxl_sparing_ctx)
 	return 0;
 }
 
-static struct cxl_event_dram *
-cxl_mem_get_rec_dram(struct cxl_memdev *cxlmd,
-		     struct cxl_mem_sparing_context *ctx)
+static bool cxl_mem_get_rec_dram(struct cxl_memdev *cxlmd,
+				 struct cxl_mem_sparing_context *ctx,
+				 struct cxl_event_dram *rec)
 {
 	struct cxl_mem_repair_attrbs attrbs = { 0 };
 
@@ -1339,10 +1362,10 @@ cxl_mem_get_rec_dram(struct cxl_memdev *cxlmd,
 		attrbs.repair_type = CXL_RANK_SPARING;
 		break;
 	default:
-		return NULL;
+		return false;
 	}
 
-	return cxl_find_rec_dram(cxlmd, &attrbs);
+	return cxl_find_rec_dram(cxlmd, &attrbs, rec);
 }
 
 static int
@@ -1351,7 +1374,8 @@ cxl_mem_perform_sparing(struct device *dev,
 {
 	struct cxl_memdev *cxlmd = cxl_sparing_ctx->cxlmd;
 	struct cxl_memdev_sparing_in_payload sparing_pi;
-	struct cxl_event_dram *rec = NULL;
+	struct cxl_event_dram rec;
+	bool rec_found = false;
 	u16 validity_flags = 0;
 	int ret;
 
@@ -1369,11 +1393,14 @@ cxl_mem_perform_sparing(struct device *dev,
 			return -EBUSY;
 	} else {
 		if (cxl_is_memdev_memory_online(cxlmd)) {
-			rec = cxl_mem_get_rec_dram(cxlmd, cxl_sparing_ctx);
-			if (!rec)
+			rec_found = cxl_mem_get_rec_dram(cxlmd, cxl_sparing_ctx,
+							 &rec);
+			if (!rec_found)
 				return -EINVAL;
 
-			if (!get_unaligned_le16(rec->media_hdr.validity_flags))
+			validity_flags =
+				get_unaligned_le16(rec.media_hdr.validity_flags);
+			if (!validity_flags)
 				return -EINVAL;
 		}
 	}
@@ -1383,13 +1410,10 @@ cxl_mem_perform_sparing(struct device *dev,
 	if (cxl_sparing_ctx->persist_mode)
 		sparing_pi.flags |= CXL_SET_HARD_SPARING(1);
 
-	if (rec)
-		validity_flags = get_unaligned_le16(rec->media_hdr.validity_flags);
-
 	switch (cxl_sparing_ctx->repair_type) {
 	case EDAC_REPAIR_CACHELINE_SPARING:
 		sparing_pi.column = cpu_to_le16(cxl_sparing_ctx->column);
-		if (!rec || (validity_flags & CXL_DER_VALID_SUB_CHANNEL)) {
+		if (!rec_found || (validity_flags & CXL_DER_VALID_SUB_CHANNEL)) {
 			sparing_pi.flags |= CXL_SET_SPARING_SUB_CHNL_VALID(1);
 			sparing_pi.sub_channel = cxl_sparing_ctx->sub_channel;
 		}
@@ -1406,9 +1430,9 @@ cxl_mem_perform_sparing(struct device *dev,
 		fallthrough;
 	default:
 		sparing_pi.channel = cxl_sparing_ctx->channel;
-		if ((rec && (validity_flags & CXL_DER_VALID_NIBBLE)) ||
-		    (!rec && (!cxl_sparing_ctx->nibble_mask ||
-			     (cxl_sparing_ctx->nibble_mask & 0xFFFFFF)))) {
+		if ((rec_found && (validity_flags & CXL_DER_VALID_NIBBLE)) ||
+		    (!rec_found && (!cxl_sparing_ctx->nibble_mask ||
+				    (cxl_sparing_ctx->nibble_mask & 0xFFFFFF)))) {
 			sparing_pi.flags |= CXL_SET_SPARING_NIB_MASK_VALID(1);
 			put_unaligned_le24(cxl_sparing_ctx->nibble_mask,
 					   sparing_pi.nibble_mask);
@@ -1820,7 +1844,7 @@ static int cxl_mem_perform_ppr(struct cxl_ppr_context *cxl_ppr_ctx)
 			attrbs.repair_type = CXL_PPR;
 			attrbs.dpa = cxl_ppr_ctx->dpa;
 			attrbs.nibble_mask = cxl_ppr_ctx->nibble_mask;
-			if (!cxl_find_rec_dram(cxlmd, &attrbs) &&
+			if (!cxl_find_rec_dram(cxlmd, &attrbs, NULL) &&
 			    !cxl_find_rec_gen_media(cxlmd, &attrbs))
 				return -EINVAL;
 		}
-- 
2.55.0

