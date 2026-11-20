Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182181;
	b=k5aY4A9Vg8ju1AJORLuyuOB1X8ZjAIJ922+iBHSeQwD5YBRvUzBa3RZ1afQuU5Ez/fxF
	 hEZSIvUA41cXyr6uZIRH5SbHH2htawj54+1lTxF1V/Mv2pkkQ+XUWmEZE3Wko+zr8fRi7
	 /kXjdA0JeNVlANYg/deXdyzHPHx/oejee06rxP3cpajfhlvq5Q75+RxIUxK76L4MUNzTi
	 qh+i8awLLkZuLxOENn1hN+yZAfWlXpYYnrUq+PafEAgzI6FwVFPZqfe6sl+1JzX34zBFz
	 3n9h5+HVQEEaw1EjW5lmmaB/b2kC3NkllqtaC9puqIlnbJTSmWfQlDds4gS8zfHooQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182181;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3/jsMe/Qc48pu/imVYvdVloDOJ6fnxt5dXnAjgruQUk=;
	b=qjAB3DF+lLCiGIkkRpui5matoDEEUtrAGREPPdGQZiKEMUm5H+I5RockZzJC7lz84lWL
	 CqVV7WpLuxVS7QTBtDkFBtC1xEQ2fv8MMpuhyArLrd28Yq9xKP+6WGBVpM4orzL2Sn6/Q
	 t/0PiwYiHALES9G9ogS2EWssBRUXKtgEhg/TW9NGVsP39dknFs4mM1JMZatuxFSRkoClQ
	 j9G/VAIKFnNzihJ/ACbah8SqYsFrepprPnS/+zoMmpTj7y/dfWKw/DhXkfsWp1jXxVscu
	 chwtkwq4I1sI3rm/7WqGWa82bO1yKgQM0wKSz1J6nMx0Cdg/ueCCclhtG10Vz24PwBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zLL2HUR0;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B497606A332
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:43:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B497606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zLL2HUR0
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-372bdb942dbso1193671eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795182180; x=1795786980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3/jsMe/Qc48pu/imVYvdVloDOJ6fnxt5dXnAjgruQUk=;
        b=zLL2HUR0zbNT0dI+dqlO/gnbeZZPSJ36DaIKtjlXIsD+cKtMGMUz9+4YszSK9IgPVx
         oC/YhdWZq+27Zj78E1GpdJojye9GzGsefATEDY9SDka4mVvGfXbGWlUINjjNvgVKXiKd
         M0pmFecUf4uSt5+X7HNYcPcXO+gqHmdlhCJqoSe3xUKDLlgn9wVtzc7CwdE1YCl/E/IQ
         mwmYg7E2D6Pv/BPdlCpNkvc2lnCWxD56fpVyFVp9TYzKMWUBpawa+yraMXMM16kZRHHu
         1dCljwPObetMZAcdLK+D7+0+T6JeJVV/TzD1xOhPRczlDa6kfZt+SGu77g6koelVWYJp
         comA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182180; x=1795786980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3/jsMe/Qc48pu/imVYvdVloDOJ6fnxt5dXnAjgruQUk=;
        b=wvKP7QrPJLKA7nGHucn/QCtUWwlwQ52Zfr9VkvhPvU6whtGfjpd6UUSOxuPWVgGMZV
         h8/1I0VxWU9PD+7/fKJtNwKVf02bFRdS/Pb2DXiucAQ5gpchqpsPgYhlPB7MHD24KdvN
         ixoewL+umUP++kUSMr2wlmvD+ibbRW241SuWPy7LI7IFRlThtDQJYfwlgC2MwLxMcBvB
         NffJYUgn42DcbsoNBa5oLyD/IptcFz32Y0E+SqK068NMw5WdjftdWDimdWf7RcmZs5W0
         xQgNG6pg2EmmtJ1OKgtv4gcybbtQ/zkwz0sQrdmAlQ+92rPWXnMH9190jaZah2vpa5kW
         BH3g==
X-Forwarded-Encrypted: i=1; AL+hErEZWepPhkc7KDh4HYueRxK8jG/E1RCF4q8cSpdl3ljUFj/4JQEDRvnvrqmEOKQ0sl6kjzfwMndcqGt2CW8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YMGvr8t+sIcmkKoEs4hgTSegDSG3NSg8YRRBOo3r0auz7VLTj
	lEuLv9WP3IcMGehGB7qp5n00k2ms9mA8pfyhZXaxGzFEv45KzF3chgki
X-Gm-Gg: AZFdTZca47JTL15WCFJWs4ihkqkuLvNVPabukfnZwR987PxB4yL2GOtRxCu8A4WD+RO
	P8ZiS7QmuhYwuLECUsB2lExbqb/udNkynEmLuIe6bdVjhmnkS6Z225IVLqHWAOLgqbInAO0KR9m
	zJGr0ZnimNT7p29tnFlRr5pCmCdGLjYIYi7bDFEYq3CWDtAu9gHJA3PWGw40C2Am/Ne71WXMhh8
	ybivpDk5Qd2BzoFmR0g6pSgE2DlSQf6HlKYiikjGr0EQjLqavY3Lza4wQ/HUJWKJSqsHICcGeje
	YWLZPN5IDVkuAHqKeZ47Cmyj2Et7fnry51RnDjvU9Ed6cS4VKKr1fmi771wfeoO7UPj8sN4OwUw
	Zqck1MbU2BSfa6U1uVR3iIzTotLXpoPREz1aljYK7CsHDSM/ZtNjitD29P0wDeswPbas5bRgS3R
	PFtNppg6SIhfMo/0yKarKUusw07QUAMSeidNh4ZB5eeICxYFAAmCk0c5Nx8AqI5bUfXKn7QT3dC
	twrtIz13J0YJpXQuOuUWBFuntIn6PDJt4Y8DodXXKGQZs27uFcZ6XkOwHwWcU1NLQjF5pGgKzOl
	6niCQ5PKbd+vo8vOAqmx
