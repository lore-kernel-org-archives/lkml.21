Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019426;
	b=qXA0VO2OvgHeVyvf7St+Brlt3reOb/GH+L6uwalWPjTSULmWfQKpPTrtMBfBaDNKgZlZ
	 EeMKf1mnJ+ysRjCF1qaqHsGEVXiB0mnrwBkQwN7IlJGxGUewgPu7sg9OoVns01yWgIzyu
	 E+FYsku7TxZvoBYH5UGmgEjAxPHqrN/pk6e8CI/VsXZQbQagKjVegkJMMlH0Qe8DAlmlf
	 /hLImCMq/RHftSYfvQoXmJLqpWxP9T9fKfKAEJsHfpCCIJj2UNFZphbkaF2i1MQzh+HQc
	 TNps3n1Q0kYhe43qUioMyQimxkk44DiuWNyIKqf2d2TalDZG8asREfrmFafMH8FDdnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019426;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=OWO/4pb+xROsjF0+5i909plVTiV5kvL03eZF9ypm+2s=;
	b=cRGXTuJs5g7/bYg011bK392+su3d69qBSb3FwD1lUetxghJc+INlmA2uYf0EgR7bsha+
	 9IsbRLuxJJCb0qlHfoGpWdz1lnAXCZbZTxw7aUIjZIhpg6sPEcXwXGxdE9oxO17Sw9dGG
	 ogWt7Qmi7spBfHRnagc9T+bFQFg6qtxnwX+AeJXCSQogXMxjowDCY154iGU6R5LQqja7/
	 ALhqX20OLYx+/hgvA42KkQU+JihQvJgfzmkceQg/QgYqPXLyXiCcero087T4T9JOWVBPu
	 voDXfqE30FcyrR+41QJ2UhAmWQEzQwoSrX4agzKe1s6oZWkPN1T57RlgBgwJwcKYCvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=g2me5mkO;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF715606C3C5
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:30:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF715606C3C5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=g2me5mkO
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so1021408f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019422; x=1795624222; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OWO/4pb+xROsjF0+5i909plVTiV5kvL03eZF9ypm+2s=;
        b=g2me5mkOBerovjVEh71SOT7VMFd1szCgDeCLsxRmWUDl/UBtaKFhxJsM7H9+rv4Vtx
         G9NP7HoPN73LJuCU15v/ePO/KVl7NLt7Oc2/LcF9o5pn+KIzMUfUxkbfaMpHD9ceqgd1
         f6GsvH9ndqodcj1nkZoaps5W+EK1dMCrX+OufNAH8zrgcPImylUEgZr5zMAjGKBpuuKb
         roVbkoDZ691uG7vywX5nb1SaRo8dgdI6G63tlfsW+ow3wViGrioFZa8VU3sR+uIowq7R
         7foHzCpJKMfnWzMleE+Gnb52PumOmm4QCCaor6byqs5atbougaCGKZGieu7H0gQe6h4+
         MC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019422; x=1795624222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OWO/4pb+xROsjF0+5i909plVTiV5kvL03eZF9ypm+2s=;
        b=bVnJwPFLsnOLQxx7rVBORAHutW3tXXasF+6sdTpntor6b1xX7Geo6dSLH/R5B0iReq
         3Xvh13bQWE8ZS8mHkGvtu2mgV0oxqr7F/4UWao2ke4JP6J3c3R1iMs/Q02EFnpGtcXCp
         7XtCdMNxXIAWHovU5DQhQn1/8S42a/JFjAu0LUP3fdD20JyQLryGnmRiuoJAVgx2claS
         ag/OV4stml0hTUUanCdlomUKa4FFWKCaI7DJd3PcNDa5W57MhGwJY/B3CwrHAVsSI7Bq
         TjMciwS977Q3Jml0rfJPGLASEYDKFv0AlW57ew/YcHWr5DP2rfr7NFLP5UeGbvqTdIan
         jMHQ==
