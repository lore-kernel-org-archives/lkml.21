Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795602833;
	b=bpJMZxswey3PeSogQtMEvfJqFQtmr0QVia4yPsLaUihEFazJ2PBYCo7Auf5OGwMC/40g
	 vfHSPYD362bNMkDm4iSf2FjZFYhWHRbgGErz04R21wOvIubn3QKG7zy3mH1lYP4nYWuuo
	 Q3qvexL9ecJ3/XemS1oWG+yl/hwiQ8AzmAHDuoFidlfOazzWyRhGViOB0ZpJc0iySYhSP
	 1zaDmtHVkFlCzR1BKSJIa1ih7YzB8puMgad0d2dZBn9QAOQdF6wj6LTTkAEKLOo6zTc+q
	 E5cuYqxLirdP9cgmarGuwaStiyQRCEXMW8uK+591SMmwl6xQWueG1ugPartw/9XzrTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602833;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=t5YTXasqnbB2xHdsrAa2S2NlKmSeJxLC6xnSplAPAUs=;
	b=yCV8dsAX47f9n7sMwdEeJBRaXBWtJvo3ghoeHqkJ7rziRZ1eBAptNZUd+bI5RXlInoWI
	 QkqcV/SMgnHg5/QuJbcxtg7FyPhELLoHs6NpPQbcCw4AHQNxTLjwFCRgZ9wglqD3R9MAO
	 KlQAvtg64U51ABMaKn/Damjkth6MtVjYocnRDXLGjAjnBwHfm62q4v/9Hi8yeuX4AEl7t
	 6dtX4LvPUMQqI3Y18/mgmACrs58UL26Z1/SZhgyxdB94IAkOs/jop0ilPQBCGVrQCr001
	 2oAxMqRm4h5BdbiQoMZ7F6+59SL6Og3nTDoWCqTQQup6CMLYuB8R69P36BG4Dvj5G1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g1jkhZIa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RaKf96Gr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC1B606A329
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:33:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FC1B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g1jkhZIa;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RaKf96Gr
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9vMNL138184
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:33:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t5YTXasqnbB2xHdsrAa2S2NlKmSeJxLC6xnSplAPAUs=; b=g1jkhZIayrjzYxTj
	uUBCN5a/x+W2VAyWny9Xm7cCzFFqQNiQpJ4CFS6NtKtumxvjuhMrm+y1eiktdRf5
	o2MlhaQAlF813ddB1/efHervQUd/jA9kj+SVq9ZAK5puN9Yp6M/G3pdXzMILDVUC
	MgEPRlyZrMpFP3qV7n0mvkzgAo+NkJFjH+l+ygH18hIGU4kPxS4i13SAwTWBjphk
	KgvWc7W8ofJbN7EboJCKUmJTfrnRrdFZHuRyxK3PNbzvGJOXxjpW+bwt+0yw2bNU
	CvMfNamR9lCjwRYqAp4X46/uVC8JEH28eNIDuwmO5dhRyn6FSRM+AP0mhsq0Q8vY
	IHz4Eg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5cxkccgq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:33:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-550b1b21674so12548961cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795602831; x=1796207631; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t5YTXasqnbB2xHdsrAa2S2NlKmSeJxLC6xnSplAPAUs=;
        b=RaKf96GrG6zG88VXlSI/sleEgjHzkgXkHYjLCw/XlKaQJfB0xDKTAiWD97axAeDlgn
         Nsfar/VVWh7/mCzZRp5aFY8u75JBRBX9+uSyDy0bF2VY7WplYRi8kBviGDrKCjgpZmd4
         8RyeK66n6pP7w1Vm7eNDEcGjkcJXeRtWSdrMRIAvAr8yKTwG/7r2uz/CoL0eb5vMYGPl
         ujXLPV02G7VKHdIl5nirZLLPMuaJEirM2rzs6/ScNU7ZibMXaDhtCjLYk4y/Rz+w3exJ
         Jz2JzJPrgaNb/ZhfVnUbfFebKLl7NBKeIMr1qHGc32dShdw5ttQPcG7HwoDkfVe0nwZX
         mdwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795602831; x=1796207631;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t5YTXasqnbB2xHdsrAa2S2NlKmSeJxLC6xnSplAPAUs=;
        b=lUpzuU28ROqa4ghfBQSv0ufE1o0K/NlPNgTzgCWTA3DG0wGf9Z32u9tcQqiMHr6l6o
         gy6NS4I69CNvR2758BN3EUfIJU0HGh7SZ7E3UgY93277hvN+k17LxDv3cW2xuqqccPk9
         AhFioFEhk1oAY2HLAkBAQeAYyG8kwr5nwpR9QUyAagnFw1cYgoLBdoEQy6P4W/p045lP
         wCxPsEhlESJiyJbDT11wuiL80DR0I5p5lPJYE/YV1JXtNtoIpgBni008fgKiNEblakYi
         /0ffn6/VpTkel3IjtAAKZmJv3qZsllNrRETi9WaJuazx3Lr/7sQhuRd8l8cDpDh1pt8z
         19yw==
