Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019416;
	b=03Kr2LPmXlES5oBYV9hzkPgkK+pPiXR9ICy9UGfOJJ98eUkj2RmLpUIp5bFEPFWDRlv1
	 D1TtWyHzruZqZz0Z98CsAwfMh3DjWOCGKLhKiXLBqj8ETjA7mmOmll+f/OVE7vWqCZN9A
	 ZL67I9O3N9eefVPAEW2vpS/DkCslb+kY+9wXXFzB/ZJVIM+CUHfwSG0gn71jKMUtDpvlL
	 EzT3+Zt/3GmQRk3U2WXMh0QWwIinzR6SCXTALKN7c3+xiUrjbg437p8+giTgrLUNfGTxS
	 tdvDnMGBCi+DtS7oeQ/weAtOTPhAyVG7sVSeuc+Nm/KIbF476z1RHmrXeh/LpKa8AZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019416;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=5F3MDxW068xRY6YYuN/9OnYsD6yF5GzetAMnICxwHKI=;
	b=D7yqchXgifRoeCnlnY7KsxPoRmRD8UdXP32IXP9VEUZZe6n6/GYqbOVGfFs7/D6pDd0Y
	 bUtSIIaNWvMydrktXPdaA8T3ZyLGsJsIQ8CljnLPC2+IfGvnBwZSRtIMPqd/Rrp33N5OR
	 lLCfaj0pH+A7Boao0ZzA/5e/OuNREMUGygwrQBipEmzFy9kW6lk9AWojyIuor1Bubj5OJ
	 WMtHoxU5vOuXO9hq8TuTP0AmscXdhZ/e+6hZnhVHTQa3Y3VnKsoN4KMGf9JbDAkFFIoAi
	 sXxqIxgFOAzpedP+JRVaDyRjF9DqklBl4sGE/fMc/ng5lXmUK8uN/OaxSDvnHaRRS9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MHfNGihI;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E225360A261A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:30:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E225360A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MHfNGihI
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso11806345e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019414; x=1795624214; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5F3MDxW068xRY6YYuN/9OnYsD6yF5GzetAMnICxwHKI=;
        b=MHfNGihIuE3MixEKs3Fgrb9NTkkbzQIGfiRk5qI5QDULg+ekQGo0IqI6n7vYOCf3PP
         bTgWTYj1RO+yi+qyVbNyZb+c/JmB2M/cxHf5cAvVPWD5UNLEhY0sN0LgP7/UC+ksix19
         fK04Kwa+vr9yEmsuxcgazsET0CMqfDZEnNBXpUlONGpq2fhnNSmThx6KY6ORud+Z4qZl
         pXhSy05QBJO/kqicrGmcNuPht7gTGzaTU9Y64GfqwnhR1vsxEVbvDGHga6PbY9LFE4aQ
         Yt7g+lvyu2nRBo2p6EUSmjxA/Ko/5B3YqZ7ygPCuAf7U0mkg61vepSX+iF7RMzwtnFcU
         D1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019414; x=1795624214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5F3MDxW068xRY6YYuN/9OnYsD6yF5GzetAMnICxwHKI=;
        b=aslRAdez1tbJMRN4Wi7MmqIvLD3GYmMRfXNtiSLKOEXUYhYbSzbkPuUwl9holG9bCq
         TdVI7A3C9KKL2LRdqF865OeeCsgc27Ysk3gR95jj8SZEP0LH+QaKiwZ52yn3prXubF0h
         NVP8x3t95RylONlkdzjS5I+8U3yifet5zl2PE033kSDvTifD9h4CvNxQ5ZK+YQ3SbBu3
         CsXxHUubRqfK/88i4OXkuHkDyMO7ey1DzBn0u+wvhIS6cl7vDsHWwlRbPRSgzjjH/pO4
         AkBcM//Hqax87C7mbdm/HyiRc4Sp75gSKqwlgdKZbdRZv6I18/S6JOscLsBRifbmclyT
         HN2Q==
X-Forwarded-Encrypted: i=1; AL+hErEwlGssNiIUAKtbVyf+JYfh8G/cP5shXl/8yr9mJ/L0jZvZY/66IAtfBWDF51B68mlRaAM/AhqbtGCqOg4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/p2cr3rSg0rZqax23Ol2H6VYlYilSk+mTuKxjBS9siZZWrIexW
	IePQmuU/TVc93AWgtFQUrtrqVoAciiLdp9WfUiYQPMyeivcudAvdbQUN04C2cf4lJtU=
