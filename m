Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710288;
	b=immmiBRN6GMeteL5g7/ED8ikNfdoeZyzzCan/Rj85nKLs8l0+k0clpAi/E/HyfroQWKI
	 2B9r47tAAiv57otKWhl5NxEtH7gwhoyhjudl24+CfcCC/BKjbJL+kB+RDHHjiaTGZWPTP
	 x7scr4lYiZaPfzSXnB4KvrSJAgrNwq/0d9ip+UkewOLEjTtmMdp1A+N7j87iN21Uz9ih5
	 zDEVo6oRJsZK2HJKwO8l1p+zhrROY4cTeP92wqggb9IHw7Xz6QeT0ZmJxqoA3BqX7dl3N
	 88uNNCZGtQ//wLLq0s5q8CnxYyuBcDPf8hPjj7+j7p+DnwfIFnvkwQQei7GhV1fS/Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710288;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject:References:MIME-Version:Content-Type;
	bh=XBI1XRf5dQAqEg6JNTCF7wcz3P9FbKywdgXOKh+nQYQ=;
	b=L8cMNmgIY1bf10G1v4xq1fVcuuerSWbEO1MEBxC04PJL0++GVFNaDuMiNeo+OxPun990
	 9lljIkfy8DuV5YUi4it2uU05vtLaVi4XFaGO3bXugb5OkPo5Zdow142l99V46O60PKf6O
	 8Ln+x/gFdvmsP1p4M0+7Q7uCTdj6z99h6jlHUki8HVR8+l38gP10ObRQiuPMVBgiSTRUc
	 icq+oE7kg9KPDteAhkUH6HByFSvizvdPGo2+dUcfPQ8HLJhMIUjMQAPNwm1QdzstGVk3B
	 7hmxlBy4QdzGyeET9bNh1AwnWFC5eEyxrNf/X6zpocHPozU5rhb6+wSmWZ02g79Rb9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="DKof+d/O";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C97E606A33D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DKof+d/O
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9C681F0156E;
	Thu, 26 Nov 2026 16:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795710287;
	bh=XBI1XRf5dQAqEg6JNTCF7wcz3P9FbKywdgXOKh+nQYQ=;
	h=Date:From:To:Cc:Subject:References;
	b=DKof+d/OqTem7x9eL/pxixErjNTpvyYUzPLNi+Ls6+omR9L1x1mbtCw53fRF2DZly
	 4brZaSgsusNZF6zQxXWcwNLauI12GmMqqwptkpapfMBziyr9rzhjVTSrIMxPTmI+09
	 ZQyFnozeUVbvl4AolK3jSkxcLwAiwD+X3nImcIJDtgiEwzD7tRs0ucmqX5pSy7KZ1t
	 ri2f4zPcggVjHBXjJegyYSZVHpVCs2PNi0OqmSq8O9xOM/gAvzkmhJp/TVnqpY+Kyl
	 eUSaye4DmIKDZJdVdYvJPcNDbcHZ598Anpue4qroyLR94WIDgBq5S9ti7pUIBnxgYa
	 sYHb17a/CKsyw==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xWcH9-00000007brB-0KpR;
	Thu, 26 Nov 2026 11:24:47 -0500
Message-ID: <20261126162446.907982380@kernel.org>
User-Agent: quilt/0.69
Date: Thu, 26 Nov 2026 11:24:38 -0500
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Petr Pavlu <petr.pavlu@suse.com>,
 Cao Ruichuang <create0818@163.com>
Subject: [for-next][PATCH 15/15] tracing: Export live module tracepoint strings in printk_formats
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

From: Cao Ruichuang <create0818@163.com>

tracepoint_string() mappings for built-in strings are exported through
printk_formats, but the module loader does not collect __tracepoint_str.
Consequently, user space cannot resolve these module string pointers.

Collect the module section and expose its live address-to-text mappings.
Serialize registration, removal and the full printk_formats seq_file
iteration with btrace_mutex. Remove the range before module memory is
freed; do not retain strings after unload.

Keep trace_is_tracepoint_string() and event string validation unchanged.
Exporting decoder metadata does not require accepting module pointers in
core or other modules' events, nor does it extend the strings' lifetime.

Count successfully retained unique module trace_printk formats so the
iterator can locate the following module string ranges. These formats
remain retained after unload, so the count is not decremented.

Add a sample TRACE_EVENT and a dedicated selftest for multiple exported
strings, event output and mapping removal. Make unload and every residual
string/read-error check fail explicitly.

