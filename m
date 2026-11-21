Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795245460;
	b=MIhpF9LOArDUuMGr/88gOAyaRmUo6xJVyOQ5pQWTaUN8NdhHYjIMQlLipDzptAmZTU2v
	 +Ldt+DIUorrtasBzSjec7KavcuwNZHE2AorWeTZ+m7/bs0Y7BPE+kTR2/f+Daa0uTS2h9
	 YHKLrfk/21HPEaBppd2LObDZW4kyPWdkHtK3dzsfCkuhfd3qWlwpeaEudsK9IoF4ptlJG
	 Uy9n2GVaS9lb1NqMk7gmdjhJBI3ZD6ca+NQhAoZjGfwiUYn1ktl0/iMuTYqIQS3dGIpSQ
	 V0+O7yEiNgSA8cU7Vqw04djJuME3+/pJiV2n+V9tyVZldD8wicRq8VZTZRx7XrPXzJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795245460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=IeTGPzI4maC83QTx1YRaKrTXNXS/iGl6uwLAUWG8Zrg=;
	b=rQFE2kGPKA28kD7Zezw+Do6rYwr++G4u+d9jmhIDYBmz43fZj8pYJMdmwQ2pt3PIc09l
	 EHjaje5bGA+Y20dv6hXdU3pxyKLKxG2FKYS56BMsH6QtGXnODYxDpFXDClQgLuyHqNKi9
	 1VnQLApF3wmOr2wy7eqoHYsCZMChclm3ImZrAjjWFXkJDgXmnufb9Ppn/GiZbWfnbJT3K
	 5nxuaQPnwD3DifRRp1XcTl7JrItjh3dOqMKeM8wCy9IF8a1GcukY7nl8S+l4bVYr+jnmx
	 DtJbAe8+nMfAHx6q0mp8k5Qa8+ChRrU/Z9UYgdj57mgbV1VxMBiwCs+BV4WDbZNA2jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PrS0tu29;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351A7606A335
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 07:17:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 351A7606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PrS0tu29
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-38531c1a566so4091004eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795245458; x=1795850258; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IeTGPzI4maC83QTx1YRaKrTXNXS/iGl6uwLAUWG8Zrg=;
        b=PrS0tu29NJ6dqMFgXCrdGcYfzIAMKskZ8RFB+tjNn/PSXKdvkQxWBzGE3btr4g4WiL
         NWX/73GbZjKvmSZcjJz41ZuPmVYx/RzcLkgsxoNoaDbFtEPfSTMjKzg1BimO6x0QWNL6
         S5YVELktvCMknOwu/1hNy3hTVqTH5TS4ETrf6t//ZIZLgyAFF7StkyQYxZghmX7T5YU8
         POqmwIZSpx58jt5VjD2c+YzRpfG0PSMBiYCMaUCS0WgrEaZp0b1UZ2N1KY9mmTS0kDWN
         rOEMBZRAlAWmCymZ4ichUiWdRfQ/ce7mDxIyDPBsxO9Vj9uG9KBW+cB0ev3NTiIf/aZn
         inUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795245458; x=1795850258;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IeTGPzI4maC83QTx1YRaKrTXNXS/iGl6uwLAUWG8Zrg=;
        b=hyEdgk6D8DHUUAdXzysTmdSE+jog8kJNeKVAl5Z8S7SBcXao8lyhbpElah289n/hgD
         3qr5sP+oP/eO9vPjvyJ+QwujTih55LJHBEpJ6l/se3TuDE4Cr+iUKl6qa3riUOc8kwb9
         qitQiPeeHEqsAe41Wz7o50EL82msYYQOCnZoNw30VYrfC4YJfpiUi7qjnU8adDAuW+B9
         TAf9R+yeOfXftilAMoHA3YY7mwsK24EjRueejMu/pcvrfA5BYOv4ENHA4Bq2sUxAMh3m
         DgyzpB+1+kJYabyI86cACLFPelco5EK8mrspiAex3NWJm6zrcIkMQSyD096wf8FHlfSV
         quFg==
X-Forwarded-Encrypted: i=1; AL+hErHytHzQ3vZXlwpixk+j3ORu26ZYZ93v8fP5K6+pVZYNSkTcGOl5C76DuinOuSj9Ih0D6ImUD5H70j0dryY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9x1HpIDJEyUQHidvB9tLKexQYA4GTX1856dzkp+zuzISGWCOP/
	R/US8LH1ntq7npPjNjjJ7o7I7RiLkTeT/0u8lMbQ5p0Umo+TLUkcdXi+waQPvNS7/XypKIQBNtp
	cao9VuVV6OA==
