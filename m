Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704822;
	b=kRyvbhXvzfxzgEIel6nhcOKjDxuLlJjTmB0/cxQjLBsGnYhOiomSg/W8aouhisrTvLiG
	 MiP4hlDEfzmUssQXlS7rhjIF3nqYLLWa1NH9yxirJsomtF4ssxGrB3Jmu7Hyq1sFF6Xkj
	 vlo9VCwGIjDCPA6yWJt12Y+RCuAUSV5UizA47NL4VIsppDB662j3O0HPczSMBqhMxiGdp
	 +KW+9HRWRXhzFak8SCeTHgY/IcINqDXFMVZnmOHiriZvZf3TkWpqUko2neFBujSjCvq4E
	 0Wzq7AW4Ls+rBo7EU5mbA3q7b3arqkcW0mAAvTBUalM5PSQjjLK3Shl49nl5Fld7EDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704822;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=j4n1NUzTrR0kbh0+4tBojJyhHvX90zNprLFQQ4sMfGc=;
	b=E9M14BSHqHFPe5ngOGwZI6RSUzF9kFZMqkAyEzu0ibptTP+WVFCqGrgQC/SpdQwsTWCE
	 jM1SlKW9eTxrIyxS4t0J794cakGiSGLmVkY1MuyD+e3yIPiZoXIh/7sDzViQXv0IxZFiv
	 ADVFNfmNM3iofy8d3GuDUy3/H0U1sUyirm3XIPWH3QLzgFMCHTP2wYp4UHcsRpXOUk6fW
	 nIsxnKPByGYd8ZWIEglljH6+Um5K5bRz+sRoVjc4OnrDwB+/1fl7xoPXs6BeDN2zxv7QP
	 NVSbRlhM3gzgn+cJVIDvbzlbvp7Z4A6nMomMFDneSw1UKNIecPBI5t6oBjDFyoVeG+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xx8mmWzf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=io4YrVAm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FA1606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:53:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80FA1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xx8mmWzf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=io4YrVAm
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEVot03299108
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:53:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j4n1NUzTrR0kbh0+4tBojJyhHvX90zNprLFQQ4sMfGc=; b=Xx8mmWzfbaRK+Fjk
	gtVUnKXeR9o7esS4N1jJupBCvvPxykRHJXr1YXnlAFPHyBQCtoVAmtID8RV0CNCs
	QoPpPT0EuDvyDbzSuwvGCiOYjYP13x7yzXG1QaGPZmPK4pae5LtE2WhODL4iob49
	G2os4P+Q/Ax+zK8NYOL/rpTfffAqXk/tIHzV37MnmImA2noPTrBuU3yI9JY7zjiD
	9055+oErjq7qXfpUHOfKQ1iwb4m41IXgQhFnFTxE7gDD5kfos0FZvsbDDLgLxmUz
	gIVcnOLcKV6OcQL8H9sF+O24KhcDNhPtOy7RTPS3Fd1csDbS40zJC6C8er8Kn92n
	f5v+Gg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ak02qf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:53:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-945e8a244bfso79380985a.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795704820; x=1796309620; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j4n1NUzTrR0kbh0+4tBojJyhHvX90zNprLFQQ4sMfGc=;
        b=io4YrVAmElPYsFPhmR31kQJ8WLLKNXJSvkJr17We+WQ6y3SjMz44nqD97P4G1hRdqH
         3cWXWwX64GR7Qn2uaaxWWGcmfqwHskG5o/bcaABDtb5SN+isb3bX9/Lr8rcZXRr0cat6
         Lfc3cpFBpLLSLVU4NXrDOR+WD/tBATzZoTLezqqU1A0qE0uX8p/rC1M/avLlwU6u7kyb
         vmA0Mi2+fUt2jSHDd5B/h+9vUV400Vjcr9ZQUZkmZ6a5WitSbncAHEWi4hSH18NF5HLo
         zVUT/d/8xJnMCm3pQE2ev1J5w2u2GbekAFAdENA43NtMWOklId3ZhPuEwo+7IeHLol12
         c6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704820; x=1796309620;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j4n1NUzTrR0kbh0+4tBojJyhHvX90zNprLFQQ4sMfGc=;
        b=R6SKMMJhVOWhc3+bOV5FOotKtOtC3zXJTTkamYlZez8LEHUMH4iN5ZAkuOcckPywl4
         8nATHVoZjyWvHiKdrm0d0IZQhgvXxsXqeUv/aj3MGeOZNBPK/FykAxPihPhltrfq293e
         N1jxJYisJsAquSJQbizdXs4ozYxEjotFO7NP23PTvWmrI/zkVALOv9H4mdHarbfnLOHM
         0KtLUHB0X07F8rb45LiZBPLJWOhJjZ9x7CkzKvYelhTKAwUBU8z9i7kvpMVea5Y0O14e
         09Say4TDz7HXTsH7Kij+j1uckCkxpraJ6d/onnieaxZCS9fPb21tYDu+AX0F4lC24CSu
         8z3A==
