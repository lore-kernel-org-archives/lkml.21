Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795600399;
	b=a5tHSdGLQxZJvPx/WylXtJgHH9C4n1E4nLHq2Z8MuFK/uF9vUXn665l3lPOqISaV57fr
	 cd6I3b0sssnVCBm0dx0ihnZ0Tg4ic18nBMY8w7dvu1++hRuFWXQbrnnNOWO8IOVhNYCpx
	 Z7TyHG0sc8nNoA6NnJ72AnbCtHVxTuJ5L6HRRnmZJAJiwDXAt00M6EpovnOFxqHablor4
	 0T1NkZy12D8VwaeXz3u3i+2rMmxjYJV0MjVZ+U7RhRiOO73dcxE6OBiaa5T4D5Yilv7pw
	 WRt+QJBsdDp6PK5t99hnfwWxZPpj83steV9k8lZB0daoO0cqx69AHvA45b0r/6SdMuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600399;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=B9V0PzERPQ/DZr9vQmTdOy6qbAlEsvFj55AbXqdY/4M=;
	b=q+W2dGeUYFAskSZMa4/1epp5dk/Ci9Kbva001CzB3e1+A+APSSsTbr5ykupbm94cGEzs
	 uYxXTOQMyrRtszHa57XvQJsuTi+IpYhM3n15Uco57SsuTW5Lmod5m6qwb1t2rZZ1b4q85
	 gh2r88Z85R/gGvMOC2GhQSx1NHW2MwCkOfvKYFD9S7LPbo2eHlrYQ7KBvJo9jTxN2QMca
	 aQAx1C5GnkMcdLbkDMlgHZ2eOCy3UpioKPXlJ7ZMEyxS90oIaJawkBnzqQyR0mBEuj4Ev
	 eU1+3ervlU4ES9tdYKOYmsdhmqPqsAFcKmm/24mr7yEexNw95xdbInFTH2ZgygIBysA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c90SPQ0D;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R7EbDZjP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E345606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:53:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E345606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c90SPQ0D;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R7EbDZjP
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mGSL3126484
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:53:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B9V0PzERPQ/DZr9vQmTdOy6qbAlEsvFj55AbXqdY/4M=; b=c90SPQ0DmhnIfA3r
	fBrKNi5CwIVs9Q8Y8e8HNHuZfGGLUTD2ALfns6N3iIW/vOOtX7VuYnZj5H11z8CC
	zw6ViY0s1Px6n7wqZlubqL/Wa2dOIJhkuhnIyl7ZLROz+HFrWuJfYuH2oekxqtRj
	5ioWP54l+lu+gYEHXfKxwZy0SeDJnMPLAZa0I3GbdpXiseygAHC5tej/p5sLK6/E
	fS4s0bp7PoCZgum5wnkiAzhWNFtktcXCHYSYQrhgsQ3lz00vazOJPXSEu0MbdTIz
	yYBAEo5sJswRwCP/AUxrb+tlJS/RMRLWRDCrJ8BplFv50zlyUIwZFaeFKDypjQb2
	+sT2Iw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5eydbhq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:53:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-949d87937d8so29083985a.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795600398; x=1796205198; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B9V0PzERPQ/DZr9vQmTdOy6qbAlEsvFj55AbXqdY/4M=;
        b=R7EbDZjPGaEBase9KgRYE0IHmnWVQOwuCZ/YImwh36sGP4vesRKRgQCV9jtegfXoXn
         tdWHE9TPqkQK79g8jh+Ci9nxN4Yf36BtVPT4YtpkZHuaRzyPWhDLEyV5o+B4UdUxTW6a
         5uP6Ji5oEepSlVy7aZipzvFEWl5wagXuBI//5PK9zCgpk6tPtSe9dVzWSeH+s+3g//fv
         9Pr4oU6uLkAeGW5F2IlXJbrCl3RVyEgsY6tadBwv7lx2GBOgbOUgbW6AWzFSsqsEgDzY
         T5Vr9bBtWlApPl5F70Ttjnso1NmgXXe+6Lu3QmSUte2EVWLn/Fg5XujPp6ILAQGbDBey
         6zZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795600398; x=1796205198;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B9V0PzERPQ/DZr9vQmTdOy6qbAlEsvFj55AbXqdY/4M=;
        b=1Q8sLT4Z35Gx5oztplrJ1kiwmt0moXkYfFUBDyFCug2Jq8Y1iQb/r7m4S0vMnmSGqm
         n+w2KT5N0osnxA6ViyuYU+gDy5VJ1eV6iW4LGDpHyUly666sx9L/jrzBN88EScFhiBFt
         HZ2PUMs1AMN0FmOeEwjtXVRraVobsDaMSNZPDSxo/+gbmINmPeoCb+dhZ1fsxNDwqpPm
         ULPDitE5OSiq5wrX2yxTsh1jJGrd5geRqHg5nMlYAEQ0k7Ystjwjtm/I66VAtw4Qu5mb
         cwgb0aeoV3Cc+VRrGqSHJvsD/Y3J9Mpp9fdksOjRIXAe7IrRfJqSlI/xnHcZnuRr6bXm
         QVmg==
