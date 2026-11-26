Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795726698;
	b=nkuP4D7bnosf/hU+9LfCirRUTRY0dCte4/N5KtqSprldijwUQg6PxjwvXILUUe/RMtdv
	 70RQTKuxuh1xmlVTGMsDcptey5cyuKy0LuBz9p83TRkQ8xL4j31sV47idRegnD9Hil4HZ
	 TcOeR5S2st7HbEV1n7bSMTeG0o7PjQOP5kRFSjtLAuOcD9Klxic3ScoF/osFqXA+OGFt5
	 8wGh9HdcT0Yi/ad+yiSqqVmxkD7E7ToYpazvaZOraAr5lz/fa2Cft62fgXmbv09LP9XSt
	 qKOuQsY0RWyfdCHQTz4qLvYCaqZ/q5posFg3PutlsHJkOcLG6TnjbrtQpb7mDICE6TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795726698;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AvNSKL15i0CngYK/tdEu7+BrYtcOk63Bb6qf1K1XIWU=;
	b=gYP/D+p5R7WCWLNGRAqVC6vs2H95ruu1tj3boU5UQKRFksG6x9673mWipH/wl/+nn4/W
	 ylgQoPryc2429tUYnGrEZPGFednsnvbpmDGO8CXkSo5vA14uwWalAB/bliqnnRZqZTaV3
	 Bxv/T4JgJpNzR7Lc1G3q+zF3HFyYySjjI8jEy+9U9EenKAFcgzFBUZosITkT7r5KiZ5w9
	 vd1egejYIXjoSXJooKQWAg5L6S9myXIar1nEV8fwjR9sn6aY/aSaPisgDu1H09t/2OZnm
	 cSrbmdcFUiiZVeYVDoD1rz3L5CbJzXMP2Ky7chxCYEu6SkRjinhWtW4QZrrjOw10Rwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wRSrYx8i;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C66606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 20:58:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1C66606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wRSrYx8i
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so61233535e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795726696; x=1796331496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AvNSKL15i0CngYK/tdEu7+BrYtcOk63Bb6qf1K1XIWU=;
        b=wRSrYx8igFKUr2Bec03/kjs7XNL3Dl3mYj+nmdvccBEN2CPDXovmcUmG+rnwmGutQY
         mvlZKR83sHhYBzQ8epJZVnOKKZ0ghNxXaIDN89OkI8/tuBBxpd+3HWHXqSy2Wv2DzQun
         jjPP/OsJDtDW7ikRXCXc6hJZ70yIN0d9tvYLdxRviqnNOClZRO1ZEMKtDUQYVsJcgY/O
         LjBtYPh5lSAwo+/1HwjWgeHVW9UtY+p8ir2UZB/FtRFGlVBNGn0g+UxlMRUehsd/bXnw
         tAQnIm/VDlmjyL6fpCMi4hzWkA3BIN8xDu4t7ZA+d8wVniC8qIJuIRERwmVpVNmmg668
         VaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795726696; x=1796331496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AvNSKL15i0CngYK/tdEu7+BrYtcOk63Bb6qf1K1XIWU=;
        b=kSWr7refU+cS0ILcw5M62UzzsZX5sr7vocOBr6oYldDbdSIrq8h2cQ6QQ4CCkY1dp6
         MNdq+Hmwg9G0nrboVTIQqo3ElvTdt4SEWFZlqRza3oO3AuD6rof6hMErAMEAPNwNeu1h
         KPdcaOMhQ9aDAtQCrIYH6Rqc1+owvoTur+oEBA1PzN9dt0o4DNE0uQd/cTodEgxfTBsQ
         3+G2hlmmTOUa0MHEcwsKO/vgQ30NPB7+g1Qk3CrJAMfwNQOlBoS5adYp35ValMK20aA4
         30v134v2GyBWCrn0dkhsaZUbLKdoeZe2FvvNLIt0dUpb8dOsFYOajxrDOtn+D3J9ZSZ0
         Ns9g==
X-Forwarded-Encrypted: i=1; AL+hErHPWwGWDfzI4jfp8qbZFabuLhGxbJ7RNnLgngYHjh2h3blaOHqMfHAGD+Sdcd5HJJqNEJqy5/+EXoQrh+Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Hv0QpXXtOinfItg51phT19kSOBWnilzisheoYTREFfd3Q/cAH
	uEIZtHganx5cH+1Du2+QpjrJ4SiovGEvT8SSHovWGU/VEIo6SBNXTj1P
