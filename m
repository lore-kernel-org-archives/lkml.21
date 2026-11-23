Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795418390;
	b=10xfDR/WnLmezUL+EVGMNQ/TUwPNVds+TWxMme/cFLunB9767V/Nif6jLP/9/wv480kD
	 nvXNKnxR6LI3d+57HQjf9wWqQFOBx026YwaEZDpfAvojUs7XrXP2DpE5Gzz6ykRUv3qum
	 OsDqG5m8I69q4h1twBSn56TK1ZMudBEvykL2fFde8HdSt3W1oc5Y3AlXSaEl2UrDpZXks
	 3HwzAf3xYJ710UjKhdZVeaknoBFdgjhSPz3UJh/iJuRiWra/BQWK4VLVJ7MMZX3DOEcYB
	 6a2ZTpRFdkHy+2nG09l/WYrucAzNG9lKbjjJHGFYt9HidOQFhaiqgvZ8gd+9tGwvZxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795418390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=YodIznWGmX5HPtvn02byN4wNfgJjvly3P8NRcax/huo=;
	b=Vb9E0ZCiHcKyiEntAWWJTeg7qAf8RZId/gN7pqAeMYQ1mRUBw5Ot2PaNzXj6ZTvoRDZg
	 ODLaAVW5eWfiHtXkr0Wr4QmRigLDvJPT0bUZL+CINd7h9mdtcnuaRYvKiLTN3iFz0lf3E
	 9gQpnZb4xCltNS6KC64b94AqAjNhFFoHFruJPN4USGzczJs3wI9r4HCO3sgHaX0+veZlI
	 mdUITB6izxgNBzN2qKAv8vN/kCsX8d+6Zrg1BaVF0XZi3kVsHQ96gAiowARrpnOx7+KaU
	 3Uz3c6PLyXLYoINN10mbXBK/Vr7UOzJnzJ0w+6W9Y7oyGYx0MCOn7GuKBK+WKWsF14A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lYqEMEpz;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D07D606A327
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:19:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D07D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lYqEMEpz
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso3384918eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 23:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795418389; x=1796023189; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YodIznWGmX5HPtvn02byN4wNfgJjvly3P8NRcax/huo=;
        b=lYqEMEpzNV7pV8uPb5bqdA48c0j8ya0I4q9fdSus6fOrOwmj94B3EeFjtSSLeAVqxQ
         xFth1nCTuaa/Q0dnvRhTPHNq4dfcxxmxtIwe9a5WZc83yQ2DRHnLxTjuhgJ7rlZQ3A+p
         PlmeeV2lunO+gW6T3GYVLQIaY4cX1p/u6Fz67HJMq2/AKbJPJxJ51xw9TGVQi2sVLql7
         aOdzeOPO34+2R1yqi+5GhWM+Kzpn1OgpFsfdfxMY3W21gDp/p8+isAwBPMsXB3PH54AO
         ojrMoUzemMVxoJSiKw66iARaNSnFOk4g3xipaD6VXhnoOWYRfM+NKA47K+mFvPpReAex
         ysLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795418389; x=1796023189;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YodIznWGmX5HPtvn02byN4wNfgJjvly3P8NRcax/huo=;
        b=O7p4OVKmNo/GM0CPDY6xWKMwG2cp2d2iSIujgA3vIqpdG9id82f3sLVwldu5n6KshJ
         3P4LRwiOLhxZUrT6qzNIiZGWwO9dBR5/Qs9PrMkNrFgb1KznLVPVZf/RtDiX3O8m9sdu
         3vCOAmfJ9h6nLlT2a9XkJT6FMlVKmQMRmgbW5O51Ifyu5zx3HGkixtXrSr73yGjabrGw
         qc37w2UzRjYYCOF9yF3CFNSbO51xmeb9uvbqybxRAHRNLjqoYOX4SDLFhtuuX/7GZRMB
         jIBCUSVmhyv/MF4oJBIX9vf5Pv2s7WBsPs553VbuGHD8RLW3+jAyfqNQxyCPsjmJKthr
         gFHA==
