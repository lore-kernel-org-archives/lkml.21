Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795579229;
	b=spouX+zjAzLTUON2ZtA1tgQPF+KnNq/KOUFNHC/6GYHHmlgbhAKXS9Ffl3pqDrjHOdd9
	 6s6tf2AEf9gsl2a6T/+chMeqkaPWKfqHUNtcwQZ1jEKpxqBPekau0m0AmXFuXULKMixtD
	 cWJSCvUvIEn4VhdW1216LjuYyPqxmxb1jxMl0JMkfFCSxv03I35GFSIb8NiiZjIBSzsQb
	 oCWMPqF2tYXmLwOI3qP92M8suKaV5OMCOY5ONwHkWqUkpM4Kl+3Eu6MACDRV4OS/LuRJo
	 Ahih2+Li76bi9mX/ntU9nK3fUtyR9uI7iqu8TsxcmH1hjnmaBtOGROimLJTH7fFdRaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795579229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JHAmRX/r0jGQ38tK1sD0aSaAzLRfe9WNovc4CDTshWQ=;
	b=0cZCkxgESic+cmRIajKKX+DGUU9xRGqJhfinhU1HrC0Nu/MdgrSe4uVtYhXiMEcnybDa
	 xFbjSWM43AhqQ2xwvIANIvyb/xj6Q0hfUIOD8ZF65Ol1WWMKLa1himOv7uSNWZu6WnqW+
	 VWJ8/MhIzkXJC6NJCEhuxcMLjvqk4x4MVW5a2Z9y6TLnkllbEpfObyfhBMRTF7iOUz23p
	 ey7xHWbI+OVnC10lNk6KzZdidx0Y0t3u6EdUeOz7Mv530efYdZpYGppI9rBXIR7daQUyo
	 ljr/DfzCp85X/YgXgs4gL2AeUVcHM4aHiGYGl/Qm5bSLpRWCgedBufSvk1ujWv8Er9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=azTs2ayq;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DFB606A33A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:00:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10DFB606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=azTs2ayq
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-15ea896ddc8so8894403c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795579228; x=1796184028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JHAmRX/r0jGQ38tK1sD0aSaAzLRfe9WNovc4CDTshWQ=;
        b=azTs2ayqcGGJOwQZg2Z5UfsjopJ1lCasD3A64Gmwp6Bu1mSi5ZZQVXQgQ3kWoPyGR+
         0VzzO4arSJYCvIfxnzy33npdI1bm907lwraamPiJbiapgduHes2yG2bies35bMvPc4++
         8/Oo21FIRN8KfdW2HhiRogkMZ3+m6shwRECXNDt2uOjzcA/ShzbeBa9T6vQilbc4roPF
         tFWczK5XytFl44Tbqw0XF0ScNwyHT+5Kk3jsjsHsdFa43LfiPPs+KjYhjCICD7DiHOY+
         OqGemCt+ul0ZGVoU/7p4eyN98z7ktNX+tHlQbs/wk1z4jA84kvbbPcVwRDUov3qx7DkM
         vqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795579228; x=1796184028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JHAmRX/r0jGQ38tK1sD0aSaAzLRfe9WNovc4CDTshWQ=;
        b=XlD60cc/ITw/U0u5D6HsjOdSv/437ZVjV16qLXqreVkiK/4FbJI6jP9JttOXCehXBz
         Rpk4VENrXO6aGazntu1UVl54YUT2hUd6kuDhNnDpZY7ImUi4URDEvmpRvsnm65zKjn7o
         g/Ei7ANs2a56qQHhR+s7HQssfaZBJgjpIq8185ZogXMGoFAlHNG16POgkgdZcfyefFH4
         Ibba9HQuyEZ+c53EqRTc7aaGlHbPLej0lFlhky5WyB0f7FaTKKyrpblKMFxoEPmBz+LI
         MAa21VnqnAdKb5CBOASr5EYjIf95vsqsfY+aJSL66qXPk0aH4X+LMWqBkRcSLExWsejI
         3wbw==
X-Forwarded-Encrypted: i=1; AL+hErH/8sG0JVo1wGU3o+5Q7nigj0Fzve2MezboaTSDESLtR8Wy/DUcxeE5lRxwxTDrboj72AtBgcZO235BAL0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1h5YVuZjTyeIkhu3cgtOGFCP7pYxVnO29JGkL0vV/PmyeuwYu
	/zr0AsWddPrtfBbCsOqzzsNIS3FidN9biWDOq1XDrxnv0b/dWrn6Jhsk
