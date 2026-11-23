Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795423630;
	b=XguA5zhqcI+E9UWdGABAzF+VH2045h0gG+UULnMRv2mnRtBdqr9+xapo6NO+/1YNkkNU
	 7cL2vS/fW7YzhQW8mdWiPTJIkGfqe0MKSYUD1UQ0dPwZ5CBplHJdlmErUSmj3aGQbSXHb
	 LC6Elm2kjSgLsxKum6hWB57j9sLg5EgPZYXWkZ/ShZEFbcD/LH0g9dIIiUf3x6hukPFiV
	 gQh7aZrXZuWeg6jD81auamFPXquMWuiPDVdAcSLGobcPGGTjD0w8tbiYQLzKZEXYGVugX
	 d5u9R9ZzF7NH1rtRtLYVZwcsJg+e+sr7/EKWcYjYscABmvmmVMTPSd6Q1j4L/5I+2sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795423630;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6TuXSWDdixhSOXgwiZNhSVNfQgsPxpgQ0Wl0SXXvDBk=;
	b=1ebIjzfwT6/dkNGD/iwRXUKQv9RzIpOPYiP1kARDPE9WSLPUCXlQy0by0f2JDBQ4y3Gd
	 FCBMbd5H8lNdg84hAIwUoM6gSB9LKFxQS4jSn4e6NfTA2x/nLh44r+5Vcfn2PQhnxIbaf
	 EFpEhwx/E3X0OMjCzvDeL0NvRPxD2koc3X3TgtnfjpvwoxMwYQpOxsGMo07ifuZcuyeM+
	 O7uZ90DcAkNqYg5JizwzREsrbAkvrI547pGELaKUozJVRHVB0TptDTchomgSy+o26Vp1O
	 AbjAizoyuDKgTmVcSbEfkdzdGwt1RQm+IHX0z3dcwpW3t6TOzmfzuYfQTW7wA3PYTwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="USn5/FiM";
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFCC606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:47:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CFCC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=USn5/FiM
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-38587f3de36so3674097eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 00:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795423629; x=1796028429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6TuXSWDdixhSOXgwiZNhSVNfQgsPxpgQ0Wl0SXXvDBk=;
        b=USn5/FiMiXtfonckmifWNZaUXgbtRUUj0WWQIefud08911IOpuM4pYR2XBCRPrKz8B
         a6cNRdaVPG2aNb5wEGCYWUfZbUtrDuC7nS2mP5LHKSZ+sgI+k4ZsQFxFK7hc1L/aIalD
         pOcVcYvZ0gGsGXYpiH5ZlaT272vEqzYEaobIcLPdIDVDhEzkcVR7V/6pFuuiBWd/er+B
         ls2T/whCK7JU/QydAPtlcYtC+ybcPjHjW+k8E2RHsw7Xxile1On2NajZCPr8MhNa9gfb
         6gtniwBsy7C/Ppl+XFnHfLlyVkgNJLQwWXdmYn94xwNt/nDRNmDuPseMdLYrCQBH5c37
         HsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795423629; x=1796028429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6TuXSWDdixhSOXgwiZNhSVNfQgsPxpgQ0Wl0SXXvDBk=;
        b=wM1Vb6b37lLuCBMUDaSxL+Dahh29Ys2sSTKMfUkMVcajGk43P8MqQPyN4RqPLzVPup
         Z4MeTrnFaVw1KBJeLcrUq3eFuaEqQ7QA6d/KzquRj49fGslNlFS7DHxTu2CFVtMlpdIP
         5GZZzy0SaaS25HhHbv2IJWJqH9utm1OlNbwBkkcoHfAxlXYiVCKz2y8VjZgTMjd3WIlC
         Wmj3aOXXTvIQgFWE8cYR+MGLyj/cD1Imhe4P6yzB8NZ7j3Cj1nmKE+6B0OPPyLXS4x23
         UCCAe+aUyXt4US8jvxv8etqyNIVUCS8GnKoIUoKencZu16vj3oDZmggLkaD3ut5D9Vm1
         RNtA==
X-Forwarded-Encrypted: i=1; AL+hErGwcasIMIDEQBYWRSJWpjr4XaBbX/orDNil01PiBYZUSBtsL3adARttg4eHEBXIM1wUImP5tXFEVhTsmdw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nnCHPAaPEVtVygQHAO+XQQx/EVOLNt42qzNdHNAhcTvlQVuho
	i1eOAFXuufXmEZO02XYOGDdpDLktsRoQ4eaiVSBEZ/MTA+5xs8eBkneU
X-Gm-Gg: AZFdTZfQt/Sjs2xk6YG1BAViQxftUd1STURH/hTGQ9ldPccB9uO5HPuzjB9Kv7O8qEr
	QcoIDQVl0RBOpcTAE0H9IRYOPbSVZmQ9CvdBwjdJFX9kcKZpDK8wv9ASeSZ73t27EGo6SlUkIzt
	B4O/IrQ0q+6n1/68YHE8nQE4MexZ4SVGx4Sl1737iZ1VOw9mGKNXjZ6iLDt74kvcj/eCS65Rp9N
	UAjDW1Jsn0fmSn6i+xZzcaXG6qpDS5xWVjjtlh+2LBNvI6KhwhkQ0wYw95DQBhupGhhMBCUXc4h
	mu89fMkCIMBAXMJV+svhCUZ5YMCwl3HLu0xQLye8xaVVeQpGZraydKVWsyWP1fAidBDXIxYaa3Z
	B6K9w2h6fy9a9DBx/bOus4CAq6KkwomR5BUeHFQ+xYEnVtDd35WQ1QwtxUD6XBy8cGe3c1V/ohy
	hODXofgkaE3ztfOiyQyD4Vc4PaNv/QZHc0fj/8uui6M7AQ1veW4jFQTFUfecmiu+sCV3WeK7bqG
	5BEicyedWboHAGUOfq1muNnsTBTv3XJAICu5EZ3E5bVIwCm/I3OT0om7lpulIFXeNSVl9jhb9DR
	hXrZ2iA1r8bbmdMGh7JgqFEyVI/qetgPpM2L1RrJm0nWOXzK9lT3XNdfjaz6JV220eBm49c=
X-Received: by 2002:a05:7301:6187:10b0:386:a193:7eeb with SMTP id 5a478bee46e88-386a1938b8dmr5853810eec.30.1795423629042;
        Mon, 23 Nov 2026 00:47:09 -0800 (PST)
Received: from annie-ProLiant-DL380-Gen11.. ([119.204.109.68])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm36040839eec.6.2026.11.23.00.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 00:47:08 -0800 (PST)
From: Annie Kim <pulpannie@gmail.com>
To: "Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>
Cc: Hyokyung Kim <pulpannie@gmail.com>,
	Jens Axboe <axboe@kernel.dk>,
	Damien Le Moal <dlemoal@kernel.org>,
	virtualization@lists.linux.dev,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] virtio_blk: validate zone append sector from device
Date: Mon, 23 Nov 2026 17:46:59 +0900
Message-ID: <20261123084701.2616027-1-pulpannie@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Hyokyung Kim <pulpannie@gmail.com>

The device reports the starting sector for REQ_OP_ZONE_APPEND completions,
and virtio_blk copies it into req->__sector without checking that it
still refers to the requested zone. A buggy or malicious device can
therefore make upper layers believe the append landed at an arbitrary
location.

Validate successful zone append completions before updating
req->__sector. The returned sector must not precede the request start
and the entire request must fit within the zone writable capacity.
Reject invalid completions with BLK_STS_IOERR.

The polling path may batch successful completions, and a batch can only
be completed as successful. Perform the same validation in
virtblk_poll() before admitting a request to the batch, so that invalid
zone append completions are not batched and are completed with an error
instead. Move the request completion into __virtblk_request_done(),
which takes the status from its caller, so that a polled completion that
is not batched is not validated a second time.

Fixes: 95bfec41bd3d ("virtio-blk: add support for zoned block devices")
Signed-off-by: Hyokyung Kim <pulpannie@gmail.com>
---
Damien, thank you so much for the thoughtful review of v1. As a beginner
contributor I learned a lot from your comments :).

Changes in v2:
- Check the request op and status in the callers and drop the status
  argument of virtblk_update_zone_append_sector() (Damien). The function
  still returns blk_status_t, since the callers need to fail the request
  when the reported sector is invalid.
- Initialize req_start and nr_sectors at declaration (Damien)
- Drop the Assisted-by tag (Damien)
- Fix the sector being validated twice for polled requests that were not
  batched (Sashiko). virtblk_poll() now completes those requests through
  __virtblk_request_done(), which does not validate again.
- Link to v1: https://lore.kernel.org/lkml/20261120063039.4155597-1-pulpannie@gmail.com/

Tested on v7.4-rc3+ using modified QEMU backend that returned incorrect
zone-append sectors on a memory-backed null_blk zoned device.

 drivers/block/virtio_blk.c | 63 +++++++++++++++++++++++++++++---------
 1 file changed, 49 insertions(+), 14 deletions(-)

diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
index 2b462005cdb6..547291c3ab99 100644
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -331,29 +331,60 @@ static inline u8 virtblk_vbr_status(struct virtblk_req *vbr)
 	return *((u8 *)&vbr->in_hdr + vbr->in_hdr_len - 1);
 }
 
-static inline void virtblk_update_zone_append_sector(struct request *req,
-						     struct virtblk_req *vbr)
+#ifdef CONFIG_BLK_DEV_ZONED
+static inline blk_status_t
+virtblk_update_zone_append_sector(struct request *req, struct virtblk_req *vbr)
 {
 	struct virtio_blk *vblk = req->mq_hctx->queue->queuedata;
+	sector_t req_start = blk_rq_pos(req);
+	unsigned int nr_sectors = blk_rq_sectors(req);
+	sector_t sector, zone_end;
+
+	sector = virtio64_to_cpu(vblk->vdev, vbr->in_hdr.zone_append.sector);
+	zone_end = req_start + disk_zone_capacity(vblk->disk, req_start);
+
+	if (zone_end < req_start || sector < req_start || sector >= zone_end ||
+	    nr_sectors > zone_end - sector) {
+		dev_err_ratelimited(&vblk->vdev->dev,
+				    "zone append sector %llu + %u outside valid range [%llu, %llu)\n",
+				    (u64)sector, nr_sectors,
+				    (u64)req_start, (u64)zone_end);
+		return BLK_STS_IOERR;
+	}
 
-	if (req_op(req) == REQ_OP_ZONE_APPEND)
-		req->__sector = virtio64_to_cpu(vblk->vdev,
-						vbr->in_hdr.zone_append.sector);
+	req->__sector = sector;
+	return BLK_STS_OK;
+}
+#else
+static inline blk_status_t
+virtblk_update_zone_append_sector(struct request *req, struct virtblk_req *vbr)
+{
+	return BLK_STS_OK;
 }
+#endif
 
-static inline void virtblk_request_done(struct request *req)
+static inline void __virtblk_request_done(struct request *req,
+					  blk_status_t status)
 {
 	struct virtblk_req *vbr = blk_mq_rq_to_pdu(req);
-	blk_status_t status = virtblk_result(virtblk_vbr_status(vbr));
 
 	virtblk_unmap_data(req, vbr);
 	virtblk_cleanup_cmd(req);
 
-	virtblk_update_zone_append_sector(req, vbr);
-
 	blk_mq_end_request(req, status);
 }
 
+static inline void virtblk_request_done(struct request *req)
+{
+	struct virtblk_req *vbr = blk_mq_rq_to_pdu(req);
+	blk_status_t status = virtblk_result(virtblk_vbr_status(vbr));
+
+	if (req_op(req) == REQ_OP_ZONE_APPEND && status == BLK_STS_OK)
+		status = virtblk_update_zone_append_sector(req, vbr);
+
+	__virtblk_request_done(req, status);
+}
+
 static void virtblk_done(struct virtqueue *vq)
 {
 	struct virtio_blk *vblk = vq->vdev->priv;
@@ -1242,7 +1273,6 @@ static void virtblk_complete_batch(struct io_comp_batch *iob)
 
 		virtblk_unmap_data(req, vbr);
 		virtblk_cleanup_cmd(req);
-		virtblk_update_zone_append_sector(req, vbr);
 	}
 	blk_mq_end_request_batch(iob);
 }
@@ -1260,13 +1290,18 @@ static int virtblk_poll(struct blk_mq_hw_ctx *hctx, struct io_comp_batch *iob)
 
 	while ((vbr = virtqueue_get_buf(vq->vq, &len)) != NULL) {
 		struct request *req = blk_mq_rq_from_pdu(vbr);
-		u8 status = virtblk_vbr_status(vbr);
+		blk_status_t status = virtblk_result(virtblk_vbr_status(vbr));
 
 		found++;
-		if (!blk_mq_complete_request_remote(req) &&
-		    !blk_mq_add_to_batch(req, iob, status != VIRTIO_BLK_S_OK,
+		if (blk_mq_complete_request_remote(req))
+			continue;
+
+		if (req_op(req) == REQ_OP_ZONE_APPEND && status == BLK_STS_OK)
+			status = virtblk_update_zone_append_sector(req, vbr);
+
+		if (!blk_mq_add_to_batch(req, iob, status != BLK_STS_OK,
 					 virtblk_complete_batch))
-			virtblk_request_done(req);
+			__virtblk_request_done(req, status);
 	}
 
 	if (found)
-- 
2.43.0

