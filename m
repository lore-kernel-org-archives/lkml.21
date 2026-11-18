Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019428;
	b=IR9bwkYDUeQ+yjuVYXS52kD4dCa+QJmZOs7KThYtCt+6lI78xau9fzu2UqxQOm1cl05q
	 plIpfgoU+gZIt3GHpPjyw2MrrKkYPkgReYJXXAa5L4uLYcQPVgD/d/pHrfKz9FUFMBOtw
	 bCAwlWwZ83uo9QxBe/K23c+CdcgZ2n94R+MOOAKTZI+xwpz7w/EBFkfxNGnJdPlqBPNcV
	 5gj4Y92YPmabQ0bTttdNG5MmGoGp4XjJCfTuurANLBBLW/5xDoKLUZL4FpU+5cdGwQRZu
	 QLfzTAKazMtQsGDFqcqoIrBDOK7e9I/4EaN4AyEF2bueK6UGJm2OOX/Hn0d3MlDjCyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019428;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+P2Ho1KsTiq+W5WSFOq2uZumwuM5Mc/rAo4vJCP5XRI=;
	b=W+FKczAv8d2+NHRe+NwOIrT6BL0xf4XVhtRKPihvDFKBY/BC0zS1ePkwIDWcJ0ux2Wtz
	 4ZpvnZlqu2GQxSLsFp/MbKcxoY3EXgMXYgB4nAATX+OsA3YziF6z3YB/enoopG71z/J0J
	 tcDrck86gxmQ+xq85nfEJ9gGFs/lqGJagkl7EIQwi8u71kWkYbndQxQIRuoK9DcAH/CrD
	 CU332XRHJPWGc5G+S2x1wKFelby3wGbSwcrp6HHEhF34qHq7mAQOzw2EixySECDHLS4BG
	 PGwnFv5uvWvl3JLwjqcUpxcmvKh2VMvFbttLug2vPPdDwW3IarOY1c+ffKTmtbJqWTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uXQN0dJO;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA20A60A6F7F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:30:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA20A60A6F7F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uXQN0dJO
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so7343535e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019421; x=1795624221; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+P2Ho1KsTiq+W5WSFOq2uZumwuM5Mc/rAo4vJCP5XRI=;
        b=uXQN0dJOOm0uMLpYFifRbdWr/TCe381egY6WkX5dAJQvtxsIbWXfgpkJM9cIm3ObjN
         /Tt95jqdBhg9xkpnlmnvRE05LUjrwwiGLQtV6bmsIfQ6n4P4LV6F5fQ0O2uBNw2zhvWf
         XyicJCuh6vtTpq+2ajvxAaC8+cPHB9ViLaDkJytbOAJSfo2FpDauzYsCwVFVAtcseLo8
         Y+KZeHVqrJ0Zj8WJGMxStasgqbTj1CcfRkoH7HPajKR/OS1yRFqFpYxyCV3DPGjohwy5
         gzXljML9S0PNJvbyrt8Co6dWg1xd8O+C9Do/m3axjQLyCCzYYho4eRqO1OSuV/fUTlTK
         v23A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019421; x=1795624221;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+P2Ho1KsTiq+W5WSFOq2uZumwuM5Mc/rAo4vJCP5XRI=;
        b=IAlrqsRG3LbUxHyKUF4jfIEXNgS706lCuBdNQM51FrGaBlttpKQfNgaIklS3pMO7wu
         JUl4tumU9pgpqWP+phHzJtR/2xE8paRWDwEH7bVDACnMbNgV046SaMtIfLb6CpXCDVi8
         JVrZu+mYgRTQlM1neCPpSz4w9wlHFWwvz3KjfjRb1DFifOT97QBYUGT95c2eYWUyhDfg
         F2L3ltHZOwOaL/B7AFyKP0MFoYVtkUKSgTkKCnwRvEljsWQsh1lu2Y4Fa5pWCkAoxp16
         r10PbhbqhOb25HUmLvEi/vmZ+zM8hPQBJ8KmRBi3ocdUXpHXAe50wT+xws4ZEwwunGFX
         +hKg==
