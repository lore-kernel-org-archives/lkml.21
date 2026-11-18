Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983128;
	b=rmcbiUqZ6pB8MdMAqm50hOiNtMP7ai+WVRD8IfBba5I5xxeswW9zV5BuGy88fyWQptGc
	 TnBY2+os6LL99K6FwBJLZbIpIRg19880JxirryAzbeVzPYfh2s5z55oGA5VksaxFDvZYh
	 kld8O1cI8IHrgSlWX4W2BHQyWIEA3uNZEgzN5s2vUFHGtulXsy8oEw1ae3ozmiMJkPLPq
	 1/IP0tr7GV/7bV0Qodx69uRfIS7O1tEmr2KMh/qmR5mU/k8M6Xgo349EFx4GEzl7SIarC
	 BEqE2lx34wtM3nIOmkaAcIg3oFV0q3qPBcDSRmGUOXWMR2BeopNj9dPGCcaxPBujzmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983128;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vHktRanl2tt0UlSkckJQ6mb0uteRAyXN7CZHm6pyMuY=;
	b=HKY1APKuYsoPPOgTWWZ9RSkEF/aWkHqJjSufMvlhSF3jnqkKohXovDjuO78M7D/6JGet
	 qMHjz63qMFoLKXsJrWtZK7HYSeqH+SAwTu7wNc/2UeC8SZUDyhfNF+8F43LkojEPceUoH
	 CxuG+jMlED3NGkeESabhb0PuHt24Hd0nGAUUj5ERtt1LecCL5TCjlEWIDIUrsKTgAWitO
	 KW0YT7qZSQd0WMhedvnk+yFmAMvQqkHM34xDPnAE9Rj8Jij5T43ChUuR3LeWjvcpn9uRz
	 I0Ty2GzcKtB4eSvJnMWCQYNgMIfA2N7Jdp7L7HFJY2KDVk88q2mzvSidHqsec0fZv0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AQTOwXO7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LMpNOTIJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B002606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:25:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B002606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AQTOwXO7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LMpNOTIJ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Vv4m4059958
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:25:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vHktRanl2tt0UlSkckJQ6mb0uteRAyXN7CZHm6pyMuY=; b=AQTOwXO7FiQkVjmD
	5axA+ItGGGgIE4xstftS8mxDgz/nA64w2UWB3ElFZwoFM0QdQgtjodwMBGP6UJvO
	4d41JnqG7o1DsQOOX+LdW8sOzbiYnT0bwtNi/UocGxiL4Z/ZdQKkjrV6KVErVmgC
	UCWkl0FTecYv7ng+9YVVUMM0d8dy8yIYmWwbfCf1B9QXZeAG0HfOvfzO3HIL48Aq
	oDmYpsMQSGhtiQchuoyxHCEbDeDvHSYbqKqdkEe/l2nGdeEbJtzwA95Lzpp5VMln
	GFosUPSzA2weirAV2hVK5q/vVU91f0Mt4gG7v9w4xXfylALiD1p1gcgbZl0Vtk0w
	VF4Hrw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvchk4w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:25:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e95f8543c9so9996065ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794983125; x=1795587925; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vHktRanl2tt0UlSkckJQ6mb0uteRAyXN7CZHm6pyMuY=;
        b=LMpNOTIJgeTocO/gTNrWM/6r5/1SM/RkoepX4xDrhAO2NJs/JIuhx63Nl2dAJWvyHS
         oNjcQISi+GewZ6hooku/012DXHEd5A2xHIARgAwB60d6ILQLPgpGu9xNauLW/NwTovL3
         wU0Y3Rc6d5exwG7rZSO5W3lrk3E7RSQ8NSfy+IvfitZ36LVb1r0d5ds1fLzn9DxAf96U
         SIb02ftY9bo/pxJdZYYNjxDaiZl3jucu+735VaQSTnEP4CAUfY4KEeeDyIglvZsZOqXu
         EFcrOO60gL7CviHfc5gshEwCW93THvO/d3B4FVrnvBDtGjczNuuIHRZDp+SeLspQNRS/
         VETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794983125; x=1795587925;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vHktRanl2tt0UlSkckJQ6mb0uteRAyXN7CZHm6pyMuY=;
        b=ddxsRB/aQcw+atx0AqY+kQYsvgONK5zsMa37OxNMq9VfEqk0p0C+J7ry9eeWVb5BOZ
         BLh27n0qrwd0zltX0r+IQVdttE9IuE9Z43Ip8C42J1ZuRwzwHWe03iGpjpvLxNs0ytN9
         TlmbfRb56mACwzTTk6jUzScu8SojYtGwuVER5S5JeCaEHfibUoD0G8y85lyi9JNHxoOC
         pvv0e0bpDgYFQkVQ0ctd/lt3mpIWKFGCWs5y1kulX3urc9ZfLhHndGb4WJleUkFv23ZC
         YRfrMunDrnSEhebGBbF9qep+4quHz7d8TJr/WKl10eV/BkkGcHI2FxNarKSIy6QNoI0o
         0mXA==
