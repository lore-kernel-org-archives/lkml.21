Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795380813;
	b=r26zwewHdaZ/adk9T+sig2fOS1NTWrqgg+Sh28Lr9nSwJIxFK6PO3HuSpmuqmL+ZxoyK
	 sXo/wWY3AR3BcanHKiuCkIXimyFsVoTtl6R3MjqI5SEzFcVaJCa6VcdRBrF4WDpKlBNes
	 Ponsi/XKqsKuZAAO0H5zUpZ8v3YWNwP7viMjAQKZvnVfaROjkdkK2yzukcTifsj9YRqC+
	 sDtSfX+R/Kzm2TzwEZNDfuUqqXjls7dIe2X+Fy5vrn+FFxNdo7Kg43hs85b0evxedRpFa
	 k3r0WKMKLrlmrhg6H7dn7QcsYq8d7DjDvA6dlrl0L+JBanRj9SxsZ/SVUpS1bTWf9+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795380813;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jCkKjGFl/FESlc4vs2SRng6oOInHAgHTvIB3dJ89NUk=;
	b=zgePczFx7bTDPgVJCSQatiTySsg0RR6YUjOZkThaBu2ZEGGv/yqCjfKxZC3hjzmrVeJa
	 XATsU4yaT1GC10CIhIMfBfnRKTxPJiydzdX8J4bcVFiZbZAtE0HjhthA8XruThxAPGUJl
	 eyjZKAvr6E615Xops0U1w+sv/ooxAy6ETDvMXpt3/PVZ/bFbWK3PKTUL87nXOsON3pSaX
	 Wm9hEXY5hB+UCshIrfSYgBK1uA/mV3Q4o5gffpd260r8nTgBCinKFiF9z0++KU+RfdRdK
	 jCYLwM1RXR8zSGvMKMS02aHZuhINs2PUCcSXG5ozZlPaZf/iahbqakfNkeTxegz/xKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R6GzwmoP;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A497D606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:53:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A497D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R6GzwmoP
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso19178315e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795380811; x=1795985611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jCkKjGFl/FESlc4vs2SRng6oOInHAgHTvIB3dJ89NUk=;
        b=R6GzwmoPbZ8PGALr9DSfhHfc85bDo/sOdAuzBt0z+ZCv+J7FlYUabjiK4MCSj4gAaD
         0DXWS4MA7hLUC+Pd2c/9LzQNkyTTrnpawv/ct5UjVxUeR8NSGXDdNqVZvEVFRMdqw6Fg
         Ks3EGKtOFzOipgT1nxgyXfjFZXi3jXKjUjA8a6hFFaPHVyVzccaef6hjGvAclbzF5nTW
         KTajbyT7KBEWxRWIeT8mYe9tkAZSFyo/p4BF2QOARmSftJHE4YBccBJQ1yu/hvb48V5f
         BUGZsm0SrbOnIGAqAzWkoKQzhxBpG4qCjyyVepBcGciGA1ff5utkMVV6XVXu9l4z1xY5
         lSdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795380811; x=1795985611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jCkKjGFl/FESlc4vs2SRng6oOInHAgHTvIB3dJ89NUk=;
        b=hOvq72/2eup+q2IxjaX4f/t9YRsc1hE9jCHfBgW9CJR4EQPzudEGc1VInBQZUrewIv
         491l2ZOUav0ciRMKZY+2/ZB8Ss9708InF3uzvxe/eWEQLv9n5UiEuNDAC0R4/lNtSnDu
         tfQmxmd+srocxWUamarELG20YpFXFM8kga9mPnzzMjJ5r4EIYlFqs0Jbh3BYVXeDFn8c
         HsLua7R2+WeiKRMZc8VlA43i/Ny98bZjHwlr0Q+u0aJbD7eIRCvw2gm6+yfRmrURXHUs
         sbEXgEaPITZZUgLb843VFtoqEnUppI+BXNQgLoBmql8NPeuU0iAFjMqk2ekvq/fRX3Q6
         Co2A==
X-Forwarded-Encrypted: i=1; AL+hErGvvLjadtYyZN8xtCPQfIGCwX/e1FS8aDcmN90ID4sCQGSp8b6DCm2ly0maPu1YrnUDz49YuTzAhohN15c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2K3E7M3XwnNkRE+nSpHXeSgh8JYPxsJudiUm2+CCvEX7maRrw
	JAVTPH8MlHsebC7Dg6WPNTvScR3CsiQT6CUIlehcrq+Kdk/YD0GuQw47JXGbmuDR
