Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542101;
	b=WU7hAAe1LQf/YbYtmyE77VeotBLiZ2b/bzxY5St5vKfoZ/+CFrW9JgyVEofD12+EGUmv
	 AidGaNAJ9rxcWeJ+jQBrq3XqjcTLpQXtN8uFxl4WniaCytay0avS7i8zBkypHXbwlJcu3
	 2mjNc0JcFi2OilxPg3ugGDOA5vtVdaEuJlraoxoemPB3+B5XfnzC74ZzMmLf5y7R1I9z2
	 xKLpPTtyIS+4grFcU925OE05trcHHvKVzomVa36LImBXOZr+yMRYYUcxu9p3IfnYtJlEo
	 mgqO0WU51srakRU8lZ4PkMLZCH4m5gocfJSoNpPD53Nk5apcHHGU7l4gVXlSvOiG1oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542101;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=rdbIPLbNoSXfxt5E2JpRO3kuiR7QU2SVdk+WTPinAPI=;
	b=UHfDSydjfqPEhxCEPAvirTem+ikZ0RSGQf0/OtjqUv11zriLEcJMwQHZCU6MTgUjPpmj
	 sNZxsl4VqPKSEZmPJu+bfulYay6E5+hjT9CBRNFlNPEYcba4LDYfnYP8FlG6u+Bo3Vdts
	 U3pKL1X/NoTH3Kx0DiG6ug0s1xCCG7gAsdc51khPj56PWiTpS9Ut6M0+bLMlMo81ryEQM
	 bTMQc0cOtagnbpkV65cZh/1cbHLIjp5CpMoNgDcakUPYtBLBMEdFg0mCapvbpbkNMLBsj
	 5Ou9U9eYsLSJMj/97MFQbwJ30BC1IbaRrhgOE4zbmMwDBpsenghEiEc08cf2PQmcXlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Rl5dKBiB;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0734606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0734606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Rl5dKBiB
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b87a240de3so6004741a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1795542099; x=1796146899; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rdbIPLbNoSXfxt5E2JpRO3kuiR7QU2SVdk+WTPinAPI=;
        b=Rl5dKBiBxA2Fdvv41BvNmLjgbq3noW7FUqPljB6NJSlZxA0iZ3FQo4b8JsynvqLkr4
         24UbubxDg2lGC3yGOVegs4cMHmp9Vq0C4FanDJweIXYKLRXrfAaVwL2vGuamIQnLEw4o
         pmGAIditiaG+7nnGE0UjIIUxcQ64PEOxPGc60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795542099; x=1796146899;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rdbIPLbNoSXfxt5E2JpRO3kuiR7QU2SVdk+WTPinAPI=;
        b=zDpWhzncCBXs/KSjYoBbt7pXAQssm1WWdev1LfxTa0xpYCvMAOQDLqf/ROawnQZTJ9
         akE6OERHeBSxdpIfZcYZmou0rfgRKlD703fe+eDPU7MMld2eBEqW3bUrUmnoHnEzXfbT
         bOdGS33ORhrN3o/Hys/cDg0ipJMhBUCsOpg/R2BfzDavfh1HDVOCFGigmKUwFEfzq7P/
         iFAWlqnIAh5NluSuh43d04hq19ycGu1IYdU3c6Hiohg7Mz6UJD+ByELds5RiWeNHPiyr
         ELwHvqXQAcedSkSx3jKtLB2iGSM7LeHb6l7Xmp41nzVBErqI5S/ipZThHIRaNKelNpPR
         I50w==
X-Forwarded-Encrypted: i=1; AL+hErEZoXTzlu0opPD050hYtW2vkQE2tjfMf0yOL7NO7M8/rS9P+buMsvno92byXp4gzaAp7J/xIifRdAB+wVw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zAIovJFnt25VgHgfNExoQlMs58VBDnZUmDClZ1hEqk5cgNKER
	8z+czzVNywT0r0yUwzMA/7OZCnlNPO56gQVaJpNM08ido+syMJteRRdV8ziJJgRIs/Mai40ere2
	0MRg9ukmJ5Q==
X-Gm-Gg: AZFdTZcYsoDpNai0qO4YEqgVUxWBhoFZG67ItT2OCjXYEGyx7Pg7mdWBOuOmx3Gdcme
	IRZA4cxiT84XvOgL+7FZ0yMcBOsj24vlDk67hbVbUWTUtUyUrsdCRDV8z7OvfMaKxSRiyfZP4Os
	DslMmO6SiaZLacrumFw0jADx4fvIfnFKXhEc6n9InZomB7rR+QORKfv47mXQ5cWFdALHSjXy37c
	kEFVY+5dIZjxnpuk7kRx9RXBw8x4lko/hIFiNtxGnM4Qq1OaktLcxKAsizPbA+Wv6iSOuoiANIc
	FVWHjv+Z+zzw9+hgabrsVrcLU4LmX1RQX8dyiqbR6QqXbnTFkNxGf7CWFpyHlxFM5eNMkdbCoCx
	aTiOxfScvV996kZ28oAs+OWx6zpP237/jjyiu7kFGNPm6bI0VLoS9CieTOUaz4Vsv4yACvvl4v4
	/sRFIRL2cqMUUUQuUJYiPPG/IhwCw8Clwo5vrAnxpvOhQ6YzBZApaMQ6QA0SPbslZu7H6MFWJ2v
	xO/dZhuZJA/PyZfU93eC/X9tyPCcZYsyhsNkqriSdF8IbBo7Mmnp4kEtB9xcpdGYIwInFF7oAr3
	SDSDTYpWR6GioxrRd1sZA/rH06Ooib3oVuaGvfTjz/f2VMYyzewa3z0VNe+NT/IMg45ZXCW9/kR
	hLQvV/u3ODs7GpNMkTKvSOS6h