X-Forwarded-Encrypted: i=1; AL+hErHXBoRp1dRmWH1vo4/p46YiWO+3mPYIX9lVJvqXaP9I3x6Roy2F7UHwvW4P51Q7dI2GJn5i+o5C5HooqA4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8W1wWv5sl/i+mrjn2iG8HdxV9LB27azTbP7LkaE6Bluvx1z1oS
	LddGTpq1qSXdAoPqMcuSb68Nkb105zbQx04jWhQPDTZh+inLNeh5lHF4X9mdLt6Kcrezhtuf9Kf
	ncoBEcNEOcB9oSpBPLRZgfEY7i4EJTopx48DDEdHxCx/hz3Xki/MwMbRMSMqHsEJSuds=
X-Gm-Gg: AZFdTZcQ3meLSaMqWXyvBrq0zU6+AeBEnNIazA6n7nHFttDbToZOrzOq5iVM2hToYv+
	/sm66G+jbaEZgiged8VDHQO+JKY2KcWIxSz7K4sdF+EMkKyGhyzzTCcbcUGF2PONJR1gDU6+hxR
	i3MFkLkpnf6pPzH5TJ3wkJRkqPqRN/lQ5Xy+PDRl7B/rnxxYiFrKCoRtLmziM90PahMRcgcYKsJ
	5Zx7C94gc571gK/Yi7js5kYuJQO94wQ4YScyUY0J+0eK+zbfhWKvEHIDj5Vzz7qZsHwfBJzTXe1
	avLdu89mCOk2VEc9+LBMZSJyE0AnVkLmKPIY5heL3K+EPjbV18efcpZn5XhbF1HC16Wa+plZHbw
	ks3Rhu1wJW4MPvUWMr3PO2Arme+LBKbSs1py47/8ufugRC4l07CtI6nAtDNm5joG/pKJSuJ4Mjg
	wtjQ==
X-Received: by 2002:a17:903:90f:b0:2db:3b35:1ac6 with SMTP id d9443c01a7336-2eff7100c5amr16624335ad.5.1794983125067;
        Tue, 17 Nov 2026 22:25:25 -0800 (PST)
X-Received: by 2002:a17:903:90f:b0:2db:3b35:1ac6 with SMTP id d9443c01a7336-2eff7100c5amr16624175ad.5.1794983124581;
        Tue, 17 Nov 2026 22:25:24 -0800 (PST)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff61841aasm7605435ad.34.2026.11.17.22.25.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 22:25:24 -0800 (PST)
