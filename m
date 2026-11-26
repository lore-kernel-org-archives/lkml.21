Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687708;
	b=dLHTqkix6k0W7PluYOvJk0BTCRo+NelT/D/ZS9N90PI0+oKOh1HFi7JeyWt/haeSOaDj
	 6tjQbkSmuwRKJQOCF9i1qu9WtfuT0Nd8x83/BlfrbXI+TOCz0dIcbXv5V8SAiNPdQID2m
	 2eAgbZE6Ihrbwwi9SIgTXV/M8sD7LsWq2eVpYjk/KOhuC/tIPiQjKfEzxAHlJ7SedxLY9
	 9QnvjNPaWH09e+Vf2sml39GsfTQFXVrWetDvDj11KSsm2nsLMsAPLApzlsOINkwpql760
	 ecyMFz4l7attkNLezCuKVrcUYaJjzmSbQkkEe0Fqax6Aa1AOhPViJOI+PZOj0HFdexg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687708;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yhJLheRK2k8iW0h1BrUFUeUwi944GYqdiiaue7ukRoM=;
	b=Oqac8vAv/ruDhVpUpNP5HcEByCzq1q7BoydW7YE8BYNbeEQ8O0gsl/sHmjDxous4r3eu
	 h0qROnjTDQ8r05xSij6RyB6TJTBMwB9jbwQIGHM17qpuKXiMcPgntbM1UGbWPJj/N85Mo
	 9erxLK4buqu/YqZVhLbZev7i/UXs1JrZ47YMMlbojB7FxgmXemkP9QTbd+ieOS7fmqJyX
	 rnBt3GOHIbT5+I2CGq2UK3p7bjz68tEVrL8ff3p3s9FBBqx+wtg545pUkNziJUu7rfWN6
	 gmPgkyvq2nPp4/AJEyRSwuSv2VDmKzeQpuxtLcUBYzmnOPNtYKm1h3EM1cSFlkDrm/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zmgTBLo2;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF283606A330
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:08:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF283606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zmgTBLo2
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-49412eb1474so4427842f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795687706; x=1796292506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yhJLheRK2k8iW0h1BrUFUeUwi944GYqdiiaue7ukRoM=;
        b=zmgTBLo27luXCYwakoBn1tfqpIuR9XRYiH9hY97k2rY8emO8toHDfYZY+poj9cEtzN
         hlTWo05Wqnl9HaB94VSrynltCn8bZMciKwMxdHw/x1s3+MOupcVx5SluLOcUbCT5x2Lp
         k8SAgaUMrI7vFCBw9/Je04NioiV62CJ9hmq2TmQxNkURZUl+LnGHLOS2IruzdawKfklp
         sNaDUbnNAbxssrV0wf+GqDlijXrymPnOfdqV+hLEyvuwL2JGbh9X7AIdvRe8GYxDO0au
         xLF2/UcHQQ6IOvXN4O3Cv9kNIAaYQxgFjkm9HDzrd4JYpdq06cg+Fg94pO3y1SnSoO0N
         vhMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687706; x=1796292506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yhJLheRK2k8iW0h1BrUFUeUwi944GYqdiiaue7ukRoM=;
        b=2ZtThDLmhSGdtqgFJNtz/FjS204+0U6QGHPkpZo7m5ThrRtTAzThfMO7uADSLWgEYR
         Nu0UXZcmQGIuW0Vljyi0eQQ/LGO9Kd+xbb0xUkLoUtmirAO1+XcJBjDp82OaLk5hI2Lw
         IHQjv83O32k4I9Rxd9oANlHbo4MbcBCD8RK3conNN71Memlf/SBDWUWecg9A263fQ6pP
         qy9aCvhPh2zNkRrAKLi5eTc6ElyGyS+VORV5I5r1iJGdYooBPfO+Bc5pLtk72WnFFT7B
         VktM1buumSkFQE8qP1mN+khsjAWCBYmITjp9ymdDMjG7uhPPZ+4iowM0h8KyhWVLmHQH
         3iWA==
X-Forwarded-Encrypted: i=1; AL+hErHGdyuNQmJgtKWs/JzOWaH6KgTWXOuFaPIRveDU+1B4pBmSc/ZyATo1m1VBBoP3A+l0VQddv7UyO4li+UM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yMO1auHgZ4U4XwvBVRzQhW9oCKa+Lk2eyXQXGR3jZZYDc2Cmw
	s46hxWdTuk48TDWjXy2ByYRqhZTO63z/yADuShL8BFsbkQOowgXYl14nmj1dp3a+
