Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795154983;
	b=gmY91ER77+2KfT9hyVkGlPXTlRUzchJny1A8Qev3kYn3Q4Rwwpm0AQJBVsmAL/B/LHY+
	 v+Dw1IHHC88zTUvTENxbLesTYZq4KOGBNcf5p+BULUYLl9JZnzLhXhK5odcSWvfKwvCm9
	 GgQe70Ac1rN4rtROnj31CpyjYd/uKeaFzWn8k4sja1N105wdQ2qbGAqahEs+L7CcgiVLK
	 a2qMSve7dMDWgGinApPXBlQj0G3EGPXA4LVF55GElS3qV++dafGJpKlxNsBJPlgxAeXjb
	 L4CKXeL3gnL7OcrifSWQ2kQS2hA8Z76iWQxx69F+g8cECZAMQlvQdDsWYs34d6Ta5qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795154983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RcHTKgC3tArjDxrWuo6tbizL56S6DluuwiuXlvWfhT0=;
	b=Jup1FjclwLgFEHjkz5C+NX65np0WdyxYf4AuMwyfqWt4dtxgm1o4BrK9nXwBZNvrWC9T
	 5LRxWoHCNN8iB/sH/ltSnhBUb8rf1h+KIFowDoFxliKkiUAWSMiRrKvvCILRos898Fsdz
	 QaVVET4fq8LXxW1MO3y4FFeTZKyPl94EF93r6b7zlHd36GbTpnkIZR8FVpie2hNQWOmdi
	 FkziNa808qGAdSDL0xo/i1gyp6j4f2kxT5zlptVj0Hxil3dlQlX0c8JPIysTUn0kZCJZa
	 6HX68Dy0R3drZP+XpOtBCQoIvKSv6T9qemuF3JWbpa2yG62iClRUosSc+v8/zQ25CCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hcL2hoD2;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE13606A509
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:09:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACE13606A509
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hcL2hoD2
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-38587f3de36so572544eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795154982; x=1795759782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RcHTKgC3tArjDxrWuo6tbizL56S6DluuwiuXlvWfhT0=;
        b=hcL2hoD2L+C7/t5UT9/fAVhiLbH2tMIxl2pE5KmiMadHYJmAfrPlFKgrMxiSmo7pAM
         YmakEQlmFuIE1mjHO+S3UJJ7buQbBzRVtzIMnlD1ufeg0h4U43Gvv8B7JTJZSkaJju5y
         61IKJTEqQg9OMK8DD/FV0xW0xk8z135PbJwa0pkAEQn4Eyc5v9EECIntSNxKMFNIUkqb
         lKq8krFxuLlkPrAtUtElEy/9frS5MzZ2/ALBsjU+Z3j0DS4a11KbBw/KAzyCRVEUci1S
         A0uBguOj7EWEkDq1c/uWQaiRoTtiVT+70uYTKOb+c33e4WKudptY3lCAaOyRw20gA+Bu
         LOLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795154982; x=1795759782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RcHTKgC3tArjDxrWuo6tbizL56S6DluuwiuXlvWfhT0=;
        b=PqSPFPXBS7TivHOrakWtumukxJk2u8nU/C4UGOXtspPMljDCpQp0XC7B+rV5GV+Xhh
         k25kZsgREx5Q6xfFJWPz+rpj4T3saMr3pb6LEQeSk2/tYMwXtwyt950m3y7oIg+GZhl3
         AOv1+av4YcryqQUUIta6vBJiTXtCC7cpPEpZ0nrFp7Un5tdgeBEdyMC0ccF3JJiyr+4H
         sq1G6U1qsf0Cl4oWhEoUFyjRegECjzdubURV36SMefZHX/5cIaTMPCZl3L06aho9LVoJ
         yX8JemH/DPsKtUv6P1CRJAF2Csy/lIxuoism5g3lsspSdAYoxInLzGqEoBgbLci9+ZLS
         +qeA==
