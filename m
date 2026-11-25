Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795607717;
	b=q7BEse4oFKfvxre+oLtFPrbVBIInSC55pBglDr6p648zLfhDUSiJWoiVTfwiLkN0nigt
	 lCoUsKKNd9HBi3VfGJOQwYLrUfSzkpzHNgOr8S6Pe+2//wFa6HTYfq0b8Yg5GU5yMmim0
	 AGGyTHr7W8tqqOltIS6pFFsrolWY4g3RzfNEwJDlvG+xJhczaSgbJcst7g6Cp7Fts1f0p
	 TDkQ9mVFGbPw/gPPQV3SrAdC4ClvFChIp7IOVnEj78BMgKGjawu354UJvhFNmkBuma+Cx
	 XWs3mNdmrsOISf5dZbxWjUqToTzyQK/3xjaFY8/t27V+xBosvWSan/hpApMSLkNK+WQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607717;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JBdXW6041xgM/R3xogWTctAGfdJvwvz+Sgy/0OZbw7k=;
	b=Sj8GCWL6jPYpUp8w6hHajbAPNyTPvaPiPP02+RUMJdX9J0W+gEtxai4qsMQp12UcFGUw
	 Dl/eh1VoADvKIJoRLI2SEsS09EZmoTz7sdNow9GEVHoWUOZEj8kSVGaFIy6df44hqanXC
	 KmfSZoQNAngLqpMpbvERzYlX0RxCjVEF7l4FNXZrQVkOwUF5UgntmSd7DgtKOtzKdC0ld
	 GGAeTxFLaM+D3YJ3u9jz5Yv8ApwH4qwYCx0yAFiN6QegD5/W5A+VzSIb2rw/02fF0ZkdX
	 MFKH3Muw59TfKPVObIvjzbv+0hAF2EISpkXnyvy2DCKr3Boz2551qAQHHEH5B1r9M2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gpLuirSv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CN3CChNh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9036606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:55:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9036606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gpLuirSv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CN3CChNh
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9no6x1505311
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:55:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JBdXW6041xgM/R3xogWTctAGfdJvwvz+Sgy/0OZbw7k=; b=gpLuirSvA5R1o3Lo
	TIOrM51bNDovilTLlwPSkZlChFuH6XQfMzfkMZ9mHL3xFRNeWczxHAiNxqyTPVKh
	VUE4dXv9qTGMq1XzGZNg8MChlyYDhNkASQtD3Odd5Euw2M2gOupIOvkNVzaiCYu9
	mWoP5LiQ+crC3FU01yln2GSCX8/8o+JclLI0ldph55XUvRHci9h1jC0yFdp4Xg+a
	vpiYcXIjZysGeCPz9pcVy65CWGTsz8U9/qU4hgX7JtwLbRIR14zbgbVmxVf9MzGI
	s1C6T/nke/3TxBXv0KZnatdhBQ3Q0mDTX7mJof0wztY1TPbWc/ieT7QAq3L/fNKW
	3hlZOg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5qa2a2ak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:55:15 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b40e7f4fa2so7766809a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:55:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795607715; cv=none;
        d=google.com; s=arc-20260327;
        b=bz4vL1WaxDajeWeV6JXBV9nrAo2Vcs+FN3IQSW2UH6kCAnRyZJ9PQaIedbJPBGzAr4
         rH0cHGlRTB89DqEbCz3hHSrGoFPT7OC4GtNfYKk4tLDZ44PGVIvwQiGnzE5VOWJgCako
         wPOoW27EArJarHoQK5+LEfmf1bNn46I3bRM3d7P5MFJjtQUUQ2ihNvmjclP3NxEMKm+K
         uCLy5mkNkhXmkDwErjl2uqwYrg4Bagyh6S8+ROC5njCktvN8kWm5yXODsFjW4nWZvNQH
         SS263b31PTWe4Yb2xJsIn9Hv4sDBPe+Xe6XJSAxiXD8FNUH8/0MW6+vrwxwgycfpza+F
         SfOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JBdXW6041xgM/R3xogWTctAGfdJvwvz+Sgy/0OZbw7k=;
        fh=YXG2blH56sUGZBU0cAfhhY1wtaxhl5f44v5XML1toA8=;
        b=iLZhpl0VoXDpn3/9QUnwPLx7641Ef7EMwVnzx7eC/1Y5ZuLkt0Bgli4nGb3t+W5p3/
         ezxh3Us7oNcVPJFBJAoOZkl5Bj+7yWqSeVmNVjJN7As/umLOCALu0gePir7Iptxv8goc
         aPb5cgkpNAnCA6JUkJMe0x7svmjXnu3Fedky1K2K+4Qv+yRWZfzlhWmCtSt8/+Ol85Y2
         6vYFUjcc+HA57XZKlnEZoCYwXVSxuGRx6zgm4eP+vtx8Sbes++meH5Y92VUIkBwLWLH/
         YWs7VepGukRtjawH6cUKofk3gzmqnW6cItigQdmjXjnOXK1Ir1YN3kZXByoh42yYRQ9+
         rJPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795607715; x=1796212515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JBdXW6041xgM/R3xogWTctAGfdJvwvz+Sgy/0OZbw7k=;
        b=CN3CChNh3rJXu2dW5RsLSIZ/0zYr6KZYAM4ritj+8/vxagiuxkNtp+hl4Sx6gV15PK
         VnibtqzLgJx22qU3p1ac9WCZ19iELX54X+KsttttRorTgcIWs1NlmjK/KTb8Qw1nO4w7
         lbnArQ2fRq1M+YKb4y85ugyz6OAjwSe5MIABpNUz1bUYq95mLta8pgb43a8wduJk3+g4
         VZuUbMa3ue3b9FZuMICO0coGzQ7yCv2PqXG6iKol7I5S6FTjxD1iR9fN8rEzYEPRlffG
         nWNVHfUl9JeIlykm08sPT48axBzB4FZKUdg+9I544p36Zzqbd47qnQyR5QGu2pQrMZBC
         Xl+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607715; x=1796212515;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JBdXW6041xgM/R3xogWTctAGfdJvwvz+Sgy/0OZbw7k=;
        b=BiYxAr7xOKA9W5lG0p+YCRin5B1KvR+kKUrh29SOOwctcmI6NABgwv4ey8qC250rW/
         ViaP0hcku1ytHvuxWMzqCjSGSTABRYm7qalhvnEEH1TMoUpOVZ98U1WyRsjyZKOFAa4j
         3RChBPuKyzFxzrd3Jq3WuB8hKHGnEU7Le3VnrBBZ7iyHhjRJjVOtnpoHV5xTe+X/cPeu
         ThfP6Q36JAoQemNW+yF/rcUrtuyNOAXIJfZTARDaSiOAJtLTABJGrDGaSrUyN7jJlCxl
         F3BpAMQL0lS51sT0m5iSk659D2NFfCQVFfwQpleVAvOGL0yxKlG1k6RRDmdXMs7jPLXz
         Ue5g==
