Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795693390;
	b=PDUuXZFuheaTkpNmzWRKq5qeZsTbgOX/u0KFk3OACpIJFgcBdz7z7+v5KV9RATNKlPA8
	 p8aw5GV6+0gXu2wHmen6OwD1GaTA5er2SZVnPTahZZwbi7YznuMchI+XwWFGflt1V+Zxm
	 XEECm+FDSgSPD7U70KYOF66T04kfnWx4CB+ZJtNs9pn7MI2V4R6OhTw9TdZH9WPXf/OTo
	 TU1P0JT9y18Hk4JXQNA5dCrfkIVtOYVigtIUVV/YVyDFtFWXSwGGgKCqfG3vfUFLZ5T1i
	 qtobQy3l5vlGkCCwtsJFkbeYwqzYvgpggJT98nU/CN5bqQ2Llj223EhT+kIScMpRR2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693390;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YDSYkda+euRZ+d/tmdcYSlHlkVIR0m1owt359Q4GSDA=;
	b=FEjvqKXWISEIvJqOfo3m3fRR8V2cHfhTctPADLanrX3wGTj7VOLlCFHhg9jcDpgrqIfU
	 dEVi1HJpCwHxXJx2dEn7yCAYCKardU0vqcvNBAf05I5ChuQyfiKIgnlz1uy1Vdn/5rJA4
	 3uJBmjgKLbv6BRZe+JX6z7sFzUhDH6JNzRE899Tr56cdTSuQB+vcoTJpzxp7p7VIKFxlL
	 46lazZOdJCI/kDwUrqhkNZDbKcr0O367tIq14zGaoDKTb6irlcW7Qr2BK3lNcXQaZdYKA
	 Zp6Z8+7ZRfWW703orymISxKyp7aveTTOhRdCdkmU+on3rXHbTVnLh9Q3VTb4ZN1IQMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Ph/l1Nb4";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UtJF6JCa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BB0606A327
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:43:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92BB0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ph/l1Nb4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UtJF6JCa
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVRZj1497053
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:43:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YDSYkda+euRZ+d/tmdcYSlHlkVIR0m1owt359Q4GSDA=; b=Ph/l1Nb46qAXKfsC
	hyU7zCheehfxWT4PC437hldcVQcirZYNI6wZxfMO6DWMr9ipcXXx8Kc1DGaOhby7
	Ogfn5blLfhe9b8OfC1ftRmFzp6ebCGUe2NSahdxUyC28/izEQG1hHelH38r28KAO
	RMppqdpaOaQxd1Z0hKa+vNBNW5Kuqz2vA+4gORX5maUMobVt2WuYkH6oNm5nXYa6
	2Hv4pY852MHss3mwbaZXQ6xUiD+6ss4sG/qaKGxnzSKWMMRFIOsAL7wrU6Ka+N6K
	y1hZo9Stexzgd44BAyvlk8FQDNN1qFFh+AGJy7AOdsnA5AO+DgA9ZZCe94FIbQ4j
	kUmAwg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y2wf9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:43:08 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-55c4997063aso19481911cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795693388; x=1796298188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YDSYkda+euRZ+d/tmdcYSlHlkVIR0m1owt359Q4GSDA=;
        b=UtJF6JCaxBGZMfyGbRZmWPT4cpp2/DhODVOalw1RyH/JjnNftzzl+CP4RbFWNcUsr/
         hfjMuAAP2ced6WeZNV2YacTCcgoN6bSdKeP5fBsQq299aLsB8ihDamL01pu9yI1gMF0l
         D34Aqbeys5ZmG0cemu4LCFa723cQ29REP+hcUOUkq25OPeqA0ZiBWE94ZWhg7iQnusiL
         /HNa/ChktFJB6G9kIef134cmTY/+jZNZ1J8bVbRGhB/POC+E9S74bIgiIFECbNEdQ1/6
         9PS8shuGjN6iV401BnBMhlHs5cJ/mgOYsJRJTPdgrWpYgN+IgtTy4tS/pgXWyIfy9bcv
         Xn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693388; x=1796298188;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YDSYkda+euRZ+d/tmdcYSlHlkVIR0m1owt359Q4GSDA=;
        b=OgZFdZ4XBSEjr2g17Lp3JF6KmuQA0Df0gqZlxjRi4ikKwVszIqiLuL1aLxbddetSVh
         VWgD12mtRtqSCwGdnc3c9kW4JhVfoiBSx7IAGXjTZfNbhJSvcoAPYdwV5r7LVC1+8hoE
         RRDMSIX6eDfvL3vpXlu9aYhLbttOB9pvXfUWuHuGYRIwrUsYw28FconY+hXopsBOvVMf
         t6EyAkOQI6iLxx4RTI7n9gYaH1IDA4sOr2UTjL6HfNtV0oO3MjoGgWCUxCvxhQydiZO5
         tJDmy0eRUei8M8iVeI/fPKHe20Widlg+X3AcDl50x/wv9kjnv6bqIb00WoM9vupCWMkn
         htNw==
