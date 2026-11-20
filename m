Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795212936;
	b=vEZUeYUMXbQ1Dm+qrG8/tb4BGxiRNtLztLEHbkC3lbv1fWQNEP3X9ZvuPflP91M7T6E+
	 3vTk4pBal/9nZRxjouRzbzhATeuFgl4f9JQqHwXXz53X6IwvDO8dsW7T5gyHvEEwGgZuY
	 buF8X6zU7ApPOTSitQn5pv2chfTHHSpHdtnUXrlfSt6kMb4NPNnTULfzfE6cZxQfp/W6J
	 HZMt5BDyfIwTlrkaPMIarEatB0hSYQtt+seAxrLice+H0LGTQakMj7E0AJWmDAIfNd71t
	 qolvc+dOgWWDzYWwUShY1VbW8LumcwJN15hE1Ny1oV62bMFpiqSBDR7AU3Zq/vOfDUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795212936;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=R1UF6Qvsf9rHsUsHz66iYR6vOcaKtGQgcscSxSyNv1o=;
	b=BCmtvjz7Am/A1+cG6dGIZnxL+HQlxIoUMntqAfUzRnAU2UOQASg2FSJ6iZfDxDrD98bI
	 j/wmKJL754bGbVyufYwDIsmsYteZIePUjsEqei8/zoNeZsfQB+NNTDF4s0Fx9b6zPvaAM
	 ZY/WasEqXgFlAqISMbdXKaVraciD5F4FVLn3rThqGzMcsUi5+D8SPsbkJQ5Kh8bWaE9qd
	 koE42mf5tIZ9SwcwLv8qMHCtMS3ELQGrryiL6Nnv1ym3ketGT7Xr/BnDJQbK/1x4iUmD2
	 YYQCC83BacC8qpNfAjNqL/Bpi6RSXeX542EWDHzL2GRYRaGvZhgixAereXjFMztR3Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="P+3/6gRg";
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B53B606A6B8
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 22:15:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B53B606A6B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=P+3/6gRg
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f03a137f6aso13096475ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795212931; x=1795817731; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R1UF6Qvsf9rHsUsHz66iYR6vOcaKtGQgcscSxSyNv1o=;
        b=P+3/6gRg5lZ7wIGWytIZNKVTK1ZAP2ZvC9t+VN4USARKft3HrbqMFZRNBDACGUyH2K
         NcLwKOh/jrrBHxG/6p7H8sDSKCXtNboXOnw6LsDItS2aDGf8A8EhCjTY/ihvw1YnvJC0
         eeMYb5+XMGce6CPKxZ7p0rHxOgkoWW6ZN/tH0ZlU365n720HmJz8cI2w4mSB5z1ZRZPB
         X8lRg9RTdQREFFlzoMbAUT9Q5q5zzXwhYlUraqst2u2g9SwjEKzzwKoxXMscBgrBXxA8
         avgDbDZTo6Ky8kDyPfXkdxVGm8N9d5pWD1XgpV1JkBMaXkM67ZplhOQXbw4xttlzjAPS
         rUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795212931; x=1795817731;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R1UF6Qvsf9rHsUsHz66iYR6vOcaKtGQgcscSxSyNv1o=;
        b=p2tRFXd+NsOEh7POt73FhNT4YIb+0EsUDFOW+VY2E4R1xOY8TOIU8uoOKwWsZE1IBE
         sXWWnKJz3jyBB52O3bf1Jl7PqC9omr3AJp5SS/i9l3CU+qsMTekhWBGhPnzYq+e3P/Gs
         P1ZDRaVE/WFHBDAdC2n/iPwpzLtZeY6cOZBCyfOFkZiMHjwJV3UjEMWAbL3Tf+O4nwi5
         iSCXqwP6Lxq+gfu6ivJVeS4E+QA35XorRnFSCr40oC0hG9sFREcDTd9HIhCyxEohg3UH
         RlSfqwVKAKpenZYtW2qxXLlln7aihoK5gKUt2dNNQcejDSFns+FlovODUlMdtXjxSD3g
         Qq2Q==