X-Forwarded-Encrypted: i=1; AL+hErG0uB7ajEYoeQoOSQ0zOD83ccOjga0A0YB1h5soYWyzjaiR5qV9miKvgyHcyBmMbW/UyBOcggR0fpZsc0M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+c556sBlTfds8Og6v2phfPZJ7siCA1cnP9RAzbeh5kmHgosHNc
	FLVncuYyjYOQkpDMg0obWfbFD3lbzO0nofia2IBz6cWihuCOvd+MZW7sKyXE7MCxT9UQ24ogXL/
	lWV4Aetk4fraw7RcAndIvmhhF44vQLkRtD1vSuhVYLXXF3fMCTPTmfOIrnMH/FIOHP6MkH6TZo/
	eK53xL4WKySrh/GbQb+oeHSPmstXJklkpGp20ykxmfopFfkrSJZA==
X-Gm-Gg: AZFdTZc48aqvtx+89Jk6kGWPIrnf9RrfGWtiNKpt/yJFQnl5YyisqUoRuWkSBXf3UGs
	yu5NQPsfiwiwP5h5XACfSnkWsEcOdF2Jh9D91hRLs/iCn0EeLHkPG3wqij130xQUtoryx7ubjPj
	5vLBM4o6j8bYM/kv51WFsvFr2DEtMuYyTjARgVKnLl9ZbmN8+2uBZGRmbLZA==
X-Received: by 2002:a17:90b:39a7:b0:3b3:9ce9:f747 with SMTP id 98e67ed59e1d1-3b41c9b2d4fmr16619201a91.19.1795607714398;
        Wed, 25 Nov 2026 03:55:14 -0800 (PST)
X-Received: by 2002:a17:90b:39a7:b0:3b3:9ce9:f747 with SMTP id
 98e67ed59e1d1-3b41c9b2d4fmr16619167a91.19.1795607713753; Wed, 25 Nov 2026
 03:55:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-ux500-dma40-powerdomain-v3-1-823bd3879d2c@kernel.org>
