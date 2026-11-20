Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795166468;
	b=I81FxFqcVCW9P8eYsdupiFM7/zNwtmeoBPBl7vQM6eulr887ZqofJFKUk0W7PUgIRqee
	 T3VJ/nhJxkO6gWMZorAWf0dqfY7Mct9yG2jqIf7DmG6Dg8gYQnE3k/45piB0yy1PCMTDK
	 sRbXnEAFhS7/eIGqvMTZgbn0x2raOYeepNBHIupWJBocrw6DE+hhC6VQvm7a9ZOihFFsk
	 Yjt6Tur6nFpARgTTZ1OSyDY7oiZNz4gXwXgjSBxblDYSQJK5OhXsp/lChSQdBRRsOuVRW
	 MdtGd1DY0JOSS6U03J4wJP1BDU0s5Overf0DIcQHBpWdVRPckmaaTlEz2iGbXicgsJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795166468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=9MeczI24AeGQ60e/giCR3Aaq5ecAvTmY+gYG4So0AwA=;
	b=hGONvPRU7TVs2HY3DZMiDKknZaKZMSgarLJhvDoMFUyXSLX0qOdzSjYXME54ITPRa/rb
	 CZmITJ3RQk4592SUN1AYmMernSUcnKmlnrQImk1RMFZFCJKfJzmizBQwm0xXTugAGMWK7
	 3rLz6/kHc0HZuFa1NNeCfaC68owuDwU6qEmcfkt3xcTHx3RXzvDmROuWTSkEa7WNVuUdH
	 wcGK3oGL1q8e95khBjvbVtGjPktDwR8WaupJ+61PyTLJnDa78GB42d4qCxHJZQ+CcWH1+
	 zhwrmn1Nrnmm64U7XHk9n1OrrkFSOrfnRXe0TanKG4g6aql6+q0ARSUR6PRr5+qA8Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rQ3g3y2I;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7C8606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:21:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C7C8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rQ3g3y2I
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f04e3bf46dso1400115ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795166468; x=1795771268; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9MeczI24AeGQ60e/giCR3Aaq5ecAvTmY+gYG4So0AwA=;
        b=rQ3g3y2IL2zrMre3y5vaxvoU2PJFhCxhGGu3jL5PeGB5tkMt3DNDpPCsZuFu4lpNLv
         Nrt1lzQGPj0HHKFbailIiiZNezPcmJHnJGnH1YOQV8g9TO9sNv4kjY/AeTzcGqQg4hTj
         dQdJcmJGK4qfmx09fQ4XRYYFbbdV6wP9MgXBgBmErOPNq/qHfY/t90GhKgOK/Z1fbXF+
         nlNzDhDbHtjlmPKUhSBmAN9h0I/SpSVxBCL5o+uayybp/M7oieExuh0Md/qznytR2NkU
         ZAkvFD9DlQ382LkZZ+Bbx1QDOlt1MsUcKglVu5/77F+C1Dn8JTs4LTYHBc3qkZDpmSt6
         Nq8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795166468; x=1795771268;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9MeczI24AeGQ60e/giCR3Aaq5ecAvTmY+gYG4So0AwA=;
        b=LC8rwWBx/U6tMDNZCaVdrkkA70BfTvauL/fbrLLYI6rZjRqY1ElakBmxQj/n2I9CpQ
         XQhSqrsM6p5uY9fwpd9bPEyFSAi7MBU3cdBf4rtLf57dosfVVGKi3aYu2Z2wtBDGQxaj
         WrVk5MJWKq5Q0jadOLUGex6qaJkMsJBCDf2cyl9XM15Vt+svqMyJ3tTtImdbMyy/v4Ny
         L57AmWO+Ml+ppdXUtP6Iq4I2zOon6TTQ87Ul2G7yRZ5cYVZ5tcq7Bf4U2T03ZbS74jZ0
         eaLglnREHwYYh6/GA8GNieEGNxDm4Tg/+csBTYZySommXrLCnhRFnqAuoljTQNHMl2QU
         nmhA==
X-Forwarded-Encrypted: i=1; AL+hErHmJGyODukwxp0wTddME1ytM7rtvyfasG8k6ciQelTZUu9Tuu2XrCahcMg2Ixm/zhqOyvg8uE8oTeunT7Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wQMRzag4ojSobmmogYsPSrdsJSUrezKrw3FUlkDclp4mo/03s
	o9GfGXNvwaRiW0ZlpX+MP7CeBDS37CIDUu77vVSFgxAGBCXRrLFYU1wifMUuzW8e
X-Gm-Gg: AZFdTZe6ewSElNCTXiDj+VJ5zn8cZ3f5ggluPVdTuvBEGb71mrOjI89E8WjOUKtoXc7
	aEIcAioIbI6t/Qq5MsbxRRlhFrwEpzzQNa1HM0IwHH824X4K3UbrRAK7TitdpPSFdjNPOfWQJ6J
	BdXzpFPX8tN5/9Tnu8dG5+ITXcV035dLuVb5amSq5urlfFGdyDOboVkRtHoQbpHiVB9Zy30Aj01
	N2ken3lPS4VQ07XfIulI1wj9M0gN0u1sctDCju/ShvYSALLMjyKiZLebkP8ppZ8wSrZ2dEWCXD5
	DCP2wRop9ws4fyYkrFRpqkYGUHCUeJQijhCvzJ9j5WxpINE5bPaeXw287Z7WhDUP1KDJ4g1ZrIk
	LKPCnSI40MK4rJMezhXlA5JiYmW8Y3/Kes8sstRWl7KVTivOo2ZC2qF+eqdjetdcLlKinH2IZR9
	Kcsh2yohAwuJrAGpYqkYA9lN90fDkCoOqv/XxuDdFfv9/WTAEAjcNfu5FE9JWCVMuN2ZT6juNLr
	hCs+u54PnDleOTFR2cOokrKc6OLE7oCQdqU3aknuKdUxBlESupy57UznOGEeSqVz2JP25+P8DhF
	iup50px07b8JFCxSjcqXrUMQEL5nSpHBZtRnbAi6KWsPvB8upVpzRSqZ6UEfJYxLUfM85A==
