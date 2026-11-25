Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607458;
	b=e/VHrSRwQCnJ0nw4ChnuJAS8tUew3u3ZKUYfb3ekKrdw6qs4xtZWU4T95NuG2l4lSqX4
	 vw8N1CJtJTHfqi9plxtTKcxgdgHNKEieQuXdNLlwlCzKv0zDtmCPb3PVmaCbJpho9+3Eq
	 FtyeJ4WXl+CMEthRELI9EiS1g246EuP8DCj8I9OKaeDLI+QAAqtsGIFxKRXskWfux6EM1
	 XiA6QpS3RHpF8+RXRxkpIbvEr+ImzXgZ+gkPneVyBKSbMkSdqSs2Pv6u9hcdb3UbRwEKy
	 NvOMy8cwyg86vkSEjCy6ih/mR71dOy9nk6hIz2JwCohWTtmXZhNSSsQZyzKN/3ueAPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=e4dxllnUOaFkGClmOJW28aiXtA1rYhbvVzFMxuYIsIg=;
	b=mMGr3/4RbWxAlPNefAn3KEo2HM2DCdm/GRtZS1AC/kL3pvKLsgVC0vFSdaOP8dZql1le
	 C0OVyzhcNLigEFgts1t4UqlZ1+xwqsj6CMOHgfsz90UAOrsJSybbuWRZGki0a/LiyQACT
	 fr1F8pCVLPYeq08eiJQgntVUKMQEIv906viTbEu0sNRTwjxBcm6mzLKwPlm0xb8Y84h4a
	 WLL3yC0Pe8NHctudO/d5U6TRLCxGbIaPzaejxCqjnH2VgbewaEEZW17c+84JRjeCIqNL3
	 gUKP4CEkVuu2k/vLJCP+PRBMzbcbUjcvRNdATNIF67D8LOTlSb6GMMKEW9p9Vo2fcvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=d6zWSDR0;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB1F606A691
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:50:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBB1F606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=d6zWSDR0
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4bb68d624baso26868915e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795607454; x=1796212254; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e4dxllnUOaFkGClmOJW28aiXtA1rYhbvVzFMxuYIsIg=;
        b=d6zWSDR0z+m+J79r6RezYwb+X5yuHF0DrUEsTcmkvfrUBvToILZF0Z/9yNQzeMzI6r
         A02h48CM/G5IZWNvatRuMBSJfNomDJ2tkemCYUZ9QQ7jnnmU0cPdDwZesgBHferAQgnH
         4bENTkFSV0eYYXq2GZZKT+nhv1LoMOmkO4JJvY/S66XCpJ4OslOv0kHM65F4oe9WNBIL
         pbVK1/2tXxtRbfAt1krobqfFFs4msrcSMBqKjyMlHZl7ZmdBlY800FXEGki04aiG+GEW
         ZLRrvFrxV/V/PCCGZxExqUrbMDnS9UCTFg9UIonGEZWCikpKVwCodM9bONagtJAG5ErX
         uWag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607454; x=1796212254;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e4dxllnUOaFkGClmOJW28aiXtA1rYhbvVzFMxuYIsIg=;
        b=S/xZryFbG+nkP+DfYKECz/bY0drKs2zzsN/C5Y35l7sWsqpsfRLnJF4qIBoQUjyrSq
         NgJEKBPYYCOhA9upiRk1Rr/8ZOWTvhpwPSZ+1dv7JQK/9H1f9TdfJEju6ewsDT6WjlTO
         14oMCrzeNyOV44se6WFUpwD18vgWWbRE4zAKihnQkYN25K7cj6r30o/EjnFSyBJEem7A
         GguJ4niWZHZ6ToMCvSlKJeb/745HO4pI/u973PitkO0hIyE2eAqO5w55LeQz1ohKN6hn
         x3Kgit4DVftSszT5eKll2+CuNBKLp9qCJn1Zj8EowzDJgIh0kowU6CjNGFqdcw7snfuU
         bDRw==
X-Forwarded-Encrypted: i=1; AL+hErEaYB/dlB08ozVca2Dkt+7wCxPF4LePsVVnJ1PKLcyqbaqlHfQNw19Kst/atFKTEQhpc95/LvoVsgnA1BM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OYaaKgNPtgn6j8xZF55gJxhyEfC9Vl1vC9KGTp8baCvbgysGP
	ERBcXktbcLLitQ85K2pEAAnWr4a/w0FvjqXrfvjuforOhQ7fdwRKla1UvKJJ/6QrvaQwqjYeDZb
	/4WTnG6yaz+z00w==
X-Received: from wmmh17.prod.google.com ([2002:a05:600c:4151:b0:4a1:e3ce:e2eb])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3491:b0:4a2:c2b:a91b with SMTP id 5b1f17b1804b1-4bb8880014dmr367684075e9.10.1795607454118;
 Wed, 25 Nov 2026 03:50:54 -0800 (PST)
