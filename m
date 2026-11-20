Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795166824;
	b=uWemDnbcL7AZLoSzcJuiEcCuKNK21T+ybv/OfRRL4uNzxreZi/WM4jWq95f3QU0xFBFp
	 Tkvj2cP98pWZPKPoA9LstM+rrVqkAztfd16CGw38LPtEtRRPp3K5XnQXBZ8jc5YFDZovi
	 wcErgXORdUjgCDVNw/vom+NhQaVus5R+NGaSuRj412ul8cac3iLHSamwALHQ1MojPWCff
	 3AxxPbjo7j63iaT3DhDyUDC0V6CgAR1R9Mx95Orqq2fMyjZf1Z+tJ/8fZEGKnkqMYc9E/
	 eNHZ6D5D7hldpIbQ2pSbQ4d28CSKcREDd74T3MkjDhfGI57HFjZYpAbgPNPLT6dOUKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795166824;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=h8djd06ryjIB56cOT1YweoAp4sCU4+zNTVV/16X4KXY=;
	b=pT50s9bggltMnkVpb+rXAumFPZ/s1pzVr3TnvsXP8WiU4853bgnGOGWf/yV7TvAKyA/T
	 4Z4J7duhhjhNCP333UI3+TLytv6axSYBnMNkEUnvYHAFfoRUa4GbhXBwAiJKVDY1pFT9B
	 H3BImjN/kr65gihtg0lNL5bQB0SP/FmPmbhzFtpL66ywvpbvCBLs3leTjBthSQcNO//ap
	 0v8u/k8q00wEUE18c0/02l4QQ8IezTPnuzz9rnxvXiWWhkGvvvo1e4Zs5ru+FkeLtNze/
	 sBY9w3nqU+wdJ9+kr8Y6e5UdYASOIpdfRAr5U+ddhv+F2vuHucCIjc/8jUpoOK/FFrQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D72aomLM;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=U+2bhLBh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D96606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:27:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85D96606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D72aomLM;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=U+2bhLBh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795166822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h8djd06ryjIB56cOT1YweoAp4sCU4+zNTVV/16X4KXY=;
	b=D72aomLMsd/jG8+DIAphil/gMvd4WRoIcAO2NtPofIHi1VZMke57cxMYOPjvAeq3gR0khV
	uBydj5xcSuw8YdTvOoHA3sAY8RTCIHh9M0ciSRs7TaGI6/nWnkD7xbV4+XMqKzx/HhpmF/
	WC3RlqkoLjbgIWSoVS/+ZuB0FMmUlB8=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-NSS63A_4PpmXZqDzGZzUmA-1; Fri, 20 Nov 2026 09:26:59 +0000
