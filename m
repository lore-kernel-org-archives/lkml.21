Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795602995;
	b=iEjH+mxstwaaIq6+vdVCglJ9pSy0QV3/HlqJKI9licFadq10jjPK9oEUCKsdIP9ahamF
	 jVTAXWQ+jyR+uogHZ+3ERYUNIpxkAp8pJ5/TI23GzXGhWrfm8VfYXEOJC8D4a04LSD1lD
	 J/WRYjP7bv2a3DUUGPWXNxNerq6jIs/0hL5o+4dT1NffhHdzbi/BqiFlXNiFfioryqaGQ
	 B90Kp0280CW9Orj52I4RNcAUt3ZfBaPRvlYQgLOWjMhxPMHgjL+CE0rPTjPz+c48aeahC
	 BSX/dAmLZnmAPAfU/V3Qkb5wc8iTnwcJaw2DYNM2USrqXsq62eW+SkmsAb5vHMg0EOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602995;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jAEsJZYaibUUOKZ4k7NMqSX3DBwN04ZW3KixEdHDmuI=;
	b=5ROH3UAK7tyFBQtph1nvbUIq6wa9dRwPBcgb3Szw67fn2o3H23v3nnTchqSk/bxCED6P
	 mmxx6SvUqXWr1kMoSKCu8ToFQTyZvE7UmY7Er49Vdf6juDVQfx4Rl099YbQ+qp+d3HgHf
	 cvajG44LF+Guc+7LLuk+UN+Vyl/dNoBkU0InqPDeo4YU7/q/oOzibUB5Zxr/Txo0h2Rl6
	 p5I1vv0/jXSV95lJqpFBsrPuAQ3DmKHDUtPu+DPKBg9vvPnoHPgacXp6G1KnIhxcAUB7V
	 QPhd50V6lQKHWgjjt8nTmUk0/RUkHmKacryRwSbIgPoevLl3xTcDjyoBcV7qeCJv9gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b4YwkgWa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jqZx0FnC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA49606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:36:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AA49606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b4YwkgWa;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jqZx0FnC
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mALh115101
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:36:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jAEsJZYaibUUOKZ4k7NMqSX3DBwN04ZW3KixEdHDmuI=; b=b4YwkgWaX5Fozf/d
	FCcmChtVMCETvVXv2M9im1Hzn8szRM/kXz9Ix7ZfMKLZE9DCjJFfoMQL5F3JhMho
	17J9SWHDJIlozED9HRjUZmwv0le/Pf+Lrm1KhqeIeNNqGnXBDO0YhvE+RUufkH1s
	9DdsprT4+SEMKzDqkTI2CGWOPfSn+3xTONAyBbL2x0EwJwyLve7/es3WDfkXBfzn
	zEnyk0S0sAwrRszZ4i/XLq0+xaSgMuj+58WavUmo9c76SPmu6Nqw35p9EyEGu/L5
	javuNWbMtR+J5x1elMlrx+5pJJzsYR+6l5Ahlk56T6PVKgZKySLH6rFpXi7KEOE9
	Fptcmw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5cxkcd5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:36:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b41e8c1ac0so8146019a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795602993; x=1796207793; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jAEsJZYaibUUOKZ4k7NMqSX3DBwN04ZW3KixEdHDmuI=;
        b=jqZx0FnCXufx5QO5UGmtuRBoVJBEvt1v4oOoKKy+nkKrFKAMGxf7QafrBo1J+ht99i
         2NnjPdbpzVkOdaIg8Qu6JHrH9lhhGJxHuIKsNjh7BBB/blBeoQYxcUEc2gdvIQIuw3cw
         Z10Jwg5/1j7VNwxBxeHEfP00dEXyl18EGuQunjWWIHnXe5haAbCAYTb1pfy4u65nb0/p
         +7r1pvRjOdPy7dlbs0BiUtIj/fKLpN+yUl1H1ToqQprhOy2H7ZdwaJplZWSkLaC2IHDe
         HzerUwn1yPtg+cpCso3llpHqE9mKkUwY1PzEmFjC5Y7F8xYmeiygu6HxiPN6jhMkRQ+K
         0rig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795602993; x=1796207793;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jAEsJZYaibUUOKZ4k7NMqSX3DBwN04ZW3KixEdHDmuI=;
        b=cb9LYHroAshTx4d7IEVgiCiddZ3hN2gbMLgCMmyivJsWVwc3z9omnexVSdxjT5QWZ+
         S7hvlrL+2035PHFLYCF+KfW9btCjoNtfGdNx49JidLXajpyxNyoID+s+IApUE5pbNf7g
         8w7DuiXAGBSqjiUL4qWF8u1R01cb+ihPWGRLyiDDQdGaDPK5vfSiew15eUsbOVn6Sh8k
         humkVmilNTvMpOTDxl4vtsVAFtr2fkGnCDmPI8hUOpjp7ImoJ+87ulauBTlB+vpZSfU0
         GvD86DmjKYNBgKWQhb2EZId04iRJSPsmG9WNkFiueBqEdA8LMWC+GQm1m82MVPBjvPl6
         Y/Xg==
