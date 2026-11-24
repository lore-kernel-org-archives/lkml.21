Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.134.164.83
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543991;
	b=td/fWsUcfN7050u0G1DS1bOPEKyq7u+KW/l+Yd9F64AbpxisuRnsNheRcUay0KiGic8K
	 58qu5HND0yK9wuf3ujippQk6v/AuwR0PUvzvgHYIVLxHq9QBXIyDVbEpGTk2f6/x0Cxv4
	 ejm9EK/9zPoiSwXRkoftBctyZ5FXCmKpnUeS1GghOifBHjs8fi99JIfmBYx7NaaJtymix
	 08eYfcM79zfniKcVy8aS7N6k8RbfMi1bv9LMocL8tQaTY5kyfHJfkwKfI0N6aX6CSkA34
	 Ubj+swiicFCFLYiA4/gDzH6hOQAuKWLxS5kI7p/yKrNrRJ6CSPNF7KTJ7MSh0rlEQNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543991;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=UWXbji1X4pxMzbXfxu88bQcgXa0uUzb1/+z2PU7DMrE=;
	b=uc+Mb3q7VhqxVQ47cs1uDAG1YDUEobbAWJzF08KgUXl4pWhdCqd7JwIGnjxgChw1K5Ie
	 x9kj39nyzdU13tyeRu5UcLT+EVA5s9BsSiKslOZIopPUoBrMDs8fbS/BnWAWbKfIty3//
	 mK7Nzn77ape7Z1bexXSWYYCg6D3LTtZALT3uTVMeEvw2/AV4yHELBQDQlV2xreYE3L5ur
	 Zlsv5giKrsTJ/xNWJRjhsoiD/0pMm0TKbgg2eN8QV6sKd6Rr4abUdZuNv1+mpVg3TaJnL
	 W5gDGPbgVRSQXbJ7q+hLL3g6sWKJ/PfhMTzX62QgWJD+1sNMXFubpQEwmS5IuYn3arQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=inria.fr;
	spf=pass smtp.mailfrom=inria.fr;
	dkim=pass header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=kLtZCBId;
	arc=none smtp.remote-ip=192.134.164.83
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E4E606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 18:13:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0E4E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=kLtZCBId
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=UWXbji1X4pxMzbXfxu88bQcgXa0uUzb1/+z2PU7DMrE=;
  b=kLtZCBIdI1R3nZKaeAHSJEIle6jrTdTVGH4wTGtCm3UFM+tRSOtQW4u3
   AT/e2VbNkgxReb1XFmp4WBVPIq7qTJG71zuiI4q1BQR+eU66qQRM3q2Jx
   MyrE/ykZmKyrMqtQ1XLaBt1YmBXgCf52lW2W5vg5nb4IyvvYH8SougTNu
   M=;
X-CSE-ConnectionGUID: m04h4fJsQPe5s9trrWFVsg==
X-CSE-MsgGUID: vnsbjmTmRx+Vyz9U2G9L2A==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=keisuke.nishimura@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,231,1787004000"; 
   d="scan'208";a="307166254"
Received: from dt-aponte.paris.inria.fr (HELO [128.93.67.66]) ([128.93.67.66])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 19:13:07 +0100
Message-ID: <1939197c-ef2d-43e5-8243-3c6e6217d7ba@inria.fr>
Date: Tue, 24 Nov 2026 19:13:06 +0100
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
Subject: Re: [PATCH] sched/fair: Don't pick recent_used_cpu if target has no
 LLC domain
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, linux-kernel@vger.kernel.org,
 julia.lawall@inria.fr, jean-pierre.lozi@inria.fr
References: <20261124155107.358643-1-keisuke.nishimura@inria.fr>
 <CAKfTPtARqb5VW0LBxDjGK6cZV7+6Ba4EsjchEMjqO6L2PkiHHg@mail.gmail.com>
Content-Language: en-US
From: Keisuke Nishimura <keisuke.nishimura@inria.fr>
In-Reply-To: <CAKfTPtARqb5VW0LBxDjGK6cZV7+6Ba4EsjchEMjqO6L2PkiHHg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

Thank you for the feedback.

>> select_idle_sibling() can return prev or recent_used_cpu if they are idle
>> and share the LLC with target. However, cpus_share_cache() returns true
>> for any two isolated CPUs because their sd_llc_id is never set and keeps
>> the initial value.
> 
> Are you sure that's because their sd_llc_id is never set and keeps the
> initial value? Or it's because they are in the same llc_mask() and we
> use the same sd_llc_id for all CPUs in the same llc_mask ?
> 

In the patch, I meant CPUs isolated by the boot parameter isolcpus,
whose sd_llc_id keeps the initial value. But in the case of cgroup
isolation, the following statement

 > their sd_llc_id is never set and keeps the initial value.

is not true, although the same problem occurs. I will change the description in v2.


> Being able to set a dedicated sd_llc_id for isolated cpu seems the right option
> 

That might be a cleaner fix, but I am afraid it would be a bigger change. The id 
may need to be updated whenever a CPU enters or leaves an isolated partition in 
cgroup? Since the id also seems to be used for other purposes, e.g. index of 
per-LLC arrays in cache-aware scheduling (llc_id), the change could affect more 
than this issue.

As checking sd_llc already covers both boot parameter(isolcpus) and cgroup's 
isolation, would it be okay to keep this fix in this function?


>> @@ -9175,10 +9175,13 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>>              asym_fits_cpu(task_util, util_min, util_max, target))
>>                  goto select_smt_priority;
>>
>> +       /* NULL if target has no LLC domain, e.g. isolcpus */
>> +       sd = rcu_dereference_all(per_cpu(sd_llc, target));
> 
> if sd_lls is null, can't we return immediately as there is no shared llc ?
> 

Yes. I will do early-return here in v2.

Best,
Keisuke
