Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794949776;
	b=u8r4NXoEWRrUpIDMHEpF9n35XXG1XRtN6/o0kxlQns1pK+T3+/wvwuM5wMXeM9uQ3A2z
	 rWZIpg7BtS7NnSNpinXC28SAcNwXAPJrJAeUpG74p1X6hiAdPpWySBWJSsmxNBDkt1nTh
	 KZpeza6xuRigjCIYyrO05ccpbARyvP63N5u+WtNUdCPWeGkr39PwrQhO3LJTw7smFe4ih
	 1ZxrOTx9YpM2Uj6xfl6dKRuWSWjWUpjh5x9Nw7SzB2MFsfXjCClk4jq7Nokwj4Nm3O40q
	 NeHCAKfwwVLK6uFoHa92+CouSSOJuj6pLYqJji/5zUJoQdmGb3HdDO3t95RAU6Z02/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794949776;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 Mime-Version:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=NfgX3ez0+K7WIb7CbF9QdYQKCoaZza8TfZUj5MCSww4=;
	b=kwjz4Lyc8iZ7tkFdb2Dnl3SipEv7Akxz6mTPV7EWvegIqY70xhqBJuBuDm4Eg1tH3BwW
	 tV5If3dnZjCo2IA7z7UXjZL33fg9t8DGJ56c9sGFEk2eI0cpME2vgSfE3uHFoPQr354Qp
	 FEH8X+ekXIG2e8cAPjU5KJ652Ng83g4cX2fTtSLGL7h+dauW3TpUzIS61CP5eDcdYCuZs
	 H9SA/024dMzvaHW8G40EbFcah7eUZiEMZ2QkZ6OHufWDjh9FV6VH+t56yX9iiZS0PsR82
	 tq/zhUgNFnLJqq05ZVmE84EkKX5bId1yK+M6+DEW4wPMwBa+EpEYUWSvCdaylPTFSOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZvrkAmW8;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D90606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56D90606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZvrkAmW8
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2efda2c6605so1276765ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794949776; x=1795554576; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NfgX3ez0+K7WIb7CbF9QdYQKCoaZza8TfZUj5MCSww4=;
        b=ZvrkAmW8Ge1S6JrShehC1MbPF8qF5KGRppNvJo/7VcgQYrj2ptCM/96T1QwOjF8luu
         Oma0oB1BwvZ2y/s2ityCYt3bUj35Hxj9G38U3+XBPBcFebJ/9hmAUSFiaP1gLk4+R93+
         DKeNIHgdiId+43ui+eFzC/kg6Zz8tHpkoufQsj28VqST8I/wFFYTpihQURdKQgXhJras
         qeflHmKfiQaP1voI12CNVToNWlNKLDxYoDaCmosc59evz1Jvb0wXuhB722XXjMCdSyFC
         EiOI0eIEij/3sj88Ci8ifDjA+j09Yb7vIvdSEPse570Wkz7IHuZBwB8P0WmgIqszrrz9
         AYVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794949776; x=1795554576;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NfgX3ez0+K7WIb7CbF9QdYQKCoaZza8TfZUj5MCSww4=;
        b=pdgSTcJdvgpLo64FdTYU3ftyZGA1whaq5jjsojo0FFQEvftd7Xka3JKbuQLJuwDYbc
         9gi5N0zFgx622ntI8iw3sfhuoUMyiSKoSFdOB8DV8TnO8iYt7sniN4otTtxi7BXOLwaI
         94gEL371cMdSWRvxv6XLhH+f7GeFcFWMzp/eCmp62KHlzcOAng9krRxNt/7tGdaxDyxx
         JDoW02upshMFnbnvXE/suuUWNt4bH5TFZL0flUwwX4r07927y3iRJ2TbbJUJ1/q0N1uY
         jMnQRFOdIGkpbLjhQZHr/uy5/HFsekIqQvrjMPUNYWkr6roJwNduNHKM8jP5xyBikL6s
         I41A==
X-Forwarded-Encrypted: i=1; AL+hErFTqWNrvxaFMZ85wrG/DSpKUnkPTa77rkJo6g9rlnAoorCWhgDcArTaTgu7oDIBEV+yZYA6fKKmD2LVupc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nkYczXT4GQ8G2IddM976KXU3KNMhO2saIU00dfon9YdFwHtb7
	OnfKHfmgyqpZOoem480Byetd87wLW5spwIkmzcXZm1yJN2Mmpv1lulK5bzdrwUR49WNGVh72X6z
	djvgtqg==
X-Received: from pluq7.prod.google.com ([2002:a17:903:4b47:b0:2e8:5201:ef23])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3585:b0:2e8:c331:fc30
 with SMTP id d9443c01a7336-2eff756d586mr4357585ad.69.1794949775564; Tue, 17
 Nov 2026 13:09:35 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 17 Nov 2026 13:09:29 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261117210934.7765-1-seanjc@google.com>
Subject: [PATCH v2 0/5] KVM: x86: Fix nested CR3 load bugs
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>, Sashiko Bot <sashiko-bot@kernel.org>, 
	syzbot@syzkaller.appspotmail.com, Chris Mason <mason@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Fix a variety of bugs related to KVM's handling of CR3 loads during nested
transitions.  I originally tried to fix a svm_set_nested_state() bug by
forcing the vCPU back into L1 if a late CR3 load fails, but Sashiko rightly
hated on that patch because forcing the vCPU from L2=>L1 would still leave
vCPU state in a half-baked state.

I finally realized that Paolo's patch to always check CR3 validity is the way
to go, svm_set_nested_state() just needs to also pre-check the current CR3
(because userspace could theoretically stuff a then-legal CR3 and then swizzle
CPUID to make CR3 illegal).

Patch 5 fixes another related flaw where KVM doesn't initialize the MMU if
loading PDPTRs on nested VM-Exit fails.  Patches 3-4 are cleanups and prep
work to dedup the nSVM vs. nVMX code to avoid copy+paste and confusing code
for the final fix.

v2:
 - Pre-check the current CR3 in svm_set_nested_state(). [Sashiko]
 - Pull in Paolo's fix. [Sashiko]
 - Add patches 3-5.

v1: https://lore.kernel.org/all/20261113170405.473841-1-seanjc@google.com

Paolo Bonzini (1):
  KVM: nVMX/nSVM: check unconditionally whether CR3 is valid

Sean Christopherson (4):
  KVM: nSVM: Pre-check current (L2's) CR3 during KVM_SET_NESTED_STATE
  KVM: nSVM: Mark CR3 as dirty when loading CR3 on nested transitions
  KVM: x86: Consolidate nVMX vs. nSVM logic for loading CR3 on nested
    xfer
  KVM: x86: Initialize MMU+PGD before loading PDPTRs on nested
    transitions

 arch/x86/kvm/mmu/mmu.c    |  2 --
 arch/x86/kvm/regs.c       | 30 ++++++++++++++++++++++++++++++
 arch/x86/kvm/regs.h       |  2 ++
 arch/x86/kvm/svm/nested.c | 36 ++++++++++--------------------------
 arch/x86/kvm/vmx/nested.c | 31 ++++---------------------------
 5 files changed, 46 insertions(+), 55 deletions(-)


base-commit: d21eef2084a9af87ac2a783bc7c2b175ba114e4e
-- 
2.56.1.703.gf848ed807c-goog

