Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429395;
	b=IoSCz2j1zEsF1Jy04Wbm7RPhGMPb6FyqyEISK/fey4kXoinvJnrbDdT+hHaTkgHAQ+YD
	 UrAhGyUGpEDq+ZaPzgLx2xSR5gbnS8iv+5lueahp9kYYKztvi3fGlzyXrxD7f9fTfWOjo
	 b6Z9VnfKqhoJRzNvDoVe9jcCXJvmw6h6inKLrPnjIlRDAbYzqKv5QjDtdbFge96xhfWEJ
	 jObqH3PSFcjFBPwwC2rIrSJ7/wzaht5SKill8hk0JBqJq5JM5MakOiMwslF6Mc25DK6Uk
	 zZj2Mj/S0xWn1wMEcEUTkh5VWGo+6lwVq5BpLkeYAQ8YxBSGlcRzZ7m9OLo3L3Gml0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429395;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:MIME-Version:Message-ID:Robot-ID:Robot-Unsubscribe:
	 Precedence:Content-Type:Content-Transfer-Encoding;
	bh=sJ4A8pI4C6ZEHKlw/qwLbRaB6oaMH8eXFsyk3q6JRYw=;
	b=j8sHCAOuA8/fsGQKJJO0Fz0Y8fKofUe6Z6FchtYNbdW1WWQOAezMTeq4XCNfgUhXvF/W
	 V5XcEsNepphPKZfTZFqXUS8+P4SeW7iPV8EvspFz4ebBdXg3i899Zwz1rOCxDL0WZMMqN
	 /54YDTrQ8l7kQORofZMBm6HTvTB75GhyWHm8XWHnaU1WmRzl1sNjy+ZbuCR15vq1GYWta
	 5NNlOn+eLar/aq+xeZU7XqHgaOj/uXEyuGejyj4KD3L9jZuyp/7acRvcZnmY8Ct1JIobV
	 c/BrOG54Ir0tBK/IVkS1QWA9krGVsM5mrEATO5hXLd8U3QACBckMoOp/gXykHtJmH9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=v7i7lATO;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=1GCrOCWj;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CDA606A31F;
	Mon, 23 Nov 2026 10:23:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4CDA606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=v7i7lATO;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=1GCrOCWj
Date: Mon, 23 Nov 2026 10:23:10 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795429392;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=sJ4A8pI4C6ZEHKlw/qwLbRaB6oaMH8eXFsyk3q6JRYw=;
	b=v7i7lATOBRymuoUj4nV97ha5zufp9PZemeMGXgLmNnelFFFwHnGyh2Wb7X0Z0pe/+ktz9Z
	VRWk+pcC/jdsSUP1SwwQWA8jVDRxNsaO24Kz9yzy4eP9Fo4QlDOWHkmpYZQVKX+wihuAth
	OolJaYaXefVpV8RJQwthba3rl4YC8B9KZ4PJMs26K0XIUMojwZFJav2wjQjJaew06SlEp4
	K0e1MSp7Jxbf8Qzdnu4XTjX4WvcajUD6hsdXAEIwUQOYFTpj55Ek0MleEDDJjQhnxT9csd
	MtLZVsJNHYmdHjNieSu2H90PrwqKKtvY8PpPxAToOL6rbeKWijqgwt3xr7rixA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795429392;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=sJ4A8pI4C6ZEHKlw/qwLbRaB6oaMH8eXFsyk3q6JRYw=;
	b=1GCrOCWjodPZOhJJXnim12ZigL6Wa0yfutXhlnhkYOzfyDrjeGFgz5QuNCYLqtv7+w0hn5
	+rC9uqMxhN5ddQAw==
From: "tip-bot2 for Ingo Molnar" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/core] perf/core: Standardize 'struct perf_sample_data'
 variable names as 'sample'
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
Message-ID: <179542939083.92412.1070966102101979798.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/core branch of tip:

Commit-ID:     5bf1758c9766ffdd1264f4c66b47c2bf9de03a80
Gitweb:        https://git.kernel.org/tip/5bf1758c9766ffdd1264f4c66b47c2bf9de=
03a80
Author:        Ingo Molnar <mingo@kernel.org>
AuthorDate:    Mon, 23 Nov 2026 11:02:35 +01:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 23 Nov 2026 11:13:46 +01:00

perf/core: Standardize 'struct perf_sample_data' variable names as 'sample'

