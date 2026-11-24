Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795559492;
	b=EPexs9qjdCcGuNE1k5c/4T3+m+pyZunoT9vXiah0jNGbPXrgqhdkQjWZjp9D2BPeD4/Y
	 BXi+slXd8HbAZDa2ptX4Q1GiCZLSDL82JaVGOOxoiHjNRkctcqoBbyV9a0cqXv43MpVY/
	 hRiW1vcuvjHaTtTAZp9YV/tUbMRU6dZmX4UsBUf4bT3ud2Oa6BnyViN5l0Px5ykCH+QXM
	 gG/VkF8IPKbgBtVaW4A79b/eg8jKq1OXm836Y12zOyNroUL9ib9BfgnYpw1mw0Z0e3jsX
	 fP89//5oHAFUCFybuA3bE/gHLtzxnQwx0TVfjUoDkZoCvhtwg++Z7z63ou9AUsj/XtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795559492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=BLzORvgbncPbPp0GI182YtjmWy3Mmc/7qWRroJoKuOM=;
	b=Wzuco8VFdE/hbniq8fmvgFMFptyZ6ZvEyKLm4IwDY4NM1KN/fMXbGvKflQYWDPgvztb1
	 CtHW8i8v3rl/yS/o8Z6vwAH/KrnTwDysjXMXBeXHhK09oUcQpfmyEfTEzZelzLh73F3YS
	 Kc16cZa07voZOGRLCYQyEqLVBBI8HB3zv9uNtLr58umCSypJ76q2r4Vouuut+1Dtcwoem
	 lMKjDQijCufaYZikcQpdHtFR18kmQ4vgvXc/rp+RPbzi+xDEFGw/kocXe0xvygUg8nX6e
	 BsXTfqhrjbaJpfIGXjv/A1djzRiUIWGORJKyxI6uiU0I2nWUUWtMVMF4Y6nfXoYaRIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eceX2+w0;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1243C60A2603
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:31:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1243C60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eceX2+w0
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-38355b03cb8so4965511eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795559491; x=1796164291; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BLzORvgbncPbPp0GI182YtjmWy3Mmc/7qWRroJoKuOM=;
        b=eceX2+w076mnB5mjYeiDFRi3y1SRxQETURO7nFKa9gDZ2qkXZv3bcE4kRDcrdOVwXW
         Gd/Fc+ay62v3exnBrqcc9LzDbmgvG51Y5jNNvb03AyrGvJdf6HfXrTbLQVraKL0sUBw7
         PVwbeiRi/u+GJk0F+pjD5f2uocofvxkLIjUceUF53mBkXDOLfAhSbAURWhXVXtIpEVbp
         yYZ9NmB5bQtLHUOzYjoxHgdNCMHy7jExv1bh0fKU0o+o5nwkxGQS/dUEIxxejA6UXGMe
         lf/sQ/h6+T1n6k0cXngGklAWGR18oCOKxD44AqQutHIhmRdx0gMoahtxT+9kZFcv9dA+
         fEcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795559491; x=1796164291;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BLzORvgbncPbPp0GI182YtjmWy3Mmc/7qWRroJoKuOM=;
        b=F2bMWSHg5Z5blxAQTVUc7FI+P12PTnE75MbrUZdd7odChgaqFSfMTXr8vxfZmz+RLK
         JGUOAYXHSvok55YmZc1CR1cCho4S+hCJztSk8YX831MjoCO703evuvnKimzJZuNz7cbv
         E91HyTn0n8SjBOxtSnPyTYt/bwhZzzuCzYoA6ijpf4HBSR0y8h9r3ZtXI7mqsDYYLrt2
         uavmXnWLDp4PLPra9G27vUXn7eTSoq01XnY1JjlJN5eMrQxm26t0HihyfBm0+rZKpje8
         Qvq63XJOftoEm3Hq2hQ6mslmbfUEwprSDmxJWpyJWd4S1aTKlM5KVqwccf0oSRFNU4lG
         WlJQ==
