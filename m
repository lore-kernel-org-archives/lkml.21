Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795589817;
	b=kNwx9gJmagLy77/QbgnlmIksgV/lSksUgQaZGbWbXcSNLq5i3z9fAgKEccXASmiePf/R
	 fO8zu+QAApUOhDuWJbz1owQcB00K2eNsz5Ra71bUaZ/qt5vVGxnG6eSKODqVX8t+BWlVb
	 K73n024BfJXyme35elWRcp4kjhUdj/WYNg1CvGS2Mz6xl51fPKBcNUUP691L35y3NB7Mg
	 2DZodWhGUU4GcMW17ZHunmMvj3stSnIYaX8L5MnEZNtDOzJbj8XjusMe+fSqccRCwx1J7
	 dEBU6lFKS1MxcKE0IC2+tL7Z2k1MSNf2of/DB/QaLEdqXbzAM/39CKf6mAulHt6QDMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795589817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=zVlsemVCBduIoN4ovaejAaSJjefUyq+bd4EIprH6ZNw=;
	b=eUg/1GR0tDXdvZZY4DYvscPKrnn4fIqdcgE+1ZClID5gTLJRSv6NSg7bDbgqkt7vSy2p
	 k664GAFQ8dzuza3ix2Fq2tg8DVVu3jVAkkjiKYmTm/3SZC+1flYyiau6KJlwNCw0xTo0D
	 IamJbn2FQYmWLM1cAUwiYUHjGDORStDTPNbFVfvlIdzn2AxhgXiEeZfURyRKrRQphQmbx
	 sAEvvTZXJsgAVy/EJoe65aZ/Zz8AIx6oURiXg4LtiJ+UNa236KlEfrrSz+PGRMUGtx/Di
	 +WGWcUyBrFcz/JFd9JMILg8yqro/XhlxHQGBISyPbBbnS7va85sEtyYH0VTZUi3gbUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pereq.eu;
	spf=pass smtp.mailfrom=cryspen.com;
	dkim=pass header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b="L/bC0BNw";
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C219606A6A5
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:56:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C219606A6A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cryspen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=L/bC0BNw
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb61185057so34580815e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795589815; x=1796194615; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zVlsemVCBduIoN4ovaejAaSJjefUyq+bd4EIprH6ZNw=;
        b=L/bC0BNw8p60yKTawZb8akw9qRBEit8DTwgLah0Va5O+VZIG0Ekgnh1B1AeEzKB3CB
         XIwf89n+aIJWkQXQM8JT6Kh2WtaRI5b21ndVT5Hpv4JY0pKYbJNZ0hbEPbm/bPUpnZ5V
         AhzAs2o99Y3CWxEj/SpBr19y8M1g8SOg8AGHuJm/Ylhe5ZNxdk8yEFbjMwOq43QpMxRm
         TyafGotTKvOyomIaCK1cBvpeXknE6KAgdbQtuUQoVPmHF8XapYBBxHo8SCnOpW7IS7j1
         xxWe0T6hyp15XzjPZuSC+H5HeKEQjtVPntYZmcUqnHSjL4aFFVtffiu2ujsg9m46h0ZO
         SjPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795589815; x=1796194615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zVlsemVCBduIoN4ovaejAaSJjefUyq+bd4EIprH6ZNw=;
        b=aS9oZxk5FGAD6Lq7LWhzKF4VhwZEtXBjx+Vj/V8HkOnlNbHoU4ULpR+BSx7DqaLVZ8
         RE6MwavZbuYSQDhfJwogXsff/y8LS8su+VhwXv4LgwLREQx+wgFOyBxO8Z1NQdsT0Izd
         7rNcEc0D+y317m+vz0u4KeejtVpMjrA86IdEwrG/esuZ21hz1AIXBMTAmg+0IGFKDRzu
         LhnEMNegqw6KIbd7/tZ2J0I89IAJIzQBVkomqtwYr1CpfegiD1ArtvUJspFRdJbK5pbL
         3wDF9/Rjf6fuS5CcjB+wiNJB1uJhCH33TBdQlMsrEHqmfgLchvAMv3cpS44KNrxdtUp7
         HJ8w==
