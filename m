Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019421;
	b=GXjwUijbeWJd4qsH90Y4BdQ86BikUxpsPbuuLHjgWoF7MeX2Z4jMNAbcfttl6w9S+Ool
	 9d6WJV7Oe29kkXShUy8DReHIwwJhx2+fWWo/oagKUDTiHuoEFpIQrKx22ho5ZWK80NgJG
	 lp6GV10qFV6tc3Qo1XhVFbKhNOUeusUTLZ0T78T6zwUappW10oucFrMEBnom7ZxCy0YEG
	 HNtAjm6Cw1gKaaEPrO2XNP9wcHt/32RK+AYs71L/g395SJiIfu/pklP2nt37uuc5r64yB
	 QF6ERqBBKzyB8zvrQ318BUa0Ukzn5QiRwSlr+syQXiWiJn2adINM3vzaHFvUQ5u1HDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019421;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=nmZMeH/lx+Th8Qg8Y5/5yDNje4F1kGKD5kvMgCaAHss=;
	b=kgr/OlgjldGRm2W+15LgznxPIl3sPGo86WdRdzN0CnDpWDf6SBW1Yki6KTWsh+6uNZVf
	 dplt3W0YRPxj5XOGUDeNPhqkx9xxiV35AAlgZQkr447MF+gu07jl6mq+4bGL6kbZVNohI
	 ivjNXFNh0Klx8xyZJJfMeFhXY7vgJlYwgCS9qGMUrQuQL3hzaczappTjvlpb8ZUluHNSo
	 sjSpgSn+wfFnBJGQihQsolCRV2kHK7bHWGIPJTDPz+i0hx4uA169a57OtjzRqSp6ONomz
	 NxHsGz0fwYgnz787aRmaNWU1+HBNG8OSFC7Xea7F3tslEaYpxmz/Me8q0xlN9LerlGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ikpTw3Pc;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5EF60A6F6C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:30:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A5EF60A6F6C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ikpTw3Pc
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so1021293f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019418; x=1795624218; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nmZMeH/lx+Th8Qg8Y5/5yDNje4F1kGKD5kvMgCaAHss=;
        b=ikpTw3PciWUIbQcB7uAtTbk4WJM9cmB5nT+AtZAoS/qs2BQICqaeOXNbaybC/v6+Iw
         z324qh0BqVDbshXofNhLvJZ+lTTVYrIqlVuxQ40gQ6VtjVHj3pQLRPjVq43dR0fmrthj
         PF2m3qch6f6UMy/eJRDGrgvOX6cliDzFfXZjnLKmY0q/zVdYEjSa4MH9j0VXY4FOrhnY
         FM3PVXWAPSnnHGOcmzrUHGWzKHBOtGvCJImQy6KNRnCrsr8w8W1d6e1wwilFZHLgj0xl
         IcSWuqgKbOHIFrm9AiRX6ga9HN5A8RC4UOUjqak13xbe4fncy2a0yAuOOzDvOQ0L4MID
         BRGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019418; x=1795624218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nmZMeH/lx+Th8Qg8Y5/5yDNje4F1kGKD5kvMgCaAHss=;
        b=agfRIB0CphGw85t/UIgLBv3wSQr8GDugdQ+olVSWj7H0dgnCGknsH+yeFwWjxrYn/U
         NHZ1NgV5oToFQvXzIPI8EcBFVFYLSqyEnknWRlfvIsS2yxE2cN2QXqpJRwkZSCff2US5
         QJO/oKqfFw1jnVU7KCb6/nRhQPWdzlp7Njx6W6vnyqEnZgKoOZ4BCyvnobwlQNUxCUt4
         bMoFsNshBMcouPy40VCN7LhhhRDMZdmkgupoAXQQhb6barJ4gcQ3eQ99BDFT/VxvwIiz
         CzXNYtkKZkeH5yO0wvhx0Xs76oNAy1SX9ej1P6IcMYDdwSWTxpvZLuw4MdcYIfgCKHhg
         AzYA==
X-Forwarded-Encrypted: i=1; AL+hErHPCuQVTZxsiMkZ+4MzKwXcgvwdSGM4TlzhSgekThQn4vOzmOV+QhP/9wS700Wf6kKtf6N65A+hDa1t4G4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/hwJ1kult6Ufhluvyz/e+1B1EHEeV1b03QII7nVhiu1VGYqHV
	KDmokzNhxTqRr8CktMVxXmjJ8MXmHovmhgemN458GsClAGVCNUigMZGgUk2dgGlKcrg=
X-Gm-Gg: AZFdTZdztvEfRlVPPY9nBYQoZfUxmAFdejdz2lK7otgdwnTIpo7S+qp8qft/jWQPXmc
	96AJ1TEb6wt2AVzBG+sLagNIRlnw3n+Xm53hGWsHiK4xFcSikwbL/XwOfp5Bxqqt4sfgh8k4nCy
	MX6Uz8IgPatIEdLPmIpMhTGaMpa2HSXw6/GNWxA51Crnk012gDkwG/uaLbNNvVOGekljBzu/QV/
	tMa6YaD82MyqVNm47GgxV4CdnEHogCayQZ0o0puCvEkAky2+4l+tajaZnBBzjglMEXAhffMs5q1
	vUnl/QBahYbj2CllqRe1WI2dr8DJYe56CutrvBfOw8Hk53RA+J9Zo6la2fptGta7UBOFyKvjnba
	Vt8uCgZGyXXuN3W+6C3+0yTWweoJuUBwMkwxgIKqIQqdGBIhIDg+SeE4EWOaemljGLIrwnR4jcn
	rNchi6LCKqUMLjodqEs2ZkPuq2fYtGHEA/Va+D8FDjN9DXpfwliRH7AIqYaQmXI5M46oCkFXI2s
	IUP0RpsIm09GBHriqFWMRNFaJ5n3SDXAGNe5QyBnKWL1L1MTsQCH6FOcs+UuWBiZlwWQOtAL2I6
	hKxCS9rHzw6ep1A8kH2G/e9viszKlf9I7A==
