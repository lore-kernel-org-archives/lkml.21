Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794941606;
	b=YgeMRmYklqKNbfi1zaH9No5fn3epO5CIMVryXXNNrRKo377V/FCJUbWWXVfVn2F7+fxu
	 jb3raLi+s1048amkILQtRRHdE6BsCz0QorQv7pqV5tNqxXw/fE/4lyRA5+EDI/27KAVxs
	 xb2hhW/Jw+xLSiFJIOX7/cK+FHITmVm/+k54QO3ymBewwvi16c3KlqIwY84db5vmDf6zn
	 /iwRkcWc9gHAjP3CTS6mj8ltQBJHO6NrTOBxDgCsrlftv8pidBKYLbyLPAPFUK8NgT1UF
	 xnklf0hYRNqL0JjN6tUJPIw4Tc4cCVNNlhiaiSbWrJBGre2vSDwwutRioRVKySWgCow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794941606;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Xd/CRfq+mPZ3eeX9W7RU30z+MWQTl3VecADLhMsBmpE=;
	b=JpGTF7V9FZv43yRDBQrNFE+frjwqjScUFAAzbRd7jrA6M35ekhtrhthlPBOQgk30edQE
	 exbFpUF7w5PzLsqxgRn4ml84Zfxqk/kLD6wC6sbrSg7iKVg8NPzjbDih0niDTGJPnoYRj
	 lD3nS258TNi+ITXeNin3wPoeTQKcy6zdTF3C41Coe8qzPqj3hqvI0CHjLXNIqXCNPZ1F/
	 UQLg/ryukY/lOkrl3vEoFCDxgNuLuSFi6zeg8e76gxVYOB0epTACA9oYu0VbPwTKy03EJ
	 tinj+q+6Hww5KduaEMnDbzCy7P9fhxhkoiJxh33NnY08j2iCArMXVU4aXTSk0k8i4lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OWY1JVBe;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E782606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:53:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E782606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OWY1JVBe
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1a71dd190b0so332162c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794941606; x=1795546406; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xd/CRfq+mPZ3eeX9W7RU30z+MWQTl3VecADLhMsBmpE=;
        b=OWY1JVBetB0Bllyg9X+d6azkUhIwIhwrmpMBGlPZPBYcNb7BnIeKY5jzzHbeP00/fW
         wL2cvQz4JqjzuVi76uPl1PY5LsdpAsQmx4F/1E6N1xsbbynVwyrKjftAocKb+zWNBjOq
         X35FKHf3/1g2bSOq/0PZEpdfVqQR/ggFP6VXxdBvoGo2b3puKZhEopiMmzLkfy7qb9M6
         SZTBWRQhqbYCXsuTXsMTVCIUwSHiXjya6Dx1n2R1e+j+4PgLRdAi1ujvgzfuhqrjAk6J
         /1805bZy9EePigc2qZvuc/A9mIx1WGdwIt81A2vojJ4i+X9rsvjkyKIoxMPg4kzfpPjV
         MSdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794941606; x=1795546406;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xd/CRfq+mPZ3eeX9W7RU30z+MWQTl3VecADLhMsBmpE=;
        b=G3fX+38ijQt/7b6fVTgwQllB3rKfRz0i+2vn08kD9XqbDueo4lHHMdrN62vjW6wMgI
         Ab3gW0hL5IXc6TaO6BDraECAS0iThuoUfMBqJa0ZS/5PQgfoN6nx5adSAtm152xGbrEI
         NMrUBJotZMk8jvUyJxPdSlerOhoawkiQdN+kV0aezKnCnF4VTecvdACGUHxts6kPIMSt
         7+T9aLTpfVz6H+R2Bz2xZTnvU/vCmoGym+LO0gZYqNnqh0ZFEq6+CzWGHg+uhFgWeSY8
         HzkDCta9wBFd5Z5tvoh5IpKVIihjO37Xue22q6TFbf+0MCw+DS2AIDXWhNlTXMYVDALx
         BiFw==
X-Forwarded-Encrypted: i=1; AL+hErEXWQWHJ8Xhk6PSNSCk4/lkyj23H9mbbK2LnnnxAWuPSpDKbMgYwnuv1etDG+Ibp4A4o9gLtG69XxqRC8E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+W/+BUGB4QzPzdE/3F6Cxka707uJyQjsVaalbXkHWP1uHkEkDW
	kRpzHDzq6hSP+4kMnO/pmj+4GeSHvCSoSWSJf+TB/0qXATOKPKR/Ccs462DagrrmSplV/Oy0JCW
	GA3dU3TB/vQ==
X-Received: from dlaj6.prod.google.com ([2002:a05:701b:2806:b0:194:c5c4:fa82])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701a:cca2:20b0:1b5:31ed:e235
 with SMTP id a92af1059eb24-1b543c4645emr489193c88.44.1794941605438; Tue, 17
 Nov 2026 10:53:25 -0800 (PST)
Date: Tue, 17 Nov 2026 10:53:04 -0800
In-Reply-To: <20261117185305.108003-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117185305.108003-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261117185305.108003-9-irogers@google.com>
Subject: [PATCH v6 8/9] perf session: Add dso__session() and session-scoped
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
index 962e1ad0c463..0991a5ab7c8d 100644
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
2.56.1.703.gf848ed807c-goog

