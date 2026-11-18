Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011579;
	b=xf+zr1k6Umqs1vtwPvuf3CJuAs9q5K6+rL50Bs+mL1f2vq+ToWxVXQqV/3cRDBfqDKlT
	 qw+CPCZeOATjWxIoXDEx+8a6m3dqCOuPr3xgl8Mzkm4JS38NiHW4/i5KbmwAuW+Q8XYLj
	 LkhhU/KoUTADmxvXs2FziQCccLXaOT5DrfTQjkpnQc7G3P5g/tHP1f36MBJdYUId6o19g
	 BP9SUp4gkUVdkDTvHEXvCap6nGI7dTXwZwOFshqR1tyn8dVqv9bNe2R2n7aPP+Ro+MiAR
	 Tr7U+4miVw+WNF6sXiLc3ddiOCBsLsy0VpsGNId+mxDKnU1iGgtJY4psTdwoPR4C/Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011579;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1JClIS8/8hCyDXGoTdDjvVDUpWd0KuLlGLfB7NW+2YU=;
	b=rZJDOQ1Nmj7I+0shXjOqnh+rwtO+4th/G2WJppEuz7bGcw/wMXDNPGNutwkyjscLdOGy
	 JCZhbDCjvJ5xKfkIRnHh403EFZAqxmnWnOs7F9Y8GRNxgxbT3yJSjITyjWksKadhrXFiN
	 Hu2ixGMXTDjyBXFI3kEO+HJWL/QDpxE1y6XuDf/kmSnyiUk5P2oxV0n2hc+ZnXH62gshY
	 VN0nTRwmrTkAAW0wtUUoUko+it0AWvvYcOGQVJxlnc2vTnV2LkgN593AVonmQyBIv6m3X
	 Ojh/ffKZ57KpdMXM3GAvHAtty16EKo/cZ3QEFsQ4BkAnTrFB8+ZESq9UNMiifvb5TyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lVgSq6Jt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aieN2r3e;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A1E60A2605
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:19:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78A1E60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lVgSq6Jt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aieN2r3e
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIDQnxt1929497
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1JClIS8/8hCyDXGoTdDjvVDUpWd0KuLlGLfB7NW+2YU=; b=lVgSq6Jtrip2ZE/Y
	YwKQAwHH6WI08Ogf/On9nuzf/6UNtxG2Xy57MpyVdooQ0bhCEofEyleyiFzIJq+R
	afUVFW32a8kigKXGvw+11wsyHjtmosfGUiXNKKs4O0ZeOntMnjYsuTW6rJv232TN
	Q2fIIh1k5XhBrJ45TMWq+pEG+I+luWR20ssuIFdwLhh7SpdrfJ59gVjScuum2+/N
	cFtw441iLA1EAyspXRstm5cM5U+53RDDxm6CeBTHGxKlT6iDIANs4urPDa6wJau1
	gC1qgZYQDGuO5P8pRrp4KljwtIp9ueYcFViM4pRwdRXMO7vWxn+HBsSk3SsDiUJk
	ohzY8Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8bbt8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:19:37 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2eaf8ea208bso9745145ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795011576; x=1795616376; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1JClIS8/8hCyDXGoTdDjvVDUpWd0KuLlGLfB7NW+2YU=;
        b=aieN2r3ejTrtTjbHQgRJIldzyOZpDxopo68gR4h6bdiDYpLX7dtDN4yyJ/fobuFVTw
         AqSSUenkq3XX0zWDOT8C076Zz9L6c9/gSp/pdmPelS25L8iuEVgQeiBaODwPeH32TfeC
         Hir/ZVLpHUZ25hFKNdrjH1rSKrKXfyVf2R43jY8QuPVBeRcdI2kiL9h5f4fe82cMcFn/
         9pppMIyHst7+9yfxrhncQk4c5x/2YaWKIQdeSsz1nwE53A5I0guKqfT+wTU6RYMEKum+
         5DZnVcqK4g8OkucMsgASADEsDDjRIvGpQ6N/028zO59/PpoOYI8zjDqbwX8v/tqq6i5H
         9Wlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795011576; x=1795616376;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1JClIS8/8hCyDXGoTdDjvVDUpWd0KuLlGLfB7NW+2YU=;
        b=t+IItGvKCm9LNk8VFeGNqVifogvnhLmqmNQ02ZPQfznRGemrpKCshXwTg+1ufFEXAr
         +oxaFa/2pZRmCyaV3lpXT1ZJPWwX6I0bkwAb8NbXt+0Ikjl/kaSli0bnBXlzZ7H1BSAh
         kbAGVKogDKkrKyMFykXhW/Nrwi2ak93lkE9lzo/vFOGeFHJjwCJVR7781E5qrgKJwwd6
         nDkvupH2vcB/F+8+lVQJ7XdwHUAHTcSYdYcj+GpnZycIQtFJe01tqg6Xt62wcFPdKPPO
         HN4va+6iRbl3T+BCWug+lrC6QwYHlKXijLvWkN7UxicEIfpzzw0qXp8/gcKcD7ovvuGf
         QIGw==
