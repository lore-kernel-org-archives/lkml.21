Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795373112;
	b=SOir3X54IJlrUDY4i8xULHJnex4mozb2kAtUspJq34WwiDlGdGElX2HjVXvsiVVJWawo
	 rj+IWsExb86YnhXpOhtaBny9G+GQhLdK/F6yQ0TkyawWd6XL2ZMamPnq9stUr4v4co0UO
	 mlQ9pxYqVZJaLfG1evnpV63ll9OJZbaOMA7eEFMd8LH2HhMsk2UUT52/XqQTtIllVYEX+
	 A3b4jlS4Z8sEfTSkEvQbt90vobKHgKo4b9Gj8ZuSsgAv0TCj8HGhxgeW7NH8ilyYttqbT
	 ieXwHi9AxXiMT+DK9WusJ1NNeipQaSSv4nI22GqSlh+VliNHrPDHvLJ4f1gT2sQqpYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795373112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=EQ0rA8yaqA1vSCBqSZZVZvjqdV+T4ndirWABYJGy5RI=;
	b=Loyr1eUCfbkOSrtjMKOohDmg4l+Kkkw8wc2YbO+zioQjy9ykz81Mw1NdjjmO0VrEURGv
	 JqInQatCm9RJamlYUmoEoqgz4ZEecLIPtWt3RBQ5JbvtsBJ+/OcrmZAlttLnk8HzlT4Bp
	 cGhR4vURtLf5SId75LceJ+Wmdbm8MEWj3ZChjBmowkUNkPq7IDuJduwjSSdom17Q63l/C
	 z/khZpBdW/c2F8ZXd2AQIbgW4Fu2QkBQbzUeBAoeosxa9ULcABHQ6AFSlx4geEh4fG5uO
	 wWzOwuJ/6SA1hg9YVDjz1Z+VTcvNJoq2LpJUmTxFrq2niYRGyR3mhLIUgOJcQDn905w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fshMoL0U;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BAD60A2610
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:45:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5BAD60A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fshMoL0U
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f03a137f6aso22794665ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795373111; x=1795977911; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EQ0rA8yaqA1vSCBqSZZVZvjqdV+T4ndirWABYJGy5RI=;
        b=fshMoL0UNBsQ53L64HA3z0FK87T6i2HIPWBCxuB6XZgTuvf3jxzmUAzhwDjrnfb/wG
         whx7Mjhk6P/FMV9qqN34BHf01sJZRuIwUh0DeJAX6ez4ceLhbejLKD+EEMvSXK1Ob+GS
         g489IzcrLPcObmMH4doYDiYgOkI8TCeLDuWCum/dbWo4MX/o3SmvbPUCsjqgG1G6vlIw
         7feM70090/N2oyXpFlsPMyZEuHYz0EM5uCBmDLWGDnlfXE6gOYbc4nLhAMxt2Wpfn0m4
         SdK1+HFrDisQb/VAZeMx+w8JDcuE3BIUJ7iY0p+skALNmhy52CDFY4IQnAWu5twYjwSl
         M44A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795373111; x=1795977911;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EQ0rA8yaqA1vSCBqSZZVZvjqdV+T4ndirWABYJGy5RI=;
        b=olflobmvpN26O7CqKIdH4NgWotiHK4ZxBHmM3amRGrwBQ7D6Huv55IcOI2gBudB1qj
         MZnKOlagPliO2tIBO8zvQVnFMrEuAKjpSqgmGN0JcaDuNSB2OrrVWrWE75DIlKu32um1
         DLPaxM3/IUoaK1OQtPlcukgwLHFSizKR8q8pCgt/8OEg2X/6d0KXG/podddImgYEducW
         +RY/NjE1lhwRBwjIb5RZB01Agak63MqvM1MGEP185/pe2dEqsjl/ZKtEBeaA3zvHQABp
         nn7zT/LmCndZu+lcOOKEGEgVRHzPwRfW8adb+2NjavPC0Ej0KTaEN40NMjBUUgfjo4LN
         WOhQ==
X-Forwarded-Encrypted: i=1; AL+hErEYz5vlV7cC+7T1ey5MtG82xIUw0c3Df8c0d10fA/UA7e/iHeK6H4NOqUBFI3VGh73U3UFHj1FFcpkeBRI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZQf1KCaXHbhqdiRC1AbAA02FfF21p/YqmUSN0aA6YqI8bp9c7
	vf5nwXqYFyksTCGt7IqinRRWC4yEjFnStZpzywo7f+kSNvD3LsrPQOEMEwYuvNpwYX+IG8DmEJR
	wyu52jVxKz5R2fYmqVyf0KQ==
