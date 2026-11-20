Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795212826;
	b=G2v8IPbH64waNALBoCvXEAQMzuAyFz+LCq5aAoLgezi3FfdjAQihW8EAQvTLud30RY5i
	 rBZVCaGpyO1QUNJXHKYp6twxhPCJeaiFMrTLUH0tnFhzSJ9nVSqENgdUpgl5m74tCpeY3
	 Tso2AqWj0WO9TgGHOlZfGXo4LTIRaZnGIv9uarCjN91xtJv+XOOWASjk9wRjjYG4ht65F
	 T5sKVd5nNR24IRT/cAlBv/vLnek2ctXKztD0v1H2rxz8zmLJ7PWsgskFDMAafKK7JHXqD
	 8PculYHAg+stKL3xeJOF1+a8znUxeu71Fqx7v4shPe4gA8eE3vmmwMDWi0vHsyWlJAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795212826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=fdTVu9ac2YLECwcoGWeJTi+3MACuUXbIR+eJpbYlxEk=;
	b=ZCR6apwHAZ9XnglkJwgMbE0tJLXu9Y1TOpKIrMJjj3nS9wJTrssP4TQl9X5rZdKK3JGz
	 fQ6iIqVaBaf+kym06ObfjW6pe1aZMRxuCvV44JRENNwSSFN0uhM33nK2Y35/sSeUXKrby
	 wo3eM1BJjZFlhXCdX+WGEuWzYIzvveD3OOKlv82Rl5FEedHAq5S/RxioeNFe4WiEH6NbA
	 P6eCqp4BrbGOfLzzW9NdKccN01WKHE6zUgWsTP+qqhbRRrjxsbokrNL3q/5Q112AGD3r0
	 E2a3QbsyvWylJGFMEV75qxGfNmv4auR1wQLRnT1wqn5JwS0jclBMMCiWYvfR/7/4TDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JFpASQic;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3796160A260B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 22:13:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3796160A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JFpASQic
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b3ae17c536so1336490c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795212819; x=1795817619; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fdTVu9ac2YLECwcoGWeJTi+3MACuUXbIR+eJpbYlxEk=;
        b=JFpASQicDGpQu9Wjo+7e0MRRG/c6JZD3XKzAGRnD7fUKbN67dE/kwUdHfALquOVo9j
         f94S5KhYSjIZF3FaGTdxa1a5WQ6fagZZEqGKP4xvUw1qBol/7f+0wSdFimCfVcENqLbU
         PrztFv8aGjdS4zvVNCdrkl09PSoGQ32VBezfKR/fKSC/T/wTNNpx1Rhy4iJi33WTZA/S
         gUceMdKfYauuumnLXnaPsUcfpQj4g1GvXFEFM+JcPka251JR0ssZ3wvXEox4OosN8F9V
         jmRsTXwIf2BRRn1X+z1SSiKhdPZ8tQPou86lJn13om1rkKgk9iEsszt/zMEDQ3u5XP6F
         Vr/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795212819; x=1795817619;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fdTVu9ac2YLECwcoGWeJTi+3MACuUXbIR+eJpbYlxEk=;
        b=SLP0NqNAQmVqsMquz34GX4S4W1fbaAs70kDkPD9sXOpdrXaAZq8mm6Gjz7Cm6TH8ZV
         gtYqNARsfz0JdaFHaA0w/eNJ/zw1fpSmzlWl9t5rpyEArTdWtaQWCjzVVkfDYoUZi9kT
         aNQIyu0k1KsNFDHXfYfj5gWfCrQGlBze7H3DbSKthOfQ2CErIqvv++ktjJxO2zmoJs+B
         Lc3v9AKEg4VKSq1lXseiI05OrIOprj7kWpLR79MvujqbNwzCw3RIe5NE9CN+udsbuqhv
         FmakuFcVbDlybeKNctnK0BbAdLvKyNPKUZiqmMS9WP2MG+hzdk0fZ4W3nfAdDrGTC3HA
         C0yg==
