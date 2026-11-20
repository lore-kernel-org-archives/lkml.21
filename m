Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196475;
	b=ReV8wH/qP8mtWYO1MKQiV24ajnjH52dhmzCAdDmL4eQ+te8V2Ot/lOGIQxqIRAVFra+r
	 T5wtNN1yKgNHcx7kreruyBe0V/jj7AC9I3/CEZF5LjgXggEh/HGzAhM2a6pXcXKa9q/Vc
	 e9ZJofR6lJUJv/1MOpEpbGfjk5A78LewUdAdlIBSFt2QqvXp4yxK0XsmJYCKwqyH5ycT2
	 yKQR0TCg4Vmxz9eSwARDw2oKQoD/S1lpolFyRxb8csdlNRFBTA47raGPvv7P5BIkrYQN9
	 /hlo6p45PSw1w55/7PWQj7siwY08BhFbMkPXqOTK9+yXD/J3uvKHKIKKZeOgBQgT+BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196475;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject:References:MIME-Version:Content-Type;
	bh=IHp1ZPkYUZ83/9+/+lvmjSITnZBCSqciGUD+Oh9oFmk=;
	b=eLDnHrY/mMYkEVbWLnkO8IFqA0lu++4DCqxkiiUUi4VuqoPLljVdD0K3TdPQBfSbi9Rm
	 hhAjfv8sqve0rHxhbdowge7GTpI9RBVfvim2SdkOXdeITiYaa6pMoIiS2Y1rKtPPRIOD1
	 Z5duac/DpKKYmhn/BST7jUSrGVydHTVF4PGJl7XqoKLkRY8si5JL1ffg+CWCR5wom3T7w
	 v3HIlNVejf+omlJ47OnE9nFJOVpuqDe7xLPTOIqAG9aS/CeoK59fd1/Hw7A0K3JjIMmZr
	 IybiRfb554GJ467gU+51VDDDq1Y3u4+Pjc0qdjwqNYfKDpl6XVeqS6mCtNwNVES8wcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lk0khO1n;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E57A60A260A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lk0khO1n
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DC631F000EF;
	Fri, 20 Nov 2026 17:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795196475;
	bh=IHp1ZPkYUZ83/9+/+lvmjSITnZBCSqciGUD+Oh9oFmk=;
	h=Date:From:To:Cc:Subject:References;
	b=lk0khO1nivBVhNMBm/MVwOSJZEvJYz7sWw7WZQ08K0K5uCRfsYtqCwVzDmUYfCqnj
	 m+BkaQtgNOcbjyfC6g/IX7yMEGOU2rzo8JgAAfk0E0Ui8X2J/dQvEjQ7ih0XkiRPJq
	 wrEUSXW0R0fixBapzElgeeJruAn1of3P6JYV21geqiCSJ4qlB6w52Sgc1v3WZfIBx0
	 qUPqzIQLSdrcnRddhdYKTIV2bs/o97eTgKXJc5Xt2qveHoQY/GTWBWWQ191kuqQ834
	 s9U7G8U2iJX1gpwA5zOlumr1fh46vsZATUYzMBYFkqLfD5bf3Xr8Qok67a9hUVsZr0
	 1ZXvvDVQaBwgA==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xUSbq-00000004aFs-37rD;
	Fri, 20 Nov 2026 12:41:14 -0500
Message-ID: <20261120174114.544875377@kernel.org>
User-Agent: quilt/0.69
Date: Fri, 20 Nov 2026 12:38:55 -0500
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Kyle Zeng <kylebot@openai.com>
Subject: [for-linus][PATCH 03/32] tracing: Restrict perf filters that read kernel strings
References: <20261120173852.687189370@kernel.org>
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

From: Kyle Zeng <kylebot@openai.com>

A task-bound, counting-only syscall tracepoint can be opened without
permission to read raw kernel tracepoint data. Setting exclude_kernel
does not prevent its filter from running: perf_syscall_enter() submits
the saved user-mode registers.

Pointer-string filters use FILTER_PRED_FN_PCHAR by default, which reads
through strncpy_from_kernel_nofault(). For sys_enter_openat, for example,
the filename field comes directly from a syscall argument. An
unprivileged caller can pass a kernel address, install a filter such as
'filename ~ "Linux version*"', and use the event count to test the
contents of kernel memory, even with perf_event_paranoid=2.

Check the compiled filter before installing it and require the same
kernel and raw-tracepoint permissions as access to raw kernel tracepoint
data for FILTER_PRED_FN_PCHAR. Inspect every predicate so that other
events, operators, and boolean expressions cannot bypass the check.
Return the permission error through the existing cleanup path before
publishing the filter.

Keep user-pointer (.ustring) and record-local predicates available under
the existing policy. This leaves tracefs filtering and authorized kernel
string filtering unchanged.

Link: https://patch.msgid.link/20261006224005.49636-1-kylebot@openai.com
Fixes: 5967bd5c4239 ("tracing: Let filter_assign_type() detect FILTER_PTR_STRING")
Assisted-by: Codex:gpt-6-astra
Signed-off-by: Kyle Zeng <kylebot@openai.com>
Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/trace_events_filter.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/kernel/trace/trace_events_filter.c b/kernel/trace/trace_events_filter.c
index c10951bcfc5f..cd0da148414d 100644
--- a/kernel/trace/trace_events_filter.c
+++ b/kernel/trace/trace_events_filter.c
@@ -2749,6 +2749,28 @@ static int ftrace_function_set_filter(struct perf_event *event,
 }
 #endif /* CONFIG_FUNCTION_TRACER */
 
+static int ftrace_profile_filter_perm(struct event_filter *filter)
+{
+	struct prog_entry *prog = rcu_dereference_protected(filter->prog,
+						lockdep_is_held(&event_mutex));
+	int i, err;
+
+	for (i = 0; prog[i].pred; i++) {
+		if (prog[i].pred->fn_num != FILTER_PRED_FN_PCHAR)
+			continue;
+
+		/*
+		 * Even a counting filter can reveal kernel string data.
+		 * Require the same access as raw kernel tracepoints.
+		 */
+		err = perf_allow_kernel();
+		if (err)
+			return err;
+		return perf_allow_tracepoint();
+	}
+	return 0;
+}
+
 int ftrace_profile_set_filter(struct perf_event *event, int event_id,
 			      char *filter_str)
 {
@@ -2770,6 +2792,10 @@ int ftrace_profile_set_filter(struct perf_event *event, int event_id,
 	if (err)
 		goto free_filter;
 
+	err = ftrace_profile_filter_perm(filter);
+	if (err)
+		goto free_filter;
+
 	if (ftrace_event_is_function(call))
 		err = ftrace_function_set_filter(event, filter);
 	else
-- 
2.53.0
