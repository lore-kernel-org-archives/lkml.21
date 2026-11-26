Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719104;
	b=IhvH/b/w1U5rQczsL2DsCDggL51z20v83C4gNTh0nqtkLdJ/Gsnhk62Y777s3qPGPymU
	 c7uuRNGZieU/T8/B9qqUeLmp2B8uwPLwfur80pdPZmSAIDpNnaMVMRhn8PrdUAwhEPO0m
	 Gphn5RY9IVYpDhx7YhI8obfuuzPtiWSE6RjOY4zatI9oV1M4l4409kEtlbbpzd9e+cI47
	 HuSAFOwWWg4k10aGEKcNRheUpmq5HU0fr2LJEYuGO9aHdjExJl1dmwpw7Oczscg/eQhCT
	 1SxNcpOEFaQT1LrFZARyYS1rAHyIWcm4hMGY57nCJ/KsVT3m89LtL0z45qGW1pElTYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9op6aZg6wt9mYcZ/x9nGwKZlYrpFcKQlkp4PjEN5GXQ=;
	b=ekCvPcYLijcQmwEgvdHJUMgexwjeSsE/XSqNIJBqEnBKPDRNdho9yTurSjQHOZU1n5zI
	 dZbiy9DEHHcYFPoX7iczC8pKbzoMWCTe13vTSEhsNULOQp7N0DNg5+WU7gX8H9HXw+NbY
	 HGJRz9Xs/x8D6Mxd0Wdo9kYJbvsf0THDNvbi6CPlKvdj/s5fuh0+X2LHDnLPXmkX6brG5
	 03o1AjipFGUgONZwzAoxa4gURcE1S6xqPsybFxIMMwJBilzihB3AiNUteEeQ6MtEVLRXu
	 +DIopW+Qpom3MmP2gOTeiLiUFLB1L3qQllFtrblJWwiv06LTP8YZCQoNXXweW9ik1cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OLV2Sr7E;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AB6606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:51:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3AB6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OLV2Sr7E
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2f045b921caso42312945ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795719103; x=1796323903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9op6aZg6wt9mYcZ/x9nGwKZlYrpFcKQlkp4PjEN5GXQ=;
        b=OLV2Sr7E1NBKBd0zw7jSeCpZA/0QwRoxhpdd0aEWfEea04mHV1RqE7CL78AfoKDGBY
         7ClRZJXt0eptxxp70rjvVqTqQuDrUvCOKBSIjhmzGmwexS0c8JmkcQhZdsK2INc/0TP6
         0i/VxCo4YVc9gspzxcWz/Ux9EdpJSlJlRt+FCtSQWnCH1QgVrX3b5fcode4B5+oyhvhZ
         FhqmR+FUiahXN+RcNhaTDcNntMgnTX3KzaLMKKX6BcHR+mmRTDXY90/PDhwb8ytWHK5Z
         WDjDC2LPL5CWeCzU/1ZBNq1vMsC4RCFjm+dJvfwnMgP6iYh2bq3gu6qT2PpPl2KGA9w1
         aLKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795719103; x=1796323903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9op6aZg6wt9mYcZ/x9nGwKZlYrpFcKQlkp4PjEN5GXQ=;
        b=MEMaOZsJ+55GQvSL/HFb0EyQ28EM5SdnurnYnZDutEpu7XHPk7gbNnHe66B+9Jtoam
         AlBCJq1K54/aorrOTryO5YlPcRAk828fgh3rAEt0VIQu4BvwINhX7i2wTbHslqClQXUZ
         1xRC9Aj96CnSvdEpBCi+ITa4PihQK9oKcvlE0yUod1B3etlu0Hn9rPTX1bVlxjbSIb+G
         dlonUi2oGV4l1Kk50nsHa1eQsbd0+lrzYwej8jqat1pjzMUOgq3XxvC0HTyp7bZnko/S
         8HLRAA9BoUrfekQ7kfv37rlbijs2KuWQT3KXWQiW4idHcRvoTkq/mGPD1OAPhXXrQNPa
         MhNw==
