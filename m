Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794949777;
	b=qbw8Fv7PIcW5LPgxPexPgmn9+IOGcKecjEtYHcT/HKvaurA8lJb+nxu9qPlypIMM2pdD
	 D7iuXn227ZPrTDcRZqE5nAwKcgc8OkW1+Vynaf0HHc/83koeWThx4KDXQlTw+bgJ0+2Cm
	 AlVk9Gj1zbMagikwF0Qhwu6Cco/lx1gKaF31CywDsW1YltfeIGBKrQKjtN59SG56BOk+K
	 jiRZZZT0DHi7Ne9WHBj2UIxUluhqathy9m9F397pfaSqBcQkZja5Z3ygztDwB4sbxYjUT
	 xiQYgVD55DSC7jv19G5bcX3AC1z6LRGlkPLp5TkevoNWeJ0el46mzDiLHKEQcxfgCew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794949777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=pl/LlodUrlcSe5NzIvaRWdb7e6O8SNguoZ2BYDTJJGU=;
	b=haVKYmmcw9sKkRKinieWqO6DM4UUEm/PiG4uk0X5ftXOWwpit0fBI2T/efZ4xaW+bhBU
	 FrUPvIKe8JYjXnG0KODi833ZIMjJkqCBWTvpU7ac27QU+SEydWOjQ+V1ARZwkyEfcXdJn
	 xP4+Ey94MujY754kQbyrxBELeBu/3Md06ddZG7E6Gj9N0KUxxUw78JtvhDTaAjK6YVNKx
	 jJh3vW0DDl0etUqzraMQ09rkBHQwBKKOA2y5xTnCpm7A91o22qFehLdAVhCTGASsQBXbb
	 3ZR4QCN9Ba7wv30oKbKuNnh8TOszTg7s8Rq2eBXz52ce5xMvG4RXbH0piQYKau4OyqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RFccD00F;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A9E606A335
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86A9E606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RFccD00F
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae7faf4ff7so177465a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794949777; x=1795554577; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pl/LlodUrlcSe5NzIvaRWdb7e6O8SNguoZ2BYDTJJGU=;
        b=RFccD00F5BJ2TzXW3jVAv0WC0BX0YwUEAt1HbP7B33Bgk+l2s7pC6LfFhk8OI8BIPo
         jRwqnPa/BNn+0jyX9kFixNdJCp6+w9uiOjOejJMxp4I5NLpIhjlB5HRxooF1yiB6rAdE
         3W/8TF8QYrzB7nLTXTUlhRTfRj4bQDtdUU6UhHmvt2K+nJ2VWc8fLe3V3aUGaEzUpbf6
         WM2VFyP81HuaSsZd+QTTMF2XZoMe2CALpwsiLoFsobJRbrNBZobofcq1pBHF22M23luB
         L8rLbmRzpsYnXdaQWLdjnKJp8XlWbybN3C4rKKaHkNsMdo8xVt0H2gsBNyQPx+jH+51V
         YuUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794949777; x=1795554577;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pl/LlodUrlcSe5NzIvaRWdb7e6O8SNguoZ2BYDTJJGU=;
        b=DoJ1IGcERDUIGKiXpCHK6d5Kjd358Ws1XPgYXb41LuVmPdb8r457r8lV6+H8Koa612
         axO7dbbg/n1fAgis79TqjWkbUrFE5nWVv9vnuo0xAgoRqv/45n4U2gdj3j0+9kiark51
         KGpXG5VWOyFhtlqU8ooOlZzUxrlhP7b4AiUe2/IEpBAY5EhTDCyWch0ASBfecGBE3mpJ
         q6lDpfR0qlMNyl+q8eng2IUsDjRB+UHJcEUsKK+nq7pIEHe+SVTORumYDnJpzWjj+hK6
         ALau3ZLnIdoCZhQvSjc5E51bSag9yrOcKfT5TaCOdBczkrNYH9Uxk5KsKiSzfA4kzJRp
         DQ8Q==
