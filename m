Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795720301;
	b=yRg40+nmSPUdFLjnUjQ/UVSEs6EqdNA3PcI/Txar5TLMVe9F2wmuKDR44dg5eXb/jJI7
	 H7S0lTHR3yvhHrIuWqcL1CnO9kwhBbJHUD0V7KhDvsdF23t6GqLHvqMeA8N/5tq/9TBGT
	 kXpYdCGl/atUrqFwZeRTkHn+nAWmzCjqGVTPmCqJ/KqfNgO1zBD0axUJI3MytJtpF05a5
	 Nlzt0W7+e5H3gIi1InZDFZ7+KOWcDsyulR9t3w5TlfZlZNgZZ+LXsIc3drSoE4ToWv35y
	 8wsVlVD8stapJry/rIOKYPH0lqKaTHAFtY3j9Pn2jBOhMM4i2unABxH7iJJzujCXjRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795720301;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=lbbDUAZ42bjaI/Zz1oo3546qmyA1evX9LxfwdDvdb8c=;
	b=kphiB7owwpX/2rTfc2Cg/GzvQu7rzoidy74EqOQUa0Ilrylf8VeTFYQvj8YXLOYQQdFY
	 jJt2nIkX1dbd4z74Yp+U/tVXYE1u+xysUx2NWJheLOiu1VziBDOIA3HiS3f64GWlctul9
	 d7OeqwAMDSSD8freN036Dw44uQ2wspcsaU79VK+AbpjuC4m1FaUKO1065L93zYnvu99yo
	 UjkLfabi902WuaTnEJnrfvqoKvxJRfWrlJHS5i9cutSIbCvcZG3w9s/AeWlpoun4tLUp6
	 O7dYpjRcuAv/HZo1mq3IbfMcCUWkAWnna6ny5B0AIuLkUbcp44vwMX/XUIAdw7FULdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=PuLVR2do;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA64606A327
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:11:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAA64606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=PuLVR2do
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A5D141A1824;
	Thu, 26 Nov 2026 19:11:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7B7B660558;
	Thu, 26 Nov 2026 19:11:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C4FE511E691C1;
	Thu, 26 Nov 2026 20:11:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795720298; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lbbDUAZ42bjaI/Zz1oo3546qmyA1evX9LxfwdDvdb8c=;
	b=PuLVR2dojQC8Tq1JLBpLi7shyMSTTwy7V22OSKh2rrJy8a6p8JGau53CW5xapcL+Y45SLa
	bzRk6nIFSaYnHtXUUpfbozomnKODW7SnDWsLM+EIZVpILyRxUn6gDy5a0aKj2VRJ4BtxTu
	mPa/nee7hIJN5vJ3XMSXxcm5rlCaMGwwjpN9ts2qavWOL7e5w2LmBGGFyLZGNIizCqYFss
	HuC9Mo9CGOsispB0hM+a9f4uNrNP7WCh1PwAVhGMNHvQe1iHfR7Rizp/tkr2Fo9uZecyel
	jdvbfltEv45ZDYtxKWKeBg0oQMVu/s6BSo3qEwBB3GACic8Ok0iHIy8gqU9Rjg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 26 Nov 2026 20:10:30 +0100
Subject: [PATCH 11/12] spi: ti-qspi: Validate the dummy buswidth
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
Message-Id: <20261126-macronix-upstreaming-spi-driver-fixes-v1-11-ca8e924cca1b@bootlin.com>
References: <20261126-macronix-upstreaming-spi-driver-fixes-v1-0-ca8e924cca1b@bootlin.com>
In-Reply-To: <20261126-macronix-upstreaming-spi-driver-fixes-v1-0-ca8e924cca1b@bootlin.com>
To: Raju Rangoju <Raju.Rangoju@amd.com>, 
 Krishnamoorthi M <krishnamoorthi.m@amd.com>, 
 Mark Brown <broonie@kernel.org>, CL Wang <cl634@andestech.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Yang Shen <shenyang39@huawei.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Cheng Ming Lin <linchengming884@gmail.com>, 
 Alvin Zhou <alvinzhou@mxic.com.tw>, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The driver has no separate dummy buswidth; the dummy phase is clocked
with the data buswidth. Reject operations asking for a different dummy
buswidth.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-ti-qspi.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/spi/spi-ti-qspi.c b/drivers/spi/spi-ti-qspi.c
index 091a8b8842f5..5aa6176a3123 100644
--- a/drivers/spi/spi-ti-qspi.c
+++ b/drivers/spi/spi-ti-qspi.c
@@ -651,7 +651,20 @@ static int ti_qspi_exec_mem_op(struct spi_mem *mem,
 	return ret;
 }
 
+static bool ti_qspi_supports_op(struct spi_mem *mem,
+				const struct spi_mem_op *op)
+{
+	if (!spi_mem_default_supports_op(mem, op))
+		return false;
+
+	if (op->dummy.nbytes && op->dummy.buswidth != op->data.buswidth)
+		return false;
+
+	return true;
+}
+
 static const struct spi_controller_mem_ops ti_qspi_mem_ops = {
+	.supports_op = ti_qspi_supports_op,
 	.exec_op = ti_qspi_exec_mem_op,
 	.adjust_op_size = ti_qspi_adjust_op_size,
 };

-- 
2.56.0

