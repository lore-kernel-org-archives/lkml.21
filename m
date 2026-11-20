Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795212836;
	b=FGgBHjZF9vVLAJpYqCnQdSWPtPbHtQKKxdgQfQLZKzgDWdwACETO5xVRAyzewsjip5su
	 fFctqjFTXpnvUVATU9duEFUdiop5R+/IgW9daMMSvF/hL6UROlHICbhQ3XpQ0K2naon3I
	 XqgBHa49Zu4VN67UQXvUuzOVxDgP22nqPzV+ool0vSIHxwOS1xP97KImJT9Uiv+4G6HHx
	 8MH82ewjfkyjA5V1L7Ytrny/LZLKnvsXEteenB2h0cy0eeeArDiQeSOxGALNJKOuz8rqG
	 9knCY7DUsM25vQqkXcHS3b1TuY0FoZoJhl6hF2JO0Vo8Q6pNYwrdpwrrTLmh29mJ/Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795212836;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=qZdMAm29i2lB188sbmGGTc+2IJf3WyF7WYFVB9nwzmw=;
	b=k0+eSuiyhV2exKrOS0sCzPM5LIOcS26XG1qkIpMFOUiIauaZOy05Jl57H+SESSY/+x5q
	 +Y8obHY7ATIYbvOK8l/ePWTTN6Y2yOuEkuVS+Ym7Bbk+nrvbuaV3OBZra2J2aZJKtFeRq
	 8MKrZHI45fs25eEPeVqxVbVlAQcFWxCreCRthS1oWz9mnrxoRfL1rEiHhS6cCgG0GSYFU
	 w+zr8h8P0Sp1Lfop+Bzp6SbMoXJjTki573JDgVRgTPICJvha7vH/W4Irn8sao0W1bCEG/
	 QNPeqXvUoWl6cOjlg8FdyWTRcGJzM4WYuzlHrrq0N8LAyf4tQ0tjLUjih/vtir91t0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WEtgcrIk;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1B6606A680
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 22:13:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED1B6606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WEtgcrIk
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-38355b03cb8so1310489eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795212834; x=1795817634; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qZdMAm29i2lB188sbmGGTc+2IJf3WyF7WYFVB9nwzmw=;
        b=WEtgcrIkVFQTqXNb3RiVYhcNLtxmqjybnhFcRSCqB19B2dnO72V+8JUXIVQesJR54T
         RWXU4QtQghYyIi0BLW0RW/VdPKM33HSaBSgYJ2TobNmpKe5p4CV0iaXP0JeQE6OmczvD
         ncLQZTWTIFtCJosQR6x7xr1ecj5QuDT5RSGmcoFfIIn8uVPuDF3ZGJNub5bjMRi6v3ZR
         5tJZAkfrTnOljhdmFoEzYFWtounRgFOu+FCIc6ojbOcMlesoIC6e+YAkcew31zwDrWua
         oePg4fxbTACeZrBxcn0ZrOCSugGlBZRki7mcLl0KVLDUcNBE8q6ZJfUJaNfdEOR5xpmk
         TFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795212834; x=1795817634;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qZdMAm29i2lB188sbmGGTc+2IJf3WyF7WYFVB9nwzmw=;
        b=oV6FlMtwjBNsEkoZl5nSVBAJZfBib4XUIbPUV2zdhtpqTRvcK+5yO0Uq62rTCvlcLL
         8vnZcX/i2HxxDE+3N4H4l8MXUjFbBVsjFt+ZywdMKEGe5PZfCG1aWu9HkdRCbD9g5jKd
         F9OXS48C+oWtUywHBEO4qVGG35UwHVSZXd4NUw5Z+Lxh3yOca5qOF2BkaWi67ZYXiOQR
         L/OXJuPOwJY4RzU6GFe4SWikHAVEO+MuEjb7ZT1NEo6APm3b5EPvbPPaILa4Qf5RqKni
         k9obq0fT+dFtBuOWseyGumiYMQc32P4i4AgLIxYHcStU0G58igDp7foKnQUQxjy80TFc
         kfxA==
X-Forwarded-Encrypted: i=1; AL+hErEMjjyhSanU5j+ZhNPBijcB19CRYgyDCuPNiDpMNqHBv3FHq31JzhgeTghqxnY/AdxEiye5bm604iMK8no=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DOM1KBB+m+7CSKwOFDRyJNG4DjtxxnxtQLfb0+rETQOvJCF3N
	ktnUUwrUDDgZVzmGcRKRytMCNmp3kOk0K9LocVli/f3HY4HNwzD7V44+OpDaWNFASJSM0zZ2GvB
	2EgkXzLd6zw==
X-Received: from dyah11-n2.prod.google.com ([2002:a05:693c:83cb:20b0:384:337f:4c9d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:d205:b0:36a:1f8:a56e
 with SMTP id 5a478bee46e88-3856fe564a1mr3602765eec.23.1795212833694; Fri, 20
 Nov 2026 14:13:53 -0800 (PST)
Date: Fri, 20 Nov 2026 14:13:05 -0800
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
Message-ID: <20261120221332.2245191-5-irogers@google.com>
Subject: [PATCH v3 04/30] perf metricgroup: Don't prefer tool events for
 displaying a metric
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

pick_display_evsel() selects the event of a metric that perf stat shows
the metric alongside, preferring an event that isn't a tool event, such
as duration_time, and that is used by the fewest metrics. A tool event
used by fewer metrics replaced a non-tool event, so whether the metric
was displayed with a tool event depended on the order of the metric's
events. For example, CPUs_utilized could be shown alongside the
duration_time tool event rather than cpu-clock, and cpu-clock not shown.

Only compare the number of uses of events that are both, or both not,
tool events.

Fixes: c8035a496141 ("perf metricgroup: Add care to picking the evsel for displaying a metric")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/metricgroup.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/metricgroup.c b/tools/perf/util/metricgroup.c
index 779fe56fe8d0..98f3ba8f9533 100644
--- a/tools/perf/util/metricgroup.c
+++ b/tools/perf/util/metricgroup.c
@@ -1388,8 +1388,10 @@ static struct evsel *pick_display_evsel(struct list_head *metric_list,
 		struct evsel *candidate = metric_events[i];
 		size_t candidate_uses = count_uses(metric_list, candidate);
 
-		if ((selected_is_tool && !evsel__is_tool(candidate)) ||
-		    (candidate_uses < selected_uses)) {
+		bool candidate_is_tool = evsel__is_tool(candidate);
+
+		if ((selected_is_tool && !candidate_is_tool) ||
+		    (selected_is_tool == candidate_is_tool && candidate_uses < selected_uses)) {
 			selected = candidate;
 			selected_uses = candidate_uses;
 			selected_is_tool = evsel__is_tool(selected);
-- 
2.56.1.750.gf70dc682cf-goog

