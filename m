Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795521970;
	b=XewAFB/NNtLIOhNd32/ujnUVQbtk8lIakz1NuH+E1LSB2j261jA1pDWpVcw8vRQa2Xcg
	 Q9aRMlk3FPGkOjKFTz2TeiaVhnvXY3mM8+H/J+Cr6ucMEPEraUPeyCpATANHcXObtQyVY
	 dmFWql9FKIeGqoP4MMxqMvSn42EIJsUxiJ6VvbjozvJp2jCnu49uE124NV55JVVNmtYiR
	 7wjUaa3kwvGY9dQ2zBwdDt3MvEhZG/8cARFaoou7exyvRcZo4AWPKrURjJutTcHd47PPE
	 WJyZyNRDXgcH9bnifZncCWswH8WN6Ymrh+DEsX8jrGe5pHqcIyKQ5OJldM1Rllg/z6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521970;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=pVa+ZA6aOifgImQztMbcvR8yIo5vx5Zni3d4EJa3kmU=;
	b=J6FL0ssnmYnlpyNo444zbKe3tgB4QLSTSXSMt6DmMeOmuPQWby+93OLjl8qiGG/Z3eCQ
	 hKvdTR0R4swu433OpTBb86Ey9gVcQEQo2Z2l3bqrC6TfhbbKIkSoQe3Uk2HZUDxC8/SS7
	 oBzqrknkMUPs6RhOz5SGlx/3LVsyjBTLv4D9vplNwnf43YcPkCD4Q1odpIOcrWXsT7aJw
	 aIWUJcE2avmx/7BRTGoPceXBXxm1env9TgdexsUIs0eFfR+V3a6+LH7GqL0j5rH69dMAH
	 t6GRcNWfQ7jTuznfjUgzoAzOMYJPUnk1OZYp2MjVvGtoPUsxSipj0cOeSs06UujfN0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="N//M9eBR";
	arc=none smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92080606A690
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:06:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92080606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=N//M9eBR
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3adfc004920so41224071fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795521969; x=1796126769; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pVa+ZA6aOifgImQztMbcvR8yIo5vx5Zni3d4EJa3kmU=;
        b=N//M9eBRKJVFPf5RQ369XDTjlCr76SvnaJAhvpiEb6qRo1GEuVH9ZpqUR0mb+RO05P
         Dyn56e6eGjpZkGT/q6/obpjznxk2zUpRTjBU52VhihbM5bCxNJMw3KXu8GA8SEEkbmVD
         5Jy3y+xJqr6fnRvIB+vg4ma876pUGfZnSAsCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795521969; x=1796126769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pVa+ZA6aOifgImQztMbcvR8yIo5vx5Zni3d4EJa3kmU=;
        b=DjudlxSnXK1Kj9boiRqcmZYMbn6Tf5V05bO6jjlCK+1ul6n5Nc/96Tm6v6HTGxgX8z
         zwsNQHqTgG14eAv4F8XfV6moQ0FHW2VAghBD57TWIaTSvDTtLpj/W2PAfEzZDzSxKVWq
         9d0CKZsVb9RXKRjQ+mWUdHtJ1gEzwti33eOTDnom+Do1dy47nUjC4OonEKUacKbbGBby
         UXx1zsGnB1btlowU3NvNDAIzpnH3el7mIc27GVkoLTAONywBgxTsdT4ZXLPGQjeOY8De
         j2bbHDYq5ldjsEpIaDEU0vFd+u53t3i+09jgHixL/AWAlC+jAr3hwV005rVCyshJkjdO
         dwgg==
X-Forwarded-Encrypted: i=1; AL+hErFLTOOBCc9nVu+3PmO3hSEeGH2uYuq3QmfKnAaROkdrlOzViuMPS3iDwAwbQtO3pvi+PdnKpf9x401snMI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GnKVGRvW17RS7QcQaM0wqjo9L07VkRHpDzhViYX4Bg+wrraJ8
	2QHO6P1DKtPfe+/XcIXAw/J9nm9r4U61nc0LOIhXyljaZrLUVHYM3+CN4PwRmT6dYA==