X-Gm-Gg: AZFdTZcPKW2JWhBYiBjhQUxx4790Hr2N2uQIYZ4UGDxb9MdumS8+QFkNfDZGMJh48xT
	dMI6IAqEjJy4ZQPWuQwd/JGch1Ph2laRM/lxOt1zdFpmS9h89N5PO/zBeG75Cz8Oyu86u4hr8Vz
	eTffPyg7HKheSMf3fM6ECf4gHHkppUsb5fOTdp61DTT3h26Ag4JwkBnbISSbJ/Way6lQJzGVRZN
	a4X6gAGcWO39RD1YpIjrCWw8C2LuCneS92zxH42MXIa8B4KS/sWoilMLnPsO6NMtSLibEEpdbGI
	Mim8KDRuZayI3j3Jmli7DWCJXiabzKgpls0xWrCKBVVi+x7NEpns0jfrarJUEIKTCB0EiP8QkUJ
	3AgT8MnEb1mNXDIUUjrFfG3Q8qnwMA7EegTZXBM9iEBiPgudvEs6O7DETCM8tO5+0jdFG4JfzJq
	2iLmUmAKbT2Np8Uu3fNkWnzME0asJTsXePQoXX7NkZHy7dQH5ZLEdWJ06wRQfKOLiCWwq8PAaPz
	O5GGmTPeRO5dBNZfIPvGxpKNTS/8hWDlUK6EHKHtTAqOgY7cQI9l+BHgvgxCRodAYXSzzWHXYpa
	0xKZh+E8CGTZVmeDDQL3961pC4cvCCFPjUB26kOgW/9s4TkmhUgapWYXNXXU2uZk+cbAbsI/1g/
	v
X-Received: by 2002:a05:600c:e549:10b0:4bb:a60a:fc8 with SMTP id 5b1f17b1804b1-4bba60a11d2mr59103625e9.35.1795687706012;
        Thu, 26 Nov 2026 02:08:26 -0800 (PST)
Received: from DESKTOP-V28CTA4.localdomain ([37.111.157.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b2437sm830600705e9.13.2026.11.26.02.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:08:25 -0800 (PST)
From: Arbab Haider <arbabhaider649@gmail.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	linux-kernel@vger.kernel.org,
	Arbab Haider <arbabhaider649@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH v3] media: em28xx: defer media device cleanup until final device release
Date: Thu, 26 Nov 2026 15:08:07 +0500
Message-ID: <20261126100807.356864-1-arbabhaider649@gmail.com>
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

em28xx_unregister_media_device() clears v4l2_dev.mdev and frees the
media device during disconnect. The driver holds dev->lock, but
v4l2_release() checks whether the device supports media requests before
calling the driver's release callback, which takes that lock. A
concurrent close can still dereference the media device after it has
been freed.

Unregister the media device on disconnect and defer cleanup and freeing
it to em28xx_free_device(). The V4L2 instance holds an em28xx device
reference until the last V4L2 device reference is dropped, which keeps
v4l2_dev.mdev valid throughout V4L2 release. Keep immediate cleanup in
the probe error path, before any V4L2 nodes have been registered.

Fixes: 37ecc7b1278f ("[media] em28xx: add media controller support")
Cc: stable@vger.kernel.org
Signed-off-by: Arbab Haider <arbabhaider649@gmail.com>
---
Changes in v3:
- Rebase onto media-committers/next and replace its disconnect-time
  mdev pointer clear with a lifetime guarantee for V4L2 users.
- Send the cleanup fix on its own, following acceptance of v2 patch 2.

Changes in v2:
- Add the Fixes tag as requested by Media CI.

Validation
- Built drivers/media/usb/em28xx/ on x86_64 with MEDIA_CONTROLLER,
  KASAN and UBSAN enabled.
- Booted QEMU x86_64 with MEDIA_CONTROLLER, KASAN and UBSAN and passed
  three em28xx and em28xx-v4l module load/unload cycles. This smoke test
  ran without an attached em28xx device.

Codex assisted with the rebase, source review, commit message and build.

 drivers/media/usb/em28xx/em28xx-cards.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
index f4b6dcf597..cf0312fc46 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -3773,11 +3773,16 @@ static int em28xx_media_device_init(struct em28xx *dev,
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
-		if (dev->v4l2)
-			dev->v4l2->v4l2_dev.mdev = NULL;
 		kfree(dev->media_dev);
 		dev->media_dev = NULL;
 	}
@@ -3828,6 +3833,8 @@ void em28xx_free_device(struct kref *ref)
 	if (!dev->disconnected)
 		em28xx_release_resources(dev);
 
+	em28xx_cleanup_media_device(dev);
+
 	if (dev->ts == PRIMARY_TS)
 		kfree(dev->alt_max_pkt_size_isoc);
 
@@ -4000,6 +4007,7 @@ static int em28xx_init_dev(struct em28xx *dev, struct usb_device *udev,
 	em28xx_i2c_unregister(dev, 0);
 err_deinit_media:
 	em28xx_unregister_media_device(dev);
+	em28xx_cleanup_media_device(dev);
 	return retval;
 }
 

base-commit: b4e3c4b6a36fd76f57bf3e48638f68ddecc54ba4
-- 
2.53.0

