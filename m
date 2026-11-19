Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084855;
	b=kNhLnJoxKMm6zyTtQil6wU/CqlHpESjLliELa6y7WKqdLtWQmYviME1iErcKbrA8E0se
	 jF+vckerdUF8V3FCTg+CpiWOw1xtecYcmIpvpzfwW1gCY2+mc73Oio/NlA8LTcV+6Ib2K
	 A3TPbxmB1KseGjsIWi4GunUYxXi8L/3GGPblk80V8gfP6ypdjFAZIL/Gonb1S6z4RaxCW
	 IozdXn8Z7adsFsE9T6NTtWwfLankbe4585k4zDmQwVrQmz2nCtwavTLbMVIn4ZpIp3Lra
	 88Xenr12JrkbqgvqOrrNdLbMYIBFRG7qo5fISkjDzb0qdGroFne9fevDNj7MAg11JJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084855;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uWn3Y+Jdz87hhj+gJPn7knzbPk6e9lytITsJOXk9EDQ=;
	b=ClhY/02WZ1prUshgIjFUH3lhh/vkWgyc9HWUkccgxq7vriacs/u4SlX4ORrebdmUfiU5
	 A9F/ABfYvS+ERgoqpKbn7ZdPTp8nywEZ3rzHWHyUxl+HVpUqFcZlKsdtytnFKwo/TuBuN
	 TySpgHCprJ+QDPksFbRKnG6o6vWN7lW7SMWYilcA5TPCILUvaWujKny3Ses4yrYTm920i
	 OoJOP62W4+RU41di3C4ftDjrfLJyh3n7m0kvxSzSB59oWskL7t67FC31KDScONv9oJEq9
	 Ny/z7R8xcLj94x0nHWg6h85u6QMsQSQ2zVrsymzQ7qyMi/XeGKwzjjv5MOkK1/Y6HPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pKS44ki5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JbMVzEDV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E34F606A33F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:40:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E34F606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pKS44ki5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JbMVzEDV
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ97FA8352967
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:40:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uWn3Y+Jdz87hhj+gJPn7knzb
	Pk6e9lytITsJOXk9EDQ=; b=pKS44ki5JI8wObyvuYSumrjV1F5uMVnuWt59cV09
	bRFFE7A7VpaPuOM7Dbqd6ZZh6PASdsXRtcxjAaRTRTv4Rg/yL8IY9394U7Tp+qTe
	P/EAgkr5hs5MOLN0HRRZByTTjRCVXnfFE13AaCeV8l8svPyZOoxn9CCPUzmy+j3t
	X6WVigE6NAG+ZUoI/oRP9nz+eNVNwVLxIpYQmpFVgM/VfU7QWQ1wo1zod+v2I5Qb
	9wy6GIZMmBu6DArSWgh/sKYGOewFyTsUZY96ohYerxdWgsXiFyEksFx32tDmoltW
	UnQzyK5RQ0esjcC9cDasrNWusVJFhsD1Rc60qM41NObSYQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1x708dsk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:40:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94960131b4eso393286185a.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795084850; x=1795689650; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uWn3Y+Jdz87hhj+gJPn7knzbPk6e9lytITsJOXk9EDQ=;
        b=JbMVzEDVTonCN2k097ARRHghZWoC55YCGFr431+WiqeeVuoLyPDx4xDyArtZGpfbQW
         0J4FOFSWah+YdAOkWaQE3DKWAP/Go/mv7P3qfkhGTVtopAMnBtkuhYPOmuz9T2jvrc3S
         I2nhq9AKxExaKxIp+i7RHnjKB1ddMi4HiujIu+1brzgF/4FGoy8VZLQ2r23bHblsOuJh
         VgMXr59a1+eo93AP0aE23aKYmhSutVIFI7X+q4zwTTBz/754hXg41PWZ9V8XPWMrR9xZ
         0DZVneLhJ+tUJ94nhsvWgB59uQWo9ByO4/AuM0/qX0qqIVwetSnPgYNEEZEgt+2SRfzQ
         HWcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084850; x=1795689650;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uWn3Y+Jdz87hhj+gJPn7knzbPk6e9lytITsJOXk9EDQ=;
        b=fa36kV0UgLwopE9aWqX54oPrDGBBFjJjhklU1WiHVM3QW6TYxffWSY2nCaHNRaAaDl
         Qq+azZ4ZEnziWkBiyvuthApFdZR9wfnK5O/enA8U6/OhwrNG6h9LrSdDO8GH3qVn7PMU
         FF9/+YDqwaWH6nXFAkTX3OhWY4Wpw1hzsTc49UMa5MNE9ztJItNi+Q73z3bu+3Vg+8zV
         Fqdkb2kepN9jLutbZxJSQCKIipjpQtmQnjN7pAok3j201hTF2d8DeBRC+0RFuT2aCdV+
         UjNryyiQhjMC3NPGokevPO/7lI38ZWa/wklE5dQL82Ehua5NNC35FczVNoJ4gYF31C/K
         54AQ==
