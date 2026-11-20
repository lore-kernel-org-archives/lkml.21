Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795181198;
	b=whlx0cMDAaec0B5jbnwbs7vuTVNr0tpIo3tAt5b3rSB4cqpZSg2JlglzYEPu4D4vri0E
	 PeNV3hlE6WI4uvDGGnzXEOboYT4G+GamSASsB42sjT0rVEqQSidiM4EpNJtuxz1KGAz7N
	 BNvg0hnZPPKHh5d0mYmCh6doJPEXtCTfT+md9OKDSfky1T1EjwP60vsniuFk5HsYgFPij
	 T3donFJAQsAcPG7NU0h4vmX0NkmsFWDXIZGHwJEKKVCHzAbf0P/4CZEGNpVllX6nnlfTQ
	 TGPbF8OCPAd8P3UPMVtxkefYNimZSwD4QSPq9uOVAQdpvjXKq1tVUZ3Fs8VBqLgvojw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795181198;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=m7pJOzBn/rZUt0tix/aChRrmugNdZ0976VxNnvqc6jU=;
	b=WHbzkMmxXyJcj29VNSM3NuOsoJiwlHEDUKHipaOOVtWJwNssMqhQQan541dcztMVAR8E
	 FCCpMgUayrG5eqJbLE3C4I6hRpd9S+FM4zrsX3NQ1H14wSrRx8V9APCTFmrlbscAWtPLL
	 7UeULLVX/gnsmR6UDEci5r+D8UaUehjTuqLovfyBujSfDDATYDQ2yuqvvA7fi25weJG0s
	 XXPrvbslNxFdwUSEZTtSVNUvDW3JlN5/+SYCn6ablnluzxV5CJoPlqYEV/IZNUDKMHJ72
	 ewPRb33uvF8CRV0k3UpySH5hU2gnwzriSwf5JFLjOd/NyvBqkxRH7a3jWJ4fBK4vtuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WW3IVOUg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="j1l/B9Uu";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87750606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:26:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87750606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WW3IVOUg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j1l/B9Uu
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk6LE3987226
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:26:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m7pJOzBn/rZUt0tix/aChRrmugNdZ0976VxNnvqc6jU=; b=WW3IVOUgqZt2JDN6
	rcYX+9pgdjsLTzLooxM31+fC8UmexcaTte8Sab2dXShQeDo2AlpyRl9Nr3NN16iI
	9t+Hxm+0eCSO98atvXzK3nl9BHXmin1yny4yh4dYvQYzI4xkqogoa0US+sVhYCAc
	9RdJ+E82NtalK6RDuy20fsOsbmqeQ03JKs5te58PFqHyZeIPz8k3Q4v2tBQVIwiM
	C/THG8hXb+BRrzdxnEN7J0JPs6JFVqD/2hLNY1FC3nxY8QRmKwOQhdJZgPNfYrco
	CqZlnqiyiC0gpREHzfyEb5JBdYXefo0n2PopyQKo3ug5/VgMdvYJE+LAw3nqioeX
	woN9Sg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2gu81naf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:26:36 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3846d5f54c1so1129942eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795181196; x=1795785996; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m7pJOzBn/rZUt0tix/aChRrmugNdZ0976VxNnvqc6jU=;
        b=j1l/B9UuDLjEc0Jg5PVUu60ymjGMJklgVwx8jxWUxRGGFwBkb5tid8QvkCmTurzJrn
         P/36Jd6NpME2g/pImTQdvpQhNN06iJPGc5tdytgBW24FdHfAPijtl6LJhj8/NPcnOSlT
         JjoEJAol6q5mU62g6fkTGrun9U+tZyx+3tx7UDlDy9JX/5lyAVsqJlwe3cd6/D+b7wF3
         JJTBUGWKQOwTpAa3ehYOV4cXwYUit/ju+ZiB1hx40D5YKnV2j0QOmZqY7RAlJnGgGTf5
         2U78M7qbEF3ixh29YZTchyFo3dOyVdQ5Wz5piDvrjxvHUFAvx8gdKEcy1G1TU0rRytHr
         7Z1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795181196; x=1795785996;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m7pJOzBn/rZUt0tix/aChRrmugNdZ0976VxNnvqc6jU=;
        b=sZ6lnCdzyAOG+eFqUVU+TOzQQmTFYx8TrIqR39T7jt6zlZO68wPpdVwd212XCOpOXV
         Wfvub1FYDas9pvhRNWv6lTxBiNjU4wHd+f3vZdkS2fsp3DftcSinH026cWk2RZP9OiFp
         WG5UQzYBXo/iz5XT1uHtLNWTnWeZ/Mdf5vSH8SfqV4UBEe+cr+JuTuB6lI3AiB1jxVpg
         vJPTDrv+c2f4kyTCxPoMv7NnFW+1MP15sdD0JoMo5+lcHV91o4/ZPSpRcqny584ozVSV
         sP8ZYjrsbtZoCHM2db9+fCXGOL7AIOmHVd34O19xXQz5ZIQUTOX5Wzl/11OwjQjTtoGJ
         TeBA==
