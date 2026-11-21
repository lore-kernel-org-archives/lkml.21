Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795254802;
	b=ROu2XQDXdPaMdhcQj/BLfkKy173/32RMDnK1ZK33TblNoVai0ErwQ8a96KQyAx7wpYrL
	 FfbaRMQQOORbSJTg1WhFlU9XVO4abIdqou+/stbQGkVrSGwFoIxMhzHFTVJBpDXWKmPug
	 S6wTFaEyQKiVlolEm/ULA/9LejUpS+sYflOJT/QlGaGF7AQTCFf2wlZwTlm45Pc0oUO2q
	 usUR81KI95nFsXiLjsVuX0peFsl+ZzfDziJCyMXjw4hg6NnGvlbcMREIxFtkQ/Hg9BbdE
	 iu28BsoBcIKIM4FUNdLGX5Wbz164a7xb5xeR1r+DI7jhAoJdnULoOkwba1F/LOSyNfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795254802;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Content-Type;
	bh=K7RUKh1uX7A867K8WvYbVtJo96/kAtY/2elAqdlJ0YA=;
	b=1N/+QsZ78S2DwwAcplXn+lOxeWM9U8xIOoQN7O1zoRXgT0/9sqY6RKdgpUkC23uG8lnb
	 AO/OPmNhVDQBw8kew+/XK/o/mt5pq80ZVY+3zOMx/elML3r+4+4IIbmmAeCvf0fSioNlh
	 cCX1hNyiPq2ZBm3vrYFNfrhX2UB/HM5hoxlZqNrYgXelOZcfog5ZD9M/MM8HcEaLPBOI0
	 eUzaS6+iuaJaIgcXc5GOvQGfgSOP2ZWWSAyCJalxjGkIEqtlLJnuvXfaA3UxQ0fOsTlDf
	 mnXPg+0/JY3r8hG8ms2rSXk+z7qB+bh1xU/zdVHfdtwt1om8OIpEiP1PZm48gnK07EA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KMJwaa1e;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6982D606A325
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 09:53:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6982D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KMJwaa1e
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b894a5ce3dso2240821a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 01:53:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795254800; cv=none;
        d=google.com; s=arc-20260327;
        b=UuEX8VBoUH/mdHR2Cek8Fqxc8p1IjQ1VGt5fQyfRstwGWOTYIinbUmIWZhEh+waz/G
         dlUAC9q+DGhDPe21fqXgpBoycyTedi+8AcDnPA6PWI8+9aFpiHwfz2XIluRDrNQ8kY2S
         El+RztQnpVOJ+DVUB3MG3JNqypTqw+I3lfYw+57azxT0mD4VtAhQxq7DaxIY8KKExNHX
         WNI7TGl6kX0wJnNxDUrcjlITTp2s+zFzeUHQ7t6XPRnYPlMpAoBoVi84kkA5FEXjwBv0
         Kb2BiNGnpFCed0Xc4MIpeLOtXccpIq+tcYUz49jST0chbSF3LopQmGFcwphKXcf37K3d
         UUhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=K7RUKh1uX7A867K8WvYbVtJo96/kAtY/2elAqdlJ0YA=;
        fh=6VwFgGFDMzo700Dhn/7Ac23nZKW9PI8Y8c6lmB/M6dY=;
        b=GHFcWkjymu84gZaT5gGRUwA2p15l2HYaN6FVYydRYcML9ZRFWt+ehxf1FpZ15+OmS1
         zhbz09ilo4zVv6f5S71hTK1Kbu2xjDwvrcMrIB0Com/uWU9fgVAYaTlGmdyiObuvawhK
         3WdMj8Gzsl622UdDo1MuxsdAEI8UwZDiEgdE8A0AUduq8Gm9oVDfxGp0cxrN8GYfMT17
         KDuwyGMfcx1XyPMegdI9SQN9ssFHNrycsICWuopCcDDB3bg/NJvUQO0XrEtlR1E3c2rZ
         HceMIjFz6LsxklkCFUvmAvAG+O3FdQ8fdzjJQBAlfY7Amu3H9HGsMXF5SZwtn/PICAYc
         /bdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795254800; x=1795859600; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=K7RUKh1uX7A867K8WvYbVtJo96/kAtY/2elAqdlJ0YA=;
        b=KMJwaa1eDlco/Mh3/beJ49kZcFt8mKAMc9Gn6G6Iye/kWshkQL66bUCTJyyRtls//m
         REuwBk0VdgwqUVsXNEoOvJnn2YQ3BRqVrgKX+WCMvpLjK31sIaZbNEkmkCb+xyV+Ni0o
         ANmfYFph6c7mtZ47OaO2eLChI2bhGW8IuNd+MNltJv8KZO03WUaKkq/yVTFDpugloozi
         ZaW2HiC5zIYv+xEGRXgjiqi9eLFTKqiP50kkDbflSGBq0OUEAEeh+jKS6TO6BCtmcnkh
         HUhemfVbyB11CDJBOkMFnpL/XaOAghon/zi/97EvFPns9SmHCjGitTJp7RQYx9kLe446
         unjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795254800; x=1795859600;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K7RUKh1uX7A867K8WvYbVtJo96/kAtY/2elAqdlJ0YA=;
        b=B2o+EJMd7drWWpafi6CQ6muTchx4qcnkJzSv1eBy8jNNXubzCXkpGVNwZZ10dX5ccU
         8eJSax4z2nJtngE+nm3YU0TeNSbjHA9LT6Uwm/9Y5zPEyMZOSgJUzH1dQz97N7jV5CKF
         iVNsZ0XoUi3IB5Yh4qc+BnAQFTwbh3Pq3K8G58T2vcoWz67rXbd+HnvzusKRWehPfzYA
         v6dLL4ctIJgrsmbAZMDUyAZ2PWO71N5csF8lqPD1ZxdzR6VeNjazjgp+etGlNACK+2hU
         BNQu4aOMO5y4iN4h80RRE0ODDBS0Zbq9O+GxgrA88VykQdXmZVf+tFy/A6toBtCrZRGn
         eK7Q==
