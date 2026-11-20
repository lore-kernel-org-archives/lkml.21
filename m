Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795176791;
	b=WhHgrEBxL4cGhbeO0zHGVMMmmeyePjRFEqV8y6TkKnwthDsg8lGXc08JeazDM3F8LS5r
	 i/DlGQjWWaSd6hR1EGommecECatv/JhbiLtCfWFf7p0fMOf2r/O9gCxW1oC2bVjr0vDM7
	 WoRci46FgK4EeryOLQVZX8Azlk4PmlwqoqeTYb1pTHO2zJfuaL/qqusqq1GI3o/goTnFA
	 /1WunQBGfMkqOTkb2NJguLJ+boMmWKiIzme/cTP4tFreHJk6enlpOtV30k0v+3gSgk1Ph
	 /RlEKfZK19bZkgG4TMmLTMu4nFOWJncpByX5JzaJ/HDjmw3UfG3XITF6IjEpNPwi3KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795176791;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=m6tPHsL9Rz9UVRE/EWNWK0Z61K0edsr5OFdC9JXo0fE=;
	b=xImypb1RFrlIOnoZ1igXwe5Oh/Z2NHjxk1DCvMEecKdqWaLouiQaR58UZKSvd5sGcO09
	 I6N8NSB/eKl4H+nAVaptDBIilPuwUThZw1p0e+BCTfOuMQpY+DZu/T94qfGbe6wFiAK5P
	 ZTGxPVnykmRazPh42MN0jDEkECmPv+hxWzVvOb2B2OTl/1mesvG9G1B4+ofg0yNMqFNqM
	 TTFVAbc4yyrcxjTAk/vuJuVvVDdNCfXJby+kVEjKRrvSNYPX4azeHWM3MP2cmOqmmNtp9
	 Sm/Bm6YJ86G0qEowcPNsC0+Le1sJkK2Gy9IXQvj2sWfv/FPYEIaGX4RcNNA+Aow1gzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RLP9QAoM;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26834606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:13:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26834606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RLP9QAoM
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cd8ba7c2694so378936a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795176790; x=1795781590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m6tPHsL9Rz9UVRE/EWNWK0Z61K0edsr5OFdC9JXo0fE=;
        b=RLP9QAoMuEkQUYfb3jApABtNveJJP3px+NbmiksGLdl7+ObkB3blouXLdlaJ4ZGC2Q
         bGDPEpn77aJoCskRVMhCc9R92Iq2o1bYVlQvyybKsWVSwqf1dAEWd3eeEgj+voIBBEPX
         voluYtglHq+oeedHwt6/G7mNy2cBDOxezVn/Z3Kqa3BxSte/hPKbARCslrKr9lLUQ4ka
         kMQRi6Qgn7umatfPKLzyWV/wL7BiuV8iR7DFA0xcZq/gtQUmukHdaJoh6CJHx7bNrl/n
         R+R10Gb1ILkf2ACeQVsaBNs9R4JgRvlpsPmpDr6tek/GZVBZHsH3FwxwjRHRagrzKhFQ
         Dddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795176790; x=1795781590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m6tPHsL9Rz9UVRE/EWNWK0Z61K0edsr5OFdC9JXo0fE=;
        b=Z4Bn8wzgmsL9IUa+xwG5OYDsBbyC0saJMRRgu4MUMt141jt1YAy7IGANx1PuSE6qPk
         egudmd792IrTaFnnKcCK19JU/Ijk35h9+as2tZq67icJXCh5WtoBED1+39E6fqueTWhs
         PnQiXABY5fUObEjZw2u9xWQhVZYX4bh6bf90sMis4PUJnMd2z1cnRkUdfOjrKHXdN8vT
         Tq/4znvB0XGefz+zj3Vo5pZ9eJNIC8q92NQvfNcpN7Gsext2AAVxoflVC8sP4hHi3BE9
         v3wZwXU5G12OzC5k8EtZ107BP38xkbhQb+31AtqcF4kBIgF7tWwSVRRtTJ77oHwdP+Zv
         c4NQ==
X-Forwarded-Encrypted: i=1; AL+hErEpTpz8PpNoGHvicyTjPTju2JVicoAGhgSUlGlCbJeRS0Gfyf0na1BSe+PwcHJCd/rN7ySmvdR4sh+rZ6c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/f0RkmwDtTSvRflNb/I+cG9xcLDKgGpPBxfyueO4FnwXham5eh
	1ZsehaQxT2qK+mqKi8c/N59Uy09xA2ngSxdA7BJo20PxgoVNDbmabW57
