Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795485203;
	b=LXly2EaIUiMsTlldgvr78UAEj+GW/6F+TV7osBTcXjjNZxpTL2ZDyQGRUHvIY+9EdTyp
	 RvhZeikJsON2t/rHtXhH21C3F8Xfb5iC6xOUMIAZ6JBZAYYLVpKOcdjf84A28OBCjeSmc
	 mxXbQRoFNvmjQnqEvr0ArlrMvg/7m7r2r+s5AwlrrdZ2uA514oVRmFDg4JCsbht1/nwsz
	 dSpKC9EU8tfjV2r8UQ5Gv5xIhqVz/xbx7Rq5NWmLO+/u/pKYiIs72fVaER8pUQcBG4k3k
	 PvdbqCLPkClLOVkk8G+8jNu27DaOX11E4meQhOaWMlYsujk3ZEAZi5EDassn84gMIIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795485203;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=oRzRowuMjTP88VBZ8dPkOyqRLsqCyjmuEpXxgbGUTPU=;
	b=lyxClBtoYb+Ew4q9aWw1b/XSI17Y0V9IsexLVgs8ZFY/nW/QU/ZwCGJfEd01DuaQ+gny
	 cM2jehdstlh5EEgGkNxaS1yANn4ELd+LR/49qtmQjuG0J4CTxc9NJ6gPDw9aBgGKMMxxW
	 5RFsZXg67j8zTSVFG4jbgxyeb0gZ7B1Kmg/ArOAkgnkk4lIsMmFIbs5zwyNCAKiq6ZiEx
	 tN3L0Pb9YMV0vcui3CJxJnA21lvPOVTr2b0ON+B0/VVCHU3wlYNwIvsFhXziU2pwMuOvf
	 2jety1l8QQV85ZRlRD7QoMbf/s/04CF8aDVSahX1awBgqB8LlvTRSUSxeFWafFXKdAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oyWFdCo8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qv3KtVOp;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25E9606A68D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F25E9606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oyWFdCo8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qv3KtVOp
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJunoL1580334
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oRzRowuMjTP88VBZ8dPkOyqR
	LsqCyjmuEpXxgbGUTPU=; b=oyWFdCo8sTFYiL96gZAcLEAhAZQ2k5+PKIDRjXPI
	HszNWQvihV3C28SYyrUEAhBLYFtXKV6NOjtwHwgJ/SPtm91akqEOoh7nI2eGcKMl
	OwWtWmW3Qzq1PtQ+J4TcBAwNRaLWTLy/cc0dNvIphr6nLJlOnpSfJhszasE5BO08
	careylMaoefkTLsd52o6kdk52IgJ4B48OTQRPeRrDltOb24IjzLtqhA11KNZ5m+U
	N/8mWKtvAOkn9jgxYeDGr9+hjGSi2r0UbuflgVZgYddjrx1zyXVYuJ5l/mQvqF10
	fIMZ5C/5jlCLbfU3fBRIybi3Ou1MVJKAlPlzCX/2utNbeA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ma0u7ma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:53:22 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-375bac6bd21so4402425eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795485201; x=1796090001; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oRzRowuMjTP88VBZ8dPkOyqRLsqCyjmuEpXxgbGUTPU=;
        b=Qv3KtVOpRT2PKBXVaSrBR1xiJlneqCskhka8p7rN2jp51wJmpdO4pOUycpy+wIJvxi
         zunZ0lKBoAZVp3hR9zTJqesIhVVxUVGoErjB6Tygmx3kaB6CWyuQjupW/nEZqs0FqAEy
         3NpY8D64HItnOCMeNqIXhrj0Hc57HHhHmKs68K1aDjP5KQlRdMgcHU0yOdbShSzP7N+9
         fDYOq88rm+mYXtHSJ/rJCPeZ8VYCnfafb2a5wnDRDM44bOLmBn57wqiMfB9IV5xL5aiW
         wanwvkyZvOsCFgo0y+9pGxnMjqvVzmz2heUAGVCeNeuoua2X3BCm9yCfBantAtr+YPAg
         7tAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795485201; x=1796090001;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oRzRowuMjTP88VBZ8dPkOyqRLsqCyjmuEpXxgbGUTPU=;
        b=KsYxWlMmAEBAjPcaLvxiQxaffJG16sm4lyOlm/CGKr0jtr7QpKqh2uuhuhFYA2VDhn
         ac89Wab6s3srz07Xjn6Y4eSJPAB0NOBDGXXMHEK4Rw6QTNi0hdKbSimKOpNuxcjf3PPF
         6n2VDJ6Z1F8Bs8T8o52ehfFaBwiShphLaYfQ8Cg0vOnTeedPrnI3l6ACd67ahZIoAAjv
         lQL1li/qgywKBtCXgB6+faSLKVVHGCDDIdZsuYPgDoP/03aGPT0Fo2ehjnJnCBzBvRMo
         OEcp6cXJfnJ3u8FKFfMlimCedW2ky+P+0nTlxKeeTGwSJwjy0B30NzQlRZK2jF88iMcu
         BxUg==
