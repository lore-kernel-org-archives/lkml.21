Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795194894;
	b=U7+hEz3kCoLQAsY5PRQ67Hyt44s5Tkk+uN2HKzyXv54DehS6FBuJbEw3MTt0sPh2gOMt
	 J2XeToXGsJBI1N473xkJHiSy4ef2X0z/8tw52imONKZ4mdbojm+0vnDf3w9HOSQ6LK/jC
	 MV2PhIwusxHPb6AesODl53ysVcNmtsjcsirFSB/FUOXZDyZ2sXPl69yLiIcVmZWhVGnlq
	 ihYQWEeW7azapHaR+CPl3KqEPqhmJ6BMfdlGCxXCLgZh4EgIewh4OoPyy8g+6qr8aoSjz
	 QNfQO0pw0vRmN9GVAqhlE/KWVrKWizbEwyG9yQtHb0IeTozhs6s5MOr1EekqNhygqSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194894;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=tsrfPaiUvmaPVI0gbwAGOP3vX19jWDCKtrGqrFFIigM=;
	b=ftJFL03LOe9d8QYybUos8Io4ftfT9rDb+znjKGiaxu8egKakS12USJKFLa8fSHrQzHfz
	 L2dPd9aZ8mlznNBYLs08gJErHZc/hLYBySjFZwyr1QXtI2PD38uGciMWjihKvxSCHpNQ+
	 Uousr8ThFy+qyhzSDh3W5W4fbPqhS30Z8qiNUdQvuhlvJPL70EBAtLonWOj26sbk3Jj4x
	 QLwGh1pK4s7+oUBqlIn9HkJEoWD+71LbO2YYtqhy7RaNj/lDs3BcIt5ney5H4GqnLVv4y
	 o2Wucj9byO8BBfcenbwD07mf1Bqz/RrG3nz34gVbm1TLsN4m25wkCXqagkyNuItL6ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=jFKLoJ6R;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1997460A260B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:14:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1997460A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=jFKLoJ6R
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5E6D5C62225;
	Fri, 20 Nov 2026 17:14:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 97B67601B9;
	Fri, 20 Nov 2026 17:14:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DF85711BC04A2;
	Fri, 20 Nov 2026 18:14:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795194887; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tsrfPaiUvmaPVI0gbwAGOP3vX19jWDCKtrGqrFFIigM=;
	b=jFKLoJ6RE/FYxMxZAW0WTZ1joLtkA/hP6h3yobZOfG6YWFX9ThxuS+uRRXENQEDSgBAqiw
	tI+bZ+tPYg+hYa59hOjnQRf6hBtXlL/y+A1eKddx8WLxw5/yejun1lb8fQ6c2FDUcAaUmo
	hZk77U/R3nJ+l6Cz6ijvnACGJiBjHEPtvqddHXPe6V4wkAyp/zP7Gj742uyq9CYl1h0sSP
	fbv/aa0OljEhjAAAIwso42ebpqrGxEYNaN3ho404f5s09smKsh//K/GMFKPUERzsSREr9a
	Owcd0vmual8JjD0SkIRLr5sv7wb1aBug09jgPsWXAKksE3VGF5t3xWhPtDy7ow==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 20 Nov 2026 18:14:31 +0100
Subject: [PATCH v4 05/11] spi: spi-mem: Take the controller DQS support
 into account
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
Message-Id: <20261120-winbond-nand-next-phy-tuning-v4-5-8c21e1f71f41@bootlin.com>
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

Require the controller to advertise DQS support through the new
mem_caps.dqs capability. A controller that cannot use the strobe would
otherwise leave the memory driving a signal that is ignored, which costs
power and EMC pollution.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-mem.c       | 8 ++++++--
 include/linux/spi/spi-mem.h | 2 ++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index f2e1ecd49fd6..c07156e22ccd 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -571,11 +571,15 @@ EXPORT_SYMBOL_GPL(spi_mem_set_dqs_pin_available);
  * @mem: the SPI memory
  *
  * Return: a boolean indicating whether the DQS signal is usable or not. DQS is
- * usable when the memory supports it and the line is wired.
+ * usable when the memory supports it, the line is wired and the controller is
+ * capable of using it.
  */
 bool spi_mem_dqs_is_usable(struct spi_mem *mem)
 {
-	return mem->dqs_pin && mem->dqs_wired;
+	struct spi_controller *ctlr = mem->spi->controller;
+
+	return mem->dqs_pin && mem->dqs_wired &&
+	       spi_mem_controller_is_capable(ctlr, dqs);
 }
 EXPORT_SYMBOL_GPL(spi_mem_dqs_is_usable);
 
diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index 73fab3b004b5..ad438816eebb 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -405,6 +405,7 @@ struct spi_controller_mem_ops {
  *                   is a pause in the transfer (eg. internal bus contention or
  *                   DMA arbitration on an interconnect). Features such as NAND
  *                   continuous reads shall not be leveraged.
+ * @dqs: The controller can use the DQS signal provided by the memory
  */
 struct spi_controller_mem_caps {
 	bool dtr;
@@ -413,6 +414,7 @@ struct spi_controller_mem_caps {
 	bool per_op_freq;
 	bool secondary_op_tmpl;
 	bool no_cs_assertion;
+	bool dqs;
 };
 
 #define spi_mem_controller_is_capable(ctlr, cap)	\

-- 
2.56.0

