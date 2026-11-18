Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795027743;
	b=I7Zw7dbozUlRRY9LWqZlGZxAJhzN7yBbsvtmpJdJVNxGMZVEp4440Sqzg9jWgFuH0Wc4
	 cSVDWk9CqIGguyJZE8o0jdUfk0HMPxxvXI5PjyvGKI+V+kZLmVhCqRLeDO5M44YGYuGpQ
	 I5aq5e4PMcmCVa+A4wdpjvnUYRq5WbWf0Ln2Lg8FA3xIsKA4PDchMlfKL0mOBqygQnM8m
	 mGtvjgR3qsVJEsHl7NQnnKycUUganJ45Qf6/TkT29+dy8KMNLtPy3gA71dEmXoA3eTNqP
	 aSXqfTFW4kRr17CehmBXJ4KRxv1T9/90BKrWrAXDvux/m44chTNbUovhK7t/H8zykDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027743;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=egxOvCyQRMpJGS3A8wGpHQMhIYneT+BSYHrmgVI9nWw=;
	b=rDBEB4lK8aGwK4GlE+zetwbvSY5GjTf3SN9jRXLJ6yxi7rS54sryFBDhNaJPT8deE0j2
	 8V5Y8FLaxmy4VYa1DPKQ2PDO71i+QkK8RvcvHcxf3YJU7O5pvmpoMx+OqLgw6/S7qzsbL
	 iDpSVd1dOJql6LozKyV55xXwi4IefmCv4ZscAE1M3NmxdCPTC/N3ZLvB7XcKO1DchNKwd
	 pDZJL4pnED+eyqAk/ez1+jRfbw8ROjsD5wA+2WGfJL8THy4acH+tTFiTIv7F2Z65ZRUJl
	 SrWArfDAcksjXCGlZSWYDl6LITnLoNlk9kXuBCvXBWDjarc3ZsOopHvhZLAeZphKwkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iwsnPbGF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UpksIPmE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2367606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:49:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2367606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iwsnPbGF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UpksIPmE
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIHGZRN2746299
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:49:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	egxOvCyQRMpJGS3A8wGpHQMhIYneT+BSYHrmgVI9nWw=; b=iwsnPbGFYqKmaNAt
	DiGWZ1M01D/wvg6LFujZOApqG9JB7y/vmCHR531TUjmKMEc5aG+SYlIZMOxWjDRx
	97NiHqE5f0otAXE4iDSEWz5dBMmhDHPOQP4o9dvaMuA180YBbiOjNGuaV5OD/VlK
	Y6OuOvW5tQMCXlvsK+J6vqCDBClAAJITr8i3wSuSEZd96/k66O3PVYVuw30kMmjJ
	qJNucgABrbEfFbzrsdJNHKIRA2LE2fA8ZEGVd/0PF3kH8yMKltVMbGZlqz+pIbG2
	/3HB4bY/NKc3wJazMpV2dZq9mW4cg7DgeEfw4GPzwXW6UKefqXmaeJSEjKNysnz2
	yRmlpA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1fpngkw8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:49:01 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b238436265so1021590c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795027741; x=1795632541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=egxOvCyQRMpJGS3A8wGpHQMhIYneT+BSYHrmgVI9nWw=;
        b=UpksIPmEgohvSEKyhlp/y0zCwTDDxO2RplOwhNucYASbF5zbVvcA/EyK9dZXIgdxIO
         Xz7c2pv5zsCwH9QG//uHUVzm7Bo8PSoXoZpFv8Limqy0Fhc/w2EewQzMKxfQdYFqW6BJ
         c8JPwKaIUYJHBtU4ycI42Bm5P5r4/hzmcXAhjkt160icSP4F4J3yyTZqGbjVO5DezRve
         85RYaghDPvqV5SCrKcN796euTW1epuvbeBmKtwfLofEXFx/RctjfGsnKISgEQWymkazB
         qiSIvPu6IFzlDj+KzmRiO7X7t7qa9DQeTyO4KoB0ZRScmXpbkvG6dpy36D0OUbsuTZVY
         nV1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795027741; x=1795632541;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=egxOvCyQRMpJGS3A8wGpHQMhIYneT+BSYHrmgVI9nWw=;
        b=xji4TstE/L4HbmRgtL5oq4PEYbD6trWG6/eUaWsMgNxelfAXn2v/n1FdlHg9RGh2BN
         p9EQ6Wc4CRJ6FeCJHmv0dnONV4fVtATkquz9mwUy6zIh29l79uhz0NQ0UB8qT9Mk8mW+
         GQxRSwve634Wc9NanP/PwzibBVlUItBQrv1l/ac25TmfDIx2N72k7dj4u0J80rWh+WF9
         ekfilCfKL3GALGma1XDtdwj5MGTVbxM1OcKUaC+LTGg00LTh1fcfl6vPpmPO5SgKXti5
         YDXBHYkcBVOXOANOIcEQNovIGHdHqiAPS1LXktflW/HbtrT5nAhpaM50+BOgt6cQbnjh
         URnA==
X-Forwarded-Encrypted: i=1; AL+hErG3UpskfDxMc8ajkS3Zl04z7RcgEQa7LJaE1siYsSUOgHSmPTsAmqM3QgReHPno7ISoBLNXxITEimrB0f8=@vger.kernel.org
X-Gm-Message-State: APuU4Z80Au3E7/bwXE6cwYc7bBZbiGw0NVgPAhqr6sIAOfp2NVewsayV
	osqSRAgJtaY3fiuwkmdhj/Hf5bhgzDMYe6Sn/Ty8olJBv2BDX6u12FVUJtcEAPuXRvOZoyzSxqa
	kVk8HagHe9fvjHr+zPKjkwyEXEHl7jM1xedKlzKQiDwOK2AbkRJztc4ax1Tsocn4l04k=
