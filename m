Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795720291;
	b=GzE8wIgngML92gyuo4/mJ5RkxOZrbdfk53BA1l63wy8YNbU62r6xMnzZpBAs9/f9z2GI
	 7gG3sTAPrr+rwGDgCbIh2dsY/6cKNnFsqm80E0W/GJ9dSeu0kryoJFApYAt1A7Oh0y9ji
	 P053yptRc4NOHUvpchlazJ49yCY/OZWwNTWKS5oNSScE6r+cpA+q+DgiOzloQ/mR/ZA8N
	 wNHFLm83ftm98NGTmRCh8DPHtBSH/I47IMw5ODqgI6nZ2cNDlGJM2qRVA/wmoKr5KWBd0
	 simWJ7fXZxkpX1vowEMHMYeT397H/hsDN1/J0jCfgArG9SmQTcrTIhDN63WtSmsB5jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795720291;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=TPR+DZlMD4hxbZpkOAhfp+MwyLCmcxCGdbeUjUjw3fY=;
	b=lNvtOB0qJu9wxsHP6gW7yyZASH135BLe3eAN5ir4aI3K4wEgH4pLM4uhkL+zrFzl0S82
	 QHbok7DfB7PDWqW28TCdbyeDszpFRfAT8wwBo+qHLiRt9uIAb4bFexRYtmGYtCbbR58g9
	 BcKUl/OnC3d0bVYe4BeoViwpkEmLJYlsX/zhSsr3QpONvVKgK8WewSVynh1vIk+2xESXB
	 fJY2dSmdWr+L7yG12HtCVetuDIiH6OxrkR0mmzhccZJOZBvrKX6L5uWcwKaWe8EkNRDfv
	 sNQlgikYOjUKNsD+ajMWuop+Bir9sGWbqXx4WlxJWYy4IDWWCzIJejmG9BWAt8dnW+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=KoIYnHrO;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116D5606A332
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:11:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 116D5606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=KoIYnHrO
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E8ADD1A181F;
	Thu, 26 Nov 2026 19:11:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BDCA660558;
	Thu, 26 Nov 2026 19:11:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B106511E691C5;
	Thu, 26 Nov 2026 20:11:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795720288; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TPR+DZlMD4hxbZpkOAhfp+MwyLCmcxCGdbeUjUjw3fY=;
	b=KoIYnHrOnvQ3lZIX7rVhynwZ5ZuUMK2chDuIAAoYmJtEO32n6kqAivWW1t8acn9r/LOWo7
	wZJtWS1LfhgCb8xI+xsmjnctJUOSYICCUbXlFeYNdWNZ6ZyjJbZTQtBTL2llaI4XDk2D5T
	yZ1T4G7/tODk6LGLBz4sZT21Dggsd8+nYCygtxh0ozufJ0wICXTuMBbsluFbZP2XN69A9T
	bHq0mgIxYGUJW2a86O4aJDGZHff8Fg+SzD2M1iWtjnAWvBSem3YqLaSy/ljiyvq/rUCFzk
	q2L+z+K53Ue0I2fzygGBpj6PunhGVrJEDhYslJpPBtXUcHrNCdaaG72abOOFig==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 26 Nov 2026 20:10:27 +0100
Subject: [PATCH 08/12] spi: hisi-sfc-v3xx: Validate the dummy buswidth
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
Message-Id: <20261126-macronix-upstreaming-spi-driver-fixes-v1-8-ca8e924cca1b@bootlin.com>
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

The driver selects its bus mode from the command, address and data
widths; the dummy phase is clocked with the address buswidth. Reject
operations asking for a different dummy buswidth.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-hisi-sfc-v3xx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/spi/spi-hisi-sfc-v3xx.c b/drivers/spi/spi-hisi-sfc-v3xx.c
index 0790c7179868..5bf0f4f68e4c 100644
--- a/drivers/spi/spi-hisi-sfc-v3xx.c
+++ b/drivers/spi/spi-hisi-sfc-v3xx.c
@@ -182,6 +182,9 @@ static bool hisi_sfc_v3xx_supports_op(struct spi_mem *mem,
 	if (op->addr.nbytes != host->address_mode && op->addr.nbytes)
 		return false;
 
+	if (op->dummy.nbytes && op->dummy.buswidth != op->addr.buswidth)
+		return false;
+
 	return spi_mem_default_supports_op(mem, op);
 }
 

-- 
2.56.0

