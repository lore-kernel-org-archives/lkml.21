Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515140;
	b=tX9rg2sIhoBAy/czeVBNj115ztvr0nmQXU0F9OCxjbZd2+4ct+pew5L6HtiY/JFpWSHC
	 Nq9rAGbBgIzzIxs5xojsntONcZqzFuML7ggIqKUQtre6MYh0B64b6ZILi7pDI27jvQCE4
	 1ZeZT6zTejM+TzHgGxgFTXCK/knv5emMDiZP5kHs3pfatXfqmveLddNdDlCoNMf8tQvZM
	 +Gq0ezRKY0eXNEZ3UT8U11KkK24FP/gqZ/qFUwHgkGRqhhSPUHF3R/ydQxy7InYmPKFt8
	 +eRFTIaL0IQUa1pHkaYeQgUKxbn64HE1opCxXNGgCpjLzAjzz3WFmeqfwODU1Ib1hJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515140;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6430HUVLr4bJNErHixuqanXn4vXMjYSsZt2lpy71S+E=;
	b=ST6uD+ROKjKJB9/DlJezDKzqf20eGP0r+F11mhgUhUs3AoSRDHQV2l4EuV8muY0q6g2e
	 RZKdbqqcE6VNB6J9jVeImJycta9mvAy+jAUsRso6sflaq3W9JQejXb1bf7C+/6BZXbPTl
	 RS7lqdfeW3yDqznl4720ffRurWldjGEagDEqxdpfD7CnkX01QL7nekqqzVdSMIWc2V4fR
	 TrkDm7EDq0A93U62bZ2v2Aun45M8b5X/wmF1LL9UQenh7E9lw2M/+BS3pyVPtGEQH0WKk
	 OJY5Qt2aEGU6B2HrXWMd3eE7X1pyFsJPmOYcwlmk/WYlaPzhP5cGlBI1b3hzrIWejJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mDrQH1Cf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NxbjnF6L;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E796606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:12:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E796606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mDrQH1Cf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NxbjnF6L
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8ce7e2208787
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:12:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6430HUVLr4bJNErHixuqanXn
	4vXMjYSsZt2lpy71S+E=; b=mDrQH1Cf6c5ArPYtVFC33gvCPjdAql19E0mcdVR/
	9eqGgLp1GL3Vki8Vmur8tiKY8Tn+bT42atKTgCAIYukJpTr445Zd7CxjjLMXMioz
	VcFvRC4AWT777uNSpCPXx/rj2vHaQW92z6D+IUy7XRTIKqAgBak1a118zSetM6vd
	qY950+G8ey+vTkpD9n420XWMzELeA06V0qkqT5wCjOxDk9qgp907MGRE8cvWRxJW
	WMmIrFOLrfJVT9XfgQvZcoTfUck6eJ0ynjpHtccprex+0hvGPA1gvjFBHC1Ufu+a
	kCslzGU3S5botnVMrvR7NKdFc99pgUfswLvi4XwbSUqykw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yy125ux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:12:18 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386ad819860so1814065eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795515137; x=1796119937; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6430HUVLr4bJNErHixuqanXn4vXMjYSsZt2lpy71S+E=;
        b=NxbjnF6LwQeuu7VkXngzE9TKNcxpj3cN00Rgxs1BVSnT2oQg9ZamRLfNIxX7tGrDNl
         XVORXmmg81izAhNMDKzPlmTShbWDgw9Ghf/c7sFHr/jwuSeeKqKVihzurUotH4PclA0R
         +ASQKFamgg4h43T1y1M3mxCCWhqkgm2DHe96FtExyr2RhHOQao6FvmSBTOBNqtSS5K3Z
         I3uSNubetg3mZN5OXJQWTUSYvQ4Noauq2JSku4qnq0a2lK4fce9xXodzG/fboAIiCU7F
         ySeWKwUt/MX29jiWrZMFvFPetFa413fbLYsRVLjoGxluUVQZd18zaLt4c+nlOuiVp8Ow
         VE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515137; x=1796119937;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6430HUVLr4bJNErHixuqanXn4vXMjYSsZt2lpy71S+E=;
        b=Cw57kI381dn4TQmKkt7CWd60Zd8WsAT0DrYEXB6lDIbBri0rRPV9uGLp35IoDrImnT
         fbIvKjsY8O/ZmiQVQPq5yWuORfyuqJSYD80e3xxqNNCB6r5W+1j5ZN+DP78dsQrDYjZD
         h/gK5bni+L0yYHHZzuPURwgs2vNLsy9eMtpjCl/CYT/o3QVNgTudhXLgIC+0Uf2beUH5
         jmJuRSuRG4byxu/5G4xGFymDOYYB1DEGMkAJU1kRtC1uNKqo0yMrnXlmhGlxS3aB+FPt
         LOEQcY0SpkBhCK3ShCQLiuMhEJAkAQyDtCKDTJzNepw/N/DfPXkCcoRnKTx+U2jqaRNN
         4kMg==
