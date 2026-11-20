Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182617;
	b=ca3MAAfNx2cu4R8c9sfEpkYIjHRqgizDZnwlvTN1+MR4GjrbtBSjPA+qgOjidqDnePsX
	 SVVGebGsgfAs0qR+bdd83wfVYTxnkGiBZTAzg8Tr/WBolI+I1gOIVWyUyjeO0eeXQOVj5
	 erdq/okHkPKuSCvY1U2DpiSa0mkK7orq0CwBsxRYGcOWf8ngh9XpEMHHFFQrVFqeSPEVz
	 MDQnB7xBDGooztBXi/oBskIBw4j2E2sYPkEoILx1vu2GVY78ngHfr3q4UczwXpSyRWBwu
	 jKWyGj+xCpFD7zi5CixDc4wDnIvzEKb1/X+StgLK0JroncwNpt3J8kuEv65E8OPWbiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ztkmG2EzFlJYzHneyZc8vQ6gywFDzTMFIn6AR2HWO8o=;
	b=FISA58jKwbEMsKmg0KWQWFOQGXh7Dgxga3Ig1b4q2PrWztEBlOtedzS/uCz39nkB2pO6
	 4z42/dhHsE5Lh5MnQr87dOfTNLRO6q7saCn3QtXIhdhh1QLVTZV6S6GwywVj+1eE8VvsW
	 vh3LuxA3p2b11o9WFqG37T1pAhLnUtw+Dti1vcBl3ecX/WUMKnQUlHOSe+u3nRoeuALWR
	 1vFMFFMBIXZ7O5IoHKsdwIMshVw5IOwwHXbmcJYemdKcUK1o4QUVuzMrU0KYoRXveATnK
	 sFxM51gIbOZ00a0Ct08uSLQADN10IiHy8UT6jgX0dUQdSR3x5J9M4hCzNV8ucsWoKJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oux43k8P;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FDB606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05FDB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oux43k8P
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8b3577deeb0so419856b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795182616; x=1795787416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ztkmG2EzFlJYzHneyZc8vQ6gywFDzTMFIn6AR2HWO8o=;
        b=Oux43k8PXmTenM/jfST0wFJSahrgdwOk/+WkiFOrtOq+E0jwgkafDtlFhLUkRT9OjS
         ro5B6Fgcmno392b+U27ndrq78LaKuD+eq/yYNOlVFylKoZ6GOxh2tS0gaQtS0dLBoiSe
         1MJBeyJ6mlbuWmrzzVMfv3INJ1srXHrYJ4D+YopErn7w+IObxGOdlCRAPYriiPgwOyMJ
         clprnLU+4VlFfytVSN4jscO6gXXiqW11r9RXOlli+3c8jitaLwY5SqIzcGVJ0ORy+ZzT
         u2M/dmh1rUuOnmOsaZDX04mMh1KZXgJrZBTrnaLVAgBE9gUwG9lEnLlvraHKvZD/6dOt
         Phww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182616; x=1795787416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ztkmG2EzFlJYzHneyZc8vQ6gywFDzTMFIn6AR2HWO8o=;
        b=NW2jvnrXSiUCDj0lvjqknDy8fy5NA0X0sR2Thld5AxqS41iB1Y/iREIhAUtjm5zYtJ
         eCJNhgrbFRM9Gl/RZfl3GNG6I18miIlgXaQ5XClUswewnvZGe79HFiiKxWQlliTG+8LJ
         RyLpaHplYbM22OB6eC2ZnYPiiD8WW+jgRwaxpnPsufN8P4RusLnwK6XsYbo2IFebFU5s
         Y/Nb2Cgzj8ict3oQAoPKvirfOIZvp9VMRS0mWiBF5OvTk5v/nVcJfZLbQV8iardNjYxe
         qh99RvYS5NyoVY+2/U/KiHdo3JxstlGKIhPSS6Am0oyln54rTNTh7AETelSTKUQ1Mi4O
         +mPw==
X-Forwarded-Encrypted: i=1; AL+hErHFbzu2T/dbeqenrV6sGSRvqYwx/9oQd1JHuDceLjS+U9BvzbbTwo//rJYhpcnLsNT2kepnvI7/IaFMKbU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/p85UjyAXb9iYAzNvwowrsjF/39BQtMunNl9qXjv0MuQYq6uWY
	Q7tscTA/mFHAKgg8tVufKiRDzlRB7pmGSvtFduIiusBlHS/AY0z/IdG6/EtJe48f
X-Gm-Gg: AZFdTZedAs52xlbWfv3tMra1pvYA60tMEN2Rz7xNTGsDNAY9vMcMWpvWo43JnYN8c7n
	MhwRvtiq4oHmNmYYx6K3URcApokQky/CfQj96gtRiDWYXCiHYGHrVtXHq4+KTZFJ8g3VcCPhlYS
	I3N5CqBsIABsZQkQY5YlsvNwrIfQ4qeYVhWqjKp+jCE2Z1B9wuJXmU1LHH4Ev0HdDwegl1vpRtG
	Cdywdpe83MtMm1HCJ91SJYy5D/lOG4EQghfL6cf66U1zvTk/LWm/ntkK3U/hgKv0XG33mY/ftKb
	mAhfInnqVtDbDRE2Y7gmHpynLYTVpOwi0bHMtxchbhNt9j25B9UnmZX42vhgwWe7Y7dAaA9xis9
	TNhtdTSsQe5TRQ9+F3Qakk0HG5GUIUc+u2o3gdQlWYRj9hhEYkYOgv1FZoPbt+swP4sh+XKBkTQ
	a2Bi3PuQe5oYW2AGOYlDMVdSMX5OzwKuQoPfAmLFpOb212M5zgharIQjhhpy5RCWvzJhXhVV2Tz
	gIyGG0PiI1CDMScIK6Q5J1Yp/PATpctCD1RJPc06bAtuKpO3/1mUCRZrOpNVMAOvKZ3UD3POBji
	eiMgVqc9yqOwtEUEhp6IglkSuv3TBT83Ve1FRuTZWBe05M45jC9vjg==
