Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794949779;
	b=ZWfwxPhhDvtywWwR82MMblYB6S0TKCq6DtQ6tFWFCvRbI8Juh5Iur5ZPXIRoPTNLzYev
	 Jpm3IQsb1iZ6e8EWTL0d7c831hNBKNYMQQHV81H5DDcGDAoSImYZzZ1gjBHl93Gqms7y+
	 FZHduRmeAbFn0M04657ZK1FO6+VzomIdRYvi7gQ1EPBRSpF2lp0GB2VKJ65291McS/ZAK
	 4ohazv4ZIXXals25GWSe9dEzgsDPqkJtw2dSD5oDkilfLFHZZtr6qzmOkxjZ+t1qJWMd9
	 QlMrAW5Va6xJraMXFn9vyxVKIPi1NOlM7tYUWgXXRdUZQEFNlVqqRmrdr0+SEuR7ypg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794949779;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=REi1nYk44dpp/obDgTxnN7jObeGe8U7wrK0TC1dL2NE=;
	b=m6pVm4Yub4peI6awk4bjqGocTaLAP8OEqCS94JlJbsACwiy6L40lBAkLaoPfnBNisD+u
	 Sm5/NAmZYLL/T4cTP6p3TwDH+LtiTKjoOxRQ8vmexnzM7Wbu8v8s2U9rY5CNc+xZlRWNO
	 9YkdoowYdRjHL+sUbZh6Q9XDQno/oeNtUvB3QmMx3jXuvex0CDiAb24f46Lq9hQTej/ko
	 4l8eU5V5+8PP4wCGsoyW2bn95YJRVDX5KVHYQQ9mQsARWT+mUnYRuf/XtPy3q/KaInOqk
	 ugb78qGPweZD7DdfagD8ZTfTLquf47PWK2jhrm+BsNVbytAo4B8Rze1yRqpyhvkN+4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=f7JNfVNl;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B438E606A33E
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:09:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B438E606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=f7JNfVNl
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so198065a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794949778; x=1795554578; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=REi1nYk44dpp/obDgTxnN7jObeGe8U7wrK0TC1dL2NE=;
        b=f7JNfVNluVgMps2mZe4AadVArS1kaXTBq+F8VDcY4UOdqEXXbOpI/V/FkBJ4DK5l8P
         S/GfrOX5aC/AG62TduGTh/9K8CuchtTi3LWHj3+2nikXy46xESSf4o0X/4ae9g20vdPh
         hjubb0PEdWOm9PbhsguRmdbaZx+MQgdKLk3FqNPWYbTz1FfP449MGMHlXP8H72b88K8o
         vnopXRlOZktGLNCcYCs1pSxmjFp0uzwX91hZc+lruhCHTBuvgoXTVP6JSUur9yNkho/S
         Xn/h6HFqNp9azaSB8zzfSdCxdw9KpnLmmiLFbVgOonnIVpxj5571IvNoxGc4PclGLuwb
         QuXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794949778; x=1795554578;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=REi1nYk44dpp/obDgTxnN7jObeGe8U7wrK0TC1dL2NE=;
        b=1DpZNcDJg2SAKo8JfH97ffwwX6TzfXYUiGxViNzvXhx0lHrXGK/bENNdJ37/tnHy9T
         FrVPgKr0Qu3Ovmp8+swzqSnurzGj9p4Fbmf4eFfsbOLSRnyCK1eRbWccEiqCTqtMbgj8
         JoZZ3EinKhTtd5DBIxWL53vRxKy2g3MfiwXL6CZqec+VtIqXt8YWTImJaKlRNFC8BcRN
         MrFB7PmSZ2qsKyjxQeGJcVinQI4+f8lvafxPzsVt4XreXKe8ZlG0ijY6OoIlcbB8f36L
         QOAUVaKgRHlL9WeCW+lfnVbIwuFTqe09x8diRxD/TaHirDcGrsm4Ah6BwZU/RONk/ulN
         Kifw==
X-Forwarded-Encrypted: i=1; AL+hErHcztmuEheUQtKi7WyWt4A4qlXQkDQ/7e7HAHmRdd+HIfEy1EWA0K10g+ZL9T0WKsII+ohDW8jCLNfGzEs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8M1nzPAsa/zZoWNpvHtWS+dKXFu5MfO3huSWgXQtuYhNjH/IHc
	tJqFRyoAl8Vfh4Uvhob1jzlcp3jDs3T+jwYs9z1OprDDsxrWFK4Yf6kvp/6IuypCdP9/1Z9EWLy
	WLbCrVg==
X-Received: from pjbdw16.prod.google.com ([2002:a17:90b:950:b0:3b3:ada0:c008])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5111:b0:3b0:9a2e:b494
 with SMTP id 98e67ed59e1d1-3b3d07c2778mr560760a91.54.1794949777995; Tue, 17
 Nov 2026 13:09:37 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 17 Nov 2026 13:09:31 -0800
