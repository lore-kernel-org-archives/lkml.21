Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516151;
	b=KCwTKp6pKUJd4LIJrWR+ckZ9QjD/mhkROBVWUx37q/ZKLNSucHA/cSXqyltrRxRYTNId
	 Dc3p/foMDaIuI4nGGFbQEC7IMYxihdfDc3ccYitO5kDcsL3OOywcE4uP2RGQWp8rIprtW
	 KX8SU6jWuJd3B5KEE68F5Asvk6+kaEoxaaMRUZ4jnvrDutpePOJAjO5nxvBVR+6H5y3et
	 Yyxqcq42DY6+JaWuMiZ0VFG/174leSfZ8poB7KcyjvA7JU/7OlQXU3PBpKlc1I/U/8Tgy
	 E7sVkq2SohssQMW80piQAUJRfUdQB/7FRLqPETFB/onWQg4VBKFVAT7lPC6Q3mir9HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516151;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=isq1BtOcwaV6k1B+5U1NnLpldAIjmTJ+TO6ciHLOLmM=;
	b=J228/WLBMR9pN1d8TWO0NVQzsfcYB3UuzzNCQySRRVasN8bdOiiKFgRbrI1KahMEzz83
	 Xmz6hKyokzimw5996IZ9Dp4pP5FyhIvL//vkQ0FJEmbeJ7FYmDxilgOak+9wGodlWq97u
	 WceW/DfemgEUzxRW9vBomuOBGWbUfCOB7uGopODgwaupmh0ZCUC9k5vrbQmSXZiTeMQHE
	 ODdP6yCfIfPYNfEVB/vjFCLygEfY1I1bIHDf30pyUnpbQhrmnBtZX7DB8DAKkaLBzFr39
	 nmrNwQU7jPeIiWQX6gqmMMFmFBz9gbjBNBPujuPhvni/9VQnxRG+Al7inyXoCYdf37w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N8ZdrZYR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hNjrsOkr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8883F606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:29:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8883F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N8ZdrZYR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hNjrsOkr
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8QnsZ3701759
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:29:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=isq1BtOcwaV6k1B+5U1NnLpl
	dAIjmTJ+TO6ciHLOLmM=; b=N8ZdrZYRTl7zB7gP1LKPgniw4ZznMWPBcr9GFT0b
	Fe7H8LGIZ2nxbS2jaRVVul26B1IIWYrp1UDJnoMDfToiE8DB6f7Ru0XuZdlDvUfI
	qmyIoHdn1WpjbECp4HFRlQTpu6qPZzQvZjUspEg55oIbpQE6bCjagm+1/STBLkjL
	MwDHhiS552nWzqet2sREks0dEbIHSqN96XgBjLfoSQfLsuta94wTN5rXAE6Zyz9d
	YloTWHdLEz5J0KSBPpFxtjs95IM09Snf95YNf9grOlz0Qheo5v399rIP/qQXFXpa
	gCSILi3XOSXEmgV/uhNLO8rBshCJc6mr2HBxa1hKRN0k3Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j50ky22t6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:29:09 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3869865a304so3452489eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795516149; x=1796120949; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=isq1BtOcwaV6k1B+5U1NnLpldAIjmTJ+TO6ciHLOLmM=;
        b=hNjrsOkrhyg8w6IsDeNIS4R2yEAEn0IfJDnenSIHrM4MxqZ/y8mRnvqpMx7Co2bMr+
         rjm57sGk0W2Nd3FDGHM5fMnLMi12PtZx6iWww7R3OEj+uV0QcVhTCKmTr+9YT6DBzvEg
         /AzEpEU6M2fSp8I7wx5HKnIbYDJQ2n2flN7pvM47+8mVvVYQQoG7muxxaauW3KEF+uKV
         ca7X43dQN972Aa81jinX//IQnhbKT/VltLv6If4QP5DpUnDVxaEeVNV3RHKDMXhSfI2n
         M+7MsKI5yEj+xcHX6Q2oZtHUpp/wOoaPjndFTkCU4xabPU4XAgAw5eY0cTGbOvjkbQRj
         wxWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795516149; x=1796120949;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=isq1BtOcwaV6k1B+5U1NnLpldAIjmTJ+TO6ciHLOLmM=;
        b=z/iFGGeeKrxbYBklKQi0khPdkcR2dIxdGjjU6XVSgexr7xE/BZKl35GcHzQY3qAOtF
         1Vn926lomgAY/8oEACYKLzqhnFyFRL7DAPCpf8Ma2zAB1ZwAoaBr49ahUSLtKMcovAHm
         6LuRSEYriSBPOWjA+yKWEVEOt8+S/7Epu4XN3nxPH8ZoXcG4vCsFb1tMzskGjp2bfKSG
         sLB/cl0VCTum6VWv4jqt4MgbeckTHms/GZpv+ESpxLwSyppZgFyHocLb6IvTbxE4xCop
         u5fUkvMnHcA5SL/XIxZzd1978uBacvbV7Cwgnh+SyXdiWujbH7xAL1Oy/Ns9vpoHq/uB
         7KpA==
