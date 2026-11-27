Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772465;
	b=3XtpzjeVoFxUV8jLHAFwjjUmUphXSs76h7TzrzReoTZ0H/w8srdLCzIGGAB6IEBD0MMq
	 t5M4GGiu7PJw/MlwegzE9qemguaTjsSPRRHHjxFgN0zVz51Ea1pITunFCyGnc+Fj+rU31
	 j/5izGP59dTo7TIprIGkPYe0fgijXGI8k49CCXFndW1FMxCxN/ygxWQAgwfLo5rjTk1zN
	 yEQmc60O390QiBmZ+YrO8wBQz1J1LntcRdd6EAbEV0dWOWnsSLtPq6zyXVxbz3zaeihOr
	 +eAf31EvptG1wWuOd7RJ6PJWk7ECfom31X2KSgLoRaR1qhf/5vnEydQMAT6uDfq4nDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772465;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=o3HiB2vJRWEBxUo+fvEqRZTvriSNZji2BGGHNXkYQ8Y=;
	b=leDTZ0SlO9crUmeEVCzqqx9QsDgkazBbGlgDPcFQi4vdG3QRWmQjhzskBA5rEblnIBft
	 6jxq41y7DsODANGumCttvCFrgV7szsRekovUCFEtKuSCKb68rZOyntH2gV7TXliWr0LJl
	 pVxZzMq04zFvWeScoUERI89vyCA/N2uvx93TqMMseP3ezdQzIewf+9ouawA05PQi0FGoF
	 UyqRg6SZCeP+FnXn15gHG96BZ3lVbhZ4g+31U0E30+U1M5OTL66fYueVPHk1EOeyGuTmZ
	 tBUxplbaBxsj/4g6c3NA7M7ruP92pMhCzKoOBclA/a8Swg6ieulkJNSwxt/qe5W3PRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="nLS/r6At";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VM1tADde;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D94B606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:41:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D94B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nLS/r6At;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VM1tADde
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7Gf6W1475202
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:41:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o3HiB2vJRWEBxUo+fvEqRZTvriSNZji2BGGHNXkYQ8Y=; b=nLS/r6AtWhGq+QJc
	J0oiuyH5JRdARl32y5qkdYINZB5cJduI03RlxB238VpnYDaLbmUG9iqZHj/d9Wxc
	wMKDw6zUmZ3+oO+MipcC7cjodcfGZPpgcmI/cJKf3TFEv9rrbj6araSwgGdz1mti
	JehdOnQCrB3zkDAmkV3IL6ZyGjFU97Oy3ndDIgiVHeVOQmoeXENzgjLluXfhOCyj
	2N9sL9a1kG+tJeYdlKl7BUW65s5aKLtOp4AWfV6qAyF4/OWNn2rCmSn6PhUV5mV+
	6QO74eWqv5MsmufPwwdX9AErpCf61T4+iRQCosmQx+TeFSRE5p/GehKrBH14SCKP
	MP0PKg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4htbx1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:41:03 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-920fdeaaec2so4329306d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795772463; x=1796377263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o3HiB2vJRWEBxUo+fvEqRZTvriSNZji2BGGHNXkYQ8Y=;
        b=VM1tADdeBkw1c0R9KqrypaBQeQ7Cv/fijFi4jqICKhCL6x1MejslvntqtilFoP9Naq
         z7E6w26AnHg7rbZLPv7DBSXxxnCzblUwFemOKy8w/7Vtb5I4Z6ZGWYapQ0SWqEixbe4l
         66UvTlkrMF6QtmszwysmRa4Iq7qDkQFJgGTQfU1vHybXTNZJNt7deBD2/1pLbzffH8KU
         h6s4Nmebm6yboLJ25929ERfZ+kG0Cddp7s0g0Vsjm3XPe24wdeWjeX8nHQMliXBoCvNg
         7nlbfPHLxKHVDjK4UdZ4X276sN2ZHNfRfmX93phcqoyoQQWlh3GGSCMftAbN49DXB3Sh
         EEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772463; x=1796377263;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o3HiB2vJRWEBxUo+fvEqRZTvriSNZji2BGGHNXkYQ8Y=;
        b=adjuxn2BLIuI/ILXOEIqVYN+MfCSTah/iKbpxLwemsU7YAxhzmrOOyoaJbJie6WAaN
         EnGfY1/0Cm26IUqyqFD1Ga0ggD5jaqAXVtdHc69ujWQgXqO2axr9Df65L4TwzsxkZn0X
         M6pQe/U4TwdknxkpafYAD+ith/N5uYjMePjVKZ4czJqPM7jNuiqePu6jzMMx4Gzm4P4C
         somB7hm67SiOT69SHo3XsWiZWfAc0l9f3dgrH/wSTCGU/B9WS67CCvXWZjy7BnMaQsQ6
         /UKQ1sZ95ea3aVVQXu4LCuNKxAUp6LwMzPjWu6I19GRHq89clSAXtzQottvSlX60qseK
         /qqQ==
