Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462871;
	b=Sg+K/NoOuHpJ2mbrIJGULLhdw4WKUOUzu74YO3mMAL+L6v1JV7Hql+0hGuA4v/SVOU2U
	 aF8ARXTpudXSzYuoCdAzGhX1xAlHY73dvm9P15ZpggnJ3l7TtXlVStwpvbD20r5FWBf1R
	 /vvEFlQ7qTI8rDY7Tf3LRM5XCXdIqv/gmnyaStaqplTeehWcNZ5hKBA36YexqFAW1yPB3
	 JrKZdtgfW32s3Gy8QCPq+KOCXDdCeUax4cBJE+YRNTT3VHdpzqMVBFlsPoQSOE9D6eWB7
	 qJ5omX9ZWezDzq7t7skvDJmZufW1a+xLKLceJrDdVPpLRqOC/Hhop1SRgcQRRITrQZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462871;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=okCL8kgOe4YWBJzwczqiUxr3lV/zkclx0rToDi20iXA=;
	b=LhuKW9SjNoGIrQrjWq7UybTuG8xm2GdN+CYf40Be7CQcLllOAFplXWSR6owDE+dQewL0
	 yKoF8XEdSGosEILKP2laJDGLypsSsSYY6RCOtQMiCKt23IE0X9SzfRTWfD1CSDmwqyBR/
	 oRVeOkqCTxFMiWosmXmgBVGW2Te7hEllpTkfVdVuJa7mS7VR7E7LyhU8FftOn5ioA9vaz
	 Qxt8z8ZmseWCIVr1B01E/A/LWXFHmo1n/aWLwvRjnfKAkxhpXNNGICu1jzN5pDeHU1qps
	 KjnhJ0qfZWXUbhvrN2zuBwYOW8c2C075axpv3rIZvdrsfZxUuoHhEtNIcIyN0J+ZRCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="kX/EhceN";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ECmZ9v86;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670B3606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:41:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 670B3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kX/EhceN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ECmZ9v86
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGnSP1861204
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:41:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=okCL8kgOe4YWBJzwczqiUxr3
	lV/zkclx0rToDi20iXA=; b=kX/EhceN6e5M1VQxr5l21L+n06WZzx/2LLMIL5Ld
	XtIA/5riM2Jl8wuizaO0P8XhHrgtUOsA8yaZ3t6/a54JhVHAA/OLh8WiCHIXESWa
	hIGoueXqk0vHyoxCMbcbsgsdWZKyNmjQsBeuz5yVALNFUJKPfWT4rwUWdhZ/CGT2
	dQeCaqxXwj6o7inhvLyl1E+qhL8QzNK2yqtMPBT6744PH3eQy2ERUNGI0zPd/Sei
	F7C5J11ioBiCjGE80iTA5BWhqBXhMooxqJbOYhhL+yVn06Ak4Q/pYF49bARcWBlx
	6Thf8jHIuTWjRsi9e5Nvzsw+p/wSSaEBlFmBSXoac0ChLg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a349y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:41:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb7f9bb86so738768785a.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462869; x=1796067669; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=okCL8kgOe4YWBJzwczqiUxr3lV/zkclx0rToDi20iXA=;
        b=ECmZ9v864Emw8K41zANur7AfoknTvD2anYVVgSItHzvrDe+PX+wVJKdisl9hLSvHIi
         +CAydn1iFRJNiuxvIg8P0diQLLTbErOSgcPG7u0Z8xokidlqezOwlEX3wCtlL3mCpHrO
         RFUEcM3YfxzoSI4tpG/thw605xHv3OBAGQqCIuzkdTEbuanDHSFHu2P+I/tZfueBqe0M
         PPPeTnxNPa5iQkouKfLtjRqvSpieQyoXdIl4RstSjPzHd/NrA/I3bqGd9Wu7qyy8YQBj
         IJIVFIz7h5v1vhBj7O5h19ZhCdsVLJyE09svRPg9ian98LhUZV0wMja2xxg/qcee6v+9
         mogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462869; x=1796067669;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=okCL8kgOe4YWBJzwczqiUxr3lV/zkclx0rToDi20iXA=;
        b=hredVk+tboeNTIFQK1RzCwdmjcLe56eEme/6hp+iWHlQJXpBEd359B8QuVeeokCcxl
         twmBPaKBkcBRXnXE44+IEgr5lQa5HEMXeax14qI1Mq2yYh4cLslz6u7tN8jv0F77wSQT
         ziw7EGC+WlEQ5qPq42BABB0SC/20bVroxAVhHNbatSOqauIXj1qkclzA8ZVcm/QkY2UL
         DbUHKiy3RcUlyqHQ/rRH0oxn/O+1LpC7XZkugODxWRoOm59r+U1mXYwvgTv85eoNyfcb
         mShzL7gxGFYdhGpQfQbyDlsMXkptK8CsH7LsVg2gJVXG5O0B4/hHFSqOu03pMo6grr80
         ZdGg==
