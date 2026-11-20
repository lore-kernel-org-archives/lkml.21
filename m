Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.201
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795153375;
	b=33tn7rUOVJ/O+HORf2onQ6lx3SFm/z7U+LfBpveYk9FPhMAWSAXOILDSn+xLbUk7Nk5W
	 z84ucURBK1NnPTDFHa+vrrNVCjKt9fspF4OF6L2yEWs2twntM2xCtedXFGhGCZwuAidcr
	 PBWMP2QFqZkszDgypEpaopKVhKhwMCBktVGf4o/V1/Ohub4AedEo/p23YZN6PRH1mlVMZ
	 8+08xFhYWZBWmEqmdP1Zr8269XYufJTO5qnNZz9bdRfGK8ZxN0EwgL7eCwEB07C6yqIRw
	 GHWyaqqrzWqLD3TESSv36yeJ06wLlOyCDpTc7pEWeZmy6DI4aGzAoMH++UkY1tERdfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795153375;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PRVj0Zfy4s8iK7gSS3v+F/enDQYd0fmloOn08T3wYJ4=;
	b=L+r0baMXMu+u9efQp42eec83EgcTDIUZEKSn6/25mCkX8wW0JE5VZJpzUYpu6I0Z7azf
	 nj7STSB51OBdVM9zWrwhtsRhUA+MOyJ2jm16sUyTiGmnxAp9iy21GK0Ftsz14l/wy5mI3
	 7d+TN+9YtkGnugJZT14bAEtegib5GbGdZCI5gW2rUaS7r/5cCR2Ljp8P6BXPtg0y3fJk5
	 trnzDjjwXFhyQH064ftEJ8EvDob0690BUm9MSisbSz0qr3eaRVteFNeDgc341TzLgJAd3
	 Tpg73owLSVpvDTOj2eLlNw6qIhDcyJOKdK5NPNYlDCjGW/gqs30P/O9kUOXbF5NqpkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="etM/skYz";
	arc=none smtp.remote-ip=74.125.227.201
Received: from mail-pi2-f9.google.com (mail-pi2-f9.google.com [74.125.227.201])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A353606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:42:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A353606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=etM/skYz
Received: by mail-pi2-f9.google.com with SMTP id 41be03b00d2f7-cdd769c49dbso289402a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795153374; x=1795758174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PRVj0Zfy4s8iK7gSS3v+F/enDQYd0fmloOn08T3wYJ4=;
        b=etM/skYzKjs5M/e/uems6vBmv5ADfKYV9vUMgCF9AsG7B+KcQyzpnjLBLqfw/z1CsU
         BBpoCxAT1815yhpNltljXnUNwgtzL1MihzIZkecICfbYi2LXLmAD5A97baWL/oOMiCiw
         Il/3JaMO7O1NpggXTTNWf8ERvcDHenwWiyvd5uVh6av8wd5AeJgMZh2kMhk27Z/fw/rv
         1T+VOxnUvioKJSZDA0XcstkXVD4du2EkwE+07tHyhgvmMPImsf6w3ROQjRM4kmn722Hz
         qEYf+Mdq3O8XU9/gwSsNKjOcIIKS2QyWOsHa7UIgbGrRQB0SfrJOXXiMPPgNXyvnPM16
         Xg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795153374; x=1795758174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PRVj0Zfy4s8iK7gSS3v+F/enDQYd0fmloOn08T3wYJ4=;
        b=SWYBNp2OZM/fFkBaV0A8c89uMk5WWh2hXJr/sypFhhBWgqviYiSrwmDOT7Dic8i3jb
         70fMYfih/13BxW19ELu/IR8YyD02rStM52g7Xz5DSKGs1c6eXm9EjMahFs7opv1oW3Gv
         CiQ/tK75vbICio+hRhroLQH2a6mwh1wZGZp8julv1dyTDcpqMeyGPHUsLgArY8FJ5XNs
         SViRM9iGetHPEWEZNwnfg2E8Ojm/Bl3MuWlJwecVCf8uCA/G0NBytwAcOaF2aQwZK35q
         2OK2jDPSl9WOACfzotI4/f0trmGL7SQWw2xiBJe9Gzq+SWbBh40jrSHqE6RweZgWMILn
         A1hg==
X-Forwarded-Encrypted: i=1; AL+hErHnub4XJM+0NjXq6HhprrB+bBqjFhKrbIPpHvDvZmTS2gQMFsAA8FWmdkarqSy6VzWpqPZ8YzwU9jmetGQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rbca2L/nXT0WxyOgnZTk29mdAi8pMT9hAdPiwv3iZmWRHGokQ
	2k+8u1BFJYCKjlsDMIUnv3lIpDpg7LrwvrlaRHfawUHLJBuYJO9lTC5n
