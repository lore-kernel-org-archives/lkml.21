Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795409400;
	b=3uPp21fW5PT2OWGqavhYP2hWWabnO/To6NNunsGgn6cQlZfhX5pPdMzi7XDxebFesgil
	 MLbQDp1P2JobsRUsgle4A4nwjcqSqjScwJrxD8UQCBNKrOk7jEvGKW+i+xE/JUgkALnwr
	 YdYxJfjXBRH4xny36Ahg2fdVP9W0KWJn2xH64vlgVSPgeehc7Dxjy5W402rZjwREFjK9F
	 hYcFbe0H+G4A1yNkKPOonbWNXQKsKYU9VFUcLPGysaTe2HpfnNZrwLQepYsv9boeKShGn
	 0w28SIWp5RVQExPhohcCaiNwDs9wpfSKjYZ8XoIKGkEkO/q4CLXbaN/JRW7weW3fV1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795409400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=mcVAQvSshtK+GHxo4cqP4q2zx23yVTT2KxgtKEz/628=;
	b=1gEz5g1e5FNUQ35/r5RHWrnqKQ4PftUjae/dfYZ8YqeR6UtX43eaFYoKvVLWherWeKcl
	 cO9OHbEEawHN2hmFXuIc3NKszw0QZx4EEwO85F02AoWj1c8UwZS+0UBT0uF7tXVMEnVw+
	 Pk5nx387G+rdznsomm0uAAx+otDg1R0OAETJGZmHYBA4YN6aXkIYzc4AFGpBwohF9gB9t
	 uwjWxFbfowPPSRWY4DsS7nJPKs4uU/eRk8DFIwMZJa1MAbOmY6y9XwO8yhaLtvdxSUI6F
	 o5C7e5diD5JMJncf4S8v9dAZXbtcNaUDwni6pZH2PwC2pyvmfMOYZ9iplUMsdI8dPrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gnlfutTJ;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1A460A3813
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF1A460A3813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gnlfutTJ
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b427e5a37dso2236519a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795409399; x=1796014199; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mcVAQvSshtK+GHxo4cqP4q2zx23yVTT2KxgtKEz/628=;
        b=gnlfutTJgDsTYYqeoPmhsKFaiveLT25D3ShGnlMA/I2PwccZfWFKF3dx1zpp3u7SRT
         9TjMN+pTgt+oOoAemOxvaag7vivNIkfe8zsF5ep3eL03Mm2lvicxctmm9TXXYwgxjzpL
         ob3NTzH0FobAZz20GOwe9uAwKfJ5ifZ+MDm+GkWCO+ZWyUE30O9Pn6XWH6pxFDFKu8QO
         1maJHGJ0NQBzs/aJlkEZmoPXVFvNAR6NBpvqOXBqPpmKQVtuLj/h2+bdFq56w7DS4Xvt
         EpAdUYU5arTbUXQwcVXyvk5oBUkaW7tJif/63Gjsbv1owGt1SgrnL060fQtu671pTMMI
         /zwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795409399; x=1796014199;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mcVAQvSshtK+GHxo4cqP4q2zx23yVTT2KxgtKEz/628=;
        b=z26IGHgqq8VN66JfQgIC4zmkvgJp6KEfB3x14mJxD04L1ADZNIKCSurqMGKFnRuCnr
         dMBixENa6wVycu6VNmcVZpXJmE6WQR8RBYhkbBmc1spY+LzAheKg86znRp7hXPq/z6hy
         dC0U8a6D4YFxV1YmBT0pgFN+7kxTxRxR/ZWo9tkaGxSd1v0LPmctQx8xHkkmVple/MtZ
         QdcSI+YhaG8UawJoFfYNKR9mKhW6gONHY5YikfkAiXFvnctnDiO1mZnTfldpQZVzSIww
         LFAlSfoaK3eETnSCtO/fHtEbLlNOBaGtQf94f/7c/ePhBIsUb09fbOlFTy4W0CBmWjoG
         /MOw==
X-Forwarded-Encrypted: i=1; AL+hErFaSVjJ+IwJ76+KjcKfEh3c2D0HGPSF0F6E74zhEjxWCG13ZFwckwfJPQLZZOm0md6uiYUNnZOjoGfm4No=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JD/jtQaJgOnjW9KiWTLkoXpHdPbbJLv6K7f5lRpq1yN2RdVCF
	Yg+hs2jzDn+2OIisEaRkpLqndL0urOAULRfi2KIMI7KtYj6Ev2lKJHtoXRezI2erwBDO35/fZsD
	dZ6q28MIw0FnlHg==
