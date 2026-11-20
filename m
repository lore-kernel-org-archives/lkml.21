Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795212926;
	b=Vvt1jY0pgRkwqDyZoa6BKN7EAWO0KP5pzWlowUMfu7qY6MAuvDCSNR7OaJuzhW+EOu5k
	 xEzrhUEXSZjsQCFblyKnF+iUapioHmfDU2EzaWRZmKa6hnEyo69Afr6xnV6fkNZrCWJVL
	 sam7U1pHUtxzElVa3NZz40dlt2jFJYXOpHpPF2G+N+x72tVCsYkSKDi681NSdAAcO3A0Q
	 GfLy0+WHxctxnm41GLzbqICVZVpssyvW0totBbwDrv83hqdOJGYOhXU4CwCEaykDqSMLK
	 M5/N7DZg8sj4cEThr7MD2CmvAlqNJyt5oQc/W7TJww+7VO0OgdXbdKPPtVTWepjWSVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795212926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=dMnEbDK8wYGDtn9mWnEYq0107+ljqwGa7pSjkv3/TiM=;
	b=fukjMjmv5UNWJPtXk3X8UZj4PPRB6NcKTnELHsNMs4bvGPdseA3LpEOIuZI8LorxgzYn
	 vqHoYoMrtQBJPQckmPNawpbD8qmMHfUhgrhNO+aNs5iATuR06BFmVY/wie9ItnlRoRRpF
	 NR+ca9cUegJJS2FcyvMh2FdlzeIxcwcw2wIPNohMdXNhmnezN/IOAFd7aVoK5MlcEHLC4
	 spTwaB40D0HMk6+/xUTf4D3KJMlChNkteD5DCc8LpenpZlBDf7xtNsNqxIt4g48c8EAQa
	 R0HE1K5CCFE2eGOP1B2nVqcCZRD1+i5qD/nFVpjaC213pY1V19ymNef2XcjK3J4bXpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Yg981a8O;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BCD606A6BC
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 22:15:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33BCD606A6BC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Yg981a8O
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f05c68629cso3459455ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795212917; x=1795817717; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dMnEbDK8wYGDtn9mWnEYq0107+ljqwGa7pSjkv3/TiM=;
        b=Yg981a8OOKrMjZWrsbdLuIjydDY4TdFSNTo1mnkhm0FEyh63ZVWkUGTXVdcHcG1XyH
         nRz8tk8JvYb8jXz1L/bs8vKcMlZEsiCd3t7AY0PqsgWcb77L+QL6fs1tCg4erJvmixeP
         LIoRbkLEY63mkbMY5RgyAErC1sO62PO7nbXNwXhqf4RuXLI17mbDbVregA9DC6Db2X1v
         u8ZVFvUgw4gjPEk9gsIszgw7c7C/I8Xq/s3oQjLLiJEe1Ga7YzYkorv3YcmdWpl/5Gpv
         UORPFOzz9I1VUc9fVW1+W0uson5dgpW2y0nMUBtkU2ddH6qw5cA2n0FHJZH+o3zTTjgU
         G2gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795212917; x=1795817717;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dMnEbDK8wYGDtn9mWnEYq0107+ljqwGa7pSjkv3/TiM=;
        b=FkbuNu3r4pvVZ21P3c2APa8bxnFUTfLtZyZbj1t3vM8wEG9eQChZafR+LDWNLyLZtz
         TAU/iHmL7dJ4E9H2UV4NWJkCGj+xv3/sFhkzIaMVqr85KHrpWhE3N2PYx3j0J2p7ukW1
         Ps+b/MGcqp8fnb5+xnJ3L/Yqmh6nH6GMTijH3Nmai7e3rYXnE/+wbPgkkJ61axePHe8G
         mDCtwjUQ32H9lRgjy4jOXjirYke64mhaJ6w6KBqbBkvLI8bPO/cSYJBrc/eL+j37gFpj
         rT9KmvFKZvCL3ih8DnEdbRtdTQgKBi5lx8s2PyPqDj734CQ5U/ri5YWiUgv2Oh7w7l/F
         LShw==
