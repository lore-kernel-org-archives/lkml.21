Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601472;
	b=SUeVRpFxLYlDIzMT9pAGCF4xkm4k4sRLBWVkjPt27eai+3hXkR2mRwXfRAwHMxkdPfk2
	 RGU13CDsBZEYoyWeJU28rscki5MNb7bXDoXNXkvXbD6cYBS5/LuZubtnPRIM3iCApXaY3
	 JMzBZdeeMm97Y8bik86EtF5fIAEXY27NsE+B5H46e1j5dGcljczHvKBBF85VBgCS0RjKb
	 dFtALKme1Y7PX6C41/vUif0xajFmFuJjot+6H55rmFQWNBZOo+GXa2BO7TBUmRZVHIqDY
	 +glJ1Z7hplmleb0Uquf7Ke6lPk2FC+BqiFShr4mK73Km6vYdrK3ATfyX8i6yct78VFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601472;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JgcgT2ipWJ2y4mvlC42PtcSP9A6DEckQPx5rrYOfk0g=;
	b=RxQDhvxPK3lV3fknbfODJaH4fTrwm4S7VuOBE5qpj7D0tCsF+4lxEyU41M0ZhT4eoHEC
	 Ag9qQHFODuzTC2zg5E9RpTeFwWr68M5doSfp8TnKz9QdPMcxDVUYPmQUeESzgLsnaU71o
	 d/ag8r/K5/HuKK+/Tcj4e2pahB78V+LtjJoqxs2zHvnwprv4cVr7wiRbZBKVVNlAhU2Zf
	 DzhiuPwKxQuHOq9J4z+pWMjJKW9lXZA0OMRzUJjVV4VpDgYtLpmKnjghwCtQsu5RcNgrG
	 RJU9qRFgsPKDYcfBTDbcFBJpq3N8eAanZ0TmN581hQ8FYWy2JNf0GPODpBY0oglZQUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XMjLozre;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RVRYn5rk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C2C606A329
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:11:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97C2C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XMjLozre;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RVRYn5rk
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mPBT2121252
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:11:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JgcgT2ipWJ2y4mvlC42PtcSP9A6DEckQPx5rrYOfk0g=; b=XMjLozreDz8YnShd
	T2K7aVz/9tDfu+Hv4BLU1M6xdfCWHACfDZgpOydPe0kHfW3eayn9Wx/rVDKUiLv2
	B6cHEXQdIsZZ5y6ef/H2sJZ7ms5HNd3b87IqvslZYkxuw/Ybj+LxOu9iIVsocRft
	NdKnZ13Qzu8XeKw4kfoDyRlvfi4fbs9fS8U0RYLHXYp06UJlnP1R3Yuiq6ZPXdO8
	9uyb7Jbo36oxNWynGdfTi9GnHHKnHiL/01TvMW41N30jndCapiaxrtc0wZLKl3zQ
	aTKWKcb6lZzXRzOp+KoAb/5aVBhdBClQruV0Uea2wa2xIqI3w5qdBoxun7QKkTlB
	GVY85g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vukr9rq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:11:10 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ada6ccd402so4649536a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795601469; x=1796206269; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JgcgT2ipWJ2y4mvlC42PtcSP9A6DEckQPx5rrYOfk0g=;
        b=RVRYn5rkf+0VVEq8gtKYFJFguuSfkaLBWwsb1Mei2ph88+EQ0wK1pDtCimXelCBIqJ
         ANmBYUTrl+XG8UpY2psdoaXTE4mz1N1/pLGUdb98Wx425SwJPM4jftmbBN1dPVdoWk1P
         h9WCmW/iJetKmgrOM4QFhhU38f3iJHkfoUtiHatx77k/idmaHLWfvgJNyY573advkBLY
         fZJoT11zgsPNRHbJlPUMI3Wa0kd5sJs3XvIk9W1p/z16SEiwkq+Ix7+39FPR5BS3aDo7
         r6HW5KvHs/Ju3hWQ0zxc2bUkD9gDDRk4U9X6mieVPd2LDL1VBlcCm5yrOQyNCuSfoxJo
         +sbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601469; x=1796206269;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JgcgT2ipWJ2y4mvlC42PtcSP9A6DEckQPx5rrYOfk0g=;
        b=y+nNp1ESFFk6c/QC35EBrfXXimm12OZVS75bBeWXqzdeDxby7XxH1RH+RYtycm+e3k
         SzFXfI+dZ08zXbytHokZOGvyqmoYvuekilUq+K2JpwNmHAx1vxMV8LieDFANXYdPGcAD
         75H/6dwSxOWUo6Vy+yH1Haupzq/zWopuZ38godS/PQhUqVNBJph9tg878T1bqryI16qy
         ABf53ud3ujhRO17QBb5OeMrvR3etlqoAGsqrRVEeoANRaU96DmEcYalVBgaoWnRARzI4
         ZMRRWiZuEvCB0SnRpybIHPLE0ENO2CDEEl6vYo5t3HyAKR09s/RsD0vv2qfUU1CzN7xb
         qlLA==
