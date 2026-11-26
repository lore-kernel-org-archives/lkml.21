Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710285;
	b=b4c6tkbkiOtx2eZ+sO/4yHsZ2xdGdeq/jsv7wAvoyKckWLOrg39vqu9Ab7vWWNJBlvX/
	 MZZ2pFFkRZTpl/3XIyvLAk3lUKMaIB6HTQX9x8lokYN7Umf/8VqEf5Ws+7GC2ZemYPlH2
	 cSPGJzss7SKVICfpwB+TCPPP3ci++o0QTNg2M4kuD3qrv1AREk9dtyf0Y2Q1A9NwUUBUW
	 piDyrGwGgqWt5WsfslYQQxWyL/IVokMxhupFvVfmfPjVWhqvGD2WOX6kbJEOwMfriBw63
	 LyYk773YoEexSxgSSTXjps1/fZI5RwU9n6J2uHSABVEA6WDPanpfX9PB01Icslxm6VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710285;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject;
	bh=3rYeDp/6LJSlngSpnPXF45qYNPM/FT8fl+/qpQlg318=;
	b=D70cuUaHx3j1dMlEAMQFisF8Kq77ydrUroQtB54TPPKANVGBRbPBI+rzx9eNSMxt3WOd
	 fNAq/KCOszXbNiwaNAosxbiJkv5n4PfYuXsYWuvxsrQwAtntRO69nwT5sTjwz3IV4Y9na
	 7+4LmBdEMyEzi3GVaX/UervR2Sk3Gp/ClJRgB9J5jj1VdhFEmUwCulxFA5pLAf8QiWcVK
	 C/f2mMVQNBl+zwjeYBuWpwTc3g0WJgeTbTDSTdmGRDGvhSoAM4CAS07kxWeTQmkAYC5wQ
	 6XooTLZJU+mEFygHlegKv/GoxcPYTchLsr8UV9XrHKUUqH7a89ozYdTjXpuG9W/NBPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NJIhSDzI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68454606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NJIhSDzI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFFA51F000EF;
	Thu, 26 Nov 2026 16:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795710284;
	bh=3rYeDp/6LJSlngSpnPXF45qYNPM/FT8fl+/qpQlg318=;
	h=Date:From:To:Cc:Subject;
	b=NJIhSDzIoEM4E3KTOAMzinAWkTTZI5uR4cFjS/J9UnkP/vDg6Fj4b8GKh1TlLZjhK
	 +Zv6Yb1Vjyd96Pdrn/b0vkxFUMZWzrdSMEXXDxayRcYeNdrmibNTzoCfgbQ2YPQzE4
	 9wgd0+NxFlDroQlRASjGmR7QaH5vd70UCZxZCPtoIoAJo7EvQJbFlmuIq86lL4A2nP
	 n7y2+B2drKyDT+Moitwn0M31eoy8Lf/QOZH/9PFOMnYSVCnI/BdaXybqVMLSEyvS8q
	 jXHa/wlkS7keQKjMavnZ/cS8+hwGl3pmD73TwOT3dbTTEtP0vDowIctGb7CHpU7CSk
	 EuYQ5H9/AV0fg==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xWcH5-00000007bil-47bw;
	Thu, 26 Nov 2026 11:24:43 -0500
Message-ID: <20261126162423.442922469@kernel.org>
User-Agent: quilt/0.69
Date: Thu, 26 Nov 2026 11:24:23 -0500
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-next][PATCH 00/15] tracing: Updates for 7.5
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace/for-next

Head SHA1: 1e443753bfddcd9d34bfb672be26245c4deca2d0


Cao Ruichuang (1):
      tracing: Export live module tracepoint strings in printk_formats

Leizhen Zhang (2):
      tracing/scripts: Check the section end before reading a string in tracing-update
      tracing/scripts: Do not reuse section pointers from a previous file in tracing-update

Masami Hiramatsu (Google) (8):
      tracing: Override the same name trace_instance= by latter one
      selftests/ftrace: Add test case for overriding trace_instance parameter
      tracing/filters: Report parse error on all -EINVAL paths in filter parsing
      tracing/filters: Fix quoted operand parsing in function event filter
      tracing/filters: Reject empty unquoted operand in function event filter
      tracing/filters: Reject unsupported field sizes in parse_pred()
      tracing/filters: Check for trailing characters after newline in filter string
      tracing/filters: Reject stray quotes and parentheses in unquoted function event operand

