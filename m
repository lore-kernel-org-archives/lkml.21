Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795728814;
	b=DozM0FM15Vj1XkOk9t0etN61ySooDjfhDZ+VSHNKlUId7l2kAUxixntDSxfsCsq5UOZu
	 /qRHKAvVRm89nwa5dTk7Sjx2vx62VD3uCGDD2cAkQoVLUA0cmXvicrvGHSj33ngVZbSvc
	 MTkKLnzKAghZyfKk7/iUWDO2QQyx4MB1IUfdtd8AKmb3V2al0NgBeuGIrUibeXyn/r0rv
	 kQoYCqYDKh5mV0eSz0WSILM21egBSdmMk2+EDeY16VUTXNiIY/clIEyw3chexsvn1XKr9
	 4YXnOJnT8r8Hz5nQUD5nLxOMb2lqn/roTlY0QplqQnUrANn+92n9wueMs6+3wYYs6Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795728814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=TJRJZjUyvgZocQAnVjrGig3CO3gFOqtMC5DjldN85x0=;
	b=31TsD0gGz4eLIzLWZZkzLInu8RW3+JpPIyc5yAUhLryLCrbMey4TJrr1RNq2pTV1oNNU
	 5tlRgMtd8FOspsUmfPNrZi7XlfISNip8dTSyzca92kG/CbA1FhfEwhuLRpUs103S2koQJ
	 XSJq5zfCBc/aZA0+ocP8GeysUKWt8+6t6oeebx/r3Nk132D7PUEXP+Vw6hONe+lDSA5x1
	 tYdY7RzM/SKwznmtJNPTBK0FHAJIf/4YjTZ0FlhqeOJQBvn210jzExt8n0E56EQwCJFai
	 ji0YqQyFvqvyJen1HosQHv1yYuM6AZsLt2652WBBqMLDiJBrqL1ctK2tswck/BOSoAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AmwS2ww0;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C77606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:33:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6C77606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AmwS2ww0
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4bb818d8dcfso37079535e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795728812; x=1796333612; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TJRJZjUyvgZocQAnVjrGig3CO3gFOqtMC5DjldN85x0=;
        b=AmwS2ww0v2ixeRsD2r6WrIMSJ/r5hw1fafWxvy9x/vPpYhwLTXctHroncJBqg8FYZ+
         ob4vp1tATjrz730RVHd9qJ4PTWKvkct0UnHCyOV4SqCDWytbIeBJHKbcVs/mqGG7Z3q3
         SXKyieUMqk2PDTCE8BXDLQAronm8hKM4LVSeCltr+1O5+l0RSO4DjN+n9BdfmY85+8yG
         jFJXfLqAhFnNlD129KkLaqyABukfzdnZAguZVKyhTtZc+k9aZhZkCMbqWf3nj0UKcuaZ
         OteYyUcsX17n4ZSbvt9qL+aajGRhBNgtAJRLY2CmV9+Vq4FciEI5+LguQ+H3eEhFqf/x
         4nUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795728812; x=1796333612;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TJRJZjUyvgZocQAnVjrGig3CO3gFOqtMC5DjldN85x0=;
        b=Xl/TyL25WbIaeVcxdGtw2f/s/fDRsPMU09u4v4JupGMa+8H3k1yd0w7ziuk3uqi5Y/
         5QhsqwKRqBadxJ8/CYT0svVu2JHGUKvZ9t+/AM4r2233vSAmn/xtYig57MCWDVemgI+Z
         y1aUUplHfArON0prFh/DKfU9/lEG8gup6ohWG/tZTo1YvqEYwERvcNEJKc2y5sqbeVJk
         T/wUyjZG3SZ8AY7YFDtfLoUcmW2VA4elVso//uWLYxx9140t3WhN0pY0ekKkgMHZKpA9
         /wlRvmjepYOnSGssf5vMq5XDNw/Ap048o3nEBRKa092cY1/ynavZ4aKJBuGf0C+ocFZK
         SM+g==
X-Forwarded-Encrypted: i=1; AL+hErE4BeAkizxgx51L74e8yPRRS5tp7aE4Vhm/Jc0do0c2GJnHzlMotiXPn7pE3joJ+fkGO+OmlhRp1UygFno=@vger.kernel.org
X-Gm-Message-State: APuU4Z80CqGTkB/sYLyXrfCdOYDTLM8iVt/OGdSBOLvX/Jog/WACNsl8
	Wiv0Q8kYkkueqnCpeqjB/wfqOF+JEq3dgBBwT5LMYkKWXb5ilmlybd+q+DL1XSaFPpJWuKQ+9or
	NFcDozg6kIKF89g==