X-MC-Unique: NSS63A_4PpmXZqDzGZzUmA-1
X-Mimecast-MFC-AGG-ID: NSS63A_4PpmXZqDzGZzUmA_1795166818
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdb45b4ed6bso694905a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:26:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795166818; cv=none;
        d=google.com; s=arc-20260327;
        b=pKp9eerMGPRk/C53EX+17JnvI4KwKLO0fNdr1IdD/EyhApo6zaAo05CH976ph0iki6
         ZLx7KPDKbPG0BIAwLQKmkhR2y14WQzaGvxaK+ww3cLKdRkygGCcV6K8J2+zzsEeJl9om
         ex/PmmhnV+tRXY9AHad4DS0Hyi87pbBMf6MegrS/lrDJKnGBGMSC03uPrF3I8+5O8Yv2
         ta/ZwIUrZJCK2pklTto+WX6k+lIY2xEdGdnZ8haNTQfkpOHv8m+0SE2I/pvlEUZaLZLc
         VK2qOndNDEcsg7I2/XAdhge8ihIDYT55UzWHER32cHgj+mOn+SurtZ62uAzk2ByeNemx
         vVzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h8djd06ryjIB56cOT1YweoAp4sCU4+zNTVV/16X4KXY=;
        fh=zhsheyzMkjezSUn09ZuwkxKSyqE5EbbJzcQo87MMVQI=;
        b=VfIovUWfr8vGF66A+zoHWxdMMRqtVqGyx7PPm7q84m5P/DS5Z5kjGEOjnMcVuLvN5r
         WyPzKBtmueNQL0nNJpaq7pqIHxPGYDbXArJrgdq0iYfUFNunUojbeIU/8hKv7RXqGzWn
         7cnNh40fzsEoA5SrWzfv7qeU5jObcqtY7z2qMySeZOFQR+OsiU5HYcQYYBqk1P/kHhxW
         kJe9YrqnkMdETrH6rhs1tF11xKW/wlvaIGS94M3c4rMn58bF5adA2wcpZ1TQhZ7ohzzu
         nfg48n+7y3R/DAAi+04aqLVtASo9ENbSLoBueMqgqKwvOguZCg/KuLqjiV97ZljoNAei
         9c3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795166818; x=1795771618; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h8djd06ryjIB56cOT1YweoAp4sCU4+zNTVV/16X4KXY=;
        b=U+2bhLBhzQM6qD5gTxIy9rDa9cQZrHvDPAWdgvfjySfONMUnWdFNWOYQzBahC6ztkR
         DumNTyOeX4/pdri0be+VF3J5ieWQM1YhDN9NmY/NxYkcpBYqDZuJ5WWmcYlzufRuqcqt
         UfqtdP8aVXk5QtWU+RgUd15QqdnqqGn+nhEpQWla0LixlpngvbRyMcZhgPFadVWONX04
         f4Y6D9cJimiUgzU22KF8RJOuzWjwsym55iTeMCY5FlgXhEFPhLbd92kmPvPLqoQOrbaq
         1X2NLW+Mi3UBOC4NixOT9kS7X0Hn6myI6yTGsqPJCZYocq3wHuZzxKVcwd/7yOlXhtjM
         b+6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795166818; x=1795771618;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h8djd06ryjIB56cOT1YweoAp4sCU4+zNTVV/16X4KXY=;
        b=BGeTG2kKu23BV4CWHonaIkJlnJaOzyHS3jaHyT+w/jzkSHMu/F3kjxt57j66SEYjKI
         pQzVpHpSZqgaJm/13YAq6Njuy06SwTOCZrZIf0xCzzzUe6Q9Zc/VffRqUeyPHGE44BjV
         ug9TzA/tYY/oA5GqcE3cTfI4l9OWBzGEWCiWL2eIF1cK54sc56/+bWTwRR9kkFdQWOqg
         dfuBlwf9vIYa7aSTM2XGVoY+HcIixQGlb+DBc/q/eIi1zto5I1apaw8ZvZB9VUC2zkYi
         03rNSfI3UG3jMPHnEOofEis5mryXjnnBOYRo7ItzDLPJ7cbTbJVqatdlCcNREjtUuIg7
         XHXQ==
X-Forwarded-Encrypted: i=1; AL+hErEuNATw6Sps0qyu6KW5+bh1Zf2/3PsY+hA9kodb4bWJpkWObtVuSvQmZCDQVFYxWMkVR+9Q3wjciGtbX04=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zg3mlxBbRz3qoYQyJCdncHmbS1R+aVOjVYxifsZHjyewTTWqC
	urh3vkqDN1Y+s8BgA/SannN0VaDbGtGcaZJPjLPP9BR4wREXl+K8DhndkChqrq89soRT8UcF0og
	4Nw4A3LDP9k27OiL8DgbGNLoQweU6/6DAB1rMWQL4lrFPVVSfiLT0cbEOX/QUg7v7A/mozs/GVq
	1po9Y4/wtNeiXILcazwbWtEuGDiUHgTL7esIMQ5c36Ixm0YsbO
X-Gm-Gg: AYBFou2Ro+mSZq2TvAEnm07lVkMdz6wLFL7quz9jSUsPP2Y9fomanKRGvXYfMSYfNZ4
	OwS7dJWhLbBGIhnUVcX+jbpIEAknjiM3RXL+MYwxrjldB04AxG+oUHQYYnaCR//+gOhbRUXjUtf
	sN5/5XJMk1m7m3WkgFcRNJMTdowPTEttK/QeNM0FnM9duErGf9bPO3uqMaR/qIgXEApD0zxBXIP
	oOb6ljXKGbLcW2O+WwAWgXdxGfEo9WCFvDXdcEHOsYqpob78S1+2vVSzU87
