Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781535;
	b=qlNGV9yvtWIeYwcFTawwDnvz/7eba+7tgxnP6qvQniPlkaizp+HNEaGT0adDR6WAsklz
	 LD6Tf1oifymM9hWDz/NTN1xVdZHdmI6ohDFGDuFGUzlN6hJqq4OZPDUpW5jM3q2aM2HDV
	 LFCPJpOmn/NZLzIe6H9WLM4zorBZioaytYcSNnEaoJiilg/57Fyr2vLS54q9BTz/DOGSO
	 d+YCIs78oiUfCH53V6ISOvsXm9J/GCOsAQruHBS1yz1QR4alSm/U7epzaKTtmcsYCn0sB
	 pyzosmk6TzYj0vZc+Cl/bTewy+brLl3Kwxn0yTNOOBJ/NJwSGy84xuTvBjKNVEknc+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781535;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JvrLVqvUYcg3weAzaVq9EsFMSELgwJlALoJuS2RMcms=;
	b=35pktxrVzVmlLwZlZ1KTdqe/Rl7A9fERuYmAm+ej+pozMwhmpmIxNueViIS1P9vkhFvV
	 64lRj2nVzQkOnOFhAi2URiIl73ychmjvjfZrrXoHu6GCwYwHMMwGMzS3KUa15waPx3SpK
	 yNK8gpIpPSe/89v+klW02NsJWgr3TNxKSWKSYrs5k7Q+1TcbzvHinXyOidrOJJ2DLYsqP
	 emDfwl5/Ur2qoei5pgB+FWPj6bPLWjph5oZw5VXu4hU/8Si8AtfXgwMiYH691V0Svuqys
	 jLAvWfR3O5Mv3D/bIJBKx3WheEVkcTfOd6UJ4XGqM6Z6M7mdyqt5J8btSkuPKyQ5byw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O1pFbnPK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xx1ux0y6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C44606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:12:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86C44606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O1pFbnPK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xx1ux0y6
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARAp8i71047199
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:12:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JvrLVqvUYcg3weAzaVq9EsFMSELgwJlALoJuS2RMcms=; b=O1pFbnPKMw/99LPC
	VHlQ0iWwfS95+FHu6vdLLSlwCMqWLq/38ZcVeDFXEvf+CXayhW1YysxmL6dCSZHV
	k01JzIgUUUSj1PFnGlgwDVU4KHwQd9xAXMBLQX+P2qUvrGguRQ47RaFl6eBOvHD/
	x17ZkkKR2Vr0RPYthuEPe4BZZ56KhVBK4yChFnAOxwCMEh2D4b2ALvYiDZ1+gT7c
	LkC0yEbz3lX0Xpu2D3EM4RARb781XfuEmQ9N3oFMV+VHHIWdqKe6H4+r5Xww4bnO
	5R7UpcR9gMXYpiWpF2duZwB1QFmSmVaYfqtE2MzneVRPiJhafE8RHJ5rss8sdQ7M
	A/pHhw==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqkvsb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:12:14 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-71ad802f058so215040eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795781534; x=1796386334; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JvrLVqvUYcg3weAzaVq9EsFMSELgwJlALoJuS2RMcms=;
        b=Xx1ux0y6InN5Eylb4qauBKH41UZdZALBt6OrT4Ha9lZNwsBM+Tq21FuDe9WBo2zV9I
         gT6jwn9EYjr1QJyDBWg6a4M+umIwWCjyjXHS48cULG4XkfZ7QM+VmYGpHO4R3pOHzg3B
         HR6KmsrbzgmfwbRF8toR7KoSpQSDU/ZSE66nlmU/nCv3WLf+vXXXYqP1wwaju4NUA4pq
         Gok8V97p2UHr1UtMFYP0Ko8P2FOe+FyFc9M+FR0w323uL8haZT4afK/SpEHp61g3b2B9
         H+Cd6C11uMLHdhwum2vnVFdfhgyPpQgM0HbUzbVH+WLZDG0KFhHpiEguzCdoG6WHb0I0
         xaPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781534; x=1796386334;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JvrLVqvUYcg3weAzaVq9EsFMSELgwJlALoJuS2RMcms=;
        b=PPqiyAUI9l4kSI3BR5yEffb+Bf1XwbzRvoeNVfcBsb6+Ea5qAiGPC7hCGUrwLcUFk0
         FMouv1+1gNCgeOuPlw3337tW9bQjURi4fQcrxQYGX97k+81mWcJWiimSbDh/UgnhsiAn
         gXPiiBd8TA6KlbvBfYRPnJeU2N925fw2xWu8XKvufJw3L9lTI1+I+HG+xiVvZkqM4GNs
         q5nNI1ipsx6Qannhftq6jQyONceaOwjtVO4xSFOFdezGDKaD8mr28N3rmY/1sdx71htL
         MzzClWXPQNR9E9BFW+BG0OXOgWCsf6A7oCPG4YFNUeEB3o6M23a9XMbAl9XvYVz5DJx6
         hISQ==
X-Forwarded-Encrypted: i=1; AL+hErFHKjo7fwVMUa5W02rK8HqW8xlHDdk/AVcKG1bmmO32ooLcCEUq/DrNEr25McmamERORtzGK27OoqEB57I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9ngFQ/yUEuvphl6h9ijEoaUr5XB2qcaHJ4nhuomAgAA3PHpSo
	G07ARYGPM0KvE/Hu7h3kWrV9N1hFRhGEm9WUByBuAvX28n6mKWhd1adtiqZj6t4RySDT8ouQRL7
	gFMSbiPda89pHTTmncXp3yGMhgozNerjjmd7y4/IZveL3MQilMvIzXicScywtwBLSXSo=