X-Gm-Gg: AYBFou2BePItQnU0eb4YVozy66gfPo0skVtFyheE9QzKGemwDX+slV72c217/aYxGbO
	9BmREqh38oJ67JJltTmIE0BxpaY4JU/aJqFBsGDTxb5enMD1XhjyEjZ2vx6Fza219AmvmYD9D4R
	DP/wADebKY6IhFfPw47lJFN3udZiufkJR6B9L+YReKVr4ilJ8rIDrSEUGt1bPqS6Ww32k1G1Gbe
	9XA/tqnonbcfTpQ77b9192/IR97G27ur4R/LJxsxXCNtb/h55sQLybSyV+Y+JDBn0hl5e7UPGo6
	tNSkpcrqqHz140OOvLPIqed6x6i3+5tZk1ZQXeVebWgSN7sXxzSxAo1Qualz4IybTsgkSIBYroi
	r/z7jy72uRnPVmIgMS3YfVWkq+dYUWa5khKpCaUpWKeOCBoUrdELOGmzp+DAfiIEnKwN/5+OjI7
	TQS88qrgYG9j3xq7keEK6GTLYD9Yl73fXyknLI6l+DXivRiSYhAukEfV+Y9pyqlubm46pFL7kwA
	RMFvpb9XAWS3N1pSkayus0Kk1gkloXpnstsruYQjUKhJQJokFZArqa+LRMSb3zwtw7NzXACPg2P
	fv7TQhL9tp8vawf4JhUXAKnhqm/ttuSn
X-Received: by 2002:a05:600d:82c6:b0:4a7:9006:b176 with SMTP id 5b1f17b1804b1-4bb7da13982mr64688585e9.7.1795019414262;
        Wed, 18 Nov 2026 08:30:14 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:30:13 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:46 +0000
Subject: [PATCH 24/34] perf cs-etm: Share the thread ctxt between frontend
 and backend
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
Message-Id: <20261118-james-coresight-jit-v1-24-dad4d90747f6@linaro.org>
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

The decoder stops at every context packet and resumes only after the
frontend has processed it, so now we only need to keep track of a single
thread context.

The thread gets updated when the frontend processes a context packet.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.c |  4 --
 tools/perf/util/cs-etm.c                        | 73 +++++++------------------
 tools/perf/util/cs-etm.h                        | 10 +---
 3 files changed, 22 insertions(+), 65 deletions(-)

diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
index 7a1d50ca5949..06c57326ac80 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
@@ -468,10 +468,6 @@ cs_etm_decoder__set_tid(struct cs_etm_queue *etmq,
 		break;
 	}
 
-	if (cs_etm__etmq_update_decode_context(etmq, trace_chan_id,
-				elem->context.exception_level, tid))
-		return OCSD_RESP_FATAL_SYS_ERR;
-
 	ret = cs_etm_decoder__buffer_packet(etmq, tidc, elem,
 					    trace_chan_id, CS_ETM_CONTEXT);
 	if (ret != OCSD_RESP_CONT && ret != OCSD_RESP_WAIT)
diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index e2e84561c0c9..97ed12d03555 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -604,11 +604,9 @@ static int cs_etm__init_traceid_ctxt(struct cs_etm_queue *etmq,
 	queue = &etmq->etm->queues.queue_array[etmq->queue_nr];
 	tidc->trace_chan_id = trace_chan_id;
 	tidc->decode_el = ocsd_EL_unknown;
-	tidc->frontend_thread = machine__findnew_thread(&etm->session->machines.host, -1,
+	tidc->thread = machine__findnew_thread(&etm->session->machines.host, -1,
 					       queue->tid);
-	tidc->decode_thread = machine__findnew_thread(&etm->session->machines.host, -1,
-					       queue->tid);
-	if (!tidc->frontend_thread || !tidc->decode_thread)
+	if (!tidc->thread)
 		goto out;
 
 	tidc->packet = zalloc(sizeof(struct cs_etm_packet));
@@ -652,8 +650,7 @@ static int cs_etm__init_traceid_ctxt(struct cs_etm_queue *etmq,
 	zfree(&tidc->prev_packet);
 	zfree(&tidc->packet);
 out:
-	thread__zput(tidc->frontend_thread);
-	thread__zput(tidc->decode_thread);
+	thread__zput(tidc->thread);
 	return rc;
 }
 
@@ -908,8 +905,7 @@ static void cs_etm__free_traceid_ctxts(struct cs_etm_queue *etmq)
 
 		/* Free this decode context from the array */
 		tidc = etmq->traceid_ctxts[idx];
-		thread__zput(tidc->frontend_thread);
-		thread__zput(tidc->decode_thread);
+		thread__zput(tidc->thread);
 		zfree(&tidc->event_buf);
 		zfree(&tidc->callchain);
 		zfree(&tidc->last_branch);
@@ -1168,7 +1164,7 @@ static u32 cs_etm__frontend_mem_access(struct cs_etm_queue *etmq,
 				       u64 address, size_t size, u8 *buffer)
 {
 	return __cs_etm__mem_access(etmq, address, size, buffer, 0, packet->el,
-				    tidc->frontend_thread);
+				    tidc->thread);
 }
 
 static u32 cs_etm__decoder_mem_access(struct cs_etm_queue *etmq, u8 trace_chan_id,
@@ -1183,7 +1179,7 @@ static u32 cs_etm__decoder_mem_access(struct cs_etm_queue *etmq, u8 trace_chan_i
 
 	return __cs_etm__mem_access(etmq, address, size, buffer,
 				    mem_space, tidc->decode_el,
-				    tidc->decode_thread);
+				    tidc->thread);
 }
 
 static struct cs_etm_queue *cs_etm__alloc_queue(void)
@@ -1472,30 +1468,6 @@ static int cs_etm__etmq_update_thread(struct cs_etm_queue *etmq,
 	return 0;
 }
 
-/*
- * Set the thread and EL of the decode context which is ahead in time of the
- * frontend context.
- */
-int cs_etm__etmq_update_decode_context(struct cs_etm_queue *etmq,
-				       u8 trace_chan_id,
-				       ocsd_ex_level el, pid_t tid)
-{
-	struct cs_etm_traceid_ctxt *tidc;
-	int ret;
-
-	tidc = cs_etm__etmq_get_traceid_ctxt(etmq, trace_chan_id);
-	if (!tidc)
-		return -EINVAL;
-
-	ret = cs_etm__etmq_update_thread(etmq, el, tid,
-					 &tidc->decode_thread);
-	if (ret)
-		return ret;
-
-	tidc->decode_el = el;
-	return 0;
-}
-
 bool cs_etm__has_timestamps(struct cs_etm_queue *etmq)
 {
 	return etmq->etm->has_timestamps;
@@ -1590,13 +1562,13 @@ static void cs_etm__add_stack_event(struct cs_etm_queue *etmq,
 		size = cs_etm__instr_size(etmq, tidc, tidc->prev_packet, from);
 
 		/* Enable callchain so thread stack entry can be allocated */
-		thread_stack__event(tidc->frontend_thread, tidc->prev_packet->cpu,
+		thread_stack__event(tidc->thread, tidc->prev_packet->cpu,
 				    tidc->prev_packet->flags, from, to, size,
 				    etmq->buffer->buffer_nr + 1,
 				    etmq->etm->use_callchain,
 				    tidc->br_stack_sz, 0);
 	} else {
-		thread_stack__set_trace_nr(tidc->frontend_thread,
+		thread_stack__set_trace_nr(tidc->thread,
 					   tidc->prev_packet->cpu,
 					   etmq->buffer->buffer_nr + 1);
 	}
@@ -1607,14 +1579,14 @@ static void cs_etm__sample_branch_stack(struct cs_etm_auxtrace *etm,
 					struct perf_sample *sample)
 {
 	if (etm->synth_opts.last_branch) {
-		thread_stack__br_sample(tidc->frontend_thread, tidc->packet->cpu,
+		thread_stack__br_sample(tidc->thread, tidc->packet->cpu,
 					tidc->last_branch, tidc->br_stack_sz);
 		sample->branch_stack = tidc->last_branch;
 	}
 
 	if (etm->synth_opts.callchain) {
 		if (tidc->kernel_start)
-			thread_stack__sample(tidc->frontend_thread,
+			thread_stack__sample(tidc->thread,
 					     tidc->packet->cpu,
 					     tidc->callchain,
 					     etm->synth_opts.callchain_sz + 1,
@@ -1652,8 +1624,8 @@ static int cs_etm__synth_instruction_sample(struct cs_etm_queue *etmq,
 	sample.time = cs_etm__resolve_sample_time(etmq, tidc);
 
 	sample.ip = addr;
-	sample.pid = thread__pid(tidc->frontend_thread);
-	sample.tid = thread__tid(tidc->frontend_thread);
+	sample.pid = thread__pid(tidc->thread);
+	sample.tid = thread__tid(tidc->thread);
 	sample.id = etmq->etm->instructions_id;
 	sample.stream_id = etmq->etm->instructions_id;
 	sample.period = period;
@@ -1748,8 +1720,8 @@ static int cs_etm__synth_branch_sample(struct cs_etm_queue *etmq,
 	sample.time = cs_etm__resolve_sample_time(etmq, tidc);
 
 	sample.ip = ip;
-	sample.pid = thread__pid(tidc->frontend_thread);
-	sample.tid = thread__tid(tidc->frontend_thread);
+	sample.pid = thread__pid(tidc->thread);
+	sample.tid = thread__tid(tidc->thread);
 	sample.addr = cs_etm__first_executed_instr(tidc->packet);
 	sample.id = etmq->etm->branches_id;
 	sample.stream_id = etmq->etm->branches_id;
@@ -1994,16 +1966,17 @@ static int cs_etm__context(struct cs_etm_queue *etmq,
 	}
 
 	tidc->kernel_start = machine__kernel_start(machine);
+	tidc->decode_el = el;
 
 	ret = cs_etm__etmq_update_thread(etmq, el, tidc->packet->tid,
-					 &tidc->frontend_thread);
+					 &tidc->thread);
 	if (ret)
 		goto err;
 
 	return 0;
 
 err:
-	thread__zput(tidc->frontend_thread);
+	thread__zput(tidc->thread);
 	tidc->kernel_start = 0;
 	return ret;
 }
@@ -2052,7 +2025,7 @@ static int cs_etm__flush(struct cs_etm_queue *etmq,
 
 	/* Reset last branches after flush the trace */
 	if (etm->use_thread_stack)
-		thread_stack__flush(tidc->frontend_thread);
+		thread_stack__flush(tidc->thread);
 
 	return err;
 }
@@ -2164,15 +2137,11 @@ static int cs_etm__get_data_block(struct cs_etm_queue *etmq)
 			tidc = cs_etm__etmq_get_traceid_ctxt(etmq, inode->i);
 			if (!tidc)
 				return -ENOMEM;
-			if (thread__tid(tidc->decode_thread) == etmq->buffer->tid)
+			if (thread__tid(tidc->thread) == etmq->buffer->tid)
 				continue;
 
-			thread__zput(tidc->frontend_thread);
-			thread__zput(tidc->decode_thread);
-			tidc->frontend_thread = machine__findnew_thread(
-				&etm->session->machines.host, -1,
-				etmq->buffer->tid);
-			tidc->decode_thread = machine__findnew_thread(
+			thread__zput(tidc->thread);
+			tidc->thread = machine__findnew_thread(
 				&etm->session->machines.host, -1,
 				etmq->buffer->tid);
 		}
diff --git a/tools/perf/util/cs-etm.h b/tools/perf/util/cs-etm.h
index 115def9c6abb..c41a7b5dd62f 100644
--- a/tools/perf/util/cs-etm.h
+++ b/tools/perf/util/cs-etm.h
@@ -260,21 +260,13 @@ struct cs_etm_traceid_ctxt {
 	u32 packet_count;
 	u64 cs_timestamp; /* Timestamp, in ns when has_virtual_ts == true */
 
-	struct thread *decode_thread;
 	ocsd_ex_level decode_el;
 
-	/*
-	 * Samples use the EL saved in their source packet. A branch sample
-	 * cannot change thread, so the thread is kept in the frontend context.
-	 */
-	struct thread *frontend_thread;
+	struct thread *thread;
 };
 
 int cs_etm__get_cpu(struct cs_etm_queue *etmq, u8 trace_chan_id, int *cpu);
 enum cs_etm_pid_fmt cs_etm__get_pid_fmt(struct cs_etm_queue *etmq);
-int cs_etm__etmq_update_decode_context(struct cs_etm_queue *etmq,
-				       u8 trace_chan_id, ocsd_ex_level el,
-				       pid_t tid);
 bool cs_etm__has_timestamps(struct cs_etm_queue *etmq);
 void cs_etm__etmq_set_traceid_ctxt_ready(struct cs_etm_queue *etmq,
 					  u8 trace_chan_id);

-- 
2.43.0

