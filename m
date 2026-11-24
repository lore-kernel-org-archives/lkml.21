Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795524124;
	b=oXpGgK+lvVA5e2EwfxWbcesC+FoTWg8fWLcCj7eVSkVrz08w58yntLqzt13F6zSKLpWf
	 DnYEqWE9BHusA8pgZoEOnJaKPoGDW5i4hOrJKPLsk5XIdiBMXP2urJeMEMsBAinnFp+Kg
	 py60EXFrbZezFMdfOEWKzBjUl/06mZHWygMNOrs+OFexhWFsjDxTghwfydR0PRL1ZTU0r
	 pXOkczEmUSE281Yp2WDNR4byNT4X5krzBqplg9zY+Jm9YW6pkUna9biZQV2vg/EDZ8XL9
	 EIcR4NBJX2oPy/THAmIQ/HK0eLB+icLffXJkIdcogyxbrjO+ZhlvxfztRmgUsQig/Eg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795524124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:Received:From:In-Reply-To:References:
	 X-Google-Nh-Sender:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=RVQuPpanhhMUEr1KRU6DhzJCRG1cv/jAaqO3tk8ZeGo=;
	b=QELML1wX9pstZxbXSnRTi+T1nbQxAYLLFa8PTt0Sd1Xoii17WPPpK2XN3uFrLvnTrB8w
	 xdNkn1FQymkTq40XJsDX1UZIuf8V56lIrEpTgcm+5vrnpiINQppG2IIzuTrA2EHv0o1kt
	 ls16aCgJLXM18pmupyR5I2bZUB0eaWhI8kDAn3zsPQasaz/Tlucdl38U0ZKKr1WWFC/Qt
	 iWo8fZ6ctYK+mLGgUXMhp/S+laR3Uj7gqwBl5X/a3haWkx1JYkX0fsmBXu1NChLKqcRFg
	 UTWn3rfV+1O4dQzHx6C79J+PdpbGEHVDgxCSkXJqwShO5aUyhNTh3zMk8ETb0buj98g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YwVx4P1N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA4D606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:42:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AA4D606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YwVx4P1N
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso9566616eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:42:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795524123; cv=none;
        d=google.com; s=arc-20260327;
        b=U6FhD3vUzro6iuJRsp1W82FN7AeLjpZHdFbETE1Fw+yXg5ly5eTc7eY1B+1+cW0gdQ
         ZPcOTMkfXcvPH6bEYcQSP5gu88AN8P+w73VLu/1I18ocbQjzP5ZOpyeZTPDhxeNCoEPM
         x9kTZKSovL5Hf8rlGYcElCR8Tn02hXeSCVvBuWaau4k6Wkh6kXmOVOSzYcsJIZEqfNhz
         PjigGYX/mxxCMJxvCuAMzhh9MRKpdbTWy59VxVmxqBXf/TP0pOt55rk16CLA1CQw/2w1
         tb3fO52QrwcoSQmTmAw3Efn7q/wgn2W+6X1NI0Einp1Qd85lcsfw8fSnCyYbQlhNBFU0
         v9Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=RVQuPpanhhMUEr1KRU6DhzJCRG1cv/jAaqO3tk8ZeGo=;
        fh=nx/UGTIIpFRN5cIjguxYMGjBme4a6OFYfGaqWz/obt8=;
        b=Z7Z3HrXsvYep2wUFpW+lqB7GUj5LbifyZaAJxAfj8m1soDH3RLEIIzTeJhDSPIOaI8
         rqO5DkB0aiPg/jEPWPnoXQFKDJH8yI9KC5Ia+ppcTwwrJALtkt8zFCU8lXPpS8fkkB+H
         U6I0KT4vkYKCpm+3jH1QFQTF1ZyCFx+gd2OBw+3sDiZHU2+ddtHS0Y81Fm+bPR2sl4QF
         DsVsYBsnpBeyQw7e6y3Gr7+UXyh2/XbRQaOmB0LF2o6BvDss1eYeHHZRypX/lK4fer/F
         d//TuYFiiBNltVaUX9VHG8XHN+uR0/WjwRvJOEzEpwnKvqsyc5rwWFKL3m+0yrY8o/AK
         EiEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795524123; x=1796128923; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RVQuPpanhhMUEr1KRU6DhzJCRG1cv/jAaqO3tk8ZeGo=;
        b=YwVx4P1NEANBGABOxcIN9fFABsYVnfm6/vKdTgmzvKgDnowDO8t9K0OblCghvTxJrY
         b+0RRUgnpdf5coNcBJ1WfWzCdMYZL9fXl6AfzyItMxi6DRu48+lvka33viiSGncukclL
         rI+atiIOZeRCBPX0hjfxOJsxoxGJVzyn6AXZuEKW4Ti+PlXqOFH4k45bPnpqT9XlBse8
         642rVPA6CzDNj5oj5eGq5zaH8OFf2IyPuYwKuxxkJ69WbgGuV5B7YkDqcx07FzM9KQAg
         wHUtUEN31zwtse7eW3UdEkPfb0Qs5HsTRwFaBWIkpTsDOjdLU52p9CbGLEn2bE34eS6z
         h7oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795524123; x=1796128923;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RVQuPpanhhMUEr1KRU6DhzJCRG1cv/jAaqO3tk8ZeGo=;
        b=hVvIjLajzlUcAjcJx3kws140JU5A91BNDE19ybN2Kd2o1K54TRZBFSkf/JXnp5sXtb
         hwsMCC6h4SOh/zumgLk3gx4blhG8As3w+A86N2fkXhrEDj/2/4PXbklb5QyMBRmV5+JF
         Z0a+59sBVUbW9uWYJkkyTYc0WCDHDU/2c/MfgFpViGyDXbMsW9mMupJrfNX3dJZbLGVv
         hAQSjzrruGwE5y9yaAxWe/MXcR9omSCS/S7RklCFk+DNwT56MBjfVnEh4e0UKWx9P3mL
         ox6XKPP+jf61ItTIcMpGUjpCoR6CUrQaCKNTOoNgWbSEadcpE72gB0g7j+4od5MgCFIP
         VSPg==
