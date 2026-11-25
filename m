Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795579226;
	b=pKBytGi+oIbEqPuTwukBvMguEWKOIlzhe2yA6WF4aGf0Fafe5kcvu8aY1Ce4XsKBi6CC
	 kmqSRV12Qx3gkkmOgQFwSj0PtD+Qo4HZrQpMYKcUDTk9MID83c818XlSwWYtj34KSFrKM
	 3nOU7UIS4l3i/fqlcFXToCEOvLHpZdXttijRggoMtjDcmOAS5izE3NY4ix8x1PyWZtK0k
	 xiqi2HLM+VYQJ2FmhqkBZzYnFmDCpeU/5dbci1xeYM7Top2bRW+C0nWAsK1EgmkACs+eZ
	 MJBAtJomPpnro8aMvHpGmlY+TE7c2SS9jaMd8hTIuDFy1SxBRLblKCeCGTZuGwtFyeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795579226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Z272wPPw5zG0BP9Dk4LUCTCHRpu0SV9ZoE4xf+jSm8M=;
	b=H5L496dxyVU80mxNr/j4/HM0z6gCpMZsZUGsrrfcLRlqynmT1MQuY6Qqr1x6kk3mZ+Eu
	 gdOh/AQ4xTqsP+2JhM0MRKOINwzu3aDFwbY4zSEKYexEgv2LN7uDUtnMsNjoW2kwslwxZ
	 g+Cvgyizku9IMDefBiGmXzvtMpKjUaWB/IU/HSefp0C7Fr94OT9sWvj/2/gBuW5kQQUV7
	 in23b99+rrWTnpziNfohIwoZCZBo+82/S+gG1wDaNGDqF8EraT1/ukwa7EMHHi9HDuk46
	 UGIe+LLkpVQ4Wyu3SwayvMtN4UDT51u6VbiUcBy0zqVdbMhGEoVlCBrn1MNaSVjj7Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RJpK21Ep;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3ED2606A33B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:00:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3ED2606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RJpK21Ep
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b546061d58so11951775c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795579225; x=1796184025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z272wPPw5zG0BP9Dk4LUCTCHRpu0SV9ZoE4xf+jSm8M=;
        b=RJpK21EpflpA3/7NObWyZFF1JNJSszim3rhf+YafYYjaM2mX+PBbXaAQW+qeVLLTSD
         SSa9XJdmEjQT7ZlWlx2TZWc+KXzgjClEMEZum/p6SUKXH859QgpNVT0BC/GKQIV7KI61
         w2bOyjkIK2CkGlxwlOc2AHx4Ial3b1KzOY6Ob3nnRcB8Fy90M/pQOE+9VJP6s/OU4VUr
         41zB+UHvTNGHzHcLf7bAR3ejJBikTJ1qhkwl0UCu/Fs5s1F2YmPnm91JPpIZBYu14UJY
         hWotx7eZVGzOAS5q4gI0i158tQgSE4OeW3pjG3YB/eRrZLfxcBPb2NsWJAiP82Q9Lpdr
         KqHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795579225; x=1796184025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z272wPPw5zG0BP9Dk4LUCTCHRpu0SV9ZoE4xf+jSm8M=;
        b=RyTrqjGhm2fWyVsFRh2Gx7YuBFUwyyjJfYa/uzcFDTuqxmsJym8dISrWDheCbj2m+S
         26Uwn+Gp7lvphLiOZH4rFN3tYex7cZfmi+c//Hjlp70xpcc5VeTujUQ90ca0FWl2cMQ4
         cewhAFwNYjFyWkEMdrut8dXGNYOMjWy9ZlTW0h23tRK95fTjFk9GIvLP1utmFXzWkVye
         DuRO0/mkyPZbF1TV4A+5mBgx6KSULz0ZZwtTmBvd4R0gYfRa+PEc72TepCrLxcwcwMJm
         CBRJZ5eeWFNu2ae4FToaffQww4Yfoc575RpiEdZW8NXzBFId0uiNfaqV3Ka+LuXAsdEf
         058Q==
X-Forwarded-Encrypted: i=1; AL+hErEg6D3vJF5ThaLyqSTQV65rTqcAiDOBqS3+9ZbLmPdqtEFRL3S86BhY3IW44HDRuJjyTS7v0BMSUxJLBJY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3tLjvwRtcyftP6x+aUYX0flvXAQtXbfLih8bsqHqeVvgTRIHQ
	IQteQsftpmYRLVgS9iIWBY9O3utMHZnl0xITkNaKo6F52MvhdPXsPubx
