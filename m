Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795012390;
	b=Kn69LmCzRSyQiEj73dsYGWf3CzFRTDAuvSSkTdzr27xBHKnFg910OBp6jwUEBwIpXN8u
	 zsxJ/U5KFg8fpIG3bNmR2cS+coS6jTavZ6/jG/nl8zms7wql9XGuwn99p7He9mlrLeC/m
	 piqtRIj/l/RLBkBPbV6gz7CUZxzAWv2Py2JnvSa+5DbB9CWgO+79zo+sRrKc3zdpDWRU/
	 5G61qiyo/QsItMHsHZUbCPezYLuqxCMoS3ra0CgmY0F/KsMk0CTDdNZ9833vI9smigXC7
	 s+hbSbfZH6eViwZT+R1gfFILzXyFUfrIK6zzzLWjx/sqqiHd76jNv4sJHvwBL7oCmZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EoOYpwXa3FwcofkB3w93rNoXlsDX4Ki1d9gUL32/mLo=;
	b=igNL2htFChdhYu6opUwRQ7+jY7gJ6lpXIKQtyHtpcAKldc6EuMtTHcFueyLXTejC1BvP
	 z9kjcILL7sNx5yzwWiZjQ+3ti4hr1a6g4UpXrcY8FSyGHMBCdsyC+1JpVRrttMMMjquT0
	 uw6nxfMIxrlg/uZN7h8GUtyy5DjnuSf9V/5mP2aJEwOwZRHcrPB+bnrL8lFOA97gLCFdU
	 LX6HuDZiPbl0prxsukL6DFPPwbghIqZmuAP/MkvFzlUKayuXVTI8HujB6Uq1ToBHi889R
	 0CgtyWvseLECwYhndc5wj9kqARrgpXjj7X1fqcoJgHzEMUzA5ur/uRcnbjGHzj4VZQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="l/3xigK0";
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19EE606A337
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:33:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C19EE606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l/3xigK0
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so11237195e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795012388; x=1795617188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EoOYpwXa3FwcofkB3w93rNoXlsDX4Ki1d9gUL32/mLo=;
        b=l/3xigK0pcV0rpkfZpt9/JakEufW/L/1yiRP0ejf7oOOPqd6jmejFWGLGm5s5uA+Cb
         pIoaL7H8ERq+A9I8esI3GFasIae0x2Jg2F+2lOTAcxisGOIv5OSuiC27w0wHcs6sbo4t
         lKStbblosvwB2G7b1O1WUrd90JBN3r+XLm/FHQkJ5D79217ah1j6pZ15yChi3WC+iYXy
         1GiYodP6q15FM7jHu33kDEFbxqCKRKYcjZ0B8HkoV6Bkh34URQJp95AHue8pFkT0K/RV
         m6zqv0CdVxDA9Dr+PhI0vl6eILm7CezVhb9KLeb1fvLhK4x/gEPE1W31I6sSSCmqu4Vq
         YBdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795012388; x=1795617188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EoOYpwXa3FwcofkB3w93rNoXlsDX4Ki1d9gUL32/mLo=;
        b=GfyA2f9HSbxFD/2Jr/Q6WD07O7DmXQj1pbe8AnXWqPZvAYvIbvS+RxhkQC0kJC+jXh
         8DSXsxmu3sVtXDSGreR5lzwwD8Z9aTFuDBWJHVjD/mDCWAv62N+MtvatizMcu2jhPz4C
         si6zKxb4vdx7mmbs2wZrCJQvhnk8YFte/5eBk8lz3xNEiCB3bwwi/C7eYgOoCBpDstiz
         thL1VbOrmo8/bhI/5tcqD4vFeEk4kTb+3/3mjUq44440g7LJFve80jFR8STy6VWweIac
         qMoIpT4bt5r993ZOTLnpxNKjsNgflW5sC17R3YAlTnNk0Y20587a7r2+hHZHS4E4OcJn
         8/Uw==
X-Forwarded-Encrypted: i=1; AL+hErGdjljGWtG85C+8GaQN0k1dpeiUNlfM9YR+sAtLVK9S9AmXS50B8P30C+2ospL53v2e+oM5jIkcU0NtBwE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/loGqUA2AO9gbxEHxWYY2vecu/mPhdBtAcsufaHjbnK6w/hS1
	jNS7x9vq0lVbrOj/+eRSmzi9xS9e1H+kKDxkQne1xWnRqEzPwpBUiL2c
