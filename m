Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618889;
	b=3YFCNc89eAhu1fmvUIwQbsei2ihfkSw3rhEcrcX0EEtB1GkEmgN1yssiFKp07TgJCAH2
	 PkPx2CXuH/EmVeJCOJBKcTgH9FUD0kn/dZujgHpUYf8vStssSobF3PaH85gr0Omemk6uc
	 13HUDBavq4hmp1/6clQ+BobL9Df1qNgqI0BmUcZngxKQYsc+Mzg1w2Kkf5sXkc5FlJeJd
	 OPwBdywJ1OK9JgbVRCIZltCrATioA4OYjw5seDE2R6/9ZkXlGbsaRUV9ejuL9IzUqP3pK
	 Ghdi+/KOoTJpnf2QVS8wvx0GY+Xrf5rGH87SbkYg7dFjNSykRiAWJcJvulm84+0pGRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618889;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7ioH7z6azNJBNVSmFir43/FXLx2ZheCYQGjcV/axIoE=;
	b=nc4jiM+VRDgZioncrDByGpEhbPKQSnb8Qf9HZxWVhfoyGQZtgSFIaN+rsMRZDuCI3K/5
	 aSyBLF/T9mozjhKo2Mjaz9m9aRASRTBnIxEkceUkD7lTLLv7O7G5lDmyTiTbP3FxeyD6W
	 taYftqoBMDWUvvXnelwfsY2jeJeOFLiMbWlbSsAQQaZc8v650eqM1lu7g5NjjH0g9FKf1
	 QpTh9PVjitSgmSjCortUGjhdpbvVpClJmwU2sxhPcnqcg1Y6QzWNSfXD6Gme8JAL5izXh
	 nur/70MT1xFDUv0hr4EZOvorqH1fU9T/+J11fTdlXRIEcKlrHuVobcOFgxjKuUopJrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="AX/Lt+t1";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S3HsZxkz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D24606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:01:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82D24606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AX/Lt+t1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S3HsZxkz
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APEMHKk2099830
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:01:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7ioH7z6azNJBNVSmFir43/FXLx2ZheCYQGjcV/axIoE=; b=AX/Lt+t1OKuxZLGM
	slKhGYLrHrbN7Z2cHaSb4sgeh1RaLQrKZdXpIRvQFEPZlm/fOEDGXanSOe0EVEFD
	9v40NmG9CqiMYU9lSOxRwV2a7zPnURBGAoTJlu0INvhYrYBoyylFqk4aQu+vl2wj
	KXg5QoSrJNY4DuXqKnSHjI9GpAxImDg4aCcLQo4mNxxa9vyxyVZEvypq95u1OBn7
	EDiyBmIwUfYqIHc8NYcXqwPptccw9lfKb6d3UZJUrmL6vssUWSmgwwTK9fYu1JJV
	jMcIXtduTt4uuuzSi+mmNxg+gPnjcPdWo17BQiE/+znzyLYceTfpdPb2LqOObGnf
	tQmSGA==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61arg6a9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:01:27 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-574f8578e48so5353292b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795618881; x=1796223681; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ioH7z6azNJBNVSmFir43/FXLx2ZheCYQGjcV/axIoE=;
        b=S3HsZxkzFKK7RY/wO7KA3G3xUjpalQ3dxDSAsdiI7TsGmaQFtRmShZWwbEiadWytKt
         bzG7H/3EdCA9Qq9jJgUoBFoUiSBsjD+QHdG/MdT2BnWMT3zJyTS5A4sPkkcM1A4ek8ll
         G2EVpXob5RwfPOPrXKuOvlomJoVLSVH585F6oKI0ZrkAUACsFnKs0njIMZmvC/VntdV4
         3N5VK7xVWeW+dq4FErLyQxhoS97vC9SPqHfGsKgz5gbGaxZmCOf7p3GZWne800hp/hOc
         wzkjR6xmsC93Q+PL9/SzLyeNTCadMhqUPp+SuAzwFHKqY7p+Zte5DHGgWE3AVUE6+riN
         8eKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618881; x=1796223681;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ioH7z6azNJBNVSmFir43/FXLx2ZheCYQGjcV/axIoE=;
        b=yCsQSxbm2+wA6aukCLlO9lJGy4g863+O6Vc3yLBpQaG67hDwoy1wx11QdXHlsrfGFZ
         4LWZBcHJwhyrU4mmGowOZe8m/QAg4T3w4SfsIl3POm0nOs4resRpj3g0POovGr18ehdi
         JrDFmcOI14qnsGS+HzbIASDDB7nEyQA7NpI2lTcFpNW5dYLEXl2Xx7FeUdwQwQTSmMlW
         t+0UH9vo3WVpZ1Ep1/xcaOuClWQMzLGl+SrGDchgXRGdhYPHb2dQuOxhhHPTKXvmd/Nc
         b0GRlraIKbA4VerC2NhLJZ004JnhiaaEL9HKZuvy6hIbbsvpJXF+zokMEISVTzn01o6V
         iL6w==
