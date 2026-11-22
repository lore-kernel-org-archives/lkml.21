Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795373119;
	b=APaVe5B+ERV+QvhyJ3fP1akQJsRu835Pyx7GeoZrjmJ/4A00+QKdAUv0vZSimr90m08l
	 /GU0uwPtdls7g1FD5AFC8W/d76eAEXlWwXFllHV4Di5KeRlMEqBKMfwnN/KISQL6q5mZq
	 9O8+45HLOPiWPZC5Use+YgSc8ALDhi2MswAGElqfPknBGKy5b8RhB1ajPgUOKiZjS43t5
	 fwsJ08OuL6XGmKwgR/cVw5IjzXzsCVA1cQUhnRsOFEFfIGCIVk6nS5zoiN5kCyPd7QMTr
	 wadNRAFQplt989K+LlID4Y26sba/RSojCnpPGoISWcLCqZ0RkThbz56XNFpIoBemVBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795373119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=JlyKIxCj5zXNoCwp2g1iooTjwoRbShhDI27qMEz7zxE=;
	b=olw3G7ScPWQ64acNSOY8WBh0YIlt6k5/w2SL2RWZWpSSsOHJPCxtnGNLwkhYOVKrMjma
	 bkK/4Mw/0GPfZlaBZIs9oGJ5KzD00c5wmzYVtxjoC6zwBWBLjSrygZ+rXwk3NyAZtkmIp
	 /0hPJHebf3bT43VmzOJAroqMHRDCqY33+ll4u7zEqpGWiPRZakyqDNlysvmMcLtCCUF2f
	 ahxsmiI+d7Hf8LWfrKCLdATXsw4ErMSYHYInyfG1AGZsAfPaWlEYrx/5PI6gfJJ0ZbHjY
	 kuJ/ZdG23PyLHrQRUdUGiwRoTw3t/sgr0MulNsFp3uVvZljd3nzM484HBn7y9pmUiWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Cv+NsdMw;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D182606A6A2
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:45:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D182606A6A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Cv+NsdMw
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f03aa5ff3bso36097515ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795373119; x=1795977919; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JlyKIxCj5zXNoCwp2g1iooTjwoRbShhDI27qMEz7zxE=;
        b=Cv+NsdMwDL2hKiLF9150UdtR8Y4xURB9O6noVDiNPn0gJUDSyKkKJdI2EGs5UHUGWe
         2+e9NeZu7y0Ic4Cpc2WHKXQwm/f3wOiufqt2TcV4JiFatu2ChrqIshyEe22J/Dogu6Hu
         NW13T19bfpvAjgbZKI6MjJEVXVhS3ud6WpmJWDUnkevOCF5vm0Zgm5kN2nTOPcYeuusA
         ZsG3sq0o50bcyjAvTQYTGv4X9Hx1y2HCKW42Ce4LeqjosJjSfUGLtBWJNUHcEAcTfgMn
         7OgZCwQTRvF7oDmt7Oyel1SbBCctZjOZ9qUoRWUo8qUoNUs68YIvq20CwKf4TNRIkfAK
         sb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795373119; x=1795977919;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JlyKIxCj5zXNoCwp2g1iooTjwoRbShhDI27qMEz7zxE=;
        b=FvQ7VerP0YGsinjXj6UKLB+a0+Ydi3AqaDwloUC+4eMDjP+u4bD7qUEOT395JKedjQ
         +alT1oZsDiCjxVuXumI2WdrV6ViciS+ib3G4GF9GdCyKQO0Q+9oW1s1mP7zBiFb8UeVO
         8OwdZ0Rcfw8O+xwzHTXRDE9y3NC21LDQdStuKfO4U3nREWo954bbcoLc4l+THPdyTFVF
         d4zYAv/uI4Kkt1cyz+67Vrdfx5Ok6zwBuOHj8C194ro2+vWZwPlbfvipUtqc1N2FakuO
         KVqJiAY1D64C2/vXilqlRmMU8o/nwO2rEj/i/ZNn0Iq+5Lsg5x9D7ayzcTjMgLLwn9MI
         1zug==
