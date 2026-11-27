Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778012;
	b=WtuQpmDrEzDc/plKrUPM8lm24Hztu4oyHi7SH7XsZJuLshTSYdgvNyyHsye+mdTvY8wZ
	 RcTW4KAtLtIylaPKv/IvouDpE1n6y3rgjwQLPc76DNBdCuVwUAkEykgMe4Uz/UxBaSz2f
	 HGWr4jkwR3EFHU/ZXhN08JjTlNgZUBvsxlMKZeO/2lQ9skBGzKwsNeyeRM8Q+/vzWWVos
	 CZo35HrGd9ctHGlavcn9LFiT8i0vVvCKFTkoEgD/1U0kqRAP/SqFlTPDOzMxgwd84lqqX
	 aed+wqTHvTPf3UDN5/WmlTv/7Q0I1PnQ1V/tOqoOali8jYj5Fwqk8sYlodTOBG2juWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778012;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Q+bXeg3g3XvQELlK6HjrXJa/eHS5Jx/omC0tOE8MMNI=;
	b=Ri0aTsKJaGW5jLuK0srmuWuo/LX4AToDV+0xXKmayX9bvJfEy3IuG4KmqExxKFswN0Fh
	 1KqEvQ2MLTVSJ713fLGMyWdRmhlbkF6kLz/DExXTzM/DM36qpPnw5GpfzHzxKtSsMmtDy
	 BoPPZG0w2aBitTkNpeBLg4slyPDBENBGIrJRaiSnY5AFuKeHgZopIOiye0YE1BXfelt65
	 LZ5DChw2Ro9hTEpsSIAqlCfmo5AGX++RS0KR10FAZoouMPBaxerWqGzA6ArsEwDTZN0fJ
	 kVZcgXm2mF2Q0/vM5aj7o24ocTHBGQc7WiGjdvWDP1BYHYNeBbfDm4Bq9Erefie8Lmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=OHUF41cL;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E72F0606A33F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:13:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E72F0606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=OHUF41cL
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75EBB1D31;
	Fri, 27 Nov 2026 03:13:28 -0800 (PST)
Received: from e127648.arm.com (unknown [10.57.70.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 031AC3F632;
	Fri, 27 Nov 2026 03:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795778011; bh=c18cfWZQwKIJuiGWhzoDKxykJrUkPZ7JnHmkxk1A0So=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OHUF41cLTNEbOJt3/WXXf4Zfs4m0MLeRMJYKrH9ZFavGGYLUUQJriLF6r3G+jCAIz
	 YXqv8yIgonSy0KWTCZB4flstW+sIDZVTn5mYMR0MUCr+CDOEhfri2XRWULdo3wM+kR
	 FdKdpMRwEM86mg04BejjX3PcCkkUlhEhnVoWEC2Y=
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
Date: Fri, 27 Nov 2026 11:13:16 +0000
Message-Id: <20261127111316.3321502-3-christian.loehle@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261127111316.3321502-1-christian.loehle@arm.com>
References: <20261127111316.3321502-1-christian.loehle@arm.com>
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
index fadad7d3f3a2..4bbb095a6d19 100644
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
@@ -1882,8 +1882,8 @@ static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p, int flags
 		uclamp_rq_inc_id(rq, p, clamp_id);
 
 	/* Reset clamp idle holding when there is one RUNNABLE task */
-	if (rq->uclamp_flags & UCLAMP_FLAG_IDLE)
-		rq->uclamp_flags &= ~UCLAMP_FLAG_IDLE;
+	if (uclamp_rq_is_idle(rq))
+		uclamp_rq_clear_idle(rq);
 }
 
 static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p)
@@ -1922,8 +1922,8 @@ static inline void uclamp_rq_reinc_id(struct rq *rq, struct task_struct *p,
 	 * Make sure to clear the idle flag if we've transiently reached 0
 	 * active tasks on rq.
 	 */
-	if (clamp_id == UCLAMP_MAX && (rq->uclamp_flags & UCLAMP_FLAG_IDLE))
-		rq->uclamp_flags &= ~UCLAMP_FLAG_IDLE;
+	if (clamp_id == UCLAMP_MAX && uclamp_rq_is_idle(rq))
+		uclamp_rq_clear_idle(rq);
 }
 
 static inline void
@@ -2114,7 +2114,7 @@ static void __init init_uclamp_rq(struct rq *rq)
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

