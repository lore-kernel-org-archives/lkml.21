Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601938;
	b=RFwc125upoFhKNUrfVWOoT8oxgW0gnVs3RLYthLW+K0NXT8Wr1NHzGjBIWAi3NcJruKW
	 cCqpJN4IZ1xESnUH3KNdfTPjCpzCldulNzuDzJ/w745R4l52cdu68wUDQgM1iuJMa8kLN
	 3vjTJy2wK0sjw1aAWNDzJRy/gZdqRxb7ycF6Qm5WZtg5wmrhLFG+Lw6k79CDTgAeUpG5s
	 oCAxadQHtxofBxsJt0oHVQVwuFvyWour6mOv9DnEZg/eOyGHwqDwGpnDk01OrJxZjwgAI
	 evW6lHKwkHpVnBwTgGaQH56Jja57eLdvglWUhOA3fPJKlltSkcFuAEsm9vTbLFMkwTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601938;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qgfBpFM+z2YBeezRZEwdMFkwU1ZfAT0p5BExL/+QJaE=;
	b=xCK8RLnJXaHl2SJon8He6o/d3YWQnxg/RX0QnnGb4NSYWOqI73H3DE+lvShJRh+EarjR
	 8Y0omoU/NQrtGvBS/6u+5rnKwRGO5qa6Qjiq7CcdCxZCXZp814R3qMl7oteC5zMQw9apW
	 D6Pn4nd9bcNeF5+JRfUMlF/pb5nPVWgiBtxgVZzCm5noAUXjZn04fq5WGQ06rB3H1YkZm
	 tdM/RTHqdQza+otOTzhgAgE0TMjFHRnnCJtcJpwqOSBHqJLrkYFWSu75fUedIpxS3jEFl
	 rcrth/T/ztT5J8v7j0Xvs1s4FnBdcAH7BhjzVtIzWCt4enxEkPUMPl1nhD0vDCU1TvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UlzkiCmy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YWsGyCBf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD73606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:18:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFD73606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UlzkiCmy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YWsGyCBf
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mejR796843
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:18:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qgfBpFM+z2YBeezRZEwdMFkwU1ZfAT0p5BExL/+QJaE=; b=UlzkiCmyHTJB/y37
	5duvhkt2WYUVV2iEzzGE59afXH0OzbrZNvqIJo5FDb+GbFGiDqMJ1JmiTNA2kIaI
	QKcSqSrEd03iugMw2D7CrdsIMFq6/bk306S6KExjZ/VpVZ9gBzqo7fYtPLnOCEd9
	/ZowfVrwVU2EjJi62/g5Az+vb9MwKAmSvG3gzHPAK9SmbUtIVd98/CzGz5bikF8Q
	XfKzG13XWsBRZyA0DFfhh9IAnp9K/abcVmNO37NycEmZ5nvuWwasb6E3BpWUCS0C
	Iz3BC7my1zQ72peifXykvUoZdkiy1ShCVt0FmXPRCeIP6JwhKvqD4TPQXQ/yTM+p
	K2OYRA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5n6rt5er-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:18:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-550b1b21674so12523041cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795601936; x=1796206736; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qgfBpFM+z2YBeezRZEwdMFkwU1ZfAT0p5BExL/+QJaE=;
        b=YWsGyCBfUQFi2YvI4tdS8b+hf7hYCTuc55Lpb6Xrx/AS9s2Eo/Np0nACBoJfYU3JGV
         RcsjtTOWIYAuv8d8JSzOrECzguumws8mkynAMlj3NGlGL4ioo3pullhRiFwUGL7yUg1C
         /tdU//QB31lrrndiXElc2pwjYpgjH5YaJSmpZZ7avAL85otAklPwKfNHwHM1KxAFO+TA
         F2MJ2QVVdM8G46EF41FwmErK3UUNiAR/OA4Ts2DMjERqyuapPPA9abkTPddeQVt9120T
         ImeXArbAHwLXDpKlSmcLhyx6yaJ9XQIUnT/NVT+K2J3gVUVcrX03NHOQNX602Iyn/CtU
         5JtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601936; x=1796206736;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qgfBpFM+z2YBeezRZEwdMFkwU1ZfAT0p5BExL/+QJaE=;
        b=lsN5WG6v1cF1y0ekrAOThfZTIVQ4fjw0ORpPMXYz+RSwolXzRcznI/gDAI025KIqpr
         mZH131TJneJZK+rzpEMYWXSlLlWsZae3DMfdRRKbpxuW+8RC7lUssGztkEpkElKO8sV6
         ryaT4fyQoSDNSCxnIqnv0duehY9oPb4SeyC+GQoRJMOjwLO5BH7Au6CAF3vtjRck8v4s
         m6fPobMaYvfsrdxAOl4pVAy5yUQUXDUY1v5V/aQBU3bsLujq5IWHu61lSF+cdnOo8iy1
         xkcCZpJ8zqI1UO8IdkfJ/A6TYQ4eJhsXEAd6/tVWzea6gswauGU0Wf0j007br/TELjJz
         i6Og==
