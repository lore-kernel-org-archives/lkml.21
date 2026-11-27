Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770552;
	b=rguSuJkrNd/175Hz8B6esXb4gmSDDgCedgpD2Rxf8AkyWje3QAr3EpsAMnETIq828q4Y
	 +whnkZiy7Zd1jRH5q8Ydl1Ah0OgTqQqRkQAraXsBwCtItJFSr+AirxvqSkEVccRb+C/b9
	 VsyF3MDGexu8iKKC9N5JPemKb9McyMmvw8QNTw40ADEP8tnnrsBCZxGxQe3tidjz8RhlS
	 bjG3iiEkGi6JoLt6mdSVhAAk4UFTHSHavacIM5m8vqvLe6kw0rDGiQYdjU9jUM20QgOzY
	 XVGeYv7EBKkEz6CboJOLygv081/8QoWpG59+EiGwNyzjeagYVJvef0bqzQGu0PklupA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vXO/Y/CYrpQIxWyPESy68yxl237JHlY56bkJQSv87LI=;
	b=bxPVfhEUbIM91f4eCvNvR+LybBkzT6aZx5VFcuZoesrwUZjbuG2DdqtYnaQLrkAD+wqm
	 6Btf/Z4SWJDdghYPX0hNEdxLQkcP3Atuv8HuzdDHNt8J4pytrI7vYC2CR960RWXAX121/
	 +kyW08Ep/sh7yqJQ9tYzngiRiJ0KOGDctnppBW7JhXwkcgL86qJ3g78kFPJUgWXYvd4eY
	 7lzR2/U+PDE5kfhyAEoq7rAUC7fRPP7/QEUYNWGL1GvTgnhKIc8+2peiBrLVoa/iVSB/L
	 qkovzP1MG9Av+3zWvxOOjWu10CHma3KRdKfoO/S3vAHZconaUU+RiBNlrCNA7xlRVsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SkuZz+mJ;
	arc=none smtp.remote-ip=74.125.227.128
Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350C7606A326
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:09:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 350C7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SkuZz+mJ
Received: by mail-pj2-f0.google.com with SMTP id 98e67ed59e1d1-3b094d5f1b4so1403215a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795770551; x=1796375351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vXO/Y/CYrpQIxWyPESy68yxl237JHlY56bkJQSv87LI=;
        b=SkuZz+mJDHOk9OFN2WwbkiZTq9QdyGqBwYx2wB0aGL9C0ZOF4UE75bp4ZvBUKlKlgi
         yYlNhjvqV3wZJ0BQt8bcQcIK2f6FLuVTgsVAy0w9OHAz6FbBCtZ/T9Iu6qoFG1GGqZLz
         qtm1VLW+e+ZneQW6+R8aBU/HD4P9SwDsANs81TPYD/3dVMZJll5dZdKvPM/TUjVDUAD5
         uPrKsouF7XojyWAayGkKGRLeGRymQgGQJrLsP89fKldRuDHFqWd9bThBZjvbi/mq9y6z
         ipzbPqymnl+/yUvmud7LTPm/sho60kmnH5tdMmzP04Fch3YRBZGOTIfrXX42d5/34uEZ
         MLgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770551; x=1796375351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vXO/Y/CYrpQIxWyPESy68yxl237JHlY56bkJQSv87LI=;
        b=gKHg7nKXMqSb2z5PlAAFE/sTjEzlZ19oZoGQjnjMUQAspFFi9jFalCHwKVg3Om/3aj
         ETLgWzwllWQR8N15thiYJKAzWrIeQX84VFXaxtYSbbzUxMyNm72gBTrLhXYzUYVCZJI1
         b2Wl9YSYnLAoQMKcBOq+PlowDIiNf7vJVz+mXvfb1ka0Ft7oe7hiCX+BK/Ow8Go4RyAu
         b8s8fsF6hY2R7fnbQbEp3LJVJW9UgcGQ7uMe5wE9SEX+9HKeln/9hMQCVXZluOqNqM60
         r06yP9h5mhWuT9QaRDbiyE6VeLW969XRaBZjQ99/ZsjWHOK/lpPPNCab98fhMChhOLNS
         ufUg==
X-Forwarded-Encrypted: i=1; AL+hErHwLH32xVL+QFmIFA5jIMS8CHsXlZYq+FV/aBG0hW2euzlvI5fhuKwKHXd4hGhUK5Nnlttkj2y0X6lVuPk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fRdpgfuv1b09x1z0sA7FdCarHukPTau/Q/MFoY8Lx/+eOBoPH
	vmmbiGGwoms+HXBEXLdMDLMKMixo1SF+CAI73gCYlUA4+jFzRaU+aJP6
