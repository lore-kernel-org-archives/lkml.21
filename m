Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442129;
	b=m3PfkWAu+4cpwt9224y86sGeEBOUp66d49U2+dZrgR93w68+42wxws/z1FoBvrfK9Q1X
	 hBna6H8tEyW+Q8PW4/e2yiP5Pt9/aGhg6hPVkzx4JUjaGNqDM+sPA6S7E8GFLzoxT3id8
	 6qnLCslz8HW2wRFUSSdKXMxzrQQi+Wl8xAemoEJ2mJzauRkA0XJdaHVePf4p65OhZKE+W
	 HLZRjgrkVSIvW/QV1DOG1lNpBdYcNq/tk9UBeWJ2uDZC1OjRjIW+TXywsRvvkHSdH+KC5
	 dS60KCQkQAbytBOGpRNw275eVrOv4w03XcGcHB+y3N9YK3yF/b9vt3RUq/oFn9q0IDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442129;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=083CZZDs9hJjuz53tbRRme1ywjTKXEoDFd0O3aKN64M=;
	b=a10hEf2Ub1xHXTnqLLBsYWzzbyFE8sbTFWwKBnbjbfbgMNDInHa3PyhuQ7u/+pkN2NIw
	 ZemTuNj+oUQiK8engVplMd/cP5Zfh5WaEsR9S7eKqp0EmC91JpViqjzWLf3rq2bNCfHR3
	 WnxSr27a6H5iQ0aNiOYaSj42hBjOJrqd2IMrDLBD/U2r2T4oPn4fa7vcIDRuCRJNLiKUj
	 AlhzeajmyNJcqmTWrylKVL5ZVVkQD+e4gmSI12YCMSaKz8eYxmtVLV6aA8f81nlOeYnul
	 xubrGN8o1EZzwPK1oLtNcef6H6VBMMzuAOqei3+ISMuh3QNuj4NtYunbDwk93A5Ir6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mNSil9RH;
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B9B606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:55:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56B9B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mNSil9RH
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a359b714f8so20258245e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795442127; x=1796046927; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=083CZZDs9hJjuz53tbRRme1ywjTKXEoDFd0O3aKN64M=;
        b=mNSil9RHomEAHRCpqBNSe6wk7vhfCEIkDpauuTRRtzRfJDJpUG9w1SYOUnTUag0frv
         QY4ol0yYv43r42q/XMXInBltpcl9Pt0seCi9ToGOSSds0Gq0isIFVmPsXYTAltV5zaEt
         F8lKP5tJHeR6vqr3toG5oKalqgIQXY5wN/FdVir1Szyn8zhasMIy/zvBQJab8EVLJ22s
         hWy8xdx1RtqjxQC+uVjQy1PoYK8jFDE7Er/f+tOgYlOgCfWrvkQmZbOSolObnlel3Pbj
         X7TBmPmri6p3a8G3OSa8HKf33I2YD+xOn7qT6wood4tsIxfhKLp20sn/h9hvKqfF0I1/
         HaNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442127; x=1796046927;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=083CZZDs9hJjuz53tbRRme1ywjTKXEoDFd0O3aKN64M=;
        b=ZyyQrY1sm1yRol4R4doyQR0fkag2qsOMBehaoafIqTvfgOZRGwRkKVtlWTp2KixRwY
         zWtvqZhqQd7ADj/LpZbm8Q1aR2esVWwXlTbkF0fxYP8WdRSzMh6pMAdjXyZMATJZw7/t
         Iv8WZM4lL1IofHJNXgTRTNrX/JOjjGp6Vv+0q3knbPDzfe73BYNxml3wb+8oPSJOvVus
         YiRIHCd0hys3nzcwFTJc/btCf+LZdt0EwbfFdNyZCuQlVBmiiYeuzbasaJzr+FH3/nty
         b6YhMjtQoTKSVP+zl7rVW5cfgz5y8FuAw2LdNuToSXs/V2iE8ln8sGcAV+nAUS0PLAkB
         F+qA==
X-Forwarded-Encrypted: i=1; AL+hErFvfn8zU1X/0Skn1dxQKhxHTEODGvAl5CjDxFUehzRq4VoeOmcRdrJZ5BQmmKcZnmC8O1fkYoTf51ENUXk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fU6mwLe4v2gwFQH7KCP5yu1Ygr/G+8lNcniuof/kfWG8lToHl
	hW1sKUIRscCwCd+tQjcQGLi/ZI2NkPMUUPNi8VyGQ6faXm5kfcyGkNfgCR6pBGtLUmTaZ4lcE00
	u0LTrIhorCUhbHA==
X-Received: from wmjq4.prod.google.com ([2002:a7b:ce84:0:b0:4a2:15af:d03c])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:820d:b0:4bb:5de1:e912 with SMTP id 5b1f17b1804b1-4bb887c3ae7mr227341395e9.1.1795442126571;
 Mon, 23 Nov 2026 05:55:26 -0800 (PST)
Date: Mon, 23 Nov 2026 13:55:23 +0000
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
Message-ID: <20261123135343.4131146-1-jpiecuch@google.com>
Subject: [PATCHSET sched_ext/for-7.4-fixes] sched_ext: Don't allow unlocked
 kfuncs from ops.dump() and ops.init_cids()
