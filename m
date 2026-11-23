Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447989;
	b=vFAtrEgau7DOAhUhdQmqff7JtKsRH6H1ucNuIVGmNuqjac1eiifBwe1AVCM+bk8Nt40Q
	 J44oVHELNPvnpydaxD/gVImUVkOOltQWabUXNQ9vW17ob0eYow7qQjcBKIJ8icb+sjz7j
	 RxkTQRy+68NUASHVuB+xgB04RR6ZdHlqpk/xN+jpTphSzlKWFnv+weCTZIO7tIcyQWEXD
	 WRqjOOylM2kHm5+Fy39IbWSc3j5YzjV0gIJWBzjCNY8T2I5El4QCNk6W6Zf79t9lYVx5n
	 sx17qiV9T/K/yB64FagHfoN8ZRipnB3w5l7bKO/B04jhNn/iCj9PU4N8ocpk/c3xlTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RlVCfj055wxtGOJ7XrWntay3DNbbVGK7kyws0BxxA/w=;
	b=IhjTp6ADyTBfejPpMIbq7nNDRWH7a3KbxNw0ZiH0nVP3NHmvcguaVQibbvH8hNuMmJWe
	 Jb5KYicSXoAOBEVcKNN1yNVjJxkaUCEaYFcR49v90u8wvJHOYLwiT59U7ZJJ+QaVKNTwE
	 CLljAEdOhldCGb1S1NhLwXj7YgD4ySFAr+ybVEc5anNL6YmacyHklooMng1BYttMDMOpV
	 JghwF7qg39DLWMkdakSG7dkpHLlHWNetunJboKoJNjXXOqxXj9ysudXi5wJTPukqCLNED
	 TVejXzinAURJzcWBzxxuyO3oktFTbEsF/G/FyCxyPFj/uDQh8DQOG/vZoi4K08X26ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asu.edu;
	spf=pass smtp.mailfrom=asu.edu;
	dkim=pass header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=sArKsinY;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327C7606A333
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:33:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 327C7606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=sArKsinY
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-386bd881d39so521eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1795447988; x=1796052788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RlVCfj055wxtGOJ7XrWntay3DNbbVGK7kyws0BxxA/w=;
        b=sArKsinYuLT9SmCqJEFA9DprCuAhOxBVa7CEEKp/WYrG8LI15qRMnJXaROKFhpPX/p
         2HfTk0PkDWdA7dEnK4qj8CrBm9HcfV2dOZ/3Qff9qTH/pOhKXd3r19OHQasEojzAy9Ze
         rC18n/63UtFL/7lqO3BcGceM7yz8RE/1IeHHhzFC7RuaPVbzmDF1YwUfu1SbYoFjEEC5
         r99fI4sZUwWCSmWKBKE20Pd3pVimPUWfasdImlegsTPNMoS0HtFlD//p0zhXURh9vRej
         HMthQlle88IEoT7fKtjEgzvyCRPBaXpddnOe7KYRzko7CkPXbdLGs3RZEpCjmK6K51cG
         q2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447988; x=1796052788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RlVCfj055wxtGOJ7XrWntay3DNbbVGK7kyws0BxxA/w=;
        b=Z5tvXOfd1juA6OiMdN9x1g4RO1qr4zBDpFGpW8qZYN971XibFONZ6I1E3+PwF/6Y/r
         HkrTaq7kU50iy93n9qBxPtMmC/vjdBYp0Y8aZBBAvM5/ZOrrILTUt/xa0tG1k0yeZBnc
         P93YJ3I0N0w3XfKApzunGgnad27zVsXeb4MQtmgWbgLfutE/ikKBq82A/lGLpvi2qHuJ
         5r/5sbsVCrKcBZiqfIuev8nMEP+KZlJ3IZskuL4lMQcPAs8dLIVUfbpaeA3FgymxwVIU
         HLN8KPL0WlSioZHuC2tdeNWn0vfXDmWJdcyUUNJVwjlSbIQKjfCmicgdNF/3QKaBGApH
         /xuQ==
X-Forwarded-Encrypted: i=1; AL+hErEyuT/oFyTQ5zM1cP2ceMX7c2L9rr2uGOt/vCg0d4Xt4ttN9GIZljbXLiHBxOUFGDi0n3n8OmWaiNRPXpk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+r0UbqMPe5HHdk3s4h/JeuIyhQbZxGmhZZVtKUzk6qT9H5MghY
	VI30OaYTuQvLt1rK0zQsqu899AEOyohy4LqPyj4orN9vjAM9lAxKviRv2WjhAbgpqA==
