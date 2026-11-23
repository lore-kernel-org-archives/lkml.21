Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429393;
	b=TxApzvBba7HbHIEpSwhto2RSMfNSPR+dMZbXT06iajQcTvQX7mLLx3LPvapnFkxKhfjE
	 DoUiQzIJihO4R2vwSYW/vmI+vaLn8rAl5LOMYuN+Gm7vnGr2bBwt0JuNoLkNSBSx8R1kh
	 mCimREw7RKq8gwv2IEE4cx82y/2ORut+/Gq0sjY2r4t19/Ut764Vfm1/Apd1mcJ022h3J
	 lRkhQ1xsbUEKuwANRsuzjoPAkJ+zHuzFEHX5DEt/h5K0DSEPcpcjyjGh4fw60oNgmmKpf
	 Bj+H73YLc4YAX+3y6LZTBooEnfTuFTehJXemsgLaW73OaAHiNykVokRHMFwJhvGCKPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429393;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:MIME-Version:Message-ID:Robot-ID:Robot-Unsubscribe:
	 Precedence:Content-Type:Content-Transfer-Encoding;
	bh=ifLlezIxkPrT4GLuIhGPGVXUIIgwFMyKWVVTzR6FeG0=;
	b=D+WqKpHskoqDgvaNr81/wgOIN+gJsI1dAvkStPbtkOJvdUmpsXnsNGM/XofE/WiyD6mG
	 X/MkzAKvANO2W9Ct8pEQDRKtiSoRGW10s1xDobApH+01ZYotXMXT7unOavHtEEFuWMEWB
	 vLv49W6GeQtfnkOuDLH0hNQhe8H+Co9t6DDjPen0441nBR1/j7G1H8C8Lhn/fpqXZHv0O
	 dNsYmJCk9hmTFpmjTSLwdIZBjhbAnlPc9HUW1k0NerzNzM1q0apbBLha54hRzTw+uhIZV
	 TKepb4hyFf8/kI+muxGA3ArLrCdiDBxcvPjH88W8cGm5Fww5eCRJpm/VId1zXr1D35A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="IUD/lhp1";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=SOJcEZE+;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF819606A32E;
	Mon, 23 Nov 2026 10:23:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF819606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=IUD/lhp1;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=SOJcEZE+
Date: Mon, 23 Nov 2026 10:23:09 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795429391;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=ifLlezIxkPrT4GLuIhGPGVXUIIgwFMyKWVVTzR6FeG0=;
	b=IUD/lhp1anGJqm/rPEKUfC6X63xzbWtb9vMZAYnqQgp4flkf4zAJ6GqWhaNa82TZ3Gecf+
	deeshPR7TfbIZceZILccQeZKN4HpsyTR348aqy0YVBRwPPVamlV+gve3XpK/xORqnQcJZr
	woCwNbG2+qFnP+6ta1LlGGtxnn9VL1qL1XjKmVkoQAtOqXRoxgFfcws6Ur2dnT2Ft2aOg3
	+JKdufEMfJOaM3cVJQn43hCZSu7hl1H/1N7tYA63tkBas7MRuwQNxVZfOPCccKmYm8xzLB
	Qv/4tPvt+tGa+1PSv6QJrdbPEW6r4K5YNsnxo0YtUpd+SR2h9hYDpTmETQeDeA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795429391;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=ifLlezIxkPrT4GLuIhGPGVXUIIgwFMyKWVVTzR6FeG0=;
	b=SOJcEZE+GuOVL+eBDatY31EF1+nM534l3EtpnttXetQtAfOGujgJmQT75zHlxIid+O48eh
	TKu9HIrebLfAsOBA==
From: "tip-bot2 for Ingo Molnar" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/core] perf/core: Document __uninitialized uses for
 perf_sample_data as an optimization
Cc: Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 linux-kernel@vger.kernel.org, x86@kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179542938917.92412.16705755549109056963.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/core branch of tip:

Commit-ID:     924bed4c0ab92053f0dc7cb22a9a9181a4f8bcb8
Gitweb:        https://git.kernel.org/tip/924bed4c0ab92053f0dc7cb22a9a9181a4f=
8bcb8
Author:        Ingo Molnar <mingo@kernel.org>
AuthorDate:    Mon, 23 Nov 2026 11:06:42 +01:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 23 Nov 2026 11:13:50 +01:00

perf/core: Document __uninitialized uses for perf_sample_data as an optimizat=
ion

Historically the usual reason to use __uninitialized was to work
around up a compiler warning - but sometimes we use it to optimize
the code when CONFIG_INIT_STACK_ALL_ZERO=3Dy, which is basically all
distro kernels.

