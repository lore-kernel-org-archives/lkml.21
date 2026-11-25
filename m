Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795628486;
	b=5L9rKbRq6rbpqiXA8B4weZK7QrlaobKrmlnExLOL0uJVT0oNFTqxiSTNu2tvcaLe6lUX
	 8qDuTcKwNOU5jusYFsZIhoJe8oHjlOENSwt3qXT+cI6YHn7FrxBgM9oqkMibcv0Kwy0dL
	 Sor1NDkZ4J1tdCW3LRd8SV7DeWyWe8FPEq2L4kQmPNbUeIH2e1ewAYp+E6upfveQ59Q+X
	 0FNPs7I71EGVDByhFhnIgEYbgUxosi/1AzcYW3oz6tQG2RT73QDI7OIu3KrzXTtjiloVQ
	 cGrRaMpH+bncd6/CF4w73U76BePnIUWZlPqCqerpGYTcDevVmtzsMl4nhx8x1H8T62Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795628486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=1nnKgUnH41uFpzvbt0vDxC4+ZynO+VhngeTfrBlQfrc=;
	b=KqFOOxQSlIbqDGN720ND8XTdfJz+02dLk+JYDVowLLvRZSM3jBrKnRdI4ahbY2yfj34M
	 Tu8qPF7kfXf9z5cNBi3jR8b73C/dSG77X+G03dfx4yTdwH7jGvtyetKBCtCpQMFqOG3+R
	 oiu6zwdqtxU5i1u2YRkAZxfYR8NMXSqv3n9SKIyvOw4Wwj78kFrUeXTzDGSR+QDD7zf1d
	 Ct7chuUHo1xEfX/XyBR/qAeW+Iw9aNYtLOaHVR+XkFKaIyneObnDo+6L+PMMf33t+Swj8
	 SaC3kdhDjNSGO7+zrNFN9eKZFPYztswkbhlOxJWzMD0a0WKM2UYC3bfUXj7FWqaH5NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HspGXvfL;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F13606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:41:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58F13606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HspGXvfL
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-498f5fa5103so3624395f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795628483; x=1796233283; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1nnKgUnH41uFpzvbt0vDxC4+ZynO+VhngeTfrBlQfrc=;
        b=HspGXvfL/RB4V26+1n7YpI5jeaFcXO5DGK/3PnVRv0SJiaHRKkXM/ghaDawbe7uz11
         ebhOzB7bowoCH6E1DnSscaFcgpcTqSthUlQjzDN2NzGLHnr7+UWxZv+VuqkPAKZExFah
         qpfqhsL030zoRIg3Rx3ah/KJCbs95D3lLDkjdOtg49xoCr1JFLBiZ9XRNQnhisWUIzrj
         b9dAdeLa7sd9Zn9Nkg/C4mKAz7WnkV/Us0Hylx0Y6fLgpMF2ZMjiaedNk54ZnmDvNhv+
         EFETZ18W2FZToF2bcf51Dn2tu8Cmm2MgrmxPMx+1ngDP+1Yt8Y2Qd2AWIqpP8Z2hKuMb
         lVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795628483; x=1796233283;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1nnKgUnH41uFpzvbt0vDxC4+ZynO+VhngeTfrBlQfrc=;
        b=Yoh8WWbjGPBvLhJJib5QC5rRVI4sUt8/+t/rVifmgWz/ScWrovM8fzgd2vqO1rSbS0
         /SGViqumB1pEc+0QuGI+ye6mLiE8aId+/fQnVMxbgkbmSmtVvCAXq9Zz0Tj5i1wGMtbq
         doyW2sp42p5i00lNc3eop7kPTrAetLZnaxLvFH7jfpBhfOVIARUL5FHEPx/70PWbnyKI
         FHvQ4upxgvcNa9SYLXm3S30FhIDNBs51Z5shFSpn1oCGc35lzMu/anoWWfwMvHe2jobx
         2JXTt6UmcOWJ3Reha66nwRbk9uZZ642f1CKZu0pj9kMpBsyUGExR5AhkQP7K6I3NxcVw
         twuA==
X-Forwarded-Encrypted: i=1; AL+hErGMY80vOpXZ6yLyKWsnD8f4DoOWyrNiXo13AneuMvu/WoQaeR093Y0XjkpJcrYO+9S7i/0Wwx9i4oqGq14=@vger.kernel.org
X-Gm-Message-State: APuU4Z9eyOVxf20QFu0sHuLae0pu/++Za+uh92QxoDh5hMYNosjvXMrF
	j/FbzmnKw2TuDVGYKlRtBJmOO8rOCAqaNj2oaUXbKUcJAzWCeGSXKI9j7epEMd/Pz4g=
