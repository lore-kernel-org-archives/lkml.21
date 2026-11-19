Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795119497;
	b=31DcCKnJ8WhZy4YDjLvPuaxnNr2Fr6LDMSq0NuUKFw6pTC5XLuBAUYFuKMttXie01ypA
	 FgpEWjX3l4y4+sRmktUpdJnCroLCkhTQqKuXRCXVaBpX47NuUoBpomaq2slxG6EarqZ4m
	 LVQT5lAxZxyBkrIDGtvlxFrsLR9kW9Bhj+qZyRF9W4MhSYPP1Fgy1KozJwQmiQJ2S0+Kc
	 yULg9D+q6BHxH3VQf5njE6U/t0wbLHrBAvPUue+MqPJS2H+2+YTiSLpoqVjMd5mzDOCT+
	 j0UGx/BGTxv0q+3chlc9mMqkf+FXN346cCK17tCvEJz8ezUyCz/uA7ATl7MgqQowxfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795119497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 Mime-Version:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=QDkZ8gnoEnEA5BypJr7Kgo/TQ4p3zHrqv5toTHtdCGs=;
	b=iDiC6wQObsofTDCOYxBwr7bQqXjbFldBsRowCHuz4dFzBpv8VBs6wSDLI9tKwlXzGPKi
	 cAHcxVANH2wZPBei2V+7n22Suz2ILgU7ceWqHMaZShwl0I+FP2tEcKQXdkUu+mM8SuUnG
	 h3g1cesPzXVySz+MsNwgYAEiX0lKf29Zu0H16yUv222OMpZHyKzjeqUreTeeZY5a8GtRY
	 n8Z2ZNRXBHbZ6ay77TzqwzVJY8GMZJ9ZrNsZGgmvI8XujOK9ECsIZHUatcc/mneBLRu02
	 LClhPuFhLpDs83SCwHc2Ty317RBb9v6nkA8jLFgWBAYSXG3FLPjJn7wlL5GhwWuSsTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JD77JfEN;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCD2606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:18:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CCD2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JD77JfEN
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-382af5cfc58so353623eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795119496; x=1795724296; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QDkZ8gnoEnEA5BypJr7Kgo/TQ4p3zHrqv5toTHtdCGs=;
        b=JD77JfEN4QrbHCM8WfITSai5Fz+SzJI6ycqvSKxlb6JqrCyMU7wx74X1T8qaR/4cVe
         hs5sZi97UniiraZJ9suUtO9xbPSaCdRGqco9hlk9CmkqlCcx5kvBDi2wB//flU/KSx8w
         GuTOeWylhZai5lQQp1F5dwRHmlFX7dcF8xwNrM4i1Je9HAnjneWmnhpEkhLRQ3vkrxae
         X0bsjqZ8cbHmQZZkRCV9f4Y7IX3llXZzl5csrL6lYjmH2ZgtYOx1pG/cHCZbrbADR1/6
         LlloVlm9CBSk1opEIQIT2+ftm8odx/XGNico/jCyFbWT3gCjrWE0oCWu4gCKE1IL5PqS
         aGwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795119496; x=1795724296;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QDkZ8gnoEnEA5BypJr7Kgo/TQ4p3zHrqv5toTHtdCGs=;
        b=v/M9sVwSJs/8A2lDPsGj994g+6eQiB4O549NGdAcFup9rRLRf2nWwh3ScfI0XOpE5V
         7FXo9dtW3s0W8MvSRyRGeyW2ve6qPuVwJxMRQ+4hiVeqrbrCwpdnkazW2+a8QeYXJr/E
         RO5CGcsacFxpJjA5UBHEJXh7kid7pjlgBsqWuIAMec5/qGb4yHqcQUmFiVsEpJh07ykE
         4+ZQuQpNbIHr6h+OLVmJ37XXGjFtlVEBhDZu/NmoFh3dxHPPg4bYr5F1RxTaiaL4hjKx
         5RpHiUuHWtRvvoEJFYA1T07qkQ5Pab4dXrs2zqCtqcd3p1vZMLZcurBlmrGkPFrv4fYe
         /uOA==
X-Forwarded-Encrypted: i=1; AL+hErEoVXwcuRkODmv280x/fsIDN6gQdcxek1DMfUwdNjbBGF5Fw6NAUcl3C/2itPJV6yafdjAzS4bGbDN6YWM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TQ6hAv3B/+S/a8Wk6xOYMYgKAmq+EpwWrkItZYxKY7/jo5T7l
	U8IC27s/pyQ6NZmc7xMEke2LOGZik6utclnlfIv2ZxKfdgSsqplfo6ej0NLRRCEHuRykS6a33H/
	s7GvAQg==