X-Gm-Gg: AZFdTZeoLZUdGPcB8GSTWN83cpzEM4ltauP7Uwb3EUgGkvoNGvIaSkfxMpfwYvokw6V
	SA8VK0KQXCoY4+aKXlU8GQIMJacpejJTP1oVc6CHCKkxsJH39ShCpslwkdlmYtR3FMCGVzOkOPd
	CxmIgFp4s4ddT6Kh30DFfJczrme839mKDg/YV+bWo4rSFObNFCkHXozWH5PtzCY+nXY2pymjCxV
	egMGoe1YxiycefiBy0tdfwl+EYvWMrkCV+JkJOFSGu9RFa/InNbCnyfsXZ7wqi6AlTFBKB0RL4n
	hFETHHdffZ8RM6gd/IZ63BpYuBRONyHOS8HORzjmq2h+YKzqIZYFucSneoxf3G4XjT3khjgJbMz
	1Xgt00saRiyX8J5LZ1RYycmPBX45QNR4r0ZAwxhjR2JN1sp9Wg8N48S+CcGYtRbh7iGbbmxaQIR
	r8VExbs4Vud9k4BAK6EWNAnOIge+J4h935O8bIWnHmvip7i7H4ehrZU1L+HMv86J+v9HUZW7vZU
	ZEiTo1iOJDYy23PGAIUPzWCnLTi6zMom9imTmpbw9R8AFlnE5LtdFag36agNAT/fYcCFNzIddHf
	LW/eTrg2o0UWA5dTnjbyWtTNoY49WrzdlUyKNGMaKQ==
X-Received: by 2002:a05:7301:e0cd:b0:375:dbeb:b363 with SMTP id 5a478bee46e88-38570f221dcmr12904822eec.28.1795447988314;
        Mon, 23 Nov 2026 07:33:08 -0800 (PST)
Received: from localhost.localdomain ([2600:8800:1e00:25f0:3391:10c3:1717:1522])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm34601237eec.16.2026.11.23.07.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:33:07 -0800 (PST)
From: Siddharth Mishra <smish149@asu.edu>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: Shuah Khan <shuah@kernel.org>,
	Peter Xu <peterx@redhat.com>,
	James Houghton <jthoughton@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siddharth Mishra <smish149@asu.edu>
Subject: [PATCH 0/2] KVM: Fix lost dirty ring entries when a vCPU is preempted
Date: Mon, 23 Nov 2026 08:32:36 -0700
Message-ID: <20261123153238.1036972-1-smish149@asu.edu>
X-Mailer: git-send-email 2.54.0
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

A push to a vCPU's dirty ring can be interrupted by another push to the
same ring when the vCPU task is preempted, which leaves one entry
unwritten and makes userspace stop harvesting the ring.  Patch 1 fixes
kvm_dirty_ring_push(), patch 2 adds a regression test.

Found while fuzzing. An AI tool helped with the analysis and the patches.

The series is independent of James' series that changes the same
function, and applies with or without it:
https://lore.kernel.org/all/20261117212913.3634487-1-jthoughton@google.com/

Tested on Intel with PML, in a nested VM on mainline at
commit 4843f6873f7c ("Merge tag 'sysctl-7.04-fixes-rc4' of
git://git.kernel.org/pub/scm/linux/kernel/git/sysctl/sysctl") and on the
v7.2.8 host:
- Patch 2 fails within seconds without patch 1 (11 of 12 runs), and
  passes with it (0 failures in 15 runs).
- All x86 and common KVM selftests, with PREEMPT, DEBUG_PREEMPT,
  DEBUG_ATOMIC_SLEEP, PROVE_LOCKING, PROVE_RCU, DEBUG_PAGEALLOC,
  SLUB_DEBUG, DEBUG_OBJECTS_RCU_HEAD, KVM_SMM and KVM_XEN: the same
  results with and without the series.  hardware_disable_test fails and
  xen_shinfo_test triggers a lockdep "Invalid wait context" report in
  kvm_xen_set_evtchn_fast() on both.
- The dirty logging tests with kvm_intel.pml=0: the same results with and
  without the series.
- Builds with W=1: KVM_INTEL=m KVM_AMD=m KVM_WERROR=y, SMP=n,
  allnoconfig, gcc allmodconfig and allyesconfig, clang allmodconfig, and
  clang for arm64, riscv and loongarch.
- KVM-unit-tests (a2891d9) for x86 in the same nested VM: the same
  results with and without the series.  vmx_apicv_test times out and
  vmx reports "Guest didn't run to completion" and a too high RDTSC to
  VM-exit delta on both.
- sparse (84ec065) with C=2 on arch/x86/kvm/: no reports in
  virt/kvm/dirty_ring.c.

Not tested: AMD, the Xen runstate path.

Siddharth Mishra (2):
  KVM: Disable preemption while pushing to the dirty ring
  KVM: selftests: Test dirty ring pushes from vCPU preemption

 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../kvm/x86/dirty_ring_steal_time_test.c      | 146 ++++++++++++++++++
 virt/kvm/dirty_ring.c                         |   2 +
 3 files changed, 149 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/x86/dirty_ring_steal_time_test.c


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.54.0

