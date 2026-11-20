Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795197530;
	b=krBIHr/4xqZD9br57S4oU8CTv3N4cCPggsQv63+eMlKU3ec2027HYPAVRPQZKWC5AwZG
	 kdv6q46cmEl1Kk0qk7mlVVA7is9agDvJW04bzgvmfDI4WQ3WtustHuSMUWBe4XQUWdBpF
	 4wx+lpmP/8PWcjSIq68fzEc1fNomliqxcJ1FwV8BU+aXWMUNQQHgJM3y6o9UGZKGlaqbu
	 maA2wm/HHArz0hkDX2UbZDNdPpp3WA6KFCr7Gzo151yIH3sCyjJR47efiACZuNjLCzpF1
	 P0RtbWhw3avA0IvJgeoyxEdEVjznoIY0NCubclnhcn1sz0Wf0iiwJfJRHlOjTvFVsFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5/QV+3/iD0hbd13hdj+M98vkDtWfM2lwJY6Jp+F/ytQ=;
	b=Z5sFn0IZ9S1EltEmxf2ixDspijm7QJlNCMNheeWYSWwB485U2ia1Zmxh/TGKTxnm+M9M
	 WIktRdrdeyNo/+uo/KQ5qIdmtqiZehTFusfdrNPJkyeN45/+wI8tEtF/vjcVG/QqL+5DJ
	 LDofNJAg4uCOiJxMBolh4UxRh4910dt5Sg+SBDb3g4eA9DMKMzp31MTHAEz2e1stW0sCD
	 +9ZWPXomDbKF28bx6HEjrGF+OMzIhtIANN3779l3nTENleSALxOg2nevHIuGXTTUu0SEB
	 gv/3D7HRJ9G+qU3vmhZkrfHHQeBsUE3RtBJb87Y3Vp5lwQkyatMQAEdoymZi/TSWl4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MfOwqRzj;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1E6606A333
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:58:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF1E6606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MfOwqRzj
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3282db206d3so3131959eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795197529; x=1795802329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5/QV+3/iD0hbd13hdj+M98vkDtWfM2lwJY6Jp+F/ytQ=;
        b=MfOwqRzj9y5Kbc3+7nEsyGolbcgKpX/rH8HOzhuInG9P0zeNNrpCj13Kvn5uRTLauO
         ly/FB3GkKwbqgHgiCbb0FU819JBoo+ul5nl10cXf12kmVs20uMuVXNQcj7q1qSJsEEu3
         +thxDFiJkpZvQsBrsRQHWi4zrjc/eZYyrmSYPrMuXnq+ms9aPaxXxVSRYRvKgaCIgrlq
         bE8ov631xlfGIrlfgH+26K7LWRkFKPNO1Ze05/Zmdqg4FTxqHCbu0CVqnSBObL5o8aeg
         01Iu+J8NWvuwPOC75TeJsKSDFiUGTltfrx9zU4Bj7hFsrr+X1Wuwh3xJTmm76iRPmuop
         aNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795197529; x=1795802329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5/QV+3/iD0hbd13hdj+M98vkDtWfM2lwJY6Jp+F/ytQ=;
        b=Yrl3MTTRp8Na02EfRRG8/P99LiBVcrI7FyEyONAybsziAwzB7df+/4FTJIgWhILctv
         070Luv6WCQ5fL++kXX5qNWrb9eLMyXH0DpAEd7RaWkOVfcdqNkEAtX6Ez3HXbSczOtMz
         8lEI0rYkRIuBazBxO62fChuchdm5IC5xEfQSeLptHoPDxIoPNTSxYyGIdvSrLpAOabus
         sQ/rYCT7kSgsYE4GvaBXT+Br1VeSjOvXBAEsoPU85JJ4RM0w4TKtZHonovWG7A4LMlZ6
         t6xpVDOSl8TgDMXs/u/N6UmmMABRmBLEqGmqNTcKk2QGefWRN8Kr5UtD+yMyl8aFrSWq
         ACxw==
