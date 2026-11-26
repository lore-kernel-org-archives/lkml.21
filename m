Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795693280;
	b=tWe5KUEokGFUOnpeZRQYvpIa9O2iqUlrcxjSg4kswTQKvsUcNS0qakrY1+uW6ya5gdMt
	 Yz6//iPlTgO7ZNx1g3Gl7zOcygXItaihP33/KAMh073+yGpWu+APUWOFJsZKtxA0z843E
	 s/GQ7CG7vS42H/Q/5pK8For9xqL0eXFRH+gQUzOUSGdooa8Cj/Uc5mjuW/2XItdiwCP8z
	 TYb+PaVwwAAqcQhQm7mfidaLLINoGIpbQ9yMTjnZAyg8FqdpIB8LpLR03Tkz2wz4D1qx0
	 M9QO1B0qQJAI3fm2LZT1xqoE4OlkacMPERkVSC1mt0f2+Bs6V0qIWCiRykZxp1oX0Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QVx3Oeo8N0AOoMniqZXhHeEMYLd1GjRCRV6ihVkfiv0=;
	b=xFZ8abGAMATZbXiCSPDzIFrk+zjQpEh/56N/1NN+DTtPoqRuW59eqosFXOp56acWHerw
	 G3ecgMfBfh/B4uk6R3ZlVol3C7ieHanswrVATkS1zWWEbJsN+YxTZjIejjnwl3iff1UxU
	 wW5ViS41vKYzFu9lUWFjtTHptubHEKGBKVIs2JKAGWRR0sgfNUfnWVgidm5I9mqTFxFGt
	 OhpSJD+/zAZ9aG25s7T7TwupbktTG3ONY7MpQ5uU4V7xuLLcI1ZeafT7+BYaZtE8oeeSc
	 8ZkGEmMLJvtl3Hohy5D22Eu3XoSzPTJ2IJsMuB8wJ0L8rZHcYRfGrX87zHbmc3nFzDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Euf4Iu8W;
	arc=none smtp.remote-ip=74.125.227.135
Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84573606A327
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:41:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84573606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Euf4Iu8W
Received: by mail-pj2-f7.google.com with SMTP id d9443c01a7336-2f0c72f9a1fso16594005ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795693279; x=1796298079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QVx3Oeo8N0AOoMniqZXhHeEMYLd1GjRCRV6ihVkfiv0=;
        b=Euf4Iu8WIS3G+iEtmYu+j40U9iFSm5bjSV3/qgN2A/TAJeAB8P2mXKyzLOL4vZl/l+
         z/nuW8Z2iYIHJQkgQfrpeg+ZyZbWTikWNZI3VfvrkFnhCksOtBaambC+qOSqB4b4YcSG
         qEplSRFYd0R+1EmBHPntQ2m3ctO2MykInXWjvd3DYN3qdIMwt/GaoQ5f/sZyhNA44ts7
         DoM4ARBJOCw/bVZk2zZRyOEqBNgAz7zy4j/c1d0sGYT1EncfLUgAWBEfq5a8UsyeCtZ6
         2o9LVoOJogk1SzfhQ4PGWA4a5AlHPwUHeCm/wuUH9vryWwjv08+mwJ99fPRKIT1uWMn9
         1U/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693279; x=1796298079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QVx3Oeo8N0AOoMniqZXhHeEMYLd1GjRCRV6ihVkfiv0=;
        b=1BdeqD1JALgLJPRpNOrllHDpQALfjf0IgJFZhF3hDNMmYvz82fphYDbygPb5XHmEFn
         VM9htUhT9ILR5thEIJUMjYmMZhrDDeG5sxPfkcIIQbncr5Gs7Aph3uGO8tWqYOU+1u8T
         QzPlAlqaM960nBXk6oFkTTR6QEE+ArM5PKPR6fduc2hyr191N5pnq3itVO3QPM40CGE+
         GDWQ8B668nbeBgDjBGshpj891DmQohBX+xOFqTZg5zbRglS6bdRFgbLyDFJgUFshz1W/
         L9ko6OI/gSXjT6WyKAiX0d5q4T608QMt2aZCyG4tdUyUIhSwTysNiHaT3pAh8C+ooBT0
         B+8A==