X-Gm-Gg: AYBFou2CHNJOqR5qpmGI+rhfwKdZ6/R2b97XaT+0YQ/Vi4pks7NLOMC3UKRq5B5Xi8I
	JeeUGn66LYXccLpZpyhoeKbkBiVcT/11t9xWZ5ZFW0NkdgARcakgjz/txc76lFkZ+Yj5wHRxgQi
	a9VW0eqFqs5+X6xjTwAp38ZS2ZoOF4LZI2BjnAzn3z3HwvwNS9kL4z+s+oauEi8dWOXB12jaFuL
	UDxTCjHhdu1VEyIrOMBi5//3Mzxs898max0Dd+UCEWDnNMhz8c8iWzUpKse2KrH5iibM62xV0YL
	K85d2jLZg7mMgazymNJbUAKgtOGH735QHePG7vrTJHICYX4pzCghdnInCex+dZx+HaPAoXb9lFb
	Cq4lj40jTuxyPi00BFTM7vF37o/BzxLrjo0M5BH/ysg8DZA5R6tO23thaQqOYpPEbj9ibfg1CGn
	v22bxvxDjoWbJEjLbMqQSba6RQugUCUDz1pFlj4XpoN6P226YMEnhWBOSOfpo6dZz/CPrdrGaZl
	qbO1MlNmLpZBGy6K8rMiG5XZU7kBRkdIAmZ82oa8TQpB/5PVuC5sKuPU8aMzHlMDPFk6VM286Nj
	tK8qmgwvX0asrZCS7mw41p+z
X-Received: by 2002:a05:6a20:c887:b0:3ff:f20b:d2ec with SMTP id adf61e73a8af0-4014dd66078mr2060410637.52.1795153373567;
        Thu, 19 Nov 2026 21:42:53 -0800 (PST)
Received: from nixos ([2409:8a28:ae4:7f20:fd8b:76d8:48d:6284])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c219sm947000b3a.18.2026.11.19.21.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 21:42:53 -0800 (PST)
From: Zixin Wang <w1355457260@gmail.com>
To: linux-doc@vger.kernel.org
Cc: linux-rt-devel@lists.linux.dev,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	rostedt@goodmis.org,
	corbet@lwn.net,
	linux-kernel@vger.kernel.org,
	Zixin Wang <w1355457260@gmail.com>
Subject: [PATCH] Documentation: real-time: Add boot parameters and task isolation section
Date: Fri, 20 Nov 2026 13:42:42 +0800
Message-ID: <20261120054242.523606-1-w1355457260@gmail.com>
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
affinity, idle states, and real-time throttling, with references to
the relevant documentation.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=220633
Link: https://github.com/elisa-tech/wg-aerospace/issues/222
Signed-off-by: Zixin Wang <w1355457260@gmail.com>
---
 .../real-time/kernel-configuration.rst        | 134 ++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/Documentation/core-api/real-time/kernel-configuration.rst b/Documentation/core-api/real-time/kernel-configuration.rst
index d7f08e7b..65532496 100644
--- a/Documentation/core-api/real-time/kernel-configuration.rst
+++ b/Documentation/core-api/real-time/kernel-configuration.rst
@@ -216,6 +216,140 @@ just by being enabled.
 These tracers do incur measurable latency overhead even when tracing is not
 currently active.
 
