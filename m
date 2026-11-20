Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168203;
	b=fq4/Wy9WFYbRDYDhF/5mAX0ai4Of+tS534+NIpofPMXzl9MeK6M7D39GHmtQTllkCSQ5
	 S4IEaix3yI0a95WGlhLINFZyXKqm2C0nCEiMJkXlh2hgrKVK4W6/TCexX7qyUWhkeRgS6
	 dttRtmZ3AZH0hULxdvUTzRtHIsQ7yMno29mrVPtWMbJ/Jan2RMqlXcIZqk/VE92j9LvH3
	 VULt9JExzb4mFO96Y++G0hN+SEUo3MRU+P2Fk2rVGgxzosR2e2sm7uXrPhOAo/FtfaMNM
	 WcYthTq+HYuRjB5ntslMn+Mi60LVBorfrBxuJajP3RLdJfkfIYe0hL6XFACbpzQ/dyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168203;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=btKSo5BXidED8vJ9NCAxgb4Jb5p91Creg660EJQWOVw=;
	b=EaSohva7C2hCxdQFL1jOL/an+9e6bR6DhKo8fvXvg2GiZJi74mZoJ67P7yPcbr8f+rak
	 0x3TaBGy/hRfyTHtY9jOUDepv1jTgYKVWZLsoHv6Py+LdcNk6+ojOWztjFf1L2rAmvVOG
	 K+dTIHD8s/qvY62prBEMx4j57+lE8QG5eJKJ32rZC7sWu/C4rCn448JJyEn/g+Mz8OiGN
	 ZgpXz6gA7bEHe5iylG5WiZHjAtqFtFq5dnZUDJat/GvoAYefgfAi8398s5iggfwjijb1t
	 68lFSbSPuzX2Dn7PaW9dAdRrd2GWB10i9bXOK7ExCriFO1PE8xmAdCNmfkBxqwIol+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eXqeABCi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HSa0AOtD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2294606A33A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:50:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2294606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eXqeABCi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HSa0AOtD
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7etTO1048848
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:50:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=btKSo5BXidED8vJ9NCAxgb4J
	b5p91Creg660EJQWOVw=; b=eXqeABCiXtEP7b0ixlF+/asBaZcSBH25X1IqeNRK
	+KRqErrPys5/vR35Prm5xuHkmjwnMaqJDBdBAXEcYU1wE80QxWeOiYrgCKbJcpqF
	/ubyek/e8gRQ1w9VfE/+4XvTVk9I8EZDYoucRHoq9Kek/GvVLRM4mhLhi2wplRWC
	NuyvBGWwrAYuktAsGcfNivFf4WuWT3+rhZDSRRht9eXkcBw167p42LaxMxipVsJA
	I7OLKKHpii7G/n6PB7BAN75rU54WLod6VO82uYcetJRVzNkoxRnYnOSgnVz2Md06
	uJi41zOsnSChj54FPyxU+rKFM32J9SrSWjP0f2o+iPErNA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2guagv50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:50:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94967c6d4f4so82370585a.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795168201; x=1795773001; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=btKSo5BXidED8vJ9NCAxgb4Jb5p91Creg660EJQWOVw=;
        b=HSa0AOtDE8yS/7BArK2n8E3v+Vw2xuYPKPiunt17PDMlaNZ7Esoxw4DXAnNayoqBCs
         lPHt1LQK97XFcK6FUKqkfo4Torima8vAjZlTrn6jXCLpwi3m3D4X5zYbwzExFZeHhEOY
         5gjfvryb1SYF2TnM+7HDjcsjkmw68sUhCgTLcQ/GPXjAIg8BY5BZWQn397Go7SMLAWqx
         F2ZFlgobhwI9MPDp8sDFc4us/i31sRuZsI0iQ0FHO5WI7IiapZhAaTOTjEN4yXaZ+Mhp
         /8ELFtGZCFPp6OhtduRafCt80j84Pq0z+QLvhmyW1s2U5J0jjCxfHwTRztvnulUnzXzz
         G5uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795168201; x=1795773001;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=btKSo5BXidED8vJ9NCAxgb4Jb5p91Creg660EJQWOVw=;
        b=vJlISteLnvSkRP3aDEKFoBcYk8ltH2D6L9rz92l66Ftg/a9QequJtz+xMzPKkfAyDX
         4lmYy2CS++N4C+wsf1/5C75LFyzAz32eoeJVDZ2VxWUWMJl4rZKLDoxczjAhxZJoNq6n
         AZvgt/bYOlCQ6wv7g1X3sGmdVVmZDA89L8he17EFo3rcOEr3J978mUSFxhd9ixoLehRk
         lmyaSwfCtXboCrqqj5koCOiW0bV1CaGq0g2SSCW/ptSf1VPIvCxdeyi0cZTmQYIXqujO
         wfhHqWBtMLIS2yH8uaLwtx9ktFBIeOgC/EHvQ/KWjw9EJ+gW4HHPLsFjCvydPDbxfH/Z
         4FuA==