X-Forwarded-Encrypted: i=1; AL+hErG6IOceLBx0NWcGgsR04Ot6zj3nTWt5htq9J8giKVoijVcuLcRWz3reLyZ7c8tmOXOgai8z7KkJjxcRQCg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CGWyGByeEEEBXaY8r+PKomVrwFl/n+ZgmDlnDHMf3fFqkyi60
	bjABD+r2ghSN9/D8Nqp7JeD62fU8yOanxY+lOxhxiiQ9OtydUh257MUn/nhDl9AUelT/a6N5Kz4
	TKbsrF4hNFqTc/CCVljBYhzEHfRjDcGY=
X-Gm-Gg: AZFdTZfh9EghQPtYb9XhNIfLWREAPSqj5ZPdU4t0qhPJuCKA7v1pOFU7tzDfOWeb1MM
	C+33M0u+vFmI95X3MH42RHn42LN2WAipWCfZBx5gfMNUzP+RTU0H/Yumde49yKPm23qs1tito2i
	87tkyNDpE26cYKr0RgWFxGbRL50AXsO7B8j78MnRsVMqddK3W5Y9W0g1+zAhJadNW2+VDDTxQZN
	dNz3KmSQSXRogW4pY2iH2dB37LmYw8SZ4klnGmto2887Aio/cEz4YaX+M6xNnPvcmN6epzfS5KK
	l8wiQYRcURDhSZtLnHhy6VEPTD7SR49vUD/+gZtBq/7KVDpNuAEhT4k2R5G4Ynl1zpnROUAXORy
	+bdwnruzJxZp8lUFPisdGh3/xNm1qF2wosVePKFl0ZUaJ5h7QQ0v417HVwg==
X-Received: by 2002:a05:7300:5994:b0:386:a915:8b97 with SMTP id
 5a478bee46e88-386a9158dcamr9639120eec.27.1795524122368; Tue, 24 Nov 2026
 04:42:02 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 24 Nov 2026 06:42:01 -0600
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 24 Nov 2026 07:41:51 -0500
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Tue, 24 Nov 2026 04:41:34 -0800
From: gdool88@gmail.com
In-Reply-To: <20261124032748.1221979-1-gdool88@gmail.com>
References: <20261124032748.1221979-1-gdool88@gmail.com>
X-Google-Nh-Sender: AW_J_Uod8zDN29zrxyh13hgNFVYsR6nZ5c3O4RUY7kF0Eoeuat1Tg5YtD45ZewzNepOhhuqWX6ZCekAYYUgeihI-J3gYPnxGquomfJsiS3S0LqtkXtThXk9UeKtn8V0LmQmVjxB07_zmeJ_tcZZXjZrpGvttX03eSeBDw5LVRrZgnxoFk7i3RgLpxXcEBn3L4zH5CuXSd7BiK5ff30-P-aQ5F4XSpyLLhP9lxX8GUDZ8K8SzgI2y5N4Y-SprdOOw5kPRN1V4eBWO
Date: Tue, 24 Nov 2026 06:42:01 -0600
X-Gm-Features: Aa3M54phZ7m2Oifj2a6VInOoeYQhZticlA030IoIrvzhzMBKjPt4_lPf9QUrLEI
Message-ID: <nh-cfa27f45-ff01-4946-b3cd-9fb1bb6dee4e@google.com>
Subject: [PATCH v2] KVM: x86: Reject SMM on VMs with private memory
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Younho Choi <gdool88@gmail.com>
Content-Type: text/plain; charset="UTF-8"