X-Forwarded-Encrypted: i=1; AL+hErEu1q298zN489z2kS05wzVqXLECnazzc6gmgnePbq6TrXmQIMZqfEpt/nZ4SaRbqPlPXWRuw4dN3vD/Y1A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WWfVc26bbn9Q4E8vqEKAkte4qfAk8AWy2ZcuWTCRKC37R0bQl
	UpDpTPLDGBsGcf/loHFllDxXqnDPWNJah3wHtl+Ni6dhZbBPNL94wShhCZdYMuq78hBMxksUC6X
	Avbr6cSB4rDoxephrre7nVQN/iL9/SHhcPvGgmqj/tcql7f5sllyGVXosVI8qkbdeCKI=
X-Gm-Gg: AZFdTZfOY4FDDf1EJ3oudOP3HXYEhbVjZDUkKPa+yZ/DQKK7K7JVgtnGfv2MEm3gWGc
	a0eIE3BsPJIxQREKQtLMhtOseakAIkkELrqaNALb+OjUlQxTfU4Xpe8n4GpqUHfVEB9y3jYiQBy
	KRS8mrb3ZLZUsp0/3V2Ct9CePSfv+9DIAef0+vhGHUSU2Ha8H0OdYDiJ+NfGF7PSlcR4eRDDKKv
	kmZ6Utvdxp2c3SFdLKr0B4mK4oU75gGnQM8RX5FJFXQauLgMhYU5HtXTmJ14rb6uL7onJ8cdHMy
	z5KsvxOH9aYsZBuqoZCE7eUx4yJXhvINP/ljlhjtJvA/8Ewl/1VMJC2qpTyP7koupkJIzQyNdej
	QXu0SmLmkIswFupTyuyImhlVEhqf+7pZDjpN9ny/c43cfQe8/XMxthxNI1hbBMnS8WYFAKMwo/W
	2ud6Q=
X-Received: by 2002:a17:90b:4983:b0:3b4:ba6:f712 with SMTP id 98e67ed59e1d1-3b41c9988f1mr18869666a91.60.1795602993112;
        Wed, 25 Nov 2026 02:36:33 -0800 (PST)
X-Received: by 2002:a17:90b:4983:b0:3b4:ba6:f712 with SMTP id 98e67ed59e1d1-3b41c9988f1mr18869644a91.60.1795602992591;
        Wed, 25 Nov 2026 02:36:32 -0800 (PST)
Received: from [10.239.133.197] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b82e624sm11657648a91.4.2026.11.25.02.36.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:36:31 -0800 (PST)
Message-ID: <42b78eda-ea3c-46fd-bab5-ceb81e22f720@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 18:36:24 +0800
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
Subject: Re: [PATCH] cpufreq: schedutil: Run irq_work in hardirq context on
 PREEMPT_RT
To: Christian Loehle <christian.loehle@arm.com>, rafael@kernel.org,
        viresh.kumar@linaro.org, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
        mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
        bigeasy@linutronix.de, clrkwllms@kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rt-devel@lists.linux.dev,
        Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20261125080613.1138573-1-zhongqiu.han@oss.qualcomm.com>
 <86b5a9f8-70f3-4a5f-b023-c9fb1a2faf83@arm.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <86b5a9f8-70f3-4a5f-b023-c9fb1a2faf83@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfXzACSs46tUdER
 FLhPXX/8rgjAETAWXTCTk2bc3KARJaEd/bvNEfxkt7Ge7glMHw6rf/cM7ufUe5ZGAxDGs7butFb
 eNnRBspgzuh7eGImrqWOLRcGB9c6Cyotc37t6vCEhDBTjFvB0GbFZbIh1KSJ6QB1ma3CuePS8Mi
 4ThNv0YeNj/6qzwB9Gq94KqcrTv/8oYwnoRLmdJrVURfkb+z4HFTvc3z07WB5EQ6gevUfRNtPLP
 MSzv2ZiXBxSzgsxhlp8EAGuQWGbwNZzeXaPHUl1kTipNU+Itue3flo8MjjYbIHnnMSUTonmL2ko
 Ah5KwRHekLZm9+toSvmiPZJ0GiTqKug9N8gD/LZ6UhUNQxT6z4lPNTVOYemBY1wRcOxh02aDyfO
 dd1c2dn2bRM0PSacL73Rnqm9a0hqdnkWncdw5Qt2TcFULXs6/l1IVeJK7A31zQfALoGxcfWDb3F
 wH9wcr+RZkiSWGnKR9Q==
