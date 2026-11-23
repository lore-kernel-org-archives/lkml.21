Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438045;
	b=KGABeKOUX00ayO8wCECTIAKAc23jH1p0x3SLv5sTbRVum3uiNr9vrjSkXUMNs4expqYH
	 pl3GuAvZ42sz9sRIgMeW5jczR8oVsbb1fkWnn2KaeugRT8CtFR1jfhmuaPLM2P8evaRI9
	 NZUAQ65EGnkmqo778ryp0CPS83EAXNue7vhuIHjaV2uTUscb3O5f6paGR48QOCTDsxUJW
	 fXEbZ5j+v+B7jfhlk3OdI83BvzMn48W+4kKUsJJSXo4yt6j0m3fRQ1gTM7NQwEDo6lw37
	 gK6ZkQVzyOT0XTUzdOtviNRb80p9gY0I7HT0k5AIByoayyrL9+WmQWTWb5oMi1ftO9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438045;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JLWRIyW6L3H78bd/BFlmj2ybIy9WVHoAXMpJ3dEd5x4=;
	b=M9U2scJcERs2Ta+Vcs+FZglc35jHtQ2/wg84c1EOf/lYZ7n9zQWjC53l0bxwtDMXwAnx
	 CIBMi9GaUqJnx0R9YUhhwCXsyT2Z+b0XaDJOOheOdlhdaWBvNDKtAlrvisww+t/W5CYsr
	 by6Q4TBZ/cFUa/jmn+8GocqF+SEm0nLsY4V7EzVPlUZv+z+GbQt0hElAD1napzcWShkGw
	 Wr4aYG63FD1dRhYEOzVUC1o6AcRqd8vAuUwn0qQpj+3J5ixYczOaj1z2FlJc3/NVd70Ql
	 GVligMG6Bk9lFz536S5A6t2bbJoH9UkFJlKjBdcz9Fbh7OSmtHpaji6Zej2bBxlqoNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="DbwGP/cw";
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C647606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:47:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C647606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DbwGP/cw
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f0621eec70so17724485ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795438045; x=1796042845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JLWRIyW6L3H78bd/BFlmj2ybIy9WVHoAXMpJ3dEd5x4=;
        b=DbwGP/cwdpTOtGUruhFiB4Bmbuh2pxwLCoG+NMc7KVnrn5W8cxeooMpUbVXi4UvOi6
         hS5h6/P1Z59KqHBq7Ng0wA2hkJqtDssAYfcAkXL7UJycIZaImTndQpoyc+ZKGQbqJ9oz
         7RXaj8VKPYVwUW+V3RM91bTPIkbNnN7NbjE6FnRfs2Vzp7vxxyyMLDth2in5ckFdfbbE
         eC6Nuufo3B8NI9pxMF6q5PqWeCq/gWXUFCbq8MFeqFtXU+myIoCeWnRXitZKpiJTUbFN
         zPjU1+BFBmn6sI3GuLspEKKoFSsj9eX2fCFuHQowYFDZTf5b2bispBLdHQC3nFW3uZ2e
         apyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795438045; x=1796042845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JLWRIyW6L3H78bd/BFlmj2ybIy9WVHoAXMpJ3dEd5x4=;
        b=tYB8o1WhDkkJCZuV/Cu6AQ5t/z9mXFC6aS23nlrmGsNf1lTbMkSgzRI8A6v6CBEEgn
         3qLMCrMkYoWDT5JcbMpo4AYZdC+PgSiqFAoSsYv1QR4RXgMuwcYVgIxog6FtyNGJPqEL
         ghqFnk2bH6zW/GGzhfhVyKfo6bVK8lztI+34PRJ93aVrP+wj8r+O7lsypf/Ux7KH3P+y
         Lr4/pUVQxAHKSynCgh4BCsEEic8bsXo90nzdhoJwI37yg6i53ra1oRVrK0E3CJXsJumc
         U46tJyfQHQixfbCUOCyaf0xzPhcFy7WNBaGYxhs9n2IBRGIU8Ign+ui+WsB86n6FQeQ2
         1wJg==
