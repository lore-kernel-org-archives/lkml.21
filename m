Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794951878;
	b=RVCnAxF7c/GUfyUYqS+LwSTyzVvpNMITqiUPvFbpsS2B8/itRX0KaCJYJoC90Qk1Y6+1
	 1LS5n9gHb8uGHUX+8Ll+QA/COfVzv88qxh/lrpHCIzW039QGZEOv5KV0ubx7cRx1XZeoz
	 SnkKdbot+/UxnZvHImQxreJLFUUMm4vpXHb1olESfuLznsYdnhYudcIEYwOBj9jB6JPhf
	 xy+4o740u6hQmXH6h/oJf04c+HMjh2cFTsM1osbnqPwMbmZHC87OtyBiZCQVrfvieC6ZV
	 OmeqDUyZNmd5FzD9ARbYwwlbD12SHsYmmHxvZ5UOZZJIkveTiv8AtdB2I09zPN1Ecew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794951878;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nw08AhRQS1eFzAKtcGRxJRAZrCmSi0ARu0NkX4yj1hM=;
	b=hf1hpwuWhnyalTu6s7HWk5Wg0C7NyScKV/pcewHb8svoFCgOvN327XM7l+YW10NerWTH
	 SXeg67QGx2FFNOQ+DnGw5vQtg0/1CbNVrvJoS7PRI4w7YKSifrJA5sfSbixd2fKRRJhRc
	 RigViprEPyDzsZpPyLjp+boYIMuNOAtiEGz8dXKuG9VLjIF98EU7HBtdbHO310JK7A1r3
	 HUptTZODbEPtb/SYcszs9uusZY87LsnkQFCxgCbj6ZHJV600IRKzRnGhQ3IzpfTCCfuLp
	 J9dJD9//+cHf5bUss5x0fMso2NOYN4DHsS3sBFVy02eg6pO54FYL8g7KJ26GhpjKnLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GlNpKkEO;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38F8606A334
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:44:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F38F8606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GlNpKkEO
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so2970405e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794951876; x=1795556676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nw08AhRQS1eFzAKtcGRxJRAZrCmSi0ARu0NkX4yj1hM=;
        b=GlNpKkEOBdLplNYslQVqDxco4jU1/LzwwvgIhpIT4PaxBhZPTf3c6/dcU1yd0189Oz
         OxLpwgisv5277Eyuo/nTojPnQTMUObGIyIbkicRKX4M4owyCtMLmR1p8ifRljjT+g+Kg
         9Vz988sBlKv4qkiC8ePYavwD26SDLkVr9vT7KHyBUUTXe3FGZnphhWEgeWbYgk3kH1sc
         NA/hZpFgCklpvB+AoY7DkFAv7sRwaAQqXqm/l4bTZ9InFtA2xGv0f8kkDtxB6cZ9iMpl
         axNSdOTIXCXzD3vnph4Z42+jDKk4+abna0wqKuQ7iNEy9VPLeZG7k+ojdPZghS7R6cE0
         aE6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794951876; x=1795556676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nw08AhRQS1eFzAKtcGRxJRAZrCmSi0ARu0NkX4yj1hM=;
        b=gsTEeA8hpCRrZKvNAwTUApu+jQrCUoYgowYW3JUssKFdrel1DifhzaB7nvBDG9+Sbu
         h6P1Fnt5rSq995eGTuLXqk5Z81bCyNrB29J1G/BGnJMaF3ZCg3z67RNUUF5SU8ye5ULB
         2MYSedHoYhTAets3G9ggB7iWywjEHC3l/PEQ+HbI4IO/KUMyAvg2SBygnrPN0tdIxNCF
         h7KvMT/Lh/Q0FuW3gMc9wf2YBBaPgvq3Ygm8c8Rkes8sOajUgNm8VdTA/5t63xQ3j+jf
         vVVymE/NJAvsRG/513h3eoG8a3MdCWB4Dqxgl08xG9kz34EDglJVFwUddnkYOUK4vI91
         qYZg==
X-Gm-Message-State: APuU4Z/JzsVUgsRUFzWB+IEaezvx9uFhG22dtdYseu3ukre2x9bdUcXH
	2x54dPXqBTz/wKR2AUZxEvaA3XWoiaOgpzSD5s9h3HZ+K15ZbcDRLR98LvhVYzvQib0=
