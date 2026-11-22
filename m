Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795373114;
	b=RvinUPBP4rAE7uQ76QbdNgtMIeOV/oIPWY8r83BtsDrgqFjmn/4lQV2MDxYDlhX2UzUM
	 2xwu0SN/voLxPqLmgvINKEPUHFcmxflbljaN8pWkVGH8eSfsZpIbL5naKYSylR+47x79j
	 /a/M/Dsmn66Ka4vfwZrZkB07O/u2nteFmB1T+hOebYLkIjCaUFvllxy/lvx+InFGe3tYU
	 N/Ba+8RZy3LzJkiLJn9J+YDOjEjKFhLwMa7jZaITK4ea2B8nsJfB1s4KN3hVD6z7/ef8S
	 qV34joGCcJ9EcPbxkBFvq5XekYnqYg69Gvs3GQbsj+GO+oUrVd2mprn+9XFJyR8GveQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795373114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=TxPlxxAqJE3tW6UmldmaY6HGp5vlDJN47buBYWjQlQE=;
	b=O1xUbUznwj4wYvw1kEKlnscJbx6lSRaXfzoPUhMDFK1NNL+ges/G2vvMxcMjdwGrUTP1
	 9FoyNJMH6VORiN7JiiZ8M6zN3ACPi6aTaI+tkHWzhTCiMsQYIPvuCxkmsVSIvzs9zsDo+
	 IfRkNgfEqIIPpgghBLfJ3ED4PEE7GQAMvQSyQp8XZluf2ECg5Bw1JitUiwI/Em/s9ZhPJ
	 yy8MDuokHTSwkPIvc6rowMlc1Ll7cTweThXtNO1jWyuNTH5PcHtSRkesQ+KIb4mFGmbB4
	 +RBeTpy4JJF5cUg1PQFVuCY5G9tVXs/EBdBhx6cn+F29vCRPGl/n51BSfGOGSuaIxbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kXoWvg+j;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB24606A6AF
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:45:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EB24606A6AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kXoWvg+j
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f045e399acso22286585ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795373113; x=1795977913; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TxPlxxAqJE3tW6UmldmaY6HGp5vlDJN47buBYWjQlQE=;
        b=kXoWvg+jfFp93JvxWDq569dZoZ/fbWNVbHpr6T6z1HzlRVDGJhJZhWQ3ey2Eo764BM
         Zq4kxCCKmXFcmGnCA579hHk0iOCSVRKBn3dqnhwP2bZS9NbaxAHwkC9dUfHAiTnFHj2W
         4j+LnoBoMRZFPGWiZjGTcAU4Z0v26qIRvtiAocZztAPxMfCXg8RECnrIfohcEARL3Z5p
         7FiVYJWz95f3r5sazZKOeqb/D+fQg3RV+6tUl5tLblu1TWB8X9sT7/xefLXXKhEeTxRU
         EnfGGqbRV8VOS9oarrlFEkn97qr4FVBHgv5h2pJiIVMcyl9M9G0SVrSWyIaZ3DpY7Egk
         mzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795373113; x=1795977913;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TxPlxxAqJE3tW6UmldmaY6HGp5vlDJN47buBYWjQlQE=;
        b=Gn6XBaq5QXAqsPRlRu+QNw9+JqIt9324CVEL8GSCIkojjtw/GejWih4d6K2veURXrW
         SMvsheaDP8vrgTXurEsbXjj+C24y8AVedxmQummvYwmvodPigwkCUELxQCS1K7dOoMac
         Zewhu52+faDJ7KYNBHrbRN9aJ2YdsPybRPp7uhJqk0BqM0kGZsGvnzv2AOHMfpjcBPgm
         wPcWFBlHFzOqbd+VtdqXMDAoyS82xOQWNx+POk0/5VvGqaTiYDimRHXtDAZ78OAs4uDE
         DAWVwc5+2/oTgvNKSTUNcBEzPU0BwWSrmsCNgZLcziy99DJyLv0dKXFxZjEH7JHtNfNx
         uEUA==
