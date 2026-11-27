Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787066;
	b=AicMBtr5e+z7pm5twno6mjCFSgPj0f4MO8CKVmB/oAMQprfSTkDbt6LfbN0lISS6xZro
	 RL028Tm3OnsLl7dO4AxHBaDktFAj729YwmeqlnauoKpfvlmSa+upgPvJq9pcJlXrwBwDq
	 UzaH7ca/7daatQWjNfRQf2/QxP9bpdtT6jvL8RUah1S2nkBCVzFsRnF27rwD7B5a7etI4
	 mB/q2+ZIiP0ZxQiKAYnfR0cJYuvnFKRk9MRnMmdPFxmMxWt1to0x5lbYbzvfGT2E0ospS
	 jdf2dj8M7/adUk7RI7Ov0K0ylgZCQ9hvP4s4sBHmlmbNB4t/qSPmoa+vCHspss/3EcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787066;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zYTrvOWjXbG+OFIqWLhv9qk8rvJ+yr4cMCVB2CA2gLA=;
	b=jguLcfHdY7Y2liARgfj1AjSFDFlpcGfYav5pyUUIO20KH9D539UlzJ0ikgGraLRsWr4y
	 vjtISsPGKvtiJvk6xTo0YhFjlpWPIjSUxTQXidqtT7FB+Q7BW3w1z2y9IVZc9HFCpIFZR
	 HCmrdWgX485R/4Kfjpvvx2gEOPS+JD9cJrf2yUNieh/EQZwDczUeV2kz0hMtrDD/4vGEX
	 dEbn6nSUf1Ixemm6TC0bV6I7foI7h7toAndZZCUgiRyUAruJlr4xjHuD12Skh2eZhrPs/
	 +i4TnuIn0I1paD7VuAjl0eeHqyT5gSg6pW4FngP8tbpD7hi+E+QpHI6yLHIbcbYq0jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GSJIpg2H;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FCuj2qrz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE752606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:44:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE752606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GSJIpg2H;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FCuj2qrz
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARChcxE1929568
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:44:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zYTrvOWjXbG+OFIqWLhv9qk8rvJ+yr4cMCVB2CA2gLA=; b=GSJIpg2HkmbXyR5d
	gXUVpvYlb/zZtVJ7dApCh/h20h5y6eGTepYFjdVYoCR9j5I6WqeUVNdo36v+AoWR
	NNz10/mbAlpD1xd0NmM8Mb8JfefU32GBlavkc5rf+CtgRFO7wwbtGrH4fzDKTYFW
	J0pZt0xjrAnuQc6zLAPyHbxCVy+y2KMtNSV+HjLi9hNwiPv6t02uRrnsXaezBAfV
	4lS+pUKtzC0q64KGVPBdh9XNwcPPUISxLxvJ9UBFalb7Neqtbyi6r62LHb8PqWDQ
	TPL1zuPd3zV/TXXHLEeZy1uuHfIsyBLlUN7Z/mJ5HkId1n6qrIbVjXEr3OsTCJ2Y
	C5BDBQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j756k9gda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:44:24 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b53bfc9534so3554634c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795787063; x=1796391863; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zYTrvOWjXbG+OFIqWLhv9qk8rvJ+yr4cMCVB2CA2gLA=;
        b=FCuj2qrzR0xLgI0qR78VUrw0zp3kIxLkrgBltQ0Q1B732mA9s70tjKcmgQ8zlGAp43
         t6+eJMPK6VRoa34grrWCfh6361gBiVJ+4f5VMSRTiy/RuSrjCrGL/NUnN588P7SvBzcM
         WCiuRs2V6GZoyMgRdTtmeGxrmqkXVlPikIGK0WB3Ta+yvAfL2z9Fh+cRHb4XkiSWC4rm
         +ieP4KdrarPCqnOgeEoV6irs0dtLS2tqvOF5PWYD8hCljfFRFXPgX0wquPtwP4YJWa0w
         SPlzDSw5nVJJlbFdI1FJM7Mx+OCYTSXYLzEs129pqPNMVIMvomGzhKaTwwrKF7ZCEMOd
         xvrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787063; x=1796391863;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zYTrvOWjXbG+OFIqWLhv9qk8rvJ+yr4cMCVB2CA2gLA=;
        b=wPPmN6U36kH4YmZZYI2sV30LQXP5GMVp99zXj9EbpcT14nt5pY3kqdrJj434oOBz+G
         fmRXkmvUE5cZiLagub6FmNdBx2DkJ01HCpNGt+1dkzgWYJ4rIUlHBWPbeIudgb+HE4di
         XfGBPUPnYHD/mzMdr5nP/a33Mw9o2vo591SARsT9A7gjSEZv3aNRLML+FzCbCEnuAjMB
         kLOa3QouSCq9s5ZA9de265r/g3p69UX3uiG1bpTBY5iKbx66hiuaWUt/JEnFttoPArTF
         YfF99lnWKFh19rRN7Pmoqcni3wSYJjNOvko/xySpax/q2QC1tVsr8j0xaHDV+IqgEYu+
         BUww==
X-Forwarded-Encrypted: i=1; AL+hErGfxplTefz0yxsKtIEHbx31XIqk3T2UQxCs/sAhB+OonDuRCpPDbvvhV4JJz0w7w10rWFC20LicpgcA3/4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oUFo/gN8fqHewrPcy7iti1liH4C884G9mnNDZgl9BRVzNSPTI
	GIjxmm/FdyN/cs9bp4UVfuMI42x4osMGG+1vuq74cwBphT2ac1aLYjkOV/pGSvnwVQVUkBRNSc2
	UFLdwRlHIX+aYUO9SOGO1P0ZQ1NxERCUCmrjGnGfPGzqecY3YlY7wX3QAo4yBr3UQNjI=
