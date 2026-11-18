Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019402;
	b=yelFHPkpg3WrFfOrjTGIvovtypHwBhF3eeRTNy9jS9J0PSUsNsdtKH2b3kFwq5paRQXq
	 x1zH3AoN8JyzAnjj+2AYL1GgQRi3+0C+0haIXYGcCzuhCgOS/OZ41JGGO/NYhtlk59BwX
	 dyfUQ2wIdSyD5CWOQTZO6H5mcgNM4ch66hTbSDUyR88tIijbk0LmH5+ZTBDeKyTzUYtyS
	 rnHvCYTTXL9BUegDmEl1TK4/DdwHHJhEmX7Q54X5JOLnLgjjVm/1fTP5OZglmgtTkSIjl
	 44JgQGI55sDbQxeYYh7Ud0KdrkTsGQcZOXrnn1Tm7crZRgxRRtO48j1iqxMiPi/aVFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019402;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=p5DfdVn/AdFJR7mLtmlVcoQWNFblslFrL6J6esnTWlo=;
	b=JNp1rTnCACSe1cPjj7J2sve93ZJhrEnnEkAKy9QFZtYKv00idh0XEKuOpSy7yVeBIBd+
	 LddCNB++icxuF5AqX5WeZRGhbVuTU61mA3Ca6ExWkYlW3zGNno1JkNVl7aG3ucovKzL90
	 w7Qt4yXzGnoztibOvUkk3lByyF2oZibkE8tf4cd5jX0JnJBQi6UG1HHWM5aIDmAGAGPm0
	 GtIDO7wfH0IVc4d9y+lRcT9mbJIoUt8RWWvKXabimwHRIS5TcoZ5GWHHrh97pXpvgll9Z
	 d2OobO9GWoJqC7Uh+E9SlXjEsQ4d9S2ZKkYTqBmnUsbaaleJGR/wBV3IAP59Qjtxzbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VKI5hi4n;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E352C606A332
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:30:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E352C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VKI5hi4n
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-492690dd5daso986813f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019399; x=1795624199; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p5DfdVn/AdFJR7mLtmlVcoQWNFblslFrL6J6esnTWlo=;
        b=VKI5hi4nz7p3XuhX/1nXGDRcdWLXuAbumCNBdhfUXkDtPB/VSli4GDAue29tszfjik
         +7T/HfbohFby4mDSI6V/XoI7DzVtP7+ww6h21Tn9Nr1WCQu7qn/lcaQzvcJVp5+CrZq7
         9YezunoX/FjV+u8y8CjpHG4Ts8Rhu9MNX5KpAWc/vjFCoFWvipqbKW5er+bDndgkCLF+
         dFulvXVMSBlIoaPfkNbswgf8ukOXtP+sTbmdzx1XmZSO5eEZME3ozzy1XvmF2fTn069p
         I0mpvyGe5ImvXddQd1XzTfb1eAJYVbL1QL9iLXCLKgRmUagNe2e0aB5sFq1fOMLa5acF
         m+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019399; x=1795624199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p5DfdVn/AdFJR7mLtmlVcoQWNFblslFrL6J6esnTWlo=;
        b=QD9vsVSZFLgiqBjZpvUiyo70Ox1YfhFSdrUBR2KwyVgQOvdRh99kg/29UbwfDZW1qm
         5HD6m/eNmCw0BldJPelraS7FU2lkBwT+InUp0eYQt6lm1NQlFw1b2OuFR0xOGiDr0Hzc
         eEw8XZaKEPdLYXSRhwn0Asj5U2Pob95Yx+oDHRRUPLmHi3N9tslIuzz4aYMSbBJpuI/H
         SykL/UavgivSQxkJoiyRxgK9t/KIzMm5GqQ07OqiN2lQYIWhdZO37g1YNJT+alR4NaXL
         HyKcqxQqN241aQAc1wb/OagWw6lnXAtXibYDKhrbFq33rghJ+sioMSwYBidRjGsRBV/U
         yQtA==
X-Forwarded-Encrypted: i=1; AL+hErFOvIUmfWzO6qvBvHKd9zgovVrdkAVr8ODncfFTh3DfC6IdGdOtZfvwX1Ef+qv8DQL5kfnVmTmfds/HVKI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9LDUWiRMXz/AY9/fl59BozZatvYp6ryC99wo7MZvvuzoyyAfn
	qEW5h1LLbugLuSGhvmgGPeBV3WxmHHkzOQnUaFLqLTTQ40c34Yw3h1QJii5bdwvLEBM=
