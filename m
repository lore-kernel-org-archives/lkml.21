Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170432;
	b=lkvXlkVwRyRg+o62Mm/y4t/u11y7+xU193y8FgCTQ+1N+Tk0CebfhqWKRD0xSnWlNGxF
	 npva4uN7G/ObteG/TMrLtRy1hVr07ApT00fadRO02VpWmmr8OUSxrIOeK20wxpmyk6P5g
	 vq+mkxFaTGxYe+WLcVWNk1nV41vzJihbEkHETl4mMXFcTKmAKgr5nh/etdSJos/yINUqZ
	 LS7I62AOOyMdapfXsla1b8Jh7fAvi8MC+UoPbkODblNLj0/lChX898N4AgRmO6wOAsoPU
	 x8NLxi3LABYUdVYu6LS4W6QrWl59eJCtYCMsSbFLLBQHUjYaL1TBW49wfojIlorHxMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170432;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=TDi4z+Ry6J5IfKVSHZnQfjVSJF3Eiv71kFCtVQwFZH8=;
	b=mrVDVM6oQw+XLxzxTtSQNG3CWkvN3OP79CZdwMrjKbrDt0KWDbgYZToz9Kh2BRl01gtK
	 peznzMzGvd12D3XQHVMqNL3og87ScyYGsH1FVH4bOfUbwbgVqjC6wVzFQq0+XKfm79Hia
	 YM6G6C8EQOu9YtrUvD+YFxyIB0ZaTFW95e2x9L5F6tdY205hC1ZjVaejHS9AbxEVD2/+I
	 hggSWA2lwQmNbzVid0zDDnDcYziRcmZzxpef8P3DcyKuD8yvut5WTjxkHSYB9JeckdPLN
	 7PL04+KWqHCuhtvPACBkfTW5dT7iM035pAPvEZC93i5lTJ29+mm+61lEgtX2N58/5CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="UCMsjjL/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b4NsjePq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6C260A260B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:27:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A6C260A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UCMsjjL/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b4NsjePq
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7errJ1268354
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TDi4z+Ry6J5IfKVSHZnQfjVS
	JF3Eiv71kFCtVQwFZH8=; b=UCMsjjL/gYj1YrSdI3mPgoWUFkroEwEenVvkoLXV
	PD94DQq8IzopQvJZfDxnY0WgkkSJ802KdnU64vveupJkHK94Vza9+P9sJlnMq0zJ
	udeo4Qy322jsgEcxOr9jUP9zBHUU3vN2NN79Cx6C9KJkLFTAGoQtyeLNM4nRaM1+
	azSHW6pr5RYxLmsWaQZ4wEAtjXWxFV8i52y0KhGij+4bI3OE8bGyv7xQ+eyMNtK2
	8gVIKnh4y8um/clEGne0POIVBK47mW2eRvG1ER2xjjbE/X2eRNrZBCmM0iTd0AAY
	XGXjSNTZeLfL2VeXgd6+f8pVHNnk8E5nRDeOgF4L/l2l2A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2cd1sy0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:27:10 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso768454eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795170430; x=1795775230; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TDi4z+Ry6J5IfKVSHZnQfjVSJF3Eiv71kFCtVQwFZH8=;
        b=b4NsjePqA8nFOVCsLyIf6NVtNyyBD1S9Iduf/zsHvj9VpxcK/yxRxeSbtrbF5tn6qu
         qXtQjt/e/DeeblQ2efRNwg0QY1+W6Aoel0N2eYiS21LB7Fk2hvnLc6apzp/kjsfJMUgb
         2hD2oaG987Y6kd/tHGpW02AT/zHGXUWzvrJJZesczBeJRvwGstmDpxpj3IKh4NPLyWSK
         dMVoJzbc5sDyLCu3BJVCU6tvnNuaTiAxOB0d3W+3oOzdPuPV0Z6rzeAvh+TckElfBcce
         JY1MKaIUrPnHCALqbX5bUzaf4dehpK4yAC0Jmapvz7Ts14IlCSSAaC1a/QG12b93sZkB
         xqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170430; x=1795775230;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TDi4z+Ry6J5IfKVSHZnQfjVSJF3Eiv71kFCtVQwFZH8=;
        b=Q5qT4cTwQZrrao8MWtq+3Yc4wNKOC6TpOLAvhrmMhl5d1qRc4Lf7k9lW9GBysVGrJP
         JZMR1vVxAUQxNIZJ8c6epPpqSdNb4LTDThBjfRvFqgIdLuHvD1C7c87knugdLeQ3/au8
         Rl5/oOpgO3muIeJodq492EPKWTp5grWc4rXJGDoLAZjj3+01TnAdGCi4UDZmKDQfljh/
         CCftgwKuSDowOBvxN5k3o7fVPwy4diUaiXM4XvjIa/ZfmCqo+IpL4TX8Z2ji4dQVaEtu
         lKQc5/2mV7CyFsHSL9O3GC91D4HkjU4+FP9v+xGN0VONFHZOquHc3MTq4si2h13cAHHo
         ynkw==
