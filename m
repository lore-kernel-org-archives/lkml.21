Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795764247;
	b=ZG5PrRNoI4u+2c/OTHwioU0TmhF22EbaqQU8Br1Mge/DIhwXjXPjqZYtgwqVpp2z6vus
	 KK46pYHFjdugt2IrI9WPqT3z+0P/zBLke3Q+NWrzJD2NLrdqWpd/PJUU77tk48H7YJ8Ks
	 NkmE9CZp6mSsudnA+c69+SyhdbHzEzzd8u8obX8j/FkUrczrE1/1w/1zMYXqff2U88qy0
	 7xVu542JGW9TjHi5FBcoHWEVvRUaBddxP105xyAWYokk2OWKenLUC0bbTH42FLJ2aIBZa
	 aY+DohGvzJ+yrAxKEYRNOy12gh/sdoeb9mlkABn/jQyCShVZWVzMOj1ev9TkVYUlvJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795764247;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Organization:
	 Content-Transfer-Encoding;
	bh=h+PlsLdgyPubSE9W5RzhP9wHPp8A1zGxxHPZ1Wn7124=;
	b=h4SZyoSrXjggrBkz3MsIdYESdKJv3T3+mvrbKwd8v0DRzImHXquH8eS0SyrsMhjI182A
	 I5xz6ncgnJFr48DJofSi5YBUYnrhPRZZyhsPmddGKDXtwFyr1SpSiUQjzNx5fKSy1BQy3
	 l764h0vU0XKCg+3PeHbz4WabPJNzhqccJ7uQ1IdYICfaGPPmnL1j8dAuze4NVsR4x7yxN
	 KJDukgl/ojeuhSryP1TJEhDgwGkocLFjuDqWZ5/TnHkWhPGyYtvOUbHCxjkNOx3mT7IkI
	 fv5XFASkC1vZtP3DOofOGbzGkjxNYf3J0rAZ91u0EXvEjyNUlazO7OiDuWSWQaSPxgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LdIT7a+x;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB35A606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:24:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB35A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LdIT7a+x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795764247; x=1827300247;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CdhPn7XjVPpYlRJpk1QzpAsZZxBQ8609jkS+pXBm1O4=;
  b=LdIT7a+x6XD744GovFgJWfMmvtx0SnyfqvjIJwwmgZGkDoG7s8Gcf9LC
   vOoJt6+y9yX+dLZj/hg1YEZIKp5FlgtU17wIiWDGArI76BlPdTKnoLTJv
   pmkJY30LRKYECmVQF1NjGuKkaJAHENPCBUwD1lU3iX2xMSyPxAeDkBlXL
   I4nDJxGD9rchiU/034yByUwctutTfaltCHBh44v16mo7R7T3GlDrWF8t/
   Z6Zt84QmcCArQhCcDm90qecFTdBm89p2ek1/leaiSFfaGzoJ74y6QwmUk
   SkRtL3/a+FXHvNKwXLCiXvXIMt3ButkQMT4xLrmTnUNp0MXnxx4NN2eWr
   A==;
X-CSE-ConnectionGUID: wbWc8ZVcRjWUeImW//Jnpg==
X-CSE-MsgGUID: BGNhLTzYSFWMelJFMK1crw==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4759252"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4759252"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 23:24:07 -0800
X-CSE-ConnectionGUID: dRtPY4hyTmWlcVYhxOdQ9Q==
X-CSE-MsgGUID: L2C64/5sQBiBX4Aml/UYvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="12486687"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO ahunter6-desk) ([10.245.245.50])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 23:24:04 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: alexandre.belloni@bootlin.com
Cc: Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i3c: mipi-i3c-hci-pci: Skip Intel bus instance whose SCL is not muxed
Date: Fri, 27 Nov 2026 09:23:55 +0200
Message-ID: <20261127072355.26331-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Content-Transfer-Encoding: 8bit

Intel LPSS I3C PCI functions may expose a second bus instance even when
it is not pinned out on the platform.  When the instance's SCL pad is not
muxed to the controller, the mipi-i3c-hci driver still creates a device
for it and probe eventually fails:

  i3c intel-lpss-i3c.1: i3c_hci_process_xfer: timeout error
  mipi-i3c-hci intel-lpss-i3c.1: probe with driver mipi-i3c-hci failed with error -110