X-Forwarded-Encrypted: i=1; AL+hErGd0d66NxxUadLLPwJpP8RAbc674mRxgux1xlyFskxL6mzoeWv+JgaQXoL2oCQojbBliIyE+2sJUyHtjlM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1gzXg+X8bvLUoSrCJwJtVHnLEDSvfE/Fu3BO8+f/hAaRPvFlu
	1XIlZCZhooVoVFhV6HBLX/w/w5iTHcKaWmb6EnRsWh5Xj8U2VEU0MlPoPxcqiZxULmX+vifXWhI
	fOWa2xNoUBWglD4bsgepKbSlu46ghByHqR8fer3/cc5esf+8ydVR3hNQROxlOZu9YHhc=
X-Gm-Gg: AZFdTZcLNERcFoQQpf7+ES+Z3J7zlvbkOrIAzCJESQcWIMghHmcHGcTOUBjFQ4Y5ski
	bKmflCQ8XyIp1vzSf1NaDKDH+cSMSSOnslbDQL6lDKLQOFjkf0rgw9qbwOBFtqkcND77bw4gvBd
	b2RtT4Heh8RwmjfuCU3TDmoQbh8YhDniafRb+oxpF01UlMf6dXz50lcwTs1Wu+EF0JLhePPBU/b
	ux/IfILnFuLF+EFTYP6wzYNxX2bmW7VqvtkGzC7UZKTTC1ohc0lNJV/DMLiN1q+TizNvcf38aAa
	gTysYgVCJLZYntNMmR6tHvK6+5xs3OfYTHopOBsulUDs3meEz+HW1VMxaYquSdUj7/1M6vhrP14
	J/MMd5CfKOU/wwaikDdMGFOB02c1YnVbK3ALnzN+xCox8KxDS15DuB2AMB/4BUaScuGKCk29c8w
	7E/wOgTa+u23lNFQ==
X-Received: by 2002:a05:6808:c123:b0:53b:30cf:ba6e with SMTP id 5614622812f47-57a0650ba15mr18751524b6e.1.1795618881266;
        Wed, 25 Nov 2026 07:01:21 -0800 (PST)
X-Received: by 2002:a05:6808:c123:b0:53b:30cf:ba6e with SMTP id 5614622812f47-57a0650ba15mr18751286b6e.1.1795618879186;
        Wed, 25 Nov 2026 07:01:19 -0800 (PST)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm35641857f8f.3.2026.11.25.07.01.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 07:01:18 -0800 (PST)