In-Reply-To: <20261117210934.7765-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117210934.7765-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261117210934.7765-3-seanjc@google.com>
Subject: [PATCH v2 2/5] KVM: nVMX/nSVM: check unconditionally whether CR3 is valid
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>, Sashiko Bot <sashiko-bot@kernel.org>, 
	syzbot@syzkaller.appspotmail.com, Chris Mason <mason@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Paolo Bonzini <pbonzini@redhat.com>

nested_vmcb_check_save() checks CR3 legality only if long mode is active,
but it really needs to be checked in all cases - the check uses must be
zero bits of the host, and indeed nested_svm_load_cr3() later will
reject illegal CR3 in every mode.  Move the check earlier, and thus out
of nested_svm_load_cr3().

Likewise for nested_vmx_load_cr3() and nested_vmx_check_guest_state().

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Tested-by: syzbot@syzkaller.appspotmail.com
Cc: stable@vger.kernel.org
[sean: tag for stable]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/nested.c | 9 +++------
 arch/x86/kvm/vmx/nested.c | 8 ++------
 2 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index 1e3842851dae..a743179b172a 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -443,7 +443,8 @@ static bool nested_vmcb_check_save(struct kvm_vcpu *vcpu,
 		return false;
 
 	if (CC((save->cr0 & X86_CR0_CD) == 0 && (save->cr0 & X86_CR0_NW)) ||
-	    CC(save->cr0 & ~0xffffffffULL))
+	    CC(save->cr0 & ~0xffffffffULL) ||
+	    CC(!kvm_vcpu_is_legal_cr3(vcpu, save->cr3)))
 		return false;
 
 	if (CC(!kvm_dr6_valid(save->dr6)) || CC(!kvm_dr7_valid(save->dr7)))
@@ -456,8 +457,7 @@ static bool nested_vmcb_check_save(struct kvm_vcpu *vcpu,
 	 */
 	if ((save->efer & EFER_LME) && (save->cr0 & X86_CR0_PG)) {
 		if (CC(!(save->cr4 & X86_CR4_PAE)) ||
-		    CC(!(save->cr0 & X86_CR0_PE)) ||
-		    CC(!kvm_vcpu_is_legal_cr3(vcpu, save->cr3)))
+		    CC(!(save->cr0 & X86_CR0_PE)))
 			return false;
 
 		if (CC((save->cs.attrib & SVM_SELECTOR_L_MASK) &&
@@ -717,9 +717,6 @@ static void nested_svm_transition_tlb_flush(struct kvm_vcpu *vcpu)
 static int nested_svm_load_cr3(struct kvm_vcpu *vcpu, unsigned long cr3,
 			       bool nested_npt, bool reload_pdptrs)
 {
-	if (CC(!kvm_vcpu_is_legal_cr3(vcpu, cr3)))
-		return -EINVAL;
-
 	if (reload_pdptrs && is_pae_paging(vcpu)) {
 		if (nested_npt)
 			kvm_register_mark_for_reload(vcpu, VCPU_REG_PDPTR);
diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index f0d75f5a968c..ef4ca1906fb0 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -1235,11 +1235,6 @@ static int nested_vmx_load_cr3(struct kvm_vcpu *vcpu, unsigned long cr3,
 			       bool nested_ept, bool reload_pdptrs,
 			       enum vm_entry_failure_code *entry_failure_code)
 {
-	if (CC(!kvm_vcpu_is_legal_cr3(vcpu, cr3))) {
-		*entry_failure_code = ENTRY_FAIL_DEFAULT;
-		return -EINVAL;
-	}
-
 	/*
 	 * If PAE paging and EPT are both on, CR3 is not used by the CPU and
 	 * must not be dereferenced.
@@ -3323,7 +3318,8 @@ static int nested_vmx_check_guest_state(struct kvm_vcpu *vcpu,
 	*entry_failure_code = ENTRY_FAIL_DEFAULT;
 
 	if (CC(!nested_guest_cr0_valid(vcpu, vmcs12->guest_cr0)) ||
-	    CC(!nested_guest_cr4_valid(vcpu, vmcs12->guest_cr4)))
+	    CC(!nested_guest_cr4_valid(vcpu, vmcs12->guest_cr4)) ||
+	    CC(!kvm_vcpu_is_legal_cr3(vcpu, vmcs12->guest_cr3)))
 		return -EINVAL;
 
 	if (CC(vmcs12->guest_cr4 & X86_CR4_CET && !(vmcs12->guest_cr0 & X86_CR0_WP)))
-- 
2.56.1.703.gf848ed807c-goog

