Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795253899;
	b=he5GaG9qNs9wiVQJe8r7BzQ0FME4BsH9X4ZHr6EHJb8vmoCWjNeQtP6WAP2T7QAn5ZW5
	 N17iKcBAQDRz8db2P7ARjPpr4ATfmEBBMJiTgoRAAKodHzPeOvXPKpgYZMD0MJ7unRr1h
	 9yZQHsFFVVcybDrHQbIcwSPQzQ2LyU44uteMrbXOcDjhcaAWeNTWvGaLrPpCw67ptFxhQ
	 5T/iwFrbvm9EGYSFbCs3er2B5+xwPN/y9YRZ8yINp0gmXk00SEfyFqPVo6wPhRJFwG7cv
	 b0mWERaJvlxq0a2aKXM7SwCblFcZsjcjG0O3wh7yeZm/DXkxMuBlrmqjniEeLKjnhwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795253899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=owmJEqX91uhoT5D2QMak8ejphZ4BbnGR8Yefzo8bEBA=;
	b=xRPixGbYzxwBSYvrk3YLVcLObtN6yoWipZkMANXMhMoYZOio3jLp1+wF7QA8VjUq0SoD
	 EGcPzzvrFqtaqziJK1CNYLh52NxsVdwXZnpfs5uEad2M1Jz7IGL4O6ejYtgzfX0TumILb
	 1+F6e78P9cd7qkV0MQ7F774tWZ4FYjBpHpIdCeOFlahJ8vk8JBfEQfKaGi5qmY7n7tSLX
	 13pK4E4Ctem4o6oZLY88pELiZHrYaDAEYKbWKDdjF0SiyC66bl6LT7eWc7Lz9pBkZdFqN
	 /gbzYUH2IvJWN16iVQBNL//4TjOoLhE15uLPWVvA9ymz9u/e9c2H0tmcmcgaLRG8SpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DgZShVE3;
	arc=none smtp.remote-ip=74.125.227.137
