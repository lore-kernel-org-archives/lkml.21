Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795664350;
	b=C/lWMCGNg8OQS8JY/9nYAA9xQP8PAe5Z7ka1SGgGozpuSN8v2Kj8uxZSmtC5oQpkolfc
	 1leiQLr6OXisfNYPwuHQTVUAlsaxgk/YWNGgsm+JYApM7hSHNjnKB7Nw0DXilh4SnCphT
	 gMgn+RgcsmadIumjB15ilM6+MBXbuPk9yMqQmLy2kzDdtkH6YVjbEt0u2qbPczhXiJpXV
	 bNBCcOYDrS8Jx6x+8b76wVsbwRXtxI4ZV+W3KXLosfdCBqSkWhAg50XnpU2rbsTrj2V8h
	 t3vmeHkOysraZFFj3TcS5o3GXA/k8C6pl6/STweFnbTVHT2v6wG6I7PpLQ/5O1TBBtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795664350;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ig1Q3yBjVbivSP+2rdgIubsjNnhUPE3NszY437oJ1oU=;
	b=PbH6MbrTkj5GImTuQV2x+2GIZnqc1E4pBo0zFxUNZ6LNv3R+aqAEREu9CXorIEPRmvQx
	 6ytU9M3Tz967se3C1cCcuNTze7kcOXbD+wpmQOJ8EbYaKQpWOVaDajRUCB+PCrcIacAw7
	 jRdQvl/Z0el06Mmnii4BTXxRsaw/y4JCvqXA8nmpFRlOGjKzlurhUlHADGS43L6MPwxE4
	 CP92AOxVpms/1EOUpU+tCSLk1lcVVQRb39UD8w8XUKjqJWT/qwhzUdAmJonDFVVlkogpb
	 ew3PKa4MNnSIpSWWTxqMBQ3EuuoU4jEtlzeuVbFIYOVvwRAUnZ89Yynzfgn0VtM2TPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fTqPv4mg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d0RVmqgt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13340606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:39:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13340606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fTqPv4mg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d0RVmqgt
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36Xw31647654
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:39:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ig1Q3yBjVbivSP+2rdgIubsjNnhUPE3NszY437oJ1oU=; b=fTqPv4mge0M+6zzG
	qngl6WCXjIHyaudlNy2Naa6s4hHhbVkmTkgbAJ33kmEX0Arwc6gdNHTwJX0+J5wJ
	3vHLloD///qDRtTUquvRDXJvMs1FDEKz049ZYd20cFl0CpJIBauKgXbTW3Ey1On2
	207yFO0QCmcKyPKAm1lMmYhVIUqIc9j0VQxQvjeM/Hd67s5doGkgULtgtTger/mA
	CAGaQ4OyyaQ5sipNwBQhXYt9OPypgrmH+LrURECwE4qoNNqd/sZXIoPb2ZBOzfqd
	6v+pNDjgpqUivD4Y9X7W87ALaoF+GDpru3rLpW2tlrzgOj5iZGknDJZLEQr7ysHs
	sfEnuA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahtj2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:39:09 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386b8624cf7so3243876eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795664348; x=1796269148; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ig1Q3yBjVbivSP+2rdgIubsjNnhUPE3NszY437oJ1oU=;
        b=d0RVmqgtW228rkJLM9w64xdqLWC0qvcx3B6y25h952J0PWkOQTxsLkIjTnLvA8JcV3
         3/mV9WPyWaBfMpEKXTPD2fDQjp2TyxMbUkvgPcxqz790LnqAIef5WPKI9dQ6xuJVwyYC
         D60Yj17y+DBtSqF0HKWa0yZ39kqXsBxx9XtXOXdjbg5U/rfLZjtxV6tbpUlEmB8VFFyW
         n8itFQDcCim3sSx4x2av1xOaey3pOb37vx4yy8UU2+lof3irh0FmJDvIoTy5bjza3Bk6
         AdWb2NMV6D7CnkMGPJB4gojEkwpJ0MbE4+9+RefrvRhcRS8xYlCwZaNeKkEwlFqbMZ4m
         18Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795664348; x=1796269148;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ig1Q3yBjVbivSP+2rdgIubsjNnhUPE3NszY437oJ1oU=;
        b=PtPhhFln6lc4HMmpbjWLJiweZZahl4AJKIGbvKNZ+KRFz/1355pZ+CL9Sk4abP/AZI
         iVoTNEFpPkr5/UnVhf8iRhEiaJ2smTqggJdc/vfQIcCEd1qIPoWuAAqNB+o74UFxroBx
         jzKi5ltXlxBn1lxXPYM85Em0sXdy/9ucQdy7vO9ebQyogZG7+7lCOk/LhJwpVwUVR/SZ
         uj8ogHlg+mn9caxig/Nv+Wf17PAcwyeSLVmFDrBZc+D8t/tmg6gaNVbhJiJlhd6kNGPj
         qZROhPuNBUHNDqu+UhAD7CS6/Fy8VOiGvrf0uHXDkP5n3jWXyJS9b3dRAPYGVXFraAIW
         pecg==
