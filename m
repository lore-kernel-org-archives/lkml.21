Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179931;
	b=rOk0HRahA1yvsctkklehT9JQHFQa6YJ8/R3P36e0SNlqfJNd26ggMiRl0300vMp1sIYG
	 Wr7wl2hMOF4KMF5JLn8Eapxdex7tpBtF+qg4ReGnj01tM9PQzWq5zZ0uFaGPNjEd3Oows
	 owga8tksfpzhx1iJxDWXCisbJH5DNWi19HgkiF1G8wtR+6k/SWgONl3jaCF6l6iGQDDaQ
	 My93qJFrsSii4H65Mp+8uPyTihlqRxUSLl3KS8quz4ZIStg67bTvfdV40PoC4Sfybv9Ae
	 RkQc1lBdiERnlfIju/egLnRFcGxEXYB0OMNBlMTUyQeCPEjUzHg74n+84HFZB88f1YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179931;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
	bh=rCB+s55Po2tHL5svU/nj91CfBpSKiuaIQvna8uFP8to=;
	b=kXV4dXxlBRcb+/kW2C/ejroatawar+lFzWhG53X8gL+vrR/jG4BBrocY4Z+l2x3Hmhr/
	 rpwJQXArBq+wxY6BZfE5VSTTt1b3X0lzHheNPhb485soFrvEEWR3aOCnWjRmbRB6WiN46
	 RYDScYMu989wednv4GyGuwGffWiRI49uVlsFwAM8Ggg+PD8V6E00OYH3a4AeBoZ5nwi0q
	 Qb/Vy+3AJj8KoQ/+Tsp3UAWFYC1eeAcbCQXiTjXWB++hsCTdCPxJSmzn+d2oLGe79EL5O
	 CiQjzzpFlI6dlbS0Ilywvlj9/gJ6Zrp+LueM0Szlee4N74LrKDi45JpQ7bR9drcQc5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IlolX6Z9;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EDE60A2619
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:05:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4EDE60A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IlolX6Z9
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so1106690a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795179929; x=1795784729; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rCB+s55Po2tHL5svU/nj91CfBpSKiuaIQvna8uFP8to=;
        b=IlolX6Z9ECeblTdHn5NowxErQTnvA3RrkjMUwD0+dbSD+vTGues+aYrg+BDdGnPmQS
         baOQaVxdDL9kXb3+5mBTjvj9UVTl751yWC1g2nddywTDHJCC9US7Ovi3X+xTueWpPr44
         GDIP9TA0CjZG5z8Rb/IuDUP1nuZ70jtAcRdraPRfqNB/qjvvhIhDUR8YMoQMRn9eSfHn
         7TFtwpQYhZ+3Ws5aBBFUguTJWiWp6v5cuMXh+X3oXEnrA22HqGZpUbtdEd7ZRcwh+jrh
         v6nU0WAwmGOBhBwJ9xPMkHRqJIEuPZ7HKCNSjE482y6pm6hl0qfCDF5gaZCzqefvnAJU
         kztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795179929; x=1795784729;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rCB+s55Po2tHL5svU/nj91CfBpSKiuaIQvna8uFP8to=;
        b=1I1Qp7ntkXf0/fS64YbBF/UvUUeC60+mus1FMyvGuXXxeMMDBIkN5yO+TgYPi0934K
         hXe1UifwcpLa40Lnogb7pW/toViGOyuVuqvimyODcLNrbW60Jgk1EyEipRhcvvh0QsaW
         QBdUIX/N5XETUCtSHZKS/cw10NZ/iS73Vv6slrniqmRNtkyfP+j15rfhriDnbX46x0LA
         G6UpanajVdvnCwb6cWTRb7xFygldK5ei3IAJETB2DdHmDqtTo3mcm5jB4oz3MOXhgTvY
         HpvLwBmTPotC8oZao7ESQAGWi4NgWkmQBpA7LRgRVHCBImZu8LGAszCVOGPOzEoPMI5/
         gUrA==
X-Forwarded-Encrypted: i=1; AL+hErHzsaQOe4HHSALOYwFMwCY9JERA9jrFXmfmveYCIXqLG+fD3tQPLJcgWVYzXbAKu2grlnih4XtQ8FptDk0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kwqV6IFA26cImYTwlUPigQ7bkIFTw3m12IHf9zYn37d8ioeDS
	OGQGmdiAxK08IDnqB3XWSZC3PR+2PqE55ADEq88fPgQdjFGWvSzUNqQR
