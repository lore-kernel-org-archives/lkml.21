Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795675907;
	b=bKUALBhOZwgcR4QfymDM1Hq36F303b1fo5W63LScsBE2hJFGow+FTQ6qzRtDKP2J5me7
	 IyiIc13HQUFw7szrfsSHvOe1IPZNlgRp9oMZDDGELpZFxthh3bgFlURSVIRdulR+B0yDN
	 ZdDIJJ1T6+c1gUsIeC2Dbf9MZpTIgCe8NTmsjp80NW46ghzZFUGRpOqATDZk209CrvX7E
	 rKL3yQCd7+WiZgmhr1MG1lZJGSXUYNr5TXjQuPU7fzU76DSX15NInOqcNH3dKtaBTUq26
	 E8c+BAspkv5FL4xwV2xRJJaCxc1zry1wiSL15RKuvwPNQ4aNW83HKYbE8ZXVURUGwig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795675907;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2BppQ3jU5OncwED0Bv8UIvkdFXg3MIQgk7zc4gTIqe0=;
	b=ad4+JLMNPucoM29wkvVH9TncoKqqsGmhBTIz/2PFPBsTA+mJABWUflZpWX6Cx5yo8DPe
	 28Nck3UKPH1tY+X3tgIdl7/ATLjYi8Sh0IXvjq1tBXhFSl4iDk8w2bjW7qlIX09/tAy3U
	 I/6nN7pTOG6GA3PPx5Dh8MkCZTIA/VA7xUsb8yKnL8308kO23WkqhGsnYntlGx6aE8Qbr
	 nxjb25ZzB8YyZvy/N5IkpeH8q+4hGF2Dlcij5qPL1wnJ+hJ8Y+0L1pDoL7oFbgYv0Ma50
	 KG4/9i6L89KKfHX1d5VW25lR5c0Hf1vG600IUqqtMSnz925TBauMyq6y57YByYc0+Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R28l8zOM;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B180A606A336
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:51:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B180A606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R28l8zOM
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b40f4d4b5dso2982229a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795675906; x=1796280706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2BppQ3jU5OncwED0Bv8UIvkdFXg3MIQgk7zc4gTIqe0=;
        b=R28l8zOMUqGgFv4TiT31BV3/hk1GeI2VM0sepDvfQmPEQz1RlCBCjEtOnJCENWrVOr
         dQmFEuOUpVIOGlntdEwxC1Hg9EG12lrQem+F6tOXbXXGMrZdE3W6GB5iV9ZHfUFyFQko
         EVuZet0XpewNG6DrfjZZCubc52SFPLvP3KwCNAlDWmkgZaMbM/RdfYzKkJSkzShbp/2D
         uqNYPdgyCngW5rLBdxl9bDByUEDsApFIhBlpuOnd1bWN+x7M1WncBBsuK4+k9rZN1lrp
         38YRnVuyil7H0lVoAtjI0mttts9k7jZ6CFgCw3XixJJZ2eWusVKSmkriPHq7SFM3P5wt
         QVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795675906; x=1796280706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2BppQ3jU5OncwED0Bv8UIvkdFXg3MIQgk7zc4gTIqe0=;
        b=wB/bVy6qjewop2n6ZQ8LQUgybHj79XbtC0r0G8rs8be9tPOjgw45mYuPFtaRcnUpv+
         43v1g72d+nLGfdPj78tt6JIdin9+IwWQNVkDgmmoXqIL9VZqjiLzyCf7MbAFRUKu4aSF
         k97YbgA+J8E9IrtWy3chUI/dxKRpmUI3h83STQsf7jdmNJoCr7vZJmA4tiUK3jzl0jdw
         Vsg4TgybRUZcS1J2yMxmemwk7bdp+dE7WpbtwEq+6LnYoQLmyn+jqheqVxaGvTOWt9+Y
         kxZpH8W7NQksr2GsYiMnRIVjF7K3iEyO+gBvCt8aeMK5h3KMnZhogUHOrCGuLw/JS2KX
         6Omw==
X-Forwarded-Encrypted: i=1; AL+hErGL0PjoXXectBVSiVogEZG1b1cGPORtAeJKl7K429h4eccdpMGVOIB6BSkLK9Xg1iTkaL2VEoaT7ETZpao=@vger.kernel.org
X-Gm-Message-State: APuU4Z+saenMOEvEZRjJJOivsVMPGQx19W+guErIosYIcmOHPvlo9B7q
	Whbhqug0olXa+X7W+E6oeaEXyyCKKX4AnxvtbkjhCPWKU/4ZDwIW1IDh
X-Gm-Gg: AZFdTZcPFxQfJMPi/7zxm74bfy90TGTXwXKPz+dzjl9iLa8q7DQigyxUW31YCn7w1Bv
	8LwM58GLmGZSyIILLsF06E58GWzNTBQHkYnL9IBrImcj/nyymA/t1ZLo3nzXM+HL8yFZQZ+jipX
	3XG4jbGRtI2S/GyKtPwMwyQYTAP75wHKzMbaVmRmDmr7f3MaR/cgEICnjnMiYXODk3QI7f+qalo
	sD5ZeXKtveZbMgrI+9TkptmWCsn8P8ObOWorKqHukq/8ZVisltvhwbxxwPBMXK0sAFVTraH9/sb
	bHT/VK6Es+oM+Z7OPikFP+WhENDiY6P6wInq1BU2gs5jeGatiaU/bFjcLmIy6HETduOcAhKCsPu
	4W6yNgceb0FqZ8BvFNL43F/3s+wKPI9aoF2sc+YcQKhj914PWSqfAlmZuW1In+brCk7SF/EBOJ3
	P0u5gT7iUT5pXUKPkee9crKKhAaJQWWJLO+BGmkzu+zZxZqQlUVU/9mm7Wo33g9xzPz2MxRVHe1
	FmV1HB+vtvEJC+YSzB4viZohzt/5KXXIdU9/hIxuQbTi9A3ZNl4QqYnfw2Y1quOG7tmlISR28d9
	JafetRJMQh8Vu7ObhgbVBSSpooz5XvfuA+d6zaaRBtR6NvVcHmfD7nsfW8RCaMUrNlUGQjJGHwN
	lH34Ich247RKt99HvK9TdhvaxYTcAwIyYIBgsT/6w+KPknLZsDsuxXjFzYM6b3h/MEFqa+8m9Yn
	71Rs9/64Hiu4lH1976i7vfAdKIAA7IF/NnuClBIpkq
