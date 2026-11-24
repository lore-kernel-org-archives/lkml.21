Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795537273;
	b=id4AHWOeZmmFQfasreMSPf8IXECXCoDrCO7p+AkUEXHJVEXFaWJTuX3onFic2i+Jsend
	 QvG9dZQv0iI42xs+1SoyPiWz+HdkEMhCFmU5OSKqapZFNNy45YgWt3QkSkD4YbIFaarLw
	 BsnoMSMW5PW+6Tu8v7wfusR2NLI/bx2TKpAIKZbqyxjp8Mx+oXChSeTTvmzATwp41XVTQ
	 +gBEZCTXJFsKk+9uH8LIGdT27txyGfyPCoi3V3+PyqmkRyTfzcJ7nWh+TvNl3GBVToe9F
	 3uFHkpxbKWKHKE3aMCkikKrw4DGzeijXwqbhBtOa1uL6sUiZH372mwwdjBl3sjpXtqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537273;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=T5Z8MVyIqr6qKo+Hc8WIA993kLlGZRJX/Xo/2B1xRkk=;
	b=MwtUOZlE9RDxXMq9dGMhuC7uqe7aObkWzt8iahbS75WbnMSvzioqjpnP1I+USNwYj/Uu
	 qZK51Qa81A8SnXMnR9LUDB7bb23L7wZ6RLJKu1crmT7kDY8S/PEKCx42V/2vEjatBbr5W
	 IcPLy+G0Oi/fNFwhULTXF2SNkCN2yrzOf72PshFwejcp4zPqjCg72Id9o90FZc39cGyoS
	 b9pfOy9kwMgKIzjqJjONNCS+bMQ4M6JMPdr60MfImhBe2CgOBBSR28UtJ0yLl/LKhlz71
	 kOryGXo6vpXAi3vsqLLK4lAp9HjN3wIxm5UpTGpGYL/BqXBsBWGmx4J4BprCj2q+1uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=rlXMbUED;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="wOB/a/Of";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DDE606A688;
	Tue, 24 Nov 2026 16:21:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0DDE606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=rlXMbUED;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=wOB/a/Of
Date: Tue, 24 Nov 2026 16:21:08 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795537270;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T5Z8MVyIqr6qKo+Hc8WIA993kLlGZRJX/Xo/2B1xRkk=;
	b=rlXMbUED+YLPN6uSe15u+Vn9oHTfnhQhvpxsUNHmBauDay++ftvqtMzdn9zg7rRB2HRnW6
	vWhhVTBrn10FD5tz/xMw8UK3QsGBt0+18Q9ZoVfVjsbmmxi6LKbVW59YtLvM7y/g2iiu2M
	wDkEi9FxB8Shn+06wDzB99JxGYbtUfrBNJ7rPN8YIwvUjs5+T6aKSCNDkpjX8+J8LCxmcr
	tG35bsDQCXMBg4ZImWrNO5ulQeYslbm6K2KDk2fZpRPBLkWtmnrJxIsUbnICch0WaCnWla
	gc++0Ge7ueIFBTlZL0d/mlduymSsWQGoKAFCqdz0DzzJsE0Kz57ZerFZB42iIQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795537270;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T5Z8MVyIqr6qKo+Hc8WIA993kLlGZRJX/Xo/2B1xRkk=;
	b=wOB/a/OfVWXgIELiqvR8SOPt27BxC0htWI7ZY3rH+ZVDn7Mp1ZnPKSH4tlSmo7KTojJBck
	sCS8605+x+KBUKAA==
From: "tip-bot2 for Kiryl Shutsemau (Meta)" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/mm] x86/mm: Remove the zapped-entry checks
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
 "Jose A. Perez de Azpillaga" <azpijr@gmail.com>, Zi Yan <ziy@nvidia.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261105120322.3319301-1-kirill@shutemov.name>
References: <20261105120322.3319301-1-kirill@shutemov.name>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179553726868.92412.3995327713375553041.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/mm branch of tip:

