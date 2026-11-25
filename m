Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596416;
	b=C1OtXE2zOGIvU51evsp1NthIF3YfI4PXpmtxWZMZVC87E0ircVyOMwOQs0g0nit0+cKE
	 okPZ+dEfYPwQIAgMznV4wURnyovxq+9N9HyLCZmWyMaJ7nIHP8nez+g4I0g6YDty0JyqN
	 Fu/24SxYkoGfZaKmqkmfzIDPSgsZ+0mIPMvhiVE/V0HWMcr/+7ar9L0qLUX28iizWO9mx
	 pbgsIV/9wsOXC6qA89P9MkPIbe5DZJhwW8JNWkmDA9X6nhaoOHzg2BV5JT+MCELdafQAB
	 GN6xIifJezqh67qmpvj6B02gOogZO3Jv0vGm+iHYJQ1ZPjV60g3NzwTwx8sp0WXAYvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596416;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gKIID75y2cmNlMXRd1MhTd86fNY6fAdmhSMsDM5aV/Q=;
	b=XUfN/bhmdFLjvDDTan8C2l5gnjc49b2yHzj6dpT4MldPwfD+qzZ/p9QJJr1dUNZtGPIr
	 UVTcmbt7xIGmqQCFQN9Qp3fYKmUCCLy1QRPqcy3kDIBFQx7vwG6gPrAPCPADtXqsBFzb7
	 cnQT34DhUJywsBXb/6+hfkY63lvfhnH/B8H1L97YK941AJMWrBm0Skc8KzS/94Pz0iD9Y
	 bCjaFuQ6dCug/W9Rba1/24fipWwy6BlJeF0SYU7rR8a7AJEhigJAMRXliwD/oKEo646CS
	 ebmNzE5dkw2Sj9hzxHi7k7mDuqCbiqkpusA2nxV3im0gabnZxf7V9N8o63/cQ8vVFeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fVJgIzVQ;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F588606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:46:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F588606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fVJgIzVQ
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b4ab53a966so491367a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795596416; x=1796201216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gKIID75y2cmNlMXRd1MhTd86fNY6fAdmhSMsDM5aV/Q=;
        b=fVJgIzVQUDo0SHmzV1oXinNoS3IEbtSaCl5C0hhFa6u4okslMXZuRPP1/sE1WiEaSt
         uGkBZpyVkBMM8TG3tNupmqxvXUF8tBlvl7FmAAd4t7c4tLlgget2lEK+3MnDSNWXpjIM
         LQiK+VY0JOprNjTxLMQ8HSLhKOACJPdkQOyvYu6tjxedmQgDeIB4szcK+Ks6OFgZILhd
         tGCllSv8DXP/lEEhUKk6YeHJvvHdIP/y6wYbt5WlwmtGUev3ODHIqUkrFT4fdlSxOCxe
         SOL0annlCqBUipJwv5paTKlpRq6+K65Z/PV6rXXu4pyBP5LDKlKHOk7YacECCkayebCZ
         XYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596416; x=1796201216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gKIID75y2cmNlMXRd1MhTd86fNY6fAdmhSMsDM5aV/Q=;
        b=ygU2sF9XzC55wxNihE5Ty96vitFQPtkNXN7CgWwlm90oN4ofi87E3zpZqJJbzKJX2Z
         W2iZTdzkX1vEfBhKiFLYp/41vvis++TSPNiAgEBYivopMXIqggjnUK8quYvWtn+FDSXr
         MQuqtNoa1njWPoNkIGyGFwDBpsKwtTNQjACbJ/DsjuMeSS66nH8IbKBiFLRYwsq/bog1
         ktfdjVli6ogNDPmPxzFX1dAfE0axqRHzDHPgEQF9C52AuZZ9zqBvoQgcfsbxoJuGdEM3
         SUtjygcTi2Vay1rDkHJFEhm3E5rqKY+O08apr3J6aFCW/yyMFwsd3mXnJSpTVuVkM6hj
         c5wA==