X-Gm-Gg: AYBFou32legBW/+HjTjIuHUxbjjl8y7cXUQGHANrZlOC/uwrGCUHytxRGjxjUopmnO1
	//FZMIbimZjmzNN+2zPOUe30wa1w6KlhEVHKIXxQWXrMGG/E0cRy7XWGyrPnAAsw71uoNSYoc+c
	gbb/ZUuOMSB3XPqTDjXLSeFmA/WkhgjEjY9P6hM9IaXeRCoL61Um5gyYGNeED1Kp9zLXyrJLo8k
	NhTHUfNcqqb+YFCdkBJxFAY4n/lGWPSM68bnmjLzRsxd4YJPNYEz1PJGryHD5teGa5l/ltyRuE/
	eEjjWXcSh0PjEPsJfMcs6w4cwiEux8SgRzqpCFkCO6FdSNhymaMcF1sEtciGxwBpFFi9Wt9JWSB
	wfYNtrHfjdT1qfCgdCQ5tsrv2ud7n61LELC/yNf6ooU5PAY+Oy1p85yHvmT/fUwJvGr/So0Qpo5
	nLz7hRhsBjsBszzn+X6uTq6cfJitE2L3FKXWEt53EMEpO+c5IV10eHGiKtE4etqBKdRrTo29s6g
	X/wFXrvaeumcjcnw5bFm8enA+bO/C+ccuy1uYh58DPpBHRV7tvjBxtInPSUyefGmXOcXCPiegY9
	BgnjJjSaA1lX5KhhGw+6xf30woWF0Quw0lUGAx5q53oF2sY1q/da234kV8kMEQ==
X-Received: by 2002:a05:600c:4fc5:b0:4a2:392:9de2 with SMTP id 5b1f17b1804b1-4bb7da3ad9fmr9007535e9.28.1794951876264;
        Tue, 17 Nov 2026 13:44:36 -0800 (PST)