Message-ID: <b962afd1-9e66-4780-a7ac-43426bca1a67@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 17:01:15 +0200
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
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <CAFEp6-2kW9-Cq9kz-T9Rdz5EKL92TW=QzcSPGBPqLNfcLeDYMg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: yRELLiTBnlro52QK5KatzT5ImANKW3VP
X-Authority-Analysis: v=2.4 cv=OIOyTiaB c=1 sm=1 tr=0 ts=6b06f847 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=n8IlR8rfZ27013JM:21 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=HNN1ErKAAC-MJE2l0W8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: yRELLiTBnlro52QK5KatzT5ImANKW3VP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1OSBTYWx0ZWRfX6JQPKtMJ9Wnc
 0LKrjlZbVu34DZT021t36bn8F8+NzkBfILtWgWeqJEQ7R5e3zxadXsU+C+AZKTDUFGGMtsmJ/lN
 GNtdKL5HBTzXmiPh3IS+Kv7NkIBIWhI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1OSBTYWx0ZWRfXxYsoJJhVUvXn
 +ato8Ph1fAp1j5L6Ll+4QTiL7XdhBziZJ+vZmahr6pn/JfX5ZtZhr+/8GkOzqjF9PAw4lGvdNfZ
 2kKZJbdzVAt6ge6NmuZE4YHHRTKzT6lQcx4YcUiEadXNWEFwsMX3BHtFXMXAfvE2s8vdKjrPsi1
 nYW32JNpyoe4BlrNpeiI3kiKVbs3ljIbQtXVPTGHQUrWNm6I/Fu+aoFUe7jPJ8ggSs+xpAMx117
 irhq0g6wPRIJyk1awrrBZBNb+Hcew4BVQ3aG1SpI05Hm5hkcqNBskWdI9YIoxQPQnQqZSIQALoU
 4j9ghXOQvzRlPSMhGovF68opBMTGVambI3AXkgoG/Y3YWLgtqc71WW9nWiXbLUUtDtjZYWjmTzZ
 2QSHJEJGMNLPgcTokv4TcHRPOsBQWE/y0r9qz4Aafl+K7ZCVgWYVa+iN3aJUihff5GhHZ2ueeyn
 1erRyLGeii6GX6oDLKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250059



