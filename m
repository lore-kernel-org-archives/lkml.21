Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795037222;
	b=cEqNfJXZ2dytm9ZTsCONIqb4DKNtuXYAH6vYrx+oYnjQMySMpGxsKlZMsgAptp2Mfd1Y
	 1uxkucKy1DUCsAd4uLHCo/QFiJlTkjAn70Lwvqsm3nNnd7kn0rQlXgV/jdvOtj8Fobu74
	 56t1gGkz8j/ICIOhNjHR1PRLctd3c182ceNuNxBalUuDIhUDuMxHZSyTYNu/+uwlWYiFA
	 b+aOqcfn6cx+dg1GewLKpPR8DoGbxeiRE03UxMrz3iDalT0gKYUqn76VirkneO2GXgRyh
	 p4mLaJh4UoMuFeBdSqg1jRLPZaREwedgtCRbtVIyxYK2TPD66yvrH3gHkIRfWZvuLUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795037222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=P89CF3CPft2khfg64UcBa2amXiqRJ2VmryBzzg+OJTI=;
	b=zNzaH6Pqt9KuEZyLE1cTbCOVNJip9QXjopsWZZFEU2TsuhK8s13CeOlt/VQ3l2SVIMUw
	 WnIe5Vj+8AquCx8bQdk+4LLyfwFGV0Wd75Ge4iNAieHkQhvxKyL5dGbutxxgnpB5vUFqI
	 daItUNCY0dBL05aLtkN/U3hWcHK+nF6SFAdhI7RNDBfVpRXHuUUrPbB/4g9ZztwH5HeJV
	 qyDK4yzBRmZq4GlrDd6iqc0sAtZKFzC6gdfcfbL31Kt63xpuh+7X3Wl+ht2mwybNgY/BJ
	 4T0JA/J0U6T5pWYOSAmtmb2Uy6P4IpIkp8So5fdu456V93yBCQ/Lr69f/RmkGn+SVqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ctshao.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=da+vMtzz;
	arc=none smtp.remote-ip=209.85.210.70
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EF360A2600
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82EF360A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ctshao.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=da+vMtzz
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-862cfd7092bso1124685a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795037221; x=1795642021; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=P89CF3CPft2khfg64UcBa2amXiqRJ2VmryBzzg+OJTI=;
        b=da+vMtzzM0IOPdvtyCq5TF1AJRkpsKBX4yQknrje2o6RiSmO0BXHUygCHDoW47Qd7/
         uxAv7gN0B5ORCwiIvM6TctFuCo7ZU4KffZUjI+nnat+AJ2rbQVo4e5J8ZTycvHsFnUrs
         bTLpyLW2zDbhXsKWa3TQ+7Hsm/3MR4DbM34tBfc/NNH7cF6qKsDS2jMrZIPifFJ8A+qA
         yR7cmescd4LD7lzqrfQ7yAQKDkYxwikuca5Q5K4zKm+Rc6abT6gSZc4TrFtcIue7g5xz
         445AfXj+QwocLXRmRAvkkvxQfvD8tgClxZJ//3JTetjZISi7sBdsfUG110JsIZwrJjTw
         VdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795037221; x=1795642021;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P89CF3CPft2khfg64UcBa2amXiqRJ2VmryBzzg+OJTI=;
        b=dh+SVhm0hcuDPIOyAxtJDPh2Panerj5Bpcbeygn/KdLHvYV7B5VFTZyMqqJU9wYEqo
         tLtfdtwk0A0q3IYOy3W6jZync6mtuO/znJPiLQKDgMOIv2umBuI4W3QtRuWkAPbJIhzq
         PU/GWJpaAJJNiQeZz2cWKqzCADLYRePpvDlnsrt8WOGJ6zqSLumSbW1/dr2e3XqJFvQA
         OZKfGGtM0nyritAqDS7JGsSoUDrHBbZqk1sg2L/Rkhmp6xsQgI8UGe7/E9yacaGZsgzK
         6ie0cXwT3zuM5faNT6iIM+xbjQ4dXMv5KcugqvlRH+QxQX8Sja78nvnQGLaH6qnIeb3S
         RFTg==
X-Forwarded-Encrypted: i=1; AL+hErGIERDqTXDfodj6fiV6k6tuw5kEQeRtBn+BCE46NGO/bcRf0zm0GyN3tQ9Q8f7OX7KZh4XRgL35ETYpwaQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wik26igqCmF1VTmJ0nKyft6rHxdeelLdB7cddldK+IY7h9Bjj
	/HqixlklQMm8Ra8rz6LTUp8sDCUbOvLCHyc7smo17EGzB1Tj/kFHFCMGWuHGadkwnUSTbGLDaqj
	8HlRFsQ==