X-Received: by 2002:a05:693c:87d2:20b0:381:ad6f:75ea with SMTP id 5a478bee46e88-3856f14748amr2810204eec.13.1795182179979;
        Fri, 20 Nov 2026 05:42:59 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm9590857eec.28.2026.11.20.05.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:42:59 -0800 (PST)
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
Subject: [PATCH v12 1/2] perf vendor events: Fix misspelled keys in the event tables
Date: Fri, 20 Nov 2026 13:42:51 +0000
Message-ID: <20261120134252.1036963-2-takano32@gmail.com>
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

Sixteen objects in arch/arm64/ampere/ampereonex/mmu.json carry
"PublicDescrition" and one object in each of amdzen4/cache.json,
amdzen5/load-store.json and amdzen6/load-store.json carries
"BriefDescript6ion".  jevents.py reads only the keys it knows by name, so
these fields have no effect: the text is dropped without a word and never
reaches the generated tables.

For the three AMD events that leaves them with no description at all, and
the text comes back.  The AmpereOneX events carry the same text in
BriefDescription and the generator drops a duplicate long description, so
the generated arm64 tables are unchanged.

This is the same change as "perf vendor events arm64 AmpereOneX: Fix
misspelled PublicDescription keys" (Message-ID
<20261113065253.746615-1-takano32@gmail.com>) and "perf vendor events amd:
Fix a misspelled JSON key" (<20261108184600.3810059-1-takano32@gmail.com>),
squashed into one patch so that this series applies on its own.

Written with Hermes Agent, an LLM assistant; the author reviewed it and
ran the generator as described.

Fixes: 16438b652b46 ("perf vendor events arm64 AmpereOneX: Add core PMU events and metrics")
Fixes: 658448281d19 ("perf vendor events amd: Add Zen 4 core events")
Fixes: 45c072f2537a ("perf vendor events amd: Add Zen 5 core events")
Fixes: 2f42fb0661d9 ("perf vendor events amd: Add Zen 6 core events")
Acked-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 .../arch/arm64/ampere/ampereonex/mmu.json     | 32 +++++++++----------
 .../pmu-events/arch/x86/amdzen4/cache.json    |  2 +-
 .../arch/x86/amdzen5/load-store.json          |  2 +-
 .../arch/x86/amdzen6/load-store.json          |  2 +-
 4 files changed, 19 insertions(+), 19 deletions(-)

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
diff --git a/tools/perf/pmu-events/arch/x86/amdzen4/cache.json b/tools/perf/pmu-events/arch/x86/amdzen4/cache.json
index e6d710cf3ce2..01c848a9dbb3 100644
--- a/tools/perf/pmu-events/arch/x86/amdzen4/cache.json
+++ b/tools/perf/pmu-events/arch/x86/amdzen4/cache.json
@@ -182,7 +182,7 @@
   {
     "EventName": "ls_inef_sw_pref.all",
     "EventCode": "0x52",
-    "BriefDescript6ion": "Software prefetches that did not fetch data outside of the processor core for any reason.",
+    "BriefDescription": "Software prefetches that did not fetch data outside of the processor core for any reason.",
     "UMask": "0x03"
   },
   {
diff --git a/tools/perf/pmu-events/arch/x86/amdzen5/load-store.json b/tools/perf/pmu-events/arch/x86/amdzen5/load-store.json
index b1994539ece8..774da0bfa0dd 100644
--- a/tools/perf/pmu-events/arch/x86/amdzen5/load-store.json
+++ b/tools/perf/pmu-events/arch/x86/amdzen5/load-store.json
@@ -351,7 +351,7 @@
   {
     "EventName": "ls_inef_sw_pref.all",
     "EventCode": "0x52",
-    "BriefDescript6ion": "Software prefetches that did not fetch data outside of the processor core for any reason.",
+    "BriefDescription": "Software prefetches that did not fetch data outside of the processor core for any reason.",
     "UMask": "0x03"
   },
   {
diff --git a/tools/perf/pmu-events/arch/x86/amdzen6/load-store.json b/tools/perf/pmu-events/arch/x86/amdzen6/load-store.json
index 4291eb59426f..4adba70bffb1 100644
--- a/tools/perf/pmu-events/arch/x86/amdzen6/load-store.json
+++ b/tools/perf/pmu-events/arch/x86/amdzen6/load-store.json
@@ -351,7 +351,7 @@
   {
     "EventName": "ls_inef_sw_pref.all",
     "EventCode": "0x52",
-    "BriefDescript6ion": "Software prefetches that did not fetch data outside of the processor core for any reason.",
+    "BriefDescription": "Software prefetches that did not fetch data outside of the processor core for any reason.",
     "UMask": "0x03"
   },
   {
-- 
2.53.0