X-Gm-Gg: AZFdTZd3FLLnm9a0pmMtfMFdU7tb1Hgupv8/pbhDLFq5iliTvU6DjU5fQGUyb+d1zFr
	pt9drlxX6hm4D8C/e/VKS2LZnnB00wsWhjGWB7hTtWtvxHaAmh+70Ih7+9qmTRegcnCXNpNK5A/
	i6+hEZL2WO+JLJihNbtP0XnaRIKk0pFvJDLvTuiI+RcMwydxHDErfR8vrKt8vLVARTArsd1CUi6
	km3WZaClEJXg1KLmJ2YD9twDmbX7+LbmNjyv09fX3hNTrBoOZFFXttV34VsNtrhCUpKbaoxkwzz
	kJzaa5F/tcW1kqkxq2y2FI/3pLvSmQtIBpkL13WtftKuZtfVOrbnshXjXLvOXXtM2AWB7xQJP4f
	GmhfoBGo73jC9KXiyczROaPd8PCL/r+53j6yjZfje1N/tzqcmseeKUsX3akxltXsN4CvKKZHGKr
	tFp85ladZIOGH/fbs0bzSIYJei64fMQS4uybXQ+cEvFsqrp+qtOxEemJMZ/lLaXI6xt9Kvr3tWV
	x1VhhBDjB1vFA6ccYdthiO5pe+zy2UXBrPncx4++9nCeTVD11S0j3PeqUhE5FTWk2/On1h9axpM
	XM21xN1l/BMIJ0mtg1EPSq/a4btO0QjJfZ+C6gLT+8mS6eecYUHmsqI2wtCdkzQTcGv/o4Bx/ak
	jvmY=
X-Received: by 2002:a05:600c:3547:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4bb8880b88fmr441040875e9.10.1795726695789;
        Thu, 26 Nov 2026 12:58:15 -0800 (PST)
