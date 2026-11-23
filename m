Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447991;
	b=CoRJ/5z6ClgI+1kia9EE8Q4L2qBj/WJaW8kRHo3PsLChOy/S8HU85GlgQTjtMsGVK/1M
	 GVviHzhx526CQE6/P3S3hOqWesabmJ4VYLiEROyy+Nv4wM47X8SBeRh1lj2nEPnt8ayMQ
	 3tnWdAGtJwS1UkFMHDI20RmVtS6XMVFHJ4xzEMNdn01BZozIHM1kRgbXDL5SC+Qa5TehS
	 7Rtq14o7p7MiNJM+p8ZTW/eQmZh4bwYiwzuDBij4HsjtEMPjKzZGM/Y1RX/EJFHDklIum
	 0elbeU+QqAZb9dAi3WVTmmbDSnHbFQIOaG22UIkioYitmr+DBkfdqirB+RqpfKfwb3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=P0HmEkR7XVIgQImbtvtX44VFrjVW2UkwB3zPu47siq4=;
	b=Q78nteiJv/XC3M4QvCbfAFTBmJkInrvojmZLc90yNeDtvemXKszwEjrB+9HTJ6dx9mIq
	 y4u+Imr6sSO9pdlKeVTdTebj3VhLrFx/DUhvNZ3rr7bUO+psoSHbKR0PDG2ieTdLh9jw6
	 0G7r9jDW8WUw0uq+uY1XHoO5SoeM3OmYTExGXRaQN2w7eWYMR7j3VTNrL94BNMEvjNYBe
	 eIVkTm40Va0pXQK9jy3pPsEQ8TIZN5LxI2puxcfhQAJWJ5UVsC0r5jygTdOuvMCFZesDI
	 kQ+eETamj2tYzKgB+sUu7MyHZPDPutx2CzWe0Vaecr9Wr3IZC2L44Aa6LpceaqX1twQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asu.edu;
	spf=pass smtp.mailfrom=asu.edu;
	dkim=pass header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=FrKH2y0b;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C48606A684
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:33:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33C48606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=FrKH2y0b
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so4207894c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1795447990; x=1796052790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P0HmEkR7XVIgQImbtvtX44VFrjVW2UkwB3zPu47siq4=;
        b=FrKH2y0bcC6ghR/xaOyppJpaHBu1yn4n87Ls9TabAolNslQAgG/twQ3Z1+G/743gMV
         PDK95QGtBr9ewAQbJ5o/JHBTywWh6J2ScA+qMp2LwSkxfRXX82JS//T+vAgeQd6f64AS
         Biatf0d2WhGETOH0uBjR5elCkvX17EvLbQhdfXHGviub1aem2eqdZAwGl3+sryDYSB6E
         GJmlyEt70FmxnX0kZW5SpaIWH0W7HrB618ri5TaBcCZbUyt5rbpKunPhyTRuzMkILz2j
         3aSLEpcURdQQbQDKE4HIgJiD+2s7j/KOy3hCluawHTuc38NM0DhNSz6QGH0FU1/7wY1O
         bqTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447990; x=1796052790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P0HmEkR7XVIgQImbtvtX44VFrjVW2UkwB3zPu47siq4=;
        b=0mr47eEPAYDdgfy6zLHpOnWbj1C94sj6EEHBp5GkVd2BjAZaU/JUkg5LgSuXEZeaGi
         lgdEx5PRVNUOoKhcSCnS0OF6ie9Zqz9QXpRweKRB9YFKMMM0TGHzYI6vevYZySaBtqKI
         l6mWtvqT8981WKbZOV0UqEccil3aWVWAD6lwpVROybLMa/WzPlkIMeKNYNP0UPZg8Vy0
         eMy2fD2zsxXaQjNXc82YL/ZXMmFRlkvS8FRG0a2nkZZIH2Q78Vxkke3S4nuaylSjBRll
         ZxIOXb9AiHuPXYihzTo0qF5H/GzgYdTbFoqZT2EBDVOQ6w+EheDaduUCp+v9oVLxYTaY
         0VZA==
X-Forwarded-Encrypted: i=1; AL+hErHZJ9kLYFubRmG5AW0x2TegY6H5U6GPOg18A/n/p6wgM1dE7oZBpIUUapk4aJpoFeIYWFpU+IQAknSzvEk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8azd4+2FRpuWZ3cXbUw24al81DSjUbrwsftWTeCFP89+wyVrUC
	FDKREnuCtr6fYv2HhvCXpNoSwIW7aMCcMAuX+6F2bSCqm+5aH46wcOeJn/1FvlU4Y1jJvvJM6ZN
	xpeLhXg==
