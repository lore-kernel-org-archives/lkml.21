Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795461874;
	b=vfuWGLsZTv1DwypzucG0DO4nLysjsT0sTn8wDvLk4TbZ8XIugoqk2zQKxWvo+zttgxvg
	 Ubc4EInLjyI5FD2xt4qN+04OfisMt2bV/M5CnJoM1oUiaM9c4+j63w9xzUXuI4b20UKCt
	 f0Tz3JVXhqBssvNqgwz7QCqSNPWrsDgd2XniZcEBW8t/6ARnGr5jMADS3V5dyiEkbCUjV
	 FqO4gw2UADuigwiV5k9o0pyEkr98nDtVdeSt6qSRssvsgY1zTEuG6VvAiFI+Ja6gYkAyf
	 e0FDIlV/HeYkVaAUosteWSvPlWa825PvYdohHrNZ/wRrAb2hv/wdXp0nXgwtKZCLzOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461874;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vA8R0uS/49ozRCw0mif7wQDKIClLA2ZTyz78JVx+Ing=;
	b=Q3AhSvfvJHdWfmnuUAB7Z2TV7G1XSYcsrHxAxom5dTsDhxZ397NcLBLNs5lB+dBFoPbC
	 xbzo4h4tMuWe3p9gG+ZQtBBtM7UZWrzT5LtQx7rG5WT2537HeRG8swqWSNESwq1RPOb3I
	 qk+yO6swKaCEW364B67I0ibjC5+B8PXqa3CNPr3rzK5d6YKSvgUoKDYH/GHdmTY5GhMzU
	 UbXhLMkrVVDiP36RPGzHHdncHnrf/lw6u/p+clt+G6UleHqssXUlI6hyxjBY1lqlR8qPe
	 0TuDi8BG/QluejHISgu/53hBP/5JeME3zvrYe1vBbCiTZ7G5zVgTu04BdCerpHCWkpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kSrvkqXl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HZcfz55o;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C07F606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:24:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C07F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kSrvkqXl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HZcfz55o
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGpDN2769001
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:24:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vA8R0uS/49ozRCw0mif7wQDK
	IClLA2ZTyz78JVx+Ing=; b=kSrvkqXlPp5CBohHvqzEelQ/3MfkOygZ4Jkjxezz
	uzm6tev/oCuNoRwX6oNtqk66o4pXSm0TYGpjQPf0AyttWcyRt3H7SO3nDzBkh7TV
	04kuSBjR/NJnJylsuyUBt9aP8LH4/h0fznbnUTa3uNy5XxuMB0bq6eAPFtVl3SRP
	86N4MAx954k8rRnTcmKvgtQQessPEIKtcOL9eV0QEPKaQq7xtWKfEHXLXSjlcQ+M
	QIthPMajToZM4cXltEWvk5tpZO0oHHwGXA8Bpk9nHKy4u2DMdRTp83xllZmfhGe4
	sfPGAUwNXL9lcIm6CFHxvFVpgmVkS67DI2Nha+P0ksBOUQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pb26h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:24:32 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9211604468aso57437526d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795461871; x=1796066671; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vA8R0uS/49ozRCw0mif7wQDKIClLA2ZTyz78JVx+Ing=;
        b=HZcfz55oClnbMXOm6DjvV2O7lObVft45mbPzG1OKoeo/f9+GKVlXOlB54VwsCE2QdH
         PEbdxSY7H6+JQL+y6y1xOJt9G/mE4LKCRwiS/cpRDEFrAA07b1FmhIAXvqTW0MHkpZq7
         li+X2D7muglnHOAjU4Fdr97hLETUJAjSZljqANdKgBlOBzbRPscov2ycNljrxgl3w5f6
         0A93tVzEtiNtPnEv5FAGDNqNrI68OxpmdDQ9/NNTx3PTAezb6hdnaNWWsm4oafljSY/U
         x91texGMFb33De1osvmcvL5BQsd84QwcaMQntnf7dzGSvieKjZrI6ZHNsqIXVB+OsoE7
         Lixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795461871; x=1796066671;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vA8R0uS/49ozRCw0mif7wQDKIClLA2ZTyz78JVx+Ing=;
        b=SwBNLXV9NvijszB6972qI38Mb9nizkhQALfHAGgaBTMzQBBRBgakP3z1/1k/bkXA0D
         U/is9i2CiHsgQCQGCYd4P+YuVn9SI7ZxFYX4vybTodZbmjCJdvdAOCWcTqqRgSdOQFWE
         ajzAccPlNDBmQG45qMyTJHQRwn07JAWhcLcdB1m7OerfxKUKlwoaFSur4L9qMvac988V
         qHzH5NFDH07sciLY8d6Ax1KnJWpw5ZSF/y2LQ/pJ/lAYKORsl934Hxc16F4Lynja2PUm
         DZnlV5qzwB4rv562TeZkVlNIXtMU8AJeukdgE63NA5Ez9CunhBajTDW2yLTSUCDV4GLN
         XNdg==
