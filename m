Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.193
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430114;
	b=qTbPaSjYF6fejCRs+GQFjETFTcOUaMPOn6k997qt66gvSQ3JJmjv4s+InDvi0j2mPm/z
	 JX0vQ3+WMyUbwVO2v4A2OysMNqZXOWfdMpdU/PASMoNqDC/AIFTlyxyzszCpoYMoTFlQT
	 BhLsSOMXkzjPhGy3aFcCdkYZJdoWL/AKOS43BknZQ+3RNYH2MVIxLizfAgKsP9ldM5Oy8
	 lumhfeSRbzw49VUdwt0w7Hna96pzcToJ9TUZx+SPA0jiKNvUF1wsjnox+S1ya3fGgbrmT
	 j8VsJSKo8JbGJrqA61m/CmGSnrVYhvZtdWD1RSOh414Pj3mFhsececf9BJldQ7b6vBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430114;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lWio/ZaYW+Ez8es1JnqyfDCIZ2Tx6iwXiB9k3U+N5Zs=;
	b=gyfjEgHoLOVdFhbUtrBRAKdVHIRm22zQ3XfD9+hBGUjdoR/AOj0pQsvB90NObbjMVnWL
	 6bJIqCyUq7uOzSlGuBkfILylLKN89p+bpO1Fdry0RY9f0QNK8EIMeN4Ub0YOODu22e5Sz
	 JYooag0fVBMIvxruusFF7IQQSNF8t/l3xIvOBbIl6GUZvHA2iDpv39hH9jEOicxbgbsOs
	 B0c31+C+5WU8URxPKR4yISj3ZbwwYBJUbJisETtBJdDfNYKfhvpFmmdX1ofELw/NPv0i9
	 cEgfsUk0zGCeNYund/lDXy35zV0jKpaSWaolsAKKZ3BwfGBrzaYbCT9hlQKPIhN/i9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fuQVgPFD;
	arc=none smtp.remote-ip=91.218.175.193
