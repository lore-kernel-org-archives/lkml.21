Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019403;
	b=AqZbZtJCrh2Rx7YUMoz4FJUyfEqjQTNO6EeYkR9wULv/wKScHMbmGb+DCB+xLR3OIeJl
	 b00ds++ah6q+V7RZn4KIfi76rTbUuRCV6jB+8Iz9bU8DeserUxorwtx7QafSSWlOvYoCH
	 kpB4Ux2czrULu18K8lOeeA9uyOmlNSlCpthsugr9V/4trCi7W1PKyptFuoydUYrKnt/Sl
	 NUM7owQmv2dVqLn5eoVXNwvjNmrxrOmLe+TH9WIwkbdrOKGj9/a3NuAd6LK7Mvq0W+2/+
	 dld0FFTQp1Qm2xSM+NvKyKTaR5v3Q2EphXAV76M/BNHiH7WJ06yV8ivAS0eyT4okZYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9TvI/tcWqsDiAaR0SImg0w5hNJWOXoXa6vuM34fV/cU=;
	b=edejFsk6/h2Z7xXGvYWQcBnUEIl+Om9HEtTgbOPkSE7afIcH/M0cf7toKZk+gK1GeaWA
	 nbGqWKurAdRE4nlClOUpHxxGOIRVVyuNEf4Xzxp7ziyzd05TxzIkdr8U8HfpD4iQ2IzSc
	 laQIS6QMHw9uJwADIA8k+yeITnYkN42ms8gk1O9jo0vFOS/7DJtGZtTcTByes4gvaJDql
	 1mJrd8crAcQ34vwtUXl4y+E6xgNIBcbys3OxFiQjOg9Wlu+IU7B9jB86eiTUjQEkuQfrA
	 2kFObXBDv1PkQIJJI+4eUiH9wMGGly6xbwIED1oI25OvYTXgCwx6+nfXVHhH+CLjaqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cra1kaKs;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D5C60A2618
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:29:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3D5C60A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cra1kaKs
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso18083975e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019398; x=1795624198; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9TvI/tcWqsDiAaR0SImg0w5hNJWOXoXa6vuM34fV/cU=;
        b=cra1kaKsyCsDSDCYmwefAdiIgXLO+xoK2UKY3tlZZsyrR+Jg3I1qSOtlqGu7vF97Ow
         BT3Ym0uW/fpOEBRPF6vBGGhc8RrBFW5cIa1SEEveJ+xU4qVHObc9+rqZ8XUJiKNP0lKP
         +eTF5O8XiP4xOJBEQgBEaJMx780sJJCitNqVRp24Cf6sulNsII10sOikSFMY37Oh7Vgf
         mMzeIVRiqtf8Jg4EqyZSflr587Q34oc7krvjNLF2gGvjb+C8xM6UWqNACmaXDMrHGeZz
         v/y7KicCNJa9QjSaZfnPcg0Kds6tCFqmlPupiHQ3j9VPdmfWWtpaWD909OrJ1CEMsSXR
         hy/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019398; x=1795624198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9TvI/tcWqsDiAaR0SImg0w5hNJWOXoXa6vuM34fV/cU=;
        b=wiwTDIcOo34F8RBKIuoO3XkRmhjU4Lx1TkDODHgplZ8sFf7uGqOyLA412qAIcpAV1i
         PxXjA1J66sGovBIRyppkiGM5jhTmjL7zC5Kr5dk5VJ4yXg9Q//2+qC9im1NSCjbC9WlQ
         8GaL+DmBNThORy1GHdh3Sgwg6zK4jTUpALBHC0uO6y1poWaVz7hO2q+ejDXebPBH7xl5
         9NjQiJUo7DhPhHoHxztKNEO9WCQWaQTrWlas2UM2a6j1wYpuziroi3e+jh6hIcYZkQEv
         mPhs4tsCCrlDpTW1n5uuY/6hkbu4mCYjEo/S1zo8ohsJG0ayvoMD1u5PIpk658VgLC1X
         Rddw==
X-Forwarded-Encrypted: i=1; AL+hErG2Xchv6y9PyNIiiG4wMOenBuKnN3sNyJEpwQynGwAqXhKDSMsHyQ4+Z9At8LUK5XIEmz4/LUj6TUnob+0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CG8S+5CAkGn1YP3mM+Q9lwdQY70RtiTXkjLA+d5XJ4WQx+fTP
	14HhEwRMBqoYra7+MHMgeepCkULJBO4I0T/oSvOIL5xW6lZHGqJa6yO/t3lYcHQgIoc=
