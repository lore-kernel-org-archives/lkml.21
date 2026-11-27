Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795767493;
	b=huqNnU1a6dLAhHnXtWm6P19wRrYmHgZOrDPNr+OcFhZCxXu2KqXRzyXy+6e+gIvaoujo
	 bWI+IZRs3YjI00u3S0fI0Pd1S5YDYWSB6Wu1pLv1G/bEapEs0JmwcikA0dbX/O8EmRbxx
	 JORHtUVRvQM7PpdISnkq6uSwZ3U/h1FNfdJT330KIU80ibC35ZIEf1fa9RJHGk2KNmoJB
	 FlBxxZ+M88wBPzNj52ZLtueJdE2qAHBkbvjNz9YyTrsE6uZpWCNRAQoc2OU29Va1skhdk
	 vSrzb8sTdutTDHvnZpnp7pz8kP8YosnXsImrIKCZMclac1KlpSz5XTBuppManqVqbdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795767493;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=t+FMbBbUNar14Wtiwe+DEqu9rMcI2SZMnu83nzRrsBc=;
	b=ZLkfar4hGcgwDdYgRlW+kfv35QikkiSt2M0Y1Wox12JYm3S9rBd72AavzvnSJsIvNOUH
	 u2TL2nQZDyyVXvGMHgCxyr3tT6n4ohymmRzCNNHLmPNrv2Y/VTt8UmEOysDYhJgXkjdpR
	 udcVOJyYEuqbAyTo1rfy6CUFbI1Cqa9TiC4+RcSjcFLbTS0Zt7sTnTTgqctDLiLzlf7I0
	 CoRPYeOnL2OgEAV03oytMLbu2YD/w0qWknIAWW40heOM6dIO8+hGp6AHyAZjFH8eZtxlv
	 8e4OtZcoRYK1xn9MCSk6redrq3sCJuaZE8FEPTtfju7D99W8mPtBBzcbRcXxqwW/OSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=fd6eRjYA;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE22E606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:18:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE22E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=fd6eRjYA
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 756D01DB5;
	Fri, 27 Nov 2026 00:18:09 -0800 (PST)
Received: from e127648.arm.com (unknown [10.57.70.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B213A3F959;
	Fri, 27 Nov 2026 00:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795767492; bh=pYQ0Gm9oagsTC1qc0ysTh2G9JxgFk+JBzVlSW4pWpws=;
	h=From:To:Cc:Subject:Date:From;
	b=fd6eRjYAevW9d++/0tmDdmRf3xpJpMGCb6PU/matsWFNJ02e2IaBFeU2omDmmc8uP
	 pnAPHWXXLwu1afvqrFw58Nl59YKv7NlHFr+5GAfrGPZUxq//xgDg5KflKX9HmK/Sqh
	 GSg5dZJjyCel4M1CDhoEY59zwVp7Qih9GLSVNF0Q=
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
Date: Fri, 27 Nov 2026 08:16:55 +0000
Message-Id: <20261127081655.3159258-3-christian.loehle@arm.com>
X-Mailer: git-send-email 2.34.1
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