The controller's SCL input is a clock loopback.  If the SCL pad is not
muxed to the controller, the loopback input stays low, so the controller
has no clock to sample the bus with and the first CCC transfer times out.

This condition can be detected from the HCI Debug extended capability.
After reset, the PRESENT_STATE_DEBUG register reports
SCL_LINE_SIGNAL_LEVEL before the bus is enabled, and it reads low for an
instance whose SCL pad is not muxed.

Firmware does not describe which instances are pinned out, and MIPI
DisCo provides no property for it.  Detect an unconnected second instance
from the hardware instead by checking SCL_LINE_SIGNAL_LEVEL after reset.
If the second instance reports SCL low, do not create a device for it.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 .../master/mipi-i3c-hci/mipi-i3c-hci-pci.c    | 32 +++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
index 78fa42b2dc94..ea3e14c65313 100644
--- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
+++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
@@ -39,6 +39,7 @@ struct mipi_i3c_hci_pci {
 	void __iomem *base;
 	const struct mipi_i3c_hci_pci_info *info;
 	struct mipi_i3c_hci_pci_instance instance[INST_MAX];
+	int instance_count;
 	void *private;
 };
 
@@ -163,6 +164,29 @@ static void intel_reset(void __iomem *priv)
 	writel(INTEL_RESETS_RESET, priv + INTEL_RESETS);
 }
 
+#define INTEL_PRESENT_STATE_DEBUG	0x24c
+#define INTEL_SCL_LINE_SIGNAL_LEVEL	BIT(0)
+
+/*
+ * BIOS enables the PCI function only if the 1st instance is enabled, but the
+ * 2nd instance may not be pinned out, in which case its probe times out.
+ */
+static void intel_check_2nd_instance(struct mipi_i3c_hci_pci *hci)
+{
+	for (int i = 1; i < hci->instance_count; i++) {
+		void __iomem *base = hci->base + hci->info->instance_offset[i];
+		u32 st = readl(base + INTEL_PRESENT_STATE_DEBUG);
+
+		/* Reads the SCL clock loopback, which is held low if SCL is not muxed */
+		if (!(st & INTEL_SCL_LINE_SIGNAL_LEVEL)) {
+			hci->instance_count = i;
+			dev_notice(&hci->pci->dev, "%s.%d: SCL not connected, skipping\n",
+				   hci->info->name, hci->info->id[i]);
+			break;
+		}
+	}
+}
+
 static int intel_i3c_init(struct mipi_i3c_hci_pci *hci)
 {
 	struct intel_host *host = devm_kzalloc_obj(&hci->pci->dev, *host);
@@ -181,6 +205,8 @@ static int intel_i3c_init(struct mipi_i3c_hci_pci *hci)
 
 	intel_reset(priv);
 
+	intel_check_2nd_instance(hci);
+
 	intel_ltr_expose(&hci->pci->dev);
 	intel_add_debugfs(hci);
 
@@ -402,14 +428,14 @@ static void mipi_i3c_hci_pci_setup_cell(struct mipi_i3c_hci_pci *hci, int idx,
 	cell->resources = &data->res;
 }
 
-#define mipi_i3c_hci_pci_alloc(h, x) kzalloc_objs(*(x), (h)->info->instance_count)
+#define mipi_i3c_hci_pci_alloc(h, x) kzalloc_objs(*(x), (h)->instance_count)
 
 static int mipi_i3c_hci_pci_add_instances(struct mipi_i3c_hci_pci *hci)
 {
 	struct mipi_i3c_hci_pci_cell_data *data __free(kfree) = mipi_i3c_hci_pci_alloc(hci, data);
 	struct mfd_cell *cells __free(kfree) = mipi_i3c_hci_pci_alloc(hci, cells);
 	int irq = pci_irq_vector(hci->pci, 0);
-	int nr = hci->info->instance_count;
+	int nr = hci->instance_count;
 
 	if (!cells || !data)
 		return -ENOMEM;
@@ -450,6 +476,8 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
 
 	hci->info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;
 
+	hci->instance_count = hci->info->instance_count;
+
 	ret = hci->info->init ? hci->info->init(hci) : 0;
 	if (ret)
 		return ret;
-- 
2.53.0

