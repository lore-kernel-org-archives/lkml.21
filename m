Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011716;
	b=vSkhZ9MQLxda8rR2mOIQFT6MSZLfS8vq1JK+vCvkFQtKHY39hvY9tkJQ8Z+h+u3lwsto
	 4+XsN5RHgnxNITr1k2TDM1Pn2UJk5CJsuhrG6Tf14gGvsNWlfLUpltL5cSRKa/OhEbME2
	 tbo5pJg9qjRS54p5bMYum0nerHrZ6UpOPhXF1A6IHhF/eGr6W8COzpz0ZjkE/hVpZLFhp
	 N9S6I60xQ+Lc6dqJy/PqWfrITzBr0w6ChItsfgRW+bByND+3bFxu6lz0GRu8hLHGvuHmP
	 eVfossy1EH4KI7iorRuP0/C/lrWWyG6KgBw5FGaLdsFfKiEbvyPJx5aosxzX5bBGBkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011716;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zZ/Y0r4m5ztNks5tc+5NW1NNN+6fPRTydaZYwjmldGs=;
	b=PgPHsAODAcEOSVhrwT0hXjCiWS6Uk5plYQ2pLovMtEy6NmIdVu6qw9fqqpcCnzfDdtR0
	 /AiV2W9tMiUJrN8V1zQiBx3CutnhpmXdMmtNW9zP59eW5fImNV/4cPmLHv6Z/KteBDmdF
	 MkrzmluaUsXiA0+IcEiE7/85h2ozwBcrqoGvkjdfS69se4tta2EuCzN+HfYGf4mTcX1vw
	 FNv4KcyKs9YgsVjPS9iEQlABu7UFH5IpKyGeZ5PO1E6q4wwVA2Oxs2GNhaUHqySQDxDNo
	 82zUqVE/ex382Vf7c53CQ8LYLPfoyLEd0gPDP4CA04XxYmvqxr/LxyW/FLe9bFScvlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VXhHnvW4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="LF9j/kf5";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975BC606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 975BC606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VXhHnvW4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LF9j/kf5
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIDQW0n1928740
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:21:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zZ/Y0r4m5ztNks5tc+5NW1NN
	N+6fPRTydaZYwjmldGs=; b=VXhHnvW4FFlVnYMeJ/gacpmEdE90BYG4RSMdFQax
	lrZn2pNZ4x9J06W0Pj0QByJR90EPlRwWA86Sso3K6o61yIDsU5u05DCJiluzNYfA
	WwZAAnBlXR9x8i12uBHYBN3I1T+YmByo4vZ/0b5G6dvEwzBOCJweQg+ZZg7I1UsP
	t9LuRuZVBw8rf2ziZrZ0a0x94AOF1CM1a5aFu+WFymXyc8vgCue1NR0s3SNTANFi
	Eupqd9nDNs40Q/7P9e8n3XF5mODvlIIYiDnjGwJu6tJwdxR5qVdyaWH2tgEj27K8
	xL8gXcLlh3j0lsfGJrJfZgsxEQhBcO9wVV58KnjIcC1WYQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8bc3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:21:53 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9211d51dcefso7552626d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795011713; x=1795616513; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zZ/Y0r4m5ztNks5tc+5NW1NNN+6fPRTydaZYwjmldGs=;
        b=LF9j/kf57c7CGLz1D7iHZABvVC757jAB/yNDQDwmrwXZppSZ8xLq/iVtYthGO7Olh3
         drvQtVAGyBgYQys3xcklB8QUpuLeA7N46X0JFVvr8ge9Apg6maJYLbJpUzW8S0r6OsDv
         kPz75ZNw3+rRGxCxYnJEgWCrsa2HjTaGHj7dQPq3hHBJ75H15pK4Hg4ALWYjANBydtQT
         w2LrJDnNZeJtdIeo18Ap53RQDMJtbdKmPv+oqYaqyJlaJZZpagBn0D7uxaUPGLQBFjgZ
         xuy1UBpKBdi3kUW/lysRjwzKBtRGNvnGYeCNNJO1R9nB4relsM/Rx0c5RXlKWaIxz3Qm
         zAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795011713; x=1795616513;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zZ/Y0r4m5ztNks5tc+5NW1NNN+6fPRTydaZYwjmldGs=;
        b=TGLP1IFMlkLbzNWpdsIyjAvkoHPEMCAEr4lRGW25jYBgCLJoCQEDXC1mB3QEoF6foF
         9Whrm7eMzKMZFnPoavJ8tjOZvZoj94BTRTgMI0c1QpXbuSFTHE8yFuS2e3rOVBtfQlxS
         CakYn758Vvfcao/qNKHdVR5RCQZlkdKIAFRp8yj3cBsJeQN7H6GiPfBHZmuquoFP93tI
         gl2Vxc7udbORN4SuvK7FXlYKF42N+8diRFrLQOcCy6BF7er7UZPHWSDQ2HoOTE5K12oE
         e65hrh6vGUsLB69IDD2bXCnKxYrmh4YUkZmlHZZD9TFAqm81vUPad9VuNXpDx/Dpc5aD
         VcMw==
