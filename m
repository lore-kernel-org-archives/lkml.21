Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597801;
	b=b9TztVPKePEp6O/lHDMGpyUavt5P9B5D/3WukpMa2qCt8kY1IeXEs76lMPm6PReJ3w4+
	 JmAqfhDjGf+VVInLjAJjEPVA+JvdrOAHkUfYgDVXn9j8Cjxff2KeEpax4/v4STdOsxZEI
	 oyNyXeSQUecjC/92xtFQ7Xun4le7SHdHT0DgSfurS+MUFxJf6xXYApjYIEz41w1kOEEQZ
	 cnUKVJXamZ3Mi2FLao6WTDnxar1fGO6J2js6Aay7tiSAblq5QOGe0teVBzE3QazhR93tB
	 53rjkg1g/9y8QidRirrGsP8QKUj2AS3XDbjFzbgtrWl7vh4MY7dEHC+vvP1c9Hg6OUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597801;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:From:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-TM-AS-GCONF:
	 X-Proofpoint-Reinject:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=m20c+6zRaKa6S8P+owjFoXEJMPBcudIxx1JLpQyKEU4=;
	b=Y+6U1j3QdlxAEBKVP7fRtRBnRQ/RRKxf8/ASYtzXSe/yJNHgKJTrFyWY9x0FuMc0L8lq
	 6AztOg4AQMEEQ9/xu6DM/HTKSaOpW22loZhOP2M5dfhlIkkjPyCTR8e4z9ZZCpJnseTzW
	 DyKQxyXzAhpYk/un/be+X914jZlAQhBL8fqboTvtUIXnt1ZHCfvCQUrZ0LVuiJkqob0Zb
	 FQun1F97oDZakIw8Uxei2n5LXGZgtCmgfEEIM58NgBtc/hhZeSJozJVm1M9dbYWfOP6uk
	 01crgE3PX6TukW5Vn3ihqdHFyK1k7PAKSWtvurtJ+W0MgmI8Js+0V08lqB9PLo6OkuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kSGfSTkY;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE4E606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:10:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BE4E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kSGfSTkY
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP6YoSD3109893;
	Wed, 25 Nov 2026 09:09:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=m20c+6
	zRaKa6S8P+owjFoXEJMPBcudIxx1JLpQyKEU4=; b=kSGfSTkYFsiGWseM3O9V9W
	MTx3PdUY51wN5PqOY1+I3RAKFz4+dlgrc1sBAcybzErRr1y7V9aYW7H53/QQ82Yl
	QKh0Ra3Xx3RTLDhE41nRRyIgJW2sB3oykGjxyRdh6B45msGgkRk8dsTlKDzpOtug
	ONn5UH//sY6jqXOiptsgOCTasj33PNsTPVPfqkt3ygGgsMyxBH+sEn3JOa8+IrWp
	TObSjGSzkMkFaCxGqhhg9EoFvYrGNnVLh6oxMKz51lhj0ZE8MGkJkVCwMvwsIllw
	D2MzOcstOA6JYygUC5QDf+oxT4dSBD4DIcINjn7+iVJH+waYZUhHEUgW4wxY4rHg
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34g3bmxc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Nov 2026 09:09:40 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP6JKt6408283;
	Wed, 25 Nov 2026 09:09:40 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4j5dcuttsy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Nov 2026 09:09:39 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AP99c3m39518536
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Nov 2026 09:09:38 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 339D22004E;
	Wed, 25 Nov 2026 09:09:38 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9701D2004B;
	Wed, 25 Nov 2026 09:09:34 +0000 (GMT)
Received: from [9.39.29.113] (unknown [9.39.29.113])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Nov 2026 09:09:34 +0000 (GMT)
Message-ID: <35d3d17a-15ef-4204-a038-a9018e561535@linux.ibm.com>
Date: Wed, 25 Nov 2026 14:39:33 +0530
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
Subject: Re: [PATCH 0/5] cacheinfo, powerpc: Move powerpc to generic cacheinfo
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        driver-core@lists.linux.dev
Cc: christophe.leroy@csgroup.eu, maddy@linux.ibm.com,
        gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
        johan@kernel.org, sudeep.holla@kernel.org, ritesh.list@gmail.com,
        tim.c.chen@linux.intel.com, yu.c.chen@intel.com
