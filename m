Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795612710;
	b=jw2HCpIRHnSVa/CRfMMdocsJM6LTNFrAiRZo+wMzC3yIMUyaQtjB5dPH7tz4IXlwRGVG
	 0Sf3ZwAxP1++BD46UQNtP5JMQaqDWzIrOK7fBpGlghiMgnPeN8wWiOlZJSztkNLLQ7TpX
	 1/d+rPO+1YQCXoOBEnvaWbw74nWhP7ZEFa1KkeDYlUT6LpM8n1JkAJsBN5KA+e9+kIOwI
	 Sv+w9xAx/GLTM67SCW9NB6TCW5Fw530OZjJcW3elAmYDOoDnmqEClPyJ7lzaW6FE1VGCA
	 CTgkWRHvk5Mkdig88L/rHgeOSL7JTk38hd5BBiADDhiavy2Al9l5DwJZDyUAq/48STg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612710;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jfQ8zUONTyEFfJZ+AnDpw8kVCqkJU2Y/oL+XJFKbGKQ=;
	b=SlhvzOdHerXOjyUO2J9q0nERL311NZ390J5cSvF0xgEmsKam+bzBMKR0u6r1Ybs584hA
	 Pk+leqJhh+Rhluke45BSP+O7hJblWH2sfuV3DKsapA744c8ORL3AWxSUnVZwb3sRfPTxk
	 yCu15Cgzcua4Hmz/D297PVQZnHPBJmZvWacCjvfGHXZxvJFOdNQMCAXx8824TCTNA6YG+
	 d8TF/w5J9QmLiv9gaL45ulyzXcQ6vWFXKwwmmOsEmKlk2oiT2Q/p2qE+AK9ViRU7UJYCo
	 mJdfKO7/Ut6eEga7PyOF89BRd6nfh1xDSG6DAwjeh6k7X1vY/Mx8+z73EMfx75P0vmA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=STRQMq6x;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sn+b0q4k;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A90606A334
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:18:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83A90606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=STRQMq6x;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sn+b0q4k
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mTjn4034158
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:18:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jfQ8zUONTyEFfJZ+AnDpw8kVCqkJU2Y/oL+XJFKbGKQ=; b=STRQMq6xNGwHCMk7
	fXateg9/XtLfBr9qpcXwH6KSUbkDddyLuUKuIgYCv/mlDnPVWasDlm2Qy/SUcB9b
	8fh5ph1cE1albFkMW1KZ0evWmfAr3l6NlvXpNzbsVUXFfcNGMJBkC8VApujcCh+8
	Q5jfErCFb5pSnw9AlOTiw9Ll/smChyteCdpI/WiR642dLYSLl+321FwiRE9B7HQM
	5Hrtjjr1P3hxrEBcThapFLnfNS6P0ZgoMreFlTrcLzUI2rT3p+1xxrAQdUxTs7M/
	qjWkRwWPJYvE+kwI5I65ztZxQSQnPCYqg6QkK8BnRXqSXHmRI2jq6jV0O/WvJoO8
	ZBsVQQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbjxf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:18:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94967c6d4f4so634479985a.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:18:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795612707; cv=none;
        d=google.com; s=arc-20260327;
        b=j6Aqe9bUsrlnvn0jg0visyeRAwUWwogpu09Jyf+VMPVTXSfdjNKw4y1llLzC8wyKtD
         BvscbJZI3vji5dicTnzFXo5kccxPNyc7Cj3dbhraRZoUnz11qgSWGEdRWg7CEMZShpCa
         21WLwzx/fgnxdh7ZammAoKEwoqYEbkLlcVeA+QhcC6qCgFFFAxcbwodLkI+gzgA/p3UF
         8x/ebUwdkB4U/FCYMP2TElCnsPOXwizjq2HwgT4f9kDmRMqjP9gTasfLOMUXY/W6DcaH
         ZZVZ5gr2Gga3QslXrAIoI9sMT4lARWssUa8jxiAUo8nzaLBTF6Mr+tlQIGDnNQ7K71WN
         BJvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jfQ8zUONTyEFfJZ+AnDpw8kVCqkJU2Y/oL+XJFKbGKQ=;
        fh=u0RDwuBpzck3Her8NKfe59Q5v/zjxOoP0qWMJIkBB4c=;
        b=AhBAhxw+bH53onrdp5wf02P/1AIFe0DP5JVB+7vOlP5xieePWdmLRSFAOCP9P1xiz0
         NRozDHOgXzMK9eMeyKSH39es11qNTT4r9u9ilMQHwkICBbjmcJjmVi6IvKchaWG3cGqA
         hH6Qa9Di7p7WAe0rzLpf4tmhTJpML0QP529GHaGjbavuqiHrtpy+XatLBK4JVBQwtrhc
         ioX0+run8xOTP4kPrY2o3FywrxNk5xISH3BtozuwYhvp0VqtP7EZZQ+ALotmV+i0hc1B
         /kj+qtgHGw80Ml+0KgmTy0tVHjX+P4wkF7oqoSoA4TKfd63I7feZ7gUPrm7XQ0rMabLF
         uo+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795612707; x=1796217507; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jfQ8zUONTyEFfJZ+AnDpw8kVCqkJU2Y/oL+XJFKbGKQ=;
        b=Sn+b0q4kdaLMcDhaRbTrK9kryV3BYOK33/K18IDZ3WkIwpvhJsMaew2L3i7XVJcrYn
         g9Pyk8ThI/hHLCzrv3IzbXexkoml5+VZQqoBH46Q0b/XBTqEq2eCHfVq5HNYQouXHd2K
         zhywMYMAkf7OVBtKV3JGLp0yrnxQrLjZ5XF+cqzYamuwlEYxOuUrUotzVLblqcwMe+pD
         KYfFl6TUBgsEKi6IbcySg8ajvX4WLxe3YP35wpV/PoDpY7tsvdX+R/rfZap2BixFeCjV
         4nLU64OmUrNEG0M/aXcZ9vOalo2yVWvk2ibHNhfXIQ5msPLhqTT4bgbahIa5ef9ws7SG
         bO5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612707; x=1796217507;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jfQ8zUONTyEFfJZ+AnDpw8kVCqkJU2Y/oL+XJFKbGKQ=;
        b=ZxC3eueBf81/F3hCRBM7wVU15KWpRTemEaeTbuTlJ2XCxCOkPmFRGP6IDg1tkxn9G0
         +R+HemNTuwKC4sPLbQV1kfLX6k5qY2D5rlg94lc8ymqa35X5Eaqz0qeSRCSIuNHEHxJx
         oaX4aGcwOyAyatgBRzqusc1zL+V+592N96OiIk8pmoGZ/RIznJ91JP7ltFywTvsfGYbR
         F5XsN5UYaVEDsWJBOMUm8h/l1A5l/a+5js0J7QenTifjDX7HkLqcgcGOz5zypRx95hKs
         Bhasz+fCAJ2B75u/ptgi0BFo44xSrBkOF+8/UO7WLmrVozjvUYZ3ooti5s3ewsWN0jAR
         OpAQ==
