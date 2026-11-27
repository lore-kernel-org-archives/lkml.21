Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795818547;
	b=r8VAlYl3GLAElZ/+pUe40/zeB0kov9jXYEnvPerUxQUz6I/FrYXSe/d65qrBFloQrqBL
	 iLoLD8Kc+s7lBRT6P82BQ/VAJBRiB0vIFnnXkoN0IN6MImu2Bypo49UF9Z6WbNEP3CWHU
	 z3SceVaI/qJK0QjMI/bq3B1AxmcfoOPT6dBJ4KKsvE8AE2Osat3TgEqDFFLVk+/7n6kVq
	 sdMIOJMrVM0m3FWoskcmnHef8uf/BeI5ahFLQ/ZNADH9XWAOIXvF+fxrgurRZZPX9uOwY
	 3PMeuTLESl8+LfMVEkgKDSs/+KFVfHngE18pGuH/WRbwIFcHAhHkUSjniwemp9gefwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795818547;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Stat-Signature:X-Spam-Status:X-Rspamd-Server:X-Rspamd-Queue-Id:
	 X-Session-Marker:X-Session-ID:DKIM-Signature:X-HE-Tag:X-HE-Meta;
	bh=ZeMawcVWdzoAzD0XXSsh1JkZLLtKVG2xH6n4/oMEt6w=;
	b=SyeRhLaqZDf1wrJxOLtGR28Tk1A6hho8c0KE6tPquoMwjI6ffRPNjh/bSkEGQYKvUbac
	 gnS1F6lVmZbqfbFm9VwICk8tcUpTkErBI5yuPrmd2072P3QaXS05S0UsY7cG+uWuWtss1
	 bmLmbaDEaXYA/jtopd39f13eAzDRMALf7bIYaVOdg5WlNnj31kdveqWoEuGdUBLKMKUE1
	 3ejn8NSJu1LoS6ZB8VofStYfGYKEhAQm8TokkKxDeUDD1+ue6ma8hu29KnILDv9yGRgYh
	 uVtW1KT8O5bXvS9Id2yukpkSkVvU1Ae9Ro4PBZU9fC/zcjjPxWTlM/1BAZV+VEU0dHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goodmis.org;
	spf=pass smtp.mailfrom=goodmis.org;
	dkim=pass header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=ANWKIgzz;
	arc=none smtp.remote-ip=216.40.44.14
Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC04606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 22:29:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FC04606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=ANWKIgzz
Received: from omf02.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 5E3D7140501;
	Fri, 27 Nov 2026 22:29:04 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf02.hostedemail.com (Postfix) with ESMTPA id 2AA4680012;
	Fri, 27 Nov 2026 22:29:02 +0000 (UTC)
Date: Fri, 27 Nov 2026 17:29:00 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>, Andrea Parri
 <parri.andrea@gmail.com>, Jeff Barnes <jeffbarnes@linux.microsoft.com>,
 Vincent Donnefort <vdonnefort@google.com>, Yifan Feng
 <evanfengff@gmail.com>
Subject: [GIT PULL] tracing: Fixes for v7.4
Message-ID: <20261127172900.433b05bf@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: iwnbzi8i85q9p5jzpdf5sac75yn4wqdh
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 2AA4680012
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/pj+0VZvQJ6I9VJSBfWbCqhiF6JhIqYk8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=ZeMawcVWdzoAzD0XXSsh1JkZLLtKVG2xH6n4/oMEt6w=; b=ANWKIgzzHjwM6jxCAYy7TS546Q/5XW/mMM+pKbwhbBteYM1bawqIM4VNU4LoGbnzCon16y91LQG9FXndgTjlP+FlW4WN3eNyBlCpF9AuJ9Frbq3ogjxfW6rPDuI/FPDas3mM3M7Sm5RzODb0Who6uzfRysEzZDBE7Uckb/tWiVg=
X-HE-Tag: 1795818542-657930
X-HE-Meta: U2FsdGVkX18FOeYKWR0+u1kHsoQiQmbUhH/B7+JS3hUiFGW13VqO472CH0CvLMYPSJVC0f0E3jrX3Zh/6YiPTRGt6+4QYYwXBsQhh7ccsch0o5p5JaQCQh/8BJFapqDGKFPJ3KfWUXJRr/6GOfN9eaNRw8cGeQNhsQNvefVyUpX19z2cWVXCKpCd/3LAa3LdjYRbdZQ5jbM32/+XtaeAkCG4gNZAlcnAtykwhNaIACmO8qWTpnHgJM64XVuCTsXI52Q5e/xX7MVCOqNBgJPikuNF00CsgxN/cI8pJITlvimZZOpctbZWU3o0eRroACOtr9ZBZofEK3sQg0tRCVB3MxeFCY5etDFS


