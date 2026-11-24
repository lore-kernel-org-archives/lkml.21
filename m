Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534158;
	b=YmPY+Gblcmh60LdtzGq20S1DAo7W45YWhqOaXiOyXC6H0A/flhqW40xI4mZGsRVVa0Eh
	 2hEzkZBX0fk8qF7eHSdtqPv6cEiFYnLvBtRY7WkMyGlJJQhgGdKhmv4Ru0+xvxyJMVJM8
	 d79GzAM+ML58bRGAbI8nxz54cE8Xbv1zr7lLmEJs+Dbng3jMfnsKSp6123v+7qr43/+QM
	 JgRXTCfG+EWtSoskHpyr82IBQLvolSrokHFVBYFHYBLbZwq069deDWctD7Sudnl3BR/I5
	 E6rNwTOM7Whvva1YPAVNU6EGudgifcVeSyNcI0hzyDJqb6/QKAaZUhxgJ9O3AkJIWEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534158;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=4fQfcWO1DwIvGopLvljO9qUxODP+jJmFrflLF71ZJT8=;
	b=oOA5eKV4a7WjhbFOYFWfd7XUdypyvk+mrV+vRdmJzIn1PsQWIxMTdkrQckvFqh8zumpy
	 fSNCyYNxSgqY1p9+R2sK2hv9SvfKyVk3WVkFl71lQSEkSl8rsR/5b7fIK4oCYVhCBSWeo
	 rd8bZVdKL51QBqc1FRdW0iuexrNxeOLEvazVpdihDBpCrgE68f6GDPBvfhW7IXVqQCTwf
	 Nf8vgoPbQiUfkVJy/o2hHpwnlaZreqSYUjrnMTI5a6UY+kVKfW3aIZ5+kR1unL8jwCB5U
	 kCJi8BG69Zyn1qz970OfuFzTx9DKS3rZS0+B987PsUAQN2UOHas2KYyqUC+YpqlGIFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QpYV7ZVM;
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFCA606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:29:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BFCA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QpYV7ZVM
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4a3705ea6ccso2555732f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795534156; x=1796138956; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4fQfcWO1DwIvGopLvljO9qUxODP+jJmFrflLF71ZJT8=;
        b=QpYV7ZVMcEFzyfDamA9sD3AnkKvKK/YCVSmvzhL7I+BeMoNvidWNwetFud5IeLhePp
         gkBO76Jg1jK1/hkl4Vt0s4BhucNby0GMCwIT4cd3by8iDwLoteHnCjBX4UJdHbpkC+sI
         6VNOHGO0VJR7E5hA3UMofRJiH1lCDdnqFH5o/a0Vbk4N5jE73OiWSDUXz25thjn5B4VI
         FzrOdOQ2jVQjCZIYqRbF9S2iDscSCrLvO1LtYQXk1tmekCbB35R0G/vFl6s3vS4N3Kx7
         08feGZ7SDJZyeDhkVbLHrDB/L2i6X18YRwqjofLPicEV5WAy2RGGA6hZI4hmp6hEX8LK
         96tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795534156; x=1796138956;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4fQfcWO1DwIvGopLvljO9qUxODP+jJmFrflLF71ZJT8=;
        b=Eofh61sGfa/B3r06onAmEkhMmX4h4Q0DQcrC4eP5B/I4E6ECqKr2ab7sNurxDx7G0B
         uwBs1liUOwqlI0zQXRLtOfm7VAQwnrCAzbFegUF82SrJzx4hdL09ElecGlmUQAwBKYVo
         RLYOQjdIZee1xg5XrAnsiPPI4OF8b5W8dTIwZQpZRKOeNOH1tf1UOJFdUJt3aI+6Od8n
         YKVkZuyh9hYDeU4j76FRcnkJMs3xSaGGMgBlD3w3scvluSzU647WvpeWtxuelfLCVn76
         /wGxpIG0Cs32V58eqNgtI2qO7iyZYuR9jh3ORTzDZjhLs2aGIjJROoZ3bR8e8Z+mSDBA
         jA4g==
X-Forwarded-Encrypted: i=1; AL+hErHgfmyVFkXYjssZPIE9y07fjDd07fKKAQmgbgjBlX2BmqM4ked949kSQlFi14PJ0349BVfZUbXhnY1zQCc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3tqMHbEFYr/z5eb+4RpP7boiMXewp3fLdaoWSledHvOD+kBBj
	kReeo6CYOnS7+ujIFPvbz4NDq12KLihFal+e/6nk7qB/8HhGJQmhPuGnLYsCbBqTiKcRInSjO9F
	3BKF8tXL8aPUYT9cJlqRndQ==
