Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795598349;
	b=mUpS+AxytvVO0cocHM6dznkf1vHysTOq60bmQAQVWPx0LObis059nTAl9OidmjiaCC8C
	 5ghQkZStw6MQG0nHyWs0YCW4UcekpGX+bdcEVUB3OIHUPSjW6uqTMNzpwZNxxwndNQYRc
	 1xwQgnPAT+FgBwPsG0NQAq1W1vohJ3BISCVg4zMtHFdkCCBJjsKORqY4vYoFf0FkpDbyn
	 QLPcKEkjjnKd1zn5LGgKh7Fse1nDutj2BK6mRe7j8MEO/ydEEbOFVvpo6+t+ZRkIu2dm0
	 zv4WCZrzWaTBlW6Vj6NxaLUiD3P36s5xJYDHUXiPpSYv7cWK5PMTfDYnuMwpjK/EvKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598349;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OtvrSzwIyco6jpsIwimAIqe06gN3VxO2fsWAhXUFqpA=;
	b=IF0iywXzdUz7nLZBhC+VXVqKdW7YpWOgdFjgsHfLc1U45oJ+Cdiqv8bp8qvippJlek8m
	 FbD5Jl1j7rIrxbo3mahCGORX9AurOfrSHW4kJP/HrDeKzcXA8Idynxdt6KrlADMvgE23A
	 gmJSneoI23NtjJqgwopsa8MfcZuY7m2J97uwl6nMdnCCbNXBDLKXJ0+tBJ69INaSXjEip
	 rOufggOEYndQQSLz8RferrAT7P53klfsXr/azLV+Tz4uC+ZfNX7TsErz6znSpwJ8YdhOW
	 jhbB3lp9bqdDic/duB1hQB39eBswbYTKtfzXxHNNI1Don4wPagzzUuTKx42XLnUvsfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IHuBQB1R;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="HNvN//OY";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3B1606A691
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:19:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A3B1606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IHuBQB1R;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HNvN//OY
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68SCj3534084
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:19:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OtvrSzwIyco6jpsIwimAIqe06gN3VxO2fsWAhXUFqpA=; b=IHuBQB1RdFZ6CQJu
	kq0J6lrvWNI/y0wLQ3p/3IOlbbqaQAIlP9Y0S8vifyRvlgV6slC8MzHagTLZ+Fm4
	7iK/RGXzqoZlcf/5NVZtDmmMvnVed4ZawZE0dHNAMw+Tb2CySw2gxdObEYGN1ce8
	jFPpe9EbHvo9eznKLEYofC4Bu6ArrbUXd/6o0fqIMic89IcJddBfB02u+x56j3vW
	YPeau7NdQa8nnXZYOeznqAKtiaKvtXMT/WFBccGbdUHLz6b3oKchHXiFhTQvMZd1
	e+KXL9Um3GQTA8OWr0988fhW4yWuwfc9b6HqCU0vHx3svWHSTq/hd/IVCEs8mnMd
	2u8uuA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbhymh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:19:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-947a607ec40so542631785a.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795598347; x=1796203147; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OtvrSzwIyco6jpsIwimAIqe06gN3VxO2fsWAhXUFqpA=;
        b=HNvN//OYoN45FODC8GeksfufmhGobcOad/5dHjDGvO+xqYVMLa7RxUs3BmJf9miSHr
         NRNLl8RfuiwZW1biQzgJ7RDRKB+PFk/1qUb4jPtZps7bKL+bQuqbawc40Ywr/1yVTuA9
         MQM/8bWwyZCa8W3ryMRfMf7OKeu3Mmf/tK5Z07KFRC1IShpRAfNOmm9NMPIjhpVwbNyk
         MlRo5c5HFlRKw8ghX78lwRsFdDX+Tx+MLRl479D63NFuc56WktO2KJTHOLeYjga01SoC
         5Cl2lWpHgw4+6E/cjHrWaB2s9vVRM5u1XWWya+NKhYkQB2PZHPYMpdwdI+iVuDX/xA6n
         SL7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795598347; x=1796203147;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OtvrSzwIyco6jpsIwimAIqe06gN3VxO2fsWAhXUFqpA=;
        b=ukLi8n4jyxb7h68Ia5MT6jeg/LAJ39hV5u0ZtuTM9k8XWxIfA9jEINjEVPkqbL3+c3
         3ApMD/SBTH1/FSylSemVYMS3d4ixj2EbvWiOi1IoPXFiy3XlPWTbBjrHc0Gh9qkdMUwW
         XlIb7yuSHYrNVMEgYy8BsQYfhGZJL+IrsOg/r3ELh/UIn9ewmUYA4l9F4g3DXsIgES+5
         qepmIbaa9+ET0B/XTYRz5Ni+41bKHyFXoJ9hQKHrv0VMLHL4TcEb47NMlszBp9WN/uO9
         5nxlvdLWnz+FUgPIiljlTfjOWwBb+frUNgrh3RXqHNnbkLWz9OD0RRq40PerBbejYbE1
         VPSA==