Commit-ID:     909bdfd52e61aecc9cbceee0b95087524003e368
Gitweb:        https://git.kernel.org/tip/909bdfd52e61aecc9cbceee0b9508752400=
3e368
Author:        Kiryl Shutsemau (Meta) <kas@kernel.org>
AuthorDate:    Thu, 05 Nov 2026 12:03:21=20
Committer:     Dave Hansen <dave.hansen@linux.intel.com>
CommitterDate: Tue, 24 Nov 2026 08:15:06 -08:00

x86/mm: Remove the zapped-entry checks

Zapping a range calls arch_check_zapped_pte() for every batch of PTEs,
which is every page for small folios, and arch_check_zapped_pmd() or
arch_check_zapped_pud() for every huge leaf. Only x86 implements them, as
out-of-line functions that warn about a shadow stack entry (Write=3D0,
Dirty=3D1) in a VMA without VM_SHADOW_STACK.

The warning is a VM_WARN_ON_ONCE(), so without CONFIG_DEBUG_VM the
functions are empty, but the calls remain. With the SRSO "Safe RET"
mitigation the return of every such call mispredicts.

The x86 helpers already keep such entries out of other VMAs.
pte_wrprotect(), pte_mkdirty(), pte_modify() and their PMD versions go
through SavedDirty, and only pte_mkwrite() and pmd_mkwrite() on a
VM_SHADOW_STACK VMA create the combination.

Remove the checks, their callers and pud_shstk(), which has no other
user.

In a KVM guest on Zen 4 with Safe RET, zapping 4K pages takes one branch
miss per page fewer. MADV_DONTNEED of 1 GiB gets 6% faster on anonymous
memory and 8% on shmem, munmap() 5%. THP is unchanged. Without Safe RET
the difference is within noise.

Suggested-by: Dave Hansen <dave.hansen@linux.intel.com>
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
Acked-by: Zi Yan <ziy@nvidia.com>
Link: https://patch.msgid.link/20261105120322.3319301-1-kirill@shutemov.name
---
 arch/x86/include/asm/pgtable.h | 16 ----------------
 arch/x86/mm/pgtable.c          | 26 --------------------------
 include/linux/pgtable.h        | 20 --------------------
 mm/huge_memory.c               |  2 --
 mm/memory.c                    |  3 ---
 5 files changed, 67 deletions(-)

diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 000fc6c..613c22c 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -199,13 +199,6 @@ static inline int pud_young(pud_t pud)
 	return pud_flags(pud) & _PAGE_ACCESSED;
 }
=20
-static inline bool pud_shstk(pud_t pud)
-{
-	return cpu_feature_enabled(X86_FEATURE_SHSTK) &&
-	       (pud_flags(pud) & (_PAGE_RW | _PAGE_DIRTY | _PAGE_PSE)) =3D=3D
-	       (_PAGE_DIRTY | _PAGE_PSE);
-}
-
 static inline int pte_write(pte_t pte)
 {
 	/*
@@ -1666,15 +1659,6 @@ static inline bool arch_has_pfn_modify_check(void)
 	return boot_cpu_has_bug(X86_BUG_L1TF);
 }
=20
-#define arch_check_zapped_pte arch_check_zapped_pte
-void arch_check_zapped_pte(struct vm_area_struct *vma, pte_t pte);
-
-#define arch_check_zapped_pmd arch_check_zapped_pmd
-void arch_check_zapped_pmd(struct vm_area_struct *vma, pmd_t pmd);
-
-#define arch_check_zapped_pud arch_check_zapped_pud
-void arch_check_zapped_pud(struct vm_area_struct *vma, pud_t pud);
-
 #ifdef CONFIG_XEN_PV
 #define arch_has_hw_nonleaf_pmd_young arch_has_hw_nonleaf_pmd_young
 static inline bool arch_has_hw_nonleaf_pmd_young(void)
diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index 4a105f2..58e5012 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -797,29 +797,3 @@ pmd_t pmd_mkwrite(pmd_t pmd, struct vm_area_struct *vma)
=20
 	return pmd_clear_saveddirty(pmd);
 }
-
-void arch_check_zapped_pte(struct vm_area_struct *vma, pte_t pte)
-{
-	/*
-	 * Hardware before shadow stack can (rarely) set Dirty=3D1
-	 * on a Write=3D0 PTE. So the below condition
-	 * only indicates a software bug when shadow stack is
-	 * supported by the HW. This checking is covered in
-	 * pte_shstk().
-	 */
-	VM_WARN_ON_ONCE(!(vma->vm_flags & VM_SHADOW_STACK) &&
-			pte_shstk(pte));
-}
-
-void arch_check_zapped_pmd(struct vm_area_struct *vma, pmd_t pmd)
-{
-	/* See note in arch_check_zapped_pte() */
-	VM_WARN_ON_ONCE(!(vma->vm_flags & VM_SHADOW_STACK) &&
-			pmd_shstk(pmd));
-}
-
-void arch_check_zapped_pud(struct vm_area_struct *vma, pud_t pud)
-{
-	/* See note in arch_check_zapped_pte() */
-	VM_WARN_ON_ONCE(!(vma->vm_flags & VM_SHADOW_STACK) && pud_shstk(pud));
-}
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 780fe84..fc32289 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -621,26 +621,6 @@ static inline unsigned int exec_folio_order(void)
 }
 #endif