X-Received: from wrrx9.prod.google.com ([2002:a5d:4449:0:b0:495:fb6d:33f2])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4a07:b0:4a7:14d0:9c4c with SMTP id ffacd0b85a97d-4abab02c4femr28321409f8f.6.1795534155520;
 Tue, 24 Nov 2026 07:29:15 -0800 (PST)
Date: Tue, 24 Nov 2026 15:28:24 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261124152845.2233401-1-vdonnefort@google.com>
Subject: [PATCH v9 00/21] tracing/remotes: Add printk, dump_on_panic and boot parameters
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

This series extends the recently introduced trace remotes
infrastructure, bringing useful features for developers:

  * dump_on_panic: Dump the trace remote buffer on system panic.
  * dmesg: Redirect remote events to dmesg.
  * trace_remote=: Configure a trace_remote from the commandline.
  * poll_ms: Modify the polling period.

It also brings a couple of optimisations:

  * In-header compressed length support for small events.
  * Single work thread for remote polling.

And some misc improvements:

  * Use kstrtobool where possible
  * Free resources on remote registration failure

Changelog:

v9:

  * Check IS_ERR_OR_NULL() for eventfs_create_events_dir() in trace_remote_init_eventfs(). (Sashiko)
  * Avoid reading back rb_event->type_len in simple_ring_buffer_reserve(). (Sashiko)
  * Pin write_event loop to a single CPU and handle CONFIG_PRINTK_CALLER in dmesg.tc. (Sashiko)
  * Replace __free(kfree) with explicit kfree() in trace_remote_apply_cmdline(). (Sashiko)
  * Rebase on 7.4-rc4

