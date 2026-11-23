Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429392;
	b=HywYk4S/6+Vc7OvFw6aofRuCIopYlECovh7QjCyhRiUZwV5wXMN4qzoi66RroU1LIKXQ
	 gQm1GrOSrTA2TAR0EdcW1grS7tF+Xhv6k8cviFzyYcxDxbzw+6aCBjlPOtowSKWrFBXq4
	 cyTFOkzb/WVP73F2CZPasIfAUd0Au+WSXuc73UYwhTx9ADvbOVbvmsrdjrsY9Ju9gQW6B
	 NYwWxqyrUkdjZn/xpBS+jJMLv+huz2M2urBtv6gTbRXHY5Jvmu3E4VCBUzjK0YzwdKCtx
	 /HlEHJFZ1G8oAuqvFPuTxNerXkvCYDWLiIZznOGrQ7Stq0/voz1mk8MzMz3PesSDFIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429392;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=SU2/nos8iF5e+LDs8mKUHqP/Pw7soXkMstWV7iBLilM=;
	b=xnKcfqgAA9rW1JTT7IBmHBPXMOS+zgjTqIJnqxA5pFFQy/CkgJ0CUuFoQ1Ss0I2Afu+M
	 DSf3gFP7CO7UKLX/bpBodrOI+yAzmZGDHhUwWZ9AS7tmgHCSagBuJtr73WQRrWdQbxgPw
	 jzLpFECtb58IrL40FxkpjM21HQyi1xx/EpSA7LXLVfNsmXvPXDFlhm0L/eGFUSJkFaB5f
	 VYaFyFnS4RtoM0NyLS3TUGGOhqiQckdVuT81XG4YCMD+sehKq720NTW75RFl+UlYTWFm/
	 kpqXlXzTue/ktorAwnm8r5y4OsT+0/f/MdhEJ07VG4IP9h6ErJdMGozISISkiC7j5BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=tuc1UzDE;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=7THNkQ2+;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BFD606A31A;
	Mon, 23 Nov 2026 10:23:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78BFD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=tuc1UzDE;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=7THNkQ2+
Date: Mon, 23 Nov 2026 10:23:07 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795429389;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SU2/nos8iF5e+LDs8mKUHqP/Pw7soXkMstWV7iBLilM=;
	b=tuc1UzDEd0JqAT9X3Ito/BQY13QYsm4WjN9et2kitVyLYHPA/Wyxg15/SpZ4FjWMPKweDx
	9Dxu0jyOnU0l+zK3mHkRbwMsRAl5kd3UNYBvQe0T2dWFbhV5xxZsVpIMBotGZQgi1b0QM9
	wpa0HJTtsWjUWRd+lnXEwQJQbsQiP1/VirxnSBoW56b5V5vQqtiD7WTlFqQqXc8FYqt3ul
	VrFb0GJ3H3nbuxChieiiK6akx7CsGbWKxm3HrudLR3nafqEpg0IyGF2VEWzoKkQOSo5do/
	D6aGz//oYRFOmd1nyF96hBIapfvm/IStNEFsu2OEKkJn8nKtBCMenMZkc0oJ0w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795429389;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SU2/nos8iF5e+LDs8mKUHqP/Pw7soXkMstWV7iBLilM=;
	b=7THNkQ2+n5KnnhzRrNn6GNyM30gBiV4FlK5Pd9jcD9L85Zi4Tg3nr8JhxFkBYn1UIjIae0
	/cMxfaf1D4v+eDCQ==
From: "tip-bot2 for Peter Zijlstra" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/core] perf/x86: Mark perf_sample_data __uninitialized
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261120091258.GH2669272@noisy.programming.kicks-ass.net>
References: <20261120091258.GH2669272@noisy.programming.kicks-ass.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179542938764.92412.16102006029806168915.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/core branch of tip:

Commit-ID:     86a52e8d105ff74d5fa8c1694df53aa026f7dd62
Gitweb:        https://git.kernel.org/tip/86a52e8d105ff74d5fa8c1694df53aa026f=
7dd62
Author:        Peter Zijlstra <peterz@infradead.org>
AuthorDate:    Fri, 20 Nov 2026 10:12:58 +01:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 23 Nov 2026 11:13:50 +01:00

perf/x86: Mark perf_sample_data __uninitialized

For consistency; on-stack perf_sample_data shouldn't be initialized.

[ mingo: Annotate them as an optimization. ]

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://patch.msgid.link/20261120091258.GH2669272@noisy.programming.kic=
ks-ass.net
---
 arch/x86/events/amd/core.c     | 2 +-
 arch/x86/events/amd/ibs.c      | 2 +-
 arch/x86/events/core.c         | 2 +-
 arch/x86/events/intel/core.c   | 2 +-
 arch/x86/events/intel/ds.c     | 4 ++--
 arch/x86/events/intel/knc.c    | 2 +-
 arch/x86/events/intel/p4.c     | 2 +-
 arch/x86/events/zhaoxin/core.c | 2 +-
 8 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/x86/events/amd/core.c b/arch/x86/events/amd/core.c
