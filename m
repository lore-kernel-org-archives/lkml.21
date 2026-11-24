Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795508758;
	b=0HCJYbHXf0YkvtrqTk/A9RvvP5lnJ4WF65IeAVe8pBLD/JULjN7OfrX4mq+bqoQXowKD
	 J8NZfEFnXK12aoyP4mXY3K9+gmcOklczAoQKwJMRnTojR380Dw+Fko/xaxJZXxiKbZnfJ
	 zZKGsykZG9Fn6YhDQ0pRB0Tp9eqJagV4cxvXWl47YHFMKUm+PTh+9uASzJK/9IekkVk7R
	 FhMgUPpjIvaPaGHAsbDICJCNYzfaVHhkXLwpLh66SnLmdVfCJdSdrQDXti73WsoEkUX6R
	 GRrHboJBIOyZgL24prV1ru2LEx2qKmZN65hsG9s0TUJRQ9NCjC/PUGyzSmItKToQ5Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795508758;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GCTNA9xgCHXdB81WrISHqlua/lWBZnpYRxHVBs5lH/s=;
	b=XSpaSGOTn0DP2xbN4wpsa4RSPx5k6+V/g5XMgk3X6iyo73c9RbcCxudOk9SoFPZzeZ9z
	 K3PHzs40tglU43Ta7tvnPncwxLj3VpKtGR3M+mPZcIx1OjjvVkUDLB7rzXNX2yzGuJGx4
	 ZV1mLy/ttyad+qmZUNPHXe86j3z+hJITu9LIeovTM7/AdgYViQwPfgGfG9sXFcGFXRTcH
	 jjb5KXnDnz81+1197n3+2WvTySTg5IewB2obRHQc4YMaaRtt33cAnbB9F94Q7lJyArjZ0
	 gGEkuXhBONnKZdrvSZzuR8r7bGmpfUfDY80/ZWqz3T5+q3aU9OFYgaeloPGD/YfmC6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gc0jjAbA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HkCMqgTP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54EC606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:25:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E54EC606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gc0jjAbA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HkCMqgTP
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2k61V902021
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:25:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GCTNA9xgCHXdB81WrISHqlua/lWBZnpYRxHVBs5lH/s=; b=gc0jjAbAvL/zSslc
	utmB9/45kGAqVWnWEKLkVkANHSp+F/eDR8HDF47GBRhaa6P/Zlo1knyDckAZtx22
	gLFb6QV08z31iLEtSn8/muvnyj5dAvb3vX+oFkBNNdxLCK+QD4izuZ3tz7lD2A55
	qK1bzWfhLRyQuv1q1/wSIFzU003NDgzv0bsruifBYaXx00dM27jWQSBO+9sSG/eB
	Tit7+yPMmOQJvFikdlizr0bj5OXy7LKXjGifGlumL5cCj9sNVkw2iziPMWddiQHG
	JurgFCfgXaVyV4RVkURw51ofjxSgMHaqXayXPect3KxNuZyGwhJO+K4Q1zDa3lbR
	6sAo2A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4w6st6u5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:25:55 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8b32efd7ec4so4472842b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795508755; x=1796113555; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GCTNA9xgCHXdB81WrISHqlua/lWBZnpYRxHVBs5lH/s=;
        b=HkCMqgTPTpd8uWgqkNr6g/4dDJc6GOtZaHQhGKJwC1xfwaSJ+M6l5+yBJ++SbuGtCj
         jQRA0TlFWSflIc+CsQ+UZTxYaqJNeqtqxD8yD+tfW9BBn/dL1zoBGnYqdPpnTUBto4Ol
         gmJADUgZk8zfOELRCDWCYD1sbxLkw743YPUYCMunThFYnNfQ+cXY5juC+63JGQWotO3u
         PmK38Pku8tVqTvH/ja4eHPzV370XdCV29USAY6kTcLwcu591CuSj/se0BKFbmGTDnBzw
         p6S9uf78mIOKgbU+kdGxUJD/Qa82NlwjpPsbmnuvBYZ7jVTjsnsqx1ufvXyB1xABjjaI
         cFng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795508755; x=1796113555;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GCTNA9xgCHXdB81WrISHqlua/lWBZnpYRxHVBs5lH/s=;
        b=26F9smNAPcsCJrpLxhBmgXkBeHMbxksAXZD9MwI9npLK6cvyyH3NSen6Cu3OJzrBH1
         oda2++8cZnjzgQquDr62jTNfWgky/LATTuIREV8as6XPLLKDL1yMSDKU9Dy34wQtXYHF
         IBxG+6+/3e4Fes0/4SsWVH681vmQoOGMJjCn9XTBT82pZ+DXNunyTmpxJ5COOalUpl6m
         cA5uAkKpGUaBxRwnsP7RY8Cong30XM3IDlgOmSBFUhcgoYRXHTO4FKJkuF7U3z8I7zpd
         fw2Z9DpGKZUjKLdF3XH8hWTCAO/sC1AA6h1nwofYnGxnpqJhEocuQccVu4wTNlm1W6dU
         qDTA==
X-Forwarded-Encrypted: i=1; AL+hErHj9Jzmv7QQWvGbvCvq9+sOndNVmxIUaM0py2dVn7wQOzGhUZrV36MZTxNmUjbzJInlHmv/DdF37j5UYns=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ue971fzGm8b929GljEKoG/n9+XTC3nYuLkM5RLqtmUxPeqyle
	m93HB1perTfi47DcxDavJVM+77XGYI/Yrv06gz52xjk2kVK/MlTD3N2+oalxMK3Ndlsb80spLBd
	o4yc7LKPIgjaJcZuDvBFKczb/Y31q5cTjna09I4DHub1v3GamwBZZATcCGdivtYuSa1c=
