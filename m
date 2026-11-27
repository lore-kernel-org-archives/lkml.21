Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795788002;
	b=trkzycziL92oixl/vCqT8wD0Qxb1KIbMDmQ2bpNs8iR5ErKJ/l/zTIRXrQEyTA7OkMCh
	 i39i6NLDU3/3XMp28HyghHbVwzMn9X9mx2eNniM/QN25dahNctyQGPPJ/wNNuCQLnla2k
	 rDmsAl3GchPeRdYoWh0mDbABrhYllzyF8jNjnOePOT1uQmIHILkM4lAp2tkVfSZPtKcgr
	 HTsFAGKIz87KvIyenrpxMsf5Y4QlJaEqAQyx/48+j2y5gwCkf8Ryi2Btn0oni0ZLwFZfH
	 wlKGO+Oi89NACEI2nhCNAl90r4EXcxSpHtEtvxYvj+cclQscVPY/3b0BVRG8dOxaNJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795788002;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TVJ7FGwJvzojmK8u57f7Bta3j/u3dqWpXMiIY6IlGEU=;
	b=e5imL2DTiWhmJej37R3LpDif0DXuYP7z44+G9LYlUGTvWGU3z/wC52kRqCCiTEwNFXNU
	 9ePQeQci1ZGH5wSzxxnBeyh2nNH905ujRND1KDMffst716BwShc98VTqRUo56o4yNf/mO
	 fGqxxw6QGu+95SzE/C9XUBzVLOIGviPl2V7yt/h6PPqwnhF5V+DHU5Z1Z0dJEbl5NmYeP
	 3BfMw+Az6fG5f5JVM9b23H/zXzD9hrd1h99mB8x+EGVd+8l35rw5SDQ+10l/TWFOdPTHV
	 H+K9TQfwk00xRGAPptJcLKK/9YCMCo/zqkZYuHxnqZADM58ndJmL9CbRIFWwzVYyq/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m17uSs+h;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ed7OU8m7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261DA606A329
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 261DA606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m17uSs+h;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ed7OU8m7
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARDu4Jd2086446
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:00:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TVJ7FGwJvzojmK8u57f7Bta3j/u3dqWpXMiIY6IlGEU=; b=m17uSs+hA0uwBeDk
	n3jh1uZfvCrEpejAAyvlQ63wlxqQ5XKm8xdCHnd3XFmt45enERsJ99BwC/IlJMw2
	pylSEyf1DibOMz5GKQQC+Dkim/U06eg8hyFKM0gswpsYhSQX8yGmXlXrEOjclq2F
	YJ+InFFuUXy00Dv2ky05IsODF1m9ANOuFp/GJ0Y+nbuCzcvB73BWHrmxTj6V2wm2
	eWcxnecgKD/gP2bHYg5VRVBq4zeKgY7uuGGIXLSBuvdPSxWoFDtZzHkjymxnYnHr
	N8hkQxtCGGO76ws/8H30acpnjbHfLNzaFMMK6LT5eim115BRu/gCIkXwDvWBXKXs
	zYTDZg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j756k9hvw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:59:59 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386ad819860so7634684eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795787999; x=1796392799; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TVJ7FGwJvzojmK8u57f7Bta3j/u3dqWpXMiIY6IlGEU=;
        b=Ed7OU8m7Ok1Ap60daYNVpX+Pvgb8EiMGxgN9mEvEBT6vdEsrNIDCNZlqKp3XIA90O9
         n0qAh1HDWwXp0RKIxA5h5VimOg1VKmqJh0uu29uOWvpER/NJaeRcTdQX/oit/ouQ7U+D
         tdBTYRVc61Ut1puD5INnbhWfOs/oL/uLbndPOCrogbNKmLfMz4LtAxm1HJ/l8TcGsKng
         /HvSfc4Wz0B5aBOG+fMko+qH/xZ42+C5Rr2ki/qlmE7Vv3uOVhmpIFuZlpe2SRNRX8PZ
         xd5g8vjenagAQuqYL0hhI8cG6dWOCzsWQH00k4VNnYdcERtMGs4sKMnlo+K+XD2nBvz5
         Rm2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787999; x=1796392799;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TVJ7FGwJvzojmK8u57f7Bta3j/u3dqWpXMiIY6IlGEU=;
        b=wpYzJ5Ees2ERPHzbdnpzZ9DdbMdTCDH1O5XWx9ytXto4xgYFNf2JZI5WpLL7tyvLrG
         APNm2+jVEUfO0FHC2KlULReQRBuFra7HUabrZXruChwkaimEYxqAX6egiw5D/dZ/zjOV
         IMGuxGMQ5fMQOvsToPW0x7G8etAVv3S6+k3SRzQF/Q3LmGUAg4GJ42ziife989MMqn8G
         Je0o4r37wMFkzOpieaWOpFAWgkLjxdGB1zDaHG6LVOUfPtZVusprgPe49e9It46W0vSQ
         05Q1a/xJ4QrKian9IG51iZ2iNMWM1eheHzdpBj8L1ZF0knXuVKzLbeVHpo/Iklm/CSih
         95Qw==
X-Forwarded-Encrypted: i=1; AL+hErGW/4wEYOFxwQctm4eepo+y4vw4UKtFntWHQ0rJTY3C6nWMm3l/qH1YNS/0XUbEWZeq5HhjMkcctlfNitI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uOwKh3hyOskHOwcUdWRuIqRTqVDQtYCBPintyunLqDx4EWNoc
	RqAe2KSOdtlzonHJTRlD6ulGVEcNrx88Mk7hEN/kNLgrOELaN0yrCCg3N6Zmm0SvFJSghjDZBu5
	Bx7dJy6By1LJEsLCYt9CGI51mouLrjuPOL+IW1tnNSDpVewO3+RUyIBxQY5JZirOk9cU=