X-Forwarded-Encrypted: i=1; AL+hErHS9gHGUjB8Ik+Y9pu/M6LB54zdnUd3xGP/lyYFGYCr0ujryT5dIE3VwgPaNzu2rjwgxcgTt2QYDGqzhiU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/70NC3eNSefVhdRaKFa3SxSvRJG9RlEwClXojto9vXopu+Ec1V
	y0jELykBay1yAfSZioW/iV+GFOogXsoMfLZCbjjBbH5yGSOhjPOPZIYNkcw6TStA8t8N+eicdKb
	16g+lNWXVaHKvv1o4WE7X6w==
X-Received: from plbl5.prod.google.com ([2002:a17:902:eb05:b0:2ef:f5cd:c465])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:1745:b0:2f0:5b55:edf3 with SMTP id d9443c01a7336-2f05b55ee4bmr55875675ad.32.1795373118583;
 Sun, 22 Nov 2026 10:45:18 -0800 (PST)
Date: Sun, 22 Nov 2026 18:44:52 +0000
In-Reply-To: <20261122184453.2668189-1-jthoughton@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261122184453.2668189-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261122184453.2668189-19-jthoughton@google.com>
Subject: [PATCH v3 18/19 DO-NOT-MERGE] hugetlb_vmemmap: Add fault injection
 for in-place vmemmap PMD splits
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Nikos Nikoleris <nikos.nikoleris@arm.com>, 
	Linu Cherian <linu.cherian@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	David Hildenbrand <david@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>, 
	Frank van der Linden <fvdl@google.com>, David Rientjes <rientjes@google.com>, 
	James Houghton <jthoughton@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Like try_update_vmemmap_pte(), try_populate_vmemmap_pmd() may fail,
e.g. on arm64 when replacing the block mapping keeps racing with
hardware access flag updates. HVO handles such failures by not
optimizing the folio.

Add a fault-injection capability, fail_hugetlb_vmemmap_pmd, alongside
fail_hugetlb_vmemmap_pte. When a fault is injected, the PMD split fails
with -EAGAIN without touching the page tables.

It can be configured through debugfs or through the
fail_hugetlb_vmemmap_pmd= boot option. Since vmemmap PMDs are only split
once, the boot option is the most effective way to exercise this path.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 .../admin-guide/kernel-parameters.txt         |  1 +
 .../fault-injection/fault-injection.rst       |  8 +++++---
 lib/Kconfig.debug                             |  4 ++--
 mm/hugetlb_vmemmap.c                          | 20 ++++++++++++++++++-
 4 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index b8a8771631c0..251bd0f4afa3 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1695,6 +1695,7 @@ Kernel parameters
 	fail_page_alloc=
 	fail_skb_realloc=
 	fail_hugetlb_vmemmap_pte=
+	fail_hugetlb_vmemmap_pmd=
 	fail_make_request=[KNL]
 			General fault injection mechanism.
 			Format: <interval>,<probability>,<space>,<times>
diff --git a/Documentation/fault-injection/fault-injection.rst b/Documentation/fault-injection/fault-injection.rst
index 403206645fa4..5cfabea811da 100644
--- a/Documentation/fault-injection/fault-injection.rst
+++ b/Documentation/fault-injection/fault-injection.rst
@@ -16,10 +16,11 @@ Available fault injection capabilities
 
   injects page allocation failures. (alloc_pages(), get_free_pages(), ...)
 
-- fail_hugetlb_vmemmap_pte
+- fail_hugetlb_vmemmap_pte, fail_hugetlb_vmemmap_pmd
 
-  injects failures of the in-place vmemmap PTE remaps done by HugeTLB vmemmap
-  optimization. (try_update_vmemmap_pte())
+  injects failures of the in-place vmemmap PTE remaps and PMD splits done by
+  HugeTLB vmemmap optimization. (try_update_vmemmap_pte(),
+  try_populate_vmemmap_pmd())
 
 - fail_usercopy
 