X-Forwarded-Encrypted: i=1; AL+hErE5inkQL5tQA758+Vku+Adv8Br2nJjIdwnBiZCEXWToJfIUc8ZY39zokYRwWDkIPPcx9lpK5r9/VsN11Qs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9aSoupEz730+K5UWDOmwtL5lQNyr3LGAVosGl36yacNvK51QPW
	By4+gUP2EETxSpTSgGx545OHTw5AEa7LPUlcGtzgWaJGCfWIi8f6N2c7ZXhwryicLa0Z/ucYtmb
	hua3QrZ/7qRAAKHnDH0k7xiPdk095zGCOnH7un79oQCfdxTlYzdsixz2VnCFZnMZJQrk98ZS4fP
	5nQpDnVHBGguxTmYyH5TW+Gpwox9Zl4qHOd+DLpc3sVA==
X-Gm-Gg: AZFdTZckuL8q4trBnPzdZtamO3yatWrx7C4Zv2k8vV/c+9s3eHHm7ZwSTwM7qXLGzMs
	RYQAIk0UqDhQPfIJ++16XD3kMq1UHAg4MxF48Devojm3LApjWzawio6lvzVoed041QtDZX2K9qm
	w2Dm4+iFLmFIJZ0hWcHq6ua6asAM1ltpIscqfhlh2CzQjC+mBvgKYv5QzD46QdLEuteDjKm6SAC
	pDKEDIGPuvd5HU8toDSlOPCwFRA7194gHIXA9kZucWb2T32lDvu6g/BEAwmpd1m1SI0TUOdHiE=
