Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019412;
	b=H5m2xVtpHTpsdo44UZ1pZEXePOvRycloW/R1eOfWzc8EK8S+hbIEvv1QON4Ec3vNW74Q
	 Fornl0GiEkHQEVQt6KDLuT6opK5Bg4+K0njxvoSD6R3IOFFZvKdN1YheMa6nwapuV+OQV
	 zs5CiwzN4OANIxUNE6TU6wjNTo2MEffGLC6l2O6pLSevye94vRDBKMMq1dH1H0gjfYvDP
	 PzB7QF83Evwsgduyu/lGAvSMWroNync4TMKsaeN+rgcIV1+6g6nlBTB2xCE533jtBqco5
	 YrEFXUGmtdDAesCMr5BdEiJvI6KBJt73Q7CNe6J6GhPaergZIL52E7IvQ3Of30QzRzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=HZRhzohPMCWnjUa9Wuq7F+UN8Ol3LPrkIa7VF+1QeZg=;
	b=jHVX+mSdm7ZDdxz9I00QitN/L2VTht3lK8wjT5aoXlTj9EqvUEadmVy1SlYlT5/5L/4d
	 J/yIcx6zbTsO2XRYlH6V3IqaKns/kPCnUuSczLYk4fEgNJ1AzVS/zt3TmPI6XVHNM/MYK
	 K4NJWiFkEBBkxrJPbP7YvYEDzLyDENRmdy2YoeSG5JsWhGmtwAvxHwacKzTnSvPtNuCss
	 irxt/mWLbOM+B7iR9BQNE3pDoeZzualYFa6icuXa5mVSBqUcoa3z82+ov96FG3Hja/huV
	 Ov0xhzK+3SIKk8B63LV3Fvt8GxdGF/ONNIXkx5BbTiCpSuBvcEnO31C2+Up3dEUXEoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nOTSedkW;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4BA60A5BE7
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:30:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D4BA60A5BE7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nOTSedkW
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so10000245e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019410; x=1795624210; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HZRhzohPMCWnjUa9Wuq7F+UN8Ol3LPrkIa7VF+1QeZg=;
        b=nOTSedkWeN+8bxYDT8kZ+FTliNAlAH7rdyhJ4LGfnEKAdFDoZqnedtNeZb37dll436
         Kfdqp658roJkKALhjktcONE5rLH2Inw47iQEUdo2kMLEBA+6m2ipbtDb2C6qdRNqfnZk
         IKJAjfneZxAZWoTwsitO0W+/SbupXRAVptNjV4//bCkmBUCH91+C+1Lriz14n5S2rs9T
         QwDHGvZZuWHlWchOBJKXpT8D/9UEN3tvLRJRV23V42oAVpbZMjDYC4jksilHiUxDXVfs
         IlvVf38p4A4ylVNJ9JfbnvF/eY17a1FgJzkITkoZMf7TUd6AG4sgo9OgqjUEzMXnBy6x
         YB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019410; x=1795624210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HZRhzohPMCWnjUa9Wuq7F+UN8Ol3LPrkIa7VF+1QeZg=;
        b=TGIGYpq8lwzCwheMZ1GaWr08cHR6X/9Sglt1Q/lKodm7+Oac0DZWLiMizXy8AlCpkE
         7UXpSu9oHXds2yIgOqkLq5kuPGPKRcJC2uswuygE7aDaGMdgF7C9h1Uj3+LIMNh5cSUv
         tM8VwTwV0rdV7R8a7Sao+CrzZjG6e74PYCTtWcT+R6JMOYCdUNglHEvTqyKOgRCob4oK
         gPXa99+pIObkNOSPEONpQaAPDD0vOVu7qO12pTUzgnFOWhYbyW0lt55vpxNFgWiFtiZj
         e8QNPdu/fFAIjDCedL0kXYWFNihC8/f4kMjWsm68GDJxjbSydXCg2460Zfkud3bpb6ZR
         yp8w==
X-Forwarded-Encrypted: i=1; AL+hErGM+daeTMQNYzEIXOorpt4M8gLuY7MDwQ92Z9EJj54WKP8EQy/nokAabh30fNg/Uxs0OaW6pykJP+D5r08=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9whQhBeNI62XPjqj+famWkbsYcB3OD4M8zqe1YvVm03N89eb9
	E7+MmKgHR4mi5gFr+FHbYhW2vpN2J8zBmfSsLiEyGRwBTXGk/eCmr4MVGPrPYOYSKw4=
