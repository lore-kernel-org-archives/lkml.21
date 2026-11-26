Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698083;
	b=fBwl9RR34nAeKdSPpjlIOQkKJQldb0PeglZrnBV08RyyYEa50bXYVG7tApybwBVYwUNi
	 0r0lYLTl8ltm/p0u+oopfmK7ukZvC8lYq3JeuK++xHtP3g+ZqQ2lQwuNtVzMGO0G/vqIA
	 6vP+l29rFHMYt8db2vzymjknUBoibEMozognJsLVhw7CARGUgaCNy5yhShU+VN7Lu2Dgk
	 nx0fQCDTGL+1sDiTkXCr6V9JKlIs6KbnsfCridSA1C1Ni6AfjzaMyCRxcg98ByE8/w9PA
	 +hNe8gNg+c8n3CQ9nHQr2W8EfejZzsEA4afZ35Mip7Z0ajeAT8JOSbFpecZ8FoPSBIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698083;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=D1tehpnC/fKTfazjtAw0gDSzdXwc0p5f1rzCrPbHgVY=;
	b=qcAD9+RPEgduGiTBpASY5jwT7hRjrymMqbcLV39nvJNvUIjVeNN3/uWtMuPjYVVX9Swt
	 Fnl0g2bDuPEoq6xiFva9UMnHgyOHj1X9pl2x1w9bi1mxVrAbj9hATgcpcHNmr6j6hofDH
	 oEodBnNeKIcwFXzAvWHl6fOopNItVtz/+ZrGhC8i6931P0OKveufMpO98gcKqSA2ua/q3
	 5sjV+621EEHY6/zhIQ2dUKInNipawRG67XkljTzEbcMk3/DIhqNrRUOfl+aOn6wGZa4ro
	 QypMlskLuYTRp8ZkcgJ86e/Zf3NlUyiVJo1AAu9fAo2jab3cYaTPUlYvS7FN1j7RA0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EstJQOYo;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B18E606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:01:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B18E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EstJQOYo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795698082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D1tehpnC/fKTfazjtAw0gDSzdXwc0p5f1rzCrPbHgVY=;
	b=EstJQOYomaat0uK7UrWL68jir/z/QRYBcKlp5A9cbYcY9wn3iYeJRiyLh4ojmr6yPi+Btb
	DGqrg1srAloxugIBQgHZTerrvgHcBqqbH5NXlX28vyJRjY6LXiRMigTzKTU/jWKtrhhpqY
	LNKEAThR/laisNUx/98sNYxZRuI6U48=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-19-pOrlFQ81Oy2jKmciGrTAoA-1; Thu,
 26 Nov 2026 13:01:20 +0000
X-MC-Unique: pOrlFQ81Oy2jKmciGrTAoA-1
X-Mimecast-MFC-AGG-ID: pOrlFQ81Oy2jKmciGrTAoA_1795698078
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 97248195609D;
	Thu, 26 Nov 2026 13:01:18 +0000 (UTC)
Received: from gmonaco-thinkpadt14gen3.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 600E91801A60;
	Thu, 26 Nov 2026 13:01:15 +0000 (UTC)
From: Gabriele Monaco <gmonaco@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Nam Cao <namcao@linutronix.de>,
	Wen Yang <wen.yang@linux.dev>,
	Tobias Schaffner <tobias.schaffner@siemens.com>,
	Viktor Malik <vmalik@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	John Ogness <john.ogness@linutronix.de>
Subject: [PATCH v3 11/18] tools/rv: Rework tracing to support generic events
Date: Thu, 26 Nov 2026 13:59:57 +0100
Message-ID: <20261126130004.127155-12-gmonaco@redhat.com>
In-Reply-To: <20261126130004.127155-1-gmonaco@redhat.com>
References: <20261126130004.127155-1-gmonaco@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

The DA event handlers parse the DA events' fields (state, event,
next_state and final_state) to print the state machine transition.
This is DA-specific and wouldn't work with LTL or generic tracepoints
(used in BPF).

Simplify the reporting to print the default representation of events,
this drops the aligned table for DA but transparently add support for
any kind of event.

Transform the my_pid check (used for -s) in an ftrace filter and set it
up for both specific and generic events to further simplify the event
handler.

Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
---
 tools/verification/rv/include/utils.h |   1 -
 tools/verification/rv/src/trace.c     | 256 +++++++++-----------------
 2 files changed, 92 insertions(+), 165 deletions(-)

