Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636372;
	b=amYhpXYl+jv7hnQaNtZtTQEMUeZT+HlBVzHjH4MHIWIpkjL7LA349DRZ4h/8MQ+OD96i
	 yEvdzCkgD1KuRgs6T/CZVzZP6e1B4gF0Q5tdEZP04vFcb393zqXwyrM1ik5CgN3jFGPW/
	 tsQF5/mnznI1b5C4w9JsJ4FpWgqbqeu2OPuMbONxYqpQ9fpHR2GRu6fgQcbjQSWaD2igQ
	 ad92QG1wmV7Y0VmQg54h22EeyGDwmys2/lE4OaNImtYGQyBJ/ZS6THErMzt50/oFUh/cV
	 Gx17QseR90T53ZxwRGoLDVyvYRIc8AgYHbctlu61i/ySw/WjIjezvOhOOwQB8KUW5GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636372;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=BZcZxhaxSJ/yJnQYWyNEcboOSPjno3nyUstEGgSmoHg=;
	b=YepMMkN40UdsHSEcnJh7w8UVkeKasGzl7E3Q1I7MD6hexe3v9y3KWPNZdmw1L3r5dYqV
	 EvtZDzl7NCUUTXKCbDUbxqXwbK5pfcxT7ZAuhS2CZQxfAauwda01MRyWSAltFUDbl8wuN
	 ka4JT+N2BGOfkgxpAV9lJfCJHcCfsOUF52YdRrKscplTBQxt/xkL/k+pw2shr3anPseh9
	 K8LFHvAPhMBRsWwB3GOWVPuo9XxFPC0Gm1bobImOSwI1B3iKubpTNGryObSlXaZkbHmZK
	 UtQMdw7yC2tK/P4yE3jkWPpHUDp1vI2N8WXfVped4ahZ3jDcNN7MFRuCNSPK3wTiljA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A6V64foD;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1AA606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:52:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E1AA606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A6V64foD
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4ac08f4a0b2so4397736f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795636370; x=1796241170; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BZcZxhaxSJ/yJnQYWyNEcboOSPjno3nyUstEGgSmoHg=;
        b=A6V64foDaVtI4/WwFsF/il3g2hZKWvB29X7UnZOKrsekYUlS8i5lNskB5IeKirP7HO
         a+U+HFDEzgpnKULD1r4T2JSQvrTuzJhODoai1UIsIH1KRQ9Y2Ip0t0DCgHefQzgeBe+Z
         gf87mQiDvSmGdfe4S7IxsibYUIJx+icDJWEkNPj4cQfmTLKld3mj1zecnTQdNP/Wm55q
         cvtpavIL8e56L7cTxcu84GRT4aX57WzXpVXeMaTqVpTgx0JcUSvTLdXoEVfhUqL53PgK
         061cDOfepmOYhYOVv5uxY+bll8s9aRBK5PVAtkQ21VwtaSQAhGAT3OvMrtPKjxRBgRrK
         R+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636370; x=1796241170;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BZcZxhaxSJ/yJnQYWyNEcboOSPjno3nyUstEGgSmoHg=;
        b=i078U+BMHrYK6KfFQEZeRhLqT/gNjy8mmujnfzzfTRhMwv8xDREaPk4d3XgZ/bmn5E
         8h8mE2EbSewRhwhx50fBdPJ1vuMi+VOs7RuVkqLBF+H2WsZ+f20S2W3QJ9xADjFtzPPp
         oIHRUNxJ+BMQDyp8c+E8nE/fGDMzFFTskdZWSUJP2NFLLYsHPaTqSB3cQORJykIvTtqu
         2hTDgPxCNj2ScfAwYlzSE8SJPq9ggeqnYSNYqPuLMte2t8I5puXAGVJU92bOmkA/jT1I
         GkkgccPgCCgDpyLad52u7uChRSd0139MQxmExTwGtmLsTDVQrOMrOQkmjH0EePX8hl00
         78XQ==
X-Forwarded-Encrypted: i=1; AL+hErF2z/i0FyteH3qzSYThLMtJojvHYdlXSpxmHnLXkIuDlSFCycjK1WURFX81Vta/tnVg4X4Hixd+ptVp0z8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VQmtwArv0mEBGX08dDPO8h2l51oZiAjIigI7kFy2b+8GKZqOu
	ULnsJlO8tU6jIbDbXwqfBnYYO+T+J5JvJKhF5m4PPJXVi4+G91Kq9FEQ
