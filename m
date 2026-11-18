Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019423;
	b=2THdPE/iXec5/L03H2X4coHbWIvQKarRqhBtkoQjibCylq5caPielsg74+KYqFU/VIOi
	 d57PtWRuIvqUPAD/JbGYMFI6zhHIIEGbYRBzkkkpOQKLWg4yT0aUhkghevvLytv6Sk2C4
	 4ft/nuuuquwwraQcsy+ra+mVKADVFsu8/3jV8wpy6I/zAsTmF4X8Qb4SPJ7V4ripvdiW/
	 T9JBpQk7FAbneoiVg80eMztIs0qyfdCTxr1aW8QMMkppYD/7tf+pvvWHs7mjrq0xNIuuE
	 68dkNzUgbURJD+Mx8JwViKhagrRvJGuD8jCMZEcn9KaoMq7XYYNRJKJDAotVqoi9yLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ZboqFiaiSOAznM2ndDaajsevi4MTXt6SNvnhzrehEVM=;
	b=HGQOVxTItn3yOjHQsLWP05nmqN4lcPJbkim14sttt5p62xnOe+N9zQRtHWhMci/gzple
	 X4ZOGPQMOCquqzrKBL0DzYgd2IYRr2Bo0s2kLSk227E3KVFj3ogiF92NPxnRJgttpXKwq
	 lIWtNa930G+9RHOC4CqgpT+CvVIz4BBB6fG1/z/xgEkQFsSDNZ8P7D4Hnt4iOjdND5xGi
	 R2t1zs9ReVA98UOhXHLhkVsuPB7aXrd2iO/GOs4+6HNEjBmmtMhMJd2xxo2p+Djh7Q4FI
	 wr9H4/5ogOwan6FT2mfqjJxBbSj+4WTa0joN1DpSyVYDXUw4MNXGw8s5rbFxidcF/dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=l0inJtkL;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70C160A383E
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:30:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B70C160A383E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=l0inJtkL
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1071489f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019409; x=1795624209; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZboqFiaiSOAznM2ndDaajsevi4MTXt6SNvnhzrehEVM=;
        b=l0inJtkL5ylUuOMcsw0okRR8tIPy/L1sfy90+tfGs4ug9OjVkfLpzFJpBeuiumKLGj
         tfXp6i0pExXdI+KBFXqZbirBKhoJBt/Bds2kDNYaqlZX7tinWdCj8Vnxe/fXhPKk+y6r
         cxKzysGjDQ0LTaAZ6IVYmzYZRYIambjDvKkWcWuqm0mQhRJOxnaopwAl3INjHD3eN6iX
         xPmvMAVjq3fOpjtVUEgZ5mfyV5IdIslUHI0KaVgFTlZZmUUzB4F9lHrPCBe4Ts2InvXy
         iYV2SBnV+0yyLr1rPzjl6Vbzwq89QcGdbozhUdKJHjENyFvj6pZRiLvvNAG9TJpQX3bx
         RWvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019409; x=1795624209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZboqFiaiSOAznM2ndDaajsevi4MTXt6SNvnhzrehEVM=;
        b=oY6ipBZAUZnqOHBKd898b6C+uU0xSXRV3AWOirGnPiDGN5K/rzuryk0hYY1WbSeRH+
         QQFrnep5OdRs/FdiF9Ik6s+dxNMUlndl/MgfIjq77nTSWIJptCcqcruMH49ocOTzpgta
         lqNUvd1PX0cbPvBRqMmuKrDThxIYvjQJiJhNpA1gjds8DJkItPQsqNGPSiOXpeQrg4la
         SEeF9g4sVVR0l22Ln4yDDpXMcd4yn3GdHObwwydXtqnn9rngQ5cZDGnQ4BO3tK+Ph4iv
         F9Xul7OeK1oatmj+YPisCP/Iy1CdVojR71r1J2jj1wqn2AmN7737Rtj3ME1ydaHPvbpC
         /2gQ==
X-Forwarded-Encrypted: i=1; AL+hErEg428Bccsw3D8pUtO1a8aqSnEZn5eejEe6liBTsyix5uhc3KeCnF3TmPI72uTPUXa2ezCBjg10SDCzGag=@vger.kernel.org
X-Gm-Message-State: APuU4Z+X92+00usnz3hEzTbxrcyqAU1rAjePlJLIrtVkj7lLTlNNgfIJ
	vv+Yp3srHN7kw/LRSrE7C2UJ8mkJ4+k3xrm+5yha+lNGjlRhMEMx6f5IUOF9T7/BWQ0=
