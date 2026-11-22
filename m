Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795327481;
	b=lG+winnzc+7Xd0mEf10h/K4vPB4ruow3yqS1rzf8CXXhKHQ+93aP02U6r+CTmt2EM/W2
	 rwL/ZbRb1KQ238DyMCtCLBht3sqMinQxwH7Kz4t2PCYQofAK+nit8D9iPmDXuwL12YhTV
	 5NRt+nyyZHIASyhO2VKTTjLNRj4i/VHTuk+Yz9d3CTmcmP8uLGksT+iot4YqLS6yPbva5
	 K6wHdUbRIeobqiiE44Jq5f87g0j0NLRu0Knyb0sOuOm2dulRNgKcot4MsMDRTH+Zz666P
	 6XOLNCFdgPnawNlusDGK35uT349ILYe4/ocGzRoyVHfrqLFpSXDAs3rcPdcfMjvw0sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795327481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5NFMG2PvhOk/v2cx9/EqWDkni1W5VrzeNCSaqAwEm/M=;
	b=EfkIyDRwIfyy546Lae2jhQwBWJS2rOz6/piNgELeEkCiufSvEHyoPkc256rXMuiDmvnm
	 1rpEK4/v+10ZGY+AxJdCAbeMTBJ3f5L0dGu08F0dIZ4JMVuIVxVUPGJACPkizo77/dKvn
	 pme/NAEmfz5PzU/zKhk3ZKLRyGl92P73aGyANKuyqu/sb98rC3yyvCnLm/Ads82GZRwzj
	 9Kz79eowCPu+iMks999rYS9DllyHn2aFq4lJ+yjif5TkE09IijH6gAwtRQ4UDCvuWE5ZQ
	 413pBmM3kcVgNzirvJ3MtCiyYJ3j5+/+gcKkhJBKBcVK+63UzkWBrepx8ZMop08mYSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CPzlYQ+z;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACDE606A687
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 06:04:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ACDE606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CPzlYQ+z
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso2805963c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 22:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795327480; x=1795932280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5NFMG2PvhOk/v2cx9/EqWDkni1W5VrzeNCSaqAwEm/M=;
        b=CPzlYQ+zjMF/MAKxHtYFa3yUeZe7LMbJ52gKhGTuEo0r2r46JjQcz4XgWGfgTx/Bql
         ShN1ZeOt4V1fX4RrQD5PwFuJNwgzPYMCMMsr0f/2dw2YLTWGJ0gP5HDSwTd0b8FtMbil
         zdUkbRCdZ1KuAFfWoCRwti8DWPnLIRAwb8Gqq9qVmW/So0JO0xNIigDLaVvLwY8nm2TH
         gTtClanVbBIDRWWyERLxNJM41bmoNhbp8/07VTCYHupVsHsvNfXGTsxA3ZirggzC3m1e
         zD6mUfb3NuuGRoULQh8tT0u9Of6UTFesq3A8qqUnlp5qjROYPcjWK/sc9B8l0cTcYX+o
         hAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795327480; x=1795932280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5NFMG2PvhOk/v2cx9/EqWDkni1W5VrzeNCSaqAwEm/M=;
        b=1//QSFv0GzBq2eA9u+ULMZo2Zj+x0qR+dI9oajlCAdvXxMv5YDh6ekyw9lBS1yeikT
         /S74G6DUcYl9Gdv2lzE5W6SeAORlenE/IxX4tNHnSVAUR9izKuKJ8HaSqnhaJa7DJ3p/
         5bItC5Hc4w9oExdvCn9zdmXqCuFNOOj16Nrb5e6SXSNHWIu0m+7ftYffcLBVEN1z/K9E
         PxM8OhIauhdQen7yxqFtfKwAcVYWC3vBtfenHIWr2f8MBCEWTvJ/TfsYPPqv2Qgc1ovq
         CbQ0pUdUaqczrKYBwXB43PYxKObXv+K62DRuK3nq0EyauKD5r6+A9qY/756UHYD2Vh7t
         CN9A==
X-Forwarded-Encrypted: i=1; AL+hErEV4ji6L92EP5qwq0pRWMwvowNwSgz3Idx6CpHSdJ3v1kZrYOTf6oQ9u4EEVwvOvawf5izoAu6VPwt/cCw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yaxu5KNWaqGW2MA5u23RcgKgrOVGeaSfXgRnbFTwz54guFMKf
	hehm30i05sJVA+RmeNIT0aW4xGhRvLqB6rdaCbcc4Z89iAFAh7mXVMFf
