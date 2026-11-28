Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795859287;
	b=sBoSsOTcOkqIdolO7ax+K45MkLZXhhL7x+YSqEa5SG6xC6zWUiQhWNWhjAsI2IkX8kXh
	 Wl9RxlLabeZRW2T1SwRNuloq9q9J69WEGhQ7fnFT6iqVVqtOtmZWVkgOBM6nWRSv9yz1W
	 +Cc0GhnQkHKRgqY5I6a4zID41aCXdZYfL//zvk+Ggmcruhyl6YLxeR5as4XxIc69jHLoi
	 BE87jTFLf60frKVVjvnlGCfjtqqCBNexDRI/v4eAix2orGaGrY8q7I95LXeggtflcoL/R
	 EG2fy5pLWl1YKxGQCOaVgf8P7q9XsAa5F/jzZkW1orMnJYo0uXvsXixDHfBsVonBDJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795859287;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=A6lwpGgzwvCeFJDP70YLU2vCok5Bu0SL9HPAQj+3Xw8=;
	b=gVOEJgNWYDjyWpVIP279iDskQ7qle0VAUSuhqCBmm9sm9r9RIoLbaRvctYHS2X/6P1E5
	 z0gBymQyqn+1Cgbe9P4iyvsSVlQ8hKt8Nc28OfGRmMuUphr8YppfU7aTPMtQKSJe/dyk+
	 FJwlkkra0+oB/X9sAjU6/cPlnHHpvv60FpyShlmI6xiptcz5UXp0zWJ7fP4X0i2MgtIkc
	 mjzON7gg8cS43CXvS0lREYC0qIumPp3B8gFzPIv0nlJD/j9dcgGNjIt47ErSNxNyF8v70
	 xkPnYyDicpUEp+kEc3K6TNc61Ucrr0uVX8n6j3x/PHD6l/6NbekiDlLRgvunYGG9cLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=QNE6Ovwk;
	arc=none smtp.remote-ip=45.254.49.197
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E74606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 09:48:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13E74606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=QNE6Ovwk
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5655b08ae;
	Sat, 28 Nov 2026 17:48:03 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: arnd@arndb.de,
	gregkh@linuxfoundation.org,
	mchehab+huawei@kernel.org,
	mayulong1@huawei.com
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] misc: hi6421v600-irq: Release IRQ mappings and domain on teardown
Date: Sat, 28 Nov 2026 17:48:03 +0800
Message-ID: <20261128-f81b700d6c-u37-0@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
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
X-HM-Tid: 0aa2218dffa103a1kunm01b2ca9d4522a6
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCH01KVh1CQ08aHhpIHxgeHVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=QNE6Ovwkz9kDN4k5QKEGbrDixy8/1b/yQCHNIr9SfVaHIyrYQfqZTyWiAUKHbXDnYMZChjKpyCD1SYzNUWhnLumx+y/SxIFYX3j48/1Kgkp6KDcxK47mRjGEwyhXVytXu3bRkd/QivNqZ99dOUFYl2ih7QHL1/QJbvL5EMu72BY=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=A6lwpGgzwvCeFJDP70YLU2vCok5Bu0SL9HPAQj+3Xw8=;
	h=date:mime-version:subject:message-id:from;

A mapping or IRQ request failure leaves the domain and earlier mappings
registered. They also outlive the PMIC interrupt data on removal. Add
a managed cleanup before creating the first mapping, so the parent
handler is freed before the mappings are disposed of.

This issue was found by our static analysis tool under development.

Fixes: 4524ac56cdca ("staging: mfd: add a PMIC driver for HiSilicon 6421 SPMI version")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/misc/hi6421v600-irq.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/misc/hi6421v600-irq.c b/drivers/misc/hi6421v600-irq.c
index 7d2eb7ed7698..5b9d08b057f9 100644
--- a/drivers/misc/hi6421v600-irq.c
+++ b/drivers/misc/hi6421v600-irq.c
@@ -211,6 +211,16 @@ static void hi6421v600_irq_init(struct hi6421v600_irq *priv)
 	}
 }
 
+static void hi6421v600_irq_domain_remove(void *data)
+{
+	struct hi6421v600_irq *priv = data;
+	int i;
+
+	for (i = 0; i < PMIC_IRQ_LIST_MAX; i++)
+		irq_dispose_mapping(priv->irqs[i]);
+	irq_domain_remove(priv->domain);
+}
+
 static int hi6421v600_irq_probe(struct platform_device *pdev)
 {
 	struct device *pmic_dev = pdev->dev.parent;
@@ -260,6 +270,10 @@ static int hi6421v600_irq_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	ret = devm_add_action_or_reset(dev, hi6421v600_irq_domain_remove, priv);
+	if (ret)
+		return ret;
+
 	for (i = 0; i < PMIC_IRQ_LIST_MAX; i++) {
 		virq = irq_create_mapping(priv->domain, i);
 		if (!virq) {

base-commit: 86266f137b5c18d477a2df8168149203852b037d
-- 
2.43.0

