Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795328483;
	b=LcFAVq6Qse049oUVpvFwYaJynZQ+uO6t1HLuLxSCHDV3rpAijY19IK1IVghHKvlVKJo/
	 dX9MEcRcwllaJRpafsH/KWX6g/VirX1qvyuhAMKAEffNpGFhmt6eCWwpkRgIlRiUmyM04
	 jlMvNAywng7oKikM3Qel4kmGT4qD5scoEpyLAcFu7IZEHtMQgqfHS1DdIFIMoXPPbSYiS
	 lPvoy0/OCj03ZJ+fe8zVPwx3c25GlSoev8MZlreTYpB427qEPs8nK2cqydajuPIFCo1NA
	 Cj2A8vS0UMnKnzC30XkjNU2l6evlw5TY3hUAschZyoYcteYoqSH2wM8bmfYrDD0v48Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795328483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=koc9xJiwfj5fEHnmMrkj9b2J5u5Ubgro9rz3sdyn6XE=;
	b=qAGdBiOJUXtXcjic8v5rM1Rd2IoWRi/38VO7W3ApVP+KuKpKaB3iExpf3AfS49QGxdym
	 lYEqPRqzxoEvo1F22K42MkOc+bZsYUPF/iRm0xz90e2H3MQnW6TuZXQwNpKIHUiZrH2ti
	 hgQR3zxgr0Tt6o2+LX7Lh2YnjF7VgvhjYwNJ1BLdBnZfB6GWA3hwZIUVdb7iCTDdQT+Nv
	 z19UcUco7ydDRpJqh5brOjNzFo+EkYmGDY9DAYadSzCIdqRz0pu8Vwn3JS6NminEexbG7
	 hBBdn0VUSbjpwuV6QF+SGpmnFdauMfvQVDGozAIexpgTKNYlroEb0CHDamy7Oq6l4QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--penghuang.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jOx1Oogr;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209D2606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 06:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 209D2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--penghuang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jOx1Oogr
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-382af5cfc58so6822632eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 22:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795328482; x=1795933282; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=koc9xJiwfj5fEHnmMrkj9b2J5u5Ubgro9rz3sdyn6XE=;
        b=jOx1OogrlSVo+Eo1W38aASuZjqFumTtRENTKX/5Su0zB6Md+lm2lxpfisEmcw096YG
         s+JfrBR/Y5sLEudY+1o3IKdBlEQIEA8mO8DaPNAb393JLU33etRI5Ep0gZQwH1+t6egn
         GTmnpzj4gBg7bUv9yWqVjeO4IS29pWGSkqn8eLuVZoUSMWAqyBjQ3UiiNFtaBuxP6XXF
         8kyE1n0RV75XrWKDh2HiTVRK1Un1JU/QiRSH1TM6hI8IWjJw9Gpnfa9FSznDuy8pSlAV
         bGackJIe2iQw8hmG7zLzIkoKhOhK2JfmksWPXmi0bLGtUnSCwQ/TrcA+Ucl6zHuJsw0z
         heHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795328482; x=1795933282;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=koc9xJiwfj5fEHnmMrkj9b2J5u5Ubgro9rz3sdyn6XE=;
        b=haIBPNPgSC6Z6KVcIMNvwzUuNMiN3QGh7/yn/68cnIU8adJfb7TRLiq0xsA1A/R9eh
         3sknqI/AUpAck+UOwGUtEY6Rd+8V3RzI2M3B6sYmSnSd8peUeYQQZcKEELI/C6Jq2YPY
         BrHSVVSFhNpH+UoigV7t/7ZQ/NOU7X96/+4ff+oIDF1Dc2yHjEq+y22cStId2fIvK773
         BShy6+lUR2ztHn9kSB4hJATL3dgB20PrK5dge/7gvGjXfWnu2DTlqZ+2dRCLibPkzOuY
         evyLBtPDp9FokXamNYPA7FdVCE2x2ED/5Ql3d3jzslxnrfFMuCtYuP/fJxDS2CE4HOkm
         UijA==
X-Forwarded-Encrypted: i=1; AL+hErHrNUa4GTxFVLdN0JnDBqCS9MsR3axcgqqtKXGPfMDZzkDEw2FFTAFhNH67NraK6tWHNDCK3110ZwzoIUk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hs0VzX8mmraUzu41qHflzn9HboUvWW7S1mnB/gxphioUSiq9h
	8Y8VvA8YnDahf9yXMGnOT+lG8pFJJ8WNGv0hUZ60eqk2mnCFZj+bYJuLUcwtHRI7WiiRjCRqIja
	Sb0xy9JwtlbHBfOsNnQ==
