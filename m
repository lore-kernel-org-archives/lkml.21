Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795456527;
	b=xFMUWIubCCgTTAgXrYbVyLTvo70CHY54yT3IjlHuvC8yl0n2Oy32rlOOXs+LIekOAdZ1
	 S+x2i9e8R51zFE6Kejf6tmiCM5L+nIEuC0/crGl9Vf/VJncPYCkdbeHyAIVz6jTP61aay
	 Z+doAFCGhNgfJk43l06abfafH9ZyL45PI32bFdCCZ0GWe273HzEJ+BxxtMCieb4x/tk+q
	 NNg23hdRBQWWLooigHLfsW0JxCtatUqosQttEh9hANT3TWRkwrpTTl2SB5a3uspOjHxM7
	 t2eabGREygfxixCiAnjqOGO7r9qu/KFSo3P7OTMo/snOP4ljOYMUlR6OyBG+4RZ2RXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795456527;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=pv8NxRRFoV2NHVLt/9H8W3sS+jPwZaBtaDG4xFEI9x4=;
	b=pkY78TfQPGFEknWuKGfb92fcK6ue1gYm5zRpmw56AHMPJc+MuCPsRYjRaoVggiKiSLDJ
	 Wl22snFxE4JAW5ovcq6QguEbpjQk2rFejO8+q4y8fk/U5Uqzd7g2PpIWLR9gGCOteRr0S
	 utBGZP/L4j8lk6F3Fl7JwtGfBu1TvwQDW2sbRBmryL7aGZDVqr0Z1jhIJMHkDa1X6sG3S
	 SKmJ6+0o5ShKDufhQL8CUFPis8lOXh26CPPJoxzVbsQd8rCj6ZthWM/NVuzLg+Lx1Yu94
	 vQ5yagn/ohOjwtNAIFOIZf3nOBJXkoVYgNfdgL0/cFxnix3b3eOEWSj7Jw4x79UAzTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VnK+WI+a;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A4E606A697
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:55:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40A4E606A697
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VnK+WI+a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795456526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pv8NxRRFoV2NHVLt/9H8W3sS+jPwZaBtaDG4xFEI9x4=;
	b=VnK+WI+axLFXef28d3DWDtqPUces3o0oEoxBvf5LZLjDvioPIOskVbGGe0sMITa5V5xMJI
	G8Yv7k2kq3sixre5piZoRbKQGy3bWW9MU5wkbZza5B82P1Qqh8SbZ2HC/rjGi8tDbhhRqF
	83Swkt8Hgzqhj6ZyDOncBvrOE/eo4ic=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-421-q9RBY17rMyuaLZ48rdjoXQ-1; Mon,
 23 Nov 2026 17:55:22 +0000
X-MC-Unique: q9RBY17rMyuaLZ48rdjoXQ-1
X-Mimecast-MFC-AGG-ID: q9RBY17rMyuaLZ48rdjoXQ_1795456521
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 200D91954226;
	Mon, 23 Nov 2026 17:55:21 +0000 (UTC)
Received: from mlevitsk-thinkpadt14gen3.ibmmarkh.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2509F348;
	Mon, 23 Nov 2026 17:55:20 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	x86@kernel.org,
	Sean Christopherson <seanjc@google.com>,
	Maxim Levitsky <mlevitsk@redhat.com>
Subject: [PATCH v3 5/5] KVM: x86: nVMX: fix races in delivery of nested posted interrupts
Date: Mon, 23 Nov 2026 12:55:12 -0500
Message-ID: <20261123175512.80438-6-mlevitsk@redhat.com>
In-Reply-To: <20261123175512.80438-1-mlevitsk@redhat.com>
References: <20261123175512.80438-1-mlevitsk@redhat.com>
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
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

If a nested posted interrupt races with a L0 vm exit on a target vCPU,
that is reflected to L1, then this nestedf posted interrupt is currently
neither processed nor delivered to L1 as a regular interrupt.

Since it is not possible to know if APICv hardware has processed
the interrupt, opt to always process it a moment before nested VM exit.
(call vmx_complete_nested_posted_interrupt)

To ensure that vmx_deliver_nested_posted_interrupt and
vmx_complete_nested_posted_interrupt don't race do the following:

Have a cmpxchg based loop in vmx_deliver_nested_posted_interrupt that
atomically checks that target vCPU is in nested mode and has suitable
posted interrupt configuration, and then set KVM_NESTED_PI_PENDING.

