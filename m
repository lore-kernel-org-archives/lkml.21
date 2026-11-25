Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795589820;
	b=KqA710hWhdVfu+mfq0278UjF+EtM9bZBu/M+SCi/8sYEZIwzrhq/2tZmeQN1x9iJ/1u4
	 IhqoyxCqTAmn9mOnhnNcGDuVyO8mQAUX2lQcghqIZpRquZYhLsDlS9NtyViYA4SNozr7E
	 NUaTFhVaCK12HfEunZAhS74tDt//Lk1z9XOuOn0z1GEDqdrP6tCg5IhwKjcbT5tHyJra6
	 tVl8HIhI826OrEiOQl9HoKbQbnPeJkQ/mutCHn4mjMfvvkaqhTT9//kMTLgEL4II+h0bl
	 U2TR4CpOo9oMnfchpNARunKCQMJkl3AzNLQhtKVRWXl5zrwmtZm+weIVqMuCVQ576XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795589820;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ec2abqXUKspUvFH12/nCiZwBysoielu6/ZVveaDMOS8=;
	b=qx8gsXWtRz+oMuOC+P2iF1fe+xWq51hIh30md8UC2DhxadUWsPWQ+dOt0PN9hLBNGdkh
	 LP0mmL47L3sjBiUrDDiOFuPXFjfjVZNmaQ/uz/O7hb6Fn4LNkYSC1tZiRROAko7uNIIxF
	 zOgzJpQiE/IL/qvagwOUZPYI5Amd70rZKo+2ri0pqG+j3S/G2f0h3KaROQJfa8LYul6ab
	 HWxbgFdMRJjk72sRv1lw6/VZbvBqPSyEvii1ySlKWycor2Aeow68r+R3ODrpBxGYqzDCu
	 4BT4fPrs/Uq625djt0LCUOt7hnrBIAwA1fsvRKqe2JKrbjgisb05wTgaSwNlNK/inyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pereq.eu;
	spf=pass smtp.mailfrom=cryspen.com;
	dkim=pass header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=cnNYt40i;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9312F606A6A7
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:56:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9312F606A6A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cryspen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=cnNYt40i
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso49668265e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795589818; x=1796194618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ec2abqXUKspUvFH12/nCiZwBysoielu6/ZVveaDMOS8=;
        b=cnNYt40iXG92j6E6qBDN44Wmrue5gwiRsv7hp9XoJQpBoKCOW+sJyLiEEtC3Zc0qmn
         1BzTdMo/YtczcgfCqlUrKi/H8y0nqp/LDJXFlDqup3m42oYQ1BelR2Y3Pa4dXDhPSrbx
         9raLIXLLyytEPCPGsiue7SwW0AJFyBEKH2EPQyDeQ+hurvIugUtC/X4h+F++QsbcMPFe
         mHCnjhIR8eUtgPC7SexUakQLB06zFS1lZfTRCoSrduW06xv0UYK7Bpt01dm8pJ7iv+SB
         NWaoJa++JIvCD9MuWnOgQrG3dzHii75cXTFi83jZTLFO+oYwitsHN6OMHJZEdodgWmTJ
         b/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795589818; x=1796194618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ec2abqXUKspUvFH12/nCiZwBysoielu6/ZVveaDMOS8=;
        b=O8GADlCwU6KW9duQmJ6tio/Vx+86VUta0oMxfendBkS/9VfR8bRAq8RnApKfpoOdUC
         uMYie0MUoFJ4TgdjpZ7FOOTiWCNCDxZ0w57mLf0jWkc49z/AwKTvJdrp8g4xnR3tH7QT
         xXsWWv6TodaTV3Ze2aGRSVTTY7LH52r8BNNTpTX+GBJFSWwCneSiRbHHcIFBxJQHJs6n
         NRlkon8SHNBxf/EizYPDeM0j3rDOGxo/N3C+7YSnrg2ULEQ3MZuN0gLDclBRjBUo270T
         iZf2leGNUHZ5XjAeGmWesiNq3lK7yEi7F55iRz6h2oJimeaqR39yZ8sUaZV5Zzp92mHj
         JWzg==
X-Forwarded-Encrypted: i=1; AL+hErHtnQyYRCUm2vEyOlkGTb/6ox/lZqDumbTWuiZlNBW8VCeU9jYq0r3UkqROK/1FMF4ys+eGe9krfVbhtVk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8y/17keIEOivNazJJhAkVsUsGId0uNWv0GSR10nQQUtYeo/D7J
	vD9y7Os52W87Cqh8emnMbQkrxIRbXo9Y93Bod8X2OQe28IKn/zw5+grzWCWU1YmLbXA=
