Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795478352;
	b=lCnh7GsKAcIl/M+GjMmzg1gr+7TUldihhr9IHI/sDwbZ5azwwzjo7kPTNLcfEmavD0uY
	 bj//sViC3sXb6nYPsddMatqVf6TeuA1A9v9VXPxKOEO+6Fr+D/7YhvWRK/YcHnOqsNIbF
	 eVgnekHtfJ9pdg1264BIvSrH0tb+/UODf90T2qf54e3Rp/swc7ElsmipJkLoyDSHXrA76
	 oHeJo6o6NV1fFa74nIvbFAeJW6cLiCq67btGHkVSpSn3QbO9HgFKYGOBuuiyz/f2Gmalv
	 IFot+oL0k82tNm00jlUoMts2foH9PJ6jlHb4ouzXF4LQwj7jYk8Sugw8c8EEK244Kpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795478352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JPIzmh8MgAGzwbd/e1qtcX2ELMVKAJVPBlKusfiCnS0=;
	b=dU7vaFz8Tp6DfCvO3iWGcMN94XHekzH1CvzYWBUxzz6i7GlIOMV/apPmTsOSYNkViUQc
	 DxEQppYiO9dffKH8P8d9Cu59GrDM0Q/mybFV6SPfmC29LSk/lWY23A5AkcWfX9PmZSgwE
	 KDkjoNe3QJyBx+CLqv64t1vzNjF0bSybbCBahJFbH/NDTeZBks7nD3AmuqjZ7/cgUxWBs
	 NQMIe5TJVkqM4M+BuCl0OCjwcB09HrtopTijWUIdawFYFtMCBKh58gQiBB7HB6E6pbdYC
	 mtvjLnt8PduguX3/4mJ7g55pT/upk+3rdFsEk4wvBuVnpDwH9KecLFjVdn5kvoEZUSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ihd5XTrx;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D1D606A684
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38D1D606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ihd5XTrx
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso1819675f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795478349; x=1796083149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JPIzmh8MgAGzwbd/e1qtcX2ELMVKAJVPBlKusfiCnS0=;
        b=ihd5XTrxJPETqHH0T2zdVVTVWTiHMWwJRRFTWCgV9Su1m9S7wCJpK/GbB2TOsPjPID
         R9mNRn++nv6XjdWznxpHpwYgggGtvNKh7Jq7EbbxIPqTvR7EpByJYBvlJyF+MpDq85KJ
         Aaih13pQo5ae5iL8N0ZVZA0Tgq3xYKBlx0DQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795478349; x=1796083149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JPIzmh8MgAGzwbd/e1qtcX2ELMVKAJVPBlKusfiCnS0=;
        b=uq5qQ5LkfteGSMou7i8a9EW6krFTj6cmyHH8XBxrI3Bfq5PPBa/U71J98PZ7KVnn/h
         mJ77pw/xhPisyWj82/+SqfPrRytW2+r64KHxnqeeNk2pVfp1AQAQYf0TyC96DWdcrCj2
         lUtTiCX1bQTXi4Uhti4IrG8ojbV0tycvldIX37JwoVrt4lyTPZhzYq4+i3Ehp9uBSx+b
         92PcBX4GiErfkfneW2DEFQ87hzb/6qxMoh2nipP+1qXZHv3pVDhSE9J4Zp0iZ4W23ci8
         8mBjfVQhLBHH1YrZ7aVWpehQyK40eBMQDUppdERSKYTEUI/Px9oA07EtUXhLoPJGleqV
         VBWQ==
X-Forwarded-Encrypted: i=1; AL+hErFwR9s+3sIJMVmKm6UyPsz/P6lQmskRpUnc7xthCKHYfHx64GIVlm3DR90rNQ3ueTe38No3JkAsx2nhVaA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RiErORktMdIEbXiKBzE4QjDFPti6CDVOTCxvLBb5Nv6+xZ5fC
	5OhFXkeonMHbgZsV5PLAZDAJiIISCnsvjeb+7wKWHG5nmGYKAJqLaRFvSnGM5SNW2Q==