X-Received: by 2002:a17:90b:4490:b0:3ae:a531:4e73 with SMTP id 98e67ed59e1d1-3b41c7b606cmr19992479a91.7.1795675906092;
        Wed, 25 Nov 2026 22:51:46 -0800 (PST)
Received: from LAPTOP-3B99V33A (ec2-3-38-183-164.ap-northeast-2.compute.amazonaws.com. [3.38.183.164])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b776a14sm13997686a91.2.2026.11.25.22.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:51:45 -0800 (PST)
From: "Bin Luo (University of Electronic Science and Technology of China)" <luob87709@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: phy: twl6030: init work before comparator and clear comparator on teardown
Date: Thu, 26 Nov 2026 14:51:39 +0800
Message-ID: <20261126065139.127-1-luob87709@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
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

twl6030_usb_probe() publishes &twl->comparator via
omap_usb2_set_comparator() before initializing twl->set_vbus_work and
twl->lock. If the OMAP USB2 PHY invokes twl6030_set_vbus() before
INIT_WORK() runs, schedule_work(&twl->set_vbus_work) operates on an
uninitialized work_struct.

In addition, neither the probe error paths nor twl6030_usb_remove()
clears the comparator via omap_usb2_set_comparator(NULL). Because twl
is devm-allocated, a subsequent VBUS callback from the OMAP USB2 PHY
dereferences freed twl memory and schedules set_vbus_work after
teardown.

Initialize twl->lock and work items before registering the comparator,
and clear the comparator with omap_usb2_set_comparator(NULL) before
canceling set_vbus_work in both probe failure paths and
twl6030_usb_remove().

Fixes: 0e98de67bacb ("usb: otg: make twl6030_usb as a comparator driver to omap_usb2")
Signed-off-by: Bin Luo (University of Electronic Science and Technology of China) <luob87709@gmail.com>
---
Found by code inspection; not compile-tested on ARM/OMAP or runtime-tested on TWL6030 hardware.

 drivers/usb/phy/phy-twl6030-usb.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/phy/phy-twl6030-usb.c b/drivers/usb/phy/phy-twl6030-usb.c
index 9bfcb2c..a9da7aa 100644
--- a/drivers/usb/phy/phy-twl6030-usb.c
+++ b/drivers/usb/phy/phy-twl6030-usb.c
@@ -355,26 +355,26 @@ static int twl6030_usb_probe(struct platform_device *pdev)
 	twl->comparator.set_vbus	= twl6030_set_vbus;
 	twl->comparator.start_srp	= twl6030_start_srp;
 
+	/* init spinlock and work items before publishing comparator */
+	spin_lock_init(&twl->lock);
+	INIT_WORK(&twl->set_vbus_work, otg_set_vbus_work);
+	INIT_DELAYED_WORK(&twl->get_status_work, twl6030_status_work);
+
 	ret = omap_usb2_set_comparator(&twl->comparator);
 	if (ret == -ENODEV) {
 		dev_info(&pdev->dev, "phy not ready, deferring probe");
 		return -EPROBE_DEFER;
 	}
 
-	/* init spinlock for workqueue */
-	spin_lock_init(&twl->lock);
-
 	err = twl6030_usb_ldo_init(twl);
 	if (err) {
 		dev_err(&pdev->dev, "ldo init failed\n");
-		return err;
+		status = err;
+		goto err_clear_comparator;
 	}
 
 	platform_set_drvdata(pdev, twl);
 
-	INIT_WORK(&twl->set_vbus_work, otg_set_vbus_work);
-	INIT_DELAYED_WORK(&twl->get_status_work, twl6030_status_work);
-
 	status = request_threaded_irq(twl->irq1, NULL, twl6030_usbotg_irq,
 			IRQF_TRIGGER_FALLING | IRQF_TRIGGER_RISING | IRQF_ONESHOT,
 			"twl6030_usb", twl);
@@ -404,6 +404,9 @@ err_free_irq1:
 	free_irq(twl->irq1, twl);
 err_put_regulator:
 	regulator_put(twl->usb3v3);
+err_clear_comparator:
+	omap_usb2_set_comparator(NULL);
+	cancel_work_sync(&twl->set_vbus_work);
 
 	return status;
 }
@@ -412,6 +415,7 @@ static void twl6030_usb_remove(struct platform_device *pdev)
 {
 	struct twl6030_usb *twl = platform_get_drvdata(pdev);
 
+	omap_usb2_set_comparator(NULL);
 	cancel_delayed_work_sync(&twl->get_status_work);
 	twl6030_interrupt_mask(TWL6030_USBOTG_INT_MASK,
 		REG_INT_MSK_LINE_C);
-- 
2.43.0

