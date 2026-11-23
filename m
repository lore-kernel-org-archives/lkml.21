Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795451432;
	b=f7KZjzBq3UbTe9RDFf92+UiUaywZsSD/0ooGTBeS2QeeUp9XAqlZFiOiXFgFNQ5Mlq7n
	 guQKptxMRuI0l34VRoM+fOUYg/7JnhVBAfDuHmw+ee0ODXQ6NAkt+5IrrGBIKDkfrsWiY
	 z0O5ZKzU/0QwWzvRXyAlZpmzVJbBMSMa20NKoo0Uk9tRKtUd4lElU2BNAQzF6uOCKa5bS
	 qaZHxTLarQ8TOeEgnZRpe1xgn42nBvMZg9D2YnMRd6lRlUfxZdB4RRvMMRTSt+Iupc6Ve
	 i3mf5+huC3Eiv3vdd841G6SvSQvRnu0exvwPVxGtxpcjX5MwBJCr2g+rpq/ThbtH13Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795451432;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wgZfL8OCYcaFEVWVRs6dEMoZxrUulD37lUUHWyqfj9w=;
	b=hf3TQTcFln4NruvA3tVegwlGxn2JLkFZvyz2dgp9tH/TBrE+3ZJM8eJwzfQL4ARB0ej9
	 NCqMMMtJpNl6bmtshBPpeuVnf2khWLkgnhv988mDy3aMB/Zo15asTUdwRU4sQwQS5qnvH
	 WreBUZAwQqhKhm2y+Cn6tYgtdlFWpKwAWl0crG6NR72/Y5bhg+G9mqb4sgXVAOxDa1E5d
	 Z9iu2i5Pv7zZ5Ha8SfZ3HLFawNrBMoecJ06fEP+wQ2IkTnj1AhItjiaScLu/Q7M8OR3eV
	 r0gohYWZ6FGc2GubAilTpKj9paxx7mkJzke+oZLoZKG59xEPHH8ejgFSUxnMeAV2n+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mgWnxa2m;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D3jxMl3s;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD41E606A330
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:30:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD41E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mgWnxa2m;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D3jxMl3s
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH3l02487355
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:30:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wgZfL8OCYcaFEVWVRs6dEMoZ
	xrUulD37lUUHWyqfj9w=; b=mgWnxa2msZDhh/78aD+5C/N8FOOlsQjvX+EY8RJ8
	6Ftkx3pL/fuLZ/bX7oZXJsLdaTIEE5gpMfEZJ+U1p2eOriVOWtEeO1PqJF4+eVOD
	lq7lleRFixoOL0Jze/JpLQpa0YdOUCCJH0BOHlyYNpV61qz961OXFQHkKzzbiU9m
	7seMcdXqmdfUYW3rc4p99IsbPTDe1dbJ33OCnDCjWmNr1SCpsTEoLZrTjAsiogfx
	R2ule6o9S8yYkvGfL9UJdoDjdugcOKhRKtHbZkNE7Rjb4TCh9qLQbk8y6RKX1I/1
	Hgh2HzDsh5/VIC5menYQlMoDcj1QALp85QEe5+IJz9TMAQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy02cf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:30:30 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso6368735eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795451430; x=1796056230; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wgZfL8OCYcaFEVWVRs6dEMoZxrUulD37lUUHWyqfj9w=;
        b=D3jxMl3sbEXg2zXYuGnY///1p+SBPYRbIPuVLFqrZOwZEcizJeGcbhnzvenEwqMsaL
         zf0moEPIQAGu58rPmtixN4A6Hd5+0it84gsHQComwpk7345JOqZmFwVM35cEuO52pu45
         cj/mVZcrdrQUSipN935vXMIXiM2I3I/SXePg7zoSmmCMEiuE6qzKVzzrkykeJ//tk90H
         gf/+LdZNvG33Vi1kAkWCfBF6KyThh9fkniHxEgqtRI4xNDgBVAQQElItWLP/m8BDRkWi
         PKK8/IfKi4yKZmeU6A7V5WwUWOUPCT/ah+WEpBIcYxMIBeVTRyYuXsNYQVzgXgHv0XFo
         3dcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795451430; x=1796056230;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wgZfL8OCYcaFEVWVRs6dEMoZxrUulD37lUUHWyqfj9w=;
        b=goxpNqQENNRPOcjJWia1/10q9naxGR4UcUTO4FjBCJ3pNSIcmL1oG8cEAd3VFULp+G
         V4MSmJRhXayrxkIL/gfNJBRNbUDHF/m7sxJ/7Ee1c5ZSMZLHKasUaLRvy0YuFfNeXoIP
         N3a710Nno+MGuL1LTWirB5mYqEfJTx9fFnEoLNIMyE/x9/d4QxHB33/ZTEVdLA+hPPFR
         D/10s4W6E+00CSIbxUHdFvSOziDYJXvB+nElR46Vl/lD7w4fFseRgg79jxDbbVuQznLT
         Q5zZlBb7ZISFu9SQz0gryhYOuZ7UZo7AaRbt4z0BcxFY2lPJoIJYX+WoybuP9d0u794r
         PtWw==
X-Forwarded-Encrypted: i=1; AL+hErEdzYUPgDDc30qr2oTgjtvzel+GxzpHNzghykrDKSj7puCO6GuKTrJ+7EoI1FaeI7NxoxZkLpM/AfYpf80=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hntROHoY37eJIOCSrS9d/39AvwyJeA66NfIIE4VUZ5MEPGPAp
	ioCsk0QPH7XdL53tZfkOPoO/n9yRMrisD+oQFGdZtW06R40UKhdJ7qXgCWiuRl/l2NYb1JfNpVn
	jPFh//dCi1xgzHeyBq4qBjnvPgEEtwFthHIvAGE8rqa7lit2WE47vpoFre3vGZCFYuOw=
