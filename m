Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795798635;
	b=R05YZR/85MYxfpr93WP3HUh64hUlUQFBjL7O5rjlKktoWqmj2HUL3QUZg7COu/4ZISzh
	 cazEgSNBi20iMpJhbz+7qELtrHTszGBJbdXfgrv9InBFj8Yb21vw/5hzr0n0aU1Mr0Zsq
	 nvEsDZAP8DWhNcotyXPbtjWrg4FsGEEppC5kOYS4F9mu9/3pIPsQ2/Hvqx/Ci5eV0U/xK
	 mtuICCJf3KFx2vbXkO+PKEXF9JXPvEcW3hJ39gZ6UX78W3ZwjkplDjqV+UKoFl3XKnAvQ
	 LnWDaGntAegoKVaBMt4F9rHv2ZV6u7VD5dV4Cu0Ws/kD44cWec5tiI3XxLuN01UGHEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798635;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2Ua/bbBhiBpwOqFmN+8H2DJaeVPS+kvwmr+FcD0EhAg=;
	b=k9Wd3cuewmc6+x+Khg2Fia62Ep2ghjgqQZBCW1NV/H074d8HBb7bi+ejuNKFAgveAJuJ
	 +zlGpvR9VtVbCDp5XGGZ/U6aZNJxPPI+9ePWwoTCxptQFgtFZCZd/b6VUppvCEfRu+FiC
	 f6u8mjHxDlueE8SnJoFwOuzAlvR9h1t2A0uBjw5IBKBZqLGMv8NVb07gjD6xiE6XlB5IG
	 A/wYr/L7C7iCrSbjFEdWGDf6mkqlhjyreeTEUjjH6nMBJf9gcrp7cmwXMs6GT57RUKUQT
	 6gLPcGacbsJoSUZYoYqZJj5wmSDSnQ5RB8Gj8gv+cKSPO6vUbaQUvC2faHknf3w804Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Vr/egv5p";
	arc=none smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FFA606A687
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:57:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71FFA606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vr/egv5p
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ae2ab35d82so65959811fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795798633; x=1796403433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Ua/bbBhiBpwOqFmN+8H2DJaeVPS+kvwmr+FcD0EhAg=;
        b=Vr/egv5piUaccOKckDsRGs7H6hBXOwrPmOCTzKnH1MTngUNxv32RrO0g/lYoID9stu
         rw0TNZKjeusxJjvjVa18oQf3hVNAa5H82Jl4bwknNG3acyLL4+tPUiBwTT2sKjffbJMN
         a1cmPK0Hcx+U9PG7RRxyhqd2EUdvMZZdPbQD8MbbHrJjHevNWlyIcYtIawXSk1ldH/Kj
         OQhXidNsAcqTgnIWHsTX9C3OsOhUI4cQGRqYt7Km960i6Pt9/Xs8beIMwPgdRkFe1YPW
         C1BziZt1mpmt8wF88oL3anOEe8btlJ3op9SUanK+nlGSvSdQ/JZSCSKi2NCsfYhrExvc
         kEFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795798633; x=1796403433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Ua/bbBhiBpwOqFmN+8H2DJaeVPS+kvwmr+FcD0EhAg=;
        b=bP9XSZaEmpGVWet8WP52RpOdaCVf9grS2WBgSsskfGw9oNd6nL+z+djHYkKwbXP6HQ
         S44tl9NrOqGWUHmxsJZzln8ra8dgRjYEHoUhn93y3z7X1Pt6GbHLTJbqI7QDbxN3kVz0
         GTGVKHtrcDSN5RDkZFqhZ1vcPBDyLA1DYqdpLDfAEED/A2t9VXUajwTjzi4qCxt/TYAM
         wcBi75XlP6Qufb/fQzhKkICadui5+snOSk+uk2WHRoWog5DggwS5r+THxetKRL1OvgjI
         6INpJ6vXZUvnqJ4thQY8p+1zAgz7joLTWw2QYV9o+OWJqNuEVmSLmO089fu+iMqAPsNn
         4d2g==
X-Forwarded-Encrypted: i=1; AL+hErEYF0GrhXzR2IMRlconCbjbPKkuNNPrFlFQKLJ6N0Fib+nj4/ebRTLiwc864DnFrMIATNCFx6PbGTwyh8w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TZotl3Fv9vv1pb4nC/LDJW9wBftMUq3+fm3n5LmzAmp7HJM4B
	dBEpeyYZOr++loLuIIvSUgI9adVIJxypoDd+nCSwD9QKpqkyNnKU/xxM