v8 (https://lore.kernel.org/all/20261106180657.2460376-1-vdonnefort@google.com/):

  * Use trylock in rb_reader_lock() when panic_on_this_cpu(). (Sashiko)
  * Drop ring_buffer_read_remote_meta_page() and use ring_buffer_capacity() in trace_remote_has_cpu().
  * Avoid mixing __free(kfree) with goto in trace_remote_iter(). (Sashiko)
  * Cancel and reschedule poll_work on poll_ms update. (Sashiko)
  * Validate buf_size and use WRITE_ONCE() for poll_ms in cmdline parsing. (Sashiko)
  * Rebase on 7.4-rc1

v7 (https://lore.kernel.org/all/20260924145754.1285146-1-vdonnefort@google.com/):

  * Check for printk timestamps in dmesg selftest. (Sashiko)
  * Touch NMI watchdog in the panic dump loop. (Sashiko)
  * Add READ_ONCE()/WRITE_ONCE() for panic_on. (Sashiko)
  * Defer dmesg and tracing enabling after all cmdline options are parsed. (Sashiko)
  * Guard sysrq panic trigger in dump_on_panic.tc with TRIGGER_PANIC env variable. (Sashiko)
  * Rebase on 7.3-rc4

v6 (https://lore.kernel.org/all/20260817135517.3919534-1-vdonnefort@google.com/):

  * Replace WARN_ON with pr_warn for buf_size in cmdline parsing. (Sashiko)
  * Add READ_ONCE()/WRITE_ONCE() for poll_ms (Sashiko)
  * Add support for HAVE_64BIT_ALIGNED_ACCESS arch is set in simple_ring_buffer. (Sashiko)
  * Add selftest tracefs file requirements, TMPDIR leak, and awk regex. (Sashiko)
  * Rebase on 7.2

v5 (https://lore.kernel.org/all/20260812161340.2417322-1-vdonnefort@google.com/):

  * Use seq_buf_str() for safe, properly terminated trace_seq extraction. (Steven)
  * Remove destructive dmesg -c from selftests and rely on timestamp matching instead. (Steven)
  * Allow several trace_remote=XXX cmdline options.
  * Rebase on 7.2-rc7

v4 (https://lore.kernel.org/all/20260804140333.797210-1-vdonnefort@google.com/):

  * Rebase on 7.2-rc6
  * Use trace_append_boot_param() to parse cmdline options.
  * Fix trace_remote_iterator cleanup order for non-consuming iterators
    (Sashiko).

v3 (https://lore.kernel.org/all/20260721103603.342266-1-vdonnefort@google.com/):

  * Make sure dmesg and panic handlers are using null-terminated
    trace_seq.
  * Make struct trace_remote more compact
  * Fix dump_on_panic test unloaded case (Sashiko)
  * Rebase on 7.2-rc4

v2 (https://lore.kernel.org/all/20260605163825.1762953-1-vdonnefort@google.com/):

Sashiko had a few spot-on comments on the v1 which forced me to heavily
re-arrange the series, so I thought it'd be alright to send a v2
already including those changes.

  * dump_on_oops -> dump_on_panic
  * printk -> dmesg
  * Allow to configure poll_ms
  * Make the ring_buffer_iter functions panic-friendly
  * Gate tracefs .open on remote registration (Sashiko)
  * Use irqsave for reader lock (Sashiko)
  * Fix iter locking for TRI_DMESG (Sashiko)
  * Yield in the dmesg work (Sashiko)

v1 (https://lore.kernel.org/all/20260602171146.2238998-1-vdonnefort@google.com/)

Vincent Donnefort (21):
  tracing/remotes: Gate tracefs files opening on trace remote
    registration
  tracing/remotes: Release tracefs,eventfs on registration failure
  tracing/remotes: Use kstrtobool for boolean tracefs files
  tracing/remotes: Initialise pos in trace_start()
  tracing/remotes: Annotate remote shared fields with
    READ_ONCE/WRITE_ONCE
  tracing/remotes: Use a single per-remote polling work
  tracing/simple_ring_buffer: Add support for compressed length
  tracing/remotes: Add dmesg tracefs file
  tracing/remotes: selftests: Add a test for the dmesg tracefs file
  tracing/remotes: selftests: Prefix hypervisor folder
  ring-buffer: Use irqsave for the reader lock in
    ring_buffer_poll_remote
  ring-buffer: Avoid reader_lock deadlock during panic
  ring-buffer: Use panic-friendly locking in ring_buffer_iter interface
  ring-buffer: Add kerneldoc for ring_buffer_poll_remote
  tracing/remotes: Use ring_buffer_capacity() in trace_remote_has_cpu()
  tracing/remotes: Add dump_on_panic tracefs file
  tracing/remotes: selftests: Add a test for the dump_on_panic tracefs
    file
  tracing/remotes: Add poll_ms tracefs file
  tracing/remotes: Add trace_remote cmdline options
  Documentation: tracing/remotes: Add detailed tracefs layout
  Documentation/kernel-parameters: Add trace_remote

 .../admin-guide/kernel-parameters.txt         |  19 +
 Documentation/trace/remotes.rst               |  66 +-
 include/linux/ring_buffer.h                   |   5 +
 kernel/trace/ring_buffer.c                    |  55 +-
 kernel/trace/simple_ring_buffer.c             |  23 +-
 kernel/trace/trace_remote.c                   | 849 +++++++++++++++---
 .../buffer_size.tc                            |   0
 .../test.d/remotes/00hypervisor/dmesg.tc      |  11 +
 .../remotes/00hypervisor/dump_on_panic.tc     |  11 +
 .../{hypervisor => 00hypervisor}/hotplug.tc   |   0
 .../{hypervisor => 00hypervisor}/reset.tc     |   0
 .../{hypervisor => 00hypervisor}/trace.tc     |   0
 .../trace_pipe.tc                             |   0
 .../{hypervisor => 00hypervisor}/unloading.tc |   0
 .../selftests/ftrace/test.d/remotes/dmesg.tc  |  91 ++
 .../ftrace/test.d/remotes/dump_on_panic.tc    |  50 ++
 .../selftests/ftrace/test.d/remotes/functions |   2 +
 17 files changed, 1033 insertions(+), 149 deletions(-)
 rename tools/testing/selftests/ftrace/test.d/remotes/{hypervisor => 00hypervisor}/buffer_size.tc (100%)
 create mode 100644 tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/dmesg.tc
 create mode 100644 tools/testing/selftests/ftrace/test.d/remotes/00hypervisor/dump_on_panic.tc
 rename tools/testing/selftests/ftrace/test.d/remotes/{hypervisor => 00hypervisor}/hotplug.tc (100%)
 rename tools/testing/selftests/ftrace/test.d/remotes/{hypervisor => 00hypervisor}/reset.tc (100%)
 rename tools/testing/selftests/ftrace/test.d/remotes/{hypervisor => 00hypervisor}/trace.tc (100%)
 rename tools/testing/selftests/ftrace/test.d/remotes/{hypervisor => 00hypervisor}/trace_pipe.tc (100%)
 rename tools/testing/selftests/ftrace/test.d/remotes/{hypervisor => 00hypervisor}/unloading.tc (100%)
 create mode 100644 tools/testing/selftests/ftrace/test.d/remotes/dmesg.tc
 create mode 100644 tools/testing/selftests/ftrace/test.d/remotes/dump_on_panic.tc


base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.56.1.809.ga0b61035b5-goog

