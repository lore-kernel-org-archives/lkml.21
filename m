Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092121;
	b=q7YL4EVy74LEeyrXTabVVj0nBOqF8JdVukMJCGNWIF/Tq5oSUZ/j1FPQ7hKqTHuseMod
	 D5JWofJopAaREmeJfxLsaYNDIwqeTLag1ScLuMDZo/jGrewLopPoSjwEDNDo6FiE3apdG
	 6RXf2zrI7Yslf/rer8m91M78uBHvrH5nrlVsy6OyyNc4y+a0stpIsnAM8e+xqVNUYnH3X
	 epoAge5oE2YqoI1TM/z6oaLBO2ov/c5NZ3fyexToCTuWXiSP0JNAptM2Dg1chMqx7a3Mz
	 BFisF/QZ92mS62JPrd0LOhojnkcY1DppnP0FjP2ZFpdDp65KO5s9QMHMyn0j7arKCsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mOE3Rbuw9z95CS+e89nm2qahBlkxcAeUx3ho/7BXMuo=;
	b=kiyeOrL2xdb4smYkeH6qaE9FSRd3fQJVkgZQHEUZiMIMVlfX32rltfJ1PnmfBW+Kx3yl
	 S+rLVcvDRyFmpYC+qhZ6p8cUCmjHZ8LzUAdEPogPLopNEVoYMvkn/XRk+Fixgy/yVpPBV
	 hqG4DKzsiB3PRbGuBf0wi0U1Xg8aaViG0NWDpHCEQO80yo+lEEiGOxboTyISbXIo7TF2T
	 6J04mq66GHQlvqyvZ+0raWkYzIcRoB72dBmyO0zb5A4WnVu9xOGxQFJ0W73GuPUj8GfVK
	 plyfor3pOwIsIqgyVe63p0Xc9HDqUlGJsMHUPf5kI9+5MDochlf0HdjV8Zf9nudKV3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=Y+hvqyrA;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6C4606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B6C4606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=Y+hvqyrA
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-49412eb1474so1356641f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1795092118; x=1795696918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mOE3Rbuw9z95CS+e89nm2qahBlkxcAeUx3ho/7BXMuo=;
        b=Y+hvqyrAvGs1ec1QqlTmDLvfzSnWLZKXPNuQfzHstZzH6CQDJajImBeCM9q8kNfhlC
         mMAu4BmEHpD0TWRgFv0ncKdEXUrid59k9CHQPoHAMYq9YUV1cDOgePkSgyZT3CWwo8mc
         zb315Ys+BB30Y9yA9VQwZiroXOyIPodeVJ4YXiN1Mxs9HizQO9omoJIqcaK66mYpkH3b
         7ClQZBJRXaMrhdPPhMO8lizh0XGQEGU5arOWoQo8pvyFM6INoa4ENeB+tAj8m1VS0C0p
         xB5rgeun8fSdPb49E6voZgYy/s8YPz9GYSlN6SoxpO61zrNHQzMsX96yraVB55dIPoRN
         N78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795092118; x=1795696918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mOE3Rbuw9z95CS+e89nm2qahBlkxcAeUx3ho/7BXMuo=;
        b=clUIm49PShKLFzAf+lm68dJJ7VWAB263K0uEPmIrtdWmnxkZoNql9oPRgw6vyYItWP
         nHCkyNrHFPLHmWne1zQ8YvG0vXmOdCvYl+3+s/GxGs/BlWRJ28xqlbfw+fRWXw6oi18D
         z2vPxPn8DjbVR6ZCU2uGjZG0+jQGfmQZ7JDeODS0cIByfYPUqAbqoXjhR7N6T6fj3Biq
         Z8WF8MZu0wmfVW5mCK851nxK4VKssvKvOgsMPLq1oYOxGwhE1tZJSs0bHyb0tDNuXb+h
         h/eLy6GWNF65n0ERzXj7lIaQDFvUY5TKHsQpRbBCrdfHmt1HqXKvU97ayF4Nhxaj/VLQ
         u4Kg==
X-Forwarded-Encrypted: i=1; AL+hErF91C8rMOccjMPgq3JpnPBXmjXO1IsM9ub7zesqdbDpAx2gtzfBcL5UFQhNqopAGBx8h/0WdwlrL87T7/k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8M1UbU9WzimrpVcAGAcT4hw1NKfYh1qvYPYuJ+dxr6gVcgcNwA
	YzS2967AE00IkGZgpWW91HKHTf63uaqTlD4SsW5HirXoU3Lz0y+JjGzJoyUdrdKXd10=