X-Gm-Gg: AZFdTZdFR+G27IzIClChMios64btsWwGE+1in1naEPwnNbbj7KyroivghUDu8HlaF+g
	BJHp4Facl4mx8ePVLMecTGizvPc5nrIHMuOfj7J3maxwK5zsCoLIAMh/Z6yAKsK724icthBT7Vw
	kKQk09hsh0cI0agQadQv54Shuyr7gBx+BHVg4Q+kEQWvQGogU7Q2U3+lnWXgw2cHHCcLK6QsrJj
	jTRjP4SSR0+7voGLYZP4svSfOfktAH8ax4qQeypAaw/RrJccSuQTDjTwcINFwEeVgyJDdXBQTmL
	ohGcmBoEcVBg8O04Kthq07ZhihZv7NVqRTMtF+PlGUI2YRnWDBYTUz6Z/UkQrq5xLtXziczJhl1
	3jvqkwN0fYd/3c+J8JX07isghAP1JkJnfjHsGXkn3uPZRESMyXXrRfpmmBgabOAvWV5sTZcw9kh
	1yc9t0IVlDuAzUZZDVeWdAyzE6uV35gnOfdATOO6qgNr31vi4c+h3pqUZ0Cd7lUFKeJaYcEi9aC
	qe0Y+EtziVrSAUqgzTB2JAezL0cIRpGyWALAgCu4jphjqaD/F36pXmDH6wjZxFBDz+Lv5BG0/3H
	Y2rQRLY+56xZs4XsNJeXL3/uXduYTTVFJyL+r7tVCB8Se0E3OlwY6NCDKeqdnBdvfO+Ka5D2v1o
	iivnR9mEINcD3pwfDGw==
X-Received: by 2002:a05:6000:2883:b0:4a4:39bb:970d with SMTP id ffacd0b85a97d-4abab02c469mr24709044f8f.2.1795478349545;
        Mon, 23 Nov 2026 15:59:09 -0800 (PST)
Received: from dmaluka.c.googlers.com.com (120.142.205.35.bc.googleusercontent.com. [35.205.142.120])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61e53asm25727068f8f.59.2026.11.23.15.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:59:08 -0800 (PST)
From: Dmytro Maluka <dmaluka@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lu Baolu <baolu.lu@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Dmitry Torokhov <dtor@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Bjorn Helgaas <helgaas@kernel.org>,
	iommu@lists.linux.dev,
	Jean-Philippe Brucker <jpb@kernel.org>,
	Joerg Roedel <joro@8bytes.org>,
	Joshua Peraza <jperaza@google.com>,
	Jesse Barnes <jsbarnes@google.com>,
	Len Brown <lenb@kernel.org>,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	"Oliver O'Halloran" <oohall@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rajat Jain <rajatja@google.com>,
	Rajat Jain <rajatxjain@gmail.com>,
	Will Deacon <will@kernel.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Vineeth Pillai <vineeth@bitbyteword.org>,
	Aashish Sharma <aashish@aashishsharma.net>,
	Grzegorz Jaszczyk <jaszczyk@chromium.org>,
	Tomasz Nowicki <tnowicki@google.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Dmytro Maluka <dmaluka@chromium.org>
Subject: [PATCH v11 2/2] PCI: Rename pci_dev->untrusted to pci_dev->requires_dma_protection
Date: Mon, 23 Nov 2026 23:58:29 +0000
Message-ID: <20261123235845.564027-3-dmaluka@chromium.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
In-Reply-To: <20261123235845.564027-1-dmaluka@chromium.org>
References: <20261123235845.564027-1-dmaluka@chromium.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rajat Jain <rajatja@google.com>

Rename the field to make it more clear, that the device can execute DMA
attacks on the system, and thus the system needs protection from such
attacks from this device.

No functional change intended.

Signed-off-by: Rajat Jain <rajatja@google.com>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: Joshua Peraza <jperaza@google.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Dmytro Maluka <dmaluka@chromium.org>
---
 drivers/iommu/amd/iommu.c   |  2 +-
 drivers/iommu/dma-iommu.c   | 16 ++++++++--------
 drivers/iommu/intel/iommu.c | 10 +++++-----
 drivers/iommu/iommu.c       |  5 ++---
 drivers/pci/ats.c           |  2 +-
 drivers/pci/pci-acpi.c      |  2 +-
 drivers/pci/pci.c           |  2 +-
 drivers/pci/probe.c         | 10 +++++-----
 drivers/pci/quirks.c        |  4 ++--
 include/linux/pci.h         |  7 ++++---
 10 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 41ee4ad1dcf8..aa592a1e5298 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -3223,7 +3223,7 @@ static int amd_iommu_def_domain_type(struct device *dev)
 		return 0;
 
 	/* Always use DMA domain for untrusted device */
-	if (to_pci_dev(dev)->untrusted)
+	if (to_pci_dev(dev)->requires_dma_protection)
 		return IOMMU_DOMAIN_DMA;
 
 	/* Apply device specific quirks */
diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 78742aeba932..30f9d108897e 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -589,16 +589,16 @@ static int iova_reserve_iommu_regions(struct device *dev,
 	return ret;
 }
 