X-Gm-Gg: AYBFou0wz5DA19yqp5/CUDjTBrmBhOQnC9L9rRFqte6hpkiXi4GRNRSECX4IIdukHjU
	x+T9hzRVoJQ/M55yi3QDyAg6hDIqIWjbJVB9GiSs8wJMLpD/Y8d24O9qdOlNAtp4fh342J11l5Y
	wmWNEcQSBIqX6RLhUxNgClhfKpBRYiTlea0ig1TQ4WM2uJSd7153BQ8lmIdeMsfmApNY+Z/z/Vc
	Y2A2cnGzhmOtrfkel0K3AKKK6QR+0rqY0ibRUne3m0wuVgLSToZ5D9cuuPsPFcxcw34mQncDaHB
	uJBS2dJ8Esnm2qaeNqquteOJyU93S3pjptJG1gXbhn8AKpWiGh3IPnpo9pLpBwLCCeFuox7ab2/
	lIxsbizvkM1AacMQe78yM9mpyLUmXIfiVB2NJ040exMyAxy44Wd6cRlAsr/i7tmWS4IZ2WLYE1u
	OXP5t2nAvtL9OkzTZp/esW+teSY9RiYdcsqZ1c5xH8c7YCCdTyO83lZDjrRjrI8ZRiombBnfGfm
	Dd0tyPZV+BzdG4G16uu9IACZwMVvQud/49cu2wHYHsUMxfMPPDtgq8il9FkIlmd1gduPQMqY18H
	0Am/M+V0/YKtIMdX6ZViKT/WG2t0LLVD
X-Received: by 2002:a05:600d:82c5:b0:4a2:1a:a120 with SMTP id 5b1f17b1804b1-4bb7da127e1mr70127165e9.6.1795019409839;
        Wed, 18 Nov 2026 08:30:09 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:30:09 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:42 +0000
Subject: [PATCH 20/34] perf cs-etm: Remove the decoded packet ring buffer
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
Message-Id: <20261118-james-coresight-jit-v1-20-dad4d90747f6@linaro.org>
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

Full decoding now stops after every output packet, so the frontend
drains the packet ring before the decoder can produce another packet.

Write directly into the frontend's current packet instead. Remove the
ring storage but retain the packet count as the pending-packet
indicator, which will be removed later.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.c | 64 ++++++++++---------------
 tools/perf/util/cs-etm.c                        | 35 ++++----------
 tools/perf/util/cs-etm.h                        |  7 +--
 3 files changed, 36 insertions(+), 70 deletions(-)

diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
index d7b596aeaa41..e2eb606f2feb 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
@@ -96,22 +96,8 @@ int cs_etm_decoder__get_packet(struct cs_etm_packet_queue *packet_queue,
 	/* Nothing to do, might as well just return */
 	if (packet_queue->packet_count == 0)
 		return 0;
-	/*
-	 * The queueing process in function cs_etm_decoder__buffer_packet()
-	 * increments the tail *before* using it.  This is somewhat counter
-	 * intuitive but it has the advantage of centralizing tail management
-	 * at a single location.  Because of that we need to follow the same
-	 * heuristic with the head, i.e we increment it before using its
-	 * value.  Otherwise the first element of the packet queue is not
-	 * used.
-	 */
-	packet_queue->head = (packet_queue->head + 1) &
-			     (CS_ETM_PACKET_MAX_BUFFER - 1);
-
-	*packet = packet_queue->packet_buffer[packet_queue->head];
 
 	packet_queue->packet_count--;
-
 	return 1;
 }
 
