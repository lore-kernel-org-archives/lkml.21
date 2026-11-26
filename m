Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703284;
	b=XFpLIsajSY3E7W+QUbWZeqCDaG3Mhul2DZMG6RFR0arHzPEKasVTy3SWiQZ3wQbvEYUv
	 1/H7VdowHpMlTVRAThdtZT1P4NRpDcgLjgF8OPGPcKMPiyWzsxWvBPb0FW7dSV9K9Zk25
	 2ZPYST8DQVOoU4WvA6iyrQV3H2u+06lwQoojc4onQTt4O6Q7/5MIs5bc3xyEl4HWcOvdB
	 gdLDAVnwbkG/h9newq25F7CmSzKr5r6tM+HJNkd+UfGOWDG0xEB+YVs7/8tsGGgoNY8Ag
	 gZnGETcZHpwDJEpxuMM3hvoiRAMMmbDOHXwDY7Q1YMDPvg6ay3xjXZSbRY+55sFkirQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703284;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7Hz+V0KZEUKwYNABkLWPKOt8inKUR57WAc+UGW03IoM=;
	b=F3aBqXnXDX1ZEQonvyt/2G3fNJrFcerxCt6Ra5GUveOJll2IACYJk0V34UBZjQnD4MnT
	 JnuNQupOTdt3tnikt5GnqlEtDqs/BN9/rBpcsIMBI026j1nQVyYqtl0H0KRx9nZIcnfjr
	 /T1GXVBYGPTTxOUIVUOJ/AULQJ8YkvyqRbJ1d240NNZq1QyrJou6b1AdSIPwXBy+detP6
	 HyjRccW523ROW2bkVtYt2G/ezq8cdpLExTHR34SNEb9w9szqg4QVYsImuPDfweMYos9t+
	 l1C+gSXPedukFrY987RWdZ6YEY/o8e7SHNZn1iQdWepNUtgHhvc6CqP0iNR3ZzpWmjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fm2kgiL2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LPGL+WW0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B62A606A329
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:28:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B62A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fm2kgiL2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LPGL+WW0
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVYPJ1497136
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:28:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Hz+V0KZEUKwYNABkLWPKOt8inKUR57WAc+UGW03IoM=; b=fm2kgiL2cWg5RwJ8
	HFdDWNUoA/yk0YZOV+8RUXoFikuYrhEynGi325nG2OdMCTsaD6075+EiYmzqgWzS
	NUMdf1qaw8OCS7RiLSRlXCYOim/qKu7wHtkPI028cqfcV5j45FiJLtIDoI5kM2lc
	3aZ3HgH8aiYp8EQ8q5SC5Oxat6cXZk2s6osE6GDLIDfw09v7D1VA+puPzUNv984p
	1HnqGwy7GfE7806+8ASg8vmx5EAu9UETLMRu5tprgpIc7ZaHRBK+sL+5mBF6uGf4
	LqcBLfWteZI2vXIwm8/y5iiq6UkNYEGoMnhmbgIe+Qkt1Dwlj+yyAGZrnwyBtAkQ
	n4G+gA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y3eaa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:28:03 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-92108bbec59so8752046d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795703281; x=1796308081; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Hz+V0KZEUKwYNABkLWPKOt8inKUR57WAc+UGW03IoM=;
        b=LPGL+WW0CNQSZgyUJVv3qTaXwKwIek/gD5cD4sTkGMlARFggt3x3OjVje4d3xmGM8T
         davkXLjrufxKtAe0ihK5INOJaqCBCf5Egpae2XqVuTPSn9ZqsKwdx3pVw0Nfj3Ac6nss
         gHmMQo3H37ufCblREUylVzN2L7wSz7rqkKEeyApfddre9PPl5l4Hqq0uj737OfD+MIMw
         9l2QAR7S1PqnM8ZJsamDB3Y6ypEs4ngmlOgEp1GOkMZjfzlLBzmvtq6/5/1Am8xkR32v
         DVTixpR1YtcEI3kn4Nr70+oIt8wCSXop7ILFcDpe5bp1DLj/3dAa4AXsrtTVrOznsS88
         JoJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703281; x=1796308081;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Hz+V0KZEUKwYNABkLWPKOt8inKUR57WAc+UGW03IoM=;
        b=NwsQ2UhBDR8etsM329qWsdylYZhB9yopgJ8UJWyIReW2HCJq9uZnV6Yxj1iQaF71yh
         zK8BBfwcpGaieOIyC5A7lCEqlh1xg9xemHTgVzAekyKelwGLf0P0xp5L2xJuDks2Frqq
         99FYs+mF1J3Gy+fHH3+wJltHhYeJKgN/kVz9Z6IcWxf8vZYYoqjP9RQNuNMB4DCWzxUO
         Ut/adcYZTsNHDQ2pELAqDeCoXukRy1n0q+ntLjnQVpCYsIjUjL9WAzcAojB23jzlv2aA
         Knz1b2BIjRoeWM/gO9yCd2e0E7zbs4yCiN/C5A75OZ6S7bkiMYGibUcIEjSS/35mzTEG
         /b9w==
