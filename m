Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795821106;
	b=W3PLf4b7BOALLNSwfn28TUr1SMh99EmBa1DF1CiUJ5BwpTNyxYnsbh+MZKxG365tljXS
	 +XfNpw7LSUsvtC71Ceh4KPguX8QWxSH6ODexn4OjB6OFRb/+QL/clQrHt5Ul0SCJnqkxR
	 1bGkuYTHpaD0NATKV2VBdIsE0E4uMAPI6XhxRDBYOVO/PkuEQ1RhgHi80rwiHqHm/U8WQ
	 qDhFlKNwuKWuQSULWoZCFce669hAMxGEfQwc0+UWm9hakmqhEBD3eAgAWc7seagdjKEJJ
	 bxEN2dFf8XYe+UiGVk+R0yikCLrBep+LtMf7RTBUXiiy/vxDpLpoh9IRMAfaG40lrLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795821106;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8SavsvDRhxuv96JWMZuZ97zI9m1+naUIAvl8RSbQzEE=;
	b=Ewf5EvqARnyzYFbdGGtuvGTtHxb5FfIX9sFO5VPEi/w0Vch0ba++igEfuugfCqsQqUXz
	 F4bjns9TvGX3uZ1Df7lJXDMrFd++sCr+pZ6oVMWbYIXJHSVcc1Qhg6FheS7imbq5tCAh2
	 zpmEdEcFQshkJubyZ3HyqdnQ+Gt97vfewSe5pJU2fmlGRaOU+bq8EBhv68EqgIVD0PFMf
	 u5b/+1VSkrGBx9nM+ILn5WOlSsuDmjs8z46gvnp3MGXFgpDm2D8sjX/e3THlCMX3g5Cv7
	 zME9/MFpWpu8kuJP9m5eIYxmiHT4biCR+iyCfKMFgZFJ/ZQzBW52RbJoqt8e6JvlW1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Sb3keO/J";
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBF4606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 23:11:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EBF4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sb3keO/J
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so7276219f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795821104; x=1796425904; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8SavsvDRhxuv96JWMZuZ97zI9m1+naUIAvl8RSbQzEE=;
        b=Sb3keO/JbdqNwYdRbi30532geky1B2fRYpZSVNuqid6Tf/dRO5xAd2TMqkvUBAHZcp
         v2jrujqXaykvFVBhWkG1PncgfMtUYHwvYnF7FG+5NLtaprPQwMjaH+LSdunY2mKlY8zK
         MKpiy4k1MUq+ygmGfZcXeJmpG2H7kE7xeScWMZ6fCpOyBwyt2llMErL5J7/Zq1zutIRL
         zLDI4pwTNp7JJmI3YY+hAZACwDgtJ6iZw2REASrjrrPD4HKmFu7LXxVHdbMFhiCZag1c
         eDaqxHxEd5ya4Xkz7c9tjrXc7oaWp2QkPBmoRtiZ9G1BYpCBwpT1bWtUAHF/tSQalXQg
         C1Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795821104; x=1796425904;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8SavsvDRhxuv96JWMZuZ97zI9m1+naUIAvl8RSbQzEE=;
        b=SnxyNvCPj5FyLtB1oxtLRM4zfGw2Q1Cq70xRUwp9TJCi2COwtzWwGhm21G6b2Qfbiz
         SxmiQhKNHyoIDAoYmpJlo0ojuCgu523oXGOIiy6VDihpWqKeaR5hHAyiS5RGGpCtpBgA
         Aa79fLO8QaoidS8camuyVAGaCo2Gml/Rsjken20c+qH52FtnXXgvqsdQa6Fec0y/bQn0
         YdFJDdXKI4B+8y6Jaf1c8gVhLYgjovvvPU8onhRCOeNMiRn+8bS713ZUv+QxaXOOIDSa
         i2xqjVFzxYsywfGJ9bZ43fcditDTHhOQd9IW2im8KjI7u3C9abS6iHnNmdCadts7U/r1
         dJNQ==
