Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009157;
	b=5FO/kMm0dxoQvUKe9S/PqSmKT0g0RJUYONSsfl/c881KB0dkgPeV86P+JtWVPrIEahK9
	 LZCim19wUu7Pu2gpSK/mY1r4nVqHEHwN7gmmUbsse8J7Y5EsG6qGXKFhLwH5eRnOIfdH4
	 7l0wJIO8tQ6h3XYwSzI00txuv2BFxRaSh8si9eubFHajGMMlFdg8ynSl1etMNX4FO+fJG
	 5vSYRPG+gi5+Rd8x6eq49jT+hl0qTaOH7ai8H6D23Ux0HwdM+Cx+6YBBRlzCC3nbGmECc
	 TsxU4KwQ/iq6siu6PCd4wnVoG/JA7N/oYKdreKfGWNH366Hovg62ANmnlWlnYaMGOIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009157;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=fdNHVeWTSZnaAdnFtBlBHEBX13jTo8nm/aNwn0X5kLc=;
	b=kdxwy++KUc16bSgcXM7yt1AjIMNKSgTt1Livv+8E1Afh16DeQS/Yv8LFv94raKkGkJGq
	 Ppl/HxjxCaY3QUZQgHCHJ7qLdZtgd2BJWrXNp3+cuSWCjEGu1YaLES2bHs8cZwFN8ABJj
	 KYrsrtgcOtwvaXC4W7+Tq1OHGAsnuxA9aiOTKWisY5+lPIhCZQYHknR/1GUEHOg6lv7W+
	 MTnZD4Rs62zasl6R5ckSyaoL6+iXq7Zzcvmj+MkrcfEg1uYUVx6yLlfLGqk2pF4HRM8DY
	 3tI0rD2NrTCpebvSSqNffHgc5tp8VJJ2IzFSFFKCJrI+GRIOjRcjD/GTwvu4Ygg1DmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=VJBuSAMa;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=xCF6qR4n;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D8A606A31C;
	Wed, 18 Nov 2026 13:39:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78D8A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=VJBuSAMa;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=xCF6qR4n
Date: Wed, 18 Nov 2026 13:39:13 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795009155;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fdNHVeWTSZnaAdnFtBlBHEBX13jTo8nm/aNwn0X5kLc=;
	b=VJBuSAMadgg1ybjsokSYRiX4So+Dhe+15P2zawD3uhPKCoeaIGf8/yGQfuRhlKgL1fhOqn
	ng50KSt2UVXqekGKmicxEv1Ud6b4p8nupsR6PxaJajTDgy26cenW+//X8eD9i6qh6bJHC0
	zDJA3h6R7WxVOX4cFWsT6RK+cgzYuRw/c6c6qLcxEj784cPDZ22fQVnGv5JACszMt7orNU
	FSfiSHYyDoCvdtvZXrmd1ydrHygRvhIjbDNFhGF5uLBXft10SNvlQehFVYI3nqNC0Tg4i/
	lO7MllDxx3/ufeWUJHGqReFiALJbAR5qpLbkBE2ypmctjKgZCaEtW3DuOaJHqA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795009155;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fdNHVeWTSZnaAdnFtBlBHEBX13jTo8nm/aNwn0X5kLc=;
	b=xCF6qR4nnku6YOWyOqSRzOPNJ1gCCOa8fbMLSAIJP/e553UmmJeFkGSCJvoLfSs5+Dk6rl
	20cTB2gxBIbG/iDw==
From: "tip-bot2 for Shrikanth Hegde" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: perf/core] perf: Use cpumask_intersects where applicable
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261111075945.3930230-4-sshegde@linux.ibm.com>
References: <20261111075945.3930230-4-sshegde@linux.ibm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179500915343.3191731.3326820796145122539.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the perf/core branch of tip:

Commit-ID:     16bc76f9da9673bde4f8c84087e13573d2baa468
Gitweb:        https://git.kernel.org/tip/16bc76f9da9673bde4f8c84087e13573d2b=
aa468
Author:        Shrikanth Hegde <sshegde@linux.ibm.com>
AuthorDate:    Wed, 11 Nov 2026 13:29:43 +05:30
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 18 Nov 2026 14:32:21 +01:00

perf: Use cpumask_intersects where applicable

cpumask_any_and returns, usually the first cpu in the intersection
of the two cpumasks. However, if the returned value is not used or
only to check it against nr_cpu_ids, that implies whether the two
cpumask have a bit in common. i.e cpumask_intersects.

cpumask_any_and uses ffs on (addr1[idx] & addr2[idx]) whereas
cpumask_intersects checks only (addr1[idx] & addr2[idx]).

So replace such occurrences.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20261111075945.3930230-4-sshegde@linux.ibm.com
---
 kernel/events/core.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index e870f12..687bd39 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -13274,7 +13274,6 @@ static int perf_try_init_event(struct pmu *pmu, struc=
t perf_event *event)
 	if (pmu->scope !=3D PERF_PMU_SCOPE_NONE && event->cpu >=3D 0) {
 		const struct cpumask *cpumask;
 		struct cpumask *pmu_cpumask;
-		int cpu;
=20
 		cpumask =3D perf_scope_cpu_topology_cpumask(pmu->scope, event->cpu);
 		pmu_cpumask =3D perf_scope_cpumask(pmu->scope);
@@ -13283,8 +13282,7 @@ static int perf_try_init_event(struct pmu *pmu, struc=
t perf_event *event)
 		if (!pmu_cpumask || !cpumask)
 			goto err_destroy;
=20
-		cpu =3D cpumask_any_and(pmu_cpumask, cpumask);
-		if (cpu >=3D nr_cpu_ids)
+		if (!cpumask_intersects(pmu_cpumask, cpumask))
 			goto err_destroy;
=20
 		event->event_caps |=3D PERF_EV_CAP_READ_SCOPE;
@@ -15442,8 +15440,7 @@ static void perf_event_setup_cpumask(unsigned int cpu)
 		if (WARN_ON_ONCE(!pmu_cpumask || !cpumask))
 			continue;
=20
-		if (!cpumask_empty(cpumask) &&
-		    cpumask_any_and(pmu_cpumask, cpumask) >=3D nr_cpu_ids)
+		if (!cpumask_empty(cpumask) && !cpumask_intersects(pmu_cpumask, cpumask))
 			cpumask_set_cpu(cpu, pmu_cpumask);
 	}
 end:
