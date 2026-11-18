Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019437;
	b=hyvdZs3z5YZGKoz3vouLkghKVINMbcof2GESHR2JeTo3weEOuf/bTBv4v36OwmoZlvQu
	 FaMysZr97Y3+6Ftd0lJ+V2dGYOuuOTcSXG2kKIujy/lhrbYNJIMMzH9/iWPgC7hq77aE8
	 4tMmgxkwoB8zs7+GdFiIr1/5YZsOeMSU8kS9h56XoEkUTyvsbza6dxQqhqaUH1y6gSPy2
	 phFmc7pIbdHl9yQiB1k7/Vhpd4rLqiWaIRD+CbkAVbqG7+cCgAu89WNCcLbd0pu6eNqS+
	 O/ISTqOTxYraM6NE4bYnzxBhfyzVRmoGCE9NkFQvAya0uk33EeSWYiEJKmio12uoH0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019437;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=rTvXpEQ89nznZPWxi0xSOEtJetC4t1T0N57WoEYU+Xo=;
	b=zRq4coErqXHW6pCcR9KP34M2r/ccQQAsIczTB5MzFxuYo1cqR2sBoXbRybi0E9ALfgjM
	 GZxcYbBQrVuIptHm6P6AOVW8VvFjFfZwb/VAU5ykoAFVjWVczivIKzEXA22xZNMHzEgHJ
	 vIJcpXOBEIZxgrsGUQMwvjaDPOAgdjHzVTzGh7dmlThV9tg21LMprhaKpnOr+IAWwpqJz
	 Uz+V0ddh1SmJj501bEna7RoW3glSFECj3cYNW8ALrsOGErCEV0Cd2hA2yuUf2D8IlK5xD
	 uYpXd7dhkG2rbsryfuPiyRc/ey4kcKtUEA5YUBuajGR0GTABCZzSea4Ldio+GiR9U2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="Yeh+jj/D";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63AD606C3F8
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:30:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C63AD606C3F8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Yeh+jj/D
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso13639065e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019423; x=1795624223; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rTvXpEQ89nznZPWxi0xSOEtJetC4t1T0N57WoEYU+Xo=;
        b=Yeh+jj/DWeDX0BS/4Oc9RoegdgtuIJ9ndtbjZMAX6yPzVp9zM8JXFnXOt0XgYDz7a0
         +KeYphCNBupAdUxj7GV+R+HaxarC5DWXvWwJIYNyOOoCiVRs9wJmoTtKf3tlxuzNPV+C
         AUUQTZtrkdaWBvuQCwr69SGDk39XGIKHd+YFqfbofHRnSTCumOk38itvQdBRueVgXEGz
         Hn+t1Q95Qfyr3DztGmESGYtZ5NBZ+m55qMMYezG4tOMgjI6eoZBTH5CXI7lii43CFZG6
         WYgmoLAg6PrbCPSRwRhHVsctExoKg+mtShbYgdH1Hbs6oY+9hGbsC12F06aYtNKXtnKm
         pdvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019423; x=1795624223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rTvXpEQ89nznZPWxi0xSOEtJetC4t1T0N57WoEYU+Xo=;
        b=Awm1HRIIzdNQO8GgXawCRaTzigCe47wI0UT8n4z197sojwGE/4OzTsdwQyjWNL+KpB
         Gq+thHSYfRDIdGV79jrs/ZwCzmZkOAwDtClLqi5ByTORGQOGMaHA6R/yJbxskftRg8SO
         Wi6rl6D1J8EQBJniEjX5S9XM34cb/v3xtZeAQQKMJ3gB3COK53UG7qV6iojZMU+cYBV9
         YRrxhvKVF9/jIdiCi533eBOJgMrfAns+vbYhj1W2o+sUDXfts/UElhL492WIGdo+iHAu
         7znBhLvhbxX1CjbL6ha/XXFkBlrNoMQ+Bwr9hrjVHNwndpPeoWcisgTVtHDg0SM9ACvi
         S9gg==
X-Forwarded-Encrypted: i=1; AL+hErGAGNc5638iljHE0f9Iru3xHYmXTsgVF8J5Vnu52SNWM37MweotS6y1U/lH8l8CJRv05YbvqaQ82aRiFVs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oBMEP6ksSs+7uqfbBrOfgIQ5EYfD/6QKFf7bhxVh/JJJpsQno
	1pbznnGUbfKWeAYzg8jtfi5TN7F6lK4fYs1SacutxudulZqaBIihFMgh14Q/LbkvW20=