X-Gm-Gg: AZFdTZcBfeNdfI++obWKncoHfGEYlX1fiiwJL7CgeiA8egy7+9L4wTeNQuVLtpJlvf6
	FHo3CIQuNsu9jyMM1VnLIsfIRY6ZiRZ4AvtxHDOSRCnq7RpswuWaaFdDzdkz6nONLx1obkbrF44
	JRarl1Q3J+gfJeHfAWzqjMTbV1lup35Fzkrw2hQxaqqZH2ixHg9Yrlg/H8OEjTj5kleXdkDddSl
	7vRUCu737nHoVYWzxOgwUu+1bIsonNg/vOJW9bVn7gpg4N4XOk9P8ZtTwfT7nuFi/a6O87l6fDH
	VufKNBuUgwfEko88w14I+aAh6z1jQUL7Ih9SB1iLqh+DG519OjEGCp9zXR4rv322BioiM9h1fx1
	tTsctcU2FiWtB8ZdD+SycDCjEe+HZNrfSRJA+roenYlOMSAdQN9a5ozOlWJeVl50HWW+gwGoPWl
	Z6DA5SA8ZBekWAuHlpqco0saXusB6CYDB1Wb8BCxf9Uff0lGzDUgJbL8H+zJdEL0APn2mGYkn2Q
	ssqyDHoPmWyGBlb0jPkNpu18/h4NNYffo59OLK3xN5JP6pX0by9aQ/8PGLsuSYFxHqPN8tOjYtQ
	090fhTGZ5S+0PTuZUoXqL+3PtINA1Zwa
X-Received: by 2002:a05:6000:46c5:b0:48c:7f18:c85e with SMTP id ffacd0b85a97d-4a63b50cdfamr4894691f8f.45.1795019399370;
        Wed, 18 Nov 2026 08:29:59 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:29:58 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:33 +0000
Subject: [PATCH 11/34] perf cs-etm: Track threads in timeless mode
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
Message-Id: <20261118-james-coresight-jit-v1-11-dad4d90747f6@linaro.org>
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

Associating TIDs with PIDs is useful with and without timestamps. This
is an old assumption from when timeless == per-thread mode so remove it.

Update the comment to say exactly why this needs to be done and move it
to a single function so it's not repeated.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 53 +++++++++++++++++-------------------------------
 1 file changed, 19 insertions(+), 34 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 11ebfdf1e933..67e3e2becd0f 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -2984,23 +2984,22 @@ static int cs_etm__process_timestamped_queues(struct cs_etm_auxtrace *etm)
 	return ret;
 }
 
-static int cs_etm__process_itrace_start(struct cs_etm_auxtrace *etm,
-					union perf_event *event)
+static int cs_etm__associate_tid(struct cs_etm_auxtrace *etm, pid_t pid,
+				 pid_t tid)
 {
 	struct thread *th;
 
-	if (etm->timeless_decoding)
-		return 0;
-
 	/*
-	 * Add the tid/pid to the log so that we can get a match when we get a
-	 * contextID from the decoder. Only track for the host: only kernel
-	 * trace is supported for guests which wouldn't need pids so this should
-	 * be fine.
+	 * TIDs share their maps with their PID, but the association between the
+	 * two is only tracked by Perf on COMM, FORK and SAMPLE records.
+	 * Trace doesn't generate normal samples, and COMM and FORK may be
+	 * missed when attaching so pass the relationship using other record
+	 * types.
+	 *
+	 * Only track for the host: only kernel trace is supported for guests
+	 * which wouldn't need pids so this should be fine.
 	 */
-	th = machine__findnew_thread(&etm->session->machines.host,
-				     event->itrace_start.pid,
-				     event->itrace_start.tid);
+	th = machine__findnew_thread(&etm->session->machines.host, pid, tid);
 	if (!th)
 		return -ENOMEM;
 
@@ -3009,19 +3008,18 @@ static int cs_etm__process_itrace_start(struct cs_etm_auxtrace *etm,
 	return 0;
 }
 
+static int cs_etm__process_itrace_start(struct cs_etm_auxtrace *etm,
+					union perf_event *event)
+{
+	return cs_etm__associate_tid(etm, event->itrace_start.pid,
+				     event->itrace_start.tid);
+}
+
 static int cs_etm__process_switch_cpu_wide(struct cs_etm_auxtrace *etm,
 					   union perf_event *event)
 {
-	struct thread *th;
 	bool out = event->header.misc & PERF_RECORD_MISC_SWITCH_OUT;
 
-	/*
-	 * Context switch in per-thread mode are irrelevant since perf
-	 * will start/stop tracing as the process is scheduled.
-	 */
-	if (etm->timeless_decoding)
-		return 0;
-
 	/*
 	 * SWITCH_IN events carry the next process to be switched out while
 	 * SWITCH_OUT events carry the process to be switched in.  As such
@@ -3030,21 +3028,8 @@ static int cs_etm__process_switch_cpu_wide(struct cs_etm_auxtrace *etm,
 	if (!out)
 		return 0;
 
-	/*
-	 * Add the tid/pid to the log so that we can get a match when we get a
-	 * contextID from the decoder. Only track for the host: only kernel
-	 * trace is supported for guests which wouldn't need pids so this should
-	 * be fine.
-	 */
-	th = machine__findnew_thread(&etm->session->machines.host,
-				     event->context_switch.next_prev_pid,
+	return cs_etm__associate_tid(etm, event->context_switch.next_prev_pid,
 				     event->context_switch.next_prev_tid);
-	if (!th)
-		return -ENOMEM;
-
-	thread__put(th);
-
-	return 0;
 }
 
 static int cs_etm__process_event(struct perf_session *session,

-- 
2.43.0

