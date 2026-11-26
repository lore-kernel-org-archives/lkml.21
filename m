Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795670081;
	b=2ALIaiZNavSXl6fDdjapWy1N2/AHe7O46W2gSU50rTvrMicW3UxggU32BKByfDQ38qZj
	 Af70jKbvtKpeu6Cj5+fluojLjOM2tJT9+qLinzyRDxD6gsfZ73fzuCKIqeA/7/y7l0LfM
	 nlL5ilSx7wN9aiwVZwhRW7vM35uY893oV71QpZC7Bn2cELSLrvwZF2kYaR/8k/v1wOkF0
	 D2ujtekbDtEblgR5ow3DHpuQ5abEexmtLJa3xEwmep3yyvscoKYcNi8K+keMbKDoTO0yW
	 Fepe3uV3i7r/t/Qsi89rdtvSnpvRBWCIXoCkAIGojKNJTaRUcb+H6XCOypSdGxiuhEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795670081;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cxJ0rrgaxSvWbj/RA4L6z2HcLpsHHCy3xYxFkYDw+4Q=;
	b=f9PDawrOsDYzd5fzMGnc8W8dTvBhpIsDXjaEIZe7EMlLQNWULsHeM9S5TXlX3nQzzEA1
	 UuXh1DtpYShW3bgwEnndZr7hCdW4c1bifDQ/GYUufaSd0MoztqghcSe4EZXkBOV2vr7CK
	 XehzQANX/2YimCI1q2PxWSkRoB7bi6PeFkSbxXTy2eeNEFzJPhvn8bXu42lXgRJFn9Wr2
	 7gHVfqqEalk82rgTKn3Cz/O3402reYIHpNlsu5JjRsgECarFxut1/fIujIvqC4NTK/8ig
	 iPiQaihmlfA/SfF4cTvfdq7alIai1ecPRsJHOSncn9u5SsL4RylHlQVBxwpLkTa7vRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Qe5mKma9;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF61B606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:14:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF61B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Qe5mKma9
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4aa5833c263so6282910f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1795670079; x=1796274879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cxJ0rrgaxSvWbj/RA4L6z2HcLpsHHCy3xYxFkYDw+4Q=;
        b=Qe5mKma9c2u1YBTCuYwk4JT44yYEP4bWSxrkMBlYGhZEl4aQy8FcFx7Tlcl44KDO0H
         AISfq6Wpb2YwEuwp4frDuP6ofmoQRtJfs8hmJQ77CmlEzH5jI+IXKzAtGOSfHH0IveiX
         t4ZRSkv2Q5+cRSJAxhnn+6xPbr0L1p0e4qXo5h5tiLMDz8crEFfe+OibZFmurZeknNKN
         zyTasozcqZ8hzHJ7id5RqViYLdNHtp3LxvhZxqEeIgHYdC1J6fvYUNNvdF8VuPbc5hYw
         /KsC4lahxaj8L+B2x1UEwWnwDVOEY3K1QG5LZD1EBa0DZL5YFHHgFhPa0agbG1aKRi8T
         Yg/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795670079; x=1796274879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cxJ0rrgaxSvWbj/RA4L6z2HcLpsHHCy3xYxFkYDw+4Q=;
        b=Fk3Kf60nxElORrOZDRyvKTcx5r3bfYI7lJf+XQEVem3dI6OYIdf2piuz7cw2EWv3uC
         X8eHNfE39X4qyCOaWIEHQ+DlIepFzXixrQP2IwGx353ylKBO/VxH7cKCef98NIDiber8
         i1HXdIinD1+jD8Sz3zODgK9XNVpLT5WoXnfcT1gV1kc5Knl61SVhaPh6maBRmFgwOGht
         Q/vU6PRZJaandrtD9l4iGT21dcZJTZO8eRta7AGD/jLWyM4IzX4ahEB6NAqDABnA/OEB
         l4gzXk7F7Xq2adPuRLJvsuUzySlk+5rbRW05G2x8ZiH5Cn+arDwMLQGwnivZeD8UPw4f
         WIAw==
X-Forwarded-Encrypted: i=1; AL+hErH/RbnTYjA3f4jEoaW717AALtJmHPyQVVYKYDFRFR+Rp7XKt93dXlap7GTHXFKU1gCb50erGQTrE0IL9FI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yg8jSnXAIuxiWH7YZwlDoPWZuhb1tst383BapirmJIvr+WKtP
	rTnahId3FcwIQDMd3oZbLG+CwfmLh2r9fCwa1QnGxRtztG1DC8vJ1BAEvxt6MSHBiHk=
