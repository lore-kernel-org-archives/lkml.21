Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009506;
	b=WcLd8/6/gX9obz5fJrcdaSUEz9QcI7QL9Mois9IB+tBEN04iFJ+DAR8gm2cYlNDvcbOo
	 32qL70UffmK2sv5NAQenX3uNgaCpNtGSu4J/EFagn9aVefT2uC5AQdbo9RuvDADsg9ArS
	 Rc4STt/O08nr0Ej0hkH+Pg/v1mF+cMWC7kZKioMQ+1+Mi6m5zAvvynDbASZlDY4OGQWei
	 OGN3+02MI+79w5BAnNwsD5doZrHNJKoJcK0k34D1LIUSQPwN15t28YR+ZoSitra+vb2uz
	 mY0K/b+mQRSwAIi2RSxmgpnWUu91omNsLYzeBJ1XqLQB98z9QL7RIyMsrqQsu5AUZ+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009506;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=K9jqOFJoo5a08c4c6QWaedBiY3m5I13A6hFf3I1/tbg=;
	b=CC3TUp2mN0L8kW1H0eeWnEdQMdSiiX0pLvvUcxUryhtuwRp/IX3RpxOZ84iQp51COLcP
	 2ngYDdJ66CB/uMJk9+EO4rObYotEm2WIxx8TGlgm7qbKSsB6phzkOM1lq08l/dKS2I/fJ
	 4xNAe/ADouGbIFRD3fsnLoVOFLKT/+w2JeYkVaorldLVux1ir8Kpl3Eo8kRAORFRdeMnw
	 UHwszq9kCuoSlT9juLOTo8N2vyOlnx+6OwQbDaZSBpisnc4mnUa9NzGhAsOLX1PUWxF9J
	 k5b9nipbVg16dOSE3LhVKSrF4sQSPp06Io8obpn4QvnndX2/k+woyG11dO1Ddxz3wag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=uhCvTWUS;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=fgfiOUBX;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24ABA60A2602;
	Wed, 18 Nov 2026 13:45:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24ABA60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=uhCvTWUS;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=fgfiOUBX
Date: Wed, 18 Nov 2026 13:45:02 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795009504;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K9jqOFJoo5a08c4c6QWaedBiY3m5I13A6hFf3I1/tbg=;
	b=uhCvTWUSx59Y5rKzdDp7ymsz4OmsBmeMECOA7/NiNbHMJfSLMUHpsoUm5xhrR+dSVzK+qd
	UpfMhbL1N8jzpcdFgappHt4WsbTllNiN/1sRw4FNBi39A0Fa3FvINODreygx9yCNmOOCcq
	agcSXFDI4ZaKbgZp9nNuXcg35sVjt7yDU5lWcJl2Ut/RZLiq1cigjEjzZbs96yHvuRglwb
	MVHmZvL87lOlaJPMlpbRJIMX1YmkfiiRYSJZywlPFDD9G+bSoUw0+MePmcQlddLsUF2Tst
	80mOjR+3PDky/cgiR9eySsVfWUhNmcXUgWupRcPq7LEJ2bWd8xhg06ZuflMPXw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795009504;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K9jqOFJoo5a08c4c6QWaedBiY3m5I13A6hFf3I1/tbg=;
	b=fgfiOUBX7bqwrlSBiYVh/qdo8f2WWMbMloXSTXjNSdvhcH5/tX/eYJX3VW75XrSuhD+WP3
	wZh5xyNF1BeJLECg==
From: "tip-bot2 for Shrikanth Hegde" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched/rt: cpupri_find: Use cpumask_intersects where
 applicable
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261111075945.3930230-2-sshegde@linux.ibm.com>
References: <20261111075945.3930230-2-sshegde@linux.ibm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179500950295.3191731.4435852013005415307.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     fda7fb5adda6c71be96f5836498d4b207c0811fc
Gitweb:        https://git.kernel.org/tip/fda7fb5adda6c71be96f5836498d4b207c0=
811fc
Author:        Shrikanth Hegde <sshegde@linux.ibm.com>
AuthorDate:    Wed, 11 Nov 2026 13:29:41 +05:30
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 18 Nov 2026 14:32:20 +01:00

sched/rt: cpupri_find: Use cpumask_intersects where applicable

cpumask_any_and returns, usually the first cpu in the intersection
of the two cpumasks. However, if the returned value is not used or
only to check it against nr_cpu_ids, that implies whether the two
cpumask have a bit in common. I.e cpumask_intersects.

cpumask_any_and uses ffs on (addr1[idx] & addr2[idx]) whereas
cpumask_intersects checks only (addr1[idx] & addr2[idx]).

So replace such occurrences.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20261111075945.3930230-2-sshegde@linux.ibm.com
---
 kernel/sched/cpupri.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/cpupri.c b/kernel/sched/cpupri.c
index 8f2237e..44d67fb 100644
--- a/kernel/sched/cpupri.c
+++ b/kernel/sched/cpupri.c
@@ -97,7 +97,7 @@ static inline int __cpupri_find(struct cpupri *cp, struct t=
ask_struct *p,
 	if (skip)
 		return 0;
=20
-	if (cpumask_any_and(&p->cpus_mask, vec->mask) >=3D nr_cpu_ids)
+	if (!cpumask_intersects(&p->cpus_mask, vec->mask))
 		return 0;
=20
 	if (lowest_mask) {
