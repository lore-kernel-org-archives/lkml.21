Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795156472;
	b=iJnxj9ARhOJoNSQfVb0TcuxqWMsZFh5dQQwu/KgBGTsWvFLU7f2dgsA9u+71qlMRI3Pp
	 uQvu0ddBhP1XAdWHcMKaed2Ex4uST8JCj+9iUvKHVSAdBBpHXDhQMsOog/24lTRMrW806
	 9CTRKUFvmhGFUWJ/xTI6DMcSyFaCuR0QIksdBCRrwhODuzlF2FGz0DHfLgYCmFfv/1zmh
	 xRlfLDbjHhSYC9b9QEDqKj/h3v0ivZN5AKhED+BzXoNHDWWIW3HMno8kRv+DldXPBYyA4
	 0gTEj0vuVC0gnc2WV/d9zh0QUj4oL9EF0YTkCeH3uF7zzIQUvCxGMWidbqR3mRbdOOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795156472;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=l2nH2XTb5frL3IcF+3+XVhqdfkR4kPSpm/fGUJr6SFY=;
	b=s5aVWHreDCmSzMa4v7CYeR3+JZSGNbx0Y6rnK96lBHOrAX0XD6pOV+HeeRAI1Va4A6Vn
	 7qqpLP4wxEzIo2WBi+V1rQ5yXQpTzR+/BqjVUQgNqoRRbR6FAJ6DhiF70l37L8aFnYlDA
	 xtfFJI9aih2l2wrgiypDJS+snvc/yTUfgjRZebqv8DxcQ9FDzwBFBXD6ALnSi2VYZ+6r2
	 OD8N+zQWAxad6sSrtJtQyyEEbb5HqnH3UuC9UkxJMP2vSxEHTeX1PVbk5A0hcjIrikeID
	 5XKl52/KPh9oi7Efl6j1iQV10ype0w1R+5fnC/vqpXT4hgLTh6zzeiVNNj0S9L5XZ8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C0qrljRq;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2BF606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:34:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE2BF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C0qrljRq
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3712b6d9843so464763eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795156471; x=1795761271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l2nH2XTb5frL3IcF+3+XVhqdfkR4kPSpm/fGUJr6SFY=;
        b=C0qrljRqr6WB5mcG2FJbWz0ZpX9xYi9k13zz9r6fJw7gy4F+Ayk/9gAIFz9swn8N9A
         qDjZXXGtcj0FZFKkzL+1NzcNDsO5LoPqkgJ0oW7b1Bhgqc1wZKyOaIiQVvkFz+MCqQNJ
         vH4a6+2RxDKcRA9eM2kHGdplYeHgqCM4yXDrnSCaCTnV78oGu5Srgcp1amxaui2zAXdl
         r01hCXvD/Fl0Kja049jzB1A6rIlgG03lKD/dsY31annm+LRUDzeKvTburg+a15/l28+p
         oQv0XBoiQBQUv9GAeSAzesTFbCvR9lMwEhZI7UgVlpGkTPHz0SaBWUw7NdzHOQKRM1+S
         UHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795156471; x=1795761271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l2nH2XTb5frL3IcF+3+XVhqdfkR4kPSpm/fGUJr6SFY=;
        b=Af7t+1LXpYuUYDwPntnym0xB/ckLd5mTl3VoT3i7Al0FZS+6PztHLS1GJEi+wLIj+5
         8ErRfTFsfAnjuPIAMkojpuyIho8dhDy0RhPE3gP5KZZs/zHDhfB6sdIi4nwi6Nqf1QE7
         FYHSxs1IsA3JuGTTFeYUAk2dHunpRwjX+ka9Qrf90JJP9wYK/M2GC16SLYDk5GBp4zrv
         C23WmOltmLLll8icJpzbg2Tfj1LLwj+V/IjDdooe0TRhyQIsXPu6U6+IJlN4ZwYT08kt
         z8PToIim9Qw95l4DXVJO4x89awx72kvUootEJGhDHjsbqSnxke6dsxVEqeXuqEJSP5FU
         6YJg==
X-Forwarded-Encrypted: i=1; AL+hErE53YlOB/7EGnMtD1nVDNbjcrBMVysAF46uGGvPqAIr11a12PNGAo1sncOMlFTyRfRm97t+xzBZnWjtHhs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FQmnloeRal953OiMTQ2Q5Idt0G8I8ms4obIQoEoQV/wtFtwZS
	EcnWlU49zdH2e2wExLumOPF0PONj23CfvyaeReExjYf6M3zyKdD7JaqE
X-Gm-Gg: AZFdTZe38yDZOuzFEdboNzmA8nGeRGc2gpS5ysIWIci2Wc2VGfsCUw13flWxNCE7+Vf
	Qnl+ops1k9lK0DB7xiD6K1tMknpAq7h14ecM5DqJdcvz5tiqZnYgqdQVkkmCeTqVRIywlXPqO2f
	YfJ7N2zmY/vT7Mz3WgVE3cix3aVV8jp+sqk3ZkGS//XxBvH3Um69JwpNWtv40stUH/KfrdwMBCm
	9MDJIpMY2sKdgrv+bKSXKZddriVe2eGzVPebsldpX/zn8g97ytdoq+Zf/EQjUSQ0lD1qQasvjQc
	zcPOlpTwI+PFJFpt/yJOpPKJLNNTnk6e0/H9/sY93u8/LtrWKCZBA9aKLG90xznGAp0ghctCwpW
	a43+mlEa54TU0bgIY7rIQGWmkyZciWUfEt+6fO7NQ2SltFKwlbv6uqywJTLC5DxpwbOWqeTUwc5
	UdOIMbkzRxVcE2/FTTiVqQjDK26JqZK3wKd8yppHrQkHiIpzBRMvUDxYW/cHhEjlaWtm2rRIo5c
	Ds/6JQ7mkPx8YQx4j4ZFOUcb4ZHhpSwThJbr0Woc3hURTJGJUDVe0/O63RVUl3NlF0rmmnt2GHa
	kNFjyYSceMDiR5COlA8zpQPFMlM0FplawRY4YYnoFHA3jVcSAP8=
