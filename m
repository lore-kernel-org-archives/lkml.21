Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795023358;
	b=LBNawkD+SCLgdiehOdN8TScw9BbkDX4So/swYe5lhWxI1SJbGyCjQN41wJKSYFR7ipHI
	 T5rKlzO0HwPhZ8EopGSnvj/TXp3wWxD9fSz1dBzvi+4ASc9KIFFmb27lKZ17u5C1f9IRC
	 3jwMbhWDgJsI4N/xJ6mZII/66lmqHLy7NUFrMPTpyandc/+ZSzG0cGnyL0HiieoZEIT+x
	 6ZGfgpbjKQmEl13/7Gx+bfUOfWnzZvMFT62XUN1xb3QCamiLdVo7oiuXMtFm/bTXfmNKK
	 cpRoO+DC47+6Bu3e5lT4r1Bi7H5LlIgfbD0nYabAWOFpLd/K00GDLyoNSzdWRe2fK2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795023358;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=PXsX2Szqj0S/0jHIInP8OKgsOnASiL9LEwJEu1Zu26M=;
	b=fUsF5GRAtpe5/Z3N0d68FRoFu/Pxg8cl85yZIE6GvIS7Cgl/ZAdjPTrL2dWbTwMVMrS3
	 bTysWyidymsC5EiukBNs/cOEr/klAVQfudicEKXXc2Ci+uwC91csgvt1RT0vcSYjqGhwd
	 XyUpfL0hYlMXWFRkZ2HUkKd2ZLW5J204weeUvQbvrt7WO41IWKFWDmbqTUZjpySDzwSGU
	 RyQcLwo65cVcudOvvhV1OPgFlFeQNgHY/My6GOmsmUTHUGnfZY/WzCB1PLdueRWgJB/vf
	 /zuc+z+pIVXHtY/+GWKhLzq7iPrt3BE6m86p2c1HXEWbsvXSFePZ9vpM2iRTdg1fT0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Nl6BFD0a;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14BE5606CA41
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14BE5606CA41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Nl6BFD0a
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A1BC1655;
	Wed, 18 Nov 2026 09:35:54 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B7D5F3F632;
	Wed, 18 Nov 2026 09:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795023357; bh=3tepdP1KrkoQ3MGeLGjjywE9LDtjU2cFOY1rH+LrUiU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Nl6BFD0aI+mXWXA198CplDLOlseL8CZWXisQByoJOPp0UXB6Nbt4fBBcZNaGLL+Bz
	 hWfeGRxOdKJyTtv4uXtfMgCK0TtoEaG9T2WIn/LZDrHV2errc0qNIQkbaIPK1G3ssi
	 zFBkswatAQVc4wPk1ul2nJGOdprD1UuHPlsukvlc=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 18 Nov 2026 17:35:31 +0000
Subject: [PATCH v3 02/14] irqchip/gic-v5: Only set IRS DPS when 1ofN
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
Message-Id: <20261118-host_gicv5_fixes-v3-2-13c1859e8aa3@arm.com>
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

IRS_PE_CR0.DPS is RES0 when the IRS does not support 1ofN routing.
Read the capability from IRS_IDR0 and skip programming DPS on systems
without support for 1ofN routing, rather than blindly writing it.

Fixes: 5cb1b6dab2def ("irqchip/gic-v5: Add GICv5 IRS/SPI support")
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
---
 drivers/irqchip/irq-gic-v5-irs.c   | 14 +++++++++-----
 include/linux/irqchip/arm-gic-v5.h |  1 +
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
index 9d60f474aa4f6..4edf787f3f97f 100644
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
index 299e75bc95255..34e22e7d4a4c7 100644
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