X-Gm-Gg: AZFdTZdyniHY5C4KiSi7OtY0DF/taE1YJpnSQYnNtdXznSpx7hDcU/nTt+FZ/IUdWeD
	tV8lZHc3RQ/P/8Y4ePBvoAV/8Q5pbyHyCMwnUeHJDTj5tSsdbS4wabwnhsPEprqwlyBIyioVIQH
	//4dyBnbdEUeJulvG/6L7+ZY+aXkzRbYSemW8m/+pHoaJ23Yxo8g2FfgBXR9zo8ncYh9b+Mhr9t
	63O0PXoMJEsnTwxTRhOmMeEtxg+0bB+gl5dd460DP1/IXdrwkK2KrfLjNINeGZIeIluJV4iU8Pn
	+crOeASolhh3MgD5qA+F2tSnVYva5/AsrYT7Dxd2L+Kb8odBZag7TmWe9psDZgCpoYDKoBb9n5B
	lFvwWnqtaqwT8Z9x9Gnt7ZhCCMIMdhPn6TGhXytPjFTtiwKmETKuKjmLRE/N8K0V0b5i+Rg0ZAy
	0NJZdx6n8eAlgatjA909KUmKwqWdFCMoYQEhgZZWgFXbBQtmdMQ3/r5tM4Fm2kROZ1NcKWgOe5+
	9SprKCmg15t7HI8Pqzmb3XG8+ga0RUdpbiA6AZfJrb0UAyYd1qlPbzF2xt/ME9/TeAgKYXHrXTU
	qt16dsJa1Zr9g7ZIlCc=
X-Received: by 2002:a05:600c:3b94:b0:4bb:6f41:39be with SMTP id 5b1f17b1804b1-4bb8880ca3cmr426651375e9.15.1795589817865;
        Tue, 24 Nov 2026 22:56:57 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm482555715e9.10.2026.11.24.22.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 22:56:57 -0800 (PST)
From: Dan Carpenter <dan@pereq.eu>
Date: Wed, 25 Nov 2026 09:56:23 +0300
Subject: [PATCH v2 8/8] KVM: arm64: selftests: Test that a vcpu reset
 clears the vcpu's state
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-double_exception-v2-8-224689d8a764@pereq.eu>
References: <20261125-double_exception-v2-0-224689d8a764@pereq.eu>
In-Reply-To: <20261125-double_exception-v2-0-224689d8a764@pereq.eu>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Christoffer Dall <c.dall@virtualopensystems.com>, 
 Rusty Russell <rusty@rustcorp.com.au>, 
 Marcelo Tosatti <mtosatti@redhat.com>, Sebastian Ott <sebott@redhat.com>, 
 Eric Auger <eric.auger@redhat.com>, James Morse <james.morse@arm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>
Cc: Karthik Bhargavan <karthik@pereq.eu>, 
 =?utf-8?q?Cl=C3=A9ment_Blaudeau?= <clement@cryspen.com>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 Dan Carpenter <dan@pereq.eu>, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.16.0

Add a test to check that KVM_ARM_VCPU_INIT (which resets a vcpu) has
reset all the things it was supposed to.

The test dirties as much of the vcpu state as it can, resets the vcpu,
and compares every register in KVM_GET_REG_LIST with a freshly
initialised vcpu.  The are a few things which we must not clear such as
MPIDR_EL1, which userspace configures and the reset keeps, and the
CLIDR_EL1 and CCSIDR counters which keep counting.

The test runs with and without EL2.

Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
 tools/testing/selftests/kvm/Makefile.kvm       |   1 +
 tools/testing/selftests/kvm/arm64/vcpu_reset.c | 210 +++++++++++++++++++++++++
 2 files changed, 211 insertions(+)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 95867977beb3..cbd05070a2e3 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -201,6 +201,7 @@ TEST_GEN_PROGS_arm64 += arm64/sea_to_user
 TEST_GEN_PROGS_arm64 += arm64/set_id_regs
 TEST_GEN_PROGS_arm64 += arm64/smccc_filter
 TEST_GEN_PROGS_arm64 += arm64/stage2_block_transitions