X-Received: by 2002:a05:620a:46a4:b0:949:70f1:de35 with SMTP id af79cd13be357-949ba825d86mr3250678785a.7.1795612707379;
        Wed, 25 Nov 2026 05:18:27 -0800 (PST)
X-Received: by 2002:a05:620a:46a4:b0:949:70f1:de35 with SMTP id
 af79cd13be357-949ba825d86mr3250672385a.7.1795612706762; Wed, 25 Nov 2026
 05:18:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
 <20261125-camss-hw-ts-v2-2-24c955e43d75@oss.qualcomm.com> <8808df3f-e090-4dba-af7d-a51146290d48@oss.qualcomm.com>
 <c5ec6619-7001-4ab4-9035-405dcaa3b739@oss.qualcomm.com>
In-Reply-To: <c5ec6619-7001-4ab4-9035-405dcaa3b739@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 14:18:15 +0100
X-Gm-Features: Aa3M54rS6W4Gj8-UsNxYBgNGFaRIiqao9vqyRPZWDkWxosV6vOaMiiF9u8oAvDk
Message-ID: <CAFEp6-2kW9-Cq9kz-T9Rdz5EKL92TW=QzcSPGBPqLNfcLeDYMg@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] media: qcom: camss: csid: Add an operation to read
 the SOF timestamp
To: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfX9HX6WxDtUHg2
 KccSamj/pFSKPsbwDw2mp2WGmIbZCF4sj8Tj+/Y0ykJhIVLP3Hi0stKGkXp+tJt2zCe1Ij74cFO
 gIvDnlOo2pO+w9j4MHSJtKmzlM2ygSs=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b06e024 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=n8IlR8rfZ27013JM:21 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=FHOEy1rzMmd96heRGqsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfX8QHgroiI3stJ
 6pxiXOBf2oDkMOtMt0OeXCtWdWIXNoj7kWeACRxJq+9B22ABnSeJVo9pzNTXbHhLRdmqh4Yu/1u
 0wVZGYPCahfK0Dw+t4teNRQnuLKQvjoLSIZZZ9ZzAFmzanVYjjF3Md3zzaS5EscN6seiFZ+EfEf
 XDvGK+tbxZsfNp2PamtqukvNikyy8B7OZVx2irnerYVam665lC8MK2t+6U2aq5dwq/N44zqriB/
 sRZ67cl6SF4JnoEBqCZILwVPx3VPQiIK+98VmTA3et3Q878mP1n0y1pgmzGIUY2MUkWx/BWIuAf
 CyEozK7KGjabya7vGoXA+lVKHPDHF+mZ5LZTOMQKJ9Bw+kLnj5Eczk5LbN78SI8t9HfoOpMtqaO
 CJlal730eOqjByFQpUq8CMw+AX0qnl12czhmKLqd4op5GGEFkfWVL14Xg5TpCrJqChSpE8bhWzn
 7X74774t25fkBRCCelA==
X-Proofpoint-ORIG-GUID: -Y3vU38MMSZEfuUNcHZh_4eKWIvdfHLA
X-Proofpoint-GUID: -Y3vU38MMSZEfuUNcHZh_4eKWIvdfHLA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250052