X-Forwarded-Encrypted: i=1; AL+hErE5UjzeXIkExlvEgvc7Lhv7YidS1SM7mLPRymKQmKSzzLgSiqT5JvFUsgkcDaUkd5Kypq+ZKKoB2+Q0rsg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hiO1LunWTPRKBEd+DmhcnpuzMynlLaEt9sInoA/Lqm1Ko/zLh
	vcmeCBXJPm1VruI3DKBRwfTC/fz2oBj0RO9UV6dgaEDslH8P0PKO1XbwHQyV5Pa7lUlTKFVlx5V
	0so0K/0hIVCbA74UhlijZfMVNtxI6O2QBO+ngjbVjw9uJ8Q7jNiU6qonQ9cC+hpXd2I4=
X-Gm-Gg: AZFdTZdH7+iHoYv6Dxn/TsDyxmGicmM5mFlD4wYLHQWHw8qkvn4vVPGZvZtT6DPRZUY
	8Kjgbae6UrUQS3lTKLa8UsL7qrBl5U5JKaqbL3iQarAgm9nrIOff8gv/2/fI7cI4HLpMsjf2pcP
	VC/GKacIqlAKGzqgWEEgMnAFel9hGaMBoj04CJFVEF6TfbuxaYQJioo9tJ8DpIPK3YRe9TIFV+G
	pSKFhNSPhVxbTpSOi8uKONGNk72MM1ovXHd0mU1P/9y5NyJSWhO5mdCDvGjIt6wq9m3CxSO6nJb
	/QiVTR2UNWkmFJ+zKKmbXMbBsylswjICeSsZMfSVhFFsUT+tiy4ov9uPc6x5yzmB0pJGyCUgh97
	2c6NfTSfGlQY/l4aX9TVrAEtJwQCIpkqS5aVl4Pqbzb5fe8nZz87O11BLFe6818gN+/HMAXw1Sp
	wmecrJ
X-Received: by 2002:a05:7301:1a84:b0:386:abfb:4a2 with SMTP id 5a478bee46e88-386abfb1a83mr12744952eec.11.1795664348408;
        Wed, 25 Nov 2026 19:39:08 -0800 (PST)
X-Received: by 2002:a05:7301:1a84:b0:386:abfb:4a2 with SMTP id 5a478bee46e88-386abfb1a83mr12744935eec.11.1795664347990;
        Wed, 25 Nov 2026 19:39:07 -0800 (PST)
Received: from [10.204.100.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3866f299d0bsm49729022eec.19.2026.11.25.19.39.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 19:39:06 -0800 (PST)
Message-ID: <3c7382f6-8665-1632-acf0-b380aa8c5aeb@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 09:09:01 +0530
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
Subject: Re: [PATCH] media: qcom: iris: fix PAS ID passed to set_remote_state
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        abhinav.kumar@linux.dev, bod@kernel.org, mchehab@kernel.org,
        hverkuil@kernel.org, stefan.schmidt@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261020204630.1175058-1-jorge.ramirez@oss.qualcomm.com>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20261020204630.1175058-1-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: htt3il1CLshVfgiHizUtLcl9N6TH-pxI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAxMyBTYWx0ZWRfX0v1/sEs1rHuL
 kvqcaaMnp/ARHQ1mUiCZ3a/HoXpX6tJtMGpkKT/RnEWfCsxFnx07rDIZFRw3dvKk7Tv2r4+O3+F
 Mbv0i0iZ3zg3vgeq+PAZaptkxf+xuaQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAxMyBTYWx0ZWRfX50b1gYQxOlmX
 2RLoQMGbxMQnzS1DMyWBZEbkYrccpwdalmr2xb0h0UV+b0esOOvQCxiLbOYynzsfY5qIJl4end7
 /IBDzy7YwdCVOL/wWFpx99uZzvxyrgB92aMolpdNob7JZJIHDVHsv+ZY5jVgmmwVSRvqC9sNXdH
 DG6Eu/9HzJYy/g+/u3Z1qBFRwYDHLH/qnFWrIADQQmFQculoZSKZXKfGyV29uZZEHSOEA4WnJXS
 I/xdbwbHcxkDMvlCx+hAgZCXe6LAtHQIVvHcE06/IsA4zoFmbgwBNavxli+5cxn6PnqXeb1mRJ6
 nvh9Ws4xfnAzSsvCGp/CydlwLUdJm231oQ8sTAYLAL6yvDRjvdYOdsCsfJqEaHIkc6TR/l4qGyT
 8Oew4kxNqlVCt/4mWqRWPn1oBomW4018f2r+Gr8mzov5qXEaRQFEO52JrRoz/9wOZgApdkNKbkG
 oEMBg2gIARR7wr876yA==
X-Proofpoint-ORIG-GUID: htt3il1CLshVfgiHizUtLcl9N6TH-pxI
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b07a9dd cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=RiDGyf5vU9R3Kc8e4UgA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260013


On 10/21/2026 2:15 AM, Jorge Ramirez-Ortiz wrote:
> A PAS ID of 0 does not identify the iris peripheral, so the
> remote-state update never reached it. Pass IRIS_PAS_ID, as every
> other PAS call in this file does.
>
> Fixes: bb8a95aa038e ("media: iris: implement power management")
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_firmware.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> index 21cdf1c39835..6ff5eefff391 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -195,5 +195,5 @@ int iris_fw_unload(struct iris_core *core)
>  
>  int iris_set_hw_state(struct iris_core *core, bool resume)
>  {
> -	return qcom_pas_set_remote_state(resume, 0);
> +	return qcom_pas_set_remote_state(resume, IRIS_PAS_ID);
>  }

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

