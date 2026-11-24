Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795559479;
	b=iFxJaplJGm1u+W2IgyFCgyzuKOJLZSNM8zKSX/yne8x0ei8/kKYwXqt7LqO/znSd9LND
	 tyGV083ZelpEV6ze5r2RyRdQ/unrWBgrcdHuDk5NrDjCJHP78pKDc/q7BFyoHLYA1W3ZD
	 DMyi5duEfr0Tg1dKcQ/Qtg8ovUTSXhfl/aTLaTpQfQetaQ/FjkovV1XqhLSWLrqHe+A8P
	 vQ1MQOndsb1IYRUHQVMn7YlfdPKqt56zIS39arNtMshd6w6h1H/jrSheDH2JCXvyLow+y
	 L4ND94fFWyGHYNwQLkUS5pZqhq2DfEcvr6hqrCb/lVZuREcxwiaoS4aHwpPN/pjr8dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795559479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=iRbB+UmNDRhutyQwGU8vTes79643tXXXd+rgtfJ+5c0=;
	b=ZMKrnhyyLi9vQZMIkl/MY7TibC1hZUFeY5Zj2HJWK2u9Oz9+muhFo1msaBjP6SkhpVt1
	 EOP1w6OM5avhygn3hnM2XESX3j11jmZobwU52Lmy10D6cqYNgu++PsSGZUmWw39r1H3sm
	 NuhKcMaU2yzRcRWqYkufremIwgURedlVfSRR5VBzuMOmrLBCYb7VU4MHFwWYYX3fIVgwV
	 LmpXWGDDXAzylD5uLY8e2lVe/FxABur3zC1/86ZNWL5nMzSpWOlvcOcH9xo4e0g6Dkz1G
	 QZ1QLoUdsaXg8KVZ76rcVfv3eKRbvZI9vT0B9QIUpGBdD2m61mdJx2BtZcRP2p22tSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jztQNa4Y;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6639F606A33F
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:31:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6639F606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jztQNa4Y
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso6808966eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795559478; x=1796164278; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iRbB+UmNDRhutyQwGU8vTes79643tXXXd+rgtfJ+5c0=;
        b=jztQNa4YZEqv/Gw5DoxRKhd1inc8MYcFp+fSpr8pNYWbsor3NQH1SfvHaF9jhD1teC
         pWrYphKM8kasWtJunDd+HizDdAg9Bb+b6fk6FpAiSD53feRYfrsoElVLeLZL4licOPyr
         JkD9/lY0cMdMCb6WbVUlh+6ZVgM3O9QNP+QgudZZ2L+8JBP8HF0BLprwCQOQvaOUjfhd
         7jFIRMVSn+CR7m+KXQlzQMkFoHX/6xJeYgmwHM4PhS/ak5yFwzg2fS8BrlIZ7MUlLaHe
         FHfgY8T1v0B0Byv3+BWfHzOFafg0CJqcbIQsREOZsQPPq2NpQY29xfoBDMTtqtALO+bG
         0U1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795559478; x=1796164278;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iRbB+UmNDRhutyQwGU8vTes79643tXXXd+rgtfJ+5c0=;
        b=nBmV2YX2YUDgLNMB4J5v+xcw8rBHBtF4Jk5ozWRrIG+3Mq/r3ZQk9S8+olhhdwcpZs
         mhq7e9aeTaZr9lGhvW8YZ/6o310ksUR22lWyDN2j6w4Djn3SLPk4A8Nu5IM9pyvVriYH
         Vsysx96qWaEXE57sGGZDA/u7JRGqftGNz/eTOyYFGQUPOXn6rZWjyupwqt2q4l0WS9kE
         FmoukWEdxD5/tH6c3Oh7dxB/hQvPrrkiKTlpmmrdNl3Y2UgJxbKj+B8IJNFtEmzdOLKs
         SzR7Xoqa0o1hR/U7CcYE3DloHqXf6YzClhssu2icBj5h+cmHxjrxKPayKnzxAAXRPQuk
         Uu5A==
X-Forwarded-Encrypted: i=1; AL+hErGjjJOQIeJ77qPFLH5YidMc0vPwCZXxPQaW5uJmaSpewLs9cCVdw5e1Y7nC0IVTSWfcLrv/ZIggX6d8M3M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kcJLqN/8omtkBc4SIJ1/1ouNrCJQgf3jTUlGZAgoH3qlQG7JK
	Z7ioM3/DI3fkHQFtZj7wDYqXMp3nMDzJV8e99pre8aqnOVNd3qRg1pe3dzjb71/j+f0q9D0fFYs
	3I0VakRf8+Q==
