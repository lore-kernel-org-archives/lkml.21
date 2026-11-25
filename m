Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795627427;
	b=ikYW+IPoNs+rzUtbHX++w2pYvB/SmT3bqjQG4IQMTWsxWpFfQk+1JYw8B1ojdvljlt43
	 byJJL5M25LnZJaWr7CbTtDqn6z+IPxbu8TCKFKswgYOzP5jsKRS4R0QViXFI3BIV85VC8
	 DQcs9mYAFP1FaxoODftUcAT7jvBupmnuxdcWsZPYJp0uyhEV58kuIDzVAWqx961EDuN1H
	 h741Px0Omr2OWUoECvwlTvmj0mJ+93iQH9qZ/Yg2ocihqFlUiejKRrwEGUU3uyBHTYKu+
	 qTLKsRXTW6jzVU+spfmDwstLUErddRAD6feYEN2XmKNS+lh6D5ez3Oo7B1mHa6bdIHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795627427;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aw3rwrSPsVLcrl9Ot0gID0+ufM4TfMctEXtb0aQaDo8=;
	b=c/EnCKJh05gJcnHHvOZBSgAVt6HzYiMKvN60KG22170sRGNPtTh49iGxJDgOWO9GG2st
	 cuhMMOsf66MhufUL3WRyskL5QFYt4hPS3aB/6cDegeG1kxFvuTGyoolq6NeBWuo6zZa9E
	 Tc+/yV1blK0ZJ3qOjVjaqyegHpxFBkIQLH8zTz5UfETsOnptwTNptZAO3Js7YCkuCCO0s
	 /dNcaSgWKTbpEb2BgOiVC8s9/ZaR2p+IYzYCuvDXTKV2S8QZ8IAfyTGbR1rEo4jBxQcSw
	 s6ua/lg+9WPCwcVCpE3Ql+jmsAH0jCrvdsWeoJARAk6PcDx+tdFxeVyNRtlO5CDis5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="UtCft/fq";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S65oxcug;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788C9606A329
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:23:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 788C9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UtCft/fq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S65oxcug
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQNTO326835
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aw3rwrSPsVLcrl9Ot0gID0+ufM4TfMctEXtb0aQaDo8=; b=UtCft/fqEK+XlqLE
	a4oH3JsIqz8HZOoKxhNV/2aKy9RyaCJEWG1E3BnB2xttZ/14GsaXr4jjxaINhRlx
	kyEWtNX3kye8bGKNvspbj0mDrmaKm9Rzh3/kSY10e4iWgudgdok9swhGTDzuID/T
	6JN6tVDgCxPbiFCZZdEJdEnrzHB2IWBxfm55l9DXnldpUCL4k618Mxax8qmreeYl
	7qTQaV9+7APzmZ/ZXviEEMrv/hwA/k8mexneaZB3tpJvU8aKAQVLbjOo8UpQkcO0
	sKWQee1p6C6BlAVb5LJbjl7zzbAVzH5YElUKIX1+mlcC/wU3BaKxRpSm/eUO0xMH
	0POelA==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc2c1hj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:23:45 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-869553205a7so80814177b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795627425; x=1796232225; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aw3rwrSPsVLcrl9Ot0gID0+ufM4TfMctEXtb0aQaDo8=;
        b=S65oxcugSJ2lx///pLeEp9NrvnpShuHhgHNkIoJAtU14MIzXHsEtMXNZ15XQHH9EbQ
         NcP7YCFgn4LOWURxVKT72K2k1Dzjvy2V9Bc0hTpeZnSZ0T8HWA3YjAdUe4PcVYR+HzlP
         YiejjAvjZaXEeCyDp0SkD60/g/0db+6dpsgVKnWSLSP581RE1REBhdOG/osxTXIVo9+H
         dNt/LbUd2eACRdh1AtvcOjHrKNpzGmhFA9NX1UoH2xTuyCRIs3QKuFh/HqaVgXLD8g4J
         0dmVedfbtjTJCW2Zg8Sg+GeReEYiDXf6XS42SUxrBL2PGEZqUTrMEzFSaYZxOyPyVN0N
         bMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795627425; x=1796232225;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aw3rwrSPsVLcrl9Ot0gID0+ufM4TfMctEXtb0aQaDo8=;
        b=e+1m7rbQkOXF8o2Ir2zUxK242r0gXoiPR6fMg812vM4Sezb8c03OYfTiffC4icPgRo
         nf2zVECAEN5aqjmbgjyx0w/5hYHVXB7b8Uvv2uIQ6Uzy+ytsWjYjWMZq2kwKAISl2/G2
         G/K/sHss/AIKagGrX07duSNrSJ4/6lTGjEPPP3a3QNw6ya/E7DqRWVMr5aBlMkVX/wqG
         mChUxvHyx3ooAYnKllDS6/QJbMfkgsAEzHqRkZMTfErXApslTw/gebIUsxuc/eUndDF/
         rUHmT7kxkpKW/rCaDBgHZc0QWqZOdvykYeua1Ya+QOpB82RJHak+XmKUwHt3lfsAe+r4
         p4dg==
