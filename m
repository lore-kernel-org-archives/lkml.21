Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795327474;
	b=4UeX+ejhwJcgutIvXl3KU3VlL0hgzgRPKzaJhgk1VaWP8r5nF3oDCLDR9JnIECkYIBrt
	 W+kpexgtoCdJvlhUGhoCX0IMwYeJlATs61+JOUmB42UqKcDTA6Hcps5v9r+8l9tZtx2n8
	 2An474fsu+R9j2UIOZdxhPZgRFsKrFOFyq6kbz1JBqDalaXMLgwnQ4Aq29jPMyZMWo5uF
	 yvwKLvDhEorfBpKIR1epivpvXpEdw6robqEMygeOVfG49k5+b03iSJWUMWi8aaD2nb8sI
	 70cjJkL7TmBMDgGPEFeMe8uX/oNCXtGGWhFLVzYCLAQsFX0nTPkJdnHuc68IbzuBYOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795327474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=awzUDbrVWKOy5FFPtclQbQqeaRlUhfiIBRPwruNE5fo=;
	b=3kLB7wrOWKSbMq0yC+VhdibYsZHpSHYca5xqdGYGe5QCEV7aDgdNTMVSHySIyx1vahoX
	 Z1iWMPHSKrMLGVQVg+ue0tB3QQBYmLiuwfVoFMpikFdshew+13hwLbkGDhPCkeJ+KhX+w
	 uxCWd2ZGIo+DyAlS2MoX4E4nEOOYuGIlGsqQC/Rgss6r+OBys3OyR2tjomk9X2HytvY3e
	 taKTuTpydxKRjFZAKkAup5WWViFH4lSndM/P8sZKRPcqjEnDahfXncLGo9PJIepEHJ2ns
	 Eo1rcozgsBnIRQCqEHkcNcc7YGBGv7EsdFKbnJVBPpQows4i5Z/01eRrSy9WB+0LwOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CTWsSYWt;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CF7606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 06:04:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24CF7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CTWsSYWt
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a2af4c8d00so4067149c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 22:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795327472; x=1795932272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=awzUDbrVWKOy5FFPtclQbQqeaRlUhfiIBRPwruNE5fo=;
        b=CTWsSYWtOqbO3AkZZka1hr8vUC1Oq1DOyapviemlWpBPgwcSszL75y4tExEV6yS9B2
         gA8Hl4Cxe2ktPk/dv+R5C3of9Wyn1hv1D4RXcKEP8I6SSuFuVA+J7Oww4ssNWkLvzx7C
         6g83ZbUdafrJOCxoEzhDjDnMa7I3LjMQuX7Z+DcHyOI/JfWJEAz2kDEjQDO5Xa3gtU3L
         6g9j6XQIOG5Hl+1YGtmdsHsTHVSFuiZi3G+pPOm+EjE9LMaG0VUE5mi7foP4EvDa2paM
         86n5MB0PEHGlCdTFA0S5PsO/GjFl0O9uXZ8RkBcwTVtS7XJNPBdDSbvhR3OCuEBjHFFO
         D2uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795327472; x=1795932272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=awzUDbrVWKOy5FFPtclQbQqeaRlUhfiIBRPwruNE5fo=;
        b=ZApml8QQLcRUV2zs0btWn1gb8ZN/rKKj/vqyPrsBqC2BeyKFG0mEbEjNz1BI6FBoMW
         ySg3q0OIIQTUmj9WTQLc2EPt6xUXcEctJpync6AJtwY/FvqQaVqZ1XoePAPncaAMaqHj
         lmZqQs/Yaxbf2pXCql8/XnLVfmdPHSi27UUcN8uCW24DAWn07rfD13Ni5Qyt5Y43oaE7
         VKlqK50ccHuQRuZdjjWlTp6nDNdE059bqwNtKqKbSv2tKbHeZaLtAM5pqxhKkhJPkJfS
         JX667K2u3j+Fh68R6CblXFkkD2xqO3SLzKUkMQHLQsCG7Axr5m5xTjHmAXkd60sD/n3k
         tWtA==
X-Forwarded-Encrypted: i=1; AL+hErHvw/+pl5uxCstUSogiyrCdKDeHJj8GPAWSKUKwR7tWggan+ZEZN2uqHbMljeVVdWzwvlBLXDqEZa0TA+M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sfAZGonxrEKZ7LQdXFHrYwx3O1HMC20WEhv+6JrnGy54bmQGF
	nok63i4qnNzDoHVXyFGWqcy/WSf10SoumDIYvjAJ9PpNVHzeAymJFVmQ
