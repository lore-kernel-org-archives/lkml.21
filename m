Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778247;
	b=D+6xOeAIZiw64HtOQ0FptDWJekyd4oN1ah6FeoCNV+VQDePHrAPLOySVgUm2a0vvmTVB
	 nbTn7/1SVBNY1z+XQL+ASG5B/B2Zgzm2lqgIDJK0VdEwaB0ChrfOIV/bE5ikLjZSumfbZ
	 l89I5564LRQZlFZML9HG/rFw22JDhRSNGiw2DZ+p8M1fXbGSWwfdhQb4hquQ5oe2xslM1
	 WarfzLBLB2ndcRnHsCIX9sINsh4uaskj+Q/KUqpaO6GevdJ7yjvncCORcFIknIvtJYjeg
	 +yn4y5/SNBxtOEFZSfb7baXUm573Y+Qncb+giSZp2lDc/9zUkUzskOZTjjDtFi0sEXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778247;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=J7aET/IE+2hW6emFP8wLbbJY1PHnS1Od0budwcNlMXg=;
	b=JKFWa2eYVLzPbt9gaNkWDccs8IN0MxfxOb6xXVOD4g6tHs9+9kZzKn6CKGnuM77lWKQj
	 3XzUHpn6RVccKs93BJRKmM7U1bnanv3PQKlwfD8rR1fMBO3/YZcEe4HjoNWEDDaN0LQDo
	 ozhwX/dilORaP2axdL+sYk7/tdZLOCmOfMAR5P6icM+hrBKIC7gNatbegGIL/nNmZWSJ1
	 S7Z3nXigdbpRuwPiKE2txJ2AczG1dn6WkrDI86bLD4tf/3/+80M4nNG2kIrwtcFQjNp0t
	 S3OmFyoHVuYiullN2/wkuCaJ3XCCmBkOfQNwHUPyRQVLoobUfmUn8zTQUibvNAMf9jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q8WXuqQi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XOi7nnMV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089F9606A33C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:17:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 089F9606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q8WXuqQi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XOi7nnMV
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApXeU052772
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J7aET/IE+2hW6emFP8wLbbJY1PHnS1Od0budwcNlMXg=; b=Q8WXuqQinCBwbiJn
	4oRswH2mSYR0tnsYMicZFgbpNJmyCzC9UonrGq9n92rlESDShcFvdSUoqKKig4y+
	PUct07VsBNXwNZiaYgydtLr+/NU6P/6lcg9Tjy5iju+w17rGhL4ktPrYYaWekp+9
	YJ108jywd0GpQR1yzdTDR5m/AGkpGB+9xi9WAxKqSvIGzgLl7xWu2STWlKBfA/ZC
	AQp7eNGB+YO2rWe1jH0z0D7LX0aDDr/7ebh95cuPpRH5N1cFSC5V+WnxKjluEBXC
	39T6dz441YC+IC33RHH64FyE+7GbmaVYIz8/tqsOuRU6uY5gLszrjNxYmPq5z74a
	BruI8Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74g6s59g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:17:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f0a5868265so48988235ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795778245; x=1796383045; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J7aET/IE+2hW6emFP8wLbbJY1PHnS1Od0budwcNlMXg=;
        b=XOi7nnMVutF0Y7QfWmOL2L0+xNK/UkjG1RjYSJ7k9h2pNW7xK2MyO32/YZ7emLhOlx
         jOFEhMHEI5+F1Z7WuUAgNpD0snCe3tqNh7JljCSfIYgkfb1MRDtvdIRcHTZ64JRjhYTX
         iPtKQJfXA9LNILofmRsu5jEw+eWLYjZVMY9/Oq8Kq3DtKsDeT8Y5BPYwRZWoHJBmdTuF
         kEWDCQp5DwhJFQWYSWE9s9q0pcfrkTpIu7hoewtXaIcLRBU0cyEgemYwMTymIwpRtZM+
         QWLuCtibYRuJa/gPI+Ah8B5PGuAtG2NKUPKRs9cEXKtVsOA6lJwUaB7orF/BdC7CUwij
         BU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795778245; x=1796383045;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J7aET/IE+2hW6emFP8wLbbJY1PHnS1Od0budwcNlMXg=;
        b=ayhtYenBgnRNllnXKDc39nWeGykimCZkFXrzO4ruV7bjaMT2CzeRXhwCllc8Rs+/af
         qqpkKnf51BkH/CFbnIFPHtHvQntPcvDL2L/TGn6uPRFGbbppv4h2ymL9d0f7TEcc0Xcb
         uM+cUqDQc+EYMKKAB9RpM7nHxjAi6xuT8CoZISAM09k4HG7sk/U8VC8cPG/ClVf8qXwi
         pKGmqRuTIvGxPcrcSc8cDAjot8lb6HFq8HnBBZOlfGz9lQ9WphEf+quG+tmgWPyiFNO/
         +lzA3QGsoQENyrkr1w1PHjmfvXQtp8fv+oDX1lt3t1w7EvLRCXyt7NoirDrSoIc/Ux1D
         y3Fg==