X-Received: from plbmq8.prod.google.com ([2002:a17:902:fd48:b0:2f0:4f32:d57d])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:eccf:b0:2ef:e465:5049 with SMTP id d9443c01a7336-2f03f156193mr88468125ad.10.1795373110869;
 Sun, 22 Nov 2026 10:45:10 -0800 (PST)
Date: Sun, 22 Nov 2026 18:44:46 +0000
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
Message-ID: <20261122184453.2668189-13-jthoughton@google.com>
Subject: [PATCH v3 12/19] arm64: Support hugetlb vmemmap optimization
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

Support HVO if HW AF and BBML3 are supported. These are the required
features for the vmemmap to be modified in place.

On arm64 systems that do not have the required hardware features to
support HVO, the HVO sysctl will not appear, and any attempts to enable
HVO (either via the command line or via
CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON=y) will have no effect.

Because HVO support is only known after the vmemmap has been populated,
disable the section-based vmemmap optimization in vmemmap_populate(), as
LoongArch and powerpc do. Boot-time HugeTLB folios are then optimized
when they are gathered.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/Kconfig               | 1 +
 arch/arm64/include/asm/pgtable.h | 6 ++++++
 arch/arm64/mm/mmu.c              | 9 +++++++++
 mm/hugetlb_vmemmap.c             | 4 ++++
 4 files changed, 20 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 4cce60c2de66..b13618f0ace5 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -95,6 +95,7 @@ config ARM64
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_HUGE_PMD_SHARE if ARM64_4K_PAGES || (ARM64_16K_PAGES && !ARM64_VA_BITS_36)
 	select ARCH_WANT_LD_ORPHAN_WARN
+	select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP if ARM64_HW_AFDBM
 	select ARCH_WANTS_EXECMEM_LATE
 	select ARCH_WANTS_NO_INSTR
 	select ARCH_WANTS_THP_SWAP if ARM64_4K_PAGES
diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 7421c0a048ff..5dadaac54bef 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1931,6 +1931,12 @@ static inline void clear_young_dirty_ptes(struct vm_area_struct *vma,
 
 #endif /* CONFIG_ARM64_CONTPTE */
 
+#define arch_support_vmemmap_remap arch_support_vmemmap_remap
+static inline bool arch_support_vmemmap_remap(void)
+{
+	return system_supports_bbm_through_af();
+}
+
 static inline int try_update_vmemmap_pte(unsigned long addr, pte_t *ptep,
 					 const pte_t pte)
 {
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index a61464cf7367..bc3eea16004c 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -30,6 +30,7 @@
 #include <linux/mm_inline.h>
 #include <linux/pagewalk.h>
 #include <linux/stop_machine.h>
+#include <linux/vmemmap-optimization.h>
 
 #include <asm/barrier.h>
 #include <asm/cputype.h>
@@ -1843,6 +1844,14 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
 	/* [start, end] should be within one section */
 	WARN_ON_ONCE(end - start > PAGES_PER_SECTION * sizeof(struct page));
 
+	/*
+	 * Whether HVO is supported is only known once the system-wide CPU
+	 * features have been finalized, which is after the vmemmap has been
+	 * populated, so the section-based vmemmap optimization (pre-HVO) is
+	 * not supported. Boot-time HugeTLB folios are optimized later instead.
+	 */
+	section_vmemmap_optimization_disable(start, end);
+
 	if (!IS_ENABLED(CONFIG_ARM64_4K_PAGES) ||
 	    (end - start < PAGES_PER_SECTION * sizeof(struct page)))
 		return vmemmap_populate_basepages(start, end, node, altmap);
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index fb6da64bd80d..a01377c37c96 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -79,6 +79,10 @@ static int vmemmap_split_pmd(pmd_t *pmd, struct page *head, unsigned long start,
 
 		/* Make pte visible before pmd. See comment in pmd_install(). */
 		smp_wmb();
+		/*
+		 * On arm64, this requires BBML3. Its support has already been
+		 * checked.
+		 */
 		pmd_populate_kernel(&init_mm, pmd, pgtable);
 		/*
 		 * Modern MMUs allow overlapping TLB entries with different mapping
-- 
2.56.1.809.ga0b61035b5-goog

