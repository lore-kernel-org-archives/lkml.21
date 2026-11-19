Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795116059;
	b=kH1mlsmRhpnZZxBa5jpjahltQ5oOVMgBhrUNT4fGsyCTkaF2e+3LdL/b3FGVkal7MiyR
	 QFKpW3i3NWkKhZAdsxaPjaHYx9MqoLgS/stLI0vDnRg6Ej5upLWRhT/VdFDMiYOA5bJkL
	 VJisgG9e+952/KuXgdc2FdGPZt+6Xw5xQOXJto9XQDq0OxwasdAFOmx05+ZIwrxRE9tjZ
	 xDOEah6D5+3toN7fdqLqCBlfVnUENbH2Nm3kq2A3w+hwRXaE6uZIYMZ9JOzWXuahpAWxf
	 dltcys1I1lxX6fho27lq1Qb2Sp/o4G3r9O6WQ3btTI++NTa67/K+sC/qx8vqp+fsclQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795116059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=b0c6CGAGUF6g8vtfSwTL1Y354j7cyJnIuNNGjuPfWNo=;
	b=xrCSb/exyluDcSMkxuH6ZwHPaq4FgZzd+KWhvoS7aDtBeQv/LFiqKfCCkiGKJQP6Mzvg
	 QILNZA4X7J7WIHOLcnWjoTv10hbXl5duNGTHQIDw+ICwBsz/6SdKLXtdSNb0djM8SzljA
	 h+yTE29HI5GZjRYlo3nLLhlrfb4gFmSoZJ/LD9GJEdIU/myKfoOUA4Z1+xrufij4paLST
	 8V6LFsockaDg6rUWt2XWEBbR60j7NwFQB4UjSuNwAJw+ej2xBO8iCq3pcmfIAMFfIYqDh
	 CCAvst7f/lAjJts2FNuOoU/JiLSygmTlIrFYs3MFfk8WC7+Qfg2rIeYMzPBRmYGggxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qNv+F2up;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D80606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57D80606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qNv+F2up
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f04244c3d0so566065ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795116059; x=1795720859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b0c6CGAGUF6g8vtfSwTL1Y354j7cyJnIuNNGjuPfWNo=;
        b=qNv+F2upay5nHaiW1qXWUZPBc0wtvYrsbaPLKxcBjuBMxIfvcKIMBkAVP7tef86ztS
         8GydGE8h32QinKjD+nR0s+whfjhhclwBKtHCTyVmwHWbRkFe6QlTTFCCyeYg4/7UejnS
         jZc7fskxiat+VCWRrP/uU0oRaYek6TTznytdpZmd1/2ewt6YJCuXb+BYX4ipwMn1QUDo
         DL5zFGqRH15Sm+c7lKYXtjYzcqYdtMMgB02Neiiwd71EVE3VEWqeDTRaKKsZ9UlOfvfs
         3FIslBoUlo/U9bttxtetyDa5a8bJO5nRV2HVPahgSDVDyW72hFSeuPpxTNrTSh1Fxnmc
         TaYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795116059; x=1795720859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b0c6CGAGUF6g8vtfSwTL1Y354j7cyJnIuNNGjuPfWNo=;
        b=Kr0o0LonhR5rx13BafytZhIRC1Ug0Q3ToXBRns3lie2p8Y88adPO3fBH2w3Y1aUeuh
         3ZjCT3sY1uJhCUSLpUihviPjqUnhTzDcEEacJ24qy73ohwj+OAgigAH8u7ZW5CaU/82l
         4NmtbH5AQrOCL+6iwXluhyLce/I7HywJSMuC8dZsFBI5RPQ1pkpZspphXmUuoOOuydms
         pIVfGKnf2F3BMRLAUIdqwIe9H8YNIcwjw9sVFw+kZjZi6XbFBG7GUn3r0djlSbdr217b
         kUABpczalCl6IrXia8l9C6X0I318xMm5DETyOlt2E5MTX3Z/Q0S39WNaxClNfzu7dRFI
         z/cA==
X-Forwarded-Encrypted: i=1; AL+hErEZ3VRCNKcSTzCi74D9yIY4m9+Alcs8rnCD4zHvls3Iw7hEsyNVfT7IxazdWQPLNs8fzTP26y3Drza6EP8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rFlJ32B4x34VblWu8vXYqmbMpmYTUzIeCJqs8zk9fwMqssi7H
	CFQlkd2FqZLKbjgp6rpP7DpIIDwQ7QheqIQGtEr5x/U2VYesF81ymg3P
X-Gm-Gg: AZFdTZeeCiDqx2+528LCSCmtzOZ8cFoHzVPy1Y+YuXpSJcB96BbXgSt3R87/Arifv9k
	HVKExm/DlEZIpIIYge+Z8LdWQbj+Gb0SJkUHJgsZ6O6NlvEDJcWSZOgLBvhLPEKTh/wovq8B27W
	AeZOjn2wZ8c+BNJRyV/gvGgsmwQOwS0ZfJnbKPPVFDqWHYgsWhMIvbSrLDx6hH1iSvtxdECJZ55
	X4Z2ufRlBaKr+V/LWg4SszUpUfMlr9EtmrsPL5xgKFBEOiZ86ryWIhR1E3+7o2Z/goEzi/heTeA
	iPAVy7806E54SQJWI+RHpGk3EnxUj3uz/sWMyOJODuYlVWo7bD+dxQDHzaF++/CezwhX/old54F
	a0bW0kiBwufi9GB6KqPcfdi2AURCfwCbCZrOQ3AkThz/CoFfAinY/6RcLD9xT1POc/62lgkw2W5
	JjhHmMJPE61oGwWXGi/0P1aP2oe2NocE+1KGrvLF/p43Br92LlNrdQ53esRZ4PCvJ8bXkfjRhaS
	n5ZAhXt0LvtfvrFuX0VCVzv/4YaFEXcFWzndkmHOomCnesO0wvC0yByX9osCPaGaGfl/rRI92wx
	iex0pNeXspT3NaEnigCb133nE3d6oRwF0erf4ix+jnLwU4LTe2EFcxrZsZ3x33/A4Rt/t3I4
X-Received: by 2002:a17:902:ec8b:b0:2e9:66f6:7894 with SMTP id d9443c01a7336-2f03f15c27amr7776685ad.40.1795116058661;
        Thu, 19 Nov 2026 11:20:58 -0800 (PST)
Received: from gb05.tail50fddd.ts.net ([139.5.199.74])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1935sm3948805ad.26.2026.11.19.11.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:20:58 -0800 (PST)
From: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Jonathan Cameron <jic23@kernel.org>
Cc: Lee Jones <lee@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-input@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>,
	syzbot+fb951970a334aaff00ba@syzkaller.appspotmail.com
Subject: [PATCH] HID: hid-sensor-hub: avoid lock inversion in sensor_hub_remove()
Date: Fri, 20 Nov 2026 00:50:46 +0530
Message-ID: <20261119192046.1015750-1-ayaanmirzabaig85@gmail.com>
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