Date: Wed, 25 Nov 2026 11:50:51 +0000
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
Message-ID: <20261125114932.3198836-1-jpiecuch@google.com>
Subject: [RFC PATCHSET sched_ext/for-7.4-fixes] sched_ext: Reenqueue IMMED
 tasks when a higher class wins the pick
From: Kuba Piecuch <jpiecuch@google.com>
To: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>
Cc: Kuba Piecuch <jpiecuch@google.com>, Peter Zijlstra <peterz@infradead.org>, sched-ext@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This is the SCX_ENQ_IMMED fix extracted from the ops.cpu_acquire/release()
RFC, as requested by Tejun:

  https://lore.kernel.org/all/657547efeaea54276c50a0c106399366@kernel.org/

SCX_ENQ_IMMED (commit 98d709cba319 ("sched_ext: Implement SCX_ENQ_IMMED"))
relies on rq->next_class to detect when a higher scheduling class is about
to take the CPU: rq_is_open() rejects IMMED insertions while next_class is
above ext, and wakeup_preempt_scx() schedules a reenqueue when a wakeup
raises next_class.

Several paths make a higher-class task runnable or let it win the pick
without passing through wakeup_preempt_scx(), leaving IMMED tasks stranded
on the local DSQ until that task yields:

1) sched_setscheduler() or a PI boost promoting a queued task to RT or DL:
   sched_change_end() does not call wakeup_preempt() for non-running
   tasks, switched_to_rt() only calls resched_curr(), and switched_to_dl()
   calls wakeup_preempt_dl() directly.

2) DL replenishment, CFS bandwidth unthrottling (in partial mode), and RT
   group unthrottling enqueue tasks without going through wakeup_preempt().

3) When the ext dl_server picks an SCX task, rq->next_class becomes ext
   even though RT tasks are queued; once the server exhausts its budget,
   RT takes over without a wakeup.

4) Under core scheduling, a forced-idle pick resets rq->next_class to idle
   while tasks remain on the local DSQ. A later RT wakeup on that CPU goes
   through wakeup_preempt_idle() instead of wakeup_preempt_scx().

With proxy execution enabled, scx_proxy_reenqueue_retry() already covers
all of these: __schedule() sets rq->next_class from the picked task right
before calling it, so it reenqueues IMMED tasks whenever a higher class
wins the pick, whether or not that task went through wakeup_preempt().
Without proxy execution (CONFIG_SCHED_PROXY_EXEC=n, or sched_proxy_exec=0),
nothing does.

Patch 1 adds scx_settle_pick() to __schedule(), after proxy resolution,
on the path which every pick reaches, independent of proxy execution.
When SCX is enabled, nr_immed is non-zero and rq->next_class (the donor's
class under proxy execution) is above ext, it schedules a deferred local
DSQ reenqueue. rq_is_open() is false when the reenqueue runs after the
context switch, so IMMED tasks are returned to the BPF scheduler.
Core-sched siblings apply remote picks in their own __schedule(), so they
are covered too. The IMMED check in scx_proxy_reenqueue_retry() becomes
redundant and is removed.

A forced idle CPU still doesn't reenqueue IMMED tasks. This matches
rq_is_open(), which returns true while the CPU is forced idle, as
rq->next_class is idle. The IMMED task at the head of the local DSQ waits
for the next core pick.

Patch 2 adds the immed_strand selftest covering the core-scheduling forced
idle case 4). It enables CONFIG_SCHED_CORE in the selftest config because
forced idle is the only case above that strands an IMMED task
deterministically without other non-default options. The promotion in 1),
DL replenishment and the dl_server case 3) reschedule the CPU right away
and only strand a task when racing with an insertion. CFS and RT group
unthrottling need CONFIG_CFS_BANDWIDTH or CONFIG_RT_GROUP_SCHED. The test
is skipped without SMT siblings or core scheduling. Without patch 1 and
with proxy execution disabled (sched_proxy_exec=0), immed_strand fails
with:

  immed_strand: CPU 3: inserts=1 reenqs=0 hazards=1 strands=1 max=200419us
  Expected bss->nr_strands == 0 (1 == 0)

The patches were written with the help of an AI coding assistant.

Kuba Piecuch (2):
  sched_ext: Reenqueue IMMED tasks when a higher class wins the pick
  selftests/sched_ext: Add immed_strand test

 kernel/sched/core.c                           |   1 +
 kernel/sched/ext/ext.c                        |  53 ++-
 kernel/sched/ext/ext.h                        |  13 +
 tools/testing/selftests/sched_ext/Makefile    |   1 +
 tools/testing/selftests/sched_ext/config      |   1 +
 .../selftests/sched_ext/immed_strand.bpf.c    | 174 ++++++++
 .../selftests/sched_ext/immed_strand.c        | 383 ++++++++++++++++++
 7 files changed, 617 insertions(+), 9 deletions(-)
 create mode 100644 tools/testing/selftests/sched_ext/immed_strand.bpf.c
 create mode 100644 tools/testing/selftests/sched_ext/immed_strand.c


base-commit: 97e1c7d467d07734f8f5c8c64730e1f7c415bd46
-- 
2.56.1.839.g22a8290db9-goog