X-Received: from dyrp2.prod.google.com ([2002:a05:693c:69c2:b0:36a:1f25:64f4])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:1402:b0:36e:b3e6:ebe7
 with SMTP id 5a478bee46e88-3857025f297mr15066508eec.26.1795559478019; Tue, 24
 Nov 2026 14:31:18 -0800 (PST)
Date: Tue, 24 Nov 2026 14:31:00 -0800
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
Message-ID: <20261124223109.820609-4-irogers@google.com>
Subject: [PATCH v10 03/12] perf symbol: Replace sorted boolean with sorted_cnt
 prefix length
From: Ian Rogers <irogers@google.com>
To: Namhyung Kim <namhyung@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Alireza Haghdoost <haghdoost@uber.com>, Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When symbols are appended after an initial sort, re-running full-array
merge sort across the entire symbol table rescans the already-sorted
prefix and allocates a scratch buffer even when only a few symbols were
appended.

Replace the @sorted boolean in struct symbols with @sorted_cnt, the
length of the leading start-address-sorted prefix (so @sorted_cnt ==
@cnt indicates the entire array is sorted):
- Pass first_unsorted to symbols__insertion_sort_range() so
  already-sorted prefixes are not rescanned.
- In symbols__sort_locked(), binary-insert in place without allocating
  when <= 8 symbols have been appended (or cnt <= 64), and otherwise
  sort only the newly appended tail [sorted_cnt .. cnt) before merging
  with [0 .. sorted_cnt).

Using 'perf bench internals symbols':

  Before:
    Average append + lookup: 1551.533 usec (+- 3.379 usec)
  After (-90.3%):
    Average append + lookup: 150.333 usec (+- 0.273 usec)

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/symbol.c | 75 +++++++++++++++++++++++++++++-----------
 tools/perf/util/symbol.h | 21 +++++++----
 2 files changed, 68 insertions(+), 28 deletions(-)

diff --git a/tools/perf/util/symbol.c b/tools/perf/util/symbol.c
index 6dce0f44fb4b..cf8c8e5cbd2b 100644
--- a/tools/perf/util/symbol.c
+++ b/tools/perf/util/symbol.c
@@ -220,8 +220,8 @@ void symbols__init(struct symbols *symbols)
 	symbols->symbols = NULL;
 	symbols->symbols_by_name = NULL;
 	symbols->cnt = 0;
+	symbols->sorted_cnt = 0;
 	symbols->allocated = 0;
-	symbols->sorted = true;
 }
 
 static void symbols__delete_locked(struct symbols *symbols)
@@ -233,8 +233,8 @@ static void symbols__delete_locked(struct symbols *symbols)
 	zfree(&symbols->symbols);
 	zfree(&symbols->symbols_by_name);
 	symbols->cnt = 0;
+	symbols->sorted_cnt = 0;
 	symbols->allocated = 0;
-	symbols->sorted = true;
 }
 
 void symbols__delete(struct symbols *symbols)