X-Gm-Gg: AZFdTZfJIhb+aXmtEO/vc+aSEb3+W4ZZGO4gJt0RvYgvoBuCoOUrVngoxBRXaE0s97/
	3Dlq5D9bbbWm9kdBFkkWyW6ba5Fm1lZfVFP81ABiWqQ8knWLMsATPmmq4Il8K56SUjv8AgU7DHd
	5Yz83f3ErOlNBFwI8Wjjlvrdc5uMck1m3KCRhklPeX/YEznyH/dnvVwPoMLf5r0toTf2JrMPxTG
	I0a2ZoBi5ilYThPrmc3B6z6QPYuWtluQzzbR+cP+3fTqrRsdl8GtqX6ffK/OL/7ltPjQPCRUTuA
	OjcLe20/j4Yh1c0topYRE7PCdthMM4PF9SMPRiFuSIkkve1PbAdJ/1+GcvZVfsAZKDL9Sie67p+
	MueNZ4LhfoWK1sZ1XXgULv5mg0b7c08GDP48eijpjeoS/2vTI8wVfdMQqALPlrzjK0GQKE6YTcd
	6JV1kZUHEJUQhymgY/txg99Dm/yPwPbc/WSyqCcVK50Ar+4lTEJ5DY+QGJNHtBk3tfGKRyTK+zU
	PNzIcCSntE9Mvdm2PmmzdPKQZmzR7YR8OYjSNC/dnn8ognLHTm9IPVF71dZmZyVt37+odCbX+kP
	7VjgjN5woNW2SR5/Gu+cdD/v6gLSOVvCAfLaBOoSWOUaEqBVjdprr7uv
X-Received: by 2002:a05:600c:c8c:b0:4b7:6942:39bd with SMTP id 5b1f17b1804b1-4bb88820e06mr193076305e9.26.1795380810868;
        Sun, 22 Nov 2026 12:53:30 -0800 (PST)
Received: from DESKTOP-V28CTA4.localdomain ([103.125.177.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm338371075e9.7.2026.11.22.12.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:53:30 -0800 (PST)
From: Arbab Haider <arbabhaider649@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Arbab Haider <arbabhaider649@gmail.com>
Subject: [PATCH 2/2] media: em28xx: avoid dereferencing dev->intf after disconnect in em28xx_v4l2_close()
Date: Mon, 23 Nov 2026 01:50:29 +0500
Message-ID: <20261122205028.41222-4-arbabhaider649@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122205028.41222-2-arbabhaider649@gmail.com>
References: <20261122205028.41222-2-arbabhaider649@gmail.com>
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

em28xx_v4l2_close() unconditionally evaluates
interface_to_usbdev(dev->intf) at function entry, before acquiring
dev->lock and checking dev->disconnected.

If the USB device was disconnected while /dev/video0 was still open,
struct usb_interface (dev->intf) has already been freed by
usb_disable_device() -> device_release(), so closing the file handle
triggers a KASAN slab-use-after-free:

  BUG: KASAN: slab-use-after-free in em28xx_v4l2_close+0x37c/0x3a0
  Read of size 8 at addr ffff888007245890 by task test_em28xx_uaf/71
  ...
  Freed by task 10:
   kfree+0x162/0x410
   device_release+0xca/0x250
   kobject_put+0x152/0x2f0
   usb_disable_device+0x324/0x570
   usb_disconnect+0x271/0x950

Move the interface_to_usbdev(dev->intf) lookup after the
dev->disconnected check under dev->lock, right before its only user
usb_set_interface().

Tested locally in QEMU (x86_64, KASAN+UBSAN) using dummy_hcd and
raw-gadget emulating an EM2820 device across open->disconnect->close,
repeated disconnect, dual-fd open->disconnect->close, and normal
open->close->disconnect scenarios (4/4 passed, 0 KASAN reports).

Cc: stable@vger.kernel.org
Signed-off-by: Arbab Haider <arbabhaider649@gmail.com>
---
 drivers/media/usb/em28xx/em28xx-video.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 84424284d..854fcc897 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -2503,7 +2503,6 @@ static int em28xx_v4l2_close(struct file *filp)
 	struct video_device   *vdev = video_devdata(filp);
 	struct em28xx         *dev  = video_drvdata(filp);
 	struct em28xx_v4l2    *v4l2 = dev->v4l2;
-	struct usb_device *udev = interface_to_usbdev(dev->intf);
 	int              err;
 	bool last_user;
 
@@ -2512,6 +2511,8 @@ static int em28xx_v4l2_close(struct file *filp)
 	_vb2_fop_release(filp, vdev->queue->lock);
 
 	if (last_user) {
+		struct usb_device *udev;
+
 		/* No sense to try to write to the device */
 		if (dev->disconnected)
 			goto exit;
@@ -2525,6 +2526,7 @@ static int em28xx_v4l2_close(struct file *filp)
 		/* set alternate 0 */
 		dev->alt = 0;
 		em28xx_videodbg("setting alternate 0\n");
+		udev = interface_to_usbdev(dev->intf);
 		err = usb_set_interface(udev, 0, 0);
 		if (err < 0) {
 			dev_err(&dev->intf->dev,
-- 
2.53.0