X-Forwarded-Encrypted: i=1; AL+hErEou703lUQJ0AeltnZPhm1Y4fdSOOsQ5VGYXWcJWyGfCH6jvN3AH+d9eoDVbcqLIn7npKaYELCRxcs3kzw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wyJWxRdTVw/sBX6t9oIwji/dQF4jYRhGNVhjieZBfHf5X74Mn
	IEXLgtCVZxwIy7Bs0eHyvREuSraA9Oc3A0okWG7AJGIs5Ycdj/Ndh4Rp76iFhEb5YM4O7jSDdsX
	gUutAvaB0g6mSV6T9hBlBPGMJAJjvNF58O6jkH7ov0j1/YVy3PsOi94OzbXG/Cb75VPHaGF69Yj
	I=
X-Gm-Gg: AZFdTZe2DxivARVQMBHiR3jbxVVzgwKudnyxz6yO01yDdBE43ljRAmBmnHGr0F1FCdj
	W9h8mKi9xIwMZgl1nZne1qLEaqO/h/e1IMGFj+FLKDkX4jjRmrXdo00XOHJR/+oMyYE0Tc5aV4b
	8sM4RBZuMkVsWrH7nBnXpeDoMAF+mAoQ+gd8FxTYMzq8VsoevyMQwW/9J9i4LVXu63Dgkmi2cWH
	FU55KWw2tAvvwBUqNUYG+GN8IyN0YQujfmvtc6pC7TAQOjWuD5VhNMXNXPrWbuWspqs0Y1cuKiq
	nVPgqdRpT71b+IDRrdK0ybxd/8678q60AdFLY7SXr+WH3MdoSh7n9utbdYzLBHnDAsznETEhixU
	WRkdbjXHS2BRb/NEaKa8umlLbEtB+bNw69dKFshdhsfcsgPd0qFAZSnfoyquV4bQ6MuPobpo=
X-Received: by 2002:a05:622b:113:20b0:55d:36b1:9291 with SMTP id d75a77b69052e-55d76741cf4mr301145971cf.0.1795602831396;
        Wed, 25 Nov 2026 02:33:51 -0800 (PST)
X-Received: by 2002:a05:622b:113:20b0:55d:36b1:9291 with SMTP id d75a77b69052e-55d76741cf4mr301145681cf.0.1795602830983;
        Wed, 25 Nov 2026 02:33:50 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e8ad0sm7990385a12.18.2026.11.25.02.33.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:33:50 -0800 (PST)
Message-ID: <25ba0a24-85e8-4aa2-a2a0-23c64729fd70@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:33:46 +0100
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
Subject: Re: [PATCH 4/4] arm64: dts: qcom: glymur: Describe the PCIe thermal
 inputs
To: manivannan.sadhasivam@oss.qualcomm.com,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261125-glymur-thermal-fix-v1-0-b93a9feae156@oss.qualcomm.com>
 <20261125-glymur-thermal-fix-v1-4-b93a9feae156@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261125-glymur-thermal-fix-v1-4-b93a9feae156@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MSBTYWx0ZWRfX0S+/p38cmYMF
 FhxaxNZoyoKO3DYCz+OSxvIKZHQOgKYdy6nl8XTvU3ytYpd8c04FTGMuntX5SXK61hySrH8TAzh
 CMi/SQXRbnjL821mDCO0ecry39JVOgPhRDOIurEEUDkV28kO4LYeKNbn4Cmr5jquaRiV8KhZ7lv
 irY3kXS5xYKoqf+RoL2SwufW2ymkDo9Ybd7HMUHOaxDQ2QqCRkPrLeaKS4Bgs3MJnlT+3I+/Ax1
 wNep1ImDDoE5amps61TwyEtAHbs34w/UwVtTZTzT7qR7Xx4pjPQsjnoodM91d4EsEoahL1vTp4Z
 97LS5Xrc6NajHsJiqvxYwO2XbBFtg+sIM1KWjrGHZ1pYjtNUFkdzEoAagGjs+lFwi/PmDLmdHDi
 kniVbrOA98xXR1WIBFUApRycyak9xy8KPjg1xNf/IRxsM078IDhqs2MYRaHGVtTWrCQhmQMEmNp
 Xm+xCXxr3yXdo5ZJy8A==
X-Proofpoint-GUID: Ksun5FS90rhgBPRcC1fKjyUNcB6ihR_s
X-Proofpoint-ORIG-GUID: Ksun5FS90rhgBPRcC1fKjyUNcB6ihR_s
X-Authority-Analysis: v=2.4 cv=TLbQ2Fla c=1 sm=1 tr=0 ts=6b06b990 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=TtJGJgRM3qr-9yLlEbAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MSBTYWx0ZWRfX7yDVGT5D3iJ8
 sX/SI2U8KIfXzt7o77nvM5ZRBv5cmNQnLYEDVWO3F/p3vlyk6rDOAV1Vvmo8DO/dlyxJEXr8tx9
 +0IW4OXeqaazLp9u4vaysD9nd9iqFGU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250041

On 11/25/26 11:17 AM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> Some PCIe PHY instances on Glymur benefit from periodic recalibration to
> compensate for temperature-related drift and maintain stable link
> operation. The controller driver triggers the recalibration with a link
> speed switch once the temperature change on a polled sensor exceeds the
> defined threshold, but for that it needs to know which sensors track the
> PHY temperature and the drift temperature.
> 
> So add a property to identify the relevant temperature sensors,
> 'qcom,pcie-recalibration-thermal-zones', to PCIe domain 5 pointing at the
> aoss-6 zone and to PCIe domain 7 pointing at the nsphmx-0 zone, as those
> are the zones whose sensors track the respective PHY temperature. Both
> zones are allowed a drift temperature of 25 degC.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