+TEST_GEN_PROGS_arm64 += arm64/vcpu_reset
 TEST_GEN_PROGS_arm64 += arm64/vcpu_width_config
 TEST_GEN_PROGS_arm64 += arm64/vgic_init
 TEST_GEN_PROGS_arm64 += arm64/vgic_irq
diff --git a/tools/testing/selftests/kvm/arm64/vcpu_reset.c b/tools/testing/selftests/kvm/arm64/vcpu_reset.c
new file mode 100644
index 000000000000..cdc051e4b897
--- /dev/null
+++ b/tools/testing/selftests/kvm/arm64/vcpu_reset.c
@@ -0,0 +1,210 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * vcpu_reset - Test that resetting a vcpu that has run with KVM_ARM_VCPU_INIT
+ * puts it back in the state of a new vcpu.
+ *
+ * Before the reset, the vcpu has an MMIO read waiting for userspace and a
+ * pending SError, and userspace has written to every register it can.  After
+ * the reset, every register must match a new vcpu's, except the ones in
+ * preserved_regs[], which must keep the value userspace wrote, and the
+ * counters, which keep counting.  No SError may be pending, and the next
+ * KVM_RUN must not complete the MMIO read.
+ */
+#include "kvm_util.h"
+#include "processor.h"
+#include "test_util.h"
+
+#define MMIO_ADDR	0x8000000ULL
+#define MAX_REG_SIZE	256
+
+/*
+ * Registers that a reset keeps: the configuration that userspace sets for the
+ * vcpu, and the counters, which are VM-wide and change on their own.
+ */
+#define DEMUX_CCSIDR	(KVM_REG_ARM64 | KVM_REG_SIZE_U32 | KVM_REG_ARM_DEMUX | \
+			 KVM_REG_ARM_DEMUX_ID_CCSIDR)
+
+static bool is_preserved(u64 id)
+{
+	if ((id & ~(u64)KVM_REG_ARM_DEMUX_VAL_MASK) == DEMUX_CCSIDR)
+		return true;
+
+	switch (id) {
+	case KVM_ARM64_SYS_REG(SYS_MPIDR_EL1):
+	case KVM_ARM64_SYS_REG(SYS_CLIDR_EL1):
+		return true;
+	}
+	return false;
+}
+
+static bool is_counter(u64 id)
+{
+	return id == KVM_REG_ARM_TIMER_CNT || id == KVM_REG_ARM_PTIMER_CNT;
+}
+
+static void guest_code(void)
+{
+	READ_ONCE(*(u64 *)MMIO_ADDR);
+	GUEST_FAIL("The MMIO read completed");
+}
+
+struct regs {
+	struct kvm_reg_list *list;
+	u8 (*val)[MAX_REG_SIZE];
+};
+
+static void get_regs(struct kvm_vcpu *vcpu, struct regs *r)
+{
+	u64 i;
+
+	r->list = vcpu_get_reg_list(vcpu);
+	r->val = calloc(r->list->n, MAX_REG_SIZE);
+	TEST_ASSERT(r->val, "calloc() failed");
+	for (i = 0; i < r->list->n; i++) {
+		TEST_ASSERT(KVM_REG_SIZE(r->list->reg[i]) <= MAX_REG_SIZE,
+			    "Register 0x%llx is too big", r->list->reg[i]);
+		TEST_ASSERT(!__vcpu_get_reg(vcpu, r->list->reg[i], r->val[i]),
+			    "Can't read register 0x%llx", r->list->reg[i]);
+	}
+}
+
+static void free_regs(struct regs *r)
+{
+	free(r->list);
+	free(r->val);
+}
+
+/* Write the inverse of each register, or failing that, flip its bit 0 */
+static void dirty_regs(struct kvm_vcpu *vcpu)
+{
+	struct kvm_reg_list *list = vcpu_get_reg_list(vcpu);
+	u8 val[MAX_REG_SIZE];
+	struct kvm_one_reg reg = { .addr = (u64)val };
+	u64 i, j, size;
+
+	for (i = 0; i < list->n; i++) {
+		reg.id = list->reg[i];
+		size = KVM_REG_SIZE(reg.id);
+		if (__vcpu_get_reg(vcpu, reg.id, val))
+			continue;
+		for (j = 0; j < size; j++)
+			val[j] = ~val[j];
+		if (!__vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg))
+			continue;
+		for (j = 0; j < size; j++)
+			val[j] = ~val[j];
+		val[0] ^= 1;
+		__vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
+	}
+	free(list);
+}
+
+static void assert_reg_eq(u64 id, const u8 *got, const u8 *want, const char *what)
+{
+	u64 size = KVM_REG_SIZE(id);
+	u64 g = 0, w = 0;
+
+	if (!memcmp(got, want, size))
+		return;
+
+	memcpy(&g, got, size < 8 ? size : 8);
+	memcpy(&w, want, size < 8 ? size : 8);
+	TEST_FAIL("Register 0x%llx is 0x%lx after the reset, %s 0x%lx",
+		  (unsigned long long)id, (unsigned long)g, what, (unsigned long)w);
+}
+
+static struct kvm_vm *create_vcpu(bool el2, struct kvm_vcpu **vcpu)
+{
+	struct kvm_vcpu_init init;
+	struct kvm_vm *vm;
+
+	vm = vm_create(1);
+	kvm_get_default_vcpu_target(vm, &init);
+	if (el2)
+		init.features[0] |= BIT(KVM_ARM_VCPU_HAS_EL2);
+	else
+		init.features[0] &= ~BIT(KVM_ARM_VCPU_HAS_EL2);
+	*vcpu = aarch64_vcpu_add(vm, 0, &init, guest_code);
+	kvm_arch_vm_finalize_vcpus(vm);
+	return vm;
+}
+
+static void test_reset(bool el2)
+{
+	struct kvm_vcpu_events events = {};
+	struct regs new, before, after;
+	struct kvm_vcpu *vcpu, *ref;
+	struct kvm_vm *vm, *ref_vm;
+	u64 i, id;
+
+	/*
+	 * A new vcpu: initialised again to undo what the library set up, and
+	 * through its first KVM_RUN without running any code.
+	 */
+	ref_vm = create_vcpu(el2, &ref);
+	vcpu_ioctl(ref, KVM_ARM_VCPU_INIT, &ref->init);
+	vcpu_run_complete_io(ref);
+	get_regs(ref, &new);
+
+	vm = create_vcpu(el2, &vcpu);
+	virt_map(vm, MMIO_ADDR, MMIO_ADDR, 1);
+
+	vcpu_run(vcpu);
+	TEST_ASSERT_KVM_EXIT_REASON(vcpu, KVM_EXIT_MMIO);
+	TEST_ASSERT(!vcpu->run->mmio.is_write, "Expected an MMIO read");
+	memset(vcpu->run->mmio.data, 0x5a, sizeof(vcpu->run->mmio.data));
+
+	events.exception.serror_pending = true;
+	vcpu_events_set(vcpu, &events);
+
+	dirty_regs(vcpu);
+	get_regs(vcpu, &before);
+
+	vcpu_ioctl(vcpu, KVM_ARM_VCPU_INIT, &vcpu->init);
+
+	vcpu_events_get(vcpu, &events);
+	TEST_ASSERT(!events.exception.serror_pending, "An SError is still pending");
+
+	/* Completes the MMIO read if it is still pending */
+	vcpu_run_complete_io(vcpu);
+	get_regs(vcpu, &after);
+
+	TEST_ASSERT_EQ(new.list->n, after.list->n);
+	TEST_ASSERT_EQ(before.list->n, after.list->n);
+	for (i = 0; i < after.list->n; i++) {
+		id = after.list->reg[i];
+		TEST_ASSERT_EQ(id, new.list->reg[i]);
+		TEST_ASSERT_EQ(id, before.list->reg[i]);
+
+		if (is_counter(id))
+			continue;
+		if (is_preserved(id))
+			assert_reg_eq(id, after.val[i], before.val[i], "userspace wrote");
+		else
+			assert_reg_eq(id, after.val[i], new.val[i], "a new vcpu has");
+	}
+
+	free_regs(&new);
+	free_regs(&before);
+	free_regs(&after);
+	kvm_vm_free(vm);
+	kvm_vm_free(ref_vm);
+}
+
+int main(void)
+{
+	bool el2 = test_supports_el2();
+
+	ksft_print_header();
+	ksft_set_plan(el2 ? 2 : 1);
+
+	test_reset(false);
+	ksft_test_result_pass("reset without EL2\n");
+
+	if (el2) {
+		test_reset(true);
+		ksft_test_result_pass("reset with EL2\n");
+	}
+
+	ksft_finished();
+}

-- 
2.53.0

