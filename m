Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992675;
	b=yUnsp39h7m6gYfTXAXa/z30FaqiZ/X2HhGI771G6MAADc3rTSw9rMqfsJJvagEJluBzU
	 DiQ/XvyIn9FfxSOm5N8etS9f91v726V0F249Z94V5hIfq3PbhuIP0oiZcjydDoV6A/Yb9
	 maF4UA5mtbbxnajJj8q2+Fgx73r5yyt+XNgQNcZTDNw6uz1kwema8osMj4hxoV/1k28jt
	 wGRn2vMZw9QL0LZh36BYWgQRyKTuUdNiVmnQO2EV0fQG21V5nFr6RQwm4U1FyF4O4lzJh
	 j1v/VEcnmfdppyCo81jDVpNmqmuHnTnibIjsOiIx0qRkYCK6iBtlBkWz0pvj7YNIFqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992675;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-TM-AS-GCONF:
	 X-Proofpoint-Reinject:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Hs4znIYC2sMv00DW0RVgvQrNcl3o2x+Yd+uOO1tGCcs=;
	b=CmLAADTUS2fwrYylm/TMZV6f5A+0HAoAaVa+0rQ+LdInsXiB7WU7wwVkdX+babRCCt4/
	 5XqlB7fgcqOvBqLgpYdY8pVYZYaAwDyf8lsLk64n39455HffsbYqVR3TF7Sp2L2ejazdL
	 qFQpHZ6aBFgsQSqLnEsTnQV47WNDKmTeG0scZltOaw5X7COqm8MUDUpfJ/FeVyOkocHar
	 EkpiDk/X5uikfuei0ZCqwrqDHK2mKUfD+sikZFergoGeedMDjXBUfBF/gj7dNwHhg3nkF
	 x+dzuZaR235MX1nWDegWQurrYai6P2XWt3YdHcfl13VbJGtk+uPtzK6wIx8Qe/pwt4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n5EQCCJ6;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CE4606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:04:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21CE4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n5EQCCJ6
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2S2aw4063444;
	Wed, 18 Nov 2026 09:04:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Hs4znI
	YC2sMv00DW0RVgvQrNcl3o2x+Yd+uOO1tGCcs=; b=n5EQCCJ6gwOfqrx9mnKdfc
	cviPSGF8fhxcobIRJ+p5TESJRTt1gcLNfWHg7FNhg8UENdvzrh1iKzP9FaEWMuct
	fNCUJ87mutV9Bn6mwyBTZWbmtzStSUguwpmZRPImrPBFZOtdgzOb0la1cfafrXth
	ZyUGU1JeAWroC/hv0TPrZUfzgBAW6XNaLct/3eQKVY0PCigeuXoYV5JY68jK+fY+
	NRTtUFpl2Q2i5gH0XWJcy5Ov9ah96jTVcHA6VmYorbZwsRdKDS4PnUtSZ6WazqOG
	jaz2SGRt1I3UFklf9g7ik3FZkCHgC+PAldNTdUjlAh9znqFWB7LelqPLC5C9pTbg
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j105t1p21-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Nov 2026 09:04:29 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8SCnE274263;
	Wed, 18 Nov 2026 09:04:29 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4j067nf7hx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Nov 2026 09:04:28 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AI94RQ656492482
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Nov 2026 09:04:27 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 349F22004E;
	Wed, 18 Nov 2026 09:04:27 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A606220043;
	Wed, 18 Nov 2026 09:04:25 +0000 (GMT)
Received: from [9.39.20.135] (unknown [9.39.20.135])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 18 Nov 2026 09:04:25 +0000 (GMT)
Message-ID: <c40ca6b2-a620-46ee-89e2-84a6a5313776@linux.ibm.com>
Date: Wed, 18 Nov 2026 14:34:24 +0530
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
Subject: Re: [PATCH] virt/steal_governor: Remove redundant delay filed
To: Fushuai Wang <fushuai.wang@linux.dev>, yury.norov@gmail.com
Cc: wangfushuai@baidu.com, linux-kernel@vger.kernel.org
References: <20261118072722.1052-1-fushuai.wang@linux.dev>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20261118072722.1052-1-fushuai.wang@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=IouL47/g c=1 sm=1 tr=0 ts=6afd6a1e cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=VwQbUJbxAAAA:8
 a=zuLzuavZAAAA:8 a=y7H06g3HElaTuPd7UWQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: BdscqQRepzAaUb_sGh0NW0oLp0De0yUd