X-Forwarded-Encrypted: i=1; AL+hErFtQfz0gALtN+244rhRW7dm3qBjCKIKmHRZpUFqeseMkYrhAvs+IuN/a6SfcTTD0QTbpBax1mVBF9bU+3I=@vger.kernel.org
X-Gm-Message-State: APuU4Z84n7n8P+lpM5OqKQIHCDuo6B+h3I+x7bkugo53XGw14UinRF5E
	td6Wck2Vh3PdqWRDEH9J/SVzcHeCH1Pt/SI7xvLs7kXHZ++quJpHkSby
X-Gm-Gg: AZFdTZcPLeJVY6ONkGgG6qiySVjZVNi3HIj8h7Yd64PNPCVy/Or7T/aBdxqGTEyBJtk
	osQharW1I0Txbz324HfcgWIewruMc1xI9k6Sk37+ZwW/ma1GrNCgVquMZnuDlHekpPPCi8mpl/j
	iiU9n7iq66NuPmnk5QJrBVCe4lyAZ2AChZ9gybEQFfSLaMfacwq86lktWaUGjPIz9UlZfIPFXxf
	lBR8ZnEIlSNF0k0Xjser3UPSYE6NIeB7P7MX7ZHWUbnMvf4yEecVeAqNipJhQzxyhN6PGtjubH7
	2dAKCnoMAX9gBrkyGVecP4yyx+zEQZ59b+yX518Ly7xAbOUM+A3Xx5SRGzeE9U6Ch4Tv1lm4UwD
	WigPxi8JAxqZd0eL4hqMM8ttEK3V4wCuKoV2OPY8N1jo6712mvsagnWmYnYxBAHJhYyhPpnhVhV
	FoGrTZQ8OgfYbXUjQg4KngRCnsYYRNCqBcKvaJtkcm3LfE4EIhyfKQhGi8l+06lYv2S0Z5w3S37
	0+18rOUHLpiWM/dqbuFCs3w8yVY/fX6NphwkuutltIDbFcg6iCaejqv28Otlb+tQxgHuB0mjYKY
	yXhCHWwpVZA86t4y5IHoMTmv/t4VwnapMbToZRjgvH630mv//wE=
X-Received: by 2002:a17:902:e803:b0:2ef:effd:4606 with SMTP id d9443c01a7336-2f03efb019emr116976325ad.2.1795438044765;
        Mon, 23 Nov 2026 04:47:24 -0800 (PST)
Received: from gb05.tail50fddd.ts.net ([139.5.199.74])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0dc0f8sm51919435ad.27.2026.11.23.04.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:47:24 -0800 (PST)
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
Subject: [PATCH v3] HID: hid-sensor-hub: avoid lock inversion in sensor_hub_remove()
Date: Mon, 23 Nov 2026 18:17:15 +0530
Message-ID: <20261123124715.351511-1-ayaanmirzabaig85@gmail.com>
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

Fixes: 8a5b38c3fd70 ("HID: hid-sensor-hub: don't use stale platform-data on remove")
Reported-by: syzbot+fb951970a334aaff00ba@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/6afddf21.a11fe2ad.1b4426.0003.GAE@google.com/T/
Suggested-by: Zheng Shuhao <viennaoffh@gmail.com>
Signed-off-by: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
---
Changes in v3:
 - Actually pass 'data' instead of NULL to device_for_each_child()
   (missed in the v2 submission).
 - Drop the NULL platform_data guard since hid/for-next already checks
   dev_is_platform() and !hsdev.

Changes in v2:
 - Attempted to pass 'data' instead of NULL to device_for_each_child().

 drivers/hid/hid-sensor-hub.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-sensor-hub.c b/drivers/hid/hid-sensor-hub.c
index e9d6eb3b3831..090e5a232efa 100644
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
 	device_for_each_child(&hdev->dev, NULL,
 			      sensor_hub_finalize_pending_fn);
-	spin_unlock_irqrestore(&data->lock, flags);
 
 	mfd_remove_devices(&hdev->dev);
 	/* Clients share one HID open; release it if references remain. */
-- 
2.56.1