X-Gm-Gg: AZFdTZcQlJKrHe5JDGYixOFYnS7RmCVwQUWfGBZ7qHA71z1s57NMyId/knd8c9LFpUz
	vTLAr0ylp4bFNOvXFjTDfTnqogu7nts8EwxjLRsiVcgtqpFGN/fJrCeojoYSUmDW8KgUnybmHy0
	DMUn/MD15t7Na3sGXz0qR/kw1WPSiNK3l92mKnP5Bw7weAz8mzI4MZ5GrfZwFT3rclc/9OmnysW
	75Q6wd2nw0Rge6v4ZY3WC1nU6WYwF2dxnBze5FzfqSIfelwFiYRba2s+nrcHvwXPZeQCWHn5lkl
	6zjMVMyYn5UaAWFuz8gcKPfC97Eatr5gYbLukYsRSahGyAhZqYgnnmpzSOyD+nnkgaED7AbO7Nt
	u83A4HB/YXFAgFjr/kot7gCP9gXAmiR7XsjCjj4f6QEh//8nvjwOUmIjS1l51AHEYU9nkSPsoQg
	HgFrq4bzp9VGGT8wZNiD86qxNx/YzRFitTvh6ZLhjmRZ1JFFCmrgkGwdRJVPgdAvL6/8Y4eWVuu
	kNhYNBYwmzYTK0hmeFJEhqBWTR+2HbwXE2IQCN9pNt9A8MspmmM3eHJYryhplbtRhdFMJCMRjFV
	lcKxjFhwKhk+1XicMpnQ0D2wYJYGlOCmwrQ5vNAJvg==
X-Received: by 2002:a05:7022:2218:b0:19a:20d3:a3d6 with SMTP id a92af1059eb24-1b57da14988mr6075197c88.1.1795579227824;
        Tue, 24 Nov 2026 20:00:27 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm57094127c88.14.2026.11.24.20.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:00:27 -0800 (PST)
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
Subject: [PATCH v13 2/2] perf jevents: Fail the build on a key the tables may not carry
Date: Wed, 25 Nov 2026 04:00:16 +0000
Message-ID: <20261125040016.1675748-3-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125040016.1675748-1-takano32@gmail.com>
References: <20261125040016.1675748-1-takano32@gmail.com>
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
carry, and fail on anything else.  The generator already names the file it
was reading and the exception names the keys it did not expect, so the
build stops with a message that says where to look.

A shell test, jevents_bad_key.sh, puts a key the tables may not carry
into a table and checks that the generator fails and names the file and
the key.

Written with Hermes Agent, an LLM assistant; the author reviewed it and
ran the generator on every arch directory, with and without a key the
tables may not carry.

Reviewed-by: James Clark <james.clark@linaro.org>
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 tools/perf/pmu-events/jevents.py          | 24 +++++++++++
 tools/perf/tests/shell/jevents_bad_key.sh | 52 +++++++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100755 tools/perf/tests/shell/jevents_bad_key.sh

diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index 080e04b51b8c..1baeae76349f 100755
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
+      raise ValueError(f'Unknown keys: {sorted(extra)}')
+
     def llx(x: int) -> str:
       """Convert an int to a string similar to a printf modifier of %#llx."""
       return str(x) if x >= 0 and x < 10 else hex(x)
diff --git a/tools/perf/tests/shell/jevents_bad_key.sh b/tools/perf/tests/shell/jevents_bad_key.sh
new file mode 100755
index 000000000000..6084205b5f4d
--- /dev/null
+++ b/tools/perf/tests/shell/jevents_bad_key.sh
@@ -0,0 +1,52 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# Check jevents.py reports unknown keys as errors (no_mlock)
+#
+# A key that is spelled differently is dropped without a word, so jevents.py
+# compares the keys of each object in a table against the keys a table may
+# carry and fails on anything else.
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
+    "${tmp}/pmu-events.c" "${tmp}/pmu-events-string.c" \
+    > "${tmp}/out" 2> "${tmp}/err"; then
+  echo "jevents.py accepted a key it does not read" >&2
+  exit 1
+fi
+
+# The generator says which file it was reading, and the exception says which
+# key it did not expect.
+grep -qF -- "Exception processing" "${tmp}/out" || {
+  echo "jevents.py failed without naming the file" >&2
+  cat "${tmp}/out" "${tmp}/err" >&2
+  exit 1
+}
+grep -qF -- "${tables}/events.json" "${tmp}/out" || {
+  echo "jevents.py failed without naming the path" >&2
+  cat "${tmp}/out" "${tmp}/err" >&2
+  exit 1
+}
+grep -qF -- "NotAKey" "${tmp}/err" || {
+  echo "jevents.py failed without naming the key" >&2
+  cat "${tmp}/out" "${tmp}/err" >&2
+  exit 1
+}
+
+exit 0
-- 
2.53.0