X-Gm-Gg: AZFdTZc6B/uZP/ivbkxv3v9CHfXP3qNVv9cnHeJZ4nK3C76pmbaTarjgM8lB3fr7a8c
	lpcpXtFCZN+aLH09oDINFVANHGva/+Ef1VXs/+dPxfBdX/aIiXpUfQs8zOJFsKhmkHQkB2pSW5I
	L5GY0no26/xqVWtjam+DJCOwaDaku8debmMineyUgnLVR6tlhUYUR+9sZMHZIYOFxV9MfgrLd4h
	onyZIm8H6uxDKD+K+T9tysaP9CM/HP6/rUs4cOVcYA2tNpmzKN1Y41vjiTNHkpELcTcF6pVHybc
	Cu1qJoKc6SABubBi1R07Qepaswj0BD1YXAHrYRBq4wxDoCwZyDDPDtAt1iHI4uWiRBr5qzSy6lq
	o/69IgI1u+Fpw1VzQM6irHLAsTCGNZg92KY5QAEDM5XT0sDuVMIIzJWi+ypDOeor1oou0n5zduX
	AprJAi
X-Received: by 2002:a05:7022:7f01:b0:15e:9126:c60f with SMTP id a92af1059eb24-1b5568bb55cmr21345087c88.29.1795787063378;
        Fri, 27 Nov 2026 05:44:23 -0800 (PST)
X-Received: by 2002:a05:7022:7f01:b0:15e:9126:c60f with SMTP id a92af1059eb24-1b5568bb55cmr21345050c88.29.1795787062620;
        Fri, 27 Nov 2026 05:44:22 -0800 (PST)
Received: from [10.206.111.23] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm57734614c88.12.2026.11.27.05.44.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 05:44:22 -0800 (PST)
Message-ID: <904e456f-6e36-4ffe-8383-0c509c52c59b@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 19:14:14 +0530
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
Subject: Re: [PATCH v2 4/5] media: iris: Preserve timestamps on error buffers
To: Xilin Wu <sophon@radxa.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, dragon@radxa.com,
        Chris Obbard <chris.obbard@oss.qualcomm.com>,
        Deepak Sikri <sikrid@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Loic Minier <loic.minier@oss.qualcomm.com>,
        Jason Pettit <jason.pettit@oss.qualcomm.com>,
        sakimidare <ssmzhn@163.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20261127-iris-va-fixes-v2-0-385e8636c22d@radxa.com>
 <20261127-iris-va-fixes-v2-4-385e8636c22d@radxa.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261127-iris-va-fixes-v2-4-385e8636c22d@radxa.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NCBTYWx0ZWRfX/1+Vl/3Dgjtp
 L/0wEwSBvaRVYWw7JpmK8d3t7WPuJMVmburd5TSSkcdTVoKQro4J8q6Eqi8JWwHzM2TcTFCkhY6
 YgFzcWod8e4N08Gk+tgWsBeLyGsm3XevEmmgIU15LK9RZncqOSEiN/2LNXhFTUIZUeB9V50lfFM
 JhS/ornzzPCm6x+a/mBgHkIf5CTmiQ3K2c+stmD9vTMBp500uBj44pKcJELjCZDPNyrBPBLk3ty
 f1vMFBUSr2oq3SBtE7u5mukqeWPAHURwEKSXqv4SSV/dIm8fLgtGizqynHrxc2CSfB1JWbPCnRf
 7IfBbWmNaIMvHHABqsIytQWa53IYDkg2sqpt2wWn4pDchaPrnl501kL9BmLUIXL9wIMdFR1cfhY
 QcV7caWVS6OtGJtjEHKUokcs4qy7nV3KbGpx73Ji8VemrzAv1sntOFyuMhBcE+mlPoxWKj7WH0v
 ahQ9sDOoikwz0V11Y3Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NCBTYWx0ZWRfX5IAvqi011Ra+
 bordTs5LmjS/hR4RcqK41eLGQ6frSG5SZmP0oHRm14WexpqzJ7Y27LKR8Qc4Lt9h5xr0ZuXrpPj
 +ie7VjEH7ftwSY0Nbp2TVRJrs2xjboc=
X-Authority-Analysis: v=2.4 cv=ebWo7LEH c=1 sm=1 tr=0 ts=6b098938 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Byx-y9mGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ksxQWNrZAAAA:8
 a=WqctcwEyiccVfxc9fK0A:9 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
 a=cvBusfyB2V15izCimMoJ:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: kcAJXoU_pnCIemPDV7xdrf2aILFg6q8Y
X-Proofpoint-ORIG-GUID: kcAJXoU_pnCIemPDV7xdrf2aILFg6q8Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270054


On 11/27/2026 5:10 PM, Xilin Wu wrote:
> Clearing timestamps on error buffers prevents clients such as libva-v4l2
> from identifying the failed picture and can cause synchronization timeouts.
> 
> Preserve the firmware-provided timestamp when returning an error buffer.
> 
> Fixes: b791dcfcba3a ("media: iris: Add handling for corrupt and drop frames")
> Tested-by: sakimidare<ssmzhn@163.com>
> Reviewed-by: Bryan O'Donoghue<bryan.odonoghue@linaro.org>
> Reviewed-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Xilin Wu<sophon@radxa.com>
> ---
>   drivers/media/platform/qcom/iris/iris_buffer.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
