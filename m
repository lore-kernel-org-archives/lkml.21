Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795559477;
	b=cc+Gpssf9gx18PCDXjNBoztS2m8ls6/luJX5+2/+Bkr7XagSHyW5N95dh5CSH2Ik39l5
	 YbhEo6zlMrjVLL+E53EWzAJ/xue0fFhEPjYeQrqEt+3qi6H2nu8bJoUFRJV+hh6yvh2Ne
	 ps/aaiAZVSuufTkkgJR2GnlpOwcusaySGD/RD4Y1YH8KPTNm2i1HvXNgpE+YlAEKm38to
	 qi9WhaKUGa6rv00orUUmyJBnI/YSVu/4qJ3L+sxb5x6HdJOuVXQgZxpzabfTa2rlawPL6
	 qb2+kDxMoLRb7yE3ynR7KH5/E9X5gI4HvoAeVgUHURDChWESEjOXcv/6uTDosrmI1Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795559477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=c536sWW2rimx1N1MpOLJFvt+7kCYzuGmbKYiaW7Fjw0=;
	b=xHdXvYyM/D+HshXDvnJaWWCv/51w3r4Ya+Tsgm1tlf7iZPwhtK6POgPt09GakqRuhzsM
	 q+p/SU644VqIS2EUciwiUWmwOUL9okfyQZpwhIPlanoR9bhOyvBADr1BSGMyVq6xD7yin
	 GAlmUy8AFYO+rcMhA9i95Mz16NjBYSYRTnOcyDRbTLPd9pwhVhPWqSk7NAvV1ZdTHVNjs
	 CmOR78vKqsxaG2Sa8l2Vt7PsQaBE9Td9Kv3cIIwk22Svh79ZDIpghDHW49AjtZ3OQkRGp
	 JeSvg2xJpavhKswysezuGjKmH9SZTUW+deKzqsNf4dWsOFi6gylN8lwi9hs1b+FiQpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bZoflTbI;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79336606A329
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:31:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79336606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bZoflTbI
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-38355b03cb8so4965308eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795559477; x=1796164277; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c536sWW2rimx1N1MpOLJFvt+7kCYzuGmbKYiaW7Fjw0=;
        b=bZoflTbIG9KGzDVh3fB+LgkBJiw7692oPF0NQ+UCTmTiXJSW4aaFbjtd4sxccGP06Y
         wm55ZlrCJuidSCK8cblLvfPnyo3bf9pjRcfWehsgafUB6gYGOB/3gFVZrNzbeYA3xqFU
         LUjDAVK0zUldwt/H9PTlw9bcxbNJCchuIF/ZFV/BehIrud0btHSHT6itLVf5riZv9Ivv
         fa8733fiFQRQtiu5e7JhRARxy5bjd2ax4BxPqo16x2/uJE8YzeUUYl+zdxpiVL8R4V1a
         x6ZmcPMuk26N2MTvoe439A06RVHk0qIoVcVi7GlNv4r8joJ57ZwwLKmMaTTelnEspK/a
         lI2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795559477; x=1796164277;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c536sWW2rimx1N1MpOLJFvt+7kCYzuGmbKYiaW7Fjw0=;
        b=H+vcHqzUtJoklbzqNVpWdIKNj6aDep8mFiOTf3tcRt4hVZ7Jg+T4w7uqEO0gBW63gl
         j/TlXl7k5yo82mo3zOQtIeAt3K86hhimBOptaf5wIeKculo2jBm5MxPrtwog6smBqXGO
         Z6mEi9eB8uRUUDhgCSpZBxJ1osrk0qawOBQaZ1fm/VUFFLCN2L/ytN4DjKvIAJWXM/K7
         fP2VVHScVLUEQ3Fw9jc0Q1p0Vx8/Cd3NNnNmmqgNmseIbs3CDjY6j3+SU5Kth5LnDUss
         NsITVrCSoEOm8EWOGIs5WzYOjaH4/VDC3ASolj5Qlb9Sv91LJlgc7OX8OoQJcobPkSLb
         MLrw==