X-Forwarded-Encrypted: i=1; AL+hErGTCuvFVl0r51Ow5gILIHEFFF3hdXQcS31AVYoxnAN93RXOhkjbVREOa65xHjNuLXA4wUXJZaQu4/Y9974=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gNJDoQxfFcpP4LIfFkFMNFdk8I/JdwKa6pST2X+1e+KLjgSIu
	vT0cLJ8Ta8M3QV9pr8AysYtLGvRF+eOlxdqOapH5ad08qlZDRUa7mU/J1z4DiydPz6JKUc0/APP
	BnICno51ihulhHkfwUPjiN6MbqVeoj+SeWfM/2gc0+LnycLKUWRrZSWBMcvF4e2L4bKk=
X-Gm-Gg: AYBFou1I/aj98UTg0PcEZZTwGsoLWOySmJ+qE7o4PcDqCZxDHIpT0AcQfy8Gh8/446+
	rQUKK56lqNki6RHS2YYFt6gVIuk6MTociSAf3Sh2hbL1DT9u9MoxjGqy3cKEojttiPGcBYAOC0d
	gPOOZHpNlkuQu0lzdQLrKvuBNZrbErbE3xzpdHZu6DZB8vYQuhbBIL6NbjL+eQhD2j5/ws0LtYS
	yYpe5VDLLhCSfA10oJFAbVFlCb0UTz/LGTSGWUkL4JcTyaBhKpmNcu311QjCeXOYvoFsI+Izy/7
	VGTjN7o6qYeKlrZLRdAhIo3ygag2MmSbmtnBlRXP/pxm9oGaoibNtVLNHwRjeLSXYbkD1gL/fJT
	2HLpyoyF/6TWV2c/sjeY+z1X7QzzfFktL43iMAwYjhONYIXa/MnuXz0kI3DYzljdMapNbqRLz+E
	Rs6EUaTP2QhlqW42TkqSm2Jx9VNIOFlCJfQr4tdCEk8qJoPHYlo0YV5v/0e+JUUw==
X-Received: by 2002:a05:620a:4012:b0:93f:2a56:2772 with SMTP id af79cd13be357-9499962a7d5mr464565385a.78.1795011712711;
        Wed, 18 Nov 2026 06:21:52 -0800 (PST)
X-Received: by 2002:a05:620a:4012:b0:93f:2a56:2772 with SMTP id af79cd13be357-9499962a7d5mr464559585a.78.1795011712057;
        Wed, 18 Nov 2026 06:21:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1aa2d9640sm559377e87.8.2026.11.18.06.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:21:50 -0800 (PST)
Date: Wed, 18 Nov 2026 16:21:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: talos: Add graph port
 placeholders for USB Type-C muxing