X-Forwarded-Encrypted: i=1; AL+hErFeQyorRu55ZJgsCEyiNj99xAWPo9f7uvWmXGXLu8wWO9zgEliHh1N2AqgpdTW8mDOIY2QmDZFpFwF+esg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uuQ8kNNduZQZOGzSwO96o9L7Pp/Fqvf42y1jMu5+qr2oakR7A
	ABv9fKWvTmzdhVV0+JGaPt2uZyuIrI3ONQDoSdK0gUK7U7AUEFS2TVog3YmzI9ZRwLt8OhNwReU
	MjD/Fd4kCAr4GAk55ZCMXc3u6OzrniNK2ddjY2+hkd3DFTk3cCaQLy5MY3M1XZAZ+KSF18uFQGd
	g=
X-Gm-Gg: AZFdTZdtSqY6T+7HT53s1mvddgQEi9ki5sicGty8eU5o82y6RIIeF4SzUIVVgwjh6zL
	+HZMr4vPwvyDrYbXh8W4zwWho0BbYK8ncUdCjeqhl9X482LSESATIP+Yd1s8nKY2deDv9L0Frf0
	sE5p1ejSuKK3YwbKiLAQLgRUxk6m2KhrqkhAIMCWrt7K3Oadz4bBZ/ih07dqxkim3Bx3nHCnSTT
	INVETR6ueb/8OU7DixvcCtTbM82YyZJeqbHFGhDuUueCbOsm+9hCWqWjhgUueAe+0sw0XU+AdWx
	jcR7kCFB7oPnjMWlpK3kyPik42zHyLR0K78Wn6p93Z837LR2/IcpCy3h2mFsaV7irED9kygstcY
	dqQPa+WaJDKvnBBNFDeYxKWp8PlOyC+TJ/6ZXs99/gmHnam9oPX3POUtuQ20hkGTwqSPEqSE=
X-Received: by 2002:a05:6214:d85:b0:921:9965:89fd with SMTP id 6a1803df08f44-92199658a4fmr1860006d6.0.1795772462907;
        Fri, 27 Nov 2026 01:41:02 -0800 (PST)
X-Received: by 2002:a05:6214:d85:b0:921:9965:89fd with SMTP id 6a1803df08f44-92199658a4fmr1859526d6.0.1795772462429;
        Fri, 27 Nov 2026 01:41:02 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad00232sm870424266b.12.2026.11.27.01.41.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:41:01 -0800 (PST)
Message-ID: <945486a0-ee72-4518-9537-72c4893a4bad@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 10:41:00 +0100
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
Subject: Re: [PATCH] interconnect: qcom: Propagate BCM vote commit errors
To: getfeus@gmail.com, Georgi Djakov <djakov@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <CA+m4KrCGfS46jvTdXiYorW=rFg4wOKJ=UHKDXq1a4qfN0r5x_g@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CA+m4KrCGfS46jvTdXiYorW=rFg4wOKJ=UHKDXq1a4qfN0r5x_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfXw63TyUoMVBCJ
 lpz1wUxnFv6jlNkmt/QawlQOiwpY36lhsTRwfLyNdM8kPzhsx1V/KGvEqYpnCXjUhvbJACSYv/x
 5RYZBpcwXwa/7/0pFFCwmGaawiM+bd8=
X-Proofpoint-GUID: tEYmET67e6LAFD3Ck1FTRyxW7fXwkQoS
X-Proofpoint-ORIG-GUID: tEYmET67e6LAFD3Ck1FTRyxW7fXwkQoS
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b095030 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=oBFxeG9DB_Cd-dzy6WoA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzOCBTYWx0ZWRfX+Yg5riCltdG4
 JmjeRiTpmRSVXzPCQe8gNiQOX46xWE4IhFnJTfsdKLiJpIFKJWDaysuG+WKJJKhUKBaP+BCp5qp
 wrMKRE4OfJ5x+VIZxkJ4nsuc9TNhyNBpBFuOVR8YO4/S95fQwP7N2tHG4cXZ1rFa1f0iHJrnIYs
 rwvlSW1jqJOlxB/oePl9Z6W1l97LyqK4EVmZH68CXipNGsO1urTQfmTwu16KfjYHK4LD4X3jkU8
 S8bqGxXEouyXlMuQXPNkZZg36gzE5d6XM4coqLhCSCLgDYi7BGfKEX2H2QlmeMxFDQTsD1RwlPw
 vzCkvvZmnSiGFLcl7GoKpkw6xneZ05sYxI6xVMRb9YeVdZLr4bUp8bl3fJkKRSYvLdm/qqRuuUW
 3xk0o4xasQD/j2YOXRYnDd13+4aUtABrYwWuwbQgVEHt9flXeD4vUFMkjmZPrFb7/9vjozqB0ex
 EqYHVCOjyY4U9wQpNbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270038

On 11/27/26 10:34 AM, getfeus@gmail.com wrote:
> qcom_icc_set() discards the return value from
> qcom_icc_bcm_voter_commit(). If the commit fails, icc_set_bw() sees
> success and skips its rollback of the previous bandwidth request.
> 
> Return the commit result so the interconnect core can restore the
> previous request, attempt to reapply it and report the original error.
> 
> Verified with a mocked commit failure through icc_set_bw() and on a
> Huawei MateBook E Go using a one-shot -ENOMEM injection in the BCM
> voter. The caller received -ENOMEM, and the previous bandwidth request
> was reapplied successfully. The ARM64 kernel and modules also build
> successfully.
> 
> Signed-off-by: Lee Youngjoon <getfeus@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
