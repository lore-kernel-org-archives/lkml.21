Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795213666;
	b=3oHVwhHtyNj5AwzM99GY40SpiymCEnX9XtZRwzDNeydKpaTUoGaQTzQWaltdhwuCgdX8
	 IvCh7PfJ87ptlYSEIje+C+Ulr2+V1l4A+OJ73xa3biEbjePbePEVLE6OZLFPFzdGR67PN
	 JDwlZUMjq0v5ZKL3h4byjjEUFaYdGmJ5vdiGMQ5EtdJCCXTIUJC4BpcDE8breLYbWxZnf
	 SDuLWqBty8qDxu+lsO/MnGUdAcXvFrh9HCLB0tTrKsXzYcFcCUQ7e6WxtssLwEfqgji0p
	 2Gdq1P4nrsc+HFxa3w4IS2kvuUr3eMurQFdWJk5p0dVmRHcAqHXUqBv4cjJWsFtQ2MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795213666;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=0c2OsM1aEUajt4eDbo5+GwXP7vk+Skx97fbhfEI2OuY=;
	b=I49vGmgordUnoWKoN3V7ZHGRyuffPSouEOuDw6er8+a4Lx1sveNChFu9FB6bdkFUHqNt
	 YJkbz8l5nc6fElh7fXd6ZnbY++Qn3O/RVzi3yawreLp75Vmvhb7p6ziC+kze43Go36/In
	 5DazBe0v0anRA6MMnpQjJ7sgXZTTDygCaRuDqidiwjxhCcEQJettZsZJ04nWSOamO4SuI
	 XEFDkSkz2v8r6Ey6rYG1+xkXHIezOSD+wYkT0RgkJiYXt/ONg7iqZeSfad5EebOBCchNA
	 gFboBuJIDo9mroCQtAlJVRLEunKG6N0X4Dq9I/m531Alq5ZLOp35Yi+sHFHmcPtCgqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Z3zsf8Tn;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04016606A6AC
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 22:27:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04016606A6AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Z3zsf8Tn
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386177b0516so3058820eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795213650; x=1795818450; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0c2OsM1aEUajt4eDbo5+GwXP7vk+Skx97fbhfEI2OuY=;
        b=Z3zsf8Tnaw0HEEdRHak+skHDrTMnQCNrmB8D5qC17KJyBYjNkiErdKr3EN+Eob08d5
         8A8Pve1MCh5Lo2ZLFfpOa87xuiFpfxvSZROW1lwWPoosy+CeI6x0KnZNRs6XFkQDXDgQ
         LWgK1bS4puLVamg8OtnsHBHXnKYYIGBXw3XFIoBvWdnlXB6gR9XWknuWOeHuCdnFmKnq
         oLi/tWRE2+sEkcyC3ggvCmT8Tf9zQO+JhKfVBLt7oaT1/alcgzRVGD/wQMX41GQivnYQ
         0DaqQBh9a37gq5/nW7aTcnJNRYZHfewqVi4JWTerxVyeCZRfVqChYIJktsE55PIiwm86
         PKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795213650; x=1795818450;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0c2OsM1aEUajt4eDbo5+GwXP7vk+Skx97fbhfEI2OuY=;
        b=qpnr/HVBTULjguJauYeYK0ClqIhF+IKXrU4uklYN8pxknagyL8RBhkMF9c4ecwyuqS
         3wIMjhBLwMC+OhlaBCA39DPBmw01csSc7uepTEs5KrwbSlvpKDDjXxEhKo11DzCk4sqa
         6YLnAEW8pyDO3NS2m9xS8/8TAC1E16GIOLPTj1WEZAKj0y/SR5NGQsuFRdpNZSgo6N/H
         o7roFtrGpH59zp4gUKbd/jxY9ReEBF+nnSTmE2HzfWDdSzTdFKhqeaUuRuZcaT/XOGNb
         jxXNc+V4b0+AByx0S0cjxfy1x2ziW1qCYGQiSJIFE0WbHcw6DBbNOVFBXvGIkNW/Fbus
         s1XA==
X-Forwarded-Encrypted: i=1; AL+hErGbVkUBClP7Q6e7mVA2pjRcdLOYxD8lpQyE+lsAtswBCSIx/IMWchOgQ8bNTlnPyhQrexLRCkUz1RpPaKo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hu857VtlNb2y4o6LSc3eZD6Y4sEIoDxH8qm2YNdcsywzS754O
	/6qB44q+IdAhD84yYO3f0xshhH/2oE+LhoYbEHOWarz3bI/ZAprW3e+wFu3TsYyF78UeLFVvGWT
	zBEh02AdsXQ==
