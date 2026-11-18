Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992857;
	b=K0iBXNM2peJNyue4qN9GPirtxcavKpNaMEEqgcdGFXWbOjI8O8d5jvB+w2eXn0s+f3zR
	 9ObsBagf08FAoidkmbTSBkK5iwq8c7AEWlBgkewEsMaunmBVFgBZ/3GTvZeaOfGHhsmuw
	 CLzHuJs/lJVbbN1fSax1JEq0Lx9Jw1WKd0MvazwilgQYOuWz/kg+y7xwAlfel0zGBkrkJ
	 eHGgTaiApSbRMyHsjTqGKGl3SLtz3JvGWSnCKa8j0G/ti2BYOaFo3MBLL+u2MGh3Uzth/
	 8kEgzYdEXmGdi9vjO9rVWsh5kCDmAgLtiESuy9bQXtmjllttcpwTqdDUknterVhHXLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992857;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-TM-AS-GCONF:
	 X-Proofpoint-Reinject:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RrfOcz9srV4+GrBYwNj77lGeHHLPjqGI84CXCOD9yNI=;
	b=JbolIgMo7mTYDXToFsuK2cGmg2VXVn+O/LTZoMylcF6yzV2jULrGVQYJfNeppWvgJumc
	 XJkONepxHxIjafOeBCrIm6puLbzpdj+GCXHAcyxDW4RYF6cXUBXNbWPwcOUGKpRQLWdhG
	 MmYyfue7f2VgtLju/Uk/7wYUXz2vQU3l3lNyyiCfkMG54mDfvk2GSdzTseGdsyX+mXHqo
	 vcaXrwLlFNO7TCML8mJmj+1viqM5V6iVRWZJ1vlNKzm27Y9+7WCLiSFzQttU65qjlmxMO
	 cx8dxhUcHK+sw5XokNLsTMhXiinPHnCBkkgkD4Ehb7UeXdAV9xIphjTDtjgt9AtEJaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=U+Iw4h5B;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46985606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:07:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46985606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=U+Iw4h5B
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2RuO44062985;
	Wed, 18 Nov 2026 09:06:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=RrfOcz
	9srV4+GrBYwNj77lGeHHLPjqGI84CXCOD9yNI=; b=U+Iw4h5BKMKQRnAR94/2bn
	ga0SN00bmFu5sS6g7+4kgH92e0dYN3/EJkz67WrkUSQyTV5fBK1BhIboSqTTriyW
	0tyX2jVXk0xy0dJQkwYbau4i7F+nfQmx05IoNTZXDcl3grzhUa3pPsN4WUHrINXe
	VXKZdZF5L1ACRxX3pyqSgNSoMpAFqP6lTWEL5oIeFFkOTYJi1f4fif2xVPLhKsZu
	4n54Az5NSaZxpbrhpwSe6eMZjv+PDAb/yMXbj8UoLoOX97kwGdxGW/7k8ROa3bFl
	HUg0O7XjvtRyYDvwqqj9aOB8hgxAX1SV90VOjDje3PYFJrTR2bMD4emz7NjiJ6Yg
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j105t1p9d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Nov 2026 09:06:09 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI87KQt2766468;
	Wed, 18 Nov 2026 09:06:08 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4hyxwt7ujd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Nov 2026 09:06:08 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AI966U244171540
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Nov 2026 09:06:06 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5251920043;
	Wed, 18 Nov 2026 09:06:06 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 73F6820040;
	Wed, 18 Nov 2026 09:06:02 +0000 (GMT)
Received: from [9.39.20.135] (unknown [9.39.20.135])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 18 Nov 2026 09:06:02 +0000 (GMT)
Message-ID: <512ba302-9dcd-4ce4-9331-a6e545c36a8a@linux.ibm.com>
Date: Wed, 18 Nov 2026 14:36:01 +0530
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
Subject: Re: [PATCH v2] sched/core: Fix a TOCTOU bug in
 sched_non_preferred_cpu_push_stop()
To: Fushuai Wang <fushuai.wang@linux.dev>
Cc: linux-kernel@vger.kernel.org, wangfushuai@baidu.com, mingo@redhat.com,
        peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        vschneid@redhat.com, kprateek.nayak@amd.com
References: <20261118065921.98260-1-fushuai.wang@linux.dev>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <20261118065921.98260-1-fushuai.wang@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=IouL47/g c=1 sm=1 tr=0 ts=6afd6a82 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=zuLzuavZAAAA:8
 a=VnNF1IyMAAAA:8 a=C4c02Fu0qys20Ti4h9QA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: SBBokyRc_KxgJWXXMb9e7pr6ZNLEeytO