X-Forwarded-Encrypted: i=1; AL+hErErar3WVJWA80Brs4sLdRnU5EkF9LR3I0oBG8Nh+Bev31RiCBklQCIfWRl/tWuuz2a6mNfmdffVXtz3xSQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QFkDdHFXpSIobs0A/utXD2bv1NFQFm/VN2SuM50mrL5eHLF56
	JWimPpWpsDUwwtTxhzTGyjFK5UX0vlD+UqWetZ/dHvyqVpKbO3cm+gevF/pF/f6O7VWUAwz7KkP
	bniQobLk4wVE9d2Cr4zCMEd82AfvwPXor94AkeG2PSYb1OsI1qsrwtF1qKDrBmell/nQ=
X-Gm-Gg: AZFdTZeWeP1eIu7WoFfWBN/7+GM26ycioEG7VOlYu4fy8ZXXBytKw7ZHnBCzyOiECYN
	JvgXVyJ943gPf1tRkN6sbEePoN/7vd7FDAWUyMrHDNKgDDF9lOrpMh060PNnBdWxc7aO09kC+SS
	Ufu7tE8c/n5U62V0MrherionnPXhlgKjGk9kjBQhQP1GBojw+ABak1L4GIzVWx614LyvLV6ztZ0
	d0rWu4WEZzlxdq5KLvOcNKHn038nRhGE/R21jywdACu4qVZThJsDobUFDCXrqDB/c2nwQN1SurP
	yy/6Kn7xclK32vnjuNe67X7BZIvgMIde9N2CPQ6Ii9q2v5RxH+1mnYor4UYSzfDQnbgTjtGuUl7
	yHUSwRlRrJMaG6S0CVHobW85MNNh98hU+/g9uM6D//yKC6v8lbskZgOW3+9EGnr0o1OOmaaMoJd
	zYZNBoQmQMnWmGSw==
X-Received: by 2002:a05:620a:46a8:b0:93f:34c9:9252 with SMTP id af79cd13be357-949bab31d07mr3021657285a.55.1795598347258;
        Wed, 25 Nov 2026 01:19:07 -0800 (PST)
X-Received: by 2002:a05:620a:46a8:b0:93f:34c9:9252 with SMTP id af79cd13be357-949bab31d07mr3021653985a.55.1795598346734;
        Wed, 25 Nov 2026 01:19:06 -0800 (PST)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb905f1489sm308121615e9.0.2026.11.25.01.19.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 01:19:06 -0800 (PST)
Message-ID: <3ebaf10a-47bc-488c-a794-48a95029cb2c@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:19:04 +0200
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
Subject: Re: [PATCH 0/6] media: qcom: camss: Report the hardware SOF timestamp
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
 <0c0b3af6-4fea-422a-a7dc-76e36a3f5db4@oss.qualcomm.com>
 <CAFEp6-0XqOVFjQU0-P8oiDGG6amW5Akj7TVBf=P_S7Hz80EYaw@mail.gmail.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <CAFEp6-0XqOVFjQU0-P8oiDGG6amW5Akj7TVBf=P_S7Hz80EYaw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNiBTYWx0ZWRfX4QK+eZ+3hafN
 RHUG4/Ph094R+kmJpKI5LrSzrIbeGZ0MTGTKpZfR34NSEW/FYCWBafJ0VuZ0sZcMM4Zs6KsflXy
 UTuA495IAQMtw6AdRCex045x0LJU4JQ=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b06a80c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=7rKP2P-ej08A6i2KGrkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNiBTYWx0ZWRfXwSG+HUXaXLF0
 /Z4qpGniSxlycqAT8O98HC98wlx6kEDUtIx5K3f2P95t4TcgzA6oqnSkuv9zXCmOTwns05a4sIZ
 F2Vzj7aKmgGCSPyVMNHSjpzh3gNm7G/+m46pgwBi8az3PbGKWhEjKPcXL6+YCwgzoaw6VX66VwB
 uN4TrydI3jkY4OxsSt+0DIaOvNo87OwWXaY+VQjerSglvrd2aRdxXyRNruWfphrAVmL7DBDn4ad
 FGzCTzwVEvMSEFGbox9uym3mzFI6Qe46GJhwN94gXUaO1t5IXNNmtsh4Jca2ueqiHHERKqsOShx
 GlDfZ+hCuUCP3R+ImckZXtp5uTCGBxatNdJV8+kODduCIvHG7soJBSbvzidup3RM6vWxkHcW5KX
 bNZ0OOtUflZAWDfaG/nKC/cxvGcGjVQhY1sEAfJU0vW8pV66SZ1LUNyIOlvEjbBesmnda3yw4uA
 5JIiG0R2L0+vGtAScwg==
