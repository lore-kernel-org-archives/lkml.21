Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795409399;
	b=cz09nDVgr1Y829fVaq19FkuyZTBRYRW5U6rwiRZ4+RM6uWBns6QaCwmv4vBdb5Y+Ny40
	 GcVOxkDzi3yGef2a/vyfOv1Sw3FYAJSbSJFBTx3Zd3nCsfkHx52EiTWEzVESJqtuNPzBw
	 djHtFAkxdSJEOsIljJEZq2gQmWRzZTSbYYsTEm+V2nGaCjK0sCRZ7QCKFmic8xTHzPJBU
	 57v0aR8mCZjM14LTQ9nV05xZT9NmY4+PN2NWjKsmrT8uPN2sY6YZnp77VxCpCyDzdjt2v
	 V+iToZ67Qs3KnJveO/BXb/8Tgk+7cvxLzxf7o3sJ5wYtEz1iTBB2NG/iICDDmkViYaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795409399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=f4Ufo6TzuQo+4o8APbXdbrHv+9kKEzhVqRPJyGBlCA8=;
	b=Elm+0kbjs0/++Kf8sL5lFP1/akXazv5NJJJHFd5Bp6zplshktPhL61COuzvUzJebauFT
	 5KUvs0AmrdgKC6PSUeWPMMfSTjIL0e55tXmSm814aiYi1KEerDk7nQtcEyHEQBdvNdyj2
	 oEXZl02fG8tLWxBPiAW4soZn1w0oRB3O5aHKpzxOvUIq6JhSh24bPW9orqQ5X512Eg4R0
	 crQ/7vFefwvBQkHTIuV3oWAtiPC+5ZcKw9cGOcQcGK6tdXg+JfVO5xo/ix2Pq9goji4M+
	 Me8EQ0/LFK8UZXryTnvmpOXkniN6LQbrzVXc759vYsxjgoPDvvDjsuVmrKlcdBWDVvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZzQzUkyl;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2629C60A3803
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2629C60A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZzQzUkyl
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f04561ee04so16640165ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795409399; x=1796014199; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f4Ufo6TzuQo+4o8APbXdbrHv+9kKEzhVqRPJyGBlCA8=;
        b=ZzQzUkyl0lS1ShKI7fxR75FkgCsyaKjRzCBNDLWz/gc3Diw2akqUbv906t9o+AVRpM
         PkYWrEIAzF7AjUxFAyH1urPmB2c34KdCrlecYabmombzGuhujFuCz1uOW3zBwVqiIdIl
         WfJs64+OOzWKGOoAlqTKVkddIZqZccJ3yi2A3JgEFWBLINxCfz349Awy3TQrfZZTaccq
         l5JbKMooeHjmGlXwPYBEYE0WcqR1r/v/G8kOgskzzrGBj3yG8LXh2NOMiP8LY4rpGkec
         OOLAYLCOLCKZxyqUNzs9hn5ZVQuY427Xmbd94cbeuoowHLaFPcEv18CJH/de2N7sWvkp
         sJJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795409399; x=1796014199;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f4Ufo6TzuQo+4o8APbXdbrHv+9kKEzhVqRPJyGBlCA8=;
        b=kuZqDOn0VUbuWFZyBzBrguwOr92OJYqVac/nEeuSb2Yfc5lMEMr42AkXCd5gSxNM1E
         1tWCYKRDE7IMQpONA0Xrudfx3PDTMWnDCVc8vI55XxeVhZ5OADEUtI2Jz5Z8Ugj6flM5
         MmeHBs3+eH5zMpR0xE0wgDwo+wTgv7V3RTCpoTmhYEp+itbjPbq+jcvjiEb+s4yHkVIf
         oB0zHQmkV7mhMX2n/TMBKHwl95TKhQkfGxshq4AJAyIN+yfnCGIfUC5QboQLsASQBZVe
         8a2Ljr1SaDlyM/EBLt0pae+MsKDyV0rcwy1OJzK20UiNiiLd1sUHL/l5If0ToSZ4Puwc
         35fw==