X-Received: by 2002:a17:902:cecb:b0:2f0:45a7:5d10 with SMTP id d9443c01a7336-2f045a76530mr15520125ad.8.1795166467860;
        Fri, 20 Nov 2026 01:21:07 -0800 (PST)
Received: from [169.254.42.106] ([113.200.174.114])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1482c3sm11409575ad.73.2026.11.20.01.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:21:07 -0800 (PST)
From: Zheng Shuhao <viennaoffh@gmail.com>
To: Jiri Kosina <jikos@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+c7c429f6851638ece81338f90c5b29ac9c0dea1f@syzkaller.appspotmail.com
Subject: 
 [PATCH] HID: sensor-hub: Avoid holding spinlock across child iteration
Date: Fri, 20 Nov 2026 15:56:58 +0800
Message-ID: <1795161418.hid-sensor-hub@viennaoffh.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

syzbot reports a SOFTIRQ-safe -> SOFTIRQ-unsafe lock order warning during
sensor hub removal.

sensor_hub_remove() currently holds sensor_data->lock while calling
device_for_each_child(). The child iteration enters the device core and may
acquire the klist lock. Since sensor_data->lock is also acquired with
interrupts disabled by sensor_hub_raw_event(), lockdep reports a possible
lock-order inversion.

The callback only needs sensor_data->lock while checking pending.status and
completing pending.ready. Pass sensor_data to the callback and take the lock
only around that short critical section instead of holding it across
device_for_each_child().

This preserves synchronization of pending.status while avoiding the lock-order
dependency between sensor_data->lock and the device core's klist lock.

The syzbot report is available at:
https://syzkaller.appspot.com/bug?id=3Dc7c429f6851638ece81338f90c5b29ac9c0dea=
1f

Testing:
- Reproduced the target lockdep warning with the unmodified kernel in 3/3
  two-CPU QEMU runs.
- The warning was absent with this patch in 3/3 equivalent runs.
- Ran the HID selftests against both baseline and patched kernels:
  hid_bpf: 45 passed, 1 skipped, 0 failed
  hidraw: 27 passed, 0 failed
  hid-core, hid-apple, hid-gamepad, hid-ite, hid-keyboard, hid-mouse,
  hid-multitouch, hid-sony, and hid-tablet all passed in both runs.
- hid-usb_crash.sh and hid-wacom.sh produced TAP 1..0 / rc=3D2 in both
  kernels because no executable test cases were collected in this minimal
  QEMU environment.
- No KASAN report, use-after-free, Oops, BUG, panic, or general protection
  fault was observed.
- checkpatch.pl --strict --no-signoff reports 0 errors and 0 warnings.

Reported-by: syzbot+c7c429f6851638ece81338f90c5b29ac9c0dea1f@syzkaller.appspo=
tmail.com
Closes: https://syzkaller.appspot.com/bug?id=3Dc7c429f6851638ece81338f90c5b29=
ac9c0dea1f
Signed-off-by: Zheng Shuhao <viennaoffh@gmail.com>
Tested-by: Zheng Shuhao <viennaoffh@gmail.com>
---
 drivers/hid/hid-sensor-hub.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
diff --git a/drivers/hid/hid-sensor-hub.c b/drivers/hid/hid-sensor-hub.c
index 6470a290ebfc5..62799c26e6ec3 100644
--- a/drivers/hid/hid-sensor-hub.c
+++ b/drivers/hid/hid-sensor-hub.c
@@ -804,9 +804,13 @@ static int sensor_hub_probe(struct hid_device *hdev,
 static int sensor_hub_finalize_pending_fn(struct device *dev, void *data)
 {
 	struct hid_sensor_hub_device *hsdev =3D dev->platform_data;
+	struct sensor_hub_data *sensor_data =3D data;
+	unsigned long flags;
=20
+	spin_lock_irqsave(&sensor_data->lock, flags);
 	if (hsdev->pending.status)
 		complete(&hsdev->pending.ready);
+	spin_unlock_irqrestore(&sensor_data->lock, flags);
=20
 	return 0;
 }
@@ -814,16 +818,13 @@ static int sensor_hub_finalize_pending_fn(struct device=
 *dev, void *data)
 static void sensor_hub_remove(struct hid_device *hdev)
 {
 	struct sensor_hub_data *data =3D hid_get_drvdata(hdev);
-	unsigned long flags;
=20
 	hid_dbg(hdev, " hardware removed\n");
 	hid_hw_close(hdev);
 	hid_hw_stop(hdev);
=20
-	spin_lock_irqsave(&data->lock, flags);
-	device_for_each_child(&hdev->dev, NULL,
+	device_for_each_child(&hdev->dev, data,
 			      sensor_hub_finalize_pending_fn);
-	spin_unlock_irqrestore(&data->lock, flags);
=20
 	mfd_remove_devices(&hdev->dev);
 	mutex_destroy(&data->mutex);