X-Gm-Gg: AZFdTZcXk3BEIfvcLIZg3YH8Shcdr9LBYFI6+vDVTFTJKS2kDncm67zBjHyClZefo4H
	9cSXYyqSP84drRQsvjVpaRcKddfUZJ+q8BiupqjU+6LBD15TIZxqW4Aob46UCRPGWPYRhle5puW
	lJODAlQ8x3uxR8ogSN34nLFHc2+tnUnZUANROeyotEGNKFBT1Ys53D/EuCYLFrEX7KctJQMwyc+
	f2Cujj3kVqougVGu+QnJCmw0TtUQXNBFX8Iz9IzWuwwKvABeVhMaVcUFL6llJ96EDtWys4qbFFu
	zCzEC7Axk3elUH11mUBBQvnU6ACxuYTmVzc+YbuPePIBP1gsQdg6JbeUYMIphWznQa4Y0MtsssI
	QKY+Wn/mbB7MeTKyBva+aMdZdX80SZwWCwplfC9LkrakPM1tozkRa+nyG5BQBgBBd9sYa6CJhz9
	L1sf3QhBewpAe0FjBjg0IQy0bpOL+T2OW5r8vImFHC4LXoiUrcNKEvmxF4SUsg8QjH6A/fcr6R0
	zCyP4a+RDA8YcN9DuIJBG575Al3aVeGtlIZ8Jytw7CS9rwiuQpSEp8QWxbQWq5mLmOifg4kfMqO
	443mgYfIGGEHN4wQ5vm1Axt9
X-Received: by 2002:a05:6000:25c6:b0:49d:7e8c:e89c with SMTP id ffacd0b85a97d-4a63d985dc9mr11927185f8f.42.1795092118533;
        Thu, 19 Nov 2026 04:41:58 -0800 (PST)
Received: from dev1.kernelcare.com ([2a01:4f8:172:1c85::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656a28b8esm10787266f8f.50.2026.11.19.04.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:41:58 -0800 (PST)
From: Andrey Misiurov <amisiurov@cloudlinux.com>
To: Jason Gunthorpe <jgg@nvidia.com>,
	Leon Romanovsky <leonro@nvidia.com>
Cc: linux-rdma@vger.kernel.org,
	Quanye Yang <quanyeyang@proton.me>,
	linux-kernel@vger.kernel.org,
	Andrey Misiurov <amisiurov@cloudlinux.com>,
	stable@vger.kernel.org
Subject: [PATCH] RDMA/ucma: reject a second join of the same multicast address
Date: Thu, 19 Nov 2026 13:41:53 +0100
Message-ID: <20261119124153.1745521-1-amisiurov@cloudlinux.com>
X-Mailer: git-send-email 2.43.7
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

ucma_process_join() lets one cm_id join the same multicast address twice,
creating two ucma_multicast objects (A and B) and, via
rdma_join_multicast(), two cma_multicast entries that both point back at
the ucma object.

rdma_leave_multicast() matches a leave only by sockaddr and destroys the
first entry it finds. So LEAVE_MCAST on A destroys B's cma_multicast and
frees ucma object A, while A's cma_multicast stays on the list with a
context pointing at freed memory. The next event for it is a use-after-free:

  BUG: KASAN: slab-use-after-free in ucma_create_uevent+0xb11/0xb70 [rdma_ucm]
  Workqueue: rdma_cm cma_iboe_join_work_handler [rdma_cm]
  Call Trace:
   ucma_create_uevent+0xb11/0xb70 [rdma_ucm]
   ucma_event_handler+0xd5/0xa10 [rdma_ucm]
   cma_cm_event_handler+0x98/0x310 [rdma_cm]
   cma_iboe_join_work_handler+0xac/0x170 [rdma_cm]
   process_scheduled_works+0xb59/0x1890
   worker_thread+0x470/0xe40
   kthread+0x33a/0x450
   ret_from_fork+0x59/0x90
   ret_from_fork_asm+0x1a/0x30

Any user with access to /dev/infiniband/rdma_cm can trigger it.

Reject a second join of an address already joined on the same cm_id. The
incomplete fix 662ade4de9ff ("RDMA/ucma: Serialize join and leave on
copy_to_user failure") left this path open.

Fixes: 662ade4de9ff ("RDMA/ucma: Serialize join and leave on copy_to_user failure")
Cc: stable@vger.kernel.org
Signed-off-by: Andrey Misiurov <amisiurov@cloudlinux.com>
---
Found during a backport review.

Reproduced on debian13 6.12.88 debug (KASAN=y) over Soft-RoCE: two joins of
one address on a cm_id, then LEAVE -> the KASAN use-after-free above within
one run. With the fix the second join returns -EADDRINUSE and the run is clean.

 drivers/infiniband/core/ucma.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/infiniband/core/ucma.c b/drivers/infiniband/core/ucma.c
--- a/drivers/infiniband/core/ucma.c
+++ b/drivers/infiniband/core/ucma.c
@@ -1509,7 +1509,7 @@
 {
 	struct rdma_ucm_create_id_resp resp;
 	struct ucma_context *ctx;
-	struct ucma_multicast *mc;
+	struct ucma_multicast *mc, *tmp;
 	struct sockaddr *addr;
 	int ret;
 	u8 join_state;
@@ -1544,6 +1544,13 @@
 	memcpy(&mc->addr, addr, cmd->addr_size);
 
 	xa_lock(&multicast_table);
+	/* leave matches by address only; refuse a duplicate */
+	list_for_each_entry(tmp, &ctx->mc_list, list)
+		if (!memcmp(&tmp->addr, addr, cmd->addr_size)) {
+			ret = -EADDRINUSE;
+			goto err_free_mc;
+		}
+
 	if (__xa_alloc(&multicast_table, &mc->id, NULL, xa_limit_32b,
 		     GFP_KERNEL)) {
 		ret = -ENOMEM;
