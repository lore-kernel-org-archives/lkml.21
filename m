Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794988530;
	b=GXQHKRfqaiJpnTXjnu7Dj4uxC7rykAr24A/gmLzEJzzpQh0b05rXxpYm35zA/iZip9sA
	 jTW2cYJBlOzy7zDbnvx77ITtZhMhJOHhK9R4XzB8GZSCKJ6P5SSTMrUZIl0lybDYsDzRq
	 hR1xuemzNQO3D26SVfsOuCDfnrOn4aQACEfSI1eBctlYbsfrRsd8F5DlhM2ZHZx2yuehs
	 dAk8ZB1gODoqTV2VA/3Qe8YZH1RG0SiCraYRp2xWD44qLguAuJIS3tj9ffLxVqg1ccdM5
	 vJfzn089pXhhKllfWtUa5MFLmuRGwMK4xPQqudgUgkFJuFjbwB53HawBWBGXAmwcyLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794988530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=JwQhcIOGcjOxphKeILS+5+EKK4GNKccVQCIJqtLQ9r8=;
	b=oIXDoE84Mn90aDlqIDZ27+TJD7wMAqqS0fP1oSpkSPI3Zz5oTe3Zxh+GP43nk9FitW5i
	 cocmSwhXsy6M5qxouz9J8WREfEZVIXFSfpSACY6dEmxtBqE+HPncDXm/gWyovWWOD+kvB
	 aKqHlHZUQaXF4QS6qlZ4W3XnC1QFirbuaEMDYBEAFviS5lpL4VvjwIVtyNYmbfeFfWN7g
	 5EWXaS9F8wsZkNd4f7pzbvpbkd0xC6gxqWzFvtvVPiFtRa5x4lRZkED6cjbPObYnUw8FW
	 /ZxhghsqRYQQKP2x6OrhTZ9YfmT5h9JANExRTA4aK1dPbhPr2VKmdYGMCQMJJKLufPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XyJkOTqh;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D59606A887
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:55:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26D59606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XyJkOTqh
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b3a348a6dbso1502310c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794988529; x=1795593329; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JwQhcIOGcjOxphKeILS+5+EKK4GNKccVQCIJqtLQ9r8=;
        b=XyJkOTqh27uUQlBwbxDrFYFzQs2zYRPweIigoEuAf2m0EgFcEBLjBvSlpEGObO36iG
         4xw7/ZnoaVkVdJGZ9WCuahZPq/mO6lrixZ9PAXcARjsFLnhHm9K3FDoISWsh2Wh5eUsB
         bH2AMeaXam0a9RFy2ik0CcUun/zY3LequVMIukrYKEjI04S58a8k8OZDteLzl44HhnDb
         AAmU59FVBfW1ur278HvBlno04C4jFD3Im0GmRa10525gB1uWhCX2g9ygAPZkeXFYdM5o
         m7mmo6j2lXE40kqm6sBNWXEIQj9Ji7ldph2vwDVFOoWxKUZDuBOwpEFnOdGRZPxQshGF
         +yZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794988529; x=1795593329;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JwQhcIOGcjOxphKeILS+5+EKK4GNKccVQCIJqtLQ9r8=;
        b=qEoizLGwFDf9CUG8cJJ/beSq0RUYpM6Ow3ta6ky6Wck0LoBk5ZRyKzR0kcF6SlbITg
         1X+2byvT5B6riGSQLZJvc6apBJ8GQrxyZIuaqiyf4ZgALZr4SSUFblqY/pi2cjg+wpde
         3TT2ibfGjekfLaJ7xY20g/Gpeh5w+BOHrlYmvJGNY5EWfpejmdG+42btJvxzmO4ZCmZF
         8QcZXWjyvdrikFuFPdkSHjR4kRJYCp9pW5qBRpbcCvE/ZUDedrCtYUBG5M0itFP3uRDN
         3ixU0TxYHUmMI3CsfIaxhfAlQd4DF7virgoE0Wtd5SNoyHdhN0BiVLbzAu+FTv5IbJLH
         LQ1A==
X-Forwarded-Encrypted: i=1; AL+hErEOpPV8ZY7nk5ZkxyjNbg0SHyG7z3DoY1RGTIde1j/gdT0FAleoCISK7Pb2Qaq7Cx83kpJ4RTnKCO82M6o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hOLVnUO0ME71JH+mJ0PknoEuyh1qwcYAfdeIZcX9mPtAt5G9h
	zbWQQt9TBoISCQ33AIK9VqraWM0RoqPYQUKydd6ECKC7KMpceHE58F+Ku9CMMIQWfloOh2KPvsq
	YURO0nRRg0A==
X-Received: from dlgw16-n2.prod.google.com ([2002:a05:701a:cc90:20b0:1b5:35b8:3a82])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2903:b0:1b5:39a3:75e5
 with SMTP id a92af1059eb24-1b543c33197mr1752962c88.33.1794988528819; Tue, 17
 Nov 2026 23:55:28 -0800 (PST)
Date: Tue, 17 Nov 2026 23:55:15 -0800
In-Reply-To: <20261118075516.1278903-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118075516.1278903-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261118075516.1278903-5-irogers@google.com>
Subject: [PATCH v1 4/4] perf pmu: Free alias on error paths in perf_pmu__new_alias()
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In perf_pmu__new_alias(), alias is allocated with zalloc(), but if
parse_double() fails on any of the retirement latency fields or
io__getline() fails when reading sysfs alias terms, the function returns
ret directly without freeing alias.

Call perf_pmu_free_alias(alias) on both error paths, matching the
existing perf_pmu__convert_scale() failure path.

Fixes: 84bae3af20d0 ("perf pmu: Don't eagerly parse event terms")
Fixes: fc807b6bde6a ("perf pmu-events: Add retirement latency to JSON events inside of perf")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/pmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index 1ae8bcf..adf85d0 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -607,8 +607,10 @@ static int perf_pmu__new_alias(struct perf_pmu *pmu, const char *name,
 		ret = parse_double(pe->retirement_latency_max, NULL,
 				   &alias->retirement_latency_max);
 	}
-	if (ret)
+	if (ret) {
+		perf_pmu_free_alias(alias);
 		return ret;
+	}
 
 	if (val_fd < 0) {
 		alias->terms = strdup(val);
@@ -621,6 +623,7 @@ static int perf_pmu__new_alias(struct perf_pmu *pmu, const char *name,
 		ret = io__getline(&io, &alias->terms, &line_len) < 0 ? -errno : 0;
 		if (ret) {
 			pr_err("Failed to read alias %s\n", name);
+			perf_pmu_free_alias(alias);
 			return ret;
 		}
 		if (line_len >= 1 && alias->terms[line_len - 1] == '\n')
-- 
2.56.1.703.gf848ed807c-goog