X-Forwarded-Encrypted: i=1; AL+hErGwO6B5UIOhX33r431WYr6f4JtaPqV8wKCncguAjhPLI1HX23/Oc9tmF8vJKZUT7UmcI6RQVFgzhevrpwE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dUY0njzrk+D6SCjOBtn+EVOw5wB9u3v6DILEQll2Q7uxTeWOO
	Zo8a/lMwnD9ty/ziDOMIMaYcYBeBA6qv3M4YQjGzSM1VmieaAlhX3rqCtumna00cx6OY87vIk8I
	Smyvjww==
X-Received: from pgbx27-n1.prod.google.com ([2002:a05:6a02:63db:10b0:cc7:ba91:a719])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d88f:b0:3b3:c179:45b0
 with SMTP id 98e67ed59e1d1-3b3d07c7604mr654468a91.63.1794949776793; Tue, 17
 Nov 2026 13:09:36 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 17 Nov 2026 13:09:30 -0800
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
Message-ID: <20261117210934.7765-2-seanjc@google.com>
Subject: [PATCH v2 1/5] KVM: nSVM: Pre-check current (L2's) CR3 during KVM_SET_NESTED_STATE
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>, Sashiko Bot <sashiko-bot@kernel.org>, 
	syzbot@syzkaller.appspotmail.com, Chris Mason <mason@kernel.org>
Content-Type: text/plain; charset="UTF-8"

When loading nested state, explicitly check that the current CR3 is valid
before loading any state, as a misbehaving userspace can muck with guest
CPUID to make KVM think the current CR3 is invalid, and thus cause the late
"load" of CR3 to fail when initializing the guest's MMU.  If that happens,
KVM will leave half-baked state in the vCPU, e.g. in L2 with L1's page
walker, and if nested NPT is disabled, L1's PGD as well.

Alternatively, KVM could try and unwind vCPU state if the late CR3 "load"
fails, but that is subtly quite difficult as it would require snapshotting
and restoring the previous state.  Simply leaving nested on failure isn't
an option either, because that too would leave the vCPU with half-baked
state (in L1 with L2 state and a very stale MMU).

Pre-checking CR3 will also allow hoisting the CR3 check out of
nested_svm_load_cr3() entirely.

WARN and bug the VM if the late CR3 load fails, as loading nested state
never loads PDPTRs, i.e. failure is impossible, and KVM doesn't unwind on
failure (see above).  I.e. if the impossible happens, KVM needs to block
all operations on the half-baked vCPU.

Fixes: e1779c2714c3 ("KVM: x86: nSVM: fix potential NULL derefernce on nested migration")
Cc: stable@vger.kernel.org
Reported-by: Stefan Teodorescu <fane@google.com>
Reported-by: Sashiko Bot <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-210535@kernel.org
Closes: https://lore.kernel.org/all/sashiko-outbox-205939@kernel.org
Closes: https://lore.kernel.org/all/sashiko-outbox-193903@kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/nested.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index 07554089ec05..1e3842851dae 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -2047,6 +2047,9 @@ static int svm_set_nested_state(struct kvm_vcpu *vcpu,
         if (((cr0 & X86_CR0_CD) == 0) && (cr0 & X86_CR0_NW))
 		goto out_free;
 
+	if (!kvm_vcpu_is_legal_cr3(vcpu, vcpu->arch.cr3))
+		goto out_free;
+
 	/*
 	 * Validate host state saved from before VMRUN (see
 	 * nested_svm_check_permissions). Note that the g_pat field is not
@@ -2114,7 +2117,7 @@ static int svm_set_nested_state(struct kvm_vcpu *vcpu,
 	 */
 	ret = nested_svm_load_cr3(&svm->vcpu, vcpu->arch.cr3,
 				  nested_npt_enabled(svm), false);
-	if (ret)
+	if (KVM_BUG_ON(ret, vcpu->kvm))
 		goto out_free;
 
 	svm->nested.force_msr_bitmap_recalc = true;
-- 
2.56.1.703.gf848ed807c-goog

