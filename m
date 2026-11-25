Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606122;
	b=QEaJ9/TPIEfPg3Dt3uQ5Oy3M2q5jI+YTWoF1xuKa4Ct5orD/ZTilnjCIK4I2BMn5xgYg
	 xZcbSL6SyXNzoht4nXz/lQ/Cyaxj3hAas0UoLUFEsgqaJtqYNz9skHP8ZJELUeZif1DQn
	 SJrpXfMZgoDxhgu0E+wZAlzBnqM15ei4qJ6bsDB3gA8VMtiTD/BMcnkMUgQEPXVFTvNuY
	 0slSGavo/EvILU7flemQoItBbMwafvCC7feQDBrDU8dyC139SqHxXWpFWwW7dJoHlBQE/
	 HmK0pXzfxc5NhPP8z9FmbOJ2oJVMPX+hlkA/V4spT7TyyAxYo5/TBCNR67DwsaR/6bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=hjrWtGqjdTkvqbgRLAZG9FmN7gaLopZWwSHoe/hNnVk=;
	b=zhs5BblqgphRX7gg2mtNQxM1PbYWmww8llNq8HFvVHGAgP0DWqfKMzshSm3jGPPXmakZ
	 Hsr6LAKLapsDEUJELwzbXTgMNKcNYDzwqQQeNSYFyoN4UDLe1hQ6egnQkINIXgLC9l66R
	 YjRNmfIJODGHraWEG04TAaN9C5yEu2cMZr0s7HfDryYA02SlvedAXl8YUieZqA6ma8sr5
	 KNRsmgxDHJUnFQQ6r+gTaLsnIMLIUK0tCfW7aYDIfb8vDjmZ9wrg1O1ti9mTOvnPfJE39
	 nCMZaRQCC8a43nZkCZBz2giso9G+gXMfzrJ9hIKTJEP1/ApVIkkybyS4K4fn8I/+iJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Mlf3EeZr;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A603606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:28:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A603606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Mlf3EeZr
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4ba078abd78so37001065e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795606121; x=1796210921; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hjrWtGqjdTkvqbgRLAZG9FmN7gaLopZWwSHoe/hNnVk=;
        b=Mlf3EeZroc8CFI7OfQR7+Jpbdugud7R5Zi1i1WnYrqMYb0QJXsk/3ILdj/N+tg58lU
         lJ29Lo1QRc/XYHBefcfy6X4SIWiqANeSzIHP+wRDyg/qxuu+W+4Vj9bSc5X6Vnvchi6f
         ZQBQ/PGY5cqIY0BAHnSLlR9Anbr1DXPK4ZQKUIacRaVnZGxyE3Ym0JUjTIrwjtbkmgAV
         fcgXI+5RUdooTurbt20Gm5Z4a2t2+Rrw9xdsmXYMDlqes4Obn90TtLs/qDTih4WEivyW
         KmVjb5ds2VUk0ASCzi0z946AYA+Ncz8OjYIEgQpT32MX2qm4tHmVGt/q/wYmdzBd5fTg
         Wrxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795606121; x=1796210921;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hjrWtGqjdTkvqbgRLAZG9FmN7gaLopZWwSHoe/hNnVk=;
        b=T6T0t7N1K9rbJMMGCJQUA3dSsZ1r/YfWNMjrg6tHAv+g4Y2N1bjUGSGSDT+slhvjTQ
         1JK6VysXu9lNdxyf0jJfy8vz0RUbMG9vBD/7+ByjB/RNIZxXVTeBfsmS4lWDC0ToMWTi
         QtSs/bQsd1cuMfFYUUiLG7nS2RXRQXbPmzZd/0wu9G8YTTG3KA0EdiNohn8/rTaFo2/q
         jqyt+tMTRRB860rZ0YgZuwpnZSItD5S3BvVkmpRfY40Jzh1UuTv3GLDyVnmqXPXtYaP/
         uiLKLoPp/cKOeiHSPo+SJQIk4o6dwwMH3GpNN0isi/WIJmlpmull4uYwJOVgkwdMkvSC
         giZg==
X-Forwarded-Encrypted: i=1; AL+hErF2YgsW0/fWgG8qeaFSe6yFtvNkYLC9cSOkuNtjDBC8Vb/GAvwTzoKE9XrreZvvanN221xL6htMhmgPlxQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dgYWBjjvGygZeaRVK5kxltLFz3Kwc1OI/T0uNEjMh8KeZociK
	na3dTwjYHn/t/XAMqdiaKhPF7n0x74IHuD3M+M+IT0+UX/t1ePhQwo3uh3NKIiWdLHOLXJzphLV
	s1n6YWzOBaKb8Sw==
X-Received: from wrxf1.prod.google.com ([2002:a05:6000:1281:b0:4a5:46fd:392d])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4585:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4bb8882948dmr358570145e9.18.1795606120690;
 Wed, 25 Nov 2026 03:28:40 -0800 (PST)
Date: Wed, 25 Nov 2026 11:28:35 +0000
In-Reply-To: <20261125112553.1539758-1-jpiecuch@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261125112553.1539758-1-jpiecuch@google.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125112553.1539758-2-jpiecuch@google.com>
Subject: [PATCH v2 1/4] sched_ext: Factor out release_dispatching_and_lock_task_rq()
From: Kuba Piecuch <jpiecuch@google.com>
To: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>
Cc: Kuba Piecuch <jpiecuch@google.com>, fangqiurong <fangqiurong@kylinos.cn>, 
	sched-ext@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Factor the holding_cpu + SCX_OPSS_NONE + switch_rq_lock() handoff out of
