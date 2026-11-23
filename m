Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445716;
	b=33tRD8RI3W5HTbOadu+x8Th4BG8kVoR+N1OylSTvgqOUsmq57R2TVvuesOiaRO97jfPE
	 g04Spl757Mfi4CXqBigJDERPlR1p7l2hUNhAt6QJ/NWW/e9bWVjs5vJT+AEJ4GF5iBGFb
	 /ZT3Kks76M9VHl6Zi27yOPQMRCC2g1WjrbmGJy5hn0PGPjfluHOnwcXYpWdZRsCzVHWNp
	 ZiD009BoypRYBRikhdSyftYrULjT3zXTXvZx97+Aou6+lmsvR7IqLRlvoRyG1HwXyDi7c
	 Xpny14qNWcAsysFM5YdCL8bc6kntCQ0Jsvti+qk6rkAjnEHovMk+KYmoDhpkDOEeD4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=56730xMYZebP2gQVmKnamiuKT7NX1L/jSC1LBCJIUSI=;
	b=YckZA2zR8PEDWxPVVT2YXq/ssfCOELcT/9bFqdreBru9IOOO6KlObhlLy8D8ac2hTV5C
	 3GfZdvzTr60Vup0cc8Eitbl9WMLoKD8kVqIFwEwxF7mWlxJ47rXzpwphUJ0sf2C+urWRd
	 2lhkr8av5VqoGKAnBhRtPL3Cd39iiuCQ318wp9Ac3G54qw3eQ/nN91rB/UH833d+IyF+v
	 GDFD0sLgi6reGzcHpxgooECfzyw0KJoctDrC+EaKLf4+nG5qm4K5u8DhGcY2fkX8UPnvt
	 uE1wdjkfJkOMBhYF4l/KtkpxX73jse/YWWYgKxqOXQs5ccUMGDWRJ3VlX6n68eL7Nkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A31L7zOw;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD8A606B087
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:55:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BD8A606B087
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A31L7zOw
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f0464dd6b6so19024085ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795445715; x=1796050515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=56730xMYZebP2gQVmKnamiuKT7NX1L/jSC1LBCJIUSI=;
        b=A31L7zOwCtdkbcLTXJ6Tu0igRIE6xljUg0BfKhdnPk8VrHvNJYFF2gCcjt+AcgvWmh
         I7H0tdsN9mJG7nm9PsUCZxL2uwjsVEunggNJqOruLnSpXfeMAfNCqQzsscxYHhHcaV4y
         k7U7n1jYNDhDo9NEQGT9Od3b0sJ4x17ekUDCI/XNfJjooP8ziSBRE5684s2MuFY6H4eH
         drIzKgeaehh2VK6/JhnqE7vDwPiKs7j/GBD+5LMQabmkLhPThKOOsWIlAekVjNFSy6MQ
         cjC1TUzk4x8Zu3DoydirW1+iXkUa0qtekWXzI2L8yvTrW+CJYr3a27xLAvZXYhy+guj1
         zZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445715; x=1796050515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=56730xMYZebP2gQVmKnamiuKT7NX1L/jSC1LBCJIUSI=;
        b=ADzSJCmlPYU4CVSXFb/1L8epnpqcR+oBUyeCTMiZoOQ8bMMyrFjAJYIxIIcOP71uQS
         0H6nzHUxCo9253OmyTmmSYML/q8y1tfztmL7OnLj5p8X4iha1AS/t2wg+AyGAb/r5iMn
         UMZBx1KehRoZ2SZQOwgU8O1zVQme2YrskmGIMM6KbwNViVGQerNKOJ9GYbcM1mlc0BKX
         lKjFhRbNTgQW2I6nHMPIJXYwniP78Bqsf770JSPvtbcDpS7pRLWwSi6sPehMjATRRQ1L
         UDjxg8gxNuj5WEWvWKrlBIUCM/DvE60Y5zWbcIzz6HOLZcXdZIXnzQgbpyg1HgSSnVLf
         n0rw==
X-Forwarded-Encrypted: i=1; AL+hErGiqpk9NfY3rETxKtUWUxGihIEwSzNgggU4edMTYOK6CqM/C2/ctepITANIwPy0Qkt+S7TxsCD2/QctpxM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+saM465zziVc2iF0+CUttP3vF0o++MPrxTF34UkHSqRp0+iD5e
	naXAG8mki9lisSUMMsr7R793OI8IYX594y8rDbgyPNDPmPWNDAG7TUai