@@ -279,9 +279,10 @@ static unsigned int symbols__upper_bound(struct symbol **arr, unsigned int len,
 
 static void symbols__insertion_sort_range(struct symbol **arr,
 					  unsigned int start,
+					  unsigned int first_unsorted,
 					  unsigned int end)
 {
-	for (unsigned int i = start + 1; i < end; i++) {
+	for (unsigned int i = max(first_unsorted, start + 1); i < end; i++) {
 		struct symbol *sym = arr[i];
 
 		if (!symbol__less_or_equal(arr[i - 1], sym)) {
@@ -355,7 +356,7 @@ static void symbols__sort_range_with_tmp(struct symbol **arr, unsigned int n,
 	unsigned int i = 0;
 
 	if (n <= 32) {
-		symbols__insertion_sort_range(arr, 0, n);
+		symbols__insertion_sort_range(arr, 0, 1, n);
 		return;
 	}
 
@@ -379,8 +380,10 @@ static void symbols__sort_range_with_tmp(struct symbol **arr, unsigned int n,
 		}
 
 		if (i - start < 32 && i < n) {
+			unsigned int run_end = i;
+
 			i = min(start + 32U, n);
-			symbols__insertion_sort_range(arr, start, i);
+			symbols__insertion_sort_range(arr, start, run_end, i);
 		}
 
 		runs[nr_runs++] = (struct symbol_run){
@@ -431,22 +434,48 @@ static void symbols__sort_range_with_tmp(struct symbol **arr, unsigned int n,
 static void symbols__sort_locked(struct symbols *symbols)
 	__must_hold(&symbols->lock)
 {
-	if (symbols->sorted)
+	unsigned int m = symbols->sorted_cnt;
+	unsigned int k;
+
+	if (m >= symbols->cnt) {
+		symbols->sorted_cnt = symbols->cnt;
 		return;
+	}
+	k = symbols->cnt - m;
 
-	if (symbols->cnt <= 64) {
-		symbols__insertion_sort_range(symbols->symbols, 0, symbols->cnt);
-	} else {
+	/*
+	 * When only a few symbols have been appended since the last sort
+	 * (including single-symbol insertions), insert them directly at
+	 * their binary-searched sorted positions in O(N) without allocating.
+	 */
+	if (k <= 8 || symbols->cnt <= 64) {
+		symbols__insertion_sort_range(symbols->symbols, 0, m, symbols->cnt);
+		symbols->sorted_cnt = symbols->cnt;
+		return;
+	}
+
+	if (m <= 1) {
 		struct symbol **tmp = malloc(((symbols->cnt + 1) / 2) * sizeof(struct symbol *));
 
 		if (tmp) {
 			symbols__sort_range_with_tmp(symbols->symbols, symbols->cnt, tmp);
 			free(tmp);
 		} else {
-			symbols__insertion_sort_range(symbols->symbols, 0, symbols->cnt);
+			symbols__insertion_sort_range(symbols->symbols, 0, m, symbols->cnt);
+		}
+	} else {
+		struct symbol **tmp = malloc(k * sizeof(struct symbol *));
+
+		if (tmp) {
+			symbols__sort_range_with_tmp(&symbols->symbols[m], k, tmp);
+			symbols__merge_runs(symbols->symbols, 0, m, symbols->cnt, tmp);
+			free(tmp);
+		} else {
+			symbols__insertion_sort_range(symbols->symbols, 0, m, symbols->cnt);
 		}
 	}
-	symbols->sorted = true;
+
+	symbols->sorted_cnt = symbols->cnt;
 }
 
 /*
@@ -456,7 +485,7 @@ static void symbols__sort_locked(struct symbols *symbols)
 void symbols__sort_read_lock(struct symbols *symbols)
 {
 	down_read(&symbols->lock);
-	while (!symbols->sorted) {
+	while (symbols->sorted_cnt < symbols->cnt) {
 		up_read(&symbols->lock);
 		down_write(&symbols->lock);
 		symbols__sort_locked(symbols);
@@ -505,6 +534,7 @@ void symbols__fixup_duplicate(struct symbols *symbols)
 		}
 	}
 	symbols->cnt = write_idx + 1;
+	symbols->sorted_cnt = symbols->cnt;
 	zfree(&symbols->symbols_by_name);
 	up_write(&symbols->lock);
 }
@@ -689,9 +719,10 @@ static int __symbols__insert(struct symbols *symbols, struct symbol *sym)
 		symbols->allocated = to_allocate;
 	}
 
-	if (symbols->sorted && symbols->cnt > 0 &&
-	    !symbol__less_or_equal(symbols->symbols[symbols->cnt - 1], sym))
-		symbols->sorted = false;
+	if (symbols->sorted_cnt == symbols->cnt &&
+	    (symbols->cnt == 0 ||
+	     symbol__less_or_equal(symbols->symbols[symbols->cnt - 1], sym)))
+		symbols->sorted_cnt = symbols->cnt + 1;
 
 	symbols->symbols[symbols->cnt++] = sym;
 	zfree(&symbols->symbols_by_name);
@@ -904,11 +935,13 @@ void dso__delete_symbol(struct dso *dso, struct symbol *sym)
 	struct symbols *symbols = dso__symbols(dso);
 
 	down_write(&symbols->lock);
-	for (unsigned int i = 0; i < symbols->cnt; i++) {
+	for (unsigned int i = symbols->cnt; i-- > 0; ) {
 		if (symbols->symbols[i] == sym) {
 			memmove(&symbols->symbols[i], &symbols->symbols[i + 1],
 				(symbols->cnt - i - 1) * sizeof(struct symbol *));
 			symbols->cnt--;
+			if (i < symbols->sorted_cnt)
+				symbols->sorted_cnt--;
 			zfree(&symbols->symbols_by_name);
 			symbol__delete(sym);
 			break;
@@ -1253,8 +1286,8 @@ static int maps__split_kallsyms_for_kcore(struct maps *kmaps, struct dso *dso)
 	old_cnt = root->cnt;
 	root->symbols = NULL;
 	root->cnt = 0;
+	root->sorted_cnt = 0;
 	root->allocated = 0;
-	root->sorted = true;
 	zfree(&root->symbols_by_name);
 	up_write(&root->lock);
 
@@ -1325,8 +1358,8 @@ static int maps__split_kallsyms(struct maps *kmaps, struct dso *dso, u64 delta,
 	old_allocated = root->allocated;
 	root->symbols = NULL;
 	root->cnt = 0;
+	root->sorted_cnt = 0;
 	root->allocated = 0;
-	root->sorted = true;
 	zfree(&root->symbols_by_name);
 	up_write(&root->lock);
 
@@ -1473,8 +1506,8 @@ static int maps__split_kallsyms(struct maps *kmaps, struct dso *dso, u64 delta,
 	if (root->cnt == 0) {
 		root->symbols = old_symbols;
 		root->cnt = write_idx;
+		root->sorted_cnt = write_idx;
 		root->allocated = old_allocated;
-		root->sorted = true;
 		old_symbols = NULL;
 	} else {
 		for (unsigned int j = 0; j < write_idx; j++)
@@ -1500,13 +1533,13 @@ static int maps__split_kallsyms(struct maps *kmaps, struct dso *dso, u64 delta,
 	if (root->cnt == 0) {
 		root->symbols = old_symbols;
 		root->cnt = write_idx;
+		root->sorted_cnt = (delta == 0) ? write_idx : min(write_idx, 1U);
 		root->allocated = old_allocated;
-		root->sorted = (delta == 0);
 		old_symbols = NULL;
 	} else {
 		for (unsigned int j = 0; j < write_idx; j++)
 			__symbols__insert(root, old_symbols[j]);
-		root->sorted = false;
+		root->sorted_cnt = min(root->cnt, 1U);
 	}
 	zfree(&root->symbols_by_name);
 	up_write(&root->lock);
diff --git a/tools/perf/util/symbol.h b/tools/perf/util/symbol.h
index 629f6b2fcd0a..2b20bfb22fd1 100644
--- a/tools/perf/util/symbol.h
+++ b/tools/perf/util/symbol.h
@@ -97,14 +97,18 @@ struct symbol {
 
 /**
  * struct symbols - A locked collection of symbols stored in a sorted array.
+ *
+ * The @symbols array of @cnt pointers (within an allocation of @allocated
+ * slots) keeps a start-address-sorted prefix @symbols[0 .. @sorted_cnt)
+ * followed by an optional unsorted tail @symbols[@sorted_cnt .. @cnt) from
+ * bulk symbols__insert() appends. When @sorted_cnt == @cnt, the entire array
+ * is sorted; otherwise the unsorted tail is lazily sorted and merged into the
+ * prefix on lookup or iteration.
  */
 struct symbols {
 	/** @lock: Read/write semaphore synchronizing access to the arrays. */
 	struct rw_semaphore lock;
-	/**
-	 * @symbols: Dynamically allocated array of @allocated symbol pointers,
-	 * sorted by start address when @sorted is true.
-	 */
+	/** @symbols: Dynamically allocated array of @allocated symbol pointers. */
 	struct symbol **symbols __guarded_by(&lock);
 	/**
 	 * @symbols_by_name: Optional lazily built array of @cnt symbol pointers
@@ -112,12 +116,15 @@ struct symbols {
 	 * is 0, or when invalidated by a symbol-table mutation.
 	 */
 	struct symbol **symbols_by_name __guarded_by(&lock);
-	/** @cnt: Number of valid entries in @symbols. */
+	/** @cnt: Total number of valid symbol pointers in @symbols. */
 	unsigned int cnt __guarded_by(&lock);
+	/**
+	 * @sorted_cnt: Length of the leading start-address-sorted prefix in
+	 * @symbols. The entire @symbols array is sorted iff @sorted_cnt == @cnt.
+	 */
+	unsigned int sorted_cnt __guarded_by(&lock);
 	/** @allocated: Capacity (in entries) of the @symbols allocation. */
 	unsigned int allocated __guarded_by(&lock);
-	/** @sorted: True when @symbols is sorted by address range. */
-	bool sorted __guarded_by(&lock);
 };
 
 void symbol__delete(struct symbol *sym);
-- 
2.56.1.831.g720f3f5937-goog