X-Gm-Gg: AZFdTZeDsgNpL3aztY/rS74pbXv0/1i7auq4A+lxToOsmuEcmDlpJJUDt2/f2hqk05w
	FYCXnX0Ch1yUKetYI6oGPvxQZOkqjHCEgVE5NEaFwJ/9pXNFRXv2k/mscAefM0Tn4MZ35PWYYH0
	1Ys2Yg32Y0OHz3/7vJuUuw+iND7s+ljaq84E5nRLjp4cLirRYV9e/XI141RbsT8mQBgqvvfkHlB
	iUqesz+BT649ljm6Jicw8MFL9nUFTGLdPoslCcdGp/Snf649aK0+Z4P6089ni+RWN5G+MzcqAmJ
	HWuWC7zAEWijUoJl7gZjoaAmXL0dhkM80xwVISaBRhw3S/fZJj2YWPg2uY9BjQWPHJ9Oxw5tADP
	IN433caSaXMVdT4Cp3IlLjtoLd0CXUWnBb6NcYRk85s3QsryWTIN50ZVNocRo0vSFdX6PAswNuy
	vzg/N/qu+QhCozxhI8J9/9P/ac5GGXEdXYt5468jpBr+MWKCcYlZ0pI7Efpk0pnCjbkMXWRqAsl
	xs2QUNIpaLYwIfm7K3hdFTZMN9jmp1s0tXkUypNFdNojXwDcKVCd6+J4EjIQji22u3KCm9iEiD3
	XReDOxSXfyBwjQ40RzZRiIMi+Rc0tZVI6ARy2lakNGgCrYG5nRUvEwaK5/xa4lA=
X-Received: by 2002:a05:7300:d0a8:b0:386:9957:752f with SMTP id 5a478bee46e88-386995777f4mr8441803eec.25.1795447990313;
        Mon, 23 Nov 2026 07:33:10 -0800 (PST)
Received: from localhost.localdomain ([2600:8800:1e00:25f0:3391:10c3:1717:1522])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm34601237eec.16.2026.11.23.07.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:33:10 -0800 (PST)
From: Siddharth Mishra <smish149@asu.edu>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: Shuah Khan <shuah@kernel.org>,
	Peter Xu <peterx@redhat.com>,
	James Houghton <jthoughton@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siddharth Mishra <smish149@asu.edu>
Subject: [PATCH 2/2] KVM: selftests: Test dirty ring pushes from vCPU preemption
Date: Mon, 23 Nov 2026 08:32:38 -0700
Message-ID: <20261123153238.1036972-3-smish149@asu.edu>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261123153238.1036972-1-smish149@asu.edu>
References: <20261123153238.1036972-1-smish149@asu.edu>
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

Add a test that dirties pages in a dirty-logged memslot that also holds
the vCPU's steal-time structure, while a busy thread shares the vCPU
thread's CPU so that the vCPU task is preempted often.  After every
KVM_RUN, harvest the dirty ring and assert that no entry is left dirty,
which fails if kvm_steal_time_set_preempted() pushes to the ring in the
middle of kvm_dirty_ring_push().

Require PML, as flushing the PML buffer on VM-Exit is where KVM pushes
to the dirty ring with preemption enabled.  Pass -S to run without steal
time, and -t to change the run time from the default of 60 seconds.

Signed-off-by: Siddharth Mishra <smish149@asu.edu>
---
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../kvm/x86/dirty_ring_steal_time_test.c      | 146 ++++++++++++++++++
 2 files changed, 147 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/x86/dirty_ring_steal_time_test.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 17a4256e9081..ab4dff45d306 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -78,6 +78,7 @@ TEST_GEN_PROGS_x86 = $(TEST_GEN_PROGS_COMMON)
 TEST_GEN_PROGS_x86 += x86/cpuid_test
 TEST_GEN_PROGS_x86 += x86/cr4_cpuid_sync_test
 TEST_GEN_PROGS_x86 += x86/dirty_log_page_splitting_test
+TEST_GEN_PROGS_x86 += x86/dirty_ring_steal_time_test
 TEST_GEN_PROGS_x86 += x86/feature_msrs_test
 TEST_GEN_PROGS_x86 += x86/evmcs_smm_controls_test
 TEST_GEN_PROGS_x86 += x86/exit_on_emulation_failure_test
