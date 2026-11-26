Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795670085;
	b=OAcVzjbhq09Ply1vReaX2N2idPho0WJ/Gq44lbbkg2KjQlEutcCy0ydffbAos38oM4eA
	 P6xYvUisCGWVAMjK47F9lkLaULU1FfmgfMxUM91kkvGIqq6AsN5wDV2LZeJwesDE5Ek1u
	 jgulM7htzTCKWDe3c7ODNmLP7Kb1Zu7GBonFRYBQmr5aM+uldCWG7D7yuWck6I+noUCZw
	 6LPlfd9fysh5KvzYXENCtGbELRsl/qqloIP3tgLt0wvbejZE2EYfK3NDAU8OY46xxsSTJ
	 Uc2wHGvj5m0x64WNk8/GpmdRoCQvCmxb3UeO8uR05KbkKAqip5PYawrGH/cQPerrHrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795670085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yaW44bjMY5yGfcAJ93Rb6lS27s8agzej7Wv+Wo/5CRk=;
	b=hRzNfihsDpMFC7xcPaP7aIebNymSRpWomeLz21VZmF86LGzdtngVYVPR3OQv4dHesg4q
	 Aw25B/y0QGs2IF2lFFbPR1EyALHlV8RRNQRcqBj+/Hm35Mq4IlXIYC0H5XWARo+kBJVjC
	 KdOpeR0ZXaXKy+UlQbG+zka6bS/dnMcfDwlU4+0aob7Gzscb1O88A6bXoKyslUAfpg/Va
	 c6f7NZkKN9pZeMeSxCBFoopU3kUn4PWSQaSdQgusizb/Q/oupIPvhVDHOe3YkQFg51su9
	 BqWVJPi6DvfdQuGlhvIwvDEkRRij0X9d7cziNIptNKFQk1X6rRRhDzFa/wQzArunEzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="leF/QNYX";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAA9606A33C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:14:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DAA9606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=leF/QNYX
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bba5e17728so12907915e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1795670083; x=1796274883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yaW44bjMY5yGfcAJ93Rb6lS27s8agzej7Wv+Wo/5CRk=;
        b=leF/QNYXi4jJ1HQqJ5Uh84WBxAAdd+SfrJsmItJRdFgzj5y1ZrvFCgSHqNeazQ9iLh
         a8H0Pze6IqY1PuqK3k5MNowSXySvbCDeqpt6KXpCY9PiH/hv37eHyRjVU65jvoFUy9JM
         fgH+haBh5uW28svLEKcFhofd4sfKY+LMpux6Q6nlMJ7CSXQwqVLtPdSggG+xT6Eei/HA
         Ky7jIEq9FKMHgVx+JCoY83vRd8owi3Fx24g0D0gjVZu8qVEGO1TwKMxrPa+c26jBaLmp
         cjM7M5f5xOT2weEbjxixIR6qDngYcWg0AyfTPJLxdTq7qOeIxfI/lUx8F43YgwVPjhEo
         no7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795670083; x=1796274883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yaW44bjMY5yGfcAJ93Rb6lS27s8agzej7Wv+Wo/5CRk=;
        b=jyKSeVA7fUbtQ0Gk1zfMxDOgH30TnC/k2YCYL+HLF5LlwzoVkPs7+HpeHcz29eMY2W
         5JJRWZldRzE19zu5aI6bSRmbSw/fvqFuxL4EYbNXYXQKsy1esChl0xegQwmNdCSUpqZs
         5N+xBp9Q+HDxlBB+l8ciiyJdfRi+S23eFKwFIm06GoHitg0w9pyGUgBBgCcvH7rHHGLg
         m+IOrx32TIDDUfIhoeSUl5YrCh1ROZbd2j/fQKOJfhH2jZd171coSkxsiiYA1akHmlkH
         MitBVhpZhVS9rbMVVtVnMePhcX+emxoQwumIlGetU9C8Sw3z7hBWLJ/gNa50NzVDFvAu
         ITKg==
X-Forwarded-Encrypted: i=1; AL+hErFb/HuqFHP93pynqlwExTIcbvA/vWSaC76DDYX4s0UkasSDEBGDMrohIIwnLgmA/G5t9fZ5eMugW9zey9w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dLfoDRTk3RYDgKnu+Ej9Tspx6ImeqYYSl6302VzfkTzPy/qlI
	nU+IMVFbZ8Yf2SjecJ8CVOjW1KZHGxL/w0FdxPmUBVJm85hXF6M+yNVEeG3shQnGTJg=