-static bool dev_is_untrusted(struct device *dev)
+static bool dev_requires_dma_protection(struct device *dev)
 {
-	return dev_is_pci(dev) && to_pci_dev(dev)->untrusted;
+	return dev_is_pci(dev) && to_pci_dev(dev)->requires_dma_protection;
 }
 
 static bool dev_use_swiotlb(struct device *dev, size_t size,
 			    enum dma_data_direction dir)
 {
 	return IS_ENABLED(CONFIG_SWIOTLB) &&
-		(dev_is_untrusted(dev) ||
+		(dev_requires_dma_protection(dev) ||
 		 dma_kmalloc_needs_bounce(dev, size, dir));
 }
 
@@ -611,7 +611,7 @@ static bool dev_use_sg_swiotlb(struct device *dev, struct scatterlist *sg,
 	if (!IS_ENABLED(CONFIG_SWIOTLB))
 		return false;
 
-	if (dev_is_untrusted(dev))
+	if (dev_requires_dma_protection(dev))
 		return true;
 
 	/*
@@ -1184,12 +1184,12 @@ static phys_addr_t iommu_dma_map_swiotlb(struct device *dev, phys_addr_t phys,
 				      &attrs);
 
 	/*
-	 * Untrusted devices should not see padding areas with random leftover
-	 * kernel data, so zero the pre- and post-padding.
+	 * Zero the pre- and post-padding to prevent exposing kernel data to devices
+	 * requiring DMA protection.
 	 * swiotlb_tbl_map_single() has initialized the bounce buffer proper to
 	 * the contents of the original memory buffer.
 	 */
-	if (phys != (phys_addr_t)DMA_MAPPING_ERROR && dev_is_untrusted(dev)) {
+	if (phys != (phys_addr_t)DMA_MAPPING_ERROR && dev_requires_dma_protection(dev)) {
 		size_t start, virt = (size_t)phys_to_virt(phys);
 
 		/* Pre-padding */
@@ -1790,7 +1790,7 @@ size_t iommu_dma_max_opt_mapping_size(void)
 
 size_t iommu_dma_max_mapping_size(struct device *dev)
 {
-	if (dev_is_untrusted(dev))
+	if (dev_requires_dma_protection(dev))
 		return swiotlb_max_mapping_size(dev);
 
 	return SIZE_MAX;
diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 5a2e705a2f2e..dd75b41f47ab 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -2625,7 +2625,7 @@ static void __init platform_optin_force_iommu(void)
 
 	/*
 	 * If Intel-IOMMU is disabled by default, we will apply identity
-	 * map for all devices except those marked as being untrusted.
+	 * map for all devices except those marked as requiring DMA protection.
 	 */
 	if (dmar_policy_off()) {
 		pr_info("Intel-IOMMU force enabled due to platform opt in\n");
@@ -3630,13 +3630,13 @@ static bool intel_iommu_is_attach_deferred(struct device *dev)
 }
 
 /*
- * Check that the device does not live on an external facing PCI port that is
- * marked as untrusted. Such devices should not be able to apply quirks and
- * thus not be able to bypass the IOMMU restrictions.
+ * Check that the device does not require DMA protection. Such devices should
+ * not be able to apply quirks and thus not be able to bypass the IOMMU
+ * restrictions.
  */
 static bool risky_device(struct pci_dev *pdev)
 {
-	if (pdev->untrusted) {
+	if (pdev->requires_dma_protection) {
 		pci_info(pdev,
 			 "Skipping IOMMU quirk for dev [%04X:%04X] on untrusted PCI link\n",
 			 pdev->vendor, pdev->device);
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index b486b8bbd1fc..e0bae0c94741 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1901,10 +1901,9 @@ static int iommu_get_default_domain_type(struct iommu_group *group,
 		driver_type = iommu_get_def_domain_type(group, gdev->dev,
 							driver_type);
 
-		if (dev_is_pci(gdev->dev) && to_pci_dev(gdev->dev)->untrusted) {
+		if (dev_is_pci(gdev->dev) && to_pci_dev(gdev->dev)->requires_dma_protection) {
 			/*
-			 * No ARM32 using systems will set untrusted, it cannot
-			 * work.
+			 * ARM32 systems don't support DMA protection.
 			 */
 			if (WARN_ON(IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)))
 				return -1;
diff --git a/drivers/pci/ats.c b/drivers/pci/ats.c
index 9cb23780093d..34e9147e52c7 100644
--- a/drivers/pci/ats.c
+++ b/drivers/pci/ats.c
@@ -40,7 +40,7 @@ void pci_ats_init(struct pci_dev *dev)
  */
 bool pci_ats_supported(struct pci_dev *dev)
 {
-	if (!dev->ats_cap || dev->untrusted)
+	if (!dev->ats_cap || dev->requires_dma_protection)
 		return false;
 
 	if (dev->is_virtfn)
diff --git a/drivers/pci/pci-acpi.c b/drivers/pci/pci-acpi.c
index 5971ffc2a375..f6b199a121bd 100644
--- a/drivers/pci/pci-acpi.c
+++ b/drivers/pci/pci-acpi.c
@@ -1454,7 +1454,7 @@ void pci_acpi_setup(struct device *dev, struct acpi_device *adev)
 
 	pci_acpi_optimize_delay(pci_dev, adev->handle);
 	pci_acpi_set_external_facing(pci_dev);
-	pci_dev->untrusted |= pci_dev_has_dma_property(pci_dev);
+	pci_dev->requires_dma_protection |= pci_dev_has_dma_property(pci_dev);
 	pci_acpi_add_edr_notifier(pci_dev);
 
 	pci_acpi_add_pm_notifier(adev, pci_dev);
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 7c6f2aba8144..a2246049cae7 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -1017,7 +1017,7 @@ static void pci_std_enable_acs(struct pci_dev *dev, struct pci_acs *caps)
 	caps->ctrl |= (dev->acs_capabilities & PCI_ACS_UF);
 
 	/* Enable Translation Blocking for external devices and noats */
-	if (pci_ats_disabled() || dev->external_facing || dev->untrusted)
+	if (pci_ats_disabled() || dev->external_facing || dev->requires_dma_protection)
 		caps->ctrl |= (dev->acs_capabilities & PCI_ACS_TB);
 }
 
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 9a178e0e5f7f..d69ac5a746fe 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -1738,7 +1738,7 @@ static void set_pcie_cxl(struct pci_dev *dev)
 
 }
 
-static void set_pcie_untrusted(struct pci_dev *dev)
+static void pci_set_requires_dma_protection(struct pci_dev *dev)
 {
 	struct pci_dev *parent = pci_upstream_bridge(dev);
 
@@ -1748,14 +1748,14 @@ static void set_pcie_untrusted(struct pci_dev *dev)
 	 * If the upstream bridge is untrusted we treat this device as
 	 * untrusted as well.
 	 */
-	if (parent->untrusted) {
-		dev->untrusted = true;
+	if (parent->requires_dma_protection) {
+		dev->requires_dma_protection = true;
 		return;
 	}
 
 	if (arch_pci_dev_is_removable(dev)) {
 		pci_dbg(dev, "marking as untrusted\n");
-		dev->untrusted = true;
+		dev->requires_dma_protection = true;
 	}
 }
 
@@ -2082,7 +2082,7 @@ int pci_setup_device(struct pci_dev *dev)
 
 	set_pcie_cxl(dev);
 
-	set_pcie_untrusted(dev);
+	pci_set_requires_dma_protection(dev);
 
 	/* "Unknown power state" */
 	dev->current_state = PCI_UNKNOWN;
diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 4a02fc80755d..e081b6ca1fc0 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -5526,7 +5526,7 @@ static void pci_quirk_enable_intel_rp_mpc_acs(struct pci_dev *dev)
  * PCI_ACS_SV | PCI_ACS_RR | PCI_ACS_CR | PCI_ACS_UF
  *
  * TODO: This quirk also needs to do equivalent of PCI_ACS_TB,
- * if dev->external_facing || dev->untrusted
+ * if dev->external_facing || dev->requires_dma_protection
  */
 static int pci_quirk_enable_intel_pch_acs(struct pci_dev *dev)
 {
@@ -5567,7 +5567,7 @@ static int pci_quirk_enable_intel_spt_pch_acs(struct pci_dev *dev)
 	ctrl |= (cap & PCI_ACS_CR);
 	ctrl |= (cap & PCI_ACS_UF);
 
-	if (pci_ats_disabled() || dev->external_facing || dev->untrusted)
+	if (pci_ats_disabled() || dev->external_facing || dev->requires_dma_protection)
 		ctrl |= (cap & PCI_ACS_TB);
 
 	pci_write_config_dword(dev, pos + INTEL_SPT_ACS_CTRL, ctrl);
diff --git a/include/linux/pci.h b/include/linux/pci.h
index aa3765a20a96..b3fb044c5a4b 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -491,13 +491,14 @@ struct pci_dev {
 	unsigned int	is_thunderbolt:1;	/* Thunderbolt controller */
 	unsigned int	is_cxl:1;               /* Compute Express Link (CXL) */
 	/*
-	 * Devices marked being untrusted are the ones that can potentially
-	 * execute DMA attacks and similar. They are typically connected
+	 * Devices marked with requires_dma_protection are the ones that can
+	 * potentially execute DMA attacks and similar. They are typically connected
 	 * through external ports such as Thunderbolt but not limited to
 	 * that. When an IOMMU is enabled they should be getting full
 	 * mappings to make sure they cannot access arbitrary memory.
 	 */
-	unsigned int	untrusted:1;
+	unsigned int	requires_dma_protection:1;
+
 	/*
 	 * Info from the platform, e.g., ACPI or device tree, may mark a
 	 * device as "external-facing".  An external-facing device is
-- 
2.56.1.831.g720f3f5937-goog