X-Forwarded-Encrypted: i=1; AL+hErFTEmyUER8CWUUzqTNirdsUlutIy71XoiS4n7UVOjwtaSKZ7N1HuBi1tntlHivtngNSagoP2v3xWhbaGlg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9K5Vnt1DAIZ5ECNSNd2Yx0PG73lFs+4H+iymvBTneTEIWIclmq
	7V2kdGdtdTXOTUvpdOKdajgrAGqMPLu/8BkBt88LIU2BdE+ZALkEg8xqA6pMIqoEIV/WlgjdZqs
	KYixXTtyCnw==
X-Received: from pjte4.prod.google.com ([2002:a17:90a:c204:b0:3b4:a73:5d7c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1801:b0:3b3:ffa8:6bc5
 with SMTP id 98e67ed59e1d1-3b41c9823cemr4035343a91.60.1795212917097; Fri, 20
 Nov 2026 14:15:17 -0800 (PST)
Date: Fri, 20 Nov 2026 14:13:21 -0800
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
Message-ID: <20261120221332.2245191-21-irogers@google.com>
Subject: [PATCH v3 20/30] perf parse-events: Decode metric-id terms when
 adding events
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Metric events are parsed from an event string where the identifier from
the metric expression is passed as a metric-id term. As characters such
as '@' and ',' can't appear in a term value the metricgroup code encodes
them and, after parsing, walked the parsed evlist replacing each evsel's
metric_id with its decoded version.

Move the encoding and decoding to parse-events.c, adding
parse_events__encode_metric_id() for the metricgroup code, and store the
decoded metric-id on the evsel when it is created in __add_event(). This
avoids rewriting the metric_id of evsels after parsing, leaving
metricgroup with only the replacement of the evsel names of metric
events by friendlier versions of the metric-id. While moving the
decoding, fix the out of bounds check on the encoded character index
and return -EINVAL for a bad encoding.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/metricgroup.c  | 110 ++++++++-------------------------
 tools/perf/util/parse-events.c |  82 +++++++++++++++++++++++-
 tools/perf/util/parse-events.h |   1 +
 3 files changed, 108 insertions(+), 85 deletions(-)

diff --git a/tools/perf/util/metricgroup.c b/tools/perf/util/metricgroup.c
index 9922445a6d15..08679392bf6d 100644
--- a/tools/perf/util/metricgroup.c
+++ b/tools/perf/util/metricgroup.c
@@ -610,57 +610,13 @@ int metricgroup__add_matching_metrics(struct evlist *evlist, bool system_wide)
 					    find_matching_metrics_cb, &args);
 }
 
