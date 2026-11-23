Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462726;
	b=S5xHtzvKJeH49xFbmbu2PKQVUumWRSzgMDtkvcAtfinXojVpB/sEDGnE2yvoGS6XPLS/
	 8ABUZ/mCiTiItrRsXOSgwsdIumXqBQ6RBOyi54c9nbwQmQsGEhBPPLB1Sk6oY35SCrqCS
	 9KNGmwMud0/GWugdMaNgCWqb3cgCwuDHT0tFXr6XbhiRRXe/7JFEQbQCCyd+SGWPMWrbT
	 jQ7XzUz3zAYTbeVQ/y5NOU6V0FE/dwJ+4D69/7rHp8ipP74YHT0KZPEftYPAGHIq1it4c
	 FTZlZdTeMhgzBSeoxY0CKscAMM6RCH1BbIh8n0P1cCW1SfkRcPuty9w5Rzn5JBbpfGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462726;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=woJtGyolaPSm3epuc0oRfWRqEJQCl2Rjtu6xIFO48pU=;
	b=v8z306lrHuiXXGuZMXYRqK9SUVSZdWyEpwkNWzisjsMiDQCSs98ZjZGd5ZEiluOaumyj
	 sXVG/u2Vi9/PnNklLDvDuj5rkvGP1l4KBe+FHiO6SP3TE1cxkP7hc6g2aW1JCdzWDBZ0u
	 cs+SrXFk8epn5ofKRa7Ztu8zcLQQA2gpCFHSb3Eu8XVY99xPzBKy8+gXGvfD2N5Ibt+MY
	 ec8WjvdgDZm36BOPZyIZrvE6p9nmp9DbRZq//xxy9mH6jAu+pORaqqWa+0arxsRiSOJDh
	 VTuUdm4yWGO68hOUfZ1XwwudL27r2gDoIYIao2j3klYMgS7LcHY8Qg2Hya06k82xrMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=evvI6gG1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kp772S1Z;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C099360A2615
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:38:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C099360A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=evvI6gG1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kp772S1Z
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGufO2486557
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:38:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=woJtGyolaPSm3epuc0oRfWRq
	EJQCl2Rjtu6xIFO48pU=; b=evvI6gG16yb0OpXZQ8sODJiJeD0hRonbIqh306ra
	xuLTFM1G8GcuFl5y7nIH8r9yXtxvkwhHASzlgE6xaS4oG5AvC0h0LygXzvXc8zHs
	SPtx8lVyt3KLLINiWrVUc3SWNGPGP8Ia8/Fr6QI4Gu2LXcgOQmYcM3dluIFr/HOk
	w2x+kcsvx9+s4QYNcgmsXdAbIOJK6Abh/CRHGjaPbrlBiyGsfl8C83R9/Lu4taHo
	GmUfF6iaB67NjLe7g2TWT4Cto8mNG7lzX75auIKcCEWD7unPWTRFOXO7JuwsSSX0
	knEpQgDNcmvdSk9UaI3Y+/JVHd8woyrD3gV42U8MQ4/WYw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy035y7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:38:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-947a607ec40so352380185a.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462724; x=1796067524; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=woJtGyolaPSm3epuc0oRfWRqEJQCl2Rjtu6xIFO48pU=;
        b=kp772S1ZQlcvqnIgWKj6OJ0iWIzVS5V5IkAE8Tqs/d+wx+tkYygkhv0jpodD5WcXt3
         oU1d60R4xh/9YXlD6G4Tg6WngZTHfClMFaeOsL5Jb2A/xqQLW554mAF3Kw08OXmi4Tc1
         E8FILLrkQZiYHCWNHf9oZndxqVUf6czoJok1ZbYFyHimSXysbx4ZuiT++9Kk/UV41UzV
         poJjRric4eU+rr+W6NT1pxLfibsy/HqIirSJnxjIP5Cftsla2vIAcTbipJATpDKu3tgK
         F5/8mffMetW3yIC8x9t8sCzRcicKU4NkX5zdNprYEuPg+CGod5tEVCJoi4z2IdigBWxk
         uSBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462724; x=1796067524;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=woJtGyolaPSm3epuc0oRfWRqEJQCl2Rjtu6xIFO48pU=;
        b=ULRXcsUMEraiCbJVdr3ksFG/CtaWzAIH9lIpc4IzrEt8z+/TEoaILBwdvjpggXdP/f
         1f9Quusgai4O4U6U4D3W/Qnshp8OHfkvtP8XZe/iZArmI5HTn2LO/Mo0BHe1hlz4VaaS
         jqXV5oPXYuZVt3RIbFI6PqyIINN6un0D/YAmTjkUy6QL/C+LMm2VkYHNLhBE3+w2x3jN
         KkLklxT4QWW4vQzSqFkw21HaHmer2Y/qg/yk6RrM6KxrwEOmJr7lkVQymombGD8MrlQv
         hN4pMqJW7KRpxFt5glWxcdxmkbBsOxoGGE9g0n70FuwR+6Sx7YeqZqhom9TjrBM3iMzK
         8gmw==