X-Forwarded-Encrypted: i=1; AL+hErHUdMzBWU0n2xNHgZqco7t/6+6x70fRgNRA7ObKM+r1DURjzzKuVQFsiZ8lg1krW7/PpqViLTMBPZ305yY=@vger.kernel.org
X-Gm-Message-State: APuU4Z89+H87KnWt9qC8yiN+gWG1GhHRXU2KaFrson60eNaHBTrayL3m
	4kv6zxqTW2x8IfQsVhoL6zuTCgIf5iqw3dPUvy5kKbANk1++4cOXGXitV+nh7WHAFoUtVpAT+DS
	RknF/3KlNAuijaQ==
X-Received: from plgb9.prod.google.com ([2002:a17:902:d509:b0:2e8:1aeb:b4c9])
 (user=skhawaja job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:26cf:b0:2ef:ef72:493b with SMTP id d9443c01a7336-2f03f1c3d70mr101039835ad.54.1795409398311;
 Sun, 22 Nov 2026 20:49:58 -0800 (PST)
Date: Mon, 23 Nov 2026 04:49:39 +0000
In-Reply-To: <20261123044949.3610702-1-skhawaja@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261123044949.3610702-1-skhawaja@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261123044949.3610702-9-skhawaja@google.com>
Subject: [PATCH v8 08/18] iommu/vt-d: Clear unpreserved context entries during shutdown
From: Samiullah Khawaja <skhawaja@google.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	David Woodhouse <dwmw2@infradead.org>
Cc: Samiullah Khawaja <skhawaja@google.com>, Robin Murphy <robin.murphy@arm.com>, 
	Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Pratyush Yadav <pratyush@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	David Matlack <dmatlack@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Pranjal Shrivastava <praan@google.com>, Vipin Sharma <vipinsh@google.com>, Ankit Soni <Ankit.Soni@amd.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, John Starks <dev@jstarks.net>
Content-Type: text/plain; charset="UTF-8"

During normal shutdown the iommu translation is disabled. Since the root
table is preserved during live update, it needs to be cleaned up and the
context entries of the unpreserved devices and root entries for the
unpreserved context tables need to be cleared.

This is required because during kexec reboot and shutdown the devices do
not go through the release flow, so there might be stale entries in the
root table and context tables. Also note that new unpreserved context
tables for unpreserved devices might have been added after preservation,
so the root table entries for unpreserved context tables also need to be
removed.

Only the translation state of the preserved IOMMU is preserved. The next
kernel sets up its own invalidation queue and fault and page request
interrupts, so disable the invalidation queue and mask these interrupts
during shutdown.

Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel/iommu.c      |  15 ++-
 drivers/iommu/intel/iommu.h      |   5 +
 drivers/iommu/intel/liveupdate.c | 166 +++++++++++++++++++++++++++++++
 3 files changed, 184 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 14bd1ca4fbd5..d31d2d5845e6 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -1967,6 +1967,14 @@ static int iommu_suspend(void *data)
 
 	iommu_flush_all();
 
+	/*
+	 * Note that IOMMU suspend doesn't affect live update. The state
+	 * preserved during live update is not released and remains valid during
+	 * suspend and reused during IOMMU resume.
+	 *
+	 * Also note deployment of suspend/resume and live updated use case
+	 * should be mostly mutually exclusive.
+	 */
 	for_each_active_iommu(iommu, drhd) {
 		iommu_disable_translation(iommu);
 
@@ -2512,8 +2520,11 @@ void intel_iommu_shutdown(void)
 		/* Disable PMRs explicitly here. */
 		iommu_disable_protect_mem_regions(iommu);
 
-		/* Make sure the IOMMUs are switched off */
-		iommu_disable_translation(iommu);
+		/* Make sure the IOMMUs are switched off if not preserved. */
+		if (iommu_preserved_state(&iommu->iommu))
+			intel_iommu_shutdown_preserved(drhd);
+		else
+			iommu_disable_translation(iommu);
 	}
 }
 
