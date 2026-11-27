Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789995;
	b=pbEUftdYgQNhUuZWr1BIZmCd4UHR+MonD+o6TP9VO7yytrc30oURbH3PIADETZcCS6dv
	 +zhWdU2S38ZeCl9QBFg7ZSd1spje6nnhTeqQyFgGFYy2y762r2a2Pc9QRSJeYaWas1TcS
	 mfWOjsHGfpE6ej7rqifiHdvz89RUqHGV2RjsshgrvmvqX55w8mvMSft21wQ/kBpftAWmG
	 b1AsO16Y+PAgJh5hbkgmK6qZi34YYXxHzcsGVC+y2/pg9kisUtos5Wx7I1DwTYUtgC+Up
	 oQQ3jgQQ1cuISebmMPj6fwjFkBszZuSzTOMPAqfp1ScozxOkfVu/qYwrqysXGe53P4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789995;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iWP69hNRNmZLA6SelaeZpNejkx3pRxxJb7FKwEEnVIE=;
	b=tRIONzfnZabUC/jn5dj2+s4/ekT1XYmm2n6N3rxzYdoxzJ6uhwPshOwmuCcdV47jdxpW
	 2C/1dX3EG8g53n46kwNONejdOCvZZEfNWO4pqFf82qrKeXCpI7ma9iyY3nrxPRbWcywVm
	 NJjwfLIcDtl2Oo6+p882dpGENi1W3fmn3Lu4DCBopNh/sR5xh/iH5Xkc1qPbQJDDKYNj2
	 oIV/fmZVPk3LbziZCMFfLWQagkvzSKo4mPmSjU9T8+D3ujlqvzJK7tRlW7rN3kr/pDZub
	 vIvD3XvU6Gf2a3MIN39RJkSk8NXJuyuc4I+n+5G65VeByIZMrDQn0riPjnqDflYoCeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HMNucjW+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=guoj5dBg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625C8606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 625C8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HMNucjW+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=guoj5dBg
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1JZj2683930
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:33:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iWP69hNRNmZLA6SelaeZpNejkx3pRxxJb7FKwEEnVIE=; b=HMNucjW+xDb1S/AB
	Y9ZczFPd/ZYrE3A2AJ/8Fu/KLc9r8wkpQ1maqb/nTeWTQiKpURMtVpjzAmorngu6
	1Gss6J+nqHdibemuvtvF7+5yVSYZoz1stcwgOksirfcySiNYRSKBfk4YdrhcaUqK
	+e7BAN6YQJWNwj3xOsAWgTmFh0hIk4MUr9EgGsIueX8bVMxB8pIUTr3AIsABPdQU
	zlFaj0b/earxKA9LL5j1Av/ZZetrhd2da4RxjAKFbbECl8+1UJQt6psQZfwiFxF6
	VbBySedEHFpslbxpY1ZwC4SYyw3c6dkVRYA17OKHF35JFZQjzL7g/HOvXUPfO0fI
	fzEMLw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73uhj24s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:33:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94964828890so85058885a.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795789992; x=1796394792; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iWP69hNRNmZLA6SelaeZpNejkx3pRxxJb7FKwEEnVIE=;
        b=guoj5dBgrHSsIJp+Jmu2CpwoKGM19tObEGPQNiXAjRHv9AcBilHEdSi2H3vnVyP2cm
         U4hFV1QmBrQOgPe7XmAY25FybKyWvai+1g3olEqaF/vD320CgcvBXDvHPeLZllJsx4G3
         Ih7buufim0uFZ/ENj/wwVr6Ydg2/icNt0FUy2WRpBVZmh1NGoRF8858bHg0AIRzyGXVA
         +cKU1R9tzhe7EFmzhcMJEukQNurm3fq2G3UoBlKlALDKpN7atJsRs0OAsHLqFibKQ0/n
         cFFiXp39OYXcXuKiarANk2J618+WHMK4k40P2ctihrjXGmpZWJuo3+XwcD4VugVKWNAw
         70gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789992; x=1796394792;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iWP69hNRNmZLA6SelaeZpNejkx3pRxxJb7FKwEEnVIE=;
        b=1FAdJhzK1mJeD/i+YbXotKUrnbVRj8DzseST3hJngnxNNJbgDMHqOSDYcqdltgCO7C
         Yy5PAM+p7ciO5mrU2SLR95sn1eYWMohxBljEBsxMXVRQkioUTjdG4zyS45GRoIUZKSG8
         4RQyBel2TA11ut9Obn+HmASef/5XCZL2cPIrMAg4flRkL+5nw6Jcecn7klm9EFr5X270
         qeyURt+QlwcjumFgxESKECE2ORR/Q2C3Pu+wARlsq0TV/qOIcFclnfoDHQYZ0/olzaX1
         wesLFJzWR53OC+GrOZED3ZfZZ3/baICa1t+zFaudKWi+fJ1HvYWBGrcDVTQBd3K97rx8
         p8ZQ==
X-Forwarded-Encrypted: i=1; AL+hErEapfoFhKsIwcOcKI0d2F0i95Jl23pN388JR7PogepeacT6tQlU9YfOhEo0QFMNtZx9wX4McahQVnoncOo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vebF+4YfmkZHhiJjR3GMhs8Ge7SGTwuCL6h/eixazRd+AmuQf
	DAwGeTkCaYnwzBjd2Qt653SBBCJ3RKtf13Y1gB3uPw2oByfWK2FioHcHcXY+uX08NjjtdiXfvlT
	3B8+nWTBysLzmnkOzwlL1bTjrjamE2dyIEsrW/V0tBnr1j51KMf9Bxgp1Xj225YRTMWM=
