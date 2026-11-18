Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795023370;
	b=Tc5AeLoGh4aLnMnXdPbnK996sOFBSVLU1cpweOWdIJ2qG1yWoS5JbS0L+I5cIXIZeljN
	 9aEyhafD1N0GBLy3SMDNjyoc73ULOUdYQApxb+vvWDbgYp78sm43Doali5dDYrYtnejjy
	 JMccPHJ7QqYxeW4+p/0Myht8jLVP09c2z0Dyqjxm1ytmLIMa36jp/dgBJWjzQLhpbCz6r
	 RvcDFb1RsOgQNIky7Wk/KjpTx0iJgb4CZ6DY1k68BLG7QC7ZdOIqAUJvIle7tVFBIUZUT
	 jad64EzsJcUJjEOvklIdQB6N6XdyzaQ3HPM3vf6kS1NMxbOiqhyJVDZvy2aP09iK6PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795023370;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=J+G+xC0p74vn2sEkBQl3yCBMl8hOWZRkKoYR/SB/aqM=;
	b=iAjh+f60zTD4JSZOBdeF+liNJujwo9n08mZuEoNWVIky2fWFKXznsHn84J2ZoOYO+9yA
	 8BIaiJFVpHssAb1ZqU37A+V+E3zFOVF30rWm9sZv00Hj5gdYKkCQPqdOEjpqQorV+xZkJ
	 R8YIwiED6vMfjvBzBjG3SOvHNVG2Hir0hFjWYWo6OEXClUpZUSg/OYeV2uEt1ozCJkipp
	 6lcMsnyGkV4zvyBNmzRlFWVKJDPw3Uvhek6ycJxqk99UMY0YaH4oIsq78vpU35GADQOtc
	 PkM2EzgoRq4gCqMqB04vMyPbg/B6rIMp3DTnTa3sMIqxz2gha2+D3um+o31CLB6+t5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Q1kiQHQO;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E1BC606A338
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:36:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E1BC606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Q1kiQHQO
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BEEA71477;
	Wed, 18 Nov 2026 09:36:06 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 081523F632;
	Wed, 18 Nov 2026 09:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795023369; bh=rsTiDEUCjaTZ+bVkbUwBYd8TOQnnZyJQiitr8SarOe8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Q1kiQHQOjL6S/H9sv6STu4W8q0jSJvqXjeT296gNATQunMfXvBsm3AD7gdDXJX9MK
	 roblsVt853Nwi1IQXGEq+F99FeLnSLFGgfwXQh8vOx7UukZ0RruaNcAqcTXwqCymMd
	 GHyt3llEW5UHKyUXVUROlroT/u4GiNMycjB5aOKw=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 18 Nov 2026 17:35:37 +0000
Subject: [PATCH v3 08/14] irqchip/gic-v5: Use firmware node name in ITS
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
Message-Id: <20261118-host_gicv5_fixes-v3-8-13c1859e8aa3@arm.com>
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
index 9e8077dada5ef..876437017ccc5 100644
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

