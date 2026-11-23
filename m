Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795414162;
	b=j+80uumlQWUq4zmbYLFBE3N4hp1RdfiQbpDUBpBt1W2mJ94JJYDwuQCmJDU1e4wgkHk6
	 NdOCF4a/zxvBdNI4pl6yF1vq35pUA1a1uFIVHbeGXoOoGMalTwonuCzJM8qECEfzvX/Bd
	 9eUyiwdLnpjq0WQ+/wXeeKC61hXR7JVyBfZRD7X3onsma5ojIvk5eXK9ASiperCxOij6N
	 LL4ojw/5aoDTOK+5y/mf+7cny45AXX5FHM/d/YfKI8eqtsQ1EC3wvD8zZjQXbzYD6OdLb
	 ikvWJMt3ABOryrkxDnim4VWn10yy67LnhJrEmQvp/USrbKhhbK4DpHHlWTck8vMoelw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795414162;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=t2KgnyE6y3G3qyTVuKd2f7Rb0fehrCr6u3Ubt8lKO9I=;
	b=2eZnfpUeGA4UsxqgKcdUo31+NXqHdB+HQWgQCYRnVGNvaY0S35MyzIapHG7OFkrz8TUb
	 jrMKHHMEL19BCC8Xf7JVDkf5XxDe3+VyNSdWmfY7+CaLAZ3XuT/BVWXCeoQAuMOPcSwtc
	 +t4bqEp8bzJwf2navE1PPBXA3nrgFJX3HIp5xQ7zyqmzdnxUvCzbKl5rTkSke+qy1A/Sa
	 r9JJpXXx4DskR0oawWDOsIh+7/oTBGdI5v2U1Ku9KKZ24njLbbmyoVV7pIwmeh6rEL93t
	 cULaWYw7xMzjA5wJXxAMDavUZBOSRhZbAa9tNBYRXK2C2yl1OE8lswhwfdLxQ8Ivzwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cYX2voKD;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE37606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:09:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CE37606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cYX2voKD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795414161; x=1826950161;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oO1z+qLfKklXP/jagH6t3e+mlh1PTw5A48p+3J+/KwQ=;
  b=cYX2voKDkifM4GrnvCinuFFVnLY+WSBoTtAvdEuJmQ4lWC6ccLckYIc7
   G9pfxWOc40ttPLGAKEV12BPfIie9kGCKu7GkbXOjoiG0spupKZUowOh4M
   f1rmPMaeiUqPVYr4qUPu1KVDdZ63EJiqL+TyOez8Ge5y3/Hb0GHN1DwAR
   xYebBRyQOteuuBCmKQJyNsebOi7GbRvA1Z99UtoItFlgkjaJmbFUztkTm
   DkkRDtzK8OyojPwKrPrzngxAC4c77KihvrAwqiYQhIWYkv5146QqijLNh
   eKNptx0PicccO0L3XUIL02i5TreOpkiKKU1Xac/JNYKoTNpsOfizj6hTH
   w==;
X-CSE-ConnectionGUID: 7XSWhOPeRAqJUq1CtDV4kQ==
X-CSE-MsgGUID: wf1Qt/aXT6uXay0GUc/j8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4118770"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4118770"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 22:07:50 -0800
X-CSE-ConnectionGUID: ffDSAAp4R5KonEcAWlKWPQ==
X-CSE-MsgGUID: nkllJ/BDTZKNCsZJ7zkHaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11420774"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 22:07:46 -0800
Date: Mon, 23 Nov 2026 14:07:42 +0800
From: "Lai, Yi" <yi1.lai@intel.com>
To: Fushuai Wang <fushuai.wang@linux.dev>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, kprateek.nayak@amd.com, sshegde@linux.ibm.com,
	linux-kernel@vger.kernel.org, wangfushuai@baidu.com
Subject: Re: [PATCH v3] sched/core: Fix a TOCTOU bug in
 sched_non_preferred_cpu_push_stop()
Message-ID: <awPYLifFxp2EnSHx@ly-workstation>
References: <20261120051742.50358-1-fushuai.wang@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120051742.50358-1-fushuai.wang@linux.dev>