X-Received: from dycne3.prod.google.com ([2002:a05:7301:c83:b0:36c:99b8:3ed7])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:c695:b0:37f:73f9:aee7
 with SMTP id 5a478bee46e88-3856c9a6408mr6002266eec.5.1795245457874; Fri, 20
 Nov 2026 23:17:37 -0800 (PST)
Date: Fri, 20 Nov 2026 23:16:50 -0800
In-Reply-To: <20261121071651.67118-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261121071651.67118-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261121071651.67118-10-irogers@google.com>
Subject: [PATCH v7 09/10] perf session: Add dso__session() and session-scoped
 allocation wrappers
From: Ian Rogers <irogers@google.com>
To: Namhyung Kim <namhyung@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Alireza Haghdoost <haghdoost@uber.com>, Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add explicit session-scoped memory allocation wrappers:
- perf_session__malloc(session, size)
- perf_session__zalloc(session, size)
- perf_session__calloc(session, nmemb, size)
- perf_session__realloc(session, ptr, size)
- perf_session__strdup(session, s)

When an allocation fails and returns NULL, if a non-NULL struct
perf_session is provided, the wrapper invokes perf_session__shrink() to
evict unreferenced symbols, DSOs, and cached debuginfo across the
session's machines and then retries the allocation once. This avoids
the thrashing overhead of periodic heuristic shrinking while allowing
perf to recover from memory exhaustion.

Also plumb a back-pointer from struct dsos to its owning struct machine
so machine__session(machine) and dso__session(dso) can resolve the
active perf_session.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dso.c     |  7 ++++
 tools/perf/util/dso.h     |  2 ++
 tools/perf/util/dsos.c    |  1 +
 tools/perf/util/dsos.h    |  1 +
 tools/perf/util/machine.c |  1 +
 tools/perf/util/machine.h |  5 +++
 tools/perf/util/session.c | 70 +++++++++++++++++++++++++++++++++++++++
 tools/perf/util/session.h |  6 ++++
 8 files changed, 93 insertions(+)

diff --git a/tools/perf/util/dso.c b/tools/perf/util/dso.c
index 0d205015c6dc..ba070611c18a 100644
--- a/tools/perf/util/dso.c
+++ b/tools/perf/util/dso.c
@@ -1933,6 +1933,13 @@ void dso__delete(struct dso *dso)
 	__dso__delete(dso, /*close_data=*/true);
 }
 
