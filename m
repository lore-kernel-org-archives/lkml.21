Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019428;
	b=1FzMij1n5WKeqLVThEC5E+9D9c+S0lIqbolZ1V0UDszDvlqN32ge7m9Ifo692L4Q5bKr
	 xwVMoLx9UH4y2+DEOtQZoXY/ZUUgz479Lb3HvOUhbqztRZsZ4UNA0Chuva9RUYVENYWWL
	 hm5leGB8uTpPT4owK1WxOCSDDriW5RpAGnaFw8jBpay6SyZ2dayLFVYIlUwj2TK/HcGdt
	 hJdibj7g8WyuYlGt0acav1eiCja4p1+BA1XI3DJvcJ2bYqg2ZcEw3dbXKyEZ6fgIIoezE
	 Ml7KX6Vw6NgaiymKfh27hkCP8gMkwDLxgV8JHGOIBvbrBa1Ko3e5QvpDUmyqTu1MjdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019428;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=vIx3mrzNAXEdeDM0JqODUVOm62e21zzqR/9csS4I7jI=;
	b=x90ffz539icHC+pyDaDlFUvVIoTtYBQuVlUXF/0V/5nW6UydwFJ/ksUcroTL33io4OM0
	 SyhzYVLJH2M3ysDyl7F6zO9fKYVUIl1186+9NvCBk2Q5eTbyP43MVHlNfe5Nu6xm3hlPw
	 hykqOeXBSIfa3WTkmfdNWuqIiR9aJhp8iON7dlq1/Xn9xwzgRkUwE6cQlfcfPLkmwPCNw
	 Wx2v/X2xQpkdxQhxlKXq3vbuRwr8jWjuzXmjk9n1QbFPve8TNMAXcLxAh9KKKLhd9R8VU
	 GIw2HaE/jTx4/voibulMcPNX8/UutPAgH5VECkUqatcbCFW+2hREj4bG/O6TY4R8giA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Re6Bg6Xi;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C77060A6F5F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:30:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C77060A6F5F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Re6Bg6Xi
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e3b22e971so681187f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019417; x=1795624217; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vIx3mrzNAXEdeDM0JqODUVOm62e21zzqR/9csS4I7jI=;
        b=Re6Bg6Xid3evcB1FTYDmXNfS4NZ4+mRishuF8ArM2LyTEJo8DRESieiQ+TQzsddRzT
         qtAl6vCoPkc/f2aguo5tFvnYNhAxCUzir/P5OlW3Z1lypfLUc4OivJtaF0hXoosZvJoR
         csy/uPFrtefecY/zqrs8KqUY548CJk0xhAhyBCLYUpQCtLPELNbKmL7jBGXrpUqy+0A0
         qGPBTgGrxSuldLGcI/iDFdREkqQBCxUDyzC3TD6YU7IikRLQaOr4eJ5k2Y3R59PQ3IBp
         10OefY3qF8rdCBJxIhfql/WXvSg+WOMgKU/MWbELqSBSRPAit9WWUTBdGdRSD/YgTfvL
         5YeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019417; x=1795624217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vIx3mrzNAXEdeDM0JqODUVOm62e21zzqR/9csS4I7jI=;
        b=KeKYZ+cjOX4BKkJp+cV9bANWoNv5NLO0bN5Qw/7KorLVCxvxkkhwWy/mrUNvRcLSgb
         +z41EjM/QugM0DuW1o4hcWwG2eURYGI5Mv30AvDP4fhUJV+tgYiz8xV7v9LrWyAEq/5y
         fb+zcGe5PyyTb/pBS6NcU/ypDe7nUKXSZgBdSBQ4T2IF4X3m62SjT76H4TsiRCRhR/lt
         QBa/pvKdhqYAN9JFI3NZ1z9xbAeBufLOAyftGD/pp/i36/SGlNE+jFDvdCeZ5K+dGy4E
         LHkhQUmngejQKQJZEGA3K+NsHVowsJ7zuNSRuvX+/+awES98KhiEeKBKYso1NL05GvoQ
         LDXA==
X-Forwarded-Encrypted: i=1; AL+hErElwCpMT5GZ5vtmh4uDTXxZyoIgCQ1U6tiYWTgiEyEVOvmrXFvnHkwGNa/1nesieYRxnD5gxWO8dTf/uQc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ofo4FQAA22gLvEpJ+6e7lqxZVkvKSZge6HCmrNvd/9Nld9TS9
	KZHYJEFbtnG6WcF79hzbzCz322MY/qgnQcGdU47/7PxJFFNWgV4ErZtM0NsQuh0p9fI=