In-Reply-To: <20261123-ux500-dma40-powerdomain-v3-1-823bd3879d2c@kernel.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 12:55:01 +0100
X-Gm-Features: Aa3M54rhSsoEYUNHeg1K4sH8TH5qhP8ElQIlNIpJZFT4h4_NmcsIEeFBi318f_k
Message-ID: <CAPx+jO8T9mBX3z_1XP3GObUm3TW50Z2Qp9oNOz=uSkkoU2HVzg@mail.gmail.com>
Subject: Re: [PATCH v3] dmaengine: ste_dma40: Use power domain for LCLA SRAM
To: Linus Walleij <linusw@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>,
        linux-pm@vger.kernel.org, Frank Li <Frank.li@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: z9zXWRudh9chHudUkR6iKlAOw229H9jk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NyBTYWx0ZWRfX91gYsiXCCkPc
 +QI6aiDbbWDOgBu/+lXihA+H2YVJb4gh+vFDoTdxl4XWetRbsGAgy46iz1Pq0xCQzvoTghRR25w
 tU4l2w4fyz86FbvbGfOSSuZTylKDMxg=
X-Proofpoint-GUID: z9zXWRudh9chHudUkR6iKlAOw229H9jk
X-Authority-Analysis: v=2.4 cv=CKu/zhrD c=1 sm=1 tr=0 ts=6b06cca3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=bC-a23v3AAAA:8 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8
 a=loeBcurGjU9lMDdYv3UA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NyBTYWx0ZWRfX5IGwwb5MssLo
 tlFWnMw+Fvg59P/jk4ysPSEAu07m64V/HNRNJDYutU+NiDoasmU7JAKp+aACwKu1dx3Z8gideMP
 qpQy4hQaOe+LsxK3lNe7KXuj0pgs+0lGNlbk0EpeEVvYFIDcQyaFzaB1f8yAWD398S0JSxeLaBm
 BDqBGvHsG1nHb3qBpa8SajJ3cjhdJAsCxUqwtexuCrPk2M4+MkdE+3X5T3kVh4XpXxP0ZZDXmf/
 qfg8j7k/LH/Nc4o+C7VL/W6vZwqGMFtpjn3/vxeHqQ3rzAfnexpneQEyfzgsLOrEU9GnUSqAxbL
 g5l8MN7mhm532Ap1t8Kig9PCabM976RfzT3ns3lra9MNNnzm9Fmj16eC9jgitphJ33Mh/ZnSIsk
 7YxlVyJUw7AvHMPRJpA7XlWsFzMWI+jvzLPQXSINbBNTGHvCgvVz0UgIKzLPYC8hKPXC1zxo20F
 5cYVD9HxDUal5Sz2hbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250047

On Mon, Nov 23, 2026 at 1:02=E2=80=AFAM Linus Walleij <linusw@kernel.org> w=
rote:
>
> Replace the LCLA ESRAM regulator with runtime PM of the SRAM device
> owning the ESRAM34 power domain.
>
> Use the existing LCLA SRAM phandle instead of the never-set
> use_esram_lcla flag and the obsolete named memory resource.
> The bool indicating if we use LCLA SRAM seems pointless, let's just
> check if it's NULL or not. Simpler.
>
> The old use_esram_lcla path was not used by any device tree, so removing
> it does not break compatibility with existing DTBs.
>
> Acquire the SRAM runtime PM reference when allocating a DMA channel,
> before taking its spinlock, and release it when the channel is freed.
> Descriptor preparation can run under a client's spinlock, so it cannot
> synchronously resume the SRAM.
>
> Acquiring a handle to the SRAM can fail and then we defer probe.
>
> Since we can defer probe(), probe() and friends can't be tagged as
> __init anymore, and it's better like this anyway.
>
> Keep a stateless device link for system-sleep ordering without adding
> a runtime PM dependency to the IRQ-safe DMA controller.
>
> Suggested-by: Frank Li <Frank.li@oss.nxp.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>

A lot of changes in one go, but I guess it simply not possible to
split this up without breaking things in-between. Anyway, nice work!

Reviewed-by: Ulf Hansson <ulfh@kernel.org>

Kind regards
Uffe