X-Gm-Gg: AYBFou28QMb5Zk0UJWdbaZkZmhSkjmUUZVTCMHajNaSxQKlB73Bsk0RbsvaLLSh+5TH
	J6t1jQcvpARJ5rdMF+cKiJcKYYgC1z5L2ay5HrVbsO1xkgHT1b4/69lU+6yUYO9sSLWwIDD7RwI
	n0eVE6imhC3fHlgZBswWVq+IJJ5PA6Oza7Voo0h7Q2Rtl4amrattCsOiauGMOHL79WjIUBugJSF
	z6U/YcQ3I8nIABkpZQ6ZoOLldWLYDjnnITgNRQydHi8lLPc55gYQFTLbMOWEIIuIZkWA09NYnbw
	1WYtLx4LVHjGpfTpFKmxXYKBGFp6vThq5WTAvQytFtwUN9xoidiCTRHGrQpaSKZrjUjS+C6yPbk
	39vhhHdPHC7qjZekUOtdQqCgOEBEzzhwIXRix+qulEF8n3ebp+Cge0/QzO271U0MvxWN4WMy+9g
	==
X-Received: by 2002:a05:701b:21d3:10b0:1b4:fa58:9d3 with SMTP id a92af1059eb24-1b543cebc62mr3198341c88.24.1795027740399;
        Wed, 18 Nov 2026 10:49:00 -0800 (PST)
X-Received: by 2002:a05:701b:21d3:10b0:1b4:fa58:9d3 with SMTP id a92af1059eb24-1b543cebc62mr3198301c88.24.1795027739680;
        Wed, 18 Nov 2026 10:48:59 -0800 (PST)
Received: from [10.204.104.211] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4e19sm11782234c88.13.2026.11.18.10.48.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 10:48:59 -0800 (PST)
Message-ID: <f38edf93-6df8-4771-8e89-c1d150ce3f71@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 00:18:50 +0530
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
Subject: Re: [PATCH 5/6] arm64: dts: qcom: nord: Describe the GPU CX SMMU
 aperture
To: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261118-adreno-scm-fallback-v1-0-e99cdbf3121d@oss.qualcomm.com>
 <20261118-adreno-scm-fallback-v1-5-e99cdbf3121d@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261118-adreno-scm-fallback-v1-5-e99cdbf3121d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lc068Rc1yi0us8AXo1hSFioWa-F0a_CK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NCBTYWx0ZWRfX9QtaLQJExNYl
 IYTUReIBOWPMIEq67h6L89B9D4Z/voLClIOXMejVYlSfI12v+nn2bRmTZRGduri2UQB3bF0QOIY
 MjotQ6thz2eqzhUoNu9pm9S7Z8aZ+rJa0fGDbAYVAcnZ1gCDJv167vCrJ7QIWtCDV3GEoROBVyq
 JLti2MP22ScB5y9GID+cJqShaNOIFm1rozbs+Oi/L8070212S5WUdr2jrnrWXTBodl1h64Hs0Te
 vl05TA/o/LGpAFDI2anPYBz1uCkiOl7vGsiQbEgxwrdjLpuLIC5Uq8GRRTn6mCswSedOvGuvHmH
 vs9Ci78rQFZDSs6yUl6OZ2PLC5AOMIDC+DOHl1sUWInp/HpKcCbhGu9xyVtqOjtY0BUsngB0RbO
 zdKga5xFUp+VRDpJ/gJ6ldIzfoZQC+0yc1aR4NGrzmSKmSuQcgpfUQSbaQY8gDcW/pjjW2/jLrP
 qkkL7nSsQNz+XKWG7dw==
X-Proofpoint-ORIG-GUID: lc068Rc1yi0us8AXo1hSFioWa-F0a_CK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NCBTYWx0ZWRfXys3B8L5HVhw0
 AuMFGOS1GXEuMlFKBcoBBoJkXZm+nN3L8A6vpcRI0yGMmlvMo4FQ6aS34H7oAu4TN/KiAH2tSfO
 S+SMNgDw+0csLFRupgZUEHdH9qQa/2g=
X-Authority-Analysis: v=2.4 cv=PJ6aavqC c=1 sm=1 tr=0 ts=6afdf31d cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=2DaYFnQSzUVrrlYHPwYA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180074



On 11/18/2026 6:38 PM, Puranam V G Tejaswi wrote:
> Add the CX SMMU aperture register region to the A753 GPU node.
> 
> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  arch/arm64/boot/dts/qcom/nord.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
> index 3e29c43ca9ad..cb5ee6b68779 100644
> --- a/arch/arm64/boot/dts/qcom/nord.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi
> @@ -1717,10 +1717,12 @@ gpu_0: gpu@3d00000 {
>  			compatible = "qcom,adreno-43051701", "qcom,adreno";
>  			reg = <0x0 0x03d00000 0x0 0x40000>,
>  			      <0x0 0x03d9e000 0x0 0x2000>,
> -			      <0x0 0x03d61000 0x0 0x800>;
> +			      <0x0 0x03d61000 0x0 0x800>,
> +			      <0x0 0x03d60000 0x0 0x1000>;
>  			reg-names = "kgsl_3d0_reg_memory",
>  				    "cx_mem",
> -				    "cx_dbgc";
> +				    "cx_dbgc",
> +				    "aperture";
>  
>  			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
>  
> 

