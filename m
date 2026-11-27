Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795793326;
	b=5XRCJNNZfknIzJTuX9nm3vE+wc5XNn2e2/v6ztdcohIal22fRDkIlt5etyWL2xsLVWEV
	 an2gKbvBTu3/4KuDkzdIC4vqvzWNUTJKN4y3ZLx7Dx+v12tfjihyIJZhSF6HMOtaMvXOU
	 AXwqVVYEJ8ZjGa0bat0CmKnP/7y8lLAszXcVqJBqRwFqwAPXwXbW7c5DJbc843jEi49c9
	 U6Fumw/STXzXBJ3M55dc6z2UbccbV8u+iTHPdWBqnjEb/iiNEvN1aO9EG+fJVnv1uZ800
	 w1Zz0wsE5X/ka7zITmKml249u5GeLTfxASTgG8tL/pHfflZsGa35rUr5xXdKhdK9AWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795793326;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=n5QOWqz98WETddy/xPJM95XLYHo5x8BVA/7Mf5x39YM=;
	b=Wqcq03E3fJQdD0rxnH4lNrgfYP4qxZzT/Zj15Np/0ZseXOgF/SySFq87/52hp1nSS44O
	 eG12U2+34dVDxZ8R6iGBpH0vTl0O6yLUpmuDaWNrsfj+24Nlr2TmOPKcyuTrTM83ynNMP
	 LwIHCYPHMHPm942EcmN7NK4lPrXL4xe1bE5xnToOKebg5UhxmgEQiRQzc/GLBofVZzkXJ
	 o21AZTKzSibqo4qIkk2zHY2zifwPndEYbm6lF038FjpluIFNG4zNyy7oR4x8g06sTFCFi
	 pcXwym8IeA4SIXHIx5Bv43k0gPrBWqm5hxWgaT89MIo3+o7Y9RUyfXlEE9UzyqN7/fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=mtNWrcVf;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 243FE606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 243FE606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=mtNWrcVf
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E97B1758;
	Fri, 27 Nov 2026 07:28:42 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD86D3F86F;
	Fri, 27 Nov 2026 07:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795793325; bh=JglaiMYxV68JeQA8tVJeZqG7XSW3ZxuoF4A2M/ZC180=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mtNWrcVfbF7devqgzq1H1I9Sg0XmLAl9d0EeXYvgfP+Mq88HkBvuDBjGCkkthvU03
	 6MhybUn/hp4pvM1kvoq32vYawL9ZuUm3l4ej9iHiPlC79ZhRitzbSdLdMXluALs2Qk
	 QMrWneemFkpnfhtDN976W9rLxyYDrwtKnnLjY7aY=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Fri, 27 Nov 2026 15:28:31 +0000
Subject: [PATCH RFC v2 1/6] firmware: arm-smccc: introduce match function
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-firme_interface-v2-1-ab88b2d0b4e0@arm.com>
References: <20261127-firme_interface-v2-0-ab88b2d0b4e0@arm.com>
In-Reply-To: <20261127-firme_interface-v2-0-ab88b2d0b4e0@arm.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki Poulose <suzuki.poulose@arm.com>, 
 Steven Price <steven.price@arm.com>, Sami Mujawar <sami.mujawar@arm.com>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Jiri Pirko <jiri@resnulli.us>, 
 GONG Ruiqi <gongruiqi1@huawei.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Mark Brown <broonie@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5014; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=JglaiMYxV68JeQA8tVJeZqG7XSW3ZxuoF4A2M/ZC180=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBrCaGnfaJzKSUVnbH1nkN2rxh2Z6kBBDuIxhuD6
 tiPsuJAsvmJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCawmhpwAKCRBt1cPRWsUx
 M4XrC/4mKpWhvvxt4VAeRDVGgpwNgfWIomTya92cHMv+N8rZMjqkND1I71EAfVQAPVSJGI35ukD
 5G0CIHbG5s0LJgVf9eVrDm/0UZ9rM/z3xWnbVKeese7f0u3xfSdxHjhtko4VkrUaZezKigQyg/V
 RAqnz0gVlFatTQpdxiP7+kHJ4zrr9ThqXNHXzRl/mtaXIq8Oibsghk+dP1mys4IjacTAygLVmb/
 DQW2KLLbKLFiddPiFWmFHIiQTqWqmC9KbP0Lx8EGr+oyj07wobBzHo4KFpKWW2uDFoQywLb88I9
 inq6BNqWW8TCnOfPpLV6AfQu1c+Ey2iu0GoZeVHTBPk7ZSloFpvovQVCxPGYCbIaYncFnOUI1qm
 jQhWzH1e0SG6ycanvkjUYLpxUPj4xdhWbifNV3TceqwhJ17Rq6Y8vZLxWW8D/pBO3vNeEOn2QLr
 ML6U4M+ysTECiVPnl7hZDs8XGpjrILiURfDXx2ZmAhJTwZHMFfXn+iG3dHkp7rlTo6F3A=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133

Somce of protocol based on the smc is not enough to match smccc-device
and smccc-driver with func_id only.

For example, firme interface will create smccc-device per service
and this requires to chech whether firme smccc-device is for each
service.

To resolve this, add match function and match parameter for device
which is set at the time of smccc-device creation so that smccc-driver
could match proper smccc-device with match parameter and driver specific
match function.

