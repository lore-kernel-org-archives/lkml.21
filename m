Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795619556;
	b=g7c+1nb11srtE8e9jCU9Z8ctjyYymiNxXE3qkA8D8rqhGpCcNuuHXPu0mHbf2fiCzTqP
	 LQWKRd4JDl/ZQ8U563Oq2HNYJ7pSfOmT2E7Lf9YqSReATATHBUOi+ndYtg8AC5ztamFZ4
	 hK/Qc39quxuGCSg6MT4bI5fH6Z1zsKGCQS4okGBX7OPdwuZPM6kE15fBVuBFGtJdOOcfO
	 h0ZXlesiMHrlMOV7rkrAwWnxukUloCPn56vprhaWJlkHBWIF+4wMrn7wXZ8xO6gjwmci0
	 P0qPGHZoEOfmSN8n/IE+PKVZY+IDR9a6yIftdLHdAK+ovMQGtrIEqe4Jc7y7PD5irsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795619556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=olkz0RE9qbyCNQWe7ovtGZ4zTZHV3lQiK2ePxCl1z6E=;
	b=WIKka+v+XijJNvO8uWFZetg13oBr1GvkVoOttWy999VRAkRV3WdiKg5RqmJcGXfBd+YI
	 fjFGhm4COk8F5cnqilK2OPSCVg5aRGcBjgvI/slGu/nenoMxLumL9QLR7IPtSBRvWZn1f
	 Btth7w+FpzCfMP4j2TGsTlAi6FdKICIjzEFXMeN/XX1EX4jVoIB5m5Af6mVJKYjK3Vl/Z
	 7Plham0hKvl5IRb7dGE565ZouOZKr0AF+xAZW6kxKc7YCUrieTtrRY4WfxQ77r5o3h6TG
	 xF9KKH87N8x10cJqo1XffeNqvTRKGumSGVyiYnGZWkbMkJXuPNNElHLRFbE9fII9ezA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nyVZ4GGk;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6E7606A33E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:12:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A6E7606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nyVZ4GGk
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso58524215e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795619555; x=1796224355; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=olkz0RE9qbyCNQWe7ovtGZ4zTZHV3lQiK2ePxCl1z6E=;
        b=nyVZ4GGku6PzbdxZyOx9rpBMV4gyQsFbpSUr6U0IEIK0OFQlOQkiFTsuUe3gg2mfqG
         aSo0SCCDxznd2e+hIun4zENnSn3+F9FbLQ0F4wbj8qQpilrdTcmqz72CsZf6P1443nWa
         wk7i3WVL7ra37eK4Ixc82enwLzb5OQ5F0KrK6Ec/s8gr2P6lYJJGZO7jkDwI9adOfLv7
         BydG6omRm0qTRIpcpz3FlwF/YsUky7cTfR3kTkyJMYTdpZ5UmBuF/wW0mYzfHKaMCPSr
         nDbHmRyl0YLL6qgnDs3izi0uEShscrzJva7VX6BeKecjHLuhTojvq+wATcShgPWuBy4q
         AEBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795619555; x=1796224355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=olkz0RE9qbyCNQWe7ovtGZ4zTZHV3lQiK2ePxCl1z6E=;
        b=WIEKVsm5SPBZYsKzvntJ1I3YF+IEUiHpXg8jxzG553jD+iO7K66Eif78Jkyc6xQaf6
         jfLRHu7od0xd9L+AA44saGsKcAOjuRIRAhhLa6UDLwIo8wfFj6ZtVXalyrz1/Ubl2OaM
         yyjojC7EVlqjdGBYhWYQQ11zmsKV6QOP1qoPjY4ac9LjjNwnCTTxmLg63v5EsHEw7eT3
         +gAD/UAGNATHpkctZt58D6fghbuWJL9kDVcgMO0FIICyD8rk58uDk+lZw30y0hohDu4p
         0xc+dSMSIFZfigWfC7Rrmen+tUoJE4TyrnFVQCww0+t6uhXyadZeNEyemEqPLT/32eXb
         drCg==
X-Forwarded-Encrypted: i=1; AL+hErG9WxbioQHnnMzatKCRW2mkSGRHnp47hU+vIn4lim05sI683RsksCsNCZnpVE/Q/o19Mz0vDFHZOdz/tJM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PaG/b6+QMTNSPAc2GmLPGKiT3YhxYDDkNLNCGQaNYzg53eEKm
	pLsh4n75CAsO3/QTN56DY+XPJaWC8ZkU9R5Tp9img7u0cENJsTCiOt/lzlPRYGz1fis5DMEPwXb
	aLMp5
