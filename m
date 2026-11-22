Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795323881;
	b=pLnTLjoeZeaypZtBjWd5Uz/XdixlXx0Vcv8ZxiBaGFTiRwBUHBQuI1RqyxXimU4c3LXh
	 ePJJ9d+sOp/ahBIObKlTW7lnb5ZTMX0GhwaZBZGs2AgBW0Xmb/yqz+QsEABgzUyEjJkxr
	 V6ZMEwMAkDXSoss2XOdwf2/DGpr80C3b4uh9EEjwEBclKtHvtr7vf4SL865Kx0gbsE1v7
	 DiwDhqzP730pc/qAF5IfoojR6cUFUSi7kgRB3oC0LoF2q1fwyKoyxiRmX2GvhO6kaANcD
	 1ouHBPjK/gWL10Bbv4B8GPlvMFDKqDoKDloFb2jA++VQD7Pug0qWxJhdz4oy8GoA5Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795323881;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=YA/OERqmNLnTYyBBgkFLaJldkLHIN3L3qyA39CDis04=;
	b=N5gDa6Kry9mKkvdW1k5gTuFE+y1pQv1UY4fLtSG23K569BV0ViT96+YHwB11MoWJd3vC
	 uRJqH7XmCqbqGoY6uFr3trx9++8Zl3QhJoxylFXrpsdyu4v/HgaLiqAP8/1V4PodIwfjp
	 Hi+1E9EhqX4OfE0MM8yn8jkFdjGSIf9LlRiRYwtjlMRcvIRzRmqGjY3eJf8m/iHe380Hc
	 wIxUnX9iMORiO2tbXS1PEh6G7i7XxAUKEGGWTLJUnjkvTSWdE/4d6JDDc/8pJZvrDUuyu
	 ioDAB9vlDhv5lUCF+zHsJLIjGpe3HQ2hvs3mNRSJJDcesEi3RfmWbyDi+CYfXh3gxjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bmNCjR9P;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F90606A335
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 05:04:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2F90606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bmNCjR9P
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3854627c1c8so3537496eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 21:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795323880; x=1795928680; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YA/OERqmNLnTYyBBgkFLaJldkLHIN3L3qyA39CDis04=;
        b=bmNCjR9P7eFLYmbijQuAtpzMbIdQPEygRKZsHolwxoMpBhIXLytQCR3X9gkRBzo5Ws
         3zpzLS96aevVMmUTGklNHAd7c+fQfmmW+6AYVKrF9wpjDr5DUqJennsVi7CRquUEoE0T
         9L/+NzXgoVKjnuDXLSPPN4KjB96mlN5/aY/L3DI6OOGAqEVPgay10fq0YSHIPz0Md38S
         IAH4/fmhgygUo5WTEi2AhaRgPvFDkPOc6yYNZQzGGK3YCqk40DJRt2fnG0STEHMcyia3
         PRycrTFzz+XUKOE9Keab3mojRv8M38eITfuAoUCOroeIKK3NjrCocHgmDrH6XRXF98II
         r6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795323880; x=1795928680;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YA/OERqmNLnTYyBBgkFLaJldkLHIN3L3qyA39CDis04=;
        b=F64lGJVovqfFej9PVIuP4l/nW+TEK9XZburXiCUMiNOgPQRVQ5VGav42RzHdOxVt9U
         TfSuIazlIpCuI3etuo4JojZhmtCDbip9JyEvps21hZY6bBhpT4yyy4HPmMRATWrDLShx
         p7XxQQFvtRP7p818yzjvCin6aLOCDlLmAGY9HuomWyuXOBYSq7e6Vu8n6SI5Giw9o0oC
         B1yBt9LojkhDeun8HJisgBPLgPt6AbiBDnOWznOOSsMdPmcBPR/lkj/nTd45WaUKZ2z4
         defZl5gi2OlN1bjp1rlUQCjunn0QTHZprmsEp2/4n28IxUWhOPDmcfXzOArFdSAKCOz8
         v2yA==
X-Forwarded-Encrypted: i=1; AL+hErHGDu31RWYpRn0jK1Wb548Nwi9rvSDO7Ve3EXDhiXUIzQQ7TdYsQjn80WB13qEcx6eiLNAY88Jez5gfGtE=@vger.kernel.org
X-Gm-Message-State: APuU4Z83XI0srPqML+TUDHI/1ZxP4ORJZ6yZJIjwSkvPRINfH0s3KaZG
	6Z54+FOrE/wENUdteWMKepXosMvUHrF3T18NTgDm6gpIWcUxKijYnL3J2XaFNr92yYbii847o1U
	2Jpd4BZqQGw==
