Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786775;
	b=Z/V4jrDPpg4tEVxqS/5CVTibAM2+2Rg/a0tGKaULZAaoxxLj7P5tFGWt+nGHgMDPMV5w
	 9sdkbJE3NbTLx1hf9m7VvwBLbmk7rzcEJ6LKpeVa1YtdTT2JLT7eH/LY6I//fqziXctEw
	 NED1GD/dJvUV9yMDZCc0gdpxwsqxyMPxrpCoxsIWfvsfjZ/HbFq2GZft6tPGuYIa+qYxy
	 +coFJiiCe355NHCS0p1wmx7ELZQ0dznVVG2pPylqKad00rlzy4RqwgH1cCrkD9lAUstnp
	 RCIntEDvDPsj0TSSUlZ9NZNAU1irdB72HMeDZnV3Sp46fHy1OEw5bzRgFAQmPZjh3yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VQHz/sZ19BwFcXleDCEwH4FlS++v4bbxGG2PqYD3WfI=;
	b=E4V+Fb7oLv31teF51SwBipU60O5mDuYgKibotBFY2lQW1mxKMIaFCV+ZdErM7OHVEcEN
	 bbKLXfCjBRvpGXj0IkrJ7t0ni41QxFe94YGObK6AUSkBnRI9wV0469ozgVGtRA1Y6x49R
	 L4w4Uq+Xf12NxnmR/tB1j2LgqXvUmhWPtWuujLkiq+BSEXl5HY5eJQ3MFYT3I1CWxtmn/
	 kJBGaO3jNVS2+3xhnBVdAgVBzXpdTKKHLeOIagG1dk0HnWnS4fQrMildsIu80u7h1ipSN
	 jV8LfsEx3mVnns6Yb4s6uXgwuDYXItgK01brg/JXY8AGSWQYQUQgilA8EqYiF2VK42A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="h/5+zgZQ";
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2E4606A323
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:39:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B2E4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h/5+zgZQ
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc751eddf25so5142662a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795786774; x=1796391574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VQHz/sZ19BwFcXleDCEwH4FlS++v4bbxGG2PqYD3WfI=;
        b=h/5+zgZQAiBrAWbAFRpZI/xS16gFdRUwpKefrULxrrbkK0gz42wl+aWE+1IxOLcSP9
         PBOi3xKSfeM4BYYiCvIBh8SvqjvJfOo6Kf3PSY0nFJqUMGMmFYGuIUWc1XCE7LhPkf03
         g4rvBljFBB5lXeiLWkWC4oGls4bkeyiOYHOC/6JXpXuqMn8e7UiFFTLfvNVjzmj82uOj
         EugooJOgUxm489N40rcE/dorSYPIuZxBHjk/QShTpvMmYJYW+SsIGo+9lMzgq0qnOaMM
         ftUMomdDRNM2sQ5isHW1fZLx74lXNmJwhXF1MvcCmCVfl4W1OQTuowbqAFGeNc66hrA7
         CjnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795786774; x=1796391574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VQHz/sZ19BwFcXleDCEwH4FlS++v4bbxGG2PqYD3WfI=;
        b=QKeSRqKLBRR2r0LduVBgk53TWcfzmvNT+yeYFBRI8G5QUl7zU3fTWG3DeTUFrlLh/m
         DnyQhmG/UKJPo1Gil+Ot+FBmWo8pXCSGvH9Q2e94Prx64DAJDIk8f6RYRKWaJmRnaFXG
         4szSj1ZklH6fuseHKRNU0/FFILPghbWMGlF4kP84dajS5BgbqBCALO98DtW7HsXYfkXr
         uQE/qYRhbUry1tuL8tvEi3/Ae6ZhpIy4ivHSLFwf3JD4XJtZmKmirIqUHUrxWg6oA87e
         UN9v05fSRMRWDhUTNSJx1yiKXIOQH2OC3IGkyOoa20ez99OwcT/chgHW1ZsHRwIt4Rza
         T5aw==
X-Forwarded-Encrypted: i=1; AL+hErE1K6DHOdCzOK4bc8NF6PA3VVkwGmWACO4CBs4m3WEgW7KnkaaaAkSTXPvMRVcrrOu3OCwH6gfRhfZmtrU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WjmUuYiFQTab7GLNhrhiT5OTDZgQYGbbCXKfQokhEUc9hi7B3
	a9RWpYcAVNylOku0bWpRa8hr6JEiyEvG7fAeTzphCk8+COwgDjWphTQO
