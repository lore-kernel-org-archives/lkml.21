Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019408;
	b=hGwYP58Ncw6gn94KzFQrd6dee7R2rDpAkY6igXihGrC+4oqGuOi+SNmyEs9gzjEMbje9
	 qv+Uau47JjaSuae9NfnIq9hw9/iTZWyy/9Z5TrFkF4jNPWSvKquJg3bB0pgvlSPeeL6w5
	 ajQt5W/C4eY+qrgEXkKSEdN1cRl9AxBEsT74Qc0psLuV9laTamFmgb1UxtG8o1fI9KToI
	 o3WnOQNPzZDMIriUPuo8deyG+VvEE2V6EX02hHrW4K9mdFEeVKxXmXCwm6N+U7ABUjeKq
	 SUsJLmCX8o2jfu/sRZ7vCP0L0Av/yhbNts40TcZDK1o+zu9QZeW2usHJiwRtl5XfUfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=LgJ8rjvYkBYBkoWffggbcRDgyGHjF5UUVD3pCXNPiIQ=;
	b=yppNMlurA3f2MDdOOnu2yX0j5/FOrxEzo5GlO8cbWN1R3TndFsVC9K87aZXUL4/CP1af
	 DpJNOFaPn9DPk9Wf/x2dqBhBZ1Nb0UL/UIcIxJBAlgcGCb7i88MgTICq4yyQ7E6gtOhPu
	 128aig4ozZp3MKtqfHRfcjDcunJprGTuy8E3P9aSiornQWi6UDVViNGcdGSRZZG9o3Rn7
	 ZhQAOYw/6BmYiIuzeJ7+D9OfTH62qq78Zz7NCUS6HNuGjLyUKJpKNp5V05ArDRX1Mp4qK
	 p9x0mk5fz63Es7qipVzGUSzWV6fSMB3sDkmt3t7lzJ9+zSNYx81NWK/PCAQEjd0ac1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BdeqszRS;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE2460A263B
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBE2460A263B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BdeqszRS
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so7991875e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019403; x=1795624203; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LgJ8rjvYkBYBkoWffggbcRDgyGHjF5UUVD3pCXNPiIQ=;
        b=BdeqszRShmCK0txb/ELiC1f2A7wfrUI2zNrEUN9wmIZFXeSbc8EeThC+a1wp0S3+dL
         hqWpMjW44BNToD3H5cN4bp850wUcNIjp3vyFkyAwwxD6BSP2NXL1gAuSfrMY46wydGVG
         XmO4j3yoG03BNWNXn+PS1NPlY5zNkkW7XBqrWpI7pZuY2ffBjdoYYyNU/LqGOGrpjVRq
         rYUqfsRmjlLy7Jz53IqvRwUhBflce10b5E9Vnqkr9MNcmsxeY4U3aTkOEpNNpvNWpdO2
         +mNPO0OqFJ4jlpkxtqrHICvIlogDin/Gk+Zz1ers9CmjTpPNj7NrT9TAi4f4iaz/6x+R
         iP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019403; x=1795624203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LgJ8rjvYkBYBkoWffggbcRDgyGHjF5UUVD3pCXNPiIQ=;
        b=sxotvQQ7hZErT3B3koBkxfVg36wpBc155j3Zyz4PUcd3qEdtmwSFaol7K99g+0/Ykr
         Dzwr0irb1Kbpu4mNY+V6z8DbdEbM70wVRS0yC8ZsDm2msg9yDKzYfK6bgZmErD+tN9pL
         pduTfGIRW2CucYIccog5L8mzuO+b86nPhgbYMXHZ9PfgLj3Un1Jrr481WOluEDdy59or
         MyYx6cSEq7KGzEKa7L2RqGjJdelo8PjXaZ9RTb5ncswQ2Sk0KWYpbukvow0eoye7lIFF
         92uNLeNyrxq5SHse049PaNQdwqc0LrDrBb/rhBtvcjJzMXJEqAftDm+3xuJ2Pzv7Eaa9
         CnVw==
