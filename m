Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195916;
	b=24tOIW9RxMogoIzJswCSib8C8vLDBJ9ClYIk0uuqtPDIfeI21MZUgiRXSkKGn55zZm2c
	 Vm1JK9//h5kS2teUCN+3Kv2hemctnWgZJSWRTB6ptOmJizM7jlbmdaBwhtk69mjTQDPgJ
	 sfxbUJpwjpwTmHAw3BHDyuTtPmkJ8/OX/igO08MRyIJ11pcajd+pLcRHcl1Yy2rb9FRAF
	 /IWmcK4axWZExhBLWPv91KUHrxuuyH5Qm650M8iEsWR+z6zd6bsV4E+Nw8Z56ir2WnlEh
	 LPhz2KyPh7Ez+bYpDyr4ZY/WndRgEgaaBkJd3I5a68Ts2kGslrBU8lW6BIgMgOCncAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195916;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:From:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=slRLivzNBosKdC8r0VNCBDCQAmVKRC35KcssD6Vc63U=;
	b=CV7oPupxhiW0keM685ilLQqxKik+gZSM/zXFFbBlxuAjkNSj8AqwPEB1E4G2tNcmgwp4
	 VCIC5mBHH3RpMwIUNNT7xXyC6lX2qJWGCGS4DLtpqBDDBMh931VbyW4pX9Ezl8K5VNjA9
	 IHVQp4H2Oc1c791YJFRMRzytLOMfqV3tLFJ/ByOc3l6LDta3i+Etl3p9iI2s+8ToYxEO0
	 zXEV+DF7wGar8FZaqTAGLK04lPH7pEtlx3emYb5LFq+mlv1Ut/Ldnc3UHccfvPGDs7X9u
	 Om31BAQRmIP9Ob46dxA6Kr69kfVsVPqDt2ztjYgJ9TPxLhYWCipAJNstvB+eZ+/GmJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RXqa5MqI;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6843560A2614
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:31:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6843560A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RXqa5MqI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795195914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=slRLivzNBosKdC8r0VNCBDCQAmVKRC35KcssD6Vc63U=;
	b=RXqa5MqI0NfNz7bGu4LPUImXsyISPiNavq6k4dBETvMR/XXjYRiT1aNTJgtnthbrWsaUy9
	5Ca32CE5MBSnSwDvhcSvJNGZwdy/1VMjwNC/plBwiFX6IaPR+sFjP5DkMR7hBt2fkC6wr7
	HxU96OEjEybWFp7YC+nnWpwClO0cY2g=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-438-4EMIoayDNvSymMvILiateg-1; Fri,
 20 Nov 2026 17:31:51 +0000
X-MC-Unique: 4EMIoayDNvSymMvILiateg-1
X-Mimecast-MFC-AGG-ID: 4EMIoayDNvSymMvILiateg_1795195909
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EFD101954B04;
	Fri, 20 Nov 2026 17:31:48 +0000 (UTC)
Received: from [100.91.18.181] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5607B344;
	Fri, 20 Nov 2026 17:31:46 +0000 (UTC)
Message-ID: <d09eae60-9fb5-4e10-86c4-50914207c355@redhat.com>
Date: Fri, 20 Nov 2026 12:31:45 -0500
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
From: Waiman Long <longman@redhat.com>
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
 <5a16dda3-f128-4109-a52b-f51e01309b35@redhat.com>
Content-Language: en-US
In-Reply-To: <5a16dda3-f128-4109-a52b-f51e01309b35@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

On 11/20/26 11:52 AM, Waiman Long wrote:
> On 11/19/26 11:03 AM, Frederic Weisbecker wrote:
>> Le Wed, Nov 18, 2026 at 10:55:35AM -0500, Waiman Long a écrit :
>>> On 11/18/26 9:49 AM, Frederic Weisbecker wrote:
>>>> Le Tue, Nov 17, 2026 at 10:13:02AM -0500, Waiman Long a écrit :
>>>>> On 11/17/26 9:48 AM, Mathieu Desnoyers wrote:
>>>>>> Hi,
>>>>>>
>>>>>> With CONFIG_CPUSETS=n, a kernel booted with isolcpus=domain,0 
>>>>>> hits the
>>>>>> BUG() in select_fallback_rq() during boot. CPU 0 is the boot CPU. I
>>>>>> found it while testing a SCHED_DEADLINE series [1]. I then 
>>>>>> reproduced
>>>>>> it on v7.4-rc2 alone. tip/master of 2026-11-17 and next-20261116 
>>>>>> have
>>>>>> the same code. A proposed fix follows the scissors line.
>>>>>>
>>>>>> Trigger
>>>>>> =======
>>>>>>
>>>>>> Build x86-64 with CONFIG_CPUSETS=n. Boot a VM of 4 CPUs with
>>>>>> isolcpus=domain,0 or isolcpus=domain,0,1. The kernel panics before
>>>>>> init runs, in every boot.
>>>>>>
>>>>>> These boot fine:
>>>>>> - the same kernel with isolcpus=domain,1,2, or without isolcpus;
>>>>>> - a kernel with CONFIG_CPUSETS=y, with isolcpus=domain,0,1.
>>>>> I am now thinking about disallowing the boot CPU from being domain 
>>>>> isolated.
>>>>> That will include using isolcpus=domain boot time isolation 
>>>>> parameter as
>>>>> well as in setting up isolated cpuset partition. Will that be a 
>>>>> simpler
>>>>> solution than fixing all these places where isolating the boot CPU 
>>>>> will
>>>>> cause various problems that need to be fixed?
>>>> You can try that, hopefully nobody relies on that. nohz_full 
>>>> supports the
>>>> boot CPU to be isolated but it's a heresy.
>>> The upcoming runtime modification of nohz_full CPU will not support 
>>> the boot
>>> CPU
>> Agreed.
>>
>>> at least for x86, as the boot CPU cannot be made offline.
>> We should forbid that on all archs.
>>
>>> I would not
>>> recommend putting the boot CPU into nohz_full boot parameter, though 
>>> we are
>>> not going to forbid it.
>> It's already supported and unfortunately we can't remove that as that 
>> would
>> break kernel ABI.
>
> I just found that that CPU 0 will be automatically cleared from the 
> nohz_full list in tick_nohz_init() for CONFIG_PM_SLEEP_SMP && 
> !CONFIG_PM_SLEEP_SMP_NONZERO_CPU kernels. IOW, that means most kernel 
> will do CPU 0 cleariing. Although we don't explicitly say that CPU 0 
> cannot be a nohz_full CPU, most kernels will not allow that. 

Thinking about it, the clearing is done on the tick_nohz_full_mask which 
is used by the timekeeping code and in 
/sys/devices/system/cpu/nohz_full. So from a user point of view CPU 0 
isn't in the nohz_full list. However, the HK_TYPE_KERNEL_NOISE cpumask 
will also have CPU 0 missing. This is inconsistent. Should we fix that 
by setting the bit 0 of HK_TYPE_KERNEL_NOISE cpumask when it is cleared 
from the tick_nohz_full_mask?

Regards,
Longman


