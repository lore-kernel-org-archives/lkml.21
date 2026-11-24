Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795490090;
	b=5joCslJ+4uwEVcTOS9knr2s1iYczfuwTuBkZGXhdITf6QqnO8qmnnZji+4fQGppziawX
	 ChRetu8UB+RI9W4GG1Wg8mK7B191g3BULLbmx1IWkitb+UONTjqa+FBmcuugpJtVKEiW7
	 YcvW0wXx3/1OgcYJRks4Qk8rQD+7dOeI1+re5yPzkN0kIYM7Zs/obGeKgulmPeg2NMc05
	 LpNUq2pJxfp9wiN5lvulKVpWnYjRuVtpzdEXaNFt2sOddT3Rnwl2nXDKrU5JlImw0DBEg
	 Hakz/8ASHSyNUU5rQ2PYm0wCUX+N8cybWG2K5LSaYkrKNQC8s62auCEgJg7EcBbC95w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795490090;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:Content-Language:To:Cc:
	 References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kNUsFTA/+rFt0nSFuj90/JPHp5b0lPSf8zxAPCksYKo=;
	b=XFDBJAKhens0BZ7K74JmONe2KRe76+Be9EUnSpov42kJGzgdMk/G1tFPaR8qjl2PNmQf
	 SmWiI1/yQu5GeeYqEs7Ei61d0xQbGC5RqJprTHXapfyi+c4UVrZoumfKPca/QEsXxiT2w
	 EGk4tABRt+zIzmHAgF271QTA+eXQluebGG+R9k9qq9vg+39e8Vlb+EISrr7FeYMqV3GyQ
	 XVlmTGrT+wm7yQrX5S5cbpx9QgZPacN0A3kU2VynbL+7h18C9PZ4cmRWFko2dlODGXzUV
	 YFBxxb+HUaPrVXGwQrWN5n01bNmRSy1QehqrWZ18lBYEiuwZS/7dN7XSDI2ZLXQXYUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nrsbhk3K;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kvgtSbRU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37650606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37650606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nrsbhk3K;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kvgtSbRU
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2kf703738314
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:14:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kNUsFTA/+rFt0nSFuj90/JPHp5b0lPSf8zxAPCksYKo=; b=nrsbhk3K+FF5KSBX
	GIcsHunAGylqzXpdILRnF7MlHSHapypkIbvKfRqXolyM0J/E6UF4xCQKJ2IyWQei
	GYwXM8zVRiBwDhNMox0rd/fbbuMzXtex9Oqmke3Z1bvSn5Iv3cD59Cdm08DKnK+H
	ZPRQcviJ1wBeMmcuEi9Iq6c+FnhoBz5DxtdEqn5syEvBiyENpC1TbK6Ddjrsf/p7
	XLNJzRzwjopiqLqnXCJHPA+biVEAM0yDBzPowlCWmh7JcGEn0aBFmRJLICA8wz/Z
	yi9oECBmC5uhvdL0aa0KlOWZmMZ5WWP6jfAiP/3pxuwJzp3akCX6E0+63nq/Vu9z
	Zx2S8w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4m7uuh7t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:14:48 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-38531c1a566so2759303eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795490088; x=1796094888; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kNUsFTA/+rFt0nSFuj90/JPHp5b0lPSf8zxAPCksYKo=;
        b=kvgtSbRUJAXoyapQdFzjcBbbdN/99okoagPrwU+yE4fQz1LqNsSXxXqOAm6NwXotUi
         U/0WR1nb64BwjrNLzy8p4WGoiPWgkceF41pvAMnyX/Qxm0gLyjSZlvYCXorhy3hAbWxf
         a6PpGEzz2otkxfkxxW+cMdSZAwWEHWZyWCmmb5u0wzsNuM1EGmpANpxR4sbnoGvmFP/7
         bIbToDmGrhzsNoy2fvppoUOpbLNLIsRolGnDucXjXc68/W1cyRhmpwNy/SSJ1QdTT78f
         LkLhVChuYHlO02SxLj17bul93VWqya5U9GoK3CxLDMWx9h0iJwoqFgq97Ht+i9MftCMj
         7rzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795490088; x=1796094888;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kNUsFTA/+rFt0nSFuj90/JPHp5b0lPSf8zxAPCksYKo=;
        b=kUeO3BQ7W9Phf1RgdyZIIKaPspR+wtyGkb5hD0upR5LxKT3TXNYCKRtHa69ybxe6Xn
         QYSv7QGiHsR39ZQ0mP2uW+AMSaVmt+iajhH0mu3rIAU2oI0+1ttZKJzSYDBodoq6Nzlu
         vqj4rGD+QZmnV5CZ/zZc5RWodA/Lat6czN0aQTxgGAO6+iZiLYyb6npoJcX1MaXFieH1
         EZT8yQCbo2E58lI9riXsWHTfZr0t/98DQX3Q07gYiQlzqRT5DlXCBVETid7CBpHAbraH
         Rk4xObYePkZnsr9hRePWVCQV7HStR2KymiwXQSBOdRwhPSF+GCE2hUi5lmH2Rwl2jNNf
         STpQ==