X-Forwarded-Encrypted: i=1; AL+hErHEiG+9wTTKRrE2HphwwCQkJi0/7Q1qnNHG+Q1jH3905IlHoDxoSgnRLRPo7JXmWuUOCUgFIh9U3XrO5Oc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DKMtUEjwBs6L14s6XTpshpiKhJtvaMmRKYCobLkcf4UJpMnHo
	49ETMYER0/3gNT/LfUPOmjEgdxTArVpqKX4IMAgjlKj3L0zl/qMR5ZoKT+rI0hZyHvT3Z75XXR1
	yIY9H3Ic=
X-Gm-Gg: AYBFou2h7lpsXvqPEK4ZkBVQxIQ7V6GZrKf5Q9RyPaWNwPmMbLmzWiNLvOWhgbJ9KNP
	uFLYIERDwji2IXzQFOuI8MqVFvBzwcGLZhTSQBwKCounBxGj4Y/+NcQLPZkLX7C5bXQVNGGNwP5
	j509L4WEM30mCBwEg9E8XUM2W3B5mFueKNOMLh+IrMub8b9p3pOUqgjZakn3yDTS8tAcszAjOLA
	PZptEyoEWG5L4KLBdf/PTZOUwWIP/zOzYOdAbov47pTvaV0hewyhjqEYd63QfP0f2z9KrGjj6sO
	KQSUqeffE4NQzU4aatdcDOSlT2f4KVeQTQ2uG/e7DdDmTyR8AMpbCYykxT2PnnneMtIz6AWNYkS
	WEF1K88rcQMlhfeJrVbuX03Tgt53CeDD7epSycaQacCOEIXpJT1yLRsXLdK+s5fhqU73Jb4aQcy
	h5e1iREwgH3G4Of0E8FkhoByTMqP5ieEb1VptiUo7P9MkNcqHx5Vlls8PLBYSs/IZ4fNy7zw+M7
	xgheREL9stxbomT5AN7vJhnchaF8/7JwdTdmDHxrMbYqV8GAaQf4YnmYf6WA4QiIH/CUPBLA/nj
	fm3DoiDtYphJS2zXEnVMYlZgRZlGbfM57W/JE2Yir04ucmadJMgv5w==
X-Received: by 2002:a05:600c:8b6d:b0:4bb:6a78:7c42 with SMTP id 5b1f17b1804b1-4bb83248ecbmr75595e9.1.1795019421153;
        Wed, 18 Nov 2026 08:30:21 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:30:20 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:52 +0000
Subject: [PATCH 30/34] perf cs-etm: Invalidate OpenCSD's cache on MMAPs
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
Message-Id: <20261118-james-coresight-jit-v1-30-dad4d90747f6@linaro.org>
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

OpenCSD caches instruction bytes, but with a JIT runtime a new jitdump
mmap can replace code at a cached address without changing the context,
so subsequent decoding can use stale instructions.

Invalidate the packet decoder's caches on MMAPs when virtual timestamps
are enabled. Without virtual timestamps there's no proper ordering so
this wouldn't increase accuracy. This is unlikely to cause any
significant increase in overhead because MMAPs should be relatively rare
and OpenCSD invalidates the cache on context switches anyway.

The API has no explicit cache invalidation operation, so disable and
re-enable caching to discard its contents.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.c | 42 +++++++++++++++++++++++++
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.h |  2 ++
 tools/perf/util/cs-etm.c                        | 36 +++++++++++++++++++--
 3 files changed, 78 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
index b7ed7847f209..d6c2ae0b6a04 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
@@ -9,6 +9,7 @@
 #include <asm/bug.h>
 #include <linux/coresight-pmu.h>
 #include <linux/err.h>
+#include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/overflow.h>
 #include <linux/zalloc.h>
@@ -112,6 +113,47 @@ int cs_etm_decoder__add_mem_access_cb(struct cs_etm_packet_decoder *decoder,
 	return 0;
 }
 