X-Forwarded-Encrypted: i=1; AL+hErGHMoReXlQMpLJ1mAx0ppaiM6xGX7X98DNu7RTUu0377Cqrvk2R3cHwIuviFAs+Ye9lo6jg+kazMJojQ1o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZH3Y5c+U3FDMxdD2kSKY+02PahyVIYzad5D/MQ1v5N3zCUo/t
	ot+GXRjQCF49AXQA8PFtNgF6HbTTZBpUN1ajz0vGKgKmTqbmywNZZizDtH32G9UHw9CEd50lBtG
	E6KX9uHEzaYwBZu9B+Sx198H1IrqC+JboecZNuw2CpzWVH14cVQFEQ3AHg7hcUXe2UTvYPj00/Y
	A=
X-Gm-Gg: AZFdTZevTVEyKv0U+T2r4zC+xR40NMtEhZ2tU2s7mQ/x7y7Ec4CH3MDTFmHJF2DAvWS
	Bgnwq9afh0Qscpc6AVt5ZZ4Bbp97YY/5nQYZKjGWz8VBqAWVrxv5p02lSG9m0+Pm01skOftjZLV
	GRUp+Aa1ue27SCxdmpyGboRQxBgbacgp+o6L4+DjLEpIml6SqtzgrFl+6JBAp9/0PLb71W08Msj
	zpO7IrxhqyDFMAvqnF3lz42IIsRA4ICFijQeTIeZPAps9y+Az05gF+CkCZXgYKxCGTD5nEiZF87
	y6uyqVAULYsLzG06P9ix6zCVtSR54LLCTNfpuNEQwH3sbkUvnuD8LGEpeuPyhWV/zdidhsaCBVQ
	ZoZ6IoFt3vj1lP5T0VSR5YT5TjKh3gbtoxm6N4WvZtW6FKqpVpYWMxfSuJwazfO35bT/iQdrzzD
	dBcWmbPGZcvnFar3M=
X-Received: by 2002:a05:693c:6395:20b0:375:6fed:8e71 with SMTP id 5a478bee46e88-384b3986edamr14798188eec.7.1795485201283;
        Mon, 23 Nov 2026 17:53:21 -0800 (PST)
X-Received: by 2002:a05:693c:6395:20b0:375:6fed:8e71 with SMTP id 5a478bee46e88-384b3986edamr14798165eec.7.1795485200733;
        Mon, 23 Nov 2026 17:53:20 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm43160022eec.14.2026.11.23.17.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 17:53:20 -0800 (PST)
Date: Tue, 24 Nov 2026 09:53:14 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: apss-ipq5424: Drop unused qcom,ids.h include
Message-ID: <awTuCjZhZKgGM945@QCOM-aGQu4IUr3Y>
References: <20261123215842.21088-2-krzysztof.kozlowski@oss.qualcomm.com>
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
In-Reply-To: <20261123215842.21088-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-GUID: 2g_jGkD_75_6dBcJyX7npHsOeV4Vp8pQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAwNyBTYWx0ZWRfXz+2560IHYGgz
 jiAhZ2RGW5fru7p0j4p0jcPLvpPkmP5boKTpUC8b7pDSSQZ6afp/WK7uvP36TN1WyJ81k2jP7VI
 eurnnDzFHXrb8IUwPDGKHb+5KPsNhuE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAwNyBTYWx0ZWRfX45jSLP3YREn3
 fghcMYNGw8mXaew8TKfzBg1nCrzjZpej+CLyaaxh0Ks0vmAVi+GCX228wPN4spNRnZxn392e4V8
 OPlPrIzM+we7/MOaQy4DaO+PNRfJvoUpbf83qKlK99vRURANQ4Ig4NTeTsnwynxzz5eHaYoPtvE
 kqsw3jiuy66pzaO9HLmzDqNSCXvESpi+4OBrEoe6yGaMTiWR7ak/5iKyn7oa+aFluqLnWk1xRbY
 BesMlUoFhieBhMjC/wwkjRyOrc0AXgQ60FPjBwzpqi2ev8X00Mp1FhlYnIR69TRxcK0cK8M62WB
 /npQxE+P0Pa6CaKyHSZD6UpFRPoMRKcE249C3s2f8MAbZJ+jn0DU9RZwXmVX8BvcaDmurF+JlOv
 Y+ltofRpZlsOmgxjTqB8D6osTMQss5CWmCpzyHyMjGxSYOkQ8stAg2Piq/tirCme8KMv6qpKmLt
 9MhpV5htpvOKgC50YhA==
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6b04ee12 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Cr8ZdchctFYn2ypy-6UA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: 2g_jGkD_75_6dBcJyX7npHsOeV4Vp8pQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240007

On Mon, Nov 23, 2026 at 10:58:43PM +0100, Krzysztof Kozlowski wrote:
> Driver does not use any Devicetree binding from qcom,ids.h header.
> 
> Suggested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