X-Forwarded-Encrypted: i=1; AL+hErHB2/2zVsZ5AWOq4XnAnOu2Dc3uYM44Dz0p3itTavgwZrq5zTJwhsGbOIXzMNwRV/zBw+9xQBtbkJR27ac=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IsatfcnIz80AbmP4Lw0f/E6g7Yp7R5mm/lwYyqeZ9kH2aXjfi
	Bnx6kM5gMAEKEvmR4D3pP2UPu1WqsUNEAOHQycZZ4IK+yKwByON4UCziJTZDAnHq3/cj0kTOfh5
	YT8PASf3mmD/Yn+odIrGffCrgRP0KAbhSttLv/eU2pOkPkIdYhPbWQKqabrs0ZA8/YnE=
X-Gm-Gg: AZFdTZcvn3p/MGeXAlzIMlU2Gqe9UZt1xBqcIwVSyZVa2thYWMxM/k8A9mB1Q8hK4tn
	O1pvmX3ERAmRo3Lkcwg6IATsK9qFUIWq7iK3K+TS+NbGsatow2qo/f9yR/1Xj52+/6fjSVVA6BN
	SYGUF+oUO9zs91NPJRH1GzhPhAEghJONKNDVCAXEKiyrDaxpT96w4JjscXyaZg0kRm/V1xh+3Ge
	/954XCIM17ZB9ZkS06KD4eDc+2ETMGRiq5exu2lpoH3Z+PJCW+2K0WCa/yo1vrH7zUPMN929pF+
	mq0ZckK0x+rF36UZd41YYNLJSLLGyptR1rIEeePGkPBu/Qy+TsXYccyqBjNv1dHgklzeGdrVADI
	gWSc3lEnc2RuWeQ5xqLDTGSapl5P5eCHKI02YS/1S/Ikt4gZ7ieGiH3g2CRzThAulQrLbNjk=
X-Received: by 2002:a05:620a:a801:b0:949:a385:d30e with SMTP id af79cd13be357-949baa12795mr3838087485a.4.1795704819932;
        Thu, 26 Nov 2026 06:53:39 -0800 (PST)
X-Received: by 2002:a05:620a:a801:b0:949:a385:d30e with SMTP id af79cd13be357-949baa12795mr3838084685a.4.1795704819513;
        Thu, 26 Nov 2026 06:53:39 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb1d03f9e5sm2794700a12.24.2026.11.26.06.53.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:53:38 -0800 (PST)
Message-ID: <130d0531-a131-43d9-87ff-5c6f069efd80@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:53:36 +0100
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
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm8550-samsung-gts9wifi: Add
 battery fuel gauge
To: nacht@dxdmail.cc, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261119-b4-gts9wifi-followups-v1-0-2e2388589a62@dxdmail.cc>
 <20261119-b4-gts9wifi-followups-v1-6-2e2388589a62@dxdmail.cc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261119-b4-gts9wifi-followups-v1-6-2e2388589a62@dxdmail.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6b0847f4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Qe4jBd7IcWueaIHj7iYA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: v1vKe-J-Mt9H9P18p_GfCTSg466GZu1V
X-Proofpoint-GUID: v1vKe-J-Mt9H9P18p_GfCTSg466GZu1V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX/+NVqdWVBure
 1UylpkZgLoWxNGMUPOkoq8yu6A8JIcxInKwQ0xFIASrLzHN6sW7St4PavpgDP2uJCuySlBNDEyD
 oNtGhRW/EjEImtrv63okvVmd/Lf59tpeotXPV8Kuibwa6q5uHxdY7nXCyYK+kxFBV55dVC/XhM4
 AxM+yBglsRIhj+kKHCner1noFCJ0+XeGN+BWhFfBcAlVgQAEnkBYyk12vCo9lNUwPQ9cmq6VUeX
 kFhTRqWdXROrwckLlf2bIJ2TkZW/HFE7/5Y//aLh3UDNqST+jASYGDvbgu3+eFLXVRZMzGA4NoF
 V3SCsNpMOGkjyjSeAburGwNqf4HWK6tkMoyFgtU1y+Pk3wvnOXi5PpBYh5vWUF+Q3lkfgXoU46m
 oqWt3iWYQqXBOFJCpbsgyIpfIjsG8sn0KZf1nb/bxBvA9N2Gx6k2Wdc8c+Pbh0rFVw4z+sGR1iB
 av5zt3gNX3DwAGTjBoA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX7JRdS/uFpBm8
 RpdLyYfUErTEhM5Lp9mMWQTy/3XZnqQYJzeSTsx0pJc+IsJrH/W9DgcdUlKP6e34m5BcnE4ML/r
 qx+t7vigN5KKKv9/e9we8ajN1C1mxRg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260058

On 11/19/26 11:40 PM, Nizat Mikayilli via B4 Relay wrote:
> From: Nizat Mikayilli <nacht@dxdmail.cc>
> 
> Describe the Silicon Mitus SM5714 fuel gauge on I2C hub 8 and the
> built-in 8400 mAh battery it monitors.
> 
> Signed-off-by: Nizat Mikayilli <nacht@dxdmail.cc>
> ---
>  arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts b/arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts
> index 8323eb837710..511bdd05d49b 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts
> @@ -31,6 +31,12 @@ aliases {
>  		serial1 = &uart14;
>  	};
>  
> +	battery: battery {
> +		compatible = "simple-battery";
> +		device-chemistry = "lithium-ion";
> +		charge-full-design-microamp-hours = <8400000>;

This binding:

Documentation/devicetree/bindings/power/supply/battery.yaml

accepts a million properties. Does your downstream tree give you
data for any of them?

Konrad