Steven Rostedt (4):
      tracing: Do not clean up hiter in mmiotrace read function
      lockdep: Add #include <linux/instruction_pointer.h> to lockdep.h
      tracing: Move non-trace_printk prototypes into trace_controls.h
      tracing: Remove trace_printk.h from kernel.h

----
 Documentation/admin-guide/kernel-parameters.txt    |   7 +
 Documentation/trace/debugging.rst                  |  15 +++
 arch/powerpc/kvm/book3s_xics.c                     |   1 +
 arch/powerpc/xmon/xmon.c                           |   1 +
 arch/s390/kernel/ipl.c                             |   1 +
 arch/s390/kernel/machine_kexec.c                   |   1 +
 drivers/gpu/drm/i915/gt/intel_gtt.h                |   1 +
 drivers/gpu/drm/i915/i915_gem.h                    |   2 +
 drivers/hwtracing/stm/dummy_stm.c                  |   1 +
 drivers/infiniband/hw/hfi1/trace_dbg.h             |   1 +
 drivers/tty/sysrq.c                                |   1 +
 drivers/usb/early/xhci-dbc.c                       |   1 +
 fs/ext4/inline.c                                   |   1 +
 include/linux/ftrace.h                             |   2 +
 include/linux/kernel.h                             |   1 -
 include/linux/lockdep.h                            |   1 +
 include/linux/module.h                             |   2 +
 include/linux/sunrpc/debug.h                       |   1 +
 include/linux/trace_controls.h                     |  54 ++++++++
 include/linux/trace_printk.h                       |  56 +-------
 include/linux/tracepoint.h                         |   9 +-
 include/trace/trace_events.h                       |   2 +
 kernel/debug/debug_core.c                          |   1 +
 kernel/module/main.c                               |   4 +
 kernel/panic.c                                     |   1 +
 kernel/rcu/rcu.h                                   |   1 +
 kernel/rcu/rcutorture.c                            |   1 +
 kernel/trace/ring_buffer_benchmark.c               |   1 +
 kernel/trace/trace.c                               | 150 ++++++++++++++++-----
 kernel/trace/trace.h                               |   1 +
 kernel/trace/trace_benchmark.c                     |   1 +
 kernel/trace/trace_events_filter.c                 |  94 +++++++++++--
 kernel/trace/trace_mmiotrace.c                     |  14 +-
 kernel/trace/trace_printk.c                        | 111 +++++++++++++--
 lib/sys_info.c                                     |   1 +
 samples/fprobe/fprobe_example.c                    |   1 +
 samples/ftrace/ftrace-direct-too.c                 |   1 -
 samples/trace_events/trace-events-sample.c         |   3 +
 samples/trace_events/trace-events-sample.h         |  17 +++
 samples/trace_printk/trace-printk.c                |   1 +
 scripts/tracepoint-update.c                        |   6 +-
 .../cmdline-07-trace-instance-override.bconf       |   4 +
 .../cmdline-07-trace-instance-override.cmdline     |   1 +
 .../selftests/ftrace/boottime/run_boottime_test.sh |   2 +
 .../tests/cmdline-07-trace-instance-override.sh    | 148 ++++++++++++++++++++
 .../ftrace/test.d/event/tracepoint_string.tc       |  47 +++++++
 46 files changed, 642 insertions(+), 132 deletions(-)
 create mode 100644 include/linux/trace_controls.h
 create mode 100644 tools/testing/selftests/ftrace/boottime/bootconfigs/cmdline-07-trace-instance-override.bconf
 create mode 100644 tools/testing/selftests/ftrace/boottime/cmdlines/cmdline-07-trace-instance-override.cmdline
 create mode 100755 tools/testing/selftests/ftrace/boottime/tests/cmdline-07-trace-instance-override.sh
 create mode 100644 tools/testing/selftests/ftrace/test.d/event/tracepoint_string.tc