X-Forwarded-Encrypted: i=1; AL+hErGYzus1BA5r/Xh+yokH0b83kPJqDsEkiWJr4jUr9QY5q7OkNzT+3ZkI5afCqMGAGtXrtQkiU1qWKT20huo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RsdK96vjSn0PCHbbawQsDhQ4iO5jaz0thb7dDmfSqQW61cQDa
	lKlJ4oQoy7a/6XmAqMpfqCzQAq/3xIb8SqOHa58VJsF7xUu+RT2HNNWJniuzM8ytCQ+8xx/CwyB
	A/Kl1eu1OKo/B27VWK+efHIjr7fRlNLM48PTFEWSWeJCagaOKj7cwj1Ic0ldEeVWyB6Y=
X-Gm-Gg: AZFdTZeu58Pk+GzBKTPl2DuLM48QtIq3Sv6E8nDJ8V8Mig/2UvVyuCDNUs9q3/rg5hI
	+XgQhZbkiw6zlb1zQKKKrTtWEh+r+k3DDOsLiHokmEHzku5HDzFbMgsJdsW1zWOoacapbzaD4us
	iF1fZ4aQS5NbsGai1jxAuWKMX4WOQ9Rm4EGcU9SfDlFEbEQAd/2eI+tSKYWbaip+2sVEnNGie8D
	aw3PzEEwDZ2C6NeRyEkmqH6uEpOP44qfaC4eSgbWFF4SR+/+nyaRHRyWIkPu3UzpaNOGX6+di6/
	IqjOuo9n0qCW1bNB1q5d8q0KK9wkGVy2kgF6IEapF/aI7TuuLR9pJ2tT94N8Tp8EiX5n8l/mRdw
	cm+GEXzZ9N4GQTFEy+XmAXS/uC4I/qQr3yFa4zPnIMU1UbWXZ4nSXQfEzLTWeOkd6jYOD+nY=
X-Received: by 2002:a05:620a:6f8a:20b0:945:ede4:d247 with SMTP id af79cd13be357-949ba82824dmr2847962985a.1.1795600397639;
        Wed, 25 Nov 2026 01:53:17 -0800 (PST)
X-Received: by 2002:a05:620a:6f8a:20b0:945:ede4:d247 with SMTP id af79cd13be357-949ba82824dmr2847960185a.1.1795600397077;
        Wed, 25 Nov 2026 01:53:17 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae68802sm622707866b.28.2026.11.25.01.53.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 01:53:16 -0800 (PST)
Message-ID: <30485a94-cc85-4c64-8593-a2218a3aa59d@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 10:53:13 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Mark cti_riscv device as failed
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20261116-disable_riscv_cti_for_shikra-v1-1-d7cc81f901e0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261116-disable_riscv_cti_for_shikra-v1-1-d7cc81f901e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfX2r5i2CEZCCox
 XswPjrWeYZFX87qlPmRJV8jYvM8J/Sfh5KwQrugPBEdamb9UuN27EWfADgLyCLbixwFgvCxd1L6
 RbLCkGKp2W7T6xp8z3PstBaTKxPeWkE=
X-Proofpoint-ORIG-GUID: xEnFsjm8rzf5bHPsYbZED1PphKo7Qc7e
X-Proofpoint-GUID: xEnFsjm8rzf5bHPsYbZED1PphKo7Qc7e
X-Authority-Analysis: v=2.4 cv=GIGdgeNK c=1 sm=1 tr=0 ts=6b06b00e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=K9kiO-SBJ6ozCPIvxsMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfX0PRp4eNkvi8T
 3OtU597d7j2gQAfQz2JkTM46w0MlKYbB0YfVlQsLkEPerhTFiUf1fZsP0WIsuQxj9WUqBNkJVKI
 DqaEcHCaDvea9ZIzi5CWS1dLjQkAp3AE7KFmThTPL1hfS6Wx77+yHI8bPqKF8Nv0QhXSjz4zn/V
 u4fH9VktjbV/4DhSXDXtYnN27plu/cnsZxY3iIPbypqo1OmdKtTVGRFd84QQxJcVCG3HXK9l/Wu
 NLonGUvOaxhQR6eb9em8tquDBzu4TSnAVAbsHFxsO/dsKbEf2L9+f3h+nDAFI1E2Yq3TVOJH/OT
 cQx6O7OJ9qLiNjNn7eX5sn64p0f/H2yDFwmjiayfxw9QUN20hycxTnn6ayLw2hOKdwqqP0dNwZV
 e6QVZ22E5Nnemt76AphSCq+zjYvtY4Di4pYZSVpPkSjt6p6fA2ux2PNMLcPLXoQ+staeIKSZkbi
 eVj8fgYOeniP627U3hQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250038

On 11/16/26 12:03 PM, Jie Gan wrote:
> The cti_riscv device is suspected to have a clock vote issue on the
> KVM enabled path, which causes the device to crash during bootup. Mark
> the node with status = "fail" for now to avoid the crash.
> 
> Fixes: eed738c6dd0c ("arm64: dts: qcom: shikra: Add coresight nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

That would mean Gunyah is enabling some clock that the TZ itself isn't,
which would be solveable through a clock driver patch. Do we have more
details here?

Konrad

>  arch/arm64/boot/dts/qcom/shikra.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index 0a95ad5a5582..5f5a786fbd2c 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -3996,6 +3996,7 @@ cti@982b000 {
>  			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
>  			clock-names = "apb_pclk";
>  			label = "cti_riscv";
> +			status = "fail";
>  		};
>  
>  		tpdm@9860000 {
> 
> ---
> base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
> change-id: 20261116-disable_riscv_cti_for_shikra-574ac8895dea
> 
> Best regards,
