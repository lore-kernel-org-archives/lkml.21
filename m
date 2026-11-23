Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795410618;
	b=I/Z9j5mjNb6ZhWt7afIL8z6NNEzDBeDvHh3MiJ7tOEhG6oEyhKGE+jCDlXy9loWzuUbM
	 /3+y+HNm9ThyseM3vw6fnPtdPoe1Ff0PU5SEETuuVFmzuV4cZYzSQ7idZuNFLPCjfYCjO
	 dfXUywGf1m0VY7WwCoIxkS+a9TZWV2aC1R3iPXxWj2dArGFoYOYs8GluTQ5fRfWmz+9z4
	 v2zMOKHXQHLB4qGuw0NcSTKnIFUR73FCBV4EBF3BEM1EhZw8ZobgKvPcf+qhF/zIyQMP+
	 1/F8z/paoVqNAOKGYYZNRC8xaPkdmqCWGbr2maNSa81p1Xnd2296un4mHzQmi+SBTCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795410618;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dcTKXulzRQhqk7SHUdDgxKTnOqSUNRHcerQerqP9It0=;
	b=WZkjkv5PKgZ5J/YZCJ8yVnwJTJGMU8gTeFKdQE8eIu6x+leuEMlPtVhIWPuVWoPKVFyY
	 dJEzn/81u06cJBqat4xymQMBUQaQhz2d8WuC9cgu9M7+UbOngjfrHTik3HTJWwpvpo0Hn
	 liiJWX2ykh7yMv3lR3aB2DvVvOSXrA6tAQKI/JPxhmwwpNJX8Eo4MPqNo2dZ8qCdeHTHj
	 iePYw89bHc0u47GsZ1qYGtfKnr6bwBi+/PyucR3mSwCrc8HzREIicHrcOgD3XZjUCxwel
	 JIDncdQpx3HgIQNHd8dwJ49wXyje7K+wlE/zQxI3Rp1+VJ3N/M5bxyzULyNnylgkInQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="i1VWQW/Q";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="GQD/TldO";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D01606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2D01606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i1VWQW/Q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GQD/TldO
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN513Ik979653
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:10:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dcTKXulzRQhqk7SHUdDgxKTnOqSUNRHcerQerqP9It0=; b=i1VWQW/QBB1gv1A8
	RKIwklZmxhkyOWOs8cD3B9huo+JZl9t4+nHGhd4M5waCSTsomMijeTRaTIxQgwL2
	PHSMb+DJ+ZkUWmUMAEfIk6bqA8r7suirhjMCGQoCJfjwt0yCi5dIwF2PLrn4QiWX
	PNM0Ln+DKiXOdxRcTlkj0b2HXBunuTGDEL2+r3PY2q+U9Gu4sQ8DGz7IxDhEj/X9
	3XDWjA/C0mKXyF0nVeplx/Gis8kEBDbTXgEBn2JwWgZjPZkUexJH9RBWeqhNfPiw
	qGbnQn+LQyrgCGIOWqdw7a74ffYpNMwW/Yuq3LQurRjIXmHvG7VjFhFWuzo3PtfD
	3rOz3Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32mgdb6k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:10:16 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b3f3e256e8so2878614a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 21:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795410616; x=1796015416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dcTKXulzRQhqk7SHUdDgxKTnOqSUNRHcerQerqP9It0=;
        b=GQD/TldO7irpuOVoV+abuYYVJNO+zzMhyKjO3MkcAVnMexlGFNwQ9IMSWjeJAoiOJS
         S6tSOarR/xP5K8C9vx3bAI1r3UMYa6TNYDR93BKHTD+G1ZUV+c/xZmLCDX5A4DWX8VUp
         yipI0A1TL+O7pDFys96UCfqJPAntYbOleRiD3wJ7lOC0D33QQ4tFXEniRYXn4cAbZytl
         aFwv1PT+LX65Ckjs12NUjRP54GVlhQrqcI7uKzMA4c+2svuyhmYBKjMTZ2y4SgLrg3Sz
         D6gFPvag51NF8CgMGyhRyo0uCQIWKE1S499FIVz8t/kuEgeDSQOSLv73jrEO4/b3bRsF
         PDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795410616; x=1796015416;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dcTKXulzRQhqk7SHUdDgxKTnOqSUNRHcerQerqP9It0=;
        b=Y3MlQ6eWb3WKQcfiHp1M6z3kTj5O9zkAla0x0j55YIzlLwJBoNxFOBIaqoViY28dic
         TEeJvv5ozz3gDupimkCPERpXRVxIw+K1QGNe+Bz487MB1hTorOqPgNWUOMrdONPxngzY
         32POPvHgBLlRrltCuqOCsKs6Etz5vas/IEf360fVI75s3BlbH+qYO/pNX+JzInBOFJqj
         g2dfd9qZCRRR0hQfNojdt1Nt+eY0gFVqMLfdffXN5kdKLLEiWbfh4Ax4X5GmstQNRec4
         5i4lpWoMpjtBKVavhR4/fqzizXAI8ffLDg5pTt2Imi/XW2iQSo9nJt3JRZ3o3hcNT2nv
         odBQ==