diff --git a/tools/verification/rv/include/utils.h b/tools/verification/rv/include/utils.h
index d6b4e60df7ff..397a37981932 100644
--- a/tools/verification/rv/include/utils.h
+++ b/tools/verification/rv/include/utils.h
@@ -17,7 +17,6 @@ struct config {
 	bool is_container;
 	bool trace;
 	bool is_bpf;
-	int has_id;
 	int my_pid;
 	char *initial_reactor;
 	char *reactor;
diff --git a/tools/verification/rv/src/trace.c b/tools/verification/rv/src/trace.c
index aa4bb73624ec..6fdbff2c28d4 100644
--- a/tools/verification/rv/src/trace.c
+++ b/tools/verification/rv/src/trace.c
@@ -15,11 +15,13 @@
 #include <trace.h>
 #include <utils.h>
 
+#define FILTER_MAX 128
+
 /**
- * collect_registered_events - call the existing callback function for the event
+ * collect_registered_events - print an event collected from the trace buffer
  *
- * If an event has a registered callback function, call it.
- * Otherwise, ignore the event.
+ * Print the event with a standard prefix for common fields and the
+ * event-specific pretty-print for the event content.
  *
  * Returns 0 if the event was collected, 1 if the tool should stop collecting trace.
  */
@@ -33,10 +35,12 @@ collect_registered_events(struct tep_event *event, struct tep_record *record,
 	if (should_stop())
 		return 1;
 
-	if (!event->handler)
-		return 0;
+	tep_print_event(event->tep, s, record, "%16s-%-8d [%.3d] %s: %s\n",
+			TEP_PRINT_COMM, TEP_PRINT_PID, TEP_PRINT_CPU,
+			TEP_PRINT_NAME, TEP_PRINT_INFO);
 
-	event->handler(s, record, event, context);
+	trace_seq_do_printf(s);
+	trace_seq_reset(s);
 
 	return 0;
 }
@@ -109,176 +113,111 @@ int trace_instance_init(struct trace_instance *trace, char *name)
 }
 
 /**
- * trace_instance_start - start tracing a given rv instance
- *
- * Returns 0 on success, -1 otherwise.
+ * trace_print_header - print the header of the monitor events output
  */
-int trace_instance_start(struct trace_instance *trace)
+void trace_print_header(struct trace_seq *s)
 {
-	return tracefs_trace_on(trace->inst);
+	trace_seq_printf(s, "%16s-%-8s %5s %5s\n", "<TASK>", "PID", "[CPU]", "TYPE");
+	trace_seq_printf(s, "%16s %-8s %5s %5s\n", " | ", " | ", " | ", " | ");
+	trace_seq_do_printf(s);
+	trace_seq_reset(s);
 }
 
