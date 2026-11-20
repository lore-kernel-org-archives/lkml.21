Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795166815;
	b=cz3kg99CHntDqi8yIzGAglM8SivclmntlCYiN3G2KFeVArMuWCMolBsQ3a7iABcDgNQI
	 7CVB2hhwJZNdJmJ046iGMHZV2+7n8z98prr1r9jL603taYVh/BpMLxqG5EXweCBccPMxn
	 piJ+Ge/cG2gjB4DiAjr8lmXhy/sNizwd0m4L7g5yLmHGZYNRMONlfnU+9q94ClPWBnvtj
	 EcCp13vUhyZKLbBoY3IMJKxHxUD0gdtWyj2iVZK8hL2dczZ751FBg0dO407ikgoF/n8xs
	 I7hnHF0CxEgeVOT6cj0lDop8EYvWhhxMTv5uZoY9bLAfv47E1Si30M32xtIwrmIQH8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795166815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=1yx6W4KWxYBM/lEeFWv6HyZHXQa1lQq2Z18yHuwNiTg=;
	b=WjK21dGEr4cRXojgAqCYK+w6yySnKkMKUTCKQ6JWX+1JdnZ5LBEQ04Xgqo8FVKpiKAx8
	 LWTvm8omJk3qfMxNGNSlS4lf+3203c8tqKfE618AzodSqmhih1TktlwA6tVkYDl/p4mKN
	 O9wKK5NtjPIk4UNsUSQ/PgVdipjop5t/e+BRb6gHZSfhQj1m6cDJE927+f9a6XMK0QvXh
	 GsKz3SJfNdXmrJTCB+fY08v6gA+t+UsI3+pZI/HmCaRpzAHfiHNy4O4nQQwnUFKxC+bTW
	 pubLUSCaD28rni7AS0U9kl/ERL9Va/FUWfqgTztgwPkmB+dG/61UasLBqwaS4PcACyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elver.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cgSbHzs+;
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AF0606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:26:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55AF0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cgSbHzs+
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a204f135ffso3177315e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795166813; x=1795771613; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1yx6W4KWxYBM/lEeFWv6HyZHXQa1lQq2Z18yHuwNiTg=;
        b=cgSbHzs+fPk1mC3ye7ok4zFpm6x7vT2sDyaosyqsGChMcXkq95B4WqSBR0pEKDisf/
         ddNWMRP6FYwkShjsnfGBBTH0k9r9VbexmTR8wJBK8H+JMAsQOaBjFui8Qn/9I+RZiNjE
         trc0XpCKOBcqwXAyKF1UZz0ytRakrQJI9A5LRo4wZ8cns0AOrhTW/n3iz0zmsrDp8K3j
         oXwMaLe6vkS7PWetTQHGp5h1PgLsX7fmfw2qUlf4/OVeKoldbG04CuWCszx/W0/9Mcpt
         mDFL7P44KxkGa8g2DPUB2EWZWy0EVQEwfgIbCOWCeo0K5aBJmQXgV4szgDfxLrnu4b8l
         faFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795166813; x=1795771613;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1yx6W4KWxYBM/lEeFWv6HyZHXQa1lQq2Z18yHuwNiTg=;
        b=meeaZTsXUJ5hToknGljdM4eeLhIHVt8D+v1Q7lO5mHxEu6IDWmMt0Y4siMYoYjS+sG
         B2yX+UYLOeRXpt60mDcQ04lU1Lt7bQ/1mejRwUbD1o9aU4o9KqPyjL6Cs7dascKaQE/U
         JCp7tz3JGLfOJSvgK6Bc6aAX1goVgmoDPodOQe61dJRgh3w8/gUwi/Z1EiSxj26YaVeU
         Bk+soz/2FfQ2GdJiXRhklFEB1xcM47qSAWpEdGE+Jfig5mfFO8ob9/uhLCqQDVPcmY/6
         oaeWfi17xFFOFzc+90Tz7TlIE4MVcsTrIARb2mk3PlW8bzA6dFuZaH7Ad4PJRdrxbrPR
         NT7w==
