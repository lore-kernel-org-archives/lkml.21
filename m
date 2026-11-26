Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795660335;
	b=J793poCiGrdUhl80Bxi38142W9lO46onCXmX4Z9u9vStaAwwi2a4MZbxZFtOQCyWDmId
	 FDsDpp0a/3gAoecWHNOGykbMo3bgPm4606PRQ8ZwC+5fwv7lJA8td6jA/dwaM4N8IwR9q
	 RXZk1DFeUTa6W3QNOZXrZZUf8Ail+mEg/bkzL4cOhCS7oY5RSyLyI0tl9WGxBNSpwwKF7
	 l8sIpZijy57+3pMZT2wIoh1Wr6HYW/Jwnj8GSdpetlKwVfOswFcrnCk8Cvettl1kAHBAF
	 1SdnkciN0YYPS+CAqh02JbTp+oTXLTsQNxIqq1TX4ZxkPAGxmNk69XPabkMKsbxC2lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795660335;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MQ1iBvVrMMpIWy460OOriq542kT+Ih2W70vOTyo6HdE=;
	b=HDgtmW0vStdF3wWqHDBTKDShd2x8dJghVrjFILNUQEu7BsKDaDjh3TnlW/s612VuAZbi
	 fEDLwISHmzhqNFZm6QrPdIViOLBJmckbHHfwWfMzEF8bWlWbyP7uO8aIfBpRLs2xR0gd2
	 QwOyVVHJuO0J4uUoykIgQr3cmj4IhYI3c9B5oUOMmJ8XxKR8HPX/bCB9kGGQ7Vrk4DRNx
	 i69sOy9YYT6vo1uYHG53YDvQ0vtbR4+1NjAWtw4CpFe+PTfxBVniJUTUJiX0DAeUZPorL
	 R1EggmEnQohJK3gzjRyaTzZ7x75auAGMH2DXFaD3MGEFRJQFj2RPSVcglH4DhYWdm0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WfoWGa1S;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fmpriTNG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41FB606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A41FB606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WfoWGa1S;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fmpriTNG
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APKQeEc848296
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:32:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MQ1iBvVrMMpIWy460OOriq542kT+Ih2W70vOTyo6HdE=; b=WfoWGa1Sw1GOI+hC
	/OSurM9Nx3Asa/NFMQzIld1qGMqXtwTO1Ie+/LNl+oZKTZhW4crNOLM36shmCzP4
	U2yiq+itKTY5YG6Dt7FlWA4hZ6exYClmrloeqCgyDqOj58iiIHhP5rCIyPXrWo1X
	3o9T0PfABWUNnSp9pfEfM1l++97bsrCRBXw5jNvqjXGCXZPVAIf9sQdLN/oLMe4j
	VoZx0QR3YTcwBOfk54I6FjQ0LiiK+M759XFcARvzGa/mF7xcoHhI8wB/h8Ul+Lkr
	E+MZ4/9jfFi6SJ8gwJWCB3pzTkNpOvwd7iVXDazcPskXpULhD41CAp0uxaVsBvWN
	BXDbAA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j66qf8wpe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:32:13 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9210ad74fdeso111832526d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795660332; x=1796265132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MQ1iBvVrMMpIWy460OOriq542kT+Ih2W70vOTyo6HdE=;
        b=fmpriTNGu7wJbjqw+78BabtcKRmoMeNKNh8AiMDD/1DlB3xHs1ZvM3ImKtWly+3aW5
         BJ6i/IEpiI6nCVcuG37Ay7/naMqeFF9H+Lq733I+qlHfHTTYkTAeDrILlvvClZiEsSTP
         EFQNVyfCGjSeK7YxAxQLQBzhzj/5WeLC6KcnitnM9Qd0gIqIk+ucTCLiLR9vM4MMBdgK
         mg1z4c9Dsq9r+IEbdCBTnPUCg1/RXGK0FtZOHkKqcL2hHDB2PqztXHt6gAm9f4JbJymd
         ajcIpTgGekXgKjdri97lecbb7O37qjyXXoE5UNY2cmha635jtpfzMT3Z5/TsxXWpMJyl
         2jiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795660332; x=1796265132;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MQ1iBvVrMMpIWy460OOriq542kT+Ih2W70vOTyo6HdE=;
        b=zeXdhJWKxK3cDEObJW6YFtrTunMBRqqCZQQKewhbEne25oICNK/OprwMeaV0jHEQJs
         UrOgpVUvM8OuWY5VF+7SAVlmWqGayG8FJ2c2Ol2YHfqQ7VavCtD7apHEEGTRwWBPPu1a
         3SryOh+5Ba9nruEy8iTps720fzbLrRYcSsuqTecRsrluUKUSuzhz2BaoFODaVQnLHJ9c
         Ru2joDu1lnDPitoejQz9judLqJylFTr8Tyd+R3xn8Zl76caYhLWJfJPkqCxeYknY3U6P
         jCsGRcHjSQ7DsrD1bf6AnZB2ShZr/vCdwx9dm0U5bjRXqpokRTAERRRhjmmeyP5PtTnn
         PLYQ==