X-Received: from jafm4-n1.prod.google.com ([2002:a05:6638:8c44:10b0:60b:77aa:12a3])
 (user=ctshao job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:2384:b0:573:b907:d551
 with SMTP id 5614622812f47-5773a8ece8bmr4391641b6e.6.1795037221296; Wed, 18
 Nov 2026 13:27:01 -0800 (PST)
Date: Wed, 18 Nov 2026 13:26:54 -0800
In-Reply-To: <20261118212655.2262601-1-ctshao@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118212655.2262601-1-ctshao@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118212655.2262601-3-ctshao@google.com>
Subject: [PATCH v1 2/3] perf vendor events intel: Update lunarlake events from
 1.26 to 1.27
From: Chun-Tse Shao <ctshao@google.com>
To: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org
Cc: mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	irogers@google.com, adrian.hunter@intel.com, james.clark@linaro.org, 
	dapeng1.mi@linux.intel.com, thomas.falcon@intel.com, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Chun-Tse Shao <ctshao@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The updated events were published in:
https://github.com/intel/perfmon/commit/99819cdd185adc5eb117eb78296bc29f15e=
9c5e7

Signed-off-by: Chun-Tse Shao <ctshao@google.com>
Assisted-by: Gemini:gemini-4-carbon
---
 .../pmu-events/arch/x86/lunarlake/cache.json  |  2 +-
 .../pmu-events/arch/x86/lunarlake/memory.json | 27 +++++++++++-
 .../pmu-events/arch/x86/lunarlake/other.json  | 19 ++++++++
 .../arch/x86/lunarlake/pipeline.json          | 44 +++++++++++++++++--
 tools/perf/pmu-events/arch/x86/mapfile.csv    |  2 +-
 5 files changed, 87 insertions(+), 7 deletions(-)

diff --git a/tools/perf/pmu-events/arch/x86/lunarlake/cache.json b/tools/pe=
rf/pmu-events/arch/x86/lunarlake/cache.json
index c77040e87639..0789ce3db1a0 100644
--- a/tools/perf/pmu-events/arch/x86/lunarlake/cache.json
+++ b/tools/perf/pmu-events/arch/x86/lunarlake/cache.json
@@ -1652,7 +1652,7 @@
         "EventCode": "0x2c",
         "EventName": "SQ_MISC.BUS_LOCK",
         "PublicDescription": "Counts the more expensive bus lock needed to=
 enforce cache coherency for certain memory accesses that need to be done a=
tomically.  Can be created by issuing an atomic instruction (via the LOCK p=
refix) which causes a cache line split or accesses uncacheable memory.",
-        "SampleAfterValue": "100003",
+        "SampleAfterValue": "503",
         "UMask": "0x10",
         "Unit": "cpu_core"
     },
diff --git a/tools/perf/pmu-events/arch/x86/lunarlake/memory.json b/tools/p=
erf/pmu-events/arch/x86/lunarlake/memory.json
index caa387e10259..3c005420b7f1 100644
--- a/tools/perf/pmu-events/arch/x86/lunarlake/memory.json
+++ b/tools/perf/pmu-events/arch/x86/lunarlake/memory.json
@@ -141,7 +141,7 @@
         "Counter": "0,1,2,3,4,5,6,7,8,9",
         "EventCode": "0xc3",
         "EventName": "MACHINE_CLEARS.MEMORY_ORDERING",
-        "PublicDescription": "Counts the number of Machine Clears detected=
 dye to memory ordering. Memory Ordering Machine Clears may apply when a me=
mory read may not conform to the memory ordering rules of the x86 architect=
ure",
+        "PublicDescription": "Counts the number of Machine Clears detected=
 due to memory ordering. Memory Ordering Machine Clears may apply when a me=
mory read may not conform to the memory ordering rules of the x86 architect=
ure",
         "SampleAfterValue": "100003",
         "UMask": "0x2",
         "Unit": "cpu_core"
@@ -155,6 +155,18 @@
         "UMask": "0x82",
         "Unit": "cpu_atom"
     },
