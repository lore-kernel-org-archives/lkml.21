Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182184;
	b=H2KHqrdOuQRB32/s/Tkcffg4W6EomgazH/XgX3npTH+2eRGjpmb32MwIZ+F9VEgGJ/9H
	 rbfx8s1OJNFh2H+JaKRLUNKp00v+WqLzouKtxeS+xRVS3CKC3VtCajvvp8c81bikkvoUi
	 sPu/BpggiAAYS28U6i7GiIw4thptL1g4KgsAA78osggdhj8gRorwVA3WNNaDaUJmJRzZL
	 7fhNVVXRVUyDSiAvsc0U2/+n0gSuh/Hz8yO8NQS+iK+QPitgAh9UFL04zwlYDV9yj9wgH
	 Y2Z0wYRReKZ256j0pM6fXO5cHOKABrCP7u2SvD12J7PzcbZ7vfGagotp+DueWGOTZmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cYXD2FWmrnnRZk6eOj0Jj2xBjZH/opG+pmsIgNjn1qM=;
	b=CsxTmtFRO3SM5O/3M11G4JqRrhWPLLHWb8jUycgHGsqENpsyQAgMwLpsPqVerOPdwPMK
	 7ttQmTx+WQEPhREofM7shyfbnUBOUfChJnjpHPxbbZKFr4UiiULuEbqqbKjq/bZhcLbaG
	 87m+69Sazbkw1sGT/UG0UGL6SDUYJcUYmSJjnGUdDY3euKIpxFN248PiN0+pNoZU+idR2
	 qSEV9oNiaMmKe4Qw8DpopumUjS9tQw03wg+Zp3vCO5tYowwF8CEFrH/6YC5N7xYM7dRn2
	 Z2ILNOpebT2lBJz1BMVskLKONts7pf2BU4Kq7Zt3ebp+wANQIwIn/Fnva7ukxccRBPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fWMOhzPc;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41FA60A261E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F41FA60A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fWMOhzPc
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3282db206d3so2397835eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795182183; x=1795786983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cYXD2FWmrnnRZk6eOj0Jj2xBjZH/opG+pmsIgNjn1qM=;
        b=fWMOhzPcYN0UpLMPegxJSOPZR1y33brbSICxb79t0XSxcz7Rn1I5DvxrS9W4GL0dxf
         LPbq+RyVjBQfn23lJYx3GGBzPzvnhyhm7aC9I8Om9vT/WUIRjw/Ejb3GWBLorimx9Zzf
         A8d4qbyGn9SnNJEuONtuC9+S9qwhH7irx7W0ECh8ANXEcJxxHvtRbUwU2Lr7TLRTuHd1
         rYDx+qJzHnRR6j6J1l6tvRkGEZfnVHv0uw31frMqGDQDstwqa97L2OFv1BZD+xJf2BdI
         XaYSZxw5IHaS70Hs8hZq9EjmCPT/iDPMf5UP6XrHDRzyL43+zy0ZtiOAsEvPr3dsIO2h
         hCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182183; x=1795786983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cYXD2FWmrnnRZk6eOj0Jj2xBjZH/opG+pmsIgNjn1qM=;
        b=KJYo6IeLhL2zhmEuiqu6mvdcJJxXrKn3uh7CPS9Ou93dSnZP8b7l7EWu1G9A74zJ9J
         MvCM7xjfc8ualsTzbPmESeQgvqWKQRFmWgPBrb8JS2oe+0MVTPl87OL3Jwsas3+ZxKKX
         h0cVHWeIX7HspwDNrN8sv1dt/A7QNTLgB6xqeqANSIm/jLc9DZouHGYXZrNchUVez8kv
         eNIp4o+zSfxkYChbjhyXdTJByZyR1NorRlcPHR5JoXjXcRmqCyVHlCyJUcnfQrsdGTzZ
         FAIUV+u2YLlrbOEcFSHBnGX+ILLsXDQshGij/Yq2CICPcSYEgP5cGOOym2z9zxfOVsUb
         S8DQ==
X-Forwarded-Encrypted: i=1; AL+hErHAIe6whLIB/x9Ewz+AcMVGhsMYzoE1mr3MMqiMgyBwDHjCSCw5ojWEN8DDryAlvI58QpWvNLW+5FabWns=@vger.kernel.org
X-Gm-Message-State: APuU4Z96qoK1w3SFB1jBHZ03fk5IDiawfuwDncH4XR7f/CboP0KQ9rOJ
	Pua8NOop5k5J9Nhhjwkrobqq5usVyozCNJX44PkgQb4Oqe0gsl16qaHm
X-Gm-Gg: AYBFou1qQ0UCWte1LmvBaTBZBUubIDc517JGwFUK8lKJY5c+Q7SsZ3lpPohgiAhlK4V
	I8lRvT/SB8criBfHijwlUBkQmxrI/WVsHCZKOdJnpI0/0e/U4Js3oBbotx1bD82FgNn/qMpNFvQ
	uxeT5DR8qB8HkCK0SFmOKh/yeItukH8czwypGrJw7kPxqzKP7rr6aFJtfFdi4PFccj81gVFPust
	yUYy75XxoYoUqR+519QDMk6eUfQpAYB72w+aij2gYXjviD0Az09POPC2deholbUbUv1X9oV3Id9
	tYv1mZ2PYe+5NU6Q9DR3LgLTWDf/ACgVyJbvzeDuKRljbu65YoY+UXbM2ySlGOdOX33amQFRNL9
	GKWtHesEkAE9XJ5QprenqFSJ+61eGVXkXBOMNIYYw/Tbiiv+QVbuQASAzSm9H1DrmN37L1D9j45
	leb/39kc0/YEa4qjAXdn/sDVyqKMoCvE6tmF4OonPwBBF4MejukNfalTPxCCd/24pXVi3u+n/l6
	4UQVGLsN1rbBLPOToT+lhGYcHIb2qt4nTWILqe3gow+676fZuqRP13hVUq2ujpaetQt/xQEKEvK
	PRsLzG3aiOMXqDwtaxFU
X-Received: by 2002:a05:7301:d805:b0:385:ce95:2e14 with SMTP id 5a478bee46e88-385ce953221mr2127751eec.30.1795182182938;
        Fri, 20 Nov 2026 05:43:02 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm9590857eec.28.2026.11.20.05.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:43:02 -0800 (PST)
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
Subject: [PATCH v12 2/2] perf jevents: Fail the build on a key the tables may not carry
Date: Fri, 20 Nov 2026 13:42:52 +0000
Message-ID: <20261120134252.1036963-3-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120134252.1036963-1-takano32@gmail.com>
References: <20261120060931.711483-1-takano32@gmail.com>
 <20261120134252.1036963-1-takano32@gmail.com>
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

Written with Hermes Agent, an LLM assistant; the author reviewed it and
ran the generator on every arch directory, with and without a key the
tables may not carry.

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

