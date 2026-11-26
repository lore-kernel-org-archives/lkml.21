Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795670099;
	b=mGJMjpXXvyQ3n9Ob4sEpvD/aYnYtMdwcTN8aNJj6/IBHx4cqX+7BIRokLBIdN4H4v5uX
	 92aejMXNBiG5JfUpqJrbVgb2wpWJrfplBS9v/Q/uyPjGUHAvwy1exsyndu+Tu5Wc8vJM9
	 gwDzPIf0PIcIIMS+HoNj6r4PrT93kmbATbp2pd3AyTWFRhXmK5CQUpkNrYbfRFPt/ocDX
	 VaIdiV6mE5acrb7EeUExmMBLbTcLxng2a79IRvb6O5tHI4aOnmTHKlSR2Fl8O57xr/8o3
	 AvPN4mw24swKK2KMbQY/UaWALF/X9k6sM0kOw8ebx+3GolASL45hWM6YskgJMxYbUnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795670099;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LjmlwygZNbLCUmp9dsQdZWX0Dtj71sPA0dVrwlTxwR8=;
	b=E920yqBl1wde+ueokyGBr3mNW9gARGbR7PfRafEiWZ0iSAYcWv+J8qqtUGaUIBdf4IJp
	 cAtnzzVjN7xbWFRdW0dc1rk5zIl+VFIcmB6BWjhH5/lu1ksS7jV/zI7uarg6bWNFkWU9N
	 CyRA9J309T0U/GdIrsLaOrRucN66KQHJUwFr9fy2+uPnJFjuyVl8FVuH3dyfKrtcxqGDN
	 Ks8kY9ZZV4en0dULO7Q+OwHgm2Ow9junNyxlRauU46oTW8+Kic/TX8SUoBsNJXkBN/Mlh
	 32a0RXl5UWWIbik9RLyWhZ1OQIu1NMrh3NyP+0SD8jN1G54sikvj4wT87BrSN8YtbRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=BxeyoxJO;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5290F606A330
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5290F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=BxeyoxJO
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so5824375f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1795670098; x=1796274898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LjmlwygZNbLCUmp9dsQdZWX0Dtj71sPA0dVrwlTxwR8=;
        b=BxeyoxJOrO3DpkD3Kbqx10hhZWl9lbvQb/ySzOD/nHPZlJSWM7wWwuvY5kgV4L3MQY
         diPPmjnC+eabAPZYZxT8EX01L6ovpbCskSNXjK5m0wpOS7Hh29UA0j/w1P3IfPPFlmZP
         9JgzsHW8jTJrbc1Z8XVr30GEMZ3/I242/C0gqOzvi9IcwONabNOfCx8DWibXMVWHvgkz
         sSbgXm6cAyPoM/Up+lPTPYAlQW2iqUefb5k1/73mqSx8MF0ysj/0ydoqG6fUcskMFDEG
         vrm+u6qmn882XP8im1gU6b8TWolGX/1gXBHfjiVQg3XOIxzUaOj58HZ62E7QuQBeKLFZ
         PyPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795670098; x=1796274898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LjmlwygZNbLCUmp9dsQdZWX0Dtj71sPA0dVrwlTxwR8=;
        b=sKabxIel5hb4GcU6Uzv742YyAGMPJd1fw/CYvToT2s+ivirznLmUwfPCiVDDk/weaN
         5s1QecKNIfX/FiR51jDk91nusMGVPfNat7tkymeXq7PoU1rvIZ18NCtZanoaWHDgECIH
         ws6fTV2kabm1JtLCILWfzNDrV6hu9ZGaXYXASl/DSIKtcI/KKlUxgAjPOoLZ8isbeatx
         Je1dF6ZlMG4vxiR+RKf/VZLjG6xvxOFpSdRkaixT3IN3IlOOfgsajCATnG+ijPnwm0wC
         Zm8phzZVDj7bYrGRHtKOsENugU3aNun2xQxtReFo9vJSDev03PBiXC0yeN7pmscE2y5m
         8XjA==
X-Forwarded-Encrypted: i=1; AL+hErGBZqNgK0F+NvIJSGPOKztyeThlN8v3so/kEc5Pz0LJtZaVLLEqPeuL1A0pUvWHCpeMqj/9c1dBs/DZ7vA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SIZoufqLw7aTw1s9TFZH5AIdQ4itKIXSxTDc7c3OaVstEpf5z
	TlN1lAqMQGEquiXdaudkogVDlJ278LGBsoNlWj4Ue6vxbAtC8lIgf5S9N8N+3PhzlxE=