X-Forwarded-Encrypted: i=1; AL+hErGmUTl2VBHMLm6KDWoM8PohqgCH1eqVq6DbcQw/p55gfNgDrAsJDGm3XMZ9IatnPiomijEikPC+tcGgJEI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/Ji/8pR2sqO5njn6aHZdC7onxhy1lzbW7IU/ZovAQrXB2GOwx
	XIuCcdlSkXBHp69pogAV5HeEG8UFTMmGvKT6NHHN0TVnoNgey3HH9v9ilQJP0EekGxkrKv+uGWm
	m+0nZKUfndId8z2WBYord+pv5NqDXO2zojeJ8VjghADB+8sQ95xzBBDUvhld5oM0o9lE=
X-Gm-Gg: AZFdTZfLia0ijxyDd8nBhPCetupRR+XepnJDBvVZ8EK8Yom2cStIMFlSaRNQt6SiDpr
	1EQlIVA/B+SHn7cOm2HpIR7MekDTktDr7h4kpFm3T6bV8GI8rfV3VhSEGNoKUEeAKrbXlotTWnv
	8uWcodIsQKEsyTxpx/0x/xK5yzi5rZPgYiFxnJnAGIfjcQ2vv++TmgIyH+z5IqnpS8J2Y1y+7OK
	iZTsDgFCNGDWlnkwgS2/oYWXGEIEPMSW/wbXvNCoBhsobhiMy+6uzTrWoLd+mX6hlyQI1de8EIr
	5w9IWczNCA3xhUfyfNxSATpftnvld9uteu4vNxPjm5HPPfPl/dmFu8f+rZNu2VtcN8M9QCKLlIb
	eu7QBPNswfc/s3ULh6EqcsI0OFgAAfe/6yLl3mk9qsh+iU4sw8CtI2Ky1UtZD/I6worhEpcK7xJ
	KH
X-Received: by 2002:a05:693c:8807:20b0:380:c3e7:7814 with SMTP id 5a478bee46e88-3856f65e4aamr2679268eec.7.1795181196091;
        Fri, 20 Nov 2026 05:26:36 -0800 (PST)
X-Received: by 2002:a05:693c:8807:20b0:380:c3e7:7814 with SMTP id 5a478bee46e88-3856f65e4aamr2679232eec.7.1795181195409;
        Fri, 20 Nov 2026 05:26:35 -0800 (PST)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm9691731eec.26.2026.11.20.05.26.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 05:26:34 -0800 (PST)
Message-ID: <293200ef-a480-4732-82fa-e452bd5eb61c@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 18:56:26 +0530
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
Subject: Re: [PATCH v7 0/5] arm64: dts: qcom: Add EL2 overlays for Shikra and
 SM8750
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20261120-shikra-el2-v7-0-b19595f24eb1@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20261120-shikra-el2-v7-0-b19595f24eb1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MyBTYWx0ZWRfX+BzG5L9V9Q88
 J0KhiBU6IT52SvLFGmuNpQAuBpHLbCYvo3FXGg7+O9f+ioJOq+Vg12XxSz8htx8hwdGbEHomIyf
 5g/fWvn7kPKzDoTsYlaqzWXAdKS3D5gG+lIboGKMySpGpvaUvakpib6B1timf0u6/h8yiTuFLKA
 RfVjei2yXuv2Cx2B5XLcIEGr7MwghqVLXBNHrUgM1WE4c2hpPGuWFrKuAXhgk+aNpTmeeDACaK+
 2/MMVuaKw6hsgdIPQZBT5hwmzEqW7hHJhIjG4/E/ulWjimcQi8F/bIOfF4BzN7UZeTB479/DmSO
 Z2TyLN/nyxaiWISMC1czT77QmYzobw9+RuR8jKzm8ogfCweqLksquJMVaPtnFvnPUvfmvOM8pNL
 NmtR9sAfQYyConSzLCraY+KRiWCzpXa0UIkFIhbIdP6U+wwesemWm5RBVsCt95f2f+qlBd1INIS
 pVHxyaHDFN8kxlMFn+Q==