X-Gm-Gg: AZFdTZcYDT369B75LXHDcdlnrFUK23T0HWoty3vNFqNcPsA0L9VxaYAotQuamGySbIX
	YrSn7ud/JrWWbP5VadxYgvbIhggkh/1XYuvlx5ZYkdHwpRr6IAeslwEJdSRErD5TF7lOTygBxOX
	dsB62GQspXLO3UbqWj0QJwq2//Qj3Na4axJGHVslQMU74I1MvzDFFVJGnaqE91DgOKDEBCKJDNJ
	a2B1x0tmDWIbpjg+TU8A/hPBaSx6ls1tCYbKqkm5rxGm195891NRdr7B1LgSnmsNCz9fGHR4492
	SBdVr4arqGRqgpRGSRbqs4V6wIFpkbzRNlJL+hJXX5ghoOvwH0MhQ5O5t3SVvxcg1wbuiRZWEcR
	HBMgvrsZe5T4j7JneO4Icon2kdsR1IvLylusB7WsQwb0UgfxX9+ihRq4HO/JhPCze3wgkRzJPlN
	yvIL4oQyWhq0jtf5L6X0dkPqUl9q6oWYp5FT0HZLV5FToCfv7h//8z9NnBr+FCZaXEHU6QacAS5
	xpIhx8IHGnsYgvsnv9toUwTZ+axdjxL5zMf5EC5SxnkBDNWXBskZTRlC81iiJNFUYiIBk6ARRYI
	BBimQFWyyzrwQf89S0U8sVXHLbPQPeZ/XYOosXZjPV7ZDKFT86E=
X-Received: by 2002:a17:902:e811:b0:2ed:697:884b with SMTP id d9443c01a7336-2f03f156073mr120276035ad.12.1795445714916;
        Mon, 23 Nov 2026 06:55:14 -0800 (PST)
Received: from gb05.tail50fddd.ts.net ([139.5.199.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f118c88sm55480085ad.56.2026.11.23.06.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:55:14 -0800 (PST)
From: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Jonathan Cameron <jic23@kernel.org>
Cc: Zhang Lixu <lixu.zhang@intel.com>,
	Zheng Shuhao <viennaoffh@gmail.com>,
	Arnav Kapoor <kapoorarnav43@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-input@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+fb951970a334aaff00ba@syzkaller.appspotmail.com,
	Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
Subject: [PATCH v4] HID: hid-sensor-hub: avoid lock inversion in sensor_hub_remove()
Date: Mon, 23 Nov 2026 20:25:05 +0530
Message-ID: <20261123145505.1295929-1-ayaanmirzabaig85@gmail.com>
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

In sensor_hub_remove(), spin_lock_irqsave(&data->lock, flags) is held
while calling device_for_each_child(), which iterates child devices via
klist_next() and acquires the driver core's &k->k_lock.

Because &data->lock is acquired in softirq context by
sensor_hub_raw_event() while &k->k_lock is acquired elsewhere with
softirqs enabled, nesting &k->k_lock under &data->lock triggers a
SOFTIRQ-safe -> SOFTIRQ-unsafe lockdep warning and risks an ABBA
deadlock between process context and softirq context.

Move spin_lock_irqsave()/spin_unlock_irqrestore() into
sensor_hub_finalize_pending_fn() and pass data through
device_for_each_child(), so &data->lock is only held while inspecting
and completing each child's pending state after klist_next() releases
&k->k_lock.

Reported-by: syzbot+fb951970a334aaff00ba@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/6afddf21.a11fe2ad.1b4426.0003.GAE@google.com/T/
Signed-off-by: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
---
Changes in v4:
 - Actually pass 'data' instead of NULL to device_for_each_child() in
   sensor_hub_remove() (inadvertently omitted in v3).

Changes in v3:
 - Rebase onto hid/for-next over commit 41cb3076a221 ("HID: sensor-hub:
   Remove clients before stopping hardware").
 - Drop the NULL platform_data guard since hid/for-next already checks
   dev_is_platform() and !hsdev.

Changes in v2:
 - Attempted to pass 'data' instead of NULL to device_for_each_child().
 drivers/hid/hid-sensor-hub.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-sensor-hub.c b/drivers/hid/hid-sensor-hub.c
index e9d6eb3b3831..ce9602945586 100644
--- a/drivers/hid/hid-sensor-hub.c
+++ b/drivers/hid/hid-sensor-hub.c
@@ -808,6 +808,8 @@ static int sensor_hub_probe(struct hid_device *hdev,
 static int sensor_hub_finalize_pending_fn(struct device *dev, void *data)
 {
 	struct hid_sensor_hub_device *hsdev;
+	struct sensor_hub_data *sd = data;
+	unsigned long flags;
 
 	if (!dev_is_platform(dev))
 		return 0;
@@ -816,8 +818,10 @@ static int sensor_hub_finalize_pending_fn(struct device *dev, void *data)
 	if (!hsdev)
 		return 0;
 
+	spin_lock_irqsave(&sd->lock, flags);
 	if (hsdev->pending.status)
 		complete(&hsdev->pending.ready);
+	spin_unlock_irqrestore(&sd->lock, flags);
 
 	return 0;
 }
@@ -825,14 +829,11 @@ static int sensor_hub_finalize_pending_fn(struct device *dev, void *data)
 static void sensor_hub_remove(struct hid_device *hdev)
 {
 	struct sensor_hub_data *data = hid_get_drvdata(hdev);
-	unsigned long flags;
 
 	hid_dbg(hdev, " hardware removed\n");
 
-	spin_lock_irqsave(&data->lock, flags);
-	device_for_each_child(&hdev->dev, NULL,
+	device_for_each_child(&hdev->dev, data,
 			      sensor_hub_finalize_pending_fn);
-	spin_unlock_irqrestore(&data->lock, flags);
 
 	mfd_remove_devices(&hdev->dev);
 	/* Clients share one HID open; release it if references remain. */
-- 
2.56.1