X-Gm-Gg: AZFdTZeE7fgQOcJPzas5XxnncJ5JnA4+pKpKOhvDbJcSf4eefqBEis6fbxclNCxCQ5o
	HZGMRkuz8pFWMo6coowgs1asOEgl7LllBzuvjmCjx7sNFO1zMSWKeNFAKbACIIaj1SGiT0zJWFl
	SdnZ2JglaEWK4aTAOzKR1LhavW6v8gjLJYwmZhezR/FvIu61ry1P8DWMBSOQdMKXQ9OIYR/cYfU
	RnJfZ5N7jpdcrcJCBb2HJvWgnjNrGksW/dI49Ppqjo9y14AKmv6NiAWhZFJ6lpVPUfcvmQrGFTe
	1ZhkyizOzMcnbn5qRW1bba9JJIZKC9HE5e6N3g730K9JLgpZegPLigjMWv5rpZKBUEak4OD+zrc
	7FrWEaHRebmlh5g/sxZzreDPULXEdKi0QsOfvlTMDetSc/CNgjIKIxoImvzAd1SRHsmgQEBMeOK
	qwWJMEOhAYQHNt9eFkP7zD4TKBmnMmblB9wCH01p077W7I1f5Lf7JKMj4u3dR/QGzx4tHMZHAy1
	q9AZLSAMOFBdEv1cQjF4kqNrRh4mF0YvcL9OK7crdx/qHohugydvn3hnLKOaOFICqm4ilT2MiWH
	njlFc0ZtNROzRhGlbiFinYlM4qIEYkEA5ZEOSfTAqqc8Y9e+olzKpg==
X-Received: by 2002:a05:6000:4312:b0:48d:f831:2681 with SMTP id ffacd0b85a97d-4a63a2d5b8amr7126622f8f.38.1795019408782;
        Wed, 18 Nov 2026 08:30:08 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:30:08 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:41 +0000
Subject: [PATCH 19/34] perf cs-etm: Decode one packet at a time and don't
 estimate timestamps
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
Message-Id: <20261118-james-coresight-jit-v1-19-dad4d90747f6@linaro.org>
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

Stop decoding after each packet instead of buffering packets until a
timestamp is reached. Give each range the last known timestamp instead
of estimating time using instruction counts. This makes the interleaving
of ranges between sinks less frequent, but that can be increased by
increasing the timestamp frequency. Timestamp estimation only added
complexity and was probably more misleading than useful.

Until the first trace timestamp is found, sort using zero. Only use the
AUX record time when trace timestamps are disabled.

packet_buffer[] now only ever has one packet in it, but keep it for a
later more mechanical removal in a later commit.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.c | 124 +-----------------------
 tools/perf/util/cs-etm.c                        |  10 +-
 tools/perf/util/cs-etm.h                        |   4 +-
 3 files changed, 9 insertions(+), 129 deletions(-)

diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
index 895e85a1f54b..d7b596aeaa41 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
@@ -33,15 +33,6 @@
 #define CS_PKT_MON	0
 #endif
 