X-Forwarded-Encrypted: i=1; AL+hErEwZMYYu//gj/E+i4NfitYcQwnv6h58rC0PVuh/zcNgf3ZUZdoxrrZUYnpcpaRFfN+6u0Rs0aeqiv1TDao=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HUy30CGO/MvLOVOGIwAU5zEUpP68sf+CUlo2I+EukjZgxbw4f
	zimVJJMVOwlfWdmDYCA7/d6pcC+ZuvqP7UJQoLWFLCp6jP/PLY1KcztNH2O7UK1GoY/MAyqmmsL
	RlhQD03KhHX4PK+ZYoL7hXwqAYQrrKBQCsYmSi1WtxI23BeuoXHAaSCngHOFSb/S5fNQ=
X-Gm-Gg: AZFdTZcBoXQfqA+VzJajyqd2pkgVEdk1TVjIilcbQNCcGNXm/X5dd221QbPFwk4kcAc
	OR+9/WOBe9lDcttYOemsh6m3CsbWvnpQkIDY65H+ImOEOF5oPmKeOkAPHNutpFpBls5oX9pGA/2
	H1mrmCYWNtocxMEYFf878gymfGPXCS7yI2RB//BE6gN9KgLNqfw52p4laU548udacxEsqsIMHbb
	vMP4q6pcPhO1aXVqkIryfkxx+BNQHcl4CqcmxQhrpU2FLDBFHomJKhNMV+/WTFy1fkzxjiEXKvp
	nZoEtHOXtg6WP1lWx5WoPOexO38a3xVJc8uWBylRWHIjQumY3hy2U/5wy91BMtR38XVqReXJcLB
	X6DYrDRF8fxayDUd56v8W+gfo/0NpBB2sXg0lHqfdh/dU5GR8+RrafyMYnbc3DA9GA/xchTLhSv
	3R
X-Received: by 2002:a05:7300:f68e:b0:369:21a:dcca with SMTP id 5a478bee46e88-3856e9472e8mr14256322eec.10.1795515137009;
        Tue, 24 Nov 2026 02:12:17 -0800 (PST)
X-Received: by 2002:a05:7300:f68e:b0:369:21a:dcca with SMTP id 5a478bee46e88-3856e9472e8mr14256287eec.10.1795515136350;
        Tue, 24 Nov 2026 02:12:16 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm10543902eec.9.2026.11.24.02.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:12:15 -0800 (PST)
Date: Tue, 24 Nov 2026 15:42:07 +0530
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
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v7 1/5] dt-bindings: remoteproc: Move iommus constraint
 to SoC-specific bindings
Message-ID: <20261124101207.24nzbmb7udaq4ik6@hu-mojha-hyd.qualcomm.com>
References: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
 <20261120-shikra-el2-v7-1-9d9000eb50d4@oss.qualcomm.com>
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
In-Reply-To: <20261120-shikra-el2-v7-1-9d9000eb50d4@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: a9vkCgEHNqFZKz8G8iNrWcJRRRV5bfvN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzOSBTYWx0ZWRfX27R0jr6zrH5/
 65FJJMgnuyli0InRf+4BZPY68t5xn4sOZYam5ylx0CG2+0lcrq7yT5wUpZjVGrmtxykpIZ5KRYy
 Xfn+th9nm0JHYoGVEDYOsJyqj2p8Whc=
X-Authority-Analysis: v=2.4 cv=JYspPkKV c=1 sm=1 tr=0 ts=6b056302 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=_043IPGYQ-q8YCy9JWsA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzOSBTYWx0ZWRfX3dxujUYaIalp
 a3FznwO70Fd/CTpowqph8vFHNJGZlbrnqIIU3rIyG5lYdIhJDPmBvO+bAdillMat9GarWGXZEwT
 0TLCeA6UfwRntTkW9gKcsI0GDNA71qIR9t3fZwVwKjkA2cD/hiOl4CsgELrbam6bZ4MrGVdPFyh
 HqYM7J6393lPNtWeqrqq6o2Ap7xkKhANiw3TUy5jXKBJbJh0FWSabC1XOkEp/eIGQ9OjERTldvv
 xvp77JtBb2uuAB/KJqYH26HDERXBjfXImx982Dhz1WGFSET1awQGou++Hw5LcxXPZuWN01fdUKD
 4Y/U1D+geRwlyCrwYvyMTGcQZjJdcJbh0Xav0pd4ty8shUCWy4+J82h8uEo1/p3gLKxsu0Kt5S+
 DYcrbKewSIREE2YZLYnf/cqNtE66UiJoMZ7jQjhzOB6W9a8T2ywSGlMPXyzxHBqdQvS8sUf+hZz
 rfAxHbolGespodqix2Q==
X-Proofpoint-GUID: a9vkCgEHNqFZKz8G8iNrWcJRRRV5bfvN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240039

On Fri, Nov 20, 2026 at 06:50:49PM +0530, Komal Bajaj wrote:
> qcom,pas-common.yaml limits iommus to a single entry for every PAS
> remoteproc binding referencing it. This is too restrictive for SoCs
> whose firmware uses multiple IOMMU streams, and a schema referencing
> the common one cannot relax the inherited limit.
> 
> Drop iommus from qcom,pas-common.yaml. As this removes the property
> from every binding referencing it, define it in the top-level
> properties of each of them, with a description and the same
> maxItems: 1 limit, so that SoCs needing a different limit can override
> it in their own binding.
> 
> No functional change intended.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Thanks for taking care the suggestion..

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>


-- 
-Mukesh Ojha
