Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168237;
	b=YTpIDCkuD+4f/K8RtRk51/d+TCoqgWHyKwJwf/s2sbi3q+xPSj25xBe3esRx4SlsBFkB
	 74bCJslSROuzceQirV9dxRX6ambiV1AItFPXzo8ksO15MAZVgW4g0cCg2bKvpKHjQWzCN
	 N0PZm5b8n4YeGZL3u6wfLl1QCUrPZSg6N5Q4Kn/RUGOgPy7vidz2vt6J5Jxp9oLYdDVaL
	 fg3jbFP2N8zOfA7NYRqgt4k+q8xQ31EbHXhdsoXKVcxQlidaD9+PfR3he1bYXSa/iTipK
	 De/Sr1uo/169qBvggVOihf2USCjV/j7mnUEAgfkvJDtZOUd6U65qo2eIwlzqTNsjtRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168237;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zB5SsH8VsIf4nEkhNxqYqoKowJRLv4fFPfgAoBW0n/k=;
	b=oEsaC1bC06ItXZl6nyGUrz/NG1H0ApLjFI/qkZ6mDSl7y7eS1FkQ4aJlfMnuaIvgC18Z
	 Hq8qPYqS1fn4Z/aktwLO22iXFie5C2p+6iN6+67lc6pXzBdPR76m5ZWzFfO+uEWDqqXiI
	 2g2RxxYnRwHfzBMSWu4JmsC36mSRs9b3EEJm745LKwaR/aVsB1MXjtRdXeEFzWxH4MMwP
	 LAVrOWkUFdg5nyop80nBl4qwWAlXxAqCsXRWP8E+rmlOAeeSgxk/RWxoRGOsUv6qhWsVS
	 2EuymiWIKUxeQB1w8vM1+ATMazcppAtHXBBzcdIgk7DskgPfBrhTvcNzOdctnIMSAqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BjP37kBy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H2d2+sYW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A80606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:50:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6A80606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BjP37kBy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H2d2+sYW
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7eqHR144432
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:50:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zB5SsH8VsIf4nEkhNxqYqoKo
	wJRLv4fFPfgAoBW0n/k=; b=BjP37kByTAgTjiRHlga37NpG013SpZl6UoEWvm+p
	0c4jvbTuj6WUhgfQLXs2osAictIUffdVBS8R4s+FN9m5WswyTXcU1tSfiTksZVqs
	wFRqvOrp9aJ5GWKkWIc9N1sGv2sMOdNPy73cigCk/KXROlEAJiOF1iyfKUUd+O6X
	52uXpYWNSI9v9kX8fTRYZUhUt2a5FdHFhFmsKSMk8pN4hcWFlL0QObmVqFNpzK0b
	7WFLOslTFiUuDFU/8jbSaPF8rCFSpnADDvorZyhMKzdm6VBuca7VV+uJb1TaAT8+
	V9C3OwIiYwyE5eC0N84taumnN1VAawPIclzBrqocdtUUqQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fsbh4r3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:50:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844cb60so137415785a.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795168235; x=1795773035; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zB5SsH8VsIf4nEkhNxqYqoKowJRLv4fFPfgAoBW0n/k=;
        b=H2d2+sYWFgy4UKXRt3qbZFezZSnu/0RLSj6UdVzeSBZh7MTjSk3ZnaxEF3qjJmDZYE
         61/VRVr+x70kmENpjg5rel1IB3UYdHTJn0kErNgPktZIk9FM+CJGFvTfpR8kEBSxCizX
         0lIS+OChY6exupc1hj4/R9C2fIp53JNlvDz1PtwBHIOC8zbDHL1LqMYbxaPy25UakWcZ
         +o2ri+h7+xGFd+aKDBnsRHjX39CG1PNAsAFO0nx/nJ2fssQTEKo8GvrrqOcYNMfMRD3p
         zIGqYooWbtRRziCwJyW2C3JRDNiqJwc7ApWgyyNGvhL2iRRGOdbbjRUYMYIOOE9TKjtr
         IOZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795168235; x=1795773035;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zB5SsH8VsIf4nEkhNxqYqoKowJRLv4fFPfgAoBW0n/k=;
        b=HKPUOXorDhR2ts/PkGMOm0ozn5AAK8k/qF/a17sAw51QZq71+QVXi5Wex1MnPs8Etz
         H8ZDD9MBgycnmAMdyrLMfS7nzAwOy7f1GNaTaUKNqhbInRN3Rvu8RWtKE8glbsFOxn1U
         4d+eQH3Q/01BMa72wdRE4TPnITSEq6OCe14mfJudXXGHG+nYHUC58RYCqyC15N3Jj4d8
         7dLHJ8xoDQuP2OrefojEWMggjIGq64+8BrsVFO3cjA72eQg6FFW3BhkKsqmRMsFFWSwA
         6/n6UrLEkqyiV7Mg12p2eupPuj3kXo4+ILihM1/HWoDW8GEioh2ENnY+h8Fyn8xXBdP7
         CI3Q==
X-Forwarded-Encrypted: i=1; AL+hErH6iBTyXDEDGusekgKR1zBjRKK4l8R0CiW9GZJxWMimXh6EaxxMXgag0iA1i/hDqY40i2PUHev8WK6ukCg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YZcIGbiWO7f5dKePdvYDanNlEYgRVABjewekfknur/Uw0GACU
	KVNYq27UNHx/nPt7kTh+Gqq5qealBjEs6kYufabqi6SU0TxbddnwHOivuY74KJGng04ru4qyD/N
	aakYcIjLgnXXHAJtgPkpmLKj8+KPegezAk4rFKkUs5gxzxj95HptEiB3mFGZ3kepv28s=
