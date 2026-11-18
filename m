Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019426;
	b=oACBwMvyycJJKwfCc7ZNJyHNDO65PVrF1x9GFq/1O/s9uX9/52m3rSxCQexNUANOEPZ1
	 2bMszNNXmWJh9T9cFTNN028/5pxMhSkZM/fRqNZvCJGDOGMFz1oaYX92O77oKHnRJnFEG
	 C/3ZioVrw9/Wxw73ZKae/y0TPPWdMc8ZbiplmAr0X3wqtilUtpYBhzs3beqdkuxqWwZQv
	 PUVyyoDBY/d66yTs8uH3ljpiGS6rattpuhRlP3qcTQQ5ic/gZYG5BDaKIjSpTcH5BOPuP
	 GSCE6zN//OkesA4yIVADL3JwVpc7WA509p0WsMk0Wwt30UKaxtrLP2SIjJEGJD5XK3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019426;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+JJCbgH72G6vONzb178wZztv+bSL7c5y2vdkikA5TlY=;
	b=OSq9tO4wvANMq/OtWXBPE87b3FqFEt/F3d25Vep6YyGOQVOgH8K+QvOGqKd012WIyt0m
	 pVnPkmh5gilOLWR8+T5wNks90g7pHCO6EqcqY+l8QTmRzwQFjz0gcICKctWK0ynLdFWaB
	 yjhwrVAEAkJ8RlZhBUmsxGYjuNbpQ1tNDwaQR75CxJLhYAMXjMRpY9ZPgCW/5ebNqR74U
	 RI12t4JJdAxGimDADMZgXtSDZmNQbnu43AYUfMyOdM9LVDM9F4m1h4d95Q/KUQOt1SNkH
	 MsMKMj7yIS4DtYQ8/rRjI7IP9OrEUV552SG3TepbFA/yhVmXOC7QFYiTsj4Cf89GeEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jKemAnG2;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D5E60A3809
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:30:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01D5E60A3809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jKemAnG2
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so1021456f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019424; x=1795624224; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+JJCbgH72G6vONzb178wZztv+bSL7c5y2vdkikA5TlY=;
        b=jKemAnG2EqLYglHgoJKZAbbrz4+JlIp79Siaq9epllLSNIRGtIA6Mp+DvWtNbkLDiR
         bIx++PY5GdrevibKfaNyk41biICDHcyvFymBNvd8YK/6jZyWESuv9X/1WfaCY6YAJvVu
         hOSlPIafmWyk208IZ/VAoKPq3w4PAMGEfvL9OcubioKg54uEqhAQcHXvKYIjYXRh/cO5
         ZJPjEEboIsHZyBReMIS1sr9ZmSXs9diTplB9BhDPkokHuZsxi7l63//FxSbT7iQWR4xa
         kQ8MCXudaP94YvLVFam+D/NOwVppDFHOXOkiVXrOxtxAacVP9YcUfLfOvX0wQZw1Pbgy
         YObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019424; x=1795624224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+JJCbgH72G6vONzb178wZztv+bSL7c5y2vdkikA5TlY=;
        b=s+ktZw0ONWiuCmCEze+2cIEQrcVnkXcSnjDmg1eudbXlAb4Rped0UIJKCnbUeLdZi8
         MQKbIDxGxW6pbzTabwGgjU/yqyJkRjstIgqYPtqV99sOcWLZcTNNbpeWApF0bKlyEIj0
         koWCxOwJ61RtxDq9N7quaHvhzjz+PFLSvtqcosRRlajTA/j58YA+Q/I7ylX6lw4MvCJV
         BpOS7S1xCttHgOUga3R++SxXlT03fS+5y9aQLFbVxvnPuvqxZ1R2PszIRLorr0lDlgf7
         hC5j8QXyZBiCFh0vUKd5ORcYtvuKWsUv14x52gnFm0rr/j5cOkQIuKgGYo/FeZfheBWb
         8BoA==
X-Forwarded-Encrypted: i=1; AL+hErHKsU9iuk6ha8fD72nIuRW0ciX9b96RjRIm9+fJU1YT14n43E2mu2soNMaHWFu8GJPnNIJLqI3JVEWF9fU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EL9Mo51ZZNItwDI7ozozvqZKiKk6LqbUvo8tEW4m1FJMdW3TR
	wvFviem5hF4Q771H2mksextaSrG/exaoljR9ef37XFTZp9x0nleFxSdxlLdFcoGNaBs=
