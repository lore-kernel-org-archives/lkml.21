Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795440644;
	b=c9Yja4DJ8lLJ8QCf4HqmAliuJUsvIbANdPPOjj1ABPvLivMwpw8wX4n3BeuYzPBHJXbp
	 ti8CixZlm8KfFAmRE8WGBX8OPmPy5D4GCrqVOULmfMSFtx7WG6+RXauEDog0sE21GFiIE
	 WdBOLwX6NAiaz5Mf4Q95rR0WhZzjZlVt4lzuBQOlEaPElDXGkDyLTlrcG8P7iXWWKX5Rt
	 IRX1JL48F3agrtDEaEGmBfuBmkIXsLt6bRW/8up7FYUJ0n8E7+BWkNkAHjN8Qnm0qX5x9
	 C3w8EEqEh3naLpfW/CW3v4LEed6Ml8UHpY2ZoQhGGd8O5Atka3dIZnWeAU02GDsOa3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440644;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6GW16cYLEXbLEKRxCLcZ/hm1ouVgqsdPZ8UneMsZf6M=;
	b=aWiGderdD8z+6My9zi9d/cos42wWxwFNqFLnoCXjygtrQeZFgl005BqVo4L4BY+v0lA1
	 c8traFMDfyW6XaCQaMCtM0MjK1QR/ppU0W8rN6SZ02Ju1Uz8jwVrq7hu1+QuMIDHtqu3a
	 x3uOTfhI0YHzGDU3KOSbtGBSvJ3IS1rwmxLROTzmW66/01hvubetn7B/KeqTOadParASm
	 pfqbrZkM4TtWLrX350BQFpDPO57jIgNcuNkRmGm5p2V4SeD4PqhMm1RPKsbEN1pkpvdxt
	 vUWibDfOGDGHkKLZfwAPcnf3tVa9qg95VhsxQNE3gjlvHZHv1dHoG8g4CYh6+iodt4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c6TAGOg6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WNRMkPsG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21E1606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A21E1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c6TAGOg6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WNRMkPsG
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKtnn3329279
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6GW16cYLEXbLEKRxCLcZ/hm1
	ouVgqsdPZ8UneMsZf6M=; b=c6TAGOg6zi0O5kcLuEuN/zocBSDmqajGdyt5ZKdp
	JFQcnRh4jGqIi+JgJm8LtbWG776NhXnFYt8IBDEHEWhlq8tGnCAvG7N4gjx/fs0g
	RwHLHAQ0AzKISsPBHeN+T7sgGPzfp8mpNfUmyAahFVHjGEuOHoNy3R93Ypgji/1x
	n4pNZrIEt+skItajBuFA0fLd6AE16jE4U/KuS3s5WAa8MHKNEOwVSL6qotCUiUp3
	3+dwTPk3RXdaFMfmjEmBqkTy8QrljLtE7P+E4n+wCKsGj1qZTeLYJd9iiTnTunK+
	jzcavvfDiGJ0pRTcooPH0jqLoiD8wvpfK4VnnCpM48Fu8A==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd1jqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:30:43 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-990c957f129so327258241.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795440642; x=1796045442; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6GW16cYLEXbLEKRxCLcZ/hm1ouVgqsdPZ8UneMsZf6M=;
        b=WNRMkPsGPAPsu0MCrSWE4kufM7sAEAJO4cUQe9sWbeUhnOjVvzgJqLV1Txg/bK+HUg
         bZUfvghePdvGxvlqeJl1NrTAKc88UlqyCerox5mGDcehfOFj0fJXfJhfrjuh1Bc+Hgbc
         fKqme3bDAzRlxXZvbnOaoLNAjygiNYbyTx4oZaDAQgqZCAt4nAp5Ar6Nj4JUQavoP8mZ
         A+MY3GbW6A9NOHZJIQyNrn/nD5uGWFTToYlaoB31kM4lRJlf5FsLn3jK2E8gm2x/gMol
         f8xrQdZWsqi9Pb+imy5+FdhaPrGnswcWlApc/hsQQL+/QkwxhKd3jNPSLjsknGJQzjUD
         Y4zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795440642; x=1796045442;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6GW16cYLEXbLEKRxCLcZ/hm1ouVgqsdPZ8UneMsZf6M=;
        b=JbUcGFNY/O0gyVYcquXAeFoRIzGSELsCMjz2qB6pcWVPfe5Om2LhP5I0NChGC65kZF
         5GhGm0dma0ox7DxP0m2B/+CYibWUyykU9Pq8iuC2D/g/QSEyjg/18YXTS9JKVclZ5ji8
         ETObmKd4N4Ci4607/rlTy/YrdEX8m2urBPIdqi0bfUKrVM0XXKbpcq5sU94OuIQ7zgvV
         H/GuvJiZpch730z5paxGX63CVGK9plvmO0KT4VVjqBo/TrjlkV1MJTAfS1zl3TFe7Vr7
         U9dHO9XxSSaWCZvTtEKO008ySKtvj9jxuFVCLR/S80BQ1zEDBDbtngrVv5DQNmVv5KHG
         f5TQ==