-static const char *code_characters = ",-=@";
-
-static int encode_metric_id(struct strbuf *sb, const char *x)
-{
-	int ret = 0;
-
-	for (; *x; x++) {
-		const char *c = strchr(code_characters, *x);
-		if (c) {
-			ret = strbuf_addch(sb, '!');
-			if (ret)
-				break;
-
-			ret = strbuf_addch(sb, '0' + (c - code_characters));
-			if (ret)
-				break;
-		} else {
-			ret = strbuf_addch(sb, *x);
-			if (ret)
-				break;
-		}
-	}
-	return ret;
-}
-
-static int decode_metric_id(struct strbuf *sb, const char *x)
-{
-	const char *orig = x;
-	size_t i;
-	char c;
-	int ret;
-
-	for (; *x; x++) {
-		c = *x;
-		if (*x == '!') {
-			x++;
-			i = *x - '0';
-			if (i > strlen(code_characters)) {
-				pr_err("Bad metric-id encoding in: '%s'", orig);
-				return -1;
-			}
-			c = code_characters[i];
-		}
-		ret = strbuf_addch(sb, c);
-		if (ret)
-			return ret;
-	}
-	return 0;
-}
-
-static int decode_all_metric_ids(struct evlist *perf_evlist, const char *modifier)
+/*
+ * The metric events are parsed with a metric-id holding the identifier used in
+ * the metric expression. If the evsel name is just the parsed event, which
+ * contains the encoded metric-id, use the metric-id to give a more friendly
+ * display version.
+ */
+static int set_metric_event_names(struct evlist *perf_evlist, const char *modifier)
 {
 	struct evsel *ev;
 	struct strbuf sb = STRBUF_INIT;
@@ -668,51 +624,39 @@ static int decode_all_metric_ids(struct evlist *perf_evlist, const char *modifie
 	int ret = 0;
 
 	evlist__for_each_entry(perf_evlist, ev) {
-		if (!ev->metric_id)
+		bool has_slash = false;
+
+		if (!ev->metric_id || !strstr(ev->name, "metric-id="))
 			continue;
 
 		ret = strbuf_setlen(&sb, 0);
 		if (ret)
 			break;
 
-		ret = decode_metric_id(&sb, ev->metric_id);
+		ret = strbuf_addstr(&sb, ev->metric_id);
 		if (ret)
 			break;
 
-		free((char *)ev->metric_id);
-		ev->metric_id = strdup(sb.buf);
-		if (!ev->metric_id) {
-			ret = -ENOMEM;
-			break;
+		zfree(&ev->name);
+		for (cur = strchr(sb.buf, '@') ; cur; cur = strchr(++cur, '@')) {
+			*cur = '/';
+			has_slash = true;
 		}
-		/*
-		 * If the name is just the parsed event, use the metric-id to
-		 * give a more friendly display version.
-		 */
-		if (strstr(ev->name, "metric-id=")) {
-			bool has_slash = false;
-
-			zfree(&ev->name);
-			for (cur = strchr(sb.buf, '@') ; cur; cur = strchr(++cur, '@')) {
-				*cur = '/';
-				has_slash = true;
-			}
 
-			if (modifier) {
-				if (!has_slash && !strchr(sb.buf, ':')) {
-					ret = strbuf_addch(&sb, ':');
-					if (ret)
-						break;
-				}
-				ret = strbuf_addstr(&sb, modifier);
+		if (modifier) {
+			if (!has_slash && !strchr(sb.buf, ':')) {
+				ret = strbuf_addch(&sb, ':');
 				if (ret)
 					break;
 			}
-			ev->name = strdup(sb.buf);
-			if (!ev->name) {
-				ret = -ENOMEM;
+			ret = strbuf_addstr(&sb, modifier);
+			if (ret)
 				break;
-			}
+		}
+		ev->name = strdup(sb.buf);
+		if (!ev->name) {
+			ret = -ENOMEM;
+			break;
 		}
 	}
 	strbuf_release(&sb);
@@ -787,7 +731,7 @@ static int metricgroup__build_event_string(struct strbuf *events,
 			ret = strbuf_addstr(events, "/metric-id=");
 			RETURN_IF_NON_ZERO(ret);
 		}
-		ret = encode_metric_id(events, id);
+		ret = parse_events__encode_metric_id(events, id);
 		RETURN_IF_NON_ZERO(ret);
 		ret = strbuf_addstr(events, "/");
 		RETURN_IF_NON_ZERO(ret);
@@ -1514,7 +1458,7 @@ static int parse_ids(bool metric_no_merge, bool fake_pmu,
 		parse_events_error__print(&parse_error, events.buf);
 		goto err_out;
 	}
-	ret = decode_all_metric_ids(parsed_evlist, modifier);
+	ret = set_metric_event_names(parsed_evlist, modifier);
 	if (ret)
 		goto err_out;
 
diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
index 0044b6c27ea6..b54ab0604e4e 100644
--- a/tools/perf/util/parse-events.c
+++ b/tools/perf/util/parse-events.c
@@ -171,6 +171,73 @@ static void fix_raw(struct parse_events_terms *config_terms, struct perf_pmu *pm
 	}
 }
 
+/*
+ * Characters that can't appear in a metric-id term value are encoded as '!'
+ * followed by the character's index in this string.
+ */
+static const char *metric_id_code_characters = ",-=@";
+
+/**
+ * parse_events__encode_metric_id - Encode a metric identifier as a metric-id
+ *                                  term value.
+ * @sb: The buffer the encoded identifier is appended to.
+ * @x: The metric identifier to encode.
+ *
+ * Return: 0 on success or the strbuf error.
+ */
+int parse_events__encode_metric_id(struct strbuf *sb, const char *x)
+{
+	int ret = 0;
+
+	for (; *x; x++) {
+		const char *c = strchr(metric_id_code_characters, *x);
+
+		if (c) {
+			ret = strbuf_addch(sb, '!');
+			if (ret)
+				break;
+
+			ret = strbuf_addch(sb, '0' + (c - metric_id_code_characters));
+			if (ret)
+				break;
+		} else {
+			ret = strbuf_addch(sb, *x);
+			if (ret)
+				break;
+		}
+	}
+	return ret;
+}
+
+/*
+ * Decode a metric-id term value encoded by parse_events__encode_metric_id()
+ * into @sb.
+ */
+static int parse_events__decode_metric_id(struct strbuf *sb, const char *x)
+{
+	const char *orig = x;
+	size_t i;
+	char c;
+	int ret;
+
+	for (; *x; x++) {
+		c = *x;
+		if (*x == '!') {
+			x++;
+			i = *x - '0';
+			if (i >= strlen(metric_id_code_characters)) {
+				pr_err("Bad metric-id encoding in: '%s'", orig);
+				return -EINVAL;
+			}
+			c = metric_id_code_characters[i];
+		}
+		ret = strbuf_addch(sb, c);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
 static struct evsel *
 __add_event(struct list_head *list, int *idx,
 	    struct perf_event_attr *attr,
@@ -261,7 +328,12 @@ __add_event(struct list_head *list, int *idx,
 	}
 
 	if (metric_id) {
-		evsel->metric_id = strdup(metric_id);
+		struct strbuf sb = STRBUF_INIT;
+		int ret = parse_events__decode_metric_id(&sb, metric_id);
+
+		if (!ret)
+			evsel->metric_id = strdup(sb.buf);
+		strbuf_release(&sb);
 		if (!evsel->metric_id)
 			goto out_err;
 	}
@@ -668,6 +740,7 @@ int parse_events_add_breakpoint(struct parse_events_state *parse_state,
 	struct perf_event_attr attr;
 	LIST_HEAD(config_terms);
 	const char *name;
+	int ret;
 
 	memset(&attr, 0, sizeof(attr));
 	attr.bp_addr = addr;
@@ -698,8 +771,11 @@ int parse_events_add_breakpoint(struct parse_events_state *parse_state,
 
 	name = get_config_name(head_config);
 
-	return add_event(list, parse_state, &attr, name, /*mertic_id=*/NULL,
+	ret = add_event(list, parse_state, &attr, name, /*mertic_id=*/NULL,
 			&config_terms, /*alternate_hw_config=*/PERF_COUNT_HW_MAX);
+	/* Free the config terms if they weren't moved to an evsel. */
+	free_config_terms(&config_terms);
+	return ret;
 }
 
 static int check_type_val(struct parse_events_term *term,
@@ -1624,6 +1700,8 @@ static int parse_events_add_pmu(struct parse_events_state *parse_state,
 			    &config_terms, first_wildcard_match, term_cpu, alternate_hw_config);
 	perf_cpu_map__put(term_cpu);
 	if (!evsel) {
+		/* The config terms weren't moved to an evsel. */
+		free_config_terms(&config_terms);
 		parse_events_terms__exit(&parsed_terms);
 		return -ENOMEM;
 	}
diff --git a/tools/perf/util/parse-events.h b/tools/perf/util/parse-events.h
index 8df8e3cb69fe..68efbd24df9b 100644
--- a/tools/perf/util/parse-events.h
+++ b/tools/perf/util/parse-events.h
@@ -245,6 +245,7 @@ int parse_events_add_breakpoint(struct parse_events_state *parse_state,
 struct evsel *parse_events__add_event(int idx, struct perf_event_attr *attr,
 				      const char *name, const char *metric_id,
 				      struct perf_pmu *pmu);
+int parse_events__encode_metric_id(struct strbuf *sb, const char *x);
 
 int parse_events_multi_pmu_add(struct parse_events_state *parse_state,
 			       const char *event_name,
-- 
2.56.1.750.gf70dc682cf-goog