-/*
- * Assume a maximum of 0.1ns elapsed per instruction. This would be the
- * case with a theoretical 10GHz core executing 1 instruction per cycle.
- * Used to estimate the sample time for synthesized instructions because
- * Coresight only emits a timestamp for a range of instructions rather
- * than per instruction.
- */
-const u32 INSTR_PER_NS = 10;
-
 struct cs_etm_decoder {
 	void *data;
 	void (*packet_printer)(const char *msg, void *data);
@@ -124,20 +115,6 @@ int cs_etm_decoder__get_packet(struct cs_etm_packet_queue *packet_queue,
 	return 1;
 }
 
-/*
- * Calculate the number of nanoseconds elapsed.
- *
- * instr_count is updated in place with the remainder of the instructions
- * which didn't make up a whole nanosecond.
- */
-static u32 cs_etm_decoder__dec_instr_count_to_ns(u32 *instr_count)
-{
-	const u32 instr_copy = *instr_count;
-
-	*instr_count %= INSTR_PER_NS;
-	return instr_copy / INSTR_PER_NS;
-}
-
 static int cs_etm_decoder__gen_etmv3_config(struct cs_etm_trace_params *params,
 					    ocsd_etmv3_cfg *config)
 {
@@ -259,18 +236,6 @@ cs_etm_decoder__init_def_logger_printing(struct cs_etm_decoder_params *d_params,
 	return 0;
 }
 
-static void
-cs_etm_decoder__do_soft_timestamp(struct cs_etm_packet_queue *packet_queue)
-{
-	u64 estimated_ts;
-
-	estimated_ts = packet_queue->cs_timestamp +
-			cs_etm_decoder__dec_instr_count_to_ns(&packet_queue->instr_count);
-
-	/* Estimated TS can never be higher than the next real one in the trace */
-	packet_queue->cs_timestamp = min(packet_queue->next_cs_timestamp, estimated_ts);
-}
-
 static ocsd_datapath_resp_t
 cs_etm_decoder__do_hard_timestamp(struct cs_etm_queue *etmq,
 				  const ocsd_generic_trace_elem *elem,
@@ -279,7 +244,6 @@ cs_etm_decoder__do_hard_timestamp(struct cs_etm_queue *etmq,
 {
 	struct cs_etm_packet_queue *packet_queue;
 	u64 converted_timestamp;
-	u64 estimated_first_ts;
 
 	/* Ignore trace timestamps when unavailable or disabled by --itrace=Z. */
 	if (!cs_etm__has_timestamps(etmq))
@@ -297,54 +261,14 @@ cs_etm_decoder__do_hard_timestamp(struct cs_etm_queue *etmq,
 	converted_timestamp = elem->timestamp ?
 				cs_etm__convert_sample_time(etmq, elem->timestamp) : 0;
 
-	/*
-	 * We've seen a timestamp packet before - simply record the new value.
-	 * Function do_soft_timestamp() will report the value to the front end,
-	 * hence asking the decoder to keep decoding rather than stopping.
-	 */
-	if (packet_queue->next_cs_timestamp) {
-		/*
-		 * What was next is now where new ranges start from, overwriting
-		 * any previous estimate in cs_timestamp
-		 */
-		packet_queue->cs_timestamp = packet_queue->next_cs_timestamp;
-		packet_queue->next_cs_timestamp = converted_timestamp;
-		return OCSD_RESP_CONT;
-	}
-
 	if (!converted_timestamp) {
-		/*
-		 * Zero timestamps can be seen due to misconfiguration or hardware bugs.
-		 * Warn once, and don't try to subtract instr_count as it would result in an
-		 * underflow.
-		 */
-		packet_queue->cs_timestamp = 0;
 		pr_warning_once("Bad Coresight timestamp found at Idx:%" OCSD_TRC_IDX_STR
 				". Decode in order of trace collection by prepending 'Z' to your current --itrace arguments.\n",
 				indx);
-
-	} else if (packet_queue->instr_count / INSTR_PER_NS > converted_timestamp) {
-		/*
-		 * Sanity check that the elem->timestamp - packet_queue->instr_count would not
-		 * result in an underflow. Warn and clamp at 0 if it would.
-		 */
-		packet_queue->cs_timestamp = 0;
-		pr_err("Timestamp calculation underflow at Idx:%" OCSD_TRC_IDX_STR "\n", indx);
-	} else {
-		/*
-		 * This is the first timestamp we've seen since the beginning of traces
-		 * or a discontinuity.  Since timestamps packets are generated *after*
-		 * range packets have been generated, we need to estimate the time at
-		 * which instructions started by subtracting the number of instructions
-		 * executed to the timestamp. Don't estimate earlier than the last used
-		 * timestamp though.
-		 */
-		estimated_first_ts = converted_timestamp -
-					(packet_queue->instr_count / INSTR_PER_NS);
-		packet_queue->cs_timestamp = max(packet_queue->cs_timestamp, estimated_first_ts);
+		return OCSD_RESP_CONT;
 	}
-	packet_queue->next_cs_timestamp = converted_timestamp;
-	packet_queue->instr_count = 0;
+
+	packet_queue->cs_timestamp = max(packet_queue->cs_timestamp, converted_timestamp);
 
 	/* Tell the front end which traceid_queue needs attention */
 	cs_etm__etmq_set_traceid_queue_ready(etmq, trace_chan_id);
@@ -353,13 +277,6 @@ cs_etm_decoder__do_hard_timestamp(struct cs_etm_queue *etmq,
 	return OCSD_RESP_WAIT;
 }
 
-static void
-cs_etm_decoder__reset_timestamp(struct cs_etm_packet_queue *packet_queue)
-{
-	packet_queue->next_cs_timestamp = 0;
-	packet_queue->instr_count = 0;
-}
-
 static enum cs_etm_isa
 cs_etm_decoder__get_isa(const ocsd_generic_trace_elem *elem)
 {
@@ -426,11 +343,6 @@ cs_etm_decoder__buffer_packet(struct cs_etm_queue *etmq,
 	packet_queue->packet_buffer[et].el = ocsd_EL_unknown;
 	packet_queue->packet_buffer[et].tid = -1;
 
-	/* Keep decoding until a timestamp is hit or queue fills up */
-	if (cs_etm__has_timestamps(etmq) &&
-	    packet_queue->packet_count < CS_ETM_PACKET_MAX_BUFFER - 1)
-		return OCSD_RESP_CONT;
-
 	cs_etm__etmq_set_traceid_queue_ready(etmq, trace_chan_id);
 	return OCSD_RESP_WAIT;
 }
@@ -467,19 +379,6 @@ cs_etm_decoder__buffer_range(struct cs_etm_queue *etmq,
 
 	packet->last_instr_size = elem->last_instr_sz;
 
-	packet_queue->instr_count += elem->num_instr_range;
-
-	if (packet_queue->next_cs_timestamp) {
-		/*
-		 * Once a real timestamp has been received, every range can be
-		 * handed to the frontend without queueing using an estimated
-		 * soft timestamp.
-		 */
-		cs_etm_decoder__do_soft_timestamp(packet_queue);
-		cs_etm__etmq_set_traceid_queue_ready(etmq, trace_chan_id);
-		return OCSD_RESP_WAIT;
-	}
-
 	return ret;
 }
 
@@ -489,11 +388,6 @@ cs_etm_decoder__buffer_discontinuity(struct cs_etm_queue *etmq,
 				     const ocsd_generic_trace_elem *elem,
 				     const uint8_t trace_chan_id)
 {
-	/*
-	 * Something happened and who knows when we'll get new traces so
-	 * reset time statistics.
-	 */
-	cs_etm_decoder__reset_timestamp(queue);
 	return cs_etm_decoder__buffer_packet(etmq, queue, elem, trace_chan_id,
 					     CS_ETM_DISCONTINUITY);
 }
@@ -602,12 +496,6 @@ cs_etm_decoder__set_tid(struct cs_etm_queue *etmq,
 	if (elem->context.el_valid)
 		packet->el = elem->context.exception_level;
 
-	/*
-	 * A timestamp is generated after a PE_CONTEXT element so make sure
-	 * to rely on that coming one.
-	 */
-	cs_etm_decoder__reset_timestamp(packet_queue);
-
 	return ret;
 }
 
@@ -815,11 +703,7 @@ int cs_etm_decoder__process_data_block(struct cs_etm_decoder *decoder,
 			break;
 		}
 
-		/*
-		 * Return to the input code if the packet buffer is full.
-		 * Flushing will get done once the packet buffer has been
-		 * processed.
-		 */
+		/* Return to the input code if processing was paused. */
 		if (OCSD_DATA_RESP_IS_WAIT(cur))
 			break;
 
diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index accd4ffc19aa..f33e410e85bf 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -570,6 +570,7 @@ static int cs_etm__process_aux_output_hw_id(struct perf_session *session,
 void cs_etm__etmq_set_traceid_queue_ready(struct cs_etm_queue *etmq,
 					  u8 trace_chan_id)
 {
+	/* Tell the frontend which queue the last processed packet is in. */
 	etmq->ready_chan_id = trace_chan_id;
 }
 
@@ -596,8 +597,7 @@ static u64 cs_etm__etmq_get_sort_timestamp(struct cs_etm_queue *etmq,
 	if (trace_chan_id)
 		*trace_chan_id = etmq->ready_chan_id;
 
-	packet_queue = cs_etm__etmq_get_packet_queue(etmq,
-						     etmq->ready_chan_id);
+	packet_queue = cs_etm__etmq_get_packet_queue(etmq, etmq->ready_chan_id);
 	if (!packet_queue)
 		return 0;
 
@@ -611,7 +611,7 @@ static u64 cs_etm__etmq_get_sort_timestamp(struct cs_etm_queue *etmq,
 	if (!etmq->etm->has_timestamps)
 		return etmq->buffer->time;
 
-	/* See function cs_etm_decoder__do_{hard|soft}_timestamp() */
+	/* Use the last trace timestamp, or zero if none has been found yet. */
 	return packet_queue->cs_timestamp;
 }
 
@@ -2614,9 +2614,7 @@ static int cs_etm__decode_data_block(struct cs_etm_queue *etmq)
 	/*
 	 * Packets are decoded and added to the decoder's packet queue
 	 * until the decoder packet processing callback has requested that
-	 * processing stops or there is nothing left in the buffer.  Normal
-	 * operations that stop processing are a timestamp packet or a full
-	 * decoder buffer queue.
+	 * processing stops or there is nothing left in the buffer.
 	 */
 	ret = cs_etm_decoder__process_data_block(etmq->decoder,
 						 etmq->offset,
diff --git a/tools/perf/util/cs-etm.h b/tools/perf/util/cs-etm.h
index ffe3a33885a7..e404753820dc 100644
--- a/tools/perf/util/cs-etm.h
+++ b/tools/perf/util/cs-etm.h
@@ -199,9 +199,7 @@ struct cs_etm_packet_queue {
 	u32 packet_count;
 	u32 head;
 	u32 tail;
-	u32 instr_count;
-	u64 cs_timestamp; /* Timestamp from trace data, converted to ns if possible */
-	u64 next_cs_timestamp;
+	u64 cs_timestamp; /* Timestamp, in ns when has_virtual_ts == true */
 	struct cs_etm_packet packet_buffer[CS_ETM_PACKET_MAX_BUFFER];
 };
 

-- 
2.43.0