X-Forwarded-Encrypted: i=1; AL+hErGxqJ2bEx0pujE3pCwxhOD+H31DN6y52mDz5mURmgRhFBkcMjKbMYfkhNPu9jOjbivPLoRu1wF6Arp8Cmw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cu4B7I9fRICaVNWCSRECivnnMqsxOAYz8+65A/S2E6dB9QfY1
	30evYRc0GHcI896Czcb5z+/i7hOoIopRPVsnuaSNvhVSR5IfwCb73EEmz8WUo7014IkHE+D05n1
	WR+NM9dYMM2+ibSJw8umRm/wpix2j5/pxWotLeL/wvixEBH1QhbPgjRRQXXcD+ciLcnc=
X-Gm-Gg: AZFdTZeEfE8sELDk7a0rjRV2lcIPNeV0Cm3GmUplIpXA5y2TOADJ6Wr63fTLcth8ceh
	mylU6WS4jk3dQGMVowoxQRGV+CzPQWuL/o5BtxtJuolGVqhY8//HDwhIkr49h50SvprTAD3LgKF
	Zl96BBRfqc1MBtX9sx157g5rm+r+/gkEIDC0cBQuwAUAa2ghxTsnjQ/fvbLjVDI0Mw+XcDd/MUx
	9v93SpapTCV62l9rAnsktEQyTbzm4ppM3ouuiQpyF/dqQzqgDP7l+IB7UgAmeuxOVdVH+XdlRL/
	M51Lplfcz2yz0e3owqu+7W1rfceUHuSq06F1JDgbdpEWBVPwTeuWmkoEFARW2ZRBcll1YjJXMGM
	nwnqVq7j/v5IgCrw0Tb9bARbqiFmwNorgjKbvoiSpyFOWrInhA5xDtFlaKVeiSMNG1FZ++HY=
X-Received: by 2002:a05:622a:ea0b:10b0:55d:3798:5ff3 with SMTP id d75a77b69052e-55d76ad4456mr300294161cf.5.1795601936006;
        Wed, 25 Nov 2026 02:18:56 -0800 (PST)
X-Received: by 2002:a05:622a:ea0b:10b0:55d:3798:5ff3 with SMTP id d75a77b69052e-55d76ad4456mr300293971cf.5.1795601935658;
        Wed, 25 Nov 2026 02:18:55 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae68284sm629439566b.18.2026.11.25.02.18.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:18:54 -0800 (PST)
Message-ID: <0a0544f0-9999-4c35-b370-0ab291e3cb62@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:18:51 +0100
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
Subject: Re: [PATCH v3 1/4] media: iris: Fix runtime PM reference imbalance on
 failed resume
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org
References: <20261119-iris-handle-unbind-v3-0-52d467a13907@oss.qualcomm.com>
 <20261119-iris-handle-unbind-v3-1-52d467a13907@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261119-iris-handle-unbind-v3-1-52d467a13907@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX4QYAN+RK+6rD
 02uGWEWI986s/h5W479QKDNdA7buyZvZQhSzh0m26KVVN5JaAfvhE9pwBgAHkgo6e6FiwJEov2r
 Zx9MaveFxu888RzYHsD2t2HZdVYLnZ/hf1ciIk+WEl37xo3PLQdXE0zOHK2QzYgLMqWIO08Bhw9
 GydeD2NAEA3Ihq5tmxwcMT4GbfHL1/RcvcurBifHZGEqE/+iGzz4UfwSGktur5MVM/0fWPC5cat
 FoUw+SD4lBHY9gDOiKdYsqaO6rIyu7jLV/PVWRzwR9GBdCIBy/Oa5uXz8yf6xNptReaskc5Vska
 0DTg7TU+N4j0vN4AcdnydI9PKdGP/WfGzw7EOT48I2a3ZE8qjFcMZrpcW+MYBaLRdLID4R4CO1x
 ggsbfXq9X8D3sGaqN58PCUP+aNJQHTPa2YW1FiGK2BNB5aJgTIqx9nt3kRBJ+MFubTqMyy3V/v6
 0jiciAG31Mr11mD8aWA==
X-Authority-Analysis: v=2.4 cv=Voa2kO2n c=1 sm=1 tr=0 ts=6b06b611 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pyCJf-qXJP2HTA3QtQoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: oRKpvbogFPCbl_3ZzTJEQVwoBJ0wslAQ
X-Proofpoint-ORIG-GUID: oRKpvbogFPCbl_3ZzTJEQVwoBJ0wslAQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfXwD5n0t40K8R8
 Vw0NQik6Qho9E/XOYaoOM+n8r+X/S8GECHn7Lw3N4QOS1oNmv0CPDqhVBEfNrAEFjUQD8J+BabB
 XiqWkFQxV4yiywVnG8cpVPyLmWVGgks=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250040

On 11/19/26 12:45 PM, Vishnu Reddy wrote:
> pm_runtime_resume_and_get() drops its usage count when the resume
> fails. iris_hfi_queue_cmd_write() dropped it a second time on that
> path, resulting in a runtime PM usage count underflow warning:
> 
>   qcom-iris aa00000.video-codec: Runtime PM usage count underflow!
> 
> Fixes: bb8a95aa038e ("media: iris: implement power management")
> Cc: stable@vger.kernel.org
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

if you want to go hypermodern, you can use
PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND (or another combo of
these, defined in pm_runtime.h)

Konrad