X-Forwarded-Encrypted: i=1; AL+hErENHrf/fNlHnJ1AqLMrXp41WbbvBJ1erYFZ7i23frVIs8Kab3rZcD+aLSOff56Isw3iQLcF5+Idy8JYIXY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Hv7Z88SwTVWIM749/I1IQdyJLfwGIQH3O9nGWnFYIHibNLfFL
	qLoT6u54NxFhsMpZ3p4UuhMGFw2XZH6S+oNM9hUGpWstOVIMauJuvkp1SrjvNqb0jjc=
X-Gm-Gg: AZFdTZf85QIedFihHOcHOpYt60pFmi7igm3JAEw96kbRlNHJ99p4OzKg2XmREJWRpQX
	TrXeIrhbPL2R9mDMLq49Vb8GkFyWCSa5GGsKRPH1UWqHUDNVmf4GqyTnHwOxf4GXDxJNwmPlUWw
	OVee8y4Ml2cZwsMJ6aJX9+0eElhE83pddZyh94wn/sOEs9nluyga8/Kgf3j3u1i1acOhr3WgIEu
	55zXynaQKPIPXOr48hi6S/PCPVt5q26rrZPdciQsPI+O9fzdOsF2xaNcOKcoiY+06xQHfkQ/Jez
	iMXoNgW9YLoI/Ckl9gw+JEvSNoAq7ETCj1KH0axdkDUIQi6MOs/f3jshWZZ6QsAWPhNrJZunJEt
	IQf3VZXh+T2pzvUASYQ6oAmHh5Rd4PqIfWEZba6g8IlvR2o/Eudswf2YlHZ/9Dz7Cri1nuoxvpZ
	z4P6Fi5t4U4W89tPJi0bGU9eC1gpeNJJEg9w+iYJJKnomEsLL/+iMLanjKeEXaj2LuzJy45l20g
	uv+TCXN9ajl05eLcmaUHrap1UpGjR0GtxBwA6UvC9BJSs7MACIXSu6/+Ltzk9LBMTe83vqflBo6
	v499RTr35Gx0zXVkatJokXQrKpy74w5c
X-Received: by 2002:a05:6000:184d:b0:4a6:4862:28fc with SMTP id ffacd0b85a97d-4a648622a17mr7753290f8f.7.1795019422213;
        Wed, 18 Nov 2026 08:30:22 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:30:21 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:53 +0000
Subject: [PATCH 31/34] perf test cs-etm: Add a Java JIT source-line test
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-james-coresight-jit-v1-31-dad4d90747f6@linaro.org>
References: <20261118-james-coresight-jit-v1-0-dad4d90747f6@linaro.org>
In-Reply-To: <20261118-james-coresight-jit-v1-0-dad4d90747f6@linaro.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>, 
 Leo Yan <leo.yan@arm.com>, Amir Ayupov <aaupov@fb.com>, 
 Suyash Mahar <smahar@meta.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2

Record a deterministic Java workload using the JVMTI agent and check
that the decoded source lines match the expected sequence.

Alternate fresh class loaders and request garbage collection to
encourage address re-use so that we can test if trace timestamps match
up to jitdump events.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/Makefile.perf                          |  4 +-
 tools/perf/tests/shell/coresight/java-jit.sh      | 65 ++++++++++++++++++
 tools/perf/tests/shell/coresight/lib/PerfJit.java | 82 +++++++++++++++++++++++
 3 files changed, 150 insertions(+), 1 deletion(-)

diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index b74b534e1153..53c10e8e4556 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -992,7 +992,9 @@ install-tests: all install-gtk
 		$(INSTALL) tests/shell/base_report/*.sh '$(DESTDIR_SQ)$(perfexec_instdir_SQ)/tests/shell/base_report'; \
 		$(INSTALL) tests/shell/base_report/*.txt '$(DESTDIR_SQ)$(perfexec_instdir_SQ)/tests/shell/base_report'; \
 		$(INSTALL) -d -m 755 '$(DESTDIR_SQ)$(perfexec_instdir_SQ)/tests/shell/coresight' ; \
-		$(INSTALL) tests/shell/coresight/*.sh '$(DESTDIR_SQ)$(perfexec_instdir_SQ)/tests/shell/coresight'
+		$(INSTALL) tests/shell/coresight/*.sh '$(DESTDIR_SQ)$(perfexec_instdir_SQ)/tests/shell/coresight'; \
+		$(INSTALL) -d -m 755 '$(DESTDIR_SQ)$(perfexec_instdir_SQ)/tests/shell/coresight/lib'; \
+		$(INSTALL) tests/shell/coresight/lib/*.java -m 644 '$(DESTDIR_SQ)$(perfexec_instdir_SQ)/tests/shell/coresight/lib'
 
 install-bin: install-tools install-tests
 
diff --git a/tools/perf/tests/shell/coresight/java-jit.sh b/tools/perf/tests/shell/coresight/java-jit.sh
new file mode 100755
index 000000000000..cb6099efa899
--- /dev/null
+++ b/tools/perf/tests/shell/coresight/java-jit.sh
@@ -0,0 +1,65 @@
+#!/bin/bash
+# CoreSight Java JIT source lines and code address reuse (exclusive)
+# SPDX-License-Identifier: GPL-2.0
+
+set -e
+set -o pipefail
+
+script_dir=$(dirname "$0")
+
+# Requires a HotSpot JDK (11+) and libperf-jvmti with line number support.
+perf list pmu | grep cs_etm > /dev/null || exit 2
+# Require TRBE so that the trace always has virtual timestamps.
+if ! ls /sys/bus/coresight/devices/trbe* > /dev/null 2>&1; then
+	echo "No TRBE sinks, skipping"
+	exit 2
+fi
+command -v java > /dev/null || exit 2
+command -v javac > /dev/null || exit 2
+command -v timeout > /dev/null || exit 2
+for lib in "${LIBJVMTI:-}" \
+	"$(dirname "$(readlink -f "$(type -P perf)")")/libperf-jvmti.so" \
+	"${PREFIX:-/usr}/lib64/libperf-jvmti.so" "${PREFIX:-/usr}/lib/libperf-jvmti.so"; do
+	if [ -f "$lib" ]; then
+		LIBJVMTI=$(readlink -f "$lib")
+		break
+	fi
+done
+[ -f "${LIBJVMTI:-}" ] || { echo "SKIP: missing libperf-jvmti.so"; exit 2; }
+
+tmpdir=$(mktemp -d /tmp/__perf_test.coresight_java_jit.XXXXX)
+trap '[ "$?" -eq 0 ] && rm -rf "$tmpdir" || echo "Java JIT test files retained in $tmpdir"' EXIT
+trap 'exit 1' TERM INT
+
+javac -g --release 11 -d "$tmpdir" "$script_dir/lib/PerfJit.java"
+mkfifo "$tmpdir/ctl" "$tmpdir/ack"
+export JITDUMPDIR="$tmpdir" JITDUMP_USE_ARCH_TIMESTAMP=1
+
+# Compile only run(), and collect trace only while it executes.
+# A small code cache and class unloading encourage address reuse.
+timeout 60s perf record \
+	-o "$tmpdir/data" -e cs_etm//u -D -1 -m ,8M \
+	--control "fifo:$tmpdir/ctl,$tmpdir/ack" -- \
+	java -Xbatch -XX:-TieredCompilation -XX:CompileThreshold=100 \
+	-XX:+UnlockDiagnosticVMOptions -XX:+DebugNonSafepoints \
+	'-XX:CompileCommand=compileonly,PerfJit$*::run' \
+	-XX:ReservedCodeCacheSize=4m -XX:+UseSerialGC \
+	-agentpath:"$LIBJVMTI" -cp "$tmpdir" PerfJit "$tmpdir/ctl" "$tmpdir/ack"
+
+perf inject --jit -b \
+	-i "$tmpdir/data" -o "$tmpdir/injected.data"
+
+perf script \
+	-i "$tmpdir/injected.data" --itrace=i1i -F ip,srcline \
+	--symbols 'PerfJit$First.run(),PerfJit$Second.run()' > "$tmpdir/script"
+
+# The workload runs eight pairs of First.run() and Second.run().
+awk '/\/\/ TRACE$/ { lines = lines "PerfJit.java:" NR "\n" }
+     END { for (i = 0; i < 8; i++) printf "%s", lines }' \
+	"$script_dir/lib/PerfJit.java" > "$tmpdir/expected"
+
+# Ignore entry/return lines and retain the order of the marked Java lines.
+sed -n 's/^.*PerfJit\.java:/PerfJit.java:/p' "$tmpdir/script" | uniq > "$tmpdir/lines"
+grep -Fxf "$tmpdir/expected" "$tmpdir/lines" > "$tmpdir/actual" || true
+diff -u "$tmpdir/expected" "$tmpdir/actual"
+echo "Java JIT source lines match the expected sequence"
diff --git a/tools/perf/tests/shell/coresight/lib/PerfJit.java b/tools/perf/tests/shell/coresight/lib/PerfJit.java
new file mode 100644
index 000000000000..30b22e952bd4
--- /dev/null
+++ b/tools/perf/tests/shell/coresight/lib/PerfJit.java
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0
+import java.io.FileInputStream;
+import java.io.FileWriter;
+import java.io.InputStream;
+import java.util.Arrays;
+
+public class PerfJit {
+    public static class First implements Runnable {
+        public static volatile int value;
+        public void run() {
+            value += 1; // TRACE
+            value += 2; // TRACE
+            value += 3; // TRACE
+            value += 0; // Give the last checked line a DWARF end address.
+        }
+    }
+
+    public static class Second implements Runnable {
+        public static volatile int value;
+        public void run() {
+            value += 4; // TRACE
+            value += 5; // TRACE
+            value += 6; // TRACE
+            value += 0; // Give the last checked line a DWARF end address.
+        }
+    }
+
+    static FileWriter control;
+    static FileInputStream ack;
+
+    static void command(String command) throws Exception {
+        if (control != null) {
+            control.write(command + "\n");
+            control.flush();
+            // perf writes sizeof("ack\n"), including the trailing NUL.
+            byte[] reply = new byte[5];
+            if (ack.readNBytes(reply, 0, reply.length) != reply.length ||
+                !Arrays.equals(reply, new byte[] {'a', 'c', 'k', '\n', 0}))
+                throw new Exception("Missing perf control ack");
+        }
+    }
+
+    static void phase(String name, int repeats) throws Exception {
+        byte[] code;
+        try (InputStream in = PerfJit.class.getResourceAsStream("PerfJit$" + name + ".class")) {
+            code = in.readAllBytes();
+        }
+        // A fresh loader allows this class and its compiled code to be reclaimed.
+        Class<?> block = new ClassLoader(null) {
+            Class<?> load() { return defineClass(null, code, 0, code.length); }
+        }.load();
+        Runnable work = (Runnable) block.getConstructor().newInstance();
+        for (int i = 0; i < 20000; i++)
+            work.run();
+        command("enable");
+        for (int i = 0; i < repeats; i++)
+            work.run();
+        command("disable");
+    }
+
+    public static void main(String[] args) throws Exception {
+        if (args.length >= 2) {
+            control = new FileWriter(args[0]);
+            ack = new FileInputStream(args[1]);
+        }
+        int rounds = args.length >= 3 ? Integer.parseInt(args[2]) : 8;
+        int repeats = args.length >= 4 ? Integer.parseInt(args[3]) : 1;
+        // Warm up the FIFO path before enabling trace for the first method.
+        command("disable");
+        for (int i = 0; i < rounds * 2; i++) {
+            phase(i % 2 == 0 ? "First" : "Second", repeats);
+            for (int gc = 0; gc < 3; gc++) {
+                System.gc();
+                Thread.sleep(20);
+            }
+        }
+        if (control != null) {
+            control.close();
+            ack.close();
+        }
+    }
+}

-- 
2.43.0

