Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429396;
	b=wvYReGZYLZDEAyO9EmGJBzn5QaGnNEiwK336uQa7Vlai1YXOdsIBMP3ma1FdlKnxlcxc
	 AtvxKVHsF7dDSOSfjtZfWLijb01QbGsLOORKbi3tZ8eK5cp/rRU0lEb6W0v58Wx7GNxBb
	 ORTVVmbpurz1MvcCslnsYViKUK7EAgYvdAY7r7eGmwfHjB7Dzatiht+cvOv74VKHvsDq3
	 Et7+s4pgUsSunGE2yxrHN32iwO7zaLSAIe9qtMlo52eEeenysA4Nosy4fDrlFKdSYjgXI
	 dpq4QMbMmFkeHVXdsmH1qiI4QWRntFYfQ6qjiXWUOnPbXeIh543sC3ttvRcc9jZokWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429396;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=O/TVybr8Y41ODysXPEJFTx9rL5xSFvq+OlfoIENk3fU=;
	b=jklQhDbDggJrknzu7SQBNxd1/dWoHqlz4Uu0NdB4SRCvBHFv2e7SaWtBL7n/xuO3fkNq
	 4F7dJv+6K17ShwLGiqUr7SKzKFamWVeu+DI28Num5qiLDrVFuVBb27lmMbnaocYwtNHLq
	 6/ae7X7jpSkEPtGvzNKbXP2x6Rl8mYBzONsakHHPqyq8agN0NEtGJUxh2pq9L6AF3YU71
	 //NFdkv3tJnKp0d1xb7TaOj4qaMe+UMXXK8QHfOAE1JuF9iwgQOqvgEYNTmXEUYCaoI85
	 1HRGm5F76wXOG5cP1SEk9UMe9JzTT+MAicKkPdYo2eEuAlLEV/ldQzD1eXiiDDOsOag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=SDGH8ifw;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=hUXdo6hR;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1DE606A332;
	Mon, 23 Nov 2026 10:23:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C1DE606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=SDGH8ifw;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=hUXdo6hR
Date: Mon, 23 Nov 2026 10:23:12 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795429394;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O/TVybr8Y41ODysXPEJFTx9rL5xSFvq+OlfoIENk3fU=;
	b=SDGH8ifwaVX10tLeGvCe8z3DX3xZ6IBz0POKC5ix/qBL+tKqnH7TevsIXRD6wbNo0jwv2U
	7MVift2ZejNmijQ8+EmdbjaGKh4+jIn7HZH9Pql9f9JltPuX1L/t+nKyklqDZ2P1fDRMQc
	eal7W9zt9E7c+AimgZu9UZ2gQ8ht3KzmbsUdCkdLOwO+0XjhJENrJ+KtJqkFcfEoOSVMrQ
	zk3IW+AmaQHJvm2dWKiL4reh3RGyLwifDR/YTX48HAoax/rPfz3TQaaZT9whxSBR2eJ8Lj
	xPQVYQMLrZL/dkRY4nrctJnXXEY+7H4R4QK42eLV1jrlTOZU9dbGCPQVdKnx3w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795429394;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O/TVybr8Y41ODysXPEJFTx9rL5xSFvq+OlfoIENk3fU=;
	b=hUXdo6hRMHRrTdeK4rDN0ZX2zO83MY8fp7vhyPWvQp7mCrVYpTXVpAJLETnuYeLQwcuP3U
	DzM/8mj1umrdldDw==
From: "tip-bot2 for Usama Arif" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/core] perf/core: Don't zero perf_sample_data
Cc: Usama Arif <usama.arif@linux.dev>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261119211235.99805-4-usama.arif@linux.dev>
References: <20261119211235.99805-4-usama.arif@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179542939252.92412.16634687106310976644.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/core branch of tip:

Commit-ID:     9d63bfc5021337ab460d2bc49be175dd131021e9
Gitweb:        https://git.kernel.org/tip/9d63bfc5021337ab460d2bc49be175dd131=
021e9
Author:        Usama Arif <usama.arif@linux.dev>
AuthorDate:    Thu, 19 Nov 2026 13:10:46 -08:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 23 Nov 2026 10:57:48 +01:00

perf/core: Don't zero perf_sample_data

Kernels built with CONFIG_INIT_STACK_ALL_ZERO, the default when the
compiler supports it, clear every local variable on function entry. For
the 256-byte struct perf_sample_data in do_perf_sw_event() that is a
memset, and it runs on every entry, before the list of events is even
looked up.

do_perf_sw_event() is entered for a software event, e.g. a context
switch, as soon as one event of that kind is open anywhere in the
system. Counting events add to event->count and never read the struct.
For every matching event, perf_sample_data_init() resets sample_flags,
period and dyn_size and stores the address if there is one; for a
sampling event, perf_prepare_sample() then fills in what its
sample_type asks for.

