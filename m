Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795409404;
	b=pt6lOLb02TxRAZJy5ACz93XvnYY/9HV9z5fwvKcaG60rsMe9nVgHraF5mihIaE12ShRU
	 cmT+W+rGVJ3rVk1bl1MDJFjPyRRMrfcQDAKNgGs5oKR/f/soTg2NTpSHpoDiyrHA7CIQo
	 ZhAPqrt1z6xNBZLRN5Iqm2FjAbvALw1lJEOtNTOyLtMhKrowWJQlI6dcIN/gmPy6t+7nv
	 EmnhS9MOec2u6nF/MPIbTqGqaXEu01i6o/fkDiGpvYTce9F8VWVjAPmT19Si8HvT8pc+w
	 /Xvj1WcJpo9ijCnBohDSEPsTeBNp8FKf6ynjwpBaEgSI1PwHehZfuyrouHLlHGD6vnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795409404;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=yg/KRlw/V2MQ/sD342ulB7AO28VSZsdYlNxvULrEbAA=;
	b=dbxTRS6wIvVUXNjbenGD0jx7xTEoappVAHPjvIP88xYF86JJnjslqAH6dJ0CJ28r8tPY
	 vp870o6wAt/48UJPg5m4Ib95YTJdsbnGRUU0iYl6StGF+PnC2tLbmvMC7if51PLU2iB82
	 kQG7Y2Au5j2P+eV6Nz9ws8UXB5U8LCc65uGd9B3fmIG6f5rxypkuidRrQNsWYEL5ubMWf
	 0yrctQQKWv6sUgiFOhrMAn7qOx9ol0GdqEYvirFZBTxSdVQp87+zoNlWxfN10rxJJ7UOf
	 WEZtjFoBwHAXTaB2Peg8YQ5SLQMn0BFMWrphAjGaPyvTaPWZMZvHeI7XDohSwVSi3UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=g4w7F7hZ;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11F660A6F55
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:50:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F11F660A6F55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=g4w7F7hZ
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae7faf4ff7so3582443a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795409403; x=1796014203; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yg/KRlw/V2MQ/sD342ulB7AO28VSZsdYlNxvULrEbAA=;
        b=g4w7F7hZU262sDcfP0OfVQsUgKsu8yHDZQbTmDBS+yT/phrBYi3JoQs9EotdswIjg8
         jp8im7SL9ysOmnXu2TZBXgYEDqaiqFZqGBeEwY8aLp9qoX0Qa41u26+4RkIzBQI2FZpY
         vWaVvfBwp1wcGHVkk4FAf0SxVsxe+8Yvx1tqF3UpV9lCI9rmp8FUiqVcp2rWrAjLEGVa
         rAa2I5RDaEunxZSnvdDAjlMkcvsClEYG+Vv/M/0W7WcDYzU8lqzWWW+oT5Ot7Laif3sc
         RdrkTVrlphzsVXjCpZQZz5SRrP7A6HkCQhU0gVCAkM0vIzOdSaB5Ijkp9HrwF5gh3dcv
         bQEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795409403; x=1796014203;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yg/KRlw/V2MQ/sD342ulB7AO28VSZsdYlNxvULrEbAA=;
        b=YHpsM1QCZAxOuvEUtA3nDt93MDhsBnFVWY9iBMqlAuF6esmv5+3APXcxRUl2GN7kXM
         2yOcKrahhC2HsaKeypKBLCP8AAVGH/N66M1YmtiSsqwmLAprNdAyQMMIgVD0uhskoqvH
         xa/D6XPDYbL7NdCBpgu7t+tgKXqz9mMgdWAzsA/UUL/XiPHICpmyvvi4mpzlooktCzhh
         GXKCu1nJim82eIIqeIa9guPADXBHWXTEIapTGVZqqlcsh621DSRf5ZMgnm6p/apI5ASn
         pWt+cmplLRyTml7n6B3C3Ixw+E0x8soXPXGLqi+IbIDeTH568XJxqPbSeqW6oTydLxvj
         xREQ==
X-Forwarded-Encrypted: i=1; AL+hErFAbSO00XTAIyFMR5sQIRKbrfMDlcCxpYTrSWqckVhhCqTJi96ClamnxGKnfrFZeHrdzl7jcpQ8hqRjW54=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EEknmaWf8z2vmlnDC63j6R4BVQKQzLki5oM5CBysyKp1Ac4IN
	QKOTR572ag/N2Ll9o6zfEXfuWvyD7X4t0PKAkVhZwE+Lwz0v94HxAPKeSM0a8uyEd4W8rpBO1vm
	wuDHHPRn6xx/2+A==