X-Forwarded-Encrypted: i=1; AL+hErHvEOzMH3QoLRT6TaIbcNFLTOsnV/bguZRyrU9P4/MQWw5FW4al/f9xs52LmIjWgpfsG5gtGw38Bcrz4dw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+isFsqRpvJe99/OFmv4LE594pMc7yMsD0WrNU58cKq+xRO6PPS
	Ko36jqfa+atuR7q0UppdVuk98N/aqUO6SwmXiNIQw+KOE7PlC7JhnFUTGqPy4EtP1nX/m4Rm11Q
	84Ytlc2HVRw==
X-Received: from dycnh14.prod.google.com ([2002:a05:7300:ce8e:b0:36a:17c6:6824])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:65ca:b0:386:b826:407
 with SMTP id 5a478bee46e88-386b826061cmr6154460eec.20.1795559476114; Tue, 24
 Nov 2026 14:31:16 -0800 (PST)
Date: Tue, 24 Nov 2026 14:30:59 -0800
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
Message-ID: <20261124223109.820609-3-irogers@google.com>
Subject: [PATCH v10 02/12] perf symbol: Drop num_by_name and sorted_by_name
 from struct symbols
From: Ian Rogers <irogers@google.com>
To: Namhyung Kim <namhyung@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Alireza Haghdoost <haghdoost@uber.com>, Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Every mutation to symbols->symbols frees symbols->symbols_by_name, and
symbols__sort_by_name_locked() copies all symbols->cnt pointers verbatim
before sorting by name. As a result:
- symbols->num_by_name always equals symbols->cnt whenever
  symbols->symbols_by_name is non-NULL (and 0 otherwise).
- symbols->sorted_by_name is equivalent to
  (symbols->symbols_by_name != NULL || symbols->cnt == 0). Treating
  cnt == 0 as trivially sorted by name also avoids an unnecessary
  read-to-write lock upgrade on empty DSOs in
  symbols__sort_by_name_read_lock() and dso__sort_by_name().

Remove num_by_name and sorted_by_name from struct symbols and clarify
the @symbols_by_name kernel-doc.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dso.c    |  2 +-
 tools/perf/util/symbol.c | 44 ++++++++--------------------------------
 tools/perf/util/symbol.h | 16 +++++----------
 3 files changed, 14 insertions(+), 48 deletions(-)

diff --git a/tools/perf/util/dso.c b/tools/perf/util/dso.c
index 287f6812139c..ab0c87d0595e 100644
--- a/tools/perf/util/dso.c
+++ b/tools/perf/util/dso.c
@@ -1809,7 +1809,7 @@ bool dso__sorted_by_name(const struct dso *dso)
 	bool res;
 
 	down_read(&symbols->lock);
-	res = symbols->sorted_by_name;
+	res = symbols->symbols_by_name != NULL || symbols->cnt == 0;
 	up_read(&symbols->lock);
 	return res;
 }
diff --git a/tools/perf/util/symbol.c b/tools/perf/util/symbol.c
index 920951aaa5be..6dce0f44fb4b 100644
--- a/tools/perf/util/symbol.c
+++ b/tools/perf/util/symbol.c
@@ -221,9 +221,7 @@ void symbols__init(struct symbols *symbols)
 	symbols->symbols_by_name = NULL;
 	symbols->cnt = 0;
 	symbols->allocated = 0;
-	symbols->num_by_name = 0;
 	symbols->sorted = true;
-	symbols->sorted_by_name = false;
 }
 
 static void symbols__delete_locked(struct symbols *symbols)
@@ -236,9 +234,7 @@ static void symbols__delete_locked(struct symbols *symbols)
 	zfree(&symbols->symbols_by_name);
 	symbols->cnt = 0;
 	symbols->allocated = 0;
-	symbols->num_by_name = 0;
 	symbols->sorted = true;
-	symbols->sorted_by_name = false;
 }
 
 void symbols__delete(struct symbols *symbols)
@@ -510,8 +506,6 @@ void symbols__fixup_duplicate(struct symbols *symbols)
 	}
 	symbols->cnt = write_idx + 1;
 	zfree(&symbols->symbols_by_name);
-	symbols->num_by_name = 0;
-	symbols->sorted_by_name = false;
 	up_write(&symbols->lock);
 }
 