=20
-#ifndef arch_check_zapped_pte
-static inline void arch_check_zapped_pte(struct vm_area_struct *vma,
-					 pte_t pte)
-{
-}
-#endif
-
-#ifndef arch_check_zapped_pmd
-static inline void arch_check_zapped_pmd(struct vm_area_struct *vma,
-					 pmd_t pmd)
-{
-}
-#endif
-
-#ifndef arch_check_zapped_pud
-static inline void arch_check_zapped_pud(struct vm_area_struct *vma, pud_t p=
ud)
-{
-}
-#endif
-
 #ifndef __HAVE_ARCH_PTEP_GET_AND_CLEAR
 static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
 				       unsigned long address,
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index eb913ac..3146fa2 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2572,7 +2572,6 @@ bool zap_huge_pmd(struct mmu_gather *tlb, struct vm_are=
a_struct *vma,
 	 */
 	orig_pmd =3D pmdp_huge_get_and_clear_full(vma, addr, pmd,
 						tlb->fullmm);
-	arch_check_zapped_pmd(vma, orig_pmd);
 	tlb_remove_pmd_tlb_entry(tlb, pmd, addr);
=20
 	is_present =3D pmd_present(orig_pmd);
@@ -3056,7 +3055,6 @@ int zap_huge_pud(struct mmu_gather *tlb, struct vm_area=
_struct *vma,
 		return 0;
=20
 	orig_pud =3D pudp_huge_get_and_clear_full(vma, addr, pud, tlb->fullmm);
-	arch_check_zapped_pud(vma, orig_pud);
 	tlb_remove_pud_tlb_entry(tlb, pud, addr);
 	if (!vma_is_mm_managed(vma)) {
 		spin_unlock(ptl);
diff --git a/mm/memory.c b/mm/memory.c
index ec3d9d9..e6a9d8b 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1753,8 +1753,6 @@ static __always_inline void zap_present_folio_ptes(stru=
ct mmu_gather *tlb,
 		clear_full_ptes(mm, addr, pte, nr, tlb->fullmm);
 		rss[MM_ANONPAGES] -=3D nr;
 	}
-	/* Checking a single PTE in a batch is sufficient. */
-	arch_check_zapped_pte(vma, ptent);
 	tlb_remove_tlb_entries(tlb, pte, nr, addr);
 	if (unlikely(userfaultfd_pte_wp(vma, ptent)))
 		*any_skipped =3D zap_install_uffd_wp_if_needed(vma, addr, pte,
@@ -1793,7 +1791,6 @@ static inline int zap_present_ptes(struct mmu_gather *t=
lb,
 	if (!page) {
 		/* We don't need up-to-date accessed/dirty bits. */
 		ptep_get_and_clear_full(mm, addr, pte, tlb->fullmm);
-		arch_check_zapped_pte(vma, ptent);
 		tlb_remove_tlb_entry(tlb, pte, addr);
 		if (userfaultfd_pte_wp(vma, ptent))
 			*any_skipped =3D zap_install_uffd_wp_if_needed(vma, addr,