X-Forwarded-Encrypted: i=1; AL+hErGdgrHc38ZExb1ohXselps3W31t8aNtOj0++0qkmFBhtqEdaznv8aETDZsBYqK2U2YCTtkyZhCxbElC8Go=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kCtQEL5L9pnsmQVQWr3oMb+VnMXsOCG4SfvVxID1dkPND3sa5
	14A6WCd6ZrzHgK7k5WfVkS78y9tRjOfuKdN9BhOzdsmsUUuWw6wsljxZZ2EB2JA0Fv/bR1FBERT
	cpePKk7g/k9G2XxGNcoOwiiFQH959drdyNrvfT6+rmsgjLjQ3y4HoEnpWIpqH3oEPuco=
X-Gm-Gg: AZFdTZeFB/Xug79DGTvzPF66KkUJ4mCyVajm+dsJC/okyGxMxxrP+fF2r2Ok2Iy7mpZ
	EonqXG9+5irNw83n/Rap68RAwvRhP5qk/XAVXj4FVL69THCkZfoQ0uNvVBzfN3sQMYYlMnK9H73
	dcGh2MCkMRvaUpJYRW0EMWdKArOj2xezmwCBzDm1RJpmbiwoJi4GtVtKJgRMu3SiPxWfcgsnWno
	wRkCt+WrEUX9snSquoLMwurXVRbGOZt//8JppBOYACRyhltCs8Aq+vFhV6kK5TM8qn5NT7OcCoL
	WaH3qq76KuUvL39/ycizVyX4qw3v1yFNgw50NfeZpoHwzJcDk2mIIn/fjiromZGKakrNz+DcmrI
	G8pBvOMABcorCXJ1CdrtcGljNvI83+fmjwBtP9/PDF5rR8yQtuOFglmiPjGtfo3ljBQjp11j+Yx
	/EZSR3tjB0+czuqnd1iMm/056za7nexDMZt5ZeloxPVGFM
X-Received: by 2002:a05:6a20:a108:b0:3ed:bfd2:7e36 with SMTP id adf61e73a8af0-4014bb52e75mr11192655637.29.1795410615664;
        Sun, 22 Nov 2026 21:10:15 -0800 (PST)
X-Received: by 2002:a05:6a20:a108:b0:3ed:bfd2:7e36 with SMTP id adf61e73a8af0-4014bb52e75mr11192629637.29.1795410615177;
        Sun, 22 Nov 2026 21:10:15 -0800 (PST)
