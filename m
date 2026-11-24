Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795488849;
	b=PwZJTw6TbiTWSYP+PF4HT9RxdaEsefZlFEjlrIN0xoTGG6qRKm+lnrSsyL9UXpvvNUl2
	 c1wpA8CfuCte1fHChc9W8uEWbcJI1XP/trK1/HQ4Z87ps7dXU3SjlH8m3tgEyHYM9A7Yo
	 gQ2iXsjltekpJVzi4DYkKm5pR3rzKvwVJbJHDun47NJmlfP192giaS0bPTbB+LawSzOpl
	 hXoVUAIJ9seV9F5Ot7rJ8Y/ELgtIbnZaoVJmxueG8OXbfj/uxmyDEnC382hho9eeldwT2
	 +hieclBsedevDFrVIr+HX1BHLJwbn2NAYdetLvSmXGLmyCig3JcHsrxoltyETVsTiHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795488849;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=A9OByVhcaPMdclXsC8d0WeifEVYMp3QOb8HdzPBzqso=;
	b=zrIggl4xkl/8cX3jmS5sytsKXQp2QxqarDiRcK8aU0GnhLdv26xP5s9OBZuucT+542nk
	 G9QyUVG7AZe10h8sO2I5GmcSr2DIz8ZdyQl+zT05Wkx9h0dGGrtyRflY3ek9+PkOLCeW3
	 Ir8QGFNOaS9/DE7i3DRiPpxfBKyE2kq49I4sadp0Ys6OPV6YuuNM5RG9jpQHkqQtNxV4b
	 U6mY5tjoDS+CwF+yz9hhy6OD3TrXns92XHgxjgk2P87SvqmR6RnCDXC9cVe92HecCkvIj
	 4U6Kxnq9gl9MhfA+BwGRQLgzF6G0Ypihhcz2Ntci5ygEhhRxdC5TkOz2U8iK/QZ921w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=WfMsfyur;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8973606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:54:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8973606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=WfMsfyur
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A089D339;
	Mon, 23 Nov 2026 18:54:03 -0800 (PST)
Received: from entos-yitian-01.Arm.com (unknown [10.168.196.233])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2E3393F632;
	Mon, 23 Nov 2026 18:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795488846; bh=OCAouA1Xia+mH8/32AybCEr2idz9JsmsWi8UEsWGjAY=;
	h=From:To:Cc:Subject:Date:From;
	b=WfMsfyurppnScpgzrRuAQDxtwfLeJxMOqnQyduHu9KXI5PsXzcBnbigTUKzOQplUV
	 Cn5LzsAJcwUAp+VEdUSJvXnTqBNrBtaur+38URkHGw9HJBpY9CNLIzuFY49SypqTLb
	 QKZCTzNc+2OqlGEwnq/fpNnES6SsUo8yqZFJmHMs=
From: Jia He <justin.he@arm.com>
To: maz@kernel.org,
	oupton@kernel.org,
	fuad.tabba@linux.dev,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jia He <justin.he@arm.com>
Subject: [PATCH] KVM: arm64: nv: Allow the L1 VNCR page in cacheable PFNMAP memory
Date: Tue, 24 Nov 2026 02:53:36 +0000
Message-Id: <20261124025336.4107575-1-justin.he@arm.com>
X-Mailer: git-send-email 2.34.1
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

kvm_translate_vncr() refuses any PFN that isn't memory and injects an
SEA into the guest hypervisor. That is stricter than what the stage-2
fault path allows (kvm_s2_fault_pin_pfn()): a VM_PFNMAP or VM_MIXEDMAP
VMA whose host stage-1 attributes are cacheable is mapped cacheable at
stage-2 when FWB and DIC are present, and the guest can use such memory
as RAM (e.g. device memory that it onlines as a NUMA node). If the guest
then picks a page of that memory as the VNCR page of one of its own
guests, it takes an SEA as soon as it enters that guest.