X-Proofpoint-GUID: UkoH-tTdwi4EwUVNBimdb3Jw1vc_SeDl
X-Proofpoint-ORIG-GUID: UkoH-tTdwi4EwUVNBimdb3Jw1vc_SeDl
X-Authority-Analysis: v=2.4 cv=TLbQ2Fla c=1 sm=1 tr=0 ts=6b06ba31 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=YpS8oBoqdfD21wqEnNUA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfX7TMyrowDXqcT
 6Yo9Azt1VmIc509iNVApBXCpjv/KWSzTxHAIfTBxoKYQtbmmIZGIPERQG4qnWgR66slKtEDRkWE
 6nSK5Ji6U7vjH+eCSO7d1peqIA3SeDQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250042

On 11/25/2026 4:26 PM, Christian Loehle wrote:
> On 11/25/26 08:06, Zhongqiu Han wrote:
>> On PREEMPT_RT, an irq_work not marked IRQ_WORK_HARD_IRQ runs in the
>> per-CPU irq_work/N thread at SCHED_FIFO priority 1. The schedutil slow
>> path queues its irq_work on the local CPU, so the wakeup of the
>> SCHED_DEADLINE sugov thread is delayed until no other RT or DL task is
>> runnable on that CPU.
>>
>> Meanwhile work_in_progress stays set, so no new frequency update is
>> queued for any CPU of the policy: one busy RT task can freeze the
>> frequency of its whole policy.
>>
>> sugov_irq_work() only calls kthread_queue_work(), which only takes raw
>> spinlocks and is safe in hard interrupt context on PREEMPT_RT, so mark
>> the irq_work IRQ_WORK_HARD_IRQ, as commit f8d958880933 ("srcu: Use
>> IRQ_WORK_INIT_HARD for srcu's irq_work") did for srcu.
>>
>> Tested on a Qualcomm SM8850 board running PREEMPT_RT, with SCMI cpufreq
>> forced into the slow path. With a SCHED_FIFO 10 stress-ng worker on CPU1
>> (30% load, 50 ms slices, 15 runs of 5 s each), sugov_irq_work() now runs
>> within 15 us of irq_work_queue() instead of waiting for the RT burst to
>> end (up to 212 ms), and the policy frequency is no longer frozen. The
>> irq_work latency below is measured from irq_work_queue() to the entry of
>> sugov_irq_work(). The cost is that the kthread wakeup now runs in the
>> irq_work IPI handler, as it does on !PREEMPT_RT. In a separate cpufreq
>> stress test with cyclictest (SCHED_FIFO 90) on all CPUs, this raises the
>> average IRQ work IPI time from ~0.5 us to ~1.3 us, with no change in the
>> number of IPIs, and the cyclictest per-CPU worst case by ~2 us.
>>
>>    PREEMPT_RT                           before              after
>>    ---------------------------------    -------------       ----------
>>    irq_work latency on CPU1, max        130 - 212 ms        <= 14.5 us
>>    policy0 frozen, total per 5 s run    0.57 - 1.25 s       none
>>    cyclictest max, CPU1-5               13 - 16 us          14 - 18 us
>>
>> On !PREEMPT_RT, cyclictest and IRQ work IPI duration are unchanged. No
>> lockdep or DEBUG_ATOMIC_SLEEP splat on either PREEMPT_RT or !PREEMPT_RT.
>>
>> Signed-off-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
> 
> Missing a fixes tag then?
> FWIW
> Reviewed-by: Christian Loehle <christian.loehle@arm.com>

Thanks Christian, add the tag on V2:

https://lore.kernel.org/all/20261125103451.1385246-1-zhongqiu.han@oss.qualcomm.com/


> 
>> ---
>>   kernel/sched/cpufreq_schedutil.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/kernel/sched/cpufreq_schedutil.c b/kernel/sched/cpufreq_schedutil.c
>> index 14405a614991..b2e9ac7e3517 100644
>> --- a/kernel/sched/cpufreq_schedutil.c
>> +++ b/kernel/sched/cpufreq_schedutil.c
>> @@ -726,7 +726,7 @@ static int sugov_kthread_create(struct sugov_policy *sg_policy)
>>   	else
>>   		kthread_bind_mask(thread, policy->related_cpus);
>>   
>> -	init_irq_work(&sg_policy->irq_work, sugov_irq_work);
>> +	sg_policy->irq_work = IRQ_WORK_INIT_HARD(sugov_irq_work);
>>   	mutex_init(&sg_policy->work_lock);
>>   
>>   	wake_up_process(thread);
> 


-- 
Thx and BRs,
Zhongqiu Han