X-Forwarded-Encrypted: i=1; AL+hErHfm2hZY3DDSi5MF0MPFaesFcaNYrejAH0nmwqs0ARLV2sYfD9r6yojb+MQCY8j7pN2/x0P785WbkU8dOU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9c87++9QpcGxKxiMyC/lkKwFwR8RC7V3BD9sB7nX71wn3DDvbA
	NKzGahWnQBF+xaCAdv3iPPahWCRT1alClM41eX1zHtai6258XkozccJ7q77V047i9DNWKrUPyIu
	LEeZaY2+6VXO3UdmXPp3YA4y8gtJsy6E=
X-Gm-Gg: AZFdTZeV4qtrb1w/H20klzsAOND0ZCt5ZG2HUBDLRM4QkXhnYOORyoDDB752Y8WG5BG
	gaBHOdhnVmjbQ8zdwE3aE8Fttu91eTXbJNy0Wwo4ZJkR11XihHKpw5QF7t72bdTtB8gVAlkMdN7
	Tng+ahgK+28PJhtMKRKn3LhuUuP2hccoHFJ962MKgdzcYw3+yQXAFLULOdBrTU6IFBl61RrSk4x
	4Sv2GsQ56s4+iJBI1ol36YEfraD0LM//b1nIwYZDXzBNM4UvLKeV7EsCPvFdWnpc/2ALx4OhuGP
	Bq2c7VEXKknIFe11brGYG+yowIX4DzwsNRenS6LZp9WPGpSZRQvxep5ghY25XTMT5UcLqD413sm
	PjTKxs51f6CvYxOVvl9mH2oiPHt/80wcLSyfHjLmwk69y+XM+jH7b6Gah/miNLYae5GE8t8wBhA
	but7ypMPSYffS+YAKxOTSBqVxWb5M9LRMvuK4HBIo03U9GB/nTLVHa6yMkhFxuJT+PsoK0aA==
