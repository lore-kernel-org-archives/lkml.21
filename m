Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770514;
	b=TydZ6f0XGCJG0WeKvs+RHjfw9+4+WIKW6Nt2eGpdqdNJKteU374TtroylSMTF/uv84GS
	 gsGLiK3y/VLM6J/6zdhNAiPtk71dRGCUs6HyGCvYx44H9/6ZHnmTJzicKUJkQSu7uzQEV
	 Bpe4V5HhEJvwHQ1CQzQ9KfRXneOmG07vopdNayUBvVQOznKbof05RnijGsOnl1TYp1Xfh
	 99RiULEfSMMdzTaBXxRPAU97vUSklmQMNDMLfxwJpgGAJ6zDXVE0kaCWrGB0ZWG/ovrIw
	 Z28GoYnBBZfablcTMxJWgQjTRSd2bIWZv0b2nYXi4vBDOIdQi4Hsv2BgT4lVuYMSsWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770514;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=s7Fb6KtcWAXnUfcecLaSQ1H6J8YKvEJFUWN8A6hcpOc=;
	b=OK6P6E/3CC94bOZqTlePk4sXQHE/R+PQWmRYaIlVB8SlU5LG41Ql1DaTjotK0gf6Sd4U
	 eaxSzNopofYVz4ukqPpBJJWPHA7oFq3ZyKZKakE53ahZNIEArxp29rAhqjPutdLVmRVs6
	 t3gKUluyx1mBYL2KVhBEsUqtoBONiKg40/px3AYVaXDK7eP3S6b7eprnI+X+Pq+EkJ3au
	 MYRsdgS2QE7Bu0weX30wbRH+1+DTaeA5mrw2yaxqVSDEVBADd3b7YdFV6KIXJla9s5qxT
	 z9D/LgnBrE4GUHsBg0wNb6jWId+56z5yZUKyBKnSkGhUgzRGi7NdAqfsRO0htbdzuaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pFYR3bRb;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDA7606A323
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:08:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FDA7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pFYR3bRb
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-3b3d125637aso1562501a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795770513; x=1796375313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s7Fb6KtcWAXnUfcecLaSQ1H6J8YKvEJFUWN8A6hcpOc=;
        b=pFYR3bRb6D7g178abr52Dt8x81iM9fdudu9LdUPBfxowlHul//wOvtb1d1LfTqujI0
         iacEDdSiNevFkd8KRcZDEQYhpLrBWppFmE2yOz7gul1wR5Ie3Vqu5zHfxj2oPGizr8UP
         1Q+Nlfy0iergSG+qyFc7v9Tz1qfUL+BwUKwxWNnAlSn7T/7ZwBPWSBXv97hFHUp0hSX8
         RHPNXBrH6WXgNFUZedHC3sa4TPsYJFC3AbY6Cyj31aJeILTzxWmhPtaQvtSlIZ8TM1dH
         brOC2K/PPayfCIx9y36w5tbd6z5ji2wcpFscbwj/XiA1myW4lX32Y8FW0gx9Jfujxkjf
         6T7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770513; x=1796375313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s7Fb6KtcWAXnUfcecLaSQ1H6J8YKvEJFUWN8A6hcpOc=;
        b=PVK3rWgxX7GejWGcsp6TdwyoVCRYBjtI1yX2Qxxc+yciDRUte9xnhbNs3q51j+OgGC
         jkBJCykaEgShe4V7Gqa1kW7y8ZpXadxOOVr+/100S+Ia4dVZcV8l0UukqB9/yOuQrIgB
         UDjLETIgIDIJfiN6V+3Td6yWMPemqtXGQc6fweTeKgJiRQT6mj4AL5Fdd3q6CM4ALNTe
         fIrVr7LIajFIx7KPomLBY7OMK4PLZm16kU98HlgDW/s8lXT+Ll9PTofPfblMJFhw56QE
         pg7t493C8Xi0X56Wa4RnINrPe7m1Ey0MwxAEUUbylGP9IPGuiPoFA3jqPpE+2S6Uibr+
         5WCg==
X-Forwarded-Encrypted: i=1; AL+hErEIADP0tW9VYvhmFCq5KMxr6fiP1k8jd2T2M+gxDjbeYqx0Dy9lNyOPY/6Ejrwt+JWjmbakaVquzu1uiCk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/a9o6GCeDLsVZrnxuveSUHMAP+Gy2oNonMRk/9UvzcYXTk4X8v
	75RX7qa4kGRMQP6itRBGw1Cio5NmRAeQEC4aEM83/WCyO2y0N2AaYDmD