X-Forwarded-Encrypted: i=1; AL+hErFqljG7qvz71zm3xwH5AMRwL8B2V05pWAHNkMMamSH2F5Pc2Wh/K2sSZK+/qb1bfuC2OEFGLGjOtprDRYU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8o1qN5i8dfXDqSyiQR9IVbr/SQqqib3UQQ4CNQi9jgzorovsQ
	tnbm2sIR8v5knoGmjQj5RWhADlNhKru7N1+ywB/yTawjM42j9U1yG70jPHaIICDJQyBykVun+/G
	g7/7ImDqLuq9RJ6aYrDIUrkVmvHBIsOQYTd7ONBqQSOElyPZb1eC3qhNfb+h6G+F2qPI=
X-Gm-Gg: AZFdTZeK1OgmKPCeWyLrKBM5f0t/15HAtZXCJmmPJntw/5yWvSvAVt7BkoJ3DXcScRh
	gEIOFPKgl8xqVJEmW4uJGai2qAHe95gRCXiIzPwwV9c0NYTng5uR7NpMvNcipH43lj/e9n0smzM
	ktcJt+Olx9D5y/nip8xnsThc3N7MkG6V6ByhK7fanrQJRwDFFyaPw0UcD1exawsPJNHmd85JHfA
	4xWq10SCdP03D9NphLNgzRrDWdTan14vD1S92ha5DEEW09hSRWRWE7S8kT10bQnilD5alUeZcR+
	vWm+5LJtqGWyxSlICgll7gvJPtXLWv+leYS1fxNlhpCiWH92VCnSmupVE5eEecgb11SfXKFuZZT
	WaeHcWN493Tv+M5hZZo0JxuUJKkEm7vYr1K0g2WdfhMwGGfKhrkSjazMF2lRH7AdxMp3qJAG3wm
	CDC+wviU8PZPh6YOI=
X-Received: by 2002:a05:6102:580a:b0:7ce:a840:e736 with SMTP id ada2fe7eead31-7d739626308mr3388909137.13.1795440641807;
        Mon, 23 Nov 2026 05:30:41 -0800 (PST)
X-Received: by 2002:a05:6102:580a:b0:7ce:a840:e736 with SMTP id ada2fe7eead31-7d739626308mr3388860137.13.1795440640566;
        Mon, 23 Nov 2026 05:30:40 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e7fa0467sm11903416137.6.2026.11.23.05.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:30:40 -0800 (PST)
