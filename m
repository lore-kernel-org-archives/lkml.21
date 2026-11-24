Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795521969;
	b=jsI8HL0PWVlIcfhXzVEvj8dH0EnRY+yfnmLbASus30UbLdsEo30ndMJ1PZrQ01CgCd+h
	 KHJmC3ogRw/Z2yKBVscJQjKri6ixAUYOKXeEr6CGJxL6L4Z1OiRyUxEjG1/ytSVMwHM3v
	 9SbF/d/YmAOs9dsFz6XMJ8ngxt6infkx+J3kpJBXe6SbsZkIcktr4wn0tEc3uW2ThCC2S
	 X8kJFqM13eP/Ckuhj+ahnLnTVnoqc9y97k2AhIcR/hYuKyf33whrHzw2AZz+z1eGkXs7C
	 tKRCXov8ve+yS5EAI5oXq5xBe/KMltGMFWSEBn+UvZ55xucKVHD8hmvH0a2kFzsmjMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=FowArMSorhehwd66hZPNEOpPYmolYsFPd3fHPYFoqLg=;
	b=gEyDaSMdSKPjAq8H0fSf1sxnt8PMHgYSLqbZ1k8Qz9+9DCu//YO2uDJsu3cd7bD0GRtC
	 KV8j0kxpp5W2ONeV3u2BEo9f985xPXg5s0OnDgfY2VgRRDWdXe7w2sDpqjOnPAwPTZwXv
	 1mWMXzGbxd6Y9VAI8KtwWn7PJYa0uF5sNcPWhb8zW0SqwyqhfCg/5cC9nrvNBithyIx7Y
	 niGWa62MRBChFxzfabNCiXaAU/t6JPqbDms5DsEcFPmdyYZbtSf0RSrIPVcIgZhxpmRvr
	 4+cbx/z0WwIZ1aPPNbEW7ghZO/eGz3AVS/AwgJmCTgqckrdgPq+F9JvouLDJioPNsow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="NcUeM/a2";
	arc=none smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B75606A33A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77B75606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NcUeM/a2
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ae25dcbd81so37487701fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795521968; x=1796126768; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FowArMSorhehwd66hZPNEOpPYmolYsFPd3fHPYFoqLg=;
        b=NcUeM/a2llWn0/CpChtJnRNTF4yDcB1QkwvEu8HXRj2Q1GHRynF4I/P5rBLWGpV27v
         IPKudErBDxhqvlf3xOVaSG2DYfbHDO4kyc88Eds6yYkAEwlNMxqstb96t1HCbuSKaRWM
         ljuGqoKRQaDrP5kFtxKw3A2oQuQWxaY8iOJ48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795521968; x=1796126768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FowArMSorhehwd66hZPNEOpPYmolYsFPd3fHPYFoqLg=;
        b=nqc7YrsR1LeH0KHNfSlzyB75rDRtyWOTz3vVjNbim9aPt4uYLyzRS0NaZseQbHrp4U
         Dy3Ab5Z6+/uTUA9bquvydaCSfzK25DlLM5eUGaXR1I1V2/+NtTYwcO9l0YJ4Us6db+Oz
         puweNwHF6t1yOEyvyy4QJnkI0oUEkWP5xCAuJrlBEbZ/7nvE97Gff1EzDflpH3fRGLHp
         HUHDGRzXQYmyejZ2WUst3hXP+UKf4BNZBVglxlsPRvgdg77GCuoNkHCQimG5bJNxR/00
         btAcZ1msnSC2VLxkiTTycasIJWvql4cnK2/F5qvauoxKqCLSKsHneoIsuHl0bCrEx1E7
         IMZA==
X-Forwarded-Encrypted: i=1; AL+hErGq5B2NdmN9xnNbFmr38kTozKpKDD/Ey+RgJQ6b8HXASxCULj3lwhStxOizSbQK1UCGjt+bYkApqfpAYXY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CFli4a81m0toO5OOWKmGGs6m0yLYUBHdqZgBA1F7M9idMFvNF
	Peh2AXJWiXnT+2nTEbJ8reZ+g4D5MRTwMBKfj40G8Uo+7hmS7qpoRKqwMuK0QYw2Ow==