X-Gm-Gg: AYBFou3w8CWQn2g1w9GZEjhYfYrONbI4gQQfkGea/OBnR0uYmRrL6zquKBUvjOUoUzu
	ITRz+l0iF7WT4ZztFAWzqHiaJyXslwl5DHjzzP7hLM01pK1uyMW7U+wZEBlOpwn1msjJP6V/7Bx
	Cmn+6CD665SZDJ/cQSvvMrsZ6kRUdJDWKHedk4VFKX+vE+7GUjG9v/AmxbSb1RNgx197ewOikkg
	RoS3iOciJ7Y8OGPZo8S2lwYJEKhJBQQLEiQieBN2oeSh4vYLEc0pYWDbu0Ogp9mFH2fwjV9rrv6
	Yuy/DEFlgeFarVhMbmhMFxndA3ww66rx6wXBYXj1EJSyQvLSEsLFcOljKslAtTy/rgrk9DMQ5eO
	bTR8NiowDP6OPScy0An8hsEz8cwnifn5jailAhLrArFM15cQpx2cNq2C6uDunF51B
X-Received: by 2002:a05:620a:6401:b0:949:589e:4bd5 with SMTP id af79cd13be357-949b35ce47fmr569789585a.23.1795168235245;
        Fri, 20 Nov 2026 01:50:35 -0800 (PST)
X-Received: by 2002:a05:620a:6401:b0:949:589e:4bd5 with SMTP id af79cd13be357-949b35ce47fmr569787385a.23.1795168234664;
        Fri, 20 Nov 2026 01:50:34 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2050f1sm4302232f8f.38.2026.11.20.01.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:50:34 -0800 (PST)
Date: Fri, 20 Nov 2026 11:50:32 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Shivam Rawat <shivrawa@qti.qualcomm.com>
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: nord: Add GPU and GMU nodes
Message-ID: <l5jxkp2xknjjk72mpf22blpxnou6ufkaswhehddtpgyowly5qv@6ngdwriwkeny>
References: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
 <20261118-nord-gpu1-v2-3-8d6d9908b7c5@oss.qualcomm.com>
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
In-Reply-To: <20261118-nord-gpu1-v2-3-8d6d9908b7c5@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzOSBTYWx0ZWRfX9V0tkD968zB1
 ZvVYJRCfTmX3ePnmabxXBjuNPUk2bdG50sQGS/CFlkEp1cLMJccdM9teByuFkOimGzSh+8FqcS7
 NZVSd4byfd7c72suOcpotwnhrEZ4YVVxz2Hs1OmQ82u0OthlKFv5zBna8WDdoBE3CpsCNZhrpeZ
 UAwUypi9TFQ+vMUkmkIAHlliHdfNXggd6uCEBEFDRMKNJxKFBMvzaYJyRVXlx6Fc/S+4HfU//q7
 Wwul/Ft2VKvaXxqTnsTaHO4CTA64lIPYsSCuatG5kchZkPP97l4n02cGBnhM44jcst1p0yIei/R
 QnoGuN7YWIEYaC31M1GZyti5UikW3+GqqsJ/MGz+ExjIg4o2PN1560XKcoTPGxuiFnjSVtGlkRo
 WtjCncBIpv9LQfh42g0K6n3dNT3Gpz6+DJGjrhIDjoezS8ugLSYr+CpMnVkPOwxE8z51EYnmREd
 /aoMUlncyBpwlVa18+w==
X-Proofpoint-GUID: jaLf5bAATMlwdh5p38HrPyxtOl6Nz-D2
X-Authority-Analysis: v=2.4 cv=DeiCOftW c=1 sm=1 tr=0 ts=6b0017ec cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=O8GIW4uRg8gWTlYuajoA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: jaLf5bAATMlwdh5p38HrPyxtOl6Nz-D2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzOSBTYWx0ZWRfX5WTGJw+OTELI
 6ho+BWX/XH3nk/r4/hu4AQEgwV9zn/XUC+zxpFnjJiz3y1vubghc7hjcCEzKooXit+os2PNxXCr
 QqLu0iib+L8pLlKOwYMfKaD2svxIUGI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200039

On 26-11-18 04:30:06, Akhil P Oommen wrote:
> From: Shivam Rawat <shivrawa@qti.qualcomm.com>
> 
> Nord SoC integrates an Adreno 753 GPU as its primary GPU, belonging to
> the A7xx Gen3 family, along with its Graphics Management Unit (GMU).
> 
> Add the GPU and GMU nodes together with their OPP tables. The GPU sits
> behind adreno_smmu_0 and uses the gen71300 zap shader, while the GMU is
> clocked and powered from GPUCC.
> 
> Following the existing Nord split, the SoC-invariant properties (reg,
> interrupts, iommus, zap-shader) live in nord.dtsi with both nodes
> disabled, while nord-embedded.dtsi adds the clocks, power domains,
> interconnects and OPP tables that are only managed by the OS on the
> Embedded (non-GearVM) variant.
> 
> Signed-off-by: Shivam Rawat <shivrawa@qti.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