X-Forwarded-Encrypted: i=1; AL+hErEGiXijOLdXrA9m+j0S/sxcXpsx+lOL79uK/F9EfIatN++3Y9OFgn63qaVaDmg8bI0LrjS0HqrZv28Cxas=@vger.kernel.org
X-Gm-Message-State: APuU4Z+m3yC+Ui4LfygrEs4Bk/RMWuB9scFy2X6rDA90JAgOTTd4WuFc
	Stkl0M/VH+PRKceL9MSixhxwippvq4iAxciatGWOBUqYfFjsJRK+tXTw
X-Gm-Gg: AZFdTZcF11EvXk5zeUk4aFBzy1Zxat3CieidVqR7+blhoPsQCEvMUH9PrAoqxpsVFoM
	feNC+ayO0ue5pQP788BPzq4CjnEe6WVan/KOa0knvMHGG3pmjIeN09zS2YLZ4tXKgpzFzqP0yjG
	epVuwqL1w4So0EeEShX43+QeEJWhOqVSR1t+39c2mdljt2cUVdcRNTbhJPvkEOnfZB4g8M1slsX
	DQDMSFax6+p4t5mBUmuRjuFNp56Acu7LlbTRM0k0oFvLqdsIfnwy3DTMsxxGKASqw6kr858dBso
	FNtSqCHPNxMkgTRm816w7bb2ySN8fOgtsIBROVCXVkHZTIthkwcndPwSrtxwJ3e+TTObpuWGv3B
	1GXw33wzmILYkZaxMaX9pTD64sWcDpPYEa/5dS24ff5lWXFyvR3nlBctF7lyhGPdNO9iLkEqimo
	lkySB290I4k3xNIa69ieHuiHYr5jvoNVnA/PYUx40Cno2b1mHUt0FyK0m9tQSWqaoo+P5wSH/4l
	TYR8EgjZ8y5PRGNSbKtqbGLbBx+ci9cXNw/4iV7Q6gGlQFDqIjA02dYsN2zstYEbPWHiFFbc0VD
	CPB6WOtbY1AzgNkw8PGiyRw1SqXMAGyKKQ8lut9kqzvKeA9W/big5/FIUWMBt9Au/PAxCm/ZSe7
	sbqPTTVAiuocbxwY2y41sNuEcvkgJlumUlHqIxTZ+KmQGAXpdb1tYCulroO6gwRSzaA==
X-Received: by 2002:a05:600c:a087:b0:4bb:60bd:53b2 with SMTP id 5b1f17b1804b1-4bb887fe7bdmr538925635e9.6.1795821103802;
        Fri, 27 Nov 2026 15:11:43 -0800 (PST)
