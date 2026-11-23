Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425504;
	b=RFneYrXhoiQ5u8cX5DrJ69WTy6n43LL1D9z0spfE3hdD7/PXp0S2f+iOoHVyHYoGa7DF
	 o6TnGJ7YZ4B30Qv1CXFReQkh74e/WsqEpk+f8NMXZGRYTDym8fxKvymG1KLIFHI9taSTd
	 C8R0+U+QFc4PDl7ZRzpXLkB2rROPdQBlqNXbxq+hsN48hnhuKl/M0Z7+CKtWIKA3apu/e
	 S9CxQDcwRfi9uVEs1wky7COk+ZIKqHV91wUKRRgDBLTT7Xb6DjhJzqIE9qKiLbd6FTK0D
	 GrsaOee1Cvc4Ij/ah8xzWV4kiQ4AbKHBL7NbzjIjJbLPoAWa49N4sjpzBiQO56YX9bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425504;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mSzMQRsg+yqrEBzUwipXKM/+0J/rVsVGfEXY3Vx7ICc=;
	b=dK8ULmp7Z5il/bi8rYxosC4UwOuTJPtjETLQEPPNIUv8fJdneDKMHIrVzRJQrB/FcP1k
	 Qtu1wYbx77gJXLk9GMuIHl+igTEcBtE1OXUaoZ72kNS1eIJg20/CrkJHqsquNh/6/Peyf
	 6DNI5Yeib78lWT36hcHTRcbXJeaTXJWwb4h21zS7eCg/NIxrDhmcoCptLKgA4ZrYarIML
	 giXLOsCEuJi6f27vvhSPKCPdXbnyAr6rUjSAQwbDXN/PEjpCEl3HWOfLXOQ9tag+l2jA7
	 6R56XwU2aPKg453hzY1VBZX2wlPA2BzsAKGOpXoLO7zi68gdN/laDNR8kLDQAWcC42g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xg1unES9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SXSmv38J;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D028606A336
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:18:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D028606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xg1unES9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SXSmv38J
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9Fu1c2785560
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:18:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mSzMQRsg+yqrEBzUwipXKM/+0J/rVsVGfEXY3Vx7ICc=; b=Xg1unES9jsmRSZyK
	HTGRTKLWVi8KzqJYZAb0udLqpQqOHo101z4Zb/hMrylrs4gj1UJyLPqVKcJZW2L5
	VHmFZvw0g9iEJRrddx4zxpqE0xU0BFzwHj5ic48N09PqyT9UNfGFJy4lkA8ni9DR
	mTLW9qgjJr7YoolBgiNEziKbgmS1Nt+5GVHxyxZiiHmBKCmrIIPZWrCn3WFNwSI6
	c3Flfq3SgAaGlMNyXZaCb24wZ69W7Qw1pOEMLRtxLXaZqB6fE1KWciK77m5kcvKX
	KT8KoeYt3QtTGPeykiAMNcoibkzoHlVLFcFWXom+FDmk0BSjfOPnPkTlFjsZWCKr
	9lHkHQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd0nw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:18:23 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0a13ae043so3334964a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795425503; x=1796030303; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mSzMQRsg+yqrEBzUwipXKM/+0J/rVsVGfEXY3Vx7ICc=;
        b=SXSmv38JqmEdnmaKjPzoHspZ4j1KgXye2tSGNsa58Eu03qy09fIlbqg925bJ1QOXfj
         X/WR7dOykR41g8MU3jLgLYVohDzxQOlGXlxiMr0rAGYS2ipKTCUSn8ukd/SrFjjPTF6J
         FZRaxxfTgWNBNFybRCm6Fi3UQ26Py9YK9sbwo82Acmxza5frbjNX47E1U/G6S6HHmWqD
         gJJj87dONd3Y5tdG1UI2jVaFGMj4vrBc0zkotCCgMPUnoT91+moKeH5KXzeuZoRBm53s
         TGMpS/g1/vqlgpkVT83VGG+bakmolZ1gwVhDzhdIAqxZ5Qzojkmmmt770q1dX0xZgRjM
         fFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425503; x=1796030303;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mSzMQRsg+yqrEBzUwipXKM/+0J/rVsVGfEXY3Vx7ICc=;
        b=SSnLxrTY2jVeAubv3qMcU+PKjtUpJ3L8sipJ4uJX0OHbP/lOEhMi79EdDAXcOLh5l6
         8dylkBujx1G9TSkjRL6zBnuS3em20iC99ZZrk0Es7dGB21JPV80rU28aCBDJNGpEePso
         rrXLB/j0yAMr6ZyPlmMpQuCkTOUubdsMVSbbFrzozg+iZYItjcH4O+HytDXc+fbW1uHB
         6cbGuZklP0ejfR5KuNxSXH99FszrQ1/vLKsYpghu03ND3hSFKaRMe4vu94Cih5jphR/z
         KMAQ1A2zdcvHccZFXesrE8RKo3CLmllAXMCcx8oN0MzDy8P3P0EkTkGLf/wddwrqbvTx
         o9NA==
X-Forwarded-Encrypted: i=1; AL+hErGiuCw1HLf9o5pV8TNXVEhWvq+B9jDRuePpdHysSAtdoEakG42bBoxF7Na1zTvCA1ph8WrIvbS2jr9nCU4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8CK4WTtm2iIlpUGOaTplnygDJIeoFXFijxjvj7c/jB+lvZ05L
	pjI9ztHS5tcLHqx2X65jlPunBaxOjYZP6eRt5lH5bGVhqHMpaDufoNr+QnwNji09/aRLsFIV6Ix
	gRm4RT3HOue8YoGG412ZYVPKbmvBUQPOzg/R2Y1/prpb/C3TYG5F3XvXYymfbXF/lAsY=
