Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795000775;
	b=tSS0E6u2/4EpHIobOOuRxlOanWk7TNUpOMgkcrkGObXrcdbsnROtTI4KWOoUipMHWSs8
	 tvLc5Wu0kEtl1GusUOxJtJy3CmB1ySxMN71+jw1FQzLteZJHkF/fzbATafOsGqujNhobT
	 dKG3mA1MtsgigTF3c139MBU7L/uN62T+4QpYj8mqgYERIsn7PssOsHqkyYj4hpz5Fts8Z
	 Of1EZ7LVAUMitw1c7TSyBRp9/cLCBAzQr1z2n9InfMPcQdnE+zvu0OAI5wVXBzJ62rp2p
	 9TNoAmEhG+3xm/Erb3lafrmfFueE0Ct2xS6bDh850bc+bZtgAdStFDV7+couUSvcxlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795000775;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gfdUdOtc3RiS06TxKquH3bKPEIXQE/OFSkda9ogMo9M=;
	b=Gb3EQnhjYYuiTs6tQy3tYJoj48GXlbL9d+k9l1kT3/j6t5r72S70XxkCQr/hIbLTKgAY
	 nwreigKx9EaKJi3rN/srH8xqh0yBK2DOqplGXKYFFnL/0R47Y7JzZ47MvUpJMett6vqtY
	 YXifBrYGMrwxv71kmfNfMvdAaMSSjNlWKGYXwlDS8e3TPXcPdNhhp28JS6Zkbo7IWLROj
	 Am4NmV8lHLwJh54vdHS70bIx6ZrcmG+wRA+euaEVM4PcuCGYVbPdQLhlWWxcGMMIqmGbN
	 dsgKcseu9w/7vyOqDTmc9xyMzivzTf/NWM3gUQOzgpythXRN/yo4jOc7NHR41eqLoAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M6dMGV+w;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ccw/7L+c";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789E2606A33F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:19:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 789E2606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M6dMGV+w;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ccw/7L+c
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI9k3Ub3353923
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:19:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gfdUdOtc3RiS06TxKquH3bKP
	EIXQE/OFSkda9ogMo9M=; b=M6dMGV+w/8Gc4TL7JcdVB47TpayE6jT2Zl/j3L2+
	SIYV2p4JERPooYOkfo03opj5K4yaqbELYTCnPO9xAtfgZCgYHnCWbR2wcvA5ub0g
	u/f0RJQIaK0NQUZ2FfgPp5VNiWvvoXLUbgxns3j5UxTcE+2jfLfINm9+UzN1sB7f
	dSm6C5Y+WSYaQwX550EF0QQ/QMFQTFs6ymB5YqpUZFsxZhvRd4INBZ9wbZys9HQ7
	t/mP8t5GTIJtv6qP4L0/vnMFqJUL6Go6eBdTGFTMHayclA3aRcva21HWOm4q5whi
	T4tf5tEJ1XPLXRMS+8OWMPQQSBPO4EZ7HicNgXnM4VLn1A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvatsbr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:19:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9495c71055bso189257985a.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795000773; x=1795605573; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gfdUdOtc3RiS06TxKquH3bKPEIXQE/OFSkda9ogMo9M=;
        b=ccw/7L+ckrf4129DjYuf1KXnEYFAaX9puCw7eREZgeMQJtT4rXySJEIGuFugwpjsm0
         GCYI+cH+hIz5YsUNSl+Qsxe0ALzBXH4Z3Bcx/cLeN0XFvSjBGnEownKZY5HUms4aQNYL
         MN3R1//5VBKZS/m9+DFQW5o/zsta4d5VUNYn5FETeqlevQfek0+gZWoll6iHJ5bNLBUH
         k60qTmIztlKH6eDa+Z3RQKIXBdw4ah8sElC7fE6CEt1ZkSOzuH5DwghoL54XzwySKsbI
         6PbNFs9cZxz10k0R/kUbOSBUqH29kjMzTK4lQo3wtUdkvZshvsKalyV5CXZCikE4ePHy
         fweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795000773; x=1795605573;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gfdUdOtc3RiS06TxKquH3bKPEIXQE/OFSkda9ogMo9M=;
        b=ugy38j/xV/dr2OHSup9dOqXEMCMl2u35RK1jLrNkAC6QxdqM9vG+0v0+B1dLJzVycS
         2I3ZvVysfrDGF2LxDJLKhzhN6K35SUyRgqq+BnfBqhIqbysGhffkrsX2R2+IKeHECVMN
         932bWOCF1CJos7Twc1qwVM2gPvQkDNX3iMwrl6lpVL9k63UBJyFgDkT8c61s7TRthKKT
         QK8sD+Jl0ClXeBb4mv5qS11DMK08XRexfUm/QjdHjx3kawRGfbWE+f/B3kEzCv7opwOl
         OVz94RHSPfdjkMWHjFuD2EmOFcs70YeabsC2ohL5ul52K80hC4ue47F9u1XYzVfgk9PN
         8Vyw==
X-Forwarded-Encrypted: i=1; AL+hErFj4Sit0zx0JommLUeztZVMro3ePBGvfOHfNG/EoQq67HE9yObxuyQJRa6R0ZL+pTPEKThbYD/yJRrTlU4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9v+P6Y05A47ggT+/Sd4zhTEAtD2eljdr0LKBZU2Td7eOvYgPuf
	T6awIo6Le0t9TvCqxk8MssAjwaIsNp2anwx4WP9KeI9fLWOe1aHq4ajPCorsKNd1dwb89Re4qSO
	XW40BgOBRsoP+KC/gBuPUoxdY8qGGcq1ksfqujOD/PMWOf/6dHGiJ7R6FEhJ/ZQNybdA=
