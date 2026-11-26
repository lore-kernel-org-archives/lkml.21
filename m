Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795670082;
	b=RAQ9m3hs+o3rzv0RQ7nHIKs8jTqU2j/VQwCg2ssAHMTP7QxtX+xhh7k4rxxno6Q6jY7x
	 vhSBx1Ay5xSiWGpc5VJGG3uwWgbfxshafMytyxleEZ9HgIdoiBdrSbgC0o5BNQsie0GPZ
	 iJ3otdfRXyPLkw5TNfoOaPl+0Fct/Wz8jYfW0WARhBFBqV593rU5kF5Ye4Yc4d7jfGn9E
	 nX6PAl2ZEKjQKhovkE0MSa5tlYglLGFQDbV3Dl8NPbXNewpWUyGX6icsNLnOc1kMI4uOU
	 q0QZ0qcRi3vpzG/1K8HhmrcPSxOjUnBihBsTCqJXSTupZQM8OA/9ZU5PwPjmPMYBugw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795670082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bPIGzNEYMxIoDn4jVGOziPKs4RvInpRNCfVRCCWEhPU=;
	b=aQRo6HQHP2fdw6MdHSiA43tjhZVQinx/M+SZomb/vXcaFSjqeKcQiMt22CA5liZKe4S/
	 gM87OaKvXrcZsj5w9GC+3Ynzf3wgCgEjmVqJCkk/5Ynv8/Obe5baYsAXb1axKs/rWllIL
	 0BJhK5SrOlKx9X7kd+MgvdkNyk4cQ38aHpO9Krs6O4kLaF38OOwutGpBg2oPkXkmQ2TMw
	 QEXMsauOOA+flDrEA0/fXmhfAiBoQQ8V1vWDitosg/+9Mb99kUpogEXcOImkYLHiAwM5s
	 PgOf50r9WYCy4wf2qmsyrkuGdcrO9UUW/XonO/9Xs/lwn1ovIT8wz1Tjp9O2LaP6dcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=G0Xxz1B5;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D8B606A33D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:14:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28D8B606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=G0Xxz1B5
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso2980998f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1795670080; x=1796274880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bPIGzNEYMxIoDn4jVGOziPKs4RvInpRNCfVRCCWEhPU=;
        b=G0Xxz1B5gF8oPqhTmeYPObKU8tSyjF/jD5uJW+uXcvmOXZWPeYKepr4QqvIdpRRmHl
         gJcAqAX0NtxiHwLukmOQMR8hgHzQxRqXSXZobfxLI67mtfanwfGWqwnjBJEGj73IioHK
         eS8ckRQAwDW9lFjFL3oIMuOr4g0abSKiE95kMtxBQtvaxT7fbeFg3JbTTWY5uW+2L7J4
         nqqKsi1LOqtHw0vWayeG9oX+BA5BvQM/Q6iHlBorSBtT6tddeeGh5vtAVYXmEc90fhge
         jc9TIMhr8Yp7dAwtj66FlnH3v7U4rUqnLP8AdBV0Ms/nLKPu3lWqoKIK49eU6tT1ID77
         H8Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795670080; x=1796274880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bPIGzNEYMxIoDn4jVGOziPKs4RvInpRNCfVRCCWEhPU=;
        b=FP5Y4vO2FFepyqODoCakVTM8IX8ZEJzaxq+G8N6T71rSNfsY/ozKxDA4226K/Y8uAv
         S2SsQ2ijIjOjXuFo0vy+tI2bwPM79V5bXxjkBqIvLjo0GSD+R9KDq0CKaJD+hIPFY83h
         HbTefGmxYOwe8TP+Bt9VsobUqvV+fCEOEn+tUqqtEdSYCu5KH7uIY7EGW5wZQVHwh8b7
         pKKcqdJ+icPD3QGG7jTbCIKUlH6M5Q5J+aYzXVM7EAg9EdnL6tl3vMPmW9XwY4VHr4xP
         zXL+db3IB0u35Dk7sKQS0ZGfiSg9fzxyMkh1ewboFhB0ba9qSWtO2s7UwMEH5u8wkyZk
         rbWQ==
X-Forwarded-Encrypted: i=1; AL+hErEa7VmOOa0jpkaErfDXbzWAZ48NAAmiCzYvPuN/xTf+QFednu+wJ+SFgEEF3q9udS599+dQuFASALX5f+0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VdcKrhh/aSbAY+KUJsuTNLzvFKG54bJk48ReMJPULX1cn1WFp
	AXoSQnYTAa2zOPDvEB8gSTqwemSI1EKV7fchw/gfoZqs8ivZVNH08nZ1KWaKzHQ6h7I=