-static int monitor_has_id(char *name)
+/*
+ * apply_filter_enable - if a filter is provided, apply it, then enable the event
+ */
+static int apply_filter_enable(struct trace_instance *inst,
+			       struct tep_event *tevent, const char *filter)
 {
-	char path[MAX_PATH];
-	char *format;
-	int has_id;
-
-	snprintf(path, MAX_PATH, "events/rv/event_%s/format", name);
-	format = tracefs_instance_file_read(NULL, path, NULL);
-	if (!format) {
-		err_msg("rv: fail reading monitor's %s format event file\n", name);
-		return -1;
+	if (*filter) {
+		if (tracefs_event_filter_apply(inst->inst, tevent, filter) < 0) {
+			char *err = tracefs_error_last(inst->inst);
+
+			err_msg("trace: fail applying filter %s to event %s:\n%s\n",
+				filter, tevent->name, err ?: "(no error)");
+			free(err);
+			return -1;
+		}
 	}
 
-	/* print fmt: "%d: %s x %s -> %s %s", REC->id, ... */
-	has_id = !!strstr(format, "REC->id");
-
-	debug_msg("rv: monitor %s has id: %s\n", name, has_id ? "yes" : "no");
+	if (tracefs_event_enable(inst->inst, tevent->system, tevent->name) < 0) {
+		err_msg("trace: fail enabling the rv:%s event: %s\n",
+			tevent->name, strerror(errno));
+		return -1;
+	}
 
-	free(format);
+	return 0;
 
-	return has_id;
-}
-
-/**
- * trace_print_header - print the header of the monitor events output
- *
- * Print the column header of the rv monitor events output: task, pid,
- * cpu and event type, followed by the state machine transition
- * (state x event -> next state and final). The ID column is printed
- * only if the monitor's events have an id field.
- */
-void trace_print_header(struct trace_seq *s)
-{
-	trace_seq_printf(s, "%16s-%-8s %5s %5s ", "<TASK>", "PID", "[CPU]", "TYPE");
-	if (config.has_id)
-		trace_seq_printf(s, "%8s ", "ID");
-
-	trace_seq_printf(s, "%24s x %-24s -> %-24s %s\n",
-			 "STATE",
-			 "EVENT",
-			 "NEXT_STATE",
-			 "FINAL");
-
-	trace_seq_printf(s, "%16s %-8s %5s %5s ", " | ", " | ", " | ", " | ");
-
-	if (config.has_id)
-		trace_seq_printf(s, "%8s ", " | ");
-
-	trace_seq_printf(s, "%24s   %-24s    %-24s %s\n",
-			 " | ",
-			 " | ",
-			 " | ",
-			 "|");
 }
 
 /*
- * da_event_handler - callback to handle event events
- *
- * Called any time a rv:"monitor"_event events is generated.
- * It parses and prints event.
+ * enable_specific_event - enable a monitor-specific event with filters
  */
-static int da_event_handler(struct trace_seq *s, struct tep_record *record,
-			    struct tep_event *trace_event, void *context)
+static int enable_specific_event(struct trace_instance *inst, const char *event_name)
 {
-	char *state, *event, *next_state;
-	unsigned long long final_state;
-	unsigned long long pid;
-	unsigned long long id;
-	int val;
-	bool missing_id;
-
-	if (config.has_id)
-		missing_id = tep_get_field_val(s, trace_event, "id", record, &id, 1);
-
-	tep_get_common_field_val(s, trace_event, "common_pid", record, &pid, 1);
+	struct tep_event *tevent = tep_find_event_by_name(inst->tep, "rv", event_name);
+	char filter[FILTER_MAX] = "";
 
-	if (config.has_id && (config.my_pid == id))
-		return 0;
-	else if (config.my_pid == pid)
-		return 0;
-
-	tep_print_event(trace_event->tep, s, record, "%16s-%-8d [%.3d] ",
-			TEP_PRINT_COMM, TEP_PRINT_PID, TEP_PRINT_CPU);
-
-	if (config.is_container)
-		tep_print_event(trace_event->tep, s, record, "%s ", TEP_PRINT_NAME);
-	else
-		trace_seq_printf(s, "event ");
+	if (!tevent) {
+		err_msg("trace: fail finding the rv:%s event\n", event_name);
+		return -1;
+	}
 
-	if (config.has_id) {
-		if (missing_id)
-			/* placeholder if we are dealing with a mixed-type container*/
-			trace_seq_printf(s, "        ");
+	if (config.my_pid > 0) {
+		if (tep_find_field(tevent, "id"))
+			snprintf(filter, sizeof(filter), "common_pid != %d && id != %d",
+				 config.my_pid, config.my_pid);
 		else
-			trace_seq_printf(s, "%8llu ", id);
+			snprintf(filter, sizeof(filter), "common_pid != %d",
+				 config.my_pid);
 	}
 
-	state = tep_get_field_raw(s, trace_event, "state", record, &val, 0);
-	event = tep_get_field_raw(s, trace_event, "event", record, &val, 0);
-	next_state = tep_get_field_raw(s, trace_event, "next_state", record, &val, 0);
-	tep_get_field_val(s, trace_event, "final_state", record, &final_state, 1);
-
-	trace_seq_printf(s, "%24s x %-24s -> %-24s %s\n",
-			 state,
-			 event,
-			 next_state,
-			 final_state ? "Y" : "N");
-
-	trace_seq_do_printf(s);
-	trace_seq_reset(s);
-
-	return 0;
+	return apply_filter_enable(inst, tevent, filter);
 }
 
 /*
- * da_error_handler - callback to handle error events
- *
- * Called any time a rv:"monitor"_errors events is generated.
- * It parses and prints event.
+ * enable_generic_event - enable a generic event with filters
  */
-static int da_error_handler(struct trace_seq *s, struct tep_record *record,
-			    struct tep_event *trace_event, void *context)
+static int enable_generic_event(struct trace_instance *inst, const char *event_name, char *name)
 {
-	unsigned long long pid, id;
-	int cpu = record->cpu;
-	char *state, *event;
-	int val;
-	bool missing_id;
-
-	if (config.has_id)
-		missing_id = tep_get_field_val(s, trace_event, "id", record, &id, 1);
-
-	tep_get_common_field_val(s, trace_event, "common_pid", record, &pid, 1);
-
-	if (config.has_id && config.my_pid == id)
-		return 0;
-	else if (config.my_pid == pid)
-		return 0;
-
-	trace_seq_printf(s, "%8lld [%03d] ", pid, cpu);
+	struct tep_event *tevent = tep_find_event_by_name(inst->tep, "rv", event_name);
+	char filter[FILTER_MAX] = "";
+	size_t len;
 
-	if (config.is_container)
-		tep_print_event(trace_event->tep, s, record, "%s ", TEP_PRINT_NAME);
-	else
-		trace_seq_printf(s, "error ");
+	if (!tevent) {
+		err_msg("trace: fail finding the rv:%s event\n", event_name);
+		return -1;
+	}
 
-	if (config.has_id) {
-		if (missing_id)
-			/* placeholder if we are dealing with a mixed-type container*/
-			trace_seq_printf(s, "        ");
-		else
-			trace_seq_printf(s, "%8llu ", id);
+	len = snprintf(filter, sizeof(filter), "mon == \"%s\"", name);
+	if (len >= sizeof(filter)) {
+		err_msg("trace: monitor name %s too long\n", name);
+		return -1;
 	}
 
-	state = tep_get_field_raw(s, trace_event, "state", record, &val, 0);
-	event = tep_get_field_raw(s, trace_event, "event", record, &val, 0);
+	if (config.my_pid > 0)
+		snprintf(filter + len, sizeof(filter) - len,
+			 " && common_pid != %d && !(has_id == 1 && id == %d)",
+			 config.my_pid, config.my_pid);
 
-	trace_seq_printf(s, "%24s x %s\n", state, event);
+	return apply_filter_enable(inst, tevent, filter);
+}
 
-	trace_seq_do_printf(s);
-	trace_seq_reset(s);
+/*
+ * enable_bpf_events - enable rv:event_monitor and rv:error_monitor for a monitor
+ *
+ * BPF monitors report via generic rv:event_monitor and rv:error_monitor events.
+ * Enable the events and filter them to only collect the messages of the given monitor.
+ *
+ * Returns 0 on success, -1 otherwise.
+ */
+static int enable_bpf_events(struct trace_instance *inst, char *name)
+{
+	if (enable_generic_event(inst, "event_monitor", name))
+		return -1;
+
+	if (enable_generic_event(inst, "error_monitor", name))
+		return -1;
 
 	return 0;
 }
@@ -287,35 +226,24 @@ static int da_error_handler(struct trace_seq *s, struct tep_record *record,
  * trace_enable_monitor_events - enable a monitor's events in a trace instance
  *
  * Enable the rv:event_"monitor" and rv:error_"monitor" events in the
- * given trace instance, and register the callbacks that parse and
- * print these events.
+ * given trace instance, and register the filters for these events.
+ * If enabled, the filter for self pid (-s) is applied here.
  *
  * Returns 0 on success, -1 otherwise.
  */
 static int trace_enable_monitor_events(struct trace_instance *inst, char *name)
 {
 	char event[MAX_DA_NAME_LEN + 7]; /* max(error_,event_) + '0' = 7 */
-	int retval;
+
+	if (config.is_bpf)
+		return enable_bpf_events(inst, name);
 
 	snprintf(event, sizeof(event), "event_%s", name);
-	retval = tracefs_event_enable(inst->inst, "rv",  event);
-	if (retval)
+	if (enable_specific_event(inst, event))
 		return -1;
 
-	tep_register_event_handler(inst->tep, -1, "rv", event,
-				   da_event_handler, NULL);
-
 	snprintf(event, sizeof(event), "error_%s", name);
-	retval = tracefs_event_enable(inst->inst, "rv", event);
-	if (retval)
-		return -1;
-
-	tep_register_event_handler(inst->tep, -1, "rv", event,
-				   da_error_handler, NULL);
-
-	/* set if at least 1 monitor has id in case of a container */
-	config.has_id = monitor_has_id(name);
-	if (config.has_id < 0)
+	if (enable_specific_event(inst, event))
 		return -1;
 
 	return 0;
-- 
2.56.1