Linus,

tracing fixes for v7.4:

- Fix user events on fork allocation failure

  User events are created by user tasks to be able to be traced within
  the kernel tracing facility. On fork, the duplication of user events
  can fail. If this happens the state of the event becomes stale,
  miss updates and produce undefined results.

  As user events are part of the set up of the program that uses them,
  fail a fork if the user event allocation fails for the new child.
  This only affects programs that set up user events for themselves.

- Fix a remote event alignment offset output

  The trace events for remote buffers does not take into account alignment
  constraints, and produces incorrect field offsets that cause failure in
  parsing the events from user space.

- Fix lost recursion records in recording ftrace functions that recurse

  There's a race in the logic that records ftrace functions that recurse
  where it checks if the last function that recursed is the same as the new
  one and if it is, it ignores the recursion. But the recording of that last
  function is done before the function is saved. If the saving fails due to
  a race, then if the same function is recursed again, it will be ignored as
  the code thinks it was recorded last time (but it wasn't).

- Reject '!!' at the beginning of input to set_ftrace_filter

  To remove a single function from the set_ftrace_filter file, the user
  echos "!func_name" into set_ftrace_filter and that function is removed
  from the list. The issue is that the parsing logic sees the '!', records
  it, removes it from the string and then continues the parsing with a "not"
  variable set. The later logic of the "not" code checks if the first
  character is a '!', and if it is, it triggers a WARN_ON() as it thinks the
  logic was broken.

  If the user echos in "!!func_name", the first '!' is removed and the not
  variable set, and the second '!' is processed making the code think there
  was a bug in the logic and triggers a WARN_ON().

  Simply have the code first check for "!!" at the start and return -EINVAL
  if that is found.

- Use atomic bitops and READ_ONCE() when processing flags variable

  KSCAN reported a data race on the trace_event flags variable.
  It is accessed in lockless mode during tracing and currently updated with
  simple "|" or "&" logic. This causes a read-modify-write race.
  Update the accesses to use bitops and READ_ONCE() to remove this race
  condition.

- Fix accounting of getting reader page of remote buffer

  The rb_check_pages() is an optional debug feature to validate the ring
  buffer pages. The reader can swap the head page of the walk of pages
  where it never finds the beginning and will loop forever. When the
  reader swaps the page it updates a cnt variable that is used in the
  rb_check_pages() which will cause it to exit out of the loop if it sees
  that it changes.

  The remote updates did not increment this counter and if debugging and
  buffer page validation is enabled it can cause it to go into an infinite
  loop.


Please pull the latest trace-v7.4-rc4 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
trace-v7.4-rc4

Tag SHA1: 8266237b33642737f753c22196b5a0a7741eb7be
Head SHA1: 76a0a6d58318fff8b14530ed9b99c7065995db29


Andrea Parri (1):
      ftrace: Fix lost recursion records in ftrace_record_recursion()

Jeff Barnes (1):
      tracing/user_events: Fail fork when event state duplication fails

Masami Hiramatsu (Google) (1):
      tracing/filters: Use atomic bitops and READ_ONCE() for trace_event_file::flags

Vincent Donnefort (2):
      tracing/remotes: Align field offset in remote_event_format_show()
      ring-buffer: Add missing cnt increment for remote ring buffers

Yifan Feng (1):
      ftrace: Reject "!!" in front of a set_ftrace_filter command

----
 include/linux/trace_events.h          |  2 +-
 include/linux/user_events.h           | 16 +++++++---------
 kernel/fork.c                         |  8 ++++++--
 kernel/trace/ftrace.c                 |  7 +++++++
 kernel/trace/ring_buffer.c            |  1 +
 kernel/trace/trace.c                  |  7 ++++---
 kernel/trace/trace.h                  | 18 ++++++++++--------
 kernel/trace/trace_events.c           |  2 +-
 kernel/trace/trace_events_filter.c    | 12 ++----------
 kernel/trace/trace_events_trigger.c   |  5 +++--
 kernel/trace/trace_events_user.c      |  8 +++++---
 kernel/trace/trace_recursion_record.c | 17 +++++++++--------
 kernel/trace/trace_remote.c           |  1 +
 13 files changed, 57 insertions(+), 47 deletions(-)
---------------------------
diff --git a/include/linux/trace_events.h b/include/linux/trace_events.h
index 321f2f3a6c8e..7a0aa23825de 100644
--- a/include/linux/trace_events.h
+++ b/include/linux/trace_events.h
@@ -764,7 +764,7 @@ bool __trace_trigger_soft_disabled(struct trace_event_file *file);
 static __always_inline bool
 trace_trigger_soft_disabled(struct trace_event_file *file)
 {
-	unsigned long eflags = file->flags;
+	unsigned long eflags = READ_ONCE(file->flags);
 
 	if (likely(!(eflags & (EVENT_FILE_FL_TRIGGER_MODE |
 			       EVENT_FILE_FL_SOFT_DISABLED |
diff --git a/include/linux/user_events.h b/include/linux/user_events.h
index 57d1ff006090..75f184126727 100644
--- a/include/linux/user_events.h
+++ b/include/linux/user_events.h
@@ -27,28 +27,26 @@ struct user_event_mm {
 	struct rcu_work		put_rwork;
 };
 
-extern void user_event_mm_dup(struct task_struct *t,
-			      struct user_event_mm *old_mm);
+int user_event_mm_dup(struct task_struct *t, struct user_event_mm *old_mm);
 
 extern void user_event_mm_remove(struct task_struct *t);
 
-static inline void user_events_fork(struct task_struct *t,
-				    u64 clone_flags)
+static inline int user_events_fork(struct task_struct *t, u64 clone_flags)
 {
 	struct user_event_mm *old_mm;
 
 	if (!t || !current->user_event_mm)
-		return;
+		return 0;
 
 	old_mm = current->user_event_mm;
 
 	if (clone_flags & CLONE_VM) {
 		t->user_event_mm = old_mm;
 		refcount_inc(&old_mm->tasks);
-		return;
+		return 0;
 	}
 
-	user_event_mm_dup(t, old_mm);
+	return user_event_mm_dup(t, old_mm);
 }
 
 static inline void user_events_execve(struct task_struct *t)
@@ -67,9 +65,9 @@ static inline void user_events_exit(struct task_struct *t)
 	user_event_mm_remove(t);
 }
 #else
-static inline void user_events_fork(struct task_struct *t,
-				    u64 clone_flags)
+static inline int user_events_fork(struct task_struct *t, u64 clone_flags)
 {
+	return 0;
 }
 
 static inline void user_events_execve(struct task_struct *t)
diff --git a/kernel/fork.c b/kernel/fork.c
index 5efceb8d58a7..cdba6ba6335d 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -2328,9 +2328,12 @@ __latent_entropy struct task_struct *copy_process(
 	retval = copy_mm(clone_flags, p);
 	if (retval)
 		goto bad_fork_cleanup_signal;
-	retval = copy_namespaces(clone_flags, p);
+	retval = user_events_fork(p, clone_flags);
 	if (retval)
 		goto bad_fork_cleanup_mm;
+	retval = copy_namespaces(clone_flags, p);
+	if (retval)
+		goto bad_fork_cleanup_user_events;
 	retval = copy_io(clone_flags, p);
 	if (retval)
 		goto bad_fork_cleanup_namespaces;
@@ -2598,7 +2601,6 @@ __latent_entropy struct task_struct *copy_process(
 
 	trace_task_newtask(p, clone_flags);
 	uprobe_copy_process(p, clone_flags);
-	user_events_fork(p, clone_flags);
 
 	copy_oom_score_adj(clone_flags, p);
 
@@ -2625,6 +2627,8 @@ __latent_entropy struct task_struct *copy_process(
 		exit_io_context(p);
 bad_fork_cleanup_namespaces:
 	exit_nsproxy_namespaces(p);
+bad_fork_cleanup_user_events:
+	user_events_exit(p);
 bad_fork_cleanup_mm:
 	sched_cache_fork_cleanup(p);
 	if (p->mm) {
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 6654da9d1bbf..5b161959e701 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -5847,6 +5847,13 @@ static int ftrace_process_regex(struct ftrace_iterator *iter,
 
 	/* command found */
 
+	/*
+	 * A double "!!" confuses the parser. This isn't a boolean operation,
+	 * simply reject it.
+	 */
+	if (func[0] == '!' && func[1] == '!')
+		return -EINVAL;
+
 	command = strsep(&next, ":");
 
 	guard(mutex)(&ftrace_cmd_mutex);
diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index a5a0adc934fa..65dddfac5e04 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -5891,6 +5891,7 @@ __rb_get_reader_page_from_remote(struct ring_buffer_per_cpu *cpu_buffer)
 	cpu_buffer->pages = &new_head->list;
 	cpu_buffer->lost_events = cpu_buffer->meta_page->reader.lost_events;
 	local_inc(&cpu_buffer->pages_read);
+	cpu_buffer->cnt++;
 
 	if (!rb_page_size(cpu_buffer->reader_page))
 		return NULL;
diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 65b9d67647e5..fa65ef8d7fbe 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -1886,7 +1886,8 @@ trace_event_buffer_lock_reserve(struct trace_buffer **current_rb,
 	*current_rb = tr->array_buffer.buffer;
 
 	if (!tr->no_filter_buffering_ref &&
-	    (trace_file->flags & (EVENT_FILE_FL_SOFT_DISABLED | EVENT_FILE_FL_FILTERED))) {
+	    (READ_ONCE(trace_file->flags) &
+	     (EVENT_FILE_FL_SOFT_DISABLED | EVENT_FILE_FL_FILTERED))) {
 		preempt_disable_notrace();
 		/*
 		 * Filtering is on, so try to use the per cpu buffer first.
@@ -1947,7 +1948,7 @@ trace_event_buffer_lock_reserve(struct trace_buffer **current_rb,
 	 * to store the trace event for the trigger to use. It's recursive
 	 * safe and will not be recorded anywhere.
 	 */
-	if (!entry && trace_file->flags & EVENT_FILE_FL_TRIGGER_COND) {
+	if (!entry && (READ_ONCE(trace_file->flags) & EVENT_FILE_FL_TRIGGER_COND)) {
 		*current_rb = temp_buffer;
 		entry = __trace_buffer_lock_reserve(*current_rb, type, len,
 						    trace_ctx);
@@ -1978,7 +1979,7 @@ static void output_printk(struct trace_event_buffer *fbuffer)
 
 	file = fbuffer->trace_file;
 	if (test_bit(EVENT_FILE_FL_SOFT_DISABLED_BIT, &file->flags) ||
-	    (unlikely(file->flags & EVENT_FILE_FL_FILTERED) &&
+	    (unlikely(test_bit(EVENT_FILE_FL_FILTERED_BIT, &file->flags)) &&
 	     !filter_match_preds(file->filter, fbuffer->entry)))
 		return;
 
diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
index 1fec567e789e..32997b58a8a0 100644
--- a/kernel/trace/trace.h
+++ b/kernel/trace/trace.h
@@ -1729,24 +1729,26 @@ __event_trigger_test_discard(struct trace_event_file *file,
 			     void *entry,
 			     enum event_trigger_type *tt)
 {
-	unsigned long eflags = file->flags;
+	unsigned long eflags = READ_ONCE(file->flags);
 
-	if (eflags & EVENT_FILE_FL_TRIGGER_COND)
+	if (eflags & EVENT_FILE_FL_TRIGGER_COND) {
 		*tt = event_triggers_call(file, buffer, entry, event);
+		eflags = READ_ONCE(file->flags);
+	}
 
-	if (likely(!(file->flags & (EVENT_FILE_FL_SOFT_DISABLED |
-				    EVENT_FILE_FL_FILTERED |
-				    EVENT_FILE_FL_PID_FILTER))))
+	if (likely(!(eflags & (EVENT_FILE_FL_SOFT_DISABLED |
+			       EVENT_FILE_FL_FILTERED |
+			       EVENT_FILE_FL_PID_FILTER))))
 		return false;
 
-	if (file->flags & EVENT_FILE_FL_SOFT_DISABLED)
+	if (eflags & EVENT_FILE_FL_SOFT_DISABLED)
 		goto discard;
 
-	if (file->flags & EVENT_FILE_FL_FILTERED &&
+	if (eflags & EVENT_FILE_FL_FILTERED &&
 	    !filter_match_preds(file->filter, entry))
 		goto discard;
 
-	if ((file->flags & EVENT_FILE_FL_PID_FILTER) &&
+	if ((eflags & EVENT_FILE_FL_PID_FILTER) &&
 	    trace_event_ignore_this_pid(file))
 		goto discard;
 
diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.c
index 7f89160aeff3..394d7cde1a70 100644
--- a/kernel/trace/trace_events.c
+++ b/kernel/trace/trace_events.c
@@ -707,7 +707,7 @@ void *trace_event_buffer_reserve(struct trace_event_buffer *fbuffer,
 {
 	struct trace_event_call *event_call = trace_file->event_call;
 
-	if ((trace_file->flags & EVENT_FILE_FL_PID_FILTER) &&
+	if (test_bit(EVENT_FILE_FL_PID_FILTER_BIT, &trace_file->flags) &&
 	    trace_event_ignore_this_pid(trace_file))
 		return NULL;
 
diff --git a/kernel/trace/trace_events_filter.c b/kernel/trace/trace_events_filter.c
index a9d77df3e19a..b3ac2519a62d 100644
--- a/kernel/trace/trace_events_filter.c
+++ b/kernel/trace/trace_events_filter.c
@@ -1349,11 +1349,7 @@ static void free_prog(struct event_filter *filter)
 
 static void filter_disable(struct trace_event_file *file)
 {
-	unsigned long old_flags = file->flags;
-
-	file->flags &= ~EVENT_FILE_FL_FILTERED;
-
-	if (old_flags != file->flags)
+	if (test_and_clear_bit(EVENT_FILE_FL_FILTERED_BIT, &file->flags))
 		trace_buffered_event_disable();
 }
 
@@ -2331,11 +2327,7 @@ static int process_preds(struct trace_event_call *call,
 
 static inline void event_set_filtered_flag(struct trace_event_file *file)
 {
-	unsigned long old_flags = file->flags;
-
-	file->flags |= EVENT_FILE_FL_FILTERED;
-
-	if (old_flags != file->flags)
+	if (!test_and_set_bit(EVENT_FILE_FL_FILTERED_BIT, &file->flags))
 		trace_buffered_event_enable();
 }
 
diff --git a/kernel/trace/trace_events_trigger.c b/kernel/trace/trace_events_trigger.c
index a2487ad7fef8..96203ba72ab9 100644
--- a/kernel/trace/trace_events_trigger.c
+++ b/kernel/trace/trace_events_trigger.c
@@ -214,7 +214,7 @@ EXPORT_SYMBOL_GPL(event_triggers_call);
 
 bool __trace_trigger_soft_disabled(struct trace_event_file *file)
 {
-	unsigned long eflags = file->flags;
+	unsigned long eflags = READ_ONCE(file->flags);
 
 	if (eflags & EVENT_FILE_FL_TRIGGER_MODE)
 		event_triggers_call(file, NULL, NULL, NULL);
@@ -1692,7 +1692,8 @@ event_enable_count_func(struct event_trigger_data *data,
 		return false;
 
 	/* Skip if the event is in a state we want to switch to */
-	if (enable_data->enable == !(enable_data->file->flags & EVENT_FILE_FL_SOFT_DISABLED))
+	if (enable_data->enable == !test_bit(EVENT_FILE_FL_SOFT_DISABLED_BIT,
+					     &enable_data->file->flags))
 		return false;
 
 	if (data->count != -1)
diff --git a/kernel/trace/trace_events_user.c b/kernel/trace/trace_events_user.c
index e29e1c772aa7..c561443f7947 100644
--- a/kernel/trace/trace_events_user.c
+++ b/kernel/trace/trace_events_user.c
@@ -868,7 +868,7 @@ void user_event_mm_remove(struct task_struct *t)
 	queue_rcu_work(system_percpu_wq, &mm->put_rwork);
 }
 
-void user_event_mm_dup(struct task_struct *t, struct user_event_mm *old_mm)
+int user_event_mm_dup(struct task_struct *t, struct user_event_mm *old_mm)
 {
 	struct user_event_mm *mm = user_event_mm_alloc(t);
 	struct user_event_enabler *enabler;
@@ -877,7 +877,7 @@ void user_event_mm_dup(struct task_struct *t, struct user_event_mm *old_mm)
 	t->user_event_mm = NULL;
 
 	if (!mm)
-		return;
+		return -ENOMEM;
 
 	rcu_read_lock();
 
@@ -889,10 +889,12 @@ void user_event_mm_dup(struct task_struct *t, struct user_event_mm *old_mm)
 	rcu_read_unlock();
 
 	user_event_mm_attach(mm, t);
-	return;
+	return 0;
 error:
 	rcu_read_unlock();
 	user_event_mm_destroy(mm);
+
+	return -ENOMEM;
 }
 
 static bool current_user_event_enabler_exists(unsigned long uaddr,
diff --git a/kernel/trace/trace_recursion_record.c b/kernel/trace/trace_recursion_record.c
index bac4bc844ccd..4f63bec052fc 100644
--- a/kernel/trace/trace_recursion_record.c
+++ b/kernel/trace/trace_recursion_record.c
@@ -17,8 +17,8 @@ static struct recursed_functions recursed_functions[CONFIG_FTRACE_RECORD_RECURSI
 static atomic_t nr_records;
 
 /*
- * Cache the last found function. Yes, updates to this is racey, but
- * so is memory cache ;-)
+ * Cache the last function found in or added to recursed_functions[].
+ * Updates to this are racy, but this is only a best-effort cache.
  */
 static unsigned long cached_function;
 
@@ -67,24 +67,25 @@ void ftrace_record_recursion(unsigned long ip, unsigned long parent_ip)
 		}
 	}
 
-	cached_function = ip;
-
 	/*
 	 * We only want to add a function if it hasn't been added before.
-	 * Add to the current location before incrementing the count.
-	 * If it fails to add, then increment the index (save in i)
-	 * and try again.
+	 * Claim the current slot before incrementing the count. If the slot
+	 * is occupied by another function, advance to the next slot and retry.
+	 *
+	 * Do not update cached_function until ip is known to be present;
+	 * otherwise the retry would match its own cache update.
 	 */
 	old = cmpxchg(&recursed_functions[index].ip, 0, ip);
 	if (old != 0) {
 		/* Did something else already added this for us? */
 		if (old == ip)
 			return;
-		/* Try the next location (use i for the next index) */
+		/* Try the next location */
 		index++;
 		goto again;
 	}
 
+	cached_function = ip;
 	recursed_functions[index].parent_ip = parent_ip;
 
 	/*
diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
index 2d5bc423efca..7e35f48ae467 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -1098,6 +1098,7 @@ static int remote_event_format_show(struct seq_file *s, void *unused)
 
 	field = &evt->fields[0];
 	while (field->name) {
+		offset = ALIGN(offset, field->align);
 		seq_printf(s, "\tfield:%s %s;\toffset:%zu;\tsize:%u;\tsigned:%d;\n",
 			   field->type, field->name, offset, field->size,
 			   field->is_signed);