X-Gm-Gg: AZFdTZeQgKGIDCZ7Zo9tf1GWgaRS3tVZfYk0LOJA1IbSGyXMoRCt4fpPr+06sZ5Rsxn
	21kXcx8azLazVHNyk1yOhVOFAjKFmTV253rdVVE2stJLHrzEV8c+YiNFU05HTFuhDpxM2RkuBs2
	PbPNrpKypoM+zvejGmu5pN5EUQ7mGV8LqonC62iq/GuREEHnBwWnjwDJw/fn2D4PB8DO+bJXeds
	q7ikJaqnoC33Uu5XqigwPscSSO8ggtaGhOWyAwzVyPtZ6yF+MH5jyC8caM4angxYL51aFs+wXd6
	4EKTB3l0kgzzobA59U5qE3YHX59k6p3VrOBe3NSRoYq198hBONm+2Kz6MFYIju0vrY7dk+JvUjw
	Y7FEHI2gtyuXLj5UjwaZcPRMmzT70XHADV380/osunPlGmiM/iv95HiwiQHFwa5dR9X7qWCMXIq
	t04yuix6calhNT0QEB3LzweiYRaSS4Ck1Sr8nXQPNjtelKnP1eGGT45pJ3/VLIsfuQoq7u39Z7Y
	6YmZ+7dntb2Uadz97fjLVgZ5QT3izStRbMsTLMN/XT9MJONsYQZUeBol94BNjpW8V2A6ClXAs38
	MKE3871oTUrdaqVSMZorD3WHhKNUSogtYf3FKfMkvChFcaDR9UtcCzwzIm7B/TZjeYMeM801apY
	4S/gNr0Xk1cI=
X-Received: by 2002:a05:6512:224d:b0:5bf:d0d5:3b12 with SMTP id 2adb3069b0e04-5c1bc805a72mr5534713e87.42.1795521968752;
        Tue, 24 Nov 2026 04:06:08 -0800 (PST)
Received: from ribalda.c.googlers.com (214.118.88.34.bc.googleusercontent.com. [34.88.118.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd01772esm3654675e87.39.2026.11.24.04.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:06:08 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 24 Nov 2026 12:06:05 +0000
Subject: [PATCH v3 2/2] media: uvcvideo: Use wait queue for metadata
 streamoff
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
Message-Id: <20261124-uvc-racemeta-v3-2-f82822cbadb3@chromium.org>
References: <20261124-uvc-racemeta-v3-0-f82822cbadb3@chromium.org>
In-Reply-To: <20261124-uvc-racemeta-v3-0-f82822cbadb3@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

We are now using a schedule()/loop to wait for in-flight buffers. This
works, but it is not beautiful. Instead we can use wait queues.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_queue.c | 7 ++-----
 drivers/media/usb/uvc/uvc_video.c | 2 ++
 drivers/media/usb/uvc/uvcvideo.h  | 1 +
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index 844e9baa8066..f44b740cfe55 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -229,11 +229,8 @@ static void uvc_stop_streaming_meta(struct vb2_queue *vq)
 
 	spin_lock_irq(&stream->meta.irqlock);
 	stream->meta.streaming = false;
-	while (stream->meta.in_flight) {
-		spin_unlock_irq(&stream->meta.irqlock);
-		schedule();
-		spin_lock_irq(&stream->meta.irqlock);
-	}
+	wait_event_lock_irq(stream->meta.wq, !stream->meta.in_flight,
+			    stream->meta.irqlock);
 	spin_unlock_irq(&stream->meta.irqlock);
 
 	uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 5de7f215ee28..fe163edfc0b2 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1802,6 +1802,7 @@ static void uvc_video_complete(struct urb *urb)
 		scoped_guard(spinlock_irqsave, &stream->meta.irqlock) {
 			stream->meta.in_flight = false;
 		}
+		wake_up(&stream->meta.wq);
 	}
 
 	/* If no async work is needed, resubmit the URB immediately. */
@@ -2355,6 +2356,7 @@ int uvc_video_init(struct uvc_streaming *stream)
 		INIT_WORK(&uvc_urb->work, uvc_video_copy_data_work);
 
 	spin_lock_init(&stream->meta.irqlock);
+	init_waitqueue_head(&stream->meta.wq);
 
 	return 0;
 }
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 26d4461f2774..785473928760 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -486,6 +486,7 @@ struct uvc_streaming {
 		bool in_flight;
 		bool streaming;
 		spinlock_t irqlock; /* Protects in_flight and streaming. */
+		wait_queue_head_t wq;
 	} meta;
 
 	/* Context data used by the bulk completion handler. */

-- 
2.56.1.809.ga0b61035b5-goog