X-Forwarded-Encrypted: i=1; AL+hErGTZnlasZnGE8sFS1lqXQf7HbX7fTCrTuKHbQWqCCyi69o9CKpBsiow9hEegEtg8lQ8fKjOREWF7NBXjN4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+f/W7N53YZL24bItQzPI8N7Pi7JzEjvBQ/TfcYJSFbXwhcBIPO
	J9XzFdTFz/+ZGXTB6Jl2fSg2Y+963tmuAaVVfaWQLQ39eC7uOXz8IovBIGSpHCQjswT0IwmdZeh
	OSV0V37RLVCW/M/i/2sV2mg==
X-Received: from plfn5.prod.google.com ([2002:a17:902:e545:b0:2ef:d037:6013])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:d2cf:b0:2f0:25ea:8fb3 with SMTP id d9443c01a7336-2f03efb1073mr100873735ad.1.1795373113358;
 Sun, 22 Nov 2026 10:45:13 -0800 (PST)
Date: Sun, 22 Nov 2026 18:44:47 +0000
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
Message-ID: <20261122184453.2668189-14-jthoughton@google.com>
Subject: [PATCH v3 13/19] hugetlb_vmemmap: Add fault injection for in-place
 vmemmap PTE updates
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

try_update_vmemmap_pte() may fail, e.g. on arm64 when the update keeps
racing with hardware access flag updates. HVO handles such failures by
rolling back the optimization, or by leaving folios partially optimized
if the rollback or a later restore fails. These paths are rare to hit
normally.

Add a fault-injection capability, fail_hugetlb_vmemmap_pte, under
CONFIG_FAIL_HUGETLB_VMEMMAP. When a fault is injected, the PTE update
fails with -EAGAIN without touching the page tables, as if the in-place
update had given up.

It can be configured through debugfs or through the
fail_hugetlb_vmemmap_pte= boot option, the latter allowing failures to
be injected when optimizing bootmem folios.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 .../admin-guide/kernel-parameters.txt         |  1 +
 .../fault-injection/fault-injection.rst       |  6 +++
 lib/Kconfig.debug                             |  9 +++++
 mm/hugetlb_vmemmap.c                          | 38 ++++++++++++++++++-
 4 files changed, 52 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 176648941aec..b8a8771631c0 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1694,6 +1694,7 @@ Kernel parameters
 	fail_usercopy=
 	fail_page_alloc=
 	fail_skb_realloc=
+	fail_hugetlb_vmemmap_pte=
 	fail_make_request=[KNL]
 			General fault injection mechanism.
 			Format: <interval>,<probability>,<space>,<times>
diff --git a/Documentation/fault-injection/fault-injection.rst b/Documentation/fault-injection/fault-injection.rst
index c2d3996b5b40..403206645fa4 100644
--- a/Documentation/fault-injection/fault-injection.rst
+++ b/Documentation/fault-injection/fault-injection.rst
@@ -16,6 +16,11 @@ Available fault injection capabilities
 
   injects page allocation failures. (alloc_pages(), get_free_pages(), ...)
 
+- fail_hugetlb_vmemmap_pte
+
+  injects failures of the in-place vmemmap PTE remaps done by HugeTLB vmemmap
+  optimization. (try_update_vmemmap_pte())
+
 - fail_usercopy
 
   injects failures in user memory access functions. (copy_from_user(), get_user(), ...)
@@ -263,6 +268,7 @@ use the boot option::
 
 	failslab=
 	fail_page_alloc=
+	fail_hugetlb_vmemmap_pte=
 	fail_usercopy=
 	fail_make_request=
 	fail_futex=
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 2d22638ec13a..a6a9bc01a320 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2098,6 +2098,15 @@ config FAIL_PAGE_ALLOC
 	help
 	  Provide fault-injection capability for alloc_pages().
 