Relax the check to match the stage-2 fault path, addressing the FIXME
added by commit 4bd7dbe0b224 ("KVM: arm64: nv: Inject SEA if guest VNCR
isn't normal memory"): look up the VMA, and allow the PFN if the VMA is
a cacheable VM_PFNMAP or VM_MIXEDMAP one and the system supports
cacheable PFNMAP at stage-2. No linear mapping is required, as VNCR
accesses use the EL2 fixmap and require no cache maintenance.
mmu_invalidate_seq is sampled before the PFN is faulted in, so a VMA
change after the lookup is caught by the mmu_invalidate_retry() check
that follows, as for the PFN itself.

Tested on a host with FEAT_FGT, FWB and DIC, with an L1 whose whole RAM
is a cacheable PFNMAP (host RAM withheld with mem= and handed to the VMM
by a test driver with remap_pfn_range()) starting an L2 guest
hypervisor. Without the patch, L2 repeatedly takes an SEA at the same PC
and fails to boot. With the patch, L2 boots successfully.

Signed-off-by: Jia He <justin.he@arm.com>
---
 arch/arm64/include/asm/kvm_mmu.h |  2 ++
 arch/arm64/kvm/mmu.c             |  2 +-
 arch/arm64/kvm/nested.c          | 37 ++++++++++++++++++++++++++------
 3 files changed, 34 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/kvm_mmu.h
index 32392abf2e21..e59c6603b137 100644
--- a/arch/arm64/include/asm/kvm_mmu.h
+++ b/arch/arm64/include/asm/kvm_mmu.h
@@ -385,6 +385,8 @@ static inline void kvm_fault_unlock(struct kvm *kvm)
 		read_unlock(&kvm->mmu_lock);
 }
 
+bool kvm_vma_is_cacheable(struct vm_area_struct *vma);
+
 /*
  * ARM64 KVM relies on a simple conversion from physaddr to a kernel
  * virtual address (KVA) when it does cache maintenance as the CMO
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 1db10d8d6db7..cbd563ba4dd9 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1639,7 +1639,7 @@ static bool kvm_vma_mte_allowed(struct vm_area_struct *vma)
 	return vma->vm_flags & VM_MTE_ALLOWED;
 }
 
-static bool kvm_vma_is_cacheable(struct vm_area_struct *vma)
+bool kvm_vma_is_cacheable(struct vm_area_struct *vma)
 {
 	switch (FIELD_GET(PTE_ATTRINDX_MASK, pgprot_val(vma->vm_page_prot))) {
 	case MT_NORMAL_NC:
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 4d83281a7a28..87f5a3a2b119 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1553,6 +1553,36 @@ static u64 read_vncr_el2(struct kvm_vcpu *vcpu)
 	return (u64)sign_extend64(__vcpu_sys_reg(vcpu, VNCR_EL2), 48);
 }
 
+/*
+ * Allow a non-memory PFN only if it comes from a cacheable VM_PFNMAP or
+ * VM_MIXEDMAP VMA, as for a stage-2 mapping. The VMA is looked up after the
+ * PFN has been faulted in: the caller must check mmu_invalidate_retry()
+ * against a sequence count sampled before the fault-in.
+ */
+static bool vncr_pfn_is_cacheable(struct kvm_memory_slot *memslot, gfn_t gfn,
+				  kvm_pfn_t pfn)
+{
+	struct vm_area_struct *vma;
+	unsigned long hva;
+	bool ret = false;
+
+	if (pfn_is_map_memory(pfn))
+		return true;
+
+	if (!kvm_supports_cacheable_pfnmap())
+		return false;
+
+	hva = gfn_to_hva_memslot(memslot, gfn);
+
+	mmap_read_lock(current->mm);
+	vma = vma_lookup(current->mm, hva);
+	if (vma && (vma->vm_flags & (VM_PFNMAP | VM_MIXEDMAP)))
+		ret = kvm_vma_is_cacheable(vma);
+	mmap_read_unlock(current->mm);
+
+	return ret;
+}
+
 static int kvm_translate_vncr(struct kvm_vcpu *vcpu, bool *is_gmem)
 {
 	struct kvm_memory_slot *memslot;
@@ -1625,12 +1655,7 @@ static int kvm_translate_vncr(struct kvm_vcpu *vcpu, bool *is_gmem)
 		writable = !(memslot->flags & KVM_MEM_READONLY);
 	}
 
-	/*
-	 * FIXME: This check is too restrictive as KVM allows cacheable memory
-	 * attributes for PFNMAP VMAs that have cacheable attributes in host
-	 * stage-1.
-	 */
-	if (!pfn_is_map_memory(pfn)) {
+	if (!vncr_pfn_is_cacheable(memslot, gfn, pfn)) {
 		kvm_release_faultin_page(vcpu->kvm, page, true, false);
 		fail_s1_walk(&vt->wr, ESR_ELx_FSC_EXTABT, false);
 		return -EINVAL;

-- 
2.34.1

