Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617644;
	b=4kwQs494WB/q53qji8KxiKN5NDmYCESNDEXeVUY/KzsAAH3/VB3vI6t7c8jC7S3wOZpU
	 xN8hlf+Y/4E/WNAhDQnRD96OA//aHoNixnmc8c09v26mZ7nopdUjFPZRFFLrXXyUhSxuZ
	 5YXPSmmvgFp75YiSCVV11liAB11tHFelGTLHuFVXAMHXbDm6OWoD6/oLpVzUWv6sZV8h8
	 z4rFsmYjOWacoSSM6Yb+06RCRnCwh3Dop2Y75VNqehDGj6N6mDfTwhMjRtIDK7onNvaZ1
	 +HjWjk+dwIIs/2P8zx2kP208DbLmzlE9C3JxqPzm5TSuGqZXl0ySg6Je1CxULmoVQFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617644;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=QxuvayF2LH7RECe60EK9cpsImVEc2IJka6WFZjwzNyo=;
	b=R4irlLe8JJoEjjVJIRwZwArnoORtEypyxleAMhCck2J24slri7z9UHQXNDH6gUMi+0U7
	 2gqpKUGBeRuZ19SYlrDSAvbjBK/TmKP0qNSIOIYU5/EiE3/+KO2QKTtirAzAmwmdRlMQT
	 tTJ9SJ2+TJXnWyZSxYaZ4y7upje/vYiWHh7rF+rQMyTKY4cwt6cWvYeSoLoQlcvakS6/J
	 4aTzeAr1i+rBIzGXBDa+AJUkRjkVS3gFvSdjEd5olPpse2EU2XmeqcVJdV4JtUOJIIQcd
	 M5yDBR5WLieSPYCHpH83aGNIEmODbpF/UuSlreFmU5zURN0vKqGRQfFUcK0d/yJ3Y5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=UP3LhKvN;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF50F606A33A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF50F606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=UP3LhKvN
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D5AD1596;
	Wed, 25 Nov 2026 06:40:40 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 880433F632;
	Wed, 25 Nov 2026 06:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795617643; bh=JVMoRRbuWVInchywuH+azNnrz/HqxCw9Jqjk8Enx5ws=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UP3LhKvNgsiYZyXK/xoxrEjNObrF+PwxsbhiLAueOqM1UsW2t7ab3jn/OPufhYO6E
	 +GZ89bO2Bil/OfAo/zLePqjaBZIDuso+bm/D8ce1wmOJK3sZFewRV2Y+y+1PDP80Iu
	 qAAqdMLqVjyR4lezvqatKq2c58r2Hbz95G2Mh5dU=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 25 Nov 2026 14:40:26 +0000
Subject: [PATCH v4 04/13] irqchip/gic-v5: Serialise ITS invalidation
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
Message-Id: <20261125-host_gicv5_fixes-v4-4-0469743c47d8@arm.com>
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
index f876dc0de1b9..88d18822a1ff 100644
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

