Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795418396;
	b=Mch0CMN1GfoJgRpF01mNLydb6KL8/WhUJ0hooU5r2Tfy0VXRIpbIcBgjcVBpujXgHRe2
	 Z9hUag8UQfuOCKE30HfxjvyNEuhpXwTBycWCQ9M3m8MlAEeDiSNK9a7N96WHPk6/1b2Lb
	 63ybGiAUkP673cwI5KbYSxBPKGjw8kbRXRh49s3dZMYsN9Sdo5obIatwJj+ZUVDj3xE4E
	 AoWQPPv3BGttdUrXDsGGM+0Iy7Qrjp3pcWu9VW0+LjjNWWGqdFJ7I3wHwbcLMRKjuH3KF
	 SIZbJUmBtn1bWsUuSbOuVwaCr+KrVdIBPDknfszgUknxH9ASJ5yGz93ASyVxiJvlT5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795418396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=yR0Cn8qSGWXI+eqarTOysMEcgExUMTEHpNE5KEC2kI4=;
	b=AY9yNfX50RwN/jOWVoiKC0DqQmNwV0m7BlQ7YiO8xahNNV1724RgHLvnvSOHH4DaeohS
	 5af8xAkl8d5rumh5KR3FL5U9wyL2tFnm+hRp8vsjV2/cZ38qZvwZsB+Z2Gq0xwswyPTAI
	 AFs368t/Waw4GC5RWk7l/YnJ8zAmRHthPGWEuI5GRAVqeAAFE0KTPaYI6buE3dUFZSFHh
	 zPRb1JMqROBjLBtpldUSBRRvLunsnQV5BudiFJ3kzjl/0GyU13FKIjmHGX2Lyq8DxI8I5
	 TVtCwojsHdXyddSzSYOKC1vZbVUsR5iko5fhmpGHvjUD7kNLlF2rVCoq1rbphZ1ofdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XALQBGpL;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C90606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:19:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69C90606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XALQBGpL
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b18165dc53so3479681a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 23:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795418396; x=1796023196; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yR0Cn8qSGWXI+eqarTOysMEcgExUMTEHpNE5KEC2kI4=;
        b=XALQBGpLfgHGrv5dwy+uCQQL0sTFiCl4xb1v3MmAaZOtSTi+AryB++T8bxnNAwB2Kr
         S2MBp0iIZYgn9FKPso1fI43/NpKonT0LSk7uHuMYFFpDEsfkAYCsFiiwQfVf6dvgKpJB
         qYuNqoErB4ivhia+n4dP33gj1OW7e9XubZGZAx82dkJBQ3PIC48POTppAOOAhCj4JbNC
         kTYSdiv93PnailRsrUk4q2OY7T6srWltSYRXzig0GcZnwAOQAbDnVJ3blIOGu4lExDCu
         ySi/DVz/lAqxu7QNLPUi+Ut6YAfH2tJKpegwo0wlxsl7Be50E4td33nHBNtEHzHvCVhe
         6whQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795418396; x=1796023196;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yR0Cn8qSGWXI+eqarTOysMEcgExUMTEHpNE5KEC2kI4=;
        b=dLRH9XUvMGEEJ+TlVR5DJOcifC9MATeBWxD+2dTf5Kq6F0BI0upp2bPTBIaQ94Bwgr
         lXZz+gdoL5kSYQ/V1kJF2AVXCQrXRD74QyAP4xaQP0KaxrEF4fZ1h3B+sLmaD23ycc8e
         PVwZsNgzlsQNAuo9oJSMNedt/P6GYxzNmPag3TdwrgPDB2fGioiPNFroP1bF+iGWtpzj
         P9BuOoeGBCWMQGMYZZx+LwVtvaJORwpf3RF+FcdPjPgzFL4/g1Vlu/bpiBVGL26EyJZq
         be4ihzglIgyCIZxYc1Jr/P+dv8MeU4B3356TDiCpy1VIgj+xMjLfsHV1ePLM1sPk6Q3O
         J91w==
X-Forwarded-Encrypted: i=1; AL+hErH6TFL0UoNu1RsU4RSnbVchN7FH1C4G6KPOVF9U7hVlh+qh0JXZYuu2OMpQYHixxoOt2IxSfAJZU/ZZ850=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CjUsziCSHueCyKtJjrQg0fTL5nIii9Z+atJTtfo+R/VaKENwW
	EPXlK9EXhUCaIOay9KF6J0R206g4t8wwRl0mMiISexKH9pB6LfAfqDe89WLWzl04cQtuWGUpMzi
	62+O6fTL3Xg==