X-Received: from pjzv20.prod.google.com ([2002:a17:90b:414:b0:3b4:2a5f:97bc])
 (user=skhawaja job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:560f:b0:3b4:60aa:9b74 with SMTP id 98e67ed59e1d1-3b460aaa7efmr4371271a91.65.1795409403328;
 Sun, 22 Nov 2026 20:50:03 -0800 (PST)
Date: Mon, 23 Nov 2026 04:49:45 +0000
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
Message-ID: <20261123044949.3610702-15-skhawaja@google.com>
Subject: [PATCH v8 14/18] iommu/vt-d: Handle reattach of the restored domain
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

Reattach the restored domain to the preserved device using restored
domain ID. While reattaching do not setup the context and PASID entries
as those are preserved during liveupdate.

Note that in this phase nothing clears IOMMU_SER_FLAG_INCOMING of the
restored domain or the restored state of the device, so the restored
domain cannot be replaced yet. Replacing it is left to a later phase.

Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
---
 drivers/iommu/intel/iommu.c      |  36 ++++++-
 drivers/iommu/intel/iommu.h      |  20 ++++
 drivers/iommu/intel/liveupdate.c | 170 +++++++++++++++++++++++++++++++
 3 files changed, 224 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index a487b6ca0415..3b31d0962e33 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -3174,6 +3174,25 @@ intel_iommu_domain_alloc_second_stage(struct device *dev,
 	return &dmar_domain->domain;
 }
 
+/*
+ * A restored device translates through the preserved page table, so use the
+ * stage of its preserved RID_PASID entry. The stage allocators reject flags
+ * that the stage doesn't support.
+ */
+static struct iommu_domain *
+intel_iommu_domain_alloc_restored(struct device *dev, struct intel_iommu *iommu,
+				  u32 flags)
+{
+	switch (intel_iommu_restored_pgtt(dev)) {
+	case PASID_ENTRY_PGTT_FL_ONLY:
+		return intel_iommu_domain_alloc_first_stage(dev, iommu, flags);
+	case PASID_ENTRY_PGTT_SL_ONLY:
+		return intel_iommu_domain_alloc_second_stage(dev, iommu, flags);
+	default:
+		return ERR_PTR(-EINVAL);
+	}
+}
+
 static struct iommu_domain *
 intel_iommu_domain_alloc_paging_flags(struct device *dev, u32 flags,
 				      const struct iommu_user_data *user_data)
@@ -3185,6 +3204,9 @@ intel_iommu_domain_alloc_paging_flags(struct device *dev, u32 flags,
 	if (user_data)
 		return ERR_PTR(-EOPNOTSUPP);
 
+	if (dev_iommu_restored_state(dev))
+		return intel_iommu_domain_alloc_restored(dev, iommu, flags);
+
 	/* Prefer first stage if possible by default. */
 	domain = intel_iommu_domain_alloc_first_stage(dev, iommu, flags);
 	if (domain != ERR_PTR(-EOPNOTSUPP))
@@ -3325,6 +3347,9 @@ static int intel_iommu_attach_device(struct iommu_domain *domain,
 {
 	int ret;
 
+	if (dev_iommu_restored_state(dev))
+		return intel_iommu_attach_restored_device(domain, dev);
+
 	device_block_translation(dev);
 
 	ret = paging_domain_compatible(domain, dev);
@@ -3568,16 +3593,23 @@ static void intel_iommu_release_device(struct device *dev)
 		info->pasid_enabled = 0;
 	}
 
+	if (dev_iommu_restored_state(dev))
+		intel_iommu_detach_restored_device(dev);
+
 	mutex_lock(&iommu->iopf_lock);
 	if (dev_is_pci(dev) && pci_ats_supported(to_pci_dev(dev)))
 		device_rbtree_remove(info);
 	mutex_unlock(&iommu->iopf_lock);
 
-	if (sm_supported(iommu) && !dev_is_real_dma_subdevice(dev) &&
+	if (!dev_iommu_restored_state(dev) && sm_supported(iommu) &&
+	    !dev_is_real_dma_subdevice(dev) &&
 	    !context_copied(iommu, info->bus, info->devfn))
 		intel_pasid_teardown_sm_context(dev);
 
-	intel_pasid_free_table(dev);
+	if (!dev_iommu_restored_state(dev))
+		intel_pasid_free_table(dev);
+	else
+		kfree(info->pasid_table);
 	intel_iommu_debugfs_remove_dev(info);
 	kfree(info);
 }
diff --git a/drivers/iommu/intel/iommu.h b/drivers/iommu/intel/iommu.h
index 633747672c22..7e397eed391a 100644
--- a/drivers/iommu/intel/iommu.h
+++ b/drivers/iommu/intel/iommu.h
@@ -1322,6 +1322,10 @@ void intel_iommu_shutdown_preserved(struct dmar_drhd_unit *drhd);
 void intel_iommu_liveupdate_restore_root_table(struct intel_iommu *iommu,
 					       struct iommu_hw_ser *iommu_ser);
 void intel_iommu_handle_drhd_restore_failure(struct intel_iommu *iommu);
+int intel_iommu_attach_restored_device(struct iommu_domain *domain,
+				       struct device *dev);
+int intel_iommu_detach_restored_device(struct device *dev);
+u16 intel_iommu_restored_pgtt(struct device *dev);
 #else
 static inline void intel_iommu_shutdown_preserved(struct dmar_drhd_unit *drhd)
 {
@@ -1335,6 +1339,22 @@ static inline void intel_iommu_liveupdate_restore_root_table(struct intel_iommu
 static inline void intel_iommu_handle_drhd_restore_failure(struct intel_iommu *iommu)
 {
 }
+
+static inline int intel_iommu_attach_restored_device(struct iommu_domain *domain,
+						     struct device *dev)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int intel_iommu_detach_restored_device(struct device *dev)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline u16 intel_iommu_restored_pgtt(struct device *dev)
+{
+	return 0;
+}
 #endif
 
 #ifdef CONFIG_INTEL_IOMMU_SVM
diff --git a/drivers/iommu/intel/liveupdate.c b/drivers/iommu/intel/liveupdate.c
index 34651698b8e9..f907e52576e5 100644
--- a/drivers/iommu/intel/liveupdate.c
+++ b/drivers/iommu/intel/liveupdate.c
@@ -444,6 +444,176 @@ void intel_iommu_handle_drhd_restore_failure(struct intel_iommu *iommu)
 		      iommu->name);
 }
 
+static void domain_detach_restored_iommu(struct dmar_domain *domain,
+					 struct intel_iommu *iommu)
+{
+	struct iommu_domain_info *info;
+
+	/*
+	 * Unlike domain_detach_iommu(), the restored domain ID is not freed
+	 * here. A restored device can be removed and probed again while its
+	 * preserved context and PASID entries still use this domain ID, so it
+	 * stays reserved. Once iommufd reclaims the restored domain, the
+	 * normal detach path frees it.
+	 */
+	guard(mutex)(&iommu->did_lock);
+	info = xa_load(&domain->iommu_array, iommu->seq_id);
+	if (--info->refcnt == 0) {
+		xa_erase(&domain->iommu_array, iommu->seq_id);
+		kfree(info);
+	}
+}
+
+static int domain_attach_restored_iommu(struct dmar_domain *domain,
+					struct intel_iommu *iommu,
+					struct iommu_device_ser *device_ser)
+{
+	struct iommu_domain_info *info, *curr;
+	struct iommu_domain_ser *domain_ser;
+	struct iommu_hw_ser *iommu_hw_ser;
+	int restored_did;
+	int ret;
+
+	if (!iommu_domain_restored_state(&domain->domain))
+		return -EINVAL;
+
+	if (!device_ser->attachment.domain_phys ||
+	    !device_ser->iommu_phys)
+		return -EINVAL;
+
+	domain_ser = phys_to_virt(device_ser->attachment.domain_phys);
+	if (domain_ser->restored_domain != &domain->domain)
+		return -EINVAL;
+
+	iommu_hw_ser = phys_to_virt(device_ser->iommu_phys);
+	if (iommu_hw_ser->type != IOMMU_SER_TYPE_INTEL ||
+	    iommu_hw_ser->intel.phys_addr != iommu->reg_phys)
+		return -EINVAL;
+
+	restored_did = device_ser->attachment.attachment_id;
+	if (!ida_exists(&iommu->domain_ida, restored_did))
+		return -EINVAL;
+
+	info = kzalloc_obj(*info);
+	if (!info)
+		return -ENOMEM;
+
+	guard(mutex)(&iommu->did_lock);
+	curr = xa_load(&domain->iommu_array, iommu->seq_id);
+	if (curr) {
+		kfree(info);
+		if (WARN_ON(curr->did != restored_did))
+			return -EINVAL;
+
+		curr->refcnt++;
+		return 0;
+	}
+
+	info->refcnt	= 1;
+	info->did	= restored_did;
+	info->iommu	= iommu;
+	curr = xa_cmpxchg(&domain->iommu_array, iommu->seq_id,
+			  NULL, info, GFP_KERNEL);
+	if (curr) {
+		ret = xa_err(curr) ? : -EBUSY;
+		goto err_unlock;
+	}
+
+	return 0;
+
+err_unlock:
+	kfree(info);
+	return ret;
+}
+
+/**
+ * intel_iommu_attach_restored_device() - Restore device domain attachment after live update
+ * @domain: Restored domain
+ * @dev: Restored device
+ *
+ * Return: 0 on success, or negative error code.
+ */
+int intel_iommu_attach_restored_device(struct iommu_domain *domain,
+				       struct device *dev)
+{
+	struct iommu_device_ser *device_ser = dev_iommu_restored_state(dev);
+	struct device_domain_info *info = dev_iommu_priv_get(dev);
+	struct dmar_domain *dmar_domain = to_dmar_domain(domain);
+	struct intel_iommu *iommu = info->iommu;
+	unsigned long flags;
+	int ret;
+
+	if (!device_ser)
+		return -EINVAL;
+
+	ret = domain_attach_restored_iommu(dmar_domain, iommu, device_ser);
+	if (ret)
+		return ret;
+
+	info->domain = dmar_domain;
+	info->domain_attached = true;
+	spin_lock_irqsave(&dmar_domain->lock, flags);
+	list_add(&info->link, &dmar_domain->devices);
+	spin_unlock_irqrestore(&dmar_domain->lock, flags);
+
+	return 0;
+}
+
+int intel_iommu_detach_restored_device(struct device *dev)
+{
+	struct device_domain_info *info = dev_iommu_priv_get(dev);
+	struct intel_iommu *iommu = info->iommu;
+	struct iommu_domain *domain;
+	unsigned long flags;
+
+	if (!info->domain_attached || !info->domain)
+		return -EINVAL;
+
+	domain = &info->domain->domain;
+	if (!iommu_domain_restored_state(domain))
+		return -EINVAL;
+
+	info->domain_attached = false;
+
+	spin_lock_irqsave(&info->domain->lock, flags);
+	list_del(&info->link);
+	spin_unlock_irqrestore(&info->domain->lock, flags);
+
+	domain_detach_restored_iommu(info->domain, iommu);
+	info->domain = NULL;
+
+	return 0;
+}
+
+/**
+ * intel_iommu_restored_pgtt() - Get the translation type of a restored device
+ * @dev: Restored device
+ *
+ * Return: PGTT of the preserved RID_PASID entry of @dev, or 0 if the entry is
+ * not present. Without a preserved PASID table the IOMMU is in legacy mode,
+ * which only supports second stage, so PASID_ENTRY_PGTT_SL_ONLY is returned.
+ */
+u16 intel_iommu_restored_pgtt(struct device *dev)
+{
+	struct iommu_device_ser *ser = dev_iommu_restored_state(dev);
+	struct pasid_entry *table, *pte;
+	struct pasid_dir_entry *dir;
+
+	if (!ser->intel.pasid_table)
+		return PASID_ENTRY_PGTT_SL_ONLY;
+
+	dir = phys_to_virt(ser->intel.pasid_table);
+	table = get_pasid_table_from_pde(&dir[IOMMU_NO_PASID >> PASID_PDE_SHIFT]);
+	if (!table)
+		return 0;
+
+	pte = &table[IOMMU_NO_PASID & PASID_PTE_MASK];
+	if (!pasid_pte_is_present(pte))
+		return 0;
+
+	return pasid_pte_get_pgtt(pte);
+}
+
 enum pasid_lu_op {
 	PASID_LU_OP_PRESERVE = 1,
 	PASID_LU_OP_UNPRESERVE,
-- 
2.56.1.809.ga0b61035b5-goog