X-Proofpoint-GUID: 1Se7RYf0qtaXBaiKU6QCoAjJk7wKva8G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzNSBTYWx0ZWRfX8EPGYuV4jIks
 k+FRHNBPgXgl8dq7q3T1/JZUQHnQskOHHtUEAT0ev0LhacOYfnZlbcqw0+y56aHhlxqP44F/FiQ
 h4ryy6y30o9RmPgzGPatYH8q4QoarOeR64cCa9f9fb1iABFcA69HNn3+DTaay5fc+42fbjfFF4q
 U4T77eX4QU4E/fS3lwvQEL0RP8Ik+EYfBcVbe/+8wYb7DQKU+l3ilqp4HIQBjyAsgUtpDfhGMld
 upK9RUlUJ95kDb3FNMoBQbqyLoQJ8mJAad14XZNeVhl+R8Vsee8z6qgJBl4yO+emM4Cf2bpZpfl
 du59yLYZMblZzKUcXeVcJt5cb7nDNdKiCM0/nv2UpVP1gmfCTIrH15JPXNkEKr2SJpdCo4iE+dz
 Hm3DtdEneu/tkLoZdVDr84lfSCMRNdMa2tl5AgIT8gYwxhZXGZXY7UhnkAbTDaNuOzdA8BTDLkP
 1+xhs8RTOV+D9FaKDBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzNSBTYWx0ZWRfX85NGUqgkYp0z
 xKt4Oquuixi2x/TlFgDPBmCI8jfEECyKU2bVPNoaUhlwtAcwKL7ykdz+tiLCk2gcyWMOwLmuaN6
 o8nCRODrwLEHJJmAWvTtQh1FiRuTjAc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180035

Hi.

On 11/18/26 12:57 PM, Fushuai Wang wrote:
> From: Fushuai Wang <wangfushuai@baidu.com>
> 
> The 'delay' member in struct steal_governor is just a cache for
> msecs_to_jiffies(interval_ms). The duplicate state is confusing
> and adds no value. Use msecs_to_jiffies() directly at the schedule
> site and remove the 'delay' field.
> 

I guess you haven't seen the below change which is in tip tree.
https://lore.kernel.org/all/179421651800.2093942.14148413791803216183.tip-bot2@tip-bot2/

With that, we don't need the below change, since there is no more redundant field.


> Signed-off-by: Fushuai Wang <wangfushuai@baidu.com>
> ---
>   drivers/virt/steal_governor.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/virt/steal_governor.c b/drivers/virt/steal_governor.c
> index 6e31f9923dea..8af6c02c7e77 100644
> --- a/drivers/virt/steal_governor.c
> +++ b/drivers/virt/steal_governor.c
> @@ -38,7 +38,6 @@
>   struct steal_governor {
>   	ktime_t			time;
>   	u64			steal;
> -	unsigned long		delay;
>   	unsigned int		interval_ms;
>   	unsigned int		high_threshold;
>   	unsigned int		low_threshold;
> @@ -252,7 +251,7 @@ static void steal_governor_loop(struct work_struct *work)
>   	}
>   
>   requeue_work:
> -	schedule_delayed_work(&sg_ctx.work, sg_ctx.delay);
> +	schedule_delayed_work(&sg_ctx.work, msecs_to_jiffies(sg_ctx.interval_ms));
>   }
>   
>   static int __init steal_governor_init(void)
> @@ -270,11 +269,10 @@ static int __init steal_governor_init(void)
>   		return -EINVAL;
>   	}
>   
> -	sg_ctx.delay = msecs_to_jiffies(sg_ctx.interval_ms);
>   	INIT_DELAYED_WORK(&sg_ctx.work, steal_governor_loop);
>   	sg_ctx.steal = get_system_steal_time();
>   	sg_ctx.time = ktime_get();
> -	schedule_delayed_work(&sg_ctx.work, sg_ctx.delay);
> +	schedule_delayed_work(&sg_ctx.work, msecs_to_jiffies(sg_ctx.interval_ms));
>   	pr_info("enabled. interval: %ums, high_threshold: %u, low_threshold: %u\n",
>   		sg_ctx.interval_ms, sg_ctx.high_threshold, sg_ctx.low_threshold);
>   

