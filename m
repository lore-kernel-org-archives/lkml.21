Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795006546;
	b=ISqbasPxnO9MO8ZY4dB7mbYuDlPOfp4TRRzU/nEpB6yGj2DU5d6iHv2Sqs6/ScvVv7xB
	 N2FxXOySkq9QEIzASkrKwN4GHy8M9Puoaj1ieN0tQKsyTQZe0CVOM5YrXTv7jgrHkB9hU
	 /bI3i8cfdr+IScOjuthMu5C+NuTQUR+3nP7aw8u+lahRG06YgihNo7zZlTN56PFsS37eJ
	 b15p858nJN8rNJFpr92yh1AJ+RvSJc1qv9OFJGqDA3B6Rbum1GFhP8zQ3RHd+n6kvle2V
	 s4EyisVtIy4RJEf9+7POSiR02YHc/CfFbOPLQJT/uiMztl0dFnj4YgLfXbm3XXn0BCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795006546;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MYY+8YGb6eYtDMEbZYRT9DRBab3FZKiNZ4g3q/1h+DI=;
	b=riGoV1LRCL9wlMACKAeTwbIck0qlDi1uyrd/b0P09JDkemokkjd1W+WyHwNtrz42Snpt
	 WUQBU8ndkHHEJ/xZVtNuGOA4j9MFeiJcJtDBwyKMsuJ/uB5LGiKV3C5yO4zIOQgx+dyIr
	 GdRb+0TKLUVg8RgBmPadO+eSR62nbFsUZw7mJikpQ0+W2C7Gl1CbqcDc44e8ST4WxeDHr
	 ZFeb6y6kSlvwsfyj+G3lanWv4IfOihPlI7wP9KqcyBgOXL2sGG6ALyDbIBq8M2CnU7HlD
	 E2dPJAT84W20aNbiGKLHRLNIIWXxSCi9M/Hxo8VO7QYAvkOlRAWRjYuyRpaPNxP0Cjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Da/YqfVa";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kE8bBk1u;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D3D606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09D3D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Da/YqfVa;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kE8bBk1u
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AICLBmh3769860
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MYY+8YGb6eYtDMEbZYRT9DRB
	ab3FZKiNZ4g3q/1h+DI=; b=Da/YqfVag0HWyElD8UXSKp4EQYe43p36+p2eW2NS
	mopCQ4RLk4WVaqBC+5mxfvJhKPO4ZKc3TFZqQM9ttsH2R5l5JT+HUv15f6zft1Gx
	RTzoGDTRZLLqDtWAIrTjVFdRvZJfAree6EDyx1hIMDi3HdVg1Nsit3DC5szprnnC
	M1dA9CyGzv+BMP29BqYdXguC3/Wh3W4HKj7U3Qyu14zwrw2R8/FkcQmnLdraK/th
	DuX5M67CANZVIkhXl14VJqD3lnzG7lk8rkz4TDhMGV3dNuAsecAofV8fh9rDExY7
	bSi0OwXtZa1pbct239IRuNXnCxCqG2UQ7er0gG+P0Vog4g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9b1pu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:55:45 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3821eb27024so1069224eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795006544; x=1795611344; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MYY+8YGb6eYtDMEbZYRT9DRBab3FZKiNZ4g3q/1h+DI=;
        b=kE8bBk1uJoDsFTXBFrfox13X8ReL9GGXwOVDnVqLonqvbUNqqZuzNtf3g0h7dm7W2l
         5DVWfUSxcW7KaollLVMN58rmBdR9r7Eoe6IzHLuRyajs1gShoaiTmfhFUkA1q7+Vi/YU
         Vn3VJpwjzaCqsR13lL7AoW3CjJPh3T3F8ZDblNx3mUHX64IoPGAxxj6+WWJImTz7JrPd
         OeRUWUGbYyUCC5+0lP/zj/COL9fNNRriPij6hSHQx4JFPyuPNKLzAeUGPE8VuHq8XdsX
         Qwan+d/IX8HvKqLgLY8vun9ibY+dWF3N9KDZE4k/x+loVRihg4R6EOjgxtxAULQbJ776
         unzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795006544; x=1795611344;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MYY+8YGb6eYtDMEbZYRT9DRBab3FZKiNZ4g3q/1h+DI=;
        b=y6lc7GyWkYLxudvL5QSnLd6VyCBR8Bo+Q+CtmXKoDMEyctDdCq5eDv/XkiDRZbat2f
         ZTWZAK5T7PeHavI0itsr6wx1cPAfwbx3hgZbBkjP8KYOxOy0xfqE1aj4dRAoK+xJ3WnC
         AHK50io7QG0WJdaAkD0uicb1Hf7eOwX99ox+F7yw4KFzPYoX5VkCjJg0Kf+cMKkq/V74
         lVQeWiLs/eEeCMioyKmg2XcA1leoiK6CEVLz1VgoozBgSEW0bXhd1lzkVog50OR4RpSX
         q2xWzY08BiSxkgdyopKZfGcXMobg8lFc4mcHNBuROfAUWr7Ogng06S+F3MprUT2l2hiw
         rQPw==
X-Forwarded-Encrypted: i=1; AL+hErEIMkhmNjSf8/H/qVJxUbj7zj0eqMH5wAhM73c5gtZB32OS18KQFvdWR70O3/3JoYWsaGB0rD+DjXCFaAk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9l+Ix25WjVlXSiibHG4O211y5Tlptg/O790XT5YumH03S6Nenb
	VhwgfL5Q81WYORjzbSIAmuZzTICFbnFFXGLWDqkFK44kMp75KW+2N5Q9mpyMUYSDB0m9nWi9A/F
	9dZlytLJmbT8tYQoKNN24TOxSj3dIFDj1d6LElhScNdKcMNagJDSG/vvXhVI8fDmH8Nk=