X-Received: from dlag8.prod.google.com ([2002:a05:701b:2508:b0:1b5:33c5:1c03])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:3b8e:b0:1b5:10cf:c402
 with SMTP id a92af1059eb24-1b5568a17d9mr8661709c88.10.1795323879580; Sat, 21
 Nov 2026 21:04:39 -0800 (PST)
Date: Sat, 21 Nov 2026 21:04:01 -0800
In-Reply-To: <20261122050405.80335-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261122050405.80335-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261122050405.80335-7-irogers@google.com>
Subject: [PATCH v8 06/10] perf symbol: Replace qsort() with natural-run merge sort
From: Ian Rogers <irogers@google.com>
To: Namhyung Kim <namhyung@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Alireza Haghdoost <haghdoost@uber.com>, Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

ELF .symtab and .dynsym sections are typically already mostly ordered by
address in ascending runs. Invoking full-array qsort() across pre-ordered
ELF runs spends avoidable CPU time in symbol comparisons and does not
guarantee relative order preservation for equal-start symbol aliases
across C library implementations.

Replace qsort() in symbols__sort_locked() with a stable natural-run merge
sort (symbols__sort_range_with_tmp() and symbols__merge_runs()), falling
back to in-place binary insertion sort (symbols__insertion_sort_range())
for small arrays (cnt <= 64) or on scratch-buffer allocation failure.

Using 'perf bench internals symbols':

  Before:
    Average DSO load + sort: 6.242 msec (+- 0.057 msec)
    Average bulk insert + lookup: 1404.150 usec (+- 18.752 usec)
  After (-7.0% load, -13.9% bulk):
    Average DSO load + sort: 5.808 msec (+- 0.047 msec)
    Average bulk insert + lookup: 1209.250 usec (+- 18.446 usec)

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/symbol.c | 183 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 174 insertions(+), 9 deletions(-)

diff --git a/tools/perf/util/symbol.c b/tools/perf/util/symbol.c
index 43347c9a3a0c..35b08c05a2fd 100644
--- a/tools/perf/util/symbol.c
+++ b/tools/perf/util/symbol.c
@@ -265,14 +265,171 @@ static inline bool symbol__less_or_equal(const struct symbol *a, const struct sy
 	return a->start <= b->start;
 }
 