X-Forwarded-Encrypted: i=1; AL+hErHSVwIw/I6vrsshirDGMrCnN++K2uv6D6cxr27JlqnarT3Q6cyk3HS2Fge2iM5Yco2pY1k7TlXVDN+W2IY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wLrm+bDUppM3RARhJnRsM5IlUb2JDkH3kk6AslCLghjbgNTgi
	dpg8kxNbQlmLfaz+WA9RtHsLt3RtN1uE/vgruLcmoeEPlvKeFek1jGtioLHVLa8aQpGQgATvRT3
	lA4tuyV8lKg0vj9iNAOFgnKxpo/VdgoaFg4Ex4oqvAOcnMwTUieLUuYbd3i4KOSIvnY0=
X-Gm-Gg: AZFdTZfn69su6M8wHOpJwPyWRHysRAdjYPR8PkwJ95GE6aKd5Dvs0gSXiKdVSnxr7Ib
	tvYCCm1RNEwDaXPrdG5AoPjGY3YbziLM+kUTRJlC1qZWCC9ZYDIp8mFU6LGrTLId73kmsyHrSKS
	i7q0cuXuh6LsnEm9tyOlxNFHCaUqlsf1u6zh7nMtPDF7UYWYwqnPWNYK8foYwaIyPqo0saJujiS
	4AAtGE6oej+R3R4/if/KeLd6+WRyIRBRU2WLeMJiqXqHNiMJ2/Bdi9/Ew7+ijvaxHN6ZS7wYEIz
	QcCJhG78ZN92k+yQHFxzwem0vO5wD3S6zZ/FCP3leyOwXq+3+hm2fuNhcF/a+RdPWjf3lhV7TxX
	IuYgZhIHa5laD9uBwb5Xz1yLO0uy4RFp6vwMu6oTgfgyKxKZ4jJpQbUQBwezQznZnWnY0687YPm
	OP
X-Received: by 2002:a17:902:e542:b0:2ed:12af:13ab with SMTP id d9443c01a7336-2f03f2570admr213221955ad.60.1795778244509;
        Fri, 27 Nov 2026 03:17:24 -0800 (PST)
X-Received: by 2002:a17:902:e542:b0:2ed:12af:13ab with SMTP id d9443c01a7336-2f03f2570admr213221575ad.60.1795778243931;
        Fri, 27 Nov 2026 03:17:23 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0ea6a8sm116521515ad.36.2026.11.27.03.17.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 03:17:23 -0800 (PST)
Message-ID: <34619214-35bc-4ac3-8eb4-92b9d3e1bc1e@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 16:47:18 +0530
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
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] media: qcom: camss: csid: Stop using csid->id as
 both index and identifier
