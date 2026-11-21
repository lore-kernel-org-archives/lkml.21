Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795244392;
	b=DQe0p6aLjjexFhukYEvBydCxI1CV1FKq2DHAb6DHfXzc00jPOQOoWXbTx5M4QnK5ec7q
	 3KzOkLRITEEAkIG3dgA3MReJl7iz41YAk9NDY+0jlxO0tRc0CaayqEgctJ9DfC1jH7EW0
	 hXT9pdJVwRY7oPp1SfENeoiyhLfFE2dyhHullIhRR+dg9uxMMDsxZTnO1XFwV73ql4pH7
	 1d1YqiY4IdfT6JDF+Vw3BV0a2fSR6nR9zVHTNH1AvDcUIbH1xVXYovEneSplkbe5qwA48
	 Y6bnOc7G+/dlfRz8xNgOj+r1vd9SYV5xTIWaMKbKa5FHKQyltpQ8FCFc3UricJuO0Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244392;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=fGAdvKbnnDNvC7VTESnuJjeTLcD1XbFE2xtDIUZCto4=;
	b=5eHA/q7eu9c2BMYoBpRcNSmSQbZeKOnNyB2fx5pMDAdr+CPCYwW9R7YXc9kewScrjAle
	 2TVhqJiqJiPRVbDa6O8Xva27qGAJf3cZ8E1Y51pNGCVQfuzuCRhBTLFaKCO1LGwAcpOQ8
	 rsISptRQAQNh+Fcpsiw0oj3S+gw5if8fDt6VZGPCnEbK1sSuNvV2Hc0aipKJhIDh/w64X
	 PtyBz7CwmCBi40Fqv45wUg3GFnT3cLskfckzSg04UryP437LiR6/wOnlrBvMuSS13AuNg
	 GFSQp2V9MRZxB+uJlTjWSvHxnzY8mvU/3ZaxrEfmu+EEC3xCbYHaGO1ErPYZPeBnj4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=INpYishy;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B78606A330
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 06:59:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19B78606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=INpYishy
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386177b0516so4032138eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 22:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795244391; x=1795849191; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fGAdvKbnnDNvC7VTESnuJjeTLcD1XbFE2xtDIUZCto4=;
        b=INpYishyBjqzCHtPkLUzALLHXaqZglbxaIt1wiWcwva416LFtcMHBPD2+cGMjFnwo5
         tlhv7jPuRv22yW66JdlmNOITf5OD2JCpqy1Yfz+dOkJSUBiEVaknErML0ozRZnojN9BD
         YAbCoPAOCh4MQ47VZKnT+f6uJxo7wgXDfoceg11V3QX52PYw1uNuyvbcfRYgUjL4a1n6
         AxmjgAeAZr6J4/gg3wc8pbud+J1ULoTNT+Cdo69+3xpe1nlsmJrWxZ6UAzZMPcDRFMqV
         Yiq35+1wY9gL7VKZnda839ti7EbYrTd6CZQP0rBH5NQH3DHUAohPdTSHd15uoQX7vEjG
         PoXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795244391; x=1795849191;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fGAdvKbnnDNvC7VTESnuJjeTLcD1XbFE2xtDIUZCto4=;
        b=B+5LT61+vwlC6K6X1CHi/p2YJw6OWdDkraugIsAvRi/eyCSGDNEiFe0gXnlGSOdPX9
         U1Q5HxLATrJch2PvGPIgeAHBwoOzel252F5yVtJRdmyxqhH9k4nPIGNzAWzvhIC2nqh2
         XfKtzf8DZz20qMsOYCdtEgD3sDbYMz9cLuEOlWrJohPO6EJyxaLVEDdopWVe9HdvDopN
         yZD44QeQg2o/NEvgeLS02HJ/CMfQlCDZuc3p9AO33QnCmGtkWduZOYzBZ+EMnOfWCWO9
         Ae2ZwATl+PNR3geOQAy/ERXhYYr+XjJktG3VUeEtGYHE8xIcxHKQ7OOBo5nxg+r8dH1+
         eN+A==
X-Forwarded-Encrypted: i=1; AL+hErGdVuZ7cruekFWuETAQ5QA1VEz2xbOgC4UwLnlEeENesB7JoSU8Bd9FRL+Lft3yP+gDjGjGLVs69KnALQM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+/5Z5Ckf2vFxB7ZyZdwX4ytlew/BdyVELxbW3I9WeR4rzjLAy
	aDokHBZRZLfmH5xwq3CA/mEfgQhxxcUtkeYe9aHxGScqSBEE7spxPwlMWIdsgNnDcLD2JyktLAu
	lQpfqzW140g==
X-Received: from dloo27-n1.prod.google.com ([2002:a05:7023:a5b:10b0:1b2:48fb:f4d0])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:2608:b0:1b5:342a:e4f0
 with SMTP id a92af1059eb24-1b5568b678fmr7282977c88.6.1795244390557; Fri, 20
 Nov 2026 22:59:50 -0800 (PST)
Date: Fri, 20 Nov 2026 22:58:12 -0800
In-Reply-To: <20261121065813.4143649-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261121065813.4143649-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261121065813.4143649-24-irogers@google.com>
Subject: [PATCH v15 23/23] perf machine: Add __guarded_by annotation to machines->guests
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Weilin Wang <weilin.wang@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Annotate guests in struct machines with __guarded_by(&lock) and mark
machines__init() with __context_unsafe().

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/machine.c | 1 +
 tools/perf/util/machine.h | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/machine.c b/tools/perf/util/machine.c
index 0cc593d5372a..70870baa157e 100644
--- a/tools/perf/util/machine.c
+++ b/tools/perf/util/machine.c
@@ -234,6 +234,7 @@ void machine__delete(struct machine *machine)
 }
 
 int machines__init(struct machines *machines, struct perf_session *session)
+	__context_unsafe(/* initialization */)
 {
 	int err = machine__init(&machines->host, "", HOST_KERNEL_ID);
 
diff --git a/tools/perf/util/machine.h b/tools/perf/util/machine.h
index 80191545ee8a..67d517742fb6 100644
--- a/tools/perf/util/machine.h
+++ b/tools/perf/util/machine.h
@@ -3,6 +3,7 @@
 #define __PERF_MACHINE_H
 
 #include <sys/types.h>
+#include <linux/compiler-context-analysis.h>
 #include <linux/rbtree.h>
 #include "maps.h"
 #include "dsos.h"
@@ -153,7 +154,7 @@ struct machines {
 	struct perf_session *session;
 	struct rw_semaphore lock;
 	struct machine host;
-	struct rb_root_cached guests;
+	struct rb_root_cached guests __guarded_by(&lock);
 };
 
 int machines__init(struct machines *machines, struct perf_session *session);
-- 
2.56.1.750.gf70dc682cf-goog