@@ -269,6 +270,7 @@ use the boot option::
 	failslab=
 	fail_page_alloc=
 	fail_hugetlb_vmemmap_pte=
+	fail_hugetlb_vmemmap_pmd=
 	fail_usercopy=
 	fail_make_request=
 	fail_futex=
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index a6a9bc01a320..68244c0e4a81 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2104,8 +2104,8 @@ config FAIL_HUGETLB_VMEMMAP
 	help
 	  Provide fault-injection capability for the in-place vmemmap page
 	  table updates done by HugeTLB vmemmap optimization (HVO), i.e.
-	  try_update_vmemmap_pte(). This exercises the rollback and
-	  partially-optimized folio paths.
+	  try_update_vmemmap_pte() and try_populate_vmemmap_pmd(). This
+	  exercises the rollback and partially-optimized folio paths.
 
 config FAULT_INJECTION_USERCOPY
 	bool "Fault injection capability for usercopy functions"
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index d3230588f31f..95a42f59c16b 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -47,6 +47,7 @@ DECLARE_RWSEM(vmemmap_remap_rwsem);
 
 #ifdef CONFIG_FAIL_HUGETLB_VMEMMAP
 static DECLARE_FAULT_ATTR(fail_hugetlb_vmemmap_pte);
+static DECLARE_FAULT_ATTR(fail_hugetlb_vmemmap_pmd);
 
 static int __init setup_fail_hugetlb_vmemmap_pte(char *str)
 {
@@ -54,11 +55,19 @@ static int __init setup_fail_hugetlb_vmemmap_pte(char *str)
 }
 __setup("fail_hugetlb_vmemmap_pte=", setup_fail_hugetlb_vmemmap_pte);
 
+static int __init setup_fail_hugetlb_vmemmap_pmd(char *str)
+{
+	return setup_fault_attr(&fail_hugetlb_vmemmap_pmd, str);
+}
+__setup("fail_hugetlb_vmemmap_pmd=", setup_fail_hugetlb_vmemmap_pmd);
+
 #ifdef CONFIG_FAULT_INJECTION_DEBUG_FS
 static int __init fail_hugetlb_vmemmap_debugfs(void)
 {
 	fault_create_debugfs_attr("fail_hugetlb_vmemmap_pte", NULL,
 				  &fail_hugetlb_vmemmap_pte);
+	fault_create_debugfs_attr("fail_hugetlb_vmemmap_pmd", NULL,
+				  &fail_hugetlb_vmemmap_pmd);
 	return 0;
 }
 late_initcall(fail_hugetlb_vmemmap_debugfs);
@@ -74,8 +83,17 @@ static int hvo_update_vmemmap_pte(unsigned long addr, pte_t *ptep, pte_t pte)
 		return -EAGAIN;
 	return try_update_vmemmap_pte(addr, ptep, pte);
 }
+
+static int hvo_populate_vmemmap_pmd(unsigned long addr, pmd_t *pmdp,
+				    pte_t *pgtable)
+{
+	if (should_fail(&fail_hugetlb_vmemmap_pmd, PMD_SIZE))
+		return -EAGAIN;
+	return try_populate_vmemmap_pmd(addr, pmdp, pgtable);
+}
 #else
 #define hvo_update_vmemmap_pte		try_update_vmemmap_pte
+#define hvo_populate_vmemmap_pmd	try_populate_vmemmap_pmd
 #endif /* CONFIG_FAIL_HUGETLB_VMEMMAP */
 
 static int vmemmap_split_pmd(pmd_t *pmd, struct page *head, unsigned long start,
@@ -107,7 +125,7 @@ static int vmemmap_split_pmd(pmd_t *pmd, struct page *head, unsigned long start,
 	if (likely(pmd_leaf(*pmd))) {
 		/* Make pte visible before pmd. See comment in pmd_install(). */
 		smp_wmb();
-		ret = try_populate_vmemmap_pmd(start, pmd, pgtable);
+		ret = hvo_populate_vmemmap_pmd(start, pmd, pgtable);
 		if (ret)
 			goto free;
 
-- 
2.56.1.809.ga0b61035b5-goog

