Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795490876;
	b=eXNB8/NeZ9qSTrlYhQHf9L1IrqFGH2hYz7q2FiFY+NKMrbX21cpxHac9rtkUr4a7bR4U
	 yO3a8wtkt4+EL+/lNRmTN3I7jhI3uhvYjQfzTRfYQN90NOTCfsVKozWV7ef4EjNlW0Ng/
	 slSAL8kPumzDoRSdJ5nrbc5b5s/uykaEBZI07ElHN2NvKE6m9nDZJYEDlD34bfwP2p5ci
	 q2cBxUR6VCqvJfY8Re11ZTDncc8U9KfjTl+23Gs2NLWydceiUDMzm8v9uuGxJQ756m4r9
	 sXAXVPO3TJhO8M3SXj2IJY0IYaLH+RFbKbVjvx0/5LdU/xZxl2LEnNHNb2QPKnV7V0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795490876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hhfV7rDvQGkX8svztm1wWEU7DwBbew5Nukh/CQf2+fA=;
	b=ZaYv2rpWeNYsQmIZ8Z902pWDAu2aVEXfcdtV/42AuOqq7SNvNaAQ1tD5xZf7j1m47G8C
	 Deyvpp0igt11BsS6MZ2KdXUMPMCUWYIQMfVzjjsfTERlk7DsyaRbjw+Jdldy4IliGdQgC
	 AZhr+yeoM+61s60obs4PfDr0kuvA1Z+kxcrzTFkyweUM42HufrxVZ9PT16lkKh+SIBdWQ
	 Kz4tCUoDC5pD0owSNnOAmhveYftoe78fuMzx8wVE0jBpakBY5Bx9cT2/3nT583yRw2fcd
	 7Pe2+q00kCKDvxSZj9Cj4gIshuyHP1nKAU4kQR5ljRQdFNqENP4/z77UZ/bseAF4BBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vg4j30II;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0F1606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:27:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA0F1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vg4j30II
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2efddf749e5so20095605ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795490875; x=1796095675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hhfV7rDvQGkX8svztm1wWEU7DwBbew5Nukh/CQf2+fA=;
        b=vg4j30II83qAo21CgEp+YvJSc3iCY6B0L3MN5figp/Z8qazJdhaWBFFdUXkguA/Bev
         Ik6ZXKxLyog7KvafE4ASlOlqQkYn8tSoaWsPkXtUKyWSv6EWR5QEvMzGs5cGp75q9c2l
         MZHuaHaRRX66wjT+++hqhvwc2zoaDRAXY/U9F1SsrFKcTJg8xpbXJm5GnqKd77bYTRhW
         G5uO7X5FT94I8EAGIggAi/fUMsAz0Q1j9xdhyd/Lfuol51vKjnjptGN345vvsBtBVjZ6
         6pAQYvicZqoT8aSZ5tfC2oHkBRwKsUEPdTjDvmAcJ/V8pdSHaLietMzs4+ggAJK2Fktq
         p+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795490875; x=1796095675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hhfV7rDvQGkX8svztm1wWEU7DwBbew5Nukh/CQf2+fA=;
        b=0QQAEVBx0aV0tvUK4kHigVkA+Yk5CbSPUFdkcTUUsYWVOJPumTU5BXK+IBhT3uzJVb
         SSu8NGyWgxyou5nfrEVS+VkuTCE+Ex+9hdDr4s1b+Knv1l097xA99gnI1J8SPrzuEjzE
         DFtho2PMr5xp2ToOeaTbIJ2MjBsaG7xQyFv9b9viMBkLOSIJ6d7oXTfwLXLDp54CJ2mB
         ka3oil69D+Zn95jysvXBgUgvFWRQY/+IClt2X2sEW5MT6VNL59/OuZiMKGNp1T+7/Fv8
         +TqobEeuW9watjc/UTGavfzbChsp30OnpcKhwNiNKYwVqMalozpnJOXVqV29MyLuVJOk
         HCKA==
X-Forwarded-Encrypted: i=1; AL+hErFPaaNRFueyC0CW/z8AzyvvmpRBGqoZyn6UQj+i1SeFuowwMDHnBRPaXTsOPrVwPvHp1o+vB3wWVNmKblI=@vger.kernel.org
X-Gm-Message-State: APuU4Z98164HqyoeKt0OwtJ43mnLQd8FiCmGQZMDsXYy3fi1poQ3W72G
	d5RxkdNckYpvKGuTFMiSt9Oj4XHdj9s2p5cJ49gl3JxNaa6p4njDosDK
X-Gm-Gg: AZFdTZe8EUjDJcHi7BpzWF08XyW4rny6N+f8QBYW9wUL+876m+l5dTmaZWqRHvLDpDX
	axzPw0qHAm/SoD9e9lneg/YhfheB5RmulKeMIua08xD5L0WBl90WgyUcIRhzG/w7c9Sy66psbon
	K1jV/MfolkazKQgCX5ieg7Pg/ug69bGNjrelHql4+Mmc+Jk8iRF0CSRVhYSjEG95ZIOfqXgQ7Gm
	OfCf5sbXecQgAwip43fZYhmZ+a8erETEzVIIjLM10gF30xhryAz6uHpIWzAHViPTVAA/l9Z2MIZ
	PqxgFmvPdoIrPpcES46ngGGuAW3m9YiuQkgr5vseIoEfzDG/K/ab1345gIAxElF92NOfMkifY+2
	UAwecMPkGLd6O1nUPKlCh9dlZXPPmtlTziwtd2MTYUYYSvI8wug/DcxPqhmzA07AWuRp4luLz+b
	EI5DS6h90yKgDGSxUZX3NI6vZQAIsCZfNvJfWgbNnYwgLE8aUee/mD0RSi08ktcmne6kG1sTLde
	bajc27LH0L18udRUapv9t/D407Sc+9uHdc6Nq1mstEYnXrjy7xcOJq/Cxky41EpiI6CenyNm+qx
	aqb7yMMBvhLSAHrWUgfEq++3I0S/eiWldQiIJnED3EDJibNJS9DIRtXYaDGsc3g3kVhVea1RnfR
	hux0=