@@ -701,8 +695,6 @@ static int __symbols__insert(struct symbols *symbols, struct symbol *sym)
 
 	symbols->symbols[symbols->cnt++] = sym;
 	zfree(&symbols->symbols_by_name);
-	symbols->num_by_name = 0;
-	symbols->sorted_by_name = false;
 	return 0;
 }
 
@@ -805,17 +797,9 @@ static int symbols__sort_by_name_locked(struct symbols *symbols)
 	struct symbol **result;
 	unsigned int size = symbols->cnt;
 
-	if (symbols->sorted_by_name)
+	if (symbols->symbols_by_name || size == 0)
 		return 0;
 
-	zfree(&symbols->symbols_by_name);
-	symbols->num_by_name = 0;
-
-	if (size == 0) {
-		symbols->sorted_by_name = true;
-		return 0;
-	}
-
 	result = malloc(sizeof(*result) * size);
 	if (!result)
 		return -ENOMEM;
@@ -823,8 +807,6 @@ static int symbols__sort_by_name_locked(struct symbols *symbols)
 	memcpy(result, symbols->symbols, sizeof(*result) * size);
 	qsort(result, size, sizeof(*result), symbols__sort_name_cmp);
 	symbols->symbols_by_name = result;
-	symbols->num_by_name = size;
-	symbols->sorted_by_name = true;
 	return 0;
 }
 
@@ -834,7 +816,7 @@ static int symbols__sort_by_name_read_lock(struct symbols *symbols)
 	int err = 0;
 
 	down_read(&symbols->lock);
-	while (!symbols->sorted_by_name) {
+	while (!symbols->symbols_by_name && symbols->cnt > 0) {
 		up_read(&symbols->lock);
 		down_write(&symbols->lock);
 		err = symbols__sort_by_name_locked(symbols);
@@ -843,7 +825,7 @@ static int symbols__sort_by_name_read_lock(struct symbols *symbols)
 		if (err)
 			break;
 	}
-	return symbols->sorted_by_name ? 0 : err;
+	return (symbols->symbols_by_name || symbols->cnt == 0) ? 0 : err;
 }
 
 int symbol__match_symbol_name(const char *name, const char *str,
@@ -928,8 +910,6 @@ void dso__delete_symbol(struct dso *dso, struct symbol *sym)
 				(symbols->cnt - i - 1) * sizeof(struct symbol *));
 			symbols->cnt--;
 			zfree(&symbols->symbols_by_name);
-			symbols->num_by_name = 0;
-			symbols->sorted_by_name = false;
 			symbol__delete(sym);
 			break;
 		}
@@ -957,7 +937,7 @@ struct symbol *dso__next_symbol_by_name(struct dso *dso, size_t *idx)
 
 	symbols = dso__symbols(dso);
 	if (!symbols__sort_by_name_read_lock(symbols) &&
-	    *idx + 1 < symbols->num_by_name) {
+	    *idx + 1 < symbols->cnt) {
 		++*idx;
 		res = symbols->symbols_by_name[*idx];
 	}