X-Forwarded-Encrypted: i=1; AL+hErGUx1nTUAzBPlOgRwW8r0lxt3m0TTLUC+ebg418qmzPwU56IOqJvP3kuJXY0G6t3izDImBsOsM7eTyi5cE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2ST2TdDgWkOKT09YOJvPooXZ1+j8V7PQ7cU2CpqPjckmVJ/za
	IBd9dTL/7kb4P4k2y9kMSsGEzduafYZu2na9PZrfn64N0aUt9Ess7KT5OCnNjoFCGw/qlHusCXo
	XqfGgFQ0FG2hJJBJ27l4Q97JWQsT3uv+80fpIYiPKuSApRSApCWlhsdGoDUD2gn5pCb0=
X-Gm-Gg: AZFdTZdmHLxia7IdnpOmn07zd3+m2TzfUBfPWmdA4o+f8MhHI/YvqhsUpyLzaoOexfh
	H0NTGhhRuZjyLJUDf2cWpJJwdy203p61ETsLarJRMkFjX94iszsb3idzAxOGMfVKF2FedsEdWj7
	jnXbTWgkc3Ao2EQeZetaQT7xiJI57yAkjUinhcu/bDClXc1jTnH8cXO7Mv4GkhVXFZ1alM2ZI7o
	A4qu+rhOH6wZey2cm+N/x/4WJ5vQ9xqsgIC35nQ7LiOIbKZGzDDqY+ApPSM5gHbh4f3Hb2SWoyX
	ib4wl+woyTaiyPte3Qd793Jy0Yh/hr5Gpe2ShGMkRXvqXgkCzNWysadJmPAqiqUdlVc90TyEdn6
	YcxKY3xInH3XwLBFS6lBWSg0KOWN8zN38c88lmIfxFi6pfSvS9tljflVLPF6Bzurr
X-Received: by 2002:a05:620a:8812:b0:949:78c0:e186 with SMTP id af79cd13be357-949ba95de77mr2032515985a.25.1795462868646;
        Mon, 23 Nov 2026 11:41:08 -0800 (PST)
X-Received: by 2002:a05:620a:8812:b0:949:78c0:e186 with SMTP id af79cd13be357-949ba95de77mr2032508985a.25.1795462867959;
        Mon, 23 Nov 2026 11:41:07 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8526cbd0sm490807405e9.0.2026.11.23.11.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:41:07 -0800 (PST)
Date: Mon, 23 Nov 2026 21:41:05 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RESEND v4 12/20] arm64: dts: qcom: sm8450: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <lljflqhizl3wlw5pusaslpxwmfe4taxadw2prfogsxr77voe4v@ggolvdeja6op>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-12-be30526391d9@oss.qualcomm.com>
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
In-Reply-To: <20261120-smmu_interconnect_addition-v4-12-be30526391d9@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX9j8pz/okl+04
 NbuGfu481qLH/HPkLsrw3IyZqObTuqPOiVEMRDfYjA364f6PuJCYruux+yiIDkxNBsKNO8/DsWK
 qPiVCIamB8N6z/oFPAjWl/vva+10IVE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX0Q+QYF72jqBO
 vUy/lLXLKj0ntXVbBpZTOH6uop9dP4OALaKqgud/7AXNPEjJoqj6FrTuDFM0RtucWYZ20DeQfHh
 j3z0J+Jr2SfdoWkwsL+aVoUlc1uU+Mwt1uv4c6wThXG7XdHQiuYgz/7eiHinodVBKLtt1gqLAYx
 8zql7RuQ40eBPeH2rckeTlfGgnndqELbFXGz2akfloHx643epxFEs6fLmXAyPN1WrAQ6r3gGqjj
 eZN0nisYyDxW6DfbiUNQVFtyLQYDAkCmu1gkQSD3W9MBKkYZDAs2hw8aDqyFf+zaMtXYDHvZNAn
 9CzwYOzKX3Vd+35d6jWKLBFU/TZQe3qYiyxOJLn35qJUgXZmlW/Fh34COgl+fIJurZksAV3eI/V
 EHFBjVuAgO5xAGex7uv74t7ped1rnxMgn41zJ9ObkD7DR7q2JovcbNgItSGriOTKBJJ9D1vpiIn
 d1PmkmujpxwBA46+HUg==
X-Proofpoint-ORIG-GUID: wu7UlH6G5Y7zBSc0naVtsXUoAfjRuTbj
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b0496d5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=jAy75CqWmSRsgNc4pWAA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: wu7UlH6G5Y7zBSc0naVtsXUoAfjRuTbj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230078

On 26-11-20 19:11:43, Bibek Kumar Patro wrote:
> On SM8450 the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
