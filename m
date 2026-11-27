Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795742594;
	b=syml8mJJqT9xfbEerVVK8wa1/SDLvYmnbibht+jJvpCrRz989m8YqZFn91yjnBYLmS+A
	 U94RX5Sv7YC6rUiBCIKInJWKwpvmLTolDLj/A5XXrTAwxdkewSORX8oDKtbcuVF6an/SR
	 YMmdo1uqtGcP9Ib8xCUiDLSTotdF/UoiU4g23ylCNBC6Br+ik9y1qQUkNkA9adQLX+doU
	 KqXn6uRPIxePW7oB1ta+hXE2vfQXiVtjK+P6Liap6UcvWtLC5EVh6YPyGvYUjC82y2g1s
	 eoztoB8R7isju4ceGEqf4ixxEoP35h431ks1MawbpQPb9PDUY531HINGfR8KBKL5+yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795742594;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IONrhUu0mCdKD6A1w26OhoHIerda2lYy4CpvhM/qUMY=;
	b=YSDc0Nq5IboxNded0WjyDKA5w4KdPs1SzHD0nqOENXSFfL8+XtOPitzZE6Q/M2Z5BAlS
	 BT0sslaDucOaVYfPiEwDy0cTw+Yx6uEO63MT4IzeSG+pi04AZyuHuls6XUWhyXsyVKHWO
	 XtJXbwHMx3P2SJ0zzvuKk7GTkwBcqNetVIUuxGDmgN+QYPmoPiz8vl30Y12aRbqj4nXlG
	 chBOqVoZYQYXSYVvPlFTPhTGSYValta8iqG6zRyxETF0deIIAoO1l2Yvf44OeMZMjtJ0d
	 JAkeoTR5rhKfZLFwd1m3gbJbRnsBJ+UY2i5nu9iU6rNqkxSjuYXFzIG+ymQgXtBwqOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AkI6VSP8;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE1A606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:23:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AE1A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AkI6VSP8
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f0414c1062so45435215ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795742594; x=1796347394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IONrhUu0mCdKD6A1w26OhoHIerda2lYy4CpvhM/qUMY=;
        b=AkI6VSP8pJKt6qNLty8FIVIgENcCekEOL+G5BBn9KLhNlPqDlv/AZybFE6mFsJLv0C
         Eqt5Oogyrye+y7lWy6eezZwACITarWhvj53V1B1NEpsuamuep4VxUXXcLX9l02JH/FrP
         /Diov+B6Wmo2qHlpOGW9wLOnNrSr41McejHUjGtubZKPZBFC3GDazkkPQoCfJ06pKexc
         /ZF2BcOhgigZpY51dJBRY1QkU9vDtkPf1HZnebEdCvoK4pwIXZyy4VPMsfYM0povx5dT
         hPuR7cET+mzzNjcsEgy35xSRLC0TZoIbTPrCON+wyy1a6c86byOWCAivmEyNm8e71L13
         lAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795742594; x=1796347394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IONrhUu0mCdKD6A1w26OhoHIerda2lYy4CpvhM/qUMY=;
        b=PbG6J9xjpNgYp0xnOEeKOqxiBXaWfJ6PzBnP83m9qNEXGHngPmT+i79yU9RWx4S3vh
         BHWyzury9tA6Y+07cQsV3yGiCszk1c5POLrODqxZcCC1whpn/YIjnVFcovHfm8qDedoO
         n9lDK1pA9+dw8C1qGD6BImrB3SyAmOkf1YTOBoExAOQMPlHcEKUJQjFbJcO5a1YOTGx+
         0HAlfvpMds5+D70era8gAoq3g9FOMB/qatArvupFLFJ4zDnTpQAx0LKCa9Ux2rYQDYSr
         E7JhfaN+m20rgrB/8OiGgWYmW2IY2Rs18h5phhuYVqJexYuf8UzDkQLsxNh16miprEzt
         B1Eg==
X-Forwarded-Encrypted: i=1; AL+hErHnHs9VaOWLhutET19BGZ5pzAToWVPYPjXbKdoOoI2npy4ieVFcZQGYLj5R8C8pCOZsolvIXaI5Va0b9cs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FofMw1WS6+0emxGIEKO7gwu7cC349KUWk1aE8Ovfk5YFcxsQm
	cQVUgWrYZn4622MK9LdKeuCQSqj++xgIjxXIfDIbWoNVBxqQY8Zr0UW4
