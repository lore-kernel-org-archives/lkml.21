Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795380706;
	b=vQXKdRv+E+QAQ6bnDeCqwt/gLe5YlYMJb4eFC2pbPdMlAbspBRPDIyEUBKAR0w40T3r/
	 3idNmUu3Azk5ai3iHQ0WXMlfQRRMVe02YRow/6KG8PMEA5gm8DYeSV7c981xPatoqgRny
	 Ws5yq80rPKiSs2w3tfU9G6TB0agbpTZBltK5Uh/Z9QgP1XpOna88WOGcm4neezBrxmvNf
	 rFQJMyhJ467oBNyF1O6I4mcKf7mBb+4n9OtGNCMuufL4F5HDTsx/G8/5hu2kPT7w68Er0
	 2D3pB6/iM908zGlOcHr5A+1KGFiVGMX73DToDn+Ryy1ZUlB6BUCYPn2mccFfwkfT5EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795380706;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GCgci+wnkegUNNmVPyTdmFkRnQkKXTGlvVX8R+FAXAw=;
	b=4dSFcJLPVP0qxKFD0s4UyMo5pyPlbQFWTrWA76So6IYYGaVwzRMcSW2PsL0KTmIaE6b9
	 WPcrqrv1BqPJgymu1TAXAC9bJx12eoVM+zz+sX0VHQy8cI+Cer7vLPx+He0/2HcVhQr3T
	 psYksbiOCrBA2xTJALp0S5xFo1jCC4PYwlPVUH7EE3S2v5Bv/o6c1I7HGQ7Bo3ZozpL9D
	 Qg+VHYDK595oeSek6lNtMB/nGf7FEkIkf/LVef7xY6ncIOnRntWtM6WBabvfGIOZ1HqLt
	 2znJYq7CPkT4BHEdQkS9sifebOPorzLXkBRI35V4zavj2mSFhYkFmtGnZKf1sTSxFDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="HnUix/va";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F00606A687
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56F00606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HnUix/va
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so17946145e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795380704; x=1795985504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GCgci+wnkegUNNmVPyTdmFkRnQkKXTGlvVX8R+FAXAw=;
        b=HnUix/vahPIIPPg94n21bSwADW5XJ2R4f/ruRTqMmI6tIIzR4e6LqXv4evpos0RRK5
         jXSmRZPACpd13OmIbBBkA67aYZALiuR1jyZ4kUvB0LS6LE8iRytOClCFlxIsaTg3920e
         Rw9GTqEof3NzSz/Z4Z2idg99g9IjDNxpYjKPObuZiQRCrInfmYQrX3/kNeNCUClCO9sD
         fvxY0ryVj1AFagtDNCWJhhYPVxbjXZskrqC0m/B5UZDNknzg6jvLDsZQ8+ovJxZT+g0H
         ZzT4Xlq055C2HJ7sFdqBfFzUx3GR8ZoIbt86FZXE+BI94qdBhF9ShibmX9JSsRIYbh39
         g0mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795380704; x=1795985504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GCgci+wnkegUNNmVPyTdmFkRnQkKXTGlvVX8R+FAXAw=;
        b=YeRyhGX2J4WScGFGIhtfuTDdVYR9E6m4SdWGLvcoVM6dQuOXo/V/7vta6txzYuwkCE
         v0KmJVoRYt/MbQZlKldr7gAx5K61XgZ8LJf78yqwfyN7Oi+HNpUN58ywCtzX9JQ/K1sx
         XQqY9T/Bh6ig9ffMPkfzl+DLZF37WGCm5DGpfx86dQ53xeeVEXUorphoye5EFS+lPHJq
         /uLyiNZXAuPiyu8LmQapYek6jjwd4b6M0FkfbqmYSZywWSkrtuakQjHWf7SM6Csw583a
         k/ydUCO4BW7tuMhUuDW9ZTI1jA/JuYeust5wXUjgm2uZKqrmfI7TM6OeE44QcfKRNL/J
         l6zg==
X-Forwarded-Encrypted: i=1; AL+hErGxzI5R5Z0DREUsJFIHlZNBqa01YDfSnFPzkcJ9pfc4uLxOOa2lR8s4W230k80rE39YHBI0CAC9n2iMT84=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yuwaxPI3JhsDnj9lEBGSPIal/Wauv3h8MABApzIgy/Y14lSk5
	8MFrY2VTwvPwJFuik4WRmIeSZvdOKYe7SSfo4pSXUF7XumdCN6YPKwRB