X-Received: by 2002:a05:6000:64d:b0:48e:fdd:41d9 with SMTP id ffacd0b85a97d-4a63b603a06mr6175135f8f.31.1795019417807;
        Wed, 18 Nov 2026 08:30:17 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:30:17 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:49 +0000
Subject: [PATCH 27/34] perf cs-etm: Add packet-only timestamp decoder ops
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
Message-Id: <20261118-james-coresight-jit-v1-27-dad4d90747f6@linaro.org>
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

Add OpenCSD packet-processing callbacks that find the next timestamp
without fetching instructions or producing instruction ranges. Bound the
search with CS_ETM_TIMESTAMP_SEARCH_MAX packets.

Keep the timestamp search state in cs_etm_timestamp_decoder, separate
from the full packet decoder. Each source's callback context identifies
its protocol. The frontend continues to use the existing full decoder.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.c | 79 +++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
index 4f8da538d645..685d8d75912f 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
@@ -33,6 +33,14 @@
 #define CS_PKT_MON	0
 #endif
 
+/*
+ * Limit when searching forwards for a timestamp.
+ *
+ * Timestamps follow context packets (which appear on trace on) after only
+ * 1 or 2 atoms. Allow up to 1024 packets across all interleaved trace IDs.
+ */
+#define CS_ETM_TIMESTAMP_SEARCH_MAX 1024
+
 struct cs_etm_decoder {
 	void *data;
 	void (*packet_printer)(const char *msg, void *data);
@@ -48,6 +56,19 @@ struct cs_etm_packet_decoder {
 	struct cs_etm_traceid_ctxt *traceid_ctxt;
 };
 
+struct cs_etm_timestamp_source {
+	struct cs_etm_timestamp_decoder *decoder;
+	int protocol;
+};
+
+struct cs_etm_timestamp_decoder {
+	struct cs_etm_decoder base;
+	u64 timestamp; /* Raw trace timestamp. */
+	u64 timestamp_search_index;
+	u32 timestamp_packet_count;
+	struct cs_etm_timestamp_source sources[];
+};
+
 static u32
 cs_etm_decoder__mem_access(const void *context,
 			   const ocsd_vaddr_t address,
@@ -512,6 +533,64 @@ static ocsd_datapath_resp_t cs_etm_decoder__gen_trace_elem_printer(
 	return resp;
 }
 
+static ocsd_datapath_resp_t __maybe_unused
+cs_etm_decoder__timestamp(const void *context, const ocsd_datapath_op_t op,
+			  const ocsd_trc_index_t indx, const void *packet)
+{
+	const struct cs_etm_timestamp_source *source = context;
+	struct cs_etm_timestamp_decoder *decoder = source->decoder;
+	bool timestamp = false;
+
+	if (op != OCSD_OP_DATA)
+		return OCSD_RESP_CONT;
+	if (indx < decoder->timestamp_search_index)
+		return OCSD_RESP_CONT;
+
+	decoder->timestamp_packet_count++;
+	switch (source->protocol) {
+	case CS_ETM_PROTO_ETMV3: {
+		const ocsd_etmv3_pkt *pkt = packet;
+
+		if (pkt->type == ETM3_PKT_TIMESTAMP) {
+			decoder->timestamp = pkt->timestamp;
+			timestamp = true;
+		}
+		break;
+	}
+	case CS_ETM_PROTO_PTM: {
+		const ocsd_ptm_pkt *pkt = packet;
+
+		if (pkt->type == PTM_PKT_TIMESTAMP) {
+			decoder->timestamp = pkt->timestamp;
+			timestamp = true;
+		}
+		break;
+	}
+	case CS_ETM_PROTO_ETMV4i:
+	case CS_ETM_PROTO_ETE: {
+		const ocsd_etmv4_i_pkt *pkt = packet;
+
+		if (pkt->type == ETM4_PKT_I_TIMESTAMP) {
+			decoder->timestamp = pkt->ts.timestamp;
+			timestamp = true;
+		}
+		break;
+	}
+	default:
+		return OCSD_RESP_FATAL_INVALID_PARAM;
+	}
+
+	/* Report where the timestamp was found */
+	if (timestamp)
+		decoder->timestamp_search_index = indx;
+
+	if (timestamp ||
+	    decoder->timestamp_packet_count >= CS_ETM_TIMESTAMP_SEARCH_MAX)
+		return OCSD_RESP_WAIT;
+
+	return OCSD_RESP_CONT;
+}
+
 static int
 cs_etm_decoder__create_etm_decoder(struct cs_etm_decoder_params *d_params,
 				   struct cs_etm_trace_params *t_params,

-- 
2.43.0

