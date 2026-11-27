Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770487;
	b=1/tZkXpwzf2nHbFJkCEQPJ9023/a6qVDlJsFVzBqggkJUxnHJE+dx21+i5P7akfPy3ni
	 ykzWz13hTAUcp6/IPJZq2GmbC7pnsFmElLlyc+XKC/5eK6PfEPbuv91tXIfA3psf9xCxJ
	 sQv2r0a0afpTkezs7pEd3QQt8gZCm3SreuXLNGIxqNXeEZmLe78YUkYnzwx4yN7fdaz7l
	 pbzA2nlHdlzxXxf41uWYb3DRCQuRbAr0wTKLjnE6A1QMNtVkKS0nu9yzuQKDuzQhX6eL0
	 b3R47VmsB9MWi36meNmrKdVak0G0uyrsKVfL6ngrxDZIttjwFhu9tXTcLlf6OQCQIkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9Yac15kv4zUJMw/dFjjqld9TLsvrPI7GRE4h7XfVDwk=;
	b=DdmIETSalr3IahiaMq+BD5LU0fSVgk52Nm9ayjoATn1IBElVhZEZaQpOf+04AW3JDmhY
	 C61MZpoMqsaTFa0X8iyqD66hx93qmqccVBEDzlK3SOI26CgPrJm/azOBNAR3zLtsnSFtL
	 UawXLAD6VxJDTdNbJDN8P399SabrvS5hM8NabRaRwzrPgo1kXJuQp9Mn6aS5Y15JN18Rz
	 p62piHDFlrfNLEczqcIdVBXoz5jTZq8KdrstRAh+WQ7MBrYGqwFP2W6Dv1fXsDQcKHUUJ
	 /nEG/GuotJizDEoO12POx0JBMEOQhcNjQvlmIcyPQjjYGQ6d1TwYD6fvxDVsJidZCtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PFrZ1uxL;
	arc=none smtp.remote-ip=74.125.227.128
Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDD6606A327
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:08:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDDD6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PFrZ1uxL
Received: by mail-pj2-f0.google.com with SMTP id d9443c01a7336-2efd15c7545so26514255ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795770486; x=1796375286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Yac15kv4zUJMw/dFjjqld9TLsvrPI7GRE4h7XfVDwk=;
        b=PFrZ1uxLaO4RDH+PhRsSjoInODl+4hrMnrfKk11NeHcZVYKpeS6sdzR6H0htQiospT
         wcrfy4aJxc9p5lsSX1mch0whG0ZzTAt3S2y6AvQMZcLkoy8vxTSW2tafL4G48J5DHglu
         SApN5yqSyCSkJdsKlmx8wB/8VJt6ramQu7sOKZCaqnsgUs0PzF+2tfR0GATwBTKcKhAb
         JYG23LrHQg6RUIfr5M5nBx870xPoO3t3VUsXSDFIn/fMtgLL/TBmY8fUNUL2zp926xtL
         kQkfjqh71uGP54ffG7BlHcGxKtfzGdnkVkh0qL0QYQI3kX40ZZSeQDIhsRKDS/rvlC6n
         F4jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770486; x=1796375286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Yac15kv4zUJMw/dFjjqld9TLsvrPI7GRE4h7XfVDwk=;
        b=ZooPUUebm3K0gmBduGIjWgOHo2Ba/e19KJHN+zkxvjAxeO5uxcs67WospcdywKOfCM
         +CKFWFjUG2GBTAi6iiwGWsotHfaLxBnP6SV7GoeZQSxlUOhR9zThgVfXqF7f0ZoqdoKs
         dXfd9Br0Q6oCxiyiEishR7vvRvW+inOzHk64TSodDBPPtaMSEE6lqoD2+xE/7ToOYdHK
         b7mc1NcMhqe8u2S9SaGnyykS1qgXA6W9UGZG99Mw3U2IFajlR3Jqfc4HUKCXeLqlA3hz
         yt6comiR2OJ66EpyCsCe52ZbJ5q0EkOQVt6Yd3x77y7dGu6U3fNfXlIq1ibzRmMuN22H
         sVRg==
