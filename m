Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429402;
	b=L3/f/DOl3UpOAOcrPwoiQrVcjgv8XStdoqZoUoVcq+yrMvYW7qd8leB/QjUAnH9ZrCVv
	 hiFLViOedyfe+IuXM1BN9Jl5AtJGczRHncdQRHaGCltibQuQTJ7ApExHGqlAgpon9TXm2
	 QylsX/VbCIE+TQyBnvr8NW9QLccbu5hF0LoL3pOxZIsTlOW5/IhsvkvsIbjHXWd3t6nDe
	 Un+xBDLzAYV2wS/ohRJR/4soUp+KgpZWh9OMYid+KALXqWwlwJnpLFPy/jiCHCiNh2BwM
	 QODrNMJ+Sw6iv72xWFhnOhcliA8y3RjAT26KxdgxAqnjhhsLUK8dwfLg8K6NcOnCNIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429402;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:MIME-Version:Message-ID:Robot-ID:Robot-Unsubscribe:
	 Precedence:Content-Type:Content-Transfer-Encoding;
	bh=IEwxbhu021nPXdb3JZ2jF15n70+5m/NllhCaLScjAbw=;
	b=p8hLOGfAUk4mhDP03P6lWvwY7rwSoSsPG82ruyWcfLgLhPD1ac923Hz27AedkV4KVXth
	 dok8HqeVSOBsmpnEZBXmT8YT3vQVDJX9sPvbYlxejoMUGEtiSirdJVXl7A2q5nOPZwO7l
	 A1dV8LwxQczuh60L7cufv67SWGgRpwiLnpjG/9fcJZ4U+Uh8C+sAY9qJUqJmbO+22mbxK
	 FfFImOmel1EFK6YEtxgN5X3gmgWtVboYLTAkR+Jj/Tat39BojPci95YysoQN+bDHW3Oa7
	 l6QTflm4h+HzhLeCnV0qD4JB5+/hXNBJ3liopjI+00Z+B05f585ujxQJHEg8Ygll0iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="4gvO/fZo";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=WE6p+fbO;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803D2606A31E;
	Mon, 23 Nov 2026 10:23:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 803D2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=4gvO/fZo;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=WE6p+fbO
Date: Mon, 23 Nov 2026 10:23:16 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795429399;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=IEwxbhu021nPXdb3JZ2jF15n70+5m/NllhCaLScjAbw=;
	b=4gvO/fZoyiIb6B+OcOD28NvqU45vBP+W3pex8o31ykkFhNC0S1aLt0xd6p7qC8CZ/v4S9x
	kBNePdW24/+wAB2yVcNLGsGIfqC0jiskT7low+ZOI8WEIB+NJPWkZabtK6W/hLKCL7Z1jo
	RO0u/rCCVG0Il76gyslmLa+c6F0ABNfOVzXJir87oYhzZzqor5Ja++7n6v1O5E+ql4ZGHe
	/9EwxN5rCr2ViYteBNtmrYuDTYBb65QOnjcbIeyhfbbjYI6hXtOejuP9vLPsKmL9+o1Tza
	thrOzVUseOtcjVavhkX05ubnlb4fwYN+w+DiY1ETdIRByefJgWQKeqNb18aUqw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795429399;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=IEwxbhu021nPXdb3JZ2jF15n70+5m/NllhCaLScjAbw=;
	b=WE6p+fbO9Pxj+edT/YuT7/2PWvJL16J8/h6Nq/X+tLVu86bZVEAm61Wec4Fp3SZHfgDbUB
	ohnMFyQuPs8bN2AQ==
From: "tip-bot2 for Peter Zijlstra" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/core] perf/core: Remove superfluous argument from
 __perf_mux_hrtimer_init()
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org, x86@kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179542939616.92412.10124450140405756122.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/core branch of tip:

Commit-ID:     63705c002995957bdab0c6e36bd0b120300d6006
Gitweb:        https://git.kernel.org/tip/63705c002995957bdab0c6e36bd0b120300=
d6006
Author:        Peter Zijlstra <peterz@infradead.org>
AuthorDate:    Wed, 18 Nov 2026 14:18:03 +01:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 23 Nov 2026 10:56:27 +01:00

perf/core: Remove superfluous argument from __perf_mux_hrtimer_init()

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org
---
 kernel/events/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 9468941..d971c05 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -1300,7 +1300,7 @@ static enum hrtimer_restart perf_mux_hrtimer_handler(st=
ruct hrtimer *hr)
 	return rotations ? HRTIMER_RESTART : HRTIMER_NORESTART;
 }
=20
-static void __perf_mux_hrtimer_init(struct perf_cpu_pmu_context *cpc, int cp=
u)
+static void __perf_mux_hrtimer_init(struct perf_cpu_pmu_context *cpc)
 {
 	struct hrtimer *timer =3D &cpc->hrtimer;
 	struct pmu *pmu =3D cpc->epc.pmu;
@@ -13027,7 +13027,7 @@ int perf_pmu_register(struct pmu *_pmu, const char *n=
ame, int type)
=20
 		*per_cpu_ptr(pmu->cpu_pmu_context, cpu) =3D cpc;
 		__perf_init_event_pmu_context(&cpc->epc, pmu);
-		__perf_mux_hrtimer_init(cpc, cpu);
+		__perf_mux_hrtimer_init(cpc);
 	}
=20
 	if (pmu_bus_running && !pmu->dev) {
