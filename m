Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454286;
	b=KrT9OFiMEc/sry8MHwoXUb+GVzwKJEtmLdAWjNaBZMX/RC0U1TfAQi4mKHiqLW6TPimc
	 aN3kjCft1i8TfhemDGXvftQk+Wsw8jghoTcjdPb+SHuUaIyHxByU2UjRCMvOzk3aU9k8X
	 KHWos5jhgxoY6Fn5P8chtaRnpfTmuVgeecYjmq3LJEXXxjlYSz/KGaAPYX4fUQzvVOTH+
	 mzF/c6Q6rvqlqimbt6yG1suzq+J9PVwWCmX1pMT7BV1Hsx+K+yTY6Esw2nx7c/JTkFNau
	 BfkaBOcCrET///HsDbuY2avwKGYPVbXEAeRyoq7zJ3uH1J6YX5vkN/jrpkISkeTMrTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=DhavAmcGgx7rmczz3jLQXngN/KVyd2Bv9UK1AdUvPrs=;
	b=15Uzwh7QfwBmZPG6g/+L10w6HLKW+imrgHAVdhIqA7ZT+Vy7/unGZ9SEHC7hAKQvh8xS
	 1F3J2HE5XHpYFVvCnBLCJTpqrDkAFppYpbzT1V7jiEFI9IG1lS4i3w+SY2qyTKPZD3yOS
	 KyNB5yRJ45veJK83icsCSsOopaCqlpwoEYHJXZbbGoIoeKzNwhdUf2ve/4BWl4tI+wKa4
	 1JwQKXSoFU9+1ADFT9Ob+Dxg+BWsc573oJ1ibsUiWmcAhISisGa9Ok550WtdT2lirVjdc
	 ArxcvNkXL/FX9UCURxvMz/KGKUKiz/jf9g+f25ipqXN+5SmRevx7g7q07LODNchdjlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AsROLtZC;
	arc=none smtp.remote-ip=209.85.218.72
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3D0606A32D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:18:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C3D0606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AsROLtZC
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c514c051a65so329890866b.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795454285; x=1796059085; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DhavAmcGgx7rmczz3jLQXngN/KVyd2Bv9UK1AdUvPrs=;
        b=AsROLtZCDhf1F3+wF8zHCl/3AthYjzDybDMXcJVMCTx7QR3rerGPBuoJYbzJKkYR1E
         EJs5mddLt8Ga6I9ur/1PFwtqIXPu03hZWNV5OKbjTThQRCD876YbQ8OeetWu8yhdK5xQ
         FczLY83OLmxY8YkQnMSLcCxuxP1ipehaPvAsaIK9n3yCtFQuV6bOjcW6FjPctnTKVs70
         0Hdc4B7Jxjgm5ozX74s4CTkIx16UzO3xCChMqY8516RtfLT3TCdnWEISruq6Qz3peQrH
         mAtgY6BDQxMd/fcHi3IXFuujXVKM1HBDNgJofholljENJYeZrXxJw4YDMM8lm80VVeCb
         bDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795454285; x=1796059085;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DhavAmcGgx7rmczz3jLQXngN/KVyd2Bv9UK1AdUvPrs=;
        b=hfFwtulsankNUjE0A4Yov7pM9EQMpgKaSSnJ1HYBcPQx5Ew2TCFwRjFqZUCVU76Vvq
         ujB5YYm8CfIBUbNB4kalkIi0I1JfJ9FA64rIuQvKmfE2dChzwE1e2Ve5aO1x+eC491D6
         bcNXjxFjtg+S6NBtWTZop/vMUh5rfrOMEVNOP0hVx1bsVy2e1XwsXUBBGP7xI9CAjKXN
         30Gtp/MsN3TRNLMORQCdam2T//DTIcMVcihV3NEP/kdf/pqXdpWviqRs3TXt9rsc7Hos
         VlXgH6dLHddimPZSqB9kqiprW03f25QZ2D+dgzr5KYLKl5GW4GCSYRkhRqjeOG7Ej8ED
         oewA==
X-Forwarded-Encrypted: i=1; AL+hErGGuxaDurVq0jB8w4FjXEsr430Ag3BhVtmM1L81PZaWGvjhWkGyl8CEZ0X3VHfJvm7LtPQ/EY5A8savmn0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ul8XGKIs592yItLpItEFfzIvoKZ6O/iDUoTPcqTsgJdFr4vzF
	vk7H7qrKNXCBzuv3SkXLdyPWnz7b2aTvnkvfVZrX5DTo6Khfw/ZH2gGa726F6CRRi/kzajKfjuE
	lSQzIJ6Xn1TcfRA==
X-Received: from ejcmy38.prod.google.com ([2002:a17:906:5a66:b0:c51:1899:3ad0])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:d01:b0:c51:8d3d:eef with SMTP id a640c23a62f3a-c518d3d16a1mr53924366b.12.1795454284661;
 Mon, 23 Nov 2026 09:18:04 -0800 (PST)
