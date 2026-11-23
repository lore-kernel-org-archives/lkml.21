Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795409396;
	b=NoYjxl+VsEdViiES5vR+IMLuh23H/AQt1+WOctFF5j/DHtvBHTmvrvftdkR47EDrGioH
	 dFzVRVOmt0ftNXijqcuFUO6vdoY8+JxG9MVnMbGKMDzZPaytHubjQgaq30VdC1+aNFu2X
	 busADNp8iVHgcmXQfai1GgVHswHY4hG1iyToOXzfCIxehHyILrWUipNQUu/Lwz3dNTx/W
	 rSDKgfWXylGHUcX6vAHluekulTXR4PrY7y7J9yrW0YWFG6jIqiv/G0rkKHrhRkv3EVjaw
	 uEGq23dsYWVsq52XbpsD/j6D+ybpY3kh6khG5nLNmcT9NHcZPpQSQpMzX2chHAfwYGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795409396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Z8BQO3KrgykwRtgGi0Q1dGoj+G3A1sp7JKxsrHaGsP4=;
	b=k5ZZdZiUwWKsGRvMnFJY+mXY/DCWnsBy9Gtvq1hR3Nu9CkBwjUTWsNm5o4cINM4Gsopz
	 kmH3ARnMrmRqmkDcXWYF2CUccHAy8amhsHcqaEAj3cisSbe4L41/mtWAjFdhTpHsoHjVC
	 PQYKnCf2J9WqemhR/PU/GVHymKzevZZDSkatLZkWMS1aZWQM9hMKMYjj2w8Tv5ZXJ1jB3
	 QqmV4DlMO58Hz4Xo2cksl6DWit/j+sWoNornlsKYiky4ldElyeEqBAjlOLO8UzXCk2bnN
	 n+LJukduB8rAPDibwYbfezk879p2GOJ6iEcBLG16n7bHWrMZR4sw18UanVmfquBxQjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BFBYjWDy;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8CD60A2600
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:49:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B8CD60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BFBYjWDy
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f053f95aadso21629545ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795409396; x=1796014196; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z8BQO3KrgykwRtgGi0Q1dGoj+G3A1sp7JKxsrHaGsP4=;
        b=BFBYjWDyNCMAZ4eabi/KLvr2pVa5tUBLFFu4ZWnbnLFYC1ThzbtmzCvOp4xJDFpfSL
         JHMpVsZJDrA4tabv64d4VTY3TVNQyEW+DxWAL2VIlxIa6847glgodhiruAzOe6fCnKvH
         XbVl8R6XKrXiQdJ03TV2QgaKaxBrO+W17gJYAWWZMHsAWGVgmL/HbqjB5qtVaNxRIjYe
         5EO8dLawtpqN+JFGMAoH2DMk+xqoQlQSGNvJoyZHIEF76E2Nucng2/ytvUniqNqZ/JYv
         Gl4/sT4kGrG0iKbgBimDVJnj9OQ1dEoe356z3Cfm1DLhneABjqEk6h+mWwxwZvcrTuA3
         SDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795409396; x=1796014196;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z8BQO3KrgykwRtgGi0Q1dGoj+G3A1sp7JKxsrHaGsP4=;
        b=X3qh+hFufHNLpQBteJZV/djH5CIkVcx/iFM2U6gYnWC6YdHck2c3CwLMPW1cmZB/8V
         Sp4fn4p6vI6szccYQUi1rSTLWkbAZuUaEaYQb9ezAXD3IOy8YDMn/2nuaeAb2zrfH3Fq
         ct6sS5iVVdoYx0wSE9KVBW/XVCyEpOfJo33gAzror2XktucWHiJS5RYH3XgVb/bdB9iy
         70BgosQL9HLJpw5kaufSVsjMz1IIAg0+JzW04FBtcX79K1Y4iK503+4UKDZYG2bVZImj
         7w/+iQQWXgNGalKyBRgm1JNnyds+I8haL1QaGjqCo3+29Ych9GefUbGAszVWaSQ+kEFo
         3sFw==
X-Forwarded-Encrypted: i=1; AL+hErE4nTT6HKlMew9TU+iamwDDsvsTBfViOLVSQQF648oao7Ye6LsjCU0dTeeKnncxgksE8bfd1sMUXMmmu7A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0zIKRc12c01X1gdlDOjR4aruGWc0gbtNmdEiADyMAylwBtqjQ
	yQ1S29qBKY3xUCzGldc6aIAk8MzjChimm1UajqHvKrvNvOgI+6bKUoBKlj0bwzzDOJJMBENlDD/
	BzPxlklA8Jea0MA==