X-Forwarded-Encrypted: i=1; AL+hErEt1l6MBf8EhFi/uEg+m34dpv7VoOnJrQVTPH3naug7MUB7ANO+AZvWvJLZJ3d/vnInoMomMKhAnTWK6Y4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+H3zLRRIJu8FSdGKYqjG4WCGbAWRjaBOAe7S/8quzI7ko9jCJs
	ke/DNTfLpzCzY+PVTp4T9hdGWnBhFD82LRoPPgnN1NHNb0dpy0vZdSR6zqVzZGF1d9N0I1hBsvl
	/aQ==
X-Received: from wmgi5.prod.google.com ([2002:a05:600c:2d85:b0:4bb:52ec:7054])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4f16:b0:4a2:47:b79c
 with SMTP id 5b1f17b1804b1-4bb8882a66emr57694005e9.32.1795166813334; Fri, 20
 Nov 2026 01:26:53 -0800 (PST)
Date: Fri, 20 Nov 2026 09:26:40 +0000
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
Message-ID: <20261120092646.3062639-1-elver@google.com>
Subject: [PATCH v2] coccinelle: locks: Add must_hold.cocci
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
lock is held, where the lock can be named in a function attribute, and
which are not annotated with __must_hold*(), __releases*(),
__context_unsafe() or __no_context_analysis. A lock can be named if all
identifiers in the lock expression are parameters or member names, or if
it is a global of the form &name or &name.member. Functions that mention
the lock before asserting it, e.g. to acquire it, are skipped.

lockdep_assert_held() passes for any mode, so for it the script cannot
tell __must_hold() from __must_hold_shared() and reports both.

For example, on v7.4-rc2:

  kernel/locking/rwsem.c:396:1-20: rwsem_del_waiter() asserts &sem->wait_lock is held but lacks __must_hold(&sem->wait_lock) or __must_hold_shared(&sem->wait_lock)
  kernel/futex/pi.c:919:1-20: fixup_pi_state_owner() asserts q->lock_ptr is held but lacks __must_hold(q->lock_ptr) or __must_hold_shared(q->lock_ptr)
  drivers/nvme/host/fabrics.c:650:1-20: nvmf_lookup_transport() asserts &nvmf_transports_rwsem is held but lacks __must_hold(&nvmf_transports_rwsem) or __must_hold_shared(&nvmf_transports_rwsem)

Limitations:

 - Annotations on a prototype in another file are not seen; non-static
   functions are reported with "check prototype".
 - Annotations are detected textually and are not matched against the
   asserted lock.
 - Functions that require a lock without asserting it are not found.
 - Only lockdep_assert_held{,_write,_read,_once}() and
   assert_{raw_,}spin_locked() are matched; wrappers such as
   lockdep_assert_wiphy() are not.
 - Functions that test the lock expression before the assertion, e.g.
   __futex_unqueue(), are skipped along with those that acquire it.
 - &name.member is assumed to be a global.

Cc: Bart Van Assche <bvanassche@acm.org>
Link: https://lore.kernel.org/all/CANpmjNNM=qBJMvBkRu-WbhKA0hnkb_Bk8fyF9DTTsVmENDvZuQ@mail.gmail.com/
Signed-off-by: Marco Elver <elver@google.com>
---
v2:
* Report both __must_hold() and __must_hold_shared() for
  lockdep_assert_held() (Bart).
* Fix detection of annotations on prototypes in the same file (Bart).
* Make "forall" explicit (Bart).
* Skip functions that mention the lock before asserting it (Bart).
* Require all identifiers in the lock expression to be parameters or
  member names; accept &name.member as a global (Bart).
* Match parameter names and "static" in SmPL instead of with regular
  expressions (Bart).
* Also match lockdep_assert_held_once() and assert_{raw_,}spin_locked()
  (Bart).
* Document skipped attributes and further limitations.
---
 scripts/coccinelle/locks/must_hold.cocci | 131 +++++++++++++++++++++++
 1 file changed, 131 insertions(+)
 create mode 100644 scripts/coccinelle/locks/must_hold.cocci

