Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769535;
	b=dK8MGONnbaJNaus8cQlkcpzXBcwJHq5RAyVKlD1XN1M+6tCVNoeMpXcnwsR7KVdd2ID3
	 qcRpdCF1p2LlsoM3zMci/iyGi7RD5pt1lMygdRbnNHfYdzi17X9/gKkwDCHRRUeRut/2T
	 qsm65oM1ZFqxDc7GxpztBDQGYgYsS++Z6xJJ0KO/bPRlSGk2YGPW+CpfFTb7MHywUJa9Q
	 YV5JSZxODnFgXFgzEPX27fQ9irR9k7hQWAayCFQQYHifzyxx/qqE9p8kUxaFZGPy3hJWP
	 +4cna7fzFDNw2jxA/0zSk/T3uv+ER2I85f68cy6leESTsGtDo003jWX0+ccFgGJi53Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769535;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bf7mXKMlC17WwCEUPjDtaWn5doXh6SdMr0C4yldwOlE=;
	b=gCJ84B1O23VYH+uljpfMhfPfhioEZlAILdU+4D2QOCpJMH4EZck1RNilb/ML8tQG1NhG
	 xWY+e32BYejppvjqgvArpemfHcIGMhNJ8uNHbBE9VJcTj8FUZN0mAOgvdP2+NJb2+EOaj
	 U1zQnLLWSO9+I/mXB1sv3liTEjAEJy78UuFXwkTsU0nfWhnHe9sCQRqkyYUC4IDjgAlp4
	 qd9zp/rKIU5/IUUoRawvX1011A+hkLpPPegpo9f/JtKEoTImoiyrKJF6UIGhBLH+3mMSP
	 Y7h9nNH8/kHVLFdjphw6pCfTcw2b9CqhoEhrBhH0Aw+iTte41kbuBoWH5ky5jUcRE6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fSjcd+rb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ksvd/Mk+";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9FA606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:52:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F9FA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fSjcd+rb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ksvd/Mk+
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GcNg3983857
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:52:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bf7mXKMlC17WwCEUPjDtaWn5doXh6SdMr0C4yldwOlE=; b=fSjcd+rb/O9U4FCK
	0Wn0CsYWgmd1LO59RLxKF8jetafFya742j5JB1EG5PNImzpw74sYWSxEDWSFL3Nc
	MGcnYNTBr8J6zgRoGbAs4bE+dlRQQPncobYN+jt06VGyIDBG/7h+FCkL7F9uOtNt
	QXHDkWLxS4w9Qgp2cF0rz5fWoIL0IjVgRE60fxVEVuY4DfsgIjXsIToiiFYGDGq6
	9XfP/VY1dGo999gluq7nIt6izHPJwHHKgF6+P3UjYn84X3qhBJU+WMB7Okxm5EwN
	Se4F4Fmyy50HhrGMXZ+KXJx4vZgcFMMTG675slXQYbvFo1UhnpdMOI1BK4fkI32b
	BZAZRw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u49a4wh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:52:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-949b0d3232fso1078589785a.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 00:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769533; x=1796374333; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bf7mXKMlC17WwCEUPjDtaWn5doXh6SdMr0C4yldwOlE=;
        b=ksvd/Mk+UHfYQaLQb9m+tLIjBhnHRVQsnhCYRRmpY40qlwoFpgN7Iyg1ybwpCGdWtu
         2JEIvkc2hp38g9JMT80ymGBVZTyXOjjvBuAb+Te1Yp7JkT9KU9WhBBpwOVA9RtbZkg1R
         LUfwdjC5fjH0iZbRa2RVTV6ndF+CsV94VA6JNkXQObGiG5G5A2K6xhLS/6ZVpmpUASwN
         y1T0vOp/JzYXR1cNprMIieVxTj9DEukowsudhU2iC10i6ZrPpBEdDOTAyHoH3IrrXpVV
         1DUSZq0L8pFXiutwKGX+2hyrEddHEaL32nItatU092R6ofoZxqTOdldbVzra5Hcu4hAw
         xVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769533; x=1796374333;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bf7mXKMlC17WwCEUPjDtaWn5doXh6SdMr0C4yldwOlE=;
        b=CCZu4+4DCWusBNAXd9MsFKC2bdpIUJTXFfP3+WP0u50+nvVArayEZDiMl8+pcqTloz
         o+5+LpJFAKFL4q45E1g5Wucn7fnQQ2I87nCkmgCEnyYpuawD0gw3x87MUoPygbkID3PJ
         L7qyAPmEdhEWF8sfmWiy/WykM1PfrUho+rTzSWhh92/EuVdA7FOF7hq0SEnWaxca8PYb
         mLtPu+yRZ0pYHnRazJ+zIlrftsazMX1g9EllpnEL9oQrg1WdO42qVu6xjEr3DsHn046Z
         KkpMGzhICR6MnaxIyKsbcW2XIc9j+j8aORyp2heuW70d9QA2BlF/0xKvqNG56emN2Wcg
         CS4w==
X-Forwarded-Encrypted: i=1; AL+hErFmYZTRx+xJKjINyl2MnJ1ORf781p3n8r5JpF29u9g/YVpGQeIH4iUweHze4htC6h1q/BG2dRrhUzU7dnU=@vger.kernel.org
X-Gm-Message-State: APuU4Z99tqUDWxfhbnaBn77O+HA/Dl8U0THGNb6Gcs/1dZpFtD9oDAGw
	gJcEKQJJTMn8TmPM3mjJ0CMrsGV1L9OAYXzzERgmJ3DwTd8amp3sLqHSO+MUdKOXlG6SbpUQ+Gh
	dYoNiwnzIAgsrZ7ilWsr4ewTxpR3j3ZUckZ1rQCAiuRtB1DpJGH878Rppbnb1r6jt5B0=