X-Forwarded-Encrypted: i=1; AL+hErFjuZQOtB4ojocRa51anhCBwrg9AtZQFkTRIP2NOzqmh4SfZPQpYuZLgeNBt+/KS8h1MEFiOVA1ZflRBVY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rqb76rsOhfe8qxrfGe3B6+scR09esEqaILsaYwkJa/rokd2en
	WK5WVX2WQShlyP0ZgScUO8BYxZgpXsCxTAe6qbeSyAKbc/j+oVIcvMhA
X-Gm-Gg: AZFdTZeVb8CwTFhVDyXGu+8pHs8U3VuPQZFqegLiBMSLa1XQsML0jtAtVLn+DWkGMN1
	cYlAp+4LwXe0ceZoK2UOhFajNAeuheRgFEf7m9nIlfWZFNuDxjq74xrrhjy8N30UtlUJ649nrnH
	LDRKddKzFAAJqljDgOg7Qx7wy/N5cvIEZj8JzZpvScJ7LXq+kqPPrdBvAwhlMMGWHMs7ahfWdfs
	HW5bekVtxF2QLs8xFCanqOuQCxhxEzGLjGmXtDyjvjGWQOCQLmN2vmufGyfipv8la5IL0zanC4q
	AAvte38f73MbJ79bpshor/RTOsMQvkkRBS7GI2kYoCcOcxxnh4ZeLwtYSWuM/la3w42Fh1oXOkL
	dPI04C28dTkD5XItsdcJVfuDVOnUlhwIKBNMfV+FhvqB4O3v2znIcoTSFhw4JhknMpTHqCEGIMi
	Nj/Jb5RbGBiS9WI4MiGefQAjfjUB2Ama/+3zk5O6+7yhhwJFF0E1HtO8Z6AqmwflgbmM/D0ENN9
	QjUc+15TWmT9IfC2kuLRXVovrC9iPWVO/WyVe7E35NeqnUWc/F1m+vkqtfd98V6rmWagcVew96Z
	LKQ78ogVwfQTOy3uYQ2irWq3
X-Received: by 2002:a17:902:f708:b0:2e9:5772:9ab2 with SMTP id d9443c01a7336-2f03f24bf61mr202794925ad.41.1795693278532;
        Thu, 26 Nov 2026 03:41:18 -0800 (PST)
Received: from nixos ([2409:8a28:ae4:7f20:61d:93ac:f2c5:2564])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f08164dacbsm72896345ad.68.2026.11.26.03.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:41:17 -0800 (PST)
From: Zixin Wang <w1355457260@gmail.com>
To: linux-doc@vger.kernel.org
Cc: linux-rt-devel@lists.linux.dev,
	bigeasy@linutronix.de,
	frederic@kernel.org,
	darwi@linutronix.de,
	john.ogness@linutronix.de,
	clrkwllms@kernel.org,
	rostedt@goodmis.org,
	corbet@lwn.net,
	wagi@monom.org,
	atomlin@atomlin.com,
	linux-kernel@vger.kernel.org,
	Zixin Wang <w1355457260@gmail.com>
Subject: [PATCH v7] Documentation: real-time: Add runtime tuning guide
Date: Thu, 26 Nov 2026 11:41:02 +0000
Message-ID: <20261126114102.615558-1-w1355457260@gmail.com>
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

Runtime tuning options such as C-state limits, EFI runtime services,
CPU isolation, RCU callback offloading, and interrupt affinity are not
kernel configuration options.  Move them out of the configuration guide
into a separate real-time runtime tuning guide, so the configuration
guide stays focused on Kconfig options.