@@ -312,36 +298,36 @@ cs_etm_decoder__buffer_packet(struct cs_etm_queue *etmq,
 			      const u8 trace_chan_id,
 			      enum cs_etm_sample_type sample_type)
 {
-	u32 et = 0;
+	struct cs_etm_packet *packet;
 	int cpu;
 
-	if (packet_queue->packet_count >= CS_ETM_PACKET_MAX_BUFFER - 1)
+	if (packet_queue->packet_count)
 		return OCSD_RESP_FATAL_SYS_ERR;
 
 	if (cs_etm__get_cpu(etmq, trace_chan_id, &cpu) < 0)
 		return OCSD_RESP_FATAL_SYS_ERR;
 
-	et = packet_queue->tail;
-	et = (et + 1) & (CS_ETM_PACKET_MAX_BUFFER - 1);
-	packet_queue->tail = et;
-	packet_queue->packet_count++;
+	packet = cs_etm__etmq_get_packet(etmq, trace_chan_id);
+	if (!packet)
+		return OCSD_RESP_FATAL_SYS_ERR;
 
-	packet_queue->packet_buffer[et].sample_type = sample_type;
-	packet_queue->packet_buffer[et].isa = cs_etm_decoder__get_isa(elem);
-	packet_queue->packet_buffer[et].cpu = cpu;
-	packet_queue->packet_buffer[et].start_addr = CS_ETM_INVAL_ADDR;
-	packet_queue->packet_buffer[et].end_addr = CS_ETM_INVAL_ADDR;
-	packet_queue->packet_buffer[et].instr_count = 0;
-	packet_queue->packet_buffer[et].last_instr_taken_branch = false;
-	packet_queue->packet_buffer[et].last_instr_size = 0;
-	packet_queue->packet_buffer[et].last_instr_type = 0;
-	packet_queue->packet_buffer[et].last_instr_subtype = 0;
-	packet_queue->packet_buffer[et].last_instr_cond = 0;
-	packet_queue->packet_buffer[et].flags = 0;
-	packet_queue->packet_buffer[et].exception_number = UINT32_MAX;
-	packet_queue->packet_buffer[et].trace_chan_id = trace_chan_id;
-	packet_queue->packet_buffer[et].el = ocsd_EL_unknown;
-	packet_queue->packet_buffer[et].tid = -1;
+	packet_queue->packet_count++;
+	packet->sample_type = sample_type;
+	packet->isa = cs_etm_decoder__get_isa(elem);
+	packet->cpu = cpu;
+	packet->start_addr = CS_ETM_INVAL_ADDR;
+	packet->end_addr = CS_ETM_INVAL_ADDR;
+	packet->instr_count = 0;
+	packet->last_instr_taken_branch = false;
+	packet->last_instr_size = 0;
+	packet->last_instr_type = 0;
+	packet->last_instr_subtype = 0;
+	packet->last_instr_cond = 0;
+	packet->flags = 0;
+	packet->exception_number = UINT32_MAX;
+	packet->trace_chan_id = trace_chan_id;
+	packet->el = ocsd_EL_unknown;
+	packet->tid = -1;
 
 	cs_etm__etmq_set_traceid_queue_ready(etmq, trace_chan_id);
 	return OCSD_RESP_WAIT;
@@ -361,7 +347,7 @@ cs_etm_decoder__buffer_range(struct cs_etm_queue *etmq,
 	if (ret != OCSD_RESP_CONT && ret != OCSD_RESP_WAIT)
 		return ret;
 
-	packet = &packet_queue->packet_buffer[packet_queue->tail];
+	packet = cs_etm__etmq_get_packet(etmq, trace_chan_id);
 
 	packet->start_addr = elem->st_addr;
 	packet->end_addr = elem->en_addr;
@@ -407,7 +393,7 @@ cs_etm_decoder__buffer_exception(struct cs_etm_queue *etmq,
 	if (ret != OCSD_RESP_CONT && ret != OCSD_RESP_WAIT)
 		return ret;
 
-	packet = &queue->packet_buffer[queue->tail];
+	packet = cs_etm__etmq_get_packet(etmq, trace_chan_id);
 	packet->exception_number = elem->exception_number;
 	if (elem->context.el_valid)
 		packet->el = elem->context.exception_level;
@@ -491,7 +477,7 @@ cs_etm_decoder__set_tid(struct cs_etm_queue *etmq,
 	if (ret != OCSD_RESP_CONT && ret != OCSD_RESP_WAIT)
 		return ret;
 
-	packet = &packet_queue->packet_buffer[packet_queue->tail];
+	packet = cs_etm__etmq_get_packet(etmq, trace_chan_id);
 	packet->tid = tid;
 	if (elem->context.el_valid)
 		packet->el = elem->context.exception_level;
diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index f33e410e85bf..0175b2facaac 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -615,30 +615,6 @@ static u64 cs_etm__etmq_get_sort_timestamp(struct cs_etm_queue *etmq,
 	return packet_queue->cs_timestamp;
 }
 
-static void cs_etm__clear_packet_queue(struct cs_etm_packet_queue *queue)
-{
-	int i;
-
-	queue->head = 0;
-	queue->tail = 0;
-	queue->packet_count = 0;
-	for (i = 0; i < CS_ETM_PACKET_MAX_BUFFER; i++) {
-		queue->packet_buffer[i].isa = CS_ETM_ISA_UNKNOWN;
-		queue->packet_buffer[i].start_addr = CS_ETM_INVAL_ADDR;
-		queue->packet_buffer[i].end_addr = CS_ETM_INVAL_ADDR;
-		queue->packet_buffer[i].instr_count = 0;
-		queue->packet_buffer[i].last_instr_taken_branch = false;
-		queue->packet_buffer[i].last_instr_size = 0;
-		queue->packet_buffer[i].last_instr_type = 0;
-		queue->packet_buffer[i].last_instr_subtype = 0;
-		queue->packet_buffer[i].last_instr_cond = 0;
-		queue->packet_buffer[i].flags = 0;
-		queue->packet_buffer[i].exception_number = UINT32_MAX;
-		queue->packet_buffer[i].trace_chan_id = UINT8_MAX;
-		queue->packet_buffer[i].cpu = INT_MIN;
-	}
-}
-
 static int cs_etm__init_traceid_queue(struct cs_etm_queue *etmq,
 				      struct cs_etm_traceid_queue *tidq,
 				      u8 trace_chan_id)
@@ -647,8 +623,6 @@ static int cs_etm__init_traceid_queue(struct cs_etm_queue *etmq,
 	struct auxtrace_queue *queue;
 	struct cs_etm_auxtrace *etm = etmq->etm;
 
-	cs_etm__clear_packet_queue(&tidq->packet_queue);
-
 	queue = &etmq->etm->queues.queue_array[etmq->queue_nr];
 	tidq->trace_chan_id = trace_chan_id;
 	tidq->decode_el = ocsd_EL_unknown;
@@ -772,6 +746,15 @@ static struct cs_etm_traceid_queue
 	return NULL;
 }
 
+struct cs_etm_packet *cs_etm__etmq_get_packet(struct cs_etm_queue *etmq,
+					      u8 trace_chan_id)
+{
+	struct cs_etm_traceid_queue *tidq;
+
+	tidq = cs_etm__etmq_get_traceid_queue(etmq, trace_chan_id);
+	return tidq ? tidq->packet : NULL;
+}
+
 struct cs_etm_packet_queue
 *cs_etm__etmq_get_packet_queue(struct cs_etm_queue *etmq, u8 trace_chan_id)
 {
diff --git a/tools/perf/util/cs-etm.h b/tools/perf/util/cs-etm.h
index e404753820dc..c757a1fb465d 100644
--- a/tools/perf/util/cs-etm.h
+++ b/tools/perf/util/cs-etm.h
@@ -193,14 +193,9 @@ struct cs_etm_packet {
 	pid_t tid;
 };
 
-#define CS_ETM_PACKET_MAX_BUFFER 1024
-
 struct cs_etm_packet_queue {
 	u32 packet_count;
-	u32 head;
-	u32 tail;
 	u64 cs_timestamp; /* Timestamp, in ns when has_virtual_ts == true */
-	struct cs_etm_packet packet_buffer[CS_ETM_PACKET_MAX_BUFFER];
 };
 
 #define KiB(x) ((x) * 1024)
@@ -260,6 +255,8 @@ int cs_etm__etmq_update_decode_context(struct cs_etm_queue *etmq,
 bool cs_etm__has_timestamps(struct cs_etm_queue *etmq);
 void cs_etm__etmq_set_traceid_queue_ready(struct cs_etm_queue *etmq,
 					  u8 trace_chan_id);
+struct cs_etm_packet *cs_etm__etmq_get_packet(struct cs_etm_queue *etmq,
+					      u8 trace_chan_id);
 struct cs_etm_packet_queue
 *cs_etm__etmq_get_packet_queue(struct cs_etm_queue *etmq, u8 trace_chan_id);
 int cs_etm__process_auxtrace_info_full(union perf_event *event __maybe_unused,

-- 
2.43.0

