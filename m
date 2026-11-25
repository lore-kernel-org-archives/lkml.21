Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617652;
	b=hqQ8SYROYlGTAp1DNz6NOpyI/lygzM1nyGT2xZTePYYGPPt/LWezWTXomE/VNYi5uPku
	 Cnfupo1SoB3DBY8Nz82x81ImEOdsaAWwxFdf3mC9Hf0Bf1R1fSKC2oBqmJ+qbqImr1D0N
	 Riwqr/f70C8h7cylD6G5DsG8Zv4mQ0bMKaXfhkgyT7ZZMPQNbubsRyQGgqg8oQoB/dReQ
	 9Ey7yx2diZtv8UKXiq9QFUqP9u4kwo+k3dX8sobhqHT0Spn5ZAYHJ2MPsd+CQiLAOdEMH
	 +UO8QM2AKVB8iplOWrzCiY0TN9sa1Mj4JL3eNksK/wJc+a4T1kJbgv2WApccnnTiXfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617652;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=SO8Hr/Fl+8debprOMQuSjXe3B5PXGw8YoggDIyD/DsE=;
	b=sdqdtyeFoq3DMgxotf4bG2UI2x6x4Yp9c2YHHeGyslu9aacNfvdmTdIB78sWxbZTZIKs
	 xhLAk6VSp/JiYevJv7SnW+ms1HL3KrB6DIklaPf/Yx1V9rsZt89XtDX3tiaHjXTYzFcJk
	 zLYZiQRP5oF9JSXhl0FibMIcCWS/340uL7XH6su6LvkiU5bOhlsLE5y3dBxSb/dNmVaWx
	 LamSaenDBsyKKf4qbOwAgPnK4KAbrAqBeletVkC+IRRGa1K0iC2+lnzAb78oPmyqWR/x3
	 1NZ9J8EsvZTVieHvTKY1fXwsN6tnAMgoqZtXHMtF4NHTM137T8GSE0qdzKF5a7pLCHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=kMiMzTAB;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 660E4606A69B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:40:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 660E4606A69B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=kMiMzTAB
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E50031BD0;
	Wed, 25 Nov 2026 06:40:48 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 563593F632;
	Wed, 25 Nov 2026 06:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795617651; bh=zqlEy1y8XsotrPK229jQWV4LiW1Z+QmAZyRPajzeCxU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kMiMzTAB6Z1VsR/ZyNVGm6DpKhKlY4pgZlCPH4eH5aWZc5xJEVX0Y4yAp34nyeK9Z
	 XrZnGXPhcZN7pHV6s9R8BOOw1VmrDhLWo5l+op+Ly7w0NmdA4jTef/S3eKaW97pmD5
	 dHOuO7c6GYfGKk7Qig9xniSdLZdwBxaVSR05/8rY=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 25 Nov 2026 14:40:31 +0000
Subject: [PATCH v4 09/13] irqchip/gic-v5: Clean the allocated linear device
 table size
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
Message-Id: <20261125-host_gicv5_fixes-v4-9-0469743c47d8@arm.com>
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

When the linear device table exceeds the kmalloc limit, the driver
caps the DeviceID width before allocation but keeps the original size
for cache maintenance. On a noncoherent ITS, this cleans beyond the
allocated table.

Recalculate the size after capping the DeviceID width.

Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: stable@vger.kernel.org
---
 drivers/irqchip/irq-gic-v5-its.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index dce5bfd1a78d..e7db4449fe91 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -594,14 +594,14 @@ static int gicv5_its_alloc_devtab_linear(struct gicv5_its_chip_data *its,
 	 * kmalloc limits so that the system can chug along with a linear
 	 * device table.
 	 */
-	sz = BIT_ULL(device_id_bits) * sizeof(*devtab);
-	if (sz > KMALLOC_MAX_SIZE) {
-		u8 device_id_cap = ilog2(KMALLOC_MAX_SIZE/sizeof(*devtab));
+	if (BIT_ULL(device_id_bits) * sizeof(*devtab) > KMALLOC_MAX_SIZE) {
+		u8 device_id_cap = ilog2(KMALLOC_MAX_SIZE / sizeof(*devtab));
 
 		pr_warn("Limiting device ID bits from %u to %u\n",
 			device_id_bits, device_id_cap);
 		device_id_bits = device_id_cap;
 	}
+	sz = BIT_ULL(device_id_bits) * sizeof(*devtab);
 
 	devtab = kzalloc_objs(*devtab, BIT(device_id_bits));
 	if (!devtab)

-- 
2.34.1