-static int symbols__sort_cmp(const void *vlhs, const void *vrhs)
+static unsigned int symbols__upper_bound(struct symbol **arr, unsigned int len,
+					 const struct symbol *sym)
 {
-	const struct symbol *lhs = *((const struct symbol **)vlhs);
-	const struct symbol *rhs = *((const struct symbol **)vrhs);
+	unsigned int low = 0, high = len;
 
-	if (lhs->start != rhs->start)
-		return lhs->start < rhs->start ? -1 : 1;
-	return 0;
+	while (low < high) {
+		unsigned int mid = low + (high - low) / 2;
+
+		if (symbol__less_or_equal(arr[mid], sym))
+			low = mid + 1;
+		else
+			high = mid;
+	}
+	return low;
+}
+
+static void symbols__insertion_sort_range(struct symbol **arr,
+					  unsigned int start,
+					  unsigned int end)
+{
+	for (unsigned int i = start + 1; i < end; i++) {
+		struct symbol *sym = arr[i];
+
+		if (!symbol__less_or_equal(arr[i - 1], sym)) {
+			unsigned int pos = start +
+				symbols__upper_bound(&arr[start], i - start, sym);
+
+			memmove(&arr[pos + 1], &arr[pos],
+				(i - pos) * sizeof(struct symbol *));
+			arr[pos] = sym;
+		}
+	}
+}
+
+static void symbols__merge_runs(struct symbol **arr,
+				unsigned int left,
+				unsigned int mid,
+				unsigned int right,
+				struct symbol **tmp)
+{
+	unsigned int first_left, left_len, right_len;
+	unsigned int i, j, dst;
+
+	if (left >= mid || mid >= right)
+		return;
+	if (symbol__less_or_equal(arr[mid - 1], arr[mid]))
+		return;
+
+	first_left = left + symbols__upper_bound(&arr[left], mid - left, arr[mid]);
+	left_len = mid - first_left;
+	right_len = right - mid;
+
+	if (left_len <= right_len) {
+		memcpy(tmp, &arr[first_left], left_len * sizeof(struct symbol *));
+		i = 0;
+		j = mid;
+		dst = first_left;
+		while (i < left_len && j < right) {
+			if (symbol__less_or_equal(tmp[i], arr[j]))
+				arr[dst++] = tmp[i++];
+			else
+				arr[dst++] = arr[j++];
+		}
+		if (i < left_len)
+			memcpy(&arr[dst], &tmp[i], (left_len - i) * sizeof(struct symbol *));
+	} else {
+		memcpy(tmp, &arr[mid], right_len * sizeof(struct symbol *));
+		i = mid;
+		j = right_len;
+		dst = right;
+		while (i > first_left && j > 0) {
+			if (symbol__less_or_equal(arr[i - 1], tmp[j - 1]))
+				arr[--dst] = tmp[--j];
+			else
+				arr[--dst] = arr[--i];
+		}
+		if (j > 0)
+			memcpy(&arr[first_left], tmp, j * sizeof(struct symbol *));
+	}
+}
+
+struct symbol_run {
+	unsigned int start;
+	unsigned int len;
+};
+
+static void symbols__sort_range_with_tmp(struct symbol **arr, unsigned int n,
+					 struct symbol **tmp)
+{
+	struct symbol_run runs[64];
+	unsigned int nr_runs = 0;
+	unsigned int i = 0;
+
+	if (n <= 32) {
+		symbols__insertion_sort_range(arr, 0, n);
+		return;
+	}
+
+	while (i < n) {
+		unsigned int start = i++;
+
+		if (i < n) {
+			if (symbol__less_or_equal(arr[i - 1], arr[i])) {
+				while (i < n && symbol__less_or_equal(arr[i - 1], arr[i]))
+					i++;
+			} else {
+				while (i < n && !symbol__less_or_equal(arr[i - 1], arr[i]))
+					i++;
+				for (unsigned int lo = start, hi = i - 1; lo < hi; lo++, hi--) {
+					struct symbol *swap = arr[lo];
+
+					arr[lo] = arr[hi];
+					arr[hi] = swap;
+				}
+			}
+		}
+
+		if (i - start < 32 && i < n) {
+			i = min(start + 32U, n);
+			symbols__insertion_sort_range(arr, start, i);
+		}
+
+		runs[nr_runs++] = (struct symbol_run){
+			.start = start,
+			.len = i - start,
+		};
+
+		while (nr_runs > 1) {
+			unsigned int r = nr_runs - 2;
+
+			if (nr_runs >= 3 &&
+			    runs[nr_runs - 3].len <=
+			    runs[nr_runs - 2].len + runs[nr_runs - 1].len) {
+				if (runs[nr_runs - 3].len < runs[nr_runs - 1].len)
+					r = nr_runs - 3;
+			} else if (runs[nr_runs - 2].len > runs[nr_runs - 1].len &&
+				   nr_runs < ARRAY_SIZE(runs)) {
+				break;
+			}
+
+			symbols__merge_runs(arr, runs[r].start,
+					    runs[r + 1].start,
+					    runs[r + 1].start + runs[r + 1].len,
+					    tmp);
+			runs[r].len += runs[r + 1].len;
+			if (r + 2 < nr_runs)
+				runs[r + 1] = runs[r + 2];
+			nr_runs--;
+		}
+	}
+
+	while (nr_runs > 1) {
+		unsigned int r = nr_runs - 2;
+
+		if (nr_runs >= 3 && runs[nr_runs - 3].len < runs[nr_runs - 1].len)
+			r = nr_runs - 3;
+		symbols__merge_runs(arr, runs[r].start,
+				    runs[r + 1].start,
+				    runs[r + 1].start + runs[r + 1].len,
+				    tmp);
+		runs[r].len += runs[r + 1].len;
+		if (r + 2 < nr_runs)
+			runs[r + 1] = runs[r + 2];
+		nr_runs--;
+	}
 }
 
 static void symbols__sort_locked(struct symbols *symbols)
@@ -281,9 +438,17 @@ static void symbols__sort_locked(struct symbols *symbols)
 	if (symbols->sorted)
 		return;
 
-	if (symbols->cnt > 1) {
-		qsort(symbols->symbols, symbols->cnt, sizeof(struct symbol *),
-		      symbols__sort_cmp);
+	if (symbols->cnt <= 64) {
+		symbols__insertion_sort_range(symbols->symbols, 0, symbols->cnt);
+	} else {
+		struct symbol **tmp = malloc(((symbols->cnt + 1) / 2) * sizeof(struct symbol *));
+
+		if (tmp) {
+			symbols__sort_range_with_tmp(symbols->symbols, symbols->cnt, tmp);
+			free(tmp);
+		} else {
+			symbols__insertion_sort_range(symbols->symbols, 0, symbols->cnt);
+		}
 	}
 	symbols->sorted = true;
 }
-- 
2.56.1.750.gf70dc682cf-goog

