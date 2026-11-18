Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009503;
	b=OfWJghKEgOakupJASgJoQ3ELkvOuuECcQrd41AVi3dQUFK1y+d3BunW6RDTApyOcoLyp
	 qGlZ4iyQzw6yZ1Gl9zHNOGz0opCG9tJB8ALWeF08xR694FXL9NRp5ggvQT0r7EKqfebHS
	 97nOdbLnmy9JGu5fbl+M35yHoQyx5VNqbA7lBLa+KpBTAZw4JrTdq/gGbbdpWUS5eqAA/
	 kcC/Rq2o1tlg7/XPeBA21+TOANcdNQkfMiWFeOvg/ON6s/sllTkW/Fgrir57wLjkRFiTP
	 CVblJfmR0smm0QJmPcTX6fNnTUaIp5mJhjxBYMZ9u1hxx5pHvAFxPHWfwXGmPAx7SxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009503;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=33kIkWSUEHt9L+omL8ZBRHDo1ltw+FvS5gRLUOAaiFo=;
	b=hX2GGLwy41ZNXEg2UW0nhmfNTfyGmaOKhZmv3paDODtBTRjA7dTr/SAfUQYeqVTx0M5a
	 f7+nBI8kXEHMr7y6f3xz11oSavgYjWpNbWUP3m6mBVsCpdKITLJNyDxv3S2M5aFVnhufb
	 t6+LqYUMoko6SWfFH+Y51JUIHKy84XKCV3n9k1Cjd5G2Gu/IVYqMZQHcad4wAYJzoyJjG
	 Ldtrg+Twleag/+jAX43DW6HzNCly+fcblqBtrZkWnOyuOy9vNfEQ+dpzRtlotRKZmLUL8
	 tkVNXS+pKk+dpXIa8XS7fk5va+n51jxi/YE9xsyU/99+zod3OtbBqE+XUcE/C0XBbiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=3E2kd6y1;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=VbBZHnJ8;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234C7606A331;
	Wed, 18 Nov 2026 13:45:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 234C7606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=3E2kd6y1;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=VbBZHnJ8
Date: Wed, 18 Nov 2026 13:44:59 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795009501;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=33kIkWSUEHt9L+omL8ZBRHDo1ltw+FvS5gRLUOAaiFo=;
	b=3E2kd6y1YIi2Qad6CuTaNNAV2GS1YLWMtgmfU+2InlkwW/WKPNTwtNKjeP3tePgxz2uu1i
	xhmHwhlelTxAdVNHdWqS4s2Rx734Kg21bH6hAeYKIlKnci/qfWkgHrqzP6+BJLBkCwCqE9
	N2I5El/zhlLVTyRga2sv3/bE6e1M2pPa0brqGxw+YBP5bsLXL/723a2HsXICYx9AXKRbCb
	OOs5P+kj2Xu0ELBYn+UrQfOYbfScfMPs02R0Y1LSABIHoXCHMd/siEuUuRhrJnJObg99dm
	BlApB1dEV0es1m7EqNVx5dGo7jnZZ8GzPk2tt+5jHt15yY66cBy7YEOBU5osZg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795009501;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=33kIkWSUEHt9L+omL8ZBRHDo1ltw+FvS5gRLUOAaiFo=;
	b=VbBZHnJ86gnTFVLYSKHEVQbponAlt2AYQy2Gm5esokkamNKY5Ne8xLlItYdWRGGVc/m9Ww
	ffXIMY8YuO9TSaDA==
From: "tip-bot2 for Chengfeng Lin" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched/fair: Avoid redundant updates for unchanged
 default slices
Cc: Chengfeng Lin <lin2530632123@gmail.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To:
 <CANGjgdmNCfm=SctvKZ44y8b5n8t_JSp4meX=DKGnG74B3g1vVw@mail.gmail.com>
References:
 <CANGjgdmNCfm=SctvKZ44y8b5n8t_JSp4meX=DKGnG74B3g1vVw@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179500949968.3191731.452631913249829655.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     9dc6cae4904ff34025704041d07c731937db10dc