Message-ID: <6w2xvhuuki2ww3xbzgzwxqfawgntrxgz5cjzlvkm6va4zb33mh@hkzdnkwbtrf2>
References: <20261116120623.1726089-1-akash.kumar@oss.qualcomm.com>
 <20261116120623.1726089-2-akash.kumar@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116120623.1726089-2-akash.kumar@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 8rtF8YFE-cvlIkNgsoXirNkLTydhSu8I
X-Authority-Analysis: v=2.4 cv=N9u8hG9B c=1 sm=1 tr=0 ts=6afdb481 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=jdQJDUkAZxjaZL5bHooA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1NyBTYWx0ZWRfX2WYUTOo5wo7U
 ibKRXQlB7gF6hdQ5vugQZXyZpfAe/CrfJHHKfoQ40v8/bpGD2shEOsrZbQrLHAgMXH32NSlEtyE
 od5i/WxfPLL/iylbt8Dee9LStZUFKYCyTtsN4Mr6Db+URgWE6PlN9WhUIPRjXno6D5ZwZUx6Z0b
 77MYm+L/JzQfwoIwmtImtAlCRX5EpNvD6mw+r2adRjaNvYH+nGT9XkhGsBPhWMyXqqUIhz5KclV
 swBAXq8qXNKEJEOncztqoT40ftw/Na616ESZDZUnpRKiFALr0yEsJjgu3rfbeaBqbx2JMgeHASV
 18HJK4Rc+1YhVY2xfxeLtER1G28msngUh2DCTYXbq/yv+/y0QPivLwMJcmy2SdHcOTR+2m5xZFP
 TK/QpEeFYLhiYu3wYHbPTVzeqJBRd5z0Fp7NPebH4F6/TIpYJIPTlYDpvK0MrOk2tTI2oRIx2Qw
 yTsel5FyUJ0rHN0HfaQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1NyBTYWx0ZWRfXyjI9L+tnQfAy
 toqYVEnkwI3GC6BbI1G0GLSRuduK5NGdrYlW8N80RAOufO73QC6vJeCcxJEG832Tw14mVFklcxm
 KkcdKriUo305YUQt5AC9xxts7hfg5Pw=
X-Proofpoint-GUID: 8rtF8YFE-cvlIkNgsoXirNkLTydhSu8I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180057

On Mon, Nov 16, 2026 at 05:36:22PM +0530, Akash Kumar wrote:
> From: Akash Kumar <akakum@qti.qualcomm.com>
> 
> Add empty port/endpoint nodes on the primary USB QMP PHY (usb_qmpphy)
> and the usb_1/usb_2 dwc3 controllers, along with orientation-switch on
> the PHY. These placeholders let board files wire up a USB-C PD
> controller's HS/SS endpoints directly via
> &label { remote-endpoint = <...>; }; instead of redeclaring the
> port/ports structure on the shared nodes.
> 
> Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 35 +++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
> index 1d74e459f892..04636fd88807 100644
> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
> @@ -5078,7 +5078,21 @@ usb_qmpphy: phy@88e6000 {
>  
>  			#phy-cells = <0>;
>  
> +			orientation-switch;
> +
>  			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					usb_qmpphy_out: endpoint {
> +					};
> +				};
> +			};
>  		};
>  
>  		usb_qmpphy_2: phy@88e8000 {
> @@ -5163,7 +5177,21 @@ usb_1: usb@a600000 {
>  			wakeup-source;
>  			dma-coherent;
>  
> +			usb-role-switch;
> +
>  			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					usb_1_dwc3_hs: endpoint {
> +					};

Missing SS port.

> +				};
> +			};
>  		};
>  
>  		usb_2: usb@a800000 {
> @@ -5220,7 +5248,14 @@ usb_2: usb@a800000 {
>  			wakeup-source;
>  			dma-coherent;
>  
> +			usb-role-switch;
> +
>  			status = "disabled";
> +
> +			port {
> +				usb_2_dwc3_hs: endpoint {
> +				};
> +			};
>  		};
>  
>  		tsens0: thermal-sensor@c263000 {
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
