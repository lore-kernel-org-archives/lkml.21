Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795374069;
	b=UwuhogzVMtEmmuAT2AK88+WMUg0BXZxm+1NA/FNDvM79+Mq239TzQ1XxUaPreDBrYD4w
	 K7nUeklJAzMZia3btb8/YiECrlYqPLcboWeDS2X9tWfppwXVryMOAN/QHBu27F3Obv7Qe
	 XJviCxFtULjljmMHAzjP5emIcLfIE8YMp7V7/kYiVDn+9pTihLVWppqY6Nh3oGA9GXf7g
	 gnpUoniE+Z0i9Ld1Z65+VrUS1s8CB12YnVXFdEQLOLXV3Qk1yjTpVZtNsKGSbjNn6/+M8
	 lVhyso4yNw9Luh822UxSPcZtOIHsLccRSWs3bH9TLsXrUGvGbSShoslrcn1Ox21gXHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795374069;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=psP2uIlkimEYW+kQJSgqbVunRYZcoC3y/JABKKHgk3g=;
	b=5jEUF8aVknHEptguivjhQ8A3InaWSvicyVKcUb3DgCUWU0K8lhAuRB++AFxheL8PQz+A
	 IG+1QyU63qKZhqMlcn1meJ5HfBJmAyXDNa1JKsYoYzpFMHWRQIdJKWttJrYKNAAswoLrm
	 LQ8bLfJ+W0S43XJpyyiFP9jQrqM2yFVI6kaSfFNmVWlO1pxRmS5MGYZbAE1i2go+9Kyib
	 IF1dse3WVrdZlRagwrgM8iWhsVmrHdJg99WLm9tg9qTWHB3wQbD4tUhxufYyaDhMCGFFH
	 ty48VR31TIyfQtz0+X/+ujmf0mer634wwPisMeMWMc3oDCEfRN8VI5DKbboIEmSewDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d7AO7oiM;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FF4606A689
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:01:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6FF4606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d7AO7oiM
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso31767045e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 11:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795374067; x=1795978867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=psP2uIlkimEYW+kQJSgqbVunRYZcoC3y/JABKKHgk3g=;
        b=d7AO7oiMDNVsFh0LM4DDKaTKjlPQXm/32TtE6F0SynaZGe7KrFwsGdFSW+iOtkrCj0
         Di0w3iZEbeIjuIueiDIsB/9NIDyUk86Kwvz5K+7WfCtRouCSFbM3YBPrvDSmmBaKseVm
         LQC7JLblIZ8LUVFyKjVA7otkeG1kO7+f3RlI1uAgDoxG8FSwCcKCqngDMaoCx+UX3Jl9
         d3pHBf0bEjA9RLOJNPrs5YFHpCVdyR6Pj1cHBPdUCzOGc5nUEM+jqMF3pXh1uIVW1kF4
         G+jB0bUaWK48X/PmGHmpNQZ+8Mtay6QfZBz30QVPtVdlRuWD8ij96D2OgqTVgQ50pLLq
         YE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795374067; x=1795978867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=psP2uIlkimEYW+kQJSgqbVunRYZcoC3y/JABKKHgk3g=;
        b=UQp0uKanADrxbaSzl1bwVX+kIzZ8dc6gnXKjPc8SSBqYUWt4mm3TUkXePwajs062cv
         WclVOdRiiyrUZDrzgibCuFixsEEWFsKLQdGlGvKOyAxXHtdVd9rDDCSaJTIZlQ4k3PgG
         0DByExiKcnBKMgcHoAomIlqFvsC9/jQsMuV91GmF8NMRQKRtK2tGo+0WI5KkDJ7w+Xv2
         jfzD1teePIyImr0Vg8qRakzXVXqoeJSFhwjMq+FI6JOeDzxv3Q1HakiwWRIjfY8e4DAn
         dXB31m97NfTSmJ+6kHwwwqCtmFLOR4uTKoxXuXJl31LSRXHJZ4Lj+yAR7z6xX97eItTl
         2pnQ==