dispatch_to_local_dsq() into release_dispatching_and_lock_task_rq() so
that other remote dispatch paths can share it.

No functional change.

Cc: stable@vger.kernel.org # v7.1+
Signed-off-by: Kuba Piecuch <jpiecuch@google.com>
---
 kernel/sched/ext/ext.c | 73 ++++++++++++++++++++++++++----------------
 1 file changed, 45 insertions(+), 28 deletions(-)

diff --git a/kernel/sched/ext/ext.c b/kernel/sched/ext/ext.c
index efa1d01d03af..d6505d90e2c6 100644
--- a/kernel/sched/ext/ext.c
+++ b/kernel/sched/ext/ext.c
@@ -3166,6 +3166,48 @@ bool scx_consume_global_dsq(struct scx_sched *sch, struct rq *rq)
 	return scx_consume_dispatch_q(sch, rq, &sch->pnode[node]->global_dsq, 0);
 }
 
+/**
+ * release_dispatching_and_lock_task_rq - Release DISPATCHING and lock task_rq
+ * @p: task being dispatched, owned by the caller (e.g. through
+ *     %SCX_OPSS_DISPATCHING)
+ * @locked_rq: currently locked rq
+ * @src_rq: @p's rq, stable while the caller owns @p
+ *
+ * @p is on a possibly remote @src_rq which we need to lock. If dequeue is in
+ * progress, it'd be locking @src_rq and waiting on DISPATCHING, so we can't
+ * grab @src_rq lock while holding DISPATCHING.
+ *
+ * As @p is wholly ours, we can pretend that we're moving from a DSQ and use the
+ * same mechanism - mark the task under transfer with holding_cpu, release
+ * DISPATCHING and then follow the same protocol. See
+ * unlink_dsq_and_switch_rq_lock().
+ *
+ * On return, @src_rq is locked. Return %true if @p is still ours, with
+ * holding_cpu cleared. Return %false if @p was lost to a dequeue.
+ */
+static bool release_dispatching_and_lock_task_rq(struct task_struct *p,
+						 struct rq *locked_rq,
+						 struct rq *src_rq)
+{
+	p->scx.holding_cpu = raw_smp_processor_id();
+
+	/* store_release ensures that dequeue sees the above */
+	atomic_long_set_release(&p->scx.ops_state, SCX_OPSS_NONE);
+
+	if (locked_rq != src_rq)
+		switch_rq_lock(locked_rq, src_rq);
+
+	/* task_rq couldn't have changed if we're still the holding cpu */
+	if (likely(p->scx.holding_cpu == raw_smp_processor_id()) &&
+	    !WARN_ON_ONCE(src_rq != task_rq(p))) {
+		/* the handshake is over, see unlink_dsq_and_switch_rq_lock() */
+		p->scx.holding_cpu = -1;
+		return true;
+	}
+
+	return false;
+}
+
 /**
  * dispatch_to_local_dsq - Dispatch a task to a local dsq
  * @sch: scx_sched being operated on
@@ -3189,7 +3231,7 @@ static void dispatch_to_local_dsq(struct scx_sched *sch, struct rq *rq,
 {
 	struct rq *src_rq = task_rq(p);
 	struct rq *dst_rq = container_of(dst_dsq, struct rq, scx.local_dsq);
-	struct rq *locked_rq = rq;
+	struct rq *locked_rq;
 
 	/*
 	 * We're synchronized against dequeue through DISPATCHING. As @p can't
@@ -3203,36 +3245,11 @@ static void dispatch_to_local_dsq(struct scx_sched *sch, struct rq *rq,
 		return;
 	}
 
-	/*
-	 * @p is on a possibly remote @src_rq which we need to lock to move the
-	 * task. If dequeue is in progress, it'd be locking @src_rq and waiting
-	 * on DISPATCHING, so we can't grab @src_rq lock while holding
-	 * DISPATCHING.
-	 *
-	 * As DISPATCHING guarantees that @p is wholly ours, we can pretend that
-	 * we're moving from a DSQ and use the same mechanism - mark the task
-	 * under transfer with holding_cpu, release DISPATCHING and then follow
-	 * the same protocol. See unlink_dsq_and_switch_rq_lock().
-	 */
-	p->scx.holding_cpu = raw_smp_processor_id();
-
-	/* store_release ensures that dequeue sees the above */
-	atomic_long_set_release(&p->scx.ops_state, SCX_OPSS_NONE);
-
 	/* switch to @src_rq lock */
-	if (locked_rq != src_rq) {
-		switch_rq_lock(locked_rq, src_rq);
-		locked_rq = src_rq;
-	}
-
-	/* task_rq couldn't have changed if we're still the holding cpu */
-	if (likely(p->scx.holding_cpu == raw_smp_processor_id()) &&
-	    !WARN_ON_ONCE(src_rq != task_rq(p))) {
+	locked_rq = src_rq;
+	if (release_dispatching_and_lock_task_rq(p, rq, src_rq)) {
 		bool fallback = false;
 
-		/* the handshake is over, see unlink_dsq_and_switch_rq_lock() */
-		p->scx.holding_cpu = -1;
-
 		/*
 		 * If @p is staying on the same rq, there's no need to go
 		 * through the full deactivate/activate cycle. Optimize by
-- 
2.56.1.839.g22a8290db9-goog