X-Gm-Gg: AZFdTZdkO40Yx3L6rQxnn3LnoVE3OO6H0MgtdmRALrL/KhtOkwRENc2fUlnFYoY2W6c
	l90FqfTh+6trv26k+9Cl46LR3P+kMh944V5ci75Zv0M6lfVD+lTnHS1x0M22lemEsk5I+XH1IAb
	4XIZVjdPixQx8mn659vC4zBTteyFHU+Zm+AzbULNwWFbn6miky5nFe5isb2jV0PYEFtgncOcv5E
	ye4zXEiLa97lUJj27kP0JLSgB+VCpOC5i7+Tt9fVCYEqxGXgBK6E5Z5aeFWUyhVD8GFpytyDnI9
	CNV9LdoQAMxUqhtdllQBqaUzDSIYAYcZmTl08WSX5fnX7bBtYE3sWlQHjKYgyr2xmc1toQbLIMN
	BJ819xFQuGuIiXxa/lZ7faYRfLA76iw4cQYxTpQMD2YN6n8IWTp+fo+RwiONc6Rn7TWE53qQ3ho
	sYCCKTB3zxP77+qiynBAYgoogkP4AKwzwtT7AIDjjRSA1/QZyJcSjVYQVojWmgLgKM1E22d9wwr
	sTIzfsw1tdtPK2HooYiHRlK/hExKRjEWpSzCw2HUK6aDEMur0C66HKmMlTo5c0OzhHufxOqvAUN
	ImZ81GWibm294elGFnoHvS/+cN8La3GdRERMnxhD6iaDYgjrZ/A=
X-Received: by 2002:a05:6000:26c1:b0:48e:5e20:1371 with SMTP id ffacd0b85a97d-4abacfea2c9mr39664160f8f.4.1795628483517;
        Wed, 25 Nov 2026 09:41:23 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:e50:3860::e1d1:d182])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm29045574f8f.35.2026.11.25.09.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 09:41:23 -0800 (PST)
From: Guillaume La Roque <glaroque@baylibre.com>
Date: Wed, 25 Nov 2026 18:41:21 +0100
Subject: [PATCH v2] drm/imagination: drop redundant zeroing of new GEM
 objects
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
Message-Id: <20261125-pvr-gem-drop-zeroing-v2-1-8453a6e01e81@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAMAdB2sC/22NQQ6CMBBFr0K6dkxbUkBX3sOwgDLCGKHNFBuRc
 HcBXbp8yf/vzSIgEwZxTmbBGCmQG1bQh0TYrhpaBGpWFlrqTClpwEeGFnto2Hl4IzsaWshya09
 FWsjKGLFePeONXrv2Wn45POs72nFzbYuOwuh42rtRbbtfQqn/iahAgW5srk1hcmnSS11ND6oZj
 9b1olyW5QP60/C9zQAAAA==
X-Change-ID: 20261105-pvr-gem-drop-zeroing-67cc98380a55
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Gyeyoung Baek <gye976@gmail.com>, imagination@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Guillaume La Roque <glaroque@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795628482; l=4827;
 i=glaroque@baylibre.com; s=20261019; h=from:subject:message-id;
 bh=DuC/rcDE0nO1yX+mV/jpSJ2uisVnTsIi/oVFyc2tvyU=;
 b=2OPnmGyv44yjEbLHE2Ux0WaGPr+//BLm4J7wjSfmmWOqo17l0TXEWztLeG/E5yb7e1O0OEww9
 c3R7pVwRhBSAEXCtQaf4Jmxkp026q3CLRsmsg2A9GqP3f9pt4eRPxFH
X-Developer-Key: i=glaroque@baylibre.com; a=ed25519;
 pk=nMpSg4NT6M6q143E089emouMc+MXpHO9CWmnEUfjhjI=

pvr_gem_object_create() clears every new object through a CPU mapping
so that userspace never sees data left by a previous owner of the
pages [1]. Those pages are already zeroed by shmem.

Each object is backed by a new shmem file, for which
__shmem_file_setup() only sets the size, and its pages are allocated
through:

  drm_gem_shmem_get_pages_sgt()
    drm_gem_shmem_get_pages_sgt_locked()
      drm_gem_shmem_get_pages_locked()
        drm_gem_get_pages()
          shmem_read_folio_gfp()
            shmem_get_folio_gfp(..., SGP_CACHE, ...)

A newly allocated folio is not uptodate, so shmem_get_folio_gfp() clears
it with clear_highpage() before marking it uptodate; only SGP_WRITE
skips this, leaving the folio to be filled by the write. panfrost and
panthor already rely on this too and never clear new objects.

