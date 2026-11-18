Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009167;
	b=MCTO3rdF/MmJ+5+Jtrc04ZG4ECGgGkrtVBdnsDIcq5tlOCh/5Zn1VMxhTEhQM8A0citw
	 UfL9njMpM4VknE+76XeeeK6hN+M+h1AEhIY0yDkJOw0zLP28uvbjxIDr4m7eFawSkmsEI
	 jnS/uXzl6p4Z9afor38w3y6Lxtb+wdWytJ6scqQ3kVi+IJx83P8PGSKhlae5wKEoE138i
	 8oVtXC1jZC4Z4GCHulXG6VMGNQlRLnDW4D61hPPCvRxF8LnfN4j/pUxSGNYVDsVJyvbt4
	 IMb8BhXRz7KRnqhrJ84vxkbcmWuoN9VQW0x2yT4BYh9FHZAppu9HsHxFgzCKFuuQoCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009167;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=IQg6jqr/v5rYQFQ3WrFIfrLisFRoHQodZmkfXCP8Z9U=;
	b=wkkhDaLETi35DlW7a3+gzdLlfEBY+e3vEmC+X2lsfiXx9nwnAFUCpNdP0qzruUO2oV6x
	 pdbMIs0SCVanNZAjhvdy7+Tvg4rZzyZJ4wBxuIjvpZBCAt2C4qPrdjkLWGla+9BgpygGj
	 pAeKdB90xgVfQ4BmFXVGrP123jidL77IWX55K6zQk9W7yS4Hhln8XAqpKmvKhSljtPJqL
	 R/me1Xwz1OfzVLMVF+DLXUcVCzh+i0XqyRFF5CYI5w548k2XCYeR6FIMbXb9F687/X5La
	 3jUQe7/yF8EXFXyMRyr9N1okp1My8ZcaUjJ80sdcfPwnr5C/Q07RFGVEmzzplaZ++rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=dMYbr4+H;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=xZVbjUIR;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5D2606A338;
	Wed, 18 Nov 2026 13:39:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC5D2606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=dMYbr4+H;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=xZVbjUIR
Date: Wed, 18 Nov 2026 13:39:23 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795009165;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IQg6jqr/v5rYQFQ3WrFIfrLisFRoHQodZmkfXCP8Z9U=;
	b=dMYbr4+HXLIHGhy2M5IG+W52/PToAC5GjdYqHFj1CuR/+VEGccYk/W864xkpzI4/nIlRrU
	3s2khjOvr9FB27AdGJr1ysIGuZrYHo3jMsaryCVswAK4FyZJhXyAtdEWkjoXHFOqo8wLbd
	omQd26kcdyR+BFbzWA4kuzdvZKtaImhvOCeYMI3Hq/zGi8eJwVkg/d6TKHy/miTDqjSUl8
	UwsCNr4+hVddQQtpj+eT053gRpqDfvO6m4C/R1igS8audgjttayD4M8HjDKAjHBy2V2pMq
	CEFIl/3TUE65VCprygq7nm1mIQWHoFVhQI51noCe8rJOo5rnvqVIg/GeNLJdOw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795009165;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IQg6jqr/v5rYQFQ3WrFIfrLisFRoHQodZmkfXCP8Z9U=;
	b=xZVbjUIR7eU6TDILgNVI6go04+d6Luz+wtBR8ZPJB4CkJ8i1iNxCoRmS9vpAMjJau5pzdU
	OnLAhqKlZ0NB32Dg==
From: "tip-bot2 for Peter Zijlstra" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/urgent] sched/fair: Use guard in sched_group_set_idle()
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Kayra Cizmeci <kayracizmeci@gmail.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, Josh Don <joshdon@google.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261105170157.453569788@infradead.org>
References: <20261105170157.453569788@infradead.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179500916342.3191731.1888159070616967994.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/urgent branch of tip:

Commit-ID:     9a92f776dfa6a88fc16fe0512c725734190bf9d0
Gitweb:        https://git.kernel.org/tip/9a92f776dfa6a88fc16fe0512c725734190=
bf9d0
Author:        Peter Zijlstra <peterz@infradead.org>
AuthorDate:    Thu, 05 Nov 2026 17:55:26 +01:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 18 Nov 2026 14:32:16 +01:00

sched/fair: Use guard in sched_group_set_idle()

Cleanup the code by using guards; prepares for further changes in this functi=
on.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>
Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>
Reviewed-by: Josh Don <joshdon@google.com>
Link: https://patch.msgid.link/20261105170157.453569788@infradead.org
---
 kernel/sched/fair.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 0c8af1c..95fd756 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -15803,12 +15803,9 @@ int sched_group_set_idle(struct task_group *tg, long=
 idle)
 	if (idle < 0 || idle > 1)
 		return -EINVAL;
=20
-	mutex_lock(&shares_mutex);
-
-	if (tg->idle =3D=3D idle) {
-		mutex_unlock(&shares_mutex);
+	guard(mutex)(&shares_mutex);
+	if (tg->idle =3D=3D idle)
 		return 0;
-	}
=20
 	tg->idle =3D idle;
=20
@@ -15818,13 +15815,12 @@ int sched_group_set_idle(struct task_group *tg, lon=
g idle)
 		struct cfs_rq *grp_cfs_rq =3D tg_cfs_rq(tg, i);
 		bool was_idle =3D cfs_rq_is_idle(grp_cfs_rq);
 		long idle_task_delta;
-		struct rq_flags rf;
=20
-		rq_lock_irqsave(rq, &rf);
+		guard(rq_lock_irqsave)(rq);
=20
 		grp_cfs_rq->idle =3D idle;
 		if (WARN_ON_ONCE(was_idle =3D=3D cfs_rq_is_idle(grp_cfs_rq)))
-			goto next_cpu;
+			continue;
=20
 		idle_task_delta =3D grp_cfs_rq->h_nr_queued -
 				  grp_cfs_rq->h_nr_idle;
@@ -15843,9 +15839,6 @@ int sched_group_set_idle(struct task_group *tg, long =
idle)
 			if (cfs_rq_is_idle(cfs_rq))
 				break;
 		}
-
-next_cpu:
-		rq_unlock_irqrestore(rq, &rf);
 	}
=20
 	/* Idle groups have minimum weight. */
@@ -15854,7 +15847,6 @@ next_cpu:
 	else
 		__sched_group_set_shares(tg, NICE_0_LOAD);
=20
-	mutex_unlock(&shares_mutex);
 	return 0;
 }
=20
