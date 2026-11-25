Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617660;
	b=JR/OsLyW5hVMjqbhs7Pc1YLNc2VTZVaCWasFA2ijpTMQmwN1aPwdy6cMoadRV+SvSfKl
	 e21SoU8AuYW/HX87uzKk5gIYup74fPJhRISa2ZO38Gcn0xMwAd0/W8Lf6F4KJ2QLCi5tH
	 t6iEhpuYlBqHJGw0NcUcwtN/JltnZ7pS/W8TtGQRHBCyH7P7sTkC5sI44vTbuizeHL8O9
	 rm1TLUifaCILuYuGjg94eyUpm8hD2kkPaEXij0/4Fvgg8ZCYLcTJc6SPA1rwT7H3DFOIC
	 SxZPTFSe8w8Odk/pCqSkf9+U2sMTeShDJQ0uRGx6Ax9JgCo/CcIs0VVAHkrzTf+Aq8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617660;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=kWAjaQKRjSMXSZwALN2skOlMmNcnSKjLyh7lTvegcNg=;
	b=BqjL6E4L0/2UwJvON84ya9jKZDpEQHpcEwgG0Ek/0hOSdBIWo3eYLPekN+q10R0BvxWh
	 RoplMSgUwW5PV7B1I5r5SS5bT7dWpcItCIwkRdkVikS8XmGariNcBLE6gA5S/EEWYizmm
	 wgQs8YbKH+23Jr0JWkdCO/GLxl84pprS4ZDvIbLAppcDSkwH9557BAPRhAlh9dfNth8jQ
	 Z52yGnx1H0NnoQl9wR0x4v8844l4Cfm79B0XX0BdJfWATgRHdStmYi4vsQWW82UrxnXwd
	 bw1FwhkQltNUpxxnOc6PYj/2lsuNY0cZOjk1WhE6yxyegpA1UtS2oKlWnMp8BNhlFNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=pAysh9NN;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C4F2606A699
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:40:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C4F2606A699
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=pAysh9NN
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA71F1BCB;
	Wed, 25 Nov 2026 06:40:55 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4BA393F632;
	Wed, 25 Nov 2026 06:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795617658; bh=PpSX75/e67JpV9c7ZzwRPC2Fmo+YW2Jtu0sMWZgBfEw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pAysh9NNfpoKqfb/xyYT4qcgtrv/cNrUMd8YC46NhERnegL92258wcecgLUWYmiFO
	 LIytTpUzQ4sVEghDtjXeHx4XNsFCeRVbKUMH5/Hew9LOHsrVIhik+xHjfXgHA78kk4
	 2YW7yJzkaNXgomlrx2uLLAcotDypmWf7wovXTTY4=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 25 Nov 2026 14:40:35 +0000
Subject: [PATCH v4 13/13] irqchip/gic-v5: Invalidate the L1 DTE when
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
Message-Id: <20261125-host_gicv5_fixes-v4-13-0469743c47d8@arm.com>
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
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/20261112145814.853424-1-fuad.tabba@linux.dev
---
 drivers/irqchip/irq-gic-v5-its.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index 959277c74b68..87218ff05d7b 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -383,17 +383,17 @@ static __le64 *gicv5_its_device_get_itte_ref(struct gicv5_its_dev *its_dev,
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
 
@@ -403,6 +403,13 @@ static int gicv5_its_device_cache_inv(struct gicv5_its_chip_data *its,
 	return gicv5_its_cache_sync(its);
 }
 
+static int gicv5_its_device_cache_inv(struct gicv5_its_chip_data *its,
+				      struct gicv5_its_dev *its_dev)
+{
+	return __gicv5_its_device_cache_inv(its, its_dev->device_id,
+					    its_dev->itt_cfg.event_id_bits, false);
+}
+
 /*
  * Allocate a level 2 device table entry, update L1 parent to reference it.
  * Only used for 2-level device tables, and it is called on demand.
@@ -442,7 +449,12 @@ static int gicv5_its_alloc_l2_devtab(struct gicv5_its_chip_data *its,
 		FIELD_PREP(GICV5_DTL1E_VALID, 0x1);
 	its_write_table_entry(its, &l1devtab[l1_index], l1dte);
 
-	return 0;
+	/*
+	 * Invalidate any cached L1 DTE before using the new L2 table.
+	 * With L1 set, EVENTID_BITS uses the maximum ITS_IDR2.EVENTID_BITS
+	 * value regardless of the supplied value.
+	 */
+	return __gicv5_its_device_cache_inv(its, l1_index << l2_bits, 0, true);
 }
 
 static __le64 *gicv5_its_devtab_get_dte_ref(struct gicv5_its_chip_data *its,

-- 
2.34.1

