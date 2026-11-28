Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795858887;
	b=qtW9SlRitBcKiscHY6/CVGVeL2xdSo5IzliIzIovMWbm41nH6O+kuaVNyOMlMd2BIL4V
	 iL2Q1ak8by5gEGm8KFDfbUAgByYhWdXVmSB4T2IvV5ng+II89LdnGz66xYW64nT2rMUzJ
	 z75di2u+Xs8CoV3uwcm5X9dZtiIUi/r+HPlYeBxBDXqtSgPUgAQO7zRj4Y76jq1+NOZhV
	 11G66vMeG1hLOEPI+OsC6fkYYvTtsR8GEMTLVSBmwwJ5rle3omhEht9Lt1NzNxwutIrAh
	 8L9YQCRZPeFzFzPJaW16mVJq+oUjJDYCD4+lnAzRxCpD6A97WcT5Sx7CpC88i/1HhPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795858887;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=G6zpXeiIeKAE9FMxVV9jmnKUdIaXqsaJlP1REKuSc/w=;
	b=ICLJ4amrx/MDQTikx0vRZuOtSHDumTUsp9091dgr479aI2ciFs7lkjdhku0kQ9K6AEFs
	 3FC1uCA38HS8GtFo1KIY0vRmoZ8PNhI6MsCr9yL7Xm4LjVLyTWES7GVwlPuD7r7DTYsNm
	 2Tv8ok6YwjTTLqj8K1rMjE8Jv1PBTPjm/wFO2vi16lHU6uXI6CvNxwj+ZMjq0o9fPpMZ7
	 RFssipoprQFOr+sQ4w1wB0d8n6Wb+2gUUwEYFwn9G/5rAMl62sx++F3YW2Wfhpqz+kGng
	 H/xRPFcoDslCw0JALVMQ5RhTVm5R72v2sVIbJC0DCPFMsQ6Zh4UKhX+JTWSrhKoqY2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=dobRqtj3;
	arc=none smtp.remote-ip=45.254.49.198
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFC2606A327
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 09:41:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CFC2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=dobRqtj3
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5655b080b;
	Sat, 28 Nov 2026 17:41:22 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: tglx@kernel.org,
	nm@ti.com,
	kristo@kernel.org,
	ssantosh@kernel.org,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	ioana.ciornei@nxp.com,
	alexander.stein@ew.tq-group.com,
	maz@kernel.org,
	lokeshvutla@ti.com,
	yamada.masahiro@socionext.com,
	robh@kernel.org
Cc: radu@rendec.net,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] irqchip/uniphier-aidet: Remove the interrupt domain on unbind
Date: Sat, 28 Nov 2026 17:41:21 +0800
Message-ID: <20261128-f81b700d6c-u38-3@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261128-f81b700d6c-u38-0@mail.sdu.edu.cn>
References: <20261128-f81b700d6c-u38-0@mail.sdu.edu.cn>
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
X-HM-Tid: 0aa22187ddc703a1kunmb49228b5451d55
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDHktMVktOQ0pLHUxDTUJDHVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=dobRqtj3yI8TF/PgsDd/2A2Y3Tp2p270kRrVBmvtPErAQCuyadbBDzlpjOjgYAZpNf32R43wR88fTBNBLePKZqan6UirIpLV5vcRmkFjEfl27NAw/YmDhowH6zVhw1Lp1ywyNamjsvn+5dvRRoe8poL60wyhztxuhB1BnFSHBFE=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=G6zpXeiIeKAE9FMxVV9jmnKUdIaXqsaJlP1REKuSc/w=;
	h=date:mime-version:subject:message-id:from;

The interrupt domain remains registered after device removal frees
its controller data. Remove it before devres releases the register
mapping and private structure.

This issue was found by our static analysis tool under development.

Fixes: 5ed34d3a4387 ("irqchip: Add UniPhier AIDET irqchip driver")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/irqchip/irq-uniphier-aidet.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/irqchip/irq-uniphier-aidet.c b/drivers/irqchip/irq-uniphier-aidet.c
index dca3c6003539..a6cfe75c1989 100644
--- a/drivers/irqchip/irq-uniphier-aidet.c
+++ b/drivers/irqchip/irq-uniphier-aidet.c
@@ -198,6 +198,13 @@ static int uniphier_aidet_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static void uniphier_aidet_remove(struct platform_device *pdev)
+{
+	struct uniphier_aidet_priv *priv = platform_get_drvdata(pdev);
+
+	irq_domain_remove(priv->domain);
+}
+
 static int __maybe_unused uniphier_aidet_suspend(struct device *dev)
 {
 	struct uniphier_aidet_priv *priv = dev_get_drvdata(dev);
@@ -242,6 +249,7 @@ static const struct of_device_id uniphier_aidet_match[] = {
 
 static struct platform_driver uniphier_aidet_driver = {
 	.probe = uniphier_aidet_probe,
+	.remove = uniphier_aidet_remove,
 	.driver = {
 		.name = "uniphier-aidet",
 		.of_match_table = uniphier_aidet_match,

-- 
2.43.0