Right now there's a mixture of code that sets up the perf sample
data structure:

	struct perf_sample_data sample __uninitialized;
	struct perf_sample_data data __uninitialized;

Standardize on 'sample', which unifies the usage, but also makes
certain comments easier to read.

No change in functionality.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org
---
 kernel/events/core.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 773b132..4bf6a53 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -11210,7 +11210,7 @@ static void do_perf_sw_event(enum perf_type_id type, =
u32 event_id,
 				    u64 nr, struct pt_regs *regs, u64 addr)
 {
 	struct swevent_htable *swhash =3D this_cpu_ptr(&swevent_htable);
-	struct perf_sample_data data __uninitialized;
+	struct perf_sample_data sample __uninitialized;
 	struct perf_event *event;
 	struct hlist_head *head;
=20
@@ -11221,8 +11221,8 @@ static void do_perf_sw_event(enum perf_type_id type, =
u32 event_id,
=20
 	hlist_for_each_entry_rcu(event, head, hlist_entry) {
 		if (perf_swevent_match(event, type, event_id, regs)) {
-			perf_sample_data_init(&data, addr, 0);
-			perf_swevent_event(event, nr, &data, regs);
+			perf_sample_data_init(&sample, addr, 0);
+			perf_swevent_event(event, nr, &sample, regs);
 		}
 	}
 end:
@@ -11601,7 +11601,7 @@ void perf_tp_event(u16 event_type, u64 count, void *r=
ecord, int entry_size,
 		   struct pt_regs *regs, struct hlist_head *head, int rctx,
 		   struct task_struct *task)
 {
-	struct perf_sample_data data __uninitialized;
+	struct perf_sample_data sample __uninitialized;
 	struct perf_event *event;
=20
 	/*
@@ -11622,15 +11622,15 @@ void perf_tp_event(u16 event_type, u64 count, void =
*record, int entry_size,
 		if (perf_tp_event_match(event, &raw, regs)) {
 			/*
 			 * Here use the same on-stack perf_sample_data,
-			 * some members in data are event-specific and
+			 * some members in sample are event-specific and
 			 * need to be re-computed for different sweveents.
-			 * Re-initialize data->sample_flags safely to avoid
+			 * Re-initialize sample->sample_flags safely to avoid
 			 * the problem that next event skips preparing data
-			 * because data->sample_flags is set.
+			 * because sample->sample_flags is set.
 			 */
-			perf_sample_data_init(&data, 0, 0);
-			perf_sample_save_raw_data(&data, event, &raw);
-			perf_swevent_event(event, count, &data, regs);
+			perf_sample_data_init(&sample, 0, 0);
+			perf_sample_save_raw_data(&sample, event, &raw);
+			perf_swevent_event(event, count, &sample, regs);
 		}
 	}
=20
@@ -11647,7 +11647,7 @@ void perf_tp_event(u16 event_type, u64 count, void *r=
ecord, int entry_size,
 			goto unlock;
=20
 		raw_spin_lock(&ctx->lock);
-		perf_tp_event_target_task(count, record, regs, &data, &raw, ctx);
+		perf_tp_event_target_task(count, record, regs, &sample, &raw, ctx);
 		raw_spin_unlock(&ctx->lock);
 unlock:
 		rcu_read_unlock();
@@ -12401,7 +12401,7 @@ static int perf_event_set_filter(struct perf_event *e=
vent, void __user *arg)
 static enum hrtimer_restart perf_swevent_hrtimer(struct hrtimer *hrtimer)
 {
 	enum hrtimer_restart ret =3D HRTIMER_RESTART;
-	struct perf_sample_data data __uninitialized;
+	struct perf_sample_data sample __uninitialized;
 	struct pt_regs *regs;
 	struct perf_event *event;
 	u64 period;
@@ -12414,12 +12414,12 @@ static enum hrtimer_restart perf_swevent_hrtimer(st=
ruct hrtimer *hrtimer)
=20
 	event->pmu->read(event);
=20
-	perf_sample_data_init(&data, 0, event->hw.last_period);
+	perf_sample_data_init(&sample, 0, event->hw.last_period);
 	regs =3D get_irq_regs();
=20
 	if (regs && !perf_exclude_event(event, regs)) {
 		if (!(event->attr.exclude_idle && is_idle_task(current)))
-			if (perf_event_overflow(event, &data, regs))
+			if (perf_event_overflow(event, &sample, regs))
 				ret =3D HRTIMER_NORESTART;
 	}
=20