X-Gm-Gg: AZFdTZcJHtxy1lVB+dIObdICb/K/bXAlAJjT0Wg87WvOjKL1IxBHDYrAVxqVUBdvthQ
	o5w0q5Ilu8Nw1Z+bg2Uy451lSBneB+BUHXnGQmy3G0E9d8M6QKLOSrBT49biSnIWF52XtFjc/81
	jfWMB8CAjUEJV35V9rVJdtPfnu0UVcU4MtsyA2WgS322kUibkYS0/nFsayYEG4/Z3nzbcK0jbCX
	l1jAkQn8fkwNXbOT7jw8oG2DvXPGWwVQ9x3G3cHc/ND8iDR6FHZDJJZdOLgRwXiDziXMTjEPh5O
	llT86qbmEK3GwyU5WEMqSArjTBMJfRVkMoHEJIa0VDKUe+BnXZqi0AYwTOVXlKxVlCDY6ukwHE7
	qDpAEtXeOjsVvQ3IPkL8YphYmOPKLu9K1kmH+cfTAZbD88hfes3CXaU0tBJ4KJWla0OthXmqkAv
	jaIKFsscrrbuFuFxIfQJYB93KMWk+paznXAl7VGhRXbCMXDjjl4zn41cKWQg9NsHbvCXDCz+xf6
	pS2Cri1asWYWSGV4TLwiKgxXNZPOSMlT8Sz7XHxSHGj77aof4Sm1aZ8wbRIiBlFTD+inZHGzL50
	TwIy0Nu1k7ZGgUF72Ei6iEwH20zZwm3ZmF+U8waaIQv4MfnRjO1wSOqE
X-Received: by 2002:a05:600c:154c:b0:4a2:729:f7ce with SMTP id 5b1f17b1804b1-4bb8881c378mr209100495e9.8.1795380703662;
        Sun, 22 Nov 2026 12:51:43 -0800 (PST)
Received: from DESKTOP-V28CTA4.localdomain ([103.125.177.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm338371075e9.7.2026.11.22.12.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:51:43 -0800 (PST)
From: Arbab Haider <arbabhaider649@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Arbab Haider <arbabhaider649@gmail.com>
Subject: [PATCH 1/2] media: em28xx: defer media_device cleanup and free to em28xx_free_device()
Date: Mon, 23 Nov 2026 01:50:27 +0500
Message-ID: <20261122205028.41222-2-arbabhaider649@gmail.com>
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

When a USB em28xx device is disconnected while a V4L2 device node
(e.g. /dev/video0) is still open, em28xx_usb_disconnect() calls
em28xx_release_resources() -> em28xx_unregister_media_device(), which
calls media_device_cleanup() and kfree(dev->media_dev) immediately.

However, struct em28xx_v4l2 remains alive until the last open file
handle is closed, and v4l2->v4l2_dev.mdev still points to the freed
media_device.  When userspace subsequently closes /dev/video0,
v4l2_release() calls v4l2_device_supports_requests(vdev->v4l2_dev),
dereferencing vdev->v4l2_dev->mdev->ops and triggering a KASAN
slab-use-after-free:

  BUG: KASAN: slab-use-after-free in v4l2_release+0x325/0x380
  Read of size 8 at addr ffff88800787a260 by task test_em28xx_uaf/53
  ...
  Freed by task 30:
   kfree+0x162/0x410
   em28xx_unregister_media_device+0xa4/0xe0
   em28xx_release_resources+0x70/0x170
   em28xx_usb_disconnect.cold+0x107/0x2a3

Split em28xx_unregister_media_device() so it only calls
media_device_unregister(dev->media_dev) on disconnect, and move
media_device_cleanup() and kfree(dev->media_dev) into a new
em28xx_cleanup_media_device() helper called from em28xx_free_device()
(once the last dev->ref reference, including em28xx_free_v4l2(), has
been dropped) and from em28xx_init_dev()'s error path.

Tested locally in QEMU (x86_64, KASAN+UBSAN) using dummy_hcd and
raw-gadget emulating an EM2820 device across open->disconnect->close,
repeated disconnect, dual-fd open->disconnect->close, and normal
open->close->disconnect scenarios (4/4 passed, 0 KASAN reports).

Cc: stable@vger.kernel.org
Signed-off-by: Arbab Haider <arbabhaider649@gmail.com>
---
 drivers/media/usb/em28xx/em28xx-cards.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
index 1d4f30cba..d8f2e40b7 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -3773,8 +3773,15 @@ static int em28xx_media_device_init(struct em28xx *dev,
 static void em28xx_unregister_media_device(struct em28xx *dev)
 {
 #ifdef CONFIG_MEDIA_CONTROLLER
-	if (dev->media_dev) {
+	if (dev->media_dev)
 		media_device_unregister(dev->media_dev);
+#endif
+}
+
+static void em28xx_cleanup_media_device(struct em28xx *dev)
+{
+#ifdef CONFIG_MEDIA_CONTROLLER
+	if (dev->media_dev) {
 		media_device_cleanup(dev->media_dev);
 		kfree(dev->media_dev);
 		dev->media_dev = NULL;
@@ -3826,6 +3833,8 @@ void em28xx_free_device(struct kref *ref)
 	if (!dev->disconnected)
 		em28xx_release_resources(dev);
 
+	em28xx_cleanup_media_device(dev);
+
 	if (dev->ts == PRIMARY_TS)
 		kfree(dev->alt_max_pkt_size_isoc);
 
@@ -3997,6 +4006,7 @@ static int em28xx_init_dev(struct em28xx *dev, struct usb_device *udev,
 	em28xx_i2c_unregister(dev, 0);
 err_deinit_media:
 	em28xx_unregister_media_device(dev);
+	em28xx_cleanup_media_device(dev);
 	return retval;
 }
 
-- 
2.53.0