X-Received: from dli24.prod.google.com ([2002:a05:7022:298:b0:195:d59a:94bc])
 (user=penghuang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:4593:b0:177:9a5b:a89 with SMTP id a92af1059eb24-1b556906925mr8700359c88.29.1795328481804;
 Sat, 21 Nov 2026 22:21:21 -0800 (PST)
Date: Sat, 21 Nov 2026 22:21:21 -0800
In-Reply-To: <20261122033316.2819845-1-penghuang@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261122033316.2819845-1-penghuang@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261122062121.4172437-1-penghuang@google.com>
Subject: [PATCH v2] sched_ext: Update other_load_avgs on set_next_task_scx and
 idle entry
From: Peng Huang <penghuang@google.com>
To: tj@kernel.org, void@manifault.com, arighi@nvidia.com, changwoo@igalia.com, 
	sched-ext@lists.linux.dev
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, haoluo@google.com, brho@google.com, 
	joshdon@google.com, linux-kernel@vger.kernel.org, penghuang@google.com
Content-Type: text/plain; charset="UTF-8"

When scx_switched_all() is enabled, scheduler_tick() skips
sched_balance_trigger(), so __update_blocked_others() no longer runs to
decay RT, DL, IRQ, and HW pressure load averages. Other-class load
averages then depend on scx_tick() and SCX_RQ_CAN_STOP_TICK transitions
in set_next_task_scx().

If SCX_RQ_CAN_STOP_TICK stays unchanged (e.g., remaining set across an
idle or RT interval on tickless CPUs, or remaining clear on finite-slice
switches before a tick fires), or when an SCX task goes idle after an
RT/DL interval without an intervening tick, stale RT/DL PELT values
can remain elevated when consumers such as effective_cpu_util() or
update_idle_rq_clock_pelt() read them.

Refresh update_other_load_avgs() once at the entry of set_next_task_scx()
(before SNT_REPICK early return and before ops.running() for SNT_PICK /
SNT_NORMAL), and in put_prev_task_scx() when transitioning to the idle
class.

Fixes: 22a920209ab6 ("sched_ext: Implement tickless support")
Cc: stable@vger.kernel.org
Signed-off-by: Peng Huang <penghuang@google.com>
---
Changes in v2:
- Call update_other_load_avgs() once before SNT_REPICK return and before
  ops.running() in set_next_task_scx() so BPF callbacks such as
  scx_bpf_cpuperf_set() see updated PELT values, and cover SNT_REPICK.
- Refresh other-class load_avgs in put_prev_task_scx() when transitioning to
  idle_sched_class before ops.update_idle() and update_idle_rq_clock_pelt().
- Link to v1: https://lore.kernel.org/r/20261122033316.2819845-1-penghuang@google.com
 kernel/sched/ext/ext.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/kernel/sched/ext/ext.c b/kernel/sched/ext/ext.c
index 10de6bd865e8..523f86be4d26 100644
--- a/kernel/sched/ext/ext.c
+++ b/kernel/sched/ext/ext.c
@@ -3579,6 +3579,15 @@ static void set_next_task_scx(struct rq *rq, struct task_struct *p, enum snt_e t
 	if (unlikely(rq->scx.kick_sync_pending) && (type == SNT_PICK || type == SNT_REPICK))
 		queue_balance_callback(rq, &rq->scx.kick_sync_bal_cb, kick_sync_wait_bal_cb);
 
+	/*
+	 * Refresh other-class (RT/DL/IRQ/HW) load averages before ops.running()
+	 * (or returning on SNT_REPICK) so BPF callbacks such as
+	 * scx_bpf_cpuperf_set() observe fresh utilization while CFS PELT is
+	 * dormant. In the future, we might want to add a mechanism to update
+	 * load_avgs periodically on tick-stopped CPUs.
+	 */
+	update_other_load_avgs(rq);
+
 	if (type == SNT_REPICK)
 		return;
 
@@ -3619,10 +3628,6 @@ static void set_next_task_scx(struct rq *rq, struct task_struct *p, enum snt_e t
 	 * @p is getting newly scheduled or got kicked after someone updated its
 	 * slice. Update SCX_RQ_CAN_STOP_TICK to reflect whether the tick can be
 	 * stopped. See scx_can_stop_tick().
-	 *
-	 * Moreover, refresh the load_avgs just when transitioning in and out of
-	 * nohz. In the future, we might want to add a mechanism to update
-	 * load_avgs periodically on tick-stopped CPUs.
 	 */
 	if (can_stop_tick) {
 		if (!(rq->scx.flags & SCX_RQ_CAN_STOP_TICK)) {
@@ -3634,14 +3639,10 @@ static void set_next_task_scx(struct rq *rq, struct task_struct *p, enum snt_e t
 			 */
 			rq->scx.flags |= SCX_RQ_CAN_STOP_TICK;
 			sched_update_tick_dependency(rq);
-
-			update_other_load_avgs(rq);
 		}
 	} else {
-		if (rq->scx.flags & SCX_RQ_CAN_STOP_TICK) {
+		if (rq->scx.flags & SCX_RQ_CAN_STOP_TICK)
 			rq->scx.flags &= ~SCX_RQ_CAN_STOP_TICK;
-			update_other_load_avgs(rq);
-		}
 
 		/*
 		 * @rq still references the outgoing scheduling context. A finite
@@ -3863,6 +3864,14 @@ static void put_prev_task_scx(struct rq *rq, struct task_struct *p,
 	if (next && next->sched_class != &ext_sched_class) {
 		scx_cid_sched_update(rq, NULL);
 		switch_class(rq, next);
+
+		/*
+		 * Refresh other-class load averages before entering idle so
+		 * ops.update_idle() and update_idle_rq_clock_pelt() observe
+		 * decayed RT/DL/IRQ/HW metrics while CFS PELT is dormant.
+		 */
+		if (sched_class_above(&ext_sched_class, next->sched_class))
+			update_other_load_avgs(rq);
 	}
 }
 
-- 
2.56.1.750.gf70dc682cf-goog