X-Forwarded-Encrypted: i=1; AL+hErGAFJ3KRYqZkZlyJ5HN1YnkEkQdCjrEclpUnpB3AGBZas1i7ziwH/SQAbqr6d18kUBD/SIKKUhDvTIObwY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+r9W3ZUXT5z+Vtidhu7Ic1NCRYPvNFFNGqffffap5J+IDWeoKr
	OEjXiVwFCgkijfE6jAyzN2my4pttSNydsjCyaxDFzj72iGIIF4RZHFkP
X-Gm-Gg: AYBFou2hMwl03eq2IUpnm0HmoWlbSUHb4qpxkCHo/SwjBlHHlHHKXnDvlDyApT7pIF+
	e+8awcA0TadQFHBE+hBWBKaz9GGt3qTKOfdqKdJur5cHOsfoy7+icRDEVfUyHLnDFh3LaajdET3
	llzqxJADqduWURuAlgkUTEl1LhmFkc76Z89GOx8WK9cKrGuthTSkKDbZzjmoALLz90PfN85Su04
	RZ4iBCXApvblT15XXJW0uz15HGzu+D4t8EulfE7Ev9RZw5r6gkxKBC/7wjPMUSUewGmnpTlPuCG
	rs/mM5MZOUYVN0hi3r9EA6wSW9jUrao871epgf1qbQrwd2c9gof6ieP7A/PNg17Zyk9NitNVnmf
	pCiMIKqSHZ0Z0XKuruSE+D8dBzaQB+0RF2unjS6NmI9Q3QRmOQpMqGLdpTLEUV98q06qUZvzncA
	aIkq+PsnuCI0EbbTP40XtQdz/IN3zXvof4Tnlps8UM3TDB27jFzoboE17aUZMX+KQsQfUdmx5dF
	8WlALfUbsR1SQk+90xbRRgjhBW0XVi9E2BR6dqwaXTcY1fdClQ+A4mCmRci9zIMCBABXbf6VmQq
	PMXltZCRzApHxZ4Mh9un
X-Received: by 2002:a05:7022:2207:b0:166:b307:5855 with SMTP id a92af1059eb24-1b556688160mr5050309c88.0.1795197528972;
        Fri, 20 Nov 2026 09:58:48 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b562a82b3fsm681084c88.5.2026.11.20.09.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:58:48 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: linux-perf-users@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH 2/3] perf vendor events intel: Fix misspellings in the Intel model tables
Date: Fri, 20 Nov 2026 17:58:39 +0000
Message-ID: <20261120175840.1274637-3-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120175840.1274637-1-takano32@gmail.com>
References: <20261120175840.1274637-1-takano32@gmail.com>
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

Five descriptions are misspelled: "Prediciton" instead of "Prediction"
four times (the BPU_CLEARS.EARLY event in the westmereep-dp,
westmereep-sp, nehalemep and nehalemex pipeline tables), and "contoller"
instead of "controller" in the sierraforest srf-metrics table.  Four of
the five are event descriptions, which `perf list` prints as they are; the
fifth is a metric description, printed by `perf list metric`.

Only the descriptions change.  Regenerating the tables with

  jevents.py x86 all tools/perf/pmu-events/arch out.c out-str.c

leaves every event name and event code untouched, and the generated
out-str.c shrinks by 477 bytes, because the corrected text becomes
identical to descriptions that were already stored for other models and
the duplicates are dropped.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 tools/perf/pmu-events/arch/x86/nehalemep/pipeline.json       | 2 +-
 tools/perf/pmu-events/arch/x86/nehalemex/pipeline.json       | 2 +-
 tools/perf/pmu-events/arch/x86/sierraforest/srf-metrics.json | 2 +-
 tools/perf/pmu-events/arch/x86/westmereep-dp/pipeline.json   | 2 +-
 tools/perf/pmu-events/arch/x86/westmereep-sp/pipeline.json   | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/perf/pmu-events/arch/x86/nehalemep/pipeline.json b/tools/perf/pmu-events/arch/x86/nehalemep/pipeline.json
