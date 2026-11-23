Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462785;
	b=gBVcGIbgDInTi3/wyVdTOIi+ssWjat7FIjzkR4X/nKOQih4jaLoJn+LpYBZagFy8/Pnr
	 vHMZR8LLl/DCY2vBg4uk48WlS15uTWTKF4xu2rTLCjaYRwj5HD1UVhnthH9Z3nWycNStT
	 7Y35V6hpRtxccnyaVaAJRiSq+dwzi9tnbzgcRS6dPB21jLc4GFqZ76V/0Wg/H/0nMHPAc
	 vJOoo2QP+TgmwOPOMUNccKP2Fi5sF00PG52ljggUnGfuFnjOEHVplcwNY15vY/b6zOr5V
	 cgPiyNLEEJSLTwVHeEV+73DACz1l83A0VBgSMcxSfm1XGiMoBgy1QSrPCg2Z2Jn9Zbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462785;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/AsDNaCeIM26uy2qCHuktfXaKod4efoeozdBzuVQOi8=;
	b=aRK3lABrgLV3GCLSb/kMXv+kBEKdXspfy+UP0zPSY10mzU1Z3N/TavytafN56/vNlMZd
	 /OA8tkTMzYwGnBZhiw+IpShrJOid2j+ppciQEXRa6cZw5RbER4/GmGPMsCg4xUCJkFzjX
	 DR7IsZOXdpbGBhOfKuS0Yo8VPPpeLK3zFAp5q3vPwzYt4p6OszXx8VIUs8wW67/FvLv3+
	 naqJ2VLpnLjBm4/SGmmEBBiSAYx3Rm/OBYmH8T3jrMVESb1YRq5LwMz1GZiZeaMEYOope
	 Anv59TD4OnG6ZY0Mo5qPjQkg3ks6iG/q7Cy04RDYf5zbR67jbuePVZH9Px+1cwV/KhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dCy04Ggb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W0X7kGgZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DBD606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1DBD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dCy04Ggb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W0X7kGgZ
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGlEo3730160
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:39:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/AsDNaCeIM26uy2qCHuktfXa
	Kod4efoeozdBzuVQOi8=; b=dCy04GgbJinPkzPCZYLQfsGaaerS4ZPo0o+h7QxU
	Y+cCSOzW9p8JUeiaSEkcfHdy8Vec/bNGlEOzsBhXarz5q0uXV8sjetqj0MUXVLRf
	CpFPwIVs3D9xjiDK5GX/8C0az5rsW5YjOLQdBrk0De6+GomJ7bqjlgEwTCEstDpq
	EcDYufpvAd0jwa6rWIJjnwJCcIttAtSDoTB1xaCvtXi67ULdBSZ74Kpyo1FeP6pR
	3J9uq+XSeZkYIhafRuPMBP01XPN4DQBjKBdHxyrKZVw6nn1zX7zQFSNueJLoTOP0
	BYB3oZ5uqtUVuKWJw63dPIqMoHFG4GFSC4TC6dNgGzgpBw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd3635-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:39:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb7f9bb86so738365285a.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462783; x=1796067583; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/AsDNaCeIM26uy2qCHuktfXaKod4efoeozdBzuVQOi8=;
        b=W0X7kGgZ2EOgGH2Yqu9ILu2Y/Bfg8hiwlF1ZF5ln4LsJ3KQKEe3OE6c1HvTy48yY79
         xzPGobiYLtU3nFnj2rbUl6XYjSo/xdGbM/S00NjMaBmv5cu+/jnj4vlwHp34W9bV8/d8
         PuyY1JdR9LaYaZ3cfaoO1ms3ouMn/EwyNLfQ+YYoerGg3stovcaSGx2jaGDIB5SmDW0w
         k0FmS1XuXr+XdgILSj7G30PuQZSh0LRfR5OzJ7rHpsNiKjETcaFOXQxgi4rnT5AuOJ9X
         vQDJGzacpiWGBLcPYwA0f+85nyC+JDDiuhqgZ+qTvoMfI6teZwg2bXpqATz2t/AznwXr
         eYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462783; x=1796067583;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/AsDNaCeIM26uy2qCHuktfXaKod4efoeozdBzuVQOi8=;
        b=xXR3Sc8xWTElYKYcDwgxnND1d7gN95wF5qNnmdBdTUeZKJH26PNRP3Ud09aStzCJly
         cq3bnBCkg2AbbgsyO5aieKbRHTFntrg4f7TC9x3WriZY1Z13WVnRajEQNe1BNTXDnwDE
         88oc5tbkjIeu9WqsONSMXXWdTeBkG+bkyqO6Yt2pN5X8XE+0I1QUmVuVjPVJZ9taGy01
         U4xkffFhG/TSHf10OnlZhLSp9/moL4zpwzaLIkDbsio/qzzC0H+oRwkYSZVqinwXMEJU
         BLn6tBxV6fQAXFvebV/KoZZSa8rvuD2+3UaVcWu3l4bvEgz2zWcMo8uTFQp1pPYxOJ9H
         4k8w==