X-Gm-Gg: AZFdTZcm3uMLXPwC8keygSzyBl+Rq016DYC91L4aEZxmmakGqWsnueLim17f8v57dwr
	fiIdWWv7+OsB1oIkqk4C3Cp7SMtAcfcAOeCGCRy/jN+42NCvUYtX+IHljtFY/sAC7pK882/fEL/
	opLS1iX8THn7zK85e+V7Zts9hYa0Dncu8MB+d7n0iRR/kcjRY3j7S3+ZyTc3lFIqaM4O1TmQTZs
	QCQeW5ABiTDf3qBA+J8U/DAUQ3aqL1qroYwbep5vNrKS7NEe19T8Mtm7u/XMBO+jolhez7cHp1Y
	H8j9bf/z1cCGl+x/WR7rvgIKitXp4cZf0LqWv6G9uGRjs5Rs1GV5Dgv2VePpjIhUDQNvG/F89PV
	A04pqwJBOC7B6wAL5Yx6H5RcSC9TmLHBaohvDJRAv23AfcY34aA2Ha/t/McTOKXP2uOAXIn8=
X-Received: by 2002:a05:6820:c2c9:10b0:70c:bf79:3e6e with SMTP id 006d021491bc7-71b39033ddbmr23495334eaf.0.1795781533949;
        Fri, 27 Nov 2026 04:12:13 -0800 (PST)
X-Received: by 2002:a05:6820:c2c9:10b0:70c:bf79:3e6e with SMTP id 006d021491bc7-71b39033ddbmr23495294eaf.0.1795781533468;
        Fri, 27 Nov 2026 04:12:13 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afed51asm843067866b.76.2026.11.27.04.12.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:12:12 -0800 (PST)
Message-ID: <dd4e15d2-5037-4610-9a80-5c330f436263@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 13:12:11 +0100
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
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: Add HP OmniBook X 16-cp1
To: Jeff Roach <jeff.roach0@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261114020509.632311-1-jeff.roach0@gmail.com>
 <20261114020509.632311-3-jeff.roach0@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261114020509.632311-3-jeff.roach0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: --iMzND53rEc0qBqK-ugKn7noxwY_H1x
X-Proofpoint-ORIG-GUID: --iMzND53rEc0qBqK-ugKn7noxwY_H1x
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b09739e cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=xy8Gs_GerH8zsfeW4bcA:9 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0OCBTYWx0ZWRfX6aLheX7KgWxq
 08IXoBSTkny+m1rEjM6MI8LNUB/gGFM/u366q7ammJG40AY4N21QHVcsDbMzuO49anR2nXb7gLq
 G/oQ8BmEjqin1MfNNOw1/40FIxOUKDM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0OCBTYWx0ZWRfX2v+4ympGBwzp
 YKDWDIneu9RmHZjYcdUcO+FuFeplxenv2eNz51MTGkVJeK6RaGfa2tV0UssIXNI1lVrnIB7AHsL
 J41P+AXcaGyo+lpMIMNlV20pVEXJ3mwj6BOlnP0A4OHUYIDOKDzjb3aY1Mv8F+ajMr1ELDM+rb/
 A4g1neCsemcHOIi4EKc/KO3cudTXm2Ahdry34pRM8JSmATXd8pd2ci6Sdtyxa9sHf0mMZXsnFkn
 KTGoL47qicbQTa+Y7v8YUSM8lHn19EjgxeyPaOMa31owaEOoaCFdnf/1Sv3zG0prkM0kzxud+W7
 y3GlO0FnK2lro8qd81k8mH3HhhXvrykzrIwlStdw7yZ7/xgy0C41Cyj2TzvpxGAD/BJX39Ny4ng
 9Du/K+vrsD/UaVqJZT+V+VbfkW1rDlik8Uqi5IUb/jQ7lzM0bt9DRiYTXKxALh8BgSJDRFYZwxB
 HienH6Pm0f150dG18LA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270048

On 11/14/26 3:05 AM, Jeff Roach wrote:
> Add a device tree for the HP OmniBook X 16-cp1 laptop, based on the
> Qualcomm Mahua (Snapdragon X2 Elite, 12 cores) SoC.
> 
> Supported and tested:
> - Keyboard, touchpad and touchscreen over I2C HID
> - Lid switch
> - NVMe SSD (PCIe 5)
> - Qualcomm QCC2072 Wi-Fi (PCIe 4, M.2 key E slot)
> - Two USB-C ports with orientation switching, USB PD and battery
>   reporting through pmic-glink
> - USB-A port (usb_2)

[...]

> +&usb_2_qmpphy {
> +	/delete-property/ mode-switch;
> +	/delete-property/ orientation-switch;
> +
> +	status = "okay";
> +
> +	ports {
> +		port@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			/delete-node/ endpoint;
> +
> +			usb_2_qmpphy_out_usb: endpoint@1 {
> +				reg = <1>;
> +
> +				data-lanes = <1 0>;
> +			};
> +		};
> +	};
> +};

Does simply leaving status=okay also work here? I think it should
simply never enter DP mode since there's no altmode notification

Konrad
