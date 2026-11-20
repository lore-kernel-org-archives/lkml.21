Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795194890;
	b=v871lXm6upKRUvygHmQCNGNzh3wOmaGplI5sGU5+EfLuO8rLe4ws3iTWsbDt2lVVE+96
	 Wo+wQdR2HzZFLB2CpPaBUrhMme+ClNXLSjBKBkIbVDITMWcgv3NEkloaecTcl4kvJUwlw
	 YYHppnqjT4uILG8czzAaCy+GmU4gni8C5kik8jC/71bfWYzhTllSBm7FXd8D50vg8yThO
	 VlntoePMWx1qxkKeqXYFpLIyF9XXdyj7hAcOW56XtvaJPoXaFoVeeeSZ+aIj6Ip8o3JTN
	 JyS7KGurlnufr9wVy1iJhO/aQ/z8Ityfka+kHe2QBBsOp22gaDmRBHV09fsV5LgXZQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194890;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=5r1Ij52HuLIX6Cb6AHPmD6axzXsm0u/VJUknky6+iKk=;
	b=zWN7Jxt1Km7M+snsyAcoeRoXo21uuCnSPy4WQmGXZZWmO1z4VHsPWtP10BDso7J2AaHs
	 fIovmqLAymOkM/Ykhxcx3NZoxOlCcQOMmeXckOgxN58zbt7sXNZXbF2xQAYo7zgCOu40v
	 NAz3zEeAlAv364Utu6N1ik7c37Nthhj2bmxUtocFymnGuZWK3juMdHZTSc8UfG50qdMBo
	 kENOneGRUhRriPiK9Gm4IrnbEnszcRMLO5ESoi3J5MDEdGNxjZ/vb6LafPa5LTeluLbVz
	 qpjqXk4ERv+vED/FrUPo/VwO3HhiVHadSUH7YEHR8fGVxzSC8KJ05wy3NUIYN5pbzOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0zvYjGKa;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760D8606A33D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:14:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 760D8606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0zvYjGKa
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2089F1A1757;
	Fri, 20 Nov 2026 17:14:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E1113601B9;
	Fri, 20 Nov 2026 17:14:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 61C0011BC0501;
	Fri, 20 Nov 2026 18:14:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795194884; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5r1Ij52HuLIX6Cb6AHPmD6axzXsm0u/VJUknky6+iKk=;
	b=0zvYjGKa5CbmYs1bWtcLeDDgpPTtqwymd8vDuu7goJfvL/KzFupcsywIGICjDQt5ploRnp
	1dcHj7+ENGnRkxqCAKIzEsq1vg34SkNBG6mpLfArutqThz0NovpmIG3OtCj6GE5paCKQSY
	f7TNFJfpjAJenNCgK2sgv+JJoWn1mf8cAHeNZNxGXQXPD8AwuWqWGU73FCIS3jeK/70mtD
	VFi2VjQn6U6AxCrnIaI2T0/64NMq+yrhikq50H8hrz5x+IiZ3vj5tLr6ehVyJpqYNm7BoC
	1e1nbgbhuFkzYJODu9+B1ytU3hwt7K5rLnnJngTLjWIb0r2yOsi5fjvDCU703g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 20 Nov 2026 18:14:30 +0100
Subject: [PATCH v4 04/11] spi: spi-mem: Take the DQS wiring into account
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
Message-Id: <20261120-winbond-nand-next-phy-tuning-v4-4-8c21e1f71f41@bootlin.com>
References: <20261120-winbond-nand-next-phy-tuning-v4-0-8c21e1f71f41@bootlin.com>
In-Reply-To: <20261120-winbond-nand-next-phy-tuning-v4-0-8c21e1f71f41@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, 
 Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, praneeth@ti.com, 
 u-kumar1@ti.com, p-mantena@ti.com, a-dutta@ti.com, s-k6@ti.com, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The DQS line may not be routed between the memory and the controller.
Parse the spi-dqs-not-wired property when the SPI memory device is
created and only report DQS as available when the memory supports it and
the line is wired.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-mem.c       | 7 +++++--
 include/linux/spi/spi-mem.h | 2 ++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 8c283953b302..f2e1ecd49fd6 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -8,6 +8,7 @@
 #include <linux/dmaengine.h>
 #include <linux/iopoll.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
 #include <linux/spi/spi.h>
 #include <linux/spi/spi-mem.h>
 #include <linux/sched/task_stack.h>
@@ -570,11 +571,11 @@ EXPORT_SYMBOL_GPL(spi_mem_set_dqs_pin_available);
  * @mem: the SPI memory
  *
  * Return: a boolean indicating whether the DQS signal is usable or not. DQS is
- * usable when the memory supports it.
+ * usable when the memory supports it and the line is wired.
  */
 bool spi_mem_dqs_is_usable(struct spi_mem *mem)
 {
-	return mem->dqs_pin;
+	return mem->dqs_pin && mem->dqs_wired;
 }
 EXPORT_SYMBOL_GPL(spi_mem_dqs_is_usable);
 
@@ -1142,6 +1143,8 @@ static int spi_mem_probe(struct spi_device *spi)
 		return -ENOMEM;
 
 	mem->spi = spi;
+	mem->dqs_wired = !device_property_read_bool(&spi->dev,
+						    "spi-dqs-not-wired");
 
 	if (ctlr->mem_ops && ctlr->mem_ops->get_name)
 		mem->name = ctlr->mem_ops->get_name(mem);
diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index 85a61ac62e2c..73fab3b004b5 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -276,6 +276,7 @@ struct spi_mem_dirmap_desc {
  * @drvpriv: spi_mem_driver private data
  * @name: name of the SPI memory device
  * @dqs_pin: the memory provides a DQS pin
+ * @dqs_wired: the DQS line is routed to the controller
  *
  * Extra information that describe the SPI memory device and may be needed by
  * the controller to properly handle this device should be placed here.
@@ -288,6 +289,7 @@ struct spi_mem {
 	void *drvpriv;
 	const char *name;
 	bool dqs_pin;
+	bool dqs_wired;
 };
 
 /**

-- 
2.56.0