X-Gm-Gg: AZFdTZfYGkfLor6Z3nuWAf8ijVOGz467SVcv815pr458cFoHAa3lENJMZAVbO+3mvBw
	VqxmSkN2K8XKMg8zdEk2UVGeTLyWTBi+yDoGZQrM3b1zca1CX52CzUd5CRCFgF2i8CnK/8rtC6a
	wBwgrDmT7ayZ6o2Qnqxd1cKEDJkq94ezv6dPT6nJnX1MoWYqeRP+XvY5gN6H1dEFaosZpqfvts1
	b4sEHPdBD/0NdVBfkITKirhLEGHLCiPDJJDqX9CCt4m0XCwMRMfMqzsZAUKilVssJWb0zPetvjW
	nwkM/yg1bZJn8llpNx6mcYumfmC5EUBTFCPKctTKwHcx7Y9h4XlLALojQZBxv1svwS+EI8UZ1eH
	ccrPJOzeTFS/5IXqVYJVIFpO7Vcz4EL/FzlM+mhcRYEBeDGL0+gBKQ01tn1ljB+/sU0NKivA4+z
	uxgf8Uy+WnJmbyGTCD9xrTNJnKNXCDKu/8tdTz75VG+AImjdEIwf7sa4782nv+f2jjZJl3s0hUc
	jciWnSIBwtnPRqB0KJUolVh8OZJ77vGUp3mmUwX+zd+6TlmxrTieihYBfiNtT4bmYwMTttHPCxl
	UaKHPzwrQxBZgMzvHEcXCWjT2KhxCNtX
X-Received: by 2002:a05:600c:1d86:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4bb88922972mr383717985e9.34.1795619554605;
        Wed, 25 Nov 2026 07:12:34 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm39845282f8f.24.2026.11.25.07.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:12:34 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 25 Nov 2026 15:12:15 +0000
Subject: [PATCH 2/2] perf kvm: Don't create an empty perf.data in live mode
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
Message-Id: <20261125-james-perf-kvm-live-file-v1-2-946f478ce2a1@linaro.org>
References: <20261125-james-perf-kvm-live-file-v1-0-946f478ce2a1@linaro.org>
In-Reply-To: <20261125-james-perf-kvm-live-file-v1-0-946f478ce2a1@linaro.org>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>, 
 Mukesh Ojha <quic_mojha@quicinc.com>, 
 Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>, Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2

'perf kvm stat live' creates its session with a perf_data in write mode
but with no path, so perf_data__open() defaults to "perf.data" and
creates an empty file in the current directory.  This is visible when
running the "perf kvm tests" test.

Do the same thing as 'perf top' and create the session without a
perf_data, passing a host env instead. Live mode never writes anything
to the file anyway.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/builtin-kvm.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tools/perf/builtin-kvm.c b/tools/perf/builtin-kvm.c
index 785b761fb951..c48d56b18487 100644
--- a/tools/perf/builtin-kvm.c
+++ b/tools/perf/builtin-kvm.c
@@ -1855,9 +1855,7 @@ static int kvm_events_live(struct perf_kvm_stat *kvm,
 		"perf kvm stat live [<options>]",
 		NULL
 	};
-	struct perf_data data = {
-		.mode = PERF_DATA_MODE_WRITE,
-	};
+	struct perf_env host_env;
 
 
 	/* event handling */
@@ -1911,6 +1909,7 @@ static int kvm_events_live(struct perf_kvm_stat *kvm,
 		return err;
 	}
 
+	perf_env__init(&host_env);
 	kvm->evlist = kvm_live_event_list();
 	if (kvm->evlist == NULL) {
 		err = -1;
@@ -1923,7 +1922,9 @@ static int kvm_events_live(struct perf_kvm_stat *kvm,
 	/*
 	 * perf session
 	 */
-	kvm->session = perf_session__new(&data, &kvm->tool);
+	kvm->session = __perf_session__new(/*data=*/NULL, &kvm->tool,
+					   /*trace_event_repipe=*/false,
+					   &host_env);
 	if (IS_ERR(kvm->session)) {
 		err = PTR_ERR(kvm->session);
 		kvm->session = NULL;
@@ -1944,6 +1945,7 @@ static int kvm_events_live(struct perf_kvm_stat *kvm,
 	perf_session__delete(kvm->session);
 	kvm->session = NULL;
 	evlist__put(kvm->evlist);
+	perf_env__exit(&host_env);
 
 	return err;
 }

-- 
2.43.0