X-Gm-Gg: AZFdTZeYdgbwVCnDDP7WxzhT8Fv6Jq/A3j3q0BYb8s9wAXkF66hCFJfj42SJN7e0KY8
	BQ1nX6O+y2JPIDkH4XOliZWCR7EKe5yxpsEYfi2T2q+whlUSSdqrUDUCdL3OrUBrWOOheCcuPsO
	DF+ayUaFdd32tytZD8FY+o1qaC5SWpxayi5zfigcWidsNc7wAECux7UCsqwS9isiPyhqwwH0fbV
	VJYu+HVBvXbp0aFV+rjCT3nN8HaI7e9F0QODePxW8DtEFKcRpnaC+f40axkE41Fm0JjnADtcdDi
	FCy1xHg8uPLRH1fyEokkENxHZmPYbmfnWSnznu0KgedFpDbtsqQX96U+Y/nVw0DIpNv1pChKmhz
	VWTpttm7REui8r4uT18A0sQciRUaSaYHTTIob+PxoFSl2NnBFxk5CXlexjF/oVkiZYYmmQft33r
	zFgrBwtZNKJCcWSJh/GNd+wokYXnGcmoAHVnxpW72By1nTVA27wMl1yI7GBD051JqiL4wiqg3dr
	2FidoQQMQG0CCel3MEZj9t2naeITklM4ZZ1dRpVZwJHwlO7oMfkEpSrChYV1UqbJ3U8+xdP03Cs
	OdyfGq9FT6xlIxX/FBWktTVG/MziwntMWe6ChAxKvMSsH/d/f4EhmOngxg==
X-Received: by 2002:a05:6402:210a:b0:6ba:4bf3:4a7 with SMTP id 4fb4d7f45d1cf-6ba4bf3066fmr1209219a12.23.1795179929103;
        Fri, 20 Nov 2026 05:05:29 -0800 (PST)
Received: from localhost (c-85-228-45-68.bbcust.telenor.se. [85.228.45.68])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cb764sm1139846a12.12.2026.11.20.05.05.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Nov 2026 05:05:28 -0800 (PST)
From: Eli Billauer <eli.billauer@gmail.com>
To: gregkh@linuxfoundation.org
Cc: arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	Eli Billauer <eli.billauer@gmail.com>
Subject: [PATCH v3 2/8] char: xillybus: Safer access of unaligned pointers
Date: Fri, 20 Nov 2026 14:04:56 +0100
Message-Id: <20261120130502.17056-3-eli.billauer@gmail.com>
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

Use get_unaligned_le16() rather than dereferencing unaligned pointers
directly for portability.

Fixes: a53d1202aef1 ("char: xillybus: Add driver for XillyUSB (Xillybus variant for USB)")
Assisted-by: Sashiko-0.2.5:gemini-3.1-pro-preview
Link: https://sashiko.dev/#/patchset/20260805093436.59740-1-eli.billauer%40gmail.com
Signed-off-by: Eli Billauer <eli.billauer@gmail.com>
---

Notes:
    Changes in v3:
    - No changes.
    
    Changes in v2:
    - Added Fixes: tag.

 drivers/char/xillybus/xillyusb.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/char/xillybus/xillyusb.c b/drivers/char/xillybus/xillyusb.c
index c4ddde221f0b..16d6101d9269 100644
--- a/drivers/char/xillybus/xillyusb.c
+++ b/drivers/char/xillybus/xillyusb.c
@@ -17,6 +17,7 @@
 #include <linux/device.h>
 #include <linux/module.h>
 #include <asm/byteorder.h>
+#include <linux/unaligned.h>
 #include <linux/io.h>
 #include <linux/interrupt.h>
 #include <linux/sched.h>
@@ -1957,8 +1958,8 @@ static int setup_channels(struct xillyusb_dev *xdev,
 	new_channels = chan;
 
 	for (i = 0; i < num_channels; i++, chan++) {
-		unsigned int in_desc = le16_to_cpu(*chandesc++);
-		unsigned int out_desc = le16_to_cpu(*chandesc++);
+		unsigned int in_desc = get_unaligned_le16(chandesc++);
+		unsigned int out_desc = get_unaligned_le16(chandesc++);
 
 		chan->xdev = xdev;
 		mutex_init(&chan->in_mutex);
@@ -2105,7 +2106,7 @@ static int xillyusb_discovery(struct usb_interface *interface)
 
 	/* Phase II: Set up the streams as defined in IDT */
 
-	num_channels = le16_to_cpu(*((__le16 *)(idt + 1)));
+	num_channels = get_unaligned_le16(idt + 1);
 	names_offset = 3 + num_channels * 4;
 	idt_len -= 4; /* Exclude CRC */
 
-- 
2.17.1