X-Gm-Gg: AZFdTZc8wL5439ykR2rsCGxDRGOQtFiEvmL4i6OfxTu7t3B+bxaZ9gaEQ5/EVEMOMgy
	CXsyYKFYCse+qWmbXsu/OmJvHmepGfPnSrE/Y00xRkiHE8uuAAbtAmAbTOY/bLyFpvAr52o539I
	k5QAJot0OnplEn9cVoIbYAJCn2IzJ9oEutLPm10LEb/sc1/vZ1WNnreILhfsDfWG7eqdVKAOHGw
	13OcYysfZFPARmQScoF0f5DvtVqou2tZ8uSrtxJR+MbS+YXmfJHvLqNBuK0oTgERmWKnhbJ1GdK
	EpLHqjJnli0szPnc2TL96gQ/RniDWfzn7XOUPezFke9MQwOy/jEsDI5bAJA+oCHaXk5tPyh6GRP
	GpxpDEYLAnPqo1/OZITW0XJU0vbpJsjLsGld7WOvcjj9OV/4RIsOBaGbNGLnngY9fD7OgML4WB4
	lee+tutLFn0EBfrxaPsJqVtsWCrPGZj65XSG0r0XJtm7aEqFVIIhWxajG+FlKpbXqfuIx1zatHv
	5G2J2krlRa9fVWE47ImiF9lWUAI/91Q/ZOnUoY7CVoo2fD1rb7HP+XfMWBREemp89WBXGZHMxhi
	cHrtWYm506dgQsgO0HFYleqKBIABbdTQaaZskLVmWbib4mDoYMjDbBQdP6OnvMM4UkQjbodObwj
	rtneM07gxcZ7k4JbCHq6FUGsqCqn7kA==
X-Received: by 2002:a05:6000:26ca:b0:492:3176:3d64 with SMTP id ffacd0b85a97d-4abad5ac748mr38978478f8f.8.1795670097645;
        Wed, 25 Nov 2026 21:14:57 -0800 (PST)
Received: from aerith (host109-153-232-219.range109-153.btcentralplus.com. [109.153.232.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b1ebsm39548128f8f.33.2026.11.25.21.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:14:57 -0800 (PST)
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
Subject: [PATCH v3 10/10] sched/fair: Don't mess with util_avg post init
Date: Thu, 26 Nov 2026 05:14:29 +0000
Message-ID: <20261126051429.14091-11-qyousef@layalina.io>
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

The extrapolation logic for util_avg for newly forked tasks tries to
crystal ball the task's demand. This has worked well when the system
didn't have the means to help these tasks otherwise. But now we do have
util_est that will rampup faster. And uclamp_min to ensure a good
starting point if they really care.

Since we really can't crystal ball the behavior, and giving the same
starting value for all tasks is more consistent behavior for all forked
tasks, and it helps to preserve system resources for tasks to compete to
get them if they truly care, set the initial util_avg to be 0 when
util_est feature is enabled.

This should not impact workloads that need best single threaded
performance (like geekbench) given the previous improvements introduced
to help with faster rampup to reach max perf point more coherently and
consistently across systems.

The logic can be forced back on using UTIL_EST_FORCE_POST_INIT
sched_feat.

Signed-off-by: Qais Yousef <qyousef@layalina.io>
---
 kernel/sched/fair.c     | 19 +++++++++++++++++++
 kernel/sched/features.h | 10 ++++++++++
 2 files changed, 29 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 88072e346aecf..bcac1acb6393e 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1303,6 +1303,19 @@ void init_entity_runnable_average(struct sched_entity *se)
 }
 
 /*
+ * When util_est is used, the tasks can rampup much faster by default. And with
+ * the rampup_multiplier, tasks can ask for faster rampup after fork. And with
+ * uclamp, they can ensure a min perf requirement. Given all these factors, we
+ * keep util_avg at 0 as we can't crystal ball the task demand after fork.
+ * Userspace have enough ways to ensure good perf for tasks after fork. Keeping
+ * the util_avg to 0 is good way to ensure a uniform start for all tasks. And
+ * it is good to preserve precious resources. Truly busy forked tasks can
+ * compete for the resources without the need for initial 'cheat' to ramp them
+ * up automagically.
+ *
+ * When util_est is not present, the extrapolation logic below will still
+ * apply.
+ *
  * With new tasks being created, their initial util_avgs are extrapolated
  * based on the cfs_rq's current util_avg:
  *
@@ -1352,6 +1365,12 @@ void post_init_entity_util_avg(struct task_struct *p)
 		return;
 	}
 
+	/*
+	 * Tasks can rampup faster with util_est, so don't mess with util_avg.
+	 */
+	if (sched_feat(UTIL_EST) && !sched_feat(UTIL_EST_FORCE_POST_INIT))
+		return;
+
 	if (cap > 0) {
 		if (cfs_rq->avg.util_avg != 0) {
 			sa->util_avg  = cfs_rq->avg.util_avg * se_weight(se);
diff --git a/kernel/sched/features.h b/kernel/sched/features.h
index 75d9d4595c4de..7ca90842d06ab 100644
--- a/kernel/sched/features.h
+++ b/kernel/sched/features.h
@@ -140,6 +140,16 @@ SCHED_FEAT(UTIL_EST, true)
  */
 SCHED_FEAT(UTIL_EST_RAMPUP_ZERO, true)
 
+/*
+ * Force extrapolating util_avg on fork.
+ *
+ * When util_est is enabled the extrapolation is not necessary since tasks can
+ * rampup faster and can be controlled with a rampup multiplier to get better
+ * responses making the need for the extrapolation moot. Switch this on to
+ * force the extrapolation logic.
+ */
+SCHED_FEAT(UTIL_EST_FORCE_POST_INIT, false)
+
 SCHED_FEAT(LATENCY_WARN, false)
 
 /*
-- 
2.53.0