X-Forwarded-Encrypted: i=1; AL+hErHiA6bQKJ+R/r+gkcQIFEX9xW2BwHnOVwFWjgcq1B+OvmYUpCRmPaAeFNhxhZFFWKrs0xwBsZg+mNGv5Pg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eMmctkJcmXY4y4/fEh4tkJWjxs+o0UiGQMoX/wtEOGfiBhujS
	kwKbRdiKteotS6WD67nflKqPUBSwSpumRC4gvJIFpJibuYgE29z07nFpGifUxrByvyXJ6E++bHy
	utehtO63tweb+9+qNoVMcfTkMO+uvg5G5l/hj5Tk7AfrQ62JFrqgKYz0TFl2BsUgfIHU=
X-Gm-Gg: AZFdTZem8eDDSSCyRTlOqXkJHZIGre8S5+oX883fP+PuglRdRAgWaz5KEjInFL0z5W3
	mNUzKPXm0SGW9UHUBrJsUqAPobUQ1qAYvYUnKT1MMSrQERlaGSgt02/gkZOXaym7m+D0d3BErUt
	HlOEAyDmyhpTbsHxcJFiFi1NDkm2l3wk1Q6qbyLxewdBYEDhVShu5yjJwFd9AdRuXvtHaj2CSGA
	k+64MG6sr9KOI3A0lzKtW0BwbRSfucVRMqXyABJOTT0zYulNK6iLFkiDzChiae3EJkIimdnoNK/
	mWihSzLMXVmDjrZHtp+ldfV6X1dEO9t7FmRjSZUj7VUWYCJyOXqLT3eEYAtRqkA0fChzsSRO06i
	9BET+Ctw22r61epYuN77u+RBQ5/al+1gC9HTDxzguFEherjhDfS3l703Bqy4wl3xV7Zpj/7E=
X-Received: by 2002:a05:620a:a914:b0:949:afe9:5539 with SMTP id af79cd13be357-949ba8e9975mr3995705385a.2.1795703281516;
        Thu, 26 Nov 2026 06:28:01 -0800 (PST)
X-Received: by 2002:a05:620a:a914:b0:949:afe9:5539 with SMTP id af79cd13be357-949ba8e9975mr3995701185a.2.1795703280974;
        Thu, 26 Nov 2026 06:28:00 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc73d3sm756279266b.64.2026.11.26.06.27.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:28:00 -0800 (PST)
Message-ID: <d7901f88-af08-4a62-bf0e-cd7d858ec405@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:27:56 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] arm64: dts: qcom: sm8350: Vote the GPU memory
 bandwidth
To: me@fromdisposition.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20261105-b4-sm8350-gpu-v1-0-a7175cdd6512@fromdisposition.org>
 <20261105-b4-sm8350-gpu-v1-1-a7175cdd6512@fromdisposition.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261105-b4-sm8350-gpu-v1-1-a7175cdd6512@fromdisposition.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NiBTYWx0ZWRfXw9gOmwIWB3PJ
 avpvllpuF968iyhdoEvL8c4WmadP3XFxD0GOF7qYFEjIjvR1JAP2zPVdDz1Zb8GbwnP0ChFEYPX
 nmhsUX/NPOx6A0fv1/K7owPY9XZqv/7UGG7s7koXNF9CwRxe/FwEQ34qN/ZeQBjz3Y9xgJ4sXwY
 y+9EGFhJRSz2yUx+8l67VseZ/vSNXmDzxYZ1bsdMUU1bcNvEcwI2WNBbF/DsXNrfaQmFBkVqVzS
 Id1xGVvqBXcqidTYNzgzHSrVYfcaZsmzj4UvFwC8ZIlLnhWwhOY7x91LzU6iwoByAHOpxBZp3JP
 sIP216ZmQXEGjt9FA8i/IRcbLYXsce9lAHG1xeATCLLBOH1/8WVbkMTWjM080E/vTvaxqXqLG3A
 c66wEKfd/M1T5KgpSWHLWpAbOa5Itsok5G1eI39jQBbjPMjcS8ArETi4ic5fudIbj/AI8WEwRr3
 cjkFXWUGLlSiW9gcqAA==
X-Proofpoint-GUID: c0Ei7RSG2o8k-mBkwyTg9CqIWnRqe2NC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NiBTYWx0ZWRfX1UGQ/tsPZKjA
 coTsLJz0iD2cgPoHXONIh5O0uvQEGsV/LOC9Fp/f3vWWjzfmBjxJaHm98LmVm3KEsUR3wQAhFTA
 eubvbqVjkqbK0w6lWNhAytz2c1GNIMs=
X-Proofpoint-ORIG-GUID: c0Ei7RSG2o8k-mBkwyTg9CqIWnRqe2NC
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b0841f3 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Tt5JBQAfAAAA:8 a=EUspDBNiAAAA:8 a=L780p2Jx1yd6vCQwJl0A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=kpHMOrJS8sLNr5ru0mYA:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260056

On 11/5/26 2:30 PM, Demeter Barna via B4 Relay wrote:
> From: Demeter Barna <me@fromdisposition.org>
> 
> The SM8350 GPU never asks for DDR bandwidth. On A660 the GMU gets a DDR
> table with only an "off" entry, so the driver leaves the vote to the OPP
> core, and the OPP core votes only when the GPU has an interconnect path
> and its OPPs carry a bandwidth. sm8350.dtsi has neither.
> 
> Add the GPU's path to DDR and give each OPP the peak bandwidth that
> Qualcomm's GPU tables for this SoC vote at that frequency on LPDDR5, as
> kodiak.dtsi does for its A635.
> 
> Signed-off-by: Demeter Barna <me@fromdisposition.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