X-Gm-Gg: AZFdTZcis4uybM9BcMMXUElketbC/y5e7rv5ZkMsJJN7Y5DD/AjC3JLSxO+CI5rvC0R
	5YxjmmjE9jpAj6Hvp2Trt96WyzEV6fa4UG4um4+CxzMajr6t0ZLl4m72mL2Rvmfnd7kVHsHrQGm
	iWyVY6WGSSZxVY7kz3IXjEzZ2vQ5OdEoJeXGSm6k2yPrvWqE19bfd1ZHGYRweQPwYtf8bfkM6CT
	/wny/NvMYPewx5fVfgVGNqgIU177f3y4gcYpUlGXAfVZCNxdaYRtFPJ/Vl73lnvlQ0BMcnecjrl
	GyVraxWN3j9k1f3C3OtDn6IEJSIoIN5IDYZ33hxkYWFHtfhusDkwbLsbYZmpAIQ7mejX6uw5t42
	89ItSy9l6SKAM9ifT4ehErBPdO77IdMpY5zBK6zmrgGr5KWBiPoTl/96qcwCH5y5SOoo4VEwV0W
	EKzc0vknvVSWStXVmxNg8ZhX/3Y8K+iuZLNag9MTlY8i9jNwmGoAOtrax30iOXyT+ErQfnsE7+b
	QgAIYl5/Rk5XLNoQhWolbhvbFNYviZjsQYpAPec/0uc1w4oXPb5V+FbKvrLbT8AmOOJn3HEy3nv
	nfQcqLnCpJfZrzo9AYW2xWgRvS9ZIf8i2A==
X-Received: by 2002:a05:6000:4b19:b0:4a7:7bec:e16d with SMTP id ffacd0b85a97d-4a77bece3f4mr3727104f8f.20.1795019424204;
        Wed, 18 Nov 2026 08:30:24 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:30:23 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:55 +0000
Subject: [PATCH 33/34] perf test cs-etm: Test decoding of kernel modules
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
Message-Id: <20261118-james-coresight-jit-v1-33-dad4d90747f6@linaro.org>
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

If kernel symbols are available, test that recording the kernel results
in etm4_enable* and etm4_disable* symbols. Use these symbols because
they will always be present when using trace.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/shell/coresight/kernel_module.sh | 54 +++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/tools/perf/tests/shell/coresight/kernel_module.sh b/tools/perf/tests/shell/coresight/kernel_module.sh
new file mode 100755
index 000000000000..96bacb02b1fb
--- /dev/null
+++ b/tools/perf/tests/shell/coresight/kernel_module.sh
@@ -0,0 +1,54 @@
+#!/bin/bash -e
+# CoreSight kernel module decode (exclusive)
+
+# SPDX-License-Identifier: GPL-2.0
+
+# If CoreSight is not available, skip the test
+perf list pmu | grep -q cs_etm || exit 2
+
+if [ "$(id -u)" != 0 ]; then
+	# Requires root for kernel trace and symbols
+	echo "[Skip] No root permission"
+	exit 2
+fi
+
+if ! perf probe --dry-run --module coresight_etm4x \
+	--add etm4_enable_trace_unit > /dev/null 2>&1 &&
+   ! perf probe --dry-run --add etm4_enable_trace_unit > /dev/null 2>&1; then
+	echo "[Skip] Kernel debug symbols for Coresight aren't available"
+	exit 2
+fi
+
+tmpdir=$(mktemp -d /tmp/__perf_test.coresight_kernel_module.XXXXX)
+
+cleanup() {
+	rm -rf "${tmpdir}"
+	trap - EXIT TERM INT
+}
+
+trap_cleanup() {
+	cleanup
+	exit 1
+}
+trap trap_cleanup EXIT TERM INT
+
+if ! perf record -o "$tmpdir/data" -e cs_etm//k -- true > /dev/null 2>&1; then
+	echo "[Fail] Failed to record kernel ETM trace"
+	cleanup
+	exit 1
+fi
+
+perf script -i "$tmpdir/data" --itrace=b -F ip,sym \
+	> "$tmpdir/script" 2>/dev/null
+
+# enable_* and disable_* functions always run so check they were decoded
+for symbol in etm4_enable etm4_disable; do
+	if ! grep -q "$symbol" "$tmpdir/script"; then
+		echo "No branches decoded in $symbol"
+		cleanup
+		exit 1
+	fi
+done
+
+cleanup
+exit 0

-- 
2.43.0

