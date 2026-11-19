Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795122506;
	b=0PooCaaodhD3SDTk46U0x7zuFqPtqbSHR8Ne7Tz/jlbejA76yA/uF6f8ec9ZwhP81WC1
	 dOPOiCd5hdjuZ/0RnmJiubES8dm89NUT4TXXJfaa5xofRf/e5lHRB04Q4q+6rdJJ7GRN0
	 q9ys5JmKEEhbzH0UzLpYOSTUHrVC0hRiYd4tJgOD53PITHm1tY2pcWfBILWk4DwbYhkCP
	 m+oFPzOIKnHkb2126peYdt4grDCAVUQEH+SwH65xcb7H8inVqe9a1HRld6ZBccsw2OAu6
	 SYIKC7n5ieOeC/Suf7Ij7vqpvkitwBG2Z8EmC7oA9pGx3556vauhSnvsJMvARQrz0IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795122506;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=cEP141ntu6kwVLUX4kI1ElJvMgyAzN7imZOIrBclONs=;
	b=i7TbeQeOueLgTvHtBj3jOtOuR8NvMXEsC5z3wDEiGs2DUKB5c1w8WQCLYUZ1qnkvHz30
	 YnOfqFyfEsZMrOFIcEFPLCSVdVyg8quqyJ8X/DtoVpCyki2J0CXQAvA59Rf2z0blIrxIc
	 2Ztj3DwHlxPQ++hhy/1lgxyebpZRTWkmZNRfFs4zYh6TIWigbrqxJt4c7k7qdtWpx1rnT
	 HsoLhY2AbltEO4Ff1cfgDKRqagX3LATFIcppxd8jepyIOyeqjp0VE9tGrEOQcmWXCN6gi
	 6L30nQi2dRIOgM3ugOSnDdvAoj2yxWv6glxt7Rry9EKb5O5dv/FeKEOy6kSBUJR7hqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elver.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LQvTyNhG;
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B8C606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:08:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69B8C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LQvTyNhG
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4a68703d177so43425f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795122505; x=1795727305; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cEP141ntu6kwVLUX4kI1ElJvMgyAzN7imZOIrBclONs=;
        b=LQvTyNhG+41hGntfIxzoVaBZWAi9m7Ni0WWP2pzs0iVsUqepZVgSShN5Hk0PxodhT/
         WXHtK/zaKk6VKYZZvdFGKVaFQL3yH88QE2tMQtP0hiEdw0SdPffc2sc5UZQCgkrjBa43
         5abXscvPvIEmtgtp1sggBfWohRFbnFmUbgxLn/JZWsMJ8KXH8SUq87KZQAulisDmR1Ox
         prqV+kOAhSdRKx1mcTKIDQoZZubIC6bEIDiIXahVaZR2RrmpFNJpZK2V76XExQhbQHr5
         mOzdTHfuoH+vXpz54Sdmq46cZin46xnOFXsT1D5YXE6uRF9bgqPbiAvM+4cooPdZMwqK
         nVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795122505; x=1795727305;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cEP141ntu6kwVLUX4kI1ElJvMgyAzN7imZOIrBclONs=;
        b=j8BethtAfBjygF+zhMB1opvZBcYHKW6tIfsdGBZs9EwcyIl0rR24ePtslDkPX22Z4Y
         kuCUJTR2//w10l/6VOcPFMcfsoPQXYvf0n2CAHZbJ+pCDLQ86t+tmmITf4e4NazpvnzF
         4qoyxJ6RiRyDT4zWW8m//3djAFJMmMlOp9uI3CvAsk1ZUpoM76MBNtCzuJCU7iPIc+Hz
         Z/0iNdzUDmGR7YfZVv08CiqADCWfdK6fR5hF5UXO4TY//VQIyZgudb2f8znfgWV9cB9C
         pJAnbEFeAnRity27b1zXJFl2nIGM9nq+5m6VM6XZahqFn8QRdFbL04eJdZIQao0xVX3A
         JzXg==
X-Forwarded-Encrypted: i=1; AL+hErFukXepHweWaazOXSHSHD+g7v2xav9RpGUSOnmLdoAAO3SwRO7tp0FVehznVOO6NfX8aaW/+lOORIGSOLM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1cUk33CClIKaqRqYz7bgiltT37MCiWdmzYrwyy3DuCySg5K8k
	6UJzuiv2JBTGy2C7BPuwSpx1kdqBi/aWLbpBJGfHaiqfBaKu8oDo891zv+DWGcGWGZ/nbfj0L+B
	rnA==
X-Received: from wrbdh5.prod.google.com ([2002:a05:6000:a85:b0:48a:f5b5:2f71])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:989:b0:4a8:2fb7:e610
 with SMTP id ffacd0b85a97d-4abaab6344bmr1579956f8f.2.1795122504495; Thu, 19
 Nov 2026 13:08:24 -0800 (PST)
Date: Thu, 19 Nov 2026 21:07:56 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261119210807.211041-1-elver@google.com>
Subject: [PATCH] coccinelle: locks: Add must_hold.cocci
From: Marco Elver <elver@google.com>
To: elver@google.com
Cc: Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, 
	linux-kernel@vger.kernel.org, cocci@inria.fr, kasan-dev@googlegroups.com, 
	Bart Van Assche <bvanassche@acm.org>
