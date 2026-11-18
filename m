Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794988528;
	b=HWkuligLdq8e1ply/ri7Wc9kg0Okjm5letMlR1mp7QmXpgL4zoJtP7Jcj+6uSQsKGyZ5
	 bIIv4JZ21tWgTv831q54w1l3AKeOTekl4HdjFgEypBu9xNQXa+Ldx//GC7kgb0SeWElow
	 Jm0Lsp5BxzRv/NhcUV6Z+Ky9KUpauncMkFloRXK8seC6gmGSa+hKZ1HcKnjYXRs/gomI7
	 gmZnkMw8bMlX02Avk/QJhSoD3utOCyNWFWXreXBXZsCqDNw5WXbFyLSnaoG4fcFcp5wxm
	 5AQy3vJ1bcdjbVqcDp4riIkLBUoQhRN9N/ZhQthvV5R7brwUaNdwCxu+OHS8F5GyI4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794988528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=ZOqOW53r1xMJrMe5oJFMrv6wgbQkRbuC6VFPZwStICs=;
	b=AQtywWMUXaPjSIS4aR71XTpCYwTi9qdAKGbw7Gdj4Ux9YAOJ9/d+PTMYY+d3wr8s7dq4
	 jnlTyRmfZ1FPty+QmpIbMKUsgF9nqy8NMUMR4tioGfz/HsiYDYcrSDtBRg/GFh0LdPLA/
	 p6wIRyFaqR9wmKuLyNu713TvbNZhC7EXebu8Mxw7uwGgnfqZlBI3HtXl6LGY3PkSBmoTf
	 X85VaQ2ecccoYH0tos92xBgHAES9Jooak1u5hTelUjXPjjMiSwUb86DPgRkpJ69tL67yH
	 G3XVI1KXv44IKOfpLlNe1DdfaIUUn1W49QpgW7kUxRhr6BKLXM52zXIxsaLa8cP4H6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G8+jmleB;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04B6606A33B
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:55:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E04B6606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G8+jmleB
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36fa5673fccso2140000eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794988527; x=1795593327; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZOqOW53r1xMJrMe5oJFMrv6wgbQkRbuC6VFPZwStICs=;
        b=G8+jmleBsZ3wv7TAOWc4vi6RuQt29LXTEi3Zgq9CTn1dBE+DEwSnEfMHE9ubUah+6K
         uJkHPBLpdPcDtOHPwwiDaztYZFJWF/hgnRJxms5qliOkaxhvjFy0qZwll5C1Jge89TEx
         pd9+Q3V68rcCgwkmyE2f45KnAyU+gPYC8IBBAOfZs0KgzNpwfsrNmscapwkfAFT4Euz7
         Dx40ZUoXZD4Tq+cV/BTmfTkSra8i1HiL7cNKGAvq6V1Svbj+LofuDeDt+ZKur7VEsNRM
         gqzU1BLUzwYmCHAOep6btAl0jLLmimKVYRfKR0Ap1gQT0K5//7RtzhlycJ3+Stv4vusF
         hDEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794988527; x=1795593327;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZOqOW53r1xMJrMe5oJFMrv6wgbQkRbuC6VFPZwStICs=;
        b=NiZjO3bK7qALzpINdOFdP8CYRrUQ/KhHoGbhB0LLcKyMjWHj6m9ViLxwfX6t3edLfB
         sLNF39l6idpJomT99jqDmeTFDXysezJ9ivx+V8TtCkHQsbYyCOfcgfbbGy2KX43BRbxh
         aCWgPhKOur0G2cULt8LJg6n3QVHEj+6PuldMq+rmY/RRBc5p+vVroZORIEGjwHh5nKS5
         FvXtkdCWuLFQXqo+yJrEVSV5EIr33ClJY+1k3Am0U/lrhZR7tZkijkvERTqoQomk65V+
         pkfGphrg8WfhCuDX6Rb85J7ooEGa3UANq0z66gUYGRvrQwCekttcsP6GqoXhaAM236V6
         W9tw==