+    {
+        "BriefDescription": "Counts randomly selected loads when the laten=
cy from first dispatch to completion is greater than any number of cycles."=
,
+        "Counter": "2,3,4,5,6,7,8,9",
+        "Data_LA": "1",
+        "EventCode": "0xcd",
+        "EventName": "MEM_TRANS_RETIRED.LOAD_LATENCY",
+        "MSRIndex": "0x3F6",
+        "PublicDescription": "Counts randomly selected loads when the late=
ncy from first dispatch to completion is greater than any number of cycles.=
  Reported latency may be longer than just the memory latency.",
+        "SampleAfterValue": "100003",
+        "UMask": "0x1",
+        "Unit": "cpu_core"
+    },
     {
         "BriefDescription": "Counts randomly selected loads when the laten=
cy from first dispatch to completion is greater than 1024 cycles.",
         "Counter": "2,3,4,5,6,7,8,9",
@@ -194,6 +206,19 @@
         "UMask": "0x1",
         "Unit": "cpu_core"
     },
+    {
+        "BriefDescription": "Counts randomly selected loads when the laten=
cy from first dispatch to completion is greater than 2 cycles.",
+        "Counter": "2,3,4,5,6,7,8,9",
+        "Data_LA": "1",
+        "EventCode": "0xcd",
+        "EventName": "MEM_TRANS_RETIRED.LOAD_LATENCY_GT_2",
+        "MSRIndex": "0x3F6",
+        "MSRValue": "0x2",
+        "PublicDescription": "Counts randomly selected loads when the late=
ncy from first dispatch to completion is greater than 2 cycles.  Reported l=
atency may be longer than just the memory latency.",
+        "SampleAfterValue": "100003",
+        "UMask": "0x1",
+        "Unit": "cpu_core"
+    },
     {
         "BriefDescription": "Counts randomly selected loads when the laten=
cy from first dispatch to completion is greater than 2048 cycles.",
         "Counter": "2,3,4,5,6,7,8,9",
diff --git a/tools/perf/pmu-events/arch/x86/lunarlake/other.json b/tools/pe=
rf/pmu-events/arch/x86/lunarlake/other.json
index 164374edf293..0475ba321e04 100644
--- a/tools/perf/pmu-events/arch/x86/lunarlake/other.json
+++ b/tools/perf/pmu-events/arch/x86/lunarlake/other.json
@@ -101,6 +101,25 @@
         "UMask": "0x10",
         "Unit": "cpu_atom"
     },
+    {
+        "BriefDescription": "Counts the number of LBR entries recorded. Re=
quires LBRs to be enabled in IA32_LBR_CTL. [This event is alias to MISC_RET=
IRED.LBR_INSERTS]",
+        "Counter": "0,1,2,3,4,5,6,7",
+        "EventCode": "0xe4",
+        "EventName": "LBR_INSERTS.ANY",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x1",
+        "Unit": "cpu_atom"
+    },
+    {
+        "BriefDescription": "LBR record is inserted [This event is alias t=
o MISC_RETIRED.LBR_INSERTS]",
+        "Counter": "0,1,2,3,4,5,6,7,8,9",
+        "EventCode": "0xe4",
+        "EventName": "LBR_INSERTS.ANY",
+        "PublicDescription": "LBR record is inserted [This event is alias =
to MISC_RETIRED.LBR_INSERTS] Available PDIST counters: 0,1",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x1",
+        "Unit": "cpu_core"
+    },
     {
         "BriefDescription": "Counts all requests that have any type of res=
ponse.",
         "Counter": "0,1,2,3,4,5,6,7",
diff --git a/tools/perf/pmu-events/arch/x86/lunarlake/pipeline.json b/tools=
/perf/pmu-events/arch/x86/lunarlake/pipeline.json
index 5d8bd972d463..42c82b68a2f2 100644
--- a/tools/perf/pmu-events/arch/x86/lunarlake/pipeline.json
+++ b/tools/perf/pmu-events/arch/x86/lunarlake/pipeline.json
@@ -975,7 +975,7 @@
         "Counter": "0,1,2,3,4,5,6,7,8,9",
         "EventCode": "0xc0",
         "EventName": "INST_RETIRED.REP_ITERATION",
-        "PublicDescription": "Number of iterations of Repeat (REP) string =
retired instructions such as MOVS, CMPS, and SCAS. Each has a byte, word, a=
nd doubleword version and string instructions can be repeated using a repet=
ition prefix, REP, that allows their architectural execution to be repeated=
 a number of times as specified by the RCX register. Note: Since the number=
 of iterations within a REP instruction can be significantly affected by fa=
st strings, this event may vary run to run and not match the architectural =
number of iterations (specified by RCX) Available PDIST counters: 0,1",
+        "PublicDescription": "Number of iterations of Repeat (REP) string =
retired instructions such as MOVS, CMPS, and SCAS. Each has a byte, word, a=
nd doubleword version and string instructions can be repeated using a repet=
ition prefix, REP, that allows their architectural execution to be repeated=
 a number of times as specified by the RCX register. Note: Since the number=
 of iterations within a REP instruction can be significantly affected by fa=
st strings, this event may vary from run to run and not match the architect=
ural number of iterations (specified by RCX). Available PDIST counters: 0,1=
",
         "SampleAfterValue": "2000003",
         "UMask": "0x8",
         "Unit": "cpu_core"
@@ -1486,7 +1486,7 @@
         "Unit": "cpu_core"
     },
     {
-        "BriefDescription": "Counts the number of LBR entries recorded. Re=
quires LBRs to be enabled in IA32_LBR_CTL.",
+        "BriefDescription": "Counts the number of LBR entries recorded. Re=
quires LBRs to be enabled in IA32_LBR_CTL.  [This event is alias to LBR_INS=
ERTS.ANY]",
         "Counter": "0,1,2,3,4,5,6,7",
         "EventCode": "0xe4",
         "EventName": "MISC_RETIRED.LBR_INSERTS",
@@ -1495,11 +1495,11 @@
         "Unit": "cpu_atom"
     },
     {
-        "BriefDescription": "LBR record is inserted",
+        "BriefDescription": "LBR record is inserted [This event is alias t=
o LBR_INSERTS.ANY]",
         "Counter": "0,1,2,3,4,5,6,7,8,9",
         "EventCode": "0xe4",
         "EventName": "MISC_RETIRED.LBR_INSERTS",