X-Gm-Gg: AYBFou0WM2232cQQwc6/mD6+8N3AH8ENM5E03fYV/diffCNJVO+zpx6sGwT+Mv0xY9h
	XhmnDOKoIMO++ptLf924cuNNux61u7p5N8r0CLrJuCkc5awo6hEWfbWVtxeadIGBxXBsxxkF63+
	EX+5qKzi7zLNyEf3yCbXptdT8tRRVH9yCKkpzChkTd2FLghZKK0bw1u12NbFX0Q7Xucejh5e7l8
	pxJDORUqfnOLOrcVFGDTkkNHJi0qHsaZLx+7c/yfj0cRgJQ5s85d4xkYF/n4bU9P1PZi5E/Dxev
	goGc9m0QHjynJX0TbtlYJGP0T70cR7By1VxoMbHkiXy0fxd7hEvbOXwOk5xMqyc2gra+vp/2QfZ
	vNRIBTTKhYt8TYsmZAMt1Qo0Yz51YyGbFIbVsvoa93t8RYB2Ux5ItWsARJ5aYJIU1OfYkS/8wMR
	vq2KdfQlv0PlvBM/8tVtbs6hAQhXx3BTzWa6WnY0wEdD6rkbN/E5WxuYc23Jmt9Jj3n79ewRkkI
	CQoZv0ziXfF20e0y4O6myZhbvyF1OYhS07WFfH+bDlwpy75pQRJbcyuh0RfWLxbTXxiPsi/buNe
	98pkQqG5N7aFRAcwYZ0vsygGbeky1FmR
X-Received: by 2002:a05:600c:8b8a:b0:4bb:52bd:a3c7 with SMTP id 5b1f17b1804b1-4bb7da2240amr67857325e9.6.1795019398311;
        Wed, 18 Nov 2026 08:29:58 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:29:57 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:32 +0000
Subject: [PATCH 10/34] perf cs-etm: Remove old pipe mode support
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
Message-Id: <20261118-james-coresight-jit-v1-10-dad4d90747f6@linaro.org>
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

Pipe mode hasn't been supported since we added several peeks to
cs_etm__process_auxtrace_info_full() that require random access. Even if
it was supported, we would have to buffer the whole file anyway to make
fully ordered decoding work. You don't know if one core stopped tracing
for good or whether to wait till very end of the file for the next one.
IntelPT has the same issue, see 'perf-intel-pt.txt#Pipe mode'.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 38 +++-----------------------------------
 1 file changed, 3 insertions(+), 35 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index fb4582dc378e..11ebfdf1e933 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -66,7 +66,6 @@ struct cs_etm_auxtrace {
 	 */
 	bool per_thread_decoding;
 	bool snapshot_mode;
-	bool data_queued;
 	bool has_virtual_ts; /* Virtual/Kernel timestamps in the trace. */
 	bool use_thread_stack;
 	bool use_callchain;
@@ -3126,33 +3125,7 @@ static int cs_etm__process_auxtrace_event(struct perf_session *session,
 	struct cs_etm_auxtrace *etm = container_of(session->auxtrace,
 						   struct cs_etm_auxtrace,
 						   auxtrace);
-	if (!etm->data_queued) {
-		struct auxtrace_buffer *buffer;
-		off_t  data_offset;
-		int fd = perf_data__fd(session->data);
-		bool is_pipe = perf_data__is_pipe(session->data);
-		int err;
-		int idx = event->auxtrace.idx;
-
-		if (is_pipe)
-			data_offset = 0;
-		else {
-			data_offset = lseek(fd, 0, SEEK_CUR);
-			if (data_offset == -1)
-				return -errno;
-		}
-
-		err = auxtrace_queues__add_event(&etm->queues, session,
-						 event, data_offset, &buffer);
-		if (err)
-			return err;
-
-		if (dump_trace)
-			if (auxtrace_buffer__get_data(buffer, fd)) {
-				cs_etm__dump_event(etm->queues.queue_array[idx].priv, buffer);
-				auxtrace_buffer__put_data(buffer);
-			}
-	} else if (dump_trace)
+	if (dump_trace)
 		dump_queued_data(etm, &event->auxtrace);
 
 	return 0;
@@ -3454,12 +3427,8 @@ static int cs_etm__queue_aux_records(struct perf_session *session)
 						 cs_etm__queue_aux_records_cb, NULL);
 
 	/*
-	 * We would get here if there are no entries in the index (either no auxtrace
-	 * buffers or no index at all). Fail silently as there is the possibility of
-	 * queueing them in cs_etm__process_auxtrace_event() if etm->data_queued is still
-	 * false.
-	 *
-	 * In that scenario, buffers will not be split by AUX records.
+	 * No entries in the index (either no auxtrace buffers or no index at
+	 * all).
 	 */
 	return 0;
 }
@@ -3867,7 +3836,6 @@ int cs_etm__process_auxtrace_info_full(union perf_event *event,
 	if (err)
 		goto err_free_queues;
 
-	etm->data_queued = etm->queues.populated;
 	return 0;
 
 err_free_queues:

-- 
2.43.0

