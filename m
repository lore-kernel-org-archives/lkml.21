Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795141482;
	b=cmU8t9Wq0hEZhW2K5Y+Zz3xia987fc8P7k6qPnRpri/vrJYJ3PvrFdxj6ZWWZbGZBluu
	 TwknwREwAvMvCavLcv0LRBLOINB4sJ9ZdAL+gkncFrZd+JwoT9Y8Cd5QH/tqZTw7s1CyA
	 UqEKIpW8QSYHA+jktuOI0+VYhxbqnuNjDpyKU+37XNJxjqLkInc2NcGrRPyrOfVaxt4ew
	 +xHnZVCqmactoM7ChurHTJpEy/9HY08KkvXs0Y+AA58nNQzx1PbcWWCL11ov7PfSYDwsl
	 WprEJeogZzSM7EWyg503NLLdwYiou/XAWOlxyqTKlGNCnlsR3ln08ByE9k7f/V4Vnng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795141482;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:Subject:To:Cc:References:
	 From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=4ZKBxwqTuNEzYTX+DLZPSuB6RzFGWPOlHuDcijRlmsU=;
	b=JJQ5X8GZHP9L+CVVOhaBv442QRPFdEMPevKBpzh3GraHWMgBrOrk20oz7MXubMkohq2f
	 eWaH+QM2QcOl2CA60gJRSwUIA+RiqcH7joCzXLJ2j0mHOCbFBoir/mRanlsXoZCncmOIn
	 G2C82aNgeM4Vmukmv8tmHO10HTlaID2wdZWAK/MIFPYaSOltazgBkWQ9SHSj4kB/6leNi
	 r0zLggv/4yqYAqW3NemNAdnTQoUFX6+PZXXdOXf6qiaNyupWdhfU5a66aY9dAwfLHbHZt
	 DIK3np1emK9J0B85kDOlmRtEPTMYUQHkG4tlLvRZS/YREUmdiOGqt//7lRF7WgO5kTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.97
Received: from out28-97.mail.aliyun.com (out28-97.mail.aliyun.com [115.124.28.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B30606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:24:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91B30606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07521986|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0461936-0.00172271-0.952084;FP=6625693303020904625|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033065158064;MF=likunyu@open-hieco.net;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.k69fhfW_1795141473;
Received: from 172.18.25.145(mailfrom:likunyu@open-hieco.net fp:SMTPD_---.k69fhfW_1795141473 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 20 Nov 2026 10:24:34 +0800
Subject: Re: [PATCH v2 1/3] sched: Tell rq_online() and rq_offline() whether
 the CPU changes state
To: Qiliang Yuan <qiliang.yuan@linux.dev>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, linux-kernel@vger.kernel.org
References: <20261118-bug-sched-fair-offline-active-v2-0-b6ede596c6a6@linux.dev>
 <20261118-bug-sched-fair-offline-active-v2-1-b6ede596c6a6@linux.dev>
 <6fd92ba8-2249-b5e1-772d-cc598c91bad5@open-hieco.net>
 <20261120015130.41615-1-qiliang.yuan@linux.dev>
From: Li kunyu <likunyu@open-hieco.net>
Message-ID: <35e38def-048c-2890-b0e7-a512b848b733@open-hieco.net>
Date: Fri, 20 Nov 2026 10:24:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261120015130.41615-1-qiliang.yuan@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Qiliang,

On 2026/11/20 9:51, Qiliang Yuan wrote:
> On Thu, Nov 19, 2026 at 04:29:27PM +0800, Li kunyu wrote:
>> Is this parameter currently unused, or is it being introduced at the callback
>> layer in advance for future use cases?
> 
> Only the fair class uses it, later in this series:
> 
>   callback                         uses hotplug
>   rq_offline_fair()                yes, patch 2 returns early when !hotplug
>   rq_online_fair()                 yes, patch 3 calls update_runtime_enabled()
>                                    only when hotplug is true

Thank you for the explanation. I have indeed located the relevant calls in
Patches 2 and 3.

>   rq_online_rt(), rq_offline_rt()  no
>   rq_online_dl(), rq_offline_dl()  no
> 
> The rt and dl callbacks take it only because they share the
> sched_class callback type, and they have no use for it, whatever
> tasks run on the CPU. They move state that lives in the root domain,
> so they have to do the same work on hotplug and on a root domain
> change:
> 
>   callback          work                       why also on !hotplug
>   rq_offline_rt()   rt_clear_overload(),       rto_mask and cpupri live in
>                     __disable_runtime(),       rq->rd, so leave the old root
>                     cpupri -> CPUPRI_INVALID   domain; reclaim RT runtime
>                                                lent within it
>   rq_online_rt()    rt_set_overload(),         register the overload state
>                     __enable_runtime(),        and the highest RT priority in
>                     cpupri_set()               the new root domain for push/pull
>   rq_offline_dl()   dl_clear_overload(),       dlo_mask and cpudl live in
>                     cpudl_clear()              rq->rd, so leave the old root
>                                                domain
>   rq_online_dl()    dl_set_overload(),         register the earliest deadline
>                     cpudl_set()/cpudl_clear()  in the new root domain for
>                                                push/pull
> 
> The fair callbacks handle task group state (throttling and the
> bandwidth switch), which doesn't depend on the root domain, so they
> can skip it when the CPU stays active.
> 
> Passing a bool follows Peter's suggestion on v1 [1]. Prateek proposed
> instead to give root domain changes their own callbacks, implemented
> by rt and dl only, which leaves rq_online() and rq_offline() to CPU
> hotplug and needs no parameter [2].
> 
> As only the fair class needs the distinction, I'll rework the series
> along Prateek's lines in v3, so that rt and dl don't carry a
> parameter they never use.
> 
> [1] https://lore.kernel.org/r/20261112125947.GZ1813469@noisy.programming.kicks-ass.net
> [2] https://lore.kernel.org/r/e1a63a3c-3975-4b05-8ab4-518c37d867d6@amd.com
> 
> Thanks,
> Qiliang
> 

Looking forward to the improvements in the v3!

-- 
thanks,
kunyu