Received: from fedora ([94.200.248.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb784231basm95069675e9.11.2026.11.17.13.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:44:35 -0800 (PST)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Mary Guillemard <mary@mary.zone>,
	nouveau@lists.freedesktop.org,
	Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
	Thomas Andersen <phomes@gmail.com>
Subject: [PATCH 2/3] drm/nouveau/bar: take the GSP-RM flush pointer from the BAR2 io_mapping
Date: Wed, 18 Nov 2026 01:43:51 +0400
Message-ID: <20261117214352.337961-3-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261117214352.337961-1-mohamedahmedegypt2001@gmail.com>
References: <20261117214352.337961-1-mohamedahmedegypt2001@gmail.com>
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

r535_bar_new_() maps the first page of BAR2 with ioremap(), to flush
BAR2 writes with a read while flushFBZero is not mapped. On x86 with
PAT, a mapping that overlaps an existing one gets its type. The instmem
io_mapping is created later, so with GSP-RM it is also mapped UC- and
its writes are not write-combined.

Take the flush pointer from the io_mapping. A new bar2.oneinit hook
sets it up once the BAR2 page tables are bootstrapped and the
io_mapping exists.

Fixes: 34e27b90552a ("nouveau/instmem: use iomapping interface for instmem handling")
Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Tested-by: Thomas Andersen <phomes@gmail.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/bar/gf100.c   |  6 ++++
 .../gpu/drm/nouveau/nvkm/subdev/bar/priv.h    |  1 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c | 32 ++++++++++++++-----
 .../drm/nouveau/nvkm/subdev/instmem/nv50.c    |  8 +++++
 .../drm/nouveau/nvkm/subdev/instmem/priv.h    |  3 ++
 5 files changed, 42 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/gf100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/gf100.c
index a1fa1b0c8954..6950801d2e03 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/gf100.c
@@ -133,6 +133,12 @@ gf100_bar_oneinit(struct nvkm_bar *base)
 		if (ret)
 			return ret;
 
+		if (bar->base.func->bar2.oneinit) {
+			ret = bar->base.func->bar2.oneinit(&bar->base);
+			if (ret)
+				return ret;
+		}
+
 		bar->base.subdev.oneinit = true;
 		nvkm_bar_bar2_init(bar->base.subdev.device);
 	}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/priv.h
index d0168e0b78fb..5774bfa8d96d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/priv.h
@@ -16,6 +16,7 @@ struct nvkm_bar_func {
 	void (*init)(struct nvkm_bar *);
 
 	struct {
+		int (*oneinit)(struct nvkm_bar *);
 		void (*init)(struct nvkm_bar *);
 		void (*fini)(struct nvkm_bar *);
 		void (*wait)(struct nvkm_bar *);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c
index fae08ac3b18c..9b907d9e80af 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c
@@ -24,9 +24,11 @@
 #include <core/mm.h>
 #include <subdev/fb.h>
 #include <subdev/gsp.h>
-#include <subdev/instmem.h>
+#include <subdev/instmem/priv.h>
 #include <subdev/mmu/vmm.h>
 
+#include <linux/io-mapping.h>
+
 #include "nvrm/bar.h"
 #include "nvrm/rpcfn.h"
 
@@ -65,6 +67,25 @@ r535_bar_bar2_update_pde(struct nvkm_gsp *gsp, u8 page_shift, u64 pdbe)
 	return nvkm_gsp_rpc_wr(gsp, rpc, NVKM_GSP_RPC_REPLY_RECV);
 }
 
+static int
+r535_bar_bar2_oneinit(struct nvkm_bar *bar)
+{
+	struct io_mapping *iomap = nv50_instmem_bar2_iomap(bar->subdev.device->imem);
+
+	if (!iomap)
+		return -ENOMEM;
+
+	/* BAR2 writes are flushed by a read. While flushFBZero is not mapped,
+	 * read the first page of the BAR2 io_mapping.
+	 */
+	bar->flushBAR2PhysMode = io_mapping_map_wc(iomap, 0, PAGE_SIZE);
+	if (!bar->flushBAR2PhysMode)
+		return -ENOMEM;
+
+	bar->flushBAR2 = bar->flushBAR2PhysMode;
+	return 0;
+}
+
 static void
 r535_bar_bar2_fini(struct nvkm_bar *bar)
 {
@@ -155,7 +176,7 @@ r535_bar_dtor(struct nvkm_bar *bar)
 	nvkm_memory_unref(&bar->flushFBZero);
 
 	if (bar->flushBAR2PhysMode)
-		iounmap(bar->flushBAR2PhysMode);
+		io_mapping_unmap(bar->flushBAR2PhysMode);
 
 	kfree(bar->func);
 	return data;
@@ -178,6 +199,7 @@ r535_bar_new_(const struct nvkm_bar_func *hw, struct nvkm_device *device,
 	rm->bar1.fini = r535_bar_bar1_fini;
 	rm->bar1.wait = r535_bar_bar1_wait;
 	rm->bar1.vmm = hw->bar1.vmm;
+	rm->bar2.oneinit = r535_bar_bar2_oneinit;
 	rm->bar2.init = r535_bar_bar2_init;
 	rm->bar2.fini = r535_bar_bar2_fini;
 	rm->bar2.wait = r535_bar_bar2_wait;
@@ -191,12 +213,6 @@ r535_bar_new_(const struct nvkm_bar_func *hw, struct nvkm_device *device,
 	}
 	*pbar = bar;
 
-	bar->flushBAR2PhysMode = ioremap(device->func->resource_addr(device, NVKM_BAR2_INST), PAGE_SIZE);
-	if (!bar->flushBAR2PhysMode)
-		return -ENOMEM;
-
-	bar->flushBAR2 = bar->flushBAR2PhysMode;
-
 	gf100_bar(*pbar)->bar2_halve = true;
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
index 22b0fde6ba34..1b4be4b1f0bb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
@@ -436,6 +436,14 @@ nv50_instmem_dtor(struct nvkm_instmem *base)
 	return imem;
 }
 
+struct io_mapping *
+nv50_instmem_bar2_iomap(struct nvkm_instmem *base)
+{
+	struct nv50_instmem *imem = nv50_instmem(base);
+
+	return imem->iomap.size ? &imem->iomap : NULL;
+}
+
 static const struct nvkm_instmem_func
 nv50_instmem = {
 	.dtor = nv50_instmem_dtor,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/priv.h
index b423f01f5fcd..88990adda766 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/priv.h
@@ -4,6 +4,8 @@
 #define nvkm_instmem(p) container_of((p), struct nvkm_instmem, subdev)
 #include <subdev/instmem.h>
 
+struct io_mapping;
+
 struct nvkm_instmem_func {
 	void *(*dtor)(struct nvkm_instmem *);
 	int (*oneinit)(struct nvkm_instmem *);
@@ -27,6 +29,7 @@ int nv50_instobj_new(struct nvkm_instmem *, u32 size, u32 align, bool zero,
 int nv50_instobj_wrap(struct nvkm_instmem *, struct nvkm_memory *vram,
 		      struct nvkm_memory **bar2);
 void *nv50_instmem_dtor(struct nvkm_instmem *base);
+struct io_mapping *nv50_instmem_bar2_iomap(struct nvkm_instmem *base);
 
 void nvkm_instmem_ctor(const struct nvkm_instmem_func *, struct nvkm_device *,
 		       enum nvkm_subdev_type, int, struct nvkm_instmem *);
-- 
2.56.1