X-Forwarded-Encrypted: i=1; AL+hErHs1i3O0DD4YzZ7HACsIcaHaea9BiUzewZU9KvxnbbajacMj0fsQrf7uF6+xQhv07TDEBDTTuM2HniH5WE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GIdXYfxRO64D+BdE3awu8wXR1atgYLGTn3yt4hLrzYuo9SU06
	mnQ5lzSDFEOMlygFHreMt0bhp7UT8I9S+K+J5LTTYkQfl8iBcvyEpBlA
X-Gm-Gg: AZFdTZejFEEK0HLXARgPCn/SwNyg+AcCkVVuSMyHByW7Wuv7rmZnmWd+gA9Vgtqs5LB
	LodH8T6wmK01YIF/yMLbbXpPLokmIDvqMs9EVO9N1NZyvTIA9CPO879MgnfAYk7fPbEeLMxQJWf
	SBbPEphltA5wocRJyhyzcXWXazu+rFezLiUBMeo68HjdAEIlzf7LrTPHM/QZ9WFz+q8tvimXKt7
	qkhL2u/TGMnuIEyGocjpHq1SX+GdZexU0CfDitdIjjKuggAZMh0e76SBLiJwAUHdiv9aetYE+cj
	hadITuZqjdt9L4LK/Xx9Q4Xhj6aT3pjkHrMAJ1ONeWd+7nZdRm66WiFQRrBYPz20g2hV4+agEAO
	YkiIMOHOdmodZOGDwvrfbA/NODLTNg4TF4cziyFxbVSOQUecWb/6wcWdZXlgrAvm5LeEJdZvkGj
	rlzB1e8qTR+cR1BqGROjRaAObdchrUVzxL1mSIMHJMYm1qjTjAyk4VHUO2+sUT4fFwuftHapG8Y
	XJf6lulVBG6Rg3hyW8P9Jtd6oMfj/aOlsZklG62CRNujzEcSQxTV7Pu7m/RxPxpNKEq7YIygxV/
	6VfIg8EnJDPh01fJYuwaoIqVPLBzocALOHeLZzUqHEepo1Y4bl1HK5tQ
X-Received: by 2002:a05:600c:3547:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4bb8880b88fmr189495385e9.10.1795374066559;
        Sun, 22 Nov 2026 11:01:06 -0800 (PST)