X-Gm-Gg: AZFdTZd36p/vOeW6vMH6WJieJYimgYGvUUqnMKXv8z5EWBrOm0rXoI7yhQI7oKwaPQe
	/s3pvbqRsDHH1SYRHI1bsYXoIAK0Nsm2WXjE4KlSebDgHVqcwxi58KjfT5aQPRHHex/aDOYg5Wc
	dkP2kfNq+QnoeRuD+7KeJnK5HORLFez8RlAZXjGzJbFF3AVh/WRpkmrc2mhALvH7ziRgHE4OgM/
	Dp2qgaXL3rARvzjmGOTqugEwitvEUgO5jUTzYXKrCA6tXaqaHOpnxcj840HMsDu9ZqMP+7Vytio
	IdbT4TqjoR2cxTfFdHdaDdAMx1pEVizy4pMvAxiT7/7f8HAjATgHVTuCwxhvDalDoEscXcH9hAP
	qsGttGJitpSl8RnaXnFzn6ww/LChHALv48xZStTPyjGj1JtiEeil9m34dht3RCa+dpOSyYnn/2D
	0FQSC0
X-Received: by 2002:a17:90b:2648:b0:3ac:da41:ef7e with SMTP id 98e67ed59e1d1-3b41c95b67fmr9470995a91.52.1795425503018;
        Mon, 23 Nov 2026 01:18:23 -0800 (PST)
X-Received: by 2002:a17:90b:2648:b0:3ac:da41:ef7e with SMTP id 98e67ed59e1d1-3b41c95b67fmr9470981a91.52.1795425502450;
        Mon, 23 Nov 2026 01:18:22 -0800 (PST)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm16839831a91.4.2026.11.23.01.18.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 01:18:22 -0800 (PST)
Message-ID: <8aed0815-685d-41b3-af2e-0055bc6ad920@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 14:48:17 +0530
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
Subject: Re: [PATCH v5 2/3] tpm: Introduce Qualcomm TPM driver
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>,
        linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
References: <20261120-tpm_qcom_driver-v5-0-3d9321ace107@oss.qualcomm.com>
 <20261120-tpm_qcom_driver-v5-2-3d9321ace107@oss.qualcomm.com>
 <awGtGoxtker8a9kG@kernel.org>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <awGtGoxtker8a9kG@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1w9wN1Ta72k3BU-DjESms7bdgXCsD5n_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAzNiBTYWx0ZWRfX1cwgmOmyqw9s
 TaTpcDw5FSYAN0uyVbOi3vz55QbQi4CcWBIAtVsAjVhhy9H2DMRqAubExnb1VvLsqIlRUbDRjnG
 aOTrMhgvnxsjhLvjVY6yqXNo7/7VD3lTgXtE0eaKRpw67rWiZxgTskHMBm8qgUT6YQCT6l8hDV6
 Kk4OvWYzcFMBc7eyXiy9C88a7sa4sOYiA/NpgHLHLac4hpVOCXQeCSdU8RVKADIhlZAM4XOnm5a
 5Vvu1hL4kk9qOa2eev3lBvAC+kjDhJQaPDz9xgTiEB+4KVZFrT4fmS/4rG0FcL4xOWnnRhaLd8S
 Zwpo5AfwhLr7d5pcz6T/CWcMt51ACny6iwYLzwMpUdOvLAnrME8+h9eB9WVWY/sElU491GJnWbb
 837IHJIqVxbLGrgqWCgoJ0FPcehC2CTeS4R2waN8L1pBmHfBvf8dH4wiR8RO+8rH60ffXxzPKlt
 W2bMEGKvwARAl6jTfRw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAzNiBTYWx0ZWRfX4RqBxmaHT2gW
 WuPcOz6BgKPb9SBSfF2LZhGdOY9wEmb8pOwFJDITpgO/QKY0FQstr7dm0OREHsMQTfoVRKWawvO
 MMpXzZi3wUPB1rZnQInfFGnCHRLq1fg=
X-Proofpoint-GUID: 1w9wN1Ta72k3BU-DjESms7bdgXCsD5n_
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b0404df cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=V7dZqg2nRoFFyRf2opcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230036

>> +module_tee_client_driver(tpm_qcom_driver);
>> +
>> +MODULE_DESCRIPTION("TPM driver for Qualcomm TPM TA");
>> +MODULE_AUTHOR("Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>");
> 
> MODULE_AUTHOR() field is not that useful and nobody keeps it up to
> date, so you never can rely on it. Not NAK, but just underlining
> how litte it is worth :-)
> 
> Copyright and authorship is anyhow recorded by Git and
> MAINTAINERS document.

Ahh, I noticed couple of other drivers doing it so took it as reference
and adapted here. Seems MAINTAINERS is updated correctly so folks can
rightly reach out to me for any dsicussion/issues later on.

Btw thanks for mentioning. Will keep a note for the next time!!

> 
>> +MODULE_LICENSE("GPL");
>>
>> -- 
>> 2.34.1
> 
> 
>>
> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Thanks!!

-- 
Regards
Kuldeep

