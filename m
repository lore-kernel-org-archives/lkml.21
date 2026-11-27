Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.202
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770474;
	b=L4V/FoxtvUIFpw54ThXzNJcLbB8g63gCkna4lX41qI5GaQRVFEqRmGlaKcGSfzIPb78c
	 hg3eysIKCK1DJpfepmAb8g9g7Sa9tXPxg1yzL318F05dVA4b3KAmTwT+H/Lrokyfd/XQf
	 rkNgY5For4MOQY3YB1q5S/QcmTm4xS2nCR+bgTOgGd+hsX7bFXW8WbXg599h/qHPiUpRT
	 eKeIrehPOWTtUUWauF0m0leB/Sj62dWUXc08lxDzLYs0LXgsjR5zGzR+16tLdrVd9Rrb8
	 5X+727L8YPiVwO4naHyON/RLlYfi3ZJNi1qpFdoTNLMK8ZUSe5s4wXx+UjNAXTGJIOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dn1PH2ygUv/59VEsbUK76gNJjYdjlSTbo9l6L4HVgfw=;
	b=W64GDAQFvkLVO5eCfeKPCrWI/xamkrkmnJSQhCrrDikVGiIQiU+673y2RCl8JCcuvHTQ
	 kiJbXunfoTZdX35KvxewzpB2K+7cPm4cmS7py47/rXvMlotL4Ije2HheSKSZJe3mK4dqs
	 yiilH9owTNXbx6h4/qPrwo9bcQgMk2ciZ6NBjelOFRQ7DaWOkEjNGbxitxjVSegN5I1MF
	 QtNcR2YHU92ro1Twr6jiFUhU/IYCqadBwcgg2wVPyaz77LDBA6kgHltqAFHVLEmy8pwET
	 kruEnBHXIFt8EU6gn6pfIBTrfW6HxkpGMOoPq7wZrKJwfBjmGrCiH9S9xXVmOUnjHNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i4ohQFZ1;
	arc=none smtp.remote-ip=74.125.227.202
Received: from mail-pi2-f10.google.com (mail-pi2-f10.google.com [74.125.227.202])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2038A606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:07:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2038A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i4ohQFZ1
Received: by mail-pi2-f10.google.com with SMTP id 41be03b00d2f7-cdac0ac5f19so3860072a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795770473; x=1796375273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dn1PH2ygUv/59VEsbUK76gNJjYdjlSTbo9l6L4HVgfw=;
        b=i4ohQFZ11L1fY4R3zHgK5pB6C7y9uR8DJj1aJsFKzbKFo+V6sNKht5dbq9wAPMUjTu
         CLvF+t0HIxhRfwdlVRWMmuiIwRjIW4w4tEiv7MYTczuyOUPkx92NkdE46x5rOQIXEUyB
         eXhT2XacgtgeBEZfPrmX4GEFt481BXkAAkYMnaCnbP0nOVyunKKHA6o7m9zKxPCBpNuz
         4ByeuuHR1Uxs+V6K9wOMkfx1fPIpALl+iOdUZTWtO1GvJn0WAM69oj4ykahjgcqx2/+Y
         HFWn7EYVttYgaMSGU5s6sdrN0cr2775WhOpeRQqasGAiZynAHZIztpA6LYKP8kzVVh0D
         a+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770473; x=1796375273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dn1PH2ygUv/59VEsbUK76gNJjYdjlSTbo9l6L4HVgfw=;
        b=zWJ10SyU2itbe8/+URdfGmlEMpzEmENqe8nsW/XELEr77ZdZAXJq0v52N41ZOviHyc
         1UDRyQ34XIGK0rlOqofPpds/P6RYhYytjeXKM9OHmVQG5/vDT+GMPOyjvabHj9Q83BzQ
         Ldg6vzgzcr8Z4QFFjiR1qy5ReOjt7rn/aXhnyg3hfi6qZDqpkN8Nw2qCizyu1mHmg7oy
         SS94SX+eFTlizg7yOqRf/3ChzK9de0MC/5dXj8FV5qPzLiW1QEXQhITnGBtIVMAKTG5z
         sHtww873Bo4kST8Vo0VQcG6fgTgMjfi34LuCQqvBWvQABTdBE3n4k7WTwiOAooOyXwjh
         P8Qg==
X-Forwarded-Encrypted: i=1; AL+hErFlVEtUM/X1H4QCrDnNjnN4pYGpLs7GPzluSRjN8W9xPidH4QJarAF6PAP9l+AKhEjvGLP6SF7TIiRKgLA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ubb6JD53OHugpYeHexCGkv83j2VnQIFuG4q3ra9kziAglLbBX
	iYi1LvKYBH5sCOiiyHzhyN8pfbQcNiZkb7YuF2R0FJXOUJWhEmYqqFUD
