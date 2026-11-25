Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617640;
	b=gUCbhcmsJC7NVwmgMXtEngGgmVjEbWxHYHPu/grYPXscVlsEpr+LWAaxG8UuWlfXTzgD
	 4TUPx22NwRBAhg6jzQ1Q1CipFx7KGiIQQyBswp1e60Kcgf4QoDiwkc1aurPJ/criVJxbH
	 DD8mF8fc+wiWmoM7urSqzB1WJIpumE/TV9NcRqZB0PT/r7Hd57M+dX+H162t9HUewhbgf
	 K/n5dl8xVWORsZHbYht3UxOXpNtWY2k4PPAlMyjZgCe0cVG6Th7ZmyftfXuxbXaP/uNWj
	 4zdj5QUcSGMlHcniexVBBlS3QAmFKV2PQuB/C0OIpf9LPMtvf651pONFjt6YcSovwUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617640;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=w2l8tTDWKsN+KPHckUzCtW+qxkz+JRI1JGbZLU5NSyE=;
	b=xo5glb4xtIEpD7aIFtOFsdS40vGaXONX/HdBAFiV4ozrVAQ6pvIJhXiyPnDMr2WqymYj
	 TIxNtu8fZ1aTiZqXFJxzrXbK9aDOIJxjw0vqAZ3DTd8OFBUhVhJ85pf/2elu8uY6EUYnt
	 rOM//ktCdEheKdDEb77e/93v4wYsMlCKWiqwFjkCeJCzExWBkSKtvDC+QNaE+0r3N23SK
	 Z69yjG8sy6bP4FmluRQJDarnnTTmirAfbGDAQjBaAbXLzPasflVtNWndk+AGs8p+nwzz+
	 XLgCalCmdEagqAAH8hd3NNw8bMiVJatIfQkqDzeJQOQ7BCYEx9VYZSJ01Q5544VToXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=PAzTF6LF;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 262DA606A68B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:40:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 262DA606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=PAzTF6LF
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A1B37175A;
	Wed, 25 Nov 2026 06:40:36 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 11ED33F632;
	Wed, 25 Nov 2026 06:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795617639; bh=DoK6KfKgDjGBzPoHGFLfwWz6Bito/DsccSC2zR/huNQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PAzTF6LFMugTbdvZCGWHnrBRLz7xgzeEAtLMjBmgojmgij20TQgpCV12X+aOFLRqL
	 zzBxysrWXWYpZtlNC+zjUngryIeDkHVCdoc8Qd8EiMzACmlsvjSgeGzPRgempWxvJa
	 RDA9q5Zjjw7g0McWVdOelsUjfsfa9gleG390h6zo=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 25 Nov 2026 14:40:24 +0000
Subject: [PATCH v4 02/13] irqchip/gic-v5: Only set IRS DPS when 1ofN
 routing is supported
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
Message-Id: <20261125-host_gicv5_fixes-v4-2-0469743c47d8@arm.com>
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

IRS_PE_CR0.DPS is RES0 when the IRS does not support 1ofN routing.
Read the capability from IRS_IDR0 and skip programming DPS on systems
without support for 1ofN routing, rather than blindly writing it.

Fixes: 5cb1b6dab2def ("irqchip/gic-v5: Add GICv5 IRS/SPI support")
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
---
 drivers/irqchip/irq-gic-v5-irs.c   | 14 +++++++++-----
 include/linux/irqchip/arm-gic-v5.h |  1 +
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
index 9d60f474aa4f..4edf787f3f97 100644
--- a/drivers/irqchip/irq-gic-v5-irs.c
+++ b/drivers/irqchip/irq-gic-v5-irs.c
@@ -541,12 +541,15 @@ int gicv5_irs_register_cpu(int cpuid)
 		return -ENXIO;
 	}
 
-	cr0 = FIELD_PREP(GICV5_IRS_PE_CR0_DPS, 0x1);
-	irs_writel_relaxed(irs_data, cr0, GICV5_IRS_PE_CR0);
+	/* IRS_PE_CR0.DPS is RES0 when 1ofN routing is unsupported. */
+	if (gicv5_global_data.one_of_n) {
+		cr0 = FIELD_PREP(GICV5_IRS_PE_CR0_DPS, 0x1);
+		irs_writel_relaxed(irs_data, cr0, GICV5_IRS_PE_CR0);
 
-	ret = gicv5_irs_wait_for_pe_cr0(irs_data);
-	if (ret)
-		return ret;
+		ret = gicv5_irs_wait_for_pe_cr0(irs_data);
+		if (ret)
+			return ret;
+	}
 
 	pr_debug("CPU %d enabled PE IAFFID 0x%x\n", cpuid, iaffid);
 
@@ -725,6 +728,7 @@ static int __init gicv5_irs_init(struct gicv5_irs_chip_data *irs_data)
 	if (list_empty(&irs_nodes)) {
 		idr = irs_readl_relaxed(irs_data, GICV5_IRS_IDR0);
 		gicv5_global_data.virt_capable = !!FIELD_GET(GICV5_IRS_IDR0_VIRT, idr);
+		gicv5_global_data.one_of_n = !!FIELD_GET(GICV5_IRS_IDR0_ONE_N, idr);
 
 		idr = irs_readl_relaxed(irs_data, GICV5_IRS_IDR1);
 		irs_setup_pri_bits(idr);
diff --git a/include/linux/irqchip/arm-gic-v5.h b/include/linux/irqchip/arm-gic-v5.h
index 299e75bc9525..34e22e7d4a4c 100644
--- a/include/linux/irqchip/arm-gic-v5.h
+++ b/include/linux/irqchip/arm-gic-v5.h
@@ -532,6 +532,7 @@ struct gicv5_chip_data {
 	u8			cpuif_id_bits;
 	u8			irs_pri_bits;
 	bool			virt_capable;
+	bool			one_of_n;
 	struct {
 		__le64 *l1ist_addr;
 		u32 l2_size;

-- 
2.34.1