X-Gm-Gg: AZFdTZdmYV28kayKDWyBlwEi6TgHvkf3Sepp0rzxnrF7Y8yFbpUD/cTZtkr+iVrZBt/
	1AB+ozTS12Wr0EXW0Q+RGGdd6SZFUH3qr247q5AXGr9cJxblcTmNmJg/a7zc5wpVjoKEC7HVw0O
	2TWsFyZZms12PkqwDqePb2KzkYVeXo4i5iBpfee6dRUmiVIuefgHSu6Z0jphMkRlcfwqPooTpm8
	5e4oq5Aoe3w8tG7FDHJ2nFnat6fbELpEC8kdJLyzvR9ZqfvOovPuSnxPyetOi77pAEsKlZHjhTj
	aH1ikmGohiCBaLRc/JtQL+SoICGU49qC5fpnSXbqjrQ9g18PqPnBR1r4l4a7TWgqs94l9r3ERPc
	Y13uDCOOPg1tL+odwQthPFpG3QEp6JXBajj5iCqEdl1r3mu1TI9OeRtSkOZM2k5FWLevloiPoNb
	7nb3JM8NUAL9xW8w1QiKlcBuNX31jXK6gcOwiSXfRzyo+l/ZQKRpItuR41LyM4Fp4cT3kru4q1O
	7l/p0ViH3CptcKUdp8KQjfoRk1QoDBYSoLA7C95dDSGT1CLSJTW1D8J3ai2z9HjyrO/45fVpfIw
	RVqY265ipHbIfErA0nbu
X-Received: by 2002:a05:7022:92a:b0:143:26eb:18e9 with SMTP id a92af1059eb24-1b5568eb4dfmr23336562c88.28.1795579224787;
        Tue, 24 Nov 2026 20:00:24 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm57094127c88.14.2026.11.24.20.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:00:24 -0800 (PST)
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
Subject: [PATCH v13 1/2] perf vendor events arm64 AmpereOneX: Fix misspelled PublicDescription keys
Date: Wed, 25 Nov 2026 04:00:15 +0000
Message-ID: <20261125040016.1675748-2-takano32@gmail.com>
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

Sixteen of the 28 entries in mmu.json spell PublicDescription as
"PublicDescrition"; the other 12 spell it correctly.  jevents.py reads
only the keys it asks for by name, so those 16 fields are dead: the text
is dropped without a word and never reaches the generated tables.

Fixing them does not change the perf list output: every one of the 16
entries has a BriefDescription with the same text, and jevents.py drops
the long description when it equals the brief one.

Running jevents.py for arm64 before and after this change gives a
byte-identical generated string table, pmu-events-string.c.

The file becomes self-consistent, and the field works if the brief
text is ever changed on its own.  No text, name, code or expression
changes.

The three AMD entries that spelled BriefDescription as "BriefDescript6ion"
were fixed in a separate patch, which is already in perf-tools-next as
commit edd09316bd37 ("perf vendor events amd: Fix a misspelled JSON key"),
so this patch now touches only the AmpereOneX file.

Written with Hermes Agent, an LLM assistant; the author reviewed it and
ran the generator as described.  perf was built, not run against
hardware.

