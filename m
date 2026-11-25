Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795633809;
	b=XRtekJF560L/lZbXcPasVLTPOO8d6II+Nfi5/DBmUNUehGoF5usTS+U3KMcWfT4t6w2/
	 sryioCFNroSniPatixjwvD9///UCFjiwI25Od2n3qaaoGoX5sT1uktQ8BfVz9OL5+Me3b
	 p4TRubzaR+cWtixCbOne9Qi20RSciK4tgfknbtwEFkaGeMetzscvqH0Mm9sfapMvUvqeC
	 n6D00XOIcY6WKOJZePjenbr0cHWk8dupkPJ2JzkGPpdCJA/MvqgNI7iDU5w4VPvudVeGR
	 sFpIbiqQRnkPqMfuzdsMHnGaM43jcT418TVDu4S79e0AIhsqN0moXKXMYzZUuMboR4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795633809;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=jm1CHZxWqdQ+jQ2UwTEtX9/pCyL2KGtxL2e3RWhJL4w=;
	b=ZF/BylQrNDX8ArzWDop95xybVomSkww6eWRO7VJmmlJbVr0IcsPfZBeIdoCMRWKqb8re
	 hB/wPq9GNHeU/nRPUKQZA2C8BwDj1QFdJtra7BFUuYDMQgRrj2LrdwqX+YcdAqHoxsUB4
	 axM/+z2qO056xYkmlBkz3Zi9cFtJaieDzF0w5qWormrqEaDNIGQ30WlZBFJPvquv162Ck
	 WYnUlZyaj6XMusHYGH4X2bP8LIMhtImu8VBJABZTR6ri972iyMUmeKWc9n+JTXtz8sHYr
	 IbWbOJeHjYDQb9+KxOlMzuaGdodrvwgeuCqvXNVc9xbymfGdSvvchHAlIEDd2q/iRkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=vnQigsCB;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D3AF606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:10:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D3AF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=vnQigsCB
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C4061596;
	Wed, 25 Nov 2026 11:10:05 -0800 (PST)
Received: from [10.57.72.178] (unknown [10.57.72.178])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B9A63F86F;
	Wed, 25 Nov 2026 11:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795633808; bh=uqklgFaFEZUkcRQwwZS64tnN5hwrw14ARxdmJIlUlRg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vnQigsCBhn9Hcvdh6/IOe2BmR4itIT0eNELS08zC5dgbzW4wu/TK7fFDRbIxJ89Cr
	 75yBvLboY7S+72sMpTmMSx8iN9ZJLAm+D9x5cVNXFdF2ielmH2hQlp7H9W+dSnVEST
	 61+8d9xbDcnT2uIrO6XqSN/5mQK2TtBWbrDMaKL0=
Message-ID: <3be9a901-ee11-4aa5-b891-889d3bde2221@arm.com>
Date: Wed, 25 Nov 2026 19:10:04 +0000
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
Subject: Re: [PATCH v6 1/3] sched/uclamp: Fix race condition leading to
 imbalanced uclamp_rq
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Qais Yousef <qyousef@layalina.io>, Ingo Molnar <mingo@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, John Stultz <jstultz@google.com>,
 linux-kernel@vger.kernel.org, Kayra Cizmeci <kayracizmeci@gmail.com>,
 Wei Wang <wvw@google.com>
References: <20261121041507.39582-1-qyousef@layalina.io>
 <20261121041507.39582-2-qyousef@layalina.io>
 <282a3922-91da-4145-94b6-d1a6459b6da6@arm.com>
 <CAKfTPtAT_gPBMaw_xyjkY4TTEA6+kuPBAAyNvMvT4Uq6T42xkA@mail.gmail.com>
 <8150e8ee-cd2c-41c0-8c5c-3f0c7a087ac2@arm.com>
 <f607fd0e-64ff-4b1e-92b0-88cd04fd6ffb@arm.com>
 <CAKfTPtAxbSMg2NkNP4t5Edsb2DUkpEOKntno90rPvPwkphpETQ@mail.gmail.com>
From: Christian Loehle <christian.loehle@arm.com>
Content-Language: en-US
In-Reply-To: <CAKfTPtAxbSMg2NkNP4t5Edsb2DUkpEOKntno90rPvPwkphpETQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/25/26 17:15, Vincent Guittot wrote:
> On Wed, 25 Nov 2026 at 10:13, Christian Loehle <christian.loehle@arm.com> wrote:
>>
>> On 11/23/26 18:15, Christian Loehle wrote:
>>> On 11/23/26 17:23, Vincent Guittot wrote:
>>>> On Mon, 23 Nov 2026 at 15:38, Christian Loehle <christian.loehle@arm.com> wrote:
>>>>>
>>>>> On 11/21/26 04:15, Qais Yousef wrote:
>>>>>> Static keys are not guaranteed to be enabled atomically across CPUs.  Or
>>>>>> across callsites on the same CPUs. Which means when sched_uclamp_used is
>>>>>> enabled, some CPUs/callsites will return true for uclamp_is_used() while
>>>>>> others won't, leading to asymmetric uclamp_rq_{inc, dec}_id. If we
>>>>>> decrement without increment this is safe as documented in the code. But
>>>>>> an increment without a decrement is a problem and will leave the
>>>>>> uclamp_rq in a corrupt state.
>>>>>
>>>>> So if we only need decrement to work then we can rely on
>>>>> p's uclamp_se.active and decrement regardless of uclamp_is_used() and call it
>>>>> a day?
>>>>
>>>> The static key prevents overhead for those who don't use uclamp. It's
>>>> a default rule for features like numa, cache aware, eas, uclamp etc to
>>>> not impact those who don't use it.
>>>> I'm afraid that the executing  uclamp_rq_dec up to
>>>> p->uclamp[clamp_id].active will not be free of overhead
>>>
>>> I get why the static branch is there, but as long as p->uclamp[clamp_id].active
>>> never changes from 0, like when uclamp is never used, the check should be virtually
>>> free on any half-decent branch predictor.
>>> Also in any case the enqueue path ought to be the expensive part for uclamp.
>>>
>>> I can come back with some numbers though, including the original netperf that
>>> introduced the static key.
>>
>> So I compared mainline, my dequeue-only fix and a version where uclamp_is_used()
>> always returns true (i.e. no static branch optimisation at all).
>> A MeteorLake, Xeon and Orion, all compared to mainline as a base:
> 
> I did a quick test on my favorite dragon rb5 with perf sched pipe -T ,
> perf cpufreq gov and only WFI:
> - on big, the diff is -0.7% (+/- 0.30%)
> - on medium it's -1.85% (+/- 0.20%)
> - and on little it's -6.53% (+/- 0.15%)
> 

Looks in line with my results on Orion I'd say,
FWIW here's the diff I'm proposing on top, proper will follow once I've completed the
full results, but if you wanna have a go already and (hopefully) convince yourself:

----------->8------------

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 3c141aaae6a7..850088eeda5f 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -1900,8 +1900,12 @@ static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p)
        /*
         * Static-key updates are not atomic across callsites. An enqueue may
         * have accounted this task before this callsite observes the key enabled.
-        * Let uclamp_rq_dec_id() use uc_se->active to match that accounting.
+        * Check the task's accounting state instead. Both clamps are updated
+        * under the rq lock, so either active flag is sufficient here.
         */
+       if (!p->uclamp[UCLAMP_MIN].active)
+               return;
+
        if (unlikely(!p->sched_class->uclamp_enabled))
                return;
 
(END)

