Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430781;
	b=CC+WszVnDjwYd9P2zH+ZU6sC1oAB/EXMvOLmh1u339f5Rs8R5Bq6+x1P/PeGETN+wG84
	 iqDdN2R5ltus2L/CamIGtl88VGGbXhXrCqEsjC+fhFL5mbEQogDOS87o5pF3iWtelxbn/
	 +/EHsh5YvfcJi/YKleuQB6Hq1HJ1VtUUiBeHbCw3heg0LrZ86wnl1QjPET4nGBx8f1+4/
	 o9oOejoUJf/Wen+9sGdMlhzXp3AAya+EvvVvI2TiYytCF1TlHKLQb44YxNd/VpAP685tJ
	 h2HAtU+Fdt4MwFpSvnGaPS152+3O3CsBVJA1SRWI0DJvEZF8uHx7m4Agrk33gpj3uEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430781;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=0uCdHZiVVTDG+XttRZzpcPvSV82rXD7vMjRz82vFZNM=;
	b=gUwteFpANmaBxQRA4AvjTXN524tmhkeZAO+ySIIZ0U1/ofzeTBmFbvZu2L1rA45SfDLx
	 GtLWw7YzS+lS4vBTmce96BfATAyQbkDOIAijmnDyNgl4PBFpDisIDVjCtINYN2Tly4VKs
	 iLOxk3iCV6kyn9iD0uFz9c+E61ZjNaqNzQRvUCWyOlSDENew0Tz43G4C8EFfA/H1BjLn8
	 UE6ViZTBBRfh2bPLdW66tVjh6d74AQC6OHgOUGnlcQdjUHFZqZBjA3+ep0xu1S40NIErT
	 9QW2rCKVEiWzQB6+AP5QGv3fB27fGsoie7ugc7G7jofkjUT/VmMXJfajAWfpEorhjOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elver.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FDtXaCnF;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF091606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:46:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF091606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FDtXaCnF
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4ba01393800so19783145e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795430779; x=1796035579; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0uCdHZiVVTDG+XttRZzpcPvSV82rXD7vMjRz82vFZNM=;
        b=FDtXaCnF5YBz9nSbpmdTRRkgJY6iWfjQ/yv3scqyu46KbV5RVsULytvwf+2Ee4lGvn
         DZgnct4Dw2Vsgrnqgjl1WuT6ieF9sPdJNzgeg3OBFj3X4XCxTXTiq3eO9/fq6n8IAp7A
         5Tp8UQkUIYVQrv8awz0WyooXf5bgCs69qw28N8egmIkU1hQWbQgINGPFugYItldb0U9K
         IKPr9/ktxd9m/QX4gSdOlbTMTqDwfnCC1adB6TTJKyCOYh3YtzuV1pq2cDkrWoPEw5tg
         EyIl81L+NNdKDKIxjjmGDyRr4SF9w3+wH1wYtJIPq2O6p04a4QOqUdDUsyWFfLIx05uc
         RO9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430779; x=1796035579;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0uCdHZiVVTDG+XttRZzpcPvSV82rXD7vMjRz82vFZNM=;
        b=meMigY8GWX0cSh3/fV7iWGSPnTe18ZZUsj2mPSu/mhGva9ga8ATMb2qsghtqdweWsU
         fZmy+W4kaeOcCfHmjmUYXLjTkAQLwQzsPeFfLDc5m7RZPiXfyN4OlCY1Nk402yQAeNXc
         ux33pEFZiols8wYvfCcXnzomvDrGgYP7tem+1cq+XXZ27c4ydGwy+aC9gtLmM9flkwi+
         DYQ058n2MDequ9YTplviJTlgoNnanKnXuLuUtABNNponUUhcDkzNd6pm/L6IZGFXLwVY
         XU3aYsfup43Chcb1UBEdPw+AYNqUdxgOWld/3+nRh/r9OxNU/MbydAJVcSMqYt0nnF3Z
         alCA==
X-Forwarded-Encrypted: i=1; AL+hErEePZoQG8fnMZ/6Nx8kZHcmCLAaDeT2F7Y+2BXH9r0u60qTzUQpgoMjEkyV3HzysvtVeJ8Gw0b+JklymPo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9unFWZxpI3wk4vMKbhY8DxaCmjZQEQ7sQmE6082Fiu+erlX+KU
	tjxetGtiLh9qP0lBF0ddZRtWHzq5y3ZZbtd0sonKU8lC5RYuXfdaQPbfMg1jJL+6sTo2esbSdrK
	BgQ==
X-Received: from wmdn12.prod.google.com ([2002:a05:600c:294c:b0:4bb:5ea0:79c])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4514:b0:4bb:6823:3d3c
 with SMTP id 5b1f17b1804b1-4bb888169d0mr241187105e9.20.1795430778882; Mon, 23
 Nov 2026 02:46:18 -0800 (PST)