X-Gm-Gg: AYBFou2vKOOfRc+xiSYBvXMtt/BirekP3cXu/IalqeFKUjqa14oqF4bfdYAXdRJ2nSU
	wKhU3T5W1o/wD+tDAV9lHXJahxVCYRj4+F7ifH+SgRpOo93DCtIchJ/rxOD8XJnZXCTiBfOgW/R
	Sb6mFnqUFgjVra9yGwup3ZGzkCb9ZGq4rJ3Swua6xB9T+702Yul7GXTkzE8IoRyWLVRor9Ihtcj
	+zvHxBpTC3sQMLt1IL1y8N7Ed88CEUuD1o08EHwnHKGrmWUX/33xrbCeTG0v57FospUGHD+4cGF
	tnPsggAf6Uf8LBOjkNGeV0lazqemAXaAnDxbhC+HrrWQCn5YIMtx5T+hQFlImCdlQiRu6Lr6v9G
	lYU7vP6NSGatKhemMtwqWgB1vMsVX3g813WR6Ad7502ry2CxNjfiz2jcJaBG7akwR2lJu8Hor9j
	CWYocx+4lnmVY=
X-Received: by 2002:a05:620a:1992:b0:93e:5060:f929 with SMTP id af79cd13be357-949997218eemr370172285a.19.1795000772581;
        Wed, 18 Nov 2026 03:19:32 -0800 (PST)
X-Received: by 2002:a05:620a:1992:b0:93e:5060:f929 with SMTP id af79cd13be357-949997218eemr370169185a.19.1795000772100;
        Wed, 18 Nov 2026 03:19:32 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.na.qualcomm.com ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d29c7b7sm47426705e9.5.2026.11.18.03.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:19:31 -0800 (PST)
Date: Wed, 18 Nov 2026 12:19:29 +0100
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom: nord: add GPI DMA nodes
Message-ID: <av2JwTRWxL2BXU8e@QCOM-aGQu4IUr3Y.na.qualcomm.com>
References: <20260921-nord-gpi-dts-v2-0-4f297c983b94@oss.qualcomm.com>
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
In-Reply-To: <20260921-nord-gpi-dts-v2-0-4f297c983b94@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=SMzXx+vH c=1 sm=1 tr=0 ts=6afd89c5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=Mc1FV3LHUU5Qy8fZID4A:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: awPokvw7GiyPsjjaQzwXWzQjwNH6tv3h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA0NCBTYWx0ZWRfX60AdXhn3q2Bu
 vaMrJ0rg88ztZH6HUti5ZhR/76nIo9acYxvMTRZli/kqi1uu+DvPv3nGp7JjudjdxVJhDw7MWQD
 CADNfFbHATg7hOcUsnVMhij/qPCmMb+DsAyd3oEbf07eoX8cKSUwRyBP5Mh1c8eVMWSDl7S6FOZ
 qjFIupqipWwGO+XwyLw8JUjTO1Br7V/ui1XIGFLqkWIq7TbsnB1zZDJRAavDiFUSslyv3dXDT0l
 1Nid+ro46yYoo0FltbAAGj3v5XlbtZHm/UQdDtAONqg0RcRJvknXx/U9WKlAXHJ/P2a1GizPQfi
 gy1Yc6AeRKAG4tWKpshZQEx0TG0MoIvqN+iZ6O7wpkm4d+CI9f19wPbw6KSqY7FLbTC6Kj8y4Z7
 bFVDgZg2HuSb1Gi8AczVxPJ4cZGOx5UTJF7J5rY7lgnGfAvLK/trcVmt+qJGxAqNRVOv7gmH8wS
 OHsj9DXZ6qxeVgJHXsw==
X-Proofpoint-ORIG-GUID: awPokvw7GiyPsjjaQzwXWzQjwNH6tv3h
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA0NCBTYWx0ZWRfX5txr/2bXVhRx
 HwjL+/WTOK1ANpa73OPuRXnylNatO4s+vFTQAym1/xLeEbXsDXN3TaDOV/hABalSsX+4AXtwV0/
 J0BFqpYEeD/uNGD/1QdMeKgLVWvP7FI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180044

On Mon, Sep 21, 2026 at 04:46:57PM +0200, Bartosz Golaszewski wrote:
> Add GPI DMA nodes for Nord and reference them from the QUPv3 I2C/SPI
> nodes.
> 
> The DT bindings patch was sent separately[1].
> 
> This series is rebased on top of current linux-next.
> 
> [1] https://lore.kernel.org/all/20260916-nord-gpi-dt-bindings-v1-1-857bf9e84999@oss.qualcomm.com/
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> Changes in v2:
> - Remove dmas and dma-names from uart nodes

I'm sorry that I did not spot it before the patches landed linux-next.
But v1 does not have dmas and dma-names for uart nodes at all. From what
I can see, v1 is all right, and it looks like the v2 rebase moved some
hunks to the sibling UART nodes (identical context). The QCOM_GPI_SPI
channels of SE 0-3, 7, 8, 11 and 12 sit in the uartN nodes rather than
spiN, and spi4 and spi14..spi19 have none. v3/v4 carries the issue over.

I'll send a fix for that.

Shawn

> - Link to v1: https://patch.msgid.link/20260916-nord-gpi-dts-v1-0-073e3f9c19d0@oss.qualcomm.com