X-Proofpoint-GUID: 6K2rtBFruUViJ2lZtalM6Bbinr5kzAxW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzNSBTYWx0ZWRfX634wVl+G9PEY
 2Wlv1i2QzjrtwLKPCMRkYIvPDo+WHVxG6166RL2acSjSQdkFYAFbsA5DhmVHRdOEGktxHF0z8CC
 RVec86IAf5fe19a3SH6Xkfj7tqFcAB8+fltDUgtR1189OM/3OZMuM4sJu4PVM6rbOEMn7BDRfDS
 3wKB5gKc6s+PvYfjt9exk9jjjGR9Pk1OLzWP8Mi7lPj4rcBA2UDvU1a6+OZVhocCyKAYoBJvQKU
 wTjnosBZPUyFtY+5+uOhCdbLAAxHlJJODmFY1roSj3CGjLcuoZLEKk+AOfAvsXBH71AEgcNOvPp
 WPwD+QPQYJ1QrEy6lIYsDWV/YGPqdUmNjIune2/g1ohIpRggB9O6PZ3YLU3CZjejbTs6WHCxX59
 5BqLzva+4OgOIzmzVpKJcT6wDLn16kOytv1uzzm8Z6+dR8XC9V8FLYkru51waxxx+taQ0pUK7fG
 NX+TCl7p/7G7TgE9jqA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzNSBTYWx0ZWRfX9VuyPkOoT7R6
 uYUvAqk3Isr4XbFrAUqHczWxr5n3BivgaCCRl95LCnWtFfCNc4lP4TpA1aCVKVvbxz5uSI3YUT5
 24NYXZkmjFgMIrnV5Q1Js9Cec0xys6U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180035

Hi Fushuai. Thanks for the fix.

On 11/18/26 12:29 PM, Fushuai Wang wrote:
> From: Fushuai Wang <wangfushuai@baidu.com>
> 
> sched_push_current_non_preferred_cpu() is called in irq context. It
> checks is_migration_disabled() before queuing the stopper.
> 
> migrate_disable() sets p->migration_disabled in preempt_disable() section.
> An irq can hit after preempt_disable() but before p->migration_disabled=1.
> After the irq returns, the task cannot be preempted by stopper becuase
> preemption is disabled, so it finishes setting p->migration_disabled=1
> before the stopper runs.
> 
> It may be like:
>      task context:                       irq context:
>      migrate_disable()
>          preempt_disable()
>                                          is_migration_disabled()
>          migration_disabled = 1
>          preempt_enable()
> 
> So recheck is_migration_disabled() in sched_non_preferred_cpu_push_stop()
> before calling __migrate_task().
> 
> The stack may be like:
>     WARNING: kernel/sched/core.c:3432 at set_task_cpu+0x1b8/0xdf0, CPU#21: migration/21/152
>     CPU: 21 UID: 0 PID: 152 Comm: migration/21 Tainted: G        W  O        7.4.0-rc1 #3 PREEMPT(lazy)
>     Stopper: sched_non_preferred_cpu_push_stop+0x0/0xb10 <- sched_push_current_non_preferred_cpu+0x6a6/0x9a0
>     RIP: 0010:set_task_cpu+0x1b8/0xdf0
>     Call Trace:
>      <TASK>
>      ? set_task_cpu+0x5/0xdf0
>      move_queued_task+0xfc/0x650
>      ? is_cpu_allowed+0x341/0x820
>      ? __this_cpu_preempt_check+0x13/0x20
>      sched_non_preferred_cpu_push_stop+0x7b7/0xb10
>      ? __this_cpu_preempt_check+0x13/0x20
>      ? __pfx_sched_non_preferred_cpu_push_stop+0x10/0x10
>      ? __pfx_sched_non_preferred_cpu_push_stop+0x10/0x10
>      ? sched_non_preferred_cpu_push_stop+0x5/0xb10
>      ? __pfx_sched_non_preferred_cpu_push_stop+0x10/0x10
>      cpu_stopper_thread+0x205/0x410
>      ? smpboot_thread_fn+0x307/0xa60
>      ? __pfx_cpu_stopper_thread+0x10/0x10
>      smpboot_thread_fn+0x352/0xa60
>      ? __pfx_smpboot_thread_fn+0x10/0x10
>      kthread+0x3a6/0x4d0
>      ? __pfx_kthread+0x10/0x10
>      ret_from_fork+0x68e/0xb40
>      ? __pfx_ret_from_fork+0x10/0x10
>      ? __kasan_check_read+0x11/0x20
>      ? __switch_to+0x592/0x1210
>      ? __pfx_kthread+0x10/0x10
>      ret_from_fork_asm+0x1a/0x30
>      </TASK>
> 
> Fixes: 74699f56ebcf ("sched/core: Push current task from non preferred CPU")
> Signed-off-by: Fushuai Wang <wangfushuai@baidu.com>

Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>

> ---
> v1->v2: No code changes, just improve the commit message.
> 
>   kernel/sched/core.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 5ed660f099a5..6f9374aa3f19 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -11314,7 +11314,8 @@ static int sched_non_preferred_cpu_push_stop(void *arg)
>   		rq->npc_push_work_pending = false;
>   		update_rq_clock(rq);
>   
> -		if (task_rq(p) == rq && task_on_rq_queued(p)) {
> +		if (task_rq(p) == rq && task_on_rq_queued(p) &&
> +		    !is_migration_disabled(p)) {
>   			struct rq *dest_rq = __migrate_task(rq, &rf, p, cpu);
>   
>   			if (rq != dest_rq)

