Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795708650;
	b=NuBXSo+u9D7F9dklJaPrwxnc1yYcpYjWMnY2+PZJFY9ObrcgkVErlW5TksdKnTLEMsSg
	 S3V9sZzvanl3a5xluswd5DSOj9T8F45qvykW1ZzKGOY+7kHTOC8WEqKncYBgzZPoQmiH5
	 MGFKgzM6KDUhpQDc5QEFaukpyiJKBAaNqA4SKnCage0CpC+ZWOvKn+aldSjjRbug0tAYp
	 bdTPxNBQfg+8Z7WUQGRNHqsq+CRuUnUmMvFA0K4hXgBZMNHqA3+EVJCPFHpMLKekHlHeH
	 Rk+EtMfYaY4PmANRuSWnytpoJhEn4EHQtv5uiXSZu61NJeKQrz7ja7xfsMNBdKGHPvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708650;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=y6L4WI3l3y6EKkCBdb+Q/hnuzyHnQuZbp5Sliq/f6MU=;
	b=Gogmx3H/51IGQWa6ulpjqK0QQRAHFXuuesyPth2GpYDIEv0Mdxw04dDrtMmKfJhtd99t
	 NeLoQKsldoB8zbnq+K3tSR7W9MI8UD050JaElnlGfAZR8ZQ+/Pch63G3v+64Yy7FaJHZk
	 lJ78v93ErT27jDsRWHGFkIHzkxCjUV/mTpBizE1bb+g+HmRfdzM8ybVg0fiQEcUIQSNhF
	 Ir2cWGAnkmk+975RoKpQ76bUP+31GyxZPL/uHZrjfIWCPKSDDlMLqtL26Na0UmERuWd8g
	 4Mzr4qntFFUaWn06kKkRNidpxnxINsOLfCshZ1Lm0D9tn69Y0xOexCMZ8iEbSslNSqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nIG0tZ32;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA44606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:57:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EA44606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nIG0tZ32
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33fb4680717so2860899eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795708649; x=1796313449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y6L4WI3l3y6EKkCBdb+Q/hnuzyHnQuZbp5Sliq/f6MU=;
        b=nIG0tZ32wuQQOYpu9PyXM2B3BeTVfxmp9slJteD5k79yVJNR0+gsYtQjCtpWWF5RY7
         djkdKE5iflDTpXLhkeueJwAQ6MwGZUPq7nJ5VUdYYkJmgsgUcPLUNQ2lC/y8Z3B+EM0J
         HT+5NBk9LF1ZJ9cABhtnruQtS05JJ7C5tj6Zsrt9l6L+wfExL9MMrancvqfIts8lMlM5
         qaWkZXVvRfDuF8ey18Ilykjjw5RmKBPdgPukRyo7zVisrkbkFPwm8dfKYt2vwgat9zxw
         L7DCLImoEtStM7JJ6mAH+kngs/03N5kmFb9WpNc36jc3ju7hE4AHn3Q3QP3ytHFbOCQq
         V1Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795708649; x=1796313449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y6L4WI3l3y6EKkCBdb+Q/hnuzyHnQuZbp5Sliq/f6MU=;
        b=lOy/Jjf1HESsk5kMlpQQ4KCURYlr/SucUsQB6aPmUOcUbut04z/PVYaqWF6nDnzx3w
         TK2v75Cj+hXx6XhWjt6Ti97WhXa/mj6CVURDkM0qgOij/+9Oo/2/5vqtnnJKiVjugpld
         tulUdZBHoSSL0cHjQ9QgCfMTW373Ldn/JvE7wKE4TDVp5bVjaO/hF51a5qq0VF0JYylI
         0QgsIBMPMLXiAKgdvlzy7ff576MOppzEMnQiU6ZJswjiDXBG4nvj3R5bGYs6kwbPMx87
         57CCXnPleluy3z3KUfAygYQl9ANz017iclhs0E2ZsGATGYnIpq1FgXmhuKz5RX5XsSgD
         XINw==
X-Forwarded-Encrypted: i=1; AL+hErGGggNNh9gTeQYs5seeCcNNa26LknNkMWudtd1vA+wt1XevqWRBYnq9Ggxz9OxglVA/hsqS94gfDzaQn2g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8X3CTGNIaGngFY1ZHKeiRWAMedMoqJ2TVl2CGOQcq8YsN2O4o
	oHPC7x/+REuVqBggOh1yjOjcrE860lrOp6Ey5BigcLYmz3mI6cJ33gs=