Received: from mta0.migadu.com (out-193.mta0.migadu.com [91.218.175.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DDD606A33C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:35:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0DDD606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fuQVgPFD
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=IDG8FN6cGRh+zZL5h3B/Xnl0MXwN5GMGINSU+pdwgF8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795430112; v=1; x=1796034912;
 b=fuQVgPFDCIdL2Zne2TVj3GoYIYtkL33UcpxVa0zTpwA7uFOXdeVnZfCEJZbBfkYG1QGTyU/a
 KMtiH5BOJSLLaqTnmShzo6ivxYpeYCAxE4WDKkYu73UbzXeu/wjjNjbOV2tmwQabVJTEu5M7pAJ
 sehEXEVntOWW4KyeWfjNVnfo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 82def4b9cf94a7df;
	Mon, 23 Nov 2026 10:35:10 +0000
X-Mizu-Trace-ID: 82def4b9cf94a7df
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Gavin Shan <gshan@redhat.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH 2/2] KVM: arm64: selftests: Test a THP whose first fault is on a tail page
Date: Mon, 23 Nov 2026 10:35:05 +0000
Message-ID: <20261123103505.1006067-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123103505.1006067-1-fuad.tabba@linux.dev>
References: <20261123103505.1006067-1-fuad.tabba@linux.dev>
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

On a host whose PMD level is folded, KVM mapped host memory past a THP
when the guest first touched the THP at a page other than its first.

Add a scenario for that case. The guest writes to the second host page
of a memslot backed by one THP, then reads the first address past the
memslot. The test checks that the write landed in that page, and that
the read exits to userspace as MMIO. On a host whose PMD level isn't
folded, the scenario passes with or without the fix. It doesn't use
hugetlb pages, so it runs before the probe that skips the rest of the
test when they aren't reserved.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 .../kvm/arm64/stage2_block_transitions.c      | 56 ++++++++++++++++++-
 1 file changed, 53 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/stage2_block_transitions.c b/tools/testing/selftests/kvm/arm64/stage2_block_transitions.c
index 5fd47f4ada1f3..000e8ec7ce8cc 100644
--- a/tools/testing/selftests/kvm/arm64/stage2_block_transitions.c
+++ b/tools/testing/selftests/kvm/arm64/stage2_block_transitions.c
@@ -3,10 +3,10 @@
  * Copyright (c) 2026 Google LLC
  * Author: Fuad Tabba <fuad.tabba@linux.dev>
  *
- * stage2_block_transitions - Exercise stage-2 block/page granularity changes
- * that dirty logging forces at fault time, and assert the guest completes.
+ * stage2_block_transitions - Exercise stage-2 block/page granularity at fault
+ * time: the changes dirty logging forces, and how far a THP block reaches.
  *
- * Both scenarios need the fault handler to allocate at fault time (a fresh
+ * Scenarios 1 and 2 need the fault handler to allocate at fault time (a fresh
  * mapping and/or page-table pages while holding mmu_lock), so a fault path
  * that fails to stage that memory manifests as a KVM_RUN error or, worse, a
  * host crash. The asserted property is host-agnostic: the guest runs the
@@ -27,6 +27,11 @@
  *   fault that must split the block into pages during logging, draining
  *   page-table pages. Skipped on CTR_EL0.DIC hardware, where mappings are
  *   made executable eagerly and the execute fault never occurs.
+ *
+ * Scenario 3 - THP whose first fault is on a tail page:
+ *   The guest writes to the second host page of a memslot backed by one
+ *   THP, then reads the first address past it. If KVM mapped the THP and
+ *   nothing past it, the write lands in the memslot and the read exits as MMIO.
  */
 #include <linux/bitfield.h>
 #include <linux/bitmap.h>
@@ -198,6 +203,49 @@ static void test_exec_split_drain(void)
 	kvm_vm_free(vm);
 }
 
+static void thp_guest_code(u64 touch_gva, u64 past_gva)
+{
+	WRITE_ONCE(*(u64 *)touch_gva, 0x1);
+	READ_ONCE(*(u64 *)past_gva);
+	GUEST_DONE();
+}
+
+static void test_thp_tail_first_touch(void)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+	struct ucall uc;
+	size_t npages;
+	u64 thp_size;
+	u64 gpa;
+
+	if (!thp_configured()) {
+		ksft_print_msg("SKIP THP tail first touch: THP not configured\n");
+		return;
+	}
+	thp_size = get_trans_hugepagesz();
+
+	vm = vm_create_with_one_vcpu(&vcpu, thp_guest_code);
+	npages = thp_size / vm->page_size;
+
+	gpa = (vm_compute_max_gfn(vm) * vm->page_size) - 2 * thp_size;
+	gpa = align_down(gpa, thp_size);
+
+	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS_THP, gpa, DATA_SLOT, npages, 0);
+	virt_pg_map(vm, TEST_GVA + getpagesize(), gpa + getpagesize());
+	virt_pg_map(vm, TEST_GVA + thp_size, gpa + thp_size);
+	vcpu_args_set(vcpu, 2, TEST_GVA + getpagesize(), TEST_GVA + thp_size);
+
+	vcpu_run(vcpu);
+	TEST_ASSERT(get_ucall(vcpu, &uc) != UCALL_DONE,
+		    "Read past the memslot completed without an exit");
+	TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_MMIO);
+	TEST_ASSERT_EQ(vcpu->run->mmio.phys_addr, gpa + thp_size);
+	TEST_ASSERT_EQ(*(u64 *)addr_gpa2hva(vm, gpa + getpagesize()), 0x1);
+
+	kvm_vm_free(vm);
+}
+
 /*
  * The explicit-size hugetlb backing hard-fails region creation if the pages
  * are not already reserved, so probe here and skip rather than abort. The
@@ -216,6 +264,8 @@ static void require_hugepages(size_t bytes)
 
 int main(void)
 {
+	test_thp_tail_first_touch();
+
 	require_hugepages(NR_BLOCKS * BLOCK_SIZE);
 
 	test_block_collapse();
-- 
2.47.3