On Wed, Nov 25, 2026 at 1:06=E2=80=AFPM Gjorgji Rosikopulos (Consultant)
<gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>
>
>
> On 11/25/2026 2:04 PM, Gjorgji Rosikopulos (Consultant) wrote:
> > Hi Loic,
> >
> > On 11/25/2026 12:19 PM, Loic Poulain wrote:
> >> Modern CSID revisions latch the global timestamp counter at SOF. That
> >> counter is the ARM architected counter, so correlating it with
> >> CLOCK_MONOTONIC through ktime_get_snapshot_id() turns the latched valu=
e
> >> into the time the frame actually started, rather than the time the
> >> interrupt handler ran.
> >>
> >> Add a hardware operation returning that counter value and do the
> >> correlation in one place, leaving a CSID revision with nothing to do b=
ut
> >> read its own registers. Revisions not implementing it keep being
> >> timestamped at queue time.
> >>
> >> Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >> ---
> >>  drivers/media/platform/qcom/camss/camss-csid.c | 72 +++++++++++++++++=
+++++++++
> >>  drivers/media/platform/qcom/camss/camss-csid.h |  9 ++++
> >>  2 files changed, 81 insertions(+)
> >>
> >> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/=
media/platform/qcom/camss/camss-csid.c
> >> index 588122beec854ae5b78de9997b68c7a81d4207e1..0d9b4f7dd768aeaed65d01=
da58b4dd8a3a425cbc 100644
> >> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> >> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> >> @@ -8,14 +8,17 @@
> >>   * Copyright (C) 2015-2018 Linaro Ltd.
> >>   */
> >>  #include <linux/clk.h>
> >> +#include <linux/clocksource_ids.h>
> >>  #include <linux/completion.h>
> >>  #include <linux/interrupt.h>
> >>  #include <linux/io.h>
> >>  #include <linux/kernel.h>
> >> +#include <linux/math64.h>
> >>  #include <linux/of.h>
> >>  #include <linux/platform_device.h>
> >>  #include <linux/pm_runtime.h>
> >>  #include <linux/regulator/consumer.h>
> >> +#include <linux/timekeeping.h>
> >>  #include <media/media-entity.h>
> >>  #include <media/mipi-csi2.h>
> >>  #include <media/v4l2-device.h>
> >> @@ -37,6 +40,16 @@
> >>
> >>  #define LANE_CFG_BITWIDTH 4
> >>
> >> +/*
> >> + * The CSID latches the global timestamp counter on SOF. That counter=
 is
> >> + * the ARM architected counter, 56 bit wide and ticking at 19.2 MHz.
> >> + */
> >> +#define CSID_TIMESTAMP_WIDTH        56
> >> +#define CSID_TIMESTAMP_MASK GENMASK_ULL(CSID_TIMESTAMP_WIDTH - 1, 0)
> >> +#define CSID_TIMESTAMP_NS_MUL       10000   /* NSEC_PER_SEC / 19.2 MH=
z, reduced */
> >> +#define CSID_TIMESTAMP_NS_DIV       192
> >> +#define CSID_TIMESTAMP_MAX_AGE_NS   (2 * NSEC_PER_MSEC)
> >> +
> >>  #define MSM_CSID_NAME "msm_csid"
> >>
> >>  const char * const csid_testgen_modes[] =3D {
> >> @@ -1370,12 +1383,71 @@ atomic_t *csid_get_sof_seq(struct media_pad *p=
ad)
> >>      return &csid->sof_seq[pad->index - MSM_CSID_PAD_FIRST_SRC];
> >>  }
> >>
> >> +static u64 csid_timestamp_to_ns(u64 ticks)
> >> +{
> >> +    return mul_u64_u32_div(ticks, CSID_TIMESTAMP_NS_MUL, CSID_TIMESTA=
MP_NS_DIV);
> >> +}
> >> +
> >> +static u64 csid_timestamp_to_monotonic(struct csid_device *csid, u64 =
ticks)
> >> +{
> >> +    struct system_time_snapshot snap;
> >> +    u64 delta, delta_ns, now;
> >> +
> >> +    ktime_get_snapshot_id(CLOCK_MONOTONIC, &snap);
> >> +
> >> +    /*
> >> +     * Translating requires reading the counter the CSID latched from=
.
> >> +     * If timekeeping is driven by something else there is nothing to
> >> +     * correlate against, so let the caller fall back to IRQ time.
> >> +     */
> >> +    if (!snap.valid || snap.cs_id !=3D CSID_ARM_ARCH_COUNTER) {
> >> +            dev_warn_once(csid->camss->dev,
> >> +                          "CSID%u: Can't use hardware timestamp, inva=
lid clock source (%d)\n",
> >> +                          csid->id, snap.cs_id);
> >> +            return 0;
> >> +    }
> >> +
> >> +    /* How long ago, in counter ticks, the timestamp was latched */
> >> +    delta =3D (snap.cycles - ticks) & CSID_TIMESTAMP_MASK;
> >> +    delta_ns =3D csid_timestamp_to_ns(delta);
> >> +    now =3D ktime_to_ns(snap.systime);
> >> +
> >> +    /* Fall back rather than reporting a nonsensical timestamp */
> >> +    if (delta_ns > now) {
> >> +            dev_warn_once(csid->camss->dev,
> >> +                          "CSID%u: SOF timestamp predates CLOCK_MONOT=
ONIC, ignoring\n",
> >> +                          csid->id);
> >> +            return 0;
> >> +    }
> >> +
> >> +    if (delta_ns > CSID_TIMESTAMP_MAX_AGE_NS)
> >> +            dev_warn_ratelimited(csid->camss->dev,
> >> +                                 "CSID%u: Too slow! SOF timestamp is =
%llu us old\n",
> >> +                                 csid->id, delta_ns / NSEC_PER_USEC);
> >> +
> >> +    return now - delta_ns;
> >> +}
> >> +
> >> +static u64 csid_hw_sof_ts(struct csid_device *csid, unsigned int id)
> >> +{
> >> +    const struct csid_hw_ops *hw_ops =3D csid->res->hw_ops;
> >> +
> >> +    if (!hw_ops->sof_ts)
> >> +            return 0;
> >> +
> >> +    return csid_timestamp_to_monotonic(csid, hw_ops->sof_ts(csid, id)=
);
> >
> > I am not sure if we need to do this every SOF. Most probably the delta =
will
> > remain the same during the streaming, so I think it's best to use the d=
elta within
> > tolerance and then apply that for the whole streaming session. Also, I =
think it's better
> > to have a constant delta from the monotonic clock rather than a fluctua=
ting one.
>
> I think it will be the best to send both timestamps to userspace, and giv=
e the freedom
> to userspace to decide by him self. But the API is not allowing that as d=
iscussed.

No, the delta is not constant. In fact, that's precisely why we use
it, it captures the variable CPU and software latencies between the
hardware event and the timestamp acquisition. By combining the
captured hardware timestamp with the current system timing
information, we can reconstruct an accurate event timestamp that
remains aligned with the Sensor/CSI timing, rather than being affected
by software scheduling and processing delays. According to my testing,
the resulting timing error is below 1 =C2=B5s, from which we can derive an
accurate sensor framerate.

--
watching /dev/v4l-subdev2 (msm_csid0), id 0
id0    478 ev   60.06 fps   16.650 ms
  events           : 478
  timestamp (mono) : 180.160315690 .. 188.102256050
  duration         : 7.942 s
  frame rate       : 60.061 fps
  frame_sequence   : 539 .. 1016 (missing: 0)
  interval (ms)    : mean 16.650  median 16.650  min 16.650  max 16.650
                     p95 16.650  p99 16.650
---

Regards,
Loic

>
> >
> > ~Gjorgji
> >
> >> +}
> >> +
> >>  void csid_sof_event(struct csid_device *csid, unsigned int id)
> >>  {
> >> +    u64 ts =3D csid_hw_sof_ts(csid, id);
> >> +    struct timespec64 sof =3D ns_to_timespec64(ts);
> >>      struct v4l2_event event =3D {
> >>              .type =3D V4L2_EVENT_FRAME_SYNC,
> >>              .u.frame_sync.frame_sequence =3D
> >>                      atomic_inc_return(&csid->sof_seq[id]),
> >> +            .timestamp.tv_sec =3D sof.tv_sec,
> >> +            .timestamp.tv_nsec =3D sof.tv_nsec,
> >>      };
> >>
> >>      if (atomic_read(&csid->frame_sync_users))
> >> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/=
media/platform/qcom/camss/camss-csid.h
> >> index ccafdbf3a9fe0c282da68ccdd04661b3fab81ff5..17cc3b42c8d83180d6abfc=
c3efe22178dcc2f2e7 100644
> >> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> >> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> >> @@ -111,6 +111,15 @@ struct csid_hw_ops {
> >>       */
> >>      int (*reset)(struct csid_device *csid);
> >>
> >> +    /*
> >> +     * sof_ts - Read the counter value the hardware latched at SOF
> >> +     * @csid: CSID device
> >> +     * @id: CSID src-stream ID
> >> +     *
> >> +     * Return the raw counter value of the most recent SOF
> >> +     */
> >> +    u64 (*sof_ts)(struct csid_device *csid, unsigned int id);
> >> +
> >>      /*
> >>       * src_pad_code - Pick an output/src format based on the input/si=
nk format
> >>       * @csid: CSID device
> >>
> >
>