X-Forwarded-Encrypted: i=1; AL+hErFCRCaoHhrU+6+mC9xqgapujQRZU/7nVGjlnTkBb4CVXvHKNhrseAC2jELrmj8SdlXw673e18DTwmN21cg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+27E35i/TDHVX29fWJgaRqjATdnbW9fTEbMQ6rIv/hsd6XndGI
	fCJIukSKCPGo556FqUwWFKDhahI4DtcZMC5eWP1XcTxEHBuZ0A/rHUR0
X-Gm-Gg: AZFdTZflf/TA3QjTh/qrQhLjzca98wryy/rhKOwihMK6EZvgKlHWks22ik7jdZ1Bpaq
	fzPZWL/d00Yb+VuGwxly7Am07+HSXSnP5QZStEB9e5tNlyzCYIzyQpT2XvmZ6H7HomQHeprtmhM
	7FNVpT4+lROT84uoh3yPr3yyc1MdnTZSiYhbaDT1foFrgd/YTrAvyEIfFRljG+rQTY68sOjvlpa
	FVFn1shMxhp5KvSVggclHHUQUKL3lfneh0qiBLjM/99Y0VIcV9RKOOb5ooORHjzvpSiTsalCy/z
	JqPVNhj3MvUrDU2upSUtED14BybkMPxefn/KKUgOJgUncGU5JEpBUg/jF1UOVEFerN4tW1bzx67
	2X1StALB+Ahkp0QSr6pr2hfhYhm/b5Zacb9IX8KyxbHWGD4Z2VJiEiJfpkIwPeF9gWlDcByRnn6
	4fybGvLHlwBXZBxtr6B6ow/jq7rgk09QRSp/Yca5himGaB7i9Kr0Aya1K578VIsm3uK7D1/Esvh
	iJ276yNPxMCrsOndSLoMPLQdmUMy45cRjzJuKUoQt9Xvmy3DIhFshlpGsVLlcL2dubBohh6XUXp
	C87qUjdnh/4+jlPE0ihPy4SjqU765cZ1mXRFfJwt0Q==
X-Received: by 2002:a05:6a21:8803:b0:3f9:292e:775d with SMTP id adf61e73a8af0-4014bc4b4abmr19459218637.49.1795770485952;
        Fri, 27 Nov 2026 01:08:05 -0800 (PST)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d06ee37sm11718725a12.28.2026.11.27.01.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:08:05 -0800 (PST)
From: Wandun Chen <chenwandun1@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	ruanjinjie@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v10 2/8] crash_core: fold duplicated memblock arch hooks into the weak default
Date: Fri, 27 Nov 2026 17:07:17 +0800
Message-ID: <20261127090723.741253-3-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127090723.741253-1-chenwandun1@gmail.com>
References: <20261127090723.741253-1-chenwandun1@gmail.com>
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

From: Wandun Chen <chenwandun@lixiang.com>

arm64, loongarch and riscv open-code the same memblock walk in
arch_get_system_nr_ranges() and arch_crash_populate_cmem(). Move it into
the __weak defaults in kernel/crash_core.c and delete the arch copies.

No functional change.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Baoquan He <baoquan.he@linux.dev>
---
 arch/arm64/kernel/machine_kexec_file.c     | 29 ----------------------
 arch/loongarch/kernel/machine_kexec_file.c | 27 --------------------
 arch/riscv/kernel/machine_kexec_file.c     | 26 -------------------
 kernel/crash_core.c                        | 27 ++++++++++++++++++++
 4 files changed, 27 insertions(+), 82 deletions(-)

diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
index 14f453dd0946..18695f01043c 100644
--- a/arch/arm64/kernel/machine_kexec_file.c
+++ b/arch/arm64/kernel/machine_kexec_file.c
@@ -14,7 +14,6 @@
 #include <linux/kernel.h>
 #include <linux/kexec.h>
 #include <linux/libfdt.h>
-#include <linux/memblock.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
 #include <linux/slab.h>
@@ -39,34 +38,6 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
 	return kexec_image_post_load_cleanup_default(image);
 }
 