X-Gm-Gg: AZFdTZcUYNmV5Y+R895p9UhbwxuvyqzFzAtz14Cr8s4zgxUNf1apZZrmu1sPXnflEal
	xQrRPy0U/KMfGAAkZXGB0IUhgNTgGf/P9ZWpzywfMVfah7xm+skomhuFYDICvacfF/ZnWVQA57H
	E7t6+EMsOdiqlNslk0ZBMSugSN2HRBLtuK1HM/41m4gK1UfuocfBEbXsYxKRtKR1+8DsIEkFelS
	2+vtUU3wOXM+Av8OlBP7D7Zggy80Nf6akq00ybLdwYwSK5eVwV5etEAulE6er6kzYGiOAWMd00r
	OSt5nnzPNTPNL2sNDc5j6rRKZGq8ZpwkeGUMlOa4L5td0I5q0l0J8xhgB+bxeswb3HZaGwIdRTL
	Wb4zhYt5dDza2kkwHxCw2/l3NrIUtvruhvKdyr5ttZ9xjbm8/vbnTEd1B2lWqTGGnlIA3bj+8jr
	+qOCA=
X-Received: by 2002:a05:6a00:f8a:b0:89f:7a1b:2bf4 with SMTP id d2e1a72fcca58-8c87baccd9dmr12143583b3a.16.1795508755349;
        Tue, 24 Nov 2026 00:25:55 -0800 (PST)
X-Received: by 2002:a05:6a00:f8a:b0:89f:7a1b:2bf4 with SMTP id d2e1a72fcca58-8c87baccd9dmr12143555b3a.16.1795508754869;
        Tue, 24 Nov 2026 00:25:54 -0800 (PST)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343f726sm7129262b3a.36.2026.11.24.00.25.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 00:25:54 -0800 (PST)
Message-ID: <f3ee6297-fb83-4b1c-b083-f3b15fa082b5@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 13:55:47 +0530
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
Subject: Re: [PATCH v3 0/2] Shikra: Fix qce configuration
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
References: <20261116-shikra_qce_fix-v3-0-9ae31470ef48@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20261116-shikra_qce_fix-v3-0-9ae31470ef48@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OV9Gj2h_M-36Vv2GHeICxASTwwrNUEQ9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzMiBTYWx0ZWRfXwPokPxFaigNN
 BAD/ckAwGhP3aaqfFBJmEkOnPogpNdj28JB0ijeehqK1LSJQ6pI6hijOA6BO3n+IeYoKA8ypPTO
 /Scgg/lAjwZnW31JTdlVqwnbj2hzCdE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzMiBTYWx0ZWRfX0p452Dgb0xyK
 7pB5qZ3pmR4ujuwxUGZUJIrzF1404Z+CsmmuIoDu34CjGt4CCzKnJFsIeKaPX33AvOWjORQo71N
 CKBv1fyxqXwKaJVyQJSIvWYqFm+svGRz4RV+9MrGZXMe7YXwj5iEGO6/Si+Mdlj0z5EEOtuJliY
 BvCM/nUb40vY/Dv4n4+96gM74NdmLk4nTF6ZLdVMGnQmh4N/694WsjYCQHWZMYXo0/2glZM9AYs
 eiao/fdy9A0lVbndOxvlu3dwGc1nKL9z9gOhlpdhDe/L9WJjHYi3PXuqH760XGQ5si/yofcwOEZ
 07ftbDHy7z+DPbLhlDFtesgLq1FYHLcnygDziznEk3qHdFGOkExmIWD2KCsoISk+K94F5M+BZbl
 ADLhf9w5Mredn4gNrf9Zy+66jmRYwfUpl/BDK4JAwTo5bc9LgUQPlPRQXTGZQllnQswYUV5l1Nt
 J9r89RTURCQ2GY0Mqxw==
X-Proofpoint-ORIG-GUID: OV9Gj2h_M-36Vv2GHeICxASTwwrNUEQ9
X-Authority-Analysis: v=2.4 cv=V8DoQuni c=1 sm=1 tr=0 ts=6b054a14 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=4cre8Lmcb22TJlfxBc4A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240032

On 16-11-2026 14:29, Kuldeep Singh wrote:
> Herbert/Bjorn,
> This patch series fixes QCE on Shikra and targetted for v7.4.
> Shikra crypto qce binding was consumed in v7.3 but DTS node got merged
> in v7.4-rc1. It's important to merge this fix in v7.4 to avoid breaking
> backward compatibility.
> This series updates shikra fallback compatible and hence, both patches
> should go from same tree to pass make dtbs_check otherwise patches from
> individual tree will break dtbs_check checker. If dtbs_checker is not
> blocker, then patches can go from individual tree.
> 
> Bjorn, will you be able to pick both?
> 
> The patch series fix description as follows:
> Shikra require explicit clock which is omitted with current binding
> description.
> Also, one more reason to update shikra-QCE is, clk-smd-rpm was doing proxy
> voting and crypto was consuming it. With proxy vote removal, qce need to
> vote for it's own clocks explicitly which is already being done for
> agatti target. Adapt same mechanism to Shikra QCE too.
> 
> Validations:
> - Qce probe and kcapi_convenience.sh tests.
> - Correct clk_summary output as prepare_count and enable_count are 0.
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

Hi Bjorn/Konrad, Can you please review and comment for this series?
It's important for QCE to vote for it's own clocks as dropping proxy
clock voting(patch in review) will result in QCE issues further.
This series fixes that.

-- 
Regards
Kuldeep