X-Gm-Gg: AZFdTZe/9eLjXHNN8XotICLdSFUMTBxyoZY0lkozNdBLieA1MLivtzxZv8erBBJERpi
	b8rtmLZu+x2UD0i/7WUSXSKS75bY3kK0o/EQxS2avi3Z+PaS99d8s52opyeQRDcBQsyrmbhTRFa
	417d1iiWGOdgMNC2ZTobrHbuohyfOUx1BBtovDaXoFyHH9zmduu7D74lwPnrVmmZZOcz/NNymXA
	PDpGh3fNb6ZVKVvffuCIufBVB5iAgQ33EY/FgvxiJf6NzFjlfxvBnyDxS8vYYgBcOuNsjd4bLJT
	k8qE8T4SN5+uVVpLHo6CSTlSBZYKYci5HtyBm6a8SYH9MebKOOOAiPtPfwm55YaXkZQRCtZR2mY
	ec57MF4NPqicnqtvXNIYRWq7ayCgtdgr4KNL8yPPmUWob/AdLrYiYf0xPm6GxVPJbHi9pHzYHZ9
	M5VlK0Dybpkuv3Ib+nKxoCBi3ogMuHeHscYyuu0DNrjtfHkCb8z2n3ES94bKcuTmtDGbU7kEQEi
	SptHjQKpTWpaobk9aoF+tvSOUeekeZqWLDobpUWUm0kB3+xkPXAcG3SiaQOHTEpWodcHihkqZ6X
	xGgGYPQc7ARkIKmM9z/NODwNDVA0jtZZdxPE2+Y4Z/paDxn14ewgxe1zSu4I16dXJOd6sL1yKwX
	lXG2azxg=
X-Received: by 2002:a17:902:ec8b:b0:2e9:7ff5:5462 with SMTP id d9443c01a7336-2f03f1187f6mr190865485ad.22.1795742593661;
        Thu, 26 Nov 2026 17:23:13 -0800 (PST)
Received: from DESKTOP-TPPBPA1 (36-229-10-180.dynamic-ip.hinet.net. [36.229.10.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0fe9e36f9sm10866465ad.55.2026.11.26.17.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 17:23:13 -0800 (PST)
From: Roy <rongh7426@gmail.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Roy <rongh7426@gmail.com>
Subject: [PATCH] media: pisp_be: Set the field of OUTPUT buffers
Date: Fri, 27 Nov 2026 09:23:08 +0800
Message-ID: <20261127012308.682831-1-rongh7426@gmail.com>
X-Mailer: git-send-email 2.51.1.windows.1
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

The driver has no buf_out_validate() callback, so an OUTPUT buffer
queued with field V4L2_FIELD_ANY keeps that value, while the V4L2 spec
requires the driver to set a valid field on queued OUTPUT buffers.
v4l2-compliance -s fails on all three image input nodes:

  fail: v4l2-test-buffers.cpp(240): g_field() == V4L2_FIELD_ANY
  fail: v4l2-test-buffers.cpp(1608): buf.qbuf(node)
  test MMAP (no poll, REQBUFS): FAIL

The Back End only processes progressive frames, and its formats already
report V4L2_FIELD_NONE. Add a buf_out_validate() callback that sets the
field to V4L2_FIELD_NONE, as cedrus and hantro do.

Tested on a Raspberry Pi 5 (Raspberry Pi OS kernel 6.18.39, with this
change applied to its pisp_be module):
- after queueing an OUTPUT buffer with V4L2_FIELD_ANY, QBUF and QUERYBUF
  return V4L2_FIELD_ANY before and V4L2_FIELD_NONE after on video20,
  video21 and video22
- v4l2-compliance -m (without -s) passes 400/400 before and after
- with -s, the MMAP tests no longer fail at QBUF. They then wait for a
  frame that never comes, because the Back End only runs a job when the
  config and output nodes stream too, so the full -s run can't be used
  as a pass/fail result on this device

This change and its description were written with the help of an AI
coding assistant (Claude); the testing above was done on real hardware.

Fixes: 12187bd5d4f8 ("media: raspberrypi: Add support for PiSP BE")
Signed-off-by: Roy <rongh7426@gmail.com>
---
 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index 8fb7230..95c4f7d 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -847,6 +847,16 @@ static int pispbe_node_buffer_prepare(struct vb2_buffer *vb)
 	return 0;
 }
 
+static int pispbe_node_buf_out_validate(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+
+	/* The hardware only processes progressive frames. */
+	vbuf->field = V4L2_FIELD_NONE;
+
+	return 0;
+}
+
 static void pispbe_node_buffer_queue(struct vb2_buffer *buf)
 {
 	struct vb2_v4l2_buffer *vbuf =
@@ -958,6 +968,7 @@ static void pispbe_node_stop_streaming(struct vb2_queue *q)
 
 static const struct vb2_ops pispbe_node_queue_ops = {
 	.queue_setup = pispbe_node_queue_setup,
+	.buf_out_validate = pispbe_node_buf_out_validate,
 	.buf_prepare = pispbe_node_buffer_prepare,
 	.buf_queue = pispbe_node_buffer_queue,
 	.start_streaming = pispbe_node_start_streaming,
-- 
2.51.1.windows.1

