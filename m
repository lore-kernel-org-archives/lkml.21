Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795418364;
	b=prnm6PhXM8H6QjRPbuYL0EtuQHHCsSG4eou0DrJohCMBw1IWJ85RhxvA8gGa9HNwxCxZ
	 +R56p7cRsPju/9lZKk2jM5wFnATfLFIUulINwrILBfKWIyZIarsW/j6WwjgujUShIBWpM
	 JcQuFlmTlfDAXPzt9iFOPMOGwWetzuge0z9R3on9ezb54F4sVdsTlzQC3Wc9Wg3bUumjF
	 zqpFn2qyYBlNhqJJCOJuF502qp2kn1mHJZ0QPOyrZGD31JDGqucg/E1VFWo7FZf+HEIYy
	 HV5cDzK1dEUwUXmMjHuBposM/GqjKvXgjT3n+vsABFJQWMVE6QTbM1wdPYj17/JLp0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795418364;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=InT91oisEFmdndrqcS8mrchaCKx4oa3ZvByTCs2ke2Y=;
	b=HNoby8xpsqRAzetTS31VYUGBT/pXn9uuowjUIh7l3LpZaSWfOlW7ZLI5PPchPhihUJ1J
	 QJ8gzrv6Ke/SPucrb1UuNMdWl6FFXXqoxo2ToRcTVco2+qb0jUq65Mu9LE27oFrQQhe3Z
	 N2KZ05yFnivR/LMTogwWKEwg23IIJgf8G0MKFUA1rniyRKhmkX4mb6Id3ZFhM6pHoAaMs
	 QgrXyyJzn66vkGLB8E47aTdRZnGYq0kldN+iDgZrxyHka0BayOPsSZJ/E0x23Hg7hZLcI
	 O4zYlkfWg+rnp0rohnJjekQO9llXYcbaXBe2ETX6cbXVccEYmkNnd3JI24N5aI8vHAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=O6m2OMtp;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D608606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:19:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D608606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=O6m2OMtp
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4ab8b4887d4so2107776b6e.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 23:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795418363; x=1796023163; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=InT91oisEFmdndrqcS8mrchaCKx4oa3ZvByTCs2ke2Y=;
        b=O6m2OMtpz7fQsxr4ivwMxIwnMaMjXc3+cgVm7Kr5GhOSUlPIg8EfxlAxO67Ar4sqtn
         tMemnwowyVy2m1+6yaETzMXk18BMvEYnF8GnsuDtElGc95dirPeB9GgmUHBV1Jf27II+
         s1+/XkNUeoqWz31JDImy29hYQomOdptctCfzgxEiOLPkCpYDTYeDbz2BbOQuFMqPvSh7
         cY/04Rw96I7SUWfI04yE20lnfHQ690xntjfAfK9Cre9Jf58hKLYscUgxBght6K1Xd9Iy
         wiUxU1XhIq9PNzyWAqt7sUwP8qBtl8cns4ZFi5o/2F5CuTI2nEwY1vM6wRjoKUjRg8AC
         cb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795418363; x=1796023163;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=InT91oisEFmdndrqcS8mrchaCKx4oa3ZvByTCs2ke2Y=;
        b=IKhARuopK87tmXEg+qB44Gxba1J2TCY/PXESv2VNmLnu7pj+klVbbxagnSA1TO6Phn
         mrhZraWt4MqlW2qNp/N4+FE1U3A9zNZ7ZPk1d+j9y67P+2hjwSMz87dpEJlg/jMmi/7u
         cCrLH1e0ZIMcyKhf9P970tgVi2zu/Yi/4bt9qOtdrmnGRvHlO7X6RNdwRyuzCGAFXc20
         JnKVPTXf0RKRKZ/iY+mafEtuNEZD82bCDQz+Axg0vxWPywCxXPLKeTiCh1Gr5bEnKtzp
         0Fzqi8Hnq/+Tv7abJ7VHnnmpX00coFazWyYrs40NYGPC0Up/1f98Cgn/Kkh0Z/mXQ+iW
         9oUg==