X-Gm-Gg: AZFdTZek+hX/lCxML9AoQDT30P6w3HK+j6HvznQJoB+aLkYNrF6064cbCY5gOu/x0jm
	hLYkew9zBdE6b0zJIIfzXWTnt8i20rLjSpD51cjOebqLOoUB7hAYY412v1LfpPE9w1ijetppJIF
	apbpr4IOPHIbulbUbWAgv9NqFonV9sgJj1Pws9lBzdd6jn1DBfEFGkQeUQbVOSaad5ZsaerRpJd
	qKMJRoDCBy5NXZkOZTy3tjCUyxyzCLyfiTudEaToZnrL2FHDL4cqwc3SIsOXD90Fu4t2+zdO0q4
	bkQ0OEKXlpL0bXPeH79QNdJ6f/thip8cK+lbwtrsolDvHy2socvsikTzmcwZnCBulv0jw1/527V
	Vl45FiDGS+UVSVfDGLDsIj8VFBK6LTQygFuUIbNws13uwdJyUozUsOhZdagO7ljztbeJSryzK6+
	sEiBJexxsPMhIC74WOzFcjTIp5EdA/HkNyqE9mzAVedkuZOGzEoPoXWUpJqWMEK/ediPaN+f49f
	fjlSQ9YZcf0xeBl8pBbsRhmZ10S0REzHpf7zwsMPNpAvfZS0ddlIsfxjVWGve/PdrpqL1B+sOv1
	kluyYqIIc8guTOaAeq8LFl6rfFtar7QEJ+7k+mJSO3oIsJpG9UStM2/r6ntJejEjMrxBL2kV5kL
	Xh6EIzqSfbA==
X-Received: by 2002:a05:6512:b88:b0:5c1:4cab:2ce4 with SMTP id 2adb3069b0e04-5c1bc84e055mr4936072e87.42.1795521967663;
        Tue, 24 Nov 2026 04:06:07 -0800 (PST)
