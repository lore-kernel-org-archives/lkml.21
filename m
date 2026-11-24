Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795521937;
	b=nRydBPyMl2T5b0lwBhutKassmWkhIT8lCGeI48J4o8leaebdDdC3DlfBUO5pAmfZhfRj
	 j1ICodakWhLGJ3sPA4w6RjYF82TLVqvHWJvD0AORbBF17LjwXqZe8k9AuQKxBikZCBlSH
	 hCRTKyy6T5JtR0Yv4YNLm++znet5cd4wSupZhIxRBJyUMNVwuytzUn6oT7GZs0YgPLIHy
	 mOWZy8xfE18de2PPSeSuUcu4NmnASSYIuAbNTEcwvMNtX/y/X1+VV6OE/zQZ+0CxID9uM
	 eto2qzPjugzVuwAreuVA8tlITomSjhHMe++Vi2mU14GrWnuYxG9Cyc/TXpPGYsjZwxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521937;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5IernkkwA+DoP/JgvUM6f7W9BvN1ADy096tR+AYqelk=;
	b=UbMXWkgIAw8rTEjlw3eFTvIsPwtwdRyhj4EOQgLqPBD5RajQnFvewdgtoDDct89dHLsF
	 j+yZDfwwBGt9Jn8bOB9gXpAdZQdEGUght3vNnG5lODw6vYjTVRV15GtQuqZyDza8ZYY1b
	 Ewan903T/4Q8P/SJRn0bg+cPLPEhlXE4WLuhatZ7gLgVpFxoogkEDKegkIOx5nSHbl5MQ
	 xUHxGQQCf3usuelJp5OMQjU/V/XVYR1UtlmAgXImIoO2dkOiWrsz1fN++Mgf4ygzjggAh
	 qZi8kkouaW467bc0S478VvVeuPmSJh+FlWqI56JkJxD2mH+jBpR3MeFFhJE0oXLW0Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jo8RUMQZ;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AF1606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:05:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45AF1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jo8RUMQZ
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f07a960666so24085105ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795521937; x=1796126737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5IernkkwA+DoP/JgvUM6f7W9BvN1ADy096tR+AYqelk=;
        b=Jo8RUMQZgn4cqGAq/vlqdQ95A0r8L14yCvkuzGm7is2hPSuCO+yRyUSqmQFvcNL/20
         D6tehF9nWi2kzHPw8dc+hRSiiBMLaP1fWS/C4sbeXkyOtOM0jAHkdNt7jsIcqyEFIDcO
         KE5/ZcjyPvUsU0JANb/HXWcn0NV3wdANyTjoFiRuXM/GnBqxdS6i3qbRtPqfCNqQcLkI
         gRZG92HTbuloPRK20VkbVywmH7jhDXdvDtkmrKkTHJjEP53mhU2xrzlFwlWxzlKo2Exu
         BWfKPnVeW4vVw2QyZlpWNx8ceDXStxajzesj5LkmVmaziUyJirHykcGNgKW3DBKdAHLt
         Idtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795521937; x=1796126737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5IernkkwA+DoP/JgvUM6f7W9BvN1ADy096tR+AYqelk=;
        b=vfTbO5Kp55XYmMZ5tht2S/cRuFsiwuk3EPbEnkkVAB/X5m1ckLgB5zlJZavWUlzLjs
         xYG78u3qqlqJM+qMKqOrnIoEUm7eKcAi9MrmsVLIqcwDxdomKQHgTJSqYT4AyUg2aXa7
         3UtCQ0DxtZk0Q1fLvgaJ9fEbvxMA3hNYJHcEbgAUr+9Fw4/Xea3OCM+S1EmAlGJMb8Wk
         Ls2Oe/9Gg5jjA62AAach3H858Vzw9qiCeFvpA63lwzs6xZW3R9SuU2BE1liAT/BEMzT1
         LIyyClJ7BT/ktP3feZzb0S4lfKlNy7icOddpCz0fRMqK6WdSgCcr/x0Gx2O5q8QY/R7X
         NxKg==
X-Forwarded-Encrypted: i=1; AL+hErEdjr8fSYqfwZZYov104KeHJ1gkgBBJW3YFMJs5iH51zE1CJZEqEk1wMiBeCWTs5WGunEdMHTjaROIwgG0=@vger.kernel.org
X-Gm-Message-State: APuU4Z89xweiusCWwqsmTfHaIGvBkOV3bFYQ37lpn7EVQuGodUQcv8gn
	/h43Q1nfD1ekTu/kd80FJILJip8ZG6YA3/tfGbz+sMjE+Uy9KjvxZtQu