X-Forwarded-Encrypted: i=1; AL+hErGKPSud85DL88a/g62kicAhyaC+/CfjMp0tG4Z8rQpJHqUewqk6Rla/GkPbIMjAhfzfUMOKAWGx/EKXYPA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8o/NlG3Hh1fQo2YXHqL6Wyf999zC7dV09wWmtwNPbDAcO9s3T8
	XG+f1HzGQ3b+HR44Eno93j6cSwT3Ewe1JpYbLIeGwTwV0kpMSr9rSNwMgfWQes72FA7MUQQhwJs
	+OecyGQ/tTg==
X-Received: from plhc2.prod.google.com ([2002:a17:903:2342:b0:2f0:3edd:f273])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:37c4:b0:2f0:422a:222d
 with SMTP id d9443c01a7336-2f0422a30dbmr40073615ad.22.1795212931273; Fri, 20
 Nov 2026 14:15:31 -0800 (PST)
Date: Fri, 20 Nov 2026 14:13:23 -0800
In-Reply-To: <20261120221332.2245191-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261120221332.2245191-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120221332.2245191-23-irogers@google.com>
Subject: [PATCH v3 22/30] perf pmu: Add perf_pmu__for_each_name_from_config()
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

perf_pmu__name_from_config() returns the first event alias of a PMU
whose parsed config matches, ignoring the perf_event_attr type. So a
legacy hardware event alias can be returned for a raw config of the
same value, only one of possibly several names is found, and the names
of legacy events whose aliases were replaced by sysfs or json events of
the same name can't be found.

Add perf_pmu__for_each_name_from_config() that calls a callback for
each event name of a PMU whose encoding has a given type and config,
ignoring the extended PMU type of legacy encodings and, for core PMUs,
also searching the legacy hardware and cache event tables. Make
perf_pmu__name_from_config() return the first such name for the PMU's
type. Also fix pmu_config_term() leaking help_msg when err is NULL, as
called by perf_pmu__parse_terms_to_attr().

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/pmu.c | 106 +++++++++++++++++++++++++++++++++++++++---
 tools/perf/util/pmu.h |   3 ++
 2 files changed, 102 insertions(+), 7 deletions(-)

diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index d319ef8ffbb8..b4541fbfc9c0 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -1617,6 +1617,7 @@ static int pmu_config_term(const struct perf_pmu *pmu,
 		} else {
 			pr_debug("%s (%s)\n", unknown_term, help_msg);
 			free(unknown_term);
+			free(help_msg);
 		}
 		free(pmu_term);
 		return -EINVAL;
@@ -2821,25 +2822,116 @@ void perf_pmu__delete(struct perf_pmu *pmu)
 	free(pmu);
 }
 