X-Forwarded-Encrypted: i=1; AL+hErEffaNCLZIOiE1VRhGvPGilVEB2jHHvwxRW2Y7WKryzG285N4Nd9tTcT2pTnEC+6gf2rAxvOcg57+DIlm8=@vger.kernel.org
X-Gm-Message-State: APuU4Z96IHSkyMeqfgScapkv8w5Kyg9MKzcFka+k952CBzCWQuXnYYRj
	bvuQ+npGZxaJFsuF89QGN4Rk0UqJ0FdBzHxeMtpIfLLipc1OOmjRBQKzrmCO1CFdSiIePq9HpEv
	KesGD44AIqFnulp32WO4J9m8WzcKjKTSLkZtkSazBWyFmGtqg0wydSclGOVsPbFr8ebVH/aaLkT
	o=
X-Gm-Gg: AYBFou1AZULWpIQU88cZOH3eS7E6bE2AbaJWmq46mU3ZDLRV/kWZQhMUvL4RqBIV8ad
	44pglgPj96X22HM2TiFuoZFxI0+vclj/v5nqC8e6oqme7338UTuU3+07Z8Q9JaUOdhz6NKMx0WO
	vBztjHNU5lMr7d3UicQN2SAQbh97eLBCU5oqzdiHqNtakC4YYGJtkRhBbHVtTV6ED2+07dit2lP
	GqdRjcRdHmK0PTx2UZ42Ez2jYKvyvYkQZPJWxQE0NZsUdgy9KDBwk24VU5SXbxSgsFtIZbPxge5
	giJgb9NnSD/irkpHmNRYoT8owt9Ej/o3b9zM4ndzuFRAKqu5Y9+9vz+n/O8kYBs7ZvfLcu++ccq
	p2tArxRM5ykaUozXP+DomDIy/RqC7URRCv2ukwj5QKGiWqxBPXgJ5npTI+OLT205P1Wzuex6rlO
	Q6TilJW/Jls6g=
X-Received: by 2002:a05:620a:461e:b0:93f:dea:3b7e with SMTP id af79cd13be357-94999721e29mr990594285a.24.1795084850216;
        Thu, 19 Nov 2026 02:40:50 -0800 (PST)
X-Received: by 2002:a05:620a:461e:b0:93f:dea:3b7e with SMTP id af79cd13be357-94999721e29mr990589785a.24.1795084849693;
        Thu, 19 Nov 2026 02:40:49 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.na.qualcomm.com ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85343607sm31483185e9.6.2026.11.19.02.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:40:48 -0800 (PST)
Date: Thu, 19 Nov 2026 11:40:46 +0100
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
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
        Shivam Rawat <shivrawa@qti.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Aastha Pandey <aastha.pandey@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/5] drm/msm: Support for GPU in Nord