X-Gm-Gg: AZFdTZeAA1NX7mtEpwqKyRxdACC+0uuuc/cI+tRqAun5qUvW2pNqDaCx/bK+3FC4+IZ
	jBz+PF6Y14QamLgr0twK1wZ3ek1o0bwTHLqMbLFmGzqNB2n1ZzP7L8pg4HFNsc+zz/RW2ZYz87c
	U+WBIf3m8OhoHPdLpWCV2wf+lTGn0jvLZINOo6iwTJiKX65Yi9F52wE6Sdw1+vzbYieGpMuuHVr
	2O1XXj9/TMkuJc7ZSlqt+CmZdmumOAL2YPkKhcYpEzxp7FVqHou/mHfLnJa3soFNZRnA9h4eJSV
	HxfiN0LfDZjPZaCuoSlBDCcwwsJNA46PMuL5z10SIAJGnPmnbBizKR3Bp61ekujUZ7U249zonlK
	V3ywQL3y6X7lXEp8FFLfOz5oLIzig6qsprfTR6He+MQWHdkdSYkmXn46qiEvFAs+GsdvVi4wy0j
	gtjb5/25/+S1euBN+TdnUrig7e83IayGXLU0QoJ2Is6UnvBnqiXZLirYUnPtWq9bBIne9HOVo30
	J+AsMcULp4VLCMja8YCKYWlUT3S4rFmbnrtz+i6ghtnhLAPUchC51HSRfoVb4XgwK6mx7XOQhXy
	KMiHKj0/JCjvRttO2zbUn/ep+H5J/lzFQhsw3tkcbsY=
X-Received: by 2002:a17:90b:5907:b0:3b5:29e:11b4 with SMTP id 98e67ed59e1d1-3b5029e1464mr6516552a91.44.1795770551516;
        Fri, 27 Nov 2026 01:09:11 -0800 (PST)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d06ee37sm11718725a12.28.2026.11.27.01.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:09:10 -0800 (PST)
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
Subject: [PATCH v10 7/8] of: reserved_mem: mark /reserved-memory entries with MEMBLOCK_NODUMP
Date: Fri, 27 Nov 2026 17:07:22 +0800
Message-ID: <20261127090723.741253-8-chenwandun1@gmail.com>
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

Mark non-dumpable reserved-memory regions with MEMBLOCK_NODUMP so
kdump can omit them from the vmcore.

The marking is guarded by CONFIG_CRASH_DUMP and either CONFIG_KEXEC_FILE
or CONFIG_CRASH_HOTPLUG, so kernels that do not build or update crash
ELF headers do not pay the cost of splitting memblock.memory entries
at NODUMP boundaries.

Clamp the marked range to page boundaries, since a sub-page split
would leave fragments that cannot be represented as valid System
RAM resources [1].

Link: https://sashiko.dev/#/message/sashiko-outbox-181183@kernel.org [1]
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/of/fdt.c             |  2 ++
 drivers/of/of_private.h      |  1 +
 drivers/of/of_reserved_mem.c | 30 ++++++++++++++++++++++++++++++
 3 files changed, 33 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index a58efdcbac7f..f3a766310d11 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1283,6 +1283,8 @@ void __init unflatten_device_tree(void)
 {
 	void *fdt = initial_boot_params;
 
+	fdt_mark_reserve_mem_nodump();
+
 	/* Populate an empty root node when bootloader doesn't provide one */
 	if (!fdt) {
 		fdt = (void *) __dtb_empty_root_begin;
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 895f868b4cfa..00f776819dab 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -185,6 +185,7 @@ static inline struct device_node *__of_get_dma_parent(const struct device_node *
 #endif
 
 int fdt_scan_reserved_mem(void);
+void __init fdt_mark_reserve_mem_nodump(void);
 
 bool of_fdt_device_is_available(const void *blob, unsigned long node);
 
diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index a5cd8c2fffc3..cef444d4c1a3 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -610,6 +610,36 @@ static void __init fdt_init_reserved_mem_node(unsigned long node, const char *un
 	reserved_mem_count++;
 }
 
+void __init fdt_mark_reserve_mem_nodump(void)
+{
+	struct reserved_mem *rmem;
+	int i;
+
+	if (!IS_ENABLED(CONFIG_CRASH_DUMP))
+		return;
+
+	if (!IS_ENABLED(CONFIG_KEXEC_FILE) && !IS_ENABLED(CONFIG_CRASH_HOTPLUG))
+		return;
+
+	if (reserved_mem_reserve_failed)
+		return;
+
+	for (i = 0; i < reserved_mem_count; i++) {
+		phys_addr_t base, end;
+
+		rmem = &reserved_mem[i];
+		if (!rmem->size || rmem->dumpable)
+			continue;
+
+		base = round_up(rmem->base, PAGE_SIZE);
+		end = round_down(rmem->base + rmem->size, PAGE_SIZE);
+		if (base >= end)
+			continue;
+
+		memblock_mark_nodump(base, end - base);
+	}
+}
+
 struct rmem_assigned_device {
 	struct device *dev;
 	struct reserved_mem *rmem;
-- 
2.43.0