X-Gm-Gg: AZFdTZdRP8QStgwJ+GoU/bENwK5+rdKGICUVE7QbEC/ieJvpOBA0Qn5BAZhdOb+qqRb
	zB3pWcBbP9CGULJi0QXOWNCL53jb3tQs475A4R+MXSFcEK3NLZ7djfy+xOtL0IxX8gX4hQp2Xxb
	RdEfIu7CGeKHHVhm6sLpSkl0WNvYfnjOyCXtkIEbUtF4ng3JynOejjZwSQxLN+qiSXve7DyZz0f
	c2z/qcR6O9DjmWPUXikSYFqnephh5zZkfPDKcAvsGP1rBYg+xeoH2iOPHfJn1MPjZiYyxNjHtns
	eNTUZ++vIuZqL29U9XIBrQU/v/gqnzYEM5Pzyq834OjwEGAmt5RZulFOCr4vMnqGJ+a3RmYn0xc
	Pi1B7L7QhktayzC6VIkZZAZJelbR3yJQqFFc1aUZ06foetYlJ02LPuec8gr4olYRSS+67Q1ZhmM
	C/gtjKk6X5uRrtT6sfZyQrsQf6Tboz/ENGOdr+zHDkVcRbKz3MwCLgCnFYonKtjaySLueOSD0BC
	59PKENPj4RqC+J0bDHYqTwJokyaU0sOn1Lo5MUooWyhwKlPZBhCSlEMUxSKbWakBVXzKWVma6Xc
	8GwSznlH2tuoZEdYZ98kgd7r8wSSLBL35XeMdi9d+0Fzn4d7b6fGobRh6n/bSpKliIw=
X-Received: by 2002:a05:7301:1601:b0:386:c990:c5a with SMTP id 5a478bee46e88-386c9900e99mr6979601eec.40.1795708648478;
        Thu, 26 Nov 2026 07:57:28 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:a06e:23f:85ed:4cfe])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm67017063eec.12.2026.11.26.07.57.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 07:57:28 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] coresight: tpda: Fix fwnode reference leak on probe failure
Date: Thu, 26 Nov 2026 23:57:22 +0800
Message-ID: <20261126-coresight-v2-e1077abdea61@gmail.com>
X-Mailer: git-send-email 2.50.1
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

tpda_probe() gets the platform data before allocating driver data,
mapping the registers, reserving a trace ID and allocating a device
name. Failure at any of these steps leaves the destination fwnodes of
the output connections referenced because the core has yet to take
ownership of the platform data.

Allocate the name before reserving the trace ID, then get the platform
data immediately before registration. Return the ID if either the
platform data lookup or registration fails.

Codex helped check trace ID ownership and draft the probe changes.

Fixes: 5b7916625c01 ("Coresight: Add TPDA link driver")
Suggested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
v2: Add the TPDA fix identified during review of the TPDM patch.

v1: https://lore.kernel.org/all/rc-b1-20261110-vc-178-2d9055f946c8@gmail.com/
Review: https://lore.kernel.org/all/e06bd559-c8c5-4e82-8951-9f7894cfb378@linaro.org/

Compile-tested: arm64, GCC 14.2.0, W=1, coresight-tpda.o.
The baseline and patched objects built without warnings.
No hardware or runtime tests were performed.

 drivers/hwtracing/coresight/coresight-tpda.c | 29 +++++++++++++-------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index 63a97931246302f74c0d2fb5e70f43d31f0475b9..62e15fc9b6ec9ad7801257ff706778abd2487fa3 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -566,11 +566,6 @@ static int tpda_probe(struct amba_device *adev, const struct amba_id *id)
 	struct coresight_desc desc = { 0 };
 	void __iomem *base;
 
-	pdata = coresight_get_platform_data(dev);
-	if (IS_ERR(pdata))
-		return PTR_ERR(pdata);
-	adev->dev.platform_data = pdata;
-
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
 	if (!drvdata)
 		return -ENOMEM;
@@ -585,13 +580,21 @@ static int tpda_probe(struct amba_device *adev, const struct amba_id *id)
 
 	spin_lock_init(&drvdata->spinlock);
 
+	desc.name = coresight_alloc_device_name("tpda", dev);
+	if (!desc.name)
+		return -ENOMEM;
+
 	ret = tpda_init_default_data(drvdata);
 	if (ret)
 		return ret;
 
-	desc.name = coresight_alloc_device_name("tpda", dev);
-	if (!desc.name)
-		return -ENOMEM;
+	pdata = coresight_get_platform_data(dev);
+	if (IS_ERR(pdata)) {
+		ret = PTR_ERR(pdata);
+		goto err_put_id;
+	}
+	adev->dev.platform_data = pdata;
+
 	desc.type = CORESIGHT_DEV_TYPE_LINK;
 	desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_MERG;
 	desc.ops = &tpda_cs_ops;
@@ -600,13 +603,19 @@ static int tpda_probe(struct amba_device *adev, const struct amba_id *id)
 	desc.groups = tpda_attr_grps;
 	desc.access = CSDEV_ACCESS_IOMEM(base);
 	drvdata->csdev = coresight_register(&desc);
-	if (IS_ERR(drvdata->csdev))
-		return PTR_ERR(drvdata->csdev);
+	if (IS_ERR(drvdata->csdev)) {
+		ret = PTR_ERR(drvdata->csdev);
+		goto err_put_id;
+	}
 
 	pm_runtime_put(&adev->dev);
 
 	dev_dbg(drvdata->dev, "TPDA initialized\n");
 	return 0;
+
+err_put_id:
+	coresight_trace_id_put_system_id(drvdata->atid);
+	return ret;
 }
 
 static void tpda_remove(struct amba_device *adev)

base-commit: b7d7462c7f973b65de511db6bebb99fb29946ed8