X-Received: from pgig3.prod.google.com ([2002:a63:f403:0:b0:cc7:ad09:94b6])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3d8d:b0:3b3:b704:118c
 with SMTP id 98e67ed59e1d1-3b41cb4f321mr9578228a91.65.1795418395412; Sun, 22
 Nov 2026 23:19:55 -0800 (PST)
Date: Sun, 22 Nov 2026 23:19:07 -0800
In-Reply-To: <20261123071913.653315-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261123071913.653315-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261123071913.653315-8-irogers@google.com>
Subject: [PATCH v1 07/13] perf evlist: Enable tool PMU events when starting a workload
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>
Cc: Howard Chu <howardchu95@gmail.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Song Liu <songliubraving@fb.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When perf stat runs a workload, group leaders are opened disabled with
enable_on_exec set so that the kernel enables them when the workload
execs. Since tool PMU events were made to respect enable/disable they
are opened disabled too, but there is no kernel event to be enabled on
exec, so they are never enabled and count 0. For example:

  $ perf stat -e duration_time,user_time,task-clock -- perf test -w noploop
                 0      duration_time
                 0      user_time
          1,013.74 msec task-clock

Enable tool PMU events that are set to enable on exec when the workload
is started.

Fixes: 0b18bced5444 ("perf tool_pmu: Make tool PMU events respect enable/disable")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/evlist.c | 15 +++++++++++++++
 tools/perf/util/evsel.c  | 14 ++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/tools/perf/util/evlist.c b/tools/perf/util/evlist.c
index c2402e4791b6..ec26064183b6 100644
--- a/tools/perf/util/evlist.c
+++ b/tools/perf/util/evlist.c
@@ -69,6 +69,7 @@
 #include "string2.h"
 #include "target.h"
 #include "thread_map.h"
+#include "tool_pmu.h"
 #include "units.h"
 #include "util.h"
 
@@ -1909,6 +1910,20 @@ int evlist__start_workload(struct evlist *evlist)
 	if (evlist__workload_cork_fd(evlist) >= 0) {
 		char bf = 0;
 		int ret;
+		struct evsel *pos;
+
+		/*
+		 * Tool PMU events aren't opened with perf_event_open and so
+		 * aren't enabled by the kernel on exec. Enable them as the
+		 * workload is started.
+		 */
+		evlist__for_each_entry(evlist, pos) {
+			if (evsel__is_tool(pos) &&
+			    (pos->core.attr.enable_on_exec ||
+			     evsel__leader(pos)->core.attr.enable_on_exec) &&
+			    pos->core.fd && pos->supported)
+				evsel__enable(pos);
+		}
 		/*
 		 * Remove the cork, let it rip!
 		 */
diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
index babeccfbecb5..d89087e295dc 100644
--- a/tools/perf/util/evsel.c
+++ b/tools/perf/util/evsel.c
@@ -1914,6 +1914,8 @@ int evsel__enable_cpu(struct evsel *evsel, int cpu_map_idx)
 		struct evsel *member;
 
 		for_each_group_member(member, evsel) {
+			if (!member->core.fd)
+				continue;
 			if (evsel__is_non_perf_event_open_pmu(evsel) ||
 			    evsel__is_non_perf_event_open_pmu(member)) {
 				/*
@@ -1969,6 +1971,11 @@ int evsel__enable(struct evsel *evsel)
 		struct evsel *member;
 
 		for_each_group_member(member, evsel) {
+			if (!member->core.fd) {
+				if (evsel__is_retire_lat(member))
+					member->disabled = false;
+				continue;
+			}
 			if (evsel__is_non_perf_event_open_pmu(evsel) ||
 			    evsel__is_non_perf_event_open_pmu(member)) {
 				/*
@@ -2004,6 +2011,8 @@ int evsel__disable_cpu(struct evsel *evsel, int cpu_map_idx)
 		struct evsel *member;
 
 		for_each_group_member(member, evsel) {
+			if (!member->core.fd)
+				continue;
 			if (evsel__is_non_perf_event_open_pmu(evsel) ||
 			    evsel__is_non_perf_event_open_pmu(member)) {
 				/*
@@ -2065,6 +2074,11 @@ int evsel__disable(struct evsel *evsel)
 		struct evsel *member;
 
 		for_each_group_member(member, evsel) {
+			if (!member->core.fd) {
+				if (evsel__is_retire_lat(member))
+					member->disabled = true;
+				continue;
+			}
 			if (evsel__is_non_perf_event_open_pmu(evsel) ||
 			    evsel__is_non_perf_event_open_pmu(member)) {
 				/*
-- 
2.56.1.750.gf70dc682cf-goog