X-Forwarded-Encrypted: i=1; AL+hErHWNVjWdjo0yvOCpYA3N7Cute2qkMLy3M7iMqSB+jDYDxe3Qo+Tna3uAgbIq0sqRpH9xJlALcmipKHFFf8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+g4l3zepIuQbH2gszjeaZzA3/BZHk+ZCzP+m+7LgXyyhzNVBvI
	OEkCipSfX74eRB4XDEiKEbWVWUay7DD+Tu2WfP1GTVNSzwrtrROR37QgfU1c1zUbSumo28NZfm+
	r+WfkkSM=
X-Gm-Gg: AYBFou07qM22C2Ki8FI6LBpIiXniqZ71jZSleX2FmpbGLTdQ6+QEkgxaUlTXJFXgFLa
	CTZEPVlPxhMJLfl9jbqfum/K0yV0/dx2ELjLP5xcJ1VdZzEK5FAeY+CMh+a1R2C72Y0l1ZIcGCm
	5j7TcugzlBPRrOK8gRS7U7TM1cKnLVkRux0LojAYewzjqmNc2R0E+evfMKgYuVylajBhNxXIZ37
	qRbByv7mg3k3uDbCGDRFCGbFmLDfZ4VrjLUJ2pGiD3gw4rq4+NOAVrTk+XYXaBBp2glDJRGjb0E
	Zflh9fOwgB33MjIgBecw0LysMnZRs5GpSqdZC2IAUgS52lopYZaeU9KGlmwkaw7eRk5raLuXSyQ
	S3THxqrIY3Hy4pnRX0lDCa9LgPlO5/xojj/v0RCaFqX48/F/797ley01GK4kYV+atzPymUKnIo5
	hBgfDPUXQDzVVEHKlfrRV0JOdiqbqrNVlMuFSfxJbjsy5brEElC9Dg5sUsmAU8AWYj+bt2vTDr1
	bcfOuF6SHdvsYuATUOjZFwXHYPQGy4l01LOAMfg5RBcaa0snLN7z0PsfuOXQUNYqeSvEjRuZSZr
	QEOpqhztLUWEzs0SDw==
X-Received: by 2002:a05:600c:8b71:b0:4a1:9661:14b5 with SMTP id 5b1f17b1804b1-4bb7da2ba0emr55386575e9.29.1795019403309;
        Wed, 18 Nov 2026 08:30:03 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:30:02 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:36 +0000
Subject: [PATCH 14/34] perf cs-etm: Always enable Perf event timestamps
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
Message-Id: <20261118-james-coresight-jit-v1-14-dad4d90747f6@linaro.org>
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

We still need MMAP timestamps in per-thread mode for overlapping mmaps,
so always enable them. Also update the comment above to reflect the fact
that Coresight timestamps are on by default, -T just gives more frequent
ones.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index 5a64c17cf254..28aaaabf36bc 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -456,6 +456,9 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
 	 */
 	evsel__set_sample_bit(cs_etm_evsel, CPU);
 
+	/* Need the time of AUX events */
+	evsel__set_sample_bit(cs_etm_evsel, TIME);
+
 	if (!perf_cpu_map__is_any_cpu_or_is_empty(cpus)) {
 		/*
 		 * Timestamps are required to interleave samples from different
@@ -479,9 +482,9 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
 	}
 
 	/*
-	 * When the option '--timestamp' or '-T' is enabled, the PERF_SAMPLE_TIME
-	 * bit is set for all events.  In this case, always enable Arm CoreSight
-	 * timestamp tracing.
+	 * When the Perf option '--timestamp' or '-T' is enabled, expect that
+	 * the user also wants more frequent Coresight timestamps than only
+	 * context packet ones.
 	 */
 	if (opts->sample_time_set)
 		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", DEFAULT_TS);
@@ -495,9 +498,8 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
 	evsel->core.attr.freq = 0;
 	evsel->core.attr.sample_period = 1;
 
-	/* In per-cpu case, always need the time of mmap events etc */
-	if (!perf_cpu_map__is_any_cpu_or_is_empty(cpus))
-		evsel__set_sample_bit(evsel, TIME);
+	/* Need the time of mmap and sched events etc */
+	evsel__set_sample_bit(evsel, TIME);
 
 	err = cs_etm_validate_config(cs_etm_pmu, cs_etm_evsel);
 out:

-- 
2.43.0