X-Received: by 2002:aa7:da51:0:b0:6ba:37ab:bbea with SMTP id
 4fb4d7f45d1cf-6ba37e6ee4bmr3085558a12.18.1795254799445; Sat, 21 Nov 2026
 01:53:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Herman Semenoff <germanaizek0@gmail.com>
Date: Sat, 21 Nov 2026 12:53:36 +0300
X-Gm-Features: Aa3M54pZW9N0eqS443a-b6AlRJ0UT3HLETB1YWTjqTQK3774s7qnjrxowghtuC0
Message-ID: <CAMnMt5ZdLp+E7rhLMDE85fHX4URxUJfy+UfWU=ne9oapvwFRmQ@mail.gmail.com>
Subject: [PATCH v2] usb-storage: add US_FL_MAX_SECTORS_2048 and quirk for USB
 Disk 2.0 (346d:5678)
To: Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From e1d9f82604b335c38bbc79bc1fc03042981fc6fa Mon Sep 17 00:00:00 2001
From: Herman Semenoff <GermanAizek@aizekgroup.ru>
Date: Tue, 3 Nov 2026 05:40:00 +0300
Subject: [PATCH v2] usb-storage: add US_FL_MAX_SECTORS_2048 and quirk
for USB Disk 2.0 (346d:5678)

In drivers/usb/storage/scsiglue.c, the host template sets
.max_sectors = 240 (120 KB) for USB Mass Storage devices. While USB3
devices are granted up to 2048 sectors (1024 KB), USB 2.0 devices
unconditionally inherit the conservative 240 sectors limit dating back
to early IDE bridge quirks.

For modern high-speed USB 2.0 flash drives such as 346d:5678
(USB Disk 2.0), this 120 KB ceiling unnecessarily fragments I/O
requests. For example, a 1 MB sequential transfer is broken into 9
separate SCSI commands and URBs, incurring excessive interrupt overhead
and preventing flash controllers from utilizing larger erase/page write
buffers.

Introduce the US_FL_MAX_SECTORS_2048 quirk flag (and quirk character 'z')
which allows setting max_hw_sectors to 2048 (1024 KB) on verified
capable devices. Add an unusual_devs entry for ID 346d:5678.

Non-quirked USB 2.0 devices continue to use their default 240 sectors
limit, and USB 3.0 devices continue to receive 2048 sectors via their
speed check, ensuring no performance impact or regression on other
devices.

Tested on a very common cheap USB 2.0 128GB flash drive
(chipset FC2279 BA7 - price $4).

Benchmark fio results on actual device (346d:5678) on Linux kernel:
- Sequential write (1M bs): 10.2 MiB/s -> 13.2 MiB/s (+29.4% improvement)
- Sequential read  (1M bs): 24.4 MiB/s -> 26.4 MiB/s (+8.2% improvement)
- Average write latency:    97.8 ms   -> 75.9 ms   (-22.4% reduction)
- I/O requests / interrupts: 556       -> 60        (~89% reduction)
- 4K random read / write:   unaffected, zero regression

Signed-off-by: Herman Semenoff <GermanAizek@aizekgroup.ru>
Signed-off-by: Herman Semenoff <GermanAizek@yandex.ru>
---
 drivers/usb/storage/scsiglue.c     | 6 ++++--
 drivers/usb/storage/unusual_devs.h | 7 +++++++
 drivers/usb/storage/usb.c          | 6 +++++-
 include/linux/usb_usual.h          | 2 ++
 4 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/storage/scsiglue.c b/drivers/usb/storage/scsiglue.c