index 869c84fa7c60..af823669fe71 100644
--- a/tools/perf/pmu-events/arch/x86/nehalemep/pipeline.json
+++ b/tools/perf/pmu-events/arch/x86/nehalemep/pipeline.json
@@ -51,7 +51,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Early Branch Prediciton Unit clears",
+        "BriefDescription": "Early Branch Prediction Unit clears",
         "Counter": "0,1,2,3",
         "EventCode": "0xE8",
         "EventName": "BPU_CLEARS.EARLY",
diff --git a/tools/perf/pmu-events/arch/x86/nehalemex/pipeline.json b/tools/perf/pmu-events/arch/x86/nehalemex/pipeline.json
index 869c84fa7c60..af823669fe71 100644
--- a/tools/perf/pmu-events/arch/x86/nehalemex/pipeline.json
+++ b/tools/perf/pmu-events/arch/x86/nehalemex/pipeline.json
@@ -51,7 +51,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Early Branch Prediciton Unit clears",
+        "BriefDescription": "Early Branch Prediction Unit clears",
         "Counter": "0,1,2,3",
         "EventCode": "0xE8",
         "EventName": "BPU_CLEARS.EARLY",
diff --git a/tools/perf/pmu-events/arch/x86/sierraforest/srf-metrics.json b/tools/perf/pmu-events/arch/x86/sierraforest/srf-metrics.json
index ca2c55917e55..a3d8c136334e 100644
--- a/tools/perf/pmu-events/arch/x86/sierraforest/srf-metrics.json
+++ b/tools/perf/pmu-events/arch/x86/sierraforest/srf-metrics.json
@@ -107,7 +107,7 @@
         "ScaleUnit": "1per_instr"
     },
     {
-        "BriefDescription": "Bandwidth observed by the integrated I/O traffic contoller (IIO) of IO reads that are initiated by end device controllers that are requesting memory from the CPU",
+        "BriefDescription": "Bandwidth observed by the integrated I/O traffic controller (IIO) of IO reads that are initiated by end device controllers that are requesting memory from the CPU",
         "MetricExpr": "UNC_IIO_DATA_REQ_OF_CPU.MEM_READ.ALL_PARTS * 4 / 1e6 / duration_time",
         "MetricName": "iio_bandwidth_read",
         "ScaleUnit": "1MB/s"
diff --git a/tools/perf/pmu-events/arch/x86/westmereep-dp/pipeline.json b/tools/perf/pmu-events/arch/x86/westmereep-dp/pipeline.json
index 0267788d9dce..e50ce906ed7b 100644
--- a/tools/perf/pmu-events/arch/x86/westmereep-dp/pipeline.json
+++ b/tools/perf/pmu-events/arch/x86/westmereep-dp/pipeline.json
@@ -51,7 +51,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Early Branch Prediciton Unit clears",
+        "BriefDescription": "Early Branch Prediction Unit clears",
         "Counter": "0,1,2,3",
         "EventCode": "0xE8",
         "EventName": "BPU_CLEARS.EARLY",
diff --git a/tools/perf/pmu-events/arch/x86/westmereep-sp/pipeline.json b/tools/perf/pmu-events/arch/x86/westmereep-sp/pipeline.json
index 0267788d9dce..e50ce906ed7b 100644
--- a/tools/perf/pmu-events/arch/x86/westmereep-sp/pipeline.json
+++ b/tools/perf/pmu-events/arch/x86/westmereep-sp/pipeline.json
@@ -51,7 +51,7 @@
         "UMask": "0x1"
     },
     {
-        "BriefDescription": "Early Branch Prediciton Unit clears",
+        "BriefDescription": "Early Branch Prediction Unit clears",
         "Counter": "0,1,2,3",
         "EventCode": "0xE8",
         "EventName": "BPU_CLEARS.EARLY",
-- 
2.53.0