X-Forwarded-Encrypted: i=1; AL+hErHDMIhk4MEM4ClaDUNn5eV7oFtIsSBxKpH8KnbRznWF6Ft94KWklZkMmOAhkVE7lFp+kyY4pPOaSDhbK20=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cX032gNtptYlBzl/Tvk2BEDjR5bBwHeLm5pGIYeOMKo/3c730
	EHMBKmSdnc5cNx4yTLyjqhX/Q4GoNHLLc5tF8Ugqj0lXt2HVS7MPkT3d
X-Gm-Gg: AZFdTZcj9ie7tTq8Ij5jAB118XG5xaU8Chv54WCSQs0CNRMOSR/1VqFu1g0T8yVDhy7
	q15Qzd+htGOwSipbkQCAXWmNzw/7Zo6ZPYPbuS7fSxFpDMwUb3IeO4cFmWaKP+UvIgDEdWld3ka
	qRv/e7keiEeOVS0D6ivCPDtI7hdpQGSqGx/6gEmR7jWJYEiQAsX+pIgcPSr6SB69K5kGM/1NHDU
	8qzbp7chaVYUVTvlR68CDgV4r8pgBoDbpczgl0bDhPQtjR7DuTcSMoCjJmJVexCB0bUz4W7naK7
	oAihl+Cd4vTbHI0E4rSgpxJ46fnjlV2yxiFiAbDbpdD0zIo8JWsS36iAiUkYpiZTCZ8sEAUsRqJ
	8lNR33GpDK3raRnXBgjODBWNRAm9S5n7hhemlV71pzA16/gIQZBDUY6QIeqTMM83fEVcFAmUIK+
	kFK3Z3ACT/GnH+ZetCYMBNGrQqWg3UwtBrh4lC2+zYROWn5j48ll0y+xLzT4QqTNa63/QIDuM49
	0dltY5u3YRES2pnFueE7pXshb0DQ4L0JAtrhnJY+oLlqDN7J/dSWNri8oqJM2HCBoaadxNttlHs
	uAMQNd+CkbWlEnLVWOQxIPZK6WbyWC+DcRkPyQX7Z0qnhxHfPkBx5+4=
X-Received: by 2002:a17:90b:442d:b0:3b0:d0be:f02c with SMTP id 98e67ed59e1d1-3b41c98a095mr26665706a91.6.1795596415710;
        Wed, 25 Nov 2026 00:46:55 -0800 (PST)
Received: from mi-ThinkCentre-M760t.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d97356sm28973549a91.13.2026.11.25.00.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:46:55 -0800 (PST)
From: Wenwu Hou <hwenwur@gmail.com>
To: rostedt@goodmis.org
Cc: mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	frederic@kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Wenwu Hou <hwenwur@gmail.com>
Subject: [PATCH v2] tracing/hwlat: Bind the sampler kthread instead of setting its affinity
Date: Wed, 25 Nov 2026 16:46:00 +0800
Message-ID: <20261125084600.2306377-1-hwenwur@gmail.com>
X-Mailer: git-send-email 2.43.0
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