Fixes: 16438b652b46 ("perf vendor events arm64 AmpereOneX: Add core PMU events and metrics")
Acked-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 .../arch/arm64/ampere/ampereonex/mmu.json     | 32 +++++++++----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/mmu.json b/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/mmu.json
index 66d83b680651..9457f9be4ecc 100644
--- a/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/mmu.json
+++ b/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/mmu.json
@@ -30,37 +30,37 @@
         "BriefDescription": "Data TLB translation cache hit on S2L2 walk cache entry"
     },
     {
-        "PublicDescrition": "Data TLB translation cache hit on S2L1 walk cache entry",
+        "PublicDescription": "Data TLB translation cache hit on S2L1 walk cache entry",
         "EventCode": "0xd805",
         "EventName": "MMU_D_TRANS_CACHE_HIT_S2L1_WALK",
         "BriefDescription": "Data TLB translation cache hit on S2L1 walk cache entry"
     },
     {
-        "PublicDescrition": "Data TLB translation cache hit on S2L0 walk cache entry",
+        "PublicDescription": "Data TLB translation cache hit on S2L0 walk cache entry",
         "EventCode": "0xd806",
         "EventName": "MMU_D_TRANS_CACHE_HIT_S2L0_WALK",
         "BriefDescription": "Data TLB translation cache hit on S2L0 walk cache entry"
     },
     {
-        "PublicDescrition": "Data-side S1 page walk cache lookup",
+        "PublicDescription": "Data-side S1 page walk cache lookup",
         "EventCode": "0xd807",
         "EventName": "MMU_D_S1_WALK_CACHE_LOOKUP",
         "BriefDescription": "Data-side S1 page walk cache lookup"
     },
     {
-        "PublicDescrition": "Data-side S1 page walk cache refill",
+        "PublicDescription": "Data-side S1 page walk cache refill",
         "EventCode": "0xd808",
         "EventName": "MMU_D_S1_WALK_CACHE_REFILL",
         "BriefDescription": "Data-side S1 page walk cache refill"
     },
     {
-        "PublicDescrition": "Data-side S2 page walk cache lookup",
+        "PublicDescription": "Data-side S2 page walk cache lookup",
         "EventCode": "0xd809",
         "EventName": "MMU_D_S2_WALK_CACHE_LOOKUP",
         "BriefDescription": "Data-side S2 page walk cache lookup"
     },
     {
-        "PublicDescrition": "Data-side S2 page walk cache refill",
+        "PublicDescription": "Data-side S2 page walk cache refill",
         "EventCode": "0xd80a",
         "EventName": "MMU_D_S2_WALK_CACHE_REFILL",
         "BriefDescription": "Data-side S2 page walk cache refill"
@@ -90,61 +90,61 @@
         "BriefDescription": "Level 2 instruction translation buffer allocation"
     },
     {
-        "PublicDescrition": "Instruction TLB translation cache hit on S1L2 walk cache entry",
+        "PublicDescription": "Instruction TLB translation cache hit on S1L2 walk cache entry",
         "EventCode": "0xd901",
         "EventName": "MMU_I_TRANS_CACHE_HIT_S1L2_WALK",
         "BriefDescription": "Instruction TLB translation cache hit on S1L2 walk cache entry"
     },
     {
-        "PublicDescrition": "Instruction TLB translation cache hit on S1L1 walk cache entry",
+        "PublicDescription": "Instruction TLB translation cache hit on S1L1 walk cache entry",
         "EventCode": "0xd902",
         "EventName": "MMU_I_TRANS_CACHE_HIT_S1L1_WALK",
         "BriefDescription": "Instruction TLB translation cache hit on S1L1 walk cache entry"
     },
     {
-        "PublicDescrition": "Instruction TLB translation cache hit on S1L0 walk cache entry",
+        "PublicDescription": "Instruction TLB translation cache hit on S1L0 walk cache entry",
         "EventCode": "0xd903",
         "EventName": "MMU_I_TRANS_CACHE_HIT_S1L0_WALK",
         "BriefDescription": "Instruction TLB translation cache hit on S1L0 walk cache entry"
     },
     {
-        "PublicDescrition": "Instruction TLB translation cache hit on S2L2 walk cache entry",
+        "PublicDescription": "Instruction TLB translation cache hit on S2L2 walk cache entry",
         "EventCode": "0xd904",
         "EventName": "MMU_I_TRANS_CACHE_HIT_S2L2_WALK",
         "BriefDescription": "Instruction TLB translation cache hit on S2L2 walk cache entry"
     },
     {
-        "PublicDescrition": "Instruction TLB translation cache hit on S2L1 walk cache entry",
+        "PublicDescription": "Instruction TLB translation cache hit on S2L1 walk cache entry",
         "EventCode": "0xd905",
         "EventName": "MMU_I_TRANS_CACHE_HIT_S2L1_WALK",
         "BriefDescription": "Instruction TLB translation cache hit on S2L1 walk cache entry"
     },
     {
-        "PublicDescrition": "Instruction TLB translation cache hit on S2L0 walk cache entry",
+        "PublicDescription": "Instruction TLB translation cache hit on S2L0 walk cache entry",
         "EventCode": "0xd906",
         "EventName": "MMU_I_TRANS_CACHE_HIT_S2L0_WALK",
         "BriefDescription": "Instruction TLB translation cache hit on S2L0 walk cache entry"
     },
     {
-        "PublicDescrition": "Instruction-side S1 page walk cache lookup",
+        "PublicDescription": "Instruction-side S1 page walk cache lookup",
         "EventCode": "0xd907",
         "EventName": "MMU_I_S1_WALK_CACHE_LOOKUP",
         "BriefDescription": "Instruction-side S1 page walk cache lookup"
     },
     {
-        "PublicDescrition": "Instruction-side S1 page walk cache refill",
+        "PublicDescription": "Instruction-side S1 page walk cache refill",
         "EventCode": "0xd908",
         "EventName": "MMU_I_S1_WALK_CACHE_REFILL",
         "BriefDescription": "Instruction-side S1 page walk cache refill"
     },
     {
-        "PublicDescrition": "Instruction-side S2 page walk cache lookup",
+        "PublicDescription": "Instruction-side S2 page walk cache lookup",
         "EventCode": "0xd909",
         "EventName": "MMU_I_S2_WALK_CACHE_LOOKUP",
         "BriefDescription": "Instruction-side S2 page walk cache lookup"
     },
     {
-        "PublicDescrition": "Instruction-side S2 page walk cache refill",
+        "PublicDescription": "Instruction-side S2 page walk cache refill",
         "EventCode": "0xd90a",
         "EventName": "MMU_I_S2_WALK_CACHE_REFILL",
         "BriefDescription": "Instruction-side S2 page walk cache refill"
-- 
2.53.0