Received: from PC-Marco.local ([151.59.46.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm600062645e9.9.2026.11.27.15.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 15:11:43 -0800 (PST)
From: Marco Ziliani <rylos78@gmail.com>
Subject: [PATCH v3 0/4] media: i2c: ov5693: Fix mode changes, flips and
 autosuspend
Date: Sat, 28 Nov 2026 00:11:32 +0100
Message-Id: <20261128-ov5693-fixes-v3-0-bcdd169958b6@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNzQ7CIBAGX6XhLAYW+4Mn38N4oHRtMbYYqETT8
 O5CvTQmHif7zexCPDqDnhyLhTgMxhs7JRC7guhBTT1S0yUmwKDiDGpqQ1lJQa/mhZ42qEHWJTR
 SKJKUh8P1kIzz5cv+2d5Qz7mRF4Pxs3Xv9V/gefcnHThlVOhGtVwhZ4fu1I/K3PfajiSnA2xl+
 SNDkqGEqqtbLphgWznG+AHGJF859wAAAA==
X-Change-ID: 20261027-ov5693-fixes-8ec29752893a
To: Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, Chris Simpson <chris@nilk.net>, 
 Tony Garcia <tony@loafecho.com>, Simon Kruse <simon0x+git@proton.me>, 
 "D. Manresa" <dmanresa@gmail.com>, linux-kernel@vger.kernel.org, 
 Marco Ziliani <rylos78@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795821102; l=3879;
 i=rylos78@gmail.com; s=20261027; h=from:subject:message-id;
 bh=aVSYBkfytGdzyKOu2AJotHb1wOyX7YG82KUEpvCRBJ8=;
 b=yctof9IckHJ9OiSYYzS8mN90dRNXcjVNIWnVbSqclLtF9tZBUsU5y4my5XByU9G8TY3UN4P93
 /neEPrdzQ/YCuNhHNce6N3FpI47D2x2rsfVIS9vwROogg6racm/kHgY
X-Developer-Key: i=rylos78@gmail.com; a=ed25519;
 pk=nXCfiK5yExPZCMp+lfKif3gdXkfjkUK2qk7bDW+ixMo=

Fixes for the ov5693, found while getting the front camera of the
Microsoft Surface Pro 5 (IPU3) to work, and since tested on IPU6 and
IPU4P Surfaces as well.

Patch 1 drops the registers that the driver programs itself from the
global register list, as Sakari asked in the v2 review: the low byte of
the analogue gain and the FORMAT1/FORMAT2 registers. The driver now
writes the non-flip bits of FORMAT1/FORMAT2 in full.

Patch 2 writes format and crop changes to the sensor when it is powered,
on top of the write at power-on, so that a format change also reaches
a sensor that stays powered between streams (autosuspend delay, runtime
PM disabled). Changes on the active state are refused with -EBUSY while
streaming.

Patch 3 keeps the reported SBGGR10 order when a single flip is enabled
at full resolution: each flip moves the Bayer phase by one column, so
the output window is shifted by one column when hflip XOR vflip.

Patch 4 drops the usage count at stream stop with
pm_runtime_put_autosuspend(), so that the autosuspend delay counts from
stream stop rather than from the last resume.

The patches come from the linux-surface tree [1]. This version was
tested on a Surface Pro 5 (IPU3), with the media next driver plus this
series built for the running kernel: the full-resolution Bayer order is
stable with all four flip combinations, 16 changes between 2592x1944
and a 1920x1080 crop with the sensor kept powered all stream the new
format, a format set during the autosuspend delay reaches the sensor
at once (OUTPUT_SIZE_X read back over I2C), set_fmt() while streaming
returns -EBUSY, and the sensor suspends 1.16 s after stream stop with
the default 1 s delay.

I used an AI coding assistant to draft these patches and the changelogs;
I reviewed them and can answer for them.

[1] https://github.com/linux-surface/kernel/pull/181

Signed-off-by: Marco Ziliani <rylos78@gmail.com>
---
Changes in v3:
- New patch 1: keep the registers the driver programs out of the global
  register list (Sakari)
- Patch 2 (was 1): write the mode registers on power-on as before and
  from set_fmt()/set_selection() when the sensor is powered, instead of
  on every stream start; return -EBUSY for active format and crop
  changes while streaming (Sakari). Tested-by tags dropped, since the
  code changed
- Patch 3 (was 2): unchanged; the window offset vs
  V4L2_CTRL_FLAG_MODIFY_LAYOUT question from v1 is still open (Dan)
- Patch 4 (was 3): changelog updated for the new patch 2
- Link to v2: https://patch.msgid.link/20261029-ov5693-fixes-v2-0-2526d7b13030@gmail.com

Changes in v2:
- Patch 1: move ov5693_mode_configure() from ov5693_sensor_init() to
  ov5693_s_stream() rather than calling it in both, and shorten the
  commit message (Dan)
- Patch 1: Tested-by tags not carried over, since the code changed
- Patch 2: unchanged; whether to shift the window or to use
  V4L2_CTRL_FLAG_MODIFY_LAYOUT is still being discussed on v1, happy
  to switch if that is preferred (Dan)
- Patches 2 and 3: collected Reviewed-by and Tested-by tags
- Retested the series on the Surface Pro 5 (IPU3)
- Link to v1: https://patch.msgid.link/20261027-ov5693-fixes-v1-0-3c8ab1ae104d@gmail.com

---
Marco Ziliani (4):
      media: i2c: ov5693: Keep driver-managed registers out of the global list
      media: i2c: ov5693: Write format and crop changes to a powered sensor
      media: i2c: ov5693: Keep the Bayer order when flipping at full resolution
      media: i2c: ov5693: Use autosuspend when stopping the stream

 drivers/media/i2c/ov5693.c | 131 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 106 insertions(+), 25 deletions(-)
---
base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
change-id: 20261027-ov5693-fixes-8ec29752893a

Best regards,
--  
Marco Ziliani <rylos78@gmail.com>