X-Gm-Gg: AZFdTZeTKAlQFAj2zMN83DSN5dGpjxdSNXJl3vJssUbG5BenpMa8LUiinJ8A77CzPF6
	mdX5H7lrk5Q7SsU9gEQjhmTuJnESyeucoX4f/m+YP80BJmntuA/WR0XEL+kXl1KhTbFPMsxlCwR
	3y7mqDmHRPuutPfQSfy0o9gn5s5IshJySUEutNaSpekaEhLWS+mxSr320pVXDW+mskjplWAQAdm
	d5EyvDmW7JLcnjPOrNyKRPOCAIDYxC7/OoJSf3+FcThoUusfKRdU0athMNvk1SP9xxKFP15vc1o
	A3dTLpHQqhWlMwVWgo+djHDYZPa014/SvEDdzk4To9J219f2e1rAg5QXzJI4IVTd0zbLvEXQPWk
	dSt76tvmuif2+gMgo1nbQoOnAnLcl9V+YC6d6mJb/gacTMuHnI41Jy8RsTHfMnaBEV+SKSHEHRG
	sQvGzPKCxaJE+xTkSQKFRQIb+T3rhbUJ8PkrnPSGR3i4Z2Ia9QzCi4W2ErkBGzy+0IWSPVxh3Pz
	tXggygjOjc+ZRH0v43CdjHv+2H/etcmk9CU7psRB6dh7xdcQZBDTuhkRMEMFJzyDDKvJ7htxZaE
	MYJ47sj5qCeY+4gHPlD0R75cyISbT8mZqRogO4H9upbNjXplLXmasJHiMLAB9tQU27OA7CDovGc
	vsya/2vCwTOF2ZtSyhz55PmH7v3c14wlehcogYYjzgYKegTxPM11Ve/IzxL1MJiRLFHYyY/1mgg
	WekAxqCOWYeS9G6OaDY2eE50HoSvkK4NSYoCSc66E=
X-Received: by 2002:a05:6a20:748e:b0:3d3:aec2:4dcd with SMTP id adf61e73a8af0-4014c251613mr27551606637.25.1795786774414;
        Fri, 27 Nov 2026 05:39:34 -0800 (PST)
Received: from LAPTOP-3B99V33A (ec2-18-138-229-8.ap-southeast-1.compute.amazonaws.com. [18.138.229.8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdebb45c972sm4091144a12.20.2026.11.27.05.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:39:34 -0800 (PST)
From: "Bin Luo (University of Electronic Science and Technology of China)" <luob87709@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] usb: phy: twl6030: initialize lock and work before registering comparator
Date: Fri, 27 Nov 2026 21:39:22 +0800
Message-ID: <20261127133923.1452-2-luob87709@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <20261127133923.1452-1-luob87709@gmail.com>
References: <20261127133923.1452-1-luob87709@gmail.com>
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
omap_usb2_set_comparator() before initializing twl->lock,
twl->set_vbus_work, and twl->get_status_work. If the OMAP USB2 PHY
invokes twl6030_set_vbus() in that window, schedule_work() operates on
an uninitialized work_struct.

Initialize twl->lock and the work items before calling
omap_usb2_set_comparator().

Found by static code audit.

Fixes: 0e98de67bacb ("usb: otg: make twl6030_usb as a comparator driver to omap_usb2")
Signed-off-by: Bin Luo (University of Electronic Science and Technology of China) <luob87709@gmail.com>
---
 drivers/usb/phy/phy-twl6030-usb.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/phy/phy-twl6030-usb.c b/drivers/usb/phy/phy-twl6030-usb.c
index 9bfcb2c..b28a94b 100644
--- a/drivers/usb/phy/phy-twl6030-usb.c
+++ b/drivers/usb/phy/phy-twl6030-usb.c
@@ -355,15 +355,16 @@ static int twl6030_usb_probe(struct platform_device *pdev)
 	twl->comparator.set_vbus	= twl6030_set_vbus;
 	twl->comparator.start_srp	= twl6030_start_srp;
 
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
@@ -372,9 +373,6 @@ static int twl6030_usb_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, twl);
 
-	INIT_WORK(&twl->set_vbus_work, otg_set_vbus_work);
-	INIT_DELAYED_WORK(&twl->get_status_work, twl6030_status_work);
-
 	status = request_threaded_irq(twl->irq1, NULL, twl6030_usbotg_irq,
 			IRQF_TRIGGER_FALLING | IRQF_TRIGGER_RISING | IRQF_ONESHOT,
 			"twl6030_usb", twl);
-- 
2.51.0.windows.1