X-Gm-Gg: AZFdTZehhI3qwrsodqO4h3Zls2UR641kYSJrcph90bMrdtUVz4eBKKed+Dc6g+KgVIC
	5CxcpfUCgx1H9+chMDh4eQ26byZRFPViVj0/o2yuR//+AQm5Vw2i5qymc6VIM6W4DTG8Kr9pBm3
	/cxkJNDyUzEfTSxYUSyf4WArlYNCpx8mybhOEIFipYYUkVeWmGhsYBuXu5XfsBxIn4Mp9N3Gqeu
	q3+FLTWfYZODY0WLlEqVevxRcNCEnafvSXRY9PmqfI2RGay6zjCoVcHeeTYqoTIPb0hwYHTxH5C
	BbDpr5DM73EkV+GpfwPvS7epshv4sMUpseGYx0/jIM7U9UPoieaj7YLT/7QWFuSyMaKQMrp5Wm7
	3tDXhF66DOYgQRwQhlIu7V+7SJvmbimfnaEmLm4iQCeIEXzHj1HEJBuCgBLo9dwR8GokMzWQGqj
	ilrSXJ1H1PmbwySaX7ew7SBVvP28mL79D8/AZRpZOiYkdFX6B5bYZhAzDCtVfZ3lcovAQRtSPbE
	wJlRkjGAYlle3fgUMAC0WgUrI9XSLEJP3bcXFu2Nv2lPO2Rk3vv3lrf5G3u1vP2FRhscfccsCTI
	NKbCC6XSjaxK6NnN8QAesoAC+JZh7tzsS/xgWRPwbz55Jew9K1KsoRSBfw4jdJalitfsl/4=
X-Received: by 2002:a05:6512:6618:b0:5c1:5a43:6291 with SMTP id 2adb3069b0e04-5c3411d0a32mr270887e87.20.1795798633460;
        Fri, 27 Nov 2026 08:57:13 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd04096asm6045081e87.47.2026.11.27.08.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:57:12 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: richard.henderson@linaro.org,
	mattst88@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: linmag7@gmail.com,
	m.szyprowski@samsung.com,
	kuba@kernel.org,
	u.kleine-koenig@baylibre.com
Subject: [PATCH v4 2/2] alpha: enable contiguous memory allocation for coherent DMA
Date: Fri, 27 Nov 2026 17:55:50 +0100
Message-ID: <20261127165626.1352471-3-linmag7@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127165626.1352471-1-linmag7@gmail.com>
References: <20261127165626.1352471-1-linmag7@gmail.com>
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

Select HAVE_DMA_CONTIGUOUS and reserve a default CMA area after the
machine has initialized its DMA windows. Prefer top-down placement
below the direct-map and usable RAM limits. Skip the default reservation
when no direct-map window exists. Explicit cma= ranges retain their
generic override semantics; top-down placement is a preference, not a
hard lower bound excluding the first 16 MiB.

Use dma_alloc_contiguous(), which rejects non-blocking callers, before
falling back to alloc_pages_exact(). Pair both paths with
dma_free_contiguous(), whose buddy fallback uses free_pages_exact().
Skip CMA on the GFP_DMA retry after a mapping failure so it cannot
return the same unsuitable CMA pages. Retain zeroing for CMA memory.

Round the size up to a page boundary in both allocation and free. CMA
allocates size >> PAGE_SHIFT pages, so an unaligned size could otherwise
allocate too few pages and overrun the allocation during zeroing. Keep
the mapping and unmapping lengths consistent with the aligned size.

With CONFIG_DMA_CMA=y, the default CMA_SIZE_MBYTES setting reserves
16 MiB without a cma= argument. cma=0 disables the default area.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Matt Turner <mattst88@gmail.com>
---
 .../io/dma-contiguous/arch-support.txt        |  2 +-
 arch/alpha/Kconfig                            |  1 +
 arch/alpha/kernel/pci_iommu.c                 | 20 +++++++++++++------
 arch/alpha/kernel/setup.c                     | 15 ++++++++++++++
 4 files changed, 31 insertions(+), 7 deletions(-)