Received: from [10.133.33.103] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e456a7sm4841567b3a.29.2026.11.22.21.10.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 21:10:14 -0800 (PST)
Message-ID: <07a533cc-80e4-44c5-89c9-8b94b0a255b2@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 13:10:09 +0800
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
Subject: Re: [PATCH v3 0/9] cpufreq: tegra194: add Tegra264 support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sumit Gupta <sumitg@nvidia.com>, rafael@kernel.org,
        viresh.kumar@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, treding@nvidia.com, jonathanh@nvidia.com,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        bbasu@nvidia.com, Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20261119111217.902071-1-sumitg@nvidia.com>
 <2698e091-17e9-4a1d-acf1-19981ee604da@oss.qualcomm.com>
 <20261122-elfish-amusing-muskox-d6cdef@quoll>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261122-elfish-amusing-muskox-d6cdef@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyMCBTYWx0ZWRfX8cmL0bJ8ynNi
 OliObI0FRWBDgmkcW5o+d90wYZItqofDRMz4uJmI7hHGdYs7wPDMNg9+7SLbM2/PHLS6TXGzVar
 adT2IvO6qoswPovJQTDIU4cXrIEuX+U3z/isM6fvlc947ydvb8WmHOXZ0hud97bl8jLpYulcdNY
 t0iObSSQbCLO/lkeeSL3rdM/SeqnOpvyXag3rJAbQ/QG7Ftr1+qEHSaBjDUvN1thG6D1GgpiNji
 Ymtef2XCPbjSB2yE39HYjtTLp/gMttaf7plKApNO9pdgxIdXMFLvumdulcDxOam9/xcLmnofvXY
 rhBPeaZGHXnhoUS0AlfXo2yISdGiuaCOhPpTY/u2HNNVXkNFZz9ommM71XOOCzCsGS78cmxpFO5
 nl+bULiD3WkaLbwXJehibu86hjfXDeCoJMdP+AlhqzakMkdMvRyDJ1jA56aOZZHyqrFjbb54bUd
 UnPX+WogSRkFgqDolng==
X-Authority-Analysis: v=2.4 cv=OM+yTiaB c=1 sm=1 tr=0 ts=6b03cab8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=K9XYs0MPe4wYk6c9fc0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyMCBTYWx0ZWRfX3WILoK/Z2MSl
 sDKj7wxufaGXs+NRBPmYvGCeW9U55zBUBZnCPCqKtEv7fB9npg5tA5M6tRxsIljyA3YtJnKsgiR
 DexVvOKxPbkCgSsLXpRJOg71vooGvK4=
X-Proofpoint-GUID: BViWP2QH995S4ZtxEgBWTpxieCMqrPhg
X-Proofpoint-ORIG-GUID: BViWP2QH995S4ZtxEgBWTpxieCMqrPhg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230020

On 11/23/2026 12:53 AM, Krzysztof Kozlowski wrote:
> On Thu, Nov 19, 2026 at 07:41:34PM +0800, Zhongqiu Han wrote:
>> On 11/19/2026 7:12 PM, Sumit Gupta wrote:
>>> This series adds cpufreq support for Tegra264, which joins the SoCs
>>> already supported by the tegra194-cpufreq driver.
>>>
>>> Tegra264 keeps the existing model, where BPMP provides the NDIV limits.
>>> The driver derives the current frequency from the core clock and
>>> reference counters.
>>>
>>> The main differences are:
>>>    - Frequency read: through system registers, as on Tegra194, but from
>>>      the 64-bit architected AMU counters. The reference counter ticks at
>>>      the system counter rate (CNTFRQ).
>>>
>>>    - Frequency request: through MMIO, as on Tegra234. The driver writes
>>>      NDIV to a core_freq_req register in the CCPLEX register space. Each
>>>      register controls a clock shared by two single-CPU clusters, so both
>>>      CPUs form one cpufreq policy.
>>>
>>> The patches fall into four groups:
>>>    - Fix (patch 1): read each CPU's MPIDR from a CPU hotplug callback
>>>      instead of at probe. A CPU that is offline at probe then also gets
>>>      valid cluster and core IDs.
>>>
>>>    - Preparation (patches 2 to 5): cleanups, mostly of the counter code,
>>>      to make room for a 64-bit counter and for an MMIO mapping without
>>>      ACTMON counters.
>>>
>>>    - Improvement (patches 6 and 7): group CPUs by the generic
>>>      "performance-domains" property, which cluster-based grouping cannot
>>>      express on Tegra264. Device trees without it keep the existing
>>>      grouping.
>>>
>>>    - Tegra264 support (patches 8 and 9): the driver support, followed by
>>>      the device tree changes it relies on.
>>>
>>> v2[2] -> v3:
>>>    - Patch 8: read the AMU counters with interrupts disabled (Zhongqiu).
>>>    - Add Reviewed-by from Zhongqiu to patches 1-7 and 9.
>>
>> For patch 8/9:
>>
>> Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
> 
> Why you cannot respond to specific patch? Tags applied to cover letter
> work completely different!

Hi Krzysztof,

Thanks for pointing this out. I’ll reply to the individual patches with
the Reviewed-by tags in future reviews.


> 
> Best regards,
> Krzysztof
> 


-- 
Thx and BRs,
Zhongqiu Han