References: <20261118163639.890546-1-sshegde@linux.ibm.com>
 <a2bd3564-0990-47ab-b922-6793dd1de144@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <a2bd3564-0990-47ab-b922-6793dd1de144@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=SoQFe/O0 c=1 sm=1 tr=0 ts=6b06a5d5 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=GSrg8US4fy1um4TZnF8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNiBTYWx0ZWRfXyQFVIiHOeKqk
 DiXtQl9oH9DILas27WIDntJeGq6g4W0Yoro5k/6Wgqx2fg8YLWxfk5yuiZPIrskuRw//4WOkw9w
 Ls1Ryz7jSf2h80qv4WC6L+FxQBq3NZU=
X-Proofpoint-ORIG-GUID: d0_GswMIP1KdKSs4UAf-MTjOSVRT_Wh4
X-Proofpoint-GUID: K8a83gD0EIMhDPmoKpesw_nBKKA6SZMt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNiBTYWx0ZWRfX5w8YAC8MHUUX
 ponakBauIM4NhqcAd13fsdc+efG8tRxZES3svuf0PDwjw9NYtW8doGhYQzyizKeks46oesnG93r
 5ih4ijPR2os5/9jiQ9g7TPoUzmLNAVz9fbgVTJVh1Rc0VYqnUJpAbr4CgUI6o/XgM6y764QPRbK
 O5dq98DuFmcWcEKNvtBUW7bTlpdFPZJF/+ukxiuDYMHYGGgSsSDzSsmOzj9RsPckXfvy2Ib7a+s
 laSwIT6kaVcjsbew8EqoLtVLwWwQyIjzNI9B7RYYSaCYniMMdKRPPZQAekw94WG8it8FHzO8cRn
 KL4DCq+AYSqu6b61VGvwHzv+yPwPrFTT+oojd3GCJCk/wjuKZWKEuX++b2hp7q20EG5Y9CD6yRc
 EbUYSr2/kfYTyanmJ7r4r07xt3B185zKzB4PmdlB2F2cXZXgjrfMXHBLvp1Ki2W9tw1NaMYfcyQ
 Ky8IAV6uUraCL0GQ1RA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250036


>>
>> If this approach does not work, then I am afraid we might have to fallback to
>> arch_llc_bytes.
> 
> Well, though it worked for normal boot and hotplug, LPM is broken and DLPAR is likely
> a problem too if the logical CPUid is reused with different device tree node.
> 
> So I am afraid it is not straightforward to port.
> 
> The current PowerPC implementation owns references to the device-tree cache nodes
> and destroys and rebuilds its cache objects during LPM. It also releases cache
> objects as CPUs are removed during DLPAR.
> 
> Generic cacheinfo has a different lifetime model. Its per-CPU info_list is retained
> across CPU offline, and the leaves continue to contain fw_token pointers to the
> device-tree cache nodes. Replacing or freeing those leaves safely is not straightforward
> because scheduler and page allocator users can access them concurrently. Handling this properly
> would need a broader lifetime and synchronization mechanism in generic cacheinfo.
> 
> Doing all that heavy lifting for the case of LPM/DLPAR is likely going to be overkill.
> That may still be worth doing independently, but it is substantially more involved than
> what is needed here.
> 
> So I am planning to resort to something like below. Introduce a new arch
> specific hook (cacheinfo_get_arch_llc_info) to get the cache size and
> cpus of that cache.
> 
> Hopefully should be able to send it out soon. Now would be the good to wake me up if
> there is a better way!!
> 

After auditing the code again, the scope appears narrower.

The scheduler and page allocator consume cacheinfo only while refreshing
cached state during topology updates. their runtime paths use sd->llc_bytes and
PCP flags rather than retaining cacheinfo pointers.

The other runtime users relevant to this conversion participate in
CPU hotplug read-side locking, while early scheduler-domain construction cannot
overlap LPM or DLPAR.

So, let me give this approach another try to see if it holds good for LPM.

> 
> @@ -XXX,15 +XXX,23 @@ static unsigned long get_effective_llc_bytes(int cpu,
>                            struct sched_domain *sd)
>   {
>       struct cacheinfo *llc;
> +    unsigned long size;
>       unsigned int hw_weight;
> 
>       llc = get_cpu_cacheinfo_llc(cpu);
> -    if (!llc)
> -        return 0;
> +    if (llc) {
> +        size = llc->size;
> +        hw_weight = cpumask_weight(&llc->shared_cpu_map);
> +    } else if (cacheinfo_get_arch_llc_info(cpu, &size, &hw_weight)) {
> +        return 0;
> +    }
> 
> -    hw_weight = cpumask_weight(&llc->shared_cpu_map);
> -    if (!hw_weight)
> +    if (!size || !hw_weight)
>           return 0;
> 
> -    return llc->size * sd->span_weight / hw_weight;
> +    return size * sd->span_weight / hw_weight;
> 