> ---
> The Ux500 genpd prerequisites have been merged into the powerdomain tree.
> Probably the fix sent earlier should be merged first:
> "dmaengine: ste_dma40: Keep prepared descriptors across termination"
>
> The SRAM driver will be patched separately.
> ---
> Changes in v3:
> - Preserve deferred-probe reasons and avoid duplicate error messages.
> - Link to v2: https://patch.msgid.link/20261122-ux500-dma40-powerdomain-v=
2-1-8a0ebfc75b80@kernel.org
>
> Changes in v2:
> - Clarify that removing the unused legacy LCLA SRAM path does not break
>   compatibility with existing DTBs.
> - Link to v1: https://patch.msgid.link/20261115-ux500-dma40-powerdomain-v=
1-1-da8b6e1a0376@kernel.org
> ---
>  drivers/dma/ste_dma40.c | 253 +++++++++++++++++++++++++++---------------=
------
>  1 file changed, 142 insertions(+), 111 deletions(-)
>
> diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
> index f1cbc719c4f0..20803432eb0f 100644
> --- a/drivers/dma/ste_dma40.c
> +++ b/drivers/dma/ste_dma40.c
> @@ -21,8 +21,8 @@
>  #include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <linux/of_dma.h>
> +#include <linux/of_platform.h>
>  #include <linux/amba/bus.h>
> -#include <linux/regulator/consumer.h>
>
>  #include "dmaengine.h"
>  #include "ste_dma40.h"
> @@ -41,7 +41,6 @@
>   * certain use cases.
>   * @num_of_soft_lli_chans: The number of channels that needs to be confi=
gured
>   * to use SoftLLI.
> - * @use_esram_lcla: flag for mapping the lcla into esram region
>   * @num_of_memcpy_chans: The number of channels reserved for memcpy.
>   * @memcpy_channels: The event lines used for memcpy.
>   * @num_of_phy_chans: The number of physical channels implemented in HW.
> @@ -52,7 +51,6 @@ struct stedma40_platform_data {
>         int                              disabled_channels[STEDMA40_MAX_P=
HYS];
>         int                             *soft_lli_chans;
>         int                              num_of_soft_lli_chans;
> -       bool                             use_esram_lcla;
>         int                              num_of_memcpy_chans;
>         u32                              memcpy_channels[D40_MEMCPY_MAX_C=
HANS];
>         int                              num_of_phy_chans;
> @@ -301,7 +299,7 @@ struct d40_reg_val {
>         unsigned int val;
>  };
>
> -static __initdata struct d40_reg_val dma_init_reg_v4a[] =3D {
> +static struct d40_reg_val dma_init_reg_v4a[] =3D {
>         /* Clock every part of the DMA block from start */
>         { .reg =3D D40_DREG_GCC,    .val =3D D40_DREG_GCC_ENABLE_ALL},
>
> @@ -319,7 +317,8 @@ static __initdata struct d40_reg_val dma_init_reg_v4a=
[] =3D {
>         { .reg =3D D40_DREG_LCTIS2, .val =3D 0xFFFFFFFF},
>         { .reg =3D D40_DREG_LCTIS3, .val =3D 0xFFFFFFFF}
>  };
> -static __initdata struct d40_reg_val dma_init_reg_v4b[] =3D {
> +
> +static struct d40_reg_val dma_init_reg_v4b[] =3D {
>         /* Clock every part of the DMA block from start */
>         { .reg =3D D40_DREG_GCC,    .val =3D D40_DREG_GCC_ENABLE_ALL},
>
> @@ -413,6 +412,7 @@ struct d40_desc {
>   * struct d40_lcla_pool - LCLA pool settings and data.
>   *
>   * @base: The virtual address of LCLA. 18 bit aligned.
> + * @esram: I/O mapping when LCLA resides in SRAM instead of system memor=
y.
>   * @dma_addr: DMA address, if mapped
>   * @base_unaligned: The original kmalloc pointer, if kmalloc is used.
>   * This pointer is only there for clean-up on error.
> @@ -423,6 +423,7 @@ struct d40_desc {
>   */
>  struct d40_lcla_pool {
>         void            *base;
> +       void __iomem    *esram;
>         dma_addr_t      dma_addr;
>         void            *base_unaligned;
>         unsigned int     alloc_order;
> @@ -578,7 +579,8 @@ struct d40_gen_dmac {
>   * to phy_chans entries.
>   * @plat_data: Pointer to provided platform_data which is the driver
>   * configuration.
> - * @lcpa_regulator: Pointer to hold the regulator for the esram bank for=
 lcla.
> + * @lcla_dev: SRAM device for the ESRAM bank used by LCLA.
> + * @lcla_link: Device link to keep system PM ordered against LCLA.
>   * @phy_res: Vector containing all physical channels.
>   * @lcla_pool: lcla pool settings and data.
>   * @lcpa_base: The virtual mapped address of LCPA.
> @@ -613,7 +615,8 @@ struct d40_base {
>         struct d40_chan                 **lookup_log_chans;
>         struct d40_chan                 **lookup_phy_chans;
>         struct stedma40_platform_data    *plat_data;
> -       struct regulator                 *lcpa_regulator;
> +       struct device                    *lcla_dev;
> +       struct device_link               *lcla_link;
>         /* Physical half channels */
>         struct d40_phy_res               *phy_res;
>         struct d40_lcla_pool              lcla_pool;
> @@ -630,6 +633,25 @@ struct d40_base {
>         struct d40_chan                  phy_chans[];
>  };
>
> +static int d40_lcla_runtime_get(struct d40_base *base)
> +{
> +       if (!base->lcla_dev)
> +               return 0;
> +
> +       return pm_runtime_resume_and_get(base->lcla_dev);
> +}
> +
> +static void d40_lcla_runtime_put(struct d40_base *base)
> +{
> +       if (base->lcla_dev)
> +               pm_runtime_put(base->lcla_dev);
> +}
> +
> +static void d40_transfer_runtime_put(struct d40_base *base)
> +{
> +       pm_runtime_put_autosuspend(base->dev);
> +}
> +
>  static bool chan_is_physical(struct d40_chan *chan)
>  {
>         return chan->log_num =3D=3D D40_PHY_CHAN;
> @@ -859,7 +881,6 @@ static void d40_log_lli_to_lcxa(struct d40_chan *chan=
, struct d40_desc *desc)
>         bool cyclic =3D desc->cyclic;
>         int curr_lcla =3D -EINVAL;
>         int first_lcla =3D 0;
> -       bool use_esram_lcla =3D chan->base->plat_data->use_esram_lcla;
>         bool linkback;
>
>         /*
> @@ -912,7 +933,6 @@ static void d40_log_lli_to_lcxa(struct d40_chan *chan=
, struct d40_desc *desc)
>         for (; lli_current < lli_len; lli_current++) {
>                 unsigned int lcla_offset =3D chan->phy_chan->num * 1024 +
>                                            8 * curr_lcla * 2;
> -               struct d40_log_lli *lcla =3D pool->base + lcla_offset;
>                 unsigned int flags =3D 0;
>                 int next_lcla;
>
> @@ -936,16 +956,17 @@ static void d40_log_lli_to_lcxa(struct d40_chan *ch=
an, struct d40_desc *desc)
>                  * One unused LCLA in the cyclic case if the very first
>                  * next_lcla fails...
>                  */
> -               d40_log_lli_lcla_write(lcla,
> -                                      &lli->dst[lli_current],
> -                                      &lli->src[lli_current],
> -                                      next_lcla, flags);
> -
> -               /*
> -                * Cache maintenance is not needed if lcla is
> -                * mapped in esram
> -                */
> -               if (!use_esram_lcla) {
> +               if (pool->esram) {
> +                       /* LCPA and LCLA use the same four-word SRAM layo=
ut. */
> +                       d40_log_lli_lcpa_write(pool->esram + lcla_offset,
> +                                              &lli->dst[lli_current],
> +                                              &lli->src[lli_current],
> +                                              next_lcla, flags);
> +               } else {
> +                       d40_log_lli_lcla_write(pool->base + lcla_offset,
> +                                              &lli->dst[lli_current],
> +                                              &lli->src[lli_current],
> +                                              next_lcla, flags);
>                         dma_sync_single_range_for_device(chan->base->dev,
>                                                 pool->dma_addr, lcla_offs=
et,
>                                                 2 * sizeof(struct d40_log=
_lli),
> @@ -1661,7 +1682,7 @@ static struct d40_desc *d40_queue_start(struct d40_=
chan *d40c)
>                         d40_desc_done(d40c, d40d);
>                         d40c->pending_tx++;
>                         d40c->busy =3D false;
> -                       pm_runtime_put_autosuspend(d40c->base->dev);
> +                       d40_transfer_runtime_put(d40c->base);
>                         tasklet_schedule(&d40c->tasklet);
>                         return ERR_PTR(err);
>                 }
> @@ -1717,7 +1738,7 @@ static void dma_tc_handle(struct d40_chan *d40c)
>                 if (d40_queue_start(d40c) =3D=3D NULL) {
>                         d40c->busy =3D false;
>
> -                       pm_runtime_put_autosuspend(d40c->base->dev);
> +                       d40_transfer_runtime_put(d40c->base);
>                 }
>         }
>
> @@ -2270,7 +2291,7 @@ static int d40_free_dma(struct d40_chan *d40c)
>                 d40c->base->lookup_phy_chans[phy->num] =3D NULL;
>
>         if (d40c->busy)
> -               pm_runtime_put_autosuspend(d40c->base->dev);
> +               d40_transfer_runtime_put(d40c->base);
>
>         d40c->busy =3D false;
>         d40c->phy_chan =3D NULL;
> @@ -2646,6 +2667,12 @@ static int d40_alloc_chan_resources(struct dma_cha=
n *chan)
>         struct d40_chan *d40c =3D
>                 container_of(chan, struct d40_chan, chan);
>         bool is_free_phy;
> +
> +       /* Preparation and submission may run with the client's spinlock =
held. */
> +       err =3D d40_lcla_runtime_get(d40c->base);
> +       if (err < 0)
> +               return err;
> +
>         spin_lock_irqsave(&d40c->lock, flags);
>
>         dma_cookie_init(chan);
> @@ -2703,6 +2730,8 @@ static int d40_alloc_chan_resources(struct dma_chan=
 *chan)
>         pm_runtime_put_autosuspend(d40c->base->dev);
>   unlock:
>         spin_unlock_irqrestore(&d40c->lock, flags);
> +       if (err < 0)
> +               d40_lcla_runtime_put(d40c->base);
>         return err;
>  }
>
> @@ -2725,6 +2754,10 @@ static void d40_free_chan_resources(struct dma_cha=
n *chan)
>         if (err)
>                 chan_err(d40c, "Failed to free channel\n");
>         spin_unlock_irqrestore(&d40c->lock, flags);
> +
> +       /* Keep SRAM powered if stopping the channel failed. */
> +       if (!d40c->phy_chan)
> +               d40_lcla_runtime_put(d40c->base);
>  }
>
>  static struct dma_async_tx_descriptor *d40_prep_memcpy(struct dma_chan *=
chan,
> @@ -2877,7 +2910,7 @@ static int d40_terminate_all(struct dma_chan *chan)
>          */
>         d40_term_all(d40c);
>         if (d40c->busy)
> -               pm_runtime_put_autosuspend(d40c->base->dev);
> +               d40_transfer_runtime_put(d40c->base);
>         d40c->busy =3D false;
>
>         spin_unlock_irqrestore(&d40c->lock, flags);
> @@ -3047,9 +3080,9 @@ static int d40_set_runtime_config_write(struct dma_=
chan *chan,
>
>  /* Initialization functions */
>
> -static void __init d40_chan_init(struct d40_base *base, struct dma_devic=
e *dma,
> -                                struct d40_chan *chans, int offset,
> -                                int num_chans)
> +static void d40_chan_init(struct d40_base *base, struct dma_device *dma,
> +                         struct d40_chan *chans, int offset,
> +                         int num_chans)
>  {
>         int i =3D 0;
>         struct d40_chan *d40c;
> @@ -3123,8 +3156,8 @@ static void d40_ops_init(struct d40_base *base, str=
uct dma_device *dev)
>         dev->dev =3D base->dev;
>  }
>
> -static int __init d40_dmaengine_init(struct d40_base *base,
> -                                    int num_reserved_chans)
> +static int d40_dmaengine_init(struct d40_base *base,
> +                             int num_reserved_chans)
>  {
>         int err ;
>
> @@ -3201,29 +3234,11 @@ static int __init d40_dmaengine_init(struct d40_b=
ase *base,
>  #ifdef CONFIG_PM_SLEEP
>  static int dma40_suspend(struct device *dev)
>  {
> -       struct d40_base *base =3D dev_get_drvdata(dev);
> -       int ret;
> -
> -       ret =3D pm_runtime_force_suspend(dev);
> -       if (ret)
> -               return ret;
> -
> -       if (base->lcpa_regulator)
> -               ret =3D regulator_disable(base->lcpa_regulator);
> -       return ret;
> +       return pm_runtime_force_suspend(dev);
>  }
>
>  static int dma40_resume(struct device *dev)
>  {
> -       struct d40_base *base =3D dev_get_drvdata(dev);
> -       int ret =3D 0;
> -
> -       if (base->lcpa_regulator) {
> -               ret =3D regulator_enable(base->lcpa_regulator);
> -               if (ret)
> -                       return ret;
> -       }
> -
>         return pm_runtime_force_resume(dev);
>  }
>  #endif
> @@ -3313,7 +3328,7 @@ static const struct dev_pm_ops dma40_pm_ops =3D {
>
>  /* Initialization functions. */
>
> -static int __init d40_phy_res_init(struct d40_base *base)
> +static int d40_phy_res_init(struct d40_base *base)
>  {
>         int i;
>         int num_phy_chans_avail =3D 0;
> @@ -3405,8 +3420,8 @@ static void d40_drop_kmem_cache_action(void *d)
>         kmem_cache_destroy(desc_slab);
>  }
>
> -static int __init d40_hw_detect_init(struct platform_device *pdev,
> -                                    struct d40_base **retbase)
> +static int d40_hw_detect_init(struct platform_device *pdev,
> +                             struct d40_base **retbase)
>  {
>         struct stedma40_platform_data *plat_data =3D dev_get_platdata(&pd=
ev->dev);
>         struct device *dev =3D &pdev->dev;
> @@ -3425,7 +3440,7 @@ static int __init d40_hw_detect_init(struct platfor=
m_device *pdev,
>
>         clk =3D devm_clk_get_enabled(dev, NULL);
>         if (IS_ERR(clk))
> -               return PTR_ERR(clk);
> +               return dev_err_probe(dev, PTR_ERR(clk), "Failed to enable=
 DMA clock\n");
>
>         /* Get IO for DMAC base address */
>         virtbase =3D devm_platform_ioremap_resource_byname(pdev, "base");
> @@ -3592,7 +3607,7 @@ static int __init d40_hw_detect_init(struct platfor=
m_device *pdev,
>         return 0;
>  }
>
> -static void __init d40_hw_init(struct d40_base *base)
> +static void d40_hw_init(struct d40_base *base)
>  {
>
>         int i;
> @@ -3640,13 +3655,9 @@ static void __init d40_hw_init(struct d40_base *ba=
se)
>
>         /* Write which interrupt to clear */
>         writel(pcicr, base->virtbase + base->gen_dmac.interrupt_clear);
> -
> -       /* These are __initdata and cannot be accessed after init */
> -       base->gen_dmac.init_reg =3D NULL;
> -       base->gen_dmac.init_reg_size =3D 0;
>  }
>
> -static int __init d40_lcla_allocate(struct d40_base *base)
> +static int d40_lcla_allocate(struct d40_base *base)
>  {
>         struct d40_lcla_pool *pool =3D &base->lcla_pool;
>         size_t lcla_size =3D SZ_1K * base->num_phy_chans;
> @@ -3728,8 +3739,7 @@ static int __init d40_lcla_allocate(struct d40_base=
 *base)
>         return ret;
>  }
>
> -static int __init d40_of_probe(struct device *dev,
> -                              struct device_node *np)
> +static int d40_of_probe(struct device *dev, struct device_node *np)
>  {
>         struct stedma40_platform_data *pdata;
>         int num_phy =3D 0, num_memcpy =3D 0, num_disabled =3D 0;
> @@ -3781,13 +3791,70 @@ static int __init d40_of_probe(struct device *dev=
,
>         return 0;
>  }
>
> -static int __init d40_probe(struct platform_device *pdev)
> +static int d40_lcla_sram_setup(struct d40_base *base)
> +{
> +       struct device *dev =3D base->dev;
> +       struct device_node *np, *parent;
> +       struct platform_device *sram;
> +       struct resource res;
> +       bool ready;
> +       int ret;
> +
> +       np =3D of_parse_phandle(dev->of_node, "sram", 1);
> +       if (!np)
> +               return 0;
> +
> +       ret =3D of_address_to_resource(np, 0, &res);
> +       parent =3D of_get_parent(np);
> +       of_node_put(np);
> +       if (ret) {
> +               of_node_put(parent);
> +               return ret;
> +       }
> +       if (!parent)
> +               return -EINVAL;
> +
> +       if (!IS_ALIGNED(res.start, LCLA_ALIGNMENT) ||
> +           resource_size(&res) < SZ_1K * base->num_phy_chans ||
> +           res.end > U32_MAX) {
> +               of_node_put(parent);
> +               return -EINVAL;
> +       }
> +
> +       sram =3D of_find_device_by_node(parent);
> +       of_node_put(parent);
> +       if (!sram)
> +               return -EPROBE_DEFER;
> +       base->lcla_dev =3D &sram->dev;
> +
> +       device_lock(base->lcla_dev);
> +       ready =3D device_is_bound(base->lcla_dev);
> +       device_unlock(base->lcla_dev);
> +       if (!ready)
> +               return -EPROBE_DEFER;
> +
> +       base->lcla_link =3D device_link_add(dev, base->lcla_dev,
> +                                         DL_FLAG_STATELESS);
> +       if (!base->lcla_link)
> +               return -ENOMEM;
> +
> +       /* The SRAM driver owns the containing region. */
> +       base->lcla_pool.esram =3D devm_ioremap(dev, res.start, resource_s=
ize(&res));
> +       if (!base->lcla_pool.esram)
> +               return -ENOMEM;
> +
> +       writel(res.start, base->virtbase + D40_DREG_LCLA);
> +       dev_info(dev, "using LCLA SRAM at %pa\n", &res.start);
> +
> +       return 0;
> +}
> +
> +static int d40_probe(struct platform_device *pdev)
>  {
>         struct device *dev =3D &pdev->dev;
>         struct device_node *np =3D pdev->dev.of_node;
>         struct device_node *np_lcpa;
>         struct d40_base *base;
> -       struct resource *res;
>         struct resource res_lcpa;
>         void *dmaenginem_reg_group;
>         int num_reserved_chans;
> @@ -3844,26 +3911,12 @@ static int __init d40_probe(struct platform_devic=
e *pdev)
>                 d40_err(dev, "Failed to ioremap LCPA region\n");
>                 goto report_failure;
>         }
> -       /* If lcla has to be located in ESRAM we don't need to allocate *=
/
> -       if (base->plat_data->use_esram_lcla) {
> -               res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM=
,
> -                                                       "lcla_esram");
> -               if (!res) {
> -                       ret =3D -ENOENT;
> -                       d40_err(dev,
> -                               "No \"lcla_esram\" memory resource\n");
> -                       goto report_failure;
> -               }
> -               base->lcla_pool.base =3D devm_ioremap(dev, res->start,
> -                                                   resource_size(res));
> -               if (!base->lcla_pool.base) {
> -                       ret =3D -ENOMEM;
> -                       d40_err(dev, "Failed to ioremap LCLA region\n");
> -                       goto report_failure;
> -               }
> -               writel(res->start, base->virtbase + D40_DREG_LCLA);
> -
> -       } else {
> +       ret =3D d40_lcla_sram_setup(base);
> +       if (ret) {
> +               dev_err_probe(dev, ret, "Failed to set up LCLA SRAM\n");
> +               goto destroy_cache;
> +       }
> +       if (!base->lcla_pool.esram) {
>                 ret =3D d40_lcla_allocate(base);
>                 if (ret) {
>                         d40_err(dev, "Failed to allocate LCLA area\n");
> @@ -3879,26 +3932,6 @@ static int __init d40_probe(struct platform_device=
 *pdev)
>                 goto destroy_cache;
>         }
>
> -       if (base->plat_data->use_esram_lcla) {
> -
> -               base->lcpa_regulator =3D regulator_get(base->dev, "lcla_e=
sram");
> -               if (IS_ERR(base->lcpa_regulator)) {
> -                       d40_err(dev, "Failed to get lcpa_regulator\n");
> -                       ret =3D PTR_ERR(base->lcpa_regulator);
> -                       base->lcpa_regulator =3D NULL;
> -                       goto destroy_cache;
> -               }
> -
> -               ret =3D regulator_enable(base->lcpa_regulator);
> -               if (ret) {
> -                       d40_err(dev,
> -                               "Failed to enable lcpa_regulator\n");
> -                       regulator_put(base->lcpa_regulator);
> -                       base->lcpa_regulator =3D NULL;
> -                       goto destroy_cache;
> -               }
> -       }
> -
>         writel_relaxed(D40_DREG_GCC_ENABLE_ALL, base->virtbase + D40_DREG=
_GCC);
>
>         pm_runtime_irq_safe(base->dev);
> @@ -3954,21 +3987,17 @@ static int __init d40_probe(struct platform_devic=
e *pdev)
>                 dma_unmap_single(base->dev, base->lcla_pool.dma_addr,
>                                  SZ_1K * base->num_phy_chans,
>                                  DMA_TO_DEVICE);
> -
> -       if (!base->plat_data->use_esram_lcla &&
> -           !base->lcla_pool.base_unaligned && base->lcla_pool.base)
> +       if (!base->lcla_pool.base_unaligned && base->lcla_pool.base)
>                 free_pages((unsigned long)base->lcla_pool.base,
>                            base->lcla_pool.alloc_order);
>
>         kfree(base->lcla_pool.base_unaligned);
> -
> -       if (base->lcpa_regulator) {
> -               regulator_disable(base->lcpa_regulator);
> -               regulator_put(base->lcpa_regulator);
> -       }
> +       if (base->lcla_link)
> +               device_link_del(base->lcla_link);
> +       if (base->lcla_dev)
> +               put_device(base->lcla_dev);
>
>   report_failure:
> -       d40_err(dev, "probe failed\n");
>         return ret;
>  }
>
> @@ -3978,15 +4007,17 @@ static const struct of_device_id d40_match[] =3D =
{
>  };
>
>  static struct platform_driver d40_driver =3D {
> +       .probe =3D d40_probe,
>         .driver =3D {
>                 .name  =3D D40_NAME,
>                 .pm =3D &dma40_pm_ops,
>                 .of_match_table =3D d40_match,
> +               .suppress_bind_attrs =3D true,
>         },
>  };
>
>  static int __init stedma40_init(void)
>  {
> -       return platform_driver_probe(&d40_driver, d40_probe);
> +       return platform_driver_register(&d40_driver);
>  }
>  subsys_initcall(stedma40_init);
>
> ---
> base-commit: becfc375b0ee95818c531ed43ecda26c90f7617a
> change-id: 20261115-ux500-dma40-powerdomain-135a566b03ff
>
> Best regards,
> --
> Linus Walleij <linusw@kernel.org>
>