X-Forwarded-Encrypted: i=1; AL+hErEUXO0+utoiU5y78WpsHK4UxeP4X2xjFuk8IbvyFDg0yoYPSNHVbEkQZLuxugARaQWbSsDGdcLYvg46Yy8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FAuD2/2z6+uD7El+tC6aQwLbebCNuqB3HuVDGMDFzmS/5FFKL
	QKPo4KtjhjO2BYuJklnl8f4wNRI4fSXwFKCZgUDJh4tOPiePJj7998HZl3me2+3YbJCSCNiNNLJ
	ud8/LszmCRh48yJd4i595Nx1joxL0Uy0zSQi3xQ6AQfxkEWX77FC9UuCrt+Lnz6u1bHo=
X-Gm-Gg: AZFdTZd63Ydh5Q7RGGJ5ahrVDR8qZduwTUioWTKky1w8l95mvBiuAD66gGGR5ICEDbf
	OL+nIUth1cWJ66B3hQgY/kCJbfrW0BxikX7KXvXMWBrtk0ZuakjGakC916A7WhdFHjhKBgjif7k
	M4+ZGydrkysiTNB43codbyx047Gk5KCzuvM2LILOx/adqOfXbbay2AIMWVlH9ljesBLNoq02JKj
	YEHsCMcKELN2QhnV3inm/sW+SaCRrjBlSFIfDeEiEJVip+qdboABOUGHBAkQXxZZ3+NKEXMlRIw
	nmKFqaKPMP/G5V6R4ZxLqpOUtlwOlXmEtWWT0IhOyQnkTFwXSrdimhDqF0Rv+P7P+3s79ykhT+k
	pFR0RyjxDYaApmBx/ldDMmFNU7PAKLbFml5NPkCL51wga23jG/rb4BJUBGUmFz5hhb2TEx/E=
X-Received: by 2002:a05:620a:1118:b0:949:95d6:4039 with SMTP id af79cd13be357-949ba9c1d91mr3742101485a.3.1795693387937;
        Thu, 26 Nov 2026 03:43:07 -0800 (PST)
X-Received: by 2002:a05:620a:1118:b0:949:95d6:4039 with SMTP id af79cd13be357-949ba9c1d91mr3742094985a.3.1795693387401;
        Thu, 26 Nov 2026 03:43:07 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae688f8sm769058066b.25.2026.11.26.03.43.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 03:43:06 -0800 (PST)
Message-ID: <91e80164-620f-482d-add6-cda9cb8550c1@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 12:43:05 +0100
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
Subject: Re: [PATCH 1/3] arm64: dts: qcom: qrb2210-arduino-imola: name the QUP
 firmware
To: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261126-agatti-el2-v1-0-4e25fd64f198@oss.qualcomm.com>
 <20261126-agatti-el2-v1-1-4e25fd64f198@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261126-agatti-el2-v1-1-4e25fd64f198@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NSBTYWx0ZWRfX+AGKU+i2q0eH
 lKRCSoZf7aZkkX29fKhCbUyzZt4E3Oao2FqerwlGdhwNEu2PuNUiEhDjaLc384XyUAWsxhErOOA
 A67BUU1DtoCVIjrlqZ+vIkVuHTKTJ17UviBm8MHfyclBlOfShLDOWVzysL27bPQsY/Qm+/3QuB6
 ++6YmVuxe4S8yPiwbl4V9AUwk4Dp8XJoBfwTjlPS/yDkX6IkJgQrzChV2j7j93m0Q1CURgtiBLo
 rceg1a79djEHLKE2CpuSjQrbM0C42IusmcjzLDnngH4+DOMXITWQ0amgDo1w3PpEKmSSfLHJ37v
 raRmAkZeAAKMD3+fgP9uMpbjp+NVjZ1JWrsRVtwDGEUhFDTTEDEqTaueU1mHxvZ9g4SqW7dUHKv
 kuGrlco1GKYW1EhiYlQQTL4ZLDJGQ5CXv1Qku5QJ+331mHs9d4YMEhgNZqZeSgkhJWp6ClE4j6Y
 Vyyi+wdPoyVqGjA4Qtw==
X-Proofpoint-GUID: q5jS3hjiWnrCM-uJad3tNT97u6lreEvE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NSBTYWx0ZWRfX5SlKr0vvMV9L
 NAdj/NpOVf9M9c8+6SHTFufRTji51C2QLGWxBzyQXjOa1CktRdDbyfz1nCgfTBJ+4R6iD0seDgE
 /xbQ8+CEgl12jefu2hDHuMX9ROxn3bk=
X-Proofpoint-ORIG-GUID: q5jS3hjiWnrCM-uJad3tNT97u6lreEvE
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b081b4c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=rtFBXQNc0A1WECV3onsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260045

On 11/26/26 12:36 PM, Igor Opaniuk wrote:
> The geni-se driver loads the QUP firmware into a serial engine that the
> boot firmware has left unprogrammed, but only if the wrapper node names
> the image. Without the name such engines fail to probe:
> 
>   geni_i2c 4a80000.i2c: Failed to read firmware-name property: -22
> 
> On the UNO Q this happens for every I2C, SPI and UART controller except
> the console when the board boots TF-A and OP-TEE instead of QTEE.
> 
> Name the firmware: qupv3fw.elf from the QRB2210 boot binaries release,
> the image the stock boot chain loads from the qupfw partition. Engines
> that are already programmed are not touched.
> 
> Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