X-Forwarded-Encrypted: i=1; AL+hErH/klbNi/slLlbe65u5+8oazlKz+E/9Lkw5MsUO59rpl09hDPDN1jb5Gez5V8l1Nr28eb+MEqNUqQdRA6w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dgx9K1HzoSdNkfPqAVe92ndij5RGVgwJgjSIj0bvAk0YZTutm
	R4xYb412CBCaxyvae5Lsr0AuKltMCV6HcgPFzqfjhwDmnE6CBbhgKi71dFxH1EQ55B0=
X-Gm-Gg: AZFdTZeIT66/dvfLwnnprPI8yFAuwTPwEdP8heUgO8pcmU7Jpt1Euvz4obnaX+MUtQL
	Hp6vR9lUDcBXfLwbcJyX0uUrPG74AnURvz1n4ArdhtmHTt3rO2H6EznLc5SC81mh2c19pJ9SJvJ
	23+wAaIra/yeDnDbVlNeWTR6SqogNi6e6DdysSYjFJGEgDl2+EABOwHcJ4k3QNLK8xmjIqtOUHi
	OyOqjjAolCeOyzjsBql+fLEjEz7fLtrUxxjyKWUeArFKS8GGiiRIVy4YRwpjZuiU/vx+RBNLVab
	xTCGF3mGg+FA2ySe97ZpEAtcS3EHGnkI8WBVIk1Mt0MYy2Zo48oV5YhwwwG/e3lDvz6vvOUudiB
	PqbGZ4C6N2mkee9UuyeWAuUqaivOyNGg7sFmoGaplFO7ERiNrWOV27gr35jJTjUZB4vuJxfLsgX
	8WmDC9rO0cSSzgwpkgpCh3TrVosJ+cqol5h0n+xGcivGSP2baoIheyoDKCx0ghE9ZzqDSsx5ztu
	7JzezKc4xr+B/ZjZTt5bCrKQ7LABVvFwcSSesw3BK6jPVpkwCuF094MJEZuoIw6ii+kgST9x7d3
	rHEr2vpNPnSXnmBzFjuIHapTBEEAro5z9qC2B1SJ
X-Received: by 2002:a05:600c:64c9:b0:4bb:8701:bb14 with SMTP id 5b1f17b1804b1-4bb88804d1cmr371875465e9.5.1795589814958;
        Tue, 24 Nov 2026 22:56:54 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm681730385e9.13.2026.11.24.22.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 22:56:54 -0800 (PST)
From: Dan Carpenter <dan@pereq.eu>
Date: Wed, 25 Nov 2026 09:56:22 +0300
Subject: [PATCH v2 7/8] KVM: arm64: nv: Re-inject a stored SError after the
 exit is handled
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
Message-Id: <20261125-double_exception-v2-7-224689d8a764@pereq.eu>
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
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 stable@vger.kernel.org
X-Mailer: b4 0.16.0

KVM only has room for one pending exception or PC increment per vcpu.
If something is already pending and we try to add another through
kvm_pend_exception() or kvm_incr_pc(), it triggers a WARN().  If we add
an exception on top of an exception, the first one is lost.  If we add a
PC increment on top of an exception, the PC increment is lost and the
trapped instruction runs again.

Normally an exit handler records an exception or a PC increment, and
__kvm_adjust_pc() commits it before the next guest entry.  However, with
nested virtualization kvm_nested_sync_hwstate() can add an exception
before the exit handler runs.  It re-injects a stored SError after the
guest exits but before handle_exit(), which can pend the SError as an
exception.  The exit handler then records its own on top, for example an
HVC forwarded to the guest hypervisor, the FPAC for a failed ERETAA, or
the PC increment for a trapped instruction it has emulated.  This
triggers the WARN().

In this situation where we have two exceptions, the correct order is to
handle the exit first and then the SError.  Change the
kvm_nested_sync_hwstate() function to only store the SError.  Then
kvm_nested_flush_hwstate() uses __kvm_adjust_pc() to commit the exit
handler's exception or PC increment, re-injects the SError, and the
guest is entered.  The early re-injection was there so that a pending
SError wakes the vcpu from WFI, so kvm_arch_vcpu_runnable() now treats
a deliverable stored SError as a wakeup.

