Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795768557;
	b=X+dJTiby/u3Rc1ZOodK/NPlRi3/QhpygKFgV1UA8DZ2LVtEp2XS50HSWyE0ETzgg1zHs
	 wAVrtVYRMY4KsB6Ii5Xi/YTx+7Qj4Bc/n27NsS85o8sOGIP0HBQ8u+cx+MesKOXCQwoiA
	 QNMgKM+x3NcoreOqlFPkDyTTSNurMclTxxQs0VKR4gGAZB/uwp97oWpt6Djr6V/vYjIyU
	 vSchK/bUCFHJSZrH1N2eplDv89y5qAHsDQ3wvccgOBYmpSlyDZ4jLMrbwh2La/69sEYrJ
	 ObPFLwa9aVQ3GHJvLyJnPZEMuj9IrN5KLqi+N18keqWK38AKTwoz1xOptP0C4miC8Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795768557;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t+FMbBbUNar14Wtiwe+DEqu9rMcI2SZMnu83nzRrsBc=;
	b=L2gz2db5H39EPfFb38qx7XmFLKjNK5KgQAjWmUBHSfSDGpSgijEtCKr8ur4RnN945IEO
	 POzidqMoTk8yZFoi+xHz3X1lM3ut0TeoVZhgkfeWY1Hq33kqf49saE9sKvGLMRMHTrNCE
	 ryd8l4DwBHMnUFzDiS2pZBUf475WLHfR6xHnkhGB4TU2vCxmKpV+4np74MHFdpsNJcfM0
	 LPP148Hvaw92Cg5yBQLPUSDGGdisLOofmPIJaSqm6L9TPHbIdWO2bNHISi8gsJZ7zwZmA
	 xz0FexUSuKtWWfpifh8YNMxeJBm+jND2k4AxcdEpldKb2K1rOCB8Na7m8LB0N4ovJOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=c6YVJZfk;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 671D0606A6A0
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 671D0606A6A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=c6YVJZfk
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E64E01E4D;
	Fri, 27 Nov 2026 00:35:53 -0800 (PST)
Received: from e127648.arm.com (unknown [10.57.70.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 292CD3F86C;
	Fri, 27 Nov 2026 00:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795768556; bh=pYQ0Gm9oagsTC1qc0ysTh2G9JxgFk+JBzVlSW4pWpws=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c6YVJZfkOt5mnBFjT2g8yOllgkWB6/VfQ1gabsvrvPhCDgKNx9f5dyv0FBZs7BBlb
	 cfzxQTUlC6ri4NPfaP2OqQKyAICjjmmv2RzLDK0iZUzeveWgxyf5jT8OWUJ+SU0fDl
	 /GBUIjN430pBXD/THbNPSZnwzHofFSB+ytxuArBI=
From: Christian Loehle <christian.loehle@arm.com>
To: mingo@kernel.org,
	peterz@infradead.org,
	vincent.guittot@linaro.org
Cc: qyousef@layalina.io,
	christian.loehle@arm.com,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	jstultz@google.com,
	kayracizmeci@gmail.com,
	wvw@google.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] sched/uclamp: Use wrappers instead of open coding UCLAMP_FLAG_IDLE
Date: Fri, 27 Nov 2026 08:35:42 +0000
Message-Id: <20261127083542.3172843-3-christian.loehle@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261127083542.3172843-1-christian.loehle@arm.com>
References: <20261127083542.3172843-1-christian.loehle@arm.com>
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

From: Qais Yousef <qyousef@layalina.io>

We already have uclamp_rq_is_idle(), but it wasn't used everywhere.
Replace open coding with the function and add new wrapper to set and
clear the flag which enhances readability.

Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>
Signed-off-by: Qais Yousef <qyousef@layalina.io>
Signed-off-by: Christian Loehle <christian.loehle@arm.com>
---
 kernel/sched/core.c  | 14 +++++++-------
 kernel/sched/sched.h | 10 ++++++++++
 2 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 05b092147c6f..8c4cd507eca9 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -1644,7 +1644,7 @@ uclamp_idle_value(struct rq *rq, enum uclamp_id clamp_id,
 	 * max-clamp.
 	 */
 	if (clamp_id == UCLAMP_MAX) {
-		rq->uclamp_flags |= UCLAMP_FLAG_IDLE;
+		uclamp_rq_set_idle(rq);
 		return clamp_value;
 	}
 
@@ -1655,7 +1655,7 @@ static inline void uclamp_idle_reset(struct rq *rq, enum uclamp_id clamp_id,
 				     unsigned int clamp_value)
 {
 	/* Reset max-clamp retention only on idle exit */
-	if (!(rq->uclamp_flags & UCLAMP_FLAG_IDLE))
+	if (!uclamp_rq_is_idle(rq))
 		return;
 
 	uclamp_rq_set(rq, clamp_id, clamp_value);
@@ -1908,8 +1908,8 @@ static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p, int flags
 		uclamp_rq_inc_id(rq, p, clamp_id);
 
 	/* Reset clamp idle holding when there is one RUNNABLE task */
-	if (rq->uclamp_flags & UCLAMP_FLAG_IDLE)
-		rq->uclamp_flags &= ~UCLAMP_FLAG_IDLE;
+	if (uclamp_rq_is_idle(rq))
+		uclamp_rq_clear_idle(rq);
 }
 
 static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p)
@@ -1948,8 +1948,8 @@ static inline void uclamp_rq_reinc_id(struct rq *rq, struct task_struct *p,
 	 * Make sure to clear the idle flag if we've transiently reached 0
 	 * active tasks on rq.
 	 */
-	if (clamp_id == UCLAMP_MAX && (rq->uclamp_flags & UCLAMP_FLAG_IDLE))
-		rq->uclamp_flags &= ~UCLAMP_FLAG_IDLE;
+	if (clamp_id == UCLAMP_MAX && uclamp_rq_is_idle(rq))
+		uclamp_rq_clear_idle(rq);
 }
 
 static inline void
@@ -2140,7 +2140,7 @@ static void __init init_uclamp_rq(struct rq *rq)
 		};
 	}
 
-	rq->uclamp_flags = UCLAMP_FLAG_IDLE;
+	uclamp_rq_set_idle(rq);
 }
 
 static void __init init_uclamp(void)
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 804c70317637..982d47fbe9b7 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -3799,6 +3799,16 @@ static inline void uclamp_rq_set(struct rq *rq, enum uclamp_id clamp_id,
 	WRITE_ONCE(rq->uclamp[clamp_id].value, value);
 }
 
+static inline void uclamp_rq_set_idle(struct rq *rq)
+{
+	rq->uclamp_flags |= UCLAMP_FLAG_IDLE;
+}
+
+static inline void uclamp_rq_clear_idle(struct rq *rq)
+{
+	rq->uclamp_flags &= ~UCLAMP_FLAG_IDLE;
+}
+
 static inline bool uclamp_rq_is_idle(struct rq *rq)
 {
 	return rq->uclamp_flags & UCLAMP_FLAG_IDLE;
-- 
2.34.1