X-Gm-Gg: AZFdTZfITFxXQFSewHQotVMm23pP10Iq8WCAhqoLnmfcKuc7KHaAL6SS5ETqhUqlEoG
	whZPpb94/nkMTOjhFgjyl39vtEejqdIa5IuuzrONOQgiRqtwPr4qcii3FDQCihDpDN/SU2/ugJu
	Rtk4yq+I1BNqSR2SNhEt9Qcq63XZXBJEgb3jvVS5eJnggZbn6v5LqToVYqpV9/VEsLTl3Lu2ugv
	A/+qmICQd5n674Ld09KsN2LEozIzbS02H9009gpnyiipM6Qmy0m52tS/ZLrMYteppgb9H24OVQd
	QcNEm1P8FHeIN7KmNDp13rvNc6u++heDKJSQaIj/yMm3WP6SuHvqX3E9Z0Rnx5+sVf0r+4aS35b
	J1ynLEikD1lXeXBk77MBSWuo+xSCjQY0310iz9qD6X8g7YpiBVJn3qkUpHLuSeyjcOvfOMOd0C8
	yAeIXvoX4XkPHXTI0MzT5RWj7BkSq3nxcv4PYzasgbYyWt5l5JBUUtZJYb9rk+hE/nF9zl1CGdq
	ID2kbBOf31QtbIgNyLpLY/vnBNvul+3czIm2mozQZtcPzIP1C2iF31A5uaqRRyguKctEBpwsBVE
	zvG4z/0D3O3gfUDSKSFNKyt8Fz0bjv7wIgHfHsZFd2sGKldZ7dlz3A==
X-Received: by 2002:adf:e188:0:b0:492:3176:3d6f with SMTP id ffacd0b85a97d-4a63ca2f773mr6237311f8f.47.1795019416789;
        Wed, 18 Nov 2026 08:30:16 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:30:15 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:48 +0000
Subject: [PATCH 26/34] perf cs-etm: Split base and packet decoder state
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
Message-Id: <20261118-james-coresight-jit-v1-26-dad4d90747f6@linaro.org>
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

Separate decoder struct into members that will be common with the
timestamp decoder and members that are specific to the packet decoder.
Then the timestamp decoder can use the shared base struct.

No functional changes intended.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.c | 80 +++++++++++++------------
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.h | 14 ++---
 tools/perf/util/cs-etm.c                        |  2 +-
 3 files changed, 50 insertions(+), 46 deletions(-)

diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
index dc17a2fd6c00..4f8da538d645 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
@@ -38,9 +38,13 @@ struct cs_etm_decoder {
 	void (*packet_printer)(const char *msg, void *data);
 	bool suppress_printing;
 	dcd_tree_handle_t dcd_tree;
-	cs_etm_mem_cb_type mem_access;
 	ocsd_datapath_resp_t prev_return;
 	const char *decoder_name;
+};
+
+struct cs_etm_packet_decoder {
+	struct cs_etm_decoder base;
+	cs_etm_mem_cb_type mem_access;
 	struct cs_etm_traceid_ctxt *traceid_ctxt;
 };
 