From: Kuba Piecuch <jpiecuch@google.com>
To: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>
Cc: Kuba Piecuch <jpiecuch@google.com>, sched-ext@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

scx_kf_allow_flags[] grants SCX_KF_ALLOW_UNLOCKED to ops.dump() and
ops.init_cids(). That group contains scx_bpf_create_dsq(),
scx_bpf_dsq_move*(), scx_bpf_dsq_reenq_task(), and
scx_bpf_select_cpu_*().

1) ops.dump() had SCX_KF_UNLOCKED since commit 07814a9439a3
   ("sched_ext: Print debug dump after an error exit") because its
   caller holds no rq lock. Commit 4c30f5ce4f7a ("sched_ext: Implement
   scx_bpf_dispatch[_vtime]_from_dsq()") then made DSQ moves callable
   from SCX_KF_UNLOCKED contexts, and commit d1d3c1c6ae36 ("sched_ext:
   Add verifier-time kfunc context filter") carried the grant into
   scx_kf_allow_flags[].

   However, scx_dump_state() runs ops.dump() with IRQs disabled under
   scx_dump_lock, including from scx_disable_irq_workfn() (hardirq) and
   SysRq-D. On a live SysRq-D dump, an ops.dump() that calls
   scx_bpf_dsq_move() migrates tasks and runs nested SCX ops from
   inside the dump:

     sysrq_handle_sched_ext_dump()          /* may run in hardirq */
       scx_dump_state()
         raw_spin_lock_irqsave(&scx_dump_lock)
         ops_dump_init()                    /* arms scx_dump_data */
         ops.dump()
           scx_bpf_dsq_move()
             kf_switch_rq_lock(task_rq(p))
             raw_spin_lock(&dsq->lock)
             move_task_between_dsqs()
               move_remote_task_to_local_dsq()
                 deactivate_task(src_rq)
                 activate_task(dst_rq)
                   ...
                     ops.dequeue()          /* nested SCX op */

   Any scx_bpf_dump() call from the nested op also splices output into
   the active dump because scx_dump_data is armed on this CPU.
   scx_bpf_dsq_reenq_task() takes the same rq and DSQ locks, and
   scx_bpf_select_cpu_*() take p->pi_lock and run idle CPU selection.
   ops.dump_cpu() and ops.dump_task() already deny all
   context-sensitive kfuncs.

2) Commit 874fdc0e86e4 ("sched_ext: Add ops.init_cids() to finalize the
   cid layout before init") granted SCX_KF_ALLOW_UNLOCKED alongside
   SCX_KF_ALLOW_INIT_CIDS. ops.init_cids() runs before
   scx_cid_publish_tables(), scx_arena_pool_init(), and
   scx_alloc_pshards(). Its only job is to finalize the cid layout via
   scx_bpf_cid_override(), so it has no reason to create DSQs or call
   the DSQ move and re-enqueue kfuncs.

Patch 1 removes SCX_KF_ALLOW_UNLOCKED from ops.dump() and restricts
ops.init_cids() to SCX_KF_ALLOW_INIT_CIDS. All remaining
SCX_KF_ALLOW_UNLOCKED ops run in process context with IRQs enabled and
hold no rq, DSQ, or pi locks.

Patch 2 adds the unlocked_kfunc selftest. Without patch 1, the test
fails with:

  ERR: unlocked_kfunc.c:49
  unlocked_kfunc_fail_dump loaded when it should have been rejected
  not ok 1 unlocked_kfunc #

The patches were written with the help of an AI coding assistant.

Kuba Piecuch (2):
  sched_ext: Don't allow unlocked kfuncs from ops.dump() and
    ops.init_cids()
  selftests/sched_ext: Add unlocked_kfunc test

 kernel/sched/ext/ext.c                        |  8 +-
 tools/testing/selftests/sched_ext/Makefile    |  1 +
 .../selftests/sched_ext/unlocked_kfunc.bpf.c  | 69 ++++++++++++++++++
 .../selftests/sched_ext/unlocked_kfunc.c      | 73 +++++++++++++++++++
 .../sched_ext/unlocked_kfunc_cid.bpf.c        | 67 +++++++++++++++++
 .../sched_ext/unlocked_kfunc_fail_dump.bpf.c  | 26 +++++++
 .../unlocked_kfunc_fail_init_cids.bpf.c       | 22 ++++++
 7 files changed, 264 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/sched_ext/unlocked_kfunc.bpf.c
 create mode 100644 tools/testing/selftests/sched_ext/unlocked_kfunc.c
 create mode 100644 tools/testing/selftests/sched_ext/unlocked_kfunc_cid.bpf.c
 create mode 100644 tools/testing/selftests/sched_ext/unlocked_kfunc_fail_dump.bpf.c
 create mode 100644 tools/testing/selftests/sched_ext/unlocked_kfunc_fail_init_cids.bpf.c


base-commit: 2f7928516314f37d7cb334675656b4412edc8be3
-- 
2.56.1.750.gf70dc682cf-goog

