Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794972666;
	b=mMzQfKsBBa6ZPly/pIF8kbNgvETo7quPzzV9yToLB+WwUapaBjsQF9bum4Xmoek/5wtq
	 ksYHX5PDF1rIuz9Dts1XmzfMd5LcsU4rDHkfmgX1hkpYJ0BFYoWHzchgtcuTkmfG7DgBo
	 tqkdodYd9qjvOsVpd7AV8w+rKNm10C5P66jqSaDvD6olSCd6K2+khOvk9s32ebUBJddas
	 OPJBB4roU82iTMfsQzeeBqQqdS9USNVbB1ADq3M35ukSJnG4i6YZWFILw9B/WZt80gs0p
	 i8wklKe99vr73swWRnJi/fDcf3Emn6N59aUr7ppNdAzYjf6qNdhSwTetY7AV89VLM6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794972666;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DLrT5Mh7fC5h8PM28yHTHw+H7Tw5FCOseBcBKNYwgUk=;
	b=g9ZbghSTtb6zzyzwFsMQ8lWV4uH3Rx3ZhdhCUu4Tch2IyBC3MffLMjzw7HL2DnaD5aAO
	 4MyCFcq2QEtQjs2q6H+nfNHroFbQfD2mTAhHhgEj5Uv7+PivUbinWw58Apl6n2eh3JYjl
	 6GGNuFmxXiwwlxRnw5/gnyRbbbDZTunB6Ce0Kw00OudRrIey43fsZBZ7Ryauq3VbXP3rR
	 d7L1FqIZDFucDoHtChfyoWRFL/DGGFS7FLlhs39m5+CuvNFrsns1g/KyCP8utUrO5TKEs
	 acCl0I4IAp1e0+tClxhG0zS0XneSrBNWaRD947GKdmMjYP8Qczm4qq3A+pNAIgbTNbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VvsUyW2m;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KpV9QlD8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807F3606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:31:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 807F3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VvsUyW2m;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KpV9QlD8
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Vxxx4059986
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:31:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DLrT5Mh7fC5h8PM28yHTHw+H7Tw5FCOseBcBKNYwgUk=; b=VvsUyW2mxCoem6Qz
	k52PYDF93mU2kFdVyPVt1c46WNx3vkyQPzJXLm6a+sOGs0D/nCe5RghCLYt4FoOP
	+iq29gOgHgSa7zsVGaLbmUEUCOLJfwL63S51QuTpO078sL+0L27+EliRUVhGXG51
	7zJHalL2eUH9FTib/3fEFpZmrM+LHG2cTOjxd5I/iKXIvtX73gy8rfRSougUgbc9
	BgoW8+coGFHqvj6HIw/lPh4eTL+ihAAPd7ervl3trCRFRd/n1H/qb2lhjqX3uRX9
	MjOVbCgoUY/vKZEdvjkyXlGFluNj84eYJ0uJYa5gNeE/NxUcfRQr2umUHfjfi9PS
	s79t7Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvch0pm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:31:04 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2eb5375cd68so5138465ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794972663; x=1795577463; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DLrT5Mh7fC5h8PM28yHTHw+H7Tw5FCOseBcBKNYwgUk=;
        b=KpV9QlD8kNJTkzacr6vCHk7+67iQ0xgsW0dXYWJwpL51reCUcI68/MZVhItl3s3EQo
         CrOSud/Dnxxt2gGgalQUStFZu8YK/5vpNBJ22ohAnJoTyi6X8/mvAzthrmgHqLm/3urm
         TZyhjxoe3dn5piQsUtSESDCezaNmlgvfUdEeowUlmaLSY15FKl4ia4vkt2wh+1gP4O3X
         E+yrVx3w1XMi3yxEkz9Lr1w6f7KI5UZFyYmT00PZDQG6beZqoR2kJzgUVkbxvNAyoZ3y
         r7kCqJ4n6ENkoXE7Lxe1k1isoCRGWO+G0kFkp1PVr7VyYuak22fUzUEo7M7MS0gfDNXj
         A6Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794972663; x=1795577463;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DLrT5Mh7fC5h8PM28yHTHw+H7Tw5FCOseBcBKNYwgUk=;
        b=qQaUPCPvac0+tt1Tlcy9DaZyjjus4wvLJrZGqCxw5Ux+YN3OMje4E9+1NraCdoXyET
         0LxIO8Ef2v3O3KZ5exyjJNb3D58Hsg/HafvCTVilF1kdi25tIiLh4Gu0IX1MDw7er2Ba
         /W+tky7xjbnV7Ak7n1sgobGjWe607QjxT0CUqLgG6XSV9Mr4SbvBQKhQFzbINcZnPbyt
         RiIFfk1gejkbkJGZ2Ep/q3pi0vd/KOU+52IutxGY1fOjuvr21L+0EMDMbUDOMrY454Jo
         lBkb3t52Jx6P422bwPaX84EIB9v/WmeP8iCugGTePnKTrrScMBEcBfK/n7EiJeumVba4
         g7hg==
X-Forwarded-Encrypted: i=1; AL+hErEOhlVxdYgebmciL/RWDcNiPMrEcG0uBycc1ivDMZUC4wChBzsSdwJ4JDnV/lko2ED4be7TBDB63zNeOYc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8V0fLudvcy4Vm3XoDNbhRpKgeD7xozL5iSS3PTdQjLoMld7C/5
	mTRpgCxqrXwtSwyNFn3+sGZHZe1B2TAg7RLUKRBlHYrdwCL9blgIOBNwLxbGOelRfcQAMWkMA4o
	DjUKA5BRUY5kwqJ355FL7ikIas6MAtCmCT6jWuOBdE/2MpzKZOzgVAPuGECWHuOD7Fz8=
