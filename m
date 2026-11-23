Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446041;
	b=gQtqoFizGaa34obzg0mrMYiTQW5XyYsyTZ5wOmLHCdrnmumwFnT8cP8LMEFwViu8gl52
	 GTBb+2Vyn9zXHYfffFUU0fFpA23kMbj0qAj2XAr/ScvSnHgYl6yLMy4dCBFwk6jCFuLwU
	 6/olCSzBvtz7MMD6THDhBU1/VHtrPHMVmV3xtLJ6zH30lmAob3zECQkIs8ZamdJAMtsMh
	 yhSl7BNG5B0aAIqInOCz8O5sn87jjS3sQ1Q0+yF150a/8s3pkLBDyUH1OjW1x7mIdOrZJ
	 6bKbbH+iFVBdvvFt4XvzPtF9Lwj0yKhCmEUggKP1rzSyTpNZcCh4W4AHSj6fklnVoWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=rZGIgt43Cw6Sh7wQQz7ZyN3D/rQTxkgTC4ooK6q+yrU=;
	b=i+KznC3l7A0Fpt2fB+1DGwL+sshzfvvkKECyj4TxCaSOweMU2Qtrx/cYfIk80fqjL+MO
	 L8sN9yETlaoSiErzqOQX/K9kkOwL4KMXY2izf30+t45z6HfybCCUvFz/z4+xRbrnZUM7V
	 +aMqIMkeqGoYVGwdktNrfVROvt0TJwQ0SZxMv0XTEnTWXZZ5iMuCi6i0YGYJdYE0o9U8n
	 8Qnxh4t0s7ee1hlIObxMX/gqnWUq3nnpEGyDKDm0Bst4vlCzBDRzkfUXy8DdFMo+Fw6Qr
	 8jQ+vss9TiaK4quX3mu1aIeVSwh1i92PfPzQqKjfKjnZEVmiophbsCq2QdDNa0ZpcGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hJtYJMDD;
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB6F606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:00:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEB6F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hJtYJMDD
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a1fdde384cso23049795e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795446039; x=1796050839; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rZGIgt43Cw6Sh7wQQz7ZyN3D/rQTxkgTC4ooK6q+yrU=;
        b=hJtYJMDDQzUVxTDFNpg1XvFtgMMoQCGXMcaSgzzl+jdEP2FIuJdmLzhb66evBezWQU
         MWGDFNWJ0kDowmwQ06eMmB7mgo0v+Tw09bm6sMDVAauZnKJH+DJu0DHYqYsiKbo60jHF
         4x4K3ifuuzPxHbZ4lWMverLSSSms3bGY7tDgUv9bzuT1CD54MElvAQeR52vGoeV08WCg
         AJa3oIqdJfQs3xOmdZzlPSvWmkyATCGjW2talMVW14qsgdqopqrC9GKqzwcA+O53wYSp
         S33M1Dfn4B8U032cVupJ9uZPEdeMwCBUajj98mcFNfgN3zdUQiNvGlNnVyEY/il8syg+
         xmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446039; x=1796050839;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rZGIgt43Cw6Sh7wQQz7ZyN3D/rQTxkgTC4ooK6q+yrU=;
        b=COY6/ioiQs0WSZR3Ma8sl6QnqpVmWOHCtXWD7ZTZIaA7iSKxhHPr8A7JumrA5t+tNO
         feMP9/920m4eYrY0yxAcctczkvOcgyZYNokLiEUljo7BuRZRVExVl1Gxi0DVWpjOW2Zw
         ZgShqs2HSsF/Fy3uL2o7dzR0RPCyO2EMV1uyy01qwdIk5jB6ciXE2hyCzc7KrOlZ+RRo
         czIlI2lYK1txgxeqFjqxk95UrWGyhAUyZRw1seOHhgGXQQJQblINsbNs7tYIMTtWdywq
         wVbT45nEBm8CS+m+tmINxwsvnl8KCgcl+lrPbdBdRI3PvvcXbGFSJv1D3y8HSNYqcL4R
         rgjQ==
X-Forwarded-Encrypted: i=1; AL+hErHWhj/Js7Y3MV4bXXaSMeUoX1HHHLmOeekruTBLv3AZL1O3j6dQwNsnYRTWDEpt/GIMC9gue39L2pwSaxc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hulyaZvEA19gBbx/XazROYSXQnXHRn84nb9uxasKwWVZax1Fk
	pfwU7h8COHqAsbB52HdeoFI61vC292IAUTrv4MS5ArhH0TFn0TK7uJA02AxVrQzeAcWlLbsxJQ4
	9zBvkI3LactwU2w==