Message-ID: <av7SLvRI48ZfOqU7@QCOM-aGQu4IUr3Y.na.qualcomm.com>
References: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
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
In-Reply-To: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Z_5kx6vgSt-8WM8fDbSzAI4R030lkYf-
X-Authority-Analysis: v=2.4 cv=RdgFmFtv c=1 sm=1 tr=0 ts=6afed232 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-_VEVeJjoQ_3OyoAHY0A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA0MiBTYWx0ZWRfX5jRaCP7vXMqo
 Y6o9gP3IsComudiPHTCbD9bMbVZN6Whdfxsluf+mOEWDobIWuuNfxGKBXE/1PqzY7TA0LYzzkRD
 cm89qUaB4IveQmSP1h04LnrNdja+PUo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA0MiBTYWx0ZWRfXzwl3C8xrurTg
 ATZMZqeBMiZeLfvF5x5iglbTPJhNga0+6QhDJi2Vi+rmrGpEmsLeUajPaxBjY09vhBBxc6KaHX0
 Kxyw6bZFUF79XxxjDXUACTneFhThwNVSmQ45p1grc85urGygbqTDhWAuZDKaXvD1Upu4VUww/6u
 pP+ilFSbAK30DrErxUeY71oNpNKHDnMx5RDDUkM3monu2ZAJVvIyxaX9NijYngBSv7Q1qwMX6mU
 RXZCWvo8cmLxL6AOD0Npb1Ttajsz0RG6CU3RssupOD0bUXatiQqMm8wtVv/iepV/v38ItRNZc87
 lSMMIVQbofO8GN1K6uPC8eIkZ5+WSc0oc7s+kxdT3/oj1YkEvTwCp5gWe9ywCn0kWeo0Ohsq4IH
 7Fd4SBKqalnRPDbtIMiO02v0AVsDvR+2b5Gpw9TfhYW5us66rM+fn7HKFvdJfXsxP0cAjac5fsW
 p9qu3WcA/eaGa9esUFw==
X-Proofpoint-GUID: Z_5kx6vgSt-8WM8fDbSzAI4R030lkYf-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190042

On Wed, Nov 18, 2026 at 04:30:03AM +0530, Akhil P Oommen wrote:
> Nord is the first Snapdragon chipset with 2 integrated GPUs. It has
> an Adreno 753 GPU which is very similar to the existing A750 (SM8650
> chipset) and an Adreno A735 which is similar to the Adreno X1-45 GPU.
> This series adds support for the A753 GPU. A735 support will come later
> in a separate series.
> 
> The driver and dt-bindings patches are for Rob Clark and the devicetree
> bits are for Bjorn to pick up.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
> Changes in v2:
> - Rebased on next-20261116
> - Collect trailers
> - Split the GPU and GMU nodes between nord.dtsi and nord-embedded.dtsi to
>   match the existing Nord layout (Shawn)
> - Moved the GPU cooling maps into nord.dtsi alongside the thermal zones (Shawn)
> - Fixed the GMU OPP table to match the clock plan (Konrad)
> - Link to v1: https://lore.kernel.org/r/20261009-nord-gpu1-v1-0-a06a6c57bde7@oss.qualcomm.com
> 
> ---
> Aastha Pandey (1):
>       arm64: dts: qcom: nord: Add GPU cooling
> 
> Shivam Rawat (4):
>       drm/msm/a6xx: Add Adreno 753 support
>       dt-bindings: display/msm: Document Adreno 753 GPU/GMU
>       arm64: dts: qcom: nord: Add GPU and GMU nodes
>       arm64: dts: qcom: nord-rrd: Enable Adreno 753 GPU

Akhil,

For the future posting, can we split driver and DTS changes?

Shawn

> 
>  .../devicetree/bindings/display/msm/gmu.yaml       |  33 ++++
>  .../devicetree/bindings/display/msm/gpu.yaml       |   1 +
>  arch/arm64/boot/dts/qcom/nord-embedded.dtsi        |  79 ++++++++
>  arch/arm64/boot/dts/qcom/nord-rrd.dts              |  12 ++
>  arch/arm64/boot/dts/qcom/nord.dtsi                 | 220 ++++++++++++++++++---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   6 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |   5 +-
>  drivers/gpu/drm/msm/adreno/a7xx_catalog.c          |  35 ++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   5 +
>  9 files changed, 361 insertions(+), 35 deletions(-)
> ---
> base-commit: 38c8be16846f10f3a710351357e4f4ace7254c8e
> change-id: 20261008-nord-gpu1-7e71a91ae653
> 
> Best regards,
> -- 
> Akhil P Oommen <akhilpo@oss.qualcomm.com>
> 
> 