Keep the existing configuration section anchors in place and link to the
new guide from the relevant configuration options.  This preserves the
documentation links generated by kconfig-checker.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=220633
Link: https://github.com/elisa-tech/wg-aerospace/issues/222
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Zixin Wang <w1355457260@gmail.com>
---
v6 -> v7:
  - Point to Documentation/admin-guide/cpu-isolation.rst instead of
    duplicating its CPU isolation and interrupt affinity content.
  - Clarify rcu_nocb_poll: note that it removes the call_rcu() wakeup
    and shortens the IRQ-disabled critical section, but that jiffy
    polling can delay callback and grace-period processing.

Testing:
  make SPHINXDIRS="core-api" htmldocs and checkpatch.pl pass.

  kconfig-checker preempt_rt rules: all generated documentation links
  resolve to anchors in the built HTML.
---
 Documentation/core-api/real-time/index.rst    |   8 +-
 .../real-time/kernel-configuration.rst        |  44 +++---
 .../core-api/real-time/runtime-tuning.rst     | 140 ++++++++++++++++++++
 3 files changed, 167 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/core-api/real-time/runtime-tuning.rst

diff --git a/Documentation/core-api/real-time/index.rst b/Documentation/core-api/real-time/index.rst
index a17a3de..28b65cf 100644
--- a/Documentation/core-api/real-time/index.rst
+++ b/Documentation/core-api/real-time/index.rst
@@ -4,9 +4,10 @@
 Real-time preemption
 =====================
 
-This documentation is intended for Linux kernel developers and contributors
-interested in the inner workings of PREEMPT_RT. It explains key concepts and
-the required changes compared to a non-PREEMPT_RT configuration.
+This documentation is intended for Linux kernel developers, contributors, and
+system integrators interested in the inner workings of PREEMPT_RT. It explains
+key concepts and the required changes compared to a non-PREEMPT_RT
+configuration.
 
 .. toctree::
    :maxdepth: 2
@@ -16,3 +17,4 @@ the required changes compared to a non-PREEMPT_RT configuration.
    hardware
    architecture-porting
    kernel-configuration
+   runtime-tuning
diff --git a/Documentation/core-api/real-time/kernel-configuration.rst b/Documentation/core-api/real-time/kernel-configuration.rst
index d7f08e7..f26bd5a 100644
--- a/Documentation/core-api/real-time/kernel-configuration.rst
+++ b/Documentation/core-api/real-time/kernel-configuration.rst
@@ -13,6 +13,8 @@ Introduction
 
 This document lists the kernel configuration options that might affect a
 real-time kernel's worst-case latency.  It is intended for system integrators.
+Runtime tuning options are covered in
+Documentation/core-api/real-time/runtime-tuning.rst.
 
 Configuration options
 =====================
@@ -93,14 +95,9 @@ states.
 
 While disabling this option eliminates cpuidle-related latencies, doing so can
 significantly impact hardware longevity, warranty, and thermal behavior.
-Users should cap the maximum C-state to C1 instead.  For ACPI platforms, this
-can be achieved by using the boot parameter [1]_::
-
-  processor.max_cstate=1
-
-Higher C-states can be acceptable depending on the user workload's latency
-requirements.  For ACPI-based platforms, use the ``cpupower idle-info``
-command to inspect the available idle states.
+Users should cap the maximum C-state instead.  See
+:ref:`real_time_cpu_idle_limits` for the boot parameters that limit C-state
+depth.
 
 For more information, please see:
 
@@ -151,15 +148,8 @@ to perform a context switch.  This can cause significant latency spikes for
 the real-time system.
 
 ``CONFIG_PREEMPT_RT`` enables this option by default.  If this option is
-manually disabled at build time, the following boot parameter [1]_ may be used
-to disable EFI runtime at boot up::
-
-  efi=noruntime
-
-Alternatively, confine EFI runtime service calls to a housekeeping CPU by
-restricting the ``efi_runtime`` workqueue CPU affinity.  For example, set that
-workqueue's affinity to CPU #0 and pin your RT tasks to a different CPU range.
-See Documentation/core-api/workqueue.rst
+disabled at build time, EFI runtime services can still be disabled or confined
+at boot.  See :ref:`real_time_efi_runtime` for the runtime options.
 
 ``CONFIG_NO_HZ`` / ``CONFIG_NO_HZ_FULL``
 ----------------------------------------
