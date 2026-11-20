Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795213591;
	b=ykYrhFM8BmQYwBaFX1HLwFUpKYmD9ALO42YiU6C3LBDlKiu1dC2AtDYBZe3NreR/T5Wh
	 KpySS2Nj5XAewfkJ7PAXwmhzJ+yKLYP82Iy2xuIExk7gQ0PZr2WPv8gCilkpssKxY7t4W
	 vNOfDYsmEQ6DN9/8Qc8JJ5KXsF7njpTL4Uxz0V7Ze39Skw7VHpyYS4xC903yzhL4gJgmY
	 R567XFhsklhXttSsB/3AhzgCRn853AqxHki+i5P9lkxQm/NGT709w/54Hkx5jrmMVO8Sb
	 OmnTAe5kDK2JXujA322qR9kaeFge7215vtNimpN/7OG4ARUnz5ku4C10GLy0SxJSJYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795213591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=GPF4x0oxyi0FzbmxY2Z7wtQBPD7a4tTfLQmJ4F4D3Rk=;
	b=rdahOf+CxkIPD4L8Kv3H9QmDqdZKbN1liUi1/e8EZZAoiLLatIZy6jNcSbysLpkgpgWs
	 Pp2IR02dkncgHQC1W9mcQ6lwZM6aj6rcjf64HCnmAFfyfx36qXRbzsv+AZRk8E2tT+3rC
	 +bfpSB/xAXbRAxqGB8k5oNqlu1AMbiPPQBfES1kx8qk+fRpQ1rOZQfXZ9//HQGu4Zec19
	 BGYeQQMSxvXECkHxpDsjwUfvvV7Rc/T1AQe/zOaoiPxsgIYjwIZd7yQ7VONtsCAsNZMPA
	 ntpsORlmDDA0R8RCJeUfpYvotjntRL8VkASof4bBMyvMfP4T0LMatWGnuuId/DeSdYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="Z8h/IfLj";
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A75606A690
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 22:26:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94A75606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Z8h/IfLj
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b3a348a6dbso2615576c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795213590; x=1795818390; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GPF4x0oxyi0FzbmxY2Z7wtQBPD7a4tTfLQmJ4F4D3Rk=;
        b=Z8h/IfLjq0j6Zelu8ZSjSiwq2kNSjFqOpK5r+cpdHK5yRGQZcYBciehNgImNkAdsvv
         UMH9YsbaSLjhLRng/iXNjmp+Iv80YqIaJlWpniouKAEpoQrr7An1tKTde0Q89hnBvqNF
         y75tM5uCv03ZSpIsqw3bO9OjYgslDH9j7pZT7EupRGzNrUFQRZaenlM8kZj5aR6wdvIs
         gQK9DlOxab+rKSE5dR3ffuC4OpyYscMDbnVyFrt3QDfCu5fmbmx8CZ2Uo5QcnR6rFBZV
         DWXo8AdN20390HZ1tRG9fvmM6ECPnAg0aLR/o4e5bwKei7Pmri91JlAP78P+isNQI2Kl
         StWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795213590; x=1795818390;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GPF4x0oxyi0FzbmxY2Z7wtQBPD7a4tTfLQmJ4F4D3Rk=;
        b=BeGdqjcXmO9Qzm4lEsrZzIBd02MsggK+VOFtnnZ29+GiQvFVBTLu8q3h+oJOpYJ4Lc
         RHVCrooSJskKoxPX76qDJ0KH1Sl+fPOmVOwd1EmV/rP4kID5tuKQzzhL/veVWXfPMmLP
         L+OF/YQ+hUQ5goOGmqoUyJUYIr1aG6wp/sfLITHfSjPr+iiiRbchIWDlcSPnFlt8Lj7Q
         7OPN3W7Ui0m25jVbKEYjVbSwGTejNLfmEpzevFpPyR0eYldSOELAz8wfELEO0vfs7UmO
         ItlF93aY+n6QmgDciAkBxcC6Jncjmk+oS3jxn2L5Ht5RqmWzN+wcEhMf08A2kQg0YWYb
         Ctyw==
X-Forwarded-Encrypted: i=1; AL+hErElytXbnGJZ4EZpOemsK0D+lR1+0voUcoLC8ng1Z3OVSsiyT31VfPNeQLMACQchddo2f2NhBmsOD6eeeSo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8G7dI9x/u3FmwCRhAxTW8ciGRykWeSNA9eR6u8nDw7wAJm3oyd
	FLVu91ueLVKXIqCLED9A57XVAALNw7jDilqMMDEBzRTQO0RezPt7Iq2V3sVTdBRGpJk+1SQ1hKq
	io8u2KLH1QQ==
