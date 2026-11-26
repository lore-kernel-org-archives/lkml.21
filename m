Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710286;
	b=oAMVHSCRyaUvpF5357hCS+S0e8GmtPGJ7nrbC6cJPqwP63DQmkjyzDnER8JLJypiThUd
	 Vf1DH+hhzEsUnWRnITlYYf+ci5fG182RKfsQ88jbGqDTRxH4ATCXKRi+E2haP1yaO3FRw
	 HU7Upw4xPXTLAXuQhbX/PqpqBjfDFTR05WzbOZaTdGhYfBGi1yk8R7gRunI4ArTNrc3yc
	 0toGhuWxlXKdWsB2UF5AN6+Y9iO0D7WvDHczC5eOpqeUjc5/e0ufLEONuE1puH7Vw7qGG
	 zTLX8NLgev/U7BQrAohPAgfJf8VGwCo209DOm6XoT8TZ0/qwk6XG+XGERtq1hJYkmeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710286;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject:References:MIME-Version:Content-Type;
	bh=I7lNp5b6PeUj//4XuasoleAnAMMnvwEzWqPSdbg3w6k=;
	b=WKPNVTwNgfe3wXSBHYJ66L5lbdblAFq2fJOb18ggMK6LpC77gAZCuBHWDcNrjyie06lH
	 zqE1GfF+A/gJTxHQC/u9TQlWyrS/gFkiy7UjOxmxRcGeP7DYt6AJ7ShoLbVGDKz2HFuZn
	 eLGWxt9Dqirymymnw5+0YJdnehHvIxDRzLH10PZSiv+mc6cfK1fCId5ZEolCVpPxEePPB
	 axWbzvY3y6cRGdL7cff+fxqsxHnyL6kH6eLmNW47V/l6m+v/PvRAv4zgE9zaaCeS7ZixC
	 RgQzaDuUFLV8aYEV0tISHjwrKW8O6qAzHZhvKgFnORbavO2FtliKCuvBGQZNEuBvgrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nysBB+80;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6891A606A688
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nysBB+80
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED65C1F000EF;
	Thu, 26 Nov 2026 16:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795710286;
	bh=I7lNp5b6PeUj//4XuasoleAnAMMnvwEzWqPSdbg3w6k=;
	h=Date:From:To:Cc:Subject:References;
	b=nysBB+80+RSlJIjwkQfkXbfYz6Iuq9a79cJQuCFpLZEP6fTViI0CcBGM1RcFQ3oya
	 HwPUh3TryiX5yETzR4jms0Fo4jBC8nhbwOXlFU58/PnQlr9/pl0Mh89OFaLSXoZds7
	 1Eirbq+Lr6u7MEVjoseTIxK/of/9G0y0a/KsP9kZPFp0c7LfMYLueMYKmgQVLmUwEy
	 RjFtokYKTtnmKs7K/FdL7BzNzVMXL/27mqQNxq0CjxkPr8yvY8NRubSBRGWP1w+sdW
	 9Rd3l0J2jApZyLbmtZpeJB+sC1nLi7UnS8rJhO/dMYIbXdQyrXDym8dfDJQeTrOvOq
	 /7qs2+WF11Jgg==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xWcH7-00000007bm7-16CJ;
	Thu, 26 Nov 2026 11:24:45 -0500
Message-ID: <20261126162445.073021208@kernel.org>
User-Agent: quilt/0.69
Date: Thu, 26 Nov 2026 11:24:29 -0500
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-next][PATCH 06/15] selftests/ftrace: Add test case for overriding trace_instance
 parameter
References: <20261126162423.442922469@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>

Add a boot-time tracing test case to verify that specifying multiple
trace_instance= parameters with the same instance name overrides earlier
definitions:

   - Verifies that a kernel command-line trace_instance= parameter
     overrides an earlier trace instance defined via bootconfig
     (kernel.trace_instance).
   - Verifies that a later kernel command-line trace_instance=
     parameter overrides an earlier trace_instance= on the same
     command line.
   - Verifies overriding a memory-mapped trace instance (@trace).
   - Verifies overriding a backup trace instance (=source).
   - Verifies parsing parameters containing multiple tabs and
     gracefully handling empty strings.
   - Confirms that the overridden instance has its previous events
     disabled, new events enabled, and flags (such as traceoff)
     properly applied.

