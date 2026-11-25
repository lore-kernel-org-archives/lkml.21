Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616859;
	b=vM36JLO8YY7nB9r380eZsX3ee0KhaNIdTtkRjWabBAwtI/C7DhCCnjl4Hegv9hkBytFK
	 A0hqhbrqQU2fv0qOYRJOCaeIOIOKx37QTVI/G+dvjNqrwGPOgyj4nFLPMe+WpN11cbMPB
	 oo0il40pRliY16Hut2nn+KQO0qNCItmqRW6sbSx0Yd/pND9SVZJUfemR7/aGIiKqo6bW/
	 2iUVZeqVVSeVH64+sD9XiPjOZC9cshYjbJlY/q3l9qW+s5pvAlNxqfGxUsL0C6oBHkLFr
	 4f4XkyLaHpL126407uY9WH2yf1ziKHoYsfkCNvnVE+3JvYJrhDMZHU77OAmmbQQMd3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GWqzHfA/XkUcXcnXSR3YIPKBqFz4dbh5Ysb+/TLkP0c=;
	b=AygUm4V5aDlxOyx0RxPQ+hoj8MJ9r3BLc35htkGQMWuNkQ+HiTtKTHjf0pQ5Q3ySNqHt
	 9kQ5KQGh0daM+3nfF+I3e7vjcV/QytOc8kTYddbec5BXbp9xgB5vU5cqnW4sPUgs5Ffdi
	 It3166iSNEYRFPJLsOekPW6Si5DTxMXL2s6dRI1QTEyF830X1OD2TDjpXBVsXu1vdcOLF
	 mj+ClRHejLAxiVYgxSZtIe4CH+xc7KyUKadAvaawwDHn92j8yIpDrVO2HmDMk+gwTg/Yf
	 RjjJZZYUZlBbIXMxPZsvRvDc9zyUq8H9nhG1UGsK5sE9dL6vFu1eDMd+g0qjXUctmbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HQYzQjSw;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6F6606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:27:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD6F6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HQYzQjSw
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-8629ef8613aso2272215a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795616858; x=1796221658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GWqzHfA/XkUcXcnXSR3YIPKBqFz4dbh5Ysb+/TLkP0c=;
        b=HQYzQjSwli0oAKpRO4to5LTASzfCogeuIVbWS7y+aMseupkFdDH+UZhPh6xudloI/W
         WpE+L2o4jKmg/Nx2E7gC+o3Z8dkVcsz5Z/25Iagjgksqyj12HC3pEH3Kkh0yyWhkD6wB
         MKjASn7mAsE0Ykv7WYHxW8PmQFJGMpDQQjtlkoQNysBp4SN5cKCp0vKprh4U9hfr2FXD
         Sx5VCk1yvssuMhl+4nz1UZ4029Xe+XstWc1nMzxETQ2VbJtSJbeWxDkqbeZ8O20XGR4i
         MU1i2u3CMiMdti2t4cx6n/J0RDM6gxncRk7aEwXgzHV7CzXC+AtZO2kYmZ803zZbL4pl
         QewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616858; x=1796221658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GWqzHfA/XkUcXcnXSR3YIPKBqFz4dbh5Ysb+/TLkP0c=;
        b=ruo/9Qa3nVhoIrjyvXR0PYKHpLHEXgX7Gdp+21AYQH1jZYL/JhYncbQOsYmnQrZc0I
         KgNYj6RB21PNnnwb7fdGS26DkWFQ8ZJxfwawHokVNfgoul1IpYXmS3b+T98Z7aTjbL9u
         g5wjMQX4RrSWglrHjUYY+1bxQE9zcb/FP8EDteR+uo/a/Je/CTwCLvC7MLF0UPgGapOl
         JEMjGVrYEx8qdftd/sfhl0SpW+EiATzcLwUnwM6kc2lMQzjImUiewwKkP1Fq4Un7wx74
         tfZIaYR1LpQEr2U1rUhJ8ebPmm9HrwNjjr5EVWqrn2yYCki3meCSBWy/Y8v8zwHEHJyY
         HkVw==
X-Forwarded-Encrypted: i=1; AL+hErFWh0+5UZBw8SU7pScYiYexUegFy/VV+KpfPO/FKodZrY2cjGnQU6Cdp3mXjw8yOacw1kcznrIB2rboY0k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SEHkwyChkRHb3DToWnfFITseLvHWA73xYB0Wwic6crzQDHx99
	ezKnd76BBENGftFLp93nsSCtyAPl6yb/K3zlw+Urz7k/SoXRfL8jZ2Ec
