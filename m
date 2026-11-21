Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795260783;
	b=uDVwmVb8qGDpZZE78xse4+z40zwpUEfMvn9CSzZnAfup9TB5QOSMy0kQxHQcnxOgY+bX
	 sOgrxJBFuvmFOR32pxFdMVcKMuSFHZBgUnrTktWEQqBwxm22flTe377sYyNyjPblRn4FL
	 2JyqzUMTxImYMvtAjckt5aMweZwKByd/cSDv0pya1O7RYZcDyEgRiGulXDorwtCBfh1gz
	 IQOlFEZoRYEvF6AgeXzz+f/mZ4eUkG1nRPjOWo4HVABGehm0WOp3aNu7UR8WabdYRhv4n
	 yAQ+eleTkDAyujX3+4UchQZ5wMYkBBfftN7nxOoHTiLYUF+WOxjAkvRUBY+g/W9466g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795260783;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=KK9UBGoOXxDgxdIHhYwv6EiDDgCB6dEuVsqhbAuDLYA=;
	b=bGE/Vzjg0+7pTPcb4C2f4HI+xprpdsRPOfpZOiZ8onQA9Dbv/vC8Rb0/rmAFUX7KN8S+
	 GFMkwM9uWhVOgtWLHlfKwj2/fThS8PH8G7zYmfgygj/xn3h67kh8uiUeHnhHF9a7eEhNN
	 Te4wh2NRbQhJfbPd8zmooJ+f3fa79q+VAvC1htwL/6SJzDCRY24qj4PwAVKoGI/rhKecP
	 611Cyy2ah8z5LhZxSqEned7+g8OeaeaptRPzmyKqRwwdeFDmEGdce1n1xctB+Hz0dilwS
	 R6/3MHrsYnkpzyeqCwQyrNEaEMK13QlNDZ6VeaVEQfQLh7tGIdop3lPn+R15zvTCEKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bVOx2BaF;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D25606A331
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 11:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43D25606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bVOx2BaF
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cde4b4e936fso1474679a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 03:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795260783; x=1795865583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KK9UBGoOXxDgxdIHhYwv6EiDDgCB6dEuVsqhbAuDLYA=;
        b=bVOx2BaF0j1A8v2xP5IWCF6AoWR9qXDMiCGDhBgRGmRIG0RKog6xiWH9E0mOFqiBQd
         AihY6i83Z/8/+8U91DTM++idZIj3nqbaBtXCtsLQdeBZdUZ2pBfpCocgTds5bFC/ZL0b
         +h9K5SKZIasYAxZayoIixsW/dQZur+T8aCGPLWIrbCITx1a4qiOJRidi3oSEwuovAAJs
         7DR55VoSYvH30UMi9g9rtq0PMJgxucZC4e7vdqD5Z/Kn+2U4JdRP06ZnQu9wIz0I0h5H
         /NkG/BCrL0D9WrY1VJMkl1q5psXzyZiW6NjfQa3eZLEu6Xcvi7Vw5XUiyPK20J7ODMA8
         7s9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795260783; x=1795865583;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KK9UBGoOXxDgxdIHhYwv6EiDDgCB6dEuVsqhbAuDLYA=;
        b=w2yjxGis0idJ8zb9eE8TbwNTOKiOPIUbKRYLDcNcNxAdBwiTIPx4x+I/+amU1lrhW4
         hPJu36VR3kuipdWaIeMSSBRsBDclKYHk9hpazs4XceSM/jlvx0i6PLH6We5MFIP+v0Gk
         /54+j8ohxdbWsdeNbD2+1phYdojT1cSwNi92gIUkrAy10oId1Dz6irEeJDiqsRD9DXZ0
         Z0/IHmuaPESg1ovJWMUc/QqjugF2/9T0+npBoC4chIptk1bS9HCmroaSGCG0XCCar5xm
         tKS03aq9DiQyjcyfFhAmAyUu/h4DVXx1njoWnoLbaaIT0Ekonh5Nngwp61O+LAEKqIXd
         pWNA==
X-Forwarded-Encrypted: i=1; AL+hErEK9bnDHjjiSEAS3c96AwW9dn87NtRSBYIFRqpZGFh4aE04o2ZiOijVyqnYn4ZNjQVm6h2gawK8zWalSjY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WlNJVqgnFh4HvVu6rxm08LSt9gvbwppRtjHq+GRzIph40bNJX
	PJghCUo1m9n+x+Lj74+YlISIeBJ1gUyPV7rVp+Bn2sDwfaYn8CpwTOk/
