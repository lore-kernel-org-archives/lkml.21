Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795559497;
	b=ZAaMkGCiF6vREBYyX0xHNKYbLkx543zi1qnVu6GafTRNE9KaIypeTr6TluFQ3P07ojqz
	 e2O+Kyj0TZfWbXTXfX2uQ/ueQW17iXYZXvkTzWvwWkCTG9J6/g9nMmVHXcIeIWjy7ZRGk
	 XG1RUp8FSvKGZ69bQH/65+KzTa7BK7W7TyYIYpI6YLozF6ToYvK7lFvtmPc6U7pAetp3P
	 ZqL4OQ+rCE4RjFtBU6voejb1y/WVU8FCO3zUPMEzWs2zcbWapUmG/WnQUpvTfbir4z+lW
	 QGTdgH+NdRzaobRnIV0MVcmCQS/RuvkutL/ze1XN3QFgsXIBAvzuig74VAapMq8nCxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795559497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=1LFkflj3Yy+Pq61QianUHS/zZ86xJtyY2QHKPhnA90g=;
	b=ysm/orhyr5l/M0c48tsekFcVzCmTwcGLxp1Wiit8ny5WNtYECVnthdgVREZQj5OS0UEV
	 wrUV1iv0ekx17wIciux8lt+RmEOMn8Futsf7fddoQSkMjlx3zZMPpPzm7WicOeGfeHr7T
	 SaZ1iWJdb/HYqRORquA95oV+cdQGzd73wT9hrEClTF1o++0LNrT6Jssb+UY2ugqTwEKVv
	 suu0BeaBe6W9E/bawKhJcpsvmxNUpglPgXoyf1/Sm5+m9tKZ00ID1ds38CCsKPiJSpBRx
	 dvDPZDslK4TczmB2CAeIk6dToeQYstroOLxAPxQGCDY/FodAdu++VA9KGwx0rEc/DMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KYm5jdfC;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CE6606A33E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:31:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3CE6606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KYm5jdfC
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso6809214eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795559496; x=1796164296; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1LFkflj3Yy+Pq61QianUHS/zZ86xJtyY2QHKPhnA90g=;
        b=KYm5jdfCqELEpbdOMljHJOQBVz04g4BsB9ovJl66yPz113k06epQsMn6R1abVPaLtM
         hbyUfY1Pdbz9DjTEE+UmsvxsFdrO6H9xBVe7HiPuWiyLARu/VSqCzLnZOi96KXtKts2+
         9VksebMdFKY4XePmkBVlWzjd9g0vxW2kU45Wa5gZ6zjr/z9samT8DyEXR/C6UBdKYVlR
         V+gCaL0Tuvyx51OHoibCBDE8S/MnB/nPdRZzdGXyjmXlqxdmZL4+kLkJW6uARAyDk5ix
         AgW365UFGgcbGRRrSa8/EXpsLhYZwxlOpMSb2SpoGw2CflMnvceZOGczLWXEZSFAxYBk
         Z6VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795559496; x=1796164296;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1LFkflj3Yy+Pq61QianUHS/zZ86xJtyY2QHKPhnA90g=;
        b=NzbudPiTFoC0qYBnJSlz3r5Sm8oj2O8xZ1hNMj2SUh6SpzoxZ4YJSSgRFWej8ajYsj
         xB5D+EGCARAbwCxcnrps0bWJE2zATgM9qqAzyXMrpVLId6kGxo8VmpfajUDFsI9RbKBj
         p/1gN7I6z4We7OAuNjZh4gmg3nQdeJ0TNXMgUgQSJIHtYgUqTkvcHsHuuids4CeQ8LLd
         wqzl7ydLPtJa63bPXkUzJ8W8jPf6vfgsA8DBadu5yX1qoVWNEZFd+iFPcS2q8vdjEde2
         +dmUr2dwuInxru/2prHaRNCyUxKWFH8iahclS9sbeWvBeNAD+vhV9RkIiEY/xZdRoIV7
         kZjw==