X-Received: from dlaj4.prod.google.com ([2002:a05:701b:2804:b0:1a1:3ce6:560b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7023:a8b:b0:1b3:af3a:e784
 with SMTP id a92af1059eb24-1b5568fe775mr4701267c88.32.1795213588718; Fri, 20
 Nov 2026 14:26:28 -0800 (PST)
Date: Fri, 20 Nov 2026 14:26:00 -0800
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
Message-ID: <20261120222615.2291168-2-irogers@google.com>
Subject: [PATCH v3 01/16] perf pmus: Expose duplicate uncore PMU scanning helpers
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Export perf_pmus__scan_skip_duplicates() and add
perf_pmu__num_duplicates() to count numbered PMU instances sharing a
common prefix (such as uncore_imc_0..uncore_imc_7) so subcommands like
'perf sysinfo' can collapse duplicate uncore PMUs by default and report
their instance count.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/pmus.c | 26 +++++++++++++++++++++++++-
 tools/perf/util/pmus.h | 21 +++++++++++++++++++++
 2 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/pmus.c b/tools/perf/util/pmus.c
index c5ef22ef00dc..96c96211f577 100644
--- a/tools/perf/util/pmus.c
+++ b/tools/perf/util/pmus.c
@@ -508,7 +508,7 @@ struct perf_pmu *perf_pmus__scan_matching_wildcard(struct perf_pmus *pmus,
 	return NULL;
 }
 
-static struct perf_pmu *
+struct perf_pmu *
 perf_pmus__scan_skip_duplicates(struct perf_pmus *pmus, struct perf_pmu *pmu)
 {
 	bool use_core_pmus = !pmu || pmu->is_core;
@@ -545,6 +545,30 @@ perf_pmus__scan_skip_duplicates(struct perf_pmus *pmus, struct perf_pmu *pmu)
 	return NULL;
 }
 
+size_t perf_pmu__num_duplicates(const struct perf_pmu *pmu)
+{
+	const struct list_head *head;
+	const struct perf_pmu *pos = pmu;
+	size_t base_len;
+	size_t count = 1;
+
+	/* Core PMUs are never duplicates, see perf_pmus__scan_skip_duplicates(). */
+	if (!pmu || !pmu->pmus || pmu->is_core)
+		return 1;
+
+	head = &pmu->pmus->other_pmus;
+	base_len = pmu_name_len_no_suffix(pmu->name ?: "");
+	list_for_each_entry_continue(pos, head, list) {
+		size_t pos_len = pmu_name_len_no_suffix(pos->name ?: "");
+
+		if (pos_len != base_len ||
+		    strncmp(pmu->name ?: "", pos->name ?: "", base_len))
+			break;
+		count++;
+	}
+	return count;
+}
+
 struct perf_pmu *perf_pmus__scan_for_uncore_id(struct perf_pmus *pmus,
 					       struct perf_pmu *pmu, const char *compat)
 {
diff --git a/tools/perf/util/pmus.h b/tools/perf/util/pmus.h
index 2b784cf648f3..44b5dc2fd36c 100644
--- a/tools/perf/util/pmus.h
+++ b/tools/perf/util/pmus.h
@@ -134,6 +134,26 @@ struct perf_pmu *perf_pmus__scan(struct perf_pmus *pmus, struct perf_pmu *pmu);
  */
 struct perf_pmu *perf_pmus__scan_core(struct perf_pmus *pmus, struct perf_pmu *pmu);
 
+/**
+ * perf_pmus__scan_skip_duplicates() - Iterate over PMUs in @pmus, skipping
+ *                                     numbered duplicate instances of
+ *                                     non-core PMUs.
+ * @pmus: The PMU collection to scan.
+ * @pmu: Previous PMU returned, or NULL to start from the first PMU.
+ *
+ * Return: Next distinct prefix struct perf_pmu, or NULL when done.
+ */
+struct perf_pmu *perf_pmus__scan_skip_duplicates(struct perf_pmus *pmus, struct perf_pmu *pmu);
+
+/**
+ * perf_pmu__num_duplicates() - Count consecutive PMUs sharing @pmu's prefix.
+ * @pmu: Representative PMU returned by perf_pmus__scan_skip_duplicates().
+ *
+ * Return: Number of PMU instances (including @pmu) sharing its base name,
+ * always 1 for core PMUs.
+ */
+size_t perf_pmu__num_duplicates(const struct perf_pmu *pmu);
+
 /**
  * perf_pmus__scan_for_event() - Iterate over PMUs in @pmus that have @event.
  * @pmus: The PMU collection to scan.
@@ -260,6 +280,7 @@ struct perf_pmu *perf_pmus__add_test_hwmon_pmu(struct perf_pmus *pmus,
  * Return: Pointer to the fake struct perf_pmu.
  */
 struct perf_pmu *perf_pmus__fake_pmu(void);
+
 /**
  * perf_pmus__find_core_pmu() - Return the first core PMU in @pmus.
  * @pmus: The PMU collection to search.
-- 
2.56.1.750.gf70dc682cf-goog

