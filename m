Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795450177;
	b=zb6tldEERVn/oQF+o70c187MBVMqzqiJoNHOuSGcvHmVYyDAtGblMZSk9OlGDEdynTqp
	 7z+a+78rAi9Mvf2/Gl//qQZGLDQdNEWF4Zd/sVRFPT94jjcJEhBG5N3Yh6VVM1Cm8uDEz
	 i0X8QwadZT7pwSVk/2C0jx4yLO1NjtbujvhL1SzGIZn4fQ1mxx2Kzq5WtzDMvGjkxGaVa
	 rz6tB4odDeLhkluEzCPTX94odNeS0XoKJKjrcpgkmmEK/sIEwVSLt8d3Rc1WMv3OaAfD9
	 XBcvdQtwwDqxVPq242w3GuIRgLNHxt7uj92i8Vk18f4HiSt+BUilY/23LZjskAmgyKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795450177;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=JhcfpBwHSU7MgwxhgP4Qq1k5bLuK7ieaSxmvk+gyAcc=;
	b=YqcJqSxylIihD/4+mItnxQfOEEU4ApbcHqijJa5I7fSWipD5UgqCH3TfytIhgKU5TB9Z
	 YfYeB1eahc3PjDcKrnsujV2OnVie+OxJEHhhymGVJW3S2Ci12InFKbZ34yncxIdyNcl+J
	 Upm4C2BZLJdBxZr22dzxa+fGQVwk2McX5McuJUDc3mmot4JMn5LxTmFtSwnb6JRZDZvNi
	 YGFfz3wf8S1xCbiLLB5gFq2Fa4KE2RWmz8WxbiNLFRwqNLeZsl5b+FtUsJzIcE5F94YjM
	 wPSmSopuhL9I7qo0+reVG0yUMaBbQd8WysJFryvIQvmVuFt6YqJPb0Qi/onJ0tyNRRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--penghuang.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ewKOjoXP;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E041D606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E041D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--penghuang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ewKOjoXP
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-38531c1a566so1609988eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795450176; x=1796054976; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JhcfpBwHSU7MgwxhgP4Qq1k5bLuK7ieaSxmvk+gyAcc=;
        b=ewKOjoXPN39yp0jVeaMqx6C2OwF0rXLLiqjYLeRo3WkCV1R48gogHGci439v1gMnsa
         BmbLTPcjth/T6hJBuzIgCHOkUnYmt/HjQYaU0A/R9Dcw2nkveWRI2fvNP1tdESzac5+b
         gtX4cEuex2rGRf90bGPd/0ovDW6gAYokWYdb0D9bbYL8N8BOH/Tpd30U6qK3p3uU0QaA
         94FHbBLRK7YUWFDFOLEQX49n7R/5rzhJizbn5nKL3wVBV7vQ5bK0694LnQ+aUIcd6dFE
         Qu1KVM0Yct4VZgRlfK4/fYxSfCJSxseXUh+G7gMdcJFDaTL/+Nhvf2IoaP13D51+f5U/
         DIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795450176; x=1796054976;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JhcfpBwHSU7MgwxhgP4Qq1k5bLuK7ieaSxmvk+gyAcc=;
        b=hf+z+Ma/Bk6jmSP746ocnOPsCyEeMcK+C+e7pmrR1Nw2dZw2JoKmny8mk8gRwV5/zv
         E0lUW5VhCS2Eg1ptJxVqfO4y6Sub7Jce9CEjnKXmhhhQMbmUWyoYM/sHwxJtHxUHpySo
         CM3nO9bsjY/Nztzdcj1y3RXJBjJXZ5++S3Pr01jwFfZVA/JQwAWwABCSNxlXTCFIOZVc
         abhXf6Tp1otWI4J+jXwMKN/v3dRg5ULafHwmdepoPVRwX62IF5gWLifh2fQrDYb8vr77
         V/aMOtJH/4VhzSu0IDll95DH5TgFuIGBshZJ2/WCjbgkQgvxq+0SrHp6znVJrkjMw0gf
         Qn7g==