X-Received: by 2002:a05:6a21:32a6:b0:3fb:3a56:e41b with SMTP id adf61e73a8af0-4014db62821mr3386139637.48.1795166818252;
        Fri, 20 Nov 2026 01:26:58 -0800 (PST)
X-Received: by 2002:a05:6a21:32a6:b0:3fb:3a56:e41b with SMTP id
 adf61e73a8af0-4014db62821mr3386114637.48.1795166817791; Fri, 20 Nov 2026
 01:26:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119201813.15320-1-seanjc@google.com>
In-Reply-To: <20261119201813.15320-1-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 20 Nov 2026 10:26:46 +0100
X-Gm-Features: AclHuK8G7DuVvIhaxwHzPN8dYRpQJQwUQlq8SQJhdYRX7vQWCoLICNcclQQ7y0Y
Message-ID: <CABgObfY_iw6-Yp+hJB3pbV4spTMJfLc2M0jMs8_tu9xumM2wHQ@mail.gmail.com>
Subject: Re: [GIT PULL] KVM: Fixes for 7.4-rcN
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 9:18=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> Please pull a somewhat random smattering of fixes.  The biggest (but prob=
ably
> not scariest?) is to rework single-vCPU kicks to ensure waiting requests
> actually wait.  It's big only because PPC is weird and required refactori=
ng
> a bunch of code just to avoid throwing in more hacks.  Including this man=
y
> patches obviously isn't ideal, but failing to wait breaks the flow to for=
ce
> vCPUs to invalidate their SNP VMSA.  Prior to 7.4 the race condition was =
all
> but impossible to hit, but in-place conversion makes it a *lot* easier to=
 hit
> the window, which is why I included the fix here.
>
> Speaking of PPC, the scariest fix for me is the patch to actually impleme=
nt
> kvm_arch_flush_shadow_all().  Some PPC folks reviewed it, so it's probabl=
y
> good?  But I'm still flabbergasted that such a blatant bug has gone unnot=
iced
> for so long, which makes we worried I'm missing something.

Pulled, thanks. I'll give it another round of reviews...

Paolo

> The following changes since commit 7475ea8b58616b33c04afb976cf0fbaad9dd63=
fb:
>
>   Linux 7.4-rc2 (2026-11-08 16:22:20 -0800)
>
> are available in the Git repository at:
>
>   https://github.com/kvm-x86/linux.git tags/kvm-x86-fixes-7.4-rc4
>
> for you to fetch changes up to bcc359264f15095d3d167535cf5de0b7e4800279:
>
>   KVM: nVMX: Clear nested.smm.guest_mode on a failed RSM-to-L2 (2026-11-1=
0 14:42:26 -0800)
>
> ----------------------------------------------------------------
> KVM fixes for 7.4-rcN
>
>  - Mitigate a class of (x86) bugs where KVM can read/write guest (userspa=
ce)
>    memory using the wrong mm, i.e. using the wrong user page tables.
>
>  - Don't force a full nested VMX VM-Exit when destroying a vCPU, as proce=
ssing
>    the MSR load/store lists and writing back the shadow vmcs12 is wildly =
wrong
>    when VM is dying.
>
>  - Implement "flush shadow all" on KVM PPC to ensure KVM's mappings are t=
orn
>    down when the VM and/or owning process is dying.
>
>  - Provide empty installation rules for architectures that aren't support=
ed by
>    KVM selftests to fix build issues in CI environments.
>
>  - Fix KVM selftests' rules for generating arm64's sysreg headers so that=
 the
>    headers are properly (re)generated on incremental builds.
>
>  - Clear only the VMCB save area on an intercepted SHUTDOWN on SVM, partl=
y to
>    avoid unnecessary churn, but mostly to prevent KVM from clobbering the=
 PML
