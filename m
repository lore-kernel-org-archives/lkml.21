Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617649;
	b=I6HAD2fSYPmkXWK5lGIIkEuo76W723UjpZJZCsECiVROZLAb9KSzfGrFUS10/bXPsiJj
	 Q1mP0sDDJB3UfqTOzOCsHVSbQhaTQ44yquXzoBnf8Y8yRHWU9QfJnFbpIB1CbIBTA6XGG
	 nuZM9KnLQRp5t2XIRzmOXiHemHaWr5ObWobtUPLOcsU4QAAWq3g2ZS5UxE8lNDjVqNQXp
	 6QwZ13dVEVBup0O83/4FVMdim/YliBcEJ1L1lC7jvLGnQ+NZlxYlPO22kFq6Uk6xqWnSn
	 RqBchn9s64VnzvgQgUR3vk1hfqgGdbsSBZSGB5kAWt3jtefwsyrVV6856hsRqdzxT5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617649;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=NRnWJRy5OZoGWnZZjBJ8XtvBGGIF/0syqYZSB2DkB98=;
	b=mWKi2Kuy82NysT2oCtOE8p/ZltNisWjVP7BOC5hsRS08lyjCJZ69WrsWPRZ7acCvOhOu
	 pcTjQ5MiA1qEDiLT3Ve2pMBxxAj6WDXqRUrpHhylaHggL5SQRneaUz3WJcqKtla9HGyuw
	 WNdOGYAD8BZMDmqXLlZX1+lvTTxcC+uCnvaGSzaJKg3MzWylgPtChip//nGxHHwZaZssa
	 Vdh2iQV9kCr2ZPpf5EZ4uO6ZpuJMBCgya8yzuDrVsape7qMwfoTYojv4JAzIlhzLYLLbP
	 mcaHRWr/H8irozJLKw79i2gLni+TeLyBRCu3Ax2zV8Ujviitah3YvCL0FJrMofVqRgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Ny4JfpmN;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8C68606A683
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8C68606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Ny4JfpmN
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 715C81BCA;
	Wed, 25 Nov 2026 06:40:45 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D64A33FA7A;
	Wed, 25 Nov 2026 06:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795617648; bh=0yoQwIc6dd+KsACgxSIpHNRylt0YTx0b2RXO38cnf4s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ny4JfpmNNcYYQTe7GDn/+DbU3stRClLnCjvlgQbF9mRUdxLx60kHAdmYKjujSPEN1
	 Nvc5JV2F7uir3wMrZbxXnsFaLWve/4Z2Jtb0bBkbT/P8tVuco3wwiahmEMSBxjM/Gs
	 5lNtm1sYWloIiKvyoob6M0HAu775XkVRf+nhVms4=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 25 Nov 2026 14:40:29 +0000
Subject: [PATCH v4 07/13] irqchip/gic-v5: Use firmware node name in ITS
 warning
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
Message-Id: <20261125-host_gicv5_fixes-v4-7-0469743c47d8@arm.com>
References: <20261125-host_gicv5_fixes-v4-0-0469743c47d8@arm.com>
In-Reply-To: <20261125-host_gicv5_fixes-v4-0-0469743c47d8@arm.com>
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

The common ITS initialiser can be called with an ACPI firmware node.
If firmware leaves the ITS enabled, the warning dereferences the DT
node pointer, which is NULL on that path.

Use the firmware node name for the warning and drop the DT-only
pointer.

Fixes: a97efa5ba5946 ("irqchip/gic-v5: Add ACPI ITS probing")
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
---
 drivers/irqchip/irq-gic-v5-its.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index 9e8077dada5e..876437017ccc 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -1109,7 +1109,6 @@ static int gicv5_its_init_domain(struct gicv5_its_chip_data *its, struct irq_dom
 static int __init gicv5_its_init_bases(void __iomem *its_base, struct fwnode_handle *handle,
 				       struct irq_domain *parent_domain, bool noncoherent)
 {
-	struct device_node *np = to_of_node(handle);
 	struct gicv5_its_chip_data *its_node;
 	u32 cr0, cr1;
 	bool enabled;
@@ -1129,7 +1128,8 @@ static int __init gicv5_its_init_bases(void __iomem *its_base, struct fwnode_han
 
 	cr0 = its_readl_relaxed(its_node, GICV5_ITS_CR0);
 	enabled = FIELD_GET(GICV5_ITS_CR0_ITSEN, cr0);
-	if (WARN(enabled, "ITS %s enabled, disabling it before proceeding\n", np->full_name)) {
+	if (WARN(enabled, "ITS %s enabled, disabling it before proceeding\n",
+		 fwnode_get_name(handle))) {
 		ret = gicv5_its_disable(its_node);
 		if (ret)
 			goto out_free_node;

-- 
2.34.1