Received: from mail-pj2-f9.google.com (mail-pj2-f9.google.com [74.125.227.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833FF606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 09:38:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 833FF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DgZShVE3
Received: by mail-pj2-f9.google.com with SMTP id 98e67ed59e1d1-3b18c01238eso425497a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 01:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795253899; x=1795858699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=owmJEqX91uhoT5D2QMak8ejphZ4BbnGR8Yefzo8bEBA=;
        b=DgZShVE37kx91BCmEV6XHQ/+OVJVQDBfiZUIw3HvBSnVhSg3fTrW2ruWbSW0EYYvJo
         Ucbvk+dv/FOYiDQ5bNTPdx2y0inFzHWNUoiwLcT9DUb5UESg2RB4emD3iDTDtkEwU0Yn
         Wtfls6DpA73Mj/oIHllfsG+aL7JAjRkaLYo4z97p92BS1w4VB8NiZY138skw0Q5eOB2G
         OenM63f7cVmR0DrBuKbygpDNPw3ssj3zKdhvY6fTNVM33am5hLmJE37J1Wwbu7BOnHIo
         /dSd6iB2pVbx463ZEGDs6He0WdWOeBHaslNIjCx5nz6VcfIAjguPh6EYoRaj1ssmjbf8
         alIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795253899; x=1795858699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=owmJEqX91uhoT5D2QMak8ejphZ4BbnGR8Yefzo8bEBA=;
        b=XP8GkGdJQwa9MzxQ6k6+EC73j3DFQzF38z3lhl593pv9FMncgEtOYaW9dmDkn8/D/Z
         u/2nbCl+18wCnwa3slPYDUs44iEufBkN6/ci5P6Uj91r9MQPC6YykihTwHuvtjZpI12c
         UEvQzvVxE+wUPucjMKR+P5gZ5gUKmHdyyzNwUJpWvOJj59MJHSHykcvIAWb5J3t2WkPg
         Bd0WqchMitEC/Urvkjgn7ZDpS0Wc+GvEEBTmjQjic7zOBXF7JwJdNMwoq7HXxtitIEfn
         qDcfEn2Xsd+SWMsFfdtD7/dD/NvzRIEBo9+rGdhaCrgK4hwKPZQelWQwAjZ/pApitJN8
         ZBvQ==
X-Forwarded-Encrypted: i=1; AL+hErFhpelIUeO8+D9ZJPYVu8DxA4zWhqvELk3GNwcE9SxLGiqqVQgiXCKnwVF5+2K8XbVx+f7tTxlKO1R+ff4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kxEm0Lt8teZ4GgJK3mwWWCRc8X08stMWSfiWWmMchu0ap64jx
	LY/F9vwyul7ytAVBmSxBds3CN79HTsk2esHJMtOFiaO1Bp0EJlCo0Fne
X-Gm-Gg: AZFdTZdlDixfQQlzandTmptSaoBK0s2/nV0V5o7NjPXO6PB4U97tPPjEEzhpdGB9ttw
	FVQKschyBKKSaOn6adqXmkEwJ/Chlqys+4jaWstMVaQ1F8U+IFxhDSYqEUq5JHF96TD+ZtdySP0
	j4TSQLnUrhJ6U5EWXXHK87TYxPHtIFF8jVLPcrsb5S7Ww0Z7d4lUabNxaRA8o1HMssraFiaq1cd
	OqIO7uCpX7+ikW0vJx1h6EMR5i1KAuyfKP1DbrQUo7QO3kHfp1IQosGIXa6mX9nwaSseiOxXHae
	2XpqvNZewtBqOFk6fZ2WuBIqNmRFAc0DtJuu8ykjQU5tBBT8QmIOwf5zEyowUg8U3h7iucuF9M/
	diHxqlb3M9YVv6yKVAVpAIm+fXo/TTT8ZAFaeaXUzZG19mvVXMWbQCGw9+2i/VovrEf7MLl6cHh
	v9TdmP0Ywkz1qqt+xxjORyo5CHPRJw9Sl9NbyiSldPM4dQxIADG7aY0hox30+nzI0YWehYHzS93
	nZTv547HYGTdxh4GXlt92BWYCHX4dgtBIJiq85IzhKaIIbDp5aCNsasIOWz1P31/wZ3EhhwZYnw
	vePvz2Z+yBLdvx7FgRzX9HDJng==
X-Received: by 2002:a17:90b:2e8c:b0:3b3:b36e:8c40 with SMTP id 98e67ed59e1d1-3b41c97872bmr5640628a91.62.1795253898635;
        Sat, 21 Nov 2026 01:38:18 -0800 (PST)
Received: from nixos ([2409:8a28:ae4:7f20:1906:8e4e:fd1e:3daf])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b8733e6sm1366552a91.3.2026.11.21.01.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 01:38:18 -0800 (PST)
From: Zixin Wang <w1355457260@gmail.com>
To: linux-doc@vger.kernel.org
Cc: linux-rt-devel@lists.linux.dev,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	rostedt@goodmis.org,
	corbet@lwn.net,
	frederic@kernel.org,
	wagi@monom.org,
	atomlin@atomlin.com,
	linux-kernel@vger.kernel.org,
	Zixin Wang <w1355457260@gmail.com>
Subject: [PATCH v4] Documentation: real-time: Add boot parameters and task isolation section
Date: Sat, 21 Nov 2026 17:37:40 +0800
Message-ID: <20261121093740.4133-1-w1355457260@gmail.com>
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

Document the boot parameters and runtime tunables that affect the
worst-case latency of a real-time system, alongside the existing
kernel configuration guidance.

Cover CPU isolation, nohz_full, RCU callback offloading, interrupt
affinity, and C-state limits, with references to the relevant
documentation.  Keep the C-state parameters next to CONFIG_CPU_IDLE
and the tickless trade-off next to CONFIG_NO_HZ, so each option stays
with its configuration guidance.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=220633
Link: https://github.com/elisa-tech/wg-aerospace/issues/222
Signed-off-by: Zixin Wang <w1355457260@gmail.com>
---
Thanks Sebastian for the review.

v3 -> v4:
  - Fold the C-state parameters into the CONFIG_CPU_IDLE section,
    which already documents processor.max_cstate=1 and cpupower, and
    drop the separate "Idle state limits" subsection.
  - Point CONFIG_NO_HZ/CONFIG_NO_HZ_FULL at nohz_full= and avoid
    repeating the tickless-transition explanation in the isolation
    section.
  - Add a CONFIG_RCU_NOCB_CPU section for rcu_nocbs= and rcu_nocb_poll,
    and reference it from the isolation section.
  - Remove repeated statements within the isolation section: the
    domain side effect, the duplicate isolcpus=nohz/nohz_full=
    description, and the nohz_full/rcu_nocbs cross-statement.
  - Keep the boot parameter section focused on the cross-cutting
    isolation parameters and their interactions.

Testing:
  make SPHINXDIRS="core-api" htmldocs and checkpatch.pl pass.

  Host boot test (AMD Ryzen 5 5600H, acpi_idle): with
  processor.max_cstate=1, /sys/module/processor/parameters/max_cstate
  is 1 and cpupower idle-info reports only POLL/C1; without the
  parameter the host reports POLL/C1/C2/C3.  intel_idle.max_cstate was
  not tested because the host uses acpi_idle.

  Host latency comparison (cyclictest, CPU 2 isolated, performance
  governor): the idle-phase average latency was 15 us with
  processor.max_cstate=1, 32 us with processor.max_cstate=2, and
  248 us without a limit; the corresponding maxima were 879 us,
  2407 us, and 3336 us.  The tight-phase maxima were dominated by a
  device IRQ (about 3.2 ms), so the idle phase is the relevant
  comparison.  C2 and C3 usage was confirmed by the cpuidle usage
  counters.

  QEMU test: the default ACPI tables have no _CST; with a small _CST
  SSDT loaded via -acpitable, the guest registers POLL/C1/C2/C3, and
  processor.max_cstate=1 limits them to POLL/C1.  This verifies the
  parameter behavior; the QEMU setup does not measure real host
  C-state latency.

 .../real-time/kernel-configuration.rst        | 128 ++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/Documentation/core-api/real-time/kernel-configuration.rst b/Documentation/core-api/real-time/kernel-configuration.rst
index d7f08e7b..315960cf 100644
--- a/Documentation/core-api/real-time/kernel-configuration.rst
+++ b/Documentation/core-api/real-time/kernel-configuration.rst
@@ -98,6 +98,11 @@ can be achieved by using the boot parameter [1]_::
 
   processor.max_cstate=1
 
+On x86 systems using ``intel_idle``, the ``intel_idle.max_cstate=`` boot
+parameter sets the maximum C-state depth (1-9).  A value of 0 disables
+``intel_idle`` and falls back to ``acpi_idle``; it does not disable
+C-states.
+
 Higher C-states can be acceptable depending on the user workload's latency
 requirements.  For ACPI-based platforms, use the ``cpupower idle-info``
 command to inspect the available idle states.
@@ -179,6 +184,9 @@ the extra accounting and state book-keeping.
   ``NO_HZ_FULL`` may be beneficial.  In such cases, users should offload the
   kernel housekeeping to dedicated CPUs and isolate compute cores.
 
+``nohz_full=`` enables tickless operation for a set of CPUs; see
+:ref:`real_time_boot_parameters` for its interaction with ``isolcpus=``.
+
 See also Documentation/timers/no_hz.rst
 
 ``CONFIG_PREEMPT_RT``
@@ -190,6 +198,36 @@ See also Documentation/timers/no_hz.rst
 This option must be enabled, or the resulting kernel will not be fully
 preemptible and real-time capable.
 
+``CONFIG_RCU_NOCB_CPU``
+-------------------------
+
+:Expectation: allowed
+:Severity: *info*
+
+Enable support for offloading RCU callback invocation from selected CPUs
+to per-CPU ``rcuo`` kthreads.  The offload is selected with ``rcu_nocbs=``
+or implied by ``nohz_full=``; enabling this option alone does not change
+callback placement.  Use it when RCU callback processing causes jitter on
+CPUs dedicated to latency-sensitive tasks.  See
+Documentation/admin-guide/cpu-isolation.rst.
+
+``rcu_nocbs[=cpu-list]``
+  Offload RCU callback invocation from the listed CPUs to the
+  corresponding ``rcuo`` kthread, which can run on a housekeeping CPU.
+  This keeps callbacks from being invoked on the CPU that enqueued them.
+  On a non-real-time kernel this also moves invocation out of softirq
+  context; with PREEMPT_RT, callbacks already run in kthread context
+  because ``rcutree.use_softirq`` is false, and the offload only changes
+  the CPU they run on.  If omitted, no CPU is offloaded at boot; the mode
+  can still be toggled at runtime through cpusets.
+
+``rcu_nocb_poll``
+  Make the ``rcuo`` kthreads poll for callbacks instead of requiring the
+  offloaded CPUs to wake them.  This improves the real-time response at
+  the cost of higher power consumption, because the kthreads wake up
+  periodically to do the polling.  Consider this option only when wakeup
+  latency matters more than power.
+
 ``CONFIG_TRACING`` (and tracing options)
 ----------------------------------------
 
@@ -216,6 +254,96 @@ just by being enabled.
 These tracers do incur measurable latency overhead even when tracing is not
 currently active.
 
+.. _real_time_boot_parameters:
+
+Boot parameters and task isolation
+==================================
+
+Kernel configuration options alone do not determine a real-time system's
+worst-case latency.  Integrators commonly rely on boot parameters and
+runtime tunables as well, to keep kernel housekeeping work away from
+latency-sensitive tasks.  The parameters below complement the options
+described above.  Some of them correspond to a configuration option and
+are referenced from that option's section, so the configuration and
+runtime guidance stay together.  Each one is documented in detail in
+Documentation/admin-guide/kernel-parameters.rst; the notes here focus on
+the aspects that matter for real-time latency.  Consider these options
+only when the workload suffers from the corresponding interference;
+leave them disabled otherwise, as each of them trades flexibility or
+power for a lower worst-case latency.  The notes below follow the
+decisions an integrator has to make: whether to keep tasks off a CPU,
+whether to stop its tick, and where interrupts should run.  Idle state
+limits are discussed with ``CONFIG_CPU_IDLE`` above, and RCU callback
+offloading with ``CONFIG_RCU_NOCB_CPU`` above.
+For the full CPU isolation model and its limitations, see
+Documentation/admin-guide/cpu-isolation.rst.
+
+.. caution::
+
+  CPU isolation is best effort.  Work that is explicitly bound to an
+  isolated CPU, such as per-CPU kernel threads, bound workqueues, and
+  interrupts, may still run there unless it is steered away.  Measure
+  the resulting latency with tools such as ``osnoise``, ``timerlat``,
+  and ``rtla`` rather than assuming that an isolated CPU is free of
+  kernel noise.  See Documentation/timers/no_hz.rst and
+  Documentation/tools/rtla/index.rst.
+
+CPU isolation
+-------------
+
+``isolcpus=``
+  Format: ``[flag-list,]<cpu-list>``.  Isolates the listed CPUs from the
+  disturbances selected by the flag list (default: ``domain``):
+
+  ``domain``
+    Remove the CPUs from the scheduler domains.  This is the default
+    when no flag is given.  Domain isolation cannot be undone at
+    runtime; use cpusets when the isolated CPU set must change
+    dynamically.  Isolated CPUs remain usable through CPU affinity or
+    cpusets.  Unbound workqueues and unbound kernel threads are
+    confined to the housekeeping CPUs as a side effect.  Consider it
+    for CPUs dedicated to a latency-sensitive workload.
+
+  ``nohz``
+    Equivalent to ``nohz_full=``; see below.
+
+  A practical configuration therefore combines ``isolcpus=`` with
+  ``nohz_full=``, ``rcu_nocbs=``, an interrupt affinity mask, and, on
+  x86 systems, a C-state limit.
+
+  Timer placement follows the same choice.  By default a migratable
+  timer expires on the CPU that armed it; with ``nohz`` (or
+  ``nohz_full=``), timers and hrtimers armed on the isolated CPUs are
+  migrated to housekeeping CPUs.
+
+``nohz_full=``
+  Format: ``<cpu-list>``.  Requires ``CONFIG_NO_HZ_FULL=y``.  Stops the
+  scheduler tick on the listed CPUs whenever possible.  The boot CPU is
+  forced outside the range to maintain timekeeping, and the RCU
+  callbacks of the listed CPUs are offloaded as if they had been
+  passed to ``rcu_nocbs=``; see the ``CONFIG_RCU_NOCB_CPU`` section
+  above.  This parameter takes precedence over
+  ``CONFIG_RCU_NOCB_CPU_DEFAULT_ALL``.
+
+  The residual 1 Hz tick is offloaded to workqueues; the global
+  workqueue ``cpumask`` (/sys/devices/virtual/workqueue/cpumask) can
+  further restrict where unbound work runs.
+
+  The trade-off between tickless operation and the kernel-to-userspace
+  transition latency is described in the ``CONFIG_NO_HZ`` /
+  ``CONFIG_NO_HZ_FULL`` section above.
+
+Interrupt affinity
+------------------
+
+``irqaffinity=``
+  Format: ``<cpu-list>``.  Sets the default affinity mask for
+  interrupts that do not have an explicit affinity, steering them to
+  the housekeeping CPUs.  Managed interrupts are not affected by this
+  setting and cannot be redirected through ``/proc/irq/*``.  Verify
+  the resulting placement in ``/proc/interrupts``.  See
+  Documentation/core-api/irq/managed_irq.rst.
+
 Kernel Debug Options
 ====================
 
-- 
2.54.0

