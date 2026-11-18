Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019436;
	b=lQaCKNz649IyTgS1A5i8Ori3ypZX/U5ITrS61bA3mTl2kfPPT8IsezgbXK5wldDWHM3a
	 JpqRHhIxvS/ALHH8bOcbTGwhnzhrDFJU27m3r1ByWoSvRdxjgfJUiDKEy1XS3/nGPQ0uf
	 QRQjcdWQ5GRR2i7e0NRhMJcWezA9eMd3Y4dZiLx/OgYf4uMsLgvZT6HMrTdP6OXXIdrsB
	 s8B16gR7mFJvfH95WsKrn3V0dLDtG1mQEbRrtuBq1ZJr6kwCpHPPF7J09FJcMtFSuwdN7
	 k3MeytXjjFMmwojtLaZ+4mCPy1AqDNADCRH7sodoFeo4os+VgbFhfN44ym1g8IbQRqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019436;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=oCXi5c27gxkETQPEkp8qfLLdejyp5sedYaxTjamqL5A=;
	b=stFvzUB2+yLtfm62FCwoY3D8soN9qrfEp3HMGOOmXxOmEj7/nA33dSQDSLE1/O7hRpqd
	 NGPFI37hXvniLwUrWcFgjs7t+IpH7Uv3JR6fXUSUhhQiJhc//HknZSwzwMImM36Dt6bN+
	 jqrG5Ni3eBKzAuADSCXExzf9+d5DnSBM3nCw519VKkDDM1oOKFXDvbVrStcDTDpZF8p0Z
	 nR09w9q493eJh0IqzcL7efOCW9pRXJR7AjccqjewYmGq5RFX1bHUYWvU9uS7wxuoaA2kP
	 8tBCBWqHugDNsrKq6/BOTyJ6kGimAwSZYmmWMjPRqchy8nXsxietEoYKtVUXdPyIoYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xnSA56rT;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D813A606C3F6
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:30:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D813A606C3F6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xnSA56rT
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-492690dd5daso987343f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019425; x=1795624225; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oCXi5c27gxkETQPEkp8qfLLdejyp5sedYaxTjamqL5A=;
        b=xnSA56rTuhEKTBnNx9gEjZEUUyG0bfkdmDokZuVVyepEEewvWYPFfroZ9LrD1HI5to
         je7PpnzqWmp1MfddWISl+13PBH+x49rn+E3I2USb8SL+CJTqL1RFh2rU+X8t5IwqL/Xq
         B6J5ES6rizofEX6YEzeUdTd83s6uZ3uqszbPCStQeKoqdgavVpgUZJCP9dkPDcWp5Rpi
         0in0AeNDKitnado43ReZlDEBOWrTW+1HHMSpjuoZMLNDd79EOWWq3gKIqiprAeoTxZbN
         yv2/eaijh9uha8x+rKkDVUmNJ362HpBDM1lXWak5QKo9AvsTpLH3UeueKNwmb9kJBzjh
         AY8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019425; x=1795624225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oCXi5c27gxkETQPEkp8qfLLdejyp5sedYaxTjamqL5A=;
        b=VDBBGmG5IPPGh4eGZQ983AJACL3hyoApagLNFELjrMnemEEWoYjA46jkwLq0jSNMje
         NIgoAUYZ9ZdLKuIT5qPzVUJMdCyDhcPeK6VppH0TsDVyxHKaoken3eOkQBt/B4a9XBTi
         Z8KdlmPEdAcuFUF3Co7gg23WcfeZpEU+vz4pP2gyUBvY7jBRPqJloF5k7q5ugD7ZeBrU
         x0b/JPIqBqJbt9Oi/J+G9XCZttIpkcRcCK5IHvbZCRuLZRBZlRs7LoQ+a5LeuArpLbwT
         WPl3Vyl0pmOmdq+vChtK4bnvqFtcRAB1xagpgiT+NLdKjBfUHb4tEfw7E+UEodE6gbxs
         TVig==
X-Forwarded-Encrypted: i=1; AL+hErF8kkb0MpnMuRt+9X7y7LnXRZ8DMs+Ud6EK//R7bo+5X+x1v6ZjLkBbSVdn/N4sQkxbqlI4ouC8BMtMaoU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HDSaoD5N8r5aHW5PIdMkgq/hHDONRX+h1oaDZc1iDxmINTfjX
	SO/KbNC5/DXmMmD4U0T/GJSJKSoHF/tHB4u7UjZSbsR+ZQ1OLKNLYRis5Hxyy0j9B9E=
X-Gm-Gg: AZFdTZeeyIutJde7J1X/pc9zV0RjENv0UI31wH6D6bkU/aPJigGlX2nDGAHBpPWz3bS
	jy68cnBHwvh94The5SJtoo6bABX7ekg6Y56rQriOg8N/m/OyUWBo+phKldODWpGhca2F8knddBa
	vVFfL4SpxWSogw/f/IrhFbnUw1+YcOtzCWEMFZ/auVojqmb9ba/hlGYHgQXRFnQ5SmT8yDdsp+k
	NUkFBe7i0YJwMm84Zh1Ek4BMNOCAIlqyY7fZJHChZnnSKLXR0z2OD+/MNjPkWCbuMPfesCPlxnp
	JY+u98XM7WfX9ZX9MlBkb0spAGw09D0c7sZW3oAmGqqsT3I9eG8tc1qzT72oDrW2B5SCLXmjuOE
	jvAKD84AMb/VQHqF3JwItdYPMchgfX/CyycN0b1WQ5SjMmhYUOXvTLFLEs8trL6HOCAXyYWHdba
	INeZzIRSmTrf3Ncr4MrsRuCdZ0aWXnYdZW8SuxESHLcxRQL+MCpERxsf92SwYtTHMHUm/ZV78FC
	q2GmzdWWIL7c1H5vvOSlN0snPFQZV3g67lx8BDDs9XxuHDE7ymJbLUcXteUw7kX9mo9rCePxKb2
	107OSnxLiAr9v67r9D+9WAX1r1YhQr0M