Received: from localhost (2001-1ae9-5b-ad10--33.ip6.tmcz.cz. [2001:1ae9:5b:ad10::33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399d52sm611178075e9.6.2026.11.26.12.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:58:15 -0800 (PST)
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
	Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
	Badal Nilawar <badal.nilawar@intel.com>,
	Nareshkumar Gollakoti <naresh.kumar.g@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] drm/xe/heci: expose the DG2 HECI1 interface to mei
Date: Thu, 26 Nov 2026 21:57:53 +0100
Message-ID: <20261126205758.49845-2-arisa.snowbell@gmail.com>
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
Content-Transfer-Encoding: 8bit

On DG2 the HuC is loaded and authenticated by the GSC, through the PXP
client that lives on HECI1. Like i915 (intel_gsc.c), add HECI1 as the
"mei-gsc" auxiliary device with 4 MiB of VRAM as the GSC extended
operational memory, and route its interrupt (GSC_IRQ_INTF(0)).

HECI2 keeps its current setup; a HECI1 failure only leaves the HuC
unauthenticated and does not fail the probe.

Signed-off-by: Arisa Snowbell <arisa.snowbell@gmail.com>
---
 drivers/gpu/drm/xe/regs/xe_gsc_regs.h |   1 +
 drivers/gpu/drm/xe/xe_heci_gsc.c      | 171 +++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_heci_gsc.h      |  27 +++-
 drivers/gpu/drm/xe/xe_irq.c           |   2 +
 4 files changed, 149 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
index 180be8267..6b7551bcf 100644
--- a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
@@ -20,6 +20,7 @@
 
 #define DG1_GSC_HECI2_BASE	0x00259000
 #define PVC_GSC_HECI2_BASE	0x00285000
+#define DG2_GSC_HECI1_BASE	0x00373000
 #define DG2_GSC_HECI2_BASE	0x00374000
 
 #define HECI_H_CSR(base)	XE_REG((base) + 0x4)
diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_heci_gsc.c
index 5af8903e1..d5e081d99 100644
--- a/drivers/gpu/drm/xe/xe_heci_gsc.c
+++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
@@ -10,8 +10,11 @@
 
 #include <drm/drm_print.h>
 
+#include "xe_bo.h"
+#include "xe_device.h"
 #include "xe_device_types.h"
 #include "xe_heci_gsc.h"
+#include "xe_map.h"
 #include "regs/xe_gsc_regs.h"
 #include "xe_platform_types.h"
 #include "xe_survivability_mode.h"
@@ -50,6 +53,7 @@ static int heci_gsc_irq_init(int irq)
  * @bar_size: size of the mmio bar
  * @use_polling: indication of using polling mode for the device
  * @slow_firmware: indication of whether the device is slow (needs longer timeouts)
+ * @lmem_size: size of the extended operational memory the GSC needs, in VRAM
  */
 struct heci_gsc_def {
 	const char *name;
@@ -57,6 +61,7 @@ struct heci_gsc_def {
 	size_t bar_size;
 	bool use_polling;
 	bool slow_firmware;
+	size_t lmem_size;
 };
 
 /* gsc resources and definitions */
@@ -72,6 +77,14 @@ static const struct heci_gsc_def heci_gsc_def_dg2 = {
 	.bar_size = GSC_BAR_LENGTH,
 };
 
+/* HECI1 carries the PXP client that loads and authenticates the HuC on DG2 */
+static const struct heci_gsc_def heci_gsc_def_dg2_heci1 = {
+	.name = "mei-gsc",
+	.bar = DG2_GSC_HECI1_BASE,
+	.bar_size = GSC_BAR_LENGTH,
+	.lmem_size = SZ_4M,
+};
+
 static const struct heci_gsc_def heci_gsc_def_pvc = {
 	.name = "mei-gscfi",
 	.bar = PVC_GSC_HECI2_BASE,
@@ -87,54 +100,108 @@ static void heci_gsc_release_dev(struct device *dev)
 	kfree(adev);
 }
 
+static void heci_gsc_intf_fini(struct xe_heci_gsc_intf *intf)
+{
+	if (intf->adev) {
+		struct auxiliary_device *aux_dev = &intf->adev->aux_dev;
+
+		auxiliary_device_delete(aux_dev);
+		auxiliary_device_uninit(aux_dev);
+		intf->adev = NULL;
+	}
+
+	if (intf->irq >= 0) {
+		int irq = intf->irq;
+
+		/* the interrupt handler checks it first */
+		intf->irq = -1;
+		irq_free_desc(irq);
+	}
+
+	if (intf->ext_op_mem) {
+		xe_bo_unpin_map_no_vm(intf->ext_op_mem);
+		intf->ext_op_mem = NULL;
+	}
+}
+
 static void xe_heci_gsc_fini(void *arg)
 {
 	struct xe_heci_gsc *heci_gsc = arg;
 
-	if (heci_gsc->adev) {
-		struct auxiliary_device *aux_dev = &heci_gsc->adev->aux_dev;
-
-		auxiliary_device_delete(aux_dev);
-		auxiliary_device_uninit(aux_dev);
-		heci_gsc->adev = NULL;
-	}
-
-	if (heci_gsc->irq >= 0)
-		irq_free_desc(heci_gsc->irq);
-
-	heci_gsc->irq = -1;
+	heci_gsc_intf_fini(&heci_gsc->intf[XE_HECI1]);
+	heci_gsc_intf_fini(&heci_gsc->intf[XE_HECI2]);
 }
 
-static int heci_gsc_irq_setup(struct xe_device *xe)
+static int heci_gsc_irq_setup(struct xe_device *xe, struct xe_heci_gsc_intf *intf)
 {
-	struct xe_heci_gsc *heci_gsc = &xe->heci_gsc;
 	int ret;
 
-	heci_gsc->irq = irq_alloc_desc(0);
-	if (heci_gsc->irq < 0) {
-		drm_err(&xe->drm, "gsc irq error %d\n", heci_gsc->irq);
-		return heci_gsc->irq;
+	intf->irq = irq_alloc_desc(0);
+	if (intf->irq < 0) {
+		drm_err(&xe->drm, "gsc irq error %d\n", intf->irq);
+		return intf->irq;
 	}
 
-	ret = heci_gsc_irq_init(heci_gsc->irq);
+	ret = heci_gsc_irq_init(intf->irq);
 	if (ret < 0)
 		drm_err(&xe->drm, "gsc irq init failed %d\n", ret);
 
 	return ret;
 }
 
-static int heci_gsc_add_device(struct xe_device *xe, const struct heci_gsc_def *def)
+static int heci_gsc_ext_op_mem_alloc(struct xe_device *xe, struct xe_heci_gsc_intf *intf,
+				     struct mei_aux_device *adev, size_t size)
 {
-	struct xe_heci_gsc *heci_gsc = &xe->heci_gsc;
+	struct xe_tile *tile = xe_device_get_root_tile(xe);
+	struct xe_bo *bo;
+
+	/* pinned VRAM BOs are contiguous, the GSC only gets a base and a limit */
+	bo = xe_bo_create_pin_map_novm(xe, tile, size, ttm_bo_type_kernel,
+				       XE_BO_FLAG_VRAM_IF_DGFX(tile), false);
+	if (IS_ERR(bo))
+		return PTR_ERR(bo);
+
+	xe_map_memset(xe, &bo->vmap, 0, 0, size);
+	intf->ext_op_mem = bo;
+
+	adev->ext_op_mem.start = xe_bo_main_addr(bo, PAGE_SIZE);
+	adev->ext_op_mem.end = adev->ext_op_mem.start + size;
+
+	drm_dbg(&xe->drm, "GSC HECI1: extended operational memory at DPA %pa\n",
+		&adev->ext_op_mem.start);
+
+	return 0;
+}
+
+static int heci_gsc_add_device(struct xe_device *xe, const struct heci_gsc_def *def,
+			       enum xe_heci_intf intf_id)
+{
+	struct xe_heci_gsc_intf *intf = &xe->heci_gsc.intf[intf_id];
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	struct auxiliary_device *aux_dev;
 	struct mei_aux_device *adev;
 	int ret;
 
+	if (!def->use_polling && !xe_survivability_mode_is_boot_enabled(xe)) {
+		ret = heci_gsc_irq_setup(xe, intf);
+		if (ret)
+			return ret;
+	}
+
 	adev = kzalloc_obj(*adev);
 	if (!adev)
 		return -ENOMEM;
-	adev->irq = heci_gsc->irq;
+
+	if (def->lmem_size) {
+		ret = heci_gsc_ext_op_mem_alloc(xe, intf, adev, def->lmem_size);
+		if (ret) {
+			drm_err(&xe->drm, "gsc extended operational memory failed %d\n", ret);
+			kfree(adev);
+			return ret;
+		}
+	}
+
+	adev->irq = intf->irq;
 	adev->bar.parent = &pdev->resource[0];
 	adev->bar.start = def->bar + pdev->resource[0].start;
 	adev->bar.end = adev->bar.start + def->bar_size - 1;
@@ -156,11 +223,11 @@ static int heci_gsc_add_device(struct xe_device *xe, const struct heci_gsc_def *
 		return ret;
 	}
 
-	heci_gsc->adev = adev; /* needed by the notifier */
+	intf->adev = adev; /* needed by the notifier */
 	ret = auxiliary_device_add(aux_dev);
 	if (ret < 0) {
 		drm_err(&xe->drm, "gsc aux add failed %d\n", ret);
-		heci_gsc->adev = NULL;
+		intf->adev = NULL;
 
 		/* adev will be freed with the put_device() and .release sequence */
 		auxiliary_device_uninit(aux_dev);
@@ -177,7 +244,8 @@ int xe_heci_gsc_init(struct xe_device *xe)
 	if (!xe->info.has_heci_gscfi && !xe->info.has_heci_cscfi)
 		return 0;
 
-	heci_gsc->irq = -1;
+	heci_gsc->intf[XE_HECI1].irq = -1;
+	heci_gsc->intf[XE_HECI2].irq = -1;
 
 	if (xe->info.platform == XE_BATTLEMAGE) {
 		def = &heci_gsc_def_dg2;
@@ -198,20 +266,38 @@ int xe_heci_gsc_init(struct xe_device *xe)
 	if (ret)
 		return ret;
 
-	if (!def->use_polling && !xe_survivability_mode_is_boot_enabled(xe)) {
-		ret = heci_gsc_irq_setup(xe);
-		if (ret)
-			return ret;
+	ret = heci_gsc_add_device(xe, def, XE_HECI2);
+	if (ret)
+		return ret;
+
+	/*
+	 * HECI1 failing only costs the HuC (it stays unauthenticated), so it
+	 * must not fail the probe.
+	 */
+	if (xe->info.platform == XE_DG2 && !xe_survivability_mode_is_boot_enabled(xe) &&
+	    heci_gsc_add_device(xe, &heci_gsc_def_dg2_heci1, XE_HECI1)) {
+		drm_warn(&xe->drm, "GSC HECI1 not available, HuC will not be authenticated\n");
+		heci_gsc_intf_fini(&heci_gsc->intf[XE_HECI1]);
 	}
 
-	return heci_gsc_add_device(xe, def);
+	return 0;
+}
+
+static void heci_gsc_intf_irq(struct xe_device *xe, struct xe_heci_gsc_intf *intf)
+{
+	int ret;
+
+	if (intf->irq < 0)
+		return;
+
+	ret = generic_handle_irq_safe(intf->irq);
+	if (ret)
+		drm_err_ratelimited(&xe->drm, "error handling GSC irq: %d\n", ret);
 }
 
 void xe_heci_gsc_irq_handler(struct xe_device *xe, u32 iir)
 {
-	int ret;
-
-	if ((iir & GSC_IRQ_INTF(1)) == 0)
+	if ((iir & (GSC_IRQ_INTF(0) | GSC_IRQ_INTF(1))) == 0)
 		return;
 
 	if (!xe->info.has_heci_gscfi) {
@@ -219,18 +305,14 @@ void xe_heci_gsc_irq_handler(struct xe_device *xe, u32 iir)
 		return;
 	}
 
-	if (xe->heci_gsc.irq < 0)
-		return;
-
-	ret = generic_handle_irq_safe(xe->heci_gsc.irq);
-	if (ret)
-		drm_err_ratelimited(&xe->drm, "error handling GSC irq: %d\n", ret);
+	if (iir & GSC_IRQ_INTF(0))
+		heci_gsc_intf_irq(xe, &xe->heci_gsc.intf[XE_HECI1]);
+	if (iir & GSC_IRQ_INTF(1))
+		heci_gsc_intf_irq(xe, &xe->heci_gsc.intf[XE_HECI2]);
 }
 
 void xe_heci_csc_irq_handler(struct xe_device *xe, u32 iir)
 {
-	int ret;
-
 	if ((iir & CSC_IRQ_INTF(1)) == 0)
 		return;
 
@@ -239,10 +321,5 @@ void xe_heci_csc_irq_handler(struct xe_device *xe, u32 iir)
 		return;
 	}
 
-	if (xe->heci_gsc.irq < 0)
-		return;
-
-	ret = generic_handle_irq_safe(xe->heci_gsc.irq);
-	if (ret)
-		drm_err_ratelimited(&xe->drm, "error handling GSC irq: %d\n", ret);
+	heci_gsc_intf_irq(xe, &xe->heci_gsc.intf[XE_HECI2]);
 }
diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.h b/drivers/gpu/drm/xe/xe_heci_gsc.h
index a76f4122b..947743827 100644
--- a/drivers/gpu/drm/xe/xe_heci_gsc.h
+++ b/drivers/gpu/drm/xe/xe_heci_gsc.h
@@ -7,6 +7,7 @@
 
 #include <linux/types.h>
 
+struct xe_bo;
 struct xe_device;
 struct mei_aux_device;
 
@@ -21,16 +22,32 @@ struct mei_aux_device;
  */
 #define CSC_IRQ_INTF(_x) BIT(9 + (_x))
 
+enum xe_heci_intf {
+	XE_HECI1,
+	XE_HECI2,
+	XE_HECI_COUNT,
+};
+
 /**
- * struct xe_heci_gsc - graphics security controller for xe, HECI interface
- *
- * @adev : pointer to mei auxiliary device structure
- * @irq : irq number
+ * struct xe_heci_gsc_intf - one HECI interface of the GSC
  *
+ * @adev: mei auxiliary device of the interface
+ * @irq: irq number, -1 when polled
+ * @ext_op_mem: VRAM the GSC uses as extended operational memory, if any
  */
-struct xe_heci_gsc {
+struct xe_heci_gsc_intf {
 	struct mei_aux_device *adev;
 	int irq;
+	struct xe_bo *ext_op_mem;
+};
+
+/**
+ * struct xe_heci_gsc - graphics security controller for xe, HECI interfaces
+ *
+ * @intf: HECI1 (DG2 PXP and HuC) and HECI2 (firmware interface)
+ */
+struct xe_heci_gsc {
+	struct xe_heci_gsc_intf intf[XE_HECI_COUNT];
 };
 
 int xe_heci_gsc_init(struct xe_device *xe);
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 187140965..b8449bf80 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -247,6 +247,8 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
 		if (other_fuse_mask) {
 			gsc_mask = common_mask | GSC_ER_COMPLETE;
 			heci_mask = GSC_IRQ_INTF(1);
+		} else if (xe->info.platform == XE_DG2) {
+			gsc_mask = GSC_IRQ_INTF(0) | GSC_IRQ_INTF(1);
 		} else if (xe->info.has_heci_gscfi) {
 			gsc_mask = GSC_IRQ_INTF(1);
 		}
-- 
2.56.1

