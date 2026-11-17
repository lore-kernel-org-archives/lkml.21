Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794950955;
	b=lHegFr7UJX44j3gkLYH8UfZlkMtwuOVSJBhj5IWmtmA/kmPABcRnCHoW47K0oicN5VwM
	 YsyD8GE6lt5OgQFchyENF1vt3xsBcEK5ANQwZZCHG2MuexWDOkHbU/56nvUjKtTefAxOP
	 P7M4lh28P01fsA6vRUmmErFs91XqgNG/8Id6uwTtXhIF6fCr0DaLssTW+Knb3mhqJPJUS
	 +/heBlOXvARRPxtyOLM7YNIHY78knK5Ol6jHWgQ7i10fcG2/am2kIPpPI59FaQPrXCQaN
	 IoQhss5wPFs8K8N6hpIM30+bL5iDsaq5MPw/CRa7HLRUAl7yci8VnfrhncDnU+ZAMJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794950955;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=LFhpg0qvm91vRWAPbsrCWKOjN9lF3/fXY1K7WMC+vR4=;
	b=0J8w1LJZVj/2T1pEDETIPstBLda5LbvtSfKAEWR350bLLnW6V7WWh0FJxsR8+2wjdMB6
	 hgLDZk+FgqclOde2pFCW/vbUi2G5QoxK5Vya3OPBBJHuusWnbsGKJnkpOhKRG5Z1/E5yG
	 5kPwwogydPfursxUdu1FsJm5WG323w10mYYBuWM4T1TOELdLphBtvioypsCvifHDovt5j
	 oTYM+tH7rWVsuJDuAZYsi5APHa610YR4eaMBCjaezpuZrXsMcGNKx2vT8Ggkg8SAzw51W
	 xINEjH3PDR91O3YNR3v1e6kFNNtypEMKncW3lj8uU8bz3/NXyWxQzHX4Dqx1fsjqjEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pJb3H3Yu;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D414C606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:29:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D414C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pJb3H3Yu
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2edd25534afso1392635ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794950954; x=1795555754; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LFhpg0qvm91vRWAPbsrCWKOjN9lF3/fXY1K7WMC+vR4=;
        b=pJb3H3YuyM/lsnXgiBiMxseOt4u9ax5PN2z0aKuqKAQEJAvEN1MEcj2KbSGRVQ/tGc
         SEVkIeF1JmPv1QXDC5ofkKGh97yeZJfco4OxKDLbvr80Gk3o52ua/F+Lq7AL1ufG1/+8
         CQlMRE0UFT+J35SWj2KH0962HFHBRV/CNBVL9w7Bhppyur1NweLaPZLHBVA4E6pOut+R
         rmXvYtm+zznu0fOjoS4S4yT3Ur5nJ/qJ7SgMWbSLutk7jkaGRpzF9CxNLdzb43UlFWmk
         8KCbazENhSrGImE8gX2Mg7cLLo2eDsq06JRY1DrBZunHdY6isNIhzAuY7Kt70QMErX3h
         suPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794950954; x=1795555754;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LFhpg0qvm91vRWAPbsrCWKOjN9lF3/fXY1K7WMC+vR4=;
        b=lVYTAQarDwPnCHCJEuk6XaMCLHmHQPy9WQI+5+FN/QtxJrDKddhvKDpr/Q/y7Ze8VR
         byo3F8DYTcg3AFRrO57ZEM2MqrL2xNghABzDeNGBHde0c9KEy6Tbr69CvQU/0wi3T45o
         rwJxqNGIE+Nzj7mZ6FTYhKkn76xN79PCUPvTKpf9eT+YksQ9H50q04oqTdven06TmtTf
         UctL0peNarXcIsNnHQgdGSvUOy6VYfnfgjN/Cacx25z4HY3F5e5dNgwUwbUuuDBPNzSQ
         gqfocnfNwB/b0MkoCQPc1I3DzRKAhnz9RE+8PFqAWKW6qjaBVCWNVldx8rJSxlaRHK2r
         LsMQ==