X-Forwarded-Encrypted: i=1; AL+hErGnaAXIb6Ujy/74eUh0srIkxGHZXMVQfyCsr53/IFoMWIYicFgl9Ilf3Scr5DG3fg03TpP0ezQtvTZbvg4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8n6YYiYDcYeloliXgRZxHkJlY37aeEgHJ1Ci1uwi7dOJscR4Vr
	eFEe/FvPnntwWIZgEWhqtvGBH1r1RdbZvyPt2oHJi+NdufNxbMkBGP2iyrkChgDymwPfpBhVKD6
	bzzpfCgS81NjTxoKemKMVi7CPOquEzOw+Tkqw8W9VewESiQ54Rjk1/SFRcEpH1Y0Ep2E=
X-Gm-Gg: AZFdTZfburt6CKVhkx6ANhj0RgIN7Bk3wIN1yRRoLAtcTcsMn7F4fQ9JsibnnfNiV+d
	S0tPAfYN95BzL89jkS35dcGfYZP3znzBWDlqmi5O06dp3rMxyKCcKM1S9pMBIbRfh+kMfpd6xa6
	r9X/gvAIVzYbACcZbikEOK1uQdxSoJYWMG+kfpMAwTiPfsN1cBUj7WwZaBH14fCuNgc26rLMZqN
	CEUT9Y8c1j2GJKwJQRRtEUGyiU7P3hwO/RrDnomM23BaMfEDjE5E7Uppe/mtvbjT3KCPOYbYApX
	G6Wg/cXzh66ksubvu8BX0BUpqRH7+ZpLYnnEeeIwQ1M0aQN0xUhyAg1iBe4XJORHimsglP6cPoB
	S6bGfvIYR6GpN9IxKioHrUKYWL8iLJjrG+sAISzuiIHyhuL+rgIV5q28JC20FZW3nx1VEMt7Zuz
	Eqea2ISA==
X-Received: by 2002:a05:7301:e0cd:b0:375:dbeb:b363 with SMTP id 5a478bee46e88-38570f221dcmr14525336eec.28.1795490087813;
        Mon, 23 Nov 2026 19:14:47 -0800 (PST)
X-Received: by 2002:a05:7301:e0cd:b0:375:dbeb:b363 with SMTP id 5a478bee46e88-38570f221dcmr14525321eec.28.1795490087361;
        Mon, 23 Nov 2026 19:14:47 -0800 (PST)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386992b404bsm28956772eec.1.2026.11.23.19.14.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 19:14:46 -0800 (PST)
Message-ID: <18b59d4f-8f99-3ef6-9e89-73816d9b3bb7@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 08:44:39 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/3] media: iris: Use firmware reported count for output
 buffers