Link: https://patch.msgid.link/179094975229.609715.3664484413379599809.stgit@devnote2
Assisted-by: LLM
Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 .../cmdline-07-trace-instance-override.bconf  |   4 +
 ...cmdline-07-trace-instance-override.cmdline |   1 +
 .../ftrace/boottime/run_boottime_test.sh      |   2 +
 .../cmdline-07-trace-instance-override.sh     | 148 ++++++++++++++++++
 4 files changed, 155 insertions(+)
 create mode 100644 tools/testing/selftests/ftrace/boottime/bootconfigs/cmdline-07-trace-instance-override.bconf
 create mode 100644 tools/testing/selftests/ftrace/boottime/cmdlines/cmdline-07-trace-instance-override.cmdline
 create mode 100755 tools/testing/selftests/ftrace/boottime/tests/cmdline-07-trace-instance-override.sh

diff --git a/tools/testing/selftests/ftrace/boottime/bootconfigs/cmdline-07-trace-instance-override.bconf b/tools/testing/selftests/ftrace/boottime/bootconfigs/cmdline-07-trace-instance-override.bconf
new file mode 100644
index 000000000000..74d8be54a798
--- /dev/null
+++ b/tools/testing/selftests/ftrace/boottime/bootconfigs/cmdline-07-trace-instance-override.bconf
@@ -0,0 +1,4 @@
+kernel.trace_instance = "boot_map@trace,sched:sched_switch",
+			"bak_to_norm=boot_map",
+			"bak_from_norm,sched:sched_switch",
+			"foo,sched:sched_switch"
diff --git a/tools/testing/selftests/ftrace/boottime/cmdlines/cmdline-07-trace-instance-override.cmdline b/tools/testing/selftests/ftrace/boottime/cmdlines/cmdline-07-trace-instance-override.cmdline
new file mode 100644
index 000000000000..3c16bb0f3545
--- /dev/null
+++ b/tools/testing/selftests/ftrace/boottime/cmdlines/cmdline-07-trace-instance-override.cmdline
@@ -0,0 +1 @@
+reserve_mem=12M:32M:trace trace_instance=foo^traceoff,sched:sched_waking trace_instance=bar,sched:sched_switch trace_instance=bar^traceoff,irq:irq_handler_entry trace_instance=boot_map^traceoff@trace,sched:sched_waking trace_instance=bak_to_norm^traceoff,irq:irq_handler_entry trace_instance=bak_from_norm=boot_map trace_instance="tab1,sched:sched_switch		tab2,sched:sched_switch" trace_instance=tab1^traceoff,sched:sched_waking trace_instance= trace_instance="" trace_instance=,
diff --git a/tools/testing/selftests/ftrace/boottime/run_boottime_test.sh b/tools/testing/selftests/ftrace/boottime/run_boottime_test.sh
index 6e8593d5a2c5..1d30adc388a6 100755
--- a/tools/testing/selftests/ftrace/boottime/run_boottime_test.sh
+++ b/tools/testing/selftests/ftrace/boottime/run_boottime_test.sh
@@ -46,6 +46,8 @@ BUSYBOX_APPLETS=(
 	grep
 	sleep
 	sed
+	dmesg
+	basename
 )
 
 usage() {
diff --git a/tools/testing/selftests/ftrace/boottime/tests/cmdline-07-trace-instance-override.sh b/tools/testing/selftests/ftrace/boottime/tests/cmdline-07-trace-instance-override.sh
new file mode 100755
index 000000000000..960a3cf54d97
--- /dev/null
+++ b/tools/testing/selftests/ftrace/boottime/tests/cmdline-07-trace-instance-override.sh
@@ -0,0 +1,148 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (C) 2026, Google LLC.
+# Check trace_instance= override with bootconfig and kernel command-line
+TRACEDIR="/sys/kernel/tracing"
+
+if [ -f /proc/bootconfig ] && \
+   grep -q "dump_bconf" /proc/cmdline 2>/dev/null; then
+	echo "=== /proc/bootconfig ==="
+	cat /proc/bootconfig
+	echo "========================"
+fi
+
+check_instance() {
+	instance="$1"
+	old_event="$2"
+	new_event="$3"
+
+	if [ ! -d "$TRACEDIR/instances/$instance" ]; then
+		echo "FAIL: trace instance $instance does not exist"
+		exit 1
+	fi
+
+	if [ -n "$old_event" ] && \
+	   [ -f "$TRACEDIR/instances/$instance/events/$old_event/enable" ]; then
+		ENABLE=$(cat "$TRACEDIR/instances/$instance/events/$old_event/enable")
+		if [ "$ENABLE" = "1" ]; then
+			echo "FAIL: overridden event $old_event" \
+				"is still enabled in instance $instance"
+			exit 1
+		fi
+	fi
+
+	if [ -n "$new_event" ]; then
+		if [ ! -d "$TRACEDIR/instances/$instance/events/$new_event" ]; then
+			echo "FAIL: event $new_event does not exist in instance $instance"
+			exit 1
+		fi
+
+		ENABLE=$(cat "$TRACEDIR/instances/$instance/events/$new_event/enable")
+		if [ "$ENABLE" != "1" ]; then
+			echo "FAIL: event $new_event is not enabled in instance $instance ($ENABLE)"
+			exit 1
+		fi
+	fi
+
+	TRACING_ON=$(cat "$TRACEDIR/instances/$instance/tracing_on")
+	if [ "$TRACING_ON" != "0" ]; then
+		echo "FAIL: tracing_on is not 0 in instance $instance ($TRACING_ON)"
+		exit 1
+	fi
+}
+
+check_backup_instance() {
+	instance="$1"
+
+	if [ ! -d "$TRACEDIR/instances/$instance" ]; then
+		echo "FAIL: trace instance $instance does not exist"
+		exit 1
+	fi
+
+	# Backup instances have a trace buffer file
+	if [ ! -f "$TRACEDIR/instances/$instance/trace" ]; then
+		echo "FAIL: backup instance $instance has no trace file"
+		exit 1
+	fi
+
+	# Backup instances are read-only and do not have tracing_on
+	if [ -f "$TRACEDIR/instances/$instance/tracing_on" ]; then
+		echo "FAIL: backup instance $instance unexpectedly has tracing_on"
+		exit 1
+	fi
+
+	# Backup instances do not support enabling events
+	if [ -f \
+	   "$TRACEDIR/instances/$instance/events/sched/sched_switch/enable" ]; then
+		echo "FAIL: backup instance $instance unexpectedly has enabled events"
+		exit 1
+	fi
+}
+
+check_mapped_instance() {
+	instance="$1"
+	old_event="$2"
+	new_event="$3"
+
+	check_instance "$instance" "$old_event" "$new_event"
+
+	# Check dmesg to confirm physical mapping occurred
+	if ! dmesg | grep -q "mapped boot instance $instance"; then
+		echo "FAIL: memory-mapped instance $instance was not mapped at boot"
+		exit 1
+	fi
+}
+
+# Test 1: bootconfig trace_instance overridden by cmdline parameter
+check_instance "foo" "sched/sched_switch" "sched/sched_waking"
+
+# Test 2: cmdline trace_instance overridden by subsequent cmdline parameter
+check_instance "bar" "sched/sched_switch" "irq/irq_handler_entry"
+
+# Test 3: memory-mapped (@trace) instance in bootconfig overridden by cmdline
+check_mapped_instance "boot_map" "sched/sched_switch" "sched/sched_waking"
+
+# Test 4a: backup instance in bootconfig overridden by normal
+# instance in cmdline
+check_instance "bak_to_norm" "" "irq/irq_handler_entry"
+
+# Test 4b: normal instance in bootconfig overridden by backup
+# instance in cmdline
+check_backup_instance "bak_from_norm"
+
+# Test 5: instances separated by multiple tabs, where first is overridden
+check_instance "tab1" "sched/sched_switch" "sched/sched_waking"
+# tab2 was not overridden, so its original event should remain enabled
+if [ ! -d "$TRACEDIR/instances/tab2/events/sched/sched_switch" ]; then
+	echo "FAIL: instance tab2 event sched/sched_switch does not exist"
+	exit 1
+fi
+ENABLE=$(cat "$TRACEDIR/instances/tab2/events/sched/sched_switch/enable")
+if [ "$ENABLE" != "1" ]; then
+	echo "FAIL: instance tab2 event sched/sched_switch is not enabled ($ENABLE)"
+	exit 1
+fi
+
+# Test 6: Verify empty strings and malformed entries did not create
+# bogus directories
+for dir in "$TRACEDIR/instances"/*; do
+	[ -d "$dir" ] || continue
+	bname=$(basename "$dir")
+	case "$bname" in
+		foo|bar|boot_map|bak_to_norm|bak_from_norm|tab1|tab2)
+			;;
+		*)
+			echo "FAIL: unexpected trace instance directory found: $bname"
+			exit 1
+			;;
+	esac
+done
+
+# Test 7: Verify no kernel warnings or assertion failures were triggered
+if dmesg | grep -q "WARNING: CPU:"; then
+	echo "FAIL: kernel warning triggered during boot"
+	exit 1
+fi
+
+echo "PASS: cmdline-07-trace-instance-override"
+exit 0
-- 
2.53.0