X-Gm-Gg: AZFdTZcSHQ5mQOH3Wwq4ZL8TJaSp6fRx1AKRfkNFYijqWMWw4nflIHJIvFjZUFlwuCb
	+6Zl55hlVnVHZUaanjeclk6pftW9N6egeQnaAq4vtL0L6XWUV5r3FQQGS6ExrOAW4M3gw5lTwj+
	nfdo2p5K/lAJVrxZt5etN5g4U6RcE4W9mquJmIzRf4DhKHvvegLpRX9oyzURY2tIPKjOgjkPRqY
	CvBvAwStwXjIYXLleaHPXZqdjlpP+hDldO09yZPTQ2H+Jqdgs7OoQGGrIZxQ5cn6QCy4aw/7HzQ
	4kNs40aQTICezJNdhnDdjQeguh9SU3SBuH6Kki4rTo8YXwaX2uWfh0zckd6ok1WfElEIE9tbXO7
	AQ8BP/CVwrZ+PBOT9rhoT2oO6ZKDXdssUSfm/SiMHTwoQTZf2LkUzhxpAI0g4iK3ybhPQsN74qS
	/mIG02nd+JnG0fz66S9/KLOxvZkY1+BJzoq8OkYaJ8hJCI1pvHU7P0oycgaZN25lUyojG2kF521
	cjkobxysUiRwRvb3pNpriMhrbSnoltA5Gv1SfXXDwjAwJ0Fsz8AfJPgcm7wR1j6lu7TeOhGX0uv
	4YacBO7YRDp3rgOjbMKzB7jqs4YjC9ghoG/56Gbj0w==
X-Received: by 2002:a05:6a20:7c20:b0:3de:557e:5ea6 with SMTP id adf61e73a8af0-40283cbd05cmr14085693637.27.1795770473349;
        Fri, 27 Nov 2026 01:07:53 -0800 (PST)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d06ee37sm11718725a12.28.2026.11.27.01.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:07:52 -0800 (PST)
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
Subject: [PATCH v10 1/8] riscv: build crash_mem ranges from memblock instead of resource tree
Date: Fri, 27 Nov 2026 17:07:16 +0800
Message-ID: <20261127090723.741253-2-chenwandun1@gmail.com>
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

Replace walk_system_ram_res() with for_each_mem_range(). A later patch
introduces MEMBLOCK_NODUMP in memblock, the reserved-memory regions
marked with MEMBLOCK_NODUMP can be excluded from the vmcore by walking
memblock.

for_each_mem_range() iterates memblock.memory, which is freed after
init unless ARCH_KEEP_MEMBLOCK is selected. riscv needs ARCH_KEEP_MEMBLOCK
to filter reserved memory from the vmcore, so extend its condition
(ACPI || KEXEC) with CRASH_DUMP. arm64 and loongarch already select
ARCH_KEEP_MEMBLOCK unconditionally.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Baoquan He <baoquan.he@linux.dev>
---
 arch/riscv/Kconfig                     |  2 +-
 arch/riscv/kernel/machine_kexec_file.c | 31 ++++++++++----------------
 2 files changed, 13 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index bffef6b903e1..0a426475a9fb 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -58,7 +58,7 @@ config RISCV
 	select ARCH_HAS_UBSAN
 	select ARCH_HAS_VDSO_ARCH_DATA
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
-	select ARCH_KEEP_MEMBLOCK if ACPI || KEXEC
+	select ARCH_KEEP_MEMBLOCK if ACPI || KEXEC || CRASH_DUMP
 	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE	if 64BIT && MMU
 	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index 26cd2a8bd0cd..dad7f02365d3 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -37,39 +37,32 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
 }
 
 #ifdef CONFIG_CRASH_DUMP
-static int get_nr_ram_ranges_callback(struct resource *res, void *arg)
-{
-	unsigned int *nr_ranges = arg;
-
-	(*nr_ranges)++;
-	return 0;
-}
-
 unsigned int arch_get_system_nr_ranges(void)
 {
 	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* For exclusion of crashkernel region */
+	phys_addr_t start, end;
+	u64 i;
 
-	walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
+	for_each_mem_range(i, &start, &end)
+		nr_ranges++;
 
 	return nr_ranges;
 }
 
-static int prepare_elf64_ram_headers_callback(struct resource *res, void *arg)
+int arch_crash_populate_cmem(struct crash_mem *cmem)
 {
-	struct crash_mem *cmem = arg;
+	phys_addr_t start, end;
+	u64 i;
 
-	cmem->ranges[cmem->nr_ranges].start = res->start;
-	cmem->ranges[cmem->nr_ranges].end = res->end;
-	cmem->nr_ranges++;
+	for_each_mem_range(i, &start, &end) {
+		cmem->ranges[cmem->nr_ranges].start = start;
+		cmem->ranges[cmem->nr_ranges].end = end - 1;
+		cmem->nr_ranges++;
+	}
 
 	return 0;
 }
 
-int arch_crash_populate_cmem(struct crash_mem *cmem)
-{
-	return walk_system_ram_res(0, -1, cmem, prepare_elf64_ram_headers_callback);
-}
-
 static char *setup_kdump_cmdline(struct kimage *image, char *cmdline,
 				 unsigned long cmdline_len)
 {
-- 
2.43.0