X-Gm-Gg: AZFdTZf0XPMjvJw+EwygShEu7oXMvyEVzO0z7M1asvlocyYToLut2RpAL4wWjvKZlqq
	wtO0W980jlzevPVhm1oDN8qsV+FP0lQwCF7DBZ6lZBKi1eRvNdLok5Gx2ZTbEZ7HXmj+u1pgkfA
	3VEom7tAbXtMZAl0UvH2Db9vs1L0ONKeuCS90BOSDDWt1bZc8NNY/nvW/FgPc8KkQWrWVU7yKaw
	QZ2AQP9H5TtBXosSB9dqkb05KEQGdaHcGsQsLhsIubQmZfIIj7HVrEWHFk/SZc/llgiF5Kxxj33
	5WSbztMRvvUxbd0kfYUwPutu5FHRALJWCwK63fEXTn6EvBQla7GajpX3U2c75JIfaZZZ4x5Ow1F
	c/A4y07DbG8bhHqgwxFALiXODl+3rI8IXvH5m6B7rxOQmQ3xQmzGdO7xUzbYkIlLlbD8c3YpFRD
	GaeTU8ybkBq8vRT1xV+jbc+XVKQpSV/9K4xT++ImP8KvZ6rUirKcikQVCZCWmYAiqYxyPntaCd6
	spdkapEgG+uHmZbuV66h7qhMBu6lCUAVPbwi3wIbAwJHcRjo3lK+m46z+clkeaB+gGMElhHmfI0
	ygw3GeWf
X-Received: by 2002:a05:6830:4412:b0:862:b15e:243a with SMTP id 46e09a7af769-8631565d3e4mr18399948a34.17.1795616857588;
        Wed, 25 Nov 2026 06:27:37 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:47::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168c1bc5sm12509087a34.6.2026.11.25.06.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:27:37 -0800 (PST)
From: Vlad Poenaru <vlad.wing@gmail.com>
To: Prabhakar <prabhakar.csengg@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Chen Yu <yu.c.chen@intel.com>,
	Christian Loehle <christian.loehle@arm.com>,
	Alexey Charkov <alchark@flipper.net>,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH] sched/fair: Fix h_nr_runnable leak in dequeue_hierarchy()
Date: Wed, 25 Nov 2026 06:27:29 -0800
Message-ID: <20261125142729.3161777-1-vlad.wing@gmail.com>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261123001213.7609-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261123001213.7609-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On Mon, Nov 23, 2026 at 12:12:13AM +0000, Prabhakar wrote:
> h_nr_runnable is therefore always 0, so dequeuing a task that is not
> delayed no longer decrements cfs_rq->h_nr_runnable. The count only
> grows, which inflates se->runnable_weight and skews PELT runnable_avg
> and load balancing.

The leak also crashes machines. In Meta's kernel testing, a one-hour
stress-ng soak on 176-CPU x86_64 machines hits a divide error on our
internal kernels based on v7.4-rc4:

  Oops: divide error: 0000 [#1] SMP NOPTI
  RIP: 0010:update_load_avg+0x267/0x800
  Call Trace:
   task_tick_fair
   hrtick
   __hrtimer_run_queues
   hrtimer_interrupt

15 of the 16 machines that ran the soak on these kernels crashed this
way, and the 16th left no crash record. None of the soak runs on
v7.4-rc3 based kernels crashed.

The divisor in update_tg_cfs_load() is
scale_load_down(gcfs_rq->load.weight) truncated to u32. That weight was
0xfff8000000000000, so the u32 divisor is 0. Once the leaked count
pushes tg->runnable_avg >> 10 past INT_MAX, tg_tasks() returns a
negative int. calc_concur_shares() then gives clamp_t() a negative
upper bound, and that becomes the group entity weight.

This patch is based on sched/core and does not apply to sched/urgent or
to Linus' tree, where 486c3d06b902 ("sched/fair: Avoid transient double
accounting for delayed tasks") is part of v7.4-rc4. In those trees the
h_nr_runnable line comes before the h_nr_idle line.

I applied the same one-line change by hand to the v7.4-rc4 based kernel
that crashed. One soak run on it then completed all 200 iterations
without a crash.

So I think the fix should go through sched/urgent before v7.4 is released.

Tested-by: Vlad Poenaru <vlad.wing@gmail.com>