X-Gm-Gg: AZFdTZea4FqV/7BKPs8jAq8Or5Mtqlt7GShGAj9xqPfEyKFt6a5YPSScX7mRjLEozza
	AnKUGg55hPP/sFhTLhrcoj6WhkptpCFt8fIHsrq/EnXptFtaavh0Tp7mbXfSA2peCRIviPJX+0A
	0/sKnUqJtFB6DpFRkJlJYjHsXyYtvmwrXStsn4A++h1pS3qu8beCAMVodMaF8UtJK1ZwXfv4y37
	H7kPMSd0q1NOsDfZkUME9soooi4h6S7Uij2AV4NLzNlNfytVUMCFG7ltE86mo1K648xPHxkXsX+
	KyTT5sYzio5uY4SnxZs/YhbheMrDf0l0GT35lwEYQbnuTg+QT5Vs6FmxgdTYixqTbNgO2jZlbUP
	PrJZJXk0vpNbbowCVUwnSbK4DPOUud2FIHGN2GXNDCrYbNKceN7foDL6gywjwZgEis6umtuoX/e
	5MR1NQ/P4=
X-Received: by 2002:a17:903:1aab:b0:2ed:42d5:e682 with SMTP id d9443c01a7336-2eff751f06amr11721475ad.41.1794972663154;
        Tue, 17 Nov 2026 19:31:03 -0800 (PST)
X-Received: by 2002:a17:903:1aab:b0:2ed:42d5:e682 with SMTP id d9443c01a7336-2eff751f06amr11721145ad.41.1794972662720;
        Tue, 17 Nov 2026 19:31:02 -0800 (PST)
Received: from [10.218.42.145] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff61162d0sm5287935ad.20.2026.11.17.19.30.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 19:31:02 -0800 (PST)
Message-ID: <1844d833-caa5-4a35-a601-2da1700c0d9e@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 09:00:56 +0530
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
Subject: Re: [PATCH v2 1/6] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 qcs8300 16 GT/s PHY
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261019-monaco_ep-v2-0-852cb9f5d012@oss.qualcomm.com>
 <20261019-monaco_ep-v2-1-852cb9f5d012@oss.qualcomm.com>
 <avWZJr2eIE9KrV77@parshuram>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <avWZJr2eIE9KrV77@parshuram>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afd1bf8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UoCkNwF0umAWgb14yFsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: uHrOgGcmkAjf6uC0XAGnyl0AnqdsQEb7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxMyBTYWx0ZWRfXy7XkNSXzk53D
 mZ5HUObaY8dLmXGrhjqmipZOeiNbqY1MdIDg3hVP6woBYM7SBzf2A1rBMAEipxpdsIXwygj7tC9
 S7QHRDpmkHxIEX8zL8n+IxqeyubNICU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxMyBTYWx0ZWRfXz/nKD2Sz6T6H
 u4SlCNEeCyXPDMW6da87d2biXT7fKAieHYHr0bzfBZ/IsxPiEu5i4yDFifNPxxF7WHeWvkVd1if
 nkVL1bnlhmxJcS3yN3I6QdoRWKw98nszBPRcp/od17EPh1kXr476SaIu1+YPKBxlkyKP6vMF3UM
 uz2UzE3lB7wWv7Wg+gvlPhMxTr6BnrQKhoJHY/yzLyrskid8QiOYNKaRkqmA3jDOW2hvrf2gacs
 U/3Rte76sCKE6qeEK/JkJpMmAAy3MaFU5cZtbW/KACeEggTWqj+N4qe/ajElIHNvQyIOKMVouUV
 L2PXRafpWucVqZZekkpDSo3BbfUY0gGD6hREBOejCWUIm485Zd1k7gyCwxM+Vk2Z2ocHqWfvCvY
 e16JtBVOzKZ7tO4NSM1AvS7QY4l4T7vYzzsnlwQ/rL59EoxXUi2rR/Obbp08w2naZso1Qsqzpkp
 Fhl9isiARg9aDYYdGaw==
X-Proofpoint-ORIG-GUID: uHrOgGcmkAjf6uC0XAGnyl0AnqdsQEb7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180013



On 11/12/2026 4:17 PM, Vinod Koul wrote:
> On 19-10-26, 14:55, Krishna Chaitanya Chundru wrote:
>> The QCS8300 16 GT/s x4 QMP PCIe PHY was previously described using only
>> the qcom,sa8775p-qmp-gen4x4-pcie-phy compatible, since no QCS8300-specific
>> compatible existed for this PHY. This was a mistake, as it left the PHY
>> undocumented as QCS8300 hardware and indistinguishable from SA8775P in
>> the binding.
>>
>> Correct this by documenting a dedicated
>> "qcom,qcs8300-qmp-gen4x4-pcie-phy" compatible, with
>> "qcom,sa8775p-qmp-gen4x4-pcie-phy" listed as its fallback compatible.
> This fails to apply for me on phy/next. Please rebase
Sent V3 after rebasing it[1].

[1] [PATCH v3 0/6] PCI: qcom-ep: Add PCIe Endpoint support for Monaco -
Krishna Chaitanya Chundru
<https://lore.kernel.org/all/20261114-monaco_ep-v3-0-7fe227cdfac0@oss.qualcomm.com/>

- Krishna Chaitanya.
>

