Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795580363;
	b=4pBQ2nLxU91uh7EAfzm54DwDPku2F8LArgb84Z4OLRqFZ7sQW6AoFXOm6kl6Mss5jzpc
	 fQN/23zLxk6Umei5n3vnBfLsIiBy1o3Q7y6/sc/AaRDDufqoN5w16mQvF+oRuq2hB+gd4
	 UqkJRmRya2Ech0FGRxx1Zxtf4YffTsaflJnjhj5OlPvu4OY0o4bHCHVOY8Vy1TO5BaC1N
	 SkN2mIT+hKUCmMgVJ5Qyhy8fCXtZpi6aUZlVUX83LBxns1LNiotffHR3HaTxotyZrGWCj
	 wqKIdZ3Ea8IwOXZLyATctUJMFh44vRnyglWBGLszg3lL8lyJ3g9Q5e+XlbNlUVCUa1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795580363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=RYnkiQyubE+RoSa9gUQ9ASOysahxUWtjtOAnaQCLo/U=;
	b=pySm8YcnHjVWUL58p30bSwob2RIbb4GDWRwn1Yg4qwiqILEyly8c9P3LaAPqNFJeehNp
	 zAwgDZbULc4DO/cMsisTPhl2a/kTObIlsykQy5VO19RIAGvj1oI9B96lCTu1FwLpxPO9e
	 4OWjZysNdCrhtlKZtEDG0mNUNP07f7ShtH0sPbdbrgdx8u/G8jfP+Zlrr5Ppog/vWGguI
	 PkFoDxckHFvO3V4rlGBWyv677cR9iUw2zBPHyv/pQvSalDxmJxwmsOP7dCeBQGT1evFYe
	 niUvlBLGEcxdzCrBnMyO5pnw3Up9SmqVNacjH5LKRtPVoQ4SLj3FRlGoePzDcRKFkow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=E8RYveAk;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8BD606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:19:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B8BD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=E8RYveAk
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f05b674e3eso37723985ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795580362; x=1796185162; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RYnkiQyubE+RoSa9gUQ9ASOysahxUWtjtOAnaQCLo/U=;
        b=E8RYveAkeEIukDtM/Boc8gSnLVh3QA5sID71kcwgek7WjlJnYphsQ13PNqTHEHeNdS
         crDWnOi2uUMfHbIOX1QZiaxVNAiTHWW2Mu3cWYDWwB8D+NkYJjqUS17lGjHR7rJtO7BE
         UbJZUcp8gVcavT6TC3/E/odyQ3RLMGPOrvokaK3gU5xuUlGWzywpSP65hdudiEJx8ST+
         cUemHtAskDjg//sJLlQidfhvEAR/mBAtJcm1sXNcGkf4zMLl6IU1RyubIbauvXPX0KTg
         qvL319c8wSoyTXrJxO5irh9sORVwWZgwlKjbECw4BmEPvOFIcCClfRdvzLBl4FFOtQW7
         3vYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795580362; x=1796185162;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RYnkiQyubE+RoSa9gUQ9ASOysahxUWtjtOAnaQCLo/U=;
        b=jqVTi2VqcVCcjW4xmiVGDRYBxkTRBuJU6A0SQO+jMkc9jIzigBZ6B/rsjsTDOn+Jiz
         +e9OE5X/eTe5v+ry3Gm1TRQ1dYSQxKT9orieVdEKNBJDUPygjXlfe2fVKE99keWZI7+W
         ufqMqUXKs13msWtaKCF/ECKVcVdKQ9iljS4mNss/7ScIk3JavqdCkuwIt1IK3wkvL36C
         g1WpfMLGtddll8k/Fu4wjx09AktTDnQe+oSrLWNQqIkA+WwHbZYk9j+VxObs0KR5V7zj
         5J0xIbRFF9omJevdIcogrCVnf+vtagbKHEWOogC0sCwBROG3LSowfOCGRjpDLgyMOcxr
         2mlA==
X-Forwarded-Encrypted: i=1; AL+hErE1qoJPGaRY3BHqfnA5in05z8o1FRuhCxJZu7B+fGPMMvoby39xfOX24uaQOfR2PFm+lKXGRqMPC0etvsg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Pkf/om9JvwGg8pDb+L7+gmSfk8mus1yzfbk4NZ98AD8vCXRut
	bixJe/F3vPpFqKB0CfrlkXTpkYf7dkRUTNkXZblTUHelYw4ejsW6iTqDRaiAq0mnsxonKvejRAQ
	ABAH6KGtCvsGLvybdDb6Q2efDxw==
X-Received: from pglk23-n2.prod.google.com ([2002:a05:6a02:6b97:20b0:cd8:2b49:af45])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2701:b0:3a4:acde:1e3b with SMTP id 98e67ed59e1d1-3b41c8dd232mr15615461a91.13.1795580361641;
 Tue, 24 Nov 2026 20:19:21 -0800 (PST)