X-Forwarded-Encrypted: i=1; AL+hErFkrpw1ZpEHyV59Z4uCoseQWwqGBVNYaWl1rVFOx329aogobyPMQUGxoKs7uwnAOfsV3DAFERyxX7xHeY8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/C2AHWImpOqDD2ONwfHC5MhXD15gHBc0LJKC2TaZAP3CgzvS+2
	re1FQZuilRtYjxTBEmzilDMTKOHCV8gxLKsCebgbk6rtnguDOnM9U6WHjf/IdUNYLGEspUn0MNr
	cXOR0N2YjG690wGSQVG+u1CBfu9wthw5QVR7Hx9HLUO9WSQ/RBIYRzefbk05tgOMy9dk=
X-Gm-Gg: AZFdTZc+SSpujLBsrJdXRcs2FY/vfz5obpseqE+o7FM/0PneUCqBXLVQhvLJ9xD11S1
	yE3ndIRJCuyc33tEbvkrf9hSN4Twh/y5usAtdIY2/8tWBQyTgUsi3LPofyBnrEVzhUKztdKmtBv
	3nemcA4pm4ElPFGxuVhiZwC1yDQIuytDVKV7rfZ7QEGeim1tx8sabKxN3LhS9NkeW+QA+BYps3O
	9Zg/WMMX+ErNtVPwLbxyR42YO8FAagbN3FzWQJno/P5v0wt5JpZXGkiccvrQRIfWW/JeQrfr5J7
	OE+KwA8OAVXhmfuq+YgPSqQsZPQmuzpMrsQ2/jO+Nim/G6a2UViBZvsGh9v7V/ali6UxqYNyCoy
	wJ70Qmwx67+XfRVkSuWXe6RXrAgGelENQLcweVJeodBPBYM+KUyTuHBSH+4Ca7jzBvDh6N9Dn1q
	a9+OO5+GhQ+9s+/VZFJSSl/J0Nv5AMbdrwPDA=
X-Received: by 2002:a05:6214:3f89:b0:921:3c14:a08e with SMTP id 6a1803df08f44-9213c14c1cbmr332066216d6.15.1795660331815;
        Wed, 25 Nov 2026 18:32:11 -0800 (PST)
X-Received: by 2002:a05:6214:3f89:b0:921:3c14:a08e with SMTP id 6a1803df08f44-9213c14c1cbmr332065816d6.15.1795660331250;
        Wed, 25 Nov 2026 18:32:11 -0800 (PST)
Received: from [10.38.247.193] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9213479655asm178017406d6.4.2026.11.25.18.32.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 18:32:10 -0800 (PST)
Message-ID: <86390ae2-8c33-443b-9730-ebaf4db1b968@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 10:32:02 +0800
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
Subject: Re: [PATCH v7 23/23] arm64: dts: qcom: eliza-evk-imx577-camera: Add
 DT overlay
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
 <20261114-add-support-for-camss-on-sm8750-v7-23-8ff2a11835f6@oss.qualcomm.com>
 <38bdcad3-2c2f-4e55-9a3e-17047b9f486f@linaro.org>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <38bdcad3-2c2f-4e55-9a3e-17047b9f486f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: katbMMmb9qD1D3WTtD4Fj59Q-1e7z2Pb
X-Proofpoint-GUID: katbMMmb9qD1D3WTtD4Fj59Q-1e7z2Pb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAwOCBTYWx0ZWRfXxRf3/IKiUCPG
 NB8dJE9AZ4kt3JZpILXeOC5GhFnuPJIK0Z7peBSZQJTSWRUNhDMBdr+VJuFCc1VEkkP6nFOlPKG
 XBSAULElBmNAQ9IUNVMMniuMhkyPYao=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAwOCBTYWx0ZWRfX4mP2UN18nqNn
 4px1y0jbrmgHFoDzTKYcWc0+YgQpN4lP/mEsiJkIR5Ng7hq1BYJ+nLUaM3PaXExCDXyvdUsFiTp
 FFMBsZUA1Nzb3T1PPTOhU7Kkq5P86WKejJ9h8LxbW/jZfYiXikmqIefxH6UtLY3KPFf1YEyURqK
 Q/93VRDh5OA+PUZ9ybgJS7UqFZ3eeEMyQ1JupSG6jsqecMexWM0Isuu3pwHinKbPJw0j7bYJolR
 6DTAwsYnxo5e+K+LeeN64FpaPDmSy+StDsVD+1yvjHoI6HvRrreIKCtn+UozQfFOjbas3q434wA
 ePYTCUpbyXEEkQI/Ts59aTJq+b7TAGl8MfwwCj/i3ogro3eVJycZDGy7cNwcfrlyBwpqNr/F9MR
 pi4LG641kTBqcV+UoEz688vet749iyTBo9o35kACtHx2AhnbmLjAY+IX3wxfE6xcsX0qcClSv3D
 C+ZLRqq0gjYlNaPvsfQ==
X-Authority-Analysis: v=2.4 cv=Q5VHcI2a c=1 sm=1 tr=0 ts=6b079a2d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=cvRs29UJe7UXO2q9YXUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260008