X-Gm-Gg: AZFdTZe1ojIgZYWDLc/VB138bdhDIYm9GG6JzfGpA2fRDPhhw7w4Q6qs2feC9LDjaun
	KZI2MaKNIoFEGWBosF21a9GY1BjWXK6Ffqb1yLVIaretM9o85rCSnNIRSUzVCAM5HHA6JsvxWZd
	qgZTIJC8KT6Okj9s0oBygFim6jn6n7FNT7Yq3OT0W0uOT/i48tvXTI0LRA6AQFyIWUEnDToCqIp
	MaMCxvb37BovD8hiYkT88BeueLqAJAjdYPtFt+z2QDRA2HwG3UbwvkLrc7IVKgz0Cm98ElSgdY6
	JpLqeJXmN9htFNnv9mxNVlQM90Gai9xCah2fObzkjpKShDssWgIdc6y/qCdr0VA6+a+DEXrELhD
	G53CcdJcll0za8kN3EBsnTeglzwtamiCJvCh3axvCNy/9BHCCuJVVh+WTWsNC+AEHdBtpoOD5QI
	0W
X-Received: by 2002:a05:693c:880b:20b0:36f:202c:48 with SMTP id 5a478bee46e88-38280a3ad37mr2646226eec.14.1795006543351;
        Wed, 18 Nov 2026 04:55:43 -0800 (PST)
X-Received: by 2002:a05:693c:880b:20b0:36f:202c:48 with SMTP id 5a478bee46e88-38280a3ad37mr2646202eec.14.1795006542621;
        Wed, 18 Nov 2026 04:55:42 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7bc05cfsm8359166eec.26.2026.11.18.04.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:55:42 -0800 (PST)
Date: Wed, 18 Nov 2026 18:25:34 +0530
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
Message-ID: <20261118125534.7iyzuefhz4te35st@hu-mojha-hyd.qualcomm.com>
References: <20261117-rpm-memory-non-wc-v1-1-e246fc6bc66c@oss.qualcomm.com>
 <20261117161904.2hecbffviqjz2dub@hu-mojha-hyd.qualcomm.com>
 <6965d3c1-1823-469f-8777-17fc52e132df@oss.qualcomm.com>
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
In-Reply-To: <6965d3c1-1823-469f-8777-17fc52e132df@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1MSBTYWx0ZWRfXxuT4N+xod/oM
 eBpZ71aIE+ihc5Loi+emOdqCJsB/9YRlJldrx8KJIA0yLpj8Bz+9RPNY7B7ns5Xele972MarSUn
 JqawCcV1h0kmf5SLkusxoFBRlqPbh4k=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afda051 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=8YlygH76LDUTcj7JEisA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1MSBTYWx0ZWRfX3JzYp2zXL5qo
 CP9QYPNMHpM+lAc7LniKxr3zKBlC17gUdXnqq6AHoZ22Ixmt9TlLO2Vyq0pl71xfpgbi/LPAx88
 RxKtmnPavxUe/WM+V5BXPgQ+2YDQuHlJAYHa0mzzZqdcUqZbyotBs4+EGa84Mn1lstyRpzKpoSd
 5ZIYNmr8FCUGqMkxN4EwdJReE5M7vrOGzc06OcEnJFsQW0C94bGLlrB3wiVxTbFK51WMqMJH4co
 hWoAxuc19F6HXgPGojl/hcleC4QMwxCNM389aXqejBZhhj78uKDEzWcrYevJ4F7oMK0aqWKUMuc
 jRQN+p9sIgzKhjIF0P8I307FQpuMcv+5mmxFzCFEoL0FlQJFT67WIMp1g4U0nQAlkKPv1feoLhe
 h3j3acro6QHQRexpA12k7X4HdACBGGUg9LaszXwaxQFbSqMeTg4697Lb0cYNGPkNQuduTKpa8Xt
 kKrXp9Cw3/XE2uJhZPQ==
X-Proofpoint-ORIG-GUID: Z41-I8jJHfnRtPMsu30LhbQH7pE58Zj3
X-Proofpoint-GUID: Z41-I8jJHfnRtPMsu30LhbQH7pE58Zj3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180051

On Wed, Nov 18, 2026 at 04:35:55PM +0530, Vishnu Santhosh wrote:
> 
> On 17-11-2026 09:49 pm, Mukesh Ojha wrote:
> > On Tue, Nov 17, 2026 at 01:35:50PM +0530, Vishnu Santhosh wrote:
> > > The RPM message RAM is shared with other subsystems, and parts of it
> > > are not accessible to the APSS. It is expected to be mapped as Device
> > > memory.
> > > 
> > > The "mmio-sram" compatible makes the SRAM driver map the region as
> > > write-combined (Normal Non-cacheable) memory instead, which allows
> > > speculative reads into the protected parts and results in XPU
> > > violations.
> > > 
> > > Add no-memory-wc so the region is mapped as Device memory.
> > > 
> > > Fixes: 66664b5701da ("arm64: dts: qcom: Introduce Shikra SoC base dtsi")
> > > Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> > Why only for Shikra ?
> 
> This XPU violation was seen only on Shikra, and only with Linux
> running at EL2 (KVM). It is not seen on Shikra when Linux runs at
> EL1 under Gunyah. So, I kept the change to Shikra.

Thats not explained in this commit, why this issue not seen under
Gunyah ?


-- 
-Mukesh Ojha
