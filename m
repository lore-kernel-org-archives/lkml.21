Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019405;
	b=vnFZqqDb3RFm8RyHux/qDENfngtWh7UhH7GG81JWM7m3mbUaOjOOtdTgUrhtEvZIbzUQ
	 h3IkB7aYBBXcfXjV8lA528/JPqU+tdzj1Cr8mf7qlekL/Ts/pj4CGbnCaTIP6Cuz9a1Rc
	 FlrIKWB0VGi28mhLVcwVfsIXxepBGD0dAyZLisA4N7+vxnXTiT2wpLldVJ36Jb0pKHL0B
	 UFoX/ZGpt6QWGtb7oqPY+Pfw/sqqChWmWklFsGEdTI9Tb970otoWJBVQf3MKwOUr5x+kX
	 bL9VYApzOdFeHIFKLFOrlhCPqtkIwYbTxbcqdy8P460F2ZTnsT9gVCt8dIfe7hdZH1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=koGbjTKVOAqnRDV7YAPg63lp37cXx2HU92d1Gce8qkQ=;
	b=FWiQXrtYwDjcKNwfVBxyCLv2+cWwSwH0bAuwyp4Boj60Amg7rwKtPHMCJdwsh0bHfI9i
	 iwvfjzXAW3gEx6uKbbCqgeGCncVhIlxuX/A2wQxMYX1HeunzbdiTrALWDIqv9gWG7sn7D
	 HMb9r/lWBobrXDV9nmNlYkOTVKqRNukbX2mSh3ZOwnJTMCPZWB153zFpGgsXGM7MopiHj
	 n0pLaq96SVJVkFppcpw+K47vEzWzhKolXIOKXBIpzu/4trJ8ZueiXYokVe5VPDQOnX0K4
	 kNwM4U4FG256eVYzmxo5Cob7JTYmQpcjJlKpuegJH+O01DK88vNNQcmtK27RUz4RKEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HkGJTU9i;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B5860A3802
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:30:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7B5860A3802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HkGJTU9i
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1038133f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019402; x=1795624202; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=koGbjTKVOAqnRDV7YAPg63lp37cXx2HU92d1Gce8qkQ=;
        b=HkGJTU9iAKAjzZPZQm8z5dEIIWZoBeh8XWvjpYiGt7/10fIH813JZjWOKBpT2F94iY
         ++BkYPc6eraoSuH9ILgW9qDhiAxpQCKKX/8QBxvlggjU/AeMqGprhqEHSXBEQFH1jioN
         W8ki2JsypTIQDAteBl3mLYULl3JxaSGFJEjRWv9Qh0WsMUfDlvqBRTss/qeTeGqLXxLE
         vugzhMgKF5c1V4OLeoOsFz+9PPBfCjuZuo+W+7jvY2gmN2owAUIwFVNXV6/vj7eAY38D
         jjkHdfBjXJ/ugacCA8DRsbKOsswM1lWTQ8EGfihme5QIgWT7BtdKefYJlE84FUU0W4AF
         P8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019402; x=1795624202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=koGbjTKVOAqnRDV7YAPg63lp37cXx2HU92d1Gce8qkQ=;
        b=sZN5UdoRyvPUMnSSozoM4YHD2WGu01i1PAW0IEK+BzWPa4ajHvFPdrgNV7Y0SlkUVN
         5QEvj5KJ1y4L6z95VtqkzmdF/tfEzGl/x+M4I6i4furnaME/p8Sya5ULmOA0XExwNN33
         2ZQlslZuHfcF9NJS0s6SopJQH4HySjhLDmEzn63YGTLATiAZU+FPrao3N5xEZkChLXpA
         dRRk/rk34/j3CQPYS+Bs+8ebwUrLd3IxGXIOQNdUDhYA8MvzrPqG7SGWQ79UD2VA+pKk
         2CMoaZ46cjJSgBSI3XjpGVk6ZqGCN2B8+NGzI85TuLa6Zc8b3nuUgpEuirGowqapMgU6
         /TRQ==
