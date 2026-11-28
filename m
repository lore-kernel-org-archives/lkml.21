Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.71.155.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795858885;
	b=jzHvIJ2evYCRWKakRNNuE0hU6VuxsgFSaJcanPNtEnd19B+xeb8pcIb6D5VqPAkWZqAJ
	 q5OdMlrwxc6eLl9JSi8dYo64zQW68FUC5Hi00AuqBO6DL22Fgj3gVQxvo6p/IU8ueUS5L
	 fxtx8Ko3hKCsJK/mWgf7vCp3vjQ8dTOtqDCEwizqOqu69J5EZJTs4w3LiaipV+K1BtcKy
	 hflbISjxKFGxEn0xm3wh19yHBJbZnSt6ZCesVpBXbhjNBTSINcHI75w3TrwIB4qOvoE40
	 6w+DaDWMFYtsKexqU2m21ZotzO/cuDvuPm7DBSikUtmYEiMI1XhYgmz8PYEt5yjeUoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795858885;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=+5taEmbX1jQ0IsrTjrZqzivaC0BNlnCc9EtYdf6uOf0=;
	b=LgSNEv/J0v64udaTkbP9Mwd00Sl0FGYRxdvVN7sPZLZeI9Wjt91zVn3E0qedD5i3hhGs
	 h2Ybt88ZgoRcjJOxlY3y1QnzdsG6VvjvOT6+W1bykqeF46xyRUrnKy9vEpPkI6i4uiK5v
	 2cXOc/fmdlMseQTd7X6cqg+8YcVlHOHOaxCDbufQOEjBtXG4Ia1ahw8RPWLwDTJ8WiXwH
	 nT8ioqWT0BYnBSeRqVVK6CFix5IR4LaCGy7LrWR5ELcS9z8qw+S/2GAM1xIt9b9it778h
	 EpTD2TPIPY5LkSqNjH77ie7IP39/FgGXOjxqtJ9HIRY2H0hhjY/kPE8/pZg5FywnG9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=BWWHAD7M;
	arc=none smtp.remote-ip=101.71.155.101
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22002606A32C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 09:41:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22002606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=BWWHAD7M
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5655b0809;
	Sat, 28 Nov 2026 17:41:19 +0800 (GMT+08:00)
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
Subject: [PATCH 2/3] irqchip/ti-sci-intr: Remove the interrupt domain on unbind
Date: Sat, 28 Nov 2026 17:41:18 +0800
Message-ID: <20261128-f81b700d6c-u38-2@mail.sdu.edu.cn>
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
X-HM-Tid: 0aa22187d37a03a1kunm87b2e738451d47
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDHx8eVkJITE9PSBpCGkoaQlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=BWWHAD7MuS5kHCPG98LnRjg/OFfnWgTBpDDOpDJ1PV/s8dbz/C+gfF1XZn9Ks8RBh/mNut++/be51/wYG4u/c7lelOmpGqsmNgxwSWqzOEIb5mRYyLRq71cTNgnvR+0omx7ZVoCl+nNOY4U9iVie1fXSGn4LUekvd/N/uDhcqaY=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=+5taEmbX1jQ0IsrTjrZqzivaC0BNlnCc9EtYdf6uOf0=;
	h=date:mime-version:subject:message-id:from;

The IRQ domain remains registered when the platform device releases
the controller data used by its domain operations. Remove the
domain as part of device teardown.

This issue was found by our static analysis tool under development.

Fixes: cd844b0715ce ("irqchip/ti-sci-intr: Add support for Interrupt Router driver")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/irqchip/irq-ti-sci-intr.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-ti-sci-intr.c b/drivers/irqchip/irq-ti-sci-intr.c
index 1d2e5af3ac4f..d504bb8865b3 100644
--- a/drivers/irqchip/irq-ti-sci-intr.c
+++ b/drivers/irqchip/irq-ti-sci-intr.c
@@ -242,6 +242,11 @@ static const struct irq_domain_ops ti_sci_intr_irq_domain_ops = {
 	.translate	= ti_sci_intr_irq_domain_translate,
 };
 
+static void ti_sci_intr_remove_domain(void *data)
+{
+	irq_domain_remove(data);
+}
+
 static int ti_sci_intr_irq_domain_probe(struct platform_device *pdev)
 {
 	struct irq_domain *parent_domain, *domain;
@@ -301,7 +306,7 @@ static int ti_sci_intr_irq_domain_probe(struct platform_device *pdev)
 
 	dev_info(dev, "Interrupt Router %d domain created\n", intr->ti_sci_id);
 
-	return 0;
+	return devm_add_action_or_reset(dev, ti_sci_intr_remove_domain, domain);
 }
 
 static const struct of_device_id ti_sci_intr_irq_domain_of_match[] = {

-- 
2.43.0

