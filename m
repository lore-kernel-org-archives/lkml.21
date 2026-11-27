Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770526;
	b=C7eQGapImMBJ4WQsaTGAK/4TLLDG9Xyh85b2GbDLSd09XzymKytnHkuR+bboG3WwGnb4
	 4lu4dMlZT5ijAUCFyIQGDDshNZLrvRvxhTwrDFi9dyv62Aw4C4akPiz+3b+QXevocPuqD
	 23nlvuULlEFQ+9P428CsyF2Ry4deBiRZvxrePob8vz1nTuQTfYSgDxeZkAJDbkeu0EhVR
	 x11xE1rpmDpvfHjURf+mz84eHyFZkxROO5SLv/nivxhzwSFX79tbJJc9WuUWdLfzSHnjD
	 8n2pbmKMhlDGh97wu9f95PgEkJcZig7CAGZltakXDPiaHsmZirHIIPCbU/Atu6eBDIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770526;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PVjCV5oykzsIMcgSWFAsGQFYmzyPz2B20ED1sYdHTJ8=;
	b=msR+fgx1dgTPOqQTuJL7a+ScMq8E5faaGNcTSkOY5F+HuB4CRCfHJfRuWdoCJr5B/uDw
	 ufSRk5H6C9A/a4bnsSJyX0BQCH0STG2WCfDhZJoJTiPcOJWSc6MgVAIOHli7dFOMY6b16
	 18PzbhA2NOKNJFmXlsyMxubw8HaYEh2TGYeD4/YzIEOu01cFZPt3Wq5faJXltb1ZSM8Ow
	 1N9gZeGeBoGRnajjOrSaTAXNQrCMpFhb6CS/X/shcUkWYFG2y3Lm/wz7YVlaqe7Hs/FYM
	 CcDUJ2gD3kwkTQtGT0GwqMl/hZNgNz1K7wkkSiGNNeP40aD4H0wZg+rCRL2BRtK9Jmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="yDTW/yGf";
	arc=none smtp.remote-ip=74.125.227.199