If the above cmpxchg loop succeeds, this means that even if the target vCPU
is in process of exiting the nested guest, it will notice this
KVM_NESTED_PI_PENDING flag when it reaches its
vmx_complete_nested_posted_interrupt, and then it will process it.

If it fails, it means that the target vCPU is no longer in the guest
mode, and thus it is safe to deliver the interrupt as a normal interrupt.

Apply a similar logic on the receiving side:
Use xchg to snapshot the old value of guest state in leave_guest_mode,
and by using this snapshot, determine if we need to process
the posted interrupts.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/x86/kvm/regs.h       |  5 ++--
 arch/x86/kvm/vmx/nested.c | 30 ++++++++++++++------
 arch/x86/kvm/vmx/vmx.c    | 60 +++++++++++++++++++--------------------
 3 files changed, 54 insertions(+), 41 deletions(-)

diff --git a/arch/x86/kvm/regs.h b/arch/x86/kvm/regs.h
index 58950f7d4713..f8b66d85705b 100644
--- a/arch/x86/kvm/regs.h
+++ b/arch/x86/kvm/regs.h
@@ -461,9 +461,9 @@ static inline void enter_guest_mode(struct kvm_vcpu *vcpu)
 	vcpu->stat.guest_mode = 1;
 }
 
-static inline void leave_guest_mode(struct kvm_vcpu *vcpu)
+static inline int leave_guest_mode(struct kvm_vcpu *vcpu)
 {
-	atomic_set(&vcpu->arch.nested_guest_state, 0);
+	int old_value = atomic_xchg(&vcpu->arch.nested_guest_state, 0);
 
 	if (vcpu->arch.load_eoi_exitmap_pending) {
 		vcpu->arch.load_eoi_exitmap_pending = false;
@@ -471,6 +471,7 @@ static inline void leave_guest_mode(struct kvm_vcpu *vcpu)
 	}
 
 	vcpu->stat.guest_mode = 0;
+	return old_value;
 }
 
 static inline bool is_guest_mode(struct kvm_vcpu *vcpu)
diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 8d242d46a245..9c2a411bb2bc 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -4025,23 +4025,16 @@ static void vmcs12_save_pending_event(struct kvm_vcpu *vcpu,
 	}
 }
 