This match parameter is defined under smc func-id. IOW, devices which
share the func-id should have the same type for module parameter so
that each driver under the same func-id can check extra one with
match parameter type.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/firmware/smccc/bus.c   | 24 ++++++++++++++++--------
 drivers/firmware/smccc/smccc.c |  3 ++-
 include/linux/arm-smccc-bus.h  |  5 ++++-
 3 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/firmware/smccc/bus.c b/drivers/firmware/smccc/bus.c
index 0357a7c48af0b..4a1182153bef8 100644
--- a/drivers/firmware/smccc/bus.c
+++ b/drivers/firmware/smccc/bus.c
@@ -11,15 +11,20 @@ static int arm_smccc_bus_match(struct device *dev,
 {
 	const struct arm_smccc_device_id *id_table;
 	const struct arm_smccc_device *smccc_dev = to_arm_smccc_device(dev);
+	const struct arm_smccc_driver *smccc_drv = to_arm_smccc_driver(drv);
 
-	id_table = to_arm_smccc_driver(drv)->id_table;
+	id_table = smccc_drv->id_table;
 	if (!id_table)
 		return 0;
 
-	while (id_table->func_id) {
-		if (smccc_dev->func_id == id_table->func_id)
-			return 1;
-		id_table++;
+	for (; id_table->func_id; id_table++) {
+		if (smccc_dev->func_id != id_table->func_id)
+			continue;
+		if (!!smccc_dev->match_params != !!smccc_drv->match)
+			continue;
+		if (smccc_drv->match && !smccc_drv->match(smccc_dev))
+			continue;
+		return 1;
 	}
 
 	return 0;
@@ -103,7 +108,7 @@ static void arm_smccc_release_device(struct device *dev)
 	kfree(smccc_dev);
 }
 
-static struct device *arm_smccc_device_alloc(u32 func_id)
+static struct device *arm_smccc_device_alloc(u32 func_id, void *match_params)
 {
 	struct arm_smccc_device *smccc_dev;
 
@@ -112,6 +117,7 @@ static struct device *arm_smccc_device_alloc(u32 func_id)
 		return NULL;
 
 	smccc_dev->func_id = func_id;
+	smccc_dev->match_params = match_params;
 	smccc_dev->dev.bus = &arm_smccc_bus_type;
 	smccc_dev->dev.release = arm_smccc_release_device;
 	device_initialize(&smccc_dev->dev);
@@ -119,14 +125,16 @@ static struct device *arm_smccc_device_alloc(u32 func_id)
 	return &smccc_dev->dev;
 }
 
-struct arm_smccc_device *arm_smccc_device_register(const char *name, u32 func_id)
+struct arm_smccc_device *arm_smccc_device_register(const char *name, u32 func_id,
+						   void *match_params)
 {
 	int ret;
 
 	if (!name)
 		return ERR_PTR(-EINVAL);
 
-	struct device *dev __free(put_device) = arm_smccc_device_alloc(func_id);
+	struct device *dev __free(put_device) = arm_smccc_device_alloc(func_id,
+								       match_params);
 	if (!dev)
 		return ERR_PTR(-ENOMEM);
 
diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smccc.c
index 5dc768ac4143a..93658120114d3 100644
--- a/drivers/firmware/smccc/smccc.c
+++ b/drivers/firmware/smccc/smccc.c
@@ -136,7 +136,8 @@ static int __init smccc_devices_init(void)
 		if (!smccc_probe_smccc_device(smccc_dev))
 			continue;
 
-		sdev = arm_smccc_device_register(smccc_dev->device_name, smccc_dev->func_id);
+		sdev = arm_smccc_device_register(smccc_dev->device_name,
+						 smccc_dev->func_id, NULL);
 		if (IS_ERR(sdev))
 			pr_err("%s: could not register device: %pe\n",
 			       smccc_dev->device_name, sdev);
diff --git a/include/linux/arm-smccc-bus.h b/include/linux/arm-smccc-bus.h
index 05c0c850510e0..b7b44c9b67ec3 100644
--- a/include/linux/arm-smccc-bus.h
+++ b/include/linux/arm-smccc-bus.h
@@ -12,6 +12,7 @@
 struct arm_smccc_device {
 	struct device dev;
 	u32 func_id;
+	void *match_params;
 };
 
 #define to_arm_smccc_device(d) container_of_const(d, struct arm_smccc_device, dev)
@@ -22,6 +23,7 @@ struct arm_smccc_driver {
 	const char *name;
 	int (*probe)(struct arm_smccc_device *sdev);
 	void (*remove)(struct arm_smccc_device *sdev);
+	bool (*match)(const struct arm_smccc_device *sdev);
 	const struct arm_smccc_device_id *id_table;
 };
 
@@ -31,7 +33,8 @@ struct arm_smccc_driver {
 int arm_smccc_driver_register(struct arm_smccc_driver *driver,
 		struct module *owner, const char *mod_name);
 void arm_smccc_driver_unregister(struct arm_smccc_driver *driver);
-struct arm_smccc_device *arm_smccc_device_register(const char *name, u32 func_id);
+struct arm_smccc_device *arm_smccc_device_register(const char *name, u32 func_id,
+						   void *match_param);
 void arm_smccc_device_unregister(struct arm_smccc_device *smcc_dev);
 
 #define arm_smccc_register(driver) \

-- 
2.43.0