A VM created with private memory (KVM_X86_SW_PROTECTED_VM, SEV-SNP, TDX)
reports one memslot address space, as kvm_arch_nr_memslot_as_ids() returns
1 when kvm_arch_has_private_mem() is true.  SMM still selects address
space 1 via kvm_arch_vcpu_memslots_id(), despite the existing comment
that SMM is unsupported for guests with private memory.

Address space 1 starts at generation 1 and is never swapped for a
private-memory VM.  Address space 0 advances by
kvm_arch_nr_memslot_as_ids() (i.e. 1) per swap, so after a single
memslot operation both address spaces have generation 1.  The per-vCPU
last_used_slot cache in kvm_vcpu_gfn_to_memslot() checks only the
generation number, so an address-space-0 slot can be reused for an
in-SMM address-space-1 lookup.  After the slot is deleted and freed, the
stale cache can cause a host-kernel use-after-free of struct
kvm_memory_slot.  This was reproduced on KVM_X86_SW_PROTECTED_VM by a
process with access to /dev/kvm.  The same aliasing can leave SMM-root
SPTEs that mmu_notifier invalidation does not zap, because it walks only
address space 0.

Enforce the documented assumption that SMM is unsupported for VMs with
private memory.  Make the VMX and SVM has_emulated_msr() hooks report
MSR_IA32_SMBASE unsupported for those VMs; TDX already reports it
unsupported.  This disables VM-scoped KVM_CAP_X86_SMM reporting and
makes kvm_inject_smi() reject KVM_SMI and APIC-delivered SMIs.  Reject
in-SMM state, pending SMIs, and smm_inside_nmi via KVM_SET_VCPU_EVENTS,
matching the !CONFIG_KVM_SMM validation.  Host-initiated SMBASE MSR
access is unchanged.

ChatGPT Codex assisted with analysis, patch drafting, and test design.

Fixes: 89ea60c2c7b5 ("KVM: x86: Add support for "protected VMs" that
can utilize private memory")
Cc: stable@vger.kernel.org
Signed-off-by: Younho Choi <gdool88@gmail.com>
---
Changes in v2:
- Reject pending SMIs and smm_inside_nmi in KVM_SET_VCPU_EVENTS, as
  pointed out by Sashiko.
- Correct the description of VM-scoped SMM capability and SMBASE support.

Testing:
- On a KVM_X86_SW_PROTECTED_VM, v1 accepted pending=1 and entered SMM on
  KVM_RUN.  Deleting its memslot then triggered a KASAN slab UAF.  v2
  rejects the ioctl with -EINVAL and stays outside SMM after KVM_RUN.
- Nine ioctl regression cases pass on v2, including KVM_SMI rejection,
  VM-scoped capability reporting, and normal-VM ioctl behavior.
- A private-VM KVM ioctl lifecycle test passes clean event-state
  save/restore, latched INIT, and host SMBASE MSR roundtrips.  An invalid
  pending-SMI restore returns -EINVAL without changing NMI state, and
  the restored vCPU runs guest code.  Full VMM migration was not tested.
- Separate CONFIG_KVM_AMD_SEV=y and CONFIG_KVM_INTEL_TDX=y builds compile
  the affected SVM, SEV, VMX, TDX, and common x86 objects.
- Source audit confirms tdx_vm_init() sets has_private_mem before vCPU
  creation, so the common ioctl guard also applies to TDX.  SVM/SNP and
  TDX hardware were not available for runtime tests.
- A standalone reproducer is available to maintainers on request.

 arch/x86/kvm/svm/svm.c | 8 ++++++++
 arch/x86/kvm/vmx/vmx.c | 8 ++++++++
 arch/x86/kvm/x86.c     | 11 +++++++++++
 3 files changed, 27 insertions(+)

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index e30ee8062..0b8cd1502 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -4841,6 +4841,14 @@ static bool svm_has_emulated_msr(struct kvm
*kvm, u32 index)
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
index 26e7beaff..4faafc407 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -3050,6 +3050,17 @@ static int
kvm_vcpu_ioctl_x86_set_vcpu_events(struct kvm_vcpu *vcpu,
 			      | KVM_VCPUEVENT_VALID_TRIPLE_FAULT))
 		return -EINVAL;

+	/*
+	 * SMM is unsupported for VMs with private memory, which expose a single
+	 * memslot address space; entering SMM would select address space 1 and
+	 * alias it with address space 0 (see kvm_arch_nr_memslot_as_ids()).
+	 */
+	if ((events->flags & KVM_VCPUEVENT_VALID_SMM) &&
+	    kvm_arch_has_private_mem(vcpu->kvm) &&
+	    (events->smi.smm || events->smi.pending ||
+	     events->smi.smm_inside_nmi))
+		return -EINVAL;
+
 	if (events->flags & KVM_VCPUEVENT_VALID_PAYLOAD) {
 		if (!vcpu->kvm->arch.exception_payload_enabled)
 			return -EINVAL;
-- 
2.43.0
