Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617654;
	b=GMNV5SmrGMqmRlYDpSSLbDB6YDBCc6Jklo59/6pyBB6LGFW5JxYu6Fr6HUrM+bB0C+4U
	 f2sSyV/9l1GeP2r3a+MUmyRWVL6A3b6n4uguT97pI6BQyPtgWzBcCoFrx6vQWEVUbc8Yl
	 gsSU7BHTN62riyJqXjSCc/hR8Qz0M1Sxqqs2DHQaOLj52naUmorvCl0xE0KDLt2zJDT1T
	 fWC41P8TE0axdf8HD3uZnwv48ZdnYAQIBCwiOyysYQcmy8/AvNBmktQLOK4jqj/9Dc9zQ
	 SGZahBTJzaJiNuCQFvZzFLYDQHntWZn2IqILumL4eofeg9JTjsxZWJDQBRGDJWUGKuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617654;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=aVb1PLs+TxasDtfaL7ziCenkQAm6flyH0SSnHwDVW0E=;
	b=J2cPDjKX3KInj82J7b4BQsNAyy5NWZN62CY8w+xeiY/G/m9GiPj4ChlIIoBfiWvpSXmG
	 9lcVzT1GXV2Cjl71vosPdV6L93/VSeLXj1cdLgMtWfHlEHoe9Op1NbLkcD6NS3rdytAYz
	 Dg80G7PPq0ty4JDN7mn+CsqnmqAn81o3Xi79AclvR7n2C6/lILzeNw/kAHTSMHfa2XXJM
	 eW/bNKKOAKZkO3VxN8jd5jACjqC9Lby+wiLlmibVHfBvn/rbTAy0wYUZcNgzxzlL/BZo3
	 THslwdcgLXGtBCEgzqopwQ87/4DUjDdGWVsY0jQhN0GI5iyh9X0wIlWHiTrKelCZwzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=usDx2SXs;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAB1D606A68B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:40:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAB1D606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=usDx2SXs
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A60D21BF3;
	Wed, 25 Nov 2026 06:40:50 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 15C1B3F632;
	Wed, 25 Nov 2026 06:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795617653; bh=RKui/rQSOjHQatfegtez/VOcvA/uhjJnfqpZvOVJLuQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=usDx2SXsXp1iOaH+sROfeuCydVBQN5rWsJClWx2Uq8aMINVhtbbeqlv3tV/N6WcMx
	 V2wbxieV2hlqZ1Zt5y9kZfYJz0+/r/MmG6YKVGUy/QKPISnTEQNNl83oEGB61+akr7
	 l0+h+nyK2NrYnt+vNfxN+XhpwIg5WTyg0g1Eo6xo=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 25 Nov 2026 14:40:32 +0000
Subject: [PATCH v4 10/13] irqchip/gic-v5: Release ITS MMIO region on DT
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
Message-Id: <20261125-host_gicv5_fixes-v4-10-0469743c47d8@arm.com>
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
index e7db4449fe91..db13011ef6d9 100644
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