-#ifdef CONFIG_CRASH_DUMP
-unsigned int arch_get_system_nr_ranges(void)
-{
-	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* for exclusion of crashkernel region */
-	phys_addr_t start, end;
-	u64 i;
-
-	for_each_mem_range(i, &start, &end)
-		nr_ranges++;
-
-	return nr_ranges;
-}
-
-int arch_crash_populate_cmem(struct crash_mem *cmem)
-{
-	phys_addr_t start, end;
-	u64 i;
-
-	for_each_mem_range(i, &start, &end) {
-		cmem->ranges[cmem->nr_ranges].start = start;
-		cmem->ranges[cmem->nr_ranges].end = end - 1;
-		cmem->nr_ranges++;
-	}
-
-	return 0;
-}
-#endif
-
 /*
  * Tries to add the initrd and DTB to the image. If it is not possible to find
  * valid locations, this function will undo changes to the image and return non
diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/kernel/machine_kexec_file.c
index 0fe60907b97f..bef459287683 100644
--- a/arch/loongarch/kernel/machine_kexec_file.c
+++ b/arch/loongarch/kernel/machine_kexec_file.c
@@ -13,7 +13,6 @@
 #include <linux/ioport.h>
 #include <linux/kernel.h>
 #include <linux/kexec.h>
-#include <linux/memblock.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/types.h>
@@ -56,32 +55,6 @@ static void cmdline_add_initrd(struct kimage *image, unsigned long *cmdline_tmpl
 }
 
 #ifdef CONFIG_CRASH_DUMP
-unsigned int arch_get_system_nr_ranges(void)
-{
-	int nr_ranges = 2; /* for exclusion of crashkernel region */
-	phys_addr_t start, end;
-	uint64_t i;
-
-	for_each_mem_range(i, &start, &end)
-		nr_ranges++;
-
-	return nr_ranges;
-}
-
-int arch_crash_populate_cmem(struct crash_mem *cmem)
-{
-	phys_addr_t start, end;
-	uint64_t i;
-
-	for_each_mem_range(i, &start, &end) {
-		cmem->ranges[cmem->nr_ranges].start = start;
-		cmem->ranges[cmem->nr_ranges].end = end - 1;
-		cmem->nr_ranges++;
-	}
-
-	return 0;
-}
-
 /*
  * Add the "mem=size@start" command line parameter to command line, indicating the
  * memory region the new kernel can use to boot into.
diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index dad7f02365d3..fdc6695e8588 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -37,32 +37,6 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
 }
 
 #ifdef CONFIG_CRASH_DUMP
-unsigned int arch_get_system_nr_ranges(void)
-{
-	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* For exclusion of crashkernel region */
-	phys_addr_t start, end;
-	u64 i;
-
-	for_each_mem_range(i, &start, &end)
-		nr_ranges++;
-
-	return nr_ranges;
-}
-
-int arch_crash_populate_cmem(struct crash_mem *cmem)
-{
-	phys_addr_t start, end;
-	u64 i;
-
-	for_each_mem_range(i, &start, &end) {
-		cmem->ranges[cmem->nr_ranges].start = start;
-		cmem->ranges[cmem->nr_ranges].end = end - 1;
-		cmem->nr_ranges++;
-	}
-
-	return 0;
-}
-
 static char *setup_kdump_cmdline(struct kimage *image, char *cmdline,
 				 unsigned long cmdline_len)
 {
diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index d0bd2d0cf899..faa0f22dbb41 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -281,8 +281,35 @@ static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
 	return cmem;
 }
 
+#ifdef CONFIG_ARCH_KEEP_MEMBLOCK
+unsigned int __weak arch_get_system_nr_ranges(void)
+{
+	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* crashk_res + crashk_low_res, +CMA splits */
+	phys_addr_t start, end;
+	u64 i;
+
+	for_each_mem_range(i, &start, &end)
+		nr_ranges++;
+	return nr_ranges;
+}
+
+int __weak arch_crash_populate_cmem(struct crash_mem *cmem)
+{
+	phys_addr_t start, end;
+	u64 i;
+
+	for_each_mem_range(i, &start, &end) {
+		cmem->ranges[cmem->nr_ranges].start = start;
+		cmem->ranges[cmem->nr_ranges].end = end - 1;
+		cmem->nr_ranges++;
+	}
+	return 0;
+}
+#else
 unsigned int __weak arch_get_system_nr_ranges(void) { return 0; }
 int __weak arch_crash_populate_cmem(struct crash_mem *cmem) { return -1; }
+#endif
+
 int __weak arch_crash_exclude_ranges(struct crash_mem *cmem) { return 0; }
 
 int __weak arch_crash_exclude_mem_range(struct crash_mem **mem,
-- 
2.43.0