X-Forwarded-Encrypted: i=1; AL+hErFEuD8+E/zlycXjKnlesdpeiYYHz/ylI+nvpWeBbEBbDFGIGgM2ct5eTaVcpNpkgrfUGYqV3PSkhSVypMk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NpwTHhUHW8npi+/v3By62NV0Mv7bUHEonk+Q0iqOeiop6Eem0
	boYt7CJin9e5FtG63eQWXi5VxyhAlWFSAmv7HYKoVoxw8WnAkeBn76r07cxKb2p/HPTp7jAYuYb
	Ne5oW3NCxsA==
X-Received: from oapa41.prod.google.com ([2002:a05:6870:46a9:b0:494:a4d4:8e0b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:1384:b0:4ce:a4fc:a848
 with SMTP id 5614622812f47-57a06a0da3amr13118058b6e.6.1795418362986; Sun, 22
 Nov 2026 23:19:22 -0800 (PST)
Date: Sun, 22 Nov 2026 23:19:00 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261123071913.653315-1-irogers@google.com>
Subject: [PATCH v1 00/13] perf fixes: off-cpu, stat, tool PMU, bperf, and
 bpf-filter fixes
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>
Cc: Howard Chu <howardchu95@gmail.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Song Liu <songliubraving@fb.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This series collects standalone bug fixes across perf off-cpu, libperf
evlist, perf stat, the tool PMU, bperf (--bpf-counters), and perf
bpf-filter:

1. 'perf off-cpu' fixes (patches 1-2):
   - Zero the stack trace buffer before lookup and bound callchain
     length by MAX_STACKS in off_cpu_write() so full 32-frame stacks do
     not read and write past off_cpu_raw.
   - Fix swapped PID and TID packing in direct off_cpu_dump() BPF
     samples so multi-threaded direct off-CPU samples match
     off_cpu_write() and __set_offcpu_sample().

2. 'libperf', 'perf stat', 'tool' PMU, and '--bpf-counters' fixes
   (patches 3-9):
   - Drop any existing per-evsel CPU map and re-propagate all evsels in
     perf_evlist__go_system_wide() so evlist->all_cpus is rebuilt
     without retaining the "any CPU" (-1) placeholder.
   - Assign unique synthetic IDs to non-perf_event_open events (tool,
     hwmon, drm, retire_lat) for 'perf stat record' so counts are not
     all attributed to ID 0.
   - Serialize and restore per-evsel 'cpus' (rather than 'pmu_cpus')
     across 'perf stat record' and 'perf stat report', retaining
     backward compatibility for older perf.data files.
   - Return false for PERF_PMU_TYPE_TOOL in perf_pmu__is_software() and
     guard group leader handling so grouping tool PMU events with kernel
     PMU events does not hit BUG_ON() in get_group_fd() or fail in
     evsel__read_group().
   - Enable enable_on_exec tool PMU events in evlist__start_workload()
     so workload runs do not report 0 for duration_time, user_time, or
     system_time.
   - Compute enabled time in the wait4 rusage fallback for exited
     user_time and system_time events (e.g. with -D delay).
   - Restrict bperf (--bpf-counters / :b) to compatible counters and fix
     mixed, hybrid, cgroup, and repeat (-r) counter lifecycle bugs.

3. 'perf bpf-filter' and tracepoint filter fixes (patches 10-13):
   - Attach unpinned BPF sample filters via PERF_EVENT_IOC_SET_BPF
     instead of bpf_program__attach_perf_event_opts() to fix the
     bpf_link memory/FD leak reported by LeakSanitizer.
   - Deep-copy evsel->bpf_filters in evsel__clone() (fixing
     --for-each-cgroup) and release runtime BPF filter state in
     evsel__close() (fixing 'perf stat -r' repeat runs).
   - Add SEC("tracepoint") perf_tp_sample_filter for
     PERF_TYPE_TRACEPOINT events (with !CONFIG_CGROUPS CO-RE guards and
     selective pinning) so context-independent BPF filter terms (uid,
     gid, tid, pid, cpu, time, cgroup) do not fail with -EINVAL.
   - Route tracepoint --filter strings to BPF filters only when
     referencing non-field BPF terms (with tracefs format fallback when
     built with NO_LIBTRACEEVENT=1) and reject ambiguous mixed filters.

Notes on prior postings:
- Patch 3 was previously posted unchanged as patch 4/4 in
  https://lore.kernel.org/linux-perf-users/20261027170415.2815859-4-irogers@google.com/
  (patches 1-3 of that series were applied to perf-tools-next).
- Patches 10, 12, and 13 are extracted from the front of the earlier
  lock_held() v7 series, with patch 12/13 split into two commits and
  updated with !CONFIG_CGROUPS CO-RE guards and NO_LIBTRACEEVENT=1
  support.

Ian Rogers (13):
  perf off-cpu: Bound callchain length in off_cpu_write()
  perf off-cpu: Fix swapped PID and TID in direct off_cpu_dump() samples
  libperf evlist: Recompute CPU map when an evsel goes system wide
  perf stat: Give non-perf_event_open events unique IDs for stat record
  perf stat: Preserve per-evsel CPU maps across stat record and report
  perf pmu: Don't treat tool PMU as a kernel software PMU for event
    grouping
  perf evlist: Enable tool PMU events when starting a workload
  perf stat: Respect the enabled time of exited user_time/system_time
    events
  perf stat: Fix --bpf-counters with non-bperf, hybrid, and mixed events
  perf bpf-filter: Fix bpf_link leak by using PERF_EVENT_IOC_SET_BPF
  perf bpf-filter: Copy bpf_filters in evsel__clone() and close on
    evsel__close()
  perf bpf-filter: Support BPF sample filters on tracepoint events
  perf parse-events: Route non-field tracepoint filter terms to BPF
    filter

 tools/lib/perf/evlist.c                      |  12 +-
 tools/perf/Documentation/perf-record.txt     |  14 +-
 tools/perf/builtin-stat.c                    |  37 ++-
 tools/perf/tests/event_update.c              |  43 +++-
 tools/perf/tests/shell/stat.sh               |  16 ++
 tools/perf/util/bpf-filter.c                 | 225 ++++++++++++++++---
 tools/perf/util/bpf-filter.h                 |  10 +
 tools/perf/util/bpf_counter.c                | 115 +++++++---
 tools/perf/util/bpf_counter.h                |  14 ++
 tools/perf/util/bpf_counter_cgroup.c         | 145 ++++++++----
 tools/perf/util/bpf_off_cpu.c                |   4 +-
 tools/perf/util/bpf_skel/off_cpu.bpf.c       |   2 +-
 tools/perf/util/bpf_skel/sample_filter.bpf.c | 101 +++++++++
 tools/perf/util/evlist.c                     |  34 ++-
 tools/perf/util/evsel.c                      | 150 ++++++++++---
 tools/perf/util/evsel.h                      |   2 +-
 tools/perf/util/header.c                     |   5 +
 tools/perf/util/parse-events.c               | 179 +++++++++++++--
 tools/perf/util/pmu.c                        |   2 +-
 tools/perf/util/stat.c                       |  18 ++
 tools/perf/util/synthetic-events.c           |   7 +-
 tools/perf/util/tool_pmu.c                   |  30 ++-
 tools/perf/util/tool_pmu.h                   |   2 +
 tools/perf/util/tp_pmu.c                     |  55 +++++
 tools/perf/util/tp_pmu.h                     |   1 +
 25 files changed, 1057 insertions(+), 166 deletions(-)

-- 
2.56.1.750.gf70dc682cf-goog

