Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019410;
	b=mWoxKh4WlGjDmkKZkUaXtUcB/lIy5NjtgPPDNeY9UNwfTZbGsxlPgeVM3LQTdHjo2cD1
	 VvUqnlhiI4XCvhBIuGPsH4k/AZd/M+VjB7DI+KrHM2LXiiCtuVJbZAwhTAul4iG8ZAWi/
	 owfA4EsMleuh6LdbYyQaUvERgO22Nl3lW+Z2AqItAC+AxrfqmkWol0CiRnV1xlkJiQx4A
	 Qq8C6vTDuk3y7Wl352XUUJNuKy75Oy/+rXaWCBq/rqRONIxZUS/wimk56fi+oJmanybHW
	 WI0Z98NNF8UMJigc7ptH4Fh65v0yyUbdoCw9o9PXJ8pgvMuJY+y9neYObMAfu/IhP8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=yCjoTJR6LdbvR/cwt8ZPonwz8Vxbe4mw4fGpbe7vuDc=;
	b=0HeitPFOa4RM0UlfMZkuVA5wT4AaI21wCPp3kTROw/2oC8c91jUp18BUFlG2Ofyidedz
	 zfiUtLfVRc3FvmniU4g+Ws7964S6eE9oPvTSrpzp1W3DzB98loG1CjHOo8xrPYIAq4uej
	 wLLeCcHcA+l/ZyiCXBvxrOThHuUpv7RPUJmCgXRYjzrzxhNivtygp6TMaE20jWLDXiLuE
	 sv5empzCblon/F1VeVIZIL8lNJ50fCMDyNTYe4py1rdKOdpyW5XU1rjbmUFhudLVHl6ET
	 tM7FdsIy/QhuHnLavBLShg6cpzeAPuPYRxRBRsxrEQMeMF0rd1r+vqJw+uzEs1RO1pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uE+KKUfW;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEDD60A3827
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:30:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AEDD60A3827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uE+KKUfW
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso12507295e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019408; x=1795624208; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yCjoTJR6LdbvR/cwt8ZPonwz8Vxbe4mw4fGpbe7vuDc=;
        b=uE+KKUfWWwx/JRX7W0XaHH0k1nfdURAdYk4NK6djAEQ6NwVicQ10II/QuTMUvHXG/W
         gcLI0h8EOyCmejowm3hsltWRuBvdzBPDVeVQaAOuXa5Wtz7egMo6VzjpVG6HO7XhpIqD
         AmXnb+c81ZQ1Cqq/n1Fa2iyUnY5El+nSJ0RIY9tUumiWYQYhAFJDSXdK0tu9lSDMyq2g
         8PAnyEOAXD6xgw+lFxUBpiN/v261Qx+TfZFs0ccgbN6FoQ73U3g0ozYOzkvnhdzJsdPx
         TK0slTL/EQT4bV0JpjUlulXa+qlVXjqtr1QQBalX8KkFntTCLCr3aoxJ+tk8gQ96MQc1
         Fj0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019408; x=1795624208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yCjoTJR6LdbvR/cwt8ZPonwz8Vxbe4mw4fGpbe7vuDc=;
        b=JhKG4oK9ooUQSP4aB3mmZw1KtsPcnWsVmQOUHBIZhSXqFN6jSAdAVmrGe3nVXk2CNF
         r8RDrUJHFYg+BhvBclU9YGB0LI10XA0p03Ftq/UiM5e+bWqCG1R5SnoAxqafe+wtbPSV
         CUUfCwv6UvgngaSNkJeta72bvHE6I/fTzrIHHv1mwkJ1qczy9jbdqJ2JdsDyPssYg0nN
         elxCmTO8cEWuC8yZPQ9e/gap5a50NdYwepgCbwEEtY25Z3WqDrKE+UpGwp4ITT5bdq+T
         sg5toz6ZnrYiTleiSdY9kuOR+llfOBF3k12VQyMTJE6nXJchcpUJ5Dxx1txVaiI2aU/m
         BURQ==
X-Forwarded-Encrypted: i=1; AL+hErHIvrCqqUO+iAt+GBmM+ImlvU90exCW5B6uRJzENIS0bf24jLXpYYb4730br397N3hrpObq+H1Dv7C3dEo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/79qnDFytU30bv4wm0vyR6kZ/jcl50KJgvZtgGwYaVzzmrtr7X
	vFmksQp6kBPM3wa3uEXoyJP4e24wPuQObzoOZh/qMuxEI2nEoMXOGfNpa33O4oKBt7U=
X-Gm-Gg: AYBFou0DFX0n4f0ipt3CE0zBAiXk+yQjsaqKFZwo0N7f6lnCpeKO9C/aUsRUjpXeeAE
	LATcd59etPs1MsWHZlhl61zcXxuP+ew5wldoqkODh4imGdeT25WEoqQsV6BLDtuby4VKN6hu7Pz
	3pQsjCk94FA36qDvWbXGFKBdSeiRJPY5kjuXMSPIPDwy/7H2FCAYJpVUPS1utcwaGCyt7xSBkGy
	lRYDpTatHEG3aRtEBqp+tpqnZByRVbwnIcDLyrax6lxZurApJ1qXVoW8Jib6AY5Y/Bx7yRrpyly
	P64cKUA+znya8C1JIjM4UkPRmQ/E+0BJDZg+qvIMZxluyB38b7feedcThlPImWQ7ZHZRrVWSz9C
	mXSWaQL2h12t71C3WqALPmtFvdplORmdDYSvh0a81Ac6pfaJ2uZpT/Gk1KGOyAyIkpS2Dq5kQI+
	uhjb7OakI9IZVf2XgnbuJGFE4YqU5n3w4m8fV/a03C8C7Ollz5bwmZo89ZNbYO9Chdb7N96uiuF
	Sdg0xEoLLefsh773PsQpbhSyghOPfRmhL4timT83XKDBLV+JNPLIOsliQZBc9QYhlbPhUMTK7AO
	zEWp/VviT0DRBj84L5q1xW42e+M/k260