diff --git a/scripts/coccinelle/locks/must_hold.cocci b/scripts/coccinelle/locks/must_hold.cocci
new file mode 100644
index 000000000000..0acec2680aa6
--- /dev/null
+++ b/scripts/coccinelle/locks/must_hold.cocci
@@ -0,0 +1,131 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/// Find functions that unconditionally assert that a lock is held, but lack
+/// the corresponding __must_hold() annotation. The compiler's context
+/// analysis does not check the callers of such functions.
+///
+/// Only locks that can be named in a function attribute are reported: either
+/// all identifiers in the lock expression are parameters or member names, or
+/// the lock is a global of the form &name or &name.member. Functions that
+/// mention the lock before asserting it (e.g. to acquire it) are skipped, as
+/// are functions annotated with __must_hold*(), __releases*(),
+/// __context_unsafe() or __no_context_analysis.
+//
+// Confidence: Moderate
+// Comments: Annotations on a prototype in another file are not seen; such
+//	     functions are reported with "check prototype". Annotations are
+//	     detected textually and are not matched against the asserted lock.
+//	     Wrappers like lockdep_assert_wiphy() are not handled.
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
+ATTRS = re.compile(r'__(must_hold|must_hold_shared|releases|releases_shared|'
+		   r'context_unsafe|no_context_analysis)\b')
+params = {}
+static = set()
+
+def key(pf):
+	return (pf[0].file, pf[0].line)
+
+def missing_must_hold(f, a, E, pf, p):
+	e = re.sub(r'\s+', '', E)
+
+	# Identifiers that are neither member names nor called functions.
+	free = re.findall(r'(?<![\w.>])[A-Za-z_]\w*(?!\w*\()', e)
+	if not (all(i in params.get(key(pf), ()) for i in free) or
+		re.fullmatch(r'&\w+(\.\w+)*', e)):
+		return None	# Cannot be named in an attribute.
+
+	with open(pf[0].file, errors='replace') as fp:
+		src = fp.read()
+
+	# Attributes on the definition, or on a prototype in the same file.
+	hdr = ''.join(src.splitlines(True)[int(pf[0].line) - 1:]).split('{')[0]
+	if ATTRS.search(hdr):
+		return None
+	for d in re.finditer(r'\b%s\s*\([^;{}]*;' % re.escape(f), src):
+		if ATTRS.search(d.group(0)):
+			return None
+
+	if a == 'lockdep_assert_held_read':
+		want = "__must_hold_shared(%s)" % e
+	elif a == 'lockdep_assert_held':
+		want = "__must_hold(%s) or __must_hold_shared(%s)" % (e, e)
+	else:
+		want = "__must_hold(%s)" % e
+	return "%s() asserts %s is held but lacks %s%s" % (
+		f, e, want, "" if key(pf) in static else "; check prototype")
+
+@prm@
+identifier f, x;
+type T;
+position pf;
+@@
+
+f@pf(..., T x, ...) { ... }
+
+@script:python@
+x << prm.x;
+pf << prm.pf;
+@@
+
+params.setdefault(key(pf), set()).add(x)
+
+@st@
+identifier f;
+position pf;
+@@
+
+static f@pf(...) { ... }
+
+@script:python@
+pf << st.pf;
+@@
+
+static.add(key(pf))
+
+@r forall@
+identifier f;
+identifier a = {lockdep_assert_held, lockdep_assert_held_write,
+		lockdep_assert_held_read, lockdep_assert_held_once,
+		assert_spin_locked, assert_raw_spin_locked};
+expression E;
+position pf, p;
+@@
+
+f@pf(...)
+{
+	... when != E
+	a@p(E);
+	...
+}
+
+@script:python depends on report@
+f << r.f;
+a << r.a;
+E << r.E;
+pf << r.pf;
+p << r.p;
+@@
+
+msg = missing_must_hold(f, a, E, pf, p)
+if msg:
+	coccilib.report.print_report(p[0], msg)
+
+@script:python depends on org@
+f << r.f;
+a << r.a;
+E << r.E;
+pf << r.pf;
+p << r.p;
+@@
+
+msg = missing_must_hold(f, a, E, pf, p)
+if msg:
+	coccilib.org.print_todo(p[0], msg)
-- 
2.56.1.750.gf70dc682cf-goog