To: bryan.odonoghue@linaro.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>
References: <20261127-camss-routing-fixes-v2-0-b7152f0af49a@kernel.org>
 <20261127-camss-routing-fixes-v2-2-b7152f0af49a@kernel.org>
Content-Language: en-US
In-Reply-To: <20261127-camss-routing-fixes-v2-2-b7152f0af49a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5IdOoaS_Je2pXRssodOaJlCP2gsOWTD0
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b0966c5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=cXrFbpxloNIy6EuSPpUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NCBTYWx0ZWRfX3aZAIw/PG7ol
 Z66tvXLvVuvYFy7isVeKHs10WbkWlNGHLMMETSa0/owkSztEgpiiBioOx7MvZyVfSAINEqjThkj
 6R3J55g8buHbGjZGT4zzCb3s2VZnquc=
X-Proofpoint-GUID: 5IdOoaS_Je2pXRssodOaJlCP2gsOWTD0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NCBTYWx0ZWRfX/nU802EjO7am
 1tdH1H+ZP5Iu5AOyxum9QhmcO0WloAMGU58XF+H82tbBBTB0gETcUukEqMd4U6fF5/F9HhkAj36
 85zQCMms8EvxfmAru60ClqEO6gIzNdeUt2qlqyjMkvfUQE2lCHQs8eXmAn4updGFCjEaaxKF7AZ
 G2lH4ppfbq1D0XB6iY3qWi9+3atU7MLug6sSVWXU4TxV6N32eoP2RmIRdgV2o78Lk5DdJq0TKDW
 Zzmcf1CmieIpimerFDIigJc4fuT1ugHNhkdOCxC3jDcilo1ffJ7rOjaZH296NeD6oVy2JXdhdIb
 mO/Z4kH9VwNsdRjDnCy0vgmsCgSq6ohr78cvYuQwjB/iZ133fCStJtpjGF22O9KI9sNyze98/Ts
 AzOntGftc4qWrev2A37ldRSVtqr4fZt1MzwQ5gluve49VAUt1Eihnj9fCX/KDxeU0lYUsM8Dw03
 ssAMmD12jnjPGzed/ug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270044


On 27-11-2026 09:45, bryan.odonoghue@linaro.org wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> We have thus far used csid->id as both a hardware identifier and as an
> index to the array of CSI devices.
> 
> This is obviously not correct, but has thus far not been obviously
> damaging. Removing a piece of dark silicon CSID2 on x1e80100 we see that
> the reliance of csid->id as both hardware id and index is a brittle
> happenstance.
> 
> A previous patch enumerated a .id field in the CSID resources structure.
> The purpose of the id field is to denote hardware identifier.
> 
> Instead of maintaining both an hw_id and index field in the CSI
> data-structure pass the struct resource field to csid->id.
> 
> Use helper functions from a previous commit to differentiate between CSID
> hardware-id and CSID index where appropriate.
> 
> A level of granularity doing csid_index() and csid_hwid() in separate
> patches wouldn't work as we need to change the subdev_init() index and the
> meaning of that index atomically.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> # Monaco EVK

> ---
>  .../media/platform/qcom/camss/camss-csid-1080.c    |  2 +-
>  drivers/media/platform/qcom/camss/camss-csid-340.c |  6 ++--
>  drivers/media/platform/qcom/camss/camss-csid-680.c |  4 +--
>  .../media/platform/qcom/camss/camss-csid-gen3.c    |  4 +--
>  drivers/media/platform/qcom/camss/camss-csid.c     | 34 +++++++++++++++-------
>  drivers/media/platform/qcom/camss/camss-csid.h     | 17 +++++++++++
>  drivers/media/platform/qcom/camss/camss-csiphy.c   |  2 +-
>  drivers/media/platform/qcom/camss/camss.c          |  3 +-
>  8 files changed, 51 insertions(+), 21 deletions(-)
> 
...

-- 
Regards,
Nihal Kumar Gupta