@@ -179,6 +169,9 @@ the extra accounting and state book-keeping.
   ``NO_HZ_FULL`` may be beneficial.  In such cases, users should offload the
   kernel housekeeping to dedicated CPUs and isolate compute cores.
 
+See :ref:`real_time_cpu_isolation` for the boot parameters that control
+tickless operation and CPU isolation.
+
 See also Documentation/timers/no_hz.rst
 
 ``CONFIG_PREEMPT_RT``
@@ -190,6 +183,18 @@ See also Documentation/timers/no_hz.rst
 This option must be enabled, or the resulting kernel will not be fully
 preemptible and real-time capable.
 
+``CONFIG_RCU_NOCB_CPU``
+-------------------------
+
+:Expectation: allowed
+:Severity: *info*
+
+Enable support for offloading RCU callback invocation from selected CPUs
+to per-CPU ``rcuo`` kthreads.  Use it when RCU callback processing causes
+jitter on CPUs dedicated to latency-sensitive tasks.  See
+:ref:`real_time_rcu_offload` for the runtime parameters and
+Documentation/admin-guide/cpu-isolation.rst for the isolation model.
+
 ``CONFIG_TRACING`` (and tracing options)
 ----------------------------------------
 
@@ -300,8 +305,3 @@ establish and constrain the system's maximum latency.
 With that in mind, any incorrect real-time kernel configuration could cause a
 new maximum latency that shows up at the wrong time and is catastrophic for
 the real-time system's latency.