X-Forwarded-Encrypted: i=1; AL+hErHHcXJ6CkhkyDsKCdWCJO6AaxerbymPGD83ygkEIRyZR5JZzcjLVptIVDzuNxhFrDb+YBezTXN5a3eXjFs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BMNJAxSh0htDt4DLjFwQITKICI4NzjdxtWRQPbPrZr+wQBC0q
	AjCvFC9eCxOX/GPT2URW2+fmRsR1LJm+9hqgOj8aSjhlRZ+pTANIFRcS0JAFgxJ/wKeNJwNXOrO
	z7sekg1Z3Ww==
X-Received: from dycpr12.prod.google.com ([2002:a05:7301:fd8c:b0:370:71c0:f285])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:4304:b0:36e:1fbe:3571
 with SMTP id 5a478bee46e88-3827dd04088mr1751455eec.3.1794988526706; Tue, 17
 Nov 2026 23:55:26 -0800 (PST)
Date: Tue, 17 Nov 2026 23:55:14 -0800
In-Reply-To: <20261118075516.1278903-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118075516.1278903-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261118075516.1278903-4-irogers@google.com>
Subject: [PATCH v1 3/4] perf metricgroup: Fix realloc() leaks in
 resolve_metric() and __add_metric()
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In resolve_metric(), growing the pending array assigns the result of
realloc() directly back to pending; if realloc() fails after earlier
iterations succeeded, the existing pending allocation is overwritten
with NULL and leaked.

Similarly, in __add_metric(), assigning realloc() directly to
root_metric->metric_refs overwrites the existing pointer with NULL on
failure, preventing metric__free(root_metric) in the root caller from
freeing the prior metric_refs array.

Use temporary pointers for both realloc() calls, freeing pending before
returning -ENOMEM in resolve_metric() and preserving
root_metric->metric_refs for metric__free() in __add_metric().

Fixes: 80be6434c36f ("perf metric: Modify resolution and recursion check")
Fixes: 46bdc0bf8d21 ("perf metric: Simplify metric_refs calculation")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/metricgroup.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/tools/perf/util/metricgroup.c b/tools/perf/util/metricgroup.c
index 779fe56..489f13b 100644
--- a/tools/perf/util/metricgroup.c
+++ b/tools/perf/util/metricgroup.c
@@ -771,10 +771,15 @@ static int resolve_metric(struct list_head *metric_list,
 		if (pmu_metrics_table__find_metric(table, pmu, cur->pkey,
 						   metricgroup__find_metric_callback,
 						   &pm) != PMU_METRICS__NOT_FOUND) {
-			pending = realloc(pending,
-					(pending_cnt + 1) * sizeof(struct to_resolve));
-			if (!pending)
+			struct to_resolve *new_pending;
+
+			new_pending = realloc(pending,
+					      (pending_cnt + 1) * sizeof(struct to_resolve));
+			if (!new_pending) {
+				free(pending);
 				return -ENOMEM;
+			}
+			pending = new_pending;
 
 			memcpy(&pending[pending_cnt].pm, &pm, sizeof(pm));
 			pending[pending_cnt].key = cur->pkey;
@@ -863,6 +868,7 @@ static int __add_metric(struct list_head *metric_list,
 			return -ENOMEM;
 
 	} else {
+		struct metric_ref *new_refs;
 		int cnt = 0;
 
 		/*
@@ -879,10 +885,11 @@ static int __add_metric(struct list_head *metric_list,
 		}
 
 		/* Create reference. Need space for the entry and the terminator. */
-		root_metric->metric_refs = realloc(root_metric->metric_refs,
-						(cnt + 2) * sizeof(struct metric_ref));
-		if (!root_metric->metric_refs)
+		new_refs = realloc(root_metric->metric_refs,
+				   (cnt + 2) * sizeof(struct metric_ref));
+		if (!new_refs)
 			return -ENOMEM;
+		root_metric->metric_refs = new_refs;
 
 		/*
 		 * Intentionally passing just const char pointers,
-- 
2.56.1.703.gf848ed807c-goog

