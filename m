Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606646;
	b=oMwVndzPxth8v051lYUFwIkVKMKTEBWt+Ck6s4FrOWAygAHPzGcCBljyCCokC2EfJX/L
	 6gD59ActDFeOOHRTrIzcQmi7NOCfg6QmjhF7QX3nCZG8Tn9IBNbwSDatBb81ydnbYfFzS
	 7B0z0x3NshYqTN0vzRbSXgAbamhbwwc6ydFbHGrl7dMMVqvMlP6j+E+Is/6lcbPteOaZC
	 xte1lD8clr6CvmjRkeiuzOC0WURVuZXcZhrvb9yMSDLBULGbIMTM7rvBVaYWnwZIuB0tA
	 gau5F9PH4/LtiIQtNEAM9aOAtc/FL/apbao8c4KU3AgqcwvWZ/9Xua2kbeyHEx8SuDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606646;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9VTXGJpWFmC/z0Tsisb0Mcij+wdQZSeFjVrVD94TVO4=;
	b=CJeUwvjVatWKzbm4rUOrFNEpjr5ezxyHu6HwJKOTOhCsZWhKR6iF6kWn+qAPQkZmAYSN
	 /rBmdNvbIPZKWvNdFJeyVsIYkwPuqUZLvtZO3snvy/9SOSYfWJf8DaP1qNclN5mMCxX2E
	 4NAZ9sd/UR17mM+HhT4YxVv2/uNj5aJREgwVeueuoK6FGlp23YzcfwV9mSWkYzSTCRr+8
	 zaSVT2LMyjO3oomLME2IeW5VeWL/CLy1lxdXzA2Umfws9d62xmnI/ovoPxtHRDSXUcO+M
	 DxkVM34tjf+BlBjcyx7HbdrJsPEBVGA2Y2XQQ1J5zA17+KemqJ3eeGkcrfIRIUO0iIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YZvBbmKc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HJ3a302Z;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEBF606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BEBF606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YZvBbmKc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HJ3a302Z
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mGKB3126481
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:37:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9VTXGJpWFmC
	/z0Tsisb0Mcij+wdQZSeFjVrVD94TVO4=; b=YZvBbmKc6OJ2tRxwr/7FDYNRNFx
	2j5d98N77o219gSqvowGPYymW31u+dzXCNXI0QNrYfyrzFIcOSfkj/p1dTvnGuye
	9fqDO3XWEZdZH4Rkhwsfd7bpfMZVt6UYIS0HGgJxEWVHb3vvkdnhZus5zTlTHk7u
	JbcLBNZrN20nt3Y4GNHhxI71qdveEp0X3AEKst4fCS0NWwKGhBH9NIndXSAvsAjG
	Z6WTUEPoBAVNZhgTD3zhSPQzA475WTcKd0oai9cqRovfcZgmWsc9CEb2/frbXuMC
	FgqtZUIe3cF+0waIW3A76BeimqCBzYXqEGlJwIyG3/Zf8A82IZcF9f99RHg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5eydbxy7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:37:25 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b4139b7abcso5262769a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795606645; x=1796211445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9VTXGJpWFmC/z0Tsisb0Mcij+wdQZSeFjVrVD94TVO4=;
        b=HJ3a302ZE0VnH/F9dpnH51nNFjlJczGndvaC2zLHHfXETeN8BAcdXiRVjN5SDPK3Xj
         NYDz1FlijB0K2RXUVBzRWeSLHCKHLgR9YY+mYISsVsNX51GFuPN1IAwFggNdZbqXWpzG
         5aHCJ3qCqAOVmwK0at97fxvkKp3dia+vnzhvV7SHUHIVJSfttQ/YqW6bE5GCuo/2sQzk
         Jwwte9IdhFo4/cZJrpAWcUM+x/wODVsUPkn7KW/GssTrwRv2F+nN1QlcLKmQTGiF0lIU
         sSA0DLr3BKl6HFcGy7Oo6+6NrSMVkHAqtxLLoCbzll4+POkxHBg1wbcRZVuUIA0/SUyK
         wXfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795606645; x=1796211445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9VTXGJpWFmC/z0Tsisb0Mcij+wdQZSeFjVrVD94TVO4=;
        b=vdxpyZBEhvqFZfDNOKor98dq6ONUQppjGLrDLw8Ho8KEnG3WxCrwd2wI2KNEFl+lks
         MCw6YNEmeX0U6JXvBvraBgzFizskq/+C2HV4JHr7VmPpM+jJpThdaZQ09EBVL7nlJkz4
         b8CnQyX8nQFbKNnN8cykeevYHwBlDZU71wtxggnkKAXPG8vKkqQ80nQsJCBKbmBQhd74
         D8fqIqcFDzwEVfsnz0wHT4CZJcAY4kS1xNO0MfHIqVj0y9dLbmCgIIC3MlcFcJrCUdKY
         LZmVlOOZnqhXzjGcBiT5FmnVR3eV1Dw87w4R8gICvaQYUW4vFswoQwB7wYvvAA4EwNBL
         VFMw==
X-Forwarded-Encrypted: i=1; AL+hErESj2WEzy9d+SNGE8EaJo3FzTGi2Q04KjupEgE0z3NtTLnurQ6RuImQy8mr7W+Tucpl2st9nmKKPIedPy0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MCEJMorK61Nat1SM2qRfjgRaDwbPvcINqXBtVAVHcfugstMYO
	YoomCDfjopjcGxIoI1+5bgMMpEilN5jdXa8Y9085KXEecmTlu1XP5SrBuLbKCiuLm2vDVEiN2a/
	VipxwfdFfjxXsRNA39CDLCvshotLNWRmhV7wz9/3zuGqVIeacx1GQZMbZ9JzANOqyJTc=