X-Received: from dyr14.prod.google.com ([2002:a05:693c:400e:b0:385:7971:db60])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:8955:10b0:36a:79e7:2fd
 with SMTP id 5a478bee46e88-3856fb699d6mr4368636eec.40.1795213649873; Fri, 20
 Nov 2026 14:27:29 -0800 (PST)
Date: Fri, 20 Nov 2026 14:26:15 -0800
In-Reply-To: <20261120222615.2291168-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261120222615.2291168-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120222615.2291168-17-irogers@google.com>
Subject: [PATCH v3 16/16] perf test: Add perf sysinfo shell test
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add a shell test exercising default 'perf sysinfo' summary output,
'--pmus' per-PMU output, '-j' JSON validation, PMU glob filtering, and
'-i perf.data' inspection.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/shell/sysinfo.sh | 88 +++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100755 tools/perf/tests/shell/sysinfo.sh

diff --git a/tools/perf/tests/shell/sysinfo.sh b/tools/perf/tests/shell/sysinfo.sh
new file mode 100755
index 000000000000..c8619b2463f2
--- /dev/null
+++ b/tools/perf/tests/shell/sysinfo.sh
@@ -0,0 +1,88 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# perf sysinfo tests (exclusive)
+
+set -e
+
+shelldir=$(dirname "$0")
+. "${shelldir}"/lib/setup_python.sh
+
+sysinfo_output=""
+perf_data=""
+
+cleanup() {
+  rm -f "${sysinfo_output}" "${perf_data}" ${perf_data:+"${perf_data}.old"}
+  trap - EXIT TERM INT
+}
+
+trap_cleanup() {
+  cleanup
+  exit 1
+}
+trap trap_cleanup EXIT TERM INT
+
+sysinfo_output=$(mktemp /tmp/__perf_test.sysinfo_output.XXXXX)
+perf_data=$(mktemp /tmp/__perf_test.sysinfo.perf.data.XXXXX)
+
+test_sysinfo_default() {
+  echo "Default perf sysinfo output test"
+  perf sysinfo -o "${sysinfo_output}"
+  grep -q "^Summary:" "${sysinfo_output}"
+  grep -q "System rating:" "${sysinfo_output}"
+  perf sysinfo --pmus -o "${sysinfo_output}"
+  grep -q "^software (" "${sysinfo_output}"
+  grep -q "^Summary:" "${sysinfo_output}"
+  echo "Default perf sysinfo output test [Success]"
+}
+
+test_sysinfo_json() {
+  echo "Json perf sysinfo output test"
+  perf sysinfo -j -o "${sysinfo_output}"
+  $PYTHON -m json.tool "${sysinfo_output}" /dev/null
+  echo "Json perf sysinfo output test [Success]"
+}
+
+test_sysinfo_filter() {
+  echo "Filtered perf sysinfo output test"
+  perf sysinfo -o "${sysinfo_output}" software
+  grep -q "^software (" "${sysinfo_output}"
+  if grep -q "Modes:.*sampling" "${sysinfo_output}"; then
+    grep -q "Sample types:.*ip" "${sysinfo_output}"
+    # Register names are only known on some architectures.
+    case "$(uname -m)" in
+    x86_64|aarch64)
+      if grep -q "Sample types:.*regs_user" "${sysinfo_output}"; then
+        grep -q "User registers:" "${sysinfo_output}"
+      fi
+      if grep -q "Sample types:.*regs_intr" "${sysinfo_output}"; then
+        grep -q "Intr registers:" "${sysinfo_output}"
+      fi
+      ;;
+    esac
+    grep -q "Features:.*leader_sampling" "${sysinfo_output}"
+    grep -q "Features:.*sw_grouping" "${sysinfo_output}"
+  fi
+  echo "Filtered perf sysinfo output test [Success]"
+}
+
+test_sysinfo_perf_data() {
+  echo "perf.data perf sysinfo test"
+  if ! perf record -e software/cpu-clock/u -o "${perf_data}" -- true 2>/dev/null; then
+    echo "perf.data perf sysinfo test [Skipped: perf record failed]"
+    return
+  fi
+  perf sysinfo -i "${perf_data}" -o "${sysinfo_output}"
+  grep -q "^Summary:" "${sysinfo_output}"
+  perf sysinfo --pmus -i "${perf_data}" -o "${sysinfo_output}"
+  grep -q "software" "${sysinfo_output}"
+  perf sysinfo -i "${perf_data}" -j -o "${sysinfo_output}"
+  $PYTHON -m json.tool "${sysinfo_output}" /dev/null
+  echo "perf.data perf sysinfo test [Success]"
+}
+
+test_sysinfo_default
+test_sysinfo_json
+test_sysinfo_filter
+test_sysinfo_perf_data
+cleanup
+exit 0
-- 
2.56.1.750.gf70dc682cf-goog

