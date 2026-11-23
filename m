Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795456527;
	b=0yCyX3/2epc4ggWKwoDe12qaDZqJIQAFv0elS5YhP99Bl0MFxzQMm8bm5NtrvlVE7mIC
	 YJhhnMkOnGdG193m+HZhAd8he6C+LVcBvP9bx21FCFZUhhVFv+lSGLpgoGrkQ1mtbvJn8
	 mk3sbydd7H/cEaay5eHPmgs5/prykehmfXcdynBmu9eJ+hlaSE3MZrvvPJIeZlpDqTpbp
	 YJ0Iog33RUayz0vGd5IUf7C86R443WufWorXOO+QeC0jgahZlR9pHZdf40V1bChPPtiRq
	 Z21PhmIDtNoIU7XKbZoliQXRm4PkAnOvij3pzPlypCyG9bxUfhMPtLsQXSTi7pwq2mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795456527;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=AvbPEA9l7W79/1/VkKdgWAu8lNSuKE2jTD92O8O0l2I=;
	b=Bh2uLRSED1IDUsifYD5wE7qSiZIeTcc6Qq4PAQbgqItfZ4ta7f2iOG5cjlIOLWoj9MhF
	 7xI3az1nwalvtBoChZBnqg9mPMo8lp24T0RdkFMY9ESb3TIUjr5F2Dtv5sgqhbetMiPyt
	 ovAN5RAzrCDJ7Gg7Pp0nDh59/lj6O+uq33eVlU6g9OkkcYsTcQtO0t6gLNMedjo42WY2c
	 xvUMYmOdWtYWr4rkM3oa/lnhrbiw1y/t42N6aZTQSQv/XhizShbkHnXSi3MHQJUAQ84wm
	 TrvkGYj5KuQCYKmRYDoM+oiwq5HcQtG/v2lRtl28DErEWEGH1T0s5rGVq3ydghUkjfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Miqrkedi;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA0A606A695
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:55:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDA0A606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Miqrkedi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795456526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AvbPEA9l7W79/1/VkKdgWAu8lNSuKE2jTD92O8O0l2I=;
	b=Miqrkedi0Af01hFm/uWdU3GZNUHPMf8xLQPo6Zmy6wFQrRiIDTe8gVXrSYoY1bkq5Du/QB
	DwqkyMvG7oWkjsYvI9BW5+NM87OAaSS6yun8C+pSSIQSMCUA8W0py5diMBilyUuNEtSZB6
	+ZzC/QrhiVDHzyivUEBVOYr+Aoaf/gA=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-479-73L7DWHFNbWcvMU0nG-8bQ-1; Mon,
 23 Nov 2026 17:55:20 +0000
X-MC-Unique: 73L7DWHFNbWcvMU0nG-8bQ-1
X-Mimecast-MFC-AGG-ID: 73L7DWHFNbWcvMU0nG-8bQ_1795456518
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6B1D51954ADD;
	Mon, 23 Nov 2026 17:55:18 +0000 (UTC)
Received: from mlevitsk-thinkpadt14gen3.ibmmarkh.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6BB16421;
	Mon, 23 Nov 2026 17:55:17 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	x86@kernel.org,
	Sean Christopherson <seanjc@google.com>,
	Maxim Levitsky <mlevitsk@redhat.com>
Subject: [PATCH v3 3/5] KVM: x86: convert nested_guest_state into an atomic variable
Date: Mon, 23 Nov 2026 12:55:10 -0500
Message-ID: <20261123175512.80438-4-mlevitsk@redhat.com>
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

Convert nested_guest_state into an atomic variable, to prepare
to fix nested APICv delivery races.

No functional change expected.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/x86/include/asm/kvm_host.h | 2 +-
 arch/x86/kvm/regs.h             | 6 +++---
 arch/x86/kvm/x86.c              | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index d891dc678e9b..562042d5589b 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -759,7 +759,7 @@ struct kvm_vcpu_arch {
 
 #define KVM_NESTED_IN_GUEST	BIT(8)
 	/* Non zero when the guest is executing another guest */
-	u16 nested_guest_state;
+	atomic_t nested_guest_state;
 
 #ifdef CONFIG_KVM_SMM
 #define SMM_MASK		BIT(0)
diff --git a/arch/x86/kvm/regs.h b/arch/x86/kvm/regs.h
index 6114a099d177..58950f7d4713 100644
--- a/arch/x86/kvm/regs.h
+++ b/arch/x86/kvm/regs.h
@@ -457,13 +457,13 @@ static inline unsigned long kvm_get_effective_dr7(struct kvm_vcpu *vcpu)
 
 static inline void enter_guest_mode(struct kvm_vcpu *vcpu)
 {
-	vcpu->arch.nested_guest_state = KVM_NESTED_IN_GUEST;
+	atomic_set(&vcpu->arch.nested_guest_state, KVM_NESTED_IN_GUEST);
 	vcpu->stat.guest_mode = 1;
 }
 
 static inline void leave_guest_mode(struct kvm_vcpu *vcpu)
 {
-	vcpu->arch.nested_guest_state = 0;
+	atomic_set(&vcpu->arch.nested_guest_state, 0);
 
 	if (vcpu->arch.load_eoi_exitmap_pending) {
 		vcpu->arch.load_eoi_exitmap_pending = false;
@@ -475,7 +475,7 @@ static inline void leave_guest_mode(struct kvm_vcpu *vcpu)
 
 static inline bool is_guest_mode(struct kvm_vcpu *vcpu)
 {
-	return vcpu->arch.nested_guest_state != 0;
+	return atomic_read(&vcpu->arch.nested_guest_state) != 0;
 }
 
 static inline unsigned long kvm_get_segment_base(struct kvm_vcpu *vcpu, int seg)
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 821411291f48..a28d263e936a 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9555,7 +9555,7 @@ void kvm_vcpu_reset(struct kvm_vcpu *vcpu, bool init_event)
 
 	WARN_ON_ONCE(is_guest_mode(vcpu) || is_smm(vcpu));
 	vcpu->arch.smm_mode = 0;
-	vcpu->arch.nested_guest_state = 0;
+	atomic_set(&vcpu->arch.nested_guest_state, 0);
 
 	vcpu->arch.smi_pending = 0;
 	vcpu->arch.smi_count = 0;
-- 
2.56.1