X-Gm-Gg: AZFdTZexgXtK7rGzsrwT2jQ4jJJFxovtnXxqkK9UIq9fVuN0FPW343FSxfRnRQ3sybU
	oiLIiJzeso8P/CyPqsrvqsrbZsIMvm+LsWpKuz8c1RiuyU286A9RRu+um3oDBhQOxpO+7TTdTPq
	JVuUkwev4rb6/mWZVGSLSxbsYu7pVje1jBsYfCcspMzRbQyZTduOspg/2qdad+5XGbmc0PwX2QP
	lCXs6o9p4BmX/dapczbOen/bnEIN7Rsu0pds0DgHc4XwccI/7x+kgqMV2iXa+pXy7rTciiIGYGP
	z/oiDPpIjZB5Jc57UbvOKtG7Gw2n0LT+vpVzTnnYpjUrUEDYVfOdVZNEkI6kK5EidCfCEknin3q
	k/ptcpsvIm3sUomZC8skR37CXUi9ASD4x8ktb5Rz0Ziw4QKfARZqAp9+qP7F6Wv9rrjpm+Mq3JW
	VIf1idHNH7p7wyczW+/FxyGzk6ofglsC10IIqQ4TojHm2xch2bGzFAYIU=
X-Received: by 2002:a17:90b:2cce:b0:3b0:9a1b:b709 with SMTP id 98e67ed59e1d1-3b41c95f64dmr17722219a91.54.1795606644775;
        Wed, 25 Nov 2026 03:37:24 -0800 (PST)
X-Received: by 2002:a17:90b:2cce:b0:3b0:9a1b:b709 with SMTP id 98e67ed59e1d1-3b41c95f64dmr17722195a91.54.1795606644336;
        Wed, 25 Nov 2026 03:37:24 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfcadffsm8697911a12.9.2026.11.25.03.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:37:23 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: qcom: Add Seca Ride board
Date: Wed, 25 Nov 2026 17:07:17 +0530
Message-ID: <20261125113717.334604-1-yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <e07f2f6a-31e8-4d7f-a533-c55c51237868@kernel.org>
References: <cover.1795517711.git.yadu.mg@oss.qualcomm.com> <845a24c91ea424ff30faa8e1d357c326eda2e5ba.1795517711.git.yadu.mg@oss.qualcomm.com> <e07f2f6a-31e8-4d7f-a533-c55c51237868@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NiBTYWx0ZWRfX3LjJIdabHyFs
 6I1PlYQO/ZkCNMHKBmWQHxasR97bA7VZZp5zq8hv1/GVnYEfM1HOb1w63zsmRJsjxEfaszH6BHQ
 YwP0NS4ftQAsSAJC+DTFG3ESZiIEtLI=
X-Proofpoint-ORIG-GUID: D9wpAix_IqtALA-6eupjhL9-5CC7sBMx
X-Proofpoint-GUID: D9wpAix_IqtALA-6eupjhL9-5CC7sBMx
X-Authority-Analysis: v=2.4 cv=GIGdgeNK c=1 sm=1 tr=0 ts=6b06c875 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=GTQg-DUb7hVcNCLWfvkA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NiBTYWx0ZWRfX86jimLosI5x3
 UAWKxcAfqYNaShjH8tUCx5RcfBNtumL6d9frfDiEteRSUvP/zzqkgEtR/S8QaA5oqVV4m/ySGUT
 cW6Rs70EuWLyVTYw+xxcAMgKSPE/IExgpdmCZLS6/JZlPZu43JLyG1Owj4QXxgeMUSTML06zV06
 MQmbB65nFNhzpDfSLq+apmYTlVj1WQOZxlkGMlVvtVshnHNxXGUVZRJHASDlxWGeaNmFJtg+108
 4MkiZZgbIqJltJW0AsHSGgOA3IYZikGIfgcTtvuTD00Mw71Xv3s0idglfnq2d/Rx307Jw6AH8Jr
 rNcTvEXaUBWOrZmx89A8HJdQt/gdvhAdxnUkzLf5QIohRJNndQTriwG94AbT3aiiL+8mF+UuSDM
 2xX/gj09prhEWYUJF6VxpMy6pWReeTP/6I4JIaXqjlqC6KhZdIXhAHU+Y9c4g5D+FYhtbfXo3gR
 Nu9e3762mfyQxlftD7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250046

On 24/11/2026 16:47, Krzysztof Kozlowski wrote:
> On 24/11/2026 11:55, Yadu M G wrote:
>> Seca is a Qualcomm automotive SoC. Document the Seca Ride reference
>> board, which is built on the SecaAU GearVM variant of the SoC where
>> platform resources are managed by firmware through SCMI. The board
>> compatible therefore uses the "secaau" prefix, with "qcom,seca" as the
>> SoC fallback.
>
> Incomplete, missing seca SoC in naming bindings.

Right, v2 adds Seca to qcom-soc.yaml. It also adds "secaau", which
names the firmware-managed (SCMI) automotive variant used by the
qcom,secaau-* compatibles. The commit message explains that naming.

Yadu