X-Gm-Gg: AZFdTZcjkiVmj0lUlOQmUIcoIhKtp74/06KC/zidoAU3OxGn/ygaFfp9yBuwn68mw7M
	VhC/GDC5ksjrqWI21pzA4teOo84BvR98hy/YNkb7vsSkBkrT0AqCWw8MIKDSCVUQq7hojZ39Ao1
	CH1e+VENKyacSVfy3VHMsoi5p4imbcEihnGmhhlo63HMcScLA4quy/svXrK/b6A9IH2tXAe6NMP
	EhWRiee4Lnedu4kmpF4BFkwN1laSckdk0+PEWJjFpN8llkWwR860P+XOTgH2JhzIPWOyarB/Gom
	t6apWgUTYS1jWC/zQ+jx+Uvz/GG60zkkpY9RjlIWU3TXN9zLwp6G7Y6GIPFRNXuFIXuIKg112P4
	tPZojW7kWBCPtxsjqD4hdCgCzJeLZljKTbXFaeyXH/y/mywMO0cXeWWjeRFbwR9ubnXspK+OXES
	O7m82UYfLcavI5Tv3mu6OBG+p680t/hybpykysYEpsfK9job/6rUj7vRDT+P4yd6iUSzjadC2J4
	wP3Q4FIbnVQWLuNxWiNncYaKzm6zXWbGJSkKXXP1GvItCguCANG/2koPHeGBGm1vfH98S05atln
	bH8YwH29h7vY2aFwfF1TNvLI0lpc3rriGZ3xzku2Qn4DOcKpWgOEL800ffIRERWBmDwL
X-Received: by 2002:a05:7023:a8b:b0:18c:e014:6f1d with SMTP id a92af1059eb24-1b5567ab595mr8320034c88.1.1795327471045;
        Sat, 21 Nov 2026 22:04:31 -0800 (PST)
Received: from hp-envy ([2407:7000:b098:4a00::6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm26704718c88.14.2026.11.21.22.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 22:04:30 -0800 (PST)
From: Parmjot Singh <parmjotsinghrobot@gmail.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	hansg@kernel.org,
	mchehab@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] media: uvcvideo: fix HP True Vision 5MP color streaming
Date: Sun, 22 Nov 2026 19:03:07 +1300
Message-ID: <20261122060309.105714-1-parmjotsinghrobot@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The HP True Vision 5MP Camera (04f2:b767, USB revision 0.05) can
disconnect from USB during initialization or shortly after starting
color capture. The first patch skips a malformed default probe response
using the existing UVC_QUIRK_PROBE_DEF. The second adds a startup delay
for the color interface between SET_INTERFACE and the first ISO URB.

On stock Arch Linux 7.2.14, selecting 1280x720 MJPEG succeeded. With
streaming enabled, COMMIT and SET_INTERFACE succeeded and ISO URBs
completed before the camera disconnected about 127 ms after
SET_INTERFACE. To reproduce, use the color capture node:

  v4l2-ctl -d /dev/video0 --set-fmt-video=width=1280,height=720,pixelformat=MJPG \
      --stream-mmap=4 --stream-count=90 --stream-to=/dev/null

With both patches active on Arch Linux 7.2.14, FFmpeg decoded 90 frames
each at 720p MJPEG, 640x480 YUYV and 2592x1944 MJPEG, followed by 300
frames on a 720p restart. Color capture was also reported working after
a reboot. The media-next series was build-tested on x86-64.

350 ms is the tested delay. The minimum reliable delay is unknown.
Infrared capture still disconnects and is outside the streaming fix.

OpenAI Codex (GPT-6.2 Sol) helped draft the fixes and analyze USB and V4L2
traces. Testing used usbmon, v4l2-ctl, strace and FFmpeg.


Parmjot Singh (2):
  media: uvcvideo: skip GET_DEF(PROBE) for HP True Vision 5MP
  media: uvcvideo: delay HP True Vision 5MP isochronous start

 drivers/media/usb/uvc/uvc_driver.c | 23 +++++++++++++++++++++++
 drivers/media/usb/uvc/uvc_video.c  |  4 ++++
 drivers/media/usb/uvc/uvcvideo.h   |  1 +
 3 files changed, 28 insertions(+)


base-commit: ccf78740d63813c452c035b57d17a650492562fa
-- 
2.56.0

