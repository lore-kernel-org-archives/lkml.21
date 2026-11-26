Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795726701;
	b=NqzYpv1ruev03LBhn8R7CSUMN7bctyJXU02kURoNwtLlB9p9Nt4TpJ4UoG6u3qZLVx4u
	 wiDj8hniBPgjg9saavyD1I8Fqya9LGughM3fYjtHpDweOcaNERa8eOlzsNu5i+03UYe6R
	 qiTomNHLvBcJStBN//SPWhMZwK0SA02HOrzWl8h9Rcc5RbxKAZKkCVBDE7+Cq3YLK0EL2
	 5i6FQztJku93coeI6Ea8yKq7Yrgb2gEl8CpJeaQnqulfr18Mq2ucbm3V6rW5sSsCeDoKb
	 ZkOZUo2nN6b0Onjhx2pW4zVJMO3LWLYyVjo9reOza3k+1LrsHbhvUC/1iYL+gcQBwhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795726701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=kV0hUNvNs9ijyHBK94PzpQomJGx8KIwtP4MMAKxXdxM=;
	b=hnbUkhBnQ0B8ZTuGIyutG6aDEF/ioLdGfQ7F5N7EzrnGeDOnQzEP2BL430IgO9CDOEog
	 a+UmxBY7qoCKz0RCVTNGd2Sr1NXEIu/O0GvnjN5dg/QrbZVP2oLI3nJ+WfeTZID0y/goo
	 X6ylA9qu+QEBLb6KkSGTCBPSE9kQV2/oiqQ29q3nU/vgFcnQ6L+7KCEqmX4c9Bw5S9Zv5
	 TwdEwW82FwnCTEw0HmMgm9sQ93LHPgm9q/lwXe0k3Yz3IIWyzO+QHTdLbtK2eFp9+XR1Y
	 W0IUnlVrrkdaX6mEZ/naSsSBhV1Sk+FD1hI16KozHVFw/T6P3jLGzCB4BpGOQlU27Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hzLK7SgZ;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65688606A33F
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 20:58:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65688606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hzLK7SgZ
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so63908135e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795726699; x=1796331499; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kV0hUNvNs9ijyHBK94PzpQomJGx8KIwtP4MMAKxXdxM=;
        b=hzLK7SgZoJjfgS2Vhs+kICEKwY9YcjuZRfIP8VghnJ1qcmc3LO4q8tXyXRUwV80sol
         cF1E8JtcU+NJIPnyjyL0kjrkP+Knnla8spLgN8vEpBoMmtj/iqhKkQKF6LyLTkTvtYK1
         b634t7M3tY74Zca2AielcqWJ5MY3GBBubEI8C6C2CJUxvxNWYWMcimm+CGgZljUyaLg4
         PdPylHKMQ+O1bdOd4IjNXlfr35wn24B40H3nfMbKS+/NQqqiWbNbpGL9AZQROiPbKsp4
         vKjgUGNW7mJjb6Zk/A69AF+fLJZOGngrPBtWnXkMAXyrkONTeAtvF4OoztCDDptIjXge
         H5Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795726699; x=1796331499;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kV0hUNvNs9ijyHBK94PzpQomJGx8KIwtP4MMAKxXdxM=;
        b=c6JBhmVPZRygrg7pw3E/oDS39jVKf715JVHFP2nrLyWP2rny/L8LDR0FgZxqi5YfEz
         wsXw3UTjdhBfzjHRAE4QsD8ocxnJOmtRj5zd6P1ScxW+DXmY+NxAooMgFUbRIqxK5Hva
         U9yCUpsiGlRLix3bqnfLQKKfNXQzLKz3E2mAcBdQkaWnb9Arwfya6IMuaJ2QNPVJHAOI
         qQYqDWEBttj6+w9d4YKXr1wWucLkkQHFET7KDmaqowGFm4kdu6weGeglthN/v9hq2JFF
         HqO29UMvHb8v7cZN6i47n5HLd4P1GR9JKpw8+CYvI5XjrUnK/FdKNnmrpN4h7KKnzhUR
         yzpg==
X-Forwarded-Encrypted: i=1; AL+hErHzaLxBgx0Nn1rdRsLexhi1/ujKHKym9+3Z/e/y9A4by3vOIkiLVYlWk3RvSG421Sw2FX9rJPdgISumWS0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Mme04e5P0P1ObpeJ31YzITodOc5e7/OEjT77BsGsplvH8z+Sd
	k728eASSLf702QDOKUydT9dAyBRKwZpzHj/y+wiiQNTAU5L92VDU2WLO
