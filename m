Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795132625;
	b=uIi1i+912fuhMvZJMbeSRYjZiXJbM2XbtQygcqke9HxJOI6uz5BzQBaSK1su5cr5t1GR
	 bjxFLWDqAE6kRDbBChy751rcSwfo6UEKJe4K7++43avWuQmVQgLoijd+8LuOhUFP3fe7e
	 NuDQWgVNkApMvXRd6BBtMLlyuKegtqB2klY5CpOZXwoTGcyP6O2Y2CkSJaWiR5ausc1Ib
	 TtJhetlOSQst4XZ6DG9cS740GOlVL/ueJ/yf1uB8+2tfzcDl4GPKJUOCfDueKME4tTm42
	 TbuBX+tK6hAAtORIXmqGPIOFzxaWC3M+M309di9+8cx7wyiICkTFce9wdXI3EpkKEzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795132625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=T5iWx4frNTdx/ZKAPt9c+wtsTnSclw78VGPr+IaQqqk=;
	b=1IYuyYBctKEmysN3RhoNOKQCU0G5eLwr15Qw7eWZ4NXIIzkOFKEvb5GFEvNrCmNXVpSt
	 DaDD+94hvlLZ6CCZtUOY/AsuMv9En7vuIKuSHLvBEpN7XdpKJDpA9MA1y3XDkqPpVSc8W
	 FIlqbZ7vaF431N+NPX9nxmFZLa5gM0aoepzzaZIXnOkxKl6YWme1TRjL9CxHfC0HAJELC
	 sksXxHailTqD5x1+kxiz3YeAE4T2lfw6wRKmHJC8/cChBji6qcUuHQurfcpQ6Bv5xuqZk
	 Yi3Yf0482XytaCnukihKLx3F/IP0PLXgATLSTu94piB5U4RGxAs5fUZHY48p1mHowrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Bm+5qPF0;
	arc=none smtp.remote-ip=209.85.210.198
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A51760A2606
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:57:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A51760A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Bm+5qPF0
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-89e05d31e54so254339b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795132625; x=1795737425; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=T5iWx4frNTdx/ZKAPt9c+wtsTnSclw78VGPr+IaQqqk=;
        b=Bm+5qPF0AcVmJaTVdChKNWGmytexlPhhWTLPeYaO9tdytpF69vD3HW41p9iYmFxRSW
         /0m82pZPgZR5g40NFqNCw3Akzrc3uC9lLym5hdnEtm1+2/DHb1N5+7zY7Tw6rRBTXeBD
         wbCgZglJcT2CN8kXtvr0zw81n1or84QHqH4XTUNOuYVniRuv0oru3ZSbQMBx8KjQs83I
         HMGconk5xX65jjuhUC0wsilKAHZrE1fKSFhYNRCkqqVmFNORzasJjENFkJ0TjuOTPwte
         oaRzc99fiE/yxXZOMCGj6yi7wFM1EXYciHSj7w8joP1Lweo9lL3TN//nTF6XZW5VzDnf
         +qAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795132625; x=1795737425;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T5iWx4frNTdx/ZKAPt9c+wtsTnSclw78VGPr+IaQqqk=;
        b=eoiLu46HdjLYV/OAKiIooJife/+Lh4gtxSES+26CkvGPsUDtATwX4HdhVM8tTRImqh
         e/1BOxnJz/o0qz+pSRr+dMx9zr5k1ZjGqBnuCXbfehxmDxCK8ghSpPMPa4I3D6JPKldY
         M5RTW4WPPx6JfvExWVrnwIoEX9IbBqlZqQFWyZq52/H6y7EGGc61MKyHjZ0ZpCk12GNk
         +drufDP5emzmbpLmV4Xop9F2sz/b6XJaO/Dih1dsEtf1MwmhttXcn7sGp69OJIUtkEaj
         uNWYU7o73WfTSeZbSxatG5qvOfPtRq3fcMA71FFUAsxujEIlEa29L3wHTopa/FcZMrZw
         GhQg==
X-Forwarded-Encrypted: i=1; AL+hErED+4mIKCeR1nLenVOozYqlGgNX7u6aMejEbNeVbgwRGR82af6FUXccDIWIeLGDcOxLszlS5erFcVoQilY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sc8lDLNE/7C6l1ZJK0LD6uw3rNOO4qYMfwyqLJQf2SvOv/W2c
	HJgIfAycTmNLVEvX2HxE9zRy1p4ERdTVmET8APfQoT7Jb7KACacGKSF5V0oiUM1pcWAn8p5HV24
	tBH/ctw==