X-Gm-Gg: AYBFou0XW7Hj3ZbEax9/R718uWqzj1Kxn176GTzl0+PN9j5sRT0BAofAOdMpMoEnHy+
	a9AeVmS2y4JC8PGVebc5yI4L956kMXlh9+o0KqMGw8WJLO7dYXoZeWueEK2uibrphjGLdCBqYk4
	ZmhaAFxV3jYXw/8b1zB2P3CPN/+uuKYIW/JxiFaK9LIb7TTV7QPiMg7LJKD4hp4VlF9ysaVhpG2
	TS5cGhvkLuHV/oPGK5TH9ioj/ctGEPo2AaZGwJdiRHgNWg0oDTUh2aWU2qUQWuKaTnUOjQjDKg/
	Vlave0wHDPmyd60XRkYmtYTJ1B9H2F2hjtqT/09hkQQNRXV6+TIWSGV9E7al8j7PbBYdxNHO0Qu
	KBYF9Ib0chddw7HSWzv82VsERjaOSgZW8M+raycC+rL/5g1Mwbe0GlrT6MB7RxT/CWJcx03j52m
	k1uQ7KM0aJBkZDwFMxlWLaEj3cANAwVzWd0ymUA+WorE8+R9OiKMx+0C347gPxfGItqJjj5hRtw
	MVwPc+ZPcI7fXjQsBn/IobX1AcJvkiaWG87Uj6ojVNPxUZ9lNexMKAiGMuqpu3dGRNE9C5D7X4V
	f55p0B2jpJltDs653Ssq3ttlsnhMYbM5HewzPXPbqxlNPNWyrJgOp22XjEf6iASmXdgceCVEBVr
	Saix8UXvpSN2WCZ4XMYE+vPn20yNiwFBwuYTRugp6iiF3Gwmewu1mu1uNLhsYkH91+U2xBDA=
X-Received: by 2002:a05:600c:4585:b0:4a1:f625:2108 with SMTP id 5b1f17b1804b1-4bb7da4645fmr53971835e9.33.1795012387905;
        Wed, 18 Nov 2026 06:33:07 -0800 (PST)
Received: from localhost ([86.110.253.12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2cfce7sm70917355e9.14.2026.11.18.06.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:33:07 -0800 (PST)
From: Jozef Riha <jose1711@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] HID: betop: add support for SPEEDLINK TORID
Date: Wed, 18 Nov 2026 15:32:17 +0100
Message-ID: <20261118143306.75858-1-jose1711@gmail.com>
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

The SPEEDLINK TORID wireless gamepad (11c0:9105) is a Betop based
device. Its output report has the same 4 byte layout as the other
devices handled by hid-betopff, with the motors in bytes 2 and 3.

Without the device ID the gamepad is bound to hid-generic and has no
force feedback. Add it to betop_devices[].

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Jozef Riha <jose1711@gmail.com>
---
v2:
 - Fix From/Signed-off-by name mismatch
 - Cc linux-input and LKML, v1 was sent to the HID maintainers only

 drivers/hid/hid-betopff.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hid/hid-betopff.c b/drivers/hid/hid-betopff.c
index f802046a688a..28ab0acce6ad 100644
--- a/drivers/hid/hid-betopff.c
+++ b/drivers/hid/hid-betopff.c
@@ -16,6 +16,9 @@
  *
  *  0x20bc:0x5500 "BTP2185 V2 BFM mode Joystick"
  *   - tested with BTP2171s.
+ *
+ *  0x11c0:0x9105 "SPEEDLINK TORID"
+ *   - tested with Speedlink TORID wireless gamepad.
  *  Copyright (c) 2014 Huang Bo <huangbobupt@163.com>
  */
 
@@ -137,6 +140,7 @@ static int betop_probe(struct hid_device *hdev, const struct hid_device_id *id)
 static const struct hid_device_id betop_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_BETOP_2185BFM, 0x2208) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_BETOP_2185PC, 0x5506) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_BETOP_2185PC, 0x9105) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_BETOP_2185V2PC, 0x1850) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_BETOP_2185V2BFM, 0x5500) },
 	{ }
-- 
2.56.1