X-Gm-Gg: AZFdTZc3VT8JEMpt/PsaPpWSVjicLsQMIbf4ldMXyAj9sHZu6VafqpjIr1JXHXPwyXy
	QFQpXj4vxtRh85hI5mEWsTre3fGJPog60HqbO3zCxrQQTk6ONyS6ddg1xsoyb9EFcqGA3dOllgQ
	V0i2SlhsujrL5fT6NAz11yYfhIsP7yWkxQ9V1Wg+iyaGz8PbFZ09OuQAqbI9Rg8ddZxS6LDyOsN
	p2HdI/tTRtH1Q5tyz/m6osPbFRRB4eW8m13U3fWrrFwV5CJFBSANskKOKj3fQ97+0Q9v9YKE1aX
	DlNhtJF7wwKLE9Zrfgr7/tToUzwk6eDkR7ffJ4CEpkTVrg9k81rD3Rbk3QcZl7kVpQ6Kjapulfn
	QdZbtQuvBqvCxadrYjNtYbS0UsR8016Ucj918MLUw/AQmRYRPrH9ePHGKBSIUzixAbQf4TMTlIY
	/3U9rnGe66IgfNPH4IQO7SQ90vZsHB2IBRP6259ZE2cN2vcG9m/S6ZyGoslyhEvI9HXzgy8L2X9
	PBfxYCfrjtWy1xh5dCxzgzif+qSZDKXZURqPYA5MZM4tU1NlRdPuZrN7EU2PMEgTTeaWxkCM+J7
	CtDVnKsgwDYzADNZZG1MXRnHP/dtx/s+3i8iI9DP9omvpj/Bars+v+SHpxahTMopmD1Zbihqcmt
	8fPw=
X-Received: by 2002:a05:600c:1549:b0:4bb:6f45:2a77 with SMTP id 5b1f17b1804b1-4bb8880abf7mr427109255e9.11.1795726698570;
        Thu, 26 Nov 2026 12:58:18 -0800 (PST)
