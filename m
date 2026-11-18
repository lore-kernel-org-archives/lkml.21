Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019403;
	b=QyKO2UBCbe7pMKcj/Xq21BhnQarMmmZvcjAcAHXCInYRFjuYx9YtGT1aAX4fmFON5oou
	 OlBiomQ2pIw07WidcKGdBM55zSgYH1uCaj7qnfaU3UrYd4lsyjdJHKFD6vD5zMpKSGKNZ
	 x4FLGfWor+bZ2snsrx0PD83fBU7Pow/NUGyUbvbnImUFHiHMiSqsrAa/b6jUVJGXQDIcF
	 eEkrh6Xgk60lMFLm+mLofwYOM3Lb8gekGxLmizp2AqVvZsqfYf9EvQrKs1dvR1/nsdkaR
	 jEpqRIfky3x9XwdC90gehL4CCBKwSGz/xwJ01pPzd4+kW+YP6hDTvVqLY94EScJ652w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=++mNA/ATFG+JHWKfnq2DLe8hXRW/WLweLbt37GPodEU=;
	b=c7NXeoutWc86hBF6gaerO+rBCV8bxX1/PgSyknbqytPnIdwyUySwXriPzoDrif1+6mcF
	 kgoczicTOksiDmUPT/4QzPi7qtyz1OY5V5tu5j5CfjfmS2xUN4S2tL1+Uv5uT0JMnZ0gD
	 qE26PXL+ioDIjaVQsMaRqh8B84npLfLotzurGIi15C6GDC9LkO2QIN0g/olhbK8jzy87J
	 IulQJ9qmE1quqn+yy0XwWdvrFpCAny8pCcBcYxkwMfq1IcUG8RVOrt78GxXDRNfPVuN9Y
	 pVDUY6Zd0sqmJe+L8SmiqGv7jZtVXK3IT9UqfdTAirEfLOCQuF8MnHd+THCFJfXCV/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tjZIAzXX;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AFE60A263D
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:30:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8AFE60A263D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tjZIAzXX
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4a42b34e930so957118f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019401; x=1795624201; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=++mNA/ATFG+JHWKfnq2DLe8hXRW/WLweLbt37GPodEU=;
        b=tjZIAzXXo7Qc2tcqNCatr32uUr50tnaCysbm4XPzAIEAOhwN5hLin/BEeoWWtp3i4z
         r4uvMZPixtUY2Tx6ooeWULcsBL1mHcEHSMEPN8bX7qgciIgW/U2HPEVtGN3kmCwjdHDB
         CMeLYpKhkaEumysZVLqdJ/fVi01BSoJ1Aelz8T2WdJCA0YJ8jb8JFqhv3wB2oI3N1NGs
         34+nL43nmZIGSz4gGSgKQcqczcX2lR9fHzw2KNEkm/Er4bLmb6pg4kExkvY7qgx5I+7m
         EoIoS4RDhY4DPuUv84BXLW4RfvMDHUG1SM7XnTnJHiGXUB+yYHIL9/JwulGVtTw3/R4G
         B9JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019401; x=1795624201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=++mNA/ATFG+JHWKfnq2DLe8hXRW/WLweLbt37GPodEU=;
        b=hwc9ALGi0u03FNXqtsu9ssue7XVpHTfS3TUujfPnmkyQ6Z9oSX3s57BQtc9y3KoPef
         YlIMWi1fDXRIBMVd4mbh0PIP+3smkUwI8dZpQsoQUeWnK9QdTFOMaay29TSjuHDB6Nct
         zMKeqkbAiypdFU2FWW3CIt6/mgXJWlSx9nUw7wKNjlGU+wgxTcajYXDFnY1Pc9b1aT7B
         2CEf8tLwe0qJAjXw6JXqP4LI2r546K0PLpZYwm+tUJPJWodQsGwD4omtt4zD6M9c6Ybx
         ReE/o+a9uyXXTjrQHjB7TTMG4TzJFPNqq62OMDmuPjW5NEZ7NiAC+8pmiSrhrsSNXg4+
         8kyg==
X-Forwarded-Encrypted: i=1; AL+hErHnQIHTqQi0EggKXy/a8bYuoCcq6S/H7ZvBpn9EAsGhvv6bcSsfgnvqRmOLBKlpHdjC5N65MtkTSC+yN2A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Pdr7JhRR7zIfYQcR2AshUuks3VXoBEdm40WRnSnHYag0Z5p8a
	QieLrGbHFtMQ+iUbfMP2fY/rY49WM/TAetSfyQRzTnSVh4GzjayvvuO1V2eLNxxa0VE=
X-Gm-Gg: AZFdTZcLYEwg82+MV5nmssGo+WZNrzz1A6npcUsjCYCK+Yi4VwjM5qpUmXTKEup06R4
	V0JuCp3fhXWecMDQ5pzXAClR+Gu82w1Ty0dxsCI8lUASNuIFZaZQDuxdFnYZs7i1xo99LJOTKuI
	b/muRwsAv3jPdf3+S6E4QEJFAjDdNSQI0FQLJZNBXquIW4x+VEz+ih3YcHA7bPej3rsWYKMbLvb
	CKwZN5rLOKUMhQ3A1IShoZZ+nQpX4YpBLDsBM1tJPgftRGBxEiBMfpGAOZjNelo/Rz3jUCR5ZrW
	QwGyqxL2ASdq39CPI1Q4CyK5sBb3J/d5JfvB8s3wQwNPy3IHLcZ5jEAyXiFVHG/EEBx3OIxdziG
	f+rjas+Yn9Q1EqoBtnl6x9KYa/xybdeTMdXVp8cyP1MjcV9xRtDocSuYyeJjoDGG+Y+MovaQED9
	HUep0lemZenWCcAGbynoy7n02BUVs8ylM4V8uNMDGgzGW8Gga+LiyloLZz9YpwWsarYtpI3uJW2
	d8k7iZZAGMM+ccv5BINqQB08xbjqqmTmERxFSjFY80zyPaAOisiKezEy0bt99oVq3jz0g/hJrn8
	D7lNjk31YaVOpTEcHUmC0vKxB2bVIhIe
X-Received: by 2002:a5d:5f45:0:b0:4a7:a8f:527a with SMTP id ffacd0b85a97d-4a70a8f55cfmr5263386f8f.7.1795019401089;
        Wed, 18 Nov 2026 08:30:01 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:30:00 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:34 +0000
Subject: [PATCH 12/34] perf cs-etm: Track sched out events
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
Message-Id: <20261118-james-coresight-jit-v1-12-dad4d90747f6@linaro.org>
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

The sched in event might be dropped due to a full ringbuffer, so the
sched out event is still useful information if that thread is going to
be seen again. Call machine__findnew_thread() unconditionally as it's
harmless to do it twice for the same thread.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 67e3e2becd0f..1e1ff6cc8a5e 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -3018,16 +3018,6 @@ static int cs_etm__process_itrace_start(struct cs_etm_auxtrace *etm,
 static int cs_etm__process_switch_cpu_wide(struct cs_etm_auxtrace *etm,
 					   union perf_event *event)
 {
-	bool out = event->header.misc & PERF_RECORD_MISC_SWITCH_OUT;
-
-	/*
-	 * SWITCH_IN events carry the next process to be switched out while
-	 * SWITCH_OUT events carry the process to be switched in.  As such
-	 * we don't care about IN events.
-	 */
-	if (!out)
-		return 0;
-
 	return cs_etm__associate_tid(etm, event->context_switch.next_prev_pid,
 				     event->context_switch.next_prev_tid);
 }

-- 
2.43.0