X-Forwarded-Encrypted: i=1; AL+hErF0BpLqb4n4Z7db/eumZ0gxUTpIo586bzpmA7+lqyK/WURPk261eg+D6hpu5CvUvG0bRWpnbmgWZZm5Yks=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mE/HP3N9/zAPeOZSP9uVIgbYmwj/GnrZMreLpkEGLsrMyZg9U
	oKkROrBLi3pLZ1gxiFGXrNt3fN9gu4gw9ovJYcldOz/Qnsx84Fz2LBYLN1lWYS5mVmKEmBDmzY1
	p5g4ul9pE6RmoS+jeNIytpA==
X-Received: from plgk9.prod.google.com ([2002:a17:902:ce09:b0:2ef:de59:1afb])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:d586:b0:2ef:ed25:5150 with SMTP id d9443c01a7336-2eff7402b30mr5584535ad.26.1794950954093;
 Tue, 17 Nov 2026 13:29:14 -0800 (PST)
Date: Tue, 17 Nov 2026 21:29:09 +0000
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
Message-ID: <20261117212913.3634487-1-jthoughton@google.com>
Subject: [PATCH 0/4] KVM: Don't let dirty ring resets pass dirty_index
From: James Houghton <jthoughton@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Xu <peterx@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+55eaa971f4924b62c9a5@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

Fix a userspace-triggerable WARN in kvm_dirty_ring_push() reported by
syzbot [1], and tidy up the memory ordering and annotations around the
dirty ring indices while in the area.

Patch 1 is the fix. The dirty ring is mapped writable into userspace, so
userspace can set KVM_DIRTY_GFN_F_RESET on entries that KVM never pushed.
KVM_RESET_DIRTY_RINGS then advances reset_index past dirty_index, the u32
math in kvm_dirty_ring_used() underflows, and the next push hits
WARN_ON_ONCE(kvm_dirty_ring_full(ring)). Stop resetting entries once
reset_index catches up to dirty_index, and bump dirty_index before
publishing the DIRTY flag, so that a VMM that reaps the ring while the
vCPU is running never has a legitimately harvested entry skipped.

Patch 2 converts the DIRTY side of the flags handshake with userspace to
smp_store_release(), to match the acquire/release semantics already used
for the RESET side. No functional change intended.

Patch 3 is optional. It marks the remaining concurrent accesses to the
ring indices: WRITE_ONCE() for reset_index, which the vCPU reads with
READ_ONCE(), and READ_ONCE() for the reads of the other task's index in
the kvm_dirty_ring_push and kvm_dirty_ring_reset tracepoints. I'm not
aware of any KCSAN reports or miscompiles, so this mostly documents the
concurrency and ensures the compiler can't tear the accesses. Feel free
to drop it if that is appropriate.

Patch 4 adds a regression test for patch 1 to dirty_log_test. It fails
without patch 1 (KVM resets two entries it never pushed), and passes with
the series applied, including with a minimally sized ring so that the
vCPU repeatedly exits with KVM_EXIT_DIRTY_RING_FULL while the ring is
being reaped.

[1] https://lore.kernel.org/all/6afbad4d.f3cfa7c9.844a4.0002.GAE@google.com

James Houghton (4):
  KVM: Don't reset dirty ring entries that KVM hasn't pushed
  KVM: Use smp_store_release() to mark dirty ring entries as dirtied
  KVM: Annotate concurrent accesses to dirty ring indices
  KVM: selftests: Verify KVM doesn't reset unused dirty ring entries

 include/trace/events/kvm.h                   |  4 ++--
 tools/testing/selftests/kvm/dirty_log_test.c | 18 +++++++++++++++
 virt/kvm/dirty_ring.c                        | 23 +++++++++++++++-----
 3 files changed, 37 insertions(+), 8 deletions(-)


base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
-- 
2.56.1.708.g77570a6a1d-goog

