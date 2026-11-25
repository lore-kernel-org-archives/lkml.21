Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617647;
	b=rMzskdFAIAOyfcuSEubJkVZQrLFWjNvg/JpfZmeEQFwVBV2nd9sE+42QhAkwNxOZ8lIB
	 AZuWlvrr18XEeCrFDVfr5daEAt09oCeRnaJKTaPwj8Y6drkmdaDQxSGqnCXaKH4qiH5+k
	 5FW/vUhi0g8C7zWsTMHaIbUr3VjPnogMoVFH8yDMtl3KIQvWbbtQ6HCHifH/SmNzFm3iJ
	 NJmPu6GnLNNYDx/r80zwG6f0vxHiIc+bWgkyMZ1Upi6xr9Fra/bDsEUPCYzu1yGYeDk/X
	 qDJoCvs8IbsZqmZBlUbHVZwsFD9UmyIVd1ym6v7+MokZEoY8YtSU8C5Px+R9VZfu8cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617647;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=NvMYVT9tNpa/axhZRuSXNm0zbETz710r1hPKh+kJCW0=;
	b=KmAcQeOFeeNx6W56k6CeGTmUW4yjFC200FWvPdONSobhboOJAlIzkA/sxa6Q2X7pTjBX
	 e6YmkkseNa+BlPTJMbQwVgtdyWFklp5cNcnh79qUNrfs9sPhW2saxsxYimW7CO2CMqIMa
	 iuP1twZHYoj3rL3QZq/3HR6QLRaPSC59+nM+vdp11+NvXRaug0qOKejqIppwU2LIc3iaB
	 SjgSCjO8V2mFRiLk1ev37IlKzIS2lQ7HYtSQXXtVvSqpLJRpiT6vQzoU4/oH5/y3F1YWC
	 /0wT1MAT5bJs3Ds/CCSAdq2m09aJTNXt6gjLytqJ8p0O3BhEVjaROf2Gh24JUHbSZfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=AStYBrKO;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 740F1606A6A0
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:40:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 740F1606A6A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=AStYBrKO
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1BE81BCB;
	Wed, 25 Nov 2026 06:40:43 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 228F23F632;
	Wed, 25 Nov 2026 06:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795617646; bh=HvYUdu8Ajz2Mxhtj7IToMSBjU1wmW4YvcJ22mLoSSFE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AStYBrKOPhWI3m5OXPZ5Lou6PZJ+MLxZ7Rqd9Cycp962DX9OrPX6vjFNIz06dIn/o
	 pqNcVPx8EZEnLirv/YYS9Xqj7RKZh5yGfQdof0TaeRV6mjMHy7CRr4QxIPbAslL/6I
	 Wf9c1R+v8Zf/ZomW5Dod+isCmlo3gnrj6alWMPA8=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 25 Nov 2026 14:40:28 +0000
Subject: [PATCH v4 06/13] irqchip/gic-v5: Honour ACPI ITS noncoherent flag
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
Message-Id: <20261125-host_gicv5_fixes-v4-6-0469743c47d8@arm.com>
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

The ACPI ITS probe passes its noncoherent flag to
gicv5_its_init_bases(), but the common initializer checks a DT
property instead. For an ACPI ITS, this always selects coherent cache
settings and skips the cache maintenance required for its tables.

Use the noncoherent argument, which both firmware paths already
supply.

Fixes: a97efa5ba5946 ("irqchip/gic-v5: Add ACPI ITS probing")
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: stable@vger.kernel.org
---
 drivers/irqchip/irq-gic-v5-its.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index 5f9fa80ea6aa..9e8077dada5e 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -1135,7 +1135,7 @@ static int __init gicv5_its_init_bases(void __iomem *its_base, struct fwnode_han
 			goto out_free_node;
 	}
 
-	if (of_property_read_bool(np, "dma-noncoherent")) {
+	if (noncoherent) {
 		/*
 		 * A non-coherent ITS implies that some cache levels cannot be
 		 * used coherently by the cores and GIC. Our only option is to mark

-- 
2.34.1

