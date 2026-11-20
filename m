Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179932;
	b=JOOUgZRjBP+5wPKtx2I6wEBVdpnyGCd1eUKY2FM+udA/+DxOWAWruoHfdmO7Zp37QTQw
	 Oh5gSwtFAUO2huLgtZfaLkucXf46SA6asph7winLbCpz1O6D317cx8afPPB/citwff+7R
	 PVYs21H0iEW5LoIMFEqixAKXO3Xaf97j+exTDrfi5jEmmP92VhSTba97ei8azEMrdUijn
	 7TZ3wX98pxGF8ghCAvXL/e3PjCPkB13wCteNg0uTFx4i+PpKpaMEzx/hJoy1bHttID/z4
	 DZDMKBQH6k89knBHIqIPffq9TwWPCc06zaG7r5wNXOhyZlgdQJqlvVw8LLuwy84NCJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
	bh=T5q+Z5VNPf1RiTdxozH4LbTGMqNCK06ZoBAnMn8lXFE=;
	b=XJ11AhKbKSe/rffzg5TAphtLwEsvSEEcnoN+tY75/VlZl+3ChRezuYsh62PtY3cFpOCs
	 CFiObqIFnL0aq2bWDhniUowR3Yo/SzJgnbFkZyJ0Dw5kIzkKYvV1RX+4gvOBPjQO3cQUC
	 Hb5vgYxSitcs5LQMol+ckEE+w9rhNr+Zxf8Ikg11xLtYmXcXbaQsmhEFcBLj77BWvWH2y
	 s14T6vH9RBW9pAVHPdxquhT5Pd306733yj8rULmIst4Vdr6kW1f9KQir3fskd8oAKNPCs
	 zK8PP0nqGttiz/ZJrgUbtxEyqzaVYgsTfQGD2wTZVyTZKzNda8He62AGu3if0Z2jozg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I8jIcLDe;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7035560A2627
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:05:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7035560A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I8jIcLDe
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b8a1f59d5eso1029355a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795179931; x=1795784731; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=T5q+Z5VNPf1RiTdxozH4LbTGMqNCK06ZoBAnMn8lXFE=;
        b=I8jIcLDeSEc6o5yY7pRAUng+ze2R2IY7OIE+pSa8Iuvr+9hU0syMn7U4awD65Er6/E
         x6ti5i/M2ujSw7Z26syrGZ8Bv7SsUkGVEoTn4FngFSnt9aBN7MDw3T4Qq48qWw6I/diF
         Tq9j3PaY1L64ZshU+VrM9HP8RyK+byUxKZ80kPAn/Ud30rNIJ5h4+TwAZRIfvvoUa3gP
         hbZIAN1bSxv2tjp402eunXMsMQlKjDV46P9FDWuy026v4XLwYu5wSV1XcbL4izAlmiNQ
         yhp7F6mfEkWqLCIQQDJvhFDnaRp8/YcnysFWxhBrZO1b1kU4fz9YJg/Qh/ZKA7bVJ2nS
         P6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795179931; x=1795784731;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T5q+Z5VNPf1RiTdxozH4LbTGMqNCK06ZoBAnMn8lXFE=;
        b=ftmCP6kS5cUSnE9JsT1jF4Myd/xzF2ZvSIJZi3Kk8j6Di1VTWou2LFr7byDqA9tgGQ
         BaPZpiFFbs24pJRzuMvlwOh4egD8LJwEXg+JocFS3MuBRrH9Ivrn21CrPfgzMWytFMEp
         s4b3FMoy2Dk+gSwzzemCr31lXWSlhkeuSq5Otq9+GpkwyPCFj83UqVvjqdNECyZOAOFp
         Wp1lEqCzVBvAjTMohNTxXs6bmcwM1L/fEqALo5V3D2+h69PSZ+9zlOyhe9KIgLn7JSgj
         ZYiyMkjavBUbsRdtiZd7FxGOt0nhkJPwRFL8JLHTLhphqpKqXQyKq7m85Ii+dAVi1XUH
         jwqQ==
X-Forwarded-Encrypted: i=1; AL+hErGm4jna9u2gbzoYBH8F6WxXZ9PK6TYRBpHkha4sYcZ1yOoTXNIlxNOzTUbA2vwIch1mBADAr5w9IjYnC9M=@vger.kernel.org
X-Gm-Message-State: APuU4Z97VL4ej7qZwiwrtCJn+atRR6x5ENGbPSlyXOU3Cf6Q2aK0RoV5
	dR/QmJFHOt/35gWcowCBWfChlhPNK7TP+gLsXAKhh5UTHco+3AA9VomP
