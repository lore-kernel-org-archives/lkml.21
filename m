Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462819;
	b=dO5q448LGz474DBuMiqbO5eUB2rfhg/QayfOyzg3moAQo+SxbQvSe6GhDNPr+Ji8CCcE
	 5stfYfPM1WPJDYuSLUUplXXVq/ysybg/YOJvnLMVCp77louKDVEhAmRkMfy10kNrh5hQC
	 38qwwAmFRie16FXecQhm9nLAk3B7SD2mdinE7RSF7G9HHGgkPYsNgE8ENqSYBS5zpIB4U
	 P0XQdxdLyxgYjlejAACHZtmN7bfDHyHJEryL2xf1cZbtkOpXktWEHJT/HF9uscWmHYfAP
	 ntRrs4oN7wxuhcKAlcAnyi9g6X1uSIQl4cyQzW1a1dVa1ZqfJeSGE2Remd0CtOH3fsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462819;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gQHF8sxJpg0r9mXjUhBjnOoWS+bWertP7VU7oU3l54M=;
	b=can+sc5nVw/bvPel+Qi9GuwFD3R6xbJYSrD/nDRMA3oTM0fk1Ag/oKr6AZrSeJs14fSX
	 kTKhKMcVnmqJeS34geULoxwURuYvVBT2dXpY0SZ/Tgu8+Ww3kqw/aawHS6r8UFVixKHqy
	 A3pGu/WwLqJxbAhnFjOEaonXs00rGeUU8KenTP7ViiQBaQFZBOBjbdppyG+JdKSiTPTuS
	 0WS9xF4f5qj+gJU/GLFj09i8/+OeXQ5ppA4ZJ8+EXedoz/Ur1soqOudASBuaSaa86pEw3
	 Z3zqIONsOJ8nHt0i8TtJlOsn/Kr+5b6bmrfw9aTuYCANwCXt+rPp2xv0lrwn9etjNzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FMCyqOPk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hf9HanLB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D402C606A337
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D402C606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FMCyqOPk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hf9HanLB
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH3ft2487357
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gQHF8sxJpg0r9mXjUhBjnOoW
	S+bWertP7VU7oU3l54M=; b=FMCyqOPkDlj6tsqZjM4E0RAqGGWIbRdO/5LunG3P
	9fW+J0svBtb6tGe0T4vZqDc8Pzf9UpWwPb7x7ZpthN2ksxxnHTdMJATjqCbf813P
	IftAagPQoY+mpj0VrfTDPMQnrfJk5H01S7I40JptHJjtiSBK/zmQC5Uy3/3Wjrgr
	mHAaAXspWIXHJ3EXQWB37e20TLmONF1kZweg9rhR1lrTE3xNK1RmNu5eAvHQX0Il
	h5tcCNfDlPLC0uXMq3pLE2ccqCiQ/LNGmcq02aB58MtfabrlKp791lgDI530WMlo
	zh2svND80S96HZZYj3i2iex+6M5ldQSD/XDbeO4hiZpV6w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy03679-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:40:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934963b2bc0so692419985a.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462817; x=1796067617; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gQHF8sxJpg0r9mXjUhBjnOoWS+bWertP7VU7oU3l54M=;
        b=hf9HanLBpNKMNAnoweFK/OazddHH3vCjpcERlge2KFfvTId6XM0ksx6HRUUZbX+Cdn
         xW4oqAkHmJVkJXZmz/pB6eeMa94kNybZCRPEEXUxXe/mU7g+YC+sDPUJNtRiYuxnZ0zI
         KnHnTElvETpakEGTWliTeZsifyfk6Sbdwvg4Q+gFyaGYPhtF9MVmhS/JzkFijpVRylry
         5lxI4EqesypYrZ6eViRU3/TC6bIxGY1umPw7vvmgM/1sESvkYclVVHO1abvzD+MOYoRm
         9RvcrwqAIYO8SX7TXArsS7CgIbC+tZg0ihPpf70quomfd2DJp8bXUJ+G/5d71QtaOavY
         +h8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462817; x=1796067617;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gQHF8sxJpg0r9mXjUhBjnOoWS+bWertP7VU7oU3l54M=;
        b=EMoWtE9mSBtF4Yf6V9mkLx6wH8J4lyQsCfMQ7ruGI8wpruVWmyg1FH/Cns81qm4jNz
         Q7YtMAvFnCBbQfvsE3XWmf+GnTnaIcQ7OlbGx0+x+qvQl8DvxAifT41zhdK2wR1NeKB9
         l8Y5JV7b+m/beyBTkgps/Jx+mo6ElLtE4wY5KmLPalaUmTjwsNGTitKzLvU3KXUAldvJ
         7Te+C0dldM6/GRbO8qaEbfjXpSJSVBvwtA0cOP95BH48UAzAg3VXU9oZCLuJQxPHXsDa
         sLd3Y2UgVJ7rDeqCFNKPIQWkMgqxm5QfbwqjPUKIConJxNZy3YLkEOrYjbxlz6YAW6fL
         h7uw==