X-Forwarded-Encrypted: i=1; AL+hErGSmf+dUh/GkBWYK6OXSAGC7epWHsy6ibfVnubOcHCB+/pbi3bHbNdY78yB240m806Fk/o/RHlgzG6M8lc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RdqyYAWZCqB1PUsdKRLpvaq1+bIlFxMwvPW+ijFyCqcu4s4Yq
	BbN6jCQ4uAOGClWgBd1wQExyqm9VJrxG50x8Z0V8PBH6n5uro4/vksIwzQtKKYQzX906O1mYpRm
	10j82onFGpz/vmD84VgqcjmnIYbdr31pPlaNU7XWK4XBGXfdu83sINVumnMHGf7rJkrs=
X-Gm-Gg: AZFdTZdM+Zu33hfnZiRiEJyT+CpA3U/prtRQYqPgOPOTcknLH7vBXayfa1DrSeBadxr
	Gie27Vj73PJbHriotBi0+TlEhoyHOouxAOUsDn746GSx/EPdK2NAdOYAvntCYDcgLBeqE6Y1YbR
	cYWyTwFfWzKsdfU4g7UbwnRvqKV6ww/7EvPQ3ac8eaqhuvklXtBkaDc5TBuDGeWfmpPLGmPlluc
	nBb/N4aFC0M8WFcmh7ez51g3zkGyPsftZ/QKky8xeE2KfewmzAWyE4Oj2moSAfBHx2v3RizBTG0
	XYx/JouNasklcbt+nm/CmSSA+qhaEqppxPF/x9op1uMhVsxGVy1hbWKsUI5a16sow5VaUsvjcRZ
	Y7xNtLZt8eS608GBcvn5DAURli3vzCz8Y+zvDjvTa+Nv/q78moadYHA0k+tTL7cXdTRN/5JaJCg
	Sz
X-Received: by 2002:a05:693c:600a:b0:37b:4a2b:81a with SMTP id 5a478bee46e88-3863f13587fmr543232eec.4.1795170429483;
        Fri, 20 Nov 2026 02:27:09 -0800 (PST)
X-Received: by 2002:a05:693c:600a:b0:37b:4a2b:81a with SMTP id 5a478bee46e88-3863f13587fmr543199eec.4.1795170428857;
        Fri, 20 Nov 2026 02:27:08 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm6982026eec.6.2026.11.20.02.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:27:08 -0800 (PST)
Date: Fri, 20 Nov 2026 15:56:59 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bibek.patro@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Mark RPM message RAM as
 no-memory-wc