X-Gm-Gg: AZFdTZe+uxJQmFWunzPdqEGuCL2yyd0JNE+7yvZO51gySkEwRb0sDKb9O59Ba3+9c36
	K78YKcBW9me1ajIyzGpiY+I2zzk6D9Mq+RWclIYVznst49Djxlwx72s/np2VO4ZWEA5eqoC0sNZ
	oeruaMRStLWGVEcqSGUph12w3cFIf4T4lod3PcDSFnF4MnTzt3BuvSruaP110/jiet7pdx9rZMG
	85mSH7+0n9i8Qixa/emUPnm4gnnXYDJKHtCtaGE6cZzOn8+tiZvt+k9pewey8HN1FoXu42mNluw
	vdff/bCpjDdFfC2yuozDZlz/+Hi1WBE5V5GdIyWcxgqPj1GtSstO8MG3d/pAwRuTPGR0Cru4thX
	mC7KfG13N6vnID5zgZ4WHFT9S9N5fa1wJnwUJiEgmJ//mTVIaMUlrV0NP9AwlZIAhZhe9mwYG66
	YeyvoisyzGUWxlE+q+yV+LAo+EoQg72XUZhjdoiJAFnPAz70AMllkpjbamra8tVntRfY0AKcNFd
	To4eQ5SB+jSldZNWbjV3C+7OZzOuvi7f2yT9gEzq61pGcl+WdkDfTh3AoJt/4N+eGc7gNR8WnFw
	eBBDXUvDwdP92flrAbT9SyNLQRLf5BocH+tVibGu0T0gu7QciXs6OaatLIhehOUFAHMXfentgXZ
	xJ05Nfpi4
X-Received: by 2002:a05:6000:491a:b0:4ac:37ff:140b with SMTP id ffacd0b85a97d-4ac37ff143amr35373867f8f.25.1795670078915;
        Wed, 25 Nov 2026 21:14:38 -0800 (PST)
Received: from aerith (host109-153-232-219.range109-153.btcentralplus.com. [109.153.232.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b1ebsm39548128f8f.33.2026.11.25.21.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:14:38 -0800 (PST)
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
	Qais Yousef <qyousef@layalina.io>,
	Christian Loehle <christian.loehle@arm.com>
Subject: [PATCH v3 01/10] sched: cpufreq: Rename map_util_perf to sugov_apply_dvfs_headroom
Date: Thu, 26 Nov 2026 05:14:20 +0000
Message-ID: <20261126051429.14091-2-qyousef@layalina.io>
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

We are providing headroom for the utilization to grow until the next
decision point to pick the next frequency. Give the function a better
name and give it some documentation. It is not really mapping anything.

Also move it to cpufreq_schedutil.c. This function relies on updating
util signal appropriately to give a headroom to grow. This is tied to
schedutil and scheduler and not something that can be shared with other
governors.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Acked-by: Rafael J. Wysocki <rafael@kernel.org>
Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>
Reviewed-by: Christian Loehle <christian.loehle@arm.com>
Signed-off-by: Qais Yousef <qyousef@layalina.io>
---
 include/linux/sched/cpufreq.h    |  5 -----
 kernel/sched/cpufreq_schedutil.c | 20 +++++++++++++++++++-
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/include/linux/sched/cpufreq.h b/include/linux/sched/cpufreq.h
index bdd31ab93bc51..d01755d3142f1 100644
--- a/include/linux/sched/cpufreq.h
+++ b/include/linux/sched/cpufreq.h
@@ -28,11 +28,6 @@ static inline unsigned long map_util_freq(unsigned long util,
 {
 	return freq * util / cap;
 }
-
-static inline unsigned long map_util_perf(unsigned long util)
-{
-	return util + (util >> 2);
-}
 #endif /* CONFIG_CPU_FREQ */
 
 #endif /* _LINUX_SCHED_CPUFREQ_H */
diff --git a/kernel/sched/cpufreq_schedutil.c b/kernel/sched/cpufreq_schedutil.c
index 14405a6149911..4d781b394baa8 100644
--- a/kernel/sched/cpufreq_schedutil.c
+++ b/kernel/sched/cpufreq_schedutil.c
@@ -230,12 +230,30 @@ static unsigned int get_next_freq(struct sugov_policy *sg_policy,
 	return cpufreq_driver_resolve_freq(policy, freq);
 }
 
+/*
+ * DVFS decision are made at discrete points. If CPU stays busy, the util will
+ * continue to grow, which means it could need to run at a higher frequency
+ * before the next decision point was reached. IOW, we can't follow the util as
+ * it grows immediately, but there's a delay before we issue a request to go to
+ * higher frequency. The headroom caters for this delay so the system continues
+ * to run at adequate performance point.
+ *
+ * This function provides enough headroom to provide adequate performance
+ * assuming the CPU continues to be busy.
+ *
+ * At the moment it is a constant multiplication with 1.25.
+ */
+static inline unsigned long sugov_apply_dvfs_headroom(unsigned long util)
+{
+	return util + (util >> 2);
+}
+
 unsigned long sugov_effective_cpu_perf(int cpu, unsigned long actual,
 				 unsigned long min,
 				 unsigned long max)
 {
 	/* Add dvfs headroom to actual utilization */
-	actual = map_util_perf(actual);
+	actual = sugov_apply_dvfs_headroom(actual);
 	/* Actually we don't need to target the max performance */
 	if (actual < max)
 		max = actual;
-- 
2.53.0