X-Received: from pla14.prod.google.com ([2002:a17:902:ffce:b0:2e8:44b9:5c18])
 (user=skhawaja job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:24b:b0:2e9:9bac:2e90 with SMTP id d9443c01a7336-2f03f1aa1d0mr89749225ad.65.1795409395769;
 Sun, 22 Nov 2026 20:49:55 -0800 (PST)
Date: Mon, 23 Nov 2026 04:49:36 +0000
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
Message-ID: <20261123044949.3610702-6-skhawaja@google.com>
Subject: [PATCH v8 05/18] iommu: Implement IOMMU domain preservation
From: Samiullah Khawaja <skhawaja@google.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	David Woodhouse <dwmw2@infradead.org>
Cc: Samiullah Khawaja <skhawaja@google.com>, Pranjal Shrivastava <praan@google.com>, 
	Robin Murphy <robin.murphy@arm.com>, Kevin Tian <kevin.tian@intel.com>, 
	Alex Williamson <alex@shazbot.org>, Shuah Khan <shuah@kernel.org>, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Pratyush Yadav <pratyush@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	David Matlack <dmatlack@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vipin Sharma <vipinsh@google.com>, Ankit Soni <Ankit.Soni@amd.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, John Starks <dev@jstarks.net>
Content-Type: text/plain; charset="UTF-8"

Add IOMMU domain preserve and unpreserve APIs that can be used to
preserve an IOMMU domain across liveupdate. These APIs use the iommupt
preserve and unpreserve ops of the domain to perform the respective live
update operations.

Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/liveupdate.c       | 119 +++++++++++++++++++++++++++++++
 include/linux/iommu-liveupdate.h |  11 +++
 include/linux/iommu.h            |   5 ++
 3 files changed, 135 insertions(+)

diff --git a/drivers/iommu/liveupdate.c b/drivers/iommu/liveupdate.c
index a1f40e242d93..a98f16d11727 100644
--- a/drivers/iommu/liveupdate.c
+++ b/drivers/iommu/liveupdate.c
@@ -37,6 +37,7 @@
 #define pr_fmt(fmt)    "iommu: liveupdate: " fmt
 
 #include <linux/errno.h>
+#include <linux/generic_pt/iommu.h>
 #include <linux/iommu-liveupdate.h>
 #include <linux/iommu.h>
 #include <linux/kexec_handover.h>
@@ -67,6 +68,35 @@ struct iommu_flb_obj {
 	struct iommu_ser_set device_set;
 };
 
+/*
+ * Reserve a new serialized object at the end of the set. The deleted objects
+ * are not reused, so the objects never move and can be referenced by their
+ * physical address.
+ */
+static void *iommu_ser_set_alloc(struct iommu_ser_set *set)
+{
+	struct iommu_hdr_ser *hdr;
+	int ret;
+
+	ret = kho_block_set_grow(&set->bs, set->count + 1);
+	if (ret)
+		return ERR_PTR(ret);
+
+	if (!set->count)
+		kho_block_set_it_init(&set->it, &set->bs);
+
+	hdr = kho_block_set_it_reserve_entry(&set->it);
+	if (WARN_ON_ONCE(!hdr))
+		return ERR_PTR(-ENOSPC);
+
+	set->count++;
+	*set->head_pa = kho_block_set_head_pa(&set->bs);
+
+	hdr->ref_count = 1;
+	hdr->size = set->bs.entry_size;
+	return hdr;
+}
+
 /*
  * Restore a set of serialized objects from the previous kernel. The objects
  * are read using the size recorded by the previous kernel in their header.
@@ -239,3 +269,92 @@ void iommu_liveupdate_unregister_flb(struct liveupdate_file_handler *handler)
 	liveupdate_unregister_flb(handler, &iommu_flb);
 }
 EXPORT_SYMBOL_GPL(iommu_liveupdate_unregister_flb);
+
+/**
+ * iommu_preserve_domain() - Preserve an IOMMU domain across live update
+ * @domain: Domain to preserve
+ * @ser: Pointer to receive the virtual serialized domain state handle
+ *
+ * Return: 0 on success, or negative error code.
+ */
+int iommu_preserve_domain(struct iommu_domain *domain, struct iommu_domain_ser **ser)
+{
+	struct pt_iommu *pt = iommupt_from_domain(domain);
+	struct iommu_domain_ser *domain_ser;
+	struct iommu_flb_obj *flb_obj;
+	int ret;
+
+	if (!pt || !pt->ops->preserve || !pt->ops->unpreserve)
+		return -EOPNOTSUPP;
+
+	ret = liveupdate_flb_get_outgoing(&iommu_flb, (void **)&flb_obj);
+	if (ret)
+		return ret;
+
+	mutex_lock(&flb_obj->lock);
+	if (domain->domain_ser) {
+		ret = -EBUSY;
+		goto out_unlock;
+	}
+
+	domain_ser = iommu_ser_set_alloc(&flb_obj->domain_set);
+	if (IS_ERR(domain_ser)) {
+		ret = PTR_ERR(domain_ser);
+		goto out_unlock;
+	}
+
+	ret = pt->ops->preserve(pt, domain_ser);
+	if (ret) {
+		domain_ser->hdr.flags |= IOMMU_SER_FLAG_DELETED;
+		goto out_unlock;
+	}
+
+	domain->domain_ser = domain_ser;
+	*ser = domain_ser;
+	ret = 0;
+out_unlock:
+	mutex_unlock(&flb_obj->lock);
+	liveupdate_flb_put_outgoing(&iommu_flb);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(iommu_preserve_domain);
+
+/**
+ * iommu_unpreserve_domain() - Unpreserve a preserved IOMMU domain
+ * @domain: Domain to unpreserve
+ */
+void iommu_unpreserve_domain(struct iommu_domain *domain)
+{
+	struct pt_iommu *pt = iommupt_from_domain(domain);
+	struct iommu_domain_ser *domain_ser;
+	struct iommu_flb_obj *flb_obj;
+	int ret;
+
+	if (WARN_ON(!pt || !pt->ops->unpreserve))
+		return;
+
+	ret = liveupdate_flb_get_outgoing(&iommu_flb, (void **)&flb_obj);
+	if (WARN_ON(ret))
+		return;
+
+	mutex_lock(&flb_obj->lock);
+	if (!domain->domain_ser)
+		goto out_unlock;
+
+	/*
+	 * There is no check for attached devices here. The correctness relies
+	 * on the Live Update Orchestrator's session lifecycle. All resources
+	 * (iommufd, vfio devices) are preserved within a single session. If the
+	 * session is torn down, the .unpreserve callbacks for all files will be
+	 * invoked, ensuring a consistent cleanup without needing explicit
+	 * refcounting for the serialized objects here.
+	 */
+	domain_ser = domain->domain_ser;
+	pt->ops->unpreserve(pt, domain_ser);
+	domain_ser->hdr.flags |= IOMMU_SER_FLAG_DELETED;
+	domain->domain_ser = NULL;
+out_unlock:
+	mutex_unlock(&flb_obj->lock);
+	liveupdate_flb_put_outgoing(&iommu_flb);
+}
+EXPORT_SYMBOL_GPL(iommu_unpreserve_domain);
diff --git a/include/linux/iommu-liveupdate.h b/include/linux/iommu-liveupdate.h
index 4755ab3cd67a..caa9778eee2d 100644
--- a/include/linux/iommu-liveupdate.h
+++ b/include/linux/iommu-liveupdate.h
@@ -15,6 +15,8 @@
 #ifdef CONFIG_IOMMU_LIVEUPDATE
 int iommu_liveupdate_register_flb(struct liveupdate_file_handler *handler);
 void iommu_liveupdate_unregister_flb(struct liveupdate_file_handler *handler);
+int iommu_preserve_domain(struct iommu_domain *domain, struct iommu_domain_ser **ser);
+void iommu_unpreserve_domain(struct iommu_domain *domain);
 #else
 static inline int iommu_liveupdate_register_flb(struct liveupdate_file_handler *handler)
 {
@@ -24,5 +26,14 @@ static inline int iommu_liveupdate_register_flb(struct liveupdate_file_handler *
 static inline void iommu_liveupdate_unregister_flb(struct liveupdate_file_handler *handler)
 {
 }
+
+static inline int iommu_preserve_domain(struct iommu_domain *domain, struct iommu_domain_ser **ser)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline void iommu_unpreserve_domain(struct iommu_domain *domain)
+{
+}
 #endif
 #endif /* _LINUX_IOMMU_LIVEUPDATE_H */
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index ef5043752a36..77f78c88c627 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -14,6 +14,7 @@
 #include <linux/err.h>
 #include <linux/of.h>
 #include <linux/iova_bitmap.h>
+#include <linux/kho/abi/iommu.h>
 #include <uapi/linux/iommufd.h>
 
 #define IOMMU_READ	(1 << 0)
@@ -249,6 +250,10 @@ struct iommu_domain {
 			struct list_head next;
 		};
 	};
+
+#ifdef CONFIG_IOMMU_LIVEUPDATE
+	struct iommu_domain_ser *domain_ser;
+#endif
 };
 
 static inline bool iommu_is_dma_domain(struct iommu_domain *domain)
-- 
2.56.1.809.ga0b61035b5-goog