X-Gm-Gg: AZFdTZcdvUU4bWQQ1+uuanA/r2fLcwm+iSf46tZyCK/cxEQWRuwsN7jFSnFUwXZbvlZ
	yCQBKMxNa7GFBHvHL4IL9Y5SqmjSrTMwk0xqCPDkUulP7ubL8fiGr8TEre4EiCq09aO4dokOILY
	hmD83FU7+jX1xMBciQI10mpJR57qDaOQyCiSszPMMsWAfopKzgCXBBHppg2cpGYFXcRC+cVCg0/
	1vs4feTsyucOMRai8jYXi69qZnXtrxJVj6DGPKWeFY+o6HIpszivQi3NVGvAw4Xe16eTvz5ep23
	vKKxHgZn8ylzjHla8cHH4RCpDRSOs57xvO+W+acdzHD2ebuDMz81cDSBDLD9eaaGhKTIhQr6fZX
	8VbM8dTFlbX5afKFCtJ2+ADWnNXE3YBTferHrP6yf9QZ0Ljv5eS0P1U35Dh+t4eQEzB+BBvOiwn
	0ux0/8
X-Received: by 2002:a05:7301:fe91:b0:386:e392:5031 with SMTP id 5a478bee46e88-386e3925531mr4757491eec.14.1795787999010;
        Fri, 27 Nov 2026 05:59:59 -0800 (PST)
X-Received: by 2002:a05:7301:fe91:b0:386:e392:5031 with SMTP id 5a478bee46e88-386e3925531mr4757444eec.14.1795787998322;
        Fri, 27 Nov 2026 05:59:58 -0800 (PST)
Received: from [10.206.111.23] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm64939202eec.8.2026.11.27.05.59.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 05:59:58 -0800 (PST)
Message-ID: <72ae56fc-41ea-4088-8daf-3d9535de97f9@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 19:29:49 +0530
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
Subject: Re: [PATCH v3 3/3] media: qcom: iris: Skip register access in IRQ
 handler after power-off
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20261120-fix-disable-irq-safely-v3-0-82f9561394cb@oss.qualcomm.com>
 <20261120-fix-disable-irq-safely-v3-3-82f9561394cb@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261120-fix-disable-irq-safely-v3-3-82f9561394cb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NSBTYWx0ZWRfX3Arv74aR4Ey6
 A4kk98FEA3BXQ4v4FNxwYObQmyXCL/aTBWB5ZjcFnzzByP5S0hPsK0TOg90EGikMs9M1BcmGej0
 o/JR/vhLSNi6DHTRUZMS9Yk53GrFEgTQUD3RXGL4A5yTRFC1K+M5oQ/uNv/AYkJ0iQaq6ZCIpd9
 iVWKt2RQTiXh6oPXMen7/GZZ1JiRNFqEwOUeOjjaPLm1rYLgwQdY1ugpk9iCw9xfipEuTVNQrUe
 /na4kf0pUANt/axXbVV0+/xMrRHlVQbBVgcamDmT/iF38gxRqQtxWlaKsBJUjcqHBaI2cSwbLbV
 wegfkXXE6Yb2+NO0gj/h+v3wR3EGi0wR9TeQlWf+gWHw61g6vGru3jy9C6vlO0os9bczO49PzOx
 CT90/eI9nw4bFR/3PGM1IshDmvkGZFyM7GIeVZvb7+T2zk4txi6PBMMfJYdnG5tdsVRY4fgzLjb
 Qcy6yXWCFlx0VWHsF+A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NSBTYWx0ZWRfX6vXGWWlYM9b4
 ziXYJIUyYKOVt3v0smFwq6LBpf4EVlF6InWjFBekPYJ+IlRERWN63WMC8RVq68zHsMgN81PASIq
 Ke5pgRzQJT/Xv5VIG5C5BRk1a7a9wFY=
X-Authority-Analysis: v=2.4 cv=ebWo7LEH c=1 sm=1 tr=0 ts=6b098ce0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EUGQh4eoQUa4RnJZeMsA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: GjCJhki6zsyxxxwdkh8GN4RMv2RqbrqA
X-Proofpoint-ORIG-GUID: GjCJhki6zsyxxxwdkh8GN4RMv2RqbrqA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270055


On 11/20/2026 1:12 PM, Vishnu Reddy wrote:
> The threaded IRQ handler reads and clears the interrupt registers
> under core->lock. Power-off disables the IRQ without waiting for a
> queued handler. If the handler is woken and queued around the same
> time power-off is entered, it runs after the VPU is powered down and
> accesses the registers of powered-off hardware.
> 
> disable_irq() cannot be used to wait for the handler. The caller of
> power-off holds core->lock and blocks in disable_irq() waiting for the
> handler, while the handler blocks waiting for core->lock.
> 
> Track the power state in core->powered, which power-on and power-off
> change under core->lock. The handler checks it after taking the lock
> and returns without touching the hardware when the VPU is off.
> 
> Fixes: bb8a95aa038e ("media: iris: implement power management")
> Cc:stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_core.h       | 2 ++
>   drivers/media/platform/qcom/iris/iris_hfi_common.c | 6 ++++++
>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 ++
>   3 files changed, 10 insertions(+)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
