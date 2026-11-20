Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795193565;
	b=ifxSIiHmSuI+rAyxU6bprNGTFr+mjZeHPULN/xxxSRptUQrHc/6HGVx/BzfvZtBPbTpU
	 nkXVhAptdMZ/nB7Ehmd5BrZ4jpnfRqN+dYPc1AMKZTNts+xi6qCdyl0LtG35al1dXwMBl
	 8Db37kL7IbJoubBzNUkUKqKmO+0Md9dvsuvVFTtRJAjs1ewI5bd4e9lfEvvk+tAD5Wtcs
	 Xk/z4DcNJhVJZ3sZTdNvwzRX47+qLfBRRhsn8sx+nPJuiwktUmeeUk6sHzo8KeLLktOOa
	 eJRGlSqeB2vMzBdMg6t46WSsNQmtF2ncU7JGotXGXtqrWxIryssny9rSGqUqE1rMKPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795193565;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=Zy682i0uANXovwUo+P5vT59eEw7qQwjd7eLHwlsNqRU=;
	b=YOJ48T5lWyyF4saBb6nfUnyc011mFH5E4aQCx8qaKhaBMgvd6+4JEJp73l2hGLoMtVwp
	 h549iGCKEGzZxPuREghtF9MdHIR3UDl0JeDRBZkMnkGoATw9RFazIzSLKY5BGLsT4tytK
	 R363rc3UV3IzOoPRbjjFKdKDWrONNwBosTLBsPlPTxXva0EBysXQY7XKlOyziZCXfLrf1
	 uawl96XXzFFETrSgCNzfLpHtnaESmQch0LnEstpbzxY4a4ehQbD7zL0GFarhBKWqxuFuw
	 AubzjwkW+HItun9clpK7uwt/Z/iIhw4WMP4eGiQ4/PCStxvXRL7TDm1TIoRLrwJDuEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DTPjgJQO;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3753606A337
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:52:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3753606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DTPjgJQO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795193563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zy682i0uANXovwUo+P5vT59eEw7qQwjd7eLHwlsNqRU=;
	b=DTPjgJQO7EHx0LRYuhPe/hI21AVDi8V/fOJPidXPbH97MwcbDxZB50EI4eUWxV1OEy7WEk
	xoLtRVxYXb7/q33nfx0+AhzxbLYRgXiTlySM6H/YeAeLo+S40eDgdADf3zpo7PxC1kHRQT
	yyQ08uFSLLMkUpWWHwVHMY0TtxtyDXQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-550-Lk362HAvNrOBrvfHeN1wAg-1; Fri,
 20 Nov 2026 16:52:39 +0000
X-MC-Unique: Lk362HAvNrOBrvfHeN1wAg-1
X-Mimecast-MFC-AGG-ID: Lk362HAvNrOBrvfHeN1wAg_1795193556
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 30E091800876;
	Fri, 20 Nov 2026 16:52:36 +0000 (UTC)
Received: from [100.91.18.181] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EDE4118011D9;
	Fri, 20 Nov 2026 16:52:32 +0000 (UTC)
Message-ID: <5a16dda3-f128-4109-a52b-f51e01309b35@redhat.com>
Date: Fri, 20 Nov 2026 11:52:32 -0500
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
Subject: Re: [BUG] sched: BUG() in select_fallback_rq() at boot with
 isolcpus=domain on the boot CPU and CONFIG_CPUSETS=n
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, Michal Hocko
 <mhocko@suse.com>, Tejun Heo <tj@kernel.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, linux-kernel@vger.kernel.org
References: <20261117144817.265109-1-mathieu.desnoyers@efficios.com>
 <dd335ee6-c879-4bee-9ea8-6d9e9216fb0e@redhat.com>
 <av26-ojv3LkO2vXH@localhost.localdomain>
 <c40da4c4-1f70-44f7-983c-3349199b5b68@redhat.com>
 <av8d79cn662slr_K@localhost.localdomain>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <av8d79cn662slr_K@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 11/19/26 11:03 AM, Frederic Weisbecker wrote:
> Le Wed, Nov 18, 2026 at 10:55:35AM -0500, Waiman Long a écrit :
>> On 11/18/26 9:49 AM, Frederic Weisbecker wrote:
>>> Le Tue, Nov 17, 2026 at 10:13:02AM -0500, Waiman Long a écrit :
>>>> On 11/17/26 9:48 AM, Mathieu Desnoyers wrote:
>>>>> Hi,
>>>>>
>>>>> With CONFIG_CPUSETS=n, a kernel booted with isolcpus=domain,0 hits the
>>>>> BUG() in select_fallback_rq() during boot. CPU 0 is the boot CPU. I
>>>>> found it while testing a SCHED_DEADLINE series [1]. I then reproduced
>>>>> it on v7.4-rc2 alone. tip/master of 2026-11-17 and next-20261116 have
>>>>> the same code. A proposed fix follows the scissors line.
>>>>>
>>>>> Trigger
>>>>> =======
>>>>>
>>>>> Build x86-64 with CONFIG_CPUSETS=n. Boot a VM of 4 CPUs with
>>>>> isolcpus=domain,0 or isolcpus=domain,0,1. The kernel panics before
>>>>> init runs, in every boot.
>>>>>
>>>>> These boot fine:
>>>>> - the same kernel with isolcpus=domain,1,2, or without isolcpus;
>>>>> - a kernel with CONFIG_CPUSETS=y, with isolcpus=domain,0,1.
>>>> I am now thinking about disallowing the boot CPU from being domain isolated.
>>>> That will include using isolcpus=domain boot time isolation parameter as
>>>> well as in setting up isolated cpuset partition. Will that be a simpler
>>>> solution than fixing all these places where isolating the boot CPU will
>>>> cause various problems that need to be fixed?
>>> You can try that, hopefully nobody relies on that. nohz_full supports the
>>> boot CPU to be isolated but it's a heresy.
>> The upcoming runtime modification of nohz_full CPU will not support the boot
>> CPU
> Agreed.
>
>> at least for x86, as the boot CPU cannot be made offline.
> We should forbid that on all archs.
>
>> I would not
>> recommend putting the boot CPU into nohz_full boot parameter, though we are
>> not going to forbid it.
> It's already supported and unfortunately we can't remove that as that would
> break kernel ABI.

I just found that that CPU 0 will be automatically cleared from the 
nohz_full list in tick_nohz_init() for CONFIG_PM_SLEEP_SMP && 
!CONFIG_PM_SLEEP_SMP_NONZERO_CPU kernels. IOW, that means most kernel 
will do CPU 0 cleariing. Although we don't explicitly say that CPU 0 
cannot be a nohz_full CPU, most kernels will not allow that.

Cheers,
Longman