X-Forwarded-Encrypted: i=1; AL+hErGSQ268HXo9D0s9xjsO8rt2FQT14RNsHcSTtUR06tb36e9PT7xuOb5soQ0cN9yfL8+N2ERb6LtO/c+GAWk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qNx7XEb5XyqZ+XascnEi6xo7mqv8M+stJ/I1L01fKybck0CUS
	luGz3d9yryacnpAuPvJtvJEf5oG1Vou/kRR774BEwM86hGdP/UzcwFqUF7MA5ZjPg6Vh59160ie
	rGFwlLp6ppJ3/jFVObg==
X-Received: from dybmf40.prod.google.com ([2002:a05:7301:928:b0:36c:9b55:8436])
 (user=penghuang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:4284:b0:382:1aea:c21d with SMTP id 5a478bee46e88-3857191bcf7mr12981179eec.41.1795450175386;
 Mon, 23 Nov 2026 08:09:35 -0800 (PST)
Date: Mon, 23 Nov 2026 08:09:34 -0800
In-Reply-To: <CAKfTPtCQpVhtVT7Mhqe1=Ukcmc1pX8Jgn9ypb64--8cJ-7G4BQ@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261122015729.2512645-1-penghuang@google.com> <CAKfTPtCQpVhtVT7Mhqe1=Ukcmc1pX8Jgn9ypb64--8cJ-7G4BQ@mail.gmail.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261123160934.2289260-1-penghuang@google.com>
Subject: Re: [PATCH] sched/pelt: Skip dormant cfs util_sum under scx_switched_all
From: Peng Huang <penghuang@google.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Peng Huang <penghuang@google.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, Tejun Heo <tj@kernel.org>, 
	David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>, linux-kernel@vger.kernel.org, 
	sched-ext@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Nov 2026 at 11:34, Vincent Guittot <vincent.guittot@linaro.org> wrote:
>
> When all tasks are moved to sched_ext, fair utilization should be 0
>
> ...
>
> This is not the right solution but a bandaid to hide the issue. When
> there is not fair task,  rq->cfs.avg.util_sum shoudl become null.
> Please look at why it is not null.
> It could be that the update stops before everything has been
> propagated correctly in the task group tree

Thanks for pointing this out -- you are right, and looking into the
code confirms your suspicion about stopped updates and incomplete task
group propagation:

1. Deferred cfs_rq->removed and unvisited sibling task groups:
   Tasks that exited (task_dead_fair()) or migrated while sleeping
   (migrate_task_rq_fair()) before scx_enable() queue their load/util
   in cfs_rq->removed via remove_entity_load_avg() rather than
   deducting and propagating immediately.

   During scx_enable(), switched_from_fair() -> detach_task_cfs_rq()
   only visits and propagates along cfs_rq chains that still have at
   least one live attached fair task. Any CPU or sibling cgroup cfs_rq
   with no remaining live fair task is never visited, so its
   cfs_rq->removed stays undrained and its tg_se contribution remains
   in rq->cfs.avg. Once __scx_switched_all is enabled,
   scheduler_tick() skips sched_balance_trigger() and fair_sched_class
   is bypassed, so __update_blocked_fair() never runs to drain and
   propagate those remaining leaf cfs_rqs.

2. Sub-divider util_sum residuals:
   Even on visited chains, if tg_se->avg.util_avg has already decayed
   to 0 (with 0 < tg_se->avg.util_sum < divider) when the child
   gcfs_rq's last task detaches, update_tg_cfs_util() sees
   delta_avg == 0 and returns early without subtracting
   tg_se->avg.util_sum from the parent cfs_rq. Independent PELT decay
   truncation and integer removed.util_avg accounting can also leave a
   < divider remainder in cfs_rq->avg.util_sum after util_avg hits 0.

For v2, rather than touching update_idle_rq_clock_pelt(), how about
adding a fair helper (similar in spirit to rq_offline_fair() ->
clear_tg_offline_cfs_rqs()) and calling it from scx_enable() in the
existing per-CPU scx_switched_all() loop (where rq->lock is held,
rq->clock is updated, and rq->cfs.h_nr_queued == 0)? Specifically, it
would walk leaf_cfs_rq_list bottom-up (plus &rq->cfs) to:
- flush cfs_rq->removed,
- clear load/runnable/util _sum and _avg on the empty cfs_rqs and
  their tg_ses while preserving last_update_time and period_contrib,
- clear tg contributions via clear_tg_load_avg(), remove the empty
  cfs_rqs from leaf_cfs_rq_list, and update rq->has_blocked_load.

Does this direction look reasonable to you?

Thanks,
Peng