-        "PublicDescription": "LBR record is inserted Available PDIST count=
ers: 0,1",
+        "PublicDescription": "LBR record is inserted [This event is alias =
to LBR_INSERTS.ANY] Available PDIST counters: 0,1",
         "SampleAfterValue": "1000003",
         "UMask": "0x1",
         "Unit": "cpu_core"
@@ -2299,5 +2299,41 @@
         "SampleAfterValue": "2000003",
         "UMask": "0x20",
         "Unit": "cpu_atom"
+    },
+    {
+        "BriefDescription": "Counts number of vector uops dispatched on VE=
C0",
+        "Counter": "0,1,2,3,4,5,6,7,8,9",
+        "EventCode": "0xb4",
+        "EventName": "VEC_DISPATCHED.V0",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x1",
+        "Unit": "cpu_core"
+    },
+    {
+        "BriefDescription": "Counts number of vector uops dispatched on VE=
C1",
+        "Counter": "0,1,2,3,4,5,6,7,8,9",
+        "EventCode": "0xb4",
+        "EventName": "VEC_DISPATCHED.V1",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x2",
+        "Unit": "cpu_core"
+    },
+    {
+        "BriefDescription": "Counts number of vector uops dispatched on VE=
C2",
+        "Counter": "0,1,2,3,4,5,6,7,8,9",
+        "EventCode": "0xb4",
+        "EventName": "VEC_DISPATCHED.V2",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x4",
+        "Unit": "cpu_core"
+    },
+    {
+        "BriefDescription": "Counts number of vector uops dispatched on VE=
C3",
+        "Counter": "0,1,2,3,4,5,6,7,8,9",
+        "EventCode": "0xb4",
+        "EventName": "VEC_DISPATCHED.V3",
+        "SampleAfterValue": "1000003",
+        "UMask": "0x8",
+        "Unit": "cpu_core"
     }
 ]
diff --git a/tools/perf/pmu-events/arch/x86/mapfile.csv b/tools/perf/pmu-ev=
ents/arch/x86/mapfile.csv
index 87fa8a7c2f8d..5e6bff382c23 100644
--- a/tools/perf/pmu-events/arch/x86/mapfile.csv
+++ b/tools/perf/pmu-events/arch/x86/mapfile.csv
@@ -23,7 +23,7 @@ GenuineIntel-6-3A,v24,ivybridge,core
 GenuineIntel-6-3E,v24,ivytown,core
 GenuineIntel-6-2D,v24,jaketown,core
 GenuineIntel-6-(57|85),v16,knightslanding,core
-GenuineIntel-6-BD,v1.26,lunarlake,core
+GenuineIntel-6-BD,v1.27,lunarlake,core
 GenuineIntel-6-(AA|AC|B5),v1.23,meteorlake,core
 GenuineIntel-6-1[AEF],v4,nehalemep,core
 GenuineIntel-6-2E,v4,nehalemex,core
--=20
2.56.1.708.g77570a6a1d-goog