X-Gm-Gg: AZFdTZeFfg4AiqyiypfSSvurP3/ttEGoorpVENsf128MhfxYzLVY9VjE+tmkkDLwt2d
	GVuGgP+HOHlLWeMwZzpxSYnWDZpWUQIn6Dn4sFTzeT2CtMBwxwzv5FCb4et+D4DYdtXTKdIJiLy
	6S2U6y7mYbHUDNqXmVkqtZlNT9DYtq838qM9xTLYMzpiJdUuRRqYwR/ym1v8N6mcKFMwOMfB5nl
	ogJR5Jvt06NiDyPtgIZ/IdjPIbKgnO1Z/g9Fv7OzRPx68UNonV1FXi2f1fM0wBbHcxAilqe4ikd
	XpQcveV99jPEkn/U7I4Ho+EM4u4X6gSwoFiPth12q4GwR0F1jyC23kg8TN0O8jyy0WST1f6iYhP
	duwb9GeD1ZEzFErcdVXv5uBqhhi4TUxjsTjPurURmq7rqVmr7djlAfOCNjPWk22Zqj3YyRVxeaH
	Hh6bjpPsBwnORM9IMx3NMaZd+dgPVYOjVHbqlnWUvNM1RsryOawIG/ugvZnKDzbwLYM0Bafipo3
	EweWACPWNLg89A7iZ36pCmORomc6bmK7c4ZPkQGSPWrVbewa8HH2tl/qxNVB/kj4KawZiUCWFbI
	gwxUJpSKlj6RgyUnPk33vlgWeDoc5BGv3yJvfZkrwhL1DQjpIntO5Abt
X-Received: by 2002:a05:6402:13c8:b0:6b5:8695:f839 with SMTP id 4fb4d7f45d1cf-6ba37ed815dmr2181206a12.45.1795179930800;
        Fri, 20 Nov 2026 05:05:30 -0800 (PST)
Received: from localhost (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba37120088sm1159187a12.37.2026.11.20.05.05.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Nov 2026 05:05:30 -0800 (PST)
From: Eli Billauer <eli.billauer@gmail.com>
To: gregkh@linuxfoundation.org
Cc: arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	Eli Billauer <eli.billauer@gmail.com>
Subject: [PATCH v3 3/8] char: xillybus: Return error in fops read method handler
Date: Fri, 20 Nov 2026 14:04:57 +0100
Message-Id: <20261120130502.17056-4-eli.billauer@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261120130502.17056-1-eli.billauer@gmail.com>
References: <20261120130502.17056-1-eli.billauer@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Be sure to return an error status from the driver's read fops method when
the USB device is unplugged or a hardware error occurs, and all available
data has been delivered.

Before this patch, the return value was zero in this case, meaning EOF,
which didn't expose the reason for ending the data stream.

The existing memory barrier smp_rmb(), together with the assignment of
xdev->error in report_io_error() with a spinlock taken, ensure that
xdev->error has its updated value when the hereby corrected assignment
takes place.

Fixes: a53d1202aef1 ("char: xillybus: Add driver for XillyUSB (Xillybus variant for USB)")
Assisted-by: Sashiko-0.2.5:gemini-3.1-pro-preview
Link: https://sashiko.dev/#/patchset/20260724094302.50761-1-eli.billauer@gmail.com
Signed-off-by: Eli Billauer <eli.billauer@gmail.com>
---

Notes:
    Changes in v3:
    - No changes.
    
    Changes in v2:
    - Added Fixes: tag.

 drivers/char/xillybus/xillyusb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/xillybus/xillyusb.c b/drivers/char/xillybus/xillyusb.c
index 16d6101d9269..1aa8e7303ad1 100644
--- a/drivers/char/xillybus/xillyusb.c
+++ b/drivers/char/xillybus/xillyusb.c
@@ -1541,7 +1541,7 @@ static ssize_t xillyusb_read(struct file *filp, char __user *userbuf,
 			if (READ_ONCE(fifo->fill))
 				continue;
 
-			rc = 0;
+			rc = xdev->error; /* Usually zero, meaning EOF */
 			break;
 		}
 
-- 
2.17.1