X-Gm-Gg: AZFdTZd2eFb75mIR198hoTYpIpEiGFBbqZ+9fnnYkb24fKIoN2vsirzhvIRiZrix+r6
	F6B3LtgsTVMc58E6QdVUNEG1Ca3UIj2keO+mVvF8duzgMsQTAmrTJRT+xLRDRj4kzaLQa1xLo2D
	OWMu7WTfB/kIqIuTbIyGxSDswdMrh3xNg01wYkRLCubNvzaNf017IopGoC4DkxkfXWpyP9fR6Yi
	UCfKDvXPTLMe22vU6F0JIUKldfSVjucwvrkKumhPmJsiqY+KMz3Q+T7jJoLOnCx9V5VRLNRwyLv
	/rER7G60c6u/8lMORluhs5sCfGoMoR1VeZYv1772jxHtfLjB7KK3yea/53cvFUk98QF1DaUfe89
	J0Bcu4HtE65nUFzDLZZTyd1LP4HnUvVKdi5dQKRAP6hPDBLYeWHUbDCvoJqhqFzO91Zw8Gfg8ag
	oEtIVYn0zluqoO4mO1676m+IgRD1M3clnBXo2KB4rAe33zONKofZquLVfSod41Fl0/Y5Mbm2zS4
	pkeqzmj+H/nSrpAjXgKcQnq3wG8wjaEmRcnAJuKfLif0Vj1eoGAoJCnq0QgxHZhlS7/NoC9DWYE
	gwrShV+rn55N1z85rEEMlXA47j9ssdMtfLCUyQIViU0PENEAFNP6e+Wmdpt1wlG1iUMatW2tgMm
	A0H7YjRXUco952G8ObHo07ZGO9afgPbpOFN50EAGEFrMX+waXiHtLGvDORum+sCOUZUQV4DVq04
	FScA7FDYwRfHiJGKwYu2LhPfif/4cCWPlBoXzZTEJ1kBYhPuSHdm+UV4oUOaiJilV7ZEOulGRvo
	kONvrpQcAbDVuoAjICEp/3aIuV6J4v3eQfIWlA6FnEUJBXaZazxucFx2+mMOZpB
X-Received: by 2002:a17:902:eccf:b0:2e9:77c0:c7ab with SMTP id d9443c01a7336-2f03f1277f8mr140248475ad.29.1795521936572;
        Tue, 24 Nov 2026 04:05:36 -0800 (PST)
Received: from localhost.localdomain (27-32-254-230.static.tpgi.com.au. [27.32.254.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f07d6d4bddsm39621705ad.62.2026.11.24.04.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:05:36 -0800 (PST)
From: Daniel Wade <danjwade95@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Kyle Zeng <kylebot@openai.com>,
	Aditya Chillara <aditya.chillara@oss.qualcomm.com>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] perf: Wake pollers when CPU hot-unplug detaches an event
Date: Tue, 24 Nov 2026 22:35:03 +1030
Message-Id: <20261124120503.334-3-danjwade95@gmail.com>
X-Mailer: git-send-email 2.39.0.windows.2
In-Reply-To: <20261124120503.334-1-danjwade95@gmail.com>
References: <20261124120503.334-1-danjwade95@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CPU hot-unplug now detaches events with DETACH_EXIT, so is_event_hup()
is true for them and a fresh poll() returns EPOLLHUP. A task already
sleeping in poll() is not woken, because __perf_remove_from_context()
does not call perf_event_wakeup() the way perf_event_exit_event() does
on the task-exit path. It sleeps on until its own timeout.

Queue the event's irq_work, as merge_sched_in() does when it puts an
event into ERROR.

Suggested-by: Aditya Chillara <aditya.chillara@oss.qualcomm.com>
Signed-off-by: Daniel Wade <danjwade95@gmail.com>
---
New in v3.

 kernel/events/core.c |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 2de4c3cc37ac..bccf16beb325 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -15345,6 +15345,9 @@ static void __perf_event_exit_context(void *__info)
 	list_for_each_entry(event, &ctx->event_list, event_entry) {
 		__perf_remove_from_context(event, cpuctx, ctx,
 					   (void *)(DETACH_EXIT | DETACH_GROUP));
+		/* Kick perf_poll() for is_event_hup(). */
+		event->pending_wakeup = 1;
+		irq_work_queue(&event->pending_irq);
 	}
 	raw_spin_unlock(&ctx->lock);
 }