Content-Type: text/plain; charset="UTF-8"

Clang's context analysis treats lockdep_assert_held*() as an assumption
that the lock is held. A function that asserts instead of being
annotated with __must_hold() therefore passes the analysis, but its
callers are never checked.

Add a script that reports functions which assert on all paths that a
lock is held, where the lock can be named in a function attribute (it is
reachable from a parameter or is a global lock), and which lack a
__must_hold*() or __releases*() annotation.

For example, on v7.4-rc2:

  kernel/locking/rwsem.c:396:1-20: rwsem_del_waiter() asserts &sem->wait_lock is held but lacks __must_hold(&sem->wait_lock)
  kernel/locking/rwsem.c:437:1-20: rwsem_mark_wake() asserts &sem->wait_lock is held but lacks __must_hold(&sem->wait_lock)
  kernel/futex/pi.c:919:1-20: fixup_pi_state_owner() asserts q->lock_ptr is held but lacks __must_hold(q->lock_ptr)
  drivers/nvme/host/fabrics.c:650:1-20: nvmf_lookup_transport() asserts &nvmf_transports_rwsem is held but lacks __must_hold(&nvmf_transports_rwsem)

Limitations:

 - Annotations on a prototype in another file are not seen; non-static
   functions are reported with "check prototype".
 - Annotations are detected textually and are not matched against the
   asserted lock.
 - Functions that require a lock without asserting it are not found.

Cc: Bart Van Assche <bvanassche@acm.org>
Link: https://lore.kernel.org/all/CANpmjNNM=qBJMvBkRu-WbhKA0hnkb_Bk8fyF9DTTsVmENDvZuQ@mail.gmail.com/
Signed-off-by: Marco Elver <elver@google.com>
---
 scripts/coccinelle/locks/must_hold.cocci | 100 +++++++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 scripts/coccinelle/locks/must_hold.cocci

diff --git a/scripts/coccinelle/locks/must_hold.cocci b/scripts/coccinelle/locks/must_hold.cocci
new file mode 100644
index 000000000000..ba45544afc46
--- /dev/null
+++ b/scripts/coccinelle/locks/must_hold.cocci
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/// Find functions that unconditionally assert with lockdep that a lock is
+/// held, but lack the corresponding __must_hold() annotation. For such
+/// functions the compiler's context analysis trusts the assertion instead of
+/// checking the callers.
+///
+/// Only locks that can be named in a function attribute are reported, i.e.
+/// those reachable from a parameter or a global lock (&lock). Assertions on
+/// locks reached through local aliases are skipped.
+//
+// Confidence: Moderate
+// Comments: Annotations on a prototype in another file are not seen; such
+//	     functions are reported with "check prototype".
+// Options: --no-includes --include-headers
+
+virtual report
+virtual org
+
+@initialize:python@
+@@
+
+import re
+
+def squash(s):
+	return re.sub(r'\s+', '', s)
+
+def missing_must_hold(f, ps, E, pf, p):
+	e = squash(E)
+	m = re.match(r'[&(]*(\w+)', e)
+	if not m:
+		return None
+	params = re.findall(r'(\w+)\s*(?:\[[^\]]*\]\s*)*(?:,|$)', str(ps))
+	if m.group(1) not in params and not re.fullmatch(r'&\w+', e):
+		return None	# Local alias: cannot be named in an attribute.
+
+	with open(pf[0].file, errors='replace') as fp:
+		lines = fp.readlines()
+	first, last = int(pf[0].line), int(p[0].line)
+
+	# Attributes between the declarator and the assertion.
+	hdr = ''.join(lines[first - 1:last - 1])
+	if re.search(r'__(must_hold|must_hold_shared|releases|releases_shared|'
+		     r'context_unsafe|no_context_analysis)\b', hdr):
+		return None
+
+	# Attributes on a prototype in the same file.
+	for d in re.finditer(r'\b%s\s*\([^;{}]*\)([^;{}]*);' % re.escape(f),
+			     ''.join(lines)):
+		if '__must_hold' in d.group(1):
+			return None
+
+	static = 'static' in ''.join(lines[max(first - 3, 0):first])
+	shared = 'lockdep_assert_held_read' in lines[last - 1]
+	return "%s() asserts %s is held but lacks __must_hold%s(%s)%s" % (
+		f, e, "_shared" if shared else "", e,
+		"" if static else "; check prototype")
+
+@r@
+identifier f;
+parameter list ps;
+expression E;
+position pf, p;
+@@
+
+f@pf(ps)
+{
+	...
+(
+	lockdep_assert_held@p(E);
+|
+	lockdep_assert_held_write@p(E);
+|
+	lockdep_assert_held_read@p(E);
+)
+	...
+}
+
+@script:python depends on report@
+f << r.f;
+ps << r.ps;
+E << r.E;
+pf << r.pf;
+p << r.p;
+@@
+
+msg = missing_must_hold(f, ps, E, pf, p)
+if msg:
+	coccilib.report.print_report(p[0], msg)
+
+@script:python depends on org@
+f << r.f;
+ps << r.ps;
+E << r.E;
+pf << r.pf;
+p << r.p;
+@@
+
+msg = missing_must_hold(f, ps, E, pf, p)
+if msg:
+	coccilib.org.print_todo(p[0], msg)
-- 
2.56.1.750.gf70dc682cf-goog