X-Gm-Gg: AZFdTZeI1ZYH80P1rNSJ94LRdKHWKRmkpo2imK4GM0nFQDCtAphBe2TviuM4f1PINrO
	Grfe08W18SuJq4CCTlY4kXMvyB9lVe3U+6xIwnI7LctRSKR7Qj0nGD+Cb2gh4BIkzIGLWElE9/Q
	M+B5DjFOMTJPedHMxrWLbSknkQg/0+sk21eoz7QnQaaTEShKCoTP8TgwuY8L4kSTTQ4eZG74VDh
	r6uHta6VmPFUlAv7hZIFQtueSVmnb7qo9jauOk5iwLdyFJDCTTMLvXcWEC+rZZXMYCCTR/5cCy9
	eOGiJ9G1Q5lSvRElCGyA3WFlxwZzeGyC/z9gymduQqNTv0xHaS9marr95rg/V8CPvkhnWN7xTEh
	OzvcMPpyDEGMXVJjIVjD96E/zt5I/GgD3FHytG8/E6ly4+IYFHBBHCucFfLZ29pgH2RI9QinJTg
	GA
X-Received: by 2002:a05:693c:414b:10b0:386:9e32:a65b with SMTP id 5a478bee46e88-3869e32aac6mr8747288eec.1.1795451429487;
        Mon, 23 Nov 2026 08:30:29 -0800 (PST)
X-Received: by 2002:a05:693c:414b:10b0:386:9e32:a65b with SMTP id 5a478bee46e88-3869e32aac6mr8747241eec.1.1795451428755;
        Mon, 23 Nov 2026 08:30:28 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm47044806eec.5.2026.11.23.08.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:30:28 -0800 (PST)
Date: Mon, 23 Nov 2026 22:00:19 +0530
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
        Abel Vesa <abelvesa@kernel.org>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: shikra: Mark RPM message RAM as
 no-memory-wc
Message-ID: <20261123163019.msbsccmfzdmfjvei@hu-mojha-hyd.qualcomm.com>
References: <20261123-rpm-memory-non-wc-v2-0-3e868b4bfa48@oss.qualcomm.com>
 <20261123-rpm-memory-non-wc-v2-1-3e868b4bfa48@oss.qualcomm.com>
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
In-Reply-To: <20261123-rpm-memory-non-wc-v2-1-3e868b4bfa48@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2NSBTYWx0ZWRfX7z5h/E8cqTGF
 eQga80MgKJLqvQIA2Cyfsq/s3CecJ/nCYv9GaKH5GC4Mnntn8nzbxpVglofeuvO+zC1uMqBbkZn
 KBwa+hRzlM9kv+7uDtptAzqgxfiWbPPC1Wv83C0g7d4mbNQCepuSZUx3tt7kTATve6Y5meZdO29
 Gg7AckXFxmY5MoDq3ck2qZ3Wo5ylm8fIOYe7ZAgKFkIIqn4G5o8GUTuhAWbw/m7DCkzjmJXzVbG
 Gg7D43E/D9kirLnOBjYvUjOrAf3ja532rK6yL8BfGHmC9IeuedxiftER7kidIhKXQ9vc29NsSj5
 1Ia94F73XT+5+fXREMgldoo/+pMu8SYmcw/PhD0R6bIBiXsB6c0vXDEIkM9sAoCtY6keklehAe+
 chclec8/HntYHbC35f7NwerFYJEfn+s9zImQ/5EwJ17/5iDAmQ0kfcodLm6jsqL6BlnoYLXYfKF
 ZQ1NoJtbKReHx0Ibenw==
X-Proofpoint-ORIG-GUID: RTUYkVhm6JZ9FeVu64vc24hPcUmlLwyZ
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b046a26 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=I6c21bvp6He-TJasAPkA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: RTUYkVhm6JZ9FeVu64vc24hPcUmlLwyZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2NSBTYWx0ZWRfX6gSk9YPuWcTN
 oAgOYCmSZ8s7dCgem0OVFUI2BSoXDhmvrf5/heGYvgJ4SSjQj1eTO8DTXxBgpjTPgjy6H59Al2n
 OF/WzRrVFwgwSMMJ1/iXZMBEkC8yk6Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230065

On Mon, Nov 23, 2026 at 11:48:56AM +0530, Vishnu Santhosh wrote:
> The RPM message RAM is shared with other subsystems, and parts of it
> are not accessible to the APSS. It is expected to be mapped as Device
> memory.
> 
> The "mmio-sram" compatible makes the SRAM driver map the region as
> write-combined (Normal Non-cacheable) memory instead, which allows
> speculative reads into the protected parts and results in XPU
> violations.
> 
> The violations are seen when Linux runs at EL2 (KVM with VHE), where
> there is no stage-2 translation and the write-combined mapping takes
> effect. When Linux runs at EL1 under Gunyah, Gunyah maps this region
> as Device memory at stage-2, and the stricter stage-2 memory type
> applies.
> 
> Add no-memory-wc so the region is mapped as Device memory.
> 
> Fixes: 66664b5701da ("arm64: dts: qcom: Introduce Shikra SoC base dtsi")
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
-- 
-Mukesh Ojha
