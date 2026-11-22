Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795386241;
	b=Is0PBgsprluDXaZkf79aHT8Fux7sjNXvfFGCSGbJpvjlR55cMGHamXnHWRXV9366Cz9g
	 aFq/PLHdTWxQ1775HdAGFI05fNrPcdiCbNklUOV/JPxZaMipcGcR39sQ4YnYxwELb2Fkb
	 YiACdXED5A+O42g1Xko/DkgfQRYUsnIInvSjkvlWEj1VCpjJHPfUQCWkkxraUFVM6/oqO
	 iBJlapvLKEEn+SnbaUv8a3ZMvpwn1IyLjJSZAFGswDhQB6GlgYERT5UvG/6p1KmINKbYe
	 8VR8znfni2NefbaUbpa4Y5/KoDTonRK2+1JiMHrsJXa0m+6mHdb4EGkdxv3Ofljnegw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795386241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KapwmbLEAkf33u/pzzWw2QZ8gktGhjW3ZtX3tKdugF0=;
	b=1wH2K/JxC/Ynd/i+fNpSqbELuZqYwflV/JLutiRTmsKF5J5WdlrsvgqQHKakZEVs7N3N
	 LqetIkO87NjnhdNi+ZH6rcMBN4UbfhCwxNZ/nl9Gbbgu65szILJcNsQkV+8Mz7DmiQ8Wk
	 Hs3qvc4zTII4orIPqhUcB2LzjrEjE5BWBU2w8HJLVdfehaXDu7PUkxqCfYsFIodVc89CZ
	 5r6eybOYPsFX3Bfgn/W6giPEuHKF5XVMV85GUuUrqVuIBjPjt3k14QW291lkGl0N9tXoW
	 1DAQ5Cj9R/ae/77nDAsu4AhXHb0WzfBuLIIdRlkfZ1pTOrbJg8CyUOdg10HXJVz/X0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="i2R/yJDp";
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68951606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:24:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68951606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i2R/yJDp
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-498f5fa5103so1514142f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 14:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795386240; x=1795991040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KapwmbLEAkf33u/pzzWw2QZ8gktGhjW3ZtX3tKdugF0=;
        b=i2R/yJDpimHrS7eYZJtZGDiAVywPsyyCOvmfEFaBp62uI/AGioNG75yqZfkLhniRZe
         XveDSojPkBIOpjRK2be4jGyKusAB0nSulLHu+9ppxXnIqkS5IHJFFmVC+mDYLFpcwq9a
         Lz1Nc+emXSnUwLJLdNApyezog9ScRwCy/qU1ifQmte3tQRYD55fax28kl24H3LllvGg3
         CWDnPf+uCk41JyIqu+qyNyqWMxGoD9txa2fLNbcizqYDpzX+frx3Pbyl3nbuq0qs1OVJ
         VyUMHoRarnfkT73FlKZ7EHPHmr6GW2veNf/nACQTJ+Mc9J8tQQjm8iCGVEmDTE6vZoK0
         uBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795386240; x=1795991040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KapwmbLEAkf33u/pzzWw2QZ8gktGhjW3ZtX3tKdugF0=;
        b=aP9QtBKYRZhOSlXXKStVg/EaOGDUPafePSMe4pBt2SNJ26xg93n8JOQbZJ0yRLiFAg
         DHNYj/21PY+bdJ9OQ/zQD9egAQuieg7/AweiYhWIV6OHm1Q1k/unCgRftoVI2yUsjnli
         SPEAWGsfMxE8zwXKWg3U7kIrk5+UeUoQtykvVRts1umCa+4tu2hJV/1JIUxnV/c5kWHf
         HKX39GyBdtX9FfbU/vLeB0kb+sO/qDs4kJiGedtJ0a08z4RjUx4x3upY7iOhfRMzoKt3
         ywI4g464pW0vLR2CX6tgDtVHYeJO0scTHoMryg5GE2Lf0WNdZafgWuSW5PeJo9cReFVk
         iq5A==
X-Forwarded-Encrypted: i=1; AL+hErEpNSbE2HnwCR5Je3Alijbrs/uG1F5oRHA6MJBIn4Mngk8SPpBRjYcNDOD6Np6u9MXwUEjqhcRRU2XmGIY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5ZyhZZMmDJoHccYPBiwYc6FSn+v66Nw8AEeh42tHdnkJL4Zfk
	HAmmBB1bhs+d7bctua4GvZYgCFoFk99ccAhraMnwl9oWAs4LT+SGTWNTb8sFvu0v
X-Gm-Gg: AZFdTZf9ZjqwhjbTP9OGsRRvt3ybhnyo/Z9KCzaW0KjT1c6azEPFaRzCBlzJBCvv88b
	u0BkdO8k/bq3jA4i45jnvV3jMEi+9MXnrt2Mp0mkVNrUjTVOpzYQ9HXj984bghq9fe6UUlvPdqN
	dG5Depc7+jDiI3YNKTMmVob5aFk1TpC+5w+STUSUnhKxi56JPR5U0VWMVdq1JOYEbl4iym6xuIK
	NuJEr3vHVdxYGTn1ec8ki78KuP5KAV030QTX19KKjYOnNCt/wEQcIYNa/ZhO8PPVHDvtZfla0K7
	O3gWHXH20wx7HgF8kJ4gj1QYZeORD1E4dWolgrwelCFvv01h9vZ9q+H6f9SiJvbbKvrAZIxqIZo
	iwRiCC8xtgYBP0cg0XkXzyR3UjO7WmgbzKvV+EzBy5g8MuQhHPGZ2ee0C2CNAGEripKrKo33K3w
	jFS4NSNvRDJw1rIxSGjpkSCNGucW2pvpqLMkEtgPIuPkqPEQra7hIPCH+c7joinU55haoQWIs9v
	PNn19Qo47sObuCINP28GJyD1yM0fR6D8BthjRoqQ+NSlaIoMRI+OgWgsRWJP+3rTjfsVbAEpfSI
	hCsSxmRRaGOVOMhMGQRtBcSeOQquC6zIn6ecMb9bkNEdgRpY0m9fWw9jS4cBIdUmlojm1s26KcX
	jfA==
X-Received: by 2002:a05:6000:2085:b0:49c:192f:cf20 with SMTP id ffacd0b85a97d-4abacfea524mr18694027f8f.6.1795386239712;
        Sun, 22 Nov 2026 14:23:59 -0800 (PST)
Received: from DESKTOP-V28CTA4.localdomain ([103.125.177.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c248b75sm18912122f8f.54.2026.11.22.14.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 14:23:58 -0800 (PST)
From: Arbab Haider <arbabhaider649@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Arbab Haider <arbabhaider649@gmail.com>
Subject: [PATCH v2 2/2] media: em28xx: avoid dereferencing dev->intf after disconnect in em28xx_v4l2_close()
Date: Mon, 23 Nov 2026 03:23:26 +0500
Message-ID: <20261122222325.41868-3-arbabhaider649@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122222325.41868-2-arbabhaider649@gmail.com>
References: <20261122222325.41868-2-arbabhaider649@gmail.com>
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
open->close->disconnect scenarios (8/8 passed, 0 KASAN reports).

Fixes: c6d48134cb26 ("[media] em28xx: don't store usb_device at struct em28xx")
Cc: stable@vger.kernel.org
Signed-off-by: Arbab Haider <arbabhaider649@gmail.com>
---
Changes in v2:
- Add Fixes: tag as requested by Media CI.

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