On 11/25/2026 3:18 PM, Loic Poulain wrote:
> On Wed, Nov 25, 2026 at 1:06 PM Gjorgji Rosikopulos (Consultant)
> <gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 11/25/2026 2:04 PM, Gjorgji Rosikopulos (Consultant) wrote:
>>> Hi Loic,
>>>
>>> On 11/25/2026 12:19 PM, Loic Poulain wrote:
>>>> Modern CSID revisions latch the global timestamp counter at SOF. That
>>>> counter is the ARM architected counter, so correlating it with
>>>> CLOCK_MONOTONIC through ktime_get_snapshot_id() turns the latched value
>>>> into the time the frame actually started, rather than the time the
>>>> interrupt handler ran.
>>>>
>>>> Add a hardware operation returning that counter value and do the
>>>> correlation in one place, leaving a CSID revision with nothing to do but
>>>> read its own registers. Revisions not implementing it keep being
>>>> timestamped at queue time.
>>>>
>>>> Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>>> ---
>>>>  drivers/media/platform/qcom/camss/camss-csid.c | 72 ++++++++++++++++++++++++++
>>>>  drivers/media/platform/qcom/camss/camss-csid.h |  9 ++++
>>>>  2 files changed, 81 insertions(+)
>>>>
>>>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
>>>> index 588122beec854ae5b78de9997b68c7a81d4207e1..0d9b4f7dd768aeaed65d01da58b4dd8a3a425cbc 100644
>>>> --- a/drivers/media/platform/qcom/camss/camss-csid.c
>>>> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
>>>> @@ -8,14 +8,17 @@
>>>>   * Copyright (C) 2015-2018 Linaro Ltd.
>>>>   */
>>>>  #include <linux/clk.h>
>>>> +#include <linux/clocksource_ids.h>
>>>>  #include <linux/completion.h>
>>>>  #include <linux/interrupt.h>
>>>>  #include <linux/io.h>
>>>>  #include <linux/kernel.h>
>>>> +#include <linux/math64.h>
>>>>  #include <linux/of.h>
>>>>  #include <linux/platform_device.h>
>>>>  #include <linux/pm_runtime.h>
>>>>  #include <linux/regulator/consumer.h>
>>>> +#include <linux/timekeeping.h>
>>>>  #include <media/media-entity.h>
>>>>  #include <media/mipi-csi2.h>
>>>>  #include <media/v4l2-device.h>
>>>> @@ -37,6 +40,16 @@
>>>>
>>>>  #define LANE_CFG_BITWIDTH 4
>>>>
>>>> +/*
>>>> + * The CSID latches the global timestamp counter on SOF. That counter is
>>>> + * the ARM architected counter, 56 bit wide and ticking at 19.2 MHz.
>>>> + */
>>>> +#define CSID_TIMESTAMP_WIDTH        56
>>>> +#define CSID_TIMESTAMP_MASK GENMASK_ULL(CSID_TIMESTAMP_WIDTH - 1, 0)
>>>> +#define CSID_TIMESTAMP_NS_MUL       10000   /* NSEC_PER_SEC / 19.2 MHz, reduced */
>>>> +#define CSID_TIMESTAMP_NS_DIV       192
>>>> +#define CSID_TIMESTAMP_MAX_AGE_NS   (2 * NSEC_PER_MSEC)
>>>> +
>>>>  #define MSM_CSID_NAME "msm_csid"
>>>>
>>>>  const char * const csid_testgen_modes[] = {
>>>> @@ -1370,12 +1383,71 @@ atomic_t *csid_get_sof_seq(struct media_pad *pad)
>>>>      return &csid->sof_seq[pad->index - MSM_CSID_PAD_FIRST_SRC];
>>>>  }
>>>>
>>>> +static u64 csid_timestamp_to_ns(u64 ticks)
>>>> +{
>>>> +    return mul_u64_u32_div(ticks, CSID_TIMESTAMP_NS_MUL, CSID_TIMESTAMP_NS_DIV);
>>>> +}
>>>> +
>>>> +static u64 csid_timestamp_to_monotonic(struct csid_device *csid, u64 ticks)
>>>> +{
>>>> +    struct system_time_snapshot snap;
>>>> +    u64 delta, delta_ns, now;
>>>> +
>>>> +    ktime_get_snapshot_id(CLOCK_MONOTONIC, &snap);
>>>> +
>>>> +    /*
>>>> +     * Translating requires reading the counter the CSID latched from.
>>>> +     * If timekeeping is driven by something else there is nothing to
>>>> +     * correlate against, so let the caller fall back to IRQ time.
>>>> +     */
>>>> +    if (!snap.valid || snap.cs_id != CSID_ARM_ARCH_COUNTER) {
>>>> +            dev_warn_once(csid->camss->dev,
>>>> +                          "CSID%u: Can't use hardware timestamp, invalid clock source (%d)\n",
>>>> +                          csid->id, snap.cs_id);
>>>> +            return 0;
>>>> +    }
>>>> +
>>>> +    /* How long ago, in counter ticks, the timestamp was latched */
>>>> +    delta = (snap.cycles - ticks) & CSID_TIMESTAMP_MASK;
>>>> +    delta_ns = csid_timestamp_to_ns(delta);
>>>> +    now = ktime_to_ns(snap.systime);
>>>> +
>>>> +    /* Fall back rather than reporting a nonsensical timestamp */
>>>> +    if (delta_ns > now) {
>>>> +            dev_warn_once(csid->camss->dev,
>>>> +                          "CSID%u: SOF timestamp predates CLOCK_MONOTONIC, ignoring\n",
>>>> +                          csid->id);
>>>> +            return 0;
>>>> +    }
>>>> +
>>>> +    if (delta_ns > CSID_TIMESTAMP_MAX_AGE_NS)
>>>> +            dev_warn_ratelimited(csid->camss->dev,
>>>> +                                 "CSID%u: Too slow! SOF timestamp is %llu us old\n",
>>>> +                                 csid->id, delta_ns / NSEC_PER_USEC);
>>>> +
>>>> +    return now - delta_ns;
>>>> +}
>>>> +
>>>> +static u64 csid_hw_sof_ts(struct csid_device *csid, unsigned int id)
>>>> +{
>>>> +    const struct csid_hw_ops *hw_ops = csid->res->hw_ops;
>>>> +
>>>> +    if (!hw_ops->sof_ts)
>>>> +            return 0;
>>>> +
>>>> +    return csid_timestamp_to_monotonic(csid, hw_ops->sof_ts(csid, id));
>>>
>>> I am not sure if we need to do this every SOF. Most probably the delta will
>>> remain the same during the streaming, so I think it's best to use the delta within
>>> tolerance and then apply that for the whole streaming session. Also, I think it's better
>>> to have a constant delta from the monotonic clock rather than a fluctuating one.
>>
>> I think it will be the best to send both timestamps to userspace, and give the freedom
>> to userspace to decide by him self. But the API is not allowing that as discussed.
> 
> No, the delta is not constant. In fact, that's precisely why we use
> it, it captures the variable CPU and software latencies between the
> hardware event and the timestamp acquisition. By combining the
> captured hardware timestamp with the current system timing
> information, we can reconstruct an accurate event timestamp that
> remains aligned with the Sensor/CSI timing, rather than being affected
> by software scheduling and processing delays. According to my testing,
> the resulting timing error is below 1 µs, from which we can derive an
> accurate sensor framerate.
> 
> --
> watching /dev/v4l-subdev2 (msm_csid0), id 0
> id0    478 ev   60.06 fps   16.650 ms
>   events           : 478
>   timestamp (mono) : 180.160315690 .. 188.102256050
>   duration         : 7.942 s
>   frame rate       : 60.061 fps
>   frame_sequence   : 539 .. 1016 (missing: 0)
>   interval (ms)    : mean 16.650  median 16.650  min 16.650  max 16.650
>                      p95 16.650  p99 16.650
> ---

Ok i will test the changes on my side. Just for other people we have conflicting names
CSID (stands from clock fw perspective to Clock Source ID, and from camss for the
csi decoder). If you are sure that the for csi decoder the CSID_ARM_ARCH_COUNTER
is always the clock source this will work i agree.
But if that is not the case and we end up with big delta what is the idea to do 
that every frame. It is kind of confusing to me at least. Also i think we need
to check for the other platforms if the clock source is always the same.

~Gjorgji

> 
> Regards,
> Loic
> 
>>
>>>
>>> ~Gjorgji
>>>
>>>> +}
>>>> +
>>>>  void csid_sof_event(struct csid_device *csid, unsigned int id)
>>>>  {
>>>> +    u64 ts = csid_hw_sof_ts(csid, id);
>>>> +    struct timespec64 sof = ns_to_timespec64(ts);
>>>>      struct v4l2_event event = {
>>>>              .type = V4L2_EVENT_FRAME_SYNC,
>>>>              .u.frame_sync.frame_sequence =
>>>>                      atomic_inc_return(&csid->sof_seq[id]),
>>>> +            .timestamp.tv_sec = sof.tv_sec,
>>>> +            .timestamp.tv_nsec = sof.tv_nsec,
>>>>      };
>>>>
>>>>      if (atomic_read(&csid->frame_sync_users))
>>>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
>>>> index ccafdbf3a9fe0c282da68ccdd04661b3fab81ff5..17cc3b42c8d83180d6abfcc3efe22178dcc2f2e7 100644
>>>> --- a/drivers/media/platform/qcom/camss/camss-csid.h
>>>> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
>>>> @@ -111,6 +111,15 @@ struct csid_hw_ops {
>>>>       */
>>>>      int (*reset)(struct csid_device *csid);
>>>>
>>>> +    /*
>>>> +     * sof_ts - Read the counter value the hardware latched at SOF
>>>> +     * @csid: CSID device
>>>> +     * @id: CSID src-stream ID
>>>> +     *
>>>> +     * Return the raw counter value of the most recent SOF
>>>> +     */
>>>> +    u64 (*sof_ts)(struct csid_device *csid, unsigned int id);
>>>> +
>>>>      /*
>>>>       * src_pad_code - Pick an output/src format based on the input/sink format
>>>>       * @csid: CSID device
>>>>
>>>
>>