X-Received: from wrpd5.prod.google.com ([2002:adf:f2c5:0:b0:49e:1f29:9f51])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e87:b0:4a3:59c9:a758 with SMTP id 5b1f17b1804b1-4bb88922c81mr246144405e9.32.1795446038772;
 Mon, 23 Nov 2026 07:00:38 -0800 (PST)
Date: Mon, 23 Nov 2026 15:00:36 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261123145927.577162-1-jpiecuch@google.com>
Subject: [PATCHSET sched_ext/for-7.4-fixes] sched_ext: Fix and tighten RCU
 usage in kfuncs
From: Kuba Piecuch <jpiecuch@google.com>
To: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>
Cc: Kuba Piecuch <jpiecuch@google.com>, Ryan Newton <newton@meta.com>, sched-ext@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Several sched_ext kfuncs dereference RCU-protected state without taking
rcu_read_lock() themselves. They depend on the caller's context instead,
but that context does not always satisfy rcu_read_lock_held().

The verifier treats every non-sleepable program as being inside an RCU
read-side section, and KF_RCU_PROTECTED only checks that. bpf_timer
callbacks are non-sleepable, but bpf_timer_cb() calls them directly
from hrtimer softirq, with no trampoline and so no rcu_read_lock():

  hrtimer softirq
    bpf_timer_cb()
      timer callback (BPF)
        scx_bpf_dsq_peek()
          rcu_dereference(dsq->first_task)   <- rcu_read_lock_held() == 0

With CONFIG_PROVE_RCU=y this triggers:

  WARNING: suspicious RCU usage
  kernel/sched/ext/ext.c:11170 suspicious rcu_dereference_check() usage!
  ...
  Call Trace:
   lockdep_rcu_suspicious+0x11a/0x160
   scx_bpf_dsq_peek+0x7d/0xd0
   bpf_timer_cb+0xf9/0x130

  WARNING: suspicious RCU usage
  kernel/sched/ext/ext.c:11961 suspicious rcu_dereference_check() usage!
  ...
  Call Trace:
   lockdep_rcu_suspicious+0x11a/0x160
   scx_bpf_tid_to_task+0x2ae/0x2e0
   bpf_timer_cb+0xf9/0x130

A sleepable program inside bpf_preempt_disable() hits the same check.
Both contexts are RCU readers, so these are lockdep false positives, not
use-after-frees, but they make PROVE_RCU kernels noisy for any scheduler
that peeks a DSQ or resolves a tid from a timer.

The sub-cap kfuncs (scx_bpf_sub_grant(), scx_bpf_sub_revoke() and
scx_bpf_sub_caps()) are reachable from the same contexts. They avoid
the warning only because they disable IRQs and every RCU check on their
paths (rcu_dereference_all(), bpf_rcu_lock_held(),
rcu_read_lock_any_held()) accepts that. In scx_qmap, for example, the
round-robin bpf_timer callback calls scx_bpf_sub_revoke() and
scx_bpf_sub_grant(), which look up the child sched in scx_sched_hash
with rcu_read_lock_held() == 0.

Patch 1 adds guard(rcu)() to scx_bpf_dsq_peek() and
scx_bpf_tid_to_task(), matching scx_bpf_cpu_curr() and
scx_bpf_cid_curr(). This fixes both warnings.

Patch 2 adds guard(rcu)() to the three sub-cap kfuncs, matching
scx_bpf_sub_dispatch() and scx_bpf_sub_kill_bstr(). This makes their
RCU section explicit, so a future plain rcu_dereference() on those paths
does not reintroduce the warning. No functional change.

The patches were written with the help of an AI coding assistant.

Kuba Piecuch (2):
  sched_ext: Fix suspicious RCU usage in KF_RCU_PROTECTED kfuncs
  sched_ext: Take rcu_read_lock() explicitly in sub-cap kfuncs

 kernel/sched/ext/ext.c | 4 ++++
 kernel/sched/ext/sub.c | 3 +++
 2 files changed, 7 insertions(+)


base-commit: 2f7928516314f37d7cb334675656b4412edc8be3
-- 
2.56.1.750.gf70dc682cf-goog

