Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795023382;
	b=tnyU5CsO+AivdYcwrGZTG832X2Y9CRVa7I+F+h9RkYXiFbnJKtr57Bgi3+DkFBqilYbh
	 61IUEMUJkNP848DXZfOse9keE7auYF9OOSDikoREn921JAI9tcWG9PtchijPHAqRAYM47
	 7mEd4piTG/EWzfOePD63eMpxpZyGurvo068ed22SQd1AHkUZlYHMMW545VoKRotb/msXP
	 73SipOlA675Kq6TiC34STY2VWOfL0LpO/+FMgmLtTulTpPfKWohzqVjd/QrclUuLk5dFN
	 NiRl9IM0cFwyD6RWuBZWHsG2HEOoJVWAsNUqWyp83+lFkc6CI9chQExT2stK58qsvQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795023382;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=0IzdNT7nAlSmc3Ox5xHcl/l/Yo54MEa/PmOurZlnPHk=;
	b=jeBryBcJfIj0l3O0x47eRsl4zlspKiOGUO6M9UggYGmaCzJ9XcBZyP/gTi60icSWXJSE
	 QN6puviZX2FrHtUTtBe7i0R3w/SlLZW6VljF2IKlh6/EjZYrAFHu6xg5l5RqeEC0y9Y+k
	 5NVdxHLMzNnwgzMx8+82FfHPUHTZFcnbqydCPJwXOT1NYil14+tusZu/OGpXn4w6mx7Gm
	 Q8HQSftg48id8pjCOVUPh4qw4GpUhcYcxAlbSZFxPM5Xwls0MmpLhmuoDfxMw036z2rAj
	 pFwmhiQzOA8xgQ6QAhrz1okF08SinDvg02CxG0JmtgudZHA63H75JfrJOFpWb94MmHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=McRHF9DN;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4418560A3812
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:36:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4418560A3812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=McRHF9DN
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E67931596;
	Wed, 18 Nov 2026 09:36:18 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2B4303F632;
	Wed, 18 Nov 2026 09:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795023381; bh=MHrR43RxaQCxItEeR97bmoaWkSLce4h9ZI7N1ur4cxg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=McRHF9DNdnD39TeNDDHzfMOJ/x8ZzAeIMiMtBvhGo0FbAPLwwKASX402cwppc6pgY
	 pIErDVIkg7HrI1lMK6oZltYqAyp7r+QIxhBrFrTNyooW2BHgCPZlZwRVw4+2IsM73Q
	 uYYRFp0uSHBaRoBdZZ5NdhrtI5k572GdshyMNr+8=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 18 Nov 2026 17:35:43 +0000
Subject: [PATCH v3 14/14] irqchip/gic-v5: Invalidate the L1 DTE when
 allocating an L2 device table
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
Message-Id: <20261118-host_gicv5_fixes-v3-14-13c1859e8aa3@arm.com>
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

Allocating an L2 device table makes its parent L1 DTE valid, but the
single-device invalidation performed during device registration does
not invalidate that L1 DTE. An ITS that cached the L1 DTE while it was
invalid can therefore continue dropping events for DeviceIDs in its
range.

Invalidate the L1 DTE and wait for completion immediately after
publishing the new L2 table. This also covers a registration that
subsequently fails, leaving the L2 table allocated and its parent L1
DTE valid. Keep single-device invalidations for device registration
and teardown when updating individual L2 DTEs.

Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
Reported-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/20261112145814.853424-1-fuad.tabba@linux.dev
---
 drivers/irqchip/irq-gic-v5-its.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index 7fff2db9ae08e..a05417bdd3a19 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -365,17 +365,17 @@ static __le64 *gicv5_its_device_get_itte_ref(struct gicv5_its_dev *its_dev,
 	return &l2_itt[l2_idx];
 }
 
-static int gicv5_its_device_cache_inv(struct gicv5_its_chip_data *its,
-				      struct gicv5_its_dev *its_dev)
+static int __gicv5_its_device_cache_inv(struct gicv5_its_chip_data *its,
+					u32 device_id, u8 event_id_bits, bool l1)
 {
 	u32 devicer;
 	u64 didr;
 
-	didr = FIELD_PREP(GICV5_ITS_DIDR_DEVICEID, its_dev->device_id);
+	didr = FIELD_PREP(GICV5_ITS_DIDR_DEVICEID, device_id);
 	devicer = FIELD_PREP(GICV5_ITS_INV_DEVICER_I, 0x1)	|
 		  FIELD_PREP(GICV5_ITS_INV_DEVICER_EVENTID_BITS,
-			     its_dev->itt_cfg.event_id_bits)	|
-		  FIELD_PREP(GICV5_ITS_INV_DEVICER_L1, 0x0);
+			     event_id_bits)			|
+		  FIELD_PREP(GICV5_ITS_INV_DEVICER_L1, l1);
 
 	guard(raw_spinlock_irqsave)(&its->inv_lock);
 
@@ -385,6 +385,19 @@ static int gicv5_its_device_cache_inv(struct gicv5_its_chip_data *its,
 	return gicv5_its_cache_sync(its);
 }
 
+static int gicv5_its_device_cache_inv(struct gicv5_its_chip_data *its,
+				      struct gicv5_its_dev *its_dev)
+{
+	return __gicv5_its_device_cache_inv(its, its_dev->device_id,
+					    its_dev->itt_cfg.event_id_bits, false);
+}
+
+static int gicv5_its_device_l1_cache_inv(struct gicv5_its_chip_data *its,
+					 u32 device_id)
+{
+	return __gicv5_its_device_cache_inv(its, device_id, 0, true);
+}
+
 /*
  * Allocate a level 2 device table entry, update L1 parent to reference it.
  * Only used for 2-level device tables, and it is called on demand.
@@ -424,7 +437,8 @@ static int gicv5_its_alloc_l2_devtab(struct gicv5_its_chip_data *its,
 		FIELD_PREP(GICV5_DTL1E_VALID, 0x1);
 	its_write_table_entry(its, &l1devtab[l1_index], l1dte);
 
-	return 0;
+	/* Invalidate the cached L1 DTE before using the new L2 table. */
+	return gicv5_its_device_l1_cache_inv(its, l1_index << l2_bits);
 }
 
 static __le64 *gicv5_its_devtab_get_dte_ref(struct gicv5_its_chip_data *its,

-- 
2.34.1