X-Forwarded-Encrypted: i=1; AL+hErHlPHW6fkF5P2hw4syjOuhosCk/95HUsDCRMqNhYfbVeNBzr0CtXxYcIIjWevOrwLODo5/e1ycbxXfXAXQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/egFHSOrRXkJtl08cN4ZuWkUcWxoNTj/7LTz+71pqRyxNvzZoe
	d8d/tyBAz1obz765H6FGlVGZiiiAFYM0cUEIiX1Hi/WNWdGD0vGqTP00dDW5ukFPPYfSS9lvOWP
	wJ/4U+xiHkfJcALxiROaGGJmGhPnbkTY+ArsyLRtWbD+l0SanW7B0GMr2SCe/iY+37dQXWM1mhK
	XIpA==
X-Gm-Gg: AZFdTZedWiUshrOGCoFWLSBFlR+OMwAZ8irU/VmMTXQ3zEPICaeDFIIRS/6K5ZlBjPH
	ZvQSsj+IoFjjpUWJIF4v1RzohxBEnEp6cPnMLhjoD3fRgTa+I5gef53HJfo2MREKw0BGk0l+8/0
	HiDt6eW55rzhkoZJs1PyrSOUlZPREMDtxEJkgF4O/1zFuzxiv9wF9U/dadWYZ2Kio9eIJoZd5Fy
	wez7GFcOW3KUSKT5D0CoBTPdDrewmCiQoFnkgCqpAvGIC+V1Gpdjbz3GYvYXkNzsgmsjlkpHOL1
	4QIu9Vw/pVyV/PuRGGMHd5bOl1IeCCiTtYVlEtKj8FdzjKs2gcGSCJbVSjUO61Ub/Q1GWwp3Owx
	7LV94MWmPJxcxyFh8+xoJkPpxUDQStTKhGLPglJbqxFBLyMPQfprNubGydyQh2ypjp3/fZ3b3Sa
	jkK6LEl6vwUEBd
X-Received: by 2002:a05:690c:e1da:10b0:8b1:43b7:e2e0 with SMTP id 00721157ae682-8b530a71019mr43495747b3.50.1795627424700;
        Wed, 25 Nov 2026 09:23:44 -0800 (PST)
X-Received: by 2002:a05:690c:e1da:10b0:8b1:43b7:e2e0 with SMTP id 00721157ae682-8b530a71019mr43495597b3.50.1795627424101;
        Wed, 25 Nov 2026 09:23:44 -0800 (PST)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b8e564e39asm5813780f8f.57.2026.11.25.09.23.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 09:23:43 -0800 (PST)
