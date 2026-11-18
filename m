Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794988526;
	b=mmDCEffllCD0a5kLm6+6IIytk0Wi7YAo7WhoA2fuMFj3m+JMAJHpyOHodDI9ymC7zVWa
	 8yoxyavpeM8vkF2RsIKlGhBB/KHIBb0E5p06oEVGMgTv8vctCBdfITQq4vTN1541GMHoN
	 eKEXFtY6699zMJauDd20NW7ORtVRepTC2/CLaLiY1uyhLJ7iFkcBHYzlogauWGQH/nazg
	 Nav1dbRF4O0NNs8YLoDLIhAECoPQJO/a0uzPMX8XRqelWVo2VJrH34fawaO6B0H4UnfOO
	 09H4sFpYL/u3xjv/YFe9Ksw3M7yqhkQIQF8Ur9LCgkmmXVxvTOP40uWrpXyPrXAfgWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794988526;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=5DboQG35Wnbme+vu2GzT8Sr2q49b+BE2rknnKDhVsEM=;
	b=oCGwJgmaSDqu5qqWplZPzV2SZn6VEAx3aTsyxWVO+mgjsIYnBaMAgbl6tCj0LQkGuG73
	 s5+LTlQb6osmHaGi+o/RJ26gsoVhoc7Uxz3LX0uLohQsdYy1uXU8UBroDghDvU+Z8vvtU
	 0ip/kBNtx5Wy04Xgd3eUtD3Y4yUz/9mtSyKJZFMaf2lWmvFfwwZryIEtclAJ4P8hVKCtI
	 WPU1NMBb3s583lDQlHz9zswVoM6TzozHYQLT9exzc7palVvJpcCUcGGZ9mwjbAniija2N
	 dxoRiFcPis8+wa/DWWRPMbr2BRdYYexgb8O1UrFSYJFuAUy68REx40VkPA1j16UfoZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="AQQ/L8vO";
	arc=none smtp.remote-ip=209.85.161.70
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F6E606A889
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:55:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07F6E606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AQQ/L8vO
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-71aefbef495so866866eaf.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794988525; x=1795593325; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5DboQG35Wnbme+vu2GzT8Sr2q49b+BE2rknnKDhVsEM=;
        b=AQQ/L8vOOgjQs8+YpYQIJxCvxusw4ebii6H3YezaRzLkwaeODjW6b/+tNgvuPwrrB2
         USnR+i+HCZWOt9xIxM3p3070M4AmbpscZrHeIkWPa6MuK/E2L6x5ixuCDLU+/eEKdWSK
         iE91CWSnXzxI1Adhzf8Tr/I5uiyFt/ShdYItltY2QPMMYaR8BjRcRIwAF4xLg4zJ47b1
         87t4jpDgEVVAOctbH3lljq5q6CjCyVDU99tk4MIcsCUEgYuPoxXT/A+2Zao1w/wccQsu
         Atpcl/Iq9kvaerq9lSu9DygMYJLuF72RLTYAQJv4IaXbV2nan/+fr+8CLK/H5ZqD1B/F
         AgWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794988525; x=1795593325;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5DboQG35Wnbme+vu2GzT8Sr2q49b+BE2rknnKDhVsEM=;
        b=zK7jOqm/wdEOqVzoeIX7BU7Y20xxGRF7iBQ0UuRS41W/g14m1kPSCCKCJYGkYtdAjV
         Dg7FenXmcWlMGQI+6QzNjVrfAzD2Yo/MUx87Nekgy35a1NmbnAbR9nvtBahVS1t8cthh
         9dgBv771dTwiWndGOzj9B+K/heJkZ1cPq1zPOUUXFfACQAW+nc2eI6pW9TGbQEI+9g3Q
         SNv8//BjhU0M0oFYMYwikHTkPhrlqy1BejB5X0sd130wf3o9l7Xb3YAEitFmt9otjseC
         fSEspM3ooG9sSFrB0fwv8fxwmCzsadI6ogTUm7iQQorUN/RHdDisUe+d6sPM0dN7f35o
         9gow==
X-Forwarded-Encrypted: i=1; AL+hErGdl4jsjMMcYlJnklRNQcYeHYlzsAA7OyqzKu1D5trWcU3QkH7VQXHMB067FjXV2Rv+Wvvt3Fy1HraY7BQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+i+Rlz6OXM9X8ET8LWhTDk8+nXB/0MEAZfSQHGDLgvzRgpyhld
	b5kkkXCQXmc5cXDXojoWbl/6CQsyqkrS65EeEilLzqmiPFvsEPozpZSOXMum0jczpJcFw8SCM4M
	6E84hE4PKBg==
X-Received: from oabmp13.prod.google.com ([2002:a05:6870:e0d:b0:4ad:bdb3:7d44])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6820:338e:10b0:71a:e62f:62ee
 with SMTP id 006d021491bc7-71b1843fdc0mr997029eaf.23.1794988524703; Tue, 17
 Nov 2026 23:55:24 -0800 (PST)
Date: Tue, 17 Nov 2026 23:55:13 -0800
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
Message-ID: <20261118075516.1278903-3-irogers@google.com>
Subject: [PATCH v1 2/4] perf stat: Don't corrupt zero or prev_raw_counts on
 skipped per-pkg CPUs
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In process_counter_values(), when check_per_pkg() sets skip = true for a
secondary CPU in an already-counted package/die, count was pointed at a
local 'static struct perf_counts_values zero' before calling
evsel__compute_deltas().

evsel__compute_deltas() saves *count into evsel->prev_raw_counts and
subtracts the previous interval's raw counts from *count in place. If a
CPU had non-zero counts in an earlier interval and is later skipped,
subtracting tmp from zero underflows the static zero struct in place
(corrupting all subsequent skipped CPUs for the remainder of the perf
stat run) and overwrites prev_raw_counts for that CPU with zeros.

Make zero a zero-initialized stack variable, compute interval deltas on
the real CPU counter values first so prev_raw_counts stays accurate, and
only substitute &zero afterwards when skipping aggregation.

Fixes: 779d0b997e07 ("perf stat: Add support for per-pkg counters")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/stat.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/perf/util/stat.c b/tools/perf/util/stat.c
index 6da3dbb..267e280 100644
--- a/tools/perf/util/stat.c
+++ b/tools/perf/util/stat.c
@@ -398,7 +398,7 @@ process_counter_values(struct perf_stat_config *config, struct evsel *evsel,
 		       struct perf_counts_values *count)
 {
 	struct perf_stat_evsel *ps = evsel->stats;
-	static struct perf_counts_values zero;
+	struct perf_counts_values zero = {};
 	bool skip = false;
 
 	if (check_per_pkg(evsel, count, cpu_map_idx, &skip)) {
@@ -406,12 +406,12 @@ process_counter_values(struct perf_stat_config *config, struct evsel *evsel,
 		return -1;
 	}
 
-	if (skip)
-		count = &zero;
-
 	if (!evsel->snapshot)
 		evsel__compute_deltas(evsel, cpu_map_idx, thread, count);
-	perf_counts_values__scale(count, config->scale, NULL);
+	if (skip)
+		count = &zero;
+	else
+		perf_counts_values__scale(count, config->scale, NULL);
 
 	if (config->aggr_mode == AGGR_THREAD) {
 		struct perf_counts_values *aggr_counts = &ps->aggr[thread].counts;
-- 
2.56.1.703.gf848ed807c-goog