X-Received: from pjbfz24.prod.google.com ([2002:a17:90b:258:b0:3b3:aa49:9102])
 (user=skhawaja job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3fc5:b0:3b1:93da:7e35 with SMTP id 98e67ed59e1d1-3b41c9006e1mr9461979a91.20.1795409399027;
 Sun, 22 Nov 2026 20:49:59 -0800 (PST)
Date: Mon, 23 Nov 2026 04:49:40 +0000
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
Message-ID: <20261123044949.3610702-10-skhawaja@google.com>
Subject: [PATCH v8 09/18] iommu: Add APIs to get iommu and device restored state
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

The restored state of the device, domain and IOMMU needs to be fetched
during boot in the next kernel. Add APIs that can be used to fetch the
restored state of a device, domain and IOMMU. The APIs will only be used
after liveupdate so no locking needed.

Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/liveupdate.c       | 88 ++++++++++++++++++++++++++++++++
 include/linux/iommu-liveupdate.h | 70 +++++++++++++++++++++++++
 2 files changed, 158 insertions(+)

diff --git a/drivers/iommu/liveupdate.c b/drivers/iommu/liveupdate.c
index 06234f9c604b..2c5da375f07f 100644
--- a/drivers/iommu/liveupdate.c
+++ b/drivers/iommu/liveupdate.c
@@ -61,6 +61,14 @@ struct iommu_ser_set {
 	u64 *head_pa;
 };
 
+/* Iterate over the serialized objects of a set, skipping the deleted ones */
+#define iommu_ser_set_for_each(_set, _it, _obj)				\
+	for (kho_block_set_it_init(&(_it), &(_set)->bs);		\
+	     ((_obj) = kho_block_set_it_read_entry(&(_it)));)		\
+		if ((_obj)->hdr.flags & IOMMU_SER_FLAG_DELETED)		\
+			continue;					\
+		else
+
 struct iommu_flb_obj {
 	/* Protects the serialized state and the object sets */
 	struct mutex lock;
@@ -273,6 +281,86 @@ void iommu_liveupdate_unregister_flb(struct liveupdate_file_handler *handler)
 }
 EXPORT_SYMBOL_GPL(iommu_liveupdate_unregister_flb);
 
+/*
+ * iommu_liveupdate_flb_get_incoming() - Helper function to get FLB state
+ * @flb_objp: Pointer to get the restored FLB object
+ *
+ * Return: 0 if FLB state found and restored, error if no data found
+ */
+static int iommu_liveupdate_flb_get_incoming(struct iommu_flb_obj **flb_objp)
+{
+	int ret;
+
+	ret = liveupdate_flb_get_incoming(&iommu_flb, (void **)flb_objp);
+	if (ret == -ENODATA || ret == -ENOENT || ret == -EOPNOTSUPP)
+		return ret;
+
+	if (ret)
+		panic("Failed to restore IOMMU Live Update FLB\n");
+
+	return 0;
+}
+
+/**
+ * iommu_for_each_restored_device() - Iterate on restored devices
+ * @fn: Iterator function to call for each restored device
+ * @arg: Argument to pass to iterator function
+ *
+ * Return: 0 on success, or an error.
+ */
+int iommu_for_each_restored_device(iommu_restored_device_iter_fn fn,
+				   void *arg)
+{
+	struct iommu_device_ser *device_ser;
+	struct iommu_flb_obj *flb_obj;
+	struct kho_block_set_it it;
+	int ret;
+
+	ret = iommu_liveupdate_flb_get_incoming(&flb_obj);
+	if (ret)
+		return ret;
+
+	iommu_ser_set_for_each(&flb_obj->device_set, it, device_ser) {
+		ret = fn(device_ser, arg);
+		if (ret)
+			break;
+	}
+
+	liveupdate_flb_put_incoming(&iommu_flb);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(iommu_for_each_restored_device);
+
+/**
+ * iommu_get_restored_state() - Get restored state of an IOMMU HW
+ * @token: Token used to preserve this IOMMU HW
+ * @type: IOMMU type in preserved state
+ *
+ * Gets the preserved state of an IOMMU HW using token and the IOMMU type.
+ *
+ * Return: struct iommu_hw_ser on success, NULL if no preserved state found.
+ */
+struct iommu_hw_ser *iommu_get_restored_state(u64 token, enum iommu_type_ser type)
+{
+	struct iommu_hw_ser *iommu_ser;
+	struct iommu_flb_obj *flb_obj;
+	struct kho_block_set_it it;
+	int ret;
+
+	ret = iommu_liveupdate_flb_get_incoming(&flb_obj);
+	if (ret)
+		return NULL;
+
+	iommu_ser_set_for_each(&flb_obj->iommu_set, it, iommu_ser) {
+		if (iommu_ser->token == token && iommu_ser->type == type)
+			break;
+	}
+
+	liveupdate_flb_put_incoming(&iommu_flb);
+	return iommu_ser;
+}
+EXPORT_SYMBOL_GPL(iommu_get_restored_state);
+
 /**
  * iommu_preserve_domain() - Preserve an IOMMU domain across live update
  * @domain: Domain to preserve
diff --git a/include/linux/iommu-liveupdate.h b/include/linux/iommu-liveupdate.h
index 2d49885b9fcd..fb1e8efac8ec 100644
--- a/include/linux/iommu-liveupdate.h
+++ b/include/linux/iommu-liveupdate.h
@@ -13,6 +13,16 @@
 #include <linux/liveupdate.h>
 #include <linux/kho/abi/iommu.h>
 
+/**
+ * iommu_restored_device_iter_fn - Callback for iterating restored devices
+ * @ser: Pointer to serialized device state
+ * @arg: User-defined context argument
+ *
+ * Return: 0 to continue iteration, or a negative error code to abort.
+ */
+typedef int (*iommu_restored_device_iter_fn)(struct iommu_device_ser *ser,
+					     void *arg);
+
 #ifdef CONFIG_IOMMU_LIVEUPDATE
 int iommu_liveupdate_register_flb(struct liveupdate_file_handler *handler);
 void iommu_liveupdate_unregister_flb(struct liveupdate_file_handler *handler);
@@ -52,6 +62,46 @@ static inline void *dev_iommu_preserved_state(struct device *dev)
 	return NULL;
 }
 
+/**
+ * iommu_domain_restored_state() - Get restored state of an IOMMU domain
+ * @domain: Pointer to struct iommu_domain to get restored state of.
+ *
+ * Return: Pointer to restored state on success, NULL on error.
+ */
+static inline void *iommu_domain_restored_state(struct iommu_domain *domain)
+{
+	struct iommu_domain_ser *ser;
+
+	ser = domain->domain_ser;
+	if (ser && (ser->hdr.flags & IOMMU_SER_FLAG_INCOMING))
+		return ser;
+
+	return NULL;
+}
+
+/**
+ * dev_iommu_restored_state() - Get restored state of a device
+ * @dev: Target device
+ *
+ * Return: Restored state pointer or NULL.
+ */
+static inline void *dev_iommu_restored_state(struct device *dev)
+{
+	struct iommu_device_ser *ser;
+
+	if (!dev->iommu)
+		return NULL;
+
+	ser = READ_ONCE(dev->iommu->device_ser);
+	if (ser && (ser->hdr.flags & IOMMU_SER_FLAG_INCOMING))
+		return ser;
+
+	return NULL;
+}
+
+int iommu_for_each_restored_device(iommu_restored_device_iter_fn fn,
+				   void *arg);
+struct iommu_hw_ser *iommu_get_restored_state(u64 token, enum iommu_type_ser type);
 int iommu_preserve_domain(struct iommu_domain *domain, struct iommu_domain_ser **ser);
 void iommu_unpreserve_domain(struct iommu_domain *domain);
 int iommu_preserve_device(struct iommu_domain *domain,
@@ -88,6 +138,26 @@ static inline void *dev_iommu_preserved_state(struct device *dev)
 	return NULL;
 }
 
+static inline void *dev_iommu_restored_state(struct device *dev)
+{
+	return NULL;
+}
+
+static inline void *iommu_domain_restored_state(struct iommu_domain *domain)
+{
+	return NULL;
+}
+
+static inline int iommu_for_each_restored_device(iommu_restored_device_iter_fn fn, void *arg)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline struct iommu_hw_ser *iommu_get_restored_state(u64 token, enum iommu_type_ser type)
+{
+	return NULL;
+}
+
 static inline int iommu_preserve_domain(struct iommu_domain *domain, struct iommu_domain_ser **ser)
 {
 	return -EOPNOTSUPP;
-- 
2.56.1.809.ga0b61035b5-goog