Received: from ribalda.c.googlers.com (214.118.88.34.bc.googleusercontent.com. [34.88.118.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd01772esm3654675e87.39.2026.11.24.04.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:06:07 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 24 Nov 2026 12:06:04 +0000
Subject: [PATCH v3 1/2] media: uvcvideo: Fix race condition for meta buffer
 list
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-uvc-racemeta-v3-1-f82822cbadb3@chromium.org>
References: <20261124-uvc-racemeta-v3-0-f82822cbadb3@chromium.org>
In-Reply-To: <20261124-uvc-racemeta-v3-0-f82822cbadb3@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, Georg Neis <neis@google.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3

queue->irqqueue contains a list of the buffers owned by the driver. The
list is protected by queue->irqlock. uvc_queue_get_current_buffer()
returns a pointer to the current buffer in that list, but does not
remove the buffer from it. This can lead to race conditions.

Inspecting the code, it seems that the candidate for such race is
uvc_queue_return_buffers(). For the capture queue, that function is
called with the device streamoff, so no race can occur. On the other
hand, the metadata queue could trigger a race condition, because
stop_streaming can be called with the device in any streaming state.

We can solve this issue by introducing two flags, stream->meta.streaming
and stream->meta.in_flight, protected by a spinlock. in_flight tells us
if the buffer is in use by the irq handler and streaming lets the irq
handler know if the metadata queue is streaming.

Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Closes: https://lore.kernel.org/linux-media/20250630141707.GG20333@pendragon.ideasonboard.com/
Reported-by: Georg Neis <neis@google.com>
Cc: stable@vger.kernel.org
Fixes: 088ead255245 ("media: uvcvideo: Add a metadata device node")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_queue.c | 30 +++++++++++++++++++++++++++---
 drivers/media/usb/uvc/uvc_video.c | 30 +++++++++++++++++++++++++++++-
 drivers/media/usb/uvc/uvcvideo.h  |  3 +++
 3 files changed, 59 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index 3c002c8f442f..844e9baa8066 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -206,12 +206,36 @@ static void uvc_stop_streaming_video(struct vb2_queue *vq)
 	uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
 }
 
+static int uvc_start_streaming_meta(struct vb2_queue *vq, unsigned int count)
+{
+	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
+	struct uvc_streaming *stream = queue->stream;
+
+	lockdep_assert_irqs_enabled();
+
+	guard(spinlock_irq)(&stream->meta.irqlock);
+
+	stream->meta.streaming = true;
+
+	return 0;
+}
+
 static void uvc_stop_streaming_meta(struct vb2_queue *vq)
 {
 	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
+	struct uvc_streaming *stream = queue->stream;
 
 	lockdep_assert_irqs_enabled();
 
+	spin_lock_irq(&stream->meta.irqlock);
+	stream->meta.streaming = false;
+	while (stream->meta.in_flight) {
+		spin_unlock_irq(&stream->meta.irqlock);
+		schedule();
+		spin_lock_irq(&stream->meta.irqlock);
+	}
+	spin_unlock_irq(&stream->meta.irqlock);
+
 	uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
 }
 
@@ -229,10 +253,10 @@ static const struct vb2_ops uvc_meta_queue_qops = {
 	.buf_prepare = uvc_buffer_prepare,
 	.buf_queue = uvc_buffer_queue,
 	/*
-	 * .start_streaming is not provided here. Metadata relies on video
-	 * streaming being active. If video isn't streaming, then no metadata
-	 * will arrive either.
+	 * Metadata relies on video streaming being active. If video isn't
+	 * streaming, then no metadata will arrive either.
 	 */
+	.start_streaming = uvc_start_streaming_meta,
 	.stop_streaming = uvc_stop_streaming_meta,
 };
 
diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index a92a986ab714..5de7f215ee28 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1732,6 +1732,26 @@ static void uvc_video_encode_bulk(struct uvc_urb *uvc_urb,
 	urb->transfer_buffer_length = stream->urb_size - len;
 }
 
+static struct uvc_buffer *
+uvc_video_get_current_meta_buffer(struct uvc_streaming *stream)
+{
+	struct uvc_video_queue *queue = &stream->meta.queue;
+	struct uvc_buffer *buf;
+
+	guard(spinlock_irqsave)(&stream->meta.irqlock);
+
+	if (!stream->meta.streaming)
+		return NULL;
+
+	buf = uvc_queue_get_current_buffer(queue);
+	if (!buf)
+		return NULL;
+
+	stream->meta.in_flight = true;
+
+	return buf;
+}
+
 static void uvc_video_complete(struct urb *urb)
 {
 	struct uvc_urb *uvc_urb = urb->context;
@@ -1767,7 +1787,7 @@ static void uvc_video_complete(struct urb *urb)
 	buf = uvc_queue_get_current_buffer(queue);
 
 	if (vb2_qmeta)
-		buf_meta = uvc_queue_get_current_buffer(qmeta);
+		buf_meta = uvc_video_get_current_meta_buffer(stream);
 
 	/* Re-initialise the URB async work. */
 	uvc_urb->async_operations = 0;
@@ -1778,6 +1798,12 @@ static void uvc_video_complete(struct urb *urb)
 	 */
 	stream->decode(uvc_urb, buf, buf_meta);
 
+	if (buf_meta) {
+		scoped_guard(spinlock_irqsave, &stream->meta.irqlock) {
+			stream->meta.in_flight = false;
+		}
+	}
+
 	/* If no async work is needed, resubmit the URB immediately. */
 	if (!uvc_urb->async_operations) {
 		ret = usb_submit_urb(uvc_urb->urb, GFP_ATOMIC);
@@ -2328,6 +2354,8 @@ int uvc_video_init(struct uvc_streaming *stream)
 	for_each_uvc_urb(uvc_urb, stream)
 		INIT_WORK(&uvc_urb->work, uvc_video_copy_data_work);
 
+	spin_lock_init(&stream->meta.irqlock);
+
 	return 0;
 }
 
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index af8cef94ffff..26d4461f2774 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -483,6 +483,9 @@ struct uvc_streaming {
 		struct uvc_video_queue queue;
 		u32 format;
 		u32 buffersize;
+		bool in_flight;
+		bool streaming;
+		spinlock_t irqlock; /* Protects in_flight and streaming. */
 	} meta;
 
 	/* Context data used by the bulk completion handler. */

-- 
2.56.1.809.ga0b61035b5-goog