X-Received: by 2002:a05:6a00:2290:b0:874:705d:f63e with SMTP id d2e1a72fcca58-8c87c38b850mr2646210b3a.32.1795182616265;
        Fri, 20 Nov 2026 05:50:16 -0800 (PST)
Received: from DESKTOP-UCPRL76.localdomain ([113.200.174.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c15asm1525086b3a.20.2026.11.20.05.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:50:15 -0800 (PST)
From: Zheng Shuhao <viennaoffh@gmail.com>
To: linux-input@vger.kernel.org
Cc: jikos@kernel.org,
	jic23@kernel.org,
	srinivas.pandruvada@linux.intel.com,
	bentiss@kernel.org,
	heiko@sntech.de,
	lee@kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ayaanmirzabaig85@gmail.com,
	syzbot+fb951970a334aaff00ba@syzkaller.appspotmail.com
Subject: [PATCH v2] HID: sensor-hub: Avoid holding spinlock across child iteration
Date: Fri, 20 Nov 2026 21:50:05 +0800
Message-ID: <20261120135005.566-1-viennaoffh@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <1795161418.hid-sensor-hub@viennaoffh.gmail.com>
References: <1795161418.hid-sensor-hub@viennaoffh.gmail.com>
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

sensor_hub_remove() holds sensor_data->lock while walking the HID device's
children with device_for_each_child(). The child iteration takes the device
core's klist lock, while sensor_hub_raw_event() takes
sensor_data->lock with interrupts disabled. This creates a lock-order
inversion.

Pass sensor_data to the callback and take the lock only while examining
pending.status and completing pending.ready.

The callback also visits non-Sensor Hub children. When HID battery strength
support is enabled, the HID input layer may register a power-supply child
without platform_data. Skip children without Sensor Hub data before
dereferencing it.

Testing:
- With CONFIG_HID_BATTERY_STRENGTH=y, ran a UHID Sensor Hub/Joystick device
  exposing Battery Strength through 15 create/destroy cycles across three
  QEMU boots. The power-supply child was found each time; no Oops, BUG, or
  KASAN report occurred.
- In the same configuration, hid_bpf passed 45 tests with 1 skip, hidraw
  passed 27 tests, and hid-core, hid-apple, hid-gamepad, hid-ite,
  hid-keyboard, and hid-mouse passed.
- The full HID suite was not completed; it stopped during hid-multitouch.
- The #syz test request was rejected because syzbot's automated patch
  testing is temporarily unavailable.

Fixes: 8a5b38c3fd70 ("HID: hid-sensor-hub: don't use stale platform-data on remove")
Reported-by: syzbot+fb951970a334aaff00ba@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=fb951970a334aaff00ba
Signed-off-by: Zheng Shuhao <viennaoffh@gmail.com>
---
Changes in v2:
- Pass sensor_data to the callback instead of NULL.
- Skip children without Sensor Hub platform_data; add a battery-child test.
- Add Fixes and correct the syzbot address; remove the self-added Tested-by.

 drivers/hid/hid-sensor-hub.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-sensor-hub.c b/drivers/hid/hid-sensor-hub.c
index 6470a290ebfc5..4c447f62480b5 100644
--- a/drivers/hid/hid-sensor-hub.c
+++ b/drivers/hid/hid-sensor-hub.c
@@ -804,9 +804,16 @@ static int sensor_hub_probe(struct hid_device *hdev,
 static int sensor_hub_finalize_pending_fn(struct device *dev, void *data)
 {
 	struct hid_sensor_hub_device *hsdev = dev->platform_data;
+	struct sensor_hub_data *sensor_data = data;
+	unsigned long flags;
+
+	if (!hsdev)
+		return 0;
 
+	spin_lock_irqsave(&sensor_data->lock, flags);
 	if (hsdev->pending.status)
 		complete(&hsdev->pending.ready);
+	spin_unlock_irqrestore(&sensor_data->lock, flags);
 
 	return 0;
 }
@@ -814,16 +821,13 @@ static int sensor_hub_finalize_pending_fn(struct device *dev, void *data)
 static void sensor_hub_remove(struct hid_device *hdev)
 {
 	struct sensor_hub_data *data = hid_get_drvdata(hdev);
-	unsigned long flags;
 
 	hid_dbg(hdev, " hardware removed\n");
 	hid_hw_close(hdev);
 	hid_hw_stop(hdev);
 
-	spin_lock_irqsave(&data->lock, flags);
-	device_for_each_child(&hdev->dev, NULL,
+	device_for_each_child(&hdev->dev, data,
 			      sensor_hub_finalize_pending_fn);
-	spin_unlock_irqrestore(&data->lock, flags);
 
 	mfd_remove_devices(&hdev->dev);
 	mutex_destroy(&data->mutex);
-- 