diff --git a/drivers/iommu/intel/iommu.h b/drivers/iommu/intel/iommu.h
index a6c0ed55db30..92697346c44b 100644
--- a/drivers/iommu/intel/iommu.h
+++ b/drivers/iommu/intel/iommu.h
@@ -1316,6 +1316,11 @@ int intel_iommu_preserve(struct iommu_device *iommu,
 			 struct iommu_hw_ser *iommu_ser);
 void intel_iommu_unpreserve(struct iommu_device *iommu,
 			    struct iommu_hw_ser *iommu_ser);
+void intel_iommu_shutdown_preserved(struct dmar_drhd_unit *drhd);
+#else
+static inline void intel_iommu_shutdown_preserved(struct dmar_drhd_unit *drhd)
+{
+}
 #endif
 
 #ifdef CONFIG_INTEL_IOMMU_SVM
diff --git a/drivers/iommu/intel/liveupdate.c b/drivers/iommu/intel/liveupdate.c
index 4f5fc0d227ba..c0c121bc3ea5 100644
--- a/drivers/iommu/intel/liveupdate.c
+++ b/drivers/iommu/intel/liveupdate.c
@@ -82,6 +82,172 @@ static int preserve_context_table(struct intel_iommu *iommu,
 	return 0;
 }
 
