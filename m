Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795717470;
	b=w3Sp/pTcHsW7uGkPd04wtAntrffGbbZKWjFz3g8AHkymV1JS1fSAXY+0qbELmTCjsHEU
	 Jug9FAyHfKx4y5NFTWJSb0JbPC3L9+bqkdTbb7vY/TiQ1Ag4RLPWNd06v3YBucjleOOCL
	 7Vm/MhfGw6jYRz2kpJ8zcT8QIj36Zz1yvY9IwTA0hLn+9xJNCuddzRtAS4+Cyw8A8m5zF
	 ODDOFfg1ZFHCbGKJmxjqnXWQny2QrasLi8MGfXzEqz+snuNekxc6UMfJHndJZVN/cWVuI
	 +VFGmGmHzyYD9mNqCHQVnAxHawQViaynyTuK0gTWY3XYMyPR5Z7pvim54zBb2uAGUmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=4IZ7GzrJMAz/9qwZhcozR46S8QzzkZZLJwpPtoBKQx0=;
	b=s3Chg71EMlzKyM2fshdC00he32moiSu8UjxOoxfibHmfdIBsGamwXrXHSRb9a/qyCR1k
	 IS+tQMghmuyfFWNr0GdP2oxQNoL1SC47Z/sr5h70vHo6TnoCDU/fuN+wu0QIboLtNcNkS
	 OmaEU9vKwlLWyTUEfpIydScvltN0Q0AzZKdTi/+x8mUedeMvqVn9fxIs4tNEL78x1dCVz
	 PGNucc+YqBuqlBBQvN2tqISnbfLQ1A9WxG/kqhra9yg5ze/tmAMUY4ltsAgsUtHXOpfuY
	 FN9hiQqwZq4qEUgMxvFCSEZ9cFM8+CTe6hpwz9aBBRN2RH+yGKGi8R4EWODqrC01Cdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IfIzYXcU;
	arc=none smtp.remote-ip=209.85.208.72
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F7C606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12F7C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IfIzYXcU
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6a5d57a8d51so880397a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795717468; x=1796322268; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4IZ7GzrJMAz/9qwZhcozR46S8QzzkZZLJwpPtoBKQx0=;
        b=IfIzYXcUnJbZHoCXXKzo1yEbXta5d2z/735LgGEHe4A8aW9YY7UgmwYtQ5MXcrmcBT
         7vWFc9LAMRhru2dhOaaDBAR67Trj6N0ZGWlfdAK1QJVPQcUp3W2ccuPOhMKI5t4qyJh2
         N0F2J0fd8IaYs/3WTADgGp3DfKEL/GXC8QR4SAeBIh6Ekw9YVRwjF2tNTNWuQKErnhjO
         8dxRrViAYld+NOFUzS8rqhM6pjVRVjfwA5iS1xMbbT9USqXxI+SOSdUbp33hBlRK/Z0z
         hzCSM3X3Du8dTcnHJvFkbwOyKYFzxwhE6WWbbYY9siwzq/PekHMNuZ4YoW/pDtfCvWA+
         ttuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795717468; x=1796322268;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4IZ7GzrJMAz/9qwZhcozR46S8QzzkZZLJwpPtoBKQx0=;
        b=Fhat1nu7WAzv9a7WJUgKweUHgFpic0Wn5MZ8v377SkmceyF2j3U1taptpIKPK3WaE0
         4EPA1IFePj3y+g5sY5EcPpOgq9k8lNqf3HIab4s/3erCqpRRovnBpYrdOM43G/x6HnRG
         Ck+JTeDMXgemq2RGGZmVq3JiCmgE/ydJRRNYPYzFkwkCYxdd22pr/z9nL7KaXcBQeiPU
         36wcM+0t5r+ewaAaHA7/8gvFJXH8qXq4kH9Xv3EmfiCFrs+S+H/KihyhGtIlq5M3xwIQ
         ObppIrBauurcKBtjsCKrHwzKbJWg4VzpM5F3mCmufFLPf6d3QpBlJSJzGpSxfX2Pj5GB
         JgSQ==
X-Forwarded-Encrypted: i=1; AL+hErG7e/tIcxuFggAu4LaQFw0PKKlUBW9+lMHDR2VVaM5Cu7UIXfvMSs2l1WbXhgREE8jEyVy/qiVb0hPlSk4=@vger.kernel.org
X-Gm-Message-State: APuU4Z87+OsNvDB2VKxIvSKKh+ONq7SZ4kVEj4mfMEryDt/tw0PiyoiS
	C152a43zY0q+ssSD8Z/x52tWBXyNjjc0Zm8QLCKzgA74HbYIwZVDicg6uoFnSf93G8fs/81Fflv
	lO54tf3hCZY05KQ==
X-Received: from edr16.prod.google.com ([2002:a05:6402:44d0:b0:6ba:6fc6:aeb])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:3212:b0:6b7:28f:a3ac with SMTP id 4fb4d7f45d1cf-6ba37d18d11mr15738506a12.7.1795717468258;
 Thu, 26 Nov 2026 10:24:28 -0800 (PST)
Date: Thu, 26 Nov 2026 18:24:26 +0000
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
Message-ID: <20261126182255.4146389-1-jpiecuch@google.com>
Subject: [PATCH] sched/core: Skip empty source rqs in try_steal_cookie()
From: Kuba Piecuch <jpiecuch@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kuba Piecuch <jpiecuch@google.com>, Ingo Molnar <mingo@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

sched_core_balance() walks each CPU of each sched domain of a forced-idle
CPU via steal_cookie_task() -> try_steal_cookie() until a matching-cookie
task is stolen or need_resched() is set.

try_steal_cookie() disables IRQs and acquires double_rq_lock(dst, src)
before inspecting @src, even when src->core_tree is empty and no task can
be stolen from @src. On large machines, a forced-idle balance pass incurs
many IRQ-off double_rq_lock() rounds and remote rq lock contention for
nothing.

Return early if src->core_tree is empty via a lockless data_race() peek
before disabling IRQs and locking both runqueues. Missing a task enqueued
just after the peek is equivalent to missing one enqueued right after
releasing the locks; all remaining checks stay under double_rq_lock().

Signed-off-by: Kuba Piecuch <jpiecuch@google.com>
---
This patch was written with the help of an AI coding assistant. I have
reviewed the patch and verified the tests run by the tool.

 kernel/sched/core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index ea89471d4743..dfff7756465f 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6591,6 +6591,13 @@ static bool try_steal_cookie(int this, int that)
 	unsigned long cookie;
 	bool success = false;
 
+	/*
+	 * Lockless hint: a missed concurrent enqueue is like arriving after
+	 * unlock; a concurrent dequeue is caught under double_rq_lock().
+	 */
+	if (data_race(RB_EMPTY_ROOT(&src->core_tree)))
+		return false;
+
 	guard(irq)();
 	guard(double_rq_lock)(dst, src);
 

base-commit: c47af85667065c6dd5b79564203c2d29948ef60e
-- 
2.56.1.839.g22a8290db9-goog