The dma_sync_sgtable_for_device() call that follows makes those zeroes
visible to the GPU. The second pass, write-combined on non-coherent
devices, only adds latency.

Link: https://lore.kernel.org/dd2ceacc-f59b-9c3c-e4ce-30b3bbd6939b@mailbox.org [1]
Tested-by: Gyeyoung Baek <gye976@gmail.com>
Reviewed-by: Gyeyoung Baek <gye976@gmail.com>
Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
pvr_gem_object_create() clears every new object through a CPU mapping,
on top of the zeroing shmem already does. Dropping that pass speeds up
object creation, most visibly where it goes through a write-combined
mapping on a non-coherent platform.

Testing: drm-misc-next (41ecf852c073) with a Debian rootfs, on a TI
J722S EVM (BXS-4-64, arm64) and a SpacemiT K3 Pico-ITX (BXM-4-64,
riscv64). The K3 also needs local patches that are not upstream yet:
its GPU DT node, an RPMI power domain fix for its firmware and BVNC
36.56.104.183. Each board ran two small test programs, once without and
once with the patch:

- The first one only uses the powervr DRM ioctls. It fills 250 objects
  with a pattern through their CPU mapping, frees them, creates new
  objects of the same size and checks they read back as zero. It also
  times DRM_IOCTL_PVR_CREATE_BO. Result, without -> with the patch:
    J722S: 0 -> 0 non-zero bytes, 16 MiB object in 20.6 -> 17.4 ms
    K3:    0 -> 0 non-zero bytes, 16 MiB object in 41.6 ->  9.2 ms

- The second one does the same check through Mesa's Vulkan driver,
  and also reads the new memory from the GPU: the GPU copies it into a
  buffer that the CPU then checks. 80 allocations, on the J722S only, as
  Mesa is not built on the K3 yet. Result: 0 non-zero bytes without and
  with the patch.

The test programs were written and run with the help of an LLM.
---
Changes in v2:
- Commit message: show the call chain through which shmem zeroes the
  pages and explain why this can be relied on (Gyeyoung Baek).
- Add Tested-by and Reviewed-by from Gyeyoung Baek.
- No code change.
- Link to v1: https://patch.msgid.link/20261111-pvr-gem-drop-zeroing-v1-1-2dc725857053@baylibre.com
---
 drivers/gpu/drm/imagination/pvr_gem.c | 34 ----------------------------------
 1 file changed, 34 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_gem.c b/drivers/gpu/drm/imagination/pvr_gem.c
index d8660d6a8e01..01b8e08d12f0 100644
--- a/drivers/gpu/drm/imagination/pvr_gem.c
+++ b/drivers/gpu/drm/imagination/pvr_gem.c
@@ -275,34 +275,6 @@ pvr_gem_object_vunmap(struct pvr_gem_object *pvr_obj)
 	dma_resv_unlock(obj->resv);
 }
 
-/**
- * pvr_gem_object_zero() - Zeroes the physical memory behind an object.
- * @pvr_obj: Target PowerVR GEM object.
- *
- * Return:
- *  * 0 on success, or
- *  * Any error encountered while attempting to map @pvr_obj to the CPU (see
- *    pvr_gem_object_vmap()).
- */
-static int
-pvr_gem_object_zero(struct pvr_gem_object *pvr_obj)
-{
-	void *cpu_ptr;
-
-	cpu_ptr = pvr_gem_object_vmap(pvr_obj);
-	if (IS_ERR(cpu_ptr))
-		return PTR_ERR(cpu_ptr);
-
-	memset(cpu_ptr, 0, pvr_gem_object_size(pvr_obj));
-
-	/* Make sure the zero-ing is done before vumap-ing the object. */
-	wmb();
-
-	pvr_gem_object_vunmap(pvr_obj);
-
-	return 0;
-}
-
 /**
  * pvr_gem_create_object() - Allocate and pre-initializes a pvr_gem_object
  * @drm_dev: DRM device creating this object.
@@ -378,12 +350,6 @@ pvr_gem_object_create(struct pvr_device *pvr_dev, size_t size, u64 flags)
 
 	dma_sync_sgtable_for_device(drm_dev->dev, sgt, DMA_BIDIRECTIONAL);
 
-	/*
-	 * Do this last because pvr_gem_object_zero() requires a fully
-	 * configured instance of struct pvr_gem_object.
-	 */
-	pvr_gem_object_zero(pvr_obj);
-
 	return pvr_obj;
 
 err_shmem_object_free:

---
base-commit: 41b5458595c60143d0ebaa1e032c9cda5d764dff
change-id: 20261105-pvr-gem-drop-zeroing-67cc98380a55

Best regards,
--  
Guillaume La Roque <glaroque@baylibre.com>