X-Gm-Gg: AZFdTZdok8nzSI66LOn+v8WnXtb+Z3mwSzYPHsIok0rs7pZitzHvki+ok471BBNBYJt
	qhemY0lVr4eyLJIbKvzN4QSAfMBZ7eyP4VdUvITHNKUuciinoU6By/vvbXB/tZ2u2c8jyuEhYMc
	tjIe0GB4PxeR/UzbwJPG2rrn2CP9Pvz/+4PPQBgbWSWPRLX9NrJVpDMpZK4Oy43jDL2GgPltr4Q
	P/jcwQy7CDbo59mxqyCAT1ma62EbC9ffemrcwUBrWUCU5m3dVketBA+UGNlndkBVin0xkxTKlW2
	MNFBQydw061J7om7gPR1OjpwU8eYFCXWX9u1sKH70oXkUJRydWzZCvq58iuNhBLsxAhMfIR243n
	VM4Q4Bod9qItGl7gX9EfSHJmmAr8oW7mxJWcuSwiy1sG8APyuwsV1nsm9e9AZvwaKq9AXRSdvOk
	lXCdYXSt8UoDCTQO8sY/bvx6kibHn9TQnrmrjteFtORRWoQa1LGl4QIr7WDnbvC1rZ6PCDBJteG
	ceyE852hBHkpYG9NQ93GsWmUXUzFkaRR3BZ5g5q4l2oa7PVqevSzM72V9Yvl/Q3WNhbkmz++d6y
	HSs+o+gK8hpffJdL8gANW9JD/QylDWzoqYGIVHZGV7buZR3vxNLXdOWAHP9Lt/UAAHMjlO3LNGH
	Qii+ZpKWY9wP3YZnL/58NGDUNZSYWhavX8+3L1o+e0FxlgpTLNQS9a6cytTv1cESyG+Vtqv0lCm
	TsIvnrOt8=
X-Received: by 2002:a05:6000:2607:b0:48f:bb92:c5a7 with SMTP id ffacd0b85a97d-4abb0c5d665mr37431353f8f.9.1795636369875;
        Wed, 25 Nov 2026 11:52:49 -0800 (PST)
Received: from macbook-pro-de-benjamin-5.home (2a01cb0c0829f8009c6f5770f9f21e3b.ipv6.abo.wanadoo.fr. [2a01:cb0c:829:f800:9c6f:5770:f9f2:1e3b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3c4dsm30383269f8f.46.2026.11.25.11.52.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 11:52:48 -0800 (PST)
From: =?UTF-8?q?Benjamin=20Cab=C3=A9?= <kartben@gmail.com>
To: Till Harbaum <till@harbaum.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Fabio Baltieri <fabiobaltieri@chromium.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] i2c: tiny-usb: add Zephyr Project VID/PID pair
Date: Wed, 25 Nov 2026 20:52:35 +0100
Message-ID: <20261125195236.95816-1-kartben@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Zephyr Project ships an i2c-tiny-usb sample with its USB device
stack, which turns any supported board into a USB-to-I2C bridge. The
sample implements the same vendor request protocol as the original
i2c-tiny-usb firmware, exposing a single vendor-specific interface
with no endpoints, so it can be driven by this driver as-is.

Zephyr in-tree samples must use the project's own USB vendor ID
(0x2fe3) rather than a donated or third-party one, and product ID
0x0013 is reserved for this sample in the project's VID/PID list.
Without an entry here, users have to bind the device by hand through
the driver's dynamic ID sysfs attribute.

Link: https://github.com/zephyrproject-rtos/zephyr/commit/281b5743d183
Assisted-by: Claude:claude-opus-5
Signed-off-by: Benjamin Cabé <kartben@gmail.com>
Reviewed-by: Fabio Baltieri <fabiobaltieri@chromium.org>
---
Resend of [1], unchanged apart from collecting Fabio's Reviewed-by.
Still applies cleanly on current mainline.

[1] https://lore.kernel.org/r/20260820213958.41276-1-kartben@gmail.com

 drivers/i2c/busses/i2c-tiny-usb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-tiny-usb.c b/drivers/i2c/busses/i2c-tiny-usb.c
index 73355a56aabf..113af96728dd 100644
--- a/drivers/i2c/busses/i2c-tiny-usb.c
+++ b/drivers/i2c/busses/i2c-tiny-usb.c
@@ -157,11 +157,13 @@ static const struct i2c_algorithm usb_algorithm = {
 /*
  * Initially the usb i2c interface uses a vid/pid pair donated by
  * Future Technology Devices International Ltd., later a pair was
- * bought from EZPrototypes
+ * bought from EZPrototypes. The Zephyr Project reserved a pid from
+ * its own vid for the i2c-tiny-usb sample of its USB device stack.
  */
 static const struct usb_device_id i2c_tiny_usb_table[] = {
 	{ USB_DEVICE(0x0403, 0xc631) },   /* FTDI */
 	{ USB_DEVICE(0x1c40, 0x0534) },   /* EZPrototypes */
+	{ USB_DEVICE(0x2fe3, 0x0013) },   /* Zephyr Project */
 	{ }                               /* Terminating entry */
 };
 

base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5
-- 
2.43.0

