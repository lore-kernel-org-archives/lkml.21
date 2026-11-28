Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795858882;
	b=LbZxzuR1EmlRpYGOdpsDP7yan+6VxF5iA7uladGN8nFMdr5flSsmdTC42J0tbAF3BEAw
	 uVERiqZQOMhga/TWAnWHEs02wBuqJthLtgieSrV5xm1s+GPlq3Dq9WrO2yQgMQcZRjpeV
	 4CK8arsZZqyFYxaB+pqVOxcZdJOVhS4+maCvfaEFisERV7QFHCzFU31f5mQWMva8bH1zV
	 qj8ElKegj8mX8OmqV15vqzZ30Xq++L0kS06X2Pdh73ryk/qazlbli0x4A5B2kdij+FGAt
	 2XZ+tZThre+OBMAV8GKXtK8/m1fNBzsyVB17Cb7kd2JAIc8lyFXDG31HqQCUZ15tkRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795858882;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=CY/rfI4YKWyxTp2uoMTOvs21zzWoKyzt7WP0sTIsZNw=;
	b=XnVmWR0H7p7OfuJWU2w/PHX5ljTgt1EHYDIfWHLQZMo/krPkJm6VQese5b3xKSbdHVAl
	 /d6jTnvsQ690IqQSpYRjbgwVEyZ5EsfpOUcjODAtRGJ2/VQuUlszoFr3+piMF7nhn2eiu
	 WSr9e0ch93xajPrly0l9rPX+A/yJY8c56f5vaU37ODopCTzIH0oShyawjGB0RTM8m0ESA
	 pkPDg4kfUmfOXSbyKMydWIQNgH6V/T6MURUj+vQkScwQzW5XBmKonEumK3XHm5W1G6vl9
	 P3nwjCNa1002NYSIXvSFtM0ZM8HQXPQmpDZf/U42ddv2XWHLsRjx1DMAfo/mhiNzKpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=Us7Gt2A1;
	arc=none smtp.remote-ip=45.254.49.198
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23383606A32F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 09:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23383606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=Us7Gt2A1
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5655b0808;
	Sat, 28 Nov 2026 17:41:17 +0800 (GMT+08:00)
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
Subject: [PATCH 1/3] irqchip/ls-extirq: Remove the interrupt domain on unbind
Date: Sat, 28 Nov 2026 17:41:16 +0800
Message-ID: <20261128-f81b700d6c-u38-1@mail.sdu.edu.cn>
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
X-HM-Tid: 0aa22187cab503a1kunm72d526e6451d44
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCGU8dVktCQ01JQklKSxhMQlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=Us7Gt2A1TpQGhLJz9/rhRn8E3bMMKQSznhGMVELXFBhtmukc5Lqu2eZsH9i+F9J1Ej3BCaMfEjiFaWJcSi7Mx01+LnxSAkbKHjlm1+80Tt9o3BqbmCQKTFOzFDp+zUc4iAGmDYgy4cb9EswsJ7Cn/ScPjsNlvrPIc3ec2/GfF34=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=CY/rfI4YKWyxTp2uoMTOvs21zzWoKyzt7WP0sTIsZNw=;
	h=date:mime-version:subject:message-id:from;

The IRQ domain remains registered when the platform device releases
the controller data used by its domain operations. Remove the
domain as part of device teardown.

This issue was found by our static analysis tool under development.

Fixes: 05cd654829dd ("irqchip/ls-extirq: Convert to a platform driver to make it work again")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/irqchip/irq-ls-extirq.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-ls-extirq.c b/drivers/irqchip/irq-ls-extirq.c
index b791cb03a44a..ae8e9c918ac8 100644
--- a/drivers/irqchip/irq-ls-extirq.c
+++ b/drivers/irqchip/irq-ls-extirq.c
@@ -168,6 +168,11 @@ ls_extirq_parse_map(struct ls_extirq_data *priv, struct device_node *node)
 	return 0;
 }
 
+static void ls_extirq_remove_domain(void *data)
+{
+	irq_domain_remove(data);
+}
+
 static int ls_extirq_probe(struct platform_device *pdev)
 {
 	struct irq_domain *domain, *parent_domain;
@@ -209,7 +214,7 @@ static int ls_extirq_probe(struct platform_device *pdev)
 	if (!domain)
 		return dev_err_probe(dev, -ENOMEM, "Failed to add IRQ domain\n");
 
-	return 0;
+	return devm_add_action_or_reset(dev, ls_extirq_remove_domain, domain);
 }
 
 static const struct of_device_id ls_extirq_dt_ids[] = {

-- 
2.43.0