Message-ID: <e2967948-59d9-4937-8c21-39bc8b48b195@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:55:19 +0530
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
Subject: Re: [PATCH v2] thermal: qcom-spmi-adc-tm5-gen3: move hardirq actions
 into threaded handler
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kamal.wadhwa@oss.qualcomm.com,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
References: <20261113-adctm5_gen3_hardirq_removal-v2-1-a0c9c4800941@oss.qualcomm.com>
 <avcpU3P1jw8NESMu@ashevche-desk.local>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <avcpU3P1jw8NESMu@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afd44d6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=niP4JTYLpQ8y5GhiJJEA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: rQXLS9lNYZ-xng1tJ0If7_VEbKx_zu8V
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNSBTYWx0ZWRfX+E3JuUTrcmvf
 6MO2eon1dDCKbXnGnAhX07Jet/zM+LNB+0SkrqI70Ea38OFm8k+qSmJHSOQIAEpMJPKvwcQrL9R
 2mJlXsHYi9TYP/XVyydK2kYbVbpN5JM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNSBTYWx0ZWRfX0Y8m3Q1keJC/
 8bkJKWrrEnH0uctrUhtwszWe/FXWdgLvjVVgQDAk+c7uaW72ffEJDWM07/EfGSveRaN5KcCmAOB
 oEIAXgU8FWk+VB99uh0mmlwxIJew6c8PIn3bYLinjnw7r/x3et4AtblfDOgQKUzPHNc+H/VLmLY
 8OTc1u5NTT5vp5wsYpzifcDTAu1KpvcdhGCQRwC0ZLLtYfqaIzEPtG7A9yym1w2Da+RdT/9Ty3L
 4uFgCLl4RqTau8W7rAs2+v83F+DQwSBeePXr1FZmHDM6V7XFL0gTQmvbYclMZBpG6fxpMqWmh6J
 PdUrQ9Nz7YHcOTeaZRit7+kPSVezyHQo99+6WHaiJ54y2fRYgRVRJKLv/UAuW/cKYZbQnTNpLi7
 B9si8ldZ0v9hRoLihrszFdtdlkvSm8rqp/SrZUEvH35UXL9XagHfglp/EMLI/8IbHqfJepXdes+
 H1NvxEsPPrXt2qzbofQ==
X-Proofpoint-ORIG-GUID: rQXLS9lNYZ-xng1tJ0If7_VEbKx_zu8V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180025

Hi Andy,

On 11/13/2026 8:44 PM, Andy Shevchenko wrote:
> On Fri, Nov 13, 2026 at 05:23:03PM +0530, Jishnu Prakash wrote:
>> adc_tm5_probe() registers the ADC_TM interrupt with both a primary
>> handler and thread function (adctm5_gen3_isr/adctm5_gen3_isr_thread)
>> with IRQF_ONESHOT. The primary handler calls adc5_gen3_read(), which
>> takes the SPMI regmap's lock (a regular, non-raw spinlock) from hardirq
>> context. With CONFIG_PROVE_LOCKING enabled, this leads to a warning
>> about an attempt to take a lock in an invalid wait context:
>>
>>   swapper/0/0 is trying to lock:
>>   ffff000b67201018
>>   (qcom_spmi_pmic:259:(&spmi_regmap_config)->lock){....}-{3:3}, at:
>>   regmap_lock_spinlock+0x20/0x40
>>   other info that might help us debug this:
>>   context-{2:2}
>>
>>   Call trace:
>>   regmap_lock_spinlock+0x20/0x40
>>   regmap_raw_read+0x88/0x328
>>   regmap_bulk_read+0x10c/0x340
>>   adc5_gen3_read+0x38/0x50 [qcom_spmi_adc5_gen3]
>>   adctm5_gen3_isr+0x90/0x130 [qcom_spmi_adc_tm5_gen3]
>>
>> There is no requirement for any of the work done in the primary handler
>> to run in hardirq context. Drop the primary handler and move all the
>> actions in it to the threaded handler, which removes the invalid wait
>> context warning.
>>
>> Note that both handlers used a local variable to hold the index of the
>> SDAM whose IRQ was triggered ('sdam_num' in the primary handler and
>> 'sdam_index' in the thread function). These are the same value under
>> different names and 'sdam_index' is kept now, since that is the name
>> used for it at other places in the file.
> 
> But this is not the point. The point should be semantics of the variable
> and not frequency of use.
> 

OK, I see, the right reason for keeping the name 'sdam_index' instead of
'sdam_num' is that the variable represents an index instead of a count
and not simply that 'sdam_index' is the name used for it elsewhere.

I'll update the commit message to mention this, but do correct me
if I understood your comment wrongly.

> ...
> 
>> -static irqreturn_t adctm5_gen3_isr(int irq, void *dev_id)
>> +static irqreturn_t adctm5_gen3_isr_thread(int irq, void *dev_id)
>>  {
>>  	struct adc_tm5_gen3_chip *adc_tm5 = dev_id;
>> -	int ret, sdam_num;
>> +	int sdam_index, ret;
>>  	u8 tm_status[2];
>>  	u8 status, val;
> 
> I probably missed to point that at the same time we can split semantically
> different variables.
> 
> 	struct adc_tm5_gen3_chip *adc_tm5 = dev_id;
> 	u8 tm_status[2];
> 	u8 status, val;
> 	int sdam_index;
> 	int ret;

OK, I can make this change too in the next patch version.

Thanks,
Jishnu


> 