-const char *perf_pmu__name_from_config(struct perf_pmu *pmu, u64 config)
+static bool pmu_config_equal(__u32 type, u64 a, u64 b)
+{
+	/* Ignore the extended PMU type in the upper bits of legacy encodings. */
+	if (type == PERF_TYPE_HARDWARE || type == PERF_TYPE_HW_CACHE)
+		return (a & PERF_HW_EVENT_MASK) == (b & PERF_HW_EVENT_MASK);
+	return a == b;
+}
+
+struct legacy_name_args {
+	__u32 type;
+	u64 config;
+	int (*cb)(const char *name, void *data);
+	void *data;
+};
+
+static int pmu_legacy_name_cb(const struct pmu_event *pe,
+			      const struct pmu_events_table *table __maybe_unused,
+			      void *data)
+{
+	static const char hw_prefix[] = "legacy-hardware-config=";
+	static const char cache_prefix[] = "legacy-cache-config=";
+	struct legacy_name_args *args = data;
+	const char *prefix = args->type == PERF_TYPE_HARDWARE ? hw_prefix : cache_prefix;
+
+	if (!pe->name || !pe->event || !strstarts(pe->event, prefix))
+		return 0;
+	if (!pmu_config_equal(args->type, strtoull(pe->event + strlen(prefix), NULL, 0),
+			      args->config))
+		return 0;
+	return args->cb(pe->name, args->data);
+}
+
+/**
+ * perf_pmu__for_each_name_from_config - Call @cb for event names of an encoding.
+ * @pmu: The PMU whose event names are searched.
+ * @type: The perf_event_attr type of the encoding, such as the PMU's type or
+ *        PERF_TYPE_HARDWARE for a legacy hardware event.
+ * @config: The perf_event_attr config of the encoding.
+ * @cb: Called with each event name of @pmu with the encoding, a non-zero return
+ *      stops the iteration.
+ * @data: Passed to @cb.
+ *
+ * As event aliases from sysfs or json replace legacy event aliases of the same
+ * name, the names of legacy hardware and cache events of core PMUs are found
+ * from the legacy event tables. @cb may be called more than once for a name.
+ *
+ * Return: 0 or the first non-zero value returned by @cb.
+ */
+int perf_pmu__for_each_name_from_config(struct perf_pmu *pmu, __u32 type, u64 config,
+					int (*cb)(const char *name, void *data),
+					void *data)
 {
 	struct hashmap_entry *entry;
 	size_t bkt;
+	int ret;
 
 	if (!pmu)
-		return NULL;
+		return 0;
 
 	pmu_aliases_parse(pmu);
 	pmu_add_cpu_aliases(pmu);
 	hashmap__for_each_entry(pmu->aliases, entry, bkt) {
 		struct perf_pmu_alias *event = entry->pvalue;
-		struct perf_event_attr attr = {.config = 0,};
-		int ret = perf_pmu__parse_terms_to_attr(pmu, event->terms, &attr);
+		struct perf_event_attr attr = { .type = pmu->type, };
 
-		if (ret == 0 && config == attr.config)
-			return event->name;
+		if (perf_pmu__parse_terms_to_attr(pmu, event->terms, &attr) ||
+		    attr.type != type || !pmu_config_equal(type, attr.config, config))
+			continue;
+		ret = cb(event->name, data);
+		if (ret)
+			return ret;
 	}
-	return NULL;
+	if (pmu->is_core && (type == PERF_TYPE_HARDWARE || type == PERF_TYPE_HW_CACHE)) {
+		struct legacy_name_args args = {
+			.type = type,
+			.config = config,
+			.cb = cb,
+			.data = data,
+		};
+
+		return pmu_events_table__for_each_event(perf_pmu__default_core_events_table(),
+							/*pmu=*/NULL, pmu_legacy_name_cb, &args);
+	}
+	return 0;
+}
+
+static int first_name_cb(const char *name, void *data)
+{
+	const char **first = data;
+
+	*first = name;
+	return 1;
+}
+
+/**
+ * perf_pmu__name_from_config - The first event name of @pmu with @config.
+ * @pmu: The PMU whose event names are searched.
+ * @config: The perf_event_attr config of an event of @pmu's type.
+ *
+ * Return: An event name or NULL if none was found.
+ */
+const char *perf_pmu__name_from_config(struct perf_pmu *pmu, u64 config)
+{
+	const char *name = NULL;
+
+	if (!pmu)
+		return NULL;
+
+	perf_pmu__for_each_name_from_config(pmu, pmu->type, config, first_name_cb, &name);
+	return name;
 }
 
 bool perf_pmu__reads_only_on_cpu_idx0(const struct perf_event_attr *attr)
diff --git a/tools/perf/util/pmu.h b/tools/perf/util/pmu.h
index 7605c3859337..ab7123964423 100644
--- a/tools/perf/util/pmu.h
+++ b/tools/perf/util/pmu.h
@@ -365,6 +365,9 @@ struct perf_pmu *perf_pmu__lookup(struct list_head *pmus, int dirfd, const char
 struct perf_pmu *perf_pmu__create_placeholder_core_pmu(struct list_head *core_pmus);
 void perf_pmu__delete(struct perf_pmu *pmu);
 
+int perf_pmu__for_each_name_from_config(struct perf_pmu *pmu, __u32 type, u64 config,
+					int (*cb)(const char *name, void *data),
+					void *data);
 const char *perf_pmu__name_from_config(struct perf_pmu *pmu, u64 config);
 bool perf_pmu__is_fake(const struct perf_pmu *pmu);
 
-- 
2.56.1.750.gf70dc682cf-goog