+static void clear_unpreserved_context_root_entries(struct intel_iommu *iommu,
+						   struct iommu_hw_ser *ser)
+{
+	struct root_entry *root;
+	int i;
+
+	/*
+	 * Individual invalidations for each context table removal are not
+	 * needed as we issue global invalidations later.
+	 */
+	for (i = 0; i < ROOT_ENTRY_NR; i++) {
+		root = &iommu->root_entry[i];
+
+		if (!is_context_table_preserved(iommu, ser, i, 0) && (root->lo & 1)) {
+			root->lo = 0;
+			__iommu_flush_cache(iommu,
+					    &root->lo,
+					    sizeof(root->lo));
+		}
+
+		if (!sm_supported(iommu))
+			continue;
+
+		if (!is_context_table_preserved(iommu, ser, i, 0x80) && (root->hi & 1)) {
+			root->hi = 0;
+			__iommu_flush_cache(iommu,
+					    &root->hi,
+					    sizeof(root->hi));
+		}
+	}
+}
+
+static void clear_unpreserved_context(struct intel_iommu *iommu, u8 bus, u8 devfn)
+{
+	struct context_entry *context;
+
+	/*
+	 * This cleanup is done during shutdown, so it should be fine to only
+	 * clear the entries here and issue one global invalidation later to
+	 * invalidate all cleared entries.
+	 *
+	 * Note that the device IOTLB invalidation for unpreserved devices is
+	 * skipped this way. This matches the normal kexec reboot, where the
+	 * IOMMU translation is disabled without invalidating the device IOTLBs,
+	 * and the unpreserved devices go through the same flow in the next
+	 * kernel as they do after a normal kexec reboot. Issuing device IOTLB
+	 * invalidations this late during shutdown could also cause invalidation
+	 * timeouts, as drivers might have moved devices to a low power state,
+	 * and would add to the shutdown time.
+	 *
+	 * The iommu lock is not needed as the context tables are never removed
+	 * and the new ones are not added during shutdown.
+	 */
+	context = iommu_context_addr(iommu, bus, devfn, 0);
+	if (context) {
+		/*
+		 * Individual invalidations are not needed as we issue global
+		 * invalidations later once all the cleanups are done.
+		 */
+		context_clear_present(context);
+		__iommu_flush_cache(iommu, context, sizeof(*context));
+		context_clear_entry(context);
+		__iommu_flush_cache(iommu, context, sizeof(*context));
+	}
+}
+
+static int clear_unpreserved_alias_cb(struct pci_dev *pdev, u16 alias, void *data)
+{
+	struct intel_iommu *iommu = data;
+
+	clear_unpreserved_context(iommu, PCI_BUS_NUM(alias), alias & 0xff);
+	return 0;
+}
+
+static void intel_iommu_mask_interrupts(struct intel_iommu *iommu)
+{
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&iommu->register_lock, flags);
+	writel(DMA_FECTL_IM, iommu->reg + DMAR_FECTL_REG);
+	readl(iommu->reg + DMAR_FECTL_REG);
+	if (ecap_prs(iommu->ecap)) {
+		writel(DMA_FECTL_IM, iommu->reg + DMAR_PECTL_REG);
+		readl(iommu->reg + DMAR_PECTL_REG);
+	}
+	raw_spin_unlock_irqrestore(&iommu->register_lock, flags);
+}
+
+/**
+ * intel_iommu_shutdown_preserved() - Shut down a preserved IOMMU before kexec
+ * @drhd: Target DMAR unit
+ *
+ * Clear the context entries of unpreserved devices, and stop the hardware from
+ * using the invalidation queue and interrupts of this kernel. Translation is
+ * left enabled for the preserved devices.
+ */
+void intel_iommu_shutdown_preserved(struct dmar_drhd_unit *drhd)
+{
+	struct intel_iommu *iommu = drhd->iommu;
+	struct pci_dev *pdev = NULL;
+	struct device *tmp;
+	int i;
+
+	/*
+	 * Clear context entries for unpreserved devices because during kexec
+	 * reboot and shutdown the devices do not go through the release flow,
+	 * so there might be stale entries in the root table and context tables.
+	 */
+	for_each_pci_dev(pdev) {
+		struct device *dev = &pdev->dev;
+
+		if (!dev->iommu || dev->iommu->iommu_dev != &iommu->iommu)
+			continue;
+
+		if (dev_iommu_preserved_state(dev))
+			continue;
+
+		pci_for_each_dma_alias(pdev, clear_unpreserved_alias_cb, iommu);
+	}
+
+	/*
+	 * device_lookup_iommu() only accepts non-PCI devices through ACPI
+	 * namespace device scope entries, using the scope bus/devfn. Only PCI
+	 * devices can be preserved, so clear all of these.
+	 */
+	rcu_read_lock();
+	for_each_active_dev_scope(drhd->devices, drhd->devices_cnt, i, tmp) {
+		if (!dev_is_pci(tmp))
+			clear_unpreserved_context(iommu, drhd->devices[i].bus,
+						  drhd->devices[i].devfn);
+	}
+	rcu_read_unlock();
+
+	/*
+	 * New unpreserved context tables for unpreserved devices might have
+	 * been added after preservation, so the root table entries for
+	 * unpreserved context tables need to be removed.
+	 */
+	clear_unpreserved_context_root_entries(iommu,
+					       iommu_preserved_state(&iommu->iommu));
+
+	/*
+	 * Some devices might not have teardown/detached properly depending on
+	 * whether a proper device remove is done before kexec is triggered.
+	 * Also unpreserved context tables and entries are removed during
+	 * shutdown. So issue global invalidations to remove references to
+	 * unpreserved tables and entries.
+	 */
+	iommu->flush.flush_context(iommu, 0, 0, 0, DMA_CCMD_GLOBAL_INVL);
+	if (sm_supported(iommu))
+		qi_flush_pasid_cache(iommu, 0, QI_PC_GLOBAL, 0);
+	iommu->flush.flush_iotlb(iommu, 0, 0, 0, DMA_TLB_GLOBAL_FLUSH);
+
+	/*
+	 * Only the translation state is preserved. The next kernel sets up its
+	 * own invalidation queue, page request queue and fault interrupts, so
+	 * stop the hardware from using the ones of this kernel. This must be
+	 * done after the above invalidations, as they use the invalidation
+	 * queue. Page requests can't be disabled at the IOMMU level while
+	 * translation is enabled, but PRI is not enabled for the preserved
+	 * devices.
+	 */
+	dmar_disable_qi(iommu);
+	intel_iommu_mask_interrupts(iommu);
+}
+
 static void unpreserve_iommu_context_tables(struct intel_iommu *iommu,
 					    struct iommu_hw_ser *ser)
 {
-- 
2.56.1.809.ga0b61035b5-goog