+struct perf_session *dso__session(const struct dso *dso)
+{
+	struct dsos *dsos = dso ? RC_CHK_ACCESS(dso)->dsos : NULL;
+
+	return dsos ? machine__session(dsos->machine) : NULL;
+}
+
 bool dso__can_shrink_symbols(const struct dso *dso)
 {
 	const char *name;
diff --git a/tools/perf/util/dso.h b/tools/perf/util/dso.h
index 0a8df19383e8..d4360a6ed8e0 100644
--- a/tools/perf/util/dso.h
+++ b/tools/perf/util/dso.h
@@ -20,6 +20,7 @@
 struct machine;
 struct map;
 struct perf_env;
+struct perf_session;
 
 #define DSO__NAME_KALLSYMS	"[kernel.kallsyms]"
 #define DSO__NAME_KCORE		"[kernel.kcore]"
@@ -792,6 +793,7 @@ static inline refcount_t *dso__refcnt(struct dso *dso)
 bool dso__can_shrink_symbols(const struct dso *dso);
 bool dso__try_evict(struct dso *dso);
 size_t dso__shrink(struct dso *dso);
+struct perf_session *dso__session(const struct dso *dso);
 
 char *dso__filename_with_chroot(const struct dso *dso, const char *filename);
 
diff --git a/tools/perf/util/dsos.c b/tools/perf/util/dsos.c
index 52d80219ac2f..343c79c7ee37 100644
--- a/tools/perf/util/dsos.c
+++ b/tools/perf/util/dsos.c
@@ -18,6 +18,7 @@ void dsos__init(struct dsos *dsos)
 {
 	init_rwsem(&dsos->lock);
 
+	dsos->machine = NULL;
 	dsos->cnt = 0;
 	dsos->allocated = 0;
 	dsos->dsos = NULL;
diff --git a/tools/perf/util/dsos.h b/tools/perf/util/dsos.h
index 151efdba2aa4..d636e4c5cbaf 100644
--- a/tools/perf/util/dsos.h
+++ b/tools/perf/util/dsos.h
@@ -19,6 +19,7 @@ struct machine;
  */
 struct dsos {
 	struct rw_semaphore lock;
+	struct machine *machine;
 	struct dso **dsos;
 	unsigned int cnt;
 	unsigned int allocated;
diff --git a/tools/perf/util/machine.c b/tools/perf/util/machine.c
index 60eed6ae3ba1..d3a93e8a4743 100644
--- a/tools/perf/util/machine.c
+++ b/tools/perf/util/machine.c
@@ -81,6 +81,7 @@ int machine__init(struct machine *machine, const char *root_dir, pid_t pid)
 	memset(machine, 0, sizeof(*machine));
 	RB_CLEAR_NODE(&machine->rb_node);
 	dsos__init(&machine->dsos);
+	machine->dsos.machine = machine;
 	threads__init(&machine->threads);
 
 	machine->kmaps = maps__new(machine);
diff --git a/tools/perf/util/machine.h b/tools/perf/util/machine.h
index 0f4c0ae5b56d..6192bd3e33bb 100644
--- a/tools/perf/util/machine.h
+++ b/tools/perf/util/machine.h
@@ -164,6 +164,11 @@ static inline struct perf_session *machines__session(struct machines *machines)
 	return machines->session;
 }
 
+static inline struct perf_session *machine__session(const struct machine *machine)
+{
+	return machine && machine->machines ? machine->machines->session : NULL;
+}
+
 void machines__process_guests(struct machines *machines,
 			      machine__process_t process, void *data);
 
diff --git a/tools/perf/util/session.c b/tools/perf/util/session.c
index d5cb5e94a54a..0f3e44fa4486 100644
--- a/tools/perf/util/session.c
+++ b/tools/perf/util/session.c
@@ -4274,3 +4274,73 @@ size_t perf_session__shrink(struct perf_session *session)
 
 	return machines__shrink(&session->machines);
 }
+
+static __thread bool perf_session__in_shrink;
+
+static bool perf_session__try_shrink(struct perf_session *session)
+{
+	size_t freed;
+
+	if (!session || perf_session__in_shrink)
+		return false;
+
+	perf_session__in_shrink = true;
+	freed = perf_session__shrink(session);
+	perf_session__in_shrink = false;
+
+	return freed > 0;
+}
+
+void *perf_session__malloc(struct perf_session *session, size_t size)
+{
+	void *ptr = malloc(size);
+
+	if (unlikely(!ptr && size != 0) && perf_session__try_shrink(session))
+		ptr = malloc(size);
+
+	return ptr;
+}
+
+void *perf_session__zalloc(struct perf_session *session, size_t size)
+{
+	void *ptr = zalloc(size);
+
+	if (unlikely(!ptr && size != 0) && perf_session__try_shrink(session))
+		ptr = zalloc(size);
+
+	return ptr;
+}
+
+void *perf_session__calloc(struct perf_session *session, size_t nmemb, size_t size)
+{
+	void *ptr = calloc(nmemb, size);
+
+	if (unlikely(!ptr && nmemb != 0 && size != 0) && perf_session__try_shrink(session))
+		ptr = calloc(nmemb, size);
+
+	return ptr;
+}
+
+void *perf_session__realloc(struct perf_session *session, void *ptr, size_t size)
+{
+	void *new_ptr = realloc(ptr, size);
+
+	if (unlikely(!new_ptr && size != 0) && perf_session__try_shrink(session))
+		new_ptr = realloc(ptr, size);
+
+	return new_ptr;
+}
+
+char *perf_session__strdup(struct perf_session *session, const char *s)
+{
+	char *dup;
+
+	if (!s)
+		return NULL;
+
+	dup = strdup(s);
+	if (unlikely(!dup) && perf_session__try_shrink(session))
+		dup = strdup(s);
+
+	return dup;
+}
diff --git a/tools/perf/util/session.h b/tools/perf/util/session.h
index cbea6792a008..c6157eddcc43 100644
--- a/tools/perf/util/session.h
+++ b/tools/perf/util/session.h
@@ -213,4 +213,10 @@ uint16_t perf_session__e_machine(struct perf_session *session, uint32_t *e_flags
 
 size_t perf_session__shrink(struct perf_session *session);
 
+void *perf_session__malloc(struct perf_session *session, size_t size);
+void *perf_session__zalloc(struct perf_session *session, size_t size);
+void *perf_session__calloc(struct perf_session *session, size_t nmemb, size_t size);
+void *perf_session__realloc(struct perf_session *session, void *ptr, size_t size);
+char *perf_session__strdup(struct perf_session *session, const char *s);
+
 #endif /* __PERF_SESSION_H */
-- 
2.56.1.750.gf70dc682cf-goog

