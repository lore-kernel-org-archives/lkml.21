Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427050;
	b=PKuAG1z4muVazUUgVSqxlFUzFhgeu/qsOBfP4XeXkEmqwq7ZxsD/kfvXDnTSqSU7BwH2
	 yCHbKFFIMUzxZ/Vhu3+phjfltiVBH3+pm1dirwhgILZwlhNFpv6hxD0SzJxl5zSSwZEy/
	 gRz7PF4td+UqqoRQO1OyPWrTN4SxyaZpkYPwhOmsurnBNREbRnHrquCRHyW5v5pYsfAbg
	 iSEkagHFdXFuoFJsbG7KXz7QfuL8g/6CVt+/7HLJ5F9jJD9MiJ5J5R3fAK23eyeSKGlI9
	 Ehw2zCIV0j0xAlX1YXLrEw/CYJ+G+B/cHAOM8jjDTjTpMT1y6vwcG9mhbiTMzPQVqkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427050;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=u9Rh93j/Jv+7WeDm8+UV/vTtRQ32MXcJ27eTEIaExJA=;
	b=H3YkwXuRVItiJgP8CkiRWCVaimrWLd55nlO4+Ulii+xTREBZniVlXVk2SFyVwObaQcxW
	 o91Oz/4BYmY/DRnwFm6szd4uaNsGWMV6TLZ9HxWA0lLWqx8wYyLFDIZuhYGVPUWMspiSR
	 MuZflH6JAFUy2wHvS2qE7LdYNtuN5V7Xmufit9UGyIMT8EuNykqUBivMR8UQE70IXdL4a
	 PFsMOWdWFxbjOy7vLk4R51DTHwceggBucwHhqyqHiGWIFS5ZRzyofFMqRNHSh3krJg2tc
	 f5OVy57rubuWPPVjbYsxWv3wur9nVgFA1c9Qe7Dcer6MPMolWQPlRT1miPy89MgvgKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=2ifoWM+J;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="MnNbDz/T";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7CD606A327;
	Mon, 23 Nov 2026 09:44:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A7CD606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=2ifoWM+J;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=MnNbDz/T
Date: Mon, 23 Nov 2026 09:44:05 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795427047;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u9Rh93j/Jv+7WeDm8+UV/vTtRQ32MXcJ27eTEIaExJA=;
	b=2ifoWM+JYqvriwtlsrQ0KR+Fcploc8LpxBxco2vOLJR/2OuXT0hbqcV5Q1tjGqNr18ef09
	unddOu2Y74pqFFzX7Y6vWta8Uceqpi/5eh7Pbnj1p3n8SqAN5BMSbHsVZaYjRmUSt8X3DW
	FHr4d+yirqYLz440POK6rSsrL7+tC1iPTEBqSgbwa35yTcbz93h2NfbXMX6xoKsUF8OqJi
	ztZdtlOpMnfyKEPKMcpdmcwS4dbku1bkeYdZE3KtXpIDOZR2h5ACbpuc6XvXSPDJdms0hT
	rZtVMDoIEXIUJZcokmFY3NgIpKMCXEahgUWQdIspzE8EAweQ6qvb9fslYLODZg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795427047;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u9Rh93j/Jv+7WeDm8+UV/vTtRQ32MXcJ27eTEIaExJA=;
	b=MnNbDz/T791HVgd4t7lNqt28QPr69qq7S/Rr5tnTmkd/yr0FrmSVBwJwScSh11b4ePejhZ
	PFMiM7/wpbc95PBg==
From: "tip-bot2 for Bart Van Assche" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: locking/urgent] srcu: Make the srcu_dereference_check() reader
 lock check conditional
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
 Bart Van Assche <bvanassche@acm.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To:
 <459250d4f2a6aa38ebab3fb51f6d4a63815bb4a1.1795043161.git.bvanassche@acm.org>
References:
 <459250d4f2a6aa38ebab3fb51f6d4a63815bb4a1.1795043161.git.bvanassche@acm.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179542704558.92412.6060162399615802148.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the locking/urgent branch of tip:

Commit-ID:     e2652119b5944e7732ff856ba8057afaa28f5ac8
Gitweb:        https://git.kernel.org/tip/e2652119b5944e7732ff856ba8057afaa28=
f5ac8
Author:        Bart Van Assche <bvanassche@acm.org>
AuthorDate:    Wed, 18 Nov 2026 15:09:59 -08:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 23 Nov 2026 10:38:52 +01:00

