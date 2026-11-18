Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795023359;
	b=hrPR3F2f6X9I+tVUghJjivrGvqhbB8QhbTpNEWkm6W4VmBiQNZxD8kBtjuchMCSN/rNv
	 nBbeAqhBFY1WxFB8AZaKnzrEBK8z7kM3k0y+EPu3FBRDMiHynxXstTqjJMXho8hy1ddeX
	 NL1sOi5i6yAog0gbubEBIyXHuNo3bSMDp/hbGmn9wV8W5yRmQSCrcMYf8nuFhV08POggN
	 LR3GERmcIIllqZnIZg5OHq8nKzcBWDmVmMzgUDhVHpJLW1snVE5yz69+nbIcZRmZc2a5k
	 /hMk1ZwcVIJqnDxty/y2yFfYpQbSNJ8Yhm80zIjj9Mq3qAXrDnMczrVNr5NfrcSg5/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795023359;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=3AIyHRsd1qW7V0EBiPtk80pyzhX/mZ6IC8Fd8VS3nUU=;
	b=SxGduP3lmFyU+KpTbhzWY0CjT//+8IU505BBYpLVM/mEDLOQ1HftR6GAOf2lC4EhvcyL
	 WcpLR/kKHH4E3T4g0F0J9o7EoM2LndbnTejWgrfAoW9q+jakf5w0izA1IRY4oJOXbeq+m
	 KfA2znwIkan9+8Q0yTfOT8RXNcvNkFBWOJO4nADLFNetfpdhuiTyAhroORFA202W1YlIl
	 bN6oOZ1YKPrdB8YWNPHbw8431S8w8FSw/1lLQIOuBQYquvJxpgxBHZcKmIClG7i6XvccH
	 dEUhm9LbBpKbw446oMU9RVUXWFhSN1Mtg54sJkFLz3PdCr2aLluXBRbN/7K6hzJNWLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="D60Ul9v/";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8A0B606A33A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8A0B606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=D60Ul9v/
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 749401596;
	Wed, 18 Nov 2026 09:35:52 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B1FA83F632;
	Wed, 18 Nov 2026 09:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795023355; bh=glaGG4QkQ9XYyzO/ge58zMCN1XmE2kVaO9OVuz69dzA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=D60Ul9v/gkvjz/ypEeAptUbnZYaL4q6tk8/U7Y/tqN4Vz6rYcOBux8nuDTPIGGGjZ
	 4qY9WT9ICSLZCu3n/sqVDNbqbdMBMdo9cEZyA9dWBhxfiNlqIb3OmhDVG8lGq1nWWg
	 D5XzGZcNqxcQLvCT+eX4LlXd9NhHuMcg3WAgUaXo=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 18 Nov 2026 17:35:30 +0000
Subject: [PATCH v3 01/14] irqchip/gic-v5: Reject SPIs not backed by an IRS
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
Message-Id: <20261118-host_gicv5_fixes-v3-1-13c1859e8aa3@arm.com>
References: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com>
In-Reply-To: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com>
To: Marc Zyngier <maz@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Timothy Hayes <timothy.hayes@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Fuad Tabba <fuad.tabba@linux.dev>, 
 Sascha Bischoff <sascha.bischoff@arm.com>
X-Mailer: b4 0.15.2

It is possible to build a multi-IRS GICv5 system where there are gaps
in the global SPI range that are not backed by any IRS. In the current
incarnation, this results in dereferencing a null pointer.

Reject cases where the firmware attempts to use those SPIs during IRQ
allocation by catching the case where there is no chip_data associated
with the irq (meaning that there is no IRS to back it). Spit out a
warning about broken firmware when this is encountered as it shouldn't
be using non-existent SPIs in the first place.

Fixes: 5cb1b6dab2def ("irqchip/gic-v5: Add GICv5 IRS/SPI support")
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
---
 drivers/irqchip/irq-gic-v5.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
index 8c0303af71e7d..f3cce2bd28cc3 100644
--- a/drivers/irqchip/irq-gic-v5.c
+++ b/drivers/irqchip/irq-gic-v5.c
@@ -727,6 +727,15 @@ static int gicv5_irq_spi_domain_alloc(struct irq_domain *domain, unsigned int vi
 
 	irqd = irq_desc_get_irq_data(irq_to_desc(virq));
 	chip_data = gicv5_irs_lookup_by_spi_id(hwirq);
+	/*
+	 * The global SPI range may contain IDs not covered by any IRS, i.e., it
+	 * may have gaps, in which case there is no IRS to back the SPI. Catch
+	 * broken firmware trying to use any of those SPIs.
+	 */
+	if (!chip_data) {
+		pr_warn("Firmware bug! Unimplemented SPI (0x%lx)!\n", hwirq);
+		return -EINVAL;
+	}
 
 	irq_domain_set_info(domain, virq, hwirq, &gicv5_spi_irq_chip, chip_data,
 			    handle_fasteoi_irq, NULL, NULL);

-- 
2.34.1

