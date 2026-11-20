Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795213617;
	b=IHXqCzViSUKJGu8qbSU2YNSMJKiybc84APOs8cxyL0Xhu6un28SLMWGrMFnCfvTM/D31
	 f2LXjvJxQTzlSMBhqeEQFdzL73f9npoQ6ygd7kmJdajQELdwkyH1USfvnQLuN6Py0bt7x
	 ekZlCylpbOvYT3Es35Lm2o96NDuY8LbHaxQ4u6eqvp+grovXk6NaOw4IDtzG7tRSkiZrw
	 vKDXmpKcyPO5Bp7cyKy39WkGX/duQcTndwO1CWLQmS2YHCD8h9egQPdRwOuWwW113YxA1
	 /MCGusqw6jZR883g19mv9QpHYHnyUC+fdbYEg06tu7GP9JbWDStcI1fhhTJAfqS39MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795213617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=t/cI184XZUs8Ie/kJvWOlj4BYKV9hLdbXoKvDHv+Cf8=;
	b=x0QxbjvWidyRct3lIiizs+ejnmF7X+A4QrI4v/ZKSi5RGXCJndcgmU4GAG85a36f4JqU
	 Kc/nM4H2jlxm+LyoyP5vqyGcVqxAsE1EGl9l6kB2fjA1rg6iEDlFsqKiucwc+EQthDgml
	 oKjF3fxBBKZkyPMP2B7tA2sO/S3Q9A5SPcr3ifx7nPANqUwNn+wPT2Y5v+b8X3aDp0WFH
	 jO6WuQaI/N8bkzHx1C8BE7LrEjFC7VjvF94eYWIr+UuX7F5Kqufq6RTOwwClI5mQemqDu
	 Y9t5xTaMOBCA+xyaBtnZ9DWFAcq584WqmnJZ9BfNre8rEryvY7FIirkkyHAuv5bYzsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oG5l4nu+;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECDE606A6B6
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 22:26:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ECDE606A6B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oG5l4nu+
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-38131260a5dso3569618eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795213612; x=1795818412; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t/cI184XZUs8Ie/kJvWOlj4BYKV9hLdbXoKvDHv+Cf8=;
        b=oG5l4nu+ClOuJ6f972Mvy2b0+e2YUQCxptiHTVMZ4vIBxXQkk0hL44eFDZFfJDNLME
         /cB3ZHHZtDBRFQKOdpTfUGhWnC5IC7zYg0XCkpJwXskChN84yC28x+lGPABSsr/XXR/p
         sUQWBbz8bIQ1BZ77JwF8+umucAkPMeOeEFBsDA8+Iip1t8BVxKynfuPJh2kLIiMmz+UB
         DCWuUPu4pa3pgUmOuFGMPCMlCGl8hZOdSNRppVBoCUbrkS8NDfsJQ5Fx3MP75xlB+9O8
         a2tYbUyxly2fmb8vY5c6OOqcohRVvN8rKakybW/gkbZAAMknD9zwbjKOv/32hEV7mjlK
         IFyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795213612; x=1795818412;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t/cI184XZUs8Ie/kJvWOlj4BYKV9hLdbXoKvDHv+Cf8=;
        b=z/kvJkIkSF3AmZfayjb8pMopasDi62MXnGBNC6xxpyi13TWOC3BIea2mplYvTtmvyz
         MuKWyE3iWIimI/sBqAyDZR/ehAfxndXNhHt7FuZ5NNuz0fLZXmmbea4PfPDO5ZMytVTG
         9dF48mO372FjDGroBP5qxi9I5hn0m6E424v2kqXdb+/B58HTJ77+fookvEXInYyLLnC0
         r0b14RUhFS4C/L88Y49zJQ762G3tSG1hDaqrTNaUERUcnAHH7ko4eaZaswPsCeQBPpNM
         KxqChw25pv1VJXfMojG8W67ujOcyeh+w/6I5/drLtcLz4+ZHS4xdEfcFqAO7p2ZolzhZ
         7GrQ==
X-Forwarded-Encrypted: i=1; AL+hErGBwfMC3VOrEen4f/E5p3GQdf798Xnot1wU/YuS26fuyHDNeOewmdotJYXMgAQ8rZW2ddhNV7ogG47oE8E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GnUupsrqzVc+SB0cp6l0MPXTqTIu5a2FExgHHqBMzzbQoIJc5
	C41B12yuNhpW+PbmayU3qWITERwF9nE2pC4OXY4oVaYH8mipkEYhJaZWlUt8DbTchAir7DMHzVw
	fVM5Wt8GyqA==
X-Received: from dyw1.prod.google.com ([2002:a05:7300:8801:b0:380:bbc3:41bc])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:619b:20b0:36a:1d6f:917c
 with SMTP id 5a478bee46e88-3856f45057dmr4911415eec.22.1795213611215; Fri, 20
 Nov 2026 14:26:51 -0800 (PST)
Date: Fri, 20 Nov 2026 14:26:05 -0800
In-Reply-To: <20261120222615.2291168-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261120222615.2291168-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120222615.2291168-7-irogers@google.com>
Subject: [PATCH v3 06/16] perf pmu: Probe privilege exclusion modifiers
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Extend perf_pmu__probe() with test_exclude_flag() to probe whether
exclude_user, exclude_kernel, exclude_hv, exclude_idle, exclude_host,
and exclude_guest are accepted by perf_event_open() on the PMU, storing
the results in struct perf_pmu::probed.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/pmu.c | 73 +++++++++++++++++++++++++++++++++++++++++++
 tools/perf/util/pmu.h | 12 +++++++
 2 files changed, 85 insertions(+)

diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index 53ce3e5fae3b..49e3c66c94f1 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -3135,6 +3135,65 @@ static bool try_open_attr_variants(struct perf_event_attr *attr,
 	return false;
 }
 
+enum probe_exclude_flag {
+	PROBE_EXCLUDE_USER,
+	PROBE_EXCLUDE_KERNEL,
+	PROBE_EXCLUDE_HV,
+	PROBE_EXCLUDE_IDLE,
+	PROBE_EXCLUDE_HOST,
+	PROBE_EXCLUDE_GUEST,
+};
+
+/* Test whether @which privilege exclusion modifier is accepted by perf_event_open(). */
+static bool test_exclude_flag(const struct perf_event_attr *base_attr,
+			      pid_t pid, int cpu, unsigned long flags,
+			      enum probe_exclude_flag which)
+{
+	struct perf_event_attr attr = *base_attr;
+	int fd;
+
+	switch (which) {
+	case PROBE_EXCLUDE_USER:
+		attr.exclude_user = 1;
+		break;
+	case PROBE_EXCLUDE_KERNEL:
+		attr.exclude_kernel = 1;
+		attr.exclude_user = 0;
+		break;
+	case PROBE_EXCLUDE_HV:
+		attr.exclude_hv = 1;
+		break;
+	case PROBE_EXCLUDE_IDLE:
+		attr.exclude_idle = 1;
+		break;
+	case PROBE_EXCLUDE_HOST:
+		attr.exclude_host = 1;
+		attr.exclude_guest = 0;
+		break;
+	case PROBE_EXCLUDE_GUEST:
+		attr.exclude_guest = 1;
+		attr.exclude_host = 0;
+		break;
+	default:
+		return false;
+	}
+
+	fd = sys_perf_event_open(&attr, pid, cpu, -1, flags);
+	if (fd >= 0) {
+		close(fd);
+		return true;
+	}
+	if (which == PROBE_EXCLUDE_USER && attr.exclude_kernel == 1) {
+		attr.exclude_kernel = 0;
+		fd = sys_perf_event_open(&attr, pid, cpu, -1, flags);
+		if (fd >= 0) {
+			close(fd);
+			return true;
+		}
+	}
+	return false;
+}
+
 /*
  * Probe which enum perf_event_sample_format flags are supported by @pmu,
  * testing a common bulk mask first before probing individual flags.
@@ -3545,6 +3604,20 @@ static void __perf_pmu__probe(struct perf_pmu *pmu, int pmu_cpu)
 		}
 	}
 
+	/* 4. Privilege / exclusion modifiers */
+	pmu->probed.exclude_user =
+		test_exclude_flag(&base_attr, pid, cpu, flags, PROBE_EXCLUDE_USER);
+	pmu->probed.exclude_kernel =
+		test_exclude_flag(&base_attr, pid, cpu, flags, PROBE_EXCLUDE_KERNEL);
+	pmu->probed.exclude_hv =
+		test_exclude_flag(&base_attr, pid, cpu, flags, PROBE_EXCLUDE_HV);
+	pmu->probed.exclude_idle =
+		test_exclude_flag(&base_attr, pid, cpu, flags, PROBE_EXCLUDE_IDLE);
+	pmu->probed.exclude_host =
+		test_exclude_flag(&base_attr, pid, cpu, flags, PROBE_EXCLUDE_HOST);
+	pmu->probed.exclude_guest =
+		test_exclude_flag(&base_attr, pid, cpu, flags, PROBE_EXCLUDE_GUEST);
+
 	if (keepalive_fd >= 0)
 		close(keepalive_fd);
 	pmu->probed.checked = true;
diff --git a/tools/perf/util/pmu.h b/tools/perf/util/pmu.h
index fea65e314547..a7d794d67bf2 100644
--- a/tools/perf/util/pmu.h
+++ b/tools/perf/util/pmu.h
@@ -234,6 +234,18 @@ struct perf_pmu {
 		bool can_data_src;
 		/** @probed.can_weight: Supports PERF_SAMPLE_WEIGHT. */
 		bool can_weight;
+		/** @probed.exclude_user: Supports perf_event_attr::exclude_user. */
+		bool exclude_user;
+		/** @probed.exclude_kernel: Supports perf_event_attr::exclude_kernel. */
+		bool exclude_kernel;
+		/** @probed.exclude_hv: Supports perf_event_attr::exclude_hv. */
+		bool exclude_hv;
+		/** @probed.exclude_idle: Supports perf_event_attr::exclude_idle. */
+		bool exclude_idle;
+		/** @probed.exclude_host: Supports perf_event_attr::exclude_host. */
+		bool exclude_host;
+		/** @probed.exclude_guest: Supports perf_event_attr::exclude_guest. */
+		bool exclude_guest;
 		/** @probed.probe_event: Name of the event used to probe the PMU. */
 		char *probe_event;
 		/** @probed.open_err: errno if open_supported is false. */
-- 
2.56.1.750.gf70dc682cf-goog

