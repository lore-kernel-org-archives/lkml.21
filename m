Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794949780;
	b=ZH+ZTwwSgPgssV3NPsl4Y62+5+bUoPZBJOxWt4pAN0Kv7+wzmGWEOmd2TRaEqfxsMsQV
	 5BrcH9sDESeQT7oBx4GD16Y/zASL8RxBrta7cuLBDGJBueoLosh6bEEMpWplPgi2RjB5x
	 JptckeCFU9sQofAFYL2Smx9Mx0Z0qXquqq0npYWrNmQ88yRPgYlD30Cq+yZqvQZwroFAj
	 yC8G4LS8UEM/pDltnWguqgZVIhuLUX/U4w9YdwqUKgrbFypV7hqe34Bg2/bzxluqtLnYn
	 NBfOaMPVL1p0/HdFxLCmv2p2tDlCoaQ0CajrN2eph5lKFUeZyBY+Bf9noVRDzp5INrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794949780;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=TSeocec32IBSh6fCdKd/4qfk40BLitMNmtwIN48RAJc=;
	b=FI5NrfF58BCH/jXLOVpEPmf2dgMo+JYBkyT4AGwTxrLeTF0acnFAmCPq0YOFXDkWI+Wl
	 ms3BqoNLB7MQGyGnOQuEvJEBX5Lb6OG8k7eMX36nBHZyRznsnTpgxy2W99iwWFTHFnehJ
	 MGZHvLP4D7RRaEw+O1JWodIFKidsRbkm9UMzc8sJ3ACXzC7OST5KV4RGtf0EhR5JF6EGI
	 bMfsj6jPOZWGDZRUxpO7AOlcrb3BogPyTZwMJOAM0y5EH0ymAFT8NgZ5NVH9hKeNFG1/x
	 Ck3HMYcvJ+PL9NIIJ8+Wuj4IcgEIU5iVA8a10Hwm4rQ8vntZg9Z10dzH7c1d1yvPlXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ctbi+PIJ;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171FA606A88E
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:09:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 171FA606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ctbi+PIJ
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed1fbae872so2260555ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794949779; x=1795554579; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TSeocec32IBSh6fCdKd/4qfk40BLitMNmtwIN48RAJc=;
        b=ctbi+PIJcRKB3cJKB6GcS/EwyffItQUhR3Y7U4AkBKM/mW+aO493iwZtg/VZs8Esnj
         WhNwiiYKUSm1iddyFOesEyMC/Eyi4Jb/CcN/rPcd3DPE/2JyYS7LMyWHQ0DMT1lbF964
         V4mj9q4hlwjShrcRKagwpfuPCYckLoNYXrj6TLU6K42DAaTDoJhKJKcl3BSZjQGg6IoF
         143EKL7UBfJpKijwjY22s2Rnyy1GrkQP3OxGPkHe7jDax2l5LPhSlQXba79wSO7EN+q4
         85lY5Y0MS4X4q6+YwLtG/PSQChvgXrULOh/SYhY4kpyq4r8w0E1ZVdQFJicSykJ3kUX4
         C/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794949779; x=1795554579;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TSeocec32IBSh6fCdKd/4qfk40BLitMNmtwIN48RAJc=;
        b=KqbL9k6kygaL3ICOVtcEv0AV+fmPqTctV+mT78LSNZKbxrQqUbzkg17ofnyAIJIO3W
         IpNQcXIGU5+SMQ/dVRMBGg79XyAf0Sl8jWKTmhvjnTdu5LDXa1QNEe1A3Gbj+hBuHWcY
         JStadfNOlmXhmm3rIqByBoGEDYIRdvIKfgc6hLekHTMtjWqWc+xYc7xKA/zmy0JuoxJO
         gC5fC/LUpXnh8tEHO+CQGkevG+GL3ujIQxgGqFEoWVHqZk5KAd6zjKfm6NLgccyf9QQ6
         o26tyP5x1cke31ZPtEQoSbnkH5vszZRkPV/JXyieJdJru+gIeQhDncqWGfflzLAgxrXv
         E3vw==
X-Forwarded-Encrypted: i=1; AL+hErH+1lqJJauaujpd7Ppr8r9fzw/QN9pcAGneix6+xa/c31B5o9rOPZm013pAprZBI6YKuXe4V4x3BahXmAE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/g9NQq96RdqF0iPCBUJ0LuIgEVq2vDXaZ9WAZnOY0qomir+hxc
	B6bxyHGOHGQuUJchM8Y7KXL9Q+Yxg+l9USiMchurKvXZKfNl/CAFBmnK11BIWZ2ScBz6wqET5NF
	B4gS8CA==
X-Received: from plbnb14.prod.google.com ([2002:a17:903:15ce:b0:2e9:5442:b91a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:c949:b0:2e9:5507:b532
 with SMTP id d9443c01a7336-2eff7529710mr4540185ad.43.1794949779247; Tue, 17
 Nov 2026 13:09:39 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 17 Nov 2026 13:09:32 -0800
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
Message-ID: <20261117210934.7765-4-seanjc@google.com>
Subject: [PATCH v2 3/5] KVM: nSVM: Mark CR3 as dirty when loading CR3 on
 nested transitions
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>, Sashiko Bot <sashiko-bot@kernel.org>, 
	syzbot@syzkaller.appspotmail.com, Chris Mason <mason@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Mark CR3 as dirty when loading CR3 on nested VMRUN and nested #VMEXIT, even
though svm_load_mmu_pgd() unconditionally updates vmcb.save.CR3, i.e. never
consumes the dirty bit.  This will allow deduplicating nearly-identical
code between nVMX and nSVM with respect to loading CR3.

Note, VMX consumes the dirty flag in kvm_mmu_new_pgd(), i.e. having nVMX
mark CR3 after the fact isn't a viable option.  Marking CR3 dirty in nVMX
code before invoking the to-be-common helper also isn't safe in general, as
it's theoretically possible KVM could observe+consume the dirty flag before
vcpu->arch.cr3 is updated (even though that's extremely unlikely to ever be
the case).

Cc: stable@vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/nested.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index a743179b172a..32f95c9d72be 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -725,6 +725,7 @@ static int nested_svm_load_cr3(struct kvm_vcpu *vcpu, unsigned long cr3,
 	}
 
 	vcpu->arch.cr3 = cr3;
+	kvm_register_mark_dirty(vcpu, VCPU_REG_CR3);
 
 	/* Re-initialize the MMU, e.g. to pick up CR4 MMU role changes. */
 	kvm_init_mmu(vcpu);
-- 
2.56.1.703.gf848ed807c-goog

