Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645683;
	b=Muep4SHiUH0AO1e//+RCBxJy2FjIcrgtrly7dfshF3epa+rKCthXYQfWVY1NuD6ygJ/4
	 RcxjHT9lhLjy09GHDGB0PcONGOAos6gd22UqknfevcXTxG6Lxxfxxwkk6teamjRAUQWko
	 y1Vq1xkG6qh6MqGDbNkdoVf95AbrsT/X1Gf/Ln8HL354uFG4N8C1KMPjvgAFIL2+k0mPj
	 Sz387OE8MSbvrEi8Zsz2+ApZ04eRPOTYwB+blB3q5Rr2LyVF2qXdkXg4+YXeB5ASflcWF
	 TTwpIyT6FP9WAJ3H7ei3jHrxk32JUL6ztJfHNExnsMd4QPfYArNd/svOcZ5vYcnobWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645683;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=pGLqG+R6IwEUEhnoQECM2DID9vMzArkmStKfaJkmTj8=;
	b=JKiucs5AYrY+yYD1sUf2I9Lwp+u5IQZZ25hGxiaHgz6vTVbBgck0ZIxMWiPdu+UtPQLz
	 5TCrzOY2zf8/UOIyzzu6r+nHYl0D/5FkMgkcV6A2iiejEI25w9SQLgYxNgiRtAPI3pY6B
	 6m65qQPSL31XKEcGw9m9jIePdL6qabygwASqs4QVul0WK15Ei81jFj+cLOsossSoO9mH7
	 jy0mOBCaEkxR+pxD6Zvo7ci/0/uzDIZlcfrn5UWkUoxCB21F0kO/ywKS1cGmnj7+KqLtJ
	 O5eLJFL8/bpdZ8DyHZCc6lKQ8Lq11fc2JzOEdhzg7N+DO+gu9J1WJClzx3dXgi3l4NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SosT4sDy;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61B7606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:28:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D61B7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SosT4sDy
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386b8624cf7so2680458eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645682; x=1796250482; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pGLqG+R6IwEUEhnoQECM2DID9vMzArkmStKfaJkmTj8=;
        b=SosT4sDyOt1HfjO6iaoT9gFbof7lS4I0lDR/WMLwVLNXoMEUNWzr1RqwPhy/Gmg8ix
         JuO5Z1Vn9bdOjy3JC8MG5wrhutcdkluIoQIRLKMZRiL+lE2GicNLMdO6GI/NcwI+QuZp
         hQpe6p5WecbT3WD88rI4bNQKj/25IJ/L3WBvNRCkLth6AmHRSCPOON2wpo3guxIuhIKh
         dsIjkubS3h40Kpo3ByKH/romcRHVGIaMuPLWsVvJXIGalng8DwbDB4irCWhYzEJl+jvC
         Pheibqk2YNNRkxObn5ZvGep4EMV/1jQXjPcdP0q0TE7IEA4uwvHMXFkr79unESX7mtdn
         wpEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645682; x=1796250482;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pGLqG+R6IwEUEhnoQECM2DID9vMzArkmStKfaJkmTj8=;
        b=JU6LKvIB4IeVIgI/sNdxVIIWLqYqeYSTSBZGk9kb35+B8p9u22y1DuyMOLmZ/MHD/h
         zW0HaGhj/HqSSKFiLwSyBODwl/1TkiOBj2sfhRvVIX8xFm04RCkgCi/Ivv0RahnYjHHV
         7TzWr/M6t2IkW5aEAZzhWkswon/3lqisPVJEKSQHZ3YhyvuKBHeisOmytTw7ysgPk4zU
         hcEl+lldqlPjV9Bp0MYCvjlS0iyy6UTC5ur8EEEj4oIOuqGmTisjTbpvujByxk/PIdfE
         8ruQ1FNmxDFx0ik9ar8kwwx3pi7xGT91iuhGX9FEabnbIJLvHyjNiM44PcedsY70Ds+4
         PICA==
X-Forwarded-Encrypted: i=1; AL+hErEuhqhU4X4qDpUgnf/YlOvsvKN26pQg7n/GpLNe3Ui19k/h0uVVCJWYurO3jacR+/p9ukTvF3eSOCRblnA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8RThIoUdEmoZuAZxxSI2odbTGxupKnby14tbMRfmKWFvuK+c5f
	8k2KN0YCON6inn3gEF3kCvf181CQh1KYjoQPkABWQ6lJqq/dWrWYrX85JWo1uok7Dy4P567RWdz
	1Lg==
X-Received: from dycmv2.prod.google.com ([2002:a05:693c:2802:b0:386:b5d2:c426])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:dc3:b0:386:ce5a:41aa
 with SMTP id 5a478bee46e88-386ce5a47f9mr3340721eec.13.1795645681576; Wed, 25
 Nov 2026 14:28:01 -0800 (PST)
Date: Wed, 25 Nov 2026 22:27:29 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125222729.1450842-1-elkin@google.com>
Subject: [PATCH] sched/core: Avoid atomic cpuset_lock() in __sched_setscheduler()
From: Elkin Cruz <elkin@google.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, irogers@google.com, 
	Elkin Cruz <elkin@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When Magic SysRq-N invokes normalize_rt_tasks(), it holds
read_lock(&tasklist_lock) in atomic context and calls
__sched_setscheduler(p, &attr, false, false) with pi == false to reset
real-time and deadline tasks to SCHED_NORMAL.

For a SCHED_DEADLINE task, dl_policy(p->policy) is true, so
__sched_setscheduler() calls cpuset_lock() (mutex_lock(&cpuset_mutex))
while in atomic context under tasklist_lock and then skips
cpuset_unlock() on exit because unlocking is gated on if (pi), leaving
cpuset_mutex permanently locked.

Guard cpuset_lock() with pi (matching the non-atomic caller contract,
where switched_from_dl() releases deadline utilization under rq/dl_bw
spinlocks) and call cpuset_unlock() on exit whenever cpuset_locked is
set.

Fixes: 111cd11bbc54 ("sched/cpuset: Bring back cpuset_mutex")
Signed-off-by: Elkin Cruz <elkin@google.com>
Cc: stable@vger.kernel.org
---

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

 kernel/sched/syscalls.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
index a5ff3c47e9ea..f44fc426404c 100644
--- a/kernel/sched/syscalls.c
+++ b/kernel/sched/syscalls.c
@@ -575,7 +575,7 @@ int __sched_setscheduler(struct task_struct *p,
 	 * SCHED_DEADLINE bandwidth accounting relies on stable cpusets
 	 * information.
 	 */
-	if (dl_policy(policy) || dl_policy(p->policy)) {
+	if (pi && (dl_policy(policy) || dl_policy(p->policy))) {
 		cpuset_locked = true;
 		cpuset_lock();
 	}
@@ -724,11 +724,11 @@ int __sched_setscheduler(struct task_struct *p,
 	head = splice_balance_callbacks(rq);
 	task_rq_unlock(rq, p, &rf);
 
-	if (pi) {
-		if (cpuset_locked)
-			cpuset_unlock();
+	if (cpuset_locked)
+		cpuset_unlock();
+
+	if (pi)
 		rt_mutex_adjust_pi(p);
-	}
 
 	/* Run balance callbacks after we've adjusted the PI chain: */
 	balance_callbacks(rq, head);
-- 
2.56.1.839.g22a8290db9-goog