X-Forwarded-Encrypted: i=1; AL+hErG6a0EOtAbUTe5jKedIUKScL1eMl3iXVUBM1Tz96nCB1Pskh7nCZItBGewKhsXU2KswrCDIb39wbR1fD3g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mkGTe9QSQkavRe5cFZGLaS3dCk3p1bhvK1e+yurv6nj5MlRlC
	NtKIlCoBr7f5lUJTrElA0XNoJpZ8bFcXxVQFA5iZrpe9xI9LkMfyP5ThrheUOLE6DYyXnwoY+69
	lqbrXIZzl5t0EHQ0WnYJiBHYMpbMvvbpmnVWPA29pTlyHppiJe5aAyGIEaNFvUD+J6cc=
X-Gm-Gg: AZFdTZeP2bVr06V1j9igZjpmXegvEq4QbHQi9PFahQt2jEfDT187sRe+ZkngHqxsg3P
	rDVLMQDRYnDw5/Q7thm6AaUJZcC3sBuTRr+2evGB96kWsx4sQFFvVpnH2bqUt5m/B7TsLGkztDU
	cXXnK6zYYFSdLN/XwmQatGrvqIdKKjgK1KYsAURH5uoL8RoUZPNipKMNU/2zgI7YqEDM65CypS+
	+5kMoGocnW2Eo0qlN2H5PowHSshvxJv4wI7ZKOy3MG8QXPpSCgs8YQ+h0ggLeyRqAmBqd83qCcf
	s7ha50HaBrGAMa7FXbqwJmCqJLnO4zVISAnQvn8zv3y95m21WLBt3Hny4yx5CYE3BBA+BP3jamX
	9ozSYWCIfSq7W8mxK4yY9Z9BldEw0gJD5bAckRE3k2z6m9S5Q3BZTHzPpp8QQSYBe+3V86u39Te
	hw2b5DYRvXlrWSHpaXe2zR4JX28IZgiCUoF4Dyhg==
X-Received: by 2002:a17:90b:1802:b0:3ac:a139:1b13 with SMTP id 98e67ed59e1d1-3b41c93ccf9mr16179599a91.29.1795601469366;
        Wed, 25 Nov 2026 02:11:09 -0800 (PST)
X-Received: by 2002:a17:90b:1802:b0:3ac:a139:1b13 with SMTP id 98e67ed59e1d1-3b41c93ccf9mr16179571a91.29.1795601468716;
        Wed, 25 Nov 2026 02:11:08 -0800 (PST)