Message-ID: <20261120102659.gaylk2rqi63vmq66@hu-mojha-hyd.qualcomm.com>
References: <20261117-rpm-memory-non-wc-v1-1-e246fc6bc66c@oss.qualcomm.com>
 <20261117161904.2hecbffviqjz2dub@hu-mojha-hyd.qualcomm.com>
 <6965d3c1-1823-469f-8777-17fc52e132df@oss.qualcomm.com>
 <20261118125534.7iyzuefhz4te35st@hu-mojha-hyd.qualcomm.com>
 <a116e2b0-8857-48c8-85f6-be3a62325515@oss.qualcomm.com>
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
In-Reply-To: <a116e2b0-8857-48c8-85f6-be3a62325515@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Dt/Da2/+ c=1 sm=1 tr=0 ts=6b00207e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=a3soqENLMLS3xwJGqFMA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: KjrEl4BbCljZhkrTsl0hgRBRSflxqOwt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfXyNKyxcLoF+uZ
 VbUa8qCjjMkkjF2OSAITPKQLIPqgoUb6n3CO56gEwvKaxa6QzKiT9euf5XXvGoOA3Z6BljdLVqt
 SthGgGDbJgpXZ9EuxczQOGEmmXEuMQDIbaIg3yoJmhwcDsRnbIh4qk2hJBTiiEaZYmligF09K0X
 H+c6Gb7ULBcwAxxW5LOQ1rM0xF99hFQqmsa3PlCMnn3rA4vVfviaT1fN7fct8j2AHhXTrklhPiZ
 VseH8zqOrcLcsahWfY6RQvh8vK8IGqw9hM6UrrWKpMDueQtma7TqrB47AR8bKxCXSfXBEUSsbvx
 h3Cnq/S7AU67sQgipROWmYcprtK0DeZIEZN2jhw0FKG8vIdUAseY5mIgmkAaV4nPCyFfrPXVzJr
 B2KPkHPQ85dDDTLooY+5F3B4DoWaa6+BNPtzRssHk3wcAHhHHpaf38zjVrr8rEX/DxWM80I2sGO
 Ap4tHTIaGjDGUlTTqwg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfX/1DuvuumihFu
 oI5qZJPj6E7AcRQn1Br415BhWLuCU+cXk2uAV8a2n4EuvIBP8NuXUx+pENzqPfk+9VYS4h+0UJ2
 H6T6fYJoCdtrHwRzb3A2THBODThGXYM=
X-Proofpoint-ORIG-GUID: KjrEl4BbCljZhkrTsl0hgRBRSflxqOwt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200041

On Fri, Nov 20, 2026 at 03:06:50PM +0530, Vishnu Santhosh wrote:
> 
> On 18-11-2026 06:25 pm, Mukesh Ojha wrote:
> > On Wed, Nov 18, 2026 at 04:35:55PM +0530, Vishnu Santhosh wrote:
> > > On 17-11-2026 09:49 pm, Mukesh Ojha wrote:
> > > > On Tue, Nov 17, 2026 at 01:35:50PM +0530, Vishnu Santhosh wrote:
> > > > > The RPM message RAM is shared with other subsystems, and parts of it
> > > > > are not accessible to the APSS. It is expected to be mapped as Device
> > > > > memory.
> > > > > 
> > > > > The "mmio-sram" compatible makes the SRAM driver map the region as
> > > > > write-combined (Normal Non-cacheable) memory instead, which allows
> > > > > speculative reads into the protected parts and results in XPU
> > > > > violations.
> > > > > 
> > > > > Add no-memory-wc so the region is mapped as Device memory.
> > > > > 
> > > > > Fixes: 66664b5701da ("arm64: dts: qcom: Introduce Shikra SoC base dtsi")
> > > > > Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> > > > Why only for Shikra ?
> > > This XPU violation was seen only on Shikra, and only with Linux
> > > running at EL2 (KVM). It is not seen on Shikra when Linux runs at
> > > EL1 under Gunyah. So, I kept the change to Shikra.
> > Thats not explained in this commit, why this issue not seen under
> > Gunyah ?
> 
> Under Gunyah, Linux runs at EL1 and Gunyah maps this region as Device
> memory at stage-2. The stricter stage-2 type applies, so the
> write-combined mapping from the SRAM driver has no effect.
> 
> With KVM, Linux runs at EL2 (VHE) and there is no stage-2, so the
> write-combined mapping takes effect and speculative reads reach the
> protected regions.
> 
> The region is expected to be mapped non-write-combined regardless of
> the exception level, so I kept the commit message to that. I can add
> the EL2 detail in v2 if you prefer.


Thank you! Please add this in the commit text. Also, I think this is
applicable to all such Qcom SoCs.

> 
> Vishnu
> 
> > 
> > 

-- 
-Mukesh Ojha
