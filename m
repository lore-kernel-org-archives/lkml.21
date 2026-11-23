Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441030;
	b=lrhMZ36PdVFwgUW6DUkVDyZIMqXJ+eC3/8q4G+4vExN4CFsyZt193JxKwUhG8TIvbrxd
	 QZefeR572EB7PvcopTbY8lbO8I9N2qvJ9rnacsOj8wjekskVRc7+cJOvUQ/mk/1TWuvRX
	 RJ5HQfv4Cq3Q7mLYfmC02jWLlCPGsswFsus3mGr4PrqacxGQwE24byqt0V8KDn6tf92Z7
	 Yxt00dYk7XfwRmasmGRCshKHhy9hT9uk+wU2GccpPDf/Z84dVM48c5SxlPQ3nF+mXkhmD
	 YrAlsIz/Wr41mqjnkHR/Qeq5ZRa73irZf0a1MHbdtb+Tde6nobQDHk25YFMXCYOxezw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441030;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=OuYvkiIx/Jag1sVwH3J3FxvfVcAfu7tcBTkrfaEq9+E=;
	b=A5uim5AuRFsNbFsfajsMHs9A6Y8+/UI8MA9v9DkGyAhcSrwFqUM148yqX5+o4SDqKu/3
	 epJNxp8j9eOdir42bTiQJw/Rvcgj+4JFlWcRNTP0D2ECPUn1oXZpdX/azIhBKfSUqZ6ct
	 sGmEN57ztrqw2iQ1yKwKv4GAb24s3x4YR4cQA4tUXnp/5EmDrF2SL7iDKl6qEKEAFM3UR
	 +34Sbv8t2W8cV0pSTZV5dFbVYsTZUuzRYgIVqm4oe7PPnEK5TIImC3VlcaiIiKT2s0sbk
	 oPPn4oFkzlJ6dr5+HY7Qt2YdqG9l6tUjBWnF/84vU6w1zCzLwhqpcUjetuESmnelMQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Cr3+J4Sl;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E518606A68B
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E518606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Cr3+J4Sl
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 034EA143D;
	Mon, 23 Nov 2026 05:37:02 -0800 (PST)
Received: from [10.57.71.117] (unknown [10.57.71.117])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E945E3F86F;
	Mon, 23 Nov 2026 05:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795441024; bh=4y4jq5YpnSYd9n8rjuuI1wDcwGNguMJjUFvQgJ3GIxI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Cr3+J4Slqdzp0n9fqSZPyp9s/2JO2IPhTGDBxuX5S59Lmh07dx5tT/Diq4yARML6Q
	 7PqMAZNWqVjCLGJg2bUD92NFZQtrJZ9zHRI87Kbpy5AWUFsZTeMRdlhYnfz4eUDXSH
	 cfA5zmYQoP8vloZcO07QOG6uLokdZ50fZR3ynBvc=
Message-ID: <a28c8238-788e-4f84-a7cf-ef130e92a2fe@arm.com>
Date: Mon, 23 Nov 2026 13:36:59 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/fair: Fix h_nr_runnable leak in dequeue_hierarchy()
To: Prabhakar <prabhakar.csengg@gmail.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>
Cc: linux-kernel@vger.kernel.org,
 Prabhakar <prabhakar.csengg+renesas@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261123001213.7609-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Christian Loehle <christian.loehle@arm.com>
Content-Language: en-US
In-Reply-To: <20261123001213.7609-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/23/26 00:12, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Commit 486c3d06b902 ("sched/fair: Avoid transient double accounting
> for delayed tasks") changed the h_nr_runnable logic in
> dequeue_hierarchy() from "set to 1 unless delayed" to "set to 0 if
> delayed", but left the initialiser at 0:
> 
> 	int h_nr_runnable = 0;
> 	...
> 	if (se->sched_delayed)
> 		h_nr_runnable = 0;
> 
> h_nr_runnable is therefore always 0, so dequeuing a task that is not
> delayed no longer decrements cfs_rq->h_nr_runnable. The count only
> grows, which inflates se->runnable_weight and skews PELT runnable_avg
> and load balancing.
> 
> Initialise h_nr_runnable to 1 so that only delayed tasks, which
> set_delayed() has already accounted for, skip the decrement.
> 
> Fixes: 486c3d06b902 ("sched/fair: Avoid transient double accounting for delayed tasks")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

My Pixel6 tests found a ~3x power regression from 7.4-rc3 -> 7.4-rc4 with
both EAS on and EAS off (i.e. CAS), caused by
486c3d06b902 ("sched/fair: Avoid transient double accounting for delayed tasks").
This patch fixes it, thanks!

Tested-by: Christian Loehle <christian.loehle@arm.com>

> ---
>  kernel/sched/fair.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 731d78155e65..2d9d3d686261 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -8294,7 +8294,7 @@ static void dequeue_hierarchy(struct task_struct *p, int flags)
>  	struct sched_entity *se = &p->se;
>  	bool task_throttled = flags & DEQUEUE_THROTTLE;
>  	int h_nr_idle = task_has_idle_policy(p);
> -	int h_nr_runnable = 0;
> +	int h_nr_runnable = 1;
>  	struct cfs_rq *cfs_rq;
>  	bool dequeue = true;
>  