A single context-switch counter, e.g. one kept open by a monitoring
daemon, is enough for every context switch on the machine to pay for
the clearing. On hosts running many small VMs, ___perf_sw_event() is
0.3% of all kernel cycles, and the memset about a seventh of that.

Mark the struct __uninitialized, which is what kernels without stack
auto-initialization get anyway. Because its contents are copied into a
ring buffer that userspace maps, every field that is read must have
been written first. That holds for perf_output_sample(), and with the
previous patch also for what a BPF program can read through
bpf_perf_event_data.

In a KVM guest on AMD Zen 5 with software counters open on every CPU,
this cuts the time they add to a context switch from 54 ns to 44 ns
(sched_yield() between two threads on one CPU, with
spec_rstack_overflow=3Doff).

[ peterz: If one is safe and beneficial, then all are. ]

Signed-off-by: Usama Arif <usama.arif@linux.dev>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://patch.msgid.link/20261119211235.99805-4-usama.arif@linux.dev
---
 kernel/events/core.c | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 38dac15..773b132 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -9121,7 +9121,7 @@ perf_event_read_event(struct perf_event *event,
 			struct task_struct *task)
 {
 	struct perf_output_handle handle;
-	struct perf_sample_data sample;
+	struct perf_sample_data sample __uninitialized;
 	struct perf_read_event read_event =3D {
 		.pid =3D perf_event_pid(event, task),
 		.tid =3D perf_event_tid(event, task),
@@ -9388,7 +9388,7 @@ static void perf_event_task_output(struct perf_event *e=
vent,
 {
 	struct perf_task_event *task_event =3D data;
 	struct perf_output_handle handle;
-	struct perf_sample_data	sample;
+	struct perf_sample_data	sample __uninitialized;
 	struct task_struct *task =3D task_event->task;
 	int ret;
=20
@@ -9532,7 +9532,7 @@ static void perf_event_comm_output(struct perf_event *e=
vent,
 {
 	struct perf_comm_event *comm_event =3D data;
 	struct perf_output_handle handle;
-	struct perf_sample_data sample;
+	struct perf_sample_data sample __uninitialized;
 	int ret;
=20
 	if (!perf_event_comm_match(event))
@@ -9623,7 +9623,7 @@ static void perf_event_namespaces_output(struct perf_ev=
ent *event,
 {
 	struct perf_namespaces_event *namespaces_event =3D data;
 	struct perf_output_handle handle;
-	struct perf_sample_data sample;
+	struct perf_sample_data sample __uninitialized;
 	int ret;
=20
 	if (!perf_event_namespaces_match(event))
@@ -9746,7 +9746,7 @@ static void perf_event_cgroup_output(struct perf_event =
*event, void *data)
 {
 	struct perf_cgroup_event *cgroup_event =3D data;
 	struct perf_output_handle handle;
-	struct perf_sample_data sample;
+	struct perf_sample_data sample __uninitialized;
 	int ret;
 	u16 size =3D sizeof(cgroup_event->event_id) + cgroup_event->path_size;
=20
@@ -9857,7 +9857,7 @@ static void perf_event_mmap_output(struct perf_event *e=
vent,
 {
 	struct perf_mmap_event *mmap_event =3D data;
 	struct perf_output_handle handle;
-	struct perf_sample_data sample;
+	struct perf_sample_data sample __uninitialized;
 	int size =3D sizeof(mmap_event->event_id) + mmap_event->file_size;
 	u32 type =3D PERF_RECORD_MMAP;
 	u16 misc =3D PERF_RECORD_MISC_USER;
@@ -10153,7 +10153,7 @@ void perf_event_aux_event(struct perf_event *event, u=
nsigned long head,
 			  unsigned long size, u64 flags)
 {
 	struct perf_output_handle handle;
-	struct perf_sample_data sample;
+	struct perf_sample_data sample __uninitialized;
 	struct perf_aux_event {
 		struct perf_event_header	header;
 		u64				offset;
@@ -10186,7 +10186,7 @@ void perf_event_aux_event(struct perf_event *event, u=
nsigned long head,
 void perf_log_lost_samples(struct perf_event *event, u64 lost)
 {
 	struct perf_output_handle handle;
-	struct perf_sample_data sample;
+	struct perf_sample_data sample __uninitialized;
 	int ret;
=20
 	struct {
@@ -10238,7 +10238,7 @@ static void perf_event_switch_output(struct perf_even=
t *event, void *data)
 {
 	struct perf_switch_event *se =3D data;
 	struct perf_output_handle handle;
-	struct perf_sample_data sample;
+	struct perf_sample_data sample __uninitialized;
 	u32 type;
 	u16 misc;
 	u16 size;
@@ -10305,7 +10305,7 @@ static void perf_event_switch(struct task_struct *tas=
k,
 static void perf_log_throttle(struct perf_event *event, int enable)
 {
 	struct perf_output_handle handle;
-	struct perf_sample_data sample;
+	struct perf_sample_data sample __uninitialized;
 	int ret;
=20
 	struct {
@@ -10361,7 +10361,7 @@ static void perf_event_ksymbol_output(struct perf_eve=
nt *event, void *data)
 {
 	struct perf_ksymbol_event *ksymbol_event =3D data;
 	struct perf_output_handle handle;
-	struct perf_sample_data sample;
+	struct perf_sample_data sample __uninitialized;
 	int ret;
 	u16 size =3D sizeof(ksymbol_event->event_id) + ksymbol_event->name_len;
=20
@@ -10448,7 +10448,7 @@ static void perf_event_bpf_output(struct perf_event *=
event, void *data)
 {
 	struct perf_bpf_event *bpf_event =3D data;
 	struct perf_output_handle handle;
-	struct perf_sample_data sample;
+	struct perf_sample_data sample __uninitialized;
 	int ret;
=20
 	if (!perf_event_bpf_match(event))
@@ -10538,7 +10538,7 @@ static void perf_callchain_deferred_output(struct per=
f_event *event, void *data)
 {
 	struct perf_callchain_deferred_event *deferred_event =3D data;
 	struct perf_output_handle handle;
-	struct perf_sample_data sample;
+	struct perf_sample_data sample __uninitialized;
 	u64 nr =3D deferred_event->trace->nr;
 	u16 size, id_size, max_payload;
 	int ret;
@@ -10613,7 +10613,7 @@ static void perf_event_text_poke_output(struct perf_e=
vent *event, void *data)
 {
 	struct perf_text_poke_event *text_poke_event =3D data;
 	struct perf_output_handle handle;
-	struct perf_sample_data sample;
+	struct perf_sample_data sample __uninitialized;
 	u16 size =3D sizeof(text_poke_event->event_id) + text_poke_event->tot + tex=
t_poke_event->pad;
 	u64 padding =3D 0;
 	int ret;
@@ -10684,7 +10684,7 @@ EXPORT_SYMBOL_GPL(perf_event_itrace_started);
 static void perf_log_itrace_start(struct perf_event *event)
 {
 	struct perf_output_handle handle;
-	struct perf_sample_data sample;
+	struct perf_sample_data sample __uninitialized;
 	struct perf_aux_event {
 		struct perf_event_header        header;
 		u32				pid;
@@ -10719,7 +10719,7 @@ static void perf_log_itrace_start(struct perf_event *=
event)
 void perf_report_aux_output_id(struct perf_event *event, u64 hw_id)
 {
 	struct perf_output_handle handle;
-	struct perf_sample_data sample;
+	struct perf_sample_data sample __uninitialized;
 	struct perf_aux_event {
 		struct perf_event_header        header;
 		u64				hw_id;
@@ -11210,7 +11210,7 @@ static void do_perf_sw_event(enum perf_type_id type, =
u32 event_id,
 				    u64 nr, struct pt_regs *regs, u64 addr)
 {
 	struct swevent_htable *swhash =3D this_cpu_ptr(&swevent_htable);
-	struct perf_sample_data data;
+	struct perf_sample_data data __uninitialized;
 	struct perf_event *event;
 	struct hlist_head *head;
=20
@@ -11601,7 +11601,7 @@ void perf_tp_event(u16 event_type, u64 count, void *r=
ecord, int entry_size,
 		   struct pt_regs *regs, struct hlist_head *head, int rctx,
 		   struct task_struct *task)
 {
-	struct perf_sample_data data;
+	struct perf_sample_data data __uninitialized;
 	struct perf_event *event;
=20
 	/*
@@ -11947,7 +11947,7 @@ void perf_event_free_bpf_prog(struct perf_event *even=
t)
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
 void perf_bp_event(struct perf_event *bp, void *data)
 {
-	struct perf_sample_data sample;
+	struct perf_sample_data sample __uninitialized;
 	struct pt_regs *regs =3D data;
=20
 	/*
@@ -12401,7 +12401,7 @@ static int perf_event_set_filter(struct perf_event *e=
vent, void __user *arg)
 static enum hrtimer_restart perf_swevent_hrtimer(struct hrtimer *hrtimer)
 {
 	enum hrtimer_restart ret =3D HRTIMER_RESTART;
-	struct perf_sample_data data;
+	struct perf_sample_data data __uninitialized;
 	struct pt_regs *regs;
 	struct perf_event *event;
 	u64 period;