X-Received: by 2002:a05:6000:26ca:b0:4a7:9630:7b57 with SMTP id ffacd0b85a97d-4a7963080f2mr4671595f8f.44.1795019425254;
        Wed, 18 Nov 2026 08:30:25 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:30:24 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:56 +0000
Subject: [PATCH 34/34] perf test cs-etm: Add an HHVM JIT call stack test
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
Message-Id: <20261118-james-coresight-jit-v1-34-dad4d90747f6@linaro.org>
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

Record a Hack workload with HHVM's jitdump enabled and compare the
decode matches the expected order of execution.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/shell/coresight/hhvm-jit.sh | 89 ++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/tools/perf/tests/shell/coresight/hhvm-jit.sh b/tools/perf/tests/shell/coresight/hhvm-jit.sh
new file mode 100755
index 000000000000..cde8725519e6
--- /dev/null
+++ b/tools/perf/tests/shell/coresight/hhvm-jit.sh
@@ -0,0 +1,89 @@
+#!/bin/bash
+# CoreSight HHVM JIT call stacks (exclusive)
+# SPDX-License-Identifier: GPL-2.0
+
+set -e
+set -o pipefail
+
+perf list pmu | grep cs_etm > /dev/null || exit 2
+# Require TRBE so that the trace always has virtual timestamps.
+if ! ls /sys/bus/coresight/devices/trbe* > /dev/null 2>&1; then
+	echo "No TRBE sinks, skipping"
+	exit 2
+fi
+command -v hhvm > /dev/null || { echo "SKIP: missing hhvm"; exit 2; }
+
+tmpdir=$(mktemp -d /tmp/__perf_test.coresight_hhvm_jit.XXXXX)
+trap '[ "$?" -eq 0 ] && rm -rf "$tmpdir" || echo "HHVM JIT test files retained in $tmpdir"' EXIT
+trap 'exit 1' TERM INT
+
+# Use the control pipe to only trace the two call stacks rather than all of HHVM's startup.
+# Run stacks() twice to test hot and cold versions.
+cat > "$tmpdir/hello.hack" << 'EOF'
+function command(resource $ctl, resource $ack, string $cmd): void {
+  \fwrite($ctl, $cmd."\n");
+  \fflush($ctl);
+  // perf writes sizeof("ack\n"), including the trailing NUL.
+  invariant(\fread($ack, 5) === "ack\n\0", "Missing perf control ack");
+}
+
+<<__NEVER_INLINE>>
+function leaf(string $s): void {
+  echo $s;
+}
+
+<<__NEVER_INLINE>>
+function a2(string $s): void {
+  leaf($s);
+}
+
+<<__NEVER_INLINE>>
+function a1(string $s): void {
+  a2($s);
+}
+
+<<__NEVER_INLINE>>
+function b1(string $s): void {
+  leaf($s);
+}
+
+<<__NEVER_INLINE>>
+function stacks(string $hello, string $world): void {
+  a1($hello);
+  b1($world);
+}
+
+<<__EntryPoint>>
+function main(): void {
+  $ctl = \fopen(\getenv("PERF_CTL_FIFO") as string, "w");
+  $ack = \fopen(\getenv("PERF_ACK_FIFO") as string, "r");
+  command($ctl, $ack, "enable");
+  stacks("Hello, ", "world\n");
+  stacks("Hello, ", "world\n");
+  command($ctl, $ack, "disable");
+}
+EOF
+mkfifo "$tmpdir/ctl" "$tmpdir/ack"
+export PERF_CTL_FIFO="$tmpdir/ctl" PERF_ACK_FIFO="$tmpdir/ack"
+export JITDUMP_USE_ARCH_TIMESTAMP=1
+
+# HHVM deletes the jitdump on exit unless KeepPerfPidMap is set.
+perf record \
+	-o "$tmpdir/data" -e cs_etm//u -D -1 -m ,8M \
+	--control "fifo:$tmpdir/ctl,$tmpdir/ack" -- \
+	hhvm -vEval.PerfJitDump=1 -vEval.PerfJitDumpDir="$tmpdir" \
+	-vEval.KeepPerfPidMap=1 "$tmpdir/hello.hack" > "$tmpdir/out"
+[ "$(cat "$tmpdir/out")" = "$(printf 'Hello, world\nHello, world')" ]
+
+perf inject --jit -b \
+	-i "$tmpdir/data" -o "$tmpdir/injected.data"
+
+perf script -i "$tmpdir/injected.data" \
+	--itrace=b -F ip,sym > "$tmpdir/script"
+
+stacks="stacks a1 a2 leaf a2 a1 stacks b1 leaf b1 stacks"
+printf '%s\n' main $stacks main $stacks main > "$tmpdir/expected"
+sed -nE 's/^.*hello\.hack::(main|stacks|a1|a2|b1|leaf)$/\1/p' "$tmpdir/script" |
+	uniq > "$tmpdir/actual"
+diff -u "$tmpdir/expected" "$tmpdir/actual"
+echo "HHVM JIT call stacks match the expected sequence"

-- 
2.43.0