X-Authority-Analysis: v=2.4 cv=bLeDs/+Z c=1 sm=1 tr=0 ts=6b004a8c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PcqzsH88EwdISXoLbJQA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: bcUwoIvklSTAqmjVFhWuMIz9jdjd70HC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MyBTYWx0ZWRfX3CKFU06M5/o/
 IA1GlFp5y/WHuhwjLyMHuU69XlxmdoV4A07fxxd8w1JZjz5iTxsikgS87GBY9gVMOORd7UyCEYR
 Q+OymXg8bBMXo9Cv0cAEP6k/O1OwHVQ=
X-Proofpoint-GUID: bcUwoIvklSTAqmjVFhWuMIz9jdjd70HC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200053

On 11/20/2026 6:46 PM, Komal Bajaj wrote:
> Shikra EVK variants boot Linux under the Gunyah hypervisor (EL2) by
> default, with Linux running at EL1. Booting Linux directly at EL2
> requires the remote processor firmware IOMMU streams to be described
> in the DeviceTree used by Linux.
>
> Add a Shikra EL2-specific DT overlay and wire it up in the Makefile to
> generate -el2.dtb artifacts for the Shikra EVK variants alongside the
> regular DTBs.
>
> Add a similar EL2 overlay for SM8750 MTP, which also boots Linux under
> Gunyah by default.
>
> The series also moves the Qualcomm PAS remoteproc iommus constraint to
> the SoC-specific bindings and relaxes the item limit to accommodate the
> remoteproc SMMU mappings required for Shikra and SM8750 EL2 boot.
>
> Komal Bajaj (5):
>    dt-bindings: remoteproc: Move iommus constraint to SoC-specific bindings
>    dt-bindings: remoteproc: qcom,shikra-pas: Add iommus constraints
>    dt-bindings: remoteproc: qcom,sm8550-pas: Allow 6 iommus for SM8750 ADSP
>    arm64: dts: qcom: shikra: Add EL2 overlay for EVK variants
>    arm64: dts: qcom: sm8750: Add EL2 overlay for MTP
>
>   .../bindings/remoteproc/qcom,adsp.yaml        |  6 ++++
>   .../remoteproc/qcom,kaanapali-soccp-pas.yaml  |  6 ++++
>   .../bindings/remoteproc/qcom,milos-pas.yaml   |  6 ++++
>   .../bindings/remoteproc/qcom,nord-pas.yaml    |  6 ++++
>   .../bindings/remoteproc/qcom,pas-common.yaml  |  3 --
>   .../bindings/remoteproc/qcom,qcs404-pas.yaml  |  6 ++++
>   .../bindings/remoteproc/qcom,sa8775p-pas.yaml |  6 ++++
>   .../bindings/remoteproc/qcom,sc7180-pas.yaml  |  6 ++++
>   .../remoteproc/qcom,sc8280xp-pas.yaml         |  6 ++++
>   .../bindings/remoteproc/qcom,sdx55-pas.yaml   |  6 ++++
>   .../bindings/remoteproc/qcom,shikra-pas.yaml  | 28 ++++++++++++++++
>   .../bindings/remoteproc/qcom,sm6115-pas.yaml  |  6 ++++
>   .../bindings/remoteproc/qcom,sm6350-pas.yaml  |  6 ++++
>   .../bindings/remoteproc/qcom,sm6375-pas.yaml  |  6 ++++
>   .../bindings/remoteproc/qcom,sm8150-pas.yaml  |  6 ++++
>   .../bindings/remoteproc/qcom,sm8350-pas.yaml  |  6 ++++
>   .../bindings/remoteproc/qcom,sm8550-pas.yaml  | 30 +++++++++++++++++
>   arch/arm64/boot/dts/qcom/Makefile             | 15 +++++++++
>   arch/arm64/boot/dts/qcom/shikra-el2.dtso      | 33 +++++++++++++++++++
>   arch/arm64/boot/dts/qcom/sm8750-el2.dtso      | 30 +++++++++++++++++
>   20 files changed, 220 insertions(+), 3 deletions(-)
>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>


Sent accidentally.
Please ignore this mail thread, refer to latest send [1].

[1] 
https://lore.kernel.org/all/20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com/

Thanks
Komal