X-Gm-Gg: AZFdTZfWU7Qb5FCZ2qRC6r7JtTOylTlNVQrdPXGrDEJo1d/olMJbZtWYjRF5XQMNRzi
	+u9KTnMkrUxkbXwTI3csDAUs71SZ6u/9IoUpjODx1wsm3jT7oKIgtlsLYgROjsTJb6MO411HKMO
	Afd5+ccl4Uoq/p40mXujZuPMfyE3GPT73x01cTszWHFFYj9CNB/11WF1saBRYotcUW1q8r0+vRO
	sAZQCqxKwRSqubKYiy66jci5d2H2n8Qn2Y0GCQcKPNQG4u2PZz/KtabhqsriZR4ftvD8HVTJQJE
	pA24CTpIA8mLIWmP5WJ3A5cocYbZKne9sIJpC7dsdeuuLGRA9hnBuOfM2az0p17PzkRSwG6Xzj9
	pbkYUehufGhNu2W/oIyrY3pnhIji1/EWSXmykbZCm6Iwd1FIAcUz7tFaorbGlD/WZAvxn1V92U/
	zTgZnHm969h4qDdPrkssIemv07AN0PS2TQY+rlzRUBXftauGv37FpTXLaEUKHwtjAtzvmTnDQ3r
	CR883eK/W33A5AvZtwZ8XznLRMn9Xr5KRwoBY63hrXci7dXWTw4nVVHnrga+PUYe9bVakl3CCTx
	J0U2Fdsm1rk/OZWkz5tK7mMVBChIfyUCgtl5TiMoNlGD4O9TPqqu8vgW0fJyGekCuOeVuaMxBBU
	VxxixjZ1S
X-Received: by 2002:a05:6000:2406:b0:4af:e519:ccd1 with SMTP id ffacd0b85a97d-4afe519ced4mr31463121f8f.49.1795670080532;
        Wed, 25 Nov 2026 21:14:40 -0800 (PST)
Received: from aerith (host109-153-232-219.range109-153.btcentralplus.com. [109.153.232.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b1ebsm39548128f8f.33.2026.11.25.21.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:14:40 -0800 (PST)
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
Subject: [PATCH v3 02/10] sched/pelt: Add a new function to approximate the future util_avg value
Date: Thu, 26 Nov 2026 05:14:21 +0000
Message-ID: <20261126051429.14091-3-qyousef@layalina.io>
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

Given a util_avg value, the new function will return the future one
given a runtime delta.

This will be useful in later patches to help replace some magic margins
with more deterministic behavior.

Signed-off-by: Qais Yousef <qyousef@layalina.io>
---
 kernel/sched/pelt.c  | 20 ++++++++++++++++++++
 kernel/sched/sched.h |  1 +
 2 files changed, 21 insertions(+)

diff --git a/kernel/sched/pelt.c b/kernel/sched/pelt.c
index d10d57b6b8ec7..0870fced6ac04 100644
--- a/kernel/sched/pelt.c
+++ b/kernel/sched/pelt.c
@@ -488,3 +488,23 @@ bool update_other_load_avgs(struct rq *rq)
 		update_hw_load_avg(rq_clock_task(rq), rq, hw_pressure) |
 		update_irq_load_avg(rq, 0);
 }
+
+/*
+ * Approximate the new util_avg value assuming an entity has continued to run
+ * for @delta us.
+ */
+unsigned long approximate_util_avg(unsigned long util, u64 delta)
+{
+	struct sched_avg sa = {
+		.util_sum = util * PELT_MIN_DIVIDER,
+		.util_avg = util,
+	};
+
+	if (unlikely(!delta || util >= SCHED_CAPACITY_SCALE))
+		return util;
+
+	accumulate_sum(delta, &sa, 1, 0, 1);
+	___update_load_avg(&sa, 0);
+
+	return sa.util_avg;
+}
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 32f76551a0c5e..e3108a241c12b 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -3777,6 +3777,7 @@ unsigned long sugov_effective_cpu_perf(int cpu, unsigned long actual,
 				 unsigned long min,
 				 unsigned long max);
 
+unsigned long approximate_util_avg(unsigned long util, u64 delta);
 
 /*
  * Verify the fitness of task @p to run on @cpu taking into account the
-- 
2.53.0