Date: Wed, 25 Nov 2026 04:18:58 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125041900.3243569-1-dylanbhatch@google.com>
Subject: [PATCH v2 0/2] sched, livepatch: Fix transition stall for CPU-bound tasks
From: Dylan Hatch <dylanbhatch@google.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Shuah Khan <shuah@kernel.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Thomas Gleixner <tglx@kernel.org>, live-patching@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dylan Hatch <dylanbhatch@google.com>
Content-Type: text/plain; charset="UTF-8"

Commit 676e8cf70cb0 ("sched,livepatch: Untangle cond_resched() and
live-patching") moved klp_sched_try_switch() from _cond_resched() into
__schedule() and gated it on READ_ONCE(curr->__state) & TASK_FREEZABLE.
This causes livepatch transitions to stall when CPU-bound kthreads,
PF_USER_WORKER threads (such as vhost-<pid>), or user tasks in long
kernel loops spin with cond_resched():

1. Even when __schedule() is entered via preemption or an unfreezable
   sleep (such as PF_NOFREEZE kthreads or PF_USER_WORKER threads
   sleeping in TASK_INTERRUPTIBLE), curr->__state does not have
   TASK_FREEZABLE set, so klp_sched_try_switch() skips the task.
2. A sole runnable task spinning in the kernel never gets
   TIF_NEED_RESCHED set during sched_tick(). In klp_send_signals(),
   wake_up_state(task, TASK_INTERRUPTIBLE) is a no-op for a
   TASK_RUNNING task, and set_notify_signal() sets TIF_NOTIFY_SIGNAL
   without TIF_NEED_RESCHED, so the resulting reschedule IPI returns to
   kernel mode without entering __schedule().

Patch 1 fixes both issues by dropping the TASK_FREEZABLE check from
klp_sched_try_switch() (relying on stack_trace_save_tsk_reliable() in
klp_check_stack()) and kicking still-running unmigrated tasks via
resched_cpu() in klp_send_signals() (as well as waking interruptibly
sleeping PF_USER_WORKER tasks).

Patch 2 adds a livepatch kselftest (test-cond-resched.sh) exercising the
klp_send_signals() reschedule path for both CPU-bound kthreads and user
tasks spinning in kernel mode.

Note on reliable stacktraces across exception boundaries:
Because _cond_resched() is a no-op under CONFIG_PREEMPTION=y, a sole
runnable spinning task enters __schedule(SM_PREEMPT) from
preempt_schedule_irq() with an in-kernel interrupt pt_regs frame on the
stack. Switching the task in klp_sched_try_switch() therefore requires
arch_stack_walk_reliable() to support unwinding across in-kernel
exception frames. This works on x86_64 with CONFIG_UNWINDER_ORC=y, where
test-cond-resched.sh passes with this series.

On architectures or configurations where arch_stack_walk_reliable()
currently rejects in-kernel exception frames (arm64, powerpc, s390, or
x86 with CONFIG_FRAME_POINTER=y), test-cond-resched.sh exposes this
limitation and will fail until exception-boundary unwinding is
supported. On arm64, the test passes when combined with the proposed
kernel SFrame unwinder series [1] or equivalent .eh_frame-derived
unwind tables [2].

These patches are available on github [3], with an additional commit
containing extra tracepoint validation.

Ref:
[1]: https://lore.kernel.org/all/20261117020648.323464-1-dylanbhatch@google.com/
[2]: https://lore.kernel.org/all/20261117043504.1021063-1-dylanbhatch@google.com/
[3]: https://github.com/dylanbhatch/linux/tree/stall-v2

---
Changes since v1:
https://lore.kernel.org/all/20261117045254.1048298-1-dylanbhatch@google.com/

 - (Josh) Drop the sched_tick() hook and instead force still-running
   tasks through __schedule() from klp_send_signals(), avoiding per-tick
   preemption and reliable stack-walk overhead on unpatched tasks.
 - Use resched_cpu() rather than set_tsk_need_resched() + kick_process()
   when kicking remote tasks in klp_send_signals(), and apply it to all
   still-running tasks (including user tasks spinning in kernel mode).
 - Update test-cond-resched.sh to deterministically exercise the
   klp_send_signals() reschedule path for both kthreads and user tasks
   spinning in kernel mode.
 - (Sashiko) Bounds-check target_cpu against nr_cpu_ids before calling
   cpu_online() in test_klp_cond_resched.

Dylan Hatch (2):
  sched, livepatch: Fix transition stall for CPU-bound tasks
  selftests/livepatch: Add cond_resched() transition tests

 include/linux/livepatch_sched.h               |   2 +-
 include/linux/sched.h                         |   1 +
 kernel/livepatch/transition.c                 |  19 +-
 tools/testing/selftests/livepatch/Makefile    |   3 +-
 .../selftests/livepatch/test-cond-resched.sh  | 204 ++++++++++++++++++
 .../selftests/livepatch/test_modules/Makefile |   1 +
 .../test_modules/test_klp_cond_resched.c      | 141 ++++++++++++
 7 files changed, 365 insertions(+), 6 deletions(-)
 create mode 100755 tools/testing/selftests/livepatch/test-cond-resched.sh
 create mode 100644 tools/testing/selftests/livepatch/test_modules/test_klp_cond_resched.c

-- 
2.56.1.839.g22a8290db9-goog