X-Received: by 2002:a05:7300:c01b:20b0:385:4b9:18ea with SMTP id 5a478bee46e88-38571027a68mr2036926eec.35.1795156470715;
        Thu, 19 Nov 2026 22:34:30 -0800 (PST)
Received: from annie-ProLiant-DL380-Gen11.. ([119.204.109.68])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm4821319eec.14.2026.11.19.22.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 22:34:30 -0800 (PST)
From: Annie Kim <pulpannie@gmail.com>
To: "Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>,
	Damien Le Moal <dlemoal@kernel.org>,
	virtualization@lists.linux.dev,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyokyung Kim <pulpannie@gmail.com>
Subject: [PATCH] virtio_blk: validate zone append sector from device
Date: Fri, 20 Nov 2026 15:30:39 +0900
Message-ID: <20261120063039.4155597-1-pulpannie@gmail.com>
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

The polling path may batch successful completions, so perform the same
validation before admitting a request to the batch. Invalid append
completions then fall back to the normal completion path and are
completed with an error instead of being reported as successful.

Fixes: 95bfec41bd3d ("virtio-blk: add support for zoned block devices")
Assisted-by: Codex:GPT-5
Signed-off-by: Hyokyung Kim <pulpannie@gmail.com>
---
Tested on v7.4-rc3+ using modified QEMU backend that returned incorrect
zone-append sectors on a memory-backed null_blk zoned device.

 drivers/block/virtio_blk.c | 50 +++++++++++++++++++++++++++++++-------
 1 file changed, 41 insertions(+), 9 deletions(-)

diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
index 2b462005c..8f88570b4 100644
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -331,15 +331,45 @@ static inline u8 virtblk_vbr_status(struct virtblk_req *vbr)
 	return *((u8 *)&vbr->in_hdr + vbr->in_hdr_len - 1);
 }
 
-static inline void virtblk_update_zone_append_sector(struct request *req,
-						     struct virtblk_req *vbr)
+#ifdef CONFIG_BLK_DEV_ZONED
+static inline blk_status_t
+virtblk_update_zone_append_sector(struct request *req,
+				  struct virtblk_req *vbr,
+				  blk_status_t status)
 {
 	struct virtio_blk *vblk = req->mq_hctx->queue->queuedata;
+	sector_t req_start, sector, zone_end;
+	unsigned int nr_sectors;
+
+	if (req_op(req) != REQ_OP_ZONE_APPEND || status != BLK_STS_OK)
+		return status;
+
+	req_start = blk_rq_pos(req);
+	sector = virtio64_to_cpu(vblk->vdev, vbr->in_hdr.zone_append.sector);
+	nr_sectors = blk_rq_sectors(req);
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
+	return status;
 }
+#else
+static inline blk_status_t
+virtblk_update_zone_append_sector(struct request *req,
+				  struct virtblk_req *vbr,
+				  blk_status_t status)
+{
+	return status;
+}
+#endif
 
 static inline void virtblk_request_done(struct request *req)
 {
@@ -349,7 +379,7 @@ static inline void virtblk_request_done(struct request *req)
 	virtblk_unmap_data(req, vbr);
 	virtblk_cleanup_cmd(req);
 
-	virtblk_update_zone_append_sector(req, vbr);
+	status = virtblk_update_zone_append_sector(req, vbr, status);
 
 	blk_mq_end_request(req, status);
 }
@@ -1242,7 +1272,6 @@ static void virtblk_complete_batch(struct io_comp_batch *iob)
 
 		virtblk_unmap_data(req, vbr);
 		virtblk_cleanup_cmd(req);
-		virtblk_update_zone_append_sector(req, vbr);
 	}
 	blk_mq_end_request_batch(iob);
 }
@@ -1260,11 +1289,14 @@ static int virtblk_poll(struct blk_mq_hw_ctx *hctx, struct io_comp_batch *iob)
 
 	while ((vbr = virtqueue_get_buf(vq->vq, &len)) != NULL) {
 		struct request *req = blk_mq_rq_from_pdu(vbr);
-		u8 status = virtblk_vbr_status(vbr);
+		blk_status_t status;
+
+		status = virtblk_result(virtblk_vbr_status(vbr));
+		status = virtblk_update_zone_append_sector(req, vbr, status);
 
 		found++;
 		if (!blk_mq_complete_request_remote(req) &&
-		    !blk_mq_add_to_batch(req, iob, status != VIRTIO_BLK_S_OK,
+		    !blk_mq_add_to_batch(req, iob, status != BLK_STS_OK,
 					 virtblk_complete_batch))
 			virtblk_request_done(req);
 	}
-- 
2.53.0