@@ -52,19 +56,19 @@ cs_etm_decoder__mem_access(const void *context,
 			   const u32 req_size,
 			   u8 *buffer)
 {
-	struct cs_etm_decoder *decoder = (struct cs_etm_decoder *) context;
+	struct cs_etm_packet_decoder *decoder = (struct cs_etm_packet_decoder *) context;
 
-	return decoder->mem_access(decoder->data, trace_chan_id, address,
+	return decoder->mem_access(decoder->base.data, trace_chan_id, address,
 				   req_size, buffer, mem_space);
 }
 
-int cs_etm_decoder__add_mem_access_cb(struct cs_etm_decoder *decoder,
+int cs_etm_decoder__add_mem_access_cb(struct cs_etm_packet_decoder *decoder,
 				      u64 start, u64 end,
 				      cs_etm_mem_cb_type cb_func)
 {
 	decoder->mem_access = cb_func;
 
-	if (ocsd_dt_add_callback_trcid_mem_acc(decoder->dcd_tree, start, end,
+	if (ocsd_dt_add_callback_trcid_mem_acc(decoder->base.dcd_tree, start, end,
 					       OCSD_MEM_SPACE_ANY,
 					       cs_etm_decoder__mem_access,
 					       decoder))
@@ -73,15 +77,15 @@ int cs_etm_decoder__add_mem_access_cb(struct cs_etm_decoder *decoder,
 	return 0;
 }
 
-int cs_etm_decoder__reset(struct cs_etm_decoder *decoder)
+int cs_etm_decoder__reset(struct cs_etm_packet_decoder *decoder)
 {
 	ocsd_datapath_resp_t dp_ret;
 
-	decoder->prev_return = OCSD_RESP_CONT;
-	decoder->suppress_printing = true;
-	dp_ret = ocsd_dt_process_data(decoder->dcd_tree, OCSD_OP_RESET,
+	decoder->base.prev_return = OCSD_RESP_CONT;
+	decoder->base.suppress_printing = true;
+	dp_ret = ocsd_dt_process_data(decoder->base.dcd_tree, OCSD_OP_RESET,
 				      0, 0, NULL, NULL);
-	decoder->suppress_printing = false;
+	decoder->base.suppress_printing = false;
 	if (OCSD_DATA_RESP_IS_FATAL(dp_ret))
 		return -1;
 
@@ -469,8 +473,8 @@ static ocsd_datapath_resp_t cs_etm_decoder__gen_trace_elem_printer(
 {
 	ocsd_datapath_resp_t resp = OCSD_RESP_CONT;
 	ocsd_gen_trc_elem_t type;
-	struct cs_etm_decoder *decoder = (struct cs_etm_decoder *) context;
-	struct cs_etm_queue *etmq = decoder->data;
+	struct cs_etm_packet_decoder *decoder = (struct cs_etm_packet_decoder *) context;
+	struct cs_etm_queue *etmq = decoder->base.data;
 	struct cs_etm_traceid_ctxt *tidc;
 
 	tidc = cs_etm__etmq_get_traceid_ctxt(etmq, trace_chan_id);
@@ -511,7 +515,7 @@ static ocsd_datapath_resp_t cs_etm_decoder__gen_trace_elem_printer(
 static int
 cs_etm_decoder__create_etm_decoder(struct cs_etm_decoder_params *d_params,
 				   struct cs_etm_trace_params *t_params,
-				   struct cs_etm_decoder *decoder)
+				   struct cs_etm_packet_decoder *decoder)
 {
 	ocsd_etmv3_cfg config_etmv3;
 	ocsd_etmv4_cfg trace_config_etmv4;
@@ -524,7 +528,7 @@ cs_etm_decoder__create_etm_decoder(struct cs_etm_decoder_params *d_params,
 	case CS_ETM_PROTO_PTM:
 		csid = (t_params->etmv3.reg_idr & CORESIGHT_TRACE_ID_VAL_MASK);
 		cs_etm_decoder__gen_etmv3_config(t_params, &config_etmv3);
-		decoder->decoder_name = (t_params->protocol == CS_ETM_PROTO_ETMV3) ?
+		decoder->base.decoder_name = (t_params->protocol == CS_ETM_PROTO_ETMV3) ?
 							OCSD_BUILTIN_DCD_ETMV3 :
 							OCSD_BUILTIN_DCD_PTM;
 		trace_config = &config_etmv3;
@@ -532,13 +536,13 @@ cs_etm_decoder__create_etm_decoder(struct cs_etm_decoder_params *d_params,
 	case CS_ETM_PROTO_ETMV4i:
 		csid = (t_params->etmv4.reg_traceidr & CORESIGHT_TRACE_ID_VAL_MASK);
 		cs_etm_decoder__gen_etmv4_config(t_params, &trace_config_etmv4);
-		decoder->decoder_name = OCSD_BUILTIN_DCD_ETMV4I;
+		decoder->base.decoder_name = OCSD_BUILTIN_DCD_ETMV4I;
 		trace_config = &trace_config_etmv4;
 		break;
 	case CS_ETM_PROTO_ETE:
 		csid = (t_params->ete.reg_traceidr & CORESIGHT_TRACE_ID_VAL_MASK);
 		cs_etm_decoder__gen_ete_config(t_params, &trace_config_ete);
-		decoder->decoder_name = OCSD_BUILTIN_DCD_ETE;
+		decoder->base.decoder_name = OCSD_BUILTIN_DCD_ETE;
 		trace_config = &trace_config_ete;
 		break;
 	default:
@@ -551,25 +555,25 @@ cs_etm_decoder__create_etm_decoder(struct cs_etm_decoder_params *d_params,
 		decode_flags |= OCSD_OPFLG_N_UNCOND_DIR_BR_CHK | OCSD_OPFLG_CHK_RANGE_CONTINUE |
 				ETM4_OPFLG_PKTDEC_AA64_OPCODE_CHK;
 #endif
-		if (ocsd_dt_create_decoder(decoder->dcd_tree,
-					   decoder->decoder_name,
+		if (ocsd_dt_create_decoder(decoder->base.dcd_tree,
+					   decoder->base.decoder_name,
 					   decode_flags,
 					   trace_config, &csid))
 			return -1;
 
-		if (ocsd_dt_set_gen_elem_outfn(decoder->dcd_tree,
+		if (ocsd_dt_set_gen_elem_outfn(decoder->base.dcd_tree,
 					       cs_etm_decoder__gen_trace_elem_printer,
 					       decoder))
 			return -1;
 
 		return 0;
 	} else if (d_params->operation == CS_ETM_OPERATION_PRINT) {
-		if (ocsd_dt_create_decoder(decoder->dcd_tree, decoder->decoder_name,
+		if (ocsd_dt_create_decoder(decoder->base.dcd_tree, decoder->base.decoder_name,
 					   OCSD_CREATE_FLG_PACKET_PROC,
 					   trace_config, &csid))
 			return -1;
 
-		if (ocsd_dt_set_pkt_protocol_printer(decoder->dcd_tree, csid, CS_PKT_MON))
+		if (ocsd_dt_set_pkt_protocol_printer(decoder->base.dcd_tree, csid, CS_PKT_MON))
 			return -1;
 
 		return 0;
@@ -578,11 +582,11 @@ cs_etm_decoder__create_etm_decoder(struct cs_etm_decoder_params *d_params,
 	return -1;
 }
 
-struct cs_etm_decoder *
+struct cs_etm_packet_decoder *
 cs_etm_decoder__new(int decoders, struct cs_etm_decoder_params *d_params,
 		    struct cs_etm_trace_params t_params[])
 {
-	struct cs_etm_decoder *decoder;
+	struct cs_etm_packet_decoder *decoder;
 	ocsd_dcd_tree_src_t format;
 	u32 flags;
 	int i, ret;
@@ -595,8 +599,8 @@ cs_etm_decoder__new(int decoders, struct cs_etm_decoder_params *d_params,
 	if (!decoder)
 		return NULL;
 
-	decoder->data = d_params->data;
-	decoder->prev_return = OCSD_RESP_CONT;
+	decoder->base.data = d_params->data;
+	decoder->base.prev_return = OCSD_RESP_CONT;
 	format = (d_params->formatted ? OCSD_TRC_SRC_FRAME_FORMATTED :
 					 OCSD_TRC_SRC_SINGLE);
 	flags = 0;
@@ -611,13 +615,13 @@ cs_etm_decoder__new(int decoders, struct cs_etm_decoder_params *d_params,
 	flags |= OCSD_DFRMTR_RESET_ON_4X_FSYNC;
 
 	/* Create decode tree for the data source */
-	decoder->dcd_tree = ocsd_create_dcd_tree(format, flags);
+	decoder->base.dcd_tree = ocsd_create_dcd_tree(format, flags);
 
-	if (decoder->dcd_tree == 0)
+	if (decoder->base.dcd_tree == 0)
 		goto err_free_decoder;
 
 	/* init library print logging support */
-	ret = cs_etm_decoder__init_def_logger_printing(d_params, decoder);
+	ret = cs_etm_decoder__init_def_logger_printing(d_params, &decoder->base);
 	if (ret != 0)
 		goto err_free_decoder;
 
@@ -636,14 +640,14 @@ cs_etm_decoder__new(int decoders, struct cs_etm_decoder_params *d_params,
 	return NULL;
 }
 
-int cs_etm_decoder__process_data_block(struct cs_etm_decoder *decoder,
+int cs_etm_decoder__process_data_block(struct cs_etm_packet_decoder *decoder,
 				       u64 indx, const u8 *buf,
 				       size_t len, size_t *consumed,
 				       struct cs_etm_traceid_ctxt **tidc)
 {
 	int ret = 0;
 	ocsd_datapath_resp_t cur = OCSD_RESP_CONT;
-	ocsd_datapath_resp_t prev_return = decoder->prev_return;
+	ocsd_datapath_resp_t prev_return = decoder->base.prev_return;
 	size_t processed = 0;
 	u32 count;
 
@@ -652,14 +656,14 @@ int cs_etm_decoder__process_data_block(struct cs_etm_decoder *decoder,
 	/* Drain buffered output even if the last input byte was consumed. */
 	while (processed < len || OCSD_DATA_RESP_IS_WAIT(prev_return)) {
 		if (OCSD_DATA_RESP_IS_WAIT(prev_return)) {
-			cur = ocsd_dt_process_data(decoder->dcd_tree,
+			cur = ocsd_dt_process_data(decoder->base.dcd_tree,
 						   OCSD_OP_FLUSH,
 						   0,
 						   0,
 						   NULL,
 						   NULL);
 		} else if (OCSD_DATA_RESP_IS_CONT(prev_return)) {
-			cur = ocsd_dt_process_data(decoder->dcd_tree,
+			cur = ocsd_dt_process_data(decoder->base.dcd_tree,
 						   OCSD_OP_DATA,
 						   indx + processed,
 						   len - processed,
@@ -678,7 +682,7 @@ int cs_etm_decoder__process_data_block(struct cs_etm_decoder *decoder,
 		prev_return = cur;
 	}
 
-	decoder->prev_return = cur;
+	decoder->base.prev_return = cur;
 	*consumed = processed;
 	if (tidc)
 		*tidc = decoder->traceid_ctxt;
@@ -688,17 +692,17 @@ int cs_etm_decoder__process_data_block(struct cs_etm_decoder *decoder,
 	return ret;
 }
 
-void cs_etm_decoder__zfree(struct cs_etm_decoder **decoder)
+void cs_etm_decoder__zfree(struct cs_etm_packet_decoder **decoder)
 {
 	if (!(*decoder))
 		return;
 
-	ocsd_destroy_dcd_tree((*decoder)->dcd_tree);
-	(*decoder)->dcd_tree = NULL;
+	ocsd_destroy_dcd_tree((*decoder)->base.dcd_tree);
+	(*decoder)->base.dcd_tree = NULL;
 	zfree(decoder);
 }
 
-const char *cs_etm_decoder__get_name(struct cs_etm_decoder *decoder)
+const char *cs_etm_decoder__get_name(struct cs_etm_packet_decoder *decoder)
 {
-	return decoder->decoder_name;
+	return decoder->base.decoder_name;
 }
diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
index afe9a466986a..376feffd6558 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.h
@@ -14,7 +14,7 @@
 #include <opencsd/ocsd_if_types.h>
 #include <stdio.h>
 
-struct cs_etm_decoder;
+struct cs_etm_packet_decoder;
 struct cs_etm_packet;
 struct cs_etm_traceid_ctxt;
 
@@ -87,24 +87,24 @@ enum cs_etm_decoder_operation {
 	CS_ETM_OPERATION_MAX,
 };
 
-int cs_etm_decoder__process_data_block(struct cs_etm_decoder *decoder,
+int cs_etm_decoder__process_data_block(struct cs_etm_packet_decoder *decoder,
 				       u64 indx, const u8 *buf,
 				       size_t len, size_t *consumed,
 				       struct cs_etm_traceid_ctxt **tidc);
 
-struct cs_etm_decoder *
+struct cs_etm_packet_decoder *
 cs_etm_decoder__new(int num_cpu,
 		    struct cs_etm_decoder_params *d_params,
 		    struct cs_etm_trace_params t_params[]);
 
-void cs_etm_decoder__zfree(struct cs_etm_decoder **decoder);
+void cs_etm_decoder__zfree(struct cs_etm_packet_decoder **decoder);
 
-int cs_etm_decoder__add_mem_access_cb(struct cs_etm_decoder *decoder,
+int cs_etm_decoder__add_mem_access_cb(struct cs_etm_packet_decoder *decoder,
 				      u64 start, u64 end,
 				      cs_etm_mem_cb_type cb_func);
 
 
-int cs_etm_decoder__reset(struct cs_etm_decoder *decoder);
-const char *cs_etm_decoder__get_name(struct cs_etm_decoder *decoder);
+int cs_etm_decoder__reset(struct cs_etm_packet_decoder *decoder);
+const char *cs_etm_decoder__get_name(struct cs_etm_packet_decoder *decoder);
 
 #endif /* INCLUDE__CS_ETM_DECODER_H__ */
diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 97c1dde1579b..6bd833d9ed81 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -78,7 +78,7 @@ enum cs_etm_format {
 
 struct cs_etm_queue {
 	struct cs_etm_auxtrace *etm;
-	struct cs_etm_decoder *decoder;
+	struct cs_etm_packet_decoder *decoder;
 	struct auxtrace_buffer *buffer;
 	unsigned int queue_nr;
 	enum cs_etm_format format;

-- 
2.43.0