On Fri, Nov 20, 2026 at 01:17:42PM +0800, Fushuai Wang wrote:
> From: Fushuai Wang <wangfushuai@baidu.com>
> 
> sched_push_current_non_preferred_cpu() is called in irq context. It
> checks is_migration_disabled() before queuing the stopper.
> 
> migrate_disable() sets p->migration_disabled in preempt_disable() section.
> An irq can hit after preempt_disable() but before p->migration_disabled=1.
> After the irq returns, the task cannot be preempted by stopper because
> preemption is disabled, so it finishes setting p->migration_disabled=1
> before the stopper runs.
> 
> It may be like:
>     task context:                       irq context:
>     migrate_disable()
>         preempt_disable()
>                                         is_migration_disabled()
>         migration_disabled = 1
>         preempt_enable()
> 
> So recheck is_migration_disabled() in sched_non_preferred_cpu_push_stop()
> before calling __migrate_task().
> 
> The stack may be like:
>    WARNING: kernel/sched/core.c:3432 at set_task_cpu+0x1b8/0xdf0, CPU#21: migration/21/152
>    CPU: 21 UID: 0 PID: 152 Comm: migration/21 Tainted: G        W  O        7.4.0-rc1 #3 PREEMPT(lazy)
>    Stopper: sched_non_preferred_cpu_push_stop+0x0/0xb10 <- sched_push_current_non_preferred_cpu+0x6a6/0x9a0
>    RIP: 0010:set_task_cpu+0x1b8/0xdf0
>    Call Trace:
>     <TASK>
>     ? set_task_cpu+0x5/0xdf0
>     move_queued_task+0xfc/0x650
>     ? is_cpu_allowed+0x341/0x820
>     ? __this_cpu_preempt_check+0x13/0x20
>     sched_non_preferred_cpu_push_stop+0x7b7/0xb10
>     ? __this_cpu_preempt_check+0x13/0x20
>     ? __pfx_sched_non_preferred_cpu_push_stop+0x10/0x10
>     ? __pfx_sched_non_preferred_cpu_push_stop+0x10/0x10
>     ? sched_non_preferred_cpu_push_stop+0x5/0xb10
>     ? __pfx_sched_non_preferred_cpu_push_stop+0x10/0x10
>     cpu_stopper_thread+0x205/0x410
>     ? smpboot_thread_fn+0x307/0xa60
>     ? __pfx_cpu_stopper_thread+0x10/0x10
>     smpboot_thread_fn+0x352/0xa60
>     ? __pfx_smpboot_thread_fn+0x10/0x10
>     kthread+0x3a6/0x4d0
>     ? __pfx_kthread+0x10/0x10
>     ret_from_fork+0x68e/0xb40
>     ? __pfx_ret_from_fork+0x10/0x10
>     ? __kasan_check_read+0x11/0x20
>     ? __switch_to+0x592/0x1210
>     ? __pfx_kthread+0x10/0x10
>     ret_from_fork_asm+0x1a/0x30
>     </TASK>
> 
> Fixes: 74699f56ebcf ("sched/core: Push current task from non preferred CPU")
> Suggested-by: Peter Zijlstra <peterz@infradead.org>
> Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> Signed-off-by: Fushuai Wang <wangfushuai@baidu.com>
> ---

After this patch applied, the call trace cannot be reproduced.

Tested-by: kernel test robot <yi1.lai@intel.com>

> v2->v3: No code changes, just add some comments.
> v1->v2: No code changes, just improve the commit message.
> 
>  kernel/sched/core.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 5ed660f099a5..c351d708aab3 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -11314,7 +11314,8 @@ static int sched_non_preferred_cpu_push_stop(void *arg)
>  		rq->npc_push_work_pending = false;
>  		update_rq_clock(rq);
>  
> -		if (task_rq(p) == rq && task_on_rq_queued(p)) {
> +		if (task_rq(p) == rq && task_on_rq_queued(p) &&
> +		    !is_migration_disabled(p)) {
>  			struct rq *dest_rq = __migrate_task(rq, &rf, p, cpu);
>  
>  			if (rq != dest_rq)
> @@ -11355,6 +11356,11 @@ void sched_push_current_non_preferred_cpu(struct rq *rq)
>  		if (rq->npc_push_work_pending)
>  			return;
>  
> +		/*
> +		 * Racy: is_migration_disabled() isn't stable in IRQ
> +		 * context and can race with migrate_disable(). The stopper
> +		 * should recheck it.
> +		 */
>  		if (is_migration_disabled(push_task))
>  			return;
>  
> -- 
> 2.36.1
> 