X-Received: from dyu3.prod.google.com ([2002:a05:693c:8103:b0:384:4e44:d9f6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:c00f:10b0:384:bc32:fe6b
 with SMTP id 5a478bee46e88-3856e63b194mr504746eec.13.1795119495950; Thu, 19
 Nov 2026 12:18:15 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 19 Nov 2026 12:18:13 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119201813.15320-1-seanjc@google.com>
Subject: [GIT PULL] KVM: Fixes for 7.4-rcN
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"

Please pull a somewhat random smattering of fixes.  The biggest (but probably
not scariest?) is to rework single-vCPU kicks to ensure waiting requests
actually wait.  It's big only because PPC is weird and required refactoring
a bunch of code just to avoid throwing in more hacks.  Including this many
patches obviously isn't ideal, but failing to wait breaks the flow to force
vCPUs to invalidate their SNP VMSA.  Prior to 7.4 the race condition was all
but impossible to hit, but in-place conversion makes it a *lot* easier to hit
the window, which is why I included the fix here.

Speaking of PPC, the scariest fix for me is the patch to actually implement
kvm_arch_flush_shadow_all().  Some PPC folks reviewed it, so it's probably
good?  But I'm still flabbergasted that such a blatant bug has gone unnoticed
for so long, which makes we worried I'm missing something.

The following changes since commit 7475ea8b58616b33c04afb976cf0fbaad9dd63fb:

  Linux 7.4-rc2 (2026-11-08 16:22:20 -0800)

are available in the Git repository at:

  https://github.com/kvm-x86/linux.git tags/kvm-x86-fixes-7.4-rc4

for you to fetch changes up to bcc359264f15095d3d167535cf5de0b7e4800279:

  KVM: nVMX: Clear nested.smm.guest_mode on a failed RSM-to-L2 (2026-11-10 14:42:26 -0800)

----------------------------------------------------------------
KVM fixes for 7.4-rcN

 - Mitigate a class of (x86) bugs where KVM can read/write guest (userspace)
   memory using the wrong mm, i.e. using the wrong user page tables.

 - Don't force a full nested VMX VM-Exit when destroying a vCPU, as processing
   the MSR load/store lists and writing back the shadow vmcs12 is wildly wrong
   when VM is dying.

 - Implement "flush shadow all" on KVM PPC to ensure KVM's mappings are torn
   down when the VM and/or owning process is dying.

 - Provide empty installation rules for architectures that aren't supported by
   KVM selftests to fix build issues in CI environments.

 - Fix KVM selftests' rules for generating arm64's sysreg headers so that the
   headers are properly (re)generated on incremental builds.

 - Clear only the VMCB save area on an intercepted SHUTDOWN on SVM, partly to
   avoid unnecessary churn, but mostly to prevent KVM from clobbering the PML
   index.

 - Update the tracked pCPU on task migration for both vmcb01 and vmcb02 to fix
   an edge case where KVM can use a stale ASID across pCPUs.

 - Rework the single-vCPU kick logic to fix a bug where KVM would fail to wait
   for a target vCPU to respond if another in-flight, non-waiting kick changed
   the vCPU's mode to EXITING_GUEST_MODE.

 - Clear nVMX's smm.guest_most when freeing nested state, and if a RSM to L2
   ultimately fails (and queues a TRIPLE_FAULT to L1).
----------------------------------------------------------------
Amirmohammad Eftekhar (1):
      KVM: nVMX: Clear nested.smm.guest_mode on a failed RSM-to-L2

Fuad Tabba (1):
      KVM: selftests: Fix arm64 sysreg header dependencies

Josef Bacik (1):
      KVM: nVMX: Clear nested.smm.guest_mode when freeing nested state

Sasha Levin (1):
      KVM: selftests: Provide empty installation rules on unsupported ARCHs

Sean Christopherson (10):
      KVM: Reject user accesses to guest memory if current->mm != kvm->mm
      KVM: nVMX: Don't force a full nested VM-Exit when destroying a vCPU
      KVM: PPC: Flush/zap all memslots on kvm_arch_flush_shadow_all()
      KVM: s390: Drop unused and unreachable kvm_arch_vcpu_should_kick()
      KVM: Add a @force param to __kvm_vcpu_kick() for PPC backwards compatibility
      KVM: PPC: Explicitly force IPIs when directly kicking vCPUs
      KVM: MIPS: Rework kvm_arch_vcpu_should_kick() to use standard implementation
      KVM: Move kvm_arch_vcpu_should_kick() to common code as kvm_vcpu_should_kick()
      KVM: Plumb the full request into __kvm_vcpu_kick()
      KVM: Drop kvm_vcpu_should_kick() and use kvm_request_needs_ipi()

Shivansh Dhiman (1):
      KVM: SVM: Clear VMCB save area instead of entire VMCB on shutdown intercept

Yosry Ahmed (1):
      KVM: SVM: Update tracked pCPU on pCPU switch

 arch/arm64/kvm/arm.c                     |  5 ---
 arch/loongarch/kvm/vcpu.c                |  5 ---
 arch/mips/kvm/mips.c                     |  5 ---
 arch/powerpc/include/asm/kvm_host.h      |  1 -
 arch/powerpc/include/asm/kvm_ppc.h       | 13 +++++++-
 arch/powerpc/kvm/book3s.c                |  4 +--
 arch/powerpc/kvm/book3s_pr.c             |  2 +-
 arch/powerpc/kvm/booke.c                 |  6 ++--
 arch/powerpc/kvm/e500_emulate.c          |  2 +-
 arch/powerpc/kvm/powerpc.c               | 18 +++++++----
 arch/riscv/kvm/vcpu.c                    |  5 ---
 arch/s390/kvm/s390/s390.c                |  7 -----
 arch/x86/kvm/svm/svm.c                   | 43 ++++++++++++++++++--------
 arch/x86/kvm/vmx/nested.c                | 10 +++++-
 arch/x86/kvm/vmx/sgx.c                   |  2 +-
 arch/x86/kvm/vmx/vmx.c                   | 15 ++++++---
 arch/x86/kvm/x86.c                       |  5 ---
 include/linux/kvm_host.h                 | 32 ++++++++++++++++----
 tools/testing/selftests/kvm/Makefile     |  4 +--
 tools/testing/selftests/kvm/Makefile.kvm | 16 +++++++---
 virt/kvm/kvm_main.c                      | 52 +++++++++++++++++---------------
 21 files changed, 149 insertions(+), 103 deletions(-)