X-Forwarded-Encrypted: i=1; AL+hErF8sKtIiMYe8UaVXfE/qYbNu23YMZrdtqjawqRU2sPFG8aSvb5CbrjXf5/52Dtzgt+2vzuWqnlkRen5qcA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9wYyCPkKrcuXjLWU0+Mr/TtALLf9adQCNuTjQoCaDE/g42VW/
	VKJLblPq05XI+1d078FSy7KH3s5Ri5rrvq2Uexv266cVdtgLOq4exu0mxbJOyd0bXcRPtOgXdJ2
	mHyoSP9OOZQ==
X-Received: from dybqo7.prod.google.com ([2002:a05:7301:6787:b0:351:1933:2028])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:7187:b0:386:bd8:7ab3
 with SMTP id 5a478bee46e88-3860bd88965mr15742141eec.29.1795559495589; Tue, 24
 Nov 2026 14:31:35 -0800 (PST)
Date: Tue, 24 Nov 2026 14:31:08 -0800
In-Reply-To: <20261124223109.820609-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261124223109.820609-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261124223109.820609-12-irogers@google.com>
Subject: [PATCH v10 11/12] perf session: Add dso__session() and session-scoped
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
index b6217c49dd14..43b1ad44d165 100644
--- a/tools/perf/util/dso.c
+++ b/tools/perf/util/dso.c
@@ -1915,6 +1915,13 @@ void dso__delete(struct dso *dso)
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
index b0ee45a53f40..eb56bf9fb4d1 100644
--- a/tools/perf/util/dso.h
+++ b/tools/perf/util/dso.h
@@ -20,6 +20,7 @@
 struct machine;
 struct map;
 struct perf_env;
+struct perf_session;
 
 #define DSO__NAME_KALLSYMS	"[kernel.kallsyms]"
 #define DSO__NAME_KCORE		"[kernel.kcore]"
@@ -797,6 +798,7 @@ static inline refcount_t *dso__refcnt(struct dso *dso)
 bool dso__can_shrink_symbols(const struct dso *dso);
 bool dso__try_evict(struct dso *dso);
 size_t dso__shrink(struct dso *dso);
+struct perf_session *dso__session(const struct dso *dso);
 
 char *dso__filename_with_chroot(const struct dso *dso, const char *filename);
 
diff --git a/tools/perf/util/dsos.c b/tools/perf/util/dsos.c
index 77f668d7557c..43605daedba6 100644
--- a/tools/perf/util/dsos.c
+++ b/tools/perf/util/dsos.c
@@ -19,6 +19,7 @@ void dsos__init(struct dsos *dsos)
 {
 	init_rwsem(&dsos->lock);
 
+	dsos->machine = NULL;
 	dsos->cnt = 0;
 	dsos->allocated = 0;
 	dsos->dsos = NULL;
diff --git a/tools/perf/util/dsos.h b/tools/perf/util/dsos.h
index de10a10de777..87002b25a3bb 100644
--- a/tools/perf/util/dsos.h
+++ b/tools/perf/util/dsos.h
@@ -19,6 +19,7 @@ struct machine;
  */
 struct dsos {
 	struct rw_semaphore lock;
+	struct machine *machine;
 	struct dso **dsos __pt_guarded_by(&lock) __guarded_by(&lock);
 	unsigned int cnt __guarded_by(&lock);
 	unsigned int allocated __guarded_by(&lock);
diff --git a/tools/perf/util/machine.c b/tools/perf/util/machine.c
index f4108cc725fc..20215c12819e 100644
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
index b42c363723c9..80ef16384aa5 100644
--- a/tools/perf/util/machine.h
+++ b/tools/perf/util/machine.h
@@ -165,6 +165,11 @@ static inline struct perf_session *machines__session(struct machines *machines)
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
index 9f16bff1b72f..610bbc769ef7 100644
--- a/tools/perf/util/session.c
+++ b/tools/perf/util/session.c
@@ -4278,3 +4278,73 @@ size_t perf_session__shrink(struct perf_session *session)
 
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
2.56.1.831.g720f3f5937-goog