Message-ID: <d56b1e2b-ff7a-4587-b45e-2607ab85861d@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 19:23:42 +0200
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
Subject: Re: [PATCH v2 2/7] media: qcom: camss: csid: Add an operation to read
 the SOF timestamp
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
 <20261125-camss-hw-ts-v2-2-24c955e43d75@oss.qualcomm.com>
 <8808df3f-e090-4dba-af7d-a51146290d48@oss.qualcomm.com>
 <c5ec6619-7001-4ab4-9035-405dcaa3b739@oss.qualcomm.com>
 <CAFEp6-2kW9-Cq9kz-T9Rdz5EKL92TW=QzcSPGBPqLNfcLeDYMg@mail.gmail.com>
 <b962afd1-9e66-4780-a7ac-43426bca1a67@oss.qualcomm.com>
 <CAFEp6-1Sk1rjhqsdm+-GHBESdExWr4vVX5wMcFzEpMt8zQJhsA@mail.gmail.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <CAFEp6-1Sk1rjhqsdm+-GHBESdExWr4vVX5wMcFzEpMt8zQJhsA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b0719a1 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=n8IlR8rfZ27013JM:21 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=tSMG9UjVsoGyTiA_F3gA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: fhfnQHZw_aaaorKkQO_bAuVg2b5cdYm6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA2OSBTYWx0ZWRfX+aRmeRYSZFEy
 IMpg5DnOEX1nsRzXY3Lt3kFztI7Ug+IAqUiG56WvKQCtMyOKl8CnAdgyJ52+Rt4MIxeYhbks6U9
 XsRr+7JHiCT/7yr1Gk7VXu2RIggHqHVrnVNKKn+/HLJFbZHJTsaCVyhPG/KgJ3AlX6DUzccJVI7
 5g/CuNlqG3VYol0SxDPBWyKhsfKGI7jRWo2+F5Yi80zspECYTykPvFPK/Z1FU5maIELyQEAbzwb
 l5pdPJN6PrQERQwh258b1ShzrCf2zSBFAW+Sa7Pjkpzn9SYQPMwTxMHyjiC55D8XWvxw/Ip7zSZ
 oKlaqjd18jvHtrUuJp3gcB/Kf7IqSSx9a6/GZd3wl/GsXpCXVYjlzedaiVgzAwCXtfKavkVNw6z
 mvOHMeatyERJ61aRZUaPalzBecq+4loMMbY9g9a853mZ9g/QpQJQnrHtguMAy5GcMGh/VuqAtyM
 GIzmyIW9NjTBLAzVc0A==
X-Proofpoint-ORIG-GUID: fhfnQHZw_aaaorKkQO_bAuVg2b5cdYm6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA2OSBTYWx0ZWRfX66HHUjRsVaaX
 81+tg4fd3/dhZ3n+0mNp6I5aVGGrLtr/9+BXnv/Kh6tdjLV0WE1l8gdJXwYBdI51/Vh/oGCwG5y
 JDjzRIBykKawqd1QGW8KP2XgDSnUgt8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250069