Received: from DESKTOP-V28CTA4.localdomain ([103.125.177.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865a2sm283389045e9.3.2026.11.22.11.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 11:01:06 -0800 (PST)
From: Arbab Haider <arbabhaider649@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+fb0d2df09b56117605fc@syzkaller.appspotmail.com,
	stable@vger.kernel.org,
	Arbab Haider <arbabhaider649@gmail.com>
Subject: [PATCH] media: em28xx: clear dev->v4l2 on init failure and fini to avoid double put
Date: Mon, 23 Nov 2026 00:00:09 +0500
Message-ID: <20261122190008.21278-2-arbabhaider649@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Commit 288254383674 ("media: em28xx: use v4l2_device release callback")
switched em28xx_v4l2 teardown to v4l2_device reference counting, where
dev->v4l2 is only cleared inside em28xx_free_v4l2() once the refcount
reaches zero.

If em28xx_v4l2_init() fails after video_register_device() (for example,
when v4l2_mc_create_media_graph() returns -EINVAL) while userspace has
opened the video node, the unregister_dev error path calls
v4l2_device_put(&v4l2->v4l2_dev) to drop the initial reference, but
em28xx_free_v4l2() does not run yet because the open file handle still
holds a reference, leaving dev->v4l2 non-NULL.

When the USB device is subsequently disconnected, em28xx_v4l2_fini()
sees dev->v4l2 != NULL and calls v4l2_device_put(&v4l2->v4l2_dev) a
second time for the initial reference, freeing struct em28xx_v4l2 while
the video device node is still referenced and causing a
slab-use-after-free in media_device_unregister() /
__media_entity_remove_links().

Fix this by:
- Calling v4l2_device_disconnect() and clearing dev->v4l2 = NULL under
  dev->lock in em28xx_v4l2_init()'s unregister_dev path before dropping
  the initial v4l2_device reference.
- Checking and clearing dev->v4l2 under dev->lock in em28xx_v4l2_fini()
  so the initial reference is dropped at most once.
- Reading dev->v4l2 under dev->lock and checking for !v4l2 in
  em28xx_v4l2_close() so a close racing with teardown cannot dereference
  a NULL pointer.

Tested locally in QEMU (x86_64, KASAN+UBSAN) using dummy_hcd and
raw-gadget emulating an EM2820 device with failed media graph creation
and concurrent /dev/video0 open/disconnect.

Reported-by: syzbot+fb0d2df09b56117605fc@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=fb0d2df09b56117605fc
Fixes: 288254383674 ("media: em28xx: use v4l2_device release callback")
Cc: stable@vger.kernel.org
Signed-off-by: Arbab Haider <arbabhaider649@gmail.com>
---
 drivers/media/usb/em28xx/em28xx-video.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 84424284d..50998aa1c 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -2333,7 +2333,6 @@ static void em28xx_free_v4l2(struct v4l2_device *v4l2_dev)
 
 	v4l2_ctrl_handler_free(&v4l2->ctrl_handler);
 	v4l2_device_unregister(v4l2_dev);
-	dev->v4l2 = NULL;
 	kfree(v4l2);
 	kref_put(&dev->ref, em28xx_free_device);
 }
@@ -2414,7 +2413,7 @@ static int em28xx_v4l2_open(struct file *filp)
  */
 static int em28xx_v4l2_fini(struct em28xx *dev)
 {
-	struct em28xx_v4l2 *v4l2 = dev->v4l2;
+	struct em28xx_v4l2 *v4l2;
 
 	if (dev->is_audio_only) {
 		/* Shouldn't initialize IR for this interface */
@@ -2426,13 +2425,16 @@ static int em28xx_v4l2_fini(struct em28xx *dev)
 		return 0;
 	}
 
-	if (!v4l2)
+	mutex_lock(&dev->lock);
+
+	v4l2 = dev->v4l2;
+	if (!v4l2) {
+		mutex_unlock(&dev->lock);
 		return 0;
+	}
 
 	dev_info(&dev->intf->dev, "Closing video extension\n");
 
-	mutex_lock(&dev->lock);
-
 	v4l2_device_disconnect(&v4l2->v4l2_dev);
 
 	em28xx_uninit_usb_xfer(dev, EM28XX_ANALOG_MODE);
@@ -2455,6 +2457,8 @@ static int em28xx_v4l2_fini(struct em28xx *dev)
 		vb2_video_unregister_device(&v4l2->vdev);
 	}
 
+	dev->v4l2 = NULL;
+
 	mutex_unlock(&dev->lock);
 
 	/*
@@ -2502,18 +2506,19 @@ static int em28xx_v4l2_close(struct file *filp)
 {
 	struct video_device   *vdev = video_devdata(filp);
 	struct em28xx         *dev  = video_drvdata(filp);
-	struct em28xx_v4l2    *v4l2 = dev->v4l2;
+	struct em28xx_v4l2    *v4l2;
 	struct usb_device *udev = interface_to_usbdev(dev->intf);
 	int              err;
 	bool last_user;
 
 	mutex_lock(&dev->lock);
+	v4l2 = dev->v4l2;
 	last_user = v4l2_fh_is_singular_file(filp);
 	_vb2_fop_release(filp, vdev->queue->lock);
 
 	if (last_user) {
 		/* No sense to try to write to the device */
-		if (dev->disconnected)
+		if (dev->disconnected || !v4l2)
 			goto exit;
 
 		/* Save some power by putting tuner to sleep */
@@ -3110,6 +3115,8 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 	return 0;
 
 unregister_dev:
+	v4l2_device_disconnect(&v4l2->v4l2_dev);
+
 	if (video_is_registered(&v4l2->radio_dev)) {
 		dev_info(&dev->intf->dev,
 			 "V4L2 device %s deregistered\n",
@@ -3129,6 +3136,8 @@ static int em28xx_v4l2_init(struct em28xx *dev)
 		vb2_video_unregister_device(&v4l2->vdev);
 	}
 
+	dev->v4l2 = NULL;
+
 	mutex_unlock(&dev->lock);
 
 	/*
-- 
2.53.0