Link: https://patch.msgid.link/4b28954d.85c9.1a19b73b227.Coremail.create0818@163.com
Fixes: 102c9323c35a ("tracing: Add __tracepoint_string() to export string pointers")
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217196
Link: https://lore.kernel.org/r/41e81533-0fd6-49f5-b7c1-b4e172affd2a@suse.com
Link: https://lore.kernel.org/r/20261030173049.6656d506@gandalf.local.home
Suggested-by: Petr Pavlu <petr.pavlu@suse.com>
Assisted-by: LLM (GPT-6.1-Sol)
Signed-off-by: Cao Ruichuang <create0818@163.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 include/linux/module.h                        |   2 +
 include/linux/tracepoint.h                    |   9 +-
 kernel/module/main.c                          |   4 +
 kernel/trace/trace_printk.c                   | 111 ++++++++++++++++--
 samples/trace_events/trace-events-sample.c    |   3 +
 samples/trace_events/trace-events-sample.h    |  17 +++
 .../ftrace/test.d/event/tracepoint_string.tc  |  47 ++++++++
 7 files changed, 178 insertions(+), 15 deletions(-)
 create mode 100644 tools/testing/selftests/ftrace/test.d/event/tracepoint_string.tc

diff --git a/include/linux/module.h b/include/linux/module.h
index 76f4f3596477..e4c39013f414 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -513,7 +513,9 @@ struct module {
 #endif
 #ifdef CONFIG_TRACING
 	unsigned int num_trace_bprintk_fmt;
+	unsigned int num_tracepoint_strings;
 	const char **trace_bprintk_fmt_start;
+	const char **tracepoint_strings_start;
 #endif
 #ifdef CONFIG_EVENT_TRACING
 	struct trace_event_call **trace_events;
diff --git a/include/linux/tracepoint.h b/include/linux/tracepoint.h
index e0d838c9ce93..7b3ee936a8ca 100644
--- a/include/linux/tracepoint.h
+++ b/include/linux/tracepoint.h
@@ -508,11 +508,10 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
  * the ASCII strings they represent.
  *
  * The @str used must be a constant string and persistent as it would not
- * make sense to show a string that no longer exists. But it is still fine
- * to be used with modules, because when modules are unloaded, if they
- * had tracepoints, the ring buffers are cleared too. As long as the string
- * does not change during the life of the module, it is fine to use
- * tracepoint_string() within a module.
+ * make sense to show a string that no longer exists. For modules, the string
+ * mapping is exported while the module is loaded and removed on unload.
+ * Exporting the mapping does not extend the lifetime of the string. The
+ * existing lifetime requirements for strings referenced by events still apply.
  */
 #define tracepoint_string(str)						\
 	({								\
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 34e0204ea37c..630431b1b16c 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -2756,6 +2756,10 @@ static int find_module_sections(struct module *mod, struct load_info *info)
 	mod->trace_bprintk_fmt_start = section_objs(info, "__trace_printk_fmt",
 					 sizeof(*mod->trace_bprintk_fmt_start),
 					 &mod->num_trace_bprintk_fmt);
+	mod->tracepoint_strings_start =
+		section_objs(info, "__tracepoint_str",
+			     sizeof(*mod->tracepoint_strings_start),
+			     &mod->num_tracepoint_strings);
 #endif
 #ifdef CONFIG_DYNAMIC_FTRACE
 	/* sechdrs[0].sh_size is always zero */
diff --git a/kernel/trace/trace_printk.c b/kernel/trace/trace_printk.c
index 98171a2398e4..d82a62df3de7 100644
--- a/kernel/trace/trace_printk.c
+++ b/kernel/trace/trace_printk.c
@@ -19,15 +19,23 @@
 
 #include "trace.h"
 
+/* Counts unique retained formats; module unload does not decrement this. */
+static int trace_bprintk_fmt_cnt;
+
 #ifdef CONFIG_MODULES
 
 /*
  * modules trace_printk()'s formats are autosaved in struct trace_bprintk_fmt
  * which are queued on trace_bprintk_fmt_list.
+ *
+ * modules tracepoint_string() entries are kept as ranges into the owning
+ * module's __tracepoint_str section and are removed again when the module
+ * goes away.
  */
 static LIST_HEAD(trace_bprintk_fmt_list);
+static LIST_HEAD(tracepoint_str_list);
 
-/* serialize accesses to trace_bprintk_fmt_list */
+/* Serialize module list updates and the full printk_formats iteration. */
 static DEFINE_MUTEX(btrace_mutex);
 
 struct trace_bprintk_fmt {
@@ -35,6 +43,13 @@ struct trace_bprintk_fmt {
 	const char *fmt;
 };
 
+struct tracepoint_mod_str {
+	struct list_head list;
+	struct module *mod;
+	const char **start;
+	unsigned int num;
+};
+
 static inline struct trace_bprintk_fmt *lookup_format(const char *fmt)
 {
 	struct trace_bprintk_fmt *pos;
@@ -75,6 +90,7 @@ void hold_module_trace_bprintk_format(const char **start, const char **end)
 			if (fmt) {
 				list_add_tail(&tb_fmt->list, &trace_bprintk_fmt_list);
 				tb_fmt->fmt = fmt;
+				trace_bprintk_fmt_cnt++;
 			} else
 				kfree(tb_fmt);
 		}
@@ -84,16 +100,61 @@ void hold_module_trace_bprintk_format(const char **start, const char **end)
 	mutex_unlock(&btrace_mutex);
 }
 
+static void hold_module_tracepoint_strings(struct module *mod)
+{
+	struct tracepoint_mod_str *tp_str;
+
+	if (!mod->num_tracepoint_strings)
+		return;
+
+	tp_str = kmalloc_obj(*tp_str);
+	if (!tp_str)
+		return;
+
+	tp_str->mod = mod;
+	tp_str->start = mod->tracepoint_strings_start;
+	tp_str->num = mod->num_tracepoint_strings;
+
+	guard(mutex)(&btrace_mutex);
+	list_add_tail(&tp_str->list, &tracepoint_str_list);
+}
+
+static void release_module_tracepoint_strings(struct module *mod)
+{
+	struct tracepoint_mod_str *tp_str, *next;
+
+	if (!mod->num_tracepoint_strings)
+		return;
+
+	guard(mutex)(&btrace_mutex);
+	list_for_each_entry_safe(tp_str, next, &tracepoint_str_list, list) {
+		if (tp_str->mod != mod)
+			continue;
+
+		list_del(&tp_str->list);
+		kfree(tp_str);
+		return;
+	}
+}
+
 static int module_trace_bprintk_format_notify(struct notifier_block *self,
 		unsigned long val, void *data)
 {
 	struct module *mod = data;
-	if (mod->num_trace_bprintk_fmt) {
-		const char **start = mod->trace_bprintk_fmt_start;
-		const char **end = start + mod->num_trace_bprintk_fmt;
 
-		if (val == MODULE_STATE_COMING)
+	switch (val) {
+	case MODULE_STATE_COMING:
+		if (mod->num_trace_bprintk_fmt) {
+			const char **start = mod->trace_bprintk_fmt_start;
+			const char **end = start + mod->num_trace_bprintk_fmt;
+
 			hold_module_trace_bprintk_format(start, end);
+		}
+		hold_module_tracepoint_strings(mod);
+		break;
+	case MODULE_STATE_GOING:
+		release_module_tracepoint_strings(mod);
+		break;
 	}
 	return NOTIFY_OK;
 }
@@ -119,7 +180,7 @@ static int module_trace_bprintk_format_notify(struct notifier_block *self,
  * next format in the list.
  */
 static const char **
-find_next_mod_format(int start_index, void *v, const char **fmt, loff_t *pos)
+find_next_mod_format(loff_t start_index, void *v, const char **fmt, loff_t *pos)
 {
 	struct trace_bprintk_fmt *mod_fmt;
 
@@ -158,6 +219,25 @@ find_next_mod_format(int start_index, void *v, const char **fmt, loff_t *pos)
 	return &mod_fmt->fmt;
 }
 
+static const char **
+find_next_mod_tracepoint_str(loff_t start_index, loff_t *pos)
+{
+	struct tracepoint_mod_str *tp_str;
+	loff_t offset = *pos - start_index;
+
+	if (offset < 0)
+		return NULL;
+
+	list_for_each_entry(tp_str, &tracepoint_str_list, list) {
+		if (offset < (loff_t)tp_str->num)
+			return tp_str->start + offset;
+
+		offset -= tp_str->num;
+	}
+
+	return NULL;
+}
+
 static void format_mod_start(void)
 {
 	mutex_lock(&btrace_mutex);
@@ -176,10 +256,17 @@ module_trace_bprintk_format_notify(struct notifier_block *self,
 	return NOTIFY_OK;
 }
 static inline const char **
-find_next_mod_format(int start_index, void *v, const char **fmt, loff_t *pos)
+find_next_mod_format(loff_t start_index, void *v, const char **fmt, loff_t *pos)
 {
 	return NULL;
 }
+
+static inline const char **
+find_next_mod_tracepoint_str(loff_t start_index, loff_t *pos)
+{
+	return NULL;
+}
+
 static inline void format_mod_start(void) { }
 static inline void format_mod_stop(void) { }
 #endif /* CONFIG_MODULES */
@@ -265,8 +352,8 @@ bool trace_is_tracepoint_string(const char *str)
 static const char **find_next(void *v, loff_t *pos)
 {
 	const char **fmt = v;
-	int start_index;
-	int last_index;
+	loff_t start_index;
+	loff_t last_index;
 
 	start_index = __stop___trace_bprintk_fmt - __start___trace_bprintk_fmt;
 
@@ -292,7 +379,11 @@ static const char **find_next(void *v, loff_t *pos)
 		return __start___tracepoint_str + (*pos - last_index);
 
 	start_index += last_index;
-	return find_next_mod_format(start_index, v, fmt, pos);
+	if (*pos - start_index < trace_bprintk_fmt_cnt)
+		return find_next_mod_format(start_index, v, fmt, pos);
+
+	start_index += trace_bprintk_fmt_cnt;
+	return find_next_mod_tracepoint_str(start_index, pos);
 }
 
 static void *
diff --git a/samples/trace_events/trace-events-sample.c b/samples/trace_events/trace-events-sample.c
index ca5d98c360cb..0164cbdc4263 100644
--- a/samples/trace_events/trace-events-sample.c
+++ b/samples/trace_events/trace-events-sample.c
@@ -51,6 +51,9 @@ static void do_simple_thread_func(int cnt, const char *fmt, ...)
 	trace_foo_with_template_print("I have to be different", cnt);
 
 	trace_foo_rel_loc("Hello __rel_loc", cnt, bitmask, current->cpus_ptr);
+
+	trace_foo_tracepoint_str(tracepoint_string("tracepoint_string_test_module_string_1"));
+	trace_foo_tracepoint_str(tracepoint_string("tracepoint_string_test_module_string_2"));
 }
 
 static void simple_thread_func(int cnt)
diff --git a/samples/trace_events/trace-events-sample.h b/samples/trace_events/trace-events-sample.h
index 816848a456a2..021fd0e9d2f5 100644
--- a/samples/trace_events/trace-events-sample.h
+++ b/samples/trace_events/trace-events-sample.h
@@ -623,6 +623,23 @@ TRACE_EVENT(foo_timer_fn,
 
 	TP_printk("name=%s count=%d", __get_str(name), __entry->count)
 );
+
+TRACE_EVENT(foo_tracepoint_str,
+
+	TP_PROTO(const char *str),
+
+	TP_ARGS(str),
+
+	TP_STRUCT__entry(
+		__field(const char *, str)
+	),
+
+	TP_fast_assign(
+		__entry->str = str;
+	),
+
+	TP_printk("str=%s", __entry->str)
+);
 #endif
 
 /***** NOTICE! The #if protection ends here. *****/
diff --git a/tools/testing/selftests/ftrace/test.d/event/tracepoint_string.tc b/tools/testing/selftests/ftrace/test.d/event/tracepoint_string.tc
new file mode 100644
index 000000000000..f0916f34f148
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/event/tracepoint_string.tc
@@ -0,0 +1,47 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Test tracepoint strings from a module
+# requires: printk_formats
+
+string1=tracepoint_string_test_module_string_1
+string2=tracepoint_string_test_module_string_2
+event=events/sample-trace/foo_tracepoint_str
+
+rmmod trace-events-sample 2>/dev/null ||:
+if ! modprobe trace-events-sample; then
+    echo "No trace-events-sample module - please make CONFIG_SAMPLE_TRACE_EVENTS=m"
+    exit_unresolved
+fi
+trap 'rmmod trace-events-sample >/dev/null 2>&1 ||:' EXIT
+
+grep -Fq "$string1" printk_formats || exit_fail
+grep -Fq "$string2" printk_formats || exit_fail
+
+echo 1 > "$event/enable"
+echo 1 > tracing_on
+
+# The sample thread emits both strings once per second.
+attempts=100
+while [ "$attempts" -gt 0 ]; do
+    if grep -Fq "foo_tracepoint_str: str=$string1" trace &&
+       grep -Fq "foo_tracepoint_str: str=$string2" trace; then
+        break
+    fi
+    sleep 0.1
+    attempts=$((attempts - 1))
+done
+[ "$attempts" -gt 0 ] || exit_fail
+
+echo 0 > "$event/enable"
+rmmod trace-events-sample || exit_fail
+trap - EXIT
+
+for string in "$string1" "$string2"; do
+    if grep -Fq "$string" printk_formats; then
+        echo "Module string remains after unload: $string"
+        exit_fail
+    else
+        # grep returns 1 for no match; a read error must also fail the test.
+        [ "$?" -eq 1 ] || exit_fail
+    fi
+done
-- 
2.53.0
