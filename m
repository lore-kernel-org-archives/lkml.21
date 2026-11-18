Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795023367;
	b=ySgMRzy6YskTssRrUPyBEswcrn8o12HTwnVZaICywycdW0HieTTRATl7OBpJXxjyw7sC
	 6j1jZwNE1irPogC/lNoVwhLJ+c1jhP7/mlTsWcd/t2Q/2nOfbAiGTrblz03Whk1CgIZzo
	 wz9IjUbZwW50pwDIoVHUcVBpZ5qT2Qw5IEs+IH//hq8Go2Ez2uee7yyeTb8yrHh7IFQ+C
	 I7Nydd17SJfyZlS2qYd3SHWoYCoalCsTLhEOoCn4LR9ypMHEfNCvYB6TWgwvmDsgsfJJk
	 uGdfT6bEeD4D/EFIKJEKPytW9I0cT6FzmXZ7qXc0oucNo0NT0uvoYec2s9EFBz+Q6Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795023367;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=OHstQ0JYZUrsLqwWcoko7GWdw5mEgCrc6XUjx6ToQKM=;
	b=PaBWB7+IVBwcf7toxHbR3hY6Eq5gp5ofWVowIhgIBLEifrCFpN4o5eqxo+QZ1KxTbA6y
	 DhtvyppgeUfkmJ8uAOY/PzzgrMCUGPHF8VHEa2T9W7/AGBEkrcEdrL/jCrEkphhr4TkDw
	 88udGIeM+7I6CHxHdmYVdMNnGDeXLqMK1DOtuzL7btZ3uXWB5OF4HTfr2+Do41eClpsTE
	 9KcX+lnKCsyBXqxb0OOXZ764qF7ef3tF4IASP6BQJv6ureZDNpPHUkSNKBbjik9a3x9d/
	 UN3HwOf00h5/acrm0JyUphfZPTDNnBVzjM08WPsRQUpW0HfZrrUKqLKSSxRw82SIuXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=CvtEomsE;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55616606CA5B
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:36:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55616606CA5B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=CvtEomsE
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB9601477;
	Wed, 18 Nov 2026 09:36:00 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C99153F632;
	Wed, 18 Nov 2026 09:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795023363; bh=C9wq7t7vi5DkZGv7bjayDlpCJKB/Nv8vETEEU8P+2s0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CvtEomsEISaQdL6L5DoAJ038wrAqyMxp2OHM35l2Ddw2CLVi1aIpXDYP5RRhlO0ht
	 zIEybOUNP6Zp1I0X9RC6qPZ2Zl2KK3z8sdwfrEdMuu1oygOUdJfZauvuav1g0r6BaD
	 w3V8sFLA30974i2XfJnJovDD8F9vkGqkMOrPQusk=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 18 Nov 2026 17:35:34 +0000
Subject: [PATCH v3 05/14] irqchip/gic-v5: Serialise ITS invalidation
 commands
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
Message-Id: <20261118-host_gicv5_fixes-v3-5-13c1859e8aa3@arm.com>
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
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Sashiko AI <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

The ITS uses the shared DIDR and EIDR registers to select the DeviceID
and EventID to invalidate. Event invalidations for different IRQs can
overlap, as can an event invalidation and a device invalidation. The
per-IRQ descriptor lock does not serialise these commands, so
concurrent writes can cause an invalidation to use the DeviceID or
EventID set by another concurrent invalidation.

Serialise the command register writes and STATUSR.IDLE polls for both
invalidation paths with a per-ITS raw spinlock. Use atomic polling
while holding the lock.

Fixes: 57d72196dfc8 ("irqchip/gic-v5: Add GICv5 ITS support")
Reported-by: Sashiko AI <sashiko-bot@kernel.org>
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: stable@vger.kernel.org
Link: https://sashiko.dev/#/patchset/20261016155741.979985-1-sascha.bischoff@arm.com?part=11
---
 drivers/irqchip/irq-gic-v5-its.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index f876dc0de1b96..88d18822a1ff4 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -16,6 +16,7 @@
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/slab.h>
+#include <linux/spinlock.h>
 
 #include <linux/irqchip.h>
 #include <linux/irqchip/arm-gic-v5.h>
@@ -28,6 +29,8 @@
 struct gicv5_its_chip_data {
 	struct	xarray			its_devices;
 	struct	mutex			dev_alloc_lock;
+	/* Event and device invalidation commands share DIDR. */
+	raw_spinlock_t			inv_lock;
 	struct	fwnode_handle		*fwnode;
 	struct gicv5_its_devtab_cfg	devtab_cfgr;
 	void	__iomem			*its_base;
@@ -129,6 +132,8 @@ static int gicv5_its_itt_cache_inv(struct gicv5_its_chip_data *its, u32 device_i
 	eidr = FIELD_PREP(GICV5_ITS_EIDR_EVENTID, event_id);
 	eventr = FIELD_PREP(GICV5_ITS_INV_EVENTR_I, 0x1);
 
+	guard(raw_spinlock_irqsave)(&its->inv_lock);
+
 	its_writeq_relaxed(its, didr, GICV5_ITS_DIDR);
 	its_writel_relaxed(its, eidr, GICV5_ITS_EIDR);
 	its_writel_relaxed(its, eventr, GICV5_ITS_INV_EVENTR);
@@ -371,6 +376,9 @@ static int gicv5_its_device_cache_inv(struct gicv5_its_chip_data *its,
 		  FIELD_PREP(GICV5_ITS_INV_DEVICER_EVENTID_BITS,
 			     its_dev->itt_cfg.event_id_bits)	|
 		  FIELD_PREP(GICV5_ITS_INV_DEVICER_L1, 0x0);
+
+	guard(raw_spinlock_irqsave)(&its->inv_lock);
+
 	its_writeq_relaxed(its, didr, GICV5_ITS_DIDR);
 	its_writel_relaxed(its, devicer, GICV5_ITS_INV_DEVICER);
 
@@ -1112,6 +1120,7 @@ static int __init gicv5_its_init_bases(void __iomem *its_base, struct fwnode_han
 		return -ENOMEM;
 
 	mutex_init(&its_node->dev_alloc_lock);
+	raw_spin_lock_init(&its_node->inv_lock);
 	xa_init(&its_node->its_devices);
 	its_node->fwnode = handle;
 	its_node->its_base = its_base;

-- 
2.34.1