-static int vmx_complete_nested_posted_interrupt(struct kvm_vcpu *vcpu)
+static int __vmx_complete_nested_posted_interrupt(struct kvm_vcpu *vcpu)
 {
 	struct vcpu_vmx *vmx = to_vmx(vcpu);
 	int max_irr;
 	void *vapic_page;
 	u16 status;
 
-	int nested_state = atomic_read(&vcpu->arch.nested_guest_state);
-
-	if (!(nested_state & KVM_NESTED_PI_PENDING))
-		return 0;
-
 	if (!vmx->nested.pi_desc)
 		goto mmio_needed;
 
-	atomic_andnot(KVM_NESTED_PI_PENDING, &vcpu->arch.nested_guest_state);
-
 	/*
 	 * Don't test the value of PID.ON.
 	 * It is valid to trigger a posted interrupt without setting this bit
@@ -4078,6 +4071,18 @@ static int vmx_complete_nested_posted_interrupt(struct kvm_vcpu *vcpu)
 	return -ENXIO;
 }
 
+static int vmx_complete_nested_posted_interrupt(struct kvm_vcpu *vcpu)
+{
+	int nested_state = atomic_read(&vcpu->arch.nested_guest_state);
+
+	if (!(nested_state & KVM_NESTED_PI_PENDING))
+		return 0;
+
+	atomic_andnot(KVM_NESTED_PI_PENDING, &vcpu->arch.nested_guest_state);
+
+	return __vmx_complete_nested_posted_interrupt(vcpu);
+}
+
 static void nested_vmx_inject_exception_vmexit(struct kvm_vcpu *vcpu)
 {
 	struct kvm_queued_exception *ex = &vcpu->arch.exception_vmexit;
@@ -5090,6 +5095,7 @@ void __nested_vmx_vmexit(struct kvm_vcpu *vcpu, u32 vm_exit_reason,
 {
 	struct vcpu_vmx *vmx = to_vmx(vcpu);
 	struct vmcs12 *vmcs12 = get_vmcs12(vcpu);
+	int old_nested_state;
 
 	/* Pending MTF traps are discarded on VM-Exit. */
 	vmx->nested.mtf_pending = false;
@@ -5121,7 +5127,13 @@ void __nested_vmx_vmexit(struct kvm_vcpu *vcpu, u32 vm_exit_reason,
 	if (enable_ept && is_pae_paging(vcpu))
 		vmx_ept_load_pdptrs(vcpu);
 
-	leave_guest_mode(vcpu);
+	old_nested_state = leave_guest_mode(vcpu);
+
+	/* pairs with implicit memory barrier in vmx_deliver_nested_posted_interrupt */
+	smp_mb__after_atomic();
+
+	if (old_nested_state & KVM_NESTED_PI_PENDING)
+		__vmx_complete_nested_posted_interrupt(vcpu);
 
 	if (nested_cpu_has_preemption_timer(vmcs12))
 		hrtimer_cancel(&to_vmx(vcpu)->nested.preemption_timer);
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index e6dd37a3ac44..4a5adb1507ce 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -4370,41 +4370,41 @@ void vmx_recalc_intercepts(struct kvm_vcpu *vcpu)
 static int vmx_deliver_nested_posted_interrupt(struct kvm_vcpu *vcpu,
 						int vector)
 {
-	int nested_state = atomic_read(&vcpu->arch.nested_guest_state);
+	int old = atomic_read(&vcpu->arch.nested_guest_state);
+
+	while (true) {
+		if ((old & (KVM_NESTED_PI_ACTIVE | KVM_NESTED_PI_VECTOR_MASK)) !=
+		    (KVM_NESTED_PI_ACTIVE | vector))
+			return -1;
+
+		WARN_ON_ONCE(!(old & KVM_NESTED_IN_GUEST));
+
+		if (atomic_try_cmpxchg(&vcpu->arch.nested_guest_state,
+		    &old, old | KVM_NESTED_PI_PENDING))
+			break;
+	}
 
 	/*
-	 * DO NOT query the vCPU's vmcs12, as vmcs12 is dynamically allocated
-	 * and freed, and must not be accessed outside of vcpu->mutex.  The
-	 * vCPU's cached PI NV is valid if and only if posted interrupts
-	 * enabled in its vmcs12, i.e. checking the vector also checks that
-	 * L1 has enabled posted interrupts for L2.
+	 * If a posted intr is not recognized by hardware,
+	 * we will accomplish it in the next vmentry.
 	 */
-	if (is_guest_mode(vcpu) &&
-	    vector == (nested_state & KVM_NESTED_PI_VECTOR_MASK)) {
-		/*
-		 * If a posted intr is not recognized by hardware,
-		 * we will accomplish it in the next vmentry.
-		 */
-		atomic_or(KVM_NESTED_PI_PENDING, &vcpu->arch.nested_guest_state);
-		kvm_make_request(KVM_REQ_EVENT, vcpu);
+	kvm_make_request(KVM_REQ_EVENT, vcpu);
 
-		/*
-		 * This pairs with the smp_mb_*() after setting vcpu->mode in
-		 * vcpu_enter_guest() to guarantee the vCPU sees the event
-		 * request if triggering a posted interrupt "fails" because
-		 * vcpu->mode != IN_GUEST_MODE.  The extra barrier is needed as
-		 * the smb_wmb() in kvm_make_request() only ensures everything
-		 * done before making the request is visible when the request
-		 * is visible, it doesn't ensure ordering between the store to
-		 * vcpu->requests and the load from vcpu->mode.
-		 */
-		smp_mb__after_atomic();
+	/*
+	 * This pairs with the smp_mb_*() after setting vcpu->mode in
+	 * vcpu_enter_guest() to guarantee the vCPU sees the event
+	 * request if triggering a posted interrupt "fails" because
+	 * vcpu->mode != IN_GUEST_MODE.  The extra barrier is needed as
+	 * the smb_wmb() in kvm_make_request() only ensures everything
+	 * done before making the request is visible when the request
+	 * is visible, it doesn't ensure ordering between the store to
+	 * vcpu->requests and the load from vcpu->mode.
+	 */
+	smp_mb__after_atomic();
 
-		/* the PIR and ON have been set by L1. */
-		kvm_vcpu_trigger_posted_interrupt(vcpu, POSTED_INTR_NESTED_VECTOR);
-		return 0;
-	}
-	return -1;
+	/* the PIR and ON have been set by L1. */
+	kvm_vcpu_trigger_posted_interrupt(vcpu, POSTED_INTR_NESTED_VECTOR);
+	return 0;
 }
 /*
  * Send interrupt to vcpu via posted interrupt way.
-- 
2.56.1