+config FAIL_HUGETLB_VMEMMAP
+	bool "Fault-injection capability for HugeTLB vmemmap optimization"
+	depends on FAULT_INJECTION && HUGETLB_PAGE_OPTIMIZE_VMEMMAP
+	help
+	  Provide fault-injection capability for the in-place vmemmap page
+	  table updates done by HugeTLB vmemmap optimization (HVO), i.e.
+	  try_update_vmemmap_pte(). This exercises the rollback and
+	  partially-optimized folio paths.
+
 config FAULT_INJECTION_USERCOPY
 	bool "Fault injection capability for usercopy functions"
 	depends on FAULT_INJECTION
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index a01377c37c96..4cacd7aee719 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -17,6 +17,7 @@
 #include <linux/pgalloc.h>
 #include <linux/rwsem.h>
 #include <linux/vmemmap-optimization.h>
+#include <linux/fault-inject.h>
 
 #include <asm/tlbflush.h>
 #include "hugetlb_vmemmap.h"
@@ -44,6 +45,39 @@ struct vmemmap_remap_walk {
 
 DECLARE_RWSEM(vmemmap_remap_rwsem);
 
+#ifdef CONFIG_FAIL_HUGETLB_VMEMMAP
+static DECLARE_FAULT_ATTR(fail_hugetlb_vmemmap_pte);
+
+static int __init setup_fail_hugetlb_vmemmap_pte(char *str)
+{
+	return setup_fault_attr(&fail_hugetlb_vmemmap_pte, str);
+}
+__setup("fail_hugetlb_vmemmap_pte=", setup_fail_hugetlb_vmemmap_pte);
+
+#ifdef CONFIG_FAULT_INJECTION_DEBUG_FS
+static int __init fail_hugetlb_vmemmap_debugfs(void)
+{
+	fault_create_debugfs_attr("fail_hugetlb_vmemmap_pte", NULL,
+				  &fail_hugetlb_vmemmap_pte);
+	return 0;
+}
+late_initcall(fail_hugetlb_vmemmap_debugfs);
+#endif /* CONFIG_FAULT_INJECTION_DEBUG_FS */
+
+/*
+ * Inject failures as if the in-place update lost a race too many times
+ * (see the arm64 implementations), without touching the page tables.
+ */
+static int hvo_update_vmemmap_pte(unsigned long addr, pte_t *ptep, pte_t pte)
+{
+	if (should_fail(&fail_hugetlb_vmemmap_pte, PAGE_SIZE))
+		return -EAGAIN;
+	return try_update_vmemmap_pte(addr, ptep, pte);
+}
+#else
+#define hvo_update_vmemmap_pte		try_update_vmemmap_pte
+#endif /* CONFIG_FAIL_HUGETLB_VMEMMAP */
+
 static int vmemmap_split_pmd(pmd_t *pmd, struct page *head, unsigned long start,
 			     struct vmemmap_remap_walk *walk)
 {
@@ -274,7 +308,7 @@ static int vmemmap_optimize_pte(pte_t *pte, unsigned long addr,
 	 * after it. The refcount is zero, so the cmpxchg fails and leaves the
 	 * page unchanged.
 	 */
-	ret = try_update_vmemmap_pte(addr, pte, mk_pte(dst, PAGE_KERNEL));
+	ret = hvo_update_vmemmap_pte(addr, pte, mk_pte(dst, PAGE_KERNEL));
 	if (ret)
 		return ret;
 
@@ -313,7 +347,7 @@ static int vmemmap_restore_pte(pte_t *pte, unsigned long addr,
 		return 0;
 
 	dst = vmemmap_dup_page_from_list(src, walk->vmemmap_pages);
-	ret = try_update_vmemmap_pte(addr, pte, mk_pte(dst, PAGE_KERNEL));
+	ret = hvo_update_vmemmap_pte(addr, pte, mk_pte(dst, PAGE_KERNEL));
 	if (ret)
 		return ret;
 
-- 
2.56.1.809.ga0b61035b5-goog