X-Received: from pfwp46.prod.google.com ([2002:a05:6a00:26ee:b0:891:240a:3bb3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:a92:b0:3dd:a196:30a1
 with SMTP id adf61e73a8af0-4014e255570mr1073894637.81.1795132624529; Thu, 19
 Nov 2026 15:57:04 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 19 Nov 2026 15:56:52 -0800
In-Reply-To: <20261119235656.70315-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119235656.70315-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119235656.70315-3-seanjc@google.com>
Subject: [PATCH v2 2/6] KVM: Add struct and helpers to handle kicking multiple (v)CPUs
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Satish Kharat <satishkh@cisco.com>, Sashiko Bot <sashiko-bot@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Add a "kvm_cpu_kick" structure along with init()+finish() helpers to dedup
the core logic for kicking multiple vCPUs, and to make it easier to handle
non-waiting kicks via smp_send_reschedule() instead of
smp_call_function_many().

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 77 +++++++++++++++++++++++++--------------------
 1 file changed, 43 insertions(+), 34 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index cf4cb586f140..c2231a130c4c 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -222,15 +222,43 @@ static inline bool kvm_kick_many_cpus(struct cpumask *cpus, bool wait)
 	return true;
 }
 
-static void kvm_make_vcpu_request(struct kvm_vcpu *vcpu, unsigned int req,
-				  struct cpumask *tmp, int current_cpu)
+struct kvm_cpu_kick {
+	int me;
+	unsigned int req;
+	struct cpumask *cpus;
+};
+
+static __always_inline struct kvm_cpu_kick kvm_init_cpu_kick(unsigned int req)
+{
+	struct kvm_cpu_kick kick = { .req = req };
+
+	kick.me = get_cpu();
+
+	kick.cpus = this_cpu_cpumask_var_ptr(cpu_kick_mask);
+	cpumask_clear(kick.cpus);
+
+	return kick;
+}
+
+static bool kvm_finish_cpu_kick(struct kvm_cpu_kick *kick)
+{
+	bool kicked;
+
+	kicked = kvm_kick_many_cpus(kick->cpus, !!(kick->req & KVM_REQUEST_WAIT));
+
+	put_cpu();
+	return kicked;
+}
+
+static void kvm_make_vcpu_request(struct kvm_vcpu *vcpu,
+				  struct kvm_cpu_kick *kick)
 {
 	int cpu;
 
-	if (likely(!(req & KVM_REQUEST_NO_ACTION)))
-		__kvm_make_request(req, vcpu);
+	if (likely(!(kick->req & KVM_REQUEST_NO_ACTION)))
+		__kvm_make_request(kick->req, vcpu);
 
-	if (!(req & KVM_REQUEST_NO_WAKEUP) && kvm_vcpu_wake_up(vcpu))
+	if (!(kick->req & KVM_REQUEST_NO_WAKEUP) && kvm_vcpu_wake_up(vcpu))
 		return;
 
 	/*
@@ -243,59 +271,40 @@ static void kvm_make_vcpu_request(struct kvm_vcpu *vcpu, unsigned int req,
 	 * for vCPUs that were reading SPTEs _before_ any changes were
 	 * finalized. See kvm_vcpu_kick() for more details on handling requests.
 	 */
-	if (kvm_request_needs_ipi(vcpu, req)) {
+	if (kvm_request_needs_ipi(vcpu, kick->req)) {
 		cpu = READ_ONCE(vcpu->cpu);
-		if (cpu != -1 && cpu != current_cpu)
-			__cpumask_set_cpu(cpu, tmp);
+		if (cpu != -1 && cpu != kick->me)
+			__cpumask_set_cpu(cpu, kick->cpus);
 	}
 }
 
 bool kvm_make_vcpus_request_mask(struct kvm *kvm, unsigned int req,
 				 unsigned long *vcpu_bitmap)
 {
+	struct kvm_cpu_kick kick = kvm_init_cpu_kick(req);
 	struct kvm_vcpu *vcpu;
-	struct cpumask *cpus;
-	int i, me;
-	bool called;
-
-	me = get_cpu();
-
-	cpus = this_cpu_cpumask_var_ptr(cpu_kick_mask);
-	cpumask_clear(cpus);
+	int i;
 
 	for_each_set_bit(i, vcpu_bitmap, KVM_MAX_VCPUS) {
 		vcpu = kvm_get_vcpu(kvm, i);
 		if (!vcpu)
 			continue;
-		kvm_make_vcpu_request(vcpu, req, cpus, me);
+		kvm_make_vcpu_request(vcpu, &kick);
 	}
 
-	called = kvm_kick_many_cpus(cpus, !!(req & KVM_REQUEST_WAIT));
-	put_cpu();
-
-	return called;
+	return kvm_finish_cpu_kick(&kick);
 }
 
 bool kvm_make_all_cpus_request(struct kvm *kvm, unsigned int req)
 {
+	struct kvm_cpu_kick kick = kvm_init_cpu_kick(req);
 	struct kvm_vcpu *vcpu;
-	struct cpumask *cpus;
 	unsigned long i;
-	bool called;
-	int me;
-
-	me = get_cpu();
-
-	cpus = this_cpu_cpumask_var_ptr(cpu_kick_mask);
-	cpumask_clear(cpus);
 
 	kvm_for_each_vcpu(i, vcpu, kvm)
-		kvm_make_vcpu_request(vcpu, req, cpus, me);
+		kvm_make_vcpu_request(vcpu, &kick);
 
-	called = kvm_kick_many_cpus(cpus, !!(req & KVM_REQUEST_WAIT));
-	put_cpu();
-
-	return called;
+	return kvm_finish_cpu_kick(&kick);
 }
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_make_all_cpus_request);
 
-- 
2.56.1.708.g77570a6a1d-goog