diff --git a/Documentation/features/io/dma-contiguous/arch-support.txt b/Documentation/features/io/dma-contiguous/arch-support.txt
index 3c6ce35d704f..6cd205a991f6 100644
--- a/Documentation/features/io/dma-contiguous/arch-support.txt
+++ b/Documentation/features/io/dma-contiguous/arch-support.txt
@@ -7,5 +7,5 @@
     |         arch |status|
     -----------------------
-    |       alpha: | TODO |
+    |       alpha: |  ok  |
     |         arc: | TODO |
     |         arm: |  ok  |
diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index e7e7cb37d670..79700e350603 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -32,4 +32,5 @@ config ALPHA
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_DEBUG_KMEMLEAK
+	select HAVE_DMA_CONTIGUOUS
 	select HAVE_GUP_FAST
 	select HAVE_KERNEL_BZIP2
diff --git a/arch/alpha/kernel/pci_iommu.c b/arch/alpha/kernel/pci_iommu.c
index 955b6ca61627..6298618aa7e1 100644
--- a/arch/alpha/kernel/pci_iommu.c
+++ b/arch/alpha/kernel/pci_iommu.c
@@ -409,13 +409,19 @@ static void *alpha_pci_alloc_coherent(struct device *dev, size_t size,
 	struct pci_dev *pdev = alpha_gendev_to_pci(dev);
 	void *cpu_addr;
-	long order = get_order(size);
+	struct page *page;
 
+	size = PAGE_ALIGN(size);
 	gfp &= ~GFP_DMA;
 
 try_again:
-	cpu_addr = (void *)__get_free_pages(gfp | __GFP_ZERO, order);
+	/* A low-memory retry must not return the same unsuitable CMA pages. */
+	page = (gfp & GFP_DMA) ? NULL :
+		dma_alloc_contiguous(dev, size, gfp, dev_to_node(dev));
+	if (page)
+		cpu_addr = page_address(page);
+	else
+		cpu_addr = alloc_pages_exact(size, gfp | __GFP_ZERO);
 	if (! cpu_addr) {
-		printk(KERN_INFO "pci_alloc_consistent: "
-		       "get_free_pages failed from %ps\n",
+		pr_info("pci_alloc_consistent: allocation failed from %ps\n",
 			__builtin_return_address(0));
 		/* ??? Really atomic allocation?  Otherwise we could play
@@ -427,5 +433,5 @@ static void *alpha_pci_alloc_coherent(struct device *dev, size_t size,
 	*dma_addrp = pci_map_single_1(pdev, virt_to_phys(cpu_addr), size, 0);
 	if (*dma_addrp == DMA_MAPPING_ERROR) {
-		free_pages((unsigned long)cpu_addr, order);
+		dma_free_contiguous(dev, virt_to_page(cpu_addr), size);
 		if (alpha_mv.mv_pci_tbi || (gfp & GFP_DMA))
 			return NULL;
@@ -453,6 +459,8 @@ static void alpha_pci_free_coherent(struct device *dev, size_t size,
 {
 	struct pci_dev *pdev = alpha_gendev_to_pci(dev);
+
+	size = PAGE_ALIGN(size);
 	dma_unmap_single(&pdev->dev, dma_addr, size, DMA_BIDIRECTIONAL);
-	free_pages((unsigned long)cpu_addr, get_order(size));
+	dma_free_contiguous(dev, virt_to_page(cpu_addr), size);
 
 	DBGA2("pci_free_consistent: [%llx,%zx] from %ps\n",
diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index f21a7c8f5213..f40a87b30a7c 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -32,4 +32,5 @@
 #include <linux/platform_device.h>
 #include <linux/memblock.h>
+#include <linux/dma-map-ops.h>
 #include <linux/pci.h>
 #include <linux/seq_file.h>
@@ -585,4 +586,18 @@ setup_arch(char **cmdline_p)
 	parse_early_param();
 
+	/*
+	 * Prefer higher memory within the direct-map window, rather than
+	 * consuming scarce low memory with a bottom-up CMA reservation.
+	 * Explicit cma= ranges retain the generic command-line semantics.
+	 */
+	if (__direct_map_size) {
+		bool bottom_up = memblock_bottom_up();
+
+		memblock_set_bottom_up(false);
+		dma_contiguous_reserve(min_t(phys_addr_t, __direct_map_size,
+					     PFN_PHYS(max_low_pfn)));
+		memblock_set_bottom_up(bottom_up);
+	}
+
 	/* Reserve standard resources.  */
 	reserve_std_resources();
-- 
2.43.0