+Boot parameters and task isolation
+==================================
+
+Kernel configuration options alone do not determine a real-time system's
+worst-case latency.  Integrators commonly rely on boot parameters and
+runtime tunables as well, to keep kernel housekeeping work away from
+latency-sensitive tasks.  The parameters below complement the options
+described above.  Each one is documented in detail in
+Documentation/admin-guide/kernel-parameters.rst; the notes here focus on
+the aspects that matter for real-time latency.  For the full CPU
+isolation model and its limitations, see
+Documentation/admin-guide/cpu-isolation.rst.
+
+.. caution::
+
+  CPU isolation is best effort.  Unbound workqueues, kernel threads,
+  timers, and interrupts may still run on isolated CPUs unless they are
+  explicitly steered away.  Measure the resulting latency with tools
+  such as ``osnoise``, ``timerlat``, and ``rtla`` rather than assuming
+  that an isolated CPU is free of kernel noise.  See
+  Documentation/timers/no_hz.rst and Documentation/tools/rtla/index.rst.
+
+CPU isolation
+-------------
+
+``isolcpus=``
+  Format: ``[flag-list,]<cpu-list>``.  Removes the listed CPUs from the
+  scheduler's general load balancing so that runnable tasks are not
+  placed there automatically.  The optional flag list selects the type
+  of isolation:
+
+  ``domain``
+    Remove the CPUs from the scheduler domains.  This is the default
+    when no flag is given.  Domain isolation cannot be undone at
+    runtime; use cpusets when the isolated CPU set must change
+    dynamically.  Isolated CPUs remain usable through CPU affinity or
+    cpusets.
+
+  ``nohz``
+    Stop the tick when a single task runs and offload kernel noise,
+    including RCU callbacks.  This is equivalent to ``nohz_full=``.
+    The residual 1 Hz tick is offloaded to workqueues, which must be
+    affined to housekeeping CPUs through the global workqueue
+    ``cpumask``; by default that workqueue may run on any CPU.
+
+  ``managed_irq``
+    Prevent managed interrupts from being targeted at isolated CPUs
+    when their automatically computed affinity mask also contains
+    housekeeping CPUs.  This is best effort and has no effect when the
+    mask contains isolated CPUs only.  See
+    Documentation/core-api/irq/managed_irq.rst.
+
+  ``isolcpus=`` only influences task placement.  It does not stop
+  kernel threads, timers, or interrupts that are already affined to
+  the isolated CPUs.  A practical configuration therefore combines it
+  with ``nohz_full=``, ``rcu_nocbs=``, an interrupt affinity mask, and
+  a C-state limit.
+
+``nohz_full=``
+  Format: ``<cpu-list>``.  Requires ``CONFIG_NO_HZ_FULL=y``.  Stops the
+  scheduler tick on the listed CPUs whenever possible.  The boot CPU is
+  forced outside the range to maintain timekeeping, and the RCU
+  callbacks of the listed CPUs are offloaded as if they had been
+  passed to ``rcu_nocbs=``.  This parameter takes precedence over
+  ``CONFIG_RCU_NOCB_CPU_DEFAULT_ALL``.
+
+  Tickless operation can increase the kernel-to-userspace transition
+  latency, so it is most useful for workloads that execute in
+  userspace for long periods with few syscalls.  Periodic workloads
+  with short periods may prefer a consistent tick instead.
+
+RCU callback offloading
+-----------------------
+
+``rcu_nocbs[=cpu-list]``
+  In kernels built with ``CONFIG_RCU_NOCB_CPU=y``, move RCU callback
+  invocation for the listed CPUs out of softirq context and into
+  per-CPU ``rcuo`` kthreads.  This reduces OS jitter on the offloaded
+  CPUs.  If the argument is omitted, no CPU is offloaded at boot, but
+  the mode can be toggled at runtime through cpusets.  ``nohz_full=``
+  implies the same offload for the CPUs it lists.
+
+``rcu_nocb_poll``
+  Make the ``rcuo`` kthreads poll for callbacks instead of requiring
+  the offloaded CPUs to wake them.  This improves the real-time
+  response at the cost of higher power consumption, because the
+  kthreads wake up periodically to do the polling.
+
+Interrupt affinity
+------------------
+
+``irqaffinity=``
+  Format: ``<cpu-list>``.  Sets the default affinity mask for
+  interrupts that do not have an explicit affinity.  Managed
+  interrupts, such as MSI-X queue interrupts, derive their affinity
+  from the device queue mask instead and cannot be changed through
+  ``/proc/irq/*``.  Combine ``irqaffinity=`` with the ``managed_irq``
+  flag of ``isolcpus=`` to keep interrupts away from isolated CPUs
+  where possible.  See Documentation/core-api/irq/managed_irq.rst.
+
+Idle state limits
+-----------------
+
+``processor.max_cstate=``
+  ACPI platforms only.  Limits the deepest C-state the processor may
+  enter.  ``processor.max_cstate=1`` caps the processor at C1 and
+  avoids the entry and exit latency, cache flushing, and clock effects
+  of deeper states.  A value of 9 overrides any DMI blacklist limit.
+
+``intel_idle.max_cstate=``
+  x86 platforms using ``intel_idle`` only.  A value between 1 and 9
+  specifies the maximum C-state depth.  A value of 0 disables
+  ``intel_idle`` and falls back to ``acpi_idle``; it does not disable
+  C-states.
+
+Deeper C-states save power but increase wakeup latency.  Choose the
+shallowest state that still meets the platform's power and thermal
+requirements, and validate the result with the tools listed above.
+
+Real-time throttling
+--------------------
+
+``kernel.sched_rt_runtime_us``
+  This sysctl, normally set at boot through a ``sysctl.d``
+  configuration file, limits the CPU time available to real-time
+  scheduling during ``kernel.sched_rt_period_us``.  The default of
+  950000 us per 1000000 us reserves 5% of the CPU for non-real-time
+  tasks.  A value of -1 removes the limit, allowing real-time tasks to
+  use the full period; do this only after validating the workload,
+  because a runaway real-time task can then starve the rest of the
+  system.  Recent kernels require the runtime/period ratio to stay
+  above 0.05 to preserve bandwidth for the fair deadline server.  See
+  Documentation/scheduler/sched-rt-group.rst.
+
 Kernel Debug Options
 ====================
 
-- 
2.54.0