X-Gm-Gg: AZFdTZeXR1QQo6ZJzJpURrhtIJN6gg4svgIhZD1trqENYQnZJyaQ6cgfPaVdr+4P/0k
	4L45vEGCGYY3tc0N8aMS8VUCwKrKVSYgo3PQ9SEa3xdMwGgNiAhg1w7oqkTDa/EbieF4nDNifeH
	FnxM+LcNYkGnxVSPkrDYKGgwKt3KR26tntiYioyG4aa2jL+wkIEUPEhX9Y9jD8+m8owB0KGXWMj
	5bPJsX6poBonN+vH58KH6VOJrgs9AcO4mjkzQA2bh/3X8fukWD47JOJ+ruiM9iS+whRv2HSSwsd
	HjB+SLYv1kPVcAfgXgmvtbyHJAZRTAerjwOFFFfDukUOtQidY04uBGisDTIMeq664MIoTSEZ3hF
	Ki93vPKuMJX2FaSYWJ74A9L3NJkjZa0rnG4H390uuzrRBeIaEx063CERdffLLqXwg97j5m3LCK5
	RM+ASBGC2zHmbxR0Tjx7GdDE65Hj4DmmPCMpJcIBjKTSU6+FrTtBONaIjIU3BHhYKxzrvjrTvGH
	kjdG+GvILtMl29RHgjvWnHVuIUGj4CaGpje4lVq1XuKwgZasJptJ/ykZ0GGaF26J9KKvgkg4sxA
	Jf7U7VQXVx4P8scpIg8zoCd7LbjBeEX46zOs9f2NPT3+
X-Received: by 2002:a17:90b:390b:b0:3b1:d40:2c4e with SMTP id 98e67ed59e1d1-3b41c56f34amr3999717a91.0.1795260782587;
        Sat, 21 Nov 2026 03:33:02 -0800 (PST)
Received: from [127.0.1.1] ([2408:840d:6830:46f1:7c60:7a01:9164:e1a0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecb486sm11111223a91.16.2026.11.21.03.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 03:33:01 -0800 (PST)
From: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Martin King <martin3kx@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, Thorsten Leemhuis <regressions@leemhuis.info>, regressions@lists.linux.dev, linux-kernel@vger.kernel.org, linux-rt-users@vger.kernel.org
Subject: [PATCH] sched/rt: push a queued task when its priority is boosted
Date: Sat, 21 Nov 2026 19:31:27 +0800
Message-ID: <179526068763.97100.12205093734161349836@gmail.com>
In-Reply-To: <20261015084615.05957ae3@gandalf.local.home>
References: <CAEB5A_91hob8ddOhW=PrO1=O7GrFmSxY3r1-_Ard6x8KHHuJGA@mail.gmail.com> <20260814183652.611e7ecf@gandalf.local.home> <6db9c47f-a1f8-49dd-9e80-f9014d75f9e8@leemhuis.info> <20260903092037.5b739980@gandalf.local.home> <20261015061915.126442-1-chaosheng.qu.linux@gmail.com> <20261015084615.05957ae3@gandalf.local.home>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

A PI boost can raise a queued task above everything that is runnable on
other CPUs while it still cannot run on its own rq, because the task
currently running there has equal or higher priority.  prio_changed_rt()
only calls resched_curr() in that case.  The task then waits for the
current task to schedule out.

The pull side does not necessarily rescue it: pull_rt_task() only picks a
task whose affinity includes the pulling CPU, so a task whose mask
excludes the CPUs that just became idle is unreachable until the running
task leaves on its own.  With RT_PUSH_IPI off this is the difference
between a millisecond migration and a wait for the hog to finish.

Queue a push when the priority of a queued, non-current RT task goes up.
push_rt_task() already declines to move a task that is not pushable and
skips the reschedule path when the task is higher priority than the
current one, so the extra callback only acts when a migration target
exists.

Signed-off-by: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
---
Steve,

This is the fix we discussed in October.  The case that matters is the
queued task that the pull side cannot reach because its mask excludes the
CPUs that just became idle.

Numbers from a 4-vCPU QEMU guest (TCG; KVM is not available here), non-RT
kernel, RT_PUSH_IPI off.  L is FIFO 10 with mask {cpu1,cpu3}, X is FIFO 99
hogging cpu1, W is FIFO 90 on cpu2 and blocks on L's PI mutex, R is FIFO 60
on cpu3:

   baseline: 1/5 rescued, 802.8 / 1161.0 / 1311.8 / 30.2 / 1280.0 ms
   patched:  5/5 rescued,  13.8 / 1.1 / 0.2 / 0.2 / 0.8 ms

The reproducer is a small static C program; I can post it if useful.

 kernel/sched/rt.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index 85303add7..db93bfff7 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -2499,6 +2499,19 @@ prio_changed_rt(struct rq *rq, struct task_struct *p, u64 oldprio)
 		 */
 		if (p->prio < rq->donor->prio)
 			resched_curr(rq);
+
+		/*
+		 * A (PI) boost can make @p the highest priority
+		 * pushable task on this rq while it still cannot run
+		 * here, because the running task is of equal or higher
+		 * priority. If @p's affinity excludes the CPUs that
+		 * become idle, the pull side cannot pick it and it may
+		 * stay queued until the current task schedules out.
+		 * Trigger a push for the new priority.
+		 */
+		if (oldprio > p->prio && p->nr_cpus_allowed > 1 &&
+		    p->prio >= rq->donor->prio)
+			rt_queue_push_tasks(rq);
 	}
 }
 
-- 
2.43.0