Date: Mon, 23 Nov 2026 21:30:31 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 1/2] soc: qcom: socinfo: Copy new SoC IDs from bindings
Message-ID: <awQ_90R8_uGWm2Sz@QCOM-aGQu4IUr3Y>
References: <20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com>
 <20261122-qcom-socinfo-id-dt-bindings-v1-1-eeee0ffa25da@oss.qualcomm.com>
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
In-Reply-To: <20261122-qcom-socinfo-id-dt-bindings-v1-1-eeee0ffa25da@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ES24qV9Ak7hDpDoscvEGs8_7V1fgWXqp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1MyBTYWx0ZWRfX4t4tOn5+7N8o
 GMVnM/EqxQYa1aMzn28qa8/hMbAvYm43OqK+iq+/h04fEwgKG7DsHwLdk8UFolLqJuFP5kBJS7Y
 C8AxjtonZTl4+3+sjK/dnN31mprkWE/oi7efW4yyW859cpmowDCRGVeiKkheVK7UGx4dSRqDy/A
 CPhILmKD1ZCDcCEVBJN4N0sVNw2gv7x/XBIVp619fLBxvQt3YH/rmFsmqT5bOsSAwMBavlsfzh1
 mRidOG3BNmC+C/JhqaaVKgBK4tagnjYthxymoxciCJj/mLsZostoPse+04tdnGAHNvHRD6pdU9H
 aq/vrykrsNfbu3lOfsmB7mrZVcExeR/fYdX9szDNxOa7tBRsdojdC6fqiswBVv8J3KDrhF07V5P
 yHuNBoOyxEBH4yiw3l/qgREMqsqIh90HvdJIukWvFrhu290aVugqdC8Ga2UZ2qFhfgeFEsI7cBz
 aaByaf1MWCNt+ewfyPg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1MyBTYWx0ZWRfX2QQrtJv4mCCl
 wouBCAXtyIf/3sSSijxMkcO1+j8ZchqjB/7ggW3HhpnMm4+CtHJFe2bzkFpyLVZYiG/38ESfB1N
 hG3hgFXSpXOwb21cxMBRVhefP4UokxM=
X-Proofpoint-GUID: ES24qV9Ak7hDpDoscvEGs8_7V1fgWXqp
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b044003 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=votV42V3uHCFBabA7mkA:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230053

On Sun, Nov 22, 2026 at 06:46:20PM +0100, Krzysztof Kozlowski wrote:
> The IDs of newer Qualcomm SoCs, as reported by hardware or firmware, are
> currently used only in the socinfo.c driver.  There should no and there

s/should no/should be no/

> is no in-tree DTS user of these, so none of these constants are really
> proper Devicetree ABI.  IDs of older SoCs were being used in DTS, thus
> that part matches the concept behind DT bindings.

Not quite true for the start of the range. The constants themselves
are not referenced, but the values are used as raw numbers in
qcom,msm-id:

  qrb5165-rb5.dts:                    qcom,msm-id = <455 0x20001>;
  sm7225-fairphone-fp4.dts:           qcom,msm-id = <459 0x10000>;
  sm6350-sony-xperia-lena-pdx213.dts: qcom,msm-id = <434 0x10000>, <459 0x10000>;

So QRB5165 and SM7225 are still consumed by bootloaders through DTS,
which is the same category as the older IDs you keep.

> Copy arbitrarily chosen newer SoC IDs from DT bindings to the regular
> header of socinfo driver and use it when needed, so later they could be
> removed from the bindings.

I would suggest converting the boards above to QCOM_ID_QRB5165 and
QCOM_ID_SM7225, and keeping those two IDs in the bindings. Then
the in-tree DTS users become visible, and the cut is no longer arbitrary:
everything left in qcom,ids.h is an ID actually used by DTS.

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/apss-ipq6018.c      |  2 +-
>  drivers/cpufreq/qcom-cpufreq-nvmem.c |  1 +
>  include/linux/soc/qcom/socinfo.h     | 94 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 96 insertions(+), 1 deletion(-)

[...]

> diff --git a/include/linux/soc/qcom/socinfo.h b/include/linux/soc/qcom/socinfo.h
> index ba823a0013c5..cd2e8eddf3b5 100644
> --- a/include/linux/soc/qcom/socinfo.h
> +++ b/include/linux/soc/qcom/socinfo.h
> @@ -112,4 +112,98 @@ enum qcom_socinfo_feature_code {
>  #define SOCINFO_PCn(n)			((n) + 1)
>  #define SOCINFO_PC_RESERVE		(BIT(31) - 1)
>  
> +/* SoC IDs */
> +#define QCOM_ID_QRB5165			455
> +#define QCOM_ID_SM8450			457
> +#define QCOM_ID_SM7225			459
> +#define QCOM_ID_SA8295P			460
> +#define QCOM_ID_SA8540P			461
> +#define QCOM_ID_QCM4290			469
> +#define QCOM_ID_QCS4290			470
> +#define QCOM_ID_SM7325			475

[...]

> +#define QCOM_ID_IPQ5404			671
> +#define QCOM_ID_QCS9100			667

Since the list is being moved anyway, this might be a good moment to
fix the ordering.

Also, drivers/clk/qcom/apss-ipq5424.c includes qcom,ids.h without using
any QCOM_ID_* constant, so the include could be dropped while at it.

Shawn