X-Forwarded-Encrypted: i=1; AL+hErGBCZ3dRACZMBhWA6pNjX9V1YerlzlWSy81T0eYdt/p90cU92yKMxnm3QjXDt+sjRzi/WZyXXsJ7DzrRjM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ip9HvNlEd9DhllXVwR/y5kubNTB/7QZfxYBt6vI1muavmoGv/
	oiTMDIl3zdmpN5cg5PRZpj97FxyNEMrJ8nC74k45FKBwtHl5kWj22uAgf7Xdzk/tgk1IB3dvwEa
	xjBvitkTmb9kej/iACEXe0g5z17N9Wx5VM7d2+qz7CnrVI7WUVz/jQLjZkRnGUiHgpNQ=
X-Gm-Gg: AYBFou2/c+Iv1BhOCdmxmX2oH2AT6JIbswmSOSd0X3hZw14ERXjkAg1tWrkguiKLGgb
	pSYxo73exrwPDcyt6G/PiVeNmUqtM7Ulcl+znk7peI1lrF38mmLtMTTQdADKvnApLe9T0hkCTDi
	Vfyn3xeaQ9ErT2fnxBaz/xttGM9Rsl5vtpn61OZXgq2uNAk1xivD/Ma5+73mB+egparihElX/Rs
	C++pDqN2weGo68pjxXQyKTK8JpTQijta2moXTA53Z4HCCYI5k8XDA5bYgx2Zw4Z2JIn8O/3swBE
	+hDgtK3gsfouV3+sGKro5RdjPDM9qkTvPBXFLfzX4b5mWhQXUEAxZIaHQ4ZF3oFgA3NwFM7qauv
	wjwD4C4h8vShjw1JsKKWWnFri6Xx15U6w7+0MT6dfY/pnx8wjyy+Ox87chZ1/FPEK
X-Received: by 2002:a05:620a:31aa:b0:949:3066:5551 with SMTP id af79cd13be357-949bac80948mr413718285a.79.1795168200811;
        Fri, 20 Nov 2026 01:50:00 -0800 (PST)
X-Received: by 2002:a05:620a:31aa:b0:949:3066:5551 with SMTP id af79cd13be357-949bac80948mr413715385a.79.1795168200326;
        Fri, 20 Nov 2026 01:50:00 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf61b8sm4189249f8f.19.2026.11.20.01.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:49:59 -0800 (PST)
Date: Fri, 20 Nov 2026 11:49:57 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] arm64: dts: qcom: shikra: Describe the GPU CX SMMU
 aperture
Message-ID: <nny5rvdlbd7dxbc57cemmebswdzbubs57h5fhwxftvcskajpor@shl26vygzqb3>
References: <20261118-adreno-scm-fallback-v1-0-e99cdbf3121d@oss.qualcomm.com>
 <20261118-adreno-scm-fallback-v1-6-e99cdbf3121d@oss.qualcomm.com>
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
In-Reply-To: <20261118-adreno-scm-fallback-v1-6-e99cdbf3121d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzOCBTYWx0ZWRfX3FvWTVviZe5k
 K2rXufiNitzgPbneR/P75tjY8d059LlgvPinnK5JqkfAsPe9Rlo9GEr0CI7i35uLjhECmMqYK6X
 RL9ucAU2sSeowEhJJQJ4+Vr1C5QZglIDTy1M6py1gYS7nvucRl//bl1vU33ym4abzDi6CkS9nSX
 El0JvIRLRiJCymTDm58L+UEyNM1Ch6kZhAWxAn7Kr0egzbNQBtcDQtMpUbbOPMCp464XEw4oYwP
 hk8oBLOxrbrXEvYdjs/X0UJiV70FCz5wf2rFMu5/8sx0cYTp9NolhqGtHzhKPsdg6ZW1H969YWU
 QWi8mAAb7Yqrtct+ccUc0aRBvmvi4Ybyvv09fQgSrj2Pb75PEBno5ERqBU08/SKOHuAD27XiISl
 92HiQ4Zcrzqgqu74ml1/hCDPKBYv29klYiCqNBLTzj61eXewrYSl0pPptHe92G8y4UCrwl4X+K9
 CGmcvK6O8gWRagFcmQQ==
X-Proofpoint-ORIG-GUID: G-3juf4ayxJRFjo8qZr5R9320pnMOq1h
X-Authority-Analysis: v=2.4 cv=BIYmP1QG c=1 sm=1 tr=0 ts=6b0017ca cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=gzqzoBdNbbgndB324-sA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: G-3juf4ayxJRFjo8qZr5R9320pnMOq1h
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzOCBTYWx0ZWRfXwMPQCHmVh3s8
 LdSjEDhUan3eg5s01ZncPmKIR8zg5Ml8/0IWkSELZ8V4BaPYxYQHNsIE5ICrxQegUMZQU+TxsTJ
 XdsXpTxehXyxIb9YrFxNd0J2/P6SFrA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200038

On 26-11-18 18:38:30, Puranam V G Tejaswi wrote:
> Add the CX SMMU aperture register region to the GPU node.
> 
> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