X-Gm-Gg: AZFdTZcSE2fUXAGHnFI+VIyQo2pma7vga8K2wRkV0InyHf/tF/8wwT+3TZD7rfG93cH
	xLf7Q86jwA6Y2WBn45o8NGzZqtniWKLPvGjhoRK2pvUiPOrWpniYUvEUi21KuJyYTjjirzjf68z
	12nKKLEo1lJcl/FRmirJHZE6/Okc+HhQJQIz6QDkPUSz5qIj0oS3/BW35gSuUTN3Adqp95sdyi3
	HKhB3sboeGX0KL3d/01rHhbXWoU5SifWRzHkXJdBPPhJqpaOdYj9cbGnHlseDTJXrwcfJYEuNEL
	XZxWjGAcZQQ35ROm+6xALLQgbgQwAmrMfStzeeIQB68+d608HNMYamVlHe+QmyrKLCBrib2MD8Q
	tfuq3tCjmWhoZISA3gyP/vS9wZXvxNDpNfqtc3wm8Kn2dqDXEop8wCZnd2q5/KFvJgOWsnJ/feX
	ZeaQZd/qBFN3ow+Mxs9kqltU0p+Bj+fUPOUxqb49YhFrGrwcPL8nQrQkxE1N/Fs+z+aPflu5NYm
	AUoJlRf92rYtQz4xLPHbcwFOfJ5tbn7vxrjxEHPbxRzgN2+unww+0mkwUA4S5rics4nMb12OmJU
	a7sapcAVcFImCgaeOM02DvlD2jnrMt1xoIqJkyQZ7+KlS8d/HTRDbwFwwEwswBkPoQMr
X-Received: by 2002:a05:701b:4552:10b0:1b5:31ed:e26c with SMTP id a92af1059eb24-1b55689b23dmr7435524c88.18.1795327480071;
        Sat, 21 Nov 2026 22:04:40 -0800 (PST)
Received: from hp-envy ([2407:7000:b098:4a00::6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm26704718c88.14.2026.11.21.22.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 22:04:39 -0800 (PST)
From: Parmjot Singh <parmjotsinghrobot@gmail.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hansg@kernel.org,
	mchehab@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] media: uvcvideo: delay HP True Vision 5MP isochronous start
Date: Sun, 22 Nov 2026 19:03:09 +1300
Message-ID: <20261122060309.105714-3-parmjotsinghrobot@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122060309.105714-1-parmjotsinghrobot@gmail.com>
References: <20261122060309.105714-1-parmjotsinghrobot@gmail.com>
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

The HP True Vision 5MP Camera (04f2:b767, revision 0.05) accepts
COMMIT and SET_INTERFACE, then may disconnect shortly after starting
isochronous transfers. A 350 ms pause between SET_INTERFACE and the
first video URB allowed color streaming in MJPEG and YUYV modes.

Add a per-device isochronous startup delay and apply it to the color
interface.

On Arch Linux 7.2.14, FFmpeg decoded 90 frames each in 720p MJPEG,
640x480 YUYV and 2592x1944 MJPEG, plus 300 frames after a 720p
restart. The infrared stream still disconnected during the delay
experiment, before the first video URB was submitted.

OpenAI Codex (GPT-6.2 Sol) helped design and analyze the USB timing
experiment and write the driver change.

Signed-off-by: Parmjot Singh <parmjotsinghrobot@gmail.com>

---
 drivers/media/usb/uvc/uvc_driver.c | 14 ++++++++++++++
 drivers/media/usb/uvc/uvc_video.c  |  4 ++++
 drivers/media/usb/uvc/uvcvideo.h   |  1 +
 3 files changed, 19 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 99c28991b..cfc626a15 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2754,6 +2754,20 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_RESTRICT_FRAME_RATE) },
+	/* HP True Vision 5MP Camera (color) */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO
+				| USB_DEVICE_ID_MATCH_INT_NUMBER,
+	  .idVendor		= 0x04f2,
+	  .idProduct		= 0xb767,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= UVC_PC_PROTOCOL_15,
+	  .bInterfaceNumber	= 0,
+	  .driver_info		= (kernel_ulong_t)&(const struct uvc_device_info){
+		.quirks = UVC_QUIRK_PROBE_DEF,
+		.isoc_start_delay_ms = 350,
+	  } },
 	/* HP True Vision 5MP Camera */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index a92a986ab..e20330998 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -6,6 +6,7 @@
  *          Laurent Pinchart (laurent.pinchart@ideasonboard.com)
  */
 
+#include <linux/delay.h>
 #include <linux/dma-mapping.h>
 #include <linux/highmem.h>
 #include <linux/kernel.h>
@@ -2103,6 +2104,9 @@ static int uvc_video_start_transfer(struct uvc_streaming *stream,
 		if (ret < 0)
 			return ret;
 
+		if (stream->dev->info->isoc_start_delay_ms)
+			msleep(stream->dev->info->isoc_start_delay_ms);
+
 		ret = uvc_init_video_isoc(stream, best_ep, gfp_flags);
 	} else {
 		/* Bulk endpoint, proceed to URB initialization. */
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index af8cef94f..eb949c6d8 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -545,6 +545,7 @@ struct uvc_device_info {
 	u32	quirks;
 	u32	meta_format;
 	u16	uvc_version;
+	u16	isoc_start_delay_ms;
 };
 
 struct uvc_rect {
-- 
2.56.0