X-Received: by 2002:a17:90b:4490:b0:3b0:a7b5:c044 with SMTP id 98e67ed59e1d1-3b41c7bbef0mr8070993a91.1.1795490874885;
        Mon, 23 Nov 2026 19:27:54 -0800 (PST)
Received: from normalone-940XGK.tailec472e.ts.net ([117.17.158.201])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578dca0sm24008676a91.2.2026.11.23.19.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 19:27:54 -0800 (PST)
From: Younho Choi <gdool88@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Younho Choi <gdool88@gmail.com>
Subject: [PATCH] KVM: x86: Reject SMM on VMs with private memory
Date: Tue, 24 Nov 2026 12:27:48 +0900
Message-ID: <20261124032748.1221979-1-gdool88@gmail.com>
X-Mailer: git-send-email 2.53.0
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

A VM created with private memory (KVM_X86_SW_PROTECTED_VM, SEV-SNP, TDX)
reports a single memslot address space, because kvm_arch_nr_memslot_as_ids()
returns 1 when kvm_arch_has_private_mem() is true.  Nothing, however, prevents
such a VM's vCPU from entering SMM, in which case kvm_arch_vcpu_memslots_id()
still selects address space 1.  The existing comment "SMM is currently
unsupported for guests with private memory" is not enforced anywhere.

Because address space 1 is initialised with generation 1 and is never swapped
for a private-memory VM, while address space 0's generation advances by
kvm_arch_nr_memslot_as_ids() (i.e. 1) per swap, after a single memslot
operation both address spaces have generation 1.  The per-vCPU last_used_slot
cache in kvm_vcpu_gfn_to_memslot() validates only on the generation number, so
a slot cached in address space 0 is reused for an in-SMM (address space 1)
lookup.  After that slot is deleted and freed, the stale per-vCPU cache is
dereferenced: a host-kernel use-after-free of struct kvm_memory_slot reachable
by an unprivileged process that can open /dev/kvm.  The same aliasing also
leaves SMM-root SPTEs that mmu_notifier invalidation never zaps (it walks only
address space 0), and can trigger a BUG() in the TDP MMU.

Enforce the documented assumption: do not support SMM on VMs with private
memory.  Stop advertising KVM_CAP_X86_SMM and emulating MSR_IA32_SMBASE for
such VMs (which also makes kvm_inject_smi() and guest-driven SMIs fail), and
reject enabling SMM via KVM_SET_VCPU_EVENTS.

Fixes: 89ea60c2c7b5 ("KVM: x86: Add support for "protected VMs" that can utilize private memory")
Signed-off-by: Younho Choi <gdool88@gmail.com>
---
 arch/x86/kvm/svm/svm.c | 8 ++++++++
 arch/x86/kvm/vmx/vmx.c | 8 ++++++++
 arch/x86/kvm/x86.c     | 9 +++++++++
 3 files changed, 25 insertions(+)

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index e30ee8062..0b8cd1502 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -4841,6 +4841,14 @@ static bool svm_has_emulated_msr(struct kvm *kvm, u32 index)
 		if (!IS_ENABLED(CONFIG_KVM_SMM))
 			return false;
 
+		/*
+		 * SMM uses a second (SMRAM) address space, which a VM with
+		 * private memory does not have; SMM is unsupported for such
+		 * VMs (see kvm_arch_nr_memslot_as_ids()).
+		 */
+		if (kvm && kvm_arch_has_private_mem(kvm))
+			return false;
+
 #ifdef CONFIG_KVM_AMD_SEV
 		/*
 		 * KVM can't access register state to emulate SMM for SEV-ES
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 82eb891f6..b6d5b33c1 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -7098,6 +7098,14 @@ bool vmx_has_emulated_msr(struct kvm *kvm, u32 index)
 	case MSR_IA32_SMBASE:
 		if (!IS_ENABLED(CONFIG_KVM_SMM))
 			return false;
+		/*
+		 * SMM uses a second (SMRAM) address space.  A VM with private
+		 * memory exposes only one address space (see
+		 * kvm_arch_nr_memslot_as_ids()), so SMM is not supported for
+		 * such VMs; advertising it leads to memslot aliasing.
+		 */
+		if (kvm && kvm_arch_has_private_mem(kvm))
+			return false;
 		/*
 		 * We cannot do SMM unless we can run the guest in big
 		 * real mode.
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 26e7beaff..59565747d 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -3050,6 +3050,15 @@ static int kvm_vcpu_ioctl_x86_set_vcpu_events(struct kvm_vcpu *vcpu,
 			      | KVM_VCPUEVENT_VALID_TRIPLE_FAULT))
 		return -EINVAL;
 
+	/*
+	 * SMM is unsupported for VMs with private memory, which expose a single
+	 * memslot address space; entering SMM would select address space 1 and
+	 * alias it with address space 0 (see kvm_arch_nr_memslot_as_ids()).
+	 */
+	if ((events->flags & KVM_VCPUEVENT_VALID_SMM) && events->smi.smm &&
+	    kvm_arch_has_private_mem(vcpu->kvm))
+		return -EINVAL;
+
 	if (events->flags & KVM_VCPUEVENT_VALID_PAYLOAD) {
 		if (!vcpu->kvm->arch.exception_payload_enabled)
 			return -EINVAL;
-- 
2.43.0