X-Forwarded-Encrypted: i=1; AL+hErHClTkU5ca0q/C9GaHEh0eYdwtLsUF3zr2FSUeFq4JOaA6EaFWeLQjhxC+KHFyyoixg4CKzAT5emdLfP4o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8N0AwOf5ExKBS2TWw22LS2B0sqwx0Qd22tZtkYNaB98IE16UDg
	2TGEjZAhpZkrAOsrskl79N40Tq1w43swV9eSBEG0RpAJiJC9ZzCtCZlYdnkGhbO1tpoOSqe8hI6
	+SvyGbsgroQ==
X-Received: from dycue7.prod.google.com ([2002:a05:7300:87:b0:386:46f:406])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:88cd:20b0:386:a16d:1bce
 with SMTP id 5a478bee46e88-386a16d1cb0mr5714521eec.36.1795418389048; Sun, 22
 Nov 2026 23:19:49 -0800 (PST)
Date: Sun, 22 Nov 2026 23:19:06 -0800
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
Message-ID: <20261123071913.653315-7-irogers@google.com>
Subject: [PATCH v1 06/13] perf pmu: Don't treat tool PMU as a kernel software
 PMU for event grouping
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>
Cc: Howard Chu <howardchu95@gmail.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Song Liu <songliubraving@fb.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

perf_pmu__is_software() identifies kernel software PMUs (such as
PERF_TYPE_SOFTWARE, PERF_TYPE_TRACEPOINT, and PERF_TYPE_BREAKPOINT) whose
events can share a perf_event_open() group_fd with a hardware PMU event.
Userspace-implemented PMUs like the tool, hwmon, and drm PMUs do not open
perf_event file descriptors (leaving FD(leader, ...) == -1), so keeping a
userspace PMU event grouped with a kernel PMU event hits BUG_ON(fd == -1
&& leader->supported) in get_group_fd() (e.g. '{duration_time,cycles}' or
'{duration_time,task-clock}') or fails in evsel__read_group() (e.g.
'{cycles,duration_time}' or '{task-clock,duration_time}').

Return false for PERF_PMU_TYPE_TOOL in perf_pmu__is_software(), matching
hwmon and drm PMUs, and ensure evsel__compute_group_pmu_name() only
substitutes perf_event_open PMU names for software and AUX events so
'{duration_time,task-clock}' does not adopt the tool PMU's group name
while preserving same-PMU userspace groups such as '{hwmon_a/e1/,
hwmon_a/e2/}' and '{duration_time,user_time}'. Also check the group
leader's attr.disabled in evsel__tool_pmu_open() and guard get_group_fd()
and evsel__group_read_nr_members() against non-perf_event_open PMUs.

Fixes: 240505b2d0ad ("perf tool_pmu: Factor tool events into their own PMU")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-stat.c      |  7 +++-
 tools/perf/util/evsel.c        | 76 +++++++++++++++++++++++++++-------
 tools/perf/util/parse-events.c | 24 +++++++----
 tools/perf/util/pmu.c          |  2 +-
 tools/perf/util/tool_pmu.c     |  6 ++-
 5 files changed, 87 insertions(+), 28 deletions(-)