X-Gm-Gg: AZFdTZcNq+M89hol31QdXCeblH4g6CJg7KMNu/ptUPhBxy6FYEduaNYj6UP9NxXbda3
	O9SxM1mrJED3E8MB/w724pCnQ+S3A1Hs3L7j3CuAY2Bd7RhKmsDutUNOIS/asjM88sjJZfeI8iL
	rMSt3MFV17NTv5+FJ9R/Ka4g4liAJtwuwZhrCfCda3yGgfcXLCNpvGvLwpa+r0q/OYw9eLdK1YF
	0Wi4OIsNmYBNeZHQ90OrT6eDBPcADkrvWBWEgac+0MjpIswonS8AxUFUCec2j3JArHg7xKY+gsD
	r58hU8iWFrckgDOz3zFU2GpGifE6gvZj0ZPVvkFIiLPbQX578JisNJpldf3rfbqdoEhx7oU5+Bs
	CzZMVgnopQjrDYlwjftirJsoCL3b9rBAd3Jn15C3hjGTHfHQpMfZx77c2FebrgzCZ4ac75BE0M0
	bIg3ze0BaN7bz9i4308XOWQQqBclzyUgjgAB9bnmTUztY0UJjkvZrHS5WY9p2nbz4O0nKGp2zJ2
	AgJHeBZXcpa35UBfwRQTOuJtlq3nXd6jPXmNKEnwY5qywxxlbjOfEJKTn0Of68Q3rQw08UNAseY
	9B18geJjHGx+yVkIXd0XaOJWEG86lUB2MU8dkJCZDEiqo5wZ7e0MxnGTzbxkdDQkt+NJ9IZs
X-Received: by 2002:a17:90a:e7d0:b0:3ac:929e:691 with SMTP id 98e67ed59e1d1-3b41c8d5a52mr2637365a91.17.1795176790444;
        Fri, 20 Nov 2026 04:13:10 -0800 (PST)
Received: from gb05.tail50fddd.ts.net ([139.5.199.65])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41cfb48basm1513592a91.2.2026.11.20.04.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:13:09 -0800 (PST)
From: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Jonathan Cameron <jic23@kernel.org>
Cc: Arnav Kapoor <kapoorarnav43@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-input@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>,
	syzbot+fb951970a334aaff00ba@syzkaller.appspotmail.com
Subject: [PATCH v2] HID: hid-sensor-hub: avoid lock inversion in sensor_hub_remove()
Date: Fri, 20 Nov 2026 17:42:56 +0530
Message-ID: <20261120121256.35339-1-ayaanmirzabaig85@gmail.com>
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
Fixes: 8a5b38c3fd70 ("HID: hid-sensor-hub: don't use stale platform-data on remove")

Signed-off-by: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
---
Changes in v2:
 - Pass 'data' instead of NUL to device_for_each_child() so
   sensor_hub_finalize_pending_fn() does not dereference a NULL sd pointer.

 Tested against the syzbot C reproducer on linux-next; it runs cleanly
 with no lockdep warnings or oopses.

 drivers/hid/hid-sensor-hub.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-sensor-hub.c b/drivers/hid/hid-sensor-hub.c
index 028e70ec7bac..4ade5b5ece56 100644
--- a/drivers/hid/hid-sensor-hub.c
+++ b/drivers/hid/hid-sensor-hub.c
@@ -836,9 +836,13 @@ static int sensor_hub_probe(struct hid_device *hdev,
 static int sensor_hub_finalize_pending_fn(struct device *dev, void *data)
 {
 	struct hid_sensor_hub_device *hsdev = dev->platform_data;
+	struct sensor_hub_data *sd = data;
+	unsigned long flags;
 
+	spin_lock_irqsave(&sd->lock, flags);
 	if (hsdev->pending.status)
 		complete(&hsdev->pending.ready);
+	spin_unlock_irqrestore(&sd->lock, flags);
 
 	return 0;
 }
@@ -846,16 +850,13 @@ static int sensor_hub_finalize_pending_fn(struct device *dev, void *data)
 static void sensor_hub_remove(struct hid_device *hdev)
 {
 	struct sensor_hub_data *data = hid_get_drvdata(hdev);
-	unsigned long flags;
 
 	hid_dbg(hdev, " hardware removed\n");
 	hid_hw_close(hdev);
 	hid_hw_stop(hdev);
 
-	spin_lock_irqsave(&data->lock, flags);
 	device_for_each_child(&hdev->dev, NULL,
 			      sensor_hub_finalize_pending_fn);
-	spin_unlock_irqrestore(&data->lock, flags);
 
 	mfd_remove_devices(&hdev->dev);
 	mutex_destroy(&data->mutex);
-- 
2.56.1