Date: Mon, 23 Nov 2026 17:18:01 +0000
In-Reply-To: <20261123171637.3859594-1-jpiecuch@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261123171637.3859594-1-jpiecuch@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261123171637.3859594-2-jpiecuch@google.com>
Subject: [PATCH RESEND v2 1/2] sched/core: Preserve WF_RQ_SELECTED across
 queued wakeups
From: Kuba Piecuch <jpiecuch@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Tejun Heo <tj@kernel.org>
Cc: Kuba Piecuch <jpiecuch@google.com>, David Vernet <void@manifault.com>, 
	Andrea Righi <arighi@nvidia.com>, Changwoo Min <changwoo@igalia.com>, sched-ext@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

ENQUEUE_RQ_SELECTED tells a sched_class that ->select_task_rq() was
called for a task wakeup. sched_ext exposes this flag to BPF schedulers
as SCX_ENQ_CPU_SELECTED.

When a BPF scheduler sets SCX_OPS_ALLOW_QUEUED_WAKEUP, a wakeup can be
delivered through the ttwu wakelist in two ways:

 1) from the p->on_cpu path, before ->select_task_rq() is called. In this
    case WF_RQ_SELECTED is not set and SCX_ENQ_CPU_SELECTED is correctly
    clear;

 2) from ttwu_queue(), after ->select_task_rq() has been called. In this
    case WF_RQ_SELECTED is set in wake_flags, but sched_ttwu_pending()
    only carries WF_MIGRATED across the wakelist, so the flag is dropped
    and ops.enqueue() is wrongly told that ops.select_cpu() was skipped.
    This also results in undercounting SCX_EV_SELECT_CPU_FALLBACK events.

Fix case 2 by preserving WF_RQ_SELECTED across the wakelist in the same
way WF_MIGRATED is, so that ttwu_do_activate() passes
ENQUEUE_RQ_SELECTED to activate_task(). Case 1 is unaffected.

Fixes: 3539c6411a7c ("sched_ext: Implement SCX_OPS_ALLOW_QUEUED_WAKEUP")
Acked-by: Tejun Heo <tj@kernel.org>
Reviewed-by: Andrea Righi <arighi@nvidia.com>
Signed-off-by: Kuba Piecuch <jpiecuch@google.com>
---
 include/linux/sched.h |  6 ++++--
 kernel/sched/core.c   | 10 +++++++++-
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index e4f6323d7855..34dbcb81f2fd 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1008,7 +1008,7 @@ struct task_struct {
 	/* Unserialized, strictly 'current' */
 
 	/*
-	 * This field must not be in the scheduler word above due to wakelist
+	 * These fields must not be in the scheduler word above due to wakelist
 	 * queueing no longer being serialized by p->on_cpu. However:
 	 *
 	 * p->XXX = X;			ttwu()
@@ -1018,9 +1018,11 @@ struct task_struct {
 	 *     p->on_rq = 0;			p->sched_remote_wakeup = Y;
 	 *
 	 * guarantees all stores of 'current' are visible before
-	 * ->sched_remote_wakeup gets used, so it can be in this word.
+	 * ->sched_remote_wakeup and ->sched_rq_selected get used, so they can
+	 * be in this word.
 	 */
 	unsigned			sched_remote_wakeup:1;
+	unsigned			sched_rq_selected:1;
 #ifdef CONFIG_RT_MUTEXES
 	unsigned			sched_rt_mutex:1;
 #endif
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index c9890ed35df7..a36c5e951aae 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4000,13 +4000,20 @@ void sched_ttwu_pending(void *arg)
 	update_rq_clock(rq);
 
 	llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
+		int wake_flags = 0;
+
 		if (WARN_ON_ONCE(p->on_cpu))
 			smp_cond_load_acquire(&p->on_cpu, !VAL);
 
 		if (WARN_ON_ONCE(task_cpu(p) != cpu_of(rq)))
 			set_task_cpu(p, cpu_of(rq));
 
-		ttwu_do_activate(rq, p, p->sched_remote_wakeup ? WF_MIGRATED : 0, &rf);
+		if (p->sched_remote_wakeup)
+			wake_flags |= WF_MIGRATED;
+		if (p->sched_rq_selected)
+			wake_flags |= WF_RQ_SELECTED;
+
+		ttwu_do_activate(rq, p, wake_flags, &rf);
 	}
 
 	/*
@@ -4050,6 +4057,7 @@ static void __ttwu_queue_wakelist(struct task_struct *p, int cpu, int wake_flags
 	struct rq *rq = cpu_rq(cpu);
 
 	p->sched_remote_wakeup = !!(wake_flags & WF_MIGRATED);
+	p->sched_rq_selected = !!(wake_flags & WF_RQ_SELECTED);
 
 	WRITE_ONCE(rq->ttwu_pending, 1);
 #ifdef CONFIG_SMP
-- 
2.56.1.750.gf70dc682cf-goog

