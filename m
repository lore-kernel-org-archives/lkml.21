Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795043437;
	b=JUS4XYbgLVMkVCfM0sHMqlaLLGZ+VvMvu07AudTbeit2k5e09cGpnYXjoFbnuhd8eavm
	 QPmpGIVGlvRVeGOSoHE91/vRBXJH1tcpH7TSaE4wY9PZQVx96vNkKlUJeD+3x1TwrPUPQ
	 d7oL8p6sTuNsLAbgPCq97plFZVN2+Mu0t37zgbKky+eM/s5g2NesTva5RA5dVChg94Nu9
	 HOBpXGE/1QIJGmHOqd1VLccAA04icpBu6wFWMH952dX2qnHtD9p2p5zz8LKJIWY7GXsVL
	 h9z2ZPwvPpudtrwM8bJThBJF9HOZ9Qmcu7Bn5T7TGPFW0btJOTG2Jwgi+Ig7bS93Qhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795043437;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=vPP2yHzqFVtLB1vaz4NSC3baOP9nsrr/OeQdPJfjTFY=;
	b=RYxX3KdOIgifWp9H0oqHjLNON9l1bBJrHz/8rNAhvobHaY5gSZ3ICTS4Gk7m8wfqMWH0
	 4bq/S4VTAeeAznOytSjKfSOh2L37wYyApC03R6ckKe05Qk4Aa44HpbND+nWg5Qmj7UHlU
	 HWRdrJARHrEBbPl69lJCkBp+85QjKBfXSz3z7u4RVT/snVw1tXZgYF7FU8LHcRAe6pRNu
	 TGLVREQ0UNfzYsNrlHCyvRotra+0NmDejoA1FKP/BORnyFJFNUrPvd2FnWPPMjWMUuKoJ
	 6RGOUbb9iX+dsUrJ4xZ5WlRyAyHbaKAuZM1kk2cnkb8E+cGBPefOorcJEawpn5mIf3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=GeAABJDS;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDC260A2607
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:10:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BDC260A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=GeAABJDS
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jVHQ46kRZz1XLQ9s;
	Wed, 18 Nov 2026 23:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1795043429; x=1797635430; bh=vPP2y
	HzqFVtLB1vaz4NSC3baOP9nsrr/OeQdPJfjTFY=; b=GeAABJDSjP6eIPEeYQdZn
	KmWT+Ly8c1bLme2BgOtcGPSwi1tfU7lMN9YNh72GzSnZK1hN7DpP0M25uIkFhb3p
	MIkzJnXfnwtQ50B0Zs4F15LD9tNjeufbOelOtXqAvCJt/SVcvvmwkwZg3enmy9Re
	TJenXVEnpq+BhiXGgRI+7iezcKN4Z9pgwayT1Is8FJlvGnamWIsnRN/e/H8hY/uc
	FwRmUspOIzj8ioO2pVtL3MeNDiBHM4xWKi2cBbBDqPoFSsXLonB9BytFsxN+iSFr
	XewUrXvdn0b6V3BAVpiWOoBs61BvOR2uz9oc9agNKqCQbLNtwhTrN1nL7xsYujGn
	A==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id GluU4bKQzGcB; Wed, 18 Nov 2026 23:10:29 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jVHPw6TjSz1XMlX7;
	Wed, 18 Nov 2026 23:10:28 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-kernel@vger.kernel.org,
	Marco Elver <elver@google.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Bart Van Assche <bvanassche@acm.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Josh Triplett <josh@joshtriplett.org>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v4 3/3] srcu: Make the srcu_dereference_check() reader lock check conditional
Date: Wed, 18 Nov 2026 15:09:59 -0800
Message-ID: <459250d4f2a6aa38ebab3fb51f6d4a63815bb4a1.1795043161.git.bvanassche@acm.org>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
In-Reply-To: <cover.1795043161.git.bvanassche@acm.org>
References: <cover.1795043161.git.bvanassche@acm.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

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

Cc: Marco Elver <elver@google.com>
Suggested-by: Paul E. McKenney <paulmck@kernel.org>
Fixes: f0b7ce22d718 ("srcu: Support Clang's context analysis")
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 include/linux/srcu.h | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/include/linux/srcu.h b/include/linux/srcu.h
index d4dcaeb83e2b..380b5964fcb4 100644
--- a/include/linux/srcu.h
+++ b/include/linux/srcu.h
@@ -280,6 +280,10 @@ static inline int srcu_read_lock_held(const struct s=
rcu_struct *ssp)
  * with __guarded_by(ssp) as it would complicate annotations for writers=
, we
  * choose the following strategy: srcu_dereference_check() calls this he=
lper
  * that checks that the passed ssp is held, and then fake-acquires 'RCU'=
.
+ * srcu_dereference_check() only calls this helper if @c is the compile-=
time
+ * constant 0 because otherwise its callers may satisfy the condition @c
+ * instead of holding ssp, e.g. on the update side. srcu_dereference_not=
race()
+ * passes 1 as @c and hence calls this helper explicitly.
  */
 static inline void __srcu_read_lock_must_hold(const struct srcu_struct *=
ssp) __must_hold_shared(ssp) { }
=20
@@ -297,7 +301,8 @@ static inline void __srcu_read_lock_must_hold(const s=
truct srcu_struct *ssp) __m
  */
 #define srcu_dereference_check(p, ssp, c)					\
 ({										\
-	__srcu_read_lock_must_hold(ssp);					\
+	if (const_true(!(c)))							\
+		__srcu_read_lock_must_hold(ssp);				\
 	__acquire_shared_ctx_lock(RCU);					\
 	__auto_type __v =3D __rcu_dereference_check((p), __UNIQUE_ID(rcu),	\
 				(c) || srcu_read_lock_held(ssp), __rcu);	\
@@ -323,7 +328,11 @@ static inline void __srcu_read_lock_must_hold(const =
struct srcu_struct *ssp) __m
  * @ssp: pointer to the srcu_struct, which is used to check that we
  *	really are in an SRCU read-side critical section.
  */
-#define srcu_dereference_notrace(p, ssp) srcu_dereference_check((p), (ss=
p), 1)
+#define srcu_dereference_notrace(p, ssp)				\
+({									\
+	__srcu_read_lock_must_hold(ssp);				\
+	srcu_dereference_check((p), (ssp), 1);				\
+})
=20
 /**
  * srcu_read_lock - register a new reader for an SRCU-protected structur=
e.