X-Forwarded-Encrypted: i=1; AL+hErFwSQi/k/b3QcI747N4kqSUIBiWGXiqq7TNhzuWhQtSPAe6k9I5Y+qXOnAYQdkJxzJrXwx3iXysDnRgazo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wcqwdHZa/lmEnftssoThczAj5LPEml+8VK+yATQ0+uMjxxKfU
	Wz/wkh6TLGkFqxMOT7Vt7qCMzEdqRAIGLmZtXFYHnA4RSurzl/Q6l8rF6M2aIUG4dHOHh8N1EAD
	ZlJWtoclZ03qAfSIPOt2IxL83O48nwSU3mQkAgcg4TcT46yG0CXfa9JWhOG9KtkDIMgA=
X-Gm-Gg: AZFdTZcItQISsbC+/8lPn/JNQTyy7/5mVoKly8OEF+7fTRUhnRoil/T1Xd9vKpFQsyJ
	tzE9vGmJe9jrZAS1WGWY4p0AZY+CDMeWZC+bIbo1ngfvxFpzzyNgb/b+R8EU14fs1nN6wYR9srV
	dz/dzLVgv2U4A5pDh7xo8UNnPZgWLrw7DeTJNxNXr811wd7r2qBQ1eJi3N+IWVVdGjj6v7ETb1Y
	dZMr38ABlynwbYs9MvNgBMgzaEqBTFs6xApT0aKB5YiXEP0tHfZYHePlixn8Au3mN4WC7Taa4bT
	ACUJkKGXnPb4x9iR9XqZVA0Nyd2dgrcKD7yADEzCyMJRnvXUbK2Cz0dnhSnr3rS86XCzsbZqjwQ
	d3A3v9UAsnMlo1KclklW4RyztmwzjhPGsMfqC/qbqkLIb0+Hz7kZ+6kZ015gebdRBqkgPDu1jn6
	+i
X-Received: by 2002:a05:7301:c005:b0:386:a0c0:5e59 with SMTP id 5a478bee46e88-386a0c0757fmr11227800eec.20.1795516149079;
        Tue, 24 Nov 2026 02:29:09 -0800 (PST)
X-Received: by 2002:a05:7301:c005:b0:386:a0c0:5e59 with SMTP id 5a478bee46e88-386a0c0757fmr11227771eec.20.1795516148444;
        Tue, 24 Nov 2026 02:29:08 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm46045074eec.6.2026.11.24.02.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:29:07 -0800 (PST)
Date: Tue, 24 Nov 2026 15:58:59 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v7 4/5] arm64: dts: qcom: shikra: Add EL2 overlay for EVK
 variants
Message-ID: <20261124102859.s6wr5l2ta3sne7ci@hu-mojha-hyd.qualcomm.com>
References: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
 <20261120-shikra-el2-v7-4-9d9000eb50d4@oss.qualcomm.com>
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
In-Reply-To: <20261120-shikra-el2-v7-4-9d9000eb50d4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Y+ptIReN c=1 sm=1 tr=0 ts=6b0566f5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=wRyLKtKWvOkyam-9G8YA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: vFWfrIJqLgF7qEXwuIN7n_T_2YFrcgj9
X-Proofpoint-ORIG-GUID: vFWfrIJqLgF7qEXwuIN7n_T_2YFrcgj9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MCBTYWx0ZWRfX/Cd6YozqHiac
 CfaoKYpT71Vih6VWdkQpdk9zCd9bCooxX2qBeGZmvJXdtFgums8ZEhpkbToYT1Ou6iNJvGLDF8I
 4yTG+C6WobPexz3vhItHKgy7mZHJylw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MCBTYWx0ZWRfX4kyxyYk8Kb1Z
 7/s9051z6rM0ao+tVxkMuMbCaiK42O1TlhHWLrW9YuyX7ZCoEGxZFlGkcobd4bfqf6N9mKhv7+n
 /RNvnCvA2HG25uO3UiJkebiyblHxCf7bW1WbfbjjeLVZVW8HHc/Q3sPKZSnAeDbhwp1RGn9GsMa
 nuHgQIPaTg/BYZ23THm60Q8bGX/6Tz3O/uwcjJ/PWyj03B27hgIcSjqatF5QjRAi6XFt4g3sjtJ
 T0SF1jMKuw+45exTtH8+zU6BkzwMaJWw6GZVkpG8goMDtWjgf2bleuPrYiDB5N59LX8KjA68ErO
 JIDNBOdq5RyHkES1xbnnMz2oSgpCf4ormzI0rHNZFSJBq24XW2gdpoydRUHA2xOp5k4Sc50917r
 8ZQi54qIQGNP/kbR5fEnTCExwsvdUaqpnH3E8XlYVQd9qLWSr+YKu/Q1+UTYdHyF4WBZFMwI8u3
 AzgOp9QEkpysvfmI/Lw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240040

On Fri, Nov 20, 2026 at 06:50:52PM +0530, Komal Bajaj wrote:
> All existing Shikra board variants boot Linux under the Gunyah
> hypervisor, with Linux running at EL1. Linux can also be booted
> directly at EL2 on these devices.
> 
> For EL2 boot, describe the IOMMU streams used by the remote
> processor firmware in the DeviceTree consumed by Linux. Also
> disable GPU zap shader and Iris video codec.
> 
> Add an EL2-specific DT overlay and apply it to the Shikra CQM, CQS and
> IQS EVK variants to produce -el2.dtb artifacts alongside the standard
> DTBs.
> 
> Co-developed-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