diff --git a/tools/perf/builtin-stat.c b/tools/perf/builtin-stat.c
index 37752d6bfef4..4fe4da20aae8 100644
--- a/tools/perf/builtin-stat.c
+++ b/tools/perf/builtin-stat.c
@@ -721,7 +721,9 @@ static int create_perf_stat_counter(struct evsel *evsel,
 	 * the group read (for leader) and ID retrieval for all
 	 * members.
 	 */
-	if (leader->core.nr_members > 1)
+	if (leader->core.nr_members > 1 &&
+	    !evsel__is_non_perf_event_open_pmu(leader) &&
+	    !evsel__is_non_perf_event_open_pmu(evsel))
 		attr->read_format |= PERF_FORMAT_ID|PERF_FORMAT_GROUP;
 
 	attr->inherit = !config->no_inherit && list_empty(&evsel->bpf_counter_list);
@@ -750,7 +752,8 @@ static int create_perf_stat_counter(struct evsel *evsel,
 	 * either manually by us or by kernel via enable_on_exec
 	 * set later.
 	 */
-	if (evsel__is_group_leader(evsel)) {
+	if (evsel__is_group_leader(evsel) ||
+	    evsel__is_non_perf_event_open_pmu(leader)) {
 		attr->disabled = 1;
 
 		if (target__enable_on_exec(&target))
diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
index 64daef4cc345..babeccfbecb5 100644
--- a/tools/perf/util/evsel.c
+++ b/tools/perf/util/evsel.c
@@ -430,7 +430,8 @@ void evsel__set_sample_id(struct evsel *evsel,
 
 bool evsel__is_non_perf_event_open_pmu(const struct evsel *evsel)
 {
-	return evsel->pmu && evsel->pmu->type > PERF_PMU_TYPE_PE_END;
+	return evsel->pmu && evsel->pmu->type > PERF_PMU_TYPE_PE_END &&
+	       !perf_pmu__is_fake(evsel->pmu);
 }
 
 /**
@@ -1916,13 +1917,33 @@ int evsel__enable_cpu(struct evsel *evsel, int cpu_map_idx)
 			if (evsel__is_non_perf_event_open_pmu(evsel) ||
 			    evsel__is_non_perf_event_open_pmu(member)) {
 				/*
-				 * In a mixed PMU group, userspace PMUs are not
-				 * grouped in the kernel (opened with group_fd = -1)
-				 * and are skipped by the kernel when enabling the
-				 * group leader. We must manually enable them in
-				 * userspace.
+				 * Userspace PMUs are not grouped in the kernel
+				 * (opened with group_fd = -1) and may have
+				 * different CPU maps (e.g. duration_time sets
+				 * reads_only_on_cpu_idx0 while user_time has
+				 * all CPUs). Enable matching member CPUs.
 				 */
-				int mem_err = evsel__enable_cpu(member, cpu_map_idx);
+				int mem_err = 0;
+
+				if (evsel->core.reads_only_on_cpu_idx0) {
+					if (cpu_map_idx == 0) {
+						int nr = perf_cpu_map__nr(member->core.cpus);
+
+						for (int m = 0; m < nr && !mem_err; m++)
+							mem_err = evsel__enable_cpu(member, m);
+					}
+				} else if (member->core.reads_only_on_cpu_idx0) {
+					if (cpu_map_idx == 0 &&
+					    perf_cpu_map__nr(member->core.cpus) > 0)
+						mem_err = evsel__enable_cpu(member, 0);
+				} else {
+					struct perf_cpu cpu = perf_cpu_map__cpu(evsel->core.cpus,
+										cpu_map_idx);
+					int mem_idx = perf_cpu_map__idx(member->core.cpus, cpu);
+
+					if (mem_idx >= 0)
+						mem_err = evsel__enable_cpu(member, mem_idx);
+				}
 
 				if (mem_err)
 					return mem_err;
@@ -1986,12 +2007,33 @@ int evsel__disable_cpu(struct evsel *evsel, int cpu_map_idx)
 			if (evsel__is_non_perf_event_open_pmu(evsel) ||
 			    evsel__is_non_perf_event_open_pmu(member)) {
 				/*
-				 * In a mixed PMU group, userspace PMUs are not
-				 * grouped in the kernel and are skipped by the
-				 * kernel when disabling the group leader. We must
-				 * manually disable them in userspace.
+				 * Userspace PMUs are not grouped in the kernel
+				 * and may have different CPU maps (e.g.
+				 * duration_time sets reads_only_on_cpu_idx0
+				 * while user_time has all CPUs). Disable
+				 * matching member CPUs.
 				 */
-				int mem_err = evsel__disable_cpu(member, cpu_map_idx);
+				int mem_err = 0;
+
+				if (evsel->core.reads_only_on_cpu_idx0) {
+					if (cpu_map_idx == 0) {
+						int nr = perf_cpu_map__nr(member->core.cpus);
+
+						for (int m = 0; m < nr && !mem_err; m++)
+							mem_err = evsel__disable_cpu(member, m);
+					}
+				} else if (member->core.reads_only_on_cpu_idx0) {
+					if (cpu_map_idx == 0 &&
+					    perf_cpu_map__nr(member->core.cpus) > 0)
+						mem_err = evsel__disable_cpu(member, 0);
+				} else {
+					struct perf_cpu cpu = perf_cpu_map__cpu(evsel->core.cpus,
+										cpu_map_idx);
+					int mem_idx = perf_cpu_map__idx(member->core.cpus, cpu);
+
+					if (mem_idx >= 0)
+						mem_err = evsel__disable_cpu(member, mem_idx);
+				}
 
 				if (mem_err)
 					return mem_err;
@@ -2167,7 +2209,8 @@ static bool evsel__group_has_tpebs(struct evsel *leader)
 	struct evsel *evsel;
 
 	for_each_group_evsel(evsel, leader) {
-		if (evsel__is_retire_lat(evsel))
+		if (evsel__is_retire_lat(evsel) ||
+		    evsel__is_non_perf_event_open_pmu(evsel))
 			return true;
 	}
 	return false;
@@ -2179,7 +2222,8 @@ static u64 evsel__group_read_nr_members(struct evsel *leader)
 	struct evsel *evsel;
 
 	for_each_group_evsel(evsel, leader) {
-		if (evsel__is_retire_lat(evsel))
+		if (evsel__is_retire_lat(evsel) ||
+		    evsel__is_non_perf_event_open_pmu(evsel))
 			nr--;
 	}
 	return nr;
@@ -2367,7 +2411,9 @@ static int get_group_fd(struct evsel *evsel, int cpu_map_idx, int thread)
 	struct evsel *leader = evsel__leader(evsel);
 	int fd;
 
-	if (!evsel->supported || evsel__is_group_leader(evsel))
+	if (!evsel->supported || evsel__is_group_leader(evsel) ||
+	    evsel__is_non_perf_event_open_pmu(leader) ||
+	    evsel__is_non_perf_event_open_pmu(evsel))
 		return -1;
 
 	/*
diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
index ca13fcc05db0..ba3e5015058c 100644
--- a/tools/perf/util/parse-events.c
+++ b/tools/perf/util/parse-events.c
@@ -2027,13 +2027,17 @@ static int evsel__compute_group_pmu_name(struct evsel *evsel,
 	group_pmu_name = pmu->name;
 	/*
 	 * Software events may be in a group with other uncore PMU events. Use
-	 * the pmu_name of the first non-software event to avoid breaking the
-	 * software event out of the group.
+	 * the pmu_name of the first non-software perf_event_open PMU event to
+	 * avoid breaking the software event out of the group. Userspace PMUs
+	 * (tool, hwmon, drm, bpf) do not open perf_event file descriptors and
+	 * cannot share a kernel group_fd.
 	 *
 	 * Aux event leaders, like intel_pt, expect a group with events from
 	 * other PMUs, so substitute the AUX event's PMU in this case.
 	 */
-	if (perf_pmu__is_software(pmu) || evsel__is_aux_event(leader)) {
+	if ((perf_pmu__kind(pmu) == PERF_PMU_KIND_PE ||
+	     perf_pmu__kind(pmu) == PERF_PMU_KIND_FAKE) &&
+	    (perf_pmu__is_software(pmu) || evsel__is_aux_event(leader))) {
 		struct perf_pmu *leader_pmu = evsel__find_pmu(leader);
 
 		if (!leader_pmu) {
@@ -2042,11 +2046,13 @@ static int evsel__compute_group_pmu_name(struct evsel *evsel,
 		}
 		/*
 		 * Starting with the leader, find the first event with a named
-		 * non-software PMU. for_each_group_(member|evsel) isn't used as
-		 * the list isn't yet sorted putting evsel's in the same group
-		 * together.
+		 * non-software perf_event_open PMU. for_each_group_(member|evsel)
+		 * isn't used as the list isn't yet sorted putting evsel's in
+		 * the same group together.
 		 */
-		if (leader_pmu && !perf_pmu__is_software(leader_pmu)) {
+		if (leader_pmu && !perf_pmu__is_software(leader_pmu) &&
+		    (perf_pmu__kind(leader_pmu) == PERF_PMU_KIND_PE ||
+		     perf_pmu__kind(leader_pmu) == PERF_PMU_KIND_FAKE)) {
 			group_pmu_name = leader_pmu->name;
 		} else if (leader->core.nr_members > 1) {
 			list_for_each_entry(pos, head, core.node) {
@@ -2059,7 +2065,9 @@ static int evsel__compute_group_pmu_name(struct evsel *evsel,
 					/* As with determining pmu above. */
 					pos_pmu = perf_pmus__scan_core(NULL);
 				}
-				if (pos_pmu && !perf_pmu__is_software(pos_pmu)) {
+				if (pos_pmu && !perf_pmu__is_software(pos_pmu) &&
+				    (perf_pmu__kind(pos_pmu) == PERF_PMU_KIND_PE ||
+				     perf_pmu__kind(pos_pmu) == PERF_PMU_KIND_FAKE)) {
 					group_pmu_name = pos_pmu->name;
 					break;
 				}
diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index 1ae8bcf71c68..ab91dac5d226 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -2461,7 +2461,7 @@ bool perf_pmu__is_software(const struct perf_pmu *pmu)
 	case PERF_TYPE_HW_CACHE:	return false;
 	case PERF_TYPE_RAW:		return false;
 	case PERF_TYPE_BREAKPOINT:	return true;
-	case PERF_PMU_TYPE_TOOL:	return true;
+	case PERF_PMU_TYPE_TOOL:	return false;
 	default: break;
 	}
 	for (size_t i = 0; i < ARRAY_SIZE(known_sw_pmus); i++) {
diff --git a/tools/perf/util/tool_pmu.c b/tools/perf/util/tool_pmu.c
index d2f7591747d9..a62a7cb390ae 100644
--- a/tools/perf/util/tool_pmu.c
+++ b/tools/perf/util/tool_pmu.c
@@ -272,7 +272,8 @@ int evsel__tool_pmu_open(struct evsel *evsel,
 		if (evsel->core.attr.sample_period) /* no sampling */
 			return -EINVAL;
 		evsel->duration_time.accumulated_time = 0;
-		if (evsel->core.attr.disabled) {
+		if (evsel->core.attr.disabled ||
+		    evsel__leader(evsel)->core.attr.disabled) {
 			evsel->disabled = true;
 			evsel->duration_time.start_time = INVALID_START_TIME;
 		} else {
@@ -321,7 +322,8 @@ int evsel__tool_pmu_open(struct evsel *evsel,
 					evsel->process_time.accumulated_times, idx, thread);
 				*accumulated_time = 0;
 
-				if (evsel->core.attr.disabled) {
+				if (evsel->core.attr.disabled ||
+				    evsel__leader(evsel)->core.attr.disabled) {
 					evsel->disabled = true;
 					*start_time = INVALID_START_TIME;
 				} else {
-- 
2.56.1.750.gf70dc682cf-goog