X-Forwarded-Encrypted: i=1; AL+hErGze6SnvgfEV6Tz1UTxN2nwabmYq7U2S93tteRMEahf8TzAOTpFsn3hVtQV9hKp039QOAzoVaqOoi3X9Yc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/irELl0WIoNP9EdOZ56j0iWK7afuLMYQ8kso8PRbBrmJs0l9ar
	a7fpQj7ODFA5PVa7XBu9Lfv813bsy2lz0EcIxEF+FhEpwuxHp4V8+kp4
X-Gm-Gg: AZFdTZf/VuA0vrsm52nCHAC1hl/RPbMRAUbiab9L7RwHekThkWoO7T+IY+4tO47tHsQ
	8s7nopICnXIZXJ/GFYEPM/7U6qI6dP9CXLyIcgrom978yXtBfWdy8Uebca/NV2uT61KTmW2H+sH
	vUOOHjmqlix6KXMP5cAUtX52KKDBs8KxXN0hyfbSZShv3+AWsOAeos4a3HKkEMljL9cQrc5Uj+c
	W+YQScaZKm/KAJCqXOysU2NDLMRP7URt4z3pT+NOZdCfmSCiAwFbhy98Gzda5PgD8bVXiCPcSpj
	reDWmGXVcm7XHsxNdNRYp33OygHsZaNwyjhAfUfd6f752nJ7X7mQ25XSmZ6AJXI68jcdp7aty7U
	BR2R5pbxfmrFrko/Di5eOj5VPN5YnHQFg2KC1VDv+QdeXo/OEiCNqWdgHeZ6YGScBCQDu+fcvI5
	hsrUxsrE+f2yCGv7TUC9TYsd43dfrxX8Ob0F4Zws8J87p+bNAmy5gg4xmhw8aAlO4MM7tjupN51
	5j4TkENeJyMCApYBwoyaOFNvrAmik5riwFsl7yz/sBOX2dw24oEjn0gicRyyJATGfojvRa9KGw3
	W2q2UBdLgZJ2xwNvfoNMjI7qEPPSAiio1/43oud+5Kc5gn2iF5GekQnlftFKw2UTX8+hzuZa2qx
	YdY4Ym6keF1ZWvQHybf+XgpAJ
X-Received: by 2002:a17:902:db11:b0:2ef:e13e:779c with SMTP id d9443c01a7336-2f03ef873cfmr229125015ad.6.1795719103356;
        Thu, 26 Nov 2026 10:51:43 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1276c5sm112041665ad.67.2026.11.26.10.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:51:43 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: geert@linux-m68k.org,
	tglx@kernel.org
Cc: radu@rendec.net,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v2 3/7] irqchip/goldfish-pic: Allow selecting CONFIG_GOLDFISH_PIC on other architectures
Date: Thu, 26 Nov 2026 18:51:16 +0000
Message-ID: <20261126185120.3815699-4-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261126185120.3815699-1-visitorckw@gmail.com>
References: <20261126185120.3815699-1-visitorckw@gmail.com>
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

Drop the MIPS dependency from CONFIG_GOLDFISH_PIC so that other
architectures can use this driver, and add a dependency on HAS_IOMEM
since the driver uses MMIO helpers. Also update the file header comment
to remove the MIPS reference.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/irqchip/Kconfig            | 3 ++-
 drivers/irqchip/irq-goldfish-pic.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 20b77fbc51ee..a1c1e067022a 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -513,7 +513,8 @@ config MESON_IRQ_GPIO
 
 config GOLDFISH_PIC
        bool "Goldfish programmable interrupt controller"
-       depends on MIPS && (GOLDFISH || COMPILE_TEST)
+       depends on HAS_IOMEM
+       depends on GOLDFISH || COMPILE_TEST
        select GENERIC_IRQ_CHIP
        select IRQ_DOMAIN
        help
diff --git a/drivers/irqchip/irq-goldfish-pic.c b/drivers/irqchip/irq-goldfish-pic.c
index 12113ca90872..8d40df0e3a88 100644
--- a/drivers/irqchip/irq-goldfish-pic.c
+++ b/drivers/irqchip/irq-goldfish-pic.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Driver for MIPS Goldfish Programmable Interrupt Controller.
+ * Driver for Goldfish Programmable Interrupt Controller.
  *
  * Author: Miodrag Dinic <miodrag.dinic@mips.com>
  */
-- 
2.56.1.839.g22a8290db9-goog