+#if OCSD_VER_NUM >= 0x010503
+static int cs_etm_decoder__cache_param(const char *name, int default_value,
+				       long min_value, long max_value)
+{
+	const char *env = getenv(name);
+	long value = env ? strtol(env, NULL, 0) : 0;
+
+	if (value <= 0)
+		return default_value;
+
+	return clamp(value, min_value, max_value);
+}
+
+int cs_etm_decoder__invalidate_cache(struct cs_etm_packet_decoder *decoder)
+{
+	int page_size, nr_pages;
+
+	if (getenv("OPENCSD_MEMACC_CACHE_OFF"))
+		return 0;
+
+	/* Match OpenCSD's defaults and environment overrides. */
+	page_size = cs_etm_decoder__cache_param("OPENCSD_MEMACC_CACHE_PAGE_SIZE",
+						2048, 64, 16384);
+	nr_pages = cs_etm_decoder__cache_param("OPENCSD_MEMACC_CACHE_PAGE_NUM",
+					       16, 4, 256);
+
+	/* The C API has no invalidate operation; disabling destroys the cache. */
+	if (ocsd_dt_set_mem_acc_cacheing(decoder->base.dcd_tree, 0, 0, 0) ||
+	    ocsd_dt_set_mem_acc_cacheing(decoder->base.dcd_tree, 1, page_size, nr_pages))
+		return -1;
+
+	return 0;
+}
+
+#else
+int cs_etm_decoder__invalidate_cache(struct cs_etm_packet_decoder *decoder __maybe_unused)
+{
+	return 0;
+}
+#endif
+
 static int cs_etm_decoder__reset_core(struct cs_etm_decoder *core)
 {
 	ocsd_datapath_resp_t dp_ret;
diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
index 67592b93778e..6e56ac57b311 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
@@ -108,6 +108,8 @@ int cs_etm_decoder__add_mem_access_cb(struct cs_etm_packet_decoder *decoder,
 				      u64 start, u64 end,
 				      cs_etm_mem_cb_type cb_func);
 
+int cs_etm_decoder__invalidate_cache(struct cs_etm_packet_decoder *decoder);
+
 /* Reset all decoders to the start index of a new AUX buffer. */
 int cs_etm_decoder__reset(struct cs_etm_packet_decoder *decoder, u64 index);
 const char *cs_etm_decoder__get_name(struct cs_etm_packet_decoder *decoder);
diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 5a704dfeebd3..a747c5873bc8 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -2682,6 +2682,25 @@ static int cs_etm__process_switch(struct cs_etm_auxtrace *etm,
 	return cs_etm__associate_tid(etm, sample->pid, sample->tid);
 }
 
+static int cs_etm__invalidate_cache(struct cs_etm_auxtrace *etm)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < etm->queues.nr_queues; i++) {
+		struct cs_etm_queue *etmq = etm->queues.queue_array[i].priv;
+
+		if (!etmq || !etmq->decoder)
+			continue;
+
+		ret = cs_etm_decoder__invalidate_cache(etmq->decoder);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int cs_etm__process_event(struct perf_session *session,
 				 union perf_event *event,
 				 struct perf_sample *sample,
@@ -2764,8 +2783,21 @@ static int cs_etm__process_event(struct perf_session *session,
 		break;
 	}
 
-	if (has_sample_time)
-		return cs_etm__pop_heap(etm, sample->time);
+	if (has_sample_time) {
+		ret = cs_etm__pop_heap(etm, sample->time);
+		if (ret)
+			return ret;
+	}
+
+	/*
+	 * Invalidate after popping and decoding because Perf only updates the
+	 * map after returning from this function. That way decoding doesn't
+	 * pull the old map back into the cache again.
+	 */
+	if (etm->has_virtual_ts &&
+	    (event->header.type == PERF_RECORD_MMAP ||
+	     event->header.type == PERF_RECORD_MMAP2))
+		return cs_etm__invalidate_cache(etm);
 
 	return 0;
 }

-- 
2.43.0