X-Gm-Gg: AZFdTZeUtqCgarkDX7amqBBJDua/4D1ZuwV+xaET6YKUdc1uI2oJOTCbqQFxOza1HVN
	NOZiV8L2VcfqIibEkYDSIPHlAsil68FZ3LQQdWFzlEppyYyhtcnbU/fr+dGMZ6wdzagL/eZ0Q7I
	2DJ1RVNVOkiUNgwYrzK8GOtzOPT0+frHUkMkLr153JFQtWWGKxT4XhSBkQWVpyOrk9ueZ1wdRHY
	OcVMuIqMvxr82B1STRv7WbNOJnWwOhvQlyazWeFDB8Wx0FrAGcPo+G3Z0nqvfY3aRFVim5xuIpg
	2kNAEeBizHxe9DRUhBYsBCJibP7svDQiNW26clQnvm0JaVMIEXZk5c4BfXps/P0wzq4MK2J9cXA
	EimDHKHOjVIArt3IEJ+TvaXe9tZ2OWHP1hyNQ3CpLbxtSwisjLUq6ZZ+l6CR1uPLHSikcsKqVKK
	0/3w==
X-Received: by 2002:a05:620a:2a12:b0:949:7497:7c1c with SMTP id af79cd13be357-949bab5ae05mr3991121085a.60.1795769533272;
        Fri, 27 Nov 2026 00:52:13 -0800 (PST)
X-Received: by 2002:a05:620a:2a12:b0:949:7497:7c1c with SMTP id af79cd13be357-949bab5ae05mr3991117785a.60.1795769532775;
        Fri, 27 Nov 2026 00:52:12 -0800 (PST)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4b34e9c3ffesm30247576f8f.19.2026.11.27.00.52.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 00:52:12 -0800 (PST)
Message-ID: <6211f2a2-f313-48cc-99c8-157a65736350@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 08:52:11 +0000
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
Subject: Re: [PATCH] ASoC: qcom: sm8250: Add SM8350 sound card
To: me@fromdisposition.org, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261127-sm8350-sndcard-v1-1-50cbf3db3cb0@fromdisposition.org>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261127-sm8350-sndcard-v1-1-50cbf3db3cb0@fromdisposition.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: n3R-k0oHXhdvk2V9wafts1hAbMzk6AAk
X-Proofpoint-ORIG-GUID: n3R-k0oHXhdvk2V9wafts1hAbMzk6AAk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNSBTYWx0ZWRfX4bAGw9WjfSyV
 EIhSiQMPHAu+1tebrJFtdZuct25hOQlv2D28Hm9fx1KBu5AhGIbDDjXwXSaXsOcpYuyj4EtuWOm
 6jHlv86d33L5a+clnUwioxYo7TQ/3g4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNSBTYWx0ZWRfX8OUAHpbsWw/V
 N6iUWfIOnBhzNJNrfXrmlVDwaHKkGEI/kjr5GxqlixTBkdrvCMryk+5cRzFxgvnUYyMBS1lr7vc
 O4WahWftad/KQ25e237uK4gjYh/DSgZa/4rLxPRnOst2S8LL7C+W4pnBkqykUp3sJ2va1+Y/ASB
 tQfewmOWidhaNQtyST8OTGu+GZzqS38s8Eh+5q2j1Qgsa8GscdnNuyvf203Hzbb6QR9LJTkX5mr
 xYpS6nIdIARrRExy64lBl8Yez7pPGWlqC1d+fwAnzScqiHy2n+JJxTz95/m8yxowBL6vAJ1tKyN
 xFf02Vf0dQzP0I/E4oCZKr8N2bwQukZLPuhXnKkc85gBsT5vY2r55YZeQRr0RDf2rUggYDiXAwD
 XzWtdUGZBzBATZghRzpltSK+3P4JLA0UFSTSJsPar2HqpddwbU9oD4Dko/6EBZ5OkxNGPbzDyk5
 Fvw4kVFERy97T4i6inw==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b0944be cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Tt5JBQAfAAAA:8 a=EUspDBNiAAAA:8 a=OV9TyUFxCiMX8QcW4tkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=kpHMOrJS8sLNr5ru0mYA:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270035

On 11/27/26 12:49 AM, Demeter Barna via B4 Relay wrote:
> From: Demeter Barna <me@fromdisposition.org>
> 
> Give the SM8350 sound card its own driver name, so UCM files can tell
> it from SM8250.
> 
> Signed-off-by: Demeter Barna <me@fromdisposition.org>
> ---
> The qcom,sm8350-sndcard binding this matches is already in for-7.5
> (a5b5d062b40c).
> ---
>  sound/soc/qcom/sm8250.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
> index d0015e5f5..ba0aaf428 100644
> --- a/sound/soc/qcom/sm8250.c
> +++ b/sound/soc/qcom/sm8250.c
> @@ -231,6 +231,7 @@ static const struct of_device_id snd_sm8250_dt_match[] = {
>  	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },
>  	{ .compatible = "qcom,sdm660-sndcard", .data = "sdm660" },
>  	{ .compatible = "qcom,sm8250-sndcard", .data = "sm8250" },
> +	{ .compatible = "qcom,sm8350-sndcard", .data = "sm8350" },

Reviewed-by: Srinivas Kandagatla<srinivas.kandagatla@oss.qualcomm.com>

--Srini
>  	{}
>  };
>  
> 
> ---
> base-commit: 0fe506c81cc421509660163da72dac79adfb959a
> change-id: 20261127-sm8350-sndcard-f2367f4568d2
> 
> Best regards,
> --  
> Demeter Barna <me@fromdisposition.org>
> 
> 
> 