@@ -981,10 +961,10 @@ struct symbol *dso__find_symbol_by_name(struct dso *dso, const char *name, size_
 	symbols = dso__symbols(dso);
 	if (!symbols__sort_by_name_read_lock(symbols)) {
 		s = symbols__find_by_name(symbols->symbols_by_name,
-					  symbols->num_by_name,
+					  symbols->cnt,
 					  name, SYMBOL_TAG_INCLUDE__NONE, idx);
 		if (!s) {
-			s = symbols__find_by_name(symbols->symbols_by_name, symbols->num_by_name,
+			s = symbols__find_by_name(symbols->symbols_by_name, symbols->cnt,
 						  name, SYMBOL_TAG_INCLUDE__DEFAULT_ONLY, idx);
 		}
 	}
@@ -997,7 +977,7 @@ void dso__sort_by_name(struct dso *dso)
 	struct symbols *symbols = dso__symbols(dso);
 
 	down_read(&symbols->lock);
-	if (!symbols->sorted_by_name) {
+	if (!symbols->symbols_by_name && symbols->cnt > 0) {
 		up_read(&symbols->lock);
 		down_write(&symbols->lock);
 		symbols__sort_by_name_locked(symbols);
@@ -1014,7 +994,7 @@ int symbols__visit_by_name(struct symbols *symbols,
 	int err = symbols__sort_by_name_read_lock(symbols);
 
 	if (!err) {
-		for (size_t i = 0; i < symbols->num_by_name; i++) {
+		for (size_t i = 0; i < symbols->cnt; i++) {
 			err = cb(symbols->symbols_by_name[i], data);
 			if (err)
 				break;
@@ -1276,8 +1256,6 @@ static int maps__split_kallsyms_for_kcore(struct maps *kmaps, struct dso *dso)
 	root->allocated = 0;
 	root->sorted = true;
 	zfree(&root->symbols_by_name);
-	root->num_by_name = 0;
-	root->sorted_by_name = false;
 	up_write(&root->lock);
 
 	for (unsigned int i = 0; i < old_cnt; i++) {
@@ -1350,8 +1328,6 @@ static int maps__split_kallsyms(struct maps *kmaps, struct dso *dso, u64 delta,
 	root->allocated = 0;
 	root->sorted = true;
 	zfree(&root->symbols_by_name);
-	root->num_by_name = 0;
-	root->sorted_by_name = false;
 	up_write(&root->lock);
 
 	for (i = 0; i < old_cnt; i++) {
@@ -1505,8 +1481,6 @@ static int maps__split_kallsyms(struct maps *kmaps, struct dso *dso, u64 delta,
 			__symbols__insert(root, old_symbols[j]);
 	}
 	zfree(&root->symbols_by_name);
-	root->num_by_name = 0;
-	root->sorted_by_name = false;
 	up_write(&root->lock);
 	free(old_symbols);
 
@@ -1535,8 +1509,6 @@ static int maps__split_kallsyms(struct maps *kmaps, struct dso *dso, u64 delta,
 		root->sorted = false;
 	}
 	zfree(&root->symbols_by_name);
-	root->num_by_name = 0;
-	root->sorted_by_name = false;
 	up_write(&root->lock);
 	free(old_symbols);
 	return -1;
diff --git a/tools/perf/util/symbol.h b/tools/perf/util/symbol.h
index 8b8ab7e1e148..629f6b2fcd0a 100644
--- a/tools/perf/util/symbol.h
+++ b/tools/perf/util/symbol.h
@@ -102,26 +102,20 @@ struct symbols {
 	/** @lock: Read/write semaphore synchronizing access to the arrays. */
 	struct rw_semaphore lock;
 	/**
-	 * @symbols: Dynamically allocated array of symbol pointers, sorted by
-	 * address range [start, end) when @sorted is true.
+	 * @symbols: Dynamically allocated array of @allocated symbol pointers,
+	 * sorted by start address when @sorted is true.
 	 */
 	struct symbol **symbols __guarded_by(&lock);
 	/**
-	 * @symbols_by_name: Optional dynamically allocated array of symbol
-	 * pointers sorted lexicographically by sym->name.
+	 * @symbols_by_name: Optional lazily built array of @cnt symbol pointers
+	 * sorted lexicographically by sym->name; NULL when unbuilt, when @cnt
+	 * is 0, or when invalidated by a symbol-table mutation.
 	 */
 	struct symbol **symbols_by_name __guarded_by(&lock);
 	/** @cnt: Number of valid entries in @symbols. */
 	unsigned int cnt __guarded_by(&lock);
 	/** @allocated: Capacity (in entries) of the @symbols allocation. */
 	unsigned int allocated __guarded_by(&lock);
-	/** @num_by_name: Number of valid entries in @symbols_by_name. */
-	unsigned int num_by_name __guarded_by(&lock);
-	/**
-	 * @sorted_by_name: True when @symbols_by_name is populated and sorted
-	 * by name.
-	 */
-	bool sorted_by_name __guarded_by(&lock);
 	/** @sorted: True when @symbols is sorted by address range. */
 	bool sorted __guarded_by(&lock);
 };
-- 
2.56.1.831.g720f3f5937-goog