Gitweb:        https://git.kernel.org/tip/9dc6cae4904ff34025704041d07c731937d=
b10dc
Author:        Chengfeng Lin <lin2530632123@gmail.com>
AuthorDate:    Mon, 19 Oct 2026 00:59:54 +08:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 18 Nov 2026 14:32:20 +01:00

sched/fair: Avoid redundant updates for unchanged default slices

For a fair task using the default slice, _sched_setscheduler() leaves
attr.sched_runtime at zero, while se.slice holds the actual duration.
Comparing them directly makes an unchanged sched_setparam() request take
the parameter-update path.

Compare default/custom mode before comparing the requested duration, as
suggested by Peter. For default-mode requests, also check that the task's
slice still matches the current default. Keep the update path outside the
fair class and when an implicit uclamp value needs resetting. Explicit
uclamp requests continue to use the existing update path.

This also handles two cases that an equal runtime alone does not cover:
a custom slice equal to the default must switch the task to custom mode,
and an unchanged legacy request may still need to reset an implicit clamp
after an RT-PI boost has ended.

On an i7-12700KF running v7.2, repeated sched_setparam(0, priority=3D0)
calls from a SCHED_OTHER, nice-0 task took 616.51 ns per call before this
change and 162.39 ns after it, saving 454.12 ns (73.66%). The existing
custom-slice fast path increased from 162.57 to 163.22 ns (0.40%).
These are syscall microbenchmark results, not an application speedup.

Signed-off-by: Chengfeng Lin <lin2530632123@gmail.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://lkml.iu.edu/2610.1/11150.html
Link: https://patch.msgid.link/CANGjgdmNCfm=3DSctvKZ44y8b5n8t_JSp4meX=3DDKGnG=
74B3g1vVw@mail.gmail.com
---
 kernel/sched/syscalls.c | 36 +++++++++++++++++++++++++++++++++---
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
index 2d77ca0..a78672b 100644
--- a/kernel/sched/syscalls.c
+++ b/kernel/sched/syscalls.c
@@ -490,6 +490,38 @@ req_priv:
 	return 0;
 }
=20
+static bool fair_params_changed(struct task_struct *p,
+				const struct sched_attr *attr)
+{
+	if (attr->sched_nice !=3D task_nice(p))
+		return true;
+
+	/* Keep the full update path for PI-boosted and sched_ext tasks. */
+	if (p->sched_class !=3D &fair_sched_class)
+		return true;
+
+	if (!!attr->sched_runtime !=3D !!p->se.custom_slice)
+		return true;
+
+	if (attr->sched_runtime && attr->sched_runtime !=3D p->se.slice)
+		return true;
+
+	if (!attr->sched_runtime &&
+	    p->se.slice !=3D READ_ONCE(sysctl_sched_base_slice))
+		return true;
+
+#ifdef CONFIG_UCLAMP_TASK
+	/* Equal fair parameters do not rule out an implicit clamp reset. */
+	if ((!p->uclamp_req[UCLAMP_MIN].user_defined &&
+	     p->uclamp_req[UCLAMP_MIN].value !=3D uclamp_none(UCLAMP_MIN)) ||
+	    (!p->uclamp_req[UCLAMP_MAX].user_defined &&
+	     p->uclamp_req[UCLAMP_MAX].value !=3D uclamp_none(UCLAMP_MAX)))
+		return true;
+#endif
+
+	return false;
+}
+
 int __sched_setscheduler(struct task_struct *p,
 			 const struct sched_attr *attr,
 			 bool user, bool pi)
@@ -588,9 +620,7 @@ recheck:
 	 * but store a possible modification of reset_on_fork.
 	 */
 	if (unlikely(policy =3D=3D p->policy)) {
-		if (fair_policy(policy) &&
-		    (attr->sched_nice !=3D task_nice(p) ||
-		     (attr->sched_runtime !=3D p->se.slice)))
+		if (fair_policy(policy) && fair_params_changed(p, attr))
 			goto change;
 		if (rt_policy(policy) && attr->sched_priority !=3D p->rt_priority)
 			goto change;