X-Gm-Gg: AZFdTZdigPdzWVGj8LNUVlUSKAS6s41YnJ5vI89Lr/ZN79/gg0xLjD14DuRy/9W9fH0
	em8ote+QhNZuo5FvbU+H0ngvDOApVIJ5rtmCiQaUILdkUBy8GcyJcn8rhZ4scH5hH54sezu1CiO
	FJBlqD2dzLlI/0vBkqcOuxsqm60G603m0BhscpYrJ/MKe0CrVs2crzIji8IU9ENL8ZfEZSruzvz
	4kuVO9EKs/7R2jSAwG8NnxBarvq9Upclrk4O3Q4b/jX9sq/SL0X3gQyVWMVk0UGu6gqT0cehc8G
	G4KAMmONPwbBsmVnmdSe4LlDTOE+ov5DtNejuygpDDqeny5FSG5Ht2Qsn8wUIxNJGIVWGAianTa
	GhME7Qb8SXfxP1iLoh3NrERDAr1d0xyehturCcOUMenbtCtHa6mPrfXvNCzcufQzi8CqjKII=
X-Received: by 2002:a05:620a:6e93:10b0:949:7fd2:6758 with SMTP id af79cd13be357-949ba68c353mr4128044185a.0.1795789992450;
        Fri, 27 Nov 2026 06:33:12 -0800 (PST)
X-Received: by 2002:a05:620a:6e93:10b0:949:7fd2:6758 with SMTP id af79cd13be357-949ba68c353mr4128039685a.0.1795789991996;
        Fri, 27 Nov 2026 06:33:11 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae88143sm859572666b.32.2026.11.27.06.33.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 06:33:11 -0800 (PST)
Message-ID: <1ef797ee-131f-417a-b473-52e4dd965470@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:33:07 +0100
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
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8350: Add the inline crypto
 engine
To: me@fromdisposition.org, Abel Vesa <abelvesa@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261109-b4-sm8350-ice-v2-0-fd5e84985e90@fromdisposition.org>
 <20261109-b4-sm8350-ice-v2-2-fd5e84985e90@fromdisposition.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261109-b4-sm8350-ice-v2-2-fd5e84985e90@fromdisposition.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX+b/1lgOQZsXx
 4i1Em3Vyh59dZ8cY+b3eyvjVscxE26bFH0LsJ1L37oydkh5NdrSpGYByTHIidHIp9y2sgbuvBhj
 qWIprPGbsg96GGFcWNi8fKpqhvlTKys=
X-Proofpoint-ORIG-GUID: gjJFss8Ao7DEk8PHlvAON-BKeaPP73i9
X-Proofpoint-GUID: gjJFss8Ao7DEk8PHlvAON-BKeaPP73i9
X-Authority-Analysis: v=2.4 cv=BbBNQbt2 c=1 sm=1 tr=0 ts=6b0994a9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Tt5JBQAfAAAA:8 a=R_l6ZAkWQ6Pq_YTnY14A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=kpHMOrJS8sLNr5ru0mYA:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX/ByX2sLNWO8v
 3JPVd/QTNsp91TV0taeVJKmPcuT/ZkzsDCnKE/GivU+8sO6QheOSz41W2iNU/dKIHZMLWnbcnX4
 QbwKkkhGxP2EefS38gbrbc2On/ztqH+9ssmnSwTgNyg69MKyEQ2ac6moRG88YxkHeyPxroqfhKq
 aRfNU6Mpjoy8dz163mega+gPRG2ITw/wkh52tD27OxG4aHPI0eMyvNEr2NNVZZhVUPPTMCnOXLP
 P0RmNPrOrBWNWlT85/PIqdC9z71KZ3yhWavRkEKQngv88584C4MP85FgEjQMjXjp2GZBETMI2pn
 j79eVH0X5W8iOa2KmoZNgorRr+TIQXm/+CnUtTOsc61iLg+aQXdRE+0OaxK4h1luvN40C7toM6A
 52STTjHgdfZx83fEqG8mmPwwzo7OEnZdueUVCMhLPNRWCgTZlHTE1hCuyc36EGwfuZETP2fqsKL
 FANj2xOfrBklwilzu8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270057

On 11/9/26 2:55 PM, Demeter Barna via B4 Relay wrote:
> From: Demeter Barna <me@fromdisposition.org>
> 
> Describe the UFS inline crypto engine at 0x1d88000 and hand it to the
> UFS host controller with qcom,ice. The region covers the engine and its
> hardware key manager (0x8000 + 0x9000), as in Qualcomm's SM8350 device
> tree; it is clocked by the UFS ICE core and AHB clocks and powered by
> the UFS PHY GDSC, as on SM8450. Without it the UFS driver logs
> "Disabling inline encryption support" and fscrypt has no hardware path.
> 
> Signed-off-by: Demeter Barna <me@fromdisposition.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8350.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> index 55b32050c..2b258c4b4 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -1782,6 +1782,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>  				<0 0>,
>  				<0 0>,
>  				<0 0>;
> +			qcom,ice = <&ice>;
> +
>  			status = "disabled";
>  		};
>  
> @@ -1807,6 +1809,17 @@ ufs_mem_phy: phy@1d87000 {
>  			status = "disabled";
>  		};
>  
> +		ice: crypto@1d88000 {
> +			compatible = "qcom,sm8350-inline-crypto-engine",
> +				     "qcom,inline-crypto-engine";
> +			reg = <0 0x01d88000 0 0x11000>;

sz=0x18_000, please

Konrad