X-Gm-Gg: AZFdTZe6k+WsRHpwDXl0dL9W1x/M0HAhiMrUnzmhBRDudERDveNWMsqRXsQ56bTH8Vv
	XsdYfWTtxdRFa6m8kZR1WHKRiFpYujCmJf4rdfpBQaK56nNYM3PAVMAIx+XzkD3uxdARNPiLKB/
	N/TEp+YeiLvmibb49l9Me99eQawy4GWdre7x+bt5/j2LfTCm7qPNLGLMGHGgBJZZ4AIY4d7lJg/
	ulFpG6WOpz3RNMpYfkLoTaMDioeaTZTjOi7/kVk57kdeeRUBCdwFUCZNTuYNJGJ7AydIS8xn4Si
	z8UTcc48ggAHM7XbbVz3AGfUwmlB77eYWy+pnrk+cvtKVg5SaHYL2W0NBEvegqWP7MTuBPduq5M
	6B4g9y4e/VC9jQRHYIyO84OlR304kSm7y11N8njp++r+IAIn3sFdTJnXt4ImYuliBKHaTeWuwmk
	kXlr+i2lov+FhCnjoYVBmyii5C8TXGsnaeSbTpgkRuy33fdnGrmF5p/3IkmpPmF4QkWpJnTzOD6
	OnfVn0S5vYL/lt1MjeeiB5PHGE3kPw7NAdOhe5hgh9CQ+Kdk0kkauc2fy2xqX77MbqaYEJLo2Ev
	UbQQIsZTo4wP0ErB5S/9zS4fGKkS16gvJ5p9VpsWsPOC6EyNMjBDEP21vw6XYX/UUdxFesWUCij
	hGjqBSCgZuGGag2cEUpwtMg6U8DEMUg==
X-Received: by 2002:a05:600c:b90:b0:4a7:76fa:87e9 with SMTP id 5b1f17b1804b1-4bb8892cb02mr390665115e9.21.1795670083315;
        Wed, 25 Nov 2026 21:14:43 -0800 (PST)
Received: from aerith (host109-153-232-219.range109-153.btcentralplus.com. [109.153.232.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b1ebsm39548128f8f.33.2026.11.25.21.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:14:42 -0800 (PST)
From: Qais Yousef <qyousef@layalina.io>
To: Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: Juri Lelli <juri.lelli@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Stultz <jstultz@google.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	"Chen, Yu C" <yu.c.chen@intel.com>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-kernel@vger.kernel.org,
	Qais Yousef <qyousef@layalina.io>
Subject: [PATCH v3 03/10] sched/pelt: Add a new function to approximate runtime to reach given util
Date: Thu, 26 Nov 2026 05:14:22 +0000
Message-ID: <20261126051429.14091-4-qyousef@layalina.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126051429.14091-1-qyousef@layalina.io>
References: <20261126051429.14091-1-qyousef@layalina.io>
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

It is basically the ramp-up time from 0 to a given value. Will be used
later to implement new tunable to control response time for schedutil.

Signed-off-by: Qais Yousef <qyousef@layalina.io>
---
 kernel/sched/pelt.c  | 24 ++++++++++++++++++++++++
 kernel/sched/sched.h |  1 +
 2 files changed, 25 insertions(+)

diff --git a/kernel/sched/pelt.c b/kernel/sched/pelt.c
index 0870fced6ac04..7adb329a2f919 100644
--- a/kernel/sched/pelt.c
+++ b/kernel/sched/pelt.c
@@ -508,3 +508,27 @@ unsigned long approximate_util_avg(unsigned long util, u64 delta)
 
 	return sa.util_avg;
 }
+
+/*
+ * Approximate the required amount of runtime in us required to reach @util.
+ */
+u64 approximate_runtime(unsigned long util)
+{
+	struct sched_avg sa = {};
+	u64 delta = 1024; // period = 1024 = ~1ms
+	u64 runtime = 0;
+
+	if (unlikely(!util))
+		return runtime;
+
+	if (unlikely(WARN_ON_ONCE(util > SCHED_CAPACITY_SCALE)))
+		util = SCHED_CAPACITY_SCALE;
+
+	while (sa.util_avg < util) {
+		accumulate_sum(delta, &sa, 1, 0, 1);
+		___update_load_avg(&sa, 0);
+		runtime++;
+	}
+
+	return runtime * 1024;
+}
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index e3108a241c12b..50cf07c364727 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -3778,6 +3778,7 @@ unsigned long sugov_effective_cpu_perf(int cpu, unsigned long actual,
 				 unsigned long max);
 
 unsigned long approximate_util_avg(unsigned long util, u64 delta);
+u64 approximate_runtime(unsigned long util);
 
 /*
  * Verify the fitness of task @p to run on @cpu taking into account the
-- 
2.53.0

