Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795023377;
	b=Co4unkhDLStWD00toMitZPOt/BkgioWCWfBzOhlvQlp/KyRINE3AaKRjYBv+kxMyWAA8
	 KSRAiWk2XK4tEwk2Us0vHjl7Mwp/x4jlaNJqYAZDIxxTeUm5v/hY4Wr7ijiITZFHCWBx+
	 54QtB7eAvVjnUukajHR3WekW2RrAJBmbktdM1AhQihEaOPqKEX9Pp1kRwXBAi1F3LF0pY
	 TN2pvfcFoAFdzhHAtSZv2DSffezolQbPc+QHoPWzQ/VH5N7B74zb2dpFifGX+WytusCdC
	 pl7sKqWYz/Ge7Ihy8Dy+s7drA+koPxHsmYr9aHkm5f31QMGVBe3eIDACRGrh2w9yO6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795023377;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=cPEAMgv0ACUO/3ogSQxQR5o5LiO3iYSEYdgQCb/8g2Y=;
	b=WM169tIyH/maqVU0NF61/cOkVF/pAWqdk+Gh/rS4H3pa3AZKqYZzcrVPyedhG91AsdCP
	 U0BNS4rq1bmIuVgSYK2mnFuRuut9sjXSrLP6+CYj1fm2B7be8f1bp09lmnZ36sGBywaXD
	 1Upe3TBLTC9Jw5zZC+iwCy+/PDINlcrluvk/fskzD6UAXzN4laoEUtyBu5Q+eg+BSDezi
	 Q79wnpjIYtWyzNdAmOfQTva0c4zBx3oPOc7z8R4RPZDEQJpfOMvSnThE4coJO8VAffrqC
	 w24pZEbgqwzIKrFCHvGnMOgcNuQnmpkxRoFLrMNNtrCywqH9SC2EOFAN1wrjdILaBDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=FnCeQ9Xm;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 499C460A262C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:36:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 499C460A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=FnCeQ9Xm
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D187B1713;
	Wed, 18 Nov 2026 09:36:12 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 199783F632;
	Wed, 18 Nov 2026 09:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795023375; bh=1tA4qfxpLfSvsMCeXjizNyzf4f5lZp38Bv+7UJMuubc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FnCeQ9XmkCvkHQNKMgdOTMzrS5H474y1Qutnr4Xqxmgke99a3vKvDdkXWn7nbdUzx
	 71Uj3SGocib3z9+m2oMmR6leX05YxSz+g4pCfBx0iyVSVLnFxDfHQdCuNDcrUvHc/f
	 R+AMphgAnZhLq1q6Ek/+SBFw6G2ohxmBQ470dxvo=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 18 Nov 2026 17:35:40 +0000
Subject: [PATCH v3 11/14] irqchip/gic-v5: Release ITS MMIO region on DT
 probe failure
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
Message-Id: <20261118-host_gicv5_fixes-v3-11-13c1859e8aa3@arm.com>
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

of_io_request_and_map() reserves the ITS configuration frame region.
If ITS initialisation fails after mapping it, the error path only
unmaps the registers and leaves the region reserved.

Keep the resource description and release the region on that path.

Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
---
 drivers/irqchip/irq-gic-v5-its.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index e7db4449fe916..db13011ef6d93 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -1188,6 +1188,7 @@ static int __init gicv5_its_init_bases(void __iomem *its_base, struct fwnode_han
 static int __init gicv5_its_init(struct device_node *node)
 {
 	void __iomem *its_base;
+	struct resource res;
 	int ret, idx;
 
 	idx = of_property_match_string(node, "reg-names", "ns-config");
@@ -1196,6 +1197,11 @@ static int __init gicv5_its_init(struct device_node *node)
 		return -ENODEV;
 	}
 
+	/* Save the region to release if ITS setup fails after mapping it. */
+	ret = of_address_to_resource(node, idx, &res);
+	if (ret)
+		return ret;
+
 	its_base = of_io_request_and_map(node, idx, of_node_full_name(node));
 	if (IS_ERR(its_base)) {
 		pr_err("%pOF: unable to map GICv5 ITS_CONFIG_FRAME\n", node);
@@ -1212,6 +1218,7 @@ static int __init gicv5_its_init(struct device_node *node)
 
 out_unmap:
 	iounmap(its_base);
+	release_mem_region(res.start, resource_size(&res));
 	return ret;
 }
 

-- 
2.34.1