X-Forwarded-Encrypted: i=1; AL+hErFl08SZYVfxhMbMA8U8s4UZDRK+UEKkt0GmgkbUg6AYB8YsGb8PgtD3NoFGUXAsaqUTfYYBIbDTumpU/bA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UlKxppUqwOMkcZbZttfGkpLK5uIxHZScPtxZjPxdCJrtLjip1
	tBjNJ4Ng9zMtpdkLPXdId6ThJYHvTkU3GgPl+x3xPpt5MdW7FRYp40FvfER0iamhHCP4lYjdMsN
	Mwo2ay8zGOA==
X-Received: from dleb2-n1.prod.google.com ([2002:a05:701b:4242:10b0:1a7:5148:9561])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4553:10b0:169:9f67:a91b
 with SMTP id a92af1059eb24-1b5568650aamr15274674c88.12.1795559490610; Tue, 24
 Nov 2026 14:31:30 -0800 (PST)
Date: Tue, 24 Nov 2026 14:31:06 -0800
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
Message-ID: <20261124223109.820609-10-irogers@google.com>
Subject: [PATCH v10 09/12] perf session: Add dsos, machine, and perf_session shrinking
From: Ian Rogers <irogers@google.com>
To: Namhyung Kim <namhyung@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Alireza Haghdoost <haghdoost@uber.com>, Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add container-level shrinking helpers walking DSOs across a session's host
and guest machines:
- dsos__shrink(): Calls dso__shrink() and dso__try_evict() across all DSOs
  under dsos->lock, compacts the array when unreferenced DSOs are evicted,
  and calls malloc_trim(0) on glibc when memory was reclaimed.
- machine__shrink(), machines__shrink(), and perf_session__shrink():
  Shrink host and guest machine DSO collections.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dsos.c    | 50 +++++++++++++++++++++++++++++++++++++++
 tools/perf/util/dsos.h    |  2 ++
 tools/perf/util/machine.c | 29 +++++++++++++++++++++++
 tools/perf/util/machine.h |  3 +++
 tools/perf/util/session.c |  8 +++++++
 tools/perf/util/session.h |  2 ++
 6 files changed, 94 insertions(+)

diff --git a/tools/perf/util/dsos.c b/tools/perf/util/dsos.c
index 7a56577f4ec8..77f668d7557c 100644
--- a/tools/perf/util/dsos.c
+++ b/tools/perf/util/dsos.c
@@ -6,6 +6,9 @@
 #include "vdso.h"
 #include "namespaces.h"
 #include <errno.h>
+#ifdef __GLIBC__
+#include <malloc.h>
+#endif
 #include <stdlib.h>
 #include <string.h>
 #include <symbol.h> // filename__read_build_id
@@ -517,3 +520,50 @@ int dsos__for_each_dso(struct dsos *dsos, int (*cb)(struct dso *dso, void *data)
 	up_read(&dsos->lock);
 	return err;
 }
+
+size_t dsos__shrink(struct dsos *dsos)
+{
+	unsigned int write_idx = 0;
+	size_t freed = 0;
+	bool any_removed = false;
+
+	down_write(&dsos->lock);
+
+	for (unsigned int read_idx = 0; read_idx < dsos->cnt; read_idx++) {
+		struct dso *dso = dsos->dsos[read_idx];
+
+		freed += dso__shrink(dso);
+
+		if (dso__try_evict(dso)) {
+			any_removed = true;
+			freed++;
+			continue;
+		}
+		dsos->dsos[write_idx++] = dso;
+	}
+
+	dsos->cnt = write_idx;
+	if (any_removed) {
+		if (write_idx == 0) {
+			zfree(&dsos->dsos);
+			dsos->allocated = 0;
+			dsos->sorted = true;
+		} else if (write_idx < dsos->allocated / 2) {
+			struct dso **shrunk = realloc(dsos->dsos,
+						      write_idx * sizeof(struct dso *));
+			if (shrunk) {
+				dsos->dsos = shrunk;
+				dsos->allocated = write_idx;
+			}
+		}
+	}
+
+	up_write(&dsos->lock);
+
+#ifdef __GLIBC__
+	if (freed > 0)
+		malloc_trim(0);
+#endif
+
+	return freed;
+}
diff --git a/tools/perf/util/dsos.h b/tools/perf/util/dsos.h
index cc7e3a42f9cb..de10a10de777 100644
--- a/tools/perf/util/dsos.h
+++ b/tools/perf/util/dsos.h
@@ -51,4 +51,6 @@ struct dso *dsos__find_kernel_dso(struct dsos *dsos);
 
 int dsos__for_each_dso(struct dsos *dsos, int (*cb)(struct dso *dso, void *data), void *data);
 