Fixes: 77ee70a07357 ("KVM: arm64: nv: Honor SError exception routing / masking")
Fixes: ce66109cec86 ("KVM: arm64: nv: Take "masked" aborts to EL2 when HCRX_EL2.TMEA is set")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan@pereq.eu>
---
v2: No change
---
 arch/arm64/include/asm/kvm_emulate.h |  1 +
 arch/arm64/kvm/arm.c                 |  1 +
 arch/arm64/kvm/inject_fault.c        |  6 ++++++
 arch/arm64/kvm/nested.c              | 16 ++++++----------
 4 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index 2d7c82cfb8a4..ab2ec9078b76 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -48,6 +48,7 @@ void kvm_skip_instr32(struct kvm_vcpu *vcpu);
 void kvm_inject_undefined(struct kvm_vcpu *vcpu);
 void kvm_inject_sync(struct kvm_vcpu *vcpu, u64 esr);
 int kvm_inject_serror_esr(struct kvm_vcpu *vcpu, u64 esr);
+bool kvm_nested_serror_deliverable(struct kvm_vcpu *vcpu);
 int kvm_inject_sea(struct kvm_vcpu *vcpu, bool iabt, u64 addr);
 int kvm_inject_dabt_excl_atomic(struct kvm_vcpu *vcpu, u64 addr);
 void kvm_inject_size_fault(struct kvm_vcpu *vcpu);
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index a148e80d0aef..2a2add60b72d 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -966,6 +966,7 @@ int kvm_arch_vcpu_runnable(struct kvm_vcpu *v)
 {
 	bool irq_lines = *vcpu_hcr(v) & (HCR_EL2_VI | HCR_EL2_VF | HCR_EL2_VSE);
 
+	irq_lines |= kvm_nested_serror_deliverable(v);
 	irq_lines |= (!irqchip_in_kernel(v->kvm) &&
 		      (kvm_timer_should_notify_user(v) ||
 		       kvm_pmu_should_notify_user(v)));
diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
index 0f6a89b65074..1d5dfd4b9e00 100644
--- a/arch/arm64/kvm/inject_fault.c
+++ b/arch/arm64/kvm/inject_fault.c
@@ -357,6 +357,12 @@ static bool kvm_serror_undeliverable_at_el2(struct kvm_vcpu *vcpu)
 	return !(vcpu_el2_tge_is_set(vcpu) || vcpu_el2_amo_is_set(vcpu));
 }
 
+bool kvm_nested_serror_deliverable(struct kvm_vcpu *vcpu)
+{
+	return vcpu_get_flag(vcpu, NESTED_SERROR_PENDING) &&
+	       !(vcpu_is_el2(vcpu) && kvm_serror_undeliverable_at_el2(vcpu));
+}
+
 int kvm_inject_serror_esr(struct kvm_vcpu *vcpu, u64 esr)
 {
 	lockdep_assert_held(&vcpu->mutex);
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 78d5b18dbd2d..f063c01c565a 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -2213,8 +2213,11 @@ void kvm_nested_flush_hwstate(struct kvm_vcpu *vcpu)
 	if (!vcpu_has_nv(vcpu))
 		return;
 
-	if (unlikely(vcpu_test_and_clear_flag(vcpu, NESTED_SERROR_PENDING)))
+	if (unlikely(vcpu_test_and_clear_flag(vcpu, NESTED_SERROR_PENDING))) {
+		/* Commit the exit handler's exception first */
+		__kvm_adjust_pc(vcpu);
 		kvm_inject_serror_esr(vcpu, vcpu_get_vsesr(vcpu));
+	}
 
 	vgic_v3_nested_update_mi(vcpu);
 
@@ -2231,18 +2234,11 @@ void kvm_nested_sync_hwstate(struct kvm_vcpu *vcpu)
 
 	/*
 	 * We previously decided that an SError was deliverable to the guest.
-	 * Reap the pending state from HCR_EL2 and...
+	 * Reap the pending state from HCR_EL2, and re-inject it from
+	 * kvm_nested_flush_hwstate() once the exit has been handled.
 	 */
 	if (unlikely(__test_and_clear_bit(__ffs(HCR_EL2_VSE), hcr)))
 		vcpu_set_flag(vcpu, NESTED_SERROR_PENDING);
-
-	/*
-	 * Re-attempt SError injection in case the deliverability has changed,
-	 * which is necessary to faithfully emulate WFI the case of a pending
-	 * SError being a wakeup condition.
-	 */
-	if (unlikely(vcpu_test_and_clear_flag(vcpu, NESTED_SERROR_PENDING)))
-		kvm_inject_serror_esr(vcpu, vcpu_get_vsesr(vcpu));
 }
 
 /*

-- 
2.53.0