Date: Mon, 23 Nov 2026 10:45:50 +0000
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
Message-ID: <20261123104616.226112-1-elver@google.com>
Subject: [PATCH v3] coccinelle: locks: Add must_hold.cocci
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
__cond_releases*(), __context_unsafe() or __no_context_analysis. A lock
can be named if all identifiers in the lock expression are parameters or
member names, or if it is a global of the form &name or &name.member.
Functions that mention the lock before asserting it, e.g. to acquire it,
are skipped.

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
 - Lock expressions that contain a cast are skipped.
 - spatch 1.3 fails to parse functions annotated with __cond_acquires*()
   or __cond_releases*(), so these are not checked unless a macro file
   defines these as MACROANNOTATION.

Cc: Bart Van Assche <bvanassche@acm.org>
Link: https://lore.kernel.org/all/CANpmjNNM=qBJMvBkRu-WbhKA0hnkb_Bk8fyF9DTTsVmENDvZuQ@mail.gmail.com/
Signed-off-by: Marco Elver <elver@google.com>
---
v3:
* Also skip functions annotated with __cond_releases*() (Bart).
* Keep whitespace between words in the lock expression (Bart).
* Read each file once, and only record parameters of functions that
  contain an assertion (Bart).
* Document that casts and __cond_*() annotated functions are not handled.

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
 scripts/coccinelle/locks/must_hold.cocci | 149 +++++++++++++++++++++++
 1 file changed, 149 insertions(+)
 create mode 100644 scripts/coccinelle/locks/must_hold.cocci

diff --git a/scripts/coccinelle/locks/must_hold.cocci b/scripts/coccinelle/locks/must_hold.cocci
new file mode 100644
index 000000000000..a393d229d2bf
--- /dev/null
+++ b/scripts/coccinelle/locks/must_hold.cocci
@@ -0,0 +1,149 @@
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
+/// __cond_releases*(), __context_unsafe() or __no_context_analysis.
+//
+// Confidence: Moderate
+// Comments: Annotations on a prototype in another file are not seen; such
+//	     functions are reported with "check prototype". Annotations are
+//	     detected textually and are not matched against the asserted lock.
+//	     Wrappers like lockdep_assert_wiphy() are not handled, nor are
+//	     lock expressions that contain a cast. Functions annotated with
+//	     __cond_acquires*() or __cond_releases*() are not parsed unless a
+//	     macro file defines these as MACROANNOTATION.
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
+# All of these imply that the lock is held on entry, or disable the analysis.
+ATTRS = re.compile(r'__(must_hold|must_hold_shared|releases|releases_shared|'
+		   r'cond_releases|cond_releases_shared|'
+		   r'context_unsafe|no_context_analysis)\b')
+
+# Parameters and linkage of the functions matched by rule r.
+params = {}
+static = set()
+# The most recently read file: (name, text, lines).
+src = (None, None, None)
+
+def key(pf):
+	return (pf[0].file, pf[0].line)
+
+def missing_must_hold(f, a, E, pf, p):
+	global src
+	k = key(pf)
+	# Drop whitespace, except where it separates two words.
+	e = re.sub(r'\s+(?=\W)|(?<=\W)\s+', '', E)
+
+	# Identifiers that are neither member names nor called functions.
+	free = re.findall(r'(?<![\w.>])[A-Za-z_]\w*(?!\w*\()', e)
+	if not (all(i in params.get(k, ()) for i in free) or
+		re.fullmatch(r'&\w+(\.\w+)*', e)):
+		return None	# Cannot be named in an attribute.
+
+	if src[0] != k[0]:
+		with open(k[0], errors='replace') as fp:
+			text = fp.read()
+		src = (k[0], text, text.splitlines(True))
+
+	# Attributes on the definition, or on a prototype in the same file.
+	hdr = ''
+	for l in src[2][int(k[1]) - 1:]:
+		hdr += l
+		if '{' in l:
+			break
+	if ATTRS.search(hdr.split('{')[0]):
+		return None
+	for d in re.finditer(r'\b%s\s*\([^;{}]*;' % re.escape(f), src[1]):
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
+		f, e, want, "" if k in static else "; check prototype")
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
+@prm@
+identifier f, x;
+type T;
+position r.pf;
+@@
+
+f@pf(..., T x, ...) { ... }
+
+@script:python@
+x << prm.x;
+pf << r.pf;
+@@
+
+params.setdefault(key(pf), set()).add(x)
+
+@st@
+identifier f;
+position r.pf, ps;
+@@
+
+static f@pf@ps(...) { ... }
+
+@script:python@
+ps << st.ps;
+@@
+
+static.add(key(ps))
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

