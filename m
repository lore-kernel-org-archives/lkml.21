Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795531578;
	b=U8e5x19qgqkQZVjac9QDOfzTzMbVgTIm1gyTYRqUrVBo1VbVKaUtaMPJfO8MBc8+svBV
	 faK2EDhTV/tBGhXUv4QmgQQ23/6c1EuO+eVJnF3VuzHG2xd514lPG3SZnLG9lH24khxbZ
	 ZZvQE0FyeGrLq0niV7Z8bUIAZM4Ra014/GUnFFT9MAglr23FhgRowE6FVTue1K7ObnRLW
	 e9CvFkQ/ff6XvG11EPU34P3QmGVg3NzgT4O1Q+j/DUrHVvr+gu3WgQQOiJ9ecWwgbNPyC
	 3FjLTWhNeG/Q00g+BAKYHOJIaOm0ENUh9MirSW1j745TdvNjFTKhYHGRq6CtprNKNEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795531578;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=f12JtG1kNfMEsQ0yLsPOKoOKzB4AJutvHAiCEwmSVsE=;
	b=c3l6xOBhZE8MSdDvYFECOysKu7k1QN+ziESXDYBluvBUf87zstWg0AqI2qBcsWdw+Ffe
	 nIQigJyTVJI5kWF/g7rHc3YBoc1rrM+/UvT5AnIUaYIwN0l1T3XD/k02a5jXR/ioEMCP+
	 3cdxriomBcyQi808GgHAKaFksmjulqs2hNtjddhtiN5yRIvajyAeoAGhRTSZDDL6hZkMU
	 F58DvoB/fGfLMG9P+oM5V6pulhiA4xSqozFYlniuGcr2hFqkd2i4r4rQyS8n6tPh12H2+
	 vI74baIQieINCWCxi3DU1jXWnFVn1G3+O7pL4QZVNA+Ip1aRFYaZc2DYstyViXVtxsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PgjfOoqp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7257E606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PgjfOoqp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 136371F000CA;
	Tue, 24 Nov 2026 14:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795531577;
	bh=f12JtG1kNfMEsQ0yLsPOKoOKzB4AJutvHAiCEwmSVsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PgjfOoqpu44dhJThURLk5x0UtJ08D/W1DhW3RzBr4s3s1QjcpGJG0uUDWjxu50zg7
	 4RSN2kYlW+BevWyWdZa3gCldhqAmT2gz3WkUJgKCGX+isFqkks3mXMaD8gLzSgPV/P
	 UddlbmJ9fdnz7Vh7qgRqArIYB/UrBYyDW4/w+WKPj34oi3/5HRflins1xGLkrRW8xH
	 3b+3geK9NKke1jqju8DwZqoKJ2I/BDsUpdgPZoK8/cDubWhpYgDk2309yfpvljoYkv
	 WXNhSHuoOm3tWMbPPS66szLVgpmapQcguIoKIjE3H28tJyT7zxodiJDjNBjYI7Jw/g
	 fqjzLM5OY7LnA==
Date: Tue, 24 Nov 2026 15:46:14 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Michael Kelley <mhklinux@outlook.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Naman Jain <namjain@linux.microsoft.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Phil Auld <pauld@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Waiman Long <longman@redhat.com>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 00/47 v2] cpu/hotplug: Remove cpu_down() global
 stop_machine() except for CPUHP_TEARDOWN_CPU itself
Message-ID: <awWjNvjoHUMOqetC@localhost.localdomain>
References: <20261105163045.38862-1-frederic@kernel.org>
 <MN2PR02MB6863080FA24079F8F2F1879AD4462@MN2PR02MB6863.namprd02.prod.outlook.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MN2PR02MB6863080FA24079F8F2F1879AD4462@MN2PR02MB6863.namprd02.prod.outlook.com>

Le Sun, Nov 22, 2026 at 09:26:13PM +0000, Michael Kelley a écrit :
> From: Frederic Weisbecker <frederic@kernel.org> Sent: Thursday, November 5, 2026 8:30 AM
> > 
> > Hi,
> > 
> > As discussed in LPC, cpu_down()'s stop_machine() is a problem for
> > running real time and nohz_full workloads, for example if we want to
> > provide a cpuset interface for nohz_full and isolated partitions are
> > created at the same time as those critical workloads.
> 
> I'm looking at this patch set specifically from the standpoint of Hyper-V
> and Patch 39 of the series. But the top level "why" in this paragraph
> seems vague to me.  I presume a key goal for RT workloads is to reduce
> the interval that stop_machine() has all CPUs paused, since during that
> interval RT workloads can't do anything and might exceed their response
> time commitments. And this goal applies when the system is staying up,
> but one or more CPUs are being taken down.