On 11/25/2026 6:21 PM, Loic Poulain wrote:
> On Wed, Nov 25, 2026 at 4:01 PM Gjorgji Rosikopulos (Consultant)
> <gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 11/25/2026 3:18 PM, Loic Poulain wrote:
>>> On Wed, Nov 25, 2026 at 1:06 PM Gjorgji Rosikopulos (Consultant)
>>> <gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>>>>
>>>>
>>>>
>>>> On 11/25/2026 2:04 PM, Gjorgji Rosikopulos (Consultant) wrote:
>>>>> Hi Loic,
>>>>>
>>>>> On 11/25/2026 12:19 PM, Loic Poulain wrote:
>>>>>> Modern CSID revisions latch the global timestamp counter at SOF. That
>>>>>> counter is the ARM architected counter, so correlating it with
>>>>>> CLOCK_MONOTONIC through ktime_get_snapshot_id() turns the latched value
>>>>>> into the time the frame actually started, rather than the time the
>>>>>> interrupt handler ran.
>>>>>>
>>>>>> Add a hardware operation returning that counter value and do the
>>>>>> correlation in one place, leaving a CSID revision with nothing to do but
>>>>>> read its own registers. Revisions not implementing it keep being
>>>>>> timestamped at queue time.
>>>>>>
>>>>>> Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>>>>> ---
>>>>>>  drivers/media/platform/qcom/camss/camss-csid.c | 72 ++++++++++++++++++++++++++
>>>>>>  drivers/media/platform/qcom/camss/camss-csid.h |  9 ++++
>>>>>>  2 files changed, 81 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
>>>>>> index 588122beec854ae5b78de9997b68c7a81d4207e1..0d9b4f7dd768aeaed65d01da58b4dd8a3a425cbc 100644
>>>>>> --- a/drivers/media/platform/qcom/camss/camss-csid.c
>>>>>> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
>>>>>> @@ -8,14 +8,17 @@
>>>>>>   * Copyright (C) 2015-2018 Linaro Ltd.
>>>>>>   */
>>>>>>  #include <linux/clk.h>
>>>>>> +#include <linux/clocksource_ids.h>
>>>>>>  #include <linux/completion.h>
>>>>>>  #include <linux/interrupt.h>
>>>>>>  #include <linux/io.h>
>>>>>>  #include <linux/kernel.h>
>>>>>> +#include <linux/math64.h>
>>>>>>  #include <linux/of.h>
>>>>>>  #include <linux/platform_device.h>
>>>>>>  #include <linux/pm_runtime.h>
>>>>>>  #include <linux/regulator/consumer.h>
>>>>>> +#include <linux/timekeeping.h>
>>>>>>  #include <media/media-entity.h>
>>>>>>  #include <media/mipi-csi2.h>
>>>>>>  #include <media/v4l2-device.h>
>>>>>> @@ -37,6 +40,16 @@
>>>>>>
>>>>>>  #define LANE_CFG_BITWIDTH 4
>>>>>>
>>>>>> +/*
>>>>>> + * The CSID latches the global timestamp counter on SOF. That counter is
>>>>>> + * the ARM architected counter, 56 bit wide and ticking at 19.2 MHz.
>>>>>> + */
>>>>>> +#define CSID_TIMESTAMP_WIDTH        56
>>>>>> +#define CSID_TIMESTAMP_MASK GENMASK_ULL(CSID_TIMESTAMP_WIDTH - 1, 0)
>>>>>> +#define CSID_TIMESTAMP_NS_MUL       10000   /* NSEC_PER_SEC / 19.2 MHz, reduced */
>>>>>> +#define CSID_TIMESTAMP_NS_DIV       192
>>>>>> +#define CSID_TIMESTAMP_MAX_AGE_NS   (2 * NSEC_PER_MSEC)
>>>>>> +
>>>>>>  #define MSM_CSID_NAME "msm_csid"
>>>>>>
>>>>>>  const char * const csid_testgen_modes[] = {
>>>>>> @@ -1370,12 +1383,71 @@ atomic_t *csid_get_sof_seq(struct media_pad *pad)
>>>>>>      return &csid->sof_seq[pad->index - MSM_CSID_PAD_FIRST_SRC];
>>>>>>  }
>>>>>>
>>>>>> +static u64 csid_timestamp_to_ns(u64 ticks)
>>>>>> +{
>>>>>> +    return mul_u64_u32_div(ticks, CSID_TIMESTAMP_NS_MUL, CSID_TIMESTAMP_NS_DIV);
>>>>>> +}
>>>>>> +
>>>>>> +static u64 csid_timestamp_to_monotonic(struct csid_device *csid, u64 ticks)
>>>>>> +{
>>>>>> +    struct system_time_snapshot snap;
>>>>>> +    u64 delta, delta_ns, now;
>>>>>> +
>>>>>> +    ktime_get_snapshot_id(CLOCK_MONOTONIC, &snap);
>>>>>> +
>>>>>> +    /*
>>>>>> +     * Translating requires reading the counter the CSID latched from.
>>>>>> +     * If timekeeping is driven by something else there is nothing to
>>>>>> +     * correlate against, so let the caller fall back to IRQ time.
>>>>>> +     */
>>>>>> +    if (!snap.valid || snap.cs_id != CSID_ARM_ARCH_COUNTER) {
>>>>>> +            dev_warn_once(csid->camss->dev,
>>>>>> +                          "CSID%u: Can't use hardware timestamp, invalid clock source (%d)\n",
>>>>>> +                          csid->id, snap.cs_id);
>>>>>> +            return 0;
>>>>>> +    }
>>>>>> +
>>>>>> +    /* How long ago, in counter ticks, the timestamp was latched */
>>>>>> +    delta = (snap.cycles - ticks) & CSID_TIMESTAMP_MASK;
>>>>>> +    delta_ns = csid_timestamp_to_ns(delta);
>>>>>> +    now = ktime_to_ns(snap.systime);
>>>>>> +
>>>>>> +    /* Fall back rather than reporting a nonsensical timestamp */
>>>>>> +    if (delta_ns > now) {
>>>>>> +            dev_warn_once(csid->camss->dev,
>>>>>> +                          "CSID%u: SOF timestamp predates CLOCK_MONOTONIC, ignoring\n",
>>>>>> +                          csid->id);
>>>>>> +            return 0;
>>>>>> +    }
>>>>>> +
>>>>>> +    if (delta_ns > CSID_TIMESTAMP_MAX_AGE_NS)
>>>>>> +            dev_warn_ratelimited(csid->camss->dev,
>>>>>> +                                 "CSID%u: Too slow! SOF timestamp is %llu us old\n",
>>>>>> +                                 csid->id, delta_ns / NSEC_PER_USEC);
>>>>>> +
>>>>>> +    return now - delta_ns;
>>>>>> +}
>>>>>> +
>>>>>> +static u64 csid_hw_sof_ts(struct csid_device *csid, unsigned int id)
>>>>>> +{
>>>>>> +    const struct csid_hw_ops *hw_ops = csid->res->hw_ops;
>>>>>> +
>>>>>> +    if (!hw_ops->sof_ts)
>>>>>> +            return 0;
>>>>>> +
>>>>>> +    return csid_timestamp_to_monotonic(csid, hw_ops->sof_ts(csid, id));
>>>>>
>>>>> I am not sure if we need to do this every SOF. Most probably the delta will
>>>>> remain the same during the streaming, so I think it's best to use the delta within
>>>>> tolerance and then apply that for the whole streaming session. Also, I think it's better
>>>>> to have a constant delta from the monotonic clock rather than a fluctuating one.
>>>>
>>>> I think it will be the best to send both timestamps to userspace, and give the freedom
>>>> to userspace to decide by him self. But the API is not allowing that as discussed.
>>>
>>> No, the delta is not constant. In fact, that's precisely why we use
>>> it, it captures the variable CPU and software latencies between the
>>> hardware event and the timestamp acquisition. By combining the
>>> captured hardware timestamp with the current system timing
>>> information, we can reconstruct an accurate event timestamp that
>>> remains aligned with the Sensor/CSI timing, rather than being affected
>>> by software scheduling and processing delays. According to my testing,
>>> the resulting timing error is below 1 µs, from which we can derive an
>>> accurate sensor framerate.
>>>
>>> --
>>> watching /dev/v4l-subdev2 (msm_csid0), id 0
>>> id0    478 ev   60.06 fps   16.650 ms
>>>   events           : 478
>>>   timestamp (mono) : 180.160315690 .. 188.102256050
>>>   duration         : 7.942 s
>>>   frame rate       : 60.061 fps
>>>   frame_sequence   : 539 .. 1016 (missing: 0)
>>>   interval (ms)    : mean 16.650  median 16.650  min 16.650  max 16.650
>>>                      p95 16.650  p99 16.650
>>> ---
>>
>> Ok i will test the changes on my side. Just for other people we have conflicting names
>> CSID (stands from clock fw perspective to Clock Source ID, and from camss for the
>> csi decoder). If you are sure that the for csi decoder the CSID_ARM_ARCH_COUNTER
>> is always the clock source this will work i agree.
>> But if that is not the case and we end up with big delta what is the idea to do
>> that every frame. It is kind of confusing to me at least. Also i think we need
>> to check for the other platforms if the clock source is always the same.
> 
> Yes, the camera hardware always snapshots the architecture counter. If
> we detect that the monotonic clock is not derived from the same timer,
> we simply fall back to the traditional IRQ timestamping path. The same
> fallback is used if the computed delta is found to be inconsistent.

If the both clocks are from same timer there are two checks:

1. Big delta big delta something is completely wrong,
   most probably the csid timestamp has some stall data.
2. snap.cs_id != CSID_ARM_ARCH_COUNTER. If that is true do 
   we need to check on every SOF, most probably every time
   you will get the same result.

If the error can be recovered on next SOF maybe make sense
to enter this function. But i think in both cases most probably
you will end up there for every SOF, which is for each pipeline.
If all all streaming 4 times per frame.

> 
> When Linux receives the interrupt, we know:
> - The counter value now (C_NOW)
> - The Linux timestamp now (T_NOW)
> - The counter value captured by hardware when the frame started (C_SOF)
> 
> Since the Linux monotonic clock and the camera counter both come from
> the same hardware timer, we can convert the difference between C_NOW
> and C_SOF into time (T()) and "rewind" from T_NOW back to the
> **exact** frame start time:
> 
> T_SOF = T_NOW - T(C_NOW - C_SOF)
> 
> Regards,
> Loic
> 
>>
>> ~Gjorgji
>>
>>>
>>> Regards,
>>> Loic
>>>
>>>>
>>>>>
>>>>> ~Gjorgji
>>>>>
>>>>>> +}
>>>>>> +
>>>>>>  void csid_sof_event(struct csid_device *csid, unsigned int id)
>>>>>>  {
>>>>>> +    u64 ts = csid_hw_sof_ts(csid, id);
>>>>>> +    struct timespec64 sof = ns_to_timespec64(ts);
>>>>>>      struct v4l2_event event = {
>>>>>>              .type = V4L2_EVENT_FRAME_SYNC,
>>>>>>              .u.frame_sync.frame_sequence =
>>>>>>                      atomic_inc_return(&csid->sof_seq[id]),
>>>>>> +            .timestamp.tv_sec = sof.tv_sec,
>>>>>> +            .timestamp.tv_nsec = sof.tv_nsec,
>>>>>>      };
>>>>>>
>>>>>>      if (atomic_read(&csid->frame_sync_users))
>>>>>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
>>>>>> index ccafdbf3a9fe0c282da68ccdd04661b3fab81ff5..17cc3b42c8d83180d6abfcc3efe22178dcc2f2e7 100644
>>>>>> --- a/drivers/media/platform/qcom/camss/camss-csid.h
>>>>>> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
>>>>>> @@ -111,6 +111,15 @@ struct csid_hw_ops {
>>>>>>       */
>>>>>>      int (*reset)(struct csid_device *csid);
>>>>>>
>>>>>> +    /*
>>>>>> +     * sof_ts - Read the counter value the hardware latched at SOF
>>>>>> +     * @csid: CSID device
>>>>>> +     * @id: CSID src-stream ID
>>>>>> +     *
>>>>>> +     * Return the raw counter value of the most recent SOF
>>>>>> +     */
>>>>>> +    u64 (*sof_ts)(struct csid_device *csid, unsigned int id);
>>>>>> +
>>>>>>      /*
>>>>>>       * src_pad_code - Pick an output/src format based on the input/sink format
>>>>>>       * @csid: CSID device
>>>>>>
>>>>>
>>>>
>>