Received: from mail-pi2-f7.google.com (mail-pi2-f7.google.com [74.125.227.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E257606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:08:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E257606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yDTW/yGf
Received: by mail-pi2-f7.google.com with SMTP id 41be03b00d2f7-cd66d7e32baso1824881a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795770526; x=1796375326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PVjCV5oykzsIMcgSWFAsGQFYmzyPz2B20ED1sYdHTJ8=;
        b=yDTW/yGf6yI5jv0ueo7JAXsTgqxUFYP+eCvjxwiHBRu5dRbeEwYpvVdrDQT+L+4Ztv
         HYZACURYKA7xI5z3QzumK66AqTaLgW2/SJyfSVZHFVTga5MmnrZSh+22Ds0QIP1nvpkt
         FEQb04xeSpshDRsuwRiWt96mZUuhkt6zWVTPbs+CEnNYEQhsUmf7iPKuesw6KnGZXAZg
         a7w7Urwfeb1G84vAK1jTvIHZU7l/86EYPZNRGd+j66yInaN/lE1AdSmybTQkdhRO3Uzq
         oJCuJQw++1NDBupOq3ThG3gz+V13eq3HrYNEEc+sV4dVPqgkHStKQIlfIHQFtEjnp2Bp
         Hatg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770526; x=1796375326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PVjCV5oykzsIMcgSWFAsGQFYmzyPz2B20ED1sYdHTJ8=;
        b=Nx7YbsLoplH3oDuS/C6U0v51EJDsEafBtYrd0CflE/HzkN2ozcNLnGseYgn/Fj2kT6
         ikXetUmn59MtzNn1vmTM0Q+o2WOljUtZlUx5ia/qv+m+krYP8YnVjk5HlkrrIY8DkH2M
         riJcmoXbjs5NG/19SWf+wr2N+V5PurBPFtvoKCsNq415oc7JzYJrLLC/IEa/TBRQzdWx
         ln50JS8kYFZj+2thMhcj3RDgUzHcGo7yacD0tAUeWGbqjm4DyE95h66u06ki0QEmA+zB
         WZGcmeztzXXu7Ikn+yAks4rYBtxF4bCeRGATtB1N2oibjlA6n+q6fXPONdvXqM3lXfDB
         BSFg==
X-Forwarded-Encrypted: i=1; AL+hErFXEXpTPfz3oOKwlwPp2zKLXZzp0zbrIgLco9vR726i8prQ6KfeWFmyLnYNpAS1BZnnmettq02GyuKnT7k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GjAeRyGUuiJH8bMxs55lZRykU89pEakylTWYR+giTxk4vHUmm
	aRRVja0RkRckw/VG4If4kRm97xLfxBfGI0EsnpxdLHt7r++rziM0m/s6
X-Gm-Gg: AZFdTZfA7iqT5czMjjP6TN5RFMRW4Vz1PVgRA4Ign/tnRRAECD3e8iYg5dwJqDJqw4e
	iytpzgmVb6kY2d2zVK50dV/poQnBHu3yyVYvU4CUV3ADXAeKnoU2R/LJPgHLGkdA+LDx2VocWWF
	wnfqTm1qIyy0p21z4b7Ae8HubDM7gKDa0wpA3dgRyRoIy8YRb4lx17KQznw89iJIGoeCEdCKzzi
	DYlQuPIFqfhMmkMp/5FW1Y4sf99Z80nmqUG/izysC+mYPoRzjLgZgNSVBjmxlzIgXleC5obbmJh
	dczBK53S9crwQZWSONeWE4A6MkTxXhJNsTDMEu/67VndNF/ZpXESbGWjaVUhhiD5ZdHbsfbo1a8
	BRGZCAGjIy8JFzDNLXKEsez8CK9VsegjrzsnML/fFLij2al/QjDEZEMOvTK+wMbI2OISyTDDNJr
	k9Y7C+iPGxqYhffBJ9h21VUuQlDN451BSaVKR3cg25xf5HeqgBCvJvqS5Nbm/htCM3cmHDZ62VZ
	xPjanA4OvFclHQ009pidgnG9pBlKjV0kY0/jv1G2ZZdzh5wInz5VQm5du4PZ75ZNWtVLMb0kSYc
	JIm5LY4DgfEhzBQaHAYEwk0OMJ6U8uP0LDCcYV0xWg==
X-Received: by 2002:a05:6a21:8982:b0:3e2:4350:1528 with SMTP id adf61e73a8af0-4014a274c36mr23147815637.7.1795770525740;
        Fri, 27 Nov 2026 01:08:45 -0800 (PST)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d06ee37sm11718725a12.28.2026.11.27.01.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:08:45 -0800 (PST)
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
Subject: [PATCH v10 5/8] memblock: introduce MEMBLOCK_NODUMP flag
Date: Fri, 27 Nov 2026 17:07:20 +0800
Message-ID: <20261127090723.741253-6-chenwandun1@gmail.com>
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

Add MEMBLOCK_NODUMP to mark regions that should be excluded from
kdump vmcores.

The flag is meant for reserved memory that carries no data useful for
crash analysis. Reusable reserved regions such as CMA may hold useful
data, so these regions must not be marked MEMBLOCK_NODUMP. Subsequent
patches wire this up for /reserved-memory entries.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 include/linux/memblock.h |  9 +++++++++
 mm/memblock.c            | 16 ++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index 40e6e0aa2f8d..67dbcfda6f49 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -52,6 +52,8 @@ extern unsigned long long max_possible_pfn;
  * know is good to use. It is the only memory that allocations may happen from
  * in this phase.
  * @MEMBLOCK_RSRV_HUGETLB: memory is reserved for hugetlb pages
+ * @MEMBLOCK_NODUMP: exclude from kdump vmcore. It carries no data useful
+ * for crash analysis (e.g. firmware carveouts).
  */
 enum memblock_flags {
 	MEMBLOCK_NONE		= 0x0,	/* No special request */
@@ -63,6 +65,7 @@ enum memblock_flags {
 	MEMBLOCK_RSRV_KERN	= 0x20,	/* memory reserved for kernel use */
 	MEMBLOCK_KHO_NOPRSRV	= 0x40,	/* memory with no KHO preservations */
 	MEMBLOCK_RSRV_HUGETLB	= 0x80, /* memory reserved for hugetlb pages */
+	MEMBLOCK_NODUMP		= 0x100,/* exclude from kdump vmcore */
 };
 
 /**
@@ -160,6 +163,7 @@ int memblock_reserved_mark_noinit(phys_addr_t base, phys_addr_t size);
 int memblock_reserved_mark_kern(phys_addr_t base, phys_addr_t size);
 int memblock_mark_kho_noprsrv(phys_addr_t base, phys_addr_t size);
 int memblock_clear_kho_noprsrv(phys_addr_t base, phys_addr_t size);
+int memblock_mark_nodump(phys_addr_t base, phys_addr_t size);
 
 void memblock_free(void *ptr, size_t size);
 
@@ -305,6 +309,11 @@ static inline bool memblock_is_kho_noprsrv(struct memblock_region *m)
 	return m->flags & MEMBLOCK_KHO_NOPRSRV;
 }
 
+static inline bool memblock_is_nodump(struct memblock_region *m)
+{
+	return m->flags & MEMBLOCK_NODUMP;
+}
+
 int memblock_search_pfn_nid(unsigned long pfn, unsigned long *start_pfn,
 			    unsigned long  *end_pfn);
 void __next_mem_pfn_range(int *idx, int nid, unsigned long *out_start_pfn,
diff --git a/mm/memblock.c b/mm/memblock.c
index 0f466fcfc719..e3ee7f60ec97 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -1221,6 +1221,21 @@ __init int memblock_clear_kho_noprsrv(phys_addr_t base, phys_addr_t size)
 				    MEMBLOCK_KHO_NOPRSRV);
 }
 
+/**
+ * memblock_mark_nodump - Mark a memory region with flag MEMBLOCK_NODUMP.
+ * @base: the base phys addr of the region
+ * @size: the size of the region
+ *
+ * Mark the region as not to be included in crash dumps.
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+int __init_memblock memblock_mark_nodump(phys_addr_t base, phys_addr_t size)
+{
+	return memblock_setclr_flag(&memblock.memory, base, size, 1,
+				    MEMBLOCK_NODUMP);
+}
+
 static bool should_skip_region(struct memblock_type *type,
 			       struct memblock_region *m,
 			       int nid, int flags)
@@ -2864,6 +2879,7 @@ static const char * const flagname[] = {
 	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
 	[ilog2(MEMBLOCK_KHO_NOPRSRV)] = "KHO_NOPRSRV",
 	[ilog2(MEMBLOCK_RSRV_HUGETLB)] = "RSV_HUGETLB",
+	[ilog2(MEMBLOCK_NODUMP)] = "NODUMP",
 };
 
 static int memblock_debug_show(struct seq_file *m, void *private)
-- 
2.43.0