X-Received: by 2002:a05:600c:34cb:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4bb7da4c5d3mr66218705e9.34.1795019407665;
        Wed, 18 Nov 2026 08:30:07 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:30:07 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:40 +0000
Subject: [PATCH 18/34] perf cs-etm: Don't special case per-thread mode
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
Message-Id: <20261118-james-coresight-jit-v1-18-dad4d90747f6@linaro.org>
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

This was always an extra edge case to have to understand, and keeping it
would require another new special case in the following change to add a
timestamp decoder tree per trace ID. Removing it makes both cases
simpler and nothing is really lost anyway. The only change needed is to
seed every trace ID context with the TID from the AUX record, rather
than only updating the single special context.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 34 ++++++++++++++--------------------
 tools/perf/util/cs-etm.h | 10 ----------
 2 files changed, 14 insertions(+), 30 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 5c98c7960f82..accd4ffc19aa 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -51,13 +51,6 @@ struct cs_etm_auxtrace {
 
 	/* Trace timestamps are available and not disabled by --itrace=Z. */
 	bool has_timestamps;
-
-	/*
-	 * Per-thread ignores the trace channel ID and instead assumes that
-	 * everything in a buffer comes from the same process regardless of
-	 * which CPU it ran on. It also implies no context IDs so the TID is
-	 * taken from the auxtrace buffer.
-	 */
 	bool per_thread_decoding;
 	bool snapshot_mode;
 	bool has_virtual_ts; /* Trace timestamps can be used as kernel time. */
@@ -717,14 +710,8 @@ static struct cs_etm_traceid_queue
 {
 	int idx;
 	struct int_node *inode;
-	struct intlist *traceid_queues_list;
+	struct intlist *traceid_queues_list = etmq->traceid_queues_list;
 	struct cs_etm_traceid_queue *tidq, **traceid_queues;
-	struct cs_etm_auxtrace *etm = etmq->etm;
-
-	if (etm->per_thread_decoding)
-		trace_chan_id = CS_ETM_PER_THREAD_TRACEID;
-
-	traceid_queues_list = etmq->traceid_queues_list;
 
 	/*
 	 * Check if the traceid_queue exist for this traceID by looking
@@ -2225,15 +2212,22 @@ static int cs_etm__get_data_block(struct cs_etm_queue *etmq)
 	/*
 	 * Per-thread mode still uses a queue for each CPU, but that CPU can run
 	 * different threads. When the TID from the AUX record on a CPU changes,
-	 * re-initialize the thread using the AUX record/buffer fragment TID so
-	 * we can start decoding even if the context ID packet was cropped or
-	 * they're disabled.
+	 * re-initialize the thread for each trace ID using the AUX record/buffer
+	 * fragment TID so we can start decoding even if the context ID packet
+	 * was cropped or they're disabled.
 	 */
 	if (etm->per_thread_decoding) {
-		struct cs_etm_traceid_queue *tidq = cs_etm__etmq_get_traceid_queue(etmq,
-							CS_ETM_PER_THREAD_TRACEID);
+		struct int_node *inode;
+
+		intlist__for_each_entry(inode, etmq->traceid_list) {
+			struct cs_etm_traceid_queue *tidq;
+
+			tidq = cs_etm__etmq_get_traceid_queue(etmq, inode->i);
+			if (!tidq)
+				return -ENOMEM;
+			if (thread__tid(tidq->decode_thread) == etmq->buffer->tid)
+				continue;
 
-		if (thread__tid(tidq->decode_thread) != etmq->buffer->tid) {
 			thread__zput(tidq->frontend_thread);
 			thread__zput(tidq->decode_thread);
 			tidq->frontend_thread = machine__findnew_thread(
diff --git a/tools/perf/util/cs-etm.h b/tools/perf/util/cs-etm.h
index 71b1ef321625..ffe3a33885a7 100644
--- a/tools/perf/util/cs-etm.h
+++ b/tools/perf/util/cs-etm.h
@@ -195,16 +195,6 @@ struct cs_etm_packet {
 
 #define CS_ETM_PACKET_MAX_BUFFER 1024
 
-/*
- * When working with per-thread scenarios the process under trace can
- * be scheduled on any CPU and as such, more than one traceID may be
- * associated with the same process.  Since a traceID of '0' is illegal
- * as per the CoreSight architecture, use that specific value to
- * identify the queue where all packets (with any traceID) are
- * aggregated.
- */
-#define CS_ETM_PER_THREAD_TRACEID 0
-
 struct cs_etm_packet_queue {
 	u32 packet_count;
 	u32 head;

-- 
2.43.0

