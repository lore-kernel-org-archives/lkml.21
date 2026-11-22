Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795312652;
	b=OJII8W8Qh9cH3mxpptknvKtiTYhmXyM5KqMu9LkxmWnauptA2AkB4yaItLqF4829/B/s
	 lEvvZlGgT/tH8D4M8E3URQH3S9uYGBPH5wX0dxpjvtq8zXUYBt0Pn2BZw4kgXVKPksxiY
	 6BtuETFiN+g/UIPw3S4FuKLcVn0o2sm+97XvRHMiLXLxzTU6b8+bmnwY0Zz7tsGkhFjpL
	 5eNP289IhlEHu4X8P09PuRj7E5VQCSlmuOjF+8shcio8dfzh/bcHB+KwTDwrt/+vs0iKz
	 Z3pLCgwF0jPa1WzKWWvoG+1CPmB2ycePg28ePzqQIm3h3WIrWN3p1jhLewGtSRM6MXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795312652;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=BslzRReFXUd+tW3SQkN1QdM1be6GaD92Qfct44ghPbA=;
	b=mm4nJ5VcWXfdRXDNfO/9SY//nS1n1H4sm0/zYGxmez6q4i11cVDl6rEl/4qsERbSj/qd
	 KH5nlcddN9qH6SFQbxavJ5cU5f1Efrrrd6POfaXjWztf6kcSJWrXgDp6YVkWkG4Ucvodj
	 Zsj2nmwK0nKfCdktD29mXEl0wPSIOd3xq3QLfYQ8pMbI38PhaY6OE16lMwbblClRECxa4
	 S+H0pf3YuxS+w8jZEyBn+zbdJoxZ2PejaU59F6lRfzH1m+2R28gU1SVZ2dvTWliVAMgsn
	 LeqiDKpt68lXuwOTE+rLJ4MqT63bxpUiKOzHf5NQwzNiXtJ86b4BczzLruYeTPIPNXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--penghuang.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IrqSsEfn;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA0B606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 01:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCA0B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--penghuang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IrqSsEfn
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b56c696405so1296348c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 17:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795312651; x=1795917451; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BslzRReFXUd+tW3SQkN1QdM1be6GaD92Qfct44ghPbA=;
        b=IrqSsEfnmfXoFpshwVJGt5+kKTWm4IGzyYFibY2bmokQWKKRb2hgFxdV1T0BcFPu67
         zBgLNA4wuAdlhZDlnFPRcbvDf/j4jQbSTiWwFPqyakxFaMoxfOwX8CfU7QV2xMv9kFSp
         ehQMv+dnVdFyF1E5gvWzv97aI5InFNYMRjths6leW0UUNjzYTKQrrC084KkUj9XRxe7K
         krbrxnSvQ0o6hXp5tzALQ4S7OEjnHQnNSNawCSc+sVWqbVpyi8D4UETO3s5Ajai1Wjos
         x4Xz4hOlhkKmFTSqEDb6UEy6yhM1iV8dZbstxViPGoIchLKDzS50PrgCLdzmrHVMSA3U
         htvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795312651; x=1795917451;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BslzRReFXUd+tW3SQkN1QdM1be6GaD92Qfct44ghPbA=;
        b=wgy8aAYE1lMP/gdJB/vLOPbubLgHitn0RvJBTA3Z9JbkfX3P8dxvzV/+qCObiROvzk
         khh+QtISWZGNHH+F/YSBE7feh1GfnVdqPR9j10DYq0vuvMV6GQgC2lX5ENhrJVnUehei
         yYu1O0zD6kyIPCE8aum1HowjxguyaUa8Qo7S46KcFGx7uugPesxC8v6V0qD5YCY1y+Nb
         dczCmtQuATsJVrXDRJ4tll1H8Dcw2Yn2ZdStwc7tjxwwPZr5iyMfXjbACogMgPtUKh0H
         44PkAX3F42f5zuAQqlWTLhboW3pBRNwtmiCcZ5JoVZ2hD9z8ou4Rb8ZUe0NIUd+reTo0
         xogg==
X-Forwarded-Encrypted: i=1; AL+hErFmIj9u0P6DedbT11gRV/WGTDwdx2rq+f52nl1eldLUs9syKZBAAGaKqxNICl7V2tnepuDLMdHCJDieFJ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+C4+3wQzdqR+Y+Iz9yj3uDdHbKIc/efDqVyXeG5fR1DPpEq0E8
	JcVtm94sB832Fm4y4t0MkLcA22d/MP9f+tEvAXPbaGrxJutAmc2idEGtZz9GxkH+aPSqdqCFEyc
	+AxIQTrjaV+J7KNBJgw==
X-Received: from dldz10-n1.prod.google.com ([2002:a05:701b:418a:10b0:1b5:9ce:e6d5])
 (user=penghuang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:321:b0:145:287:ce91 with SMTP id a92af1059eb24-1b5568cb6b6mr11510102c88.14.1795312650111;
 Sat, 21 Nov 2026 17:57:30 -0800 (PST)
Date: Sat, 21 Nov 2026 17:57:29 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261122015729.2512645-1-penghuang@google.com>
Subject: [PATCH] sched/pelt: Skip dormant cfs util_sum under scx_switched_all
From: Peng Huang <penghuang@google.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, Tejun Heo <tj@kernel.org>, 
	David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>, linux-kernel@vger.kernel.org, 
	sched-ext@lists.linux.dev, Peng Huang <penghuang@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When scx_switched_all() is enabled, all fair-class tasks move to
sched_ext, scheduler_tick() skips sched_balance_trigger(), and fair_rq
scheduling is bypassed. As a result, rq->cfs.avg.util_sum stops updating
and retains whatever stale load was present prior to switching to SCX.

When a CPU later goes idle, update_idle_rq_clock_pelt() still adds this
dormant rq->cfs.avg.util_sum. If stale cfs.avg.util_sum plus active RT
and DL util_sum reaches divider, update_idle_rq_clock_pelt() treats the
rq as overutilized, continuously increments rq->lost_idle_time, and
stalls rq_clock_pelt(), which in turn freezes RT and DL PELT updates.

Exclude rq->cfs.avg.util_sum in update_idle_rq_clock_pelt() while
scx_switched_all() is active so dormant CFS load cannot stall idle
rq_clock_pelt().

Fixes: f0e1a0643a59 ("sched_ext: Implement BPF extensible scheduler class")
Cc: stable@vger.kernel.org
Signed-off-by: Peng Huang <penghuang@google.com>
---
 kernel/sched/pelt.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/pelt.h b/kernel/sched/pelt.h
index f921302dc40f..6d31e1fbd094 100644
--- a/kernel/sched/pelt.h
+++ b/kernel/sched/pelt.h
@@ -138,7 +138,12 @@ static inline void update_rq_clock_pelt(struct rq *rq, s64 delta)
 static inline void update_idle_rq_clock_pelt(struct rq *rq)
 {
 	u32 divider = ((LOAD_AVG_MAX - 1024) << SCHED_CAPACITY_SHIFT) - LOAD_AVG_MAX;
-	u32 util_sum = rq->cfs.avg.util_sum;
+	/*
+	 * Under scx_switched_all(), CFS PELT is dormant and may stay stale;
+	 * exclude it so idle CPUs do not trip lost_idle_time and freeze RT
+	 * PELT.
+	 */
+	u32 util_sum = scx_switched_all() ? 0 : rq->cfs.avg.util_sum;
 	util_sum += rq->avg_rt.util_sum;
 	util_sum += rq->avg_dl.util_sum;
 
-- 
2.56.1.750.gf70dc682cf-goog