Document the perf_sample_data __uninitialized annotations as
an optimization.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org
---
 kernel/events/core.c | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 4bf6a53..366fca0 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -9121,7 +9121,7 @@ perf_event_read_event(struct perf_event *event,
 			struct task_struct *task)
 {
 	struct perf_output_handle handle;
-	struct perf_sample_data sample __uninitialized;
+	struct perf_sample_data sample __uninitialized; /* optimization */
 	struct perf_read_event read_event =3D {
 		.pid =3D perf_event_pid(event, task),
 		.tid =3D perf_event_tid(event, task),
@@ -9388,7 +9388,7 @@ static void perf_event_task_output(struct perf_event *e=
vent,
 {
 	struct perf_task_event *task_event =3D data;
 	struct perf_output_handle handle;
-	struct perf_sample_data	sample __uninitialized;
+	struct perf_sample_data	sample __uninitialized; /* optimization */
 	struct task_struct *task =3D task_event->task;
 	int ret;
=20
@@ -9532,7 +9532,7 @@ static void perf_event_comm_output(struct perf_event *e=
vent,
 {
 	struct perf_comm_event *comm_event =3D data;
 	struct perf_output_handle handle;
-	struct perf_sample_data sample __uninitialized;
+	struct perf_sample_data sample __uninitialized; /* optimization */
 	int ret;
=20
 	if (!perf_event_comm_match(event))
@@ -9623,7 +9623,7 @@ static void perf_event_namespaces_output(struct perf_ev=
ent *event,
 {
 	struct perf_namespaces_event *namespaces_event =3D data;
 	struct perf_output_handle handle;
-	struct perf_sample_data sample __uninitialized;
+	struct perf_sample_data sample __uninitialized; /* optimization */
 	int ret;
=20
 	if (!perf_event_namespaces_match(event))
@@ -9746,7 +9746,7 @@ static void perf_event_cgroup_output(struct perf_event =
*event, void *data)
 {
 	struct perf_cgroup_event *cgroup_event =3D data;
 	struct perf_output_handle handle;
-	struct perf_sample_data sample __uninitialized;
+	struct perf_sample_data sample __uninitialized; /* optimization */
 	int ret;
 	u16 size =3D sizeof(cgroup_event->event_id) + cgroup_event->path_size;
=20
@@ -9857,7 +9857,7 @@ static void perf_event_mmap_output(struct perf_event *e=
vent,
 {
 	struct perf_mmap_event *mmap_event =3D data;
 	struct perf_output_handle handle;
-	struct perf_sample_data sample __uninitialized;
+	struct perf_sample_data sample __uninitialized; /* optimization */
 	int size =3D sizeof(mmap_event->event_id) + mmap_event->file_size;
 	u32 type =3D PERF_RECORD_MMAP;
 	u16 misc =3D PERF_RECORD_MISC_USER;
@@ -10153,7 +10153,7 @@ void perf_event_aux_event(struct perf_event *event, u=
nsigned long head,
 			  unsigned long size, u64 flags)
 {
 	struct perf_output_handle handle;
-	struct perf_sample_data sample __uninitialized;
+	struct perf_sample_data sample __uninitialized; /* optimization */
 	struct perf_aux_event {
 		struct perf_event_header	header;
 		u64				offset;
@@ -10186,7 +10186,7 @@ void perf_event_aux_event(struct perf_event *event, u=
nsigned long head,
 void perf_log_lost_samples(struct perf_event *event, u64 lost)
 {
 	struct perf_output_handle handle;
-	struct perf_sample_data sample __uninitialized;
+	struct perf_sample_data sample __uninitialized; /* optimization */
 	int ret;
=20
 	struct {
@@ -10238,7 +10238,7 @@ static void perf_event_switch_output(struct perf_even=
t *event, void *data)
 {
 	struct perf_switch_event *se =3D data;
 	struct perf_output_handle handle;
-	struct perf_sample_data sample __uninitialized;
+	struct perf_sample_data sample __uninitialized; /* optimization */
 	u32 type;
 	u16 misc;
 	u16 size;
@@ -10305,7 +10305,7 @@ static void perf_event_switch(struct task_struct *tas=
k,
 static void perf_log_throttle(struct perf_event *event, int enable)
 {
 	struct perf_output_handle handle;
-	struct perf_sample_data sample __uninitialized;
+	struct perf_sample_data sample __uninitialized; /* optimization */
 	int ret;
=20
 	struct {
@@ -10361,7 +10361,7 @@ static void perf_event_ksymbol_output(struct perf_eve=
nt *event, void *data)
 {
 	struct perf_ksymbol_event *ksymbol_event =3D data;
 	struct perf_output_handle handle;
-	struct perf_sample_data sample __uninitialized;
+	struct perf_sample_data sample __uninitialized; /* optimization */
 	int ret;
 	u16 size =3D sizeof(ksymbol_event->event_id) + ksymbol_event->name_len;
=20
@@ -10448,7 +10448,7 @@ static void perf_event_bpf_output(struct perf_event *=
event, void *data)
 {
 	struct perf_bpf_event *bpf_event =3D data;
 	struct perf_output_handle handle;
-	struct perf_sample_data sample __uninitialized;
+	struct perf_sample_data sample __uninitialized; /* optimization */
 	int ret;
=20
 	if (!perf_event_bpf_match(event))
@@ -10538,7 +10538,7 @@ static void perf_callchain_deferred_output(struct per=
f_event *event, void *data)
 {
 	struct perf_callchain_deferred_event *deferred_event =3D data;
 	struct perf_output_handle handle;
-	struct perf_sample_data sample __uninitialized;
+	struct perf_sample_data sample __uninitialized; /* optimization */
 	u64 nr =3D deferred_event->trace->nr;
 	u16 size, id_size, max_payload;
 	int ret;
@@ -10613,7 +10613,7 @@ static void perf_event_text_poke_output(struct perf_e=
vent *event, void *data)
 {
 	struct perf_text_poke_event *text_poke_event =3D data;
 	struct perf_output_handle handle;
-	struct perf_sample_data sample __uninitialized;
+	struct perf_sample_data sample __uninitialized; /* optimization */
 	u16 size =3D sizeof(text_poke_event->event_id) + text_poke_event->tot + tex=
t_poke_event->pad;
 	u64 padding =3D 0;
 	int ret;
@@ -10684,7 +10684,7 @@ EXPORT_SYMBOL_GPL(perf_event_itrace_started);
 static void perf_log_itrace_start(struct perf_event *event)
 {
 	struct perf_output_handle handle;
-	struct perf_sample_data sample __uninitialized;
+	struct perf_sample_data sample __uninitialized; /* optimization */
 	struct perf_aux_event {
 		struct perf_event_header        header;
 		u32				pid;
@@ -10719,7 +10719,7 @@ static void perf_log_itrace_start(struct perf_event *=
event)
 void perf_report_aux_output_id(struct perf_event *event, u64 hw_id)
 {
 	struct perf_output_handle handle;
-	struct perf_sample_data sample __uninitialized;
+	struct perf_sample_data sample __uninitialized; /* optimization */
 	struct perf_aux_event {
 		struct perf_event_header        header;
 		u64				hw_id;
@@ -11210,7 +11210,7 @@ static void do_perf_sw_event(enum perf_type_id type, =
u32 event_id,
 				    u64 nr, struct pt_regs *regs, u64 addr)
 {
 	struct swevent_htable *swhash =3D this_cpu_ptr(&swevent_htable);
-	struct perf_sample_data sample __uninitialized;
+	struct perf_sample_data sample __uninitialized; /* optimization */
 	struct perf_event *event;
 	struct hlist_head *head;
=20
@@ -11601,7 +11601,7 @@ void perf_tp_event(u16 event_type, u64 count, void *r=
ecord, int entry_size,
 		   struct pt_regs *regs, struct hlist_head *head, int rctx,
 		   struct task_struct *task)
 {
-	struct perf_sample_data sample __uninitialized;
+	struct perf_sample_data sample __uninitialized; /* optimization */
 	struct perf_event *event;
=20
 	/*
@@ -11947,7 +11947,7 @@ void perf_event_free_bpf_prog(struct perf_event *even=
t)
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
 void perf_bp_event(struct perf_event *bp, void *data)
 {
-	struct perf_sample_data sample __uninitialized;
+	struct perf_sample_data sample __uninitialized; /* optimization */
 	struct pt_regs *regs =3D data;
=20
 	/*
@@ -12401,7 +12401,7 @@ static int perf_event_set_filter(struct perf_event *e=
vent, void __user *arg)
 static enum hrtimer_restart perf_swevent_hrtimer(struct hrtimer *hrtimer)
 {
 	enum hrtimer_restart ret =3D HRTIMER_RESTART;
-	struct perf_sample_data sample __uninitialized;
+	struct perf_sample_data sample __uninitialized; /* optimization */
 	struct pt_regs *regs;
 	struct perf_event *event;
 	u64 period;