+size_t dsos__shrink(struct dsos *dsos);
+
 #endif /* __PERF_DSOS */
diff --git a/tools/perf/util/machine.c b/tools/perf/util/machine.c
index 3c206c26bd62..f4108cc725fc 100644
--- a/tools/perf/util/machine.c
+++ b/tools/perf/util/machine.c
@@ -3438,3 +3438,32 @@ int machine__hit_all_dsos(struct machine *machine)
 {
 	return dsos__hit_all(&machine->dsos);
 }
+
+size_t machine__shrink(struct machine *machine)
+{
+	if (!machine)
+		return 0;
+
+	return dsos__shrink(&machine->dsos);
+}
+
+size_t machines__shrink(struct machines *machines)
+{
+	struct rb_node *nd;
+	size_t freed;
+
+	if (!machines)
+		return 0;
+
+	freed = machine__shrink(&machines->host);
+
+	down_read(&machines->lock);
+	for (nd = rb_first_cached(&machines->guests); nd; nd = rb_next(nd)) {
+		struct machine *pos = rb_entry(nd, struct machine, rb_node);
+
+		freed += machine__shrink(pos);
+	}
+	up_read(&machines->lock);
+
+	return freed;
+}
diff --git a/tools/perf/util/machine.h b/tools/perf/util/machine.h
index 67d517742fb6..b42c363723c9 100644
--- a/tools/perf/util/machine.h
+++ b/tools/perf/util/machine.h
@@ -339,4 +339,7 @@ int machine__resolve(struct machine *machine, struct addr_location *al,
 
 int machine__hit_all_dsos(struct machine *machine);
 
+size_t machine__shrink(struct machine *machine);
+size_t machines__shrink(struct machines *machines);
+
 #endif /* __PERF_MACHINE_H */
diff --git a/tools/perf/util/session.c b/tools/perf/util/session.c
index 4e11eabbbe6f..9f16bff1b72f 100644
--- a/tools/perf/util/session.c
+++ b/tools/perf/util/session.c
@@ -4270,3 +4270,11 @@ uint16_t perf_session__e_machine(struct perf_session *session, uint32_t *e_flags
 	 */
 	return perf_env__e_machine_nocache(env, e_flags);
 }
+
+size_t perf_session__shrink(struct perf_session *session)
+{
+	if (!session)
+		return 0;
+
+	return machines__shrink(&session->machines);
+}
diff --git a/tools/perf/util/session.h b/tools/perf/util/session.h
index 05ea2c1ee8c9..cbea6792a008 100644
--- a/tools/perf/util/session.h
+++ b/tools/perf/util/session.h
@@ -211,4 +211,6 @@ int perf_event__process_finished_round(const struct perf_tool *tool,
 struct perf_env *perf_session__env(struct perf_session *session);
 uint16_t perf_session__e_machine(struct perf_session *session, uint32_t *e_flags);
 
+size_t perf_session__shrink(struct perf_session *session);
+
 #endif /* __PERF_SESSION_H */
-- 
2.56.1.831.g720f3f5937-goog