>    index.
>
>  - Update the tracked pCPU on task migration for both vmcb01 and vmcb02 t=
o fix
>    an edge case where KVM can use a stale ASID across pCPUs.
>
>  - Rework the single-vCPU kick logic to fix a bug where KVM would fail to=
 wait
>    for a target vCPU to respond if another in-flight, non-waiting kick ch=
anged
>    the vCPU's mode to EXITING_GUEST_MODE.
>
>  - Clear nVMX's smm.guest_most when freeing nested state, and if a RSM to=
 L2
>    ultimately fails (and queues a TRIPLE_FAULT to L1).
> ----------------------------------------------------------------
> Amirmohammad Eftekhar (1):
>       KVM: nVMX: Clear nested.smm.guest_mode on a failed RSM-to-L2
>
> Fuad Tabba (1):
>       KVM: selftests: Fix arm64 sysreg header dependencies
>
> Josef Bacik (1):
>       KVM: nVMX: Clear nested.smm.guest_mode when freeing nested state
>
> Sasha Levin (1):
>       KVM: selftests: Provide empty installation rules on unsupported ARC=
Hs
>
> Sean Christopherson (10):
>       KVM: Reject user accesses to guest memory if current->mm !=3D kvm->=
mm
>       KVM: nVMX: Don't force a full nested VM-Exit when destroying a vCPU
>       KVM: PPC: Flush/zap all memslots on kvm_arch_flush_shadow_all()
>       KVM: s390: Drop unused and unreachable kvm_arch_vcpu_should_kick()
>       KVM: Add a @force param to __kvm_vcpu_kick() for PPC backwards comp=
atibility
>       KVM: PPC: Explicitly force IPIs when directly kicking vCPUs
>       KVM: MIPS: Rework kvm_arch_vcpu_should_kick() to use standard imple=
mentation
>       KVM: Move kvm_arch_vcpu_should_kick() to common code as kvm_vcpu_sh=
ould_kick()
>       KVM: Plumb the full request into __kvm_vcpu_kick()
>       KVM: Drop kvm_vcpu_should_kick() and use kvm_request_needs_ipi()
>
> Shivansh Dhiman (1):
>       KVM: SVM: Clear VMCB save area instead of entire VMCB on shutdown i=
ntercept
>
> Yosry Ahmed (1):
>       KVM: SVM: Update tracked pCPU on pCPU switch
>
>  arch/arm64/kvm/arm.c                     |  5 ---
>  arch/loongarch/kvm/vcpu.c                |  5 ---
>  arch/mips/kvm/mips.c                     |  5 ---
>  arch/powerpc/include/asm/kvm_host.h      |  1 -
>  arch/powerpc/include/asm/kvm_ppc.h       | 13 +++++++-
>  arch/powerpc/kvm/book3s.c                |  4 +--
>  arch/powerpc/kvm/book3s_pr.c             |  2 +-
>  arch/powerpc/kvm/booke.c                 |  6 ++--
>  arch/powerpc/kvm/e500_emulate.c          |  2 +-
>  arch/powerpc/kvm/powerpc.c               | 18 +++++++----
>  arch/riscv/kvm/vcpu.c                    |  5 ---
>  arch/s390/kvm/s390/s390.c                |  7 -----
>  arch/x86/kvm/svm/svm.c                   | 43 ++++++++++++++++++--------
>  arch/x86/kvm/vmx/nested.c                | 10 +++++-
>  arch/x86/kvm/vmx/sgx.c                   |  2 +-
>  arch/x86/kvm/vmx/vmx.c                   | 15 ++++++---
>  arch/x86/kvm/x86.c                       |  5 ---
>  include/linux/kvm_host.h                 | 32 ++++++++++++++++----
>  tools/testing/selftests/kvm/Makefile     |  4 +--
>  tools/testing/selftests/kvm/Makefile.kvm | 16 +++++++---
>  virt/kvm/kvm_main.c                      | 52 +++++++++++++++++---------=
------
>  21 files changed, 149 insertions(+), 103 deletions(-)
>

