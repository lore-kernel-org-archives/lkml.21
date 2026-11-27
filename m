Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795760174;
	b=GqM/jCtssBrjcCyPwnZpUt24HivrqUvGqQnaSYG4FfQu5Y5/dyr+xDNEwY87ot9Bz49W
	 I7VGdNSij8OLBqAWWF16tb24TXppGn9tMKL1HvBUsUbxt19ymaXzf0fmUIeapdJX4dPYo
	 /JF67TdiXcqGKeU4D26M4kRKf51SG8nKWZdNi9PocabvUU0BoykTFeMZcH5J60uhS+VIe
	 vQZN3Fdyzjioq1qhpIPJF3YY4UMGJiYFtDUaBq2EWE3542FCMRTYDke4JVhiWTB4Qyb/w
	 KPa50UXrsKgp4bKvrIalHSf+iv5LvB4HuXbtbtQVqaCvIEm/rqPIGeLeNnCoODAsVFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795760174;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:Subject:To:Cc:References:
	 From:Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=X8R2jVPAbg0n788QmPKLlwnnELii8hcncXSvxX3WBQk=;
	b=Kyhk+cLRKOAhcJ33xYroRw+Ng4D/zz6ELKxTh8PL3GwLWu0A1+6TdB2UXvFwBhhSUKam
	 FCb6tnMxJkzX8HGfG9BJd72UfOUvUCe0Qv+mWLjHJFZrDFh2qXDihecP+wX7I5kLa0vuh
	 cCjsiiH5ADFMAaXVV/orVNXM8itYB2s1hcmT+RNFtsauUUyL6K4ioo2H56NPMkR6DORXG
	 EMXNWGPdMT2+idnl9Mf5TAbwf29LkLxiGJv+85iQxHIryT5JxFRbhif2VL7LcX5cdcqaj
	 F15golRmJv8GgnZhr72aIIHH5ROB6jjdQCDsUljgbKs+GcXKQt3x/kaDvQMI2kJdZVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.145
Received: from out28-145.mail.aliyun.com (out28-145.mail.aliyun.com [115.124.28.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC809606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:16:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC809606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07715728|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0448431-0.000307616-0.954849;FP=13823113615508278782|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033071069091;MF=likunyu@open-hieco.net;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.kBKQPB6_1795760160;
Received: from 172.18.25.145(mailfrom:likunyu@open-hieco.net fp:SMTPD_---.kBKQPB6_1795760160 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 27 Nov 2026 14:16:01 +0800
Subject: Re: [PATCH] sched/fair: Use task_delayed everywhere in
 __dequeue_task()
To: Kayra Cizmeci <kayracizmeci@gmail.com>,
 Vincent Guittot <vincent.guittot@linaro.org>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
 linux-kernel@vger.kernel.org
References: <20261126164036.1938852-1-vincent.guittot@linaro.org>
 <awhlwJTOLPeNqFW8@scheduler.schedules>
From: Li kunyu <likunyu@open-hieco.net>
Message-ID: <a3bffa08-0754-7bee-f566-d4bb2018689a@open-hieco.net>
Date: Fri, 27 Nov 2026 14:16:05 +0800
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
In-Reply-To: <awhlwJTOLPeNqFW8@scheduler.schedules>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Kayra,

On 2026/11/27 1:22, Kayra Cizmeci wrote:
> On Thu, Nov 26, 2026 at 05:40:36PM +0100, Vincent Guittot wrote:
>> Reuse task_delayed instead of checking flags bit
>>
>> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
>> ---
>>  kernel/sched/fair.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>> index 731d78155e65..942140247f76 100644
>> --- a/kernel/sched/fair.c
>> +++ b/kernel/sched/fair.c
>> @@ -8354,7 +8354,7 @@ static bool __dequeue_task(struct rq *rq, struct task_struct *p, int flags)
>>  	update_curr_eevdf(cfs_rq);
>>  	update_entity_lag(cfs_rq, se);
>>  
>> -	if (flags & DEQUEUE_DELAYED) {
>> +	if (task_delayed) {
>>  		WARN_ON_ONCE(!se->sched_delayed);
>>  	} else {
>>  		bool delay = task_sleep;
>> -- 
>> 2.53.0
>>
> 
> As I see and know, cleanups attend to get lost in sched's traffic.
> I don't like that. So I'll review this :-).
> 
> Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>
> 
> Thanks,
> 
> Kayra
> 

This is interesting to me as well - I'm going through the latest code to get up
to speed, and may follow up with questions or a patch.

Reviewed-by: Li kunyu <likunyu@open-hieco.net>

-- 
thanks,
kunyu
