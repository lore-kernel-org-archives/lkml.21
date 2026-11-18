Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795023360;
	b=J4VPAFbiu8mgaPdHZ4/Jn+kgPst3zZfgH21O8xUS08Cysp3hDxlT7aFG+KD/nlb9rbOJ
	 Vu6PA/p74gvyPEHpEiivJzOjKfYgH8rxv5yLrsmFBQQxEsx4Y5m29fQ8mg3yFk1qBY7Hm
	 Jg8bzLcRjLrWFMuTkUKKmawSP0U9Qm1qKOTtMlEDA4JP6o98udlqDSwUFu2WOWrFGzuka
	 0wHVK6aG3zV5PB+HMwaYOa4/WcrUn5aNOz/MjeiRcQUjM7Kh8U0fgUSq7VeE8kBurJqq2
	 D9ihkkpGOaoK0rjAT50J8L52DL6b54pqF2fSjBy2Qc+A28aNaRj2dfFfSml8Sg+MGtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795023360;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=76aqbnqCYQ7fdmyHaSUxIGlKFS3LT6cSMcAAza6UkNU=;
	b=Bg2M9xiPac0oY+OG3r8QlNrt1JhmZkEKQ7kqUxcOtbkkbraII5yj1IvPoAi0s8kfI6is
	 XCEnyko4X0fu4UFvfgaSBD8Q5BJE5GfgLqr6GQpqHb/urjcbg6006Y4BZBAgku+BvguFx
	 iJkJtgILkpeywmJdmfykOKZJKktHsqK1vluug/CUMf8T2CCvXV7WRDKVXrszRawsLBSSY
	 xZsg1ofXBrpGazLiATHeKK3KCwFoiO+smiWZrFXWnvUsSIFf8gYf9a73r/hdDtJlVwoGu
	 PFQago484JxWIYYJ8tlYF/aFeV+K82kMljaOkx0vEi7bs9/ZZGfyI2gZZyxFoF+rVmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=YSuRmTo6;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0286F606CA52
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:35:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0286F606CA52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=YSuRmTo6
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E4E41477;
	Wed, 18 Nov 2026 09:35:56 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BDB703F632;
	Wed, 18 Nov 2026 09:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795023359; bh=GVQ+fg1ZPd0l/66YV1Ea5qwjVqwbzbn++yGuNHOoox4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YSuRmTo6m+dImS5Nu39p3/uZrEB8kUlqtAYoU1+FO/cf/GD0UGOD0NpxACfkZKLPX
	 9Y+u0eGijT/+aR/2bMuxFuWaRQxxHoBNpp+O5DVmcT9GiZFKCHCvrkIZwbdcNvAH3v
	 aaB+FmLEoDB1PlZgJ4MqFaBa/2v03dq1Ch7lMcAs=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 18 Nov 2026 17:35:32 +0000
Subject: [PATCH v3 03/14] irqchip/gic-v5: Serialise IRS synchronisation
 requests
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
Message-Id: <20261118-host_gicv5_fixes-v3-3-13c1859e8aa3@arm.com>
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

IRS_SYNCR writes are ignored while IRS_SYNC_STATUSR.IDLE is clear.
Concurrent calls to gicv5_irs_syncr() can overlap, causing a request
to be dropped. A caller can then observe the earlier request
completing and assume that its own events have been processed.

gicv5_irs_syncr() may need to be called in atomic context. Serialise
the request and completion poll with a raw spinlock, and use atomic
polling.

Fixes: 57d72196dfc8 ("irqchip/gic-v5: Add GICv5 ITS support")
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: stable@vger.kernel.org
---
 drivers/irqchip/irq-gic-v5-irs.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
index 4edf787f3f97f..ead76560ea08f 100644
--- a/drivers/irqchip/irq-gic-v5-irs.c
+++ b/drivers/irqchip/irq-gic-v5-irs.c
@@ -10,6 +10,7 @@
 #include <linux/log2.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/spinlock.h>
 
 #include <linux/irqchip.h>
 #include <linux/irqchip/arm-gic-v5.h>
@@ -22,6 +23,8 @@
 #define LPI_ID_BITS_LINEAR		12
 
 static DEFINE_PER_CPU_READ_MOSTLY(struct gicv5_irs_chip_data *, per_cpu_irs_data);
+/* Synchronization requests must not overlap in an IRS Domain. */
+static DEFINE_RAW_SPINLOCK(irs_sync_lock);
 static LIST_HEAD(irs_nodes);
 
 static u32 irs_readl_relaxed(struct gicv5_irs_chip_data *irs_data,
@@ -507,10 +510,11 @@ void gicv5_irs_syncr(void)
 		return;
 
 	syncr = FIELD_PREP(GICV5_IRS_SYNCR_SYNC, 1);
+	guard(raw_spinlock_irqsave)(&irs_sync_lock);
 	irs_writel_relaxed(irs_data, syncr, GICV5_IRS_SYNCR);
 
-	gicv5_wait_for_op(irs_data->irs_base, GICV5_IRS_SYNC_STATUSR,
-			  GICV5_IRS_SYNC_STATUSR_IDLE);
+	gicv5_wait_for_op_atomic(irs_data->irs_base, GICV5_IRS_SYNC_STATUSR,
+				 GICV5_IRS_SYNC_STATUSR_IDLE, NULL);
 }
 
 int gicv5_irs_register_cpu(int cpuid)

-- 
2.34.1