X-Gm-Gg: AZFdTZf6ybPTQnPKcLHJ8owHV2Vm3MqWFnN0JlfntsDO1z0Nes7NVKWcctKKiiUyL8X
	HvCAuYGfrLpEgjC5PmrGm7FBxR5HKVLksixWzHxZ3mmykiT35WQRhL1dqF6Gyr4blcFf65kGx28
	EhfxWrI1ABZLMS7fwP0dCQ3jRtGlu3HTdftgwD/6BmIlTyCi4btzk3XOJwci8YFBOn/ZWlaKRqy
	7CCVsFWbu1l4ks4JpfS7YLZSKlGwDm2bhF6Vt95aN+9fWVteuOw5Tymv0nSaKN3tX15bP6J8WWy
	DWZ58435xoe3gYa68nSdLoiCgCGne/0HlxL2kHhTOQU4Fp+B0KVP7LnYlbG16Y1WEtgSyzPWWdz
	TX5lBa7szWWtB8EQKDivWwy+bbl/6N4YIUGMI1K7FE8z93XICe6oCxlfc8q6jwSSQxsP9ndPXcq
	NeZL3hpg7W6UFGKOslx7ursRZHMAqxWNBml6TKCtHNXyQGN3vJKgu+BbrWY1DXbPLXEeu6Hgt0F
	LwoNbLDYr6mydm/e4gDx5e9HlZfF3JJ62s4FWnPxijlH1UeMQk4fV7+f2v7fxP5qG4hWGRRJc6c
	gVflhzD0VGLAy7rviZidt0T/Y8wIQnP3l6kIBvQXSw==
X-Received: by 2002:a17:90b:554d:b0:3ad:d29c:5e64 with SMTP id 98e67ed59e1d1-3b41c9b361fmr22966937a91.65.1795770513277;
        Fri, 27 Nov 2026 01:08:33 -0800 (PST)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d06ee37sm11718725a12.28.2026.11.27.01.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:08:32 -0800 (PST)
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
Subject: [PATCH v10 4/8] crash_core: replace for_each_mem_range() with for_each_mem_region()
Date: Fri, 27 Nov 2026 17:07:19 +0800
Message-ID: <20261127090723.741253-5-chenwandun1@gmail.com>
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

for_each_mem_range() skips MEMBLOCK_NOMAP regions implicitly. Switch the
weak defaults to for_each_mem_region(), which exposes struct
memblock_region and per-region flags, and filter NOMAP regions explicitly
via the new crash_should_skip_region() helper. This prepares for a
subsequent patch to extend the skip filter.

No functional change.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Baoquan He <baoquan.he@linux.dev>
---
 kernel/crash_core.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 8a861a946e26..e161c8b65e00 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -283,25 +283,34 @@ static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
 }
 
 #ifdef CONFIG_ARCH_KEEP_MEMBLOCK
+/* Exclude NOMAP regions from the vmcore. */
+static bool crash_should_skip_region(struct memblock_region *reg)
+{
+	return memblock_is_nomap(reg);
+}
+
 unsigned int __weak arch_get_system_nr_ranges(void)
 {
 	unsigned int nr_ranges = 2 + crashk_cma_cnt; /* crashk_res + crashk_low_res, +CMA splits */
-	phys_addr_t start, end;
-	u64 i;
+	struct memblock_region *reg;
 
-	for_each_mem_range(i, &start, &end)
+	for_each_mem_region(reg) {
+		if (crash_should_skip_region(reg))
+			continue;
 		nr_ranges++;
+	}
 	return nr_ranges;
 }
 
 int __weak arch_crash_populate_cmem(struct crash_mem *cmem)
 {
-	phys_addr_t start, end;
-	u64 i;
+	struct memblock_region *reg;
 
-	for_each_mem_range(i, &start, &end) {
-		cmem->ranges[cmem->nr_ranges].start = start;
-		cmem->ranges[cmem->nr_ranges].end = end - 1;
+	for_each_mem_region(reg) {
+		if (crash_should_skip_region(reg))
+			continue;
+		cmem->ranges[cmem->nr_ranges].start = reg->base;
+		cmem->ranges[cmem->nr_ranges].end = reg->base + reg->size - 1;
 		cmem->nr_ranges++;
 	}
 	return 0;
-- 
2.43.0