srcu: Make the srcu_dereference_check() reader lock check conditional

Users of srcu_dereference_check() must either hold an SRCU reader lock
or satisfy the lockdep condition 'c', e.g. by holding the update-side
lock. However, srcu_dereference_check() calls
__srcu_read_lock_must_hold(), which tells the Clang context analyzer
that the SRCU reader lock must be held. That requirement is too strict
for update-side callers. Hence, only call __srcu_read_lock_must_hold()
from srcu_dereference_check() if 'c' is the compile-time constant 0,
i.e. if there is no update-side protection. Keep the fake RCU acquire
and release around __rcu_dereference_check() and also keep the runtime
lockdep check in srcu_dereference_check().

Use const_true() instead of __builtin_constant_p() to test whether 'c'
is the constant 0. const_true() is based on __is_constexpr(), a
sizeof() trick that the compiler front end always evaluates, so the
Clang context analysis sees an integer constant expression. If 'c' is
a plain variable, function argument or structure member, Clang may
leave __builtin_constant_p(c) for the optimizer to decide. The context
analysis then considers the __srcu_read_lock_must_hold() call
reachable and reports a false positive. Additionally, const_true()
never evaluates a non-constant 'c' at runtime, so the runtime behavior
does not change.

srcu_dereference() passes 0 as 'c' and hence gets the compile-time
check automatically. srcu_dereference_notrace() does not accept a
lockdep condition and hence may only be used by SRCU readers. Since it
passes 1 as 'c', call __srcu_read_lock_must_hold() explicitly from
srcu_dereference_notrace() such that the Clang context analysis keeps
verifying at compile time that its callers hold the SRCU reader lock.

Fixes: f0b7ce22d718 ("srcu: Support Clang's context analysis")
Suggested-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Reviewed-by: Paul E. McKenney <paulmck@kernel.org>
Link: https://patch.msgid.link/459250d4f2a6aa38ebab3fb51f6d4a63815bb4a1.17950=
43161.git.bvanassche@acm.org
---
 include/linux/srcu.h | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/include/linux/srcu.h b/include/linux/srcu.h
index d4dcaeb..380b596 100644
--- a/include/linux/srcu.h
+++ b/include/linux/srcu.h
@@ -280,6 +280,10 @@ static inline int srcu_read_lock_held(const struct srcu_=
struct *ssp)
  * with __guarded_by(ssp) as it would complicate annotations for writers, we
  * choose the following strategy: srcu_dereference_check() calls this helper
  * that checks that the passed ssp is held, and then fake-acquires 'RCU'.
+ * srcu_dereference_check() only calls this helper if @c is the compile-time
+ * constant 0 because otherwise its callers may satisfy the condition @c
+ * instead of holding ssp, e.g. on the update side. srcu_dereference_notrace=
()
+ * passes 1 as @c and hence calls this helper explicitly.
  */
 static inline void __srcu_read_lock_must_hold(const struct srcu_struct *ssp)=
 __must_hold_shared(ssp) { }
=20
@@ -297,7 +301,8 @@ static inline void __srcu_read_lock_must_hold(const struc=
t srcu_struct *ssp) __m
  */
 #define srcu_dereference_check(p, ssp, c)					\
 ({										\
-	__srcu_read_lock_must_hold(ssp);					\
+	if (const_true(!(c)))							\
+		__srcu_read_lock_must_hold(ssp);				\
 	__acquire_shared_ctx_lock(RCU);					\
 	__auto_type __v =3D __rcu_dereference_check((p), __UNIQUE_ID(rcu),	\
 				(c) || srcu_read_lock_held(ssp), __rcu);	\
@@ -323,7 +328,11 @@ static inline void __srcu_read_lock_must_hold(const stru=
ct srcu_struct *ssp) __m
  * @ssp: pointer to the srcu_struct, which is used to check that we
  *	really are in an SRCU read-side critical section.
  */
-#define srcu_dereference_notrace(p, ssp) srcu_dereference_check((p), (ssp), =
1)
+#define srcu_dereference_notrace(p, ssp)				\
+({									\
+	__srcu_read_lock_must_hold(ssp);				\
+	srcu_dereference_check((p), (ssp), 1);				\
+})
=20
 /**
  * srcu_read_lock - register a new reader for an SRCU-protected structure.