Content-Language: en-US
To: bod@kernel.org
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org
References: <20261031-fix_dec_seek-v1-0-cfedf0c267ee@oss.qualcomm.com>
 <20261031-fix_dec_seek-v1-3-cfedf0c267ee@oss.qualcomm.com>
 <179501763210.2846709.2834027862962422789.b4-reply@b4>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <179501763210.2846709.2834027862962422789.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: z5MJzjt3o4cplUlASH667Ic7fEMfN5bw
X-Authority-Analysis: v=2.4 cv=KurYSmWN c=1 sm=1 tr=0 ts=6b050128 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TiF8m7coz-ZBskysaL4A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: z5MJzjt3o4cplUlASH667Ic7fEMfN5bw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAxMSBTYWx0ZWRfX0xmORNrrmERh
 xI4m5srqTWxi07+cqbpW2T24pbgDfAsLi8CotLIyf5QUic5yyIsR3NrsANzV50pfu2QiA7g1kBG
 MaOEKfpSCkRwEOYsipOhIJVTVuqzzWw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAxMSBTYWx0ZWRfX8TvhOWk/MrtK
 LATi8z3sMYiCeh2SwvWXA7fSJ2uOoXT1KUGXGxSY0rXO43ptJhnDSP1Zl2ba2nzVt8uRCpU4kZ+
 IHsLs40/bAndehmhzAHr+X7/XnGfp7RTJiBRjQf7WvaN8/xpry52Ks34JXHlSI0FWcE0nVHvXNB
 J9o7AmR7ws0qwPb8lneUzSxvxANJnVeeG32XXFwxiRzQPiOKvmFpdLI5m5zaDoCF3jickEMUZJf
 clVixRHyUnEbwYoapY3p9uparXJHbujyPLItoyEa1ck3+wXk1bkaVAldoLZG1vMc6EFM22c4rcL
 qUVB+IybblMWkiDMZoCrQZpOkYBeJ58Aq8VT7XFGsxpSYcbtFDjQx+Z7kcWOAQwYtO3rdhz+C4T
 nFGpwM6fEcjmKH4KErLltjlNLL3PA1auvDPh8AL5jwPNpChfsCKYhPJygmJSn2qyT/tj5iZQqXV
 TbWbBlS348WKOb9Gorg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240011


On 11/18/2026 9:30 PM, bod@kernel.org wrote:
> On 2026-10-31 01:49 +0530, Vishnu Reddy wrote:
>> Once the firmware reports its minimum output buffer count, the driver
>> still caps it to 4 for VP9 and AV1 when split mode is enabled. After a
>> seek, the output buffer count can be lower than the minimum required by
>> the firmware for VP9 streams. This causes the firmware to report
>> insufficient output buffers and the seek operation can fail.
>>
>> Use the firmware reported minimum count as is. The driver calculated
>> count is only used until the firmware reports its own requirement.
>>
>> Fixes: e1f5d32608ec ("media: iris: Add internal buffer calculation for HEVC and VP9 decoders")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>  drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 10 ++--------
>>  1 file changed, 2 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> index a8170e5fa9e6..57467c952f42 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> @@ -2375,14 +2375,8 @@ static int output_min_count(struct iris_inst *inst)
>>  	int output_min_count = 4;
>>  
>>  	/* fw_min_count > 0 indicates reconfig event has already arrived */
>> -	if (inst->fw_min_count) {
>> -		if (iris_split_mode_enabled(inst) &&
>> -		    (inst->codec == V4L2_PIX_FMT_VP9 ||
>> -		     inst->codec == V4L2_PIX_FMT_AV1))
>> -			return min_t(u32, 4, inst->fw_min_count);
>> -		else
>> -			return inst->fw_min_count;
>> -	}
> Quite a few questions here. Why is the minimum count currently set to four
> ? Why do we use a hard-coded value of four more than once, why not define a
> different minimum count ?

These are the minimum output buffers the firmware expects at the start
of a session, before it reports its own requirement. Once the firmware
reports its count, the driver must use that value from then on, which
is what this patch does. The hard-coded 4 in the min_t() cap is removed
by this patch.

> ---
> bod
>
>