X-Proofpoint-ORIG-GUID: M0YSb2-hC6NvBA94rI1VwKnt875kkPGc
X-Proofpoint-GUID: M0YSb2-hC6NvBA94rI1VwKnt875kkPGc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250036

Hi Loic,

On 11/25/2026 11:12 AM, Loic Poulain wrote:
> On Wed, Nov 25, 2026 at 10:01 AM Gjorgji Rosikopulos (Consultant)
> <gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>>
>> Hi Loic,
>>
>> On 11/23/2026 7:16 PM, Loic Poulain wrote:
>>> The CAMSS CSID latches the ARM architected counter on every start of
>>> frame. This series exposes that time to userspace, both through the
>>> V4L2_EVENT_FRAME_SYNC event and as the buffer timestamp.
>>>
>>> Until now both were taken when the interrupt was handled, or worse, when
>>> the frame had finished being written out to memory, which is about a
>>> frame period late. The hardware value is free of interrupt latency and
>>> is directly comparable with CLOCK_MONOTONIC, so it can be correlated
>>> with other timestamped data such as IMU samples.
>>
>>
>> Directly comparable with CLOCK_MONOTONIC, does this means
>> that csid timestamp is in monotonic time domain?
>> In camss video the flag V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC so either we need
>> to provide timestamp in that domain or convert in the driver.
> 
> Both the CSI timestamp counter and the kernel timekeeping code are
> driven by the architectural timer, so they share the same timer
> source. So, if we know the difference between the current
> architectural timer tick value (snap.cycles) and the captured SOF
> timer tick value, we can derive the SOF timestamp by applying the same
> delta to the current CLOCK_MONOTONIC time value.

Thanks for the explanation, that was my understanding as well, but 
it seems that the delta shall be added in this patchset.

> 
>>
>> ~Gjorgji
>>
>>>
>>> Patch 1 lets a driver fill in the timestamp of a V4L2 event instead of
>>> having the core take it. Patch 2 passes the SOF time down to the common
>>> CSID event helper and adds the counter to CLOCK_MONOTONIC conversion.
>>> Patches 3 to 5 read the registers on csid-340 and csid-gen2. Patch 6
>>> uses the same time to stamp the captured buffers.
>>>
>>> Patches 4 and 5 are picked from the timestamp support Bryan shared
>>> earlier, with patch 5 adapted to use the conversion helper added in
>>> patch 2 rather than its own.
>>>
>>> Tested on QCM2290 (Arduino UNO Q) with an IMX219 sensor.
>>>
>>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>>> ---
>>> Bryan O'Donoghue (2):
>>>       media: camss: Define timestamp registers for csid-gen2
>>>       media: camss: csid-gen2: Report the hardware SOF timestamp
>>>
>>> Loic Poulain (4):
>>>       media: v4l2-event: Allow drivers to provide the event timestamp
>>>       media: qcom: camss: csid: Pass the SOF time to csid_sof_event()
>>>       media: qcom: camss: csid-340: Report the hardware SOF timestamp
>>>       media: qcom: camss: Timestamp buffers at start of frame
>>>
>>>  drivers/media/platform/qcom/camss/camss-csid-340.c | 37 ++++++++--
>>>  drivers/media/platform/qcom/camss/camss-csid-680.c |  2 +-
>>>  .../media/platform/qcom/camss/camss-csid-gen2.c    | 32 ++++++++-
>>>  .../media/platform/qcom/camss/camss-csid-gen3.c    |  2 +-
>>>  drivers/media/platform/qcom/camss/camss-csid.c     | 81 +++++++++++++++++++++-
>>>  drivers/media/platform/qcom/camss/camss-csid.h     | 25 ++++++-
>>>  drivers/media/platform/qcom/camss/camss-vfe-17x.c  |  7 +-
>>>  drivers/media/platform/qcom/camss/camss-vfe.c      |  8 ++-
>>>  drivers/media/platform/qcom/camss/camss-vfe.h      |  1 +
>>>  drivers/media/v4l2-core/v4l2-event.c               | 20 +++++-
>>>  include/media/v4l2-event.h                         |  9 ++-
>>>  11 files changed, 205 insertions(+), 19 deletions(-)
>>> ---
>>> base-commit: 2ad58ca589da80990b7afbcff018777851577f89
>>> change-id: 20261123-camss-hw-ts-e0297adb69d9
>>>
>>> Best regards,
>>