X-Forwarded-Encrypted: i=1; AL+hErFpMgCSPVJNomZIo4ugrg/G1G4u2f4pvTEWm5Lc3nxQnMoo6HUoxLHOjJWKgI2Y7HPmaQF6SavPCRYHoFk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bc7Dgrcezkn9Q7FJa2CMBoNj6hGKTI5TBoK3BatuqxsZt+nNq
	SxAkamq7Gl3hdWiTRvf9IBvUOcEfoBb6z4FJPbt+5vf1ULfyB9iExldxSvS4K86pbRhEQI65Rrq
	tkKXJSOClAKrl1XkxRvKNWuMGZ/ItsvaPE/Z0DaDtONEZujwlqXoNf7NP9cjBDj+U6Gw=
X-Gm-Gg: AZFdTZftwiw8+05wq1K6696CLyuWNco9XTd+vEocdL61L0fwkFhQWshA5Nf/CWyEPd8
	xzNLXyuwODv0MyjKmzxX83QmShLCkbzetFBcnIwlpTABDyeJnbL3L+sUaAK9ok0V9+NRZUy2SqH
	LfGsiAG6lhBq8zAi9AD6TaYKpD4k8pWbdggxup98iVZqcpVia7mbw4SMC83f+9a9XWjOxLmuqiq
	doQnvDOfybqsd1QO8ou1SPNv9RuklhEbVEbFv6gsBljzRrvpF30JcFv4hY40Ys5QlnFV609l82k
	OXS0WTQETR8mX/6MxA8dzpt01fH7a+KotHKfm4nZHo2YcPoIH7SJVGhGiNAM02ZWRABMHmZSR5p
	iYK7d2WHzB690t3eyJtlYi8ySJInUAnWVE7hhq48/Y4QJ5aSmwZRCMOxX1CiyLw+H
X-Received: by 2002:a05:620a:454c:b0:93e:c12c:fbcd with SMTP id af79cd13be357-949bac7665amr2007143785a.73.1795462723781;
        Mon, 23 Nov 2026 11:38:43 -0800 (PST)
X-Received: by 2002:a05:620a:454c:b0:93e:c12c:fbcd with SMTP id af79cd13be357-949bac7665amr2007138285a.73.1795462723165;
        Mon, 23 Nov 2026 11:38:43 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm24078327f8f.52.2026.11.23.11.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:38:42 -0800 (PST)
Date: Mon, 23 Nov 2026 21:38:40 +0200
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
Subject: Re: [PATCH RESEND v4 04/20] arm64: dts: qcom: lemans: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <xadzsuftq6la6asx4r3cdknho3hbjljpkrqr4iblwowbz4fhrc@yt2dbeff5d63>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-4-be30526391d9@oss.qualcomm.com>
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
In-Reply-To: <20261120-smmu_interconnect_addition-v4-4-be30526391d9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX3nLDCUMHRS5z
 DXeAFERkr5hDfZjosKRnQNFc8gvgaUV29sfFRM27HJyPDAFw4JBuLupvFHlpWJWJRQ8UfKT4tkF
 3AKwvsqKlzQdo5iJO0Jw3Jwlv2KFxhVTHcKbM+45Myh9NYo3UtWgsVnsCiUljyrRmTAS+puxK9F
 rgGRdX/UjpRztJlj7WrgYxbRT6TLkxdG+DBjTsSoEaHyuryVWot2pLOsR8bwJSGmFUm0DLT36x8
 yQKl4YaaCbOLx5qry/G8FH9g4UteAawFnWeFU4s+eu2/2T1KdLBQie9ScoK7UYKtoJVd8FuAbGl
 /jyvuK75LVYpzPp4YNo6WX+hfYp8IjKmrXuPfGDl9DIZgV/uKF5JjZpiwkcA8rDLalDxF8oLBUr
 nrVY1e+WZ5qgTYgUOcAp4l9nuwaeYZSk7DEw35YYoD6XsmbhpjOQ1dswK/XiSz3vDHzO9V4Du0N
 zTqfDIh61fNb4LhQ8UA==
X-Proofpoint-ORIG-GUID: X7BB08pTE4IPjL0xyaKp6tAg9kBPKnOv
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b049644 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=umFhNDnhut0qF75FkN0A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: X7BB08pTE4IPjL0xyaKp6tAg9kBPKnOv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfXxUSv+M63OkzL
 llfRS19ULyd3T29uIZK06Icu5NmZzTbx7SNuRIILSRvPIOJeBbwzCXAXug+qOqrN/7MNkig4nwb
 +I6kfKFWAKSuuX9Ohm2n5TJLxga1OtA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-20 19:11:35, Bibek Kumar Patro wrote:
> On Lemans platforms, the Adreno SMMU requires a bandwidth vote on
> the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
> are accessible. Without this vote, the SMMU may become unreachable,
> leading to intermittent probe failures and runtime issues.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