X-Forwarded-Encrypted: i=1; AL+hErF1mV9C9V36vBtHTgpvngNgfntTFat9Wu790lkT3F5yB75Dz+RkAi7H370Dsv282GckN6AeZLwb+Oq7BFc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+B2vsxquMUgCjHKdPjHlVmZkc5AMT41a14PiIOYepfzezveJzi
	ro/nEDt/lQAumlkITewoD1Obn/0y+CbalsQbE35oibDLViZH1QTgW07eVNaHQ8USe4dQprTcLl8
	Zp/w0B85YN/CQbay5k/PDjWdWCPeZwPfoihJ5XbkU4tK4kzl2JOY5L0hBy8mn0sGX9x4Su0isjv
	w=
X-Gm-Gg: AZFdTZdByjnEGJB6bREOlnaAkpjJMC9iBBOpaoYnMGy2omYCFWu8CkgDolJjMMe2bCz
	pMI8kJasCqzJzx39fLdbI29XeGPkXX90+phCeLmBOQghyS5kmy1R0gP1MBWnkkjiivzCiQhTj9+
	y1NcZUiPEkrjCaRw66CwfeKeTIpx6nSvCItwM2cDPAeGFdFfxSCPucBX2CetdeecymxIzlRs9rm
	4KqRYXzW0IL4jSbG4ojbNN91cuPFNWeFlu3+IgZhenSLNC2PinlIjBgn07JlSc4XKczuya6hPir
	+hPPGD9mylIMgn7dWK76BHz9nYt5rLV/qzZYN45yJkQS/ZNzvVSTTpw56S6K+7In67UHnyzeX8b
	4MOT0cMbEijcEj11eXUM07mr5eAmYrLqhEXmZfBiLHFFeg+CM0MYxRxMz5VsIhdGp
X-Received: by 2002:a05:620a:1724:b0:949:71fa:5b0f with SMTP id af79cd13be357-949baa053dbmr2113159585a.61.1795462782810;
        Mon, 23 Nov 2026 11:39:42 -0800 (PST)
X-Received: by 2002:a05:620a:1724:b0:949:71fa:5b0f with SMTP id af79cd13be357-949baa053dbmr2113153285a.61.1795462782173;
        Mon, 23 Nov 2026 11:39:42 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm27574990f8f.55.2026.11.23.11.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:39:41 -0800 (PST)
Date: Mon, 23 Nov 2026 21:39:40 +0200
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
Subject: Re: [PATCH RESEND v4 07/20] arm64: dts: qcom: sm8150: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <itpvl7qrxxa3ccj6e4q5uaveerqcitp4frv4gmtlxj4y4lxv2q@4tk4mzd5ieim>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-7-be30526391d9@oss.qualcomm.com>
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
In-Reply-To: <20261120-smmu_interconnect_addition-v4-7-be30526391d9@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Pa9t2cVLFh9KZ6qH2e-KT-4q9KbZSN-3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX6mmclRoVHYFu
 /P5gRw1j8dcmP6Ef8B9veh7cQ+6EGj6zJE/WrZNpmmt5OBCztHXsm5xZ7O+QgW52/NUau2LlT9Y
 PmwX0rNC1xnHYt1HHCGPmiqHwFe2f9x/G3x2Q19T/7Dkhjul1dbbZ9LJBlu17ED9Uq4Q7hdJlXg
 l5gbDAJ27ia2MT5mKONK6A2j7YzJfw6sWKBTTJqM0r+eegELHfbkAn7CUAyy1SrIkGkR0Ib6cHN
 n4To0K+FmQT78wfoUovBYD3KI+6/cZ23Gfm6tvI+X+glDWL25nWxyQPijPLVgKWPRKGJmXOZufr
 vP7Ni+ifL3rIIMdmHC2+CxYAFMJfipuFUuRKlBgg9Pl2qL60K597Hc3O/IBT6z9qLB4p1zH1R8X
 33yIZHpxS+t+bTWkGT+8ZlGDhIx4US8TxVXdM2PsVY2qbPp6ihf8hPsXo6OWdZpt/VrIxbufW8a
 9tnVQGXDbSN0oU7yhMg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX7Z79RgGV/cLO
 AkmUccMYofrB8dAj0gF63VbUke3XD0+27yG13fG4cVWIlU/qohXY3Y2wYCrANV60KSaW2bIRzvl
 Gqe2fYA2s+1YReOuHJRjdGHQyYF9KTE=
X-Proofpoint-GUID: Pa9t2cVLFh9KZ6qH2e-KT-4q9KbZSN-3
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b04967f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=fpZYgbz1ZAxLTqytCXoA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-20 19:11:38, Bibek Kumar Patro wrote:
> On SM8150 the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