X-Forwarded-Encrypted: i=1; AL+hErHdeGXbVApEGS5wDI1MPjnpeoL6aSUxiw+K4l31We+94dV3WQYTPDr2+I8xdiRjipyxLDu5ox1SRuas0EE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rj8ZnK6tRexHIj2OlESUw1kXViqvy9XUV2urA1PWmAe5Vq0On
	xlNKYmpECCQRfkQfuN4+60It1EkNsmi0TRvGyo+h5zxxQsCIjwIoY/zx
X-Gm-Gg: AZFdTZcuaIV9zQ4+ybPS/JwtPMVl86s7/p4NmldFN1VD44k5qGCYSh3oJBfqHi6Lcep
	Lum1RxSTZTpYI6xgVgYyD9KuT1xRKSs7musrEk+h6jgQJaJouziDRVl7CCtlBKqWtNeNAc48Nt1
	yEw/weuXG5ntZYkrk/mcJDBpfZuw3VwumF1MTMBpC1T2E1Kj0VoKoLLE7B1F9wGjD2BBmfsR2rO
	l4Q7l0Cpmb0YgkO0yTUX09iDBvvYBwydD6jNzS9BVGwWvi4bxKoTHfaNX6wMah1wR5zRCaQbMJR
	R9I9Auo+fPKuqCmmxWk/MpRDaspKcTZ5v7At/siGUYFrIeAxKasGCFQn6vGB9zWp3Hef1QiUDu8
	GsD2T8lEHOLU7qwGV9vq5BPJVD5OJrAazpfLZmPQXuzk0tuWFGtWkL0m741k0u5xgmM/2yJdj3U
	7ru6AInn0TCnUH3nlZ17g8RHPBpzUQwmijwnVJL5ghmdQM4IpEtX5Pd8LTKgoRsxaN7ySmAx3Oj
	crTSdKKEpTr94C4O85677cXMr4KxZ8s/N3yHPApdmb3+4qp09cJKMmBBL9Jvk5VPYaCBJhs6JAO
	RgsXT3swx3AXySjzJ8Z1
X-Received: by 2002:a05:693c:880d:10b0:380:fd90:e660 with SMTP id 5a478bee46e88-3856f653c9bmr1790201eec.14.1795154981605;
        Thu, 19 Nov 2026 22:09:41 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c0c1dsm4609725eec.21.2026.11.19.22.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 22:09:41 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: linux-perf-users@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>,
	John Garry <john.garry@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>,
	Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@arm.com>,
	Leo Yan <leo.yan@linux.dev>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>
Subject: [PATCH v11 2/2] perf jevents: Fail the build on a key the tables may not carry
Date: Fri, 20 Nov 2026 06:09:31 +0000
Message-ID: <20261120060931.711483-3-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120060931.711483-1-takano32@gmail.com>
References: <20261113032927.634183-1-takano32@gmail.com>
 <20261120060931.711483-1-takano32@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

jevents.py takes the fields it wants out of each JSON object by name and
ignores the rest, so a key that is spelled differently is dropped without
a word and the object is built without whatever that field held.

Compare the keys of each object with _valid_keys, the keys a table may
carry, and fail on anything else.  The error is one line naming the file
and the key:

  jevents.py: <path>: unknown key(s): ['BriefDescript6ion']

Written with Hermes Agent, an LLM assistant; the author reviewed it and
ran the generator on every arch directory, with and without a key the
tables may not carry.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 tools/perf/pmu-events/jevents.py          | 70 ++++++++++++++++++-----
 tools/perf/tests/shell/jevents_bad_key.sh | 43 ++++++++++++++
 2 files changed, 98 insertions(+), 15 deletions(-)
 create mode 100755 tools/perf/tests/shell/jevents_bad_key.sh

diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index 080e04b51b8c..65e51dafd42b 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -63,6 +63,27 @@ _json_metric_attributes = [
 # Attributes that are bools or enum int values, encoded as '0', '1',...
 _json_enum_attributes = ['aggr_mode', 'deprecated', 'event_grouping', 'perpkg',
                          'default_show_events']
+# Keys a table under arch/ may carry.  jevents.py takes the fields it wants by
+# name and drops the rest without a word, so a key that is spelled differently
+# is only visible as a field that went missing; a table carrying anything else
+# is an error.  The list holds the keys jevents.py reads, plus the ones the
+# tables carry and it does not read: Counter, CountersNumFixed and
+# CountersNumGeneric (read by nothing) and Experimental (read by metric.py).
+_valid_keys: Set[str] = {
+    'AggregationMode', 'AnyThread', 'ArchStdEvent', 'BriefDescription',
+    'Compat', 'ConfigCode', 'Counter', 'CounterMask',
+    'CountersNumFixed', 'CountersNumGeneric', 'Data_LA', 'DefaultMetricgroupName',
+    'DefaultShowEvents', 'Deprecated', 'EdgeDetect', 'EnAllCores',
+    'EnAllSlices', 'Errata', 'EventCode', 'EventidCode',
+    'EventName', 'Experimental', 'ExtSel', 'FCMask',
+    'Filter', 'Invert', 'LegacyCacheCode', 'LegacyConfigCode',
+    'MetricConstraint', 'MetricExpr', 'MetricGroup', 'MetricgroupNoGroup',
+    'MetricName', 'MetricThreshold', 'MSRIndex', 'MSRValue',
+    'NodeType', 'PEBS', 'PerPkg', 'PortMask',
+    'PublicDescription', 'RdWrMask', 'RetirementLatencyMax', 'RetirementLatencyMean',
+    'RetirementLatencyMin', 'SampleAfterValue', 'ScaleUnit', 'SliceId',
+    'ThreadMask', 'UMask', 'Unit',
+}
 
 def file_name_to_table_name(prefix: str, parents: Sequence[str],
                             dirname: str) -> str:
@@ -196,6 +217,9 @@ class JsonEvent:
   def __init__(self, jd: dict):
     """Constructor passed the dictionary of parsed json values."""
 
+    if extra := set(jd) - _valid_keys:
+      raise ValueError(f'unknown key(s): {sorted(extra)}')
+
     def llx(x: int) -> str:
       """Convert an int to a string similar to a printf modifier of %#llx."""
       return str(x) if x >= 0 and x < 10 else hex(x)
@@ -459,6 +483,8 @@ def _read_json_events_impl(path: str, topic: str) -> Sequence[JsonEvent]:
   try:
     with open(path, encoding='utf-8') as f:
       events = json.load(f, object_hook=JsonEvent)
+  except ValueError as exc:
+    raise ValueError(f'{path}: {exc}') from exc
   except BaseException:
     print(f"Exception processing {path}")
     raise
@@ -492,6 +518,8 @@ def preprocess_arch_std_files(archpath: str) -> None:
           _arch_std_events[event.name.lower()] = event
         if event.metric_name:
           _arch_std_events[event.metric_name.lower()] = event
+    except ValueError:
+        raise
     except Exception as e:
         raise RuntimeError(f'Failure processing \'{item.name}\' in \'{archpath}\'') from e
 
@@ -643,7 +671,10 @@ def preprocess_one_file(parents: Sequence[str], item: os.DirEntry) -> None:
   assert _bcs is not None
   if item.name.endswith('metricgroups.json'):
     with open(item.path, encoding='utf-8') as f:
-      metricgroup_descriptions = json.load(f)
+      try:
+        metricgroup_descriptions = json.load(f)
+      except ValueError as exc:
+        raise ValueError(f'{item.path}: {exc}') from exc
     for mgroup in metricgroup_descriptions:
       assert len(mgroup) > 1, parents
       description = f"{metricgroup_descriptions[mgroup]}\\000"
@@ -1473,6 +1504,8 @@ def main() -> None:
             continue
       try:
         action(parents, item)
+      except ValueError:
+        raise
       except Exception as e:
         raise RuntimeError(f'Action failure for \'{item.name}\' in {parents}') from e
       if item.is_dir():
@@ -1536,20 +1569,27 @@ struct pmu_table_entry {
     if item.is_file() and item.name.endswith('.json') and not item.name.endswith('metricgroups.json'):
       tasks.append((item.path, get_topic(item.name)))
 
-  for arch in archs:
-    arch_path = f'{_args.starting_dir}/{arch}'
-    preprocess_arch_std_files(arch_path)
-    ftw(arch_path, [], collect_json)
-
-  with concurrent.futures.ProcessPoolExecutor(max_workers=_parallel_worker_count(len(tasks)),
-                                              initializer=_init_worker,
-                                              initargs=(_arch_std_events,)) as executor:
-    for path, topic, events in executor.map(_parallel_read_json_events, tasks):
-      _json_cache[(path, topic)] = events
-
-  for arch in archs:
-    arch_path = f'{_args.starting_dir}/{arch}'
-    ftw(arch_path, [], preprocess_one_file)
+  try:
+    for arch in archs:
+      arch_path = f'{_args.starting_dir}/{arch}'
+      preprocess_arch_std_files(arch_path)
+      ftw(arch_path, [], collect_json)
+
+    with concurrent.futures.ProcessPoolExecutor(max_workers=_parallel_worker_count(len(tasks)),
+                                                initializer=_init_worker,
+                                                initargs=(_arch_std_events,)) as executor:
+      for path, topic, events in executor.map(_parallel_read_json_events, tasks):
+        _json_cache[(path, topic)] = events
+
+    for arch in archs:
+      arch_path = f'{_args.starting_dir}/{arch}'
+      ftw(arch_path, [], preprocess_one_file)
+  except ValueError as exc:
+    # A worker's traceback is three levels of ProcessPoolExecutor noise around
+    # the one line that matters, so say it here and stop.  make deletes the
+    # target it failed to build (.DELETE_ON_ERROR), so the next run reads the
+    # JSON again rather than a half-written table.
+    sys.exit(f'jevents.py: {exc}')
 
   assert _bcs is not None
   _bcs.compute()
diff --git a/tools/perf/tests/shell/jevents_bad_key.sh b/tools/perf/tests/shell/jevents_bad_key.sh
new file mode 100755
index 000000000000..7848e60b8b4a
--- /dev/null
+++ b/tools/perf/tests/shell/jevents_bad_key.sh
@@ -0,0 +1,43 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# Check jevents.py reports unknown keys as errors (no_mlock)
+#
+# A key that is spelled differently is dropped without a word, so jevents.py
+# compares the keys of each object in a table against the keys it reads and
+# fails on anything else.
+
+jevents=$(dirname "$0")/../../pmu-events/jevents.py
+python=${PYTHON:-python3}
+
+# An installed perf has the test but not the generator, and a python that is
+# not there or too old to run it is a skip, not a failure of the check.
+[ -r "${jevents}" ] || exit 2
+[ "$("${python}" -c 'import sys; print(sys.version_info >= (3, 9))' 2>/dev/null)" = True ] \
+  || exit 2
+
+tmp=$(mktemp -d) || exit 2
+trap 'rm -rf "${tmp}"' EXIT HUP INT TERM
+tables="${tmp}/arch/x86/model"
+mkdir -p "${tables}" "${tmp}/arch/common"
+printf '[]\n' > "${tmp}/arch/common/empty.json"
+printf 'Family-model,Version,Filename,EventType\nGenuineIntel-6-97,v1.0,model,core\n' \
+  > "${tmp}/arch/x86/mapfile.csv"
+printf '[{"EventName": "a", "NotAKey": "x"}]\n' > "${tables}/events.json"
+
+if "${python}" -B "${jevents}" x86 all "${tmp}/arch" \
+    "${tmp}/pmu-events.c" "${tmp}/pmu-events-string.c" 2> "${tmp}/err"; then
+  echo "jevents.py accepted a key it does not read" >&2
+  exit 1
+fi
+grep -qF -- "NotAKey" "${tmp}/err" || {
+  echo "jevents.py failed without naming the key" >&2
+  cat "${tmp}/err" >&2
+  exit 1
+}
+grep -qF -- "${tables}/events.json" "${tmp}/err" || {
+  echo "jevents.py failed without naming the file" >&2
+  cat "${tmp}/err" >&2
+  exit 1
+}
+
+exit 0
-- 
2.53.0