start_single_kthread() sets the affinity of the kthread it just created
before waking it up, but kthread_affine_node() overrides that mask on the
first wake-up. See commit 60ba9c38b931 ("kthread: Comment on the purpose
and placement of kthread_affine_node() call").

In round-robin mode, move_to_next_cpu() compares save_cpumask against
current->cpus_ptr, sees the replaced mask, and switches the tracer to
MODE_NONE on its very first iteration:

  hwlat_detector: cpumask changed while in round-robin mode,
  switching to mode none

So the tracer no longer migrates across tracing_cpumask. More importantly,
tracing_cpumask is not honoured at all, and with isolcpus=/nohz_full= the
thread cannot run on the isolated CPUs it is meant to sample.

Use kthread_bind_mask() to preserve the initial affinity, including
isolated CPUs. Clear PF_NO_SETAFFINITY once the single sampler thread
starts to allow userspace affinity changes and cgroup migration.

The mask is now computed and validated before kthread_create(), which also
avoids creating a thread when tracing_cpumask has no online CPU in common:
cpumask_first() returned nr_cpu_ids there and cpumask_set_cpu() then wrote
past the end of the mask.

Tested on a 4-vCPU KVM guest, bit 0 of the mask is CPU 0:

  mode        mask    before                    after
  none        0b0101  Cpus_allowed_list: 0-3    0,2
  round-robin 0b1111  mode -> none, no migrate  migrates 1 2 3 0
  round-robin 0b0101  mask 0-3, no migrate      migrates 0 2
  per-cpu     0b0110  2 threads, cpus 1,2      2 threads, cpus 1,2

Fixes: d1a89197589c4 ("kthread: Default affine kthread to its preferred NUMA node")
Cc: stable@vger.kernel.org
Signed-off-by: Wenwu Hou <hwenwur@gmail.com>
---
Changes in v2:
- Clear PF_NO_SETAFFINITY under current->pi_lock when the single sampler
  thread starts, preserving userspace affinity changes and cgroup migration.
  Keep PF_NO_SETAFFINITY set for per-CPU threads.
- Update the commit message

v1: https://lore.kernel.org/linux-trace-kernel/20261111020755.1422284-1-hwenwur@gmail.com/

 kernel/trace/trace_hwlat.c | 33 +++++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/kernel/trace/trace_hwlat.c b/kernel/trace/trace_hwlat.c
index 3fe274b84f1c2..52478ad8030d0 100644
--- a/kernel/trace/trace_hwlat.c
+++ b/kernel/trace/trace_hwlat.c
@@ -353,8 +353,21 @@ static void move_to_next_cpu(void)
  */
 static int kthread_fn(void *data)
 {
+	unsigned long flags;
 	u64 interval;
 
+	/*
+	 * kthread_bind_mask() sets PF_NO_SETAFFINITY to keep the initial
+	 * affinity from being overridden by kthread_affine_node(). Clear it
+	 * now to allow userspace affinity changes and cgroup migration, but
+	 * keep per-CPU threads bound to their CPUs.
+	 */
+	if (hwlat_data.thread_mode != MODE_PER_CPU) {
+		raw_spin_lock_irqsave(&current->pi_lock, flags);
+		current->flags &= ~PF_NO_SETAFFINITY;
+		raw_spin_unlock_irqrestore(&current->pi_lock, flags);
+	}
+
 	while (!kthread_should_stop()) {
 
 		if (hwlat_data.thread_mode == MODE_ROUND_ROBIN)
@@ -423,15 +436,12 @@ static int start_single_kthread(struct trace_array *tr)
 	if (kdata->kthread)
 		goto out_put_cpus;
 
-	kthread = kthread_create(kthread_fn, NULL, "hwlatd");
-	if (IS_ERR(kthread)) {
-		pr_err(BANNER "could not start sampling thread\n");
-		cpus_read_unlock();
-		return -ENOMEM;
-	}
-
 	/* Just pick the first CPU on first iteration */
 	cpumask_and(current_mask, cpu_online_mask, tr->tracing_cpumask);
+	if (cpumask_empty(current_mask)) {
+		cpus_read_unlock();
+		return -EINVAL;
+	}
 
 	if (hwlat_data.thread_mode == MODE_ROUND_ROBIN) {
 		next_cpu = cpumask_first(current_mask);
@@ -440,7 +450,14 @@ static int start_single_kthread(struct trace_array *tr)
 
 	}
 
-	set_cpus_allowed_ptr(kthread, current_mask);
+	kthread = kthread_create(kthread_fn, NULL, "hwlatd");
+	if (IS_ERR(kthread)) {
+		pr_err(BANNER "could not start sampling thread\n");
+		cpus_read_unlock();
+		return -ENOMEM;
+	}
+
+	kthread_bind_mask(kthread, current_mask);
 
 	kdata->kthread = kthread;
 	wake_up_process(kthread);
-- 
2.43.0