X-Received: by 2002:a05:6402:2353:b0:6bb:82a:ec5 with SMTP id 4fb4d7f45d1cf-6bb082a119dmr1273138a12.40.1795542099310;
        Tue, 24 Nov 2026 09:41:39 -0800 (PST)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba3711ad52sm7191230a12.35.2026.11.24.09.41.38
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 09:41:38 -0800 (PST)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c516a192844so404384266b.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:41:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHtcvvtrGb4lDjiAE121FGd3R9a92xK722jMlfwCvcyEE6RS77Wkm2S77facYlQlWVWfh12xC99xA1k0Rw=@vger.kernel.org
X-Received: by 2002:a17:906:c104:b0:c2a:ad55:b3fa with SMTP id
 a640c23a62f3a-c513a434889mr1247420466b.7.1795542098082; Tue, 24 Nov 2026
 09:41:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-b4-sched-wait-intr-head-v2-0-4a764b64e8ce@columbia.edu>
 <20261122-b4-sched-wait-intr-head-v2-1-4a764b64e8ce@columbia.edu>
 <CAHk-=wj_eqNh+gNhCQh3exrL5Pmo5hbZBcL0W-4Ah_Nw0Kegzw@mail.gmail.com>
 <awWSwmvaTwBxfU-r@redhat.com> <CAHk-=wj3GCXZohdFWWPAOkC_LHno4X0oQW+0sQFJzRMvjpODUg@mail.gmail.com>
In-Reply-To: <CAHk-=wj3GCXZohdFWWPAOkC_LHno4X0oQW+0sQFJzRMvjpODUg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 24 Nov 2026 09:41:21 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgYc9vFEmyV0Ch_e49j6GOhUCMQMnMV4f1FLLvumZOmRw@mail.gmail.com>
X-Gm-Features: Aa3M54q3giT6wo2ga7GChn7kXWVMXAxnqCpSq2XjR2x6cUYwfDCbSn9Uo_kXYu4
Message-ID: <CAHk-=wgYc9vFEmyV0Ch_e49j6GOhUCMQMnMV4f1FLLvumZOmRw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] sched/wait: Queue non-exclusive waiters at the
 head in do_wait_intr*()
To: Oleg Nesterov <oleg@redhat.com>
Cc: mt4022@columbia.edu, Jens Axboe <axboe@kernel.dk>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Christian Brauner <brauner@kernel.org>, Michal Nazarewicz <mina86@mina86.com>, Wen Yang <wen.yang@linux.dev>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tz2294@columbia.edu, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Nov 2026 at 08:38, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, 24 Nov 2026 at 05:36, Oleg Nesterov <oleg@redhat.com> wrote:
> >
> > Well. It is not that I like this idea (and I bet neither you ;) but
> > we can add WQ_FLAG_EPOLLEXCLUSIVE set by ep_ptable_queue_proc() and
> > __io_queue_proc(), and change __wake_up_common() to check it
>
> Yes. I called it WQ_FLAG_POLL_EXCLUSIVE. Let me send out a series
> after I've cleaned it up a bit.

Ok, let's see if this works. It's been "tested" in the sense that I'm
running a kernel with these in place right now, and it all *looks*
obvious and builds clean both on allmodconfig and on my local kernel
config.

I'll send out the seven patches as replies to this email, but for
people who prefer git, it's also in my repo as
'review/wait-tail-only'.

It doesn't *really* add all waiters to the tail like that branch names
implies, but it's a big step in that direction.

Please comment and review. The shortlog and total diffstat both look
very reasonable to me (but I'm obviously biased):

  sctp: don't let a blocked reader take write-space wakeups
  sched/wait: add WQ_FLAG_POLL_EXCLUSIVE for user space waiters
  eventpoll: don't claim real exclusivity for EPOLLEXCLUSIVE
  io_uring/poll: don't claim real exclusivity for EPOLLEXCLUSIVE
  sched/wait: always queue new waiters at the tail
  sched/wait: remove __add_wait_queue_entry_tail()
  sched/wait: remove the __add_wait_queue_*exclusive() helpers

 block/blk-iocost.c                   |  2 +-
 drivers/gpu/drm/i915/i915_sw_fence.c |  2 +-
 fs/eventpoll.c                       | 12 +++++----
 fs/orangefs/orangefs-bufmap.c        |  9 ++++---
 fs/ubifs/journal.c                   |  4 ++-
 include/linux/wait.h                 | 31 +---------------------
 io_uring/poll.c                      |  8 +++---
 kernel/locking/percpu-rwsem.c        |  2 +-
 kernel/sched/wait.c                  | 51 +++++++++++++++++++++++-------------
 mm/filemap.c                         |  6 ++---
 net/sctp/socket.c                    | 11 +++++++-
 11 files changed, 69 insertions(+), 69 deletions(-)

and the core changes actually remove more lines than they add even if
the end result is a wash at equal number of lines added and deleted.

That net/sctp/socket.c thing really looks like a real bug-fix to me,
for example.

I dropped my rename patch because it's big and would distract from
this all, but I think it would be healthy to do eventually regardless.

NOTE! I obviously did *not* test the epoll or io_uring side, but I
really think those changes are also very real bug-fixes and the
current situation is just bad.

So I'd honestly rather do this series for back-porting than add even
more complexity to the waitqueues - and not even fix the fundamental
bugs.

But hey - feel free to tell me otherwise. Jens - I'd like you in
particular to look at the trivial io_uring changes - epoll can go DIAF
as far as I'm concerned, but io_uring really did have the same bug and
I guess we should care more.

                 Linus