X-Forwarded-Encrypted: i=1; AL+hErHa/p0UrgCRHo7mYQD2KfDgF3cIlPQVHphtxTxxMZ6/zJqoRcv549pXJftLaP9elDEL6wstPyKbZDiPNvU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EOf5dHwkU6u9zFmFdAOFPUSjqJLc0bmiTGTPCWIj0MkxIMxdO
	KOT8DtjToc/Sulad4iTxVrXVi52vuP4axd1qPfJP3z1tTfXOBXD21HMhqouWrNCXOCKS6R1i0W8
	EtUluCpj2Tc0EiM9Mt+I+smEwcmPrCFSf+gL8e8ApSZDIcANrU0F2AKwqhnT2vwaJow==
X-Gm-Gg: AZFdTZd1vHetnJUUiuhDitFJPw8xTLt3JjI349PMV7mMRZUSo+Vdo7L6reyxPt51WpY
	9FawopTehYf/1+Rlt85L7mUyzYkD0MfARZTwv0KRkCenAl1mO4nmXh+MGJdSA+z5bOab6THss7R
	wBR+jBY+B/5eiIWNygL+o9QpPRjT3yzuPj4MJjdpzkca7flVXhZfjbPqcdpdNph/dGLJNQjUxqs
	8i/x6y3e/vOnnMI6IKlYYQa+naZIbketyHT0F74/GWdbmN6dPslTuhfjs7sP/4xehgzJhsjMhbX
	w+VT69cd/soxVi2mlwjCjj/RCWfW07LXHf5X1wTzhxiVUK/4Iq24aYNifo1veL+ugsxYdIxGQEl
	0p+HJHydaqMsOzAfwXji0Qz/6SbCSzAk0iD83pLo9MWh+dZbxiGENh483ZBK5l/U5Hf89iB99ri
	alCPHN
X-Received: by 2002:a17:90b:2890:b0:3ab:5832:72af with SMTP id 98e67ed59e1d1-3b3d07b99a8mr2393320a91.32.1795011575910;
        Wed, 18 Nov 2026 06:19:35 -0800 (PST)
X-Received: by 2002:a17:90b:2890:b0:3ab:5832:72af with SMTP id 98e67ed59e1d1-3b3d07b99a8mr2393305a91.32.1795011575410;
        Wed, 18 Nov 2026 06:19:35 -0800 (PST)