index 49b6b8f..791d435 100644
--- a/arch/x86/events/amd/core.c
+++ b/arch/x86/events/amd/core.c
@@ -958,7 +958,7 @@ static int amd_pmu_v2_handle_irq(struct pt_regs *regs)
 	struct cpu_hw_events *cpuc =3D this_cpu_ptr(&cpu_hw_events);
 	static atomic64_t status_warned =3D ATOMIC64_INIT(0);
 	u64 reserved, status, mask, new_bits, prev_bits;
-	struct perf_sample_data data;
+	struct perf_sample_data data __uninitialized; /* optimization */
 	struct hw_perf_event *hwc;
 	struct perf_event *event;
 	int handled =3D 0, idx;
diff --git a/arch/x86/events/amd/ibs.c b/arch/x86/events/amd/ibs.c
index 66e67e2..6b04fcb 100644
--- a/arch/x86/events/amd/ibs.c
+++ b/arch/x86/events/amd/ibs.c
@@ -1483,7 +1483,7 @@ static int perf_ibs_handle_irq(struct perf_ibs *perf_ib=
s, struct pt_regs *iregs)
 	struct cpu_perf_ibs *pcpu =3D this_cpu_ptr(perf_ibs->pcpu);
 	struct perf_event *event =3D pcpu->event;
 	struct hw_perf_event *hwc;
-	struct perf_sample_data data;
+	struct perf_sample_data data __uninitialized; /* optimization */
 	struct perf_raw_record raw;
 	struct pt_regs regs;
 	struct perf_ibs_data ibs_data;
diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index 4e344fb..c3d6b1c 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -2157,7 +2157,7 @@ void x86_pmu_update_perf_regs(struct perf_event *event,
=20
 int x86_pmu_handle_irq(struct pt_regs *regs)
 {
-	struct perf_sample_data data;
+	struct perf_sample_data data __uninitialized; /* optimization */
 	struct cpu_hw_events *cpuc;
 	struct perf_event *event;
 	int idx, handled =3D 0;
diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index 0a34d67..e91b5fe 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -3819,7 +3819,7 @@ static int x86_pmu_handle_guest_pebs(struct pt_regs *re=
gs,
=20
 static int handle_pmi_common(struct pt_regs *regs, u64 status)
 {
-	struct perf_sample_data data;
+	struct perf_sample_data data __uninitialized; /* optimization */
 	struct cpu_hw_events *cpuc =3D this_cpu_ptr(&cpu_hw_events);
 	int bit;
 	int handled =3D 0;
diff --git a/arch/x86/events/intel/ds.c b/arch/x86/events/intel/ds.c
index 8444670..f094c6c 100644
--- a/arch/x86/events/intel/ds.c
+++ b/arch/x86/events/intel/ds.c
@@ -1184,7 +1184,7 @@ int intel_pmu_drain_bts_buffer(void)
 	struct bts_record *at, *base, *top;
 	struct perf_output_handle handle;
 	struct perf_event_header header;
-	struct perf_sample_data data;
+	struct perf_sample_data data __uninitialized; /* optimization */
 	unsigned long skip =3D 0;
 	struct pt_regs regs;
=20
@@ -1265,7 +1265,7 @@ unlock:
 void intel_pmu_drain_pebs_buffer(void)
 {
 	struct cpu_hw_events *cpuc =3D this_cpu_ptr(&cpu_hw_events);
-	struct perf_sample_data data;
+	struct perf_sample_data data __uninitialized; /* optimization */
=20
 	WARN_ON_ONCE(cpuc->enabled);
=20
diff --git a/arch/x86/events/intel/knc.c b/arch/x86/events/intel/knc.c
index e887adc..c8e7e8c 100644
--- a/arch/x86/events/intel/knc.c
+++ b/arch/x86/events/intel/knc.c
@@ -213,7 +213,7 @@ static inline void knc_pmu_ack_status(u64 ack)
=20
 static int knc_pmu_handle_irq(struct pt_regs *regs)
 {
-	struct perf_sample_data data;
+	struct perf_sample_data data __uninitialized; /* optimization */
 	struct cpu_hw_events *cpuc;
 	int handled =3D 0;
 	int bit, loops;
diff --git a/arch/x86/events/intel/p4.c b/arch/x86/events/intel/p4.c
index 5368dc3..e051c18 100644
--- a/arch/x86/events/intel/p4.c
+++ b/arch/x86/events/intel/p4.c
@@ -1033,7 +1033,7 @@ static int p4_pmu_set_period(struct perf_event *event)
=20
 static int p4_pmu_handle_irq(struct pt_regs *regs)
 {
-	struct perf_sample_data data;
+	struct perf_sample_data data __uninitialized; /* optimization */
 	struct cpu_hw_events *cpuc;
 	struct perf_event *event;
 	struct hw_perf_event *hwc;
diff --git a/arch/x86/events/zhaoxin/core.c b/arch/x86/events/zhaoxin/core.c
index e506f67..f7d41ca 100644
--- a/arch/x86/events/zhaoxin/core.c
+++ b/arch/x86/events/zhaoxin/core.c
@@ -355,7 +355,7 @@ static void zhaoxin_pmu_enable_event(struct perf_event *e=
vent)
  */
 static int zhaoxin_pmu_handle_irq(struct pt_regs *regs)
 {
-	struct perf_sample_data data;
+	struct perf_sample_data data __uninitialized; /* optimization */
 	struct cpu_hw_events *cpuc;
 	int handled =3D 0;
 	u64 status;