index 97de28e85562..2a732e6354e5 100644
--- a/drivers/usb/storage/scsiglue.c
+++ b/drivers/usb/storage/scsiglue.c
@@ -111,10 +111,12 @@ static int sdev_configure(struct scsi_device
*sdev, struct queue_limits *lim)
  * let the queue segment size sort out the real limit.
  */
  lim->max_hw_sectors = 0x7FFFFF;
- } else if (us->pusb_dev->speed >= USB_SPEED_SUPER) {
+ } else if (us->pusb_dev->speed >= USB_SPEED_SUPER ||
+   (us->fflags & US_FL_MAX_SECTORS_2048)) {
  /*
  * USB3 devices will be limited to 2048 sectors. This gives us
- * better throughput on most devices.
+ * better throughput on most devices. High-speed devices with
+ * the MAX_SECTORS_2048 quirk also use 2048 sectors.
  */
  lim->max_hw_sectors = 2048;
  }
diff --git a/drivers/usb/storage/unusual_devs.h
b/drivers/usb/storage/unusual_devs.h
index ac22fa318734..c04baf37ea5f 100644
--- a/drivers/usb/storage/unusual_devs.h
+++ b/drivers/usb/storage/unusual_devs.h
@@ -2418,6 +2418,13 @@ UNUSUAL_DEV(  0x3340, 0xffff, 0x0000, 0x0000,
  USB_SC_DEVICE,USB_PR_DEVICE,NULL,
  US_FL_MAX_SECTORS_64 ),

+/* Reported by Herman Semenoff <GermanAizek@aizekgroup.ru> */
+UNUSUAL_DEV(0x346d, 0x5678, 0x0000, 0x9999,
+ "USB",
+ "Disk 2.0",
+ USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+ US_FL_MAX_SECTORS_2048),
+
 /* Reported by Cyril Roelandt <tipecaml@gmail.com> */
 UNUSUAL_DEV(  0x357d, 0x7788, 0x0114, 0x0114,
  "JMicron",
diff --git a/drivers/usb/storage/usb.c b/drivers/usb/storage/usb.c
index 823a4b2e9033..2577db523208 100644
--- a/drivers/usb/storage/usb.c
+++ b/drivers/usb/storage/usb.c
@@ -570,7 +570,8 @@ void usb_stor_adjust_quirks(struct usb_device
*udev, u64 *fflags)
  US_FL_INITIAL_READ10 | US_FL_WRITE_CACHE |
  US_FL_NO_ATA_1X | US_FL_NO_REPORT_OPCODES |
  US_FL_MAX_SECTORS_240 | US_FL_NO_REPORT_LUNS |
- US_FL_ALWAYS_SYNC | US_FL_NO_SAME);
+ US_FL_ALWAYS_SYNC | US_FL_NO_SAME |
+ US_FL_MAX_SECTORS_2048);

  p = quirks;
  while (*p) {
@@ -659,6 +660,9 @@ void usb_stor_adjust_quirks(struct usb_device
*udev, u64 *fflags)
  case 'y':
  f |= US_FL_ALWAYS_SYNC;
  break;
+ case 'z':
+ f |= US_FL_MAX_SECTORS_2048;
+ break;
  /* Ignore unrecognized flag characters */
  }
  }
diff --git a/include/linux/usb_usual.h b/include/linux/usb_usual.h
index 712363c7a2e8..cd246a42e603 100644
--- a/include/linux/usb_usual.h
+++ b/include/linux/usb_usual.h
@@ -88,6 +88,8 @@
  /* Cannot handle WRITE_SAME */ \
  US_FLAG(SENSE_AFTER_SYNC, 0x80000000) \
  /* Do REQUEST_SENSE after SYNCHRONIZE_CACHE */ \
+ US_FLAG(MAX_SECTORS_2048, 0x0000000100000000ULL) \
+ /* Sets max_sectors to 2048 */ \

 #define US_FLAG(name, value) US_FL_##name = value ,
 enum { US_DO_ALL_FLAGS };
-- 
2.47.2

base-commit: af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