On 11/25/2026 9:25 PM, Vladimir Zapolskiy wrote:
> On 11/14/26 13:29, Wenmeng Liu wrote:
>> Add an overlay for optional IMX577 integration on the Eliza CQS EVK,
>> shared by the eMMC and UFS variants. The sensor is on CCI0 I2C bus 0,
>> uses MCLK0 with its reset on GPIO8 and connects to CSIPHY0 over CSI-2.
>> The overlay enables CAMSS, CSIPHY0 and CCI0.
>>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile                  |  4 +
>>   .../boot/dts/qcom/eliza-evk-imx577-camera.dtso     | 85 ++++++++++++ 
>> ++++++++++
>>   2 files changed, 89 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/ 
>> qcom/Makefile
>> index 
>> 64d2cfdb89c89f1c6eb0085e2bf5877ff980dbc4..a9374c54dd514f53b7aa97f5581c99cb6e75697d 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -16,6 +16,10 @@ dtb-$(CONFIG_ARCH_QCOM)    += apq8096sg-db820c.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += apq8096-ifc6640.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += eliza-cqs-evk-emmc.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += eliza-cqs-evk-ufs.dtb
>> +eliza-cqs-evk-emmc-imx577-camera-dtbs := eliza-cqs-evk-emmc.dtb 
>> eliza-evk-imx577-camera.dtbo
>> +eliza-cqs-evk-ufs-imx577-camera-dtbs := eliza-cqs-evk-ufs.dtb eliza- 
>> evk-imx577-camera.dtbo
>> +dtb-$(CONFIG_ARCH_QCOM)    += eliza-cqs-evk-emmc-imx577-camera.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)    += eliza-cqs-evk-ufs-imx577-camera.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += eliza-mtp.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += glymur-asus-zenbook-a14-ux3407na.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)    += glymur-asus-zenbook-a16-ux3607oa.dtb
>> diff --git a/arch/arm64/boot/dts/qcom/eliza-evk-imx577-camera.dtso b/ 
>> arch/arm64/boot/dts/qcom/eliza-evk-imx577-camera.dtso
>> new file mode 100644
>> index 
>> 0000000000000000000000000000000000000000..08f2e3c62dbdaf23a2f6ca69a5c392054cb1c225
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/eliza-evk-imx577-camera.dtso
>> @@ -0,0 +1,85 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +#include <dt-bindings/clock/qcom,eliza-cambistmclkcc.h>
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/media/video-interfaces.h>
>> +
>> +&camss {
>> +    status = "okay";
>> +};
>> +
>> +&camss_csiphy0_in_port {
>> +    camss_csiphy0_inep: endpoint {
>> +        data-lanes = <1 2 3 4>;
>> +        remote-endpoint = <&csiphy0_out_ep>;
>> +    };
>> +};
>> +
>> +&cci0 {
>> +    status = "okay";
>> +};
>> +
>> +&cci0_i2c0 {
>> +    #address-cells = <1>;
>> +    #size-cells = <0>;
>> +
>> +    camera@1a {
>> +        compatible = "sony,imx577";
>> +        reg = <0x1a>;
>> +
>> +        reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
>> +        pinctrl-0 = <&cam_mclk0_default &cam0_reset_default>;
>> +        pinctrl-names = "default";
>> +
>> +        clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK0_CLK>;
>> +        assigned-clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK0_CLK>;
>> +        assigned-clock-rates = <24000000>;
>> +
>> +        dovdd-supply = <&vreg_l7b>;
>> +
>> +        port {
>> +            imx577_out_ep: endpoint {
>> +                data-lanes = <1 2 3 4>;
>> +                link-frequencies = /bits/ 64 <600000000>;
>> +                remote-endpoint = <&csiphy0_in_ep>;
>> +            };
>> +        };
>> +    };
>> +};
>> +
>> +&csiphy0 {
>> +    vdda-0p9-supply = <&vreg_l2b>;
>> +    vdda-1p2-supply = <&vreg_l4b>;
>> +
>> +    status = "okay";
>> +};
>> +
>> +&csiphy0_in_port {
>> +    csiphy0_in_ep: endpoint {
>> +        bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
>> +        clock-lanes = <0>;
> 
> Here 'clock-lanes' should be dropped, it shall be implied, and I belive
> it is.
> 

You're right, I'll drop it in next version.

Thanks,
Wenmeng

>> +        data-lanes = <1 2 3 4>;
>> +        remote-endpoint = <&imx577_out_ep>;
>> +    };
>> +};
>> +
>> +&csiphy0_out_port {
>> +    csiphy0_out_ep: endpoint {
>> +        remote-endpoint = <&camss_csiphy0_inep>;
>> +    };
>> +};
>> +
>> +&tlmm {
>> +    cam0_reset_default: cam0-reset-default-state {
>> +        pins = "gpio8";
>> +        function = "gpio";
>> +        drive-strength = <2>;
>> +        bias-disable;
>> +    };
>> +};
>>
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> 