Received: from localhost (2001-1ae9-5b-ad10--33.ip6.tmcz.cz. [2001:1ae9:5b:ad10::33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399d52sm611178075e9.6.2026.11.26.12.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:58:18 -0800 (PST)
From: Arisa Snowbell <arisa.snowbell@gmail.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
	Arisa Snowbell <arisa.snowbell@gmail.com>,
	Matthew Brost <matthew.brost@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	Nareshkumar Gollakoti <naresh.kumar.g@intel.com>,
	Badal Nilawar <badal.nilawar@intel.com>,
	Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 3/5] drm/xe/huc: load the DG2 HuC through the GSC via mei_pxp
Date: Thu, 26 Nov 2026 21:57:55 +0100
Message-ID: <20261126205758.49845-4-arisa.snowbell@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126205758.49845-1-arisa.snowbell@gmail.com>
References: <20261126205758.49845-1-arisa.snowbell@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On DG2 the GSC both loads and authenticates the HuC. Register as the
I915_COMPONENT_PXP component, as i915 does, so mei_pxp hands us its ops,
and send PXP43 START_HUC_AUTH with the DPA of the firmware in VRAM through
gsc_command(), whose request and reply live in a VRAM page. Leaving the
GSC to mei keeps two drivers from driving the same hardware.

The load is asynchronous. It runs from a worker after every uC load
(probe, GT reset, resume) and when mei binds; a stop before a reset, a
suspend or an FLR waits for a running load and drops a pending one. Each
load gets a fence that signals when it succeeded, failed or stopped
waiting for mei. If mei_pxp does not bind within 10 s the HuC stays
unloaded and later loads stop waiting for it until it binds, as i915's
INTEL_HUC_DELAYED_LOAD_ERROR does.

As on i915, the GSC must be the one loading the HuC (GSC_LOADS_HUC), and
a missing mei module or a failed setup only leaves the HuC unloaded.

A GSC command that never returns still holds up a stop, as on i915; a
mei reset ends it. Video decode does not wait on it past the 10 s.

Nothing selects a DG2 HuC blob yet, so this changes nothing on its own.

Signed-off-by: Arisa Snowbell <arisa.snowbell@gmail.com>
---
 drivers/gpu/drm/xe/Makefile           |   1 +
 drivers/gpu/drm/xe/regs/xe_guc_regs.h |   3 +
 drivers/gpu/drm/xe/xe_huc.c           |  16 +-
 drivers/gpu/drm/xe/xe_huc_mei.c       | 569 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_huc_mei.h       |  21 +
 drivers/gpu/drm/xe/xe_huc_types.h     |  57 +++
 drivers/gpu/drm/xe/xe_uc.c            |   7 +
 7 files changed, 673 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_huc_mei.c
 create mode 100644 drivers/gpu/drm/xe/xe_huc_mei.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index ad3ab8097..a974055fe 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -81,6 +81,7 @@ xe-y += xe_bb.o \
 	xe_guc_tlb_inval.o \
 	xe_heci_gsc.o \
 	xe_huc.o \
+	xe_huc_mei.o \
 	xe_hw_engine.o \
 	xe_hw_engine_class_sysfs.o \
 	xe_hw_engine_group.o \
diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
index 5a8a67eb3..520e2a15b 100644
--- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
@@ -60,6 +60,9 @@
 #define   GUC_ENABLE_READ_CACHE_LOGIC		REG_BIT(1)
 #define   GUC_DISABLE_SRAM_INIT_TO_ZEROES	REG_BIT(0)
 
+#define GUC_SHIM_CONTROL2			XE_REG(0xc068)
+#define   GSC_LOADS_HUC				REG_BIT(30)
+
 #define SOFT_SCRATCH(n)				XE_REG(0xc180 + (n) * 4)
 #define SOFT_SCRATCH_COUNT			16
 
diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index c73e1acbd..0a2f0688e 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -19,6 +19,7 @@
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
 #include "xe_guc.h"
+#include "xe_huc_mei.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
 #include "xe_sriov.h"
@@ -91,7 +92,8 @@ int xe_huc_init(struct xe_huc *huc)
 	if (IS_SRIOV_VF(xe))
 		return 0;
 
-	if (huc->fw.has_gsc_headers) {
+	/* on DG2 the GSC loads the HuC through mei, not via GSCCS packets */
+	if (huc->fw.has_gsc_headers && xe->info.platform != XE_DG2) {
 		ret = huc_alloc_gsc_pkt(huc);
 		if (ret)
 			goto out;
@@ -122,6 +124,8 @@ int xe_huc_init_post_hwconfig(struct xe_huc *huc)
 	if (ret)
 		return ret;
 
+	xe_huc_mei_init(huc);
+
 	return 0;
 }
 
@@ -129,6 +133,11 @@ int xe_huc_upload(struct xe_huc *huc)
 {
 	if (!xe_uc_fw_is_loadable(&huc->fw))
 		return 0;
+
+	/* the GSC loads it from VRAM itself */
+	if (xe_huc_mei_is_used(huc))
+		return 0;
+
 	return xe_uc_fw_upload(&huc->fw, 0, HUC_UKERNEL);
 }
 
@@ -244,6 +253,11 @@ int xe_huc_auth(struct xe_huc *huc, enum xe_huc_auth_types type)
 	if (!xe_uc_fw_is_loadable(&huc->fw))
 		return 0;
 
+	if (xe_huc_mei_is_used(huc)) {
+		xe_huc_mei_start(huc);
+		return 0;
+	}
+
 	/* On newer platforms the HuC survives reset, so no need to re-auth */
 	if (xe_huc_is_authenticated(huc, type)) {
 		xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_RUNNING);
diff --git a/drivers/gpu/drm/xe/xe_huc_mei.c b/drivers/gpu/drm/xe/xe_huc_mei.c
new file mode 100644
index 000000000..595405c4a
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_huc_mei.c
@@ -0,0 +1,569 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2016-2022 Intel Corporation
+ * Copyright © 2026 Arisa Snowbell
+ */
+
+/*
+ * HuC load and authentication by the GSC, through mei (DG2).
+ *
+ * On DG2 the GSC both loads and authenticates the HuC. It is reached through
+ * the PXP client on HECI1, owned by mei; mei_pxp hands us its ops as an
+ * I915_COMPONENT_PXP component, as for i915 (intel_pxp_tee.c). Messages go
+ * through gsc_command(), which takes the request and the reply as a
+ * scatterlist in device memory.
+ *
+ * The load is asynchronous: mei binds some time after probe and again after
+ * every system resume, and the HuC is lost on every reset and suspend. While a
+ * load is pending, user submissions to the video decode engines wait for it on
+ * a fence, as on i915.
+ */
+
+#include <linux/component.h>
+#include <linux/dma-fence.h>
+#include <linux/scatterlist.h>
+#include <linux/slab.h>
+#include <linux/workqueue.h>
+
+#include <drm/drm_managed.h>
+#include <drm/intel/i915_component.h>
+#include <drm/intel/i915_pxp_tee_interface.h>
+
+#include "abi/gsc_pxp_commands_abi.h"
+#include "regs/xe_guc_regs.h"
+#include "xe_bo.h"
+#include "xe_device.h"
+#include "xe_force_wake.h"
+#include "xe_gt_printk.h"
+#include "xe_huc.h"
+#include "xe_huc_mei.h"
+#include "xe_map.h"
+#include "xe_mmio.h"
+#include "xe_pm.h"
+#include "xe_uc_fw.h"
+
+#define PXP43_CMDID_START_HUC_AUTH 0x0000003A /* DG2 */
+
+/* PXP-Input-Packet: HuC load and authentication */
+struct pxp43_start_huc_auth_in {
+	struct pxp_cmd_header header;
+	__le64 huc_base_address;
+} __packed;
+
+/*
+ * mei binds a few seconds after probe and re-binds after a system resume; past
+ * this, media runs without HuC and later loads stop waiting for mei.
+ */
+#define HUC_MEI_COMPONENT_TIMEOUT_MS 10000
+
+/* The GSC loads the whole binary before it flags the authentication */
+#define HUC_MEI_AUTH_TIMEOUT_US 1000000
+
+/* A safety net: the deadline above always settles a pending load first */
+#define HUC_MEI_SETTLE_TIMEOUT_MS 15000
+
+static struct xe_huc *mei_to_huc(struct xe_huc_mei *mei)
+{
+	return container_of(mei, struct xe_huc, mei);
+}
+
+static struct xe_gt *huc_to_gt(struct xe_huc *huc)
+{
+	return container_of(huc, struct xe_gt, uc.huc);
+}
+
+static struct xe_gt *mei_to_gt(struct xe_huc_mei *mei)
+{
+	return huc_to_gt(mei_to_huc(mei));
+}
+
+static const char *huc_mei_fence_driver_name(struct dma_fence *fence)
+{
+	return "xe";
+}
+
+static const char *huc_mei_fence_timeline_name(struct dma_fence *fence)
+{
+	return "huc_load";
+}
+
+static const struct dma_fence_ops huc_mei_fence_ops = {
+	.get_driver_name = huc_mei_fence_driver_name,
+	.get_timeline_name = huc_mei_fence_timeline_name,
+};
+
+/* Its own lock: users of the fence may outlive the device */
+struct huc_mei_fence {
+	struct dma_fence base;
+	spinlock_t lock; /* the lock of @base */
+};
+
+/* start() runs in the reset and resume paths, which must not wait on reclaim */
+static struct dma_fence *huc_mei_fence_create(struct xe_huc_mei *mei)
+{
+	struct huc_mei_fence *fence = kzalloc_obj(*fence, GFP_NOWAIT | __GFP_NOWARN);
+
+	if (!fence)
+		return NULL;
+
+	spin_lock_init(&fence->lock);
+	dma_fence_init(&fence->base, &huc_mei_fence_ops, &fence->lock,
+		       mei->fence_context, atomic64_inc_return(&mei->seqno));
+
+	return &fence->base;
+}
+
+/**
+ * xe_huc_mei_is_used() - whether the GSC loads this HuC through mei
+ * @huc: the HuC
+ *
+ * Return: true on DG2 once its HuC is set up to load through the GSC.
+ */
+bool xe_huc_mei_is_used(struct xe_huc *huc)
+{
+	return huc->mei.state != XE_HUC_MEI_UNUSED;
+}
+
+static u32 huc_mei_load_info(struct xe_gt *gt)
+{
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref.domains)
+		return 0;
+
+	return xe_mmio_read32(&gt->mmio, HUC_KERNEL_LOAD_INFO);
+}
+
+/* Ends the wait of the current load */
+static void huc_mei_settle_locked(struct xe_huc_mei *mei)
+{
+	lockdep_assert_held(&mei->state_lock);
+
+	if (mei->state != XE_HUC_MEI_LOADING)
+		return;
+
+	mei->state = XE_HUC_MEI_SETTLED;
+	if (mei->load)
+		dma_fence_signal(mei->load);
+	cancel_delayed_work(&mei->deadline);
+}
+
+static int huc_mei_send_auth(struct xe_huc *huc, struct i915_pxp_component *pxp)
+{
+	struct xe_gt *gt = huc_to_gt(huc);
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_bo *msg = huc->mei.msg;
+	struct pxp43_start_huc_auth_in in = {};
+	struct pxp43_huc_auth_out out = {};
+	struct scatterlist sg;
+	dma_addr_t huc_addr = xe_bo_main_addr(huc->fw.bo, PAGE_SIZE);
+	ssize_t ret;
+
+	in.header.api_version = PXP_APIVER(4, 3);
+	in.header.command_id = PXP43_CMDID_START_HUC_AUTH;
+	in.header.buffer_len = sizeof(in.huc_base_address);
+	in.huc_base_address = cpu_to_le64(huc_addr);
+
+	xe_map_memset(xe, &msg->vmap, 0, 0, PAGE_SIZE);
+	xe_map_memcpy_to(xe, &msg->vmap, 0, &in, sizeof(in));
+
+	/* the same page carries the request and the reply, as on i915 */
+	sg_init_table(&sg, 1);
+	sg.length = PAGE_SIZE;
+	sg_dma_address(&sg) = xe_bo_main_addr(msg, PAGE_SIZE);
+	sg_dma_len(&sg) = PAGE_SIZE;
+
+	xe_gt_dbg(gt, "HuC: asking the GSC to load %zu bytes at DPA %pad\n",
+		  xe_bo_size(huc->fw.bo), &huc_addr);
+
+	ret = pxp->ops->gsc_command(pxp->tee_dev, 0, 0, &sg, sizeof(in), &sg);
+	if (ret < 0) {
+		xe_gt_err(gt, "HuC: GSC command failed: %pe\n", ERR_PTR(ret));
+		return ret;
+	}
+	if (ret < (ssize_t)sizeof(out.header)) {
+		xe_gt_err(gt, "HuC: GSC reply too short: %zd bytes\n", ret);
+		return -EPROTO;
+	}
+
+	xe_map_memcpy_from(xe, &out, &msg->vmap, 0, sizeof(out));
+
+	/*
+	 * HuC can survive a shallow suspend, the GSC then refuses the load with
+	 * OP_NOT_PERMITTED; the status register check that follows still
+	 * catches a HuC that is not there.
+	 */
+	if (out.header.status != PXP_STATUS_SUCCESS &&
+	    out.header.status != PXP_STATUS_OP_NOT_PERMITTED) {
+		xe_gt_err(gt, "HuC: GSC refused the load: %#x\n", out.header.status);
+		return -EPROTO;
+	}
+
+	return 0;
+}
+
+static int huc_mei_load_and_auth(struct xe_huc *huc)
+{
+	struct xe_gt *gt = huc_to_gt(huc);
+	struct xe_huc_mei *mei = &huc->mei;
+	int ret;
+
+	if (huc_mei_load_info(gt) & HUC_LOAD_SUCCESSFUL)
+		return 0;
+
+	scoped_guard(mutex, &mei->lock) {
+		/* mei binds later; the bind queues this again */
+		if (!mei->pxp)
+			return -EAGAIN;
+
+		ret = huc_mei_send_auth(huc, mei->pxp);
+		if (ret)
+			return ret;
+	}
+
+	xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_TRANSFERRED);
+
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref.domains)
+		return -ETIMEDOUT;
+
+	ret = xe_mmio_wait32(&gt->mmio, HUC_KERNEL_LOAD_INFO, HUC_LOAD_SUCCESSFUL,
+			     HUC_LOAD_SUCCESSFUL, HUC_MEI_AUTH_TIMEOUT_US, NULL, false);
+	if (ret)
+		xe_gt_err(gt, "HuC: not authenticated after the GSC load, status %#x\n",
+			  xe_mmio_read32(&gt->mmio, HUC_KERNEL_LOAD_INFO));
+
+	return ret;
+}
+
+/*
+ * The work runs on a runtime PM reference its queuer took: suspend flushes it,
+ * so it must never resume the device itself.
+ */
+static void huc_mei_queue(struct xe_huc_mei *mei)
+{
+	struct xe_device *xe = gt_to_xe(mei_to_gt(mei));
+
+	xe_pm_runtime_get_noresume(xe);
+	if (!queue_work(system_dfl_wq, &mei->auth))
+		xe_pm_runtime_put(xe);
+}
+
+/* Drops a queued but not yet started load along with its reference */
+static void huc_mei_cancel(struct xe_huc_mei *mei)
+{
+	if (cancel_work_sync(&mei->auth))
+		xe_pm_runtime_put(gt_to_xe(mei_to_gt(mei)));
+	cancel_delayed_work_sync(&mei->deadline);
+}
+
+static bool huc_mei_gt_up(struct xe_huc_mei *mei)
+{
+	guard(spinlock_irqsave)(&mei->state_lock);
+
+	return mei->state == XE_HUC_MEI_LOADING || mei->state == XE_HUC_MEI_SETTLED;
+}
+
+static void huc_mei_auth_work(struct work_struct *work)
+{
+	struct xe_huc_mei *mei = container_of(work, struct xe_huc_mei, auth);
+	struct xe_huc *huc = mei_to_huc(mei);
+	struct xe_gt *gt = huc_to_gt(huc);
+	int ret;
+
+	guard(xe_pm_runtime_release_only)(gt_to_xe(gt));
+
+	/* stop() cancels this work before the GT goes down */
+	if (!huc_mei_gt_up(mei))
+		return;
+
+	ret = huc_mei_load_and_auth(huc);
+	if (ret == -EAGAIN)
+		return;
+
+	if (ret) {
+		xe_gt_err(gt, "HuC: load and authentication via GSC failed: %pe\n", ERR_PTR(ret));
+		xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_LOAD_FAIL);
+	} else {
+		if (!mei->announced)
+			xe_gt_info(gt, "HuC: authenticated via GSC (version %u.%u.%u)\n",
+				   huc->fw.versions.found[XE_UC_FW_VER_RELEASE].major,
+				   huc->fw.versions.found[XE_UC_FW_VER_RELEASE].minor,
+				   huc->fw.versions.found[XE_UC_FW_VER_RELEASE].patch);
+		mei->announced = true;
+		xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_RUNNING);
+	}
+
+	scoped_guard(spinlock_irqsave, &mei->state_lock)
+		huc_mei_settle_locked(mei);
+}
+
+static void huc_mei_deadline_work(struct work_struct *work)
+{
+	struct xe_huc_mei *mei = container_of(work, struct xe_huc_mei, deadline.work);
+	struct xe_gt *gt = mei_to_gt(mei);
+
+	/* not @mei->lock: a GSC command that never returns holds it */
+	guard(spinlock_irqsave)(&mei->state_lock);
+	if (mei->state != XE_HUC_MEI_LOADING)
+		return;
+
+	if (mei->bound) {
+		xe_gt_warn(gt, "HuC: the GSC load takes over %u ms, media no longer waits for it\n",
+			   HUC_MEI_COMPONENT_TIMEOUT_MS);
+	} else {
+		xe_gt_notice(gt, "HuC: no mei PXP component after %u ms (is mei_pxp loaded?), media runs without HuC until it binds\n",
+			     HUC_MEI_COMPONENT_TIMEOUT_MS);
+		mei->absent = true;
+	}
+	huc_mei_settle_locked(mei);
+}
+
+static int huc_mei_component_bind(struct device *xe_kdev, struct device *tee_kdev, void *data)
+{
+	struct xe_device *xe = kdev_to_xe_device(xe_kdev);
+	struct xe_huc_mei *mei = &xe_root_mmio_gt(xe)->uc.huc.mei;
+	struct i915_pxp_component *pxp = data;
+
+	scoped_guard(mutex, &mei->lock) {
+		mei->pxp = pxp;
+		mei->pxp->tee_dev = tee_kdev;
+	}
+
+	scoped_guard(spinlock_irqsave, &mei->state_lock) {
+		mei->bound = true;
+		mei->absent = false;
+	}
+
+	xe_gt_dbg(mei_to_gt(mei), "HuC: mei PXP component bound (%s)\n", dev_name(tee_kdev));
+
+	/* a suspended device loads the HuC when start() runs at resume */
+	if (!xe_pm_runtime_get_if_active(xe))
+		return 0;
+
+	if (huc_mei_gt_up(mei))
+		huc_mei_queue(mei);
+	xe_pm_runtime_put(xe);
+
+	return 0;
+}
+
+static void huc_mei_component_unbind(struct device *xe_kdev, struct device *tee_kdev, void *data)
+{
+	struct xe_device *xe = kdev_to_xe_device(xe_kdev);
+	struct xe_huc_mei *mei = &xe_root_mmio_gt(xe)->uc.huc.mei;
+
+	scoped_guard(spinlock_irqsave, &mei->state_lock)
+		mei->bound = false;
+
+	scoped_guard(mutex, &mei->lock)
+		mei->pxp = NULL;
+}
+
+static const struct component_ops huc_mei_component_ops = {
+	.bind = huc_mei_component_bind,
+	.unbind = huc_mei_component_unbind,
+};
+
+static void huc_mei_go_down(struct xe_huc_mei *mei)
+{
+	struct dma_fence *load;
+
+	scoped_guard(spinlock_irqsave, &mei->state_lock) {
+		huc_mei_settle_locked(mei);
+		mei->state = XE_HUC_MEI_DOWN;
+		load = mei->load;
+		mei->load = NULL;
+	}
+	dma_fence_put(load);
+}
+
+static void huc_mei_fini(void *arg)
+{
+	struct xe_huc_mei *mei = arg;
+
+	huc_mei_go_down(mei);
+	component_del(gt_to_xe(mei_to_gt(mei))->drm.dev, &huc_mei_component_ops);
+	huc_mei_cancel(mei);
+}
+
+/* The DG2 blob is parsed for the GSC, it has no image to DMA */
+static int huc_mei_check_mode(struct xe_huc *huc)
+{
+	struct xe_gt *gt = huc_to_gt(huc);
+
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
+	if (!fw_ref.domains)
+		return -ETIMEDOUT;
+
+	if (!(xe_mmio_read32(&gt->mmio, GUC_SHIM_CONTROL2) & GSC_LOADS_HUC)) {
+		xe_gt_err(gt, "HuC: HW in DMA mode, but the DG2 blob is GSC-only\n");
+		return -ENOEXEC;
+	}
+
+	return 0;
+}
+
+/**
+ * xe_huc_mei_init() - set up HuC loading through the GSC on DG2
+ * @huc: the HuC, its firmware already in VRAM
+ *
+ * A failure leaves the HuC unloaded and does not fail the probe.
+ */
+void xe_huc_mei_init(struct xe_huc *huc)
+{
+	struct xe_gt *gt = huc_to_gt(huc);
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_huc_mei *mei = &huc->mei;
+	struct xe_bo *bo;
+	int ret;
+
+	if (xe->info.platform != XE_DG2)
+		return;
+
+	if (!IS_ENABLED(CONFIG_INTEL_MEI_PXP) || !IS_ENABLED(CONFIG_INTEL_MEI_GSC)) {
+		xe_gt_notice(gt, "HuC: can't load without CONFIG_INTEL_MEI_PXP and CONFIG_INTEL_MEI_GSC\n");
+		xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_INIT_FAIL);
+		return;
+	}
+
+	ret = huc_mei_check_mode(huc);
+	if (ret)
+		goto fail;
+
+	ret = drmm_mutex_init(&xe->drm, &mei->lock);
+	if (ret)
+		goto fail;
+
+	spin_lock_init(&mei->state_lock);
+	mei->fence_context = dma_fence_context_alloc(1);
+	INIT_WORK(&mei->auth, huc_mei_auth_work);
+	INIT_DELAYED_WORK(&mei->deadline, huc_mei_deadline_work);
+
+	/* pinned VRAM BOs are contiguous; the GSC reads the page by its DPA */
+	bo = xe_managed_bo_create_pin_map(xe, tile, PAGE_SIZE, XE_BO_FLAG_VRAM_IF_DGFX(tile));
+	if (IS_ERR(bo)) {
+		ret = PTR_ERR(bo);
+		goto fail;
+	}
+	mei->msg = bo;
+	mei->state = XE_HUC_MEI_DOWN;
+
+	ret = component_add_typed(xe->drm.dev, &huc_mei_component_ops, I915_COMPONENT_PXP);
+	if (ret) {
+		mei->state = XE_HUC_MEI_UNUSED;
+		goto fail;
+	}
+
+	ret = devm_add_action_or_reset(xe->drm.dev, huc_mei_fini, mei);
+	if (ret) {
+		mei->state = XE_HUC_MEI_UNUSED;
+		goto fail;
+	}
+
+	return;
+
+fail:
+	xe_gt_err(gt, "HuC: can't load through the GSC: %pe\n", ERR_PTR(ret));
+	/* not loadable: no DMA upload or GuC auth of a GSC-only blob either */
+	xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_INIT_FAIL);
+}
+
+/**
+ * xe_huc_mei_start() - ask the GSC for the HuC once the GT runs
+ * @huc: the HuC
+ *
+ * Called at the end of every uC load (probe, GT reset, resume) with the device
+ * awake. The HuC does not survive those, the GSC must load it again; video
+ * decode submissions wait for it until it settles.
+ */
+void xe_huc_mei_start(struct xe_huc *huc)
+{
+	struct xe_huc_mei *mei = &huc->mei;
+	struct dma_fence *load, *old;
+	bool wait;
+
+	if (!xe_huc_mei_is_used(huc) || !xe_uc_fw_is_loadable(&huc->fw))
+		return;
+
+	scoped_guard(spinlock_irqsave, &mei->state_lock)
+		wait = !mei->absent;
+
+	/* without a fence submissions just don't wait */
+	load = wait ? huc_mei_fence_create(mei) : NULL;
+
+	scoped_guard(spinlock_irqsave, &mei->state_lock) {
+		huc_mei_settle_locked(mei);
+		old = mei->load;
+		mei->state = wait ? XE_HUC_MEI_LOADING : XE_HUC_MEI_SETTLED;
+		mei->load = load;
+	}
+	dma_fence_put(old);
+
+	if (wait)
+		mod_delayed_work(system_dfl_wq, &mei->deadline,
+				 msecs_to_jiffies(HUC_MEI_COMPONENT_TIMEOUT_MS));
+	huc_mei_queue(mei);
+}
+
+/**
+ * xe_huc_mei_stop() - forget the HuC before a reset, a suspend or an FLR
+ * @huc: the HuC
+ *
+ * Waits for a running load and drops a pending one; submissions stop waiting
+ * until the next start().
+ */
+void xe_huc_mei_stop(struct xe_huc *huc)
+{
+	struct xe_huc_mei *mei = &huc->mei;
+
+	if (!xe_huc_mei_is_used(huc))
+		return;
+
+	huc_mei_go_down(mei);
+	huc_mei_cancel(mei);
+}
+
+/**
+ * xe_huc_mei_load_fence() - the fence of a pending HuC load
+ * @huc: the HuC
+ *
+ * Return: a reference to the fence that signals when the pending load settles,
+ * or NULL when no load is pending.
+ */
+struct dma_fence *xe_huc_mei_load_fence(struct xe_huc *huc)
+{
+	struct xe_huc_mei *mei = &huc->mei;
+
+	if (!xe_huc_mei_is_used(huc))
+		return NULL;
+
+	guard(spinlock_irqsave)(&mei->state_lock);
+	if (mei->state != XE_HUC_MEI_LOADING || !mei->load)
+		return NULL;
+
+	return dma_fence_get(mei->load);
+}
+
+/**
+ * xe_huc_mei_wait() - wait until a pending HuC load settled
+ * @huc: the HuC
+ *
+ * A HuC query must not race the load that follows a probe or a resume, or
+ * userspace would see a HuC-less device.
+ *
+ * Return: 0 once settled or timed out, -ERESTARTSYS when interrupted.
+ */
+int xe_huc_mei_wait(struct xe_huc *huc)
+{
+	struct dma_fence *load = xe_huc_mei_load_fence(huc);
+	long ret;
+
+	if (!load)
+		return 0;
+
+	ret = dma_fence_wait_timeout(load, true, msecs_to_jiffies(HUC_MEI_SETTLE_TIMEOUT_MS));
+	dma_fence_put(load);
+
+	return ret < 0 ? ret : 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_huc_mei.h b/drivers/gpu/drm/xe/xe_huc_mei.h
new file mode 100644
index 000000000..bdc68dcca
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_huc_mei.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Arisa Snowbell
+ */
+
+#ifndef _XE_HUC_MEI_H_
+#define _XE_HUC_MEI_H_
+
+#include <linux/types.h>
+
+struct dma_fence;
+struct xe_huc;
+
+bool xe_huc_mei_is_used(struct xe_huc *huc);
+void xe_huc_mei_init(struct xe_huc *huc);
+void xe_huc_mei_start(struct xe_huc *huc);
+void xe_huc_mei_stop(struct xe_huc *huc);
+struct dma_fence *xe_huc_mei_load_fence(struct xe_huc *huc);
+int xe_huc_mei_wait(struct xe_huc *huc);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_huc_types.h b/drivers/gpu/drm/xe/xe_huc_types.h
index cfbaa5e0d..d3dd36f72 100644
--- a/drivers/gpu/drm/xe/xe_huc_types.h
+++ b/drivers/gpu/drm/xe/xe_huc_types.h
@@ -6,10 +6,64 @@
 #ifndef _XE_HUC_TYPES_H_
 #define _XE_HUC_TYPES_H_
 
+#include <linux/atomic.h>
+#include <linux/mutex.h>
+#include <linux/spinlock.h>
+#include <linux/workqueue.h>
+
 #include "xe_uc_fw_types.h"
 
+struct dma_fence;
+struct i915_pxp_component;
 struct xe_bo;
 
+/**
+ * enum xe_huc_mei_state - where a HuC that the GSC loads through mei is
+ * @XE_HUC_MEI_UNUSED: not loaded through mei (not DG2, or its setup failed)
+ * @XE_HUC_MEI_DOWN: the GT is not running (before the first load, in a reset or
+ *	a suspend), there is nothing to load into
+ * @XE_HUC_MEI_LOADING: the GT runs and the GSC load is pending
+ * @XE_HUC_MEI_SETTLED: the load succeeded, failed or stopped waiting for mei
+ */
+enum xe_huc_mei_state {
+	XE_HUC_MEI_UNUSED,
+	XE_HUC_MEI_DOWN,
+	XE_HUC_MEI_LOADING,
+	XE_HUC_MEI_SETTLED,
+};
+
+/**
+ * struct xe_huc_mei - HuC loaded by the GSC through mei_pxp (DG2)
+ */
+struct xe_huc_mei {
+	/** @lock: protects @pxp, held across a GSC command */
+	struct mutex lock;
+	/** @pxp: the bound mei PXP component, NULL while unbound */
+	struct i915_pxp_component *pxp;
+	/** @msg: VRAM page for the GSC request and reply */
+	struct xe_bo *msg;
+	/** @auth: asks the GSC to load and authenticate the HuC */
+	struct work_struct auth;
+	/** @deadline: stops waiting for a mei that does not bind */
+	struct delayed_work deadline;
+	/** @state_lock: protects @state, @bound, @absent and @load */
+	spinlock_t state_lock;
+	/** @state: where the load is */
+	enum xe_huc_mei_state state;
+	/** @bound: the mei PXP component is bound */
+	bool bound;
+	/** @absent: mei did not bind in time, later loads don't wait for it */
+	bool absent;
+	/** @announced: the first successful load was logged */
+	bool announced;
+	/** @load: signalled when the pending load settles, NULL when none */
+	struct dma_fence *load;
+	/** @fence_context: dma-fence context of @load */
+	u64 fence_context;
+	/** @seqno: sequence number of the last @load */
+	atomic64_t seqno;
+};
+
 /**
  * struct xe_huc - HuC
  */
@@ -19,6 +73,9 @@ struct xe_huc {
 
 	/** @gsc_pkt: bo to store the packet for auth via GSC */
 	struct xe_bo *gsc_pkt;
+
+	/** @mei: loading by the GSC through mei (DG2) */
+	struct xe_huc_mei mei;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index ff13f6e6c..69b632926 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -20,6 +20,7 @@
 #include "xe_guc_engine_activity.h"
 #include "xe_guc_submit.h"
 #include "xe_huc.h"
+#include "xe_huc_mei.h"
 #include "xe_mmio.h"
 #include "xe_sriov.h"
 #include "xe_tile.h"
@@ -374,6 +375,7 @@ int xe_uc_reset_prepare(struct xe_uc *uc)
 
 void xe_uc_stop_prepare(struct xe_uc *uc)
 {
+	xe_huc_mei_stop(&uc->huc);
 	xe_gsc_stop_prepare(&uc->gsc);
 	xe_guc_stop_prepare(&uc->guc);
 }
@@ -444,6 +446,7 @@ void xe_uc_flr_prepare(struct xe_uc *uc)
 	struct xe_uc_flr flr = { .uc = uc };
 	struct xe_gt *gt = uc_to_gt(uc);
 
+	xe_huc_mei_stop(&uc->huc);
 	xe_uc_reset_prepare(uc);
 
 	/*
@@ -485,6 +488,7 @@ int xe_uc_reinit(struct xe_uc *uc)
 
 void xe_uc_suspend_prepare(struct xe_uc *uc)
 {
+	xe_huc_mei_stop(&uc->huc);
 	xe_gsc_wait_for_worker_completion(&uc->gsc);
 	xe_guc_stop_prepare(&uc->guc);
 }
@@ -495,6 +499,9 @@ int xe_uc_suspend(struct xe_uc *uc)
 	if (!xe_device_uc_enabled(uc_to_xe(uc)))
 		return 0;
 
+	/* runtime D3cold gets here without xe_uc_suspend_prepare() */
+	xe_huc_mei_stop(&uc->huc);
+
 	uc_reset_wait(uc);
 
 	xe_uc_stop(uc);
-- 
2.56.1

