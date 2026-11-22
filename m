Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795386234;
	b=ewXi3oIjZIlb9hepdLLh1M17mK9I4JfD0qgz9k7aWchQ/d43jP/uCLbgLplML4u57B7C
	 Tbj9lypQPHOJb/2V38rwotjRwNFN7gLuk/xM7ksKTPHBAkvK/99a0u0tWdgjmAkjaEdDq
	 too2HunZKactuDdMo7MAuXqLBP6kqZ2D39GsjB4lwrqAhYsltT+/3yjiy4oS2tAUoXGKT
	 RbulurUhi0D1ojP0ql56f+gfM0vl+XL6kyXUrp/rw27SVQS9/2j5N9FYmRaMX9kCO6qPR
	 TEF6QGYLK43Y9GnnEXLLjHTp43WwB9McKAyWAgfcy4AijfeN6gvw9IRSXvS4dPhax7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795386234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=g1rf+mZqzGcuKHBfH1ERkqVr3eZQNXDNUs2hkZSgB3s=;
	b=2wZCgsoOYR38ub2E1c+TdTWrfqP6ZGUh3UUGmXkHSEzSpQwOi7SqJNTFh9Gq3LT/PaUe
	 aIrbm0WtIBe3mbOTL7+naEZE1veHSA5MHcO3DvTY5GCRbIqWcZnNhPrUPvez7/96QuTaF
	 +3wsSEoSmZzUL2i3PGVpKsO3Sh7MSuwSLGmKQ6qA+LEbaOW2WdGFgIfsrvh9wI9Vjnz41
	 9PCDL2Eu9dnuHXHaXcT1hVSt6Y12GXN/vfT5oKny+kUs8VoWKFbaXzJfwb7mzMRhNj8Mt
	 nmPSRrjPsOKDV3dIQL7LPU7z/vvkjs7tFERW1zPQIoBWhpscUwP0ORQNql7uA7+LqVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kOLAQ6Mk;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71126606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71126606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kOLAQ6Mk
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso32017065e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 14:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795386233; x=1795991033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g1rf+mZqzGcuKHBfH1ERkqVr3eZQNXDNUs2hkZSgB3s=;
        b=kOLAQ6MkSeSAaU5s2IOa5/g5y6HMtZ+c/iyPdXJaaKDjCsZMPBJcaUthOBmovC41s8
         CuJX3IBG4cG5gcwdjpyf+nW0RQUPL71Wvys0Ov87i+MBGyxVv60LRwvGnW/ymcWUMAfO
         hT+RVgWC4MAD5z1EBJVNAE1qfCQqckT48dIHQJdWeadYeEEyVyRsbcG43WlSVAkoFiLq
         SjubTJAuIMSrrZN+3qaIBjjysYdUlpiu3lWj/kJypbXtzGrVuPk5MJAnRzM68u0EF/Bv
         6UjeAi77zQTO3p8JiLPxIsCJqk4NCFeJGR3uLAV6EU47oQY109v/d15lqHWBP4YuDevC
         rfzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795386233; x=1795991033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g1rf+mZqzGcuKHBfH1ERkqVr3eZQNXDNUs2hkZSgB3s=;
        b=OsvaEifROKPNdHzL0gTG/qsMHstq4YHuUgkCuXjhLQaxavZ4FdXLlZByH7yKl64K97
         6NieKzas29rNxgflrz+miapX2xCCbSHUbIQDdB1LqMIud9txI6/e8h2CWbBEWFSU91vZ
         4nqoauErpYOmgEoGdznW3hNpgXJczW5QA7/KGOZIgImVBrMiDBV5oQNny/IE/FV2RSX3
         kPx/agZZMUTunHb8QkyTR7QSOAFhmks3uiYFAuXnf/qbJpNG7txF7CwtLlxF3ExixDdn
         BuOm/5ORhI8dT1OFg70Vl+2QGKE8CmSre6KfcpDJavL8Dx1OhpapGJABVIOamO+GfM22
         q4Jg==
X-Forwarded-Encrypted: i=1; AL+hErGsiMmI3N5UfoidZ7s5U2CXp/sYRV9Xqtz57CVmc1kTRPwossfd0Zitj9kt98DAyMkUoPILUEPT79pD738=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Pip9UMtwtiTYUOtAkJ3XH8kySpalJHkhPufU2ld+y0KdlZ9pH
	QpWUo3/8ilytAIkybrrfMB9iuLNkp84zJiMfS16mxxw4tsxseGxg4TA6
X-Gm-Gg: AZFdTZe/AhG/FRS5V1WsecRu4WGTX47eE+qppQaLCUM01AkRAlwyoo6q3lIYslhBGvt
	NksySEfNbFPBa9wVuDlnqSp95jlKvPpBQxS3AumF36hiuQ498a34DQTi7i744GhOPQWX5wEuMBX
	u829lQ0oz/vnGI8/zxj2IfUJ6S6JLcvpkfkHloMcU3/Hvj/WlH5nnh/zdeu4YSIJ6a6ihX9IgVj
	3wONLehWRS7ha3c2cPdj6+EvUhPftYSoGrQ73iPGtQ7G5Acl8TfdBhCj6vGUVKB0OAdbaHHC61Q
	w6u9WgMKCO0ngoXr9G7YIyURRdeRS11OhtRfHe1BWjU6zK5m+eYwas0Lcb7wHImxh2dtNhm7vbN
	gcuql0nMzzrexOaqnWDB9Xi+nUtPwp8uxe4YlrVrHgJ1DkWj4aug7PIdWVd8ib/gjmteyAWcGZy
	GH7Njo88SGK0SKqnUDGP/d0Y0Td18KjaBVTqPDnIjLjT1Yn8vzbFl2K0b9OIWV7oRv+1eeE4U2p
	l9gROax/x2My6etbObq1CT7wqfdI8LXnE5kFvd4DK0U2t7YgYX+UQHG97yXGuahTnQSgQ+uZZQg
	IDoQzyC6djyJHy6ePXjSjHvdTKkFz5R2pBsMzCUXvJ8KqH83QtnQVZm/cQ==
X-Received: by 2002:a05:600c:530e:b0:4b2:2ec5:8a2b with SMTP id 5b1f17b1804b1-4bb887fe8f1mr200394425e9.10.1795386232588;
        Sun, 22 Nov 2026 14:23:52 -0800 (PST)
Received: from DESKTOP-V28CTA4.localdomain ([103.125.177.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c248b75sm18912122f8f.54.2026.11.22.14.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 14:23:52 -0800 (PST)
From: Arbab Haider <arbabhaider649@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Arbab Haider <arbabhaider649@gmail.com>
Subject: [PATCH v2 1/2] media: em28xx: defer media_device cleanup and free to em28xx_free_device()
Date: Mon, 23 Nov 2026 03:23:25 +0500
Message-ID: <20261122222325.41868-2-arbabhaider649@gmail.com>
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
open->close->disconnect scenarios (8/8 passed, 0 KASAN reports).

Fixes: 37ecc7b1278f ("[media] em28xx: add media controller support")
Cc: stable@vger.kernel.org
Signed-off-by: Arbab Haider <arbabhaider649@gmail.com>
---
Changes in v2:
- Add Fixes: tag as requested by Media CI.

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