Received: from [10.133.33.142] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4dfbe54a2sm5931651a91.17.2026.11.25.02.11.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:11:08 -0800 (PST)
Message-ID: <f2cc0d77-3a5d-4d82-a697-456488bee6cf@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 18:11:03 +0800
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
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20261116-disable_riscv_cti_for_shikra-v1-1-d7cc81f901e0@oss.qualcomm.com>
 <30485a94-cc85-4c64-8593-a2218a3aa59d@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <30485a94-cc85-4c64-8593-a2218a3aa59d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KfVHIgYD c=1 sm=1 tr=0 ts=6b06b43e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=C-wyTywGbBTeqauinx8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: CszrNFA-1_af8Q0h7KMbqHTRbaArXdbJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX/WrWB1lhav6d
 0U3JyO0rOE6fnqNX487kB08UxZX3jlPYUBS7ip1umcArwUSAg55aeotrw++o/30YZLvp6mQN+KJ
 CH91EAsIV4duYRi7RLA9Zsoe9XRv68Y=
X-Proofpoint-GUID: CszrNFA-1_af8Q0h7KMbqHTRbaArXdbJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX22PIOEu/ZKwm
 OxTNnZ9EKuaPZqkktIvQWxbuxzX9YeHVkmuuHT/zRiZEyrNBaJvwJipZMB4EedezkSKvT35eufU
 +nA2DcgBjrRZi00u0+YWf2UytVQ8R5Q+TcKsl4UPeawh6UzDElu31I0RSLGgC83fJLMAF78I7/t
 FxzBZwO1FPLACK0kdhe+PBTtRUDks5Fs7+UMqRVyYyQjPFao2ZrvV0/sO6KTPYyqWZwfY99ssMK
 zZA4HhK6T2tImr4Otf7WhjDhOdPfOdttsuVPZ5EyWHL1flN/o+3pJ2ipGlFa5Rvna7WxXfW3tZ8
 6VJUrvAERC5dQh1NGdJqIncnUPKV4BQ3gszgWey5itBXZdFfo8PL+l7/Du1WRuhKDbYcMjWxaOt
 30cVL7DiHUU+rUWzuPPsgylO6/mhWb09OujLZNXwdCauQ+wg3nApj1YGDWyICZ7l7+aOt8EgbQu
 SW4KIXTRTbsIi6nCHtg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250040



On 11/25/2026 5:53 PM, Konrad Dybcio wrote:
> On 11/16/26 12:03 PM, Jie Gan wrote:
>> The cti_riscv device is suspected to have a clock vote issue on the
>> KVM enabled path, which causes the device to crash during bootup. Mark
>> the node with status = "fail" for now to avoid the crash.
>>
>> Fixes: eed738c6dd0c ("arm64: dts: qcom: shikra: Add coresight nodes")
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
> 
> That would mean Gunyah is enabling some clock that the TZ itself isn't,
> which would be solveable through a clock driver patch. Do we have more
> details here?
>

We are currently debugging this issue. What we have found so far is that 
the RISC-V core is not powered on when the AMBA bus attempts to read the 
PID from the device registers, which causes the system to crash.

Normally, the RISC-V core is powered on by remoteproc much later in the 
boot sequence. However, we have not observed this issue with either the 
UEFI or ABL boot stack.

One possibility is that the RISC-V core is powered on during UEFI or ABL 
and remains powered on when control is handed over to the kernel.

Thanks,
Jie

> Konrad
> 
>>   arch/arm64/boot/dts/qcom/shikra.dtsi | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> index 0a95ad5a5582..5f5a786fbd2c 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> @@ -3996,6 +3996,7 @@ cti@982b000 {
>>   			clocks = <&rpmcc RPM_SMD_QDSS_CLK>;
>>   			clock-names = "apb_pclk";
>>   			label = "cti_riscv";
>> +			status = "fail";
>>   		};
>>   
>>   		tpdm@9860000 {
>>
>> ---
>> base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
>> change-id: 20261116-disable_riscv_cti_for_shikra-574ac8895dea
>>
>> Best regards,