diff --git a/tools/testing/selftests/kvm/x86/dirty_ring_steal_time_test.c b/tools/testing/selftests/kvm/x86/dirty_ring_steal_time_test.c
new file mode 100644
index 000000000000..6e65055e8c2d
--- /dev/null
+++ b/tools/testing/selftests/kvm/x86/dirty_ring_steal_time_test.c
@@ -0,0 +1,146 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#define _GNU_SOURCE
+#include <pthread.h>
+#include <sched.h>
+#include <stdlib.h>
+#include <time.h>
+#include <unistd.h>
+#include <asm/barrier.h>
+
+#include "kvm_util.h"
+#include "processor.h"
+#include "ucall_common.h"
+
+#define TEST_SLOT		1
+#define TEST_GPA		0x10000000ul
+#define TEST_PAGES		16384
+#define RING_ENTRIES		65536u
+#define DEFAULT_SECONDS		60
+
+static bool stop_hog;
+static int test_cpu;
+
+static void guest_code(u64 gva)
+{
+	u64 gen = 0, i;
+
+	for (;;) {
+		gen++;
+		for (i = 1; i < TEST_PAGES; i++)
+			WRITE_ONCE(*(u64 *)(gva + i * PAGE_SIZE), gen);
+		GUEST_SYNC(gen);
+	}
+}
+
+static void pin_self(int cpu)
+{
+	cpu_set_t set;
+
+	CPU_ZERO(&set);
+	CPU_SET(cpu, &set);
+	TEST_ASSERT(!pthread_setaffinity_np(pthread_self(), sizeof(set), &set),
+		    "Failed to pin to CPU %d", cpu);
+}
+
+static void *hog(void *arg)
+{
+	pin_self(test_cpu);
+	while (!READ_ONCE(stop_hog))
+		;
+	return NULL;
+}
+
+static u32 harvest(struct kvm_dirty_gfn *ring, u32 *fetch)
+{
+	struct kvm_dirty_gfn *e;
+	u32 n = 0, i;
+
+	for (;;) {
+		e = &ring[*fetch % RING_ENTRIES];
+		if (smp_load_acquire(&e->flags) != KVM_DIRTY_GFN_F_DIRTY)
+			break;
+		smp_store_release(&e->flags, KVM_DIRTY_GFN_F_RESET);
+		(*fetch)++;
+		n++;
+	}
+
+	for (i = 0; i < RING_ENTRIES; i++) {
+		TEST_ASSERT(READ_ONCE(ring[i].flags) != KVM_DIRTY_GFN_F_DIRTY,
+			    "Entry %u is dirty, but entry %u before it was never written",
+			    i, *fetch % RING_ENTRIES);
+	}
+	return n;
+}
+
+int main(int argc, char *argv[])
+{
+	int seconds = DEFAULT_SECONDS, opt;
+	struct kvm_dirty_gfn *ring;
+	bool steal_time = true;
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+	u32 fetch = 0, n;
+	pthread_t thread;
+	struct ucall uc;
+	time_t end;
+
+	test_cpu = sched_getcpu();
+	while ((opt = getopt(argc, argv, "c:t:S")) != -1) {
+		switch (opt) {
+		case 'c':
+			test_cpu = atoi(optarg);
+			break;
+		case 't':
+			seconds = atoi(optarg);
+			break;
+		case 'S':
+			steal_time = false;
+			break;
+		default:
+			TEST_FAIL("Usage: %s [-c cpu] [-t seconds] [-S]", argv[0]);
+		}
+	}
+
+	TEST_REQUIRE(kvm_has_cap(KVM_CAP_DIRTY_LOG_RING) ||
+		     kvm_has_cap(KVM_CAP_DIRTY_LOG_RING_ACQ_REL));
+	TEST_REQUIRE(host_cpu_is_intel && get_kvm_intel_param_bool("pml"));
+	if (steal_time)
+		TEST_REQUIRE(kvm_cpu_has(X86_FEATURE_KVM_STEAL_TIME));
+
+	pin_self(test_cpu);
+
+	vm = __vm_create(VM_SHAPE_DEFAULT, 1, 0);
+	vm_enable_dirty_ring(vm, RING_ENTRIES * sizeof(struct kvm_dirty_gfn));
+	vcpu = vm_vcpu_add(vm, 0, guest_code);
+	kvm_arch_vm_finalize_vcpus(vm);
+
+	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, TEST_GPA,
+				    TEST_SLOT, TEST_PAGES,
+				    KVM_MEM_LOG_DIRTY_PAGES);
+	virt_map(vm, TEST_GPA, TEST_GPA, TEST_PAGES);
+	vcpu_args_set(vcpu, 1, TEST_GPA);
+	if (steal_time)
+		vcpu_set_msr(vcpu, MSR_KVM_STEAL_TIME,
+			     TEST_GPA | KVM_MSR_ENABLED);
+
+	ring = vcpu_map_dirty_ring(vcpu);
+	TEST_ASSERT(!pthread_create(&thread, NULL, hog, NULL),
+		    "Failed to create hog thread");
+
+	end = time(NULL) + seconds;
+	while (time(NULL) < end) {
+		vcpu_run(vcpu);
+		if (vcpu->run->exit_reason != KVM_EXIT_DIRTY_RING_FULL) {
+			TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_IO);
+			if (get_ucall(vcpu, &uc) == UCALL_ABORT)
+				REPORT_GUEST_ASSERT(uc);
+		}
+		n = harvest(ring, &fetch);
+		TEST_ASSERT_EQ(kvm_vm_reset_dirty_ring(vm), n);
+	}
+
+	WRITE_ONCE(stop_hog, true);
+	pthread_join(thread, NULL);
+	kvm_vm_free(vm);
+	return 0;
+}
-- 
2.54.0