Received: from [192.168.0.104] ([49.206.14.199])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde5327acb0sm113554a12.0.2026.11.18.06.19.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 06:19:35 -0800 (PST)
Message-ID: <301ca6f3-fac5-4787-893e-3ee84e3a4413@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 19:49:31 +0530
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
Subject: Re: [PATCH wireless-next v4 11/21] wifi: nl80211/cfg80211: define API
 to notify SMD Drain completion
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
 <20261106-smd-v4-11-62e39487f51a@oss.qualcomm.com>
 <4c5dc50b40bde5cd9221d318e44645d913268666.camel@sipsolutions.net>
 <91d1c974-5910-4053-8f4d-6bb54ee295ec@oss.qualcomm.com>
 <239873179ca828ef65d0dc715c5e1c5fd079c9cd.camel@sipsolutions.net>
Content-Language: en-US
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
In-Reply-To: <239873179ca828ef65d0dc715c5e1c5fd079c9cd.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Hj320grVDXzc0T3nVACy88pCHqh8Sb3s
X-Authority-Analysis: v=2.4 cv=N9u8hG9B c=1 sm=1 tr=0 ts=6afdb3f9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=S4TnAKnbd+bQPtf57r7XhQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=HgWVBUc_7rS3-GOyZhIA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1NiBTYWx0ZWRfX1CrazglUeUIG
 y5xrmaK6iqzWnGjEWZtZpyMdUUSq9EMDRN4izLQJuvq61XubD3nmL/dM3nEHnWi9+gERSZ2GVnt
 rv2zHWKwhsLsyGBtqNrvuzq4oPXumdzfWz9OOw8du9SnPK+gM3nh6KVg14n/nvQZWISBKgkgWPa
 4OHynY8tRN0fbHQMl0ga8g5Cm5zfsrLaaifQ46MBV2sqi1n6q0aw15bGl0+o+cnkfhY6KYkvGti
 kZnYpqBTbCdGzy4l87ygUAWUk5KOPOnpmaiLwug7jmoLZF3MWwF1AC8iGbk+q+GR6G41NRBGWEf
 +Xetz1PYz0CJHnAZoIbeWjRrFRuMsf/nXkBok85UhKKjClEd5DHf3+PS58VJluJt1OwTFYz0Ysi
 U2ZSV6fkCpfNibECYLrclYR7xwbbhpadSlkaPuyrnOcP8EiYzWAnk+ghwq6FVralQRy6PWyCp2V
 zBM7tUzOuCzo0DVO+VA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1NiBTYWx0ZWRfX6OolK4wFM5b2
 CoghJRe7wLXNaHtiDi6wV0PXLYnx2HStxoNbAaO68/ujHs5WpV+UlSriQFjCExG7mt0XbM7ZVG5
 LLZ0yHR79FjVqSC6VdnCSaKoFRLUDpc=
X-Proofpoint-GUID: Hj320grVDXzc0T3nVACy88pCHqh8Sb3s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180056



On 11/16/2026 04:53 pm, Johannes Berg wrote:
> On Sat, 2026-11-14 at 00:08 +0530, Pooventhiran G wrote:
>>
>> On 11/11/2026 12:31 am, Johannes Berg wrote:
>>> On Fri, 2026-11-06 at 13:28 +0530, Pooventhiran G wrote:
>>>>
>>>> +/**
>>>> + * cfg80211_notify_smd_drain_completion - notify userspace about downlink drain
>>>> + *	early termination.
>>>> + * @wdev: wireless device corresponding to the AP MLD
>>>> + * @sta_addr: non-AP MLD address for which DL draining is being terminated
>>>> + *
>>>> + * Should be called under wiphy_lock.
>>>
>>> "Should" doesn't really work here (it's either must or not), but anyway,
>>> why, it's completely unnecessary?!
>>>
>>
>> wdev/dev access in nl80211_notify_smd_drain_completion is not protected again
>> and it might race with a DELETE_INTERFACE. But I think instead of mandating
>> wiphy_lock here, would it be okay if I changed it to use the wiphy_work_queue
>> to post this event which provides safe access?
> 
> Basically same comment as on patch 10. I don't see a reason to make it
> async under these circumstances, but it could obviously be atomic.
> 

Sure, Johannes.

> johannes