-
-References
-==========
-
-.. [1] See Documentation/admin-guide/kernel-parameters.rst
diff --git a/Documentation/core-api/real-time/runtime-tuning.rst b/Documentation/core-api/real-time/runtime-tuning.rst
new file mode 100644
index 0000000..6d6faaf
--- /dev/null
+++ b/Documentation/core-api/real-time/runtime-tuning.rst
@@ -0,0 +1,140 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _real_time_runtime_tuning:
+
+==============================
+Real-time runtime tuning
+==============================
+
+.. contents:: Table of Contents
+   :depth: 2
+   :local:
+
+Introduction
+============
+
+Kernel configuration options alone do not determine a real-time system's
+worst-case latency.  Integrators commonly rely on boot parameters and
+runtime tunables as well, to keep kernel housekeeping work away from
+latency-sensitive tasks.  This document describes those runtime options;
+the build-time options are covered in
+Documentation/core-api/real-time/kernel-configuration.rst.
+
+The parameters below complement the configuration options described in
+that document.  Some of them correspond to a configuration option; the
+configuration guide links to the relevant section here when necessary.
+Each parameter is documented in detail in
+Documentation/admin-guide/kernel-parameters.rst; the notes here focus on
+the aspects that matter for real-time latency.  Consider these options
+only when the workload suffers from the corresponding interference;
+leave them disabled otherwise, as each of them trades flexibility or
+power for a lower worst-case latency.
+
+The notes below cover CPU idle state limits, EFI runtime services, and
+RCU callback offloading.  CPU isolation and interrupt affinity are
+documented in Documentation/admin-guide/cpu-isolation.rst; this guide
+links to that document instead of duplicating its content.
+
+.. _real_time_cpu_idle_limits:
+
+CPU idle state limits
+=====================
+
+CPU idle states (C-states) allow the processor to enter low-power modes
+during periods of inactivity.  Very-low CPU idle states may require
+flushing the CPU caches and lowering or disabling the clocking.  This can
+lower power consumption, but it also increases the entry and exit latency
+from such states.
+
+While disabling ``CONFIG_CPU_IDLE`` eliminates cpuidle-related latencies,
+doing so can significantly impact hardware longevity, warranty, and
+thermal behavior.  Users should cap the maximum C-state to C1 instead.
+For ACPI platforms, this can be achieved by using the boot parameter::
+
+  processor.max_cstate=1
+
+On x86 systems using ``intel_idle``, the ``intel_idle.max_cstate=`` boot
+parameter sets the maximum C-state depth.  A value of 0 disables
+``intel_idle`` and falls back to ``acpi_idle``; it does not disable
+C-states.
+
+Higher C-states can be acceptable depending on the user workload's latency
+requirements.  For ACPI-based platforms, use the ``cpupower idle-info``
+command to inspect the available idle states.
+
+For more information, please see:
+
+- ``linux/tools/power/cpupower``
+- Documentation/admin-guide/pm/cpuidle.rst
+- Documentation/admin-guide/pm/index.rst
+
+.. _real_time_efi_runtime:
+
+EFI runtime services
+====================
+
+EFI is the standard boot and firmware interface for multiple architectures.
+EFI runtime services provide callback functions to be called from the kernel;
+e.g., as utilized by (``CONFIG_EFI_VARS*``) or (``CONFIG_RTC_DRV_EFI``).  For
+the former, the kernel calls into EFI to update the EFI variables.
+
+Calling into EFI means invoking firmware callbacks.  During such invocations,
+the system might not be able to react to interrupts and will thus not be able
+to perform a context switch.  This can cause significant latency spikes for
+the real-time system.
+
+``CONFIG_PREEMPT_RT`` enables ``CONFIG_EFI_DISABLE_RUNTIME`` by default.
+If that option is disabled at build time, the following boot parameter may
+be used to disable EFI runtime at boot up::
+
+  efi=noruntime
+
+Alternatively, confine EFI runtime service calls to a housekeeping CPU by
+restricting the ``efi_runtime`` workqueue CPU affinity.  For example, set that
+workqueue's affinity to CPU #0 and pin your RT tasks to a different CPU range.
+See Documentation/core-api/workqueue.rst.
+
+.. _real_time_cpu_isolation:
+
+CPU isolation
+=============
+
+CPU isolation and the parameters that control it, including
+``isolcpus=``, ``nohz_full=``, and ``irqaffinity=``, are documented in
+Documentation/admin-guide/cpu-isolation.rst.  That guide covers the
+housekeeping model, managed interrupts, and the limitations of CPU
+isolation; use it together with the build-time options in
+Documentation/core-api/real-time/kernel-configuration.rst.
+
+.. _real_time_rcu_offload:
+
+RCU callback offloading
+=======================
+
+``CONFIG_RCU_NOCB_CPU`` in
+Documentation/core-api/real-time/kernel-configuration.rst enables support
+for offloading RCU callback invocation from selected CPUs to per-CPU
+``rcuo`` kthreads.  The offload is selected with ``rcu_nocbs=``, implied
+by ``nohz_full=``, or enabled for all CPUs by
+``CONFIG_RCU_NOCB_CPU_DEFAULT_ALL`` when neither parameter is given.
+
+``rcu_nocbs[=cpu-list]``
+  Offload RCU callback invocation from the listed CPUs to the
+  corresponding ``rcuo`` kthread, which can run on a housekeeping CPU.
+  This reduces callback-processing jitter on the CPU that enqueued them.
+  On a non-real-time kernel this also moves invocation out of softirq
+  context; with PREEMPT_RT, callbacks already run in kthread context
+  because ``rcutree.use_softirq`` is false, and the offload only changes
+  where they run.  If the parameter is given without a CPU list, no CPU
+  is offloaded at boot; the mode can still be toggled at runtime through
+  cpusets.  The parameter takes precedence over
+  ``CONFIG_RCU_NOCB_CPU_DEFAULT_ALL``.
+
+``rcu_nocb_poll``
+  Make the ``rcuo`` kthreads poll for callbacks instead of requiring the
+  offloaded CPUs to wake them.  This removes the wakeup from ``call_rcu()``
+  when the callback list was empty, shortening the time spent in its
+  IRQ-disabled critical section; the benefit is likely small except on
+  small systems.  However, the kthreads poll every jiffy, so callback and
+  grace-period processing can be delayed by up to one jiffy, and polling
+  also increases power consumption.
-- 
2.54.0