X-Forwarded-Encrypted: i=1; AL+hErEg9pbFrgArq0PNYD+y8SR9ijdUcdibWU4dbkc4wkbmbqFBoFHfhEe/YmiZWIiG2+MbO7ORQxB5mHmiKXM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fvLCtlvO97EKJ1hNJbmwhCN8xo+Zz47FeK2bvV9DkP6desork
	yd2VIun8cfEr27C959gtnPCFCxF0RcxHI7KEeSzwA+0U6QbdVKgOkeVxuJy7i5m3OgEuKLwrrCi
	+TX+o5HYH7SUUeEKZa3yltIrJ1ZcMSmA40ZCkoh5LVRFgEG29KSbMyIICMH1iANSoGVQ=
X-Gm-Gg: AZFdTZfgpLEbmNpkURk3/Qs4XjJU3LTte90wsoEysI9aJcd62ZnY7vBpJLPZFbhCwr0
	Aw6XmoigMi7ZutihcrhMOy42Zvo4u6ezVRFeYQI3TPvyACI4H8B/qfjaDw3o81NGdHDSwj1buWX
	Q0blqPIlsJ2Gv4a2lrdCj8CzaOWX03DFnxkcaW2E3Bg/ZavcrKF4EEfR8kwkrfh9x4TBhp6+XuY
	fzDiFYpBYEEdYxpGa5BRYxhDmV9aTdHhw4rVE3lu8Bl+Xpdk08oZhQEBXCEcY6qcYFrsSa7J7il
	wGmOsVrBEDM+xqbuF3fFpoZPIaC4lKpChmg6bcxFytlV9ibhTfjAn/YDAGKMYbT9Eg/COVSIn2v
	3iO87wft/ACuZQoaUBUHHrH3rCx8La+/d9DPWlmbEYVywHFjySf/DfoAwYOXxojGB
X-Received: by 2002:a05:620a:480e:b0:949:816f:cff8 with SMTP id af79cd13be357-949ba823573mr2256930985a.3.1795462817013;
        Mon, 23 Nov 2026 11:40:17 -0800 (PST)
X-Received: by 2002:a05:620a:480e:b0:949:816f:cff8 with SMTP id af79cd13be357-949ba823573mr2256921985a.3.1795462816158;
        Mon, 23 Nov 2026 11:40:16 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm27856759f8f.21.2026.11.23.11.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:40:15 -0800 (PST)
Date: Mon, 23 Nov 2026 21:40:14 +0200
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
Subject: Re: [PATCH RESEND v4 09/20] arm64: dts: qcom: sm8350: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <gcgah4os654tusrceekh6e62dlgmtqggtlgolua4zewglhrpjk@4rnokaj2tzlf>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-9-be30526391d9@oss.qualcomm.com>
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
In-Reply-To: <20261120-smmu_interconnect_addition-v4-9-be30526391d9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfXxLhRvffOp9Zn
 A3fmSSbCvfR4K/Xwj8WIv+DfXgxeW4YXA0X7GLP75AmHjY9gBxilMJyfoWUrW6dgwk2zlhqAqc+
 h9u5ktUJJNl4frZMAagLZ8E9/oDRkresmD/amlgyBoYYgYlPI/4ikgnr1V6GR3UtvhDCTPcqPyy
 3DVTpYBqsTzkwLrXQaQ0muHjzY/mdcNi15GDLBbtc0H74NV8AE7lLSmHdVDVZv9ZWiFFJoIs7BF
 KYX/IRWWQEC+ywBuALsKCmVr5nuBCFtuCHrlBTUX9uzwH4ltJ8Cogc4/CHTJ/ZCNGSr6VijKE+b
 eIYPJLOl7g58DXvwwaPviopP9nLA+3NcjoAH2C+KkOzYt0nWoNAulnrd44tuGDbwBfwpAUX1Dwo
 CfOOcYVBJ1pX2klrRMzxKX81nqR4Y7UVdvJ7S7ml1S7jt2S1P1GbM1GhcEMgkT/DEY8UPA+b/T4
 hTWnUT2K3CVJUtfIdJw==
X-Proofpoint-ORIG-GUID: pUDpFUohMCAvTcPlqvk7b32nxJ_9As2g
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b0496a1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=jAy75CqWmSRsgNc4pWAA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: pUDpFUohMCAvTcPlqvk7b32nxJ_9As2g
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX1yvSim8ip7yM
 wporDbK28qxT6EOGTaMzR95Pt976beX7Tacn19rW8G3XMAIjc6oxRJyubbEiMl2eooE8fDhjSCB
 be9o4Xz1fbIOR4UXiVVMD0clrEFFwSk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-20 19:11:40, Bibek Kumar Patro wrote:
> On SM8350 the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