You got it. One CPU going down has an impact on all CPUs.

> If the whole system is being
> shut down or doing a kernel kexec, is the stop_machine() interval an issue?

No because if we shutdown or kexec anyway, no RT task is relevant.

> Do you have any sense of much this patch set reduces the duration
> of the stop_machine() pause? Just wondering if it has been measured
> and is significant enough to matter.

No because it doesn't remove stop_machine() from hotplug yet. However
it is a mandatory first step towards achieving that.

> Your paragraph above mentions a cpuset interface for nohz_full and
> creation of isolated partitions, and I don't know enough about those
> topics to be able to map them to the duration of stop_machine() as
> invoked by cpu_down(). Can you clarify?

Currently nohz_full= as a kernel parameter is the only way to activate
full isolation. But we want to provide a runtime interface to allow for
more flexibility. Also enforcing CPUs to be down while switching to/from
nohz_full mode will make things much easier for that. Yet we don't want
those CPUs going down to impact real time tasks of other CPUs.

> And are there any other problems with cpu_down()/stop_machine()
> other than how long all CPUs are paused?

None that I know of but it's a significant issue.

> > Here is a first step to start. stop_machine() gets a new "post" callback
> > that is executed after the main one such that:
> > 
> > * As before the main fn executes while all the other CPUs spin.
> > * While other CPUs can exit stop_machine(), the target keeps IRQs
> >   disabled and execute the post_fn.
> > 
> > All the states between CPUHP_AP_ONLINE and CPUHP_AP_OFFLINE are moved
> > to the post callback because they can eventually run concurrently with
> > the other CPUs. I made a dedicated commit for each of them with
> > individual justification analysis and tweaked a bit CPUHP_AP_TICK_DYING
> > to adapt it.
> 
> Maybe it's obvious, but perhaps you could explain the "why" for embedding
> the post_fn in the stop_machine() mechanism vs. doing something separate
> after stop_machine() finishes. I presume it's because you want to preserve
> the locking and interrupt masking that stop_machine() does.

The interrupt masking yes indeed. We can't reenable the interrupts halfway on
the target.

> Having stop_machine() release everything, and then re-obtaining introduces a gap
> that might be problematic. Or is there some other reason?

No that's it.

> 
> Also, I presume the order in which the CPUHP_STATE_* states are executed
> during the "CPU down" path does not change. States between
> CPUHP_AP_ONLINE and CPUHP_AP_OFFLINE are executed as before,
> just with difference that other online CPUs might no longer be paused.

Indeed.

> > Please double check CPUHP_AP_CPU_PM_STARTING with which I'm not too
> > confident.
> > 
> > In the end only CPUHP_TEARDOWN_CPU (which is __cpu_disable()) remains in
> 
> Does "In the end" mean "upon adoption of this patch set"?

That one yes. But I'm already thinking of moving __cpu_disable()
out of stop_machine(). It just requires some more thinking.

> Or is it referring
> to follow-on patches that haven't been submitted yet?
> 
> > the global stop machine, this will be the next step. The plan will be to
> > (all with IRQs disabled)
> 
> The phrase "this will be the next step" seemed tacked on here in a
> way that the meaning isn't clear to me. Can you crisp-up the language so
> it is clear?

I'll try at least :-)

> I have a general but limited understanding of CPUHP states, and of how
> stop_machine() works. Within the limits of that understanding, the
> core code changes look reasonable to me. But I can't really give a
> "Reviewed-by:".
> 
> I tested this patch set in a VM running on Hyper-V, which uses the
> CPUHP_AP_HYPERV_TIMER_STARTING state that is moved in Patch 39 of
> the series. Taking single CPUs offline and back online works. Taking a
> panic and kexec'ing into the kdump kernel works. Normal shutdown of
> Linux and the VM works. Are there other scenarios I should try?

Thank you very much for testing this. I don't have other testcases in
mind. Except rcutorture that is a good stress test challenging CPU hotplug.

> See also a couple of comments that I've put in Patch 39.

Ok.

> 
> Michael
> 
> Tested-by: Michael Kelley <mhklinux@outlook.com>

Thanks a lot!

-- 
Frederic Weisbecker
SUSE Labs