X-Forwarded-Encrypted: i=1; AL+hErHpBBdcAxFHE8BFLkcGUOmyg7siTQLk18EMatIp1f8N2oRW25NOVtu9lka/BC2K9iBsrO71STuxsG0vJIA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Cg5ibmF2xkQRU/gshmWfpOEumR5HdY2XdRF9lub9iVJXs310I
	0GufyfSKgcXtuk1MCxD2CeQ7Y227rr0SjD5YBQLmSaFrwXqHTxhFGzvoCWoK6RZZLH4uGyMGGFY
	SH9d+nT4=
X-Gm-Gg: AZFdTZcbitq/zC/nHv8PwMmuqyJKSHXpM+J65JFsJV3GNbE/86WMwXjlVH203fD4He2
	iQz4K9p42YGE4biB2S7HfvD11t79Ei5yvFxVcyDy5MIJIvNdfe9/9fUpaeKhVuDqGB0uaTi/P7/
	8xmsayoZNU7pIV9Z3DEndLKkA2KJFqYQNMFVD2Z28/1xbAp1gg00TTh973ZIRbMtWF37pj1uBAG
	5bO33p31WqxwqF8qmZMbYe05IInccSEPO4D6d8Wj1isUlXf/LAXuRC46rzhuJ3+k6Is5hLY2eBv
	zgKwsKNP2OJ6CtErzJgie+g8h7+7AyFGPy+xHipPVc1rlmPopQq7lXQOumLco8RO7fIHHojooue
	OFlDmn3SyBooXfqg/Sb3U8EsKVImhRy2prt/Uf+UPXXyDX51fptPkwmvWLe93HEx57uLT7Cz6x9
	Vb2sqpmKqtezUqECzLcJ8MpyczwtCvIrVQwwXS22ovq4rB9ySE4DN/Maf8sBiOMOfN5MvhknibV
	z+LGWPftUc869FX2LQQq5Uwh57IyEf0Yiv0q1jcdbO9FK3d8m8nHwx6R1CQEs7XwoAUI6O0N7f4
	IMIKLb17nq4UlNPth/hpjikWuG3tkkrx
X-Received: by 2002:a05:6000:2608:b0:4a6:8012:198 with SMTP id ffacd0b85a97d-4a6801202dbmr5316972f8f.31.1795019402218;
        Wed, 18 Nov 2026 08:30:02 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:30:01 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:35 +0000
Subject: [PATCH 13/34] perf cs-etm: Handle PERF_RECORD_SWITCH events
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
Message-Id: <20261118-james-coresight-jit-v1-13-dad4d90747f6@linaro.org>
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

Task bound events use PERF_RECORD_SWITCH events instead so handle these
too. Furthermore associate the current PID and TID on
PERF_RECORD_SWITCH_CPU_WIDE events as this is just as useful as the next
PID and TID.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 1e1ff6cc8a5e..4252d25c991d 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -3016,12 +3016,25 @@ static int cs_etm__process_itrace_start(struct cs_etm_auxtrace *etm,
 }
 
 static int cs_etm__process_switch_cpu_wide(struct cs_etm_auxtrace *etm,
-					   union perf_event *event)
+					   union perf_event *event,
+					   struct perf_sample *sample)
 {
+	int ret;
+
+	ret = cs_etm__associate_tid(etm, sample->pid, sample->tid);
+	if (ret)
+		return ret;
+
 	return cs_etm__associate_tid(etm, event->context_switch.next_prev_pid,
 				     event->context_switch.next_prev_tid);
 }
 
+static int cs_etm__process_switch(struct cs_etm_auxtrace *etm,
+				  struct perf_sample *sample)
+{
+	return cs_etm__associate_tid(etm, sample->pid, sample->tid);
+}
+
 static int cs_etm__process_event(struct perf_session *session,
 				 union perf_event *event,
 				 struct perf_sample *sample,
@@ -3058,7 +3071,10 @@ static int cs_etm__process_event(struct perf_session *session,
 		return cs_etm__process_itrace_start(etm, event);
 
 	case PERF_RECORD_SWITCH_CPU_WIDE:
-		return cs_etm__process_switch_cpu_wide(etm, event);
+		return cs_etm__process_switch_cpu_wide(etm, event, sample);
+
+	case PERF_RECORD_SWITCH:
+		return cs_etm__process_switch(etm, sample);
 
 	case PERF_RECORD_AUX:
 		/*

-- 
2.43.0