X-Received: from wmsd6.prod.google.com ([2002:a05:600c:3ac6:b0:4a1:fdd5:9c10])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e0b:b0:4bb:6f45:2a79 with SMTP id 5b1f17b1804b1-4bb88817920mr480195685e9.22.1795728812035;
 Thu, 26 Nov 2026 13:33:32 -0800 (PST)
Date: Thu, 26 Nov 2026 21:33:29 +0000
In-Reply-To: <20261126213212.3930589-1-jpiecuch@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261126213212.3930589-1-jpiecuch@google.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261126213212.3930589-2-jpiecuch@google.com>
Subject: [PATCH 1/2] sched_ext: Enforce SCX_CAP_BASE in core-sched task selection
From: Kuba Piecuch <jpiecuch@google.com>
To: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>
Cc: Kuba Piecuch <jpiecuch@google.com>, sched-ext@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Under CONFIG_EXT_SUB_SCHED, a sub-scheduler is only allowed to run tasks
on CPUs where it holds SCX_CAP_BASE (apart from migration-disabled tasks
and a task admitted as rq->scx.rescue.curr). The sched_ext dispatch path
enforces this via scx_task_can_stay_on_cpu() and scx_rescuee().

However, ext_sched_class leaves .task_is_throttled NULL. Under
CONFIG_SCHED_CORE, pick_next_task() calls sched_core_find() on sibling
runqueues and sched_core_balance() calls try_steal_cookie() across CPUs,
both of which select directly from rq->core_tree and rely on
sched_task_is_throttled() to filter ineligible tasks before bypassing
pick_task_scx(). With .task_is_throttled unset, a sub-scheduler task
sharing a core-scheduling cookie with a sibling can be picked by
sched_core_find() or stolen by try_steal_cookie() onto a CPU where its
sub-scheduler lacks SCX_CAP_BASE, running without ops.dispatch() and
bypassing sub-scheduler CPU isolation.

Implement task_is_throttled_scx() under CONFIG_SCHED_CORE, returning true
when !scx_task_can_stay_on_cpu(rq, p) && p != scx_rescuee(rq), and wire
it to ext_sched_class.task_is_throttled. Both callers hold cpu_rq(cpu)'s
lock, and scx_task_can_stay_on_cpu() already fast-paths !scx_has_subs()
(and CONFIG_EXT_SUB_SCHED=n), allows local migration-disabled tasks, and
resolves bypass via scx_exec_sched().

Fixes: 46a85ae6fe5b ("sched_ext: Tie cpu occupancy to SCX_CAP_BASE through the task slice")
Cc: stable@vger.kernel.org # v7.3+
Signed-off-by: Kuba Piecuch <jpiecuch@google.com>
---
 kernel/sched/ext/ext.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/kernel/sched/ext/ext.c b/kernel/sched/ext/ext.c
index 3a69100e47f7..a4a93ed97f7b 100644
--- a/kernel/sched/ext/ext.c
+++ b/kernel/sched/ext/ext.c
@@ -4261,6 +4261,13 @@ bool scx_prio_less(const struct task_struct *a, const struct task_struct *b,
 
 	return time_after(a->scx.runnable_at, b->scx.runnable_at);
 }
+
+static int task_is_throttled_scx(struct task_struct *p, int cpu)
+{
+	struct rq *rq = cpu_rq(cpu);
+
+	return !scx_task_can_stay_on_cpu(rq, p) && p != scx_rescuee(rq);
+}
 #endif	/* CONFIG_SCHED_CORE */
 
 static int select_task_rq_scx(struct task_struct *p, int prev_cpu, int wake_flags)
@@ -5959,6 +5966,10 @@ DEFINE_SCHED_CLASS(ext) = {
 
 	.update_curr		= update_curr_scx,
 
+#ifdef CONFIG_SCHED_CORE
+	.task_is_throttled	= task_is_throttled_scx,
+#endif
+
 #ifdef CONFIG_UCLAMP_TASK
 	.uclamp_enabled		= 1,
 #endif
-- 
2.56.1.839.g22a8290db9-goog