X-Gm-Gg: AYBFou04v0J5EXlYhHyVDNGL/bnn4xR757xT/YrYeyNjqa+9l+0wsiGCCxnbEcgUUOd
	4qVDcrBJDDa9U9kOr0AUBiXwyFkeo11R48sgVmRkxM8Wk7d6beEL1BVdzThtUSIKYH5FWiPGdtX
	00iUHocslySOaPh8LOiB8s90TU4FciKF2+5uAJHPWoKEykg/EvgHA6JcUUXpLnr5bE3UD2QfzgO
	tsiFrkKTLzQC1jMF2LfsFSn4bAj4ZrYSjqwWmqFiFms2BtFQVs3io/QkFPZv8eIxtl09MZj9P2M
	utpZsS/hrMunAyk6WW7QmD1Yl9U4zwxgaC4KrlLNHOKFMGt9JisiYRGOFI0FJqW7rlxeQFI5cI/
	GQ0WHFP1zYSKgPmUXbHuoUWa77l9Us1mo5sN3j6oad/W5zK5IXz2QrV0rnHc3PVrDE+ErepcC7w
	w8ZJrmfY982SYQNAblytcygAcsBdQL+1ibCwZCWVpMfXpKDDkNMlB7LlZ4DKYoufo5vRlp3HlBo
	4BkkBuAAXlbeaTnE3s2+t5vD0zAQrW2uw14PisMre+Lr79Fxw0I4oEUl0ODT5cGto0s7P7NpSH4
	vV5acOqooY5xNvuJN5740OcrhT3w1q8jmfsy1a2QfVuhaIkj/7Cx7g==
X-Received: by 2002:a05:600c:4e02:b0:4bb:6994:abf0 with SMTP id 5b1f17b1804b1-4bb7da4b889mr64509715e9.23.1795019423221;
        Wed, 18 Nov 2026 08:30:23 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:30:22 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:54 +0000
Subject: [PATCH 32/34] perf test cs-etm: Test trace is ordered with context
 switch records
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
Message-Id: <20261118-james-coresight-jit-v1-32-dad4d90747f6@linaro.org>
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

Enable timestamps in the context switch attribution test and add an
additional check that decoded samples are output in order with context
switch events.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 .../tests/shell/coresight/context_switch_thread.sh   | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/tools/perf/tests/shell/coresight/context_switch_thread.sh b/tools/perf/tests/shell/coresight/context_switch_thread.sh
index 2b9c44b86c59..584661cf47b0 100755
--- a/tools/perf/tests/shell/coresight/context_switch_thread.sh
+++ b/tools/perf/tests/shell/coresight/context_switch_thread.sh
@@ -55,7 +55,7 @@ mkfifo "$cf" "$af"
 # Pin to one CPU so the two threads alternate running but record into the same
 # trace buffer. Start disabled and use the control FIFO to only record the
 # workload and not startup.
-perf record -o "$tmpdir/data" -e cs_etm/timestamp=0/u -C 0 -D -1 --control fifo:"$cf","$af" -- \
+perf record -o "$tmpdir/data" -e cs_etm//u -C 0 -D -1 --control fifo:"$cf","$af" -- \
 	taskset --cpu-list 0 perf test --record-ctl fifo:"$cf","$af" \
 	-w context_switch_loop > /dev/null 2>&1
 
@@ -65,5 +65,23 @@ check_samples
 perf script -i "$tmpdir/data" --itrace=b -F comm,pid,tid,ip,sym > "$tmpdir/script" 2>/dev/null
 check_samples
 
+# Decoded trace should be output in time order with the context switch records.
+# Allow 1ms for estimated trace timestamps.
+perf script -i "$tmpdir/data" --itrace=b --show-switch-events -F time,event > \
+	"$tmpdir/script" 2>/dev/null
+if ! awk 'match($0, /[0-9]+\.[0-9]+:/) {
+		t = substr($0, RSTART, RLENGTH - 1) + 0
+		if (t < last - 0.001) {
+			printf "Time went back %.6fs: %s\n", last - t, $0
+			exit 1
+		}
+		if (t > last)
+			last = t
+	}' "$tmpdir/script"; then
+	echo "Trace was output out of order with context switches"
+	cleanup
+	exit 1
+fi
+
 cleanup
 exit 0

-- 
2.43.0