X-Forwarded-Encrypted: i=1; AL+hErHNYUTs1ca/f38JJDg2npdmLIlnipYIhPpp/iQORooqEo4FzRKWLiAr9eIscCwj+NjmYodyKmgTXyJEB0g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8D/TzR9RwvAwSH6tm4Jq2Bkp81nlwS/0orxXE8Eq5Aw7Gphko+
	t/kQmxsxVPQ9K797MuvzyOAFUuXhJlYwqslEcBLBjuB8b3rHpyCpOSq0aJCILWFo9eu6/xV8/Xq
	p4g4cY8X3VCpMZR+VKpyqJngdvL4Xx90rjRt6GkTt3yF9e33Dx3IDEYLZfTShSfAfiQs=
X-Gm-Gg: AZFdTZeIoGJ9fcakvX6/oW3bg1qqjHGgNqJgpSaUr7lQgOJLUaU9u4/YxFluFN77Lob
	JvfIL2s8P1hHE/VWOCRMC0vAd8ntTKq8FNgmbEArMn00wmxLxrRHX2AQP7Af8zKbpWGrbJOJ7eM
	gWsBpMbCeb0RYSgtb0ozF7z789eCRWvpK2Xc/j052lz6BYnmuSgrVPZVzMay+rwfZD4vWzT81X+
	gWZSZFUunAaNwVyVFbuQAsB0O7Hi7OgmAUotQ8tZzs7L2wDnJrk6oXR+G5MDE32TArV8il2Lx6/
	ZjB8v62aRt7mDECTVM3VGMSOGVqdPaEJvDrFaA5xJIZ3cvmoD+cj495/AdyEBo7rP3X05oleJdF
	+FonVs+eyrk7meWsbbBqSWAUo6XTlqte0OmiZYaZYCvkkNlF3qPTriXWwJWF5Pvz4
X-Received: by 2002:a05:620a:4446:b0:949:70f1:de2f with SMTP id af79cd13be357-949ba8260f2mr2024793985a.8.1795461871359;
        Mon, 23 Nov 2026 11:24:31 -0800 (PST)
X-Received: by 2002:a05:620a:4446:b0:949:70f1:de2f with SMTP id af79cd13be357-949ba8260f2mr2024787885a.8.1795461870742;
        Mon, 23 Nov 2026 11:24:30 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853c9170sm436327465e9.14.2026.11.23.11.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:24:30 -0800 (PST)
Date: Mon, 23 Nov 2026 21:24:29 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] phy: qualcomm: Allow compile testing a few SATA and
 UNIPHY 28LP drivers
Message-ID: <uxutqaemdcgfatu5n6ckqhhwp33fzotz3pv2volcgywbzifrfx@zfo67vkasbkz>
References: <20261123190541.262138-2-krzysztof.kozlowski@oss.qualcomm.com>
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
In-Reply-To: <20261123190541.262138-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NyBTYWx0ZWRfX0/35kDq8DrVf
 FPvbciF3G8445lK4ysh4SUwI79zdVRfofytv2YTy88L/Qka54IjUC0U2jgEbvmKFh8Xsi9j9JYG
 1D5JNF7jAfpTIO/xHSmBlYGZtBmpjXnwxrz7ie6S17aazIFqz6z8jOWlni/CdUw0V5Jh1ijF+8G
 jYF2ZH/MQVWnvNwkneXIoKDKI74QZNp9wWf3PGKXv/fACd7fwA0lO+AUa4DSwJ+5WF96mvvZ/b0
 pVrjXGneD7+3cwsbGYV2RgDSPvsFnZdxqnv+LwxrAp2cuNJkB1go7OXz2D5vLgVSWEebC2OAOYe
 WY/BTAvkO8PWQmpJiXUpVqPbw68TnmiwSgn+9nHlfDiTTvHWAn+BXVyYqPY50Mp2kWhka8xBdgI
 QEcI3uif3FTc3MTackqXwUNgEREMAdlNWBThE18VE19vjfWf0eHzF0Vm8RjNO9Ai/L0DIITW6Vl
 rMYIeXzKyepXSIkO4rQ==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b0492f0 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bASQEeq-Kk1eUeroIz8A:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: TUfu1rdGh0fTJavo9yZ88PEcBZVBJ8q5
X-Proofpoint-ORIG-GUID: TUfu1rdGh0fTJavo9yZ88PEcBZVBJ8q5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NyBTYWx0ZWRfX/+zdXcpW0OOS
 ETFCgQT95Ut56quf6tg96GPriobvkNnAfOvrObfaePuRZ8BfeIeS4JcvaJ505UWaKU/brrMFyXe
 KGpb0ro1gUb6e2U8NSYA5RvKDDzx58c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230077

On 26-11-23 20:05:42, Krzysztof Kozlowski wrote:
> There is nothing architecture specific relevant to building of
> PHY_QCOM_APQ8064_SATA, PHY_QCOM_IPQ806X_SATA and
> PHY_QCOM_UNIPHY_PCIE_28LP, so allow compile testing for increased build
> coverage.
> 
> Cc: Mark Brown <broonie@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