X-Forwarded-Encrypted: i=1; AL+hErHcGhSqnkTQVg0qoSAxPavtprdy3rq05+FUG98CZDUz2GiA0hQwKYvnL91cygRQQTF0ERwARQajDSQdzUc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aFZbc338y1y6GAT+S9pUh1gFEM/vHkjGSbn9EL8HALXs8yE6D
	KNAKaK2BgX8CbkZs9kMjcHlYISm9p8CIJhaImHbEqbQOjL4KdZQ9U7P1i6D1UFywcjlA2xJRoUo
	UaXzYaHQFWg==
X-Received: from dlbuy9.prod.google.com ([2002:a05:7022:1e09:b0:18c:3061:3bca])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:f109:b0:1b3:8814:8383
 with SMTP id a92af1059eb24-1b55689fca6mr3255964c88.9.1795212818746; Fri, 20
 Nov 2026 14:13:38 -0800 (PST)
Date: Fri, 20 Nov 2026 14:13:02 -0800
In-Reply-To: <20261120221332.2245191-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261120221332.2245191-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120221332.2245191-2-irogers@google.com>
Subject: [PATCH v3 01/30] perf pmus: Don't skip core PMUs as duplicates
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

perf_pmus__scan_skip_duplicates() skips a PMU whose name, without a
numeric suffix, matches the previous PMU's. This is intended for uncore
PMUs, such as uncore_cha_0 and uncore_cha_1, that have the same events.
The check was also applied to core PMUs, but core PMUs of heterogeneous
systems may differ only by such a suffix while having different events.
For example, ARM ACPI systems with two kinds of core name their PMUs
armv8_pmuv3_0 and armv8_pmuv3_1, and devicetree systems may name them
armv8_cortex_a53 and armv8_cortex_a57 where "a53" and "a57" are hex
suffixes. Only the first core PMU was listed by "perf list" and the
events of the other core PMUs were missing.

Before, on such a system, "perf list" and "perf list --unit=<pmu>" only
showed the events of the first core PMU, the scan having skipped the
others. After, the events of every core PMU are shown, as on Intel
hybrid systems with cpu_core and cpu_atom PMUs. Uncore PMU deduplication
is unchanged and pmu_deduped_name_len() already avoided removing the
suffix of core PMU names when printing events. Similarly avoid removing
the suffix of core PMU names in the raw event encodings that "perf list"
shows for each PMU, so that each core PMU's encoding is shown with its
own name.

Fixes: cd4e1efbbc40 ("perf pmus: Skip duplicate PMUs and don't print list suffix by default")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/pmus.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/tools/perf/util/pmus.c b/tools/perf/util/pmus.c
index 8d3238fd23f1..03d79ec5037f 100644
--- a/tools/perf/util/pmus.c
+++ b/tools/perf/util/pmus.c
@@ -488,15 +488,14 @@ static struct perf_pmu *perf_pmus__scan_skip_duplicates(struct perf_pmu *pmu)
 		last_pmu_name_len = pmu_name_len_no_suffix(pmu->name ?: "");
 
 	if (use_core_pmus) {
-		list_for_each_entry_continue(pmu, &core_pmus, list) {
-			int pmu_name_len = pmu_name_len_no_suffix(pmu->name ?: "");
-
-			if (last_pmu_name_len == pmu_name_len &&
-			    !strncmp(last_pmu_name, pmu->name ?: "", pmu_name_len))
-				continue;
-
+		/*
+		 * Core PMUs, such as armv8_cortex_a53 and armv8_cortex_a57,
+		 * may differ only by a suffix but have different events, so
+		 * they are never duplicates.
+		 */
+		list_for_each_entry_continue(pmu, &core_pmus, list)
 			return pmu;
-		}
+
 		pmu = NULL;
 		pmu = list_prepare_entry(pmu, &other_pmus, list);
 	}
@@ -785,7 +784,9 @@ void perf_pmus__print_raw_pmu_events(const struct print_callbacks *print_cb, voi
 			.long_string = STRBUF_INIT,
 			.num_formats = 0,
 		};
-		int len = pmu_name_len_no_suffix(pmu->name);
+		/* Core PMUs aren't duplicates so keep their suffix. */
+		int len = pmu->is_core ? (int)strlen(pmu->name)
+				       : (int)pmu_name_len_no_suffix(pmu->name);
 		const char *desc = "(see 'man perf-list' or 'man perf-record' on how to encode it)";
 
 		if (!pmu->is_core)
-- 
2.56.1.750.gf70dc682cf-goog

