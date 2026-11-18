Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794999965;
	b=m45MqR0nAsppmFysKrHM2hXv4kKKoPqq7sxT9phl3YyteMEY3GxrWix9AyilAvV8D9dn
	 95vB/3rU6ns2Rqjpv2zzXWXfVTwZ+wgRf6b21Zs4zOs+NltVJIXeDxlxq54PMszgUH/TO
	 aMvZQJnaQ7btULtJv/VqkFAsD8h5HzrtHOexDHO4yXDgkxCqiG5waaGjL+JVmQ0mDoIw3
	 yu33V4ANPBPcT73tWamKE/hKCT2MGLc/zaEp8kg1rPmiuVbV8KLGWK/IKzMF2g9lWFf+W
	 9YVm9tsYhgDYU+3BkMN4XOrXlCxxNJPgbk81yVucFkbR3NmVvwG3BW35Lu2Cs13tBvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999965;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=W6pd7EU4elLsb2y8Q71KyuCpGffI4PpHwT4j0EhTH1c=;
	b=QDPIT+E3D2bmcwlSrfvzFcCZFtWYPuQNishu8MSK3KPgZBhP0SblYBpc0XuJMCk+fRJn
	 WUA7V1VPwweB31ICrmOS+gvdtbqyU2Y2Ll+E/8IJlTCOduvPPcP7CWrqlbRKkXM987qgI
	 zZj6DSIWhSER/lNKQUoquRWgyO2Bqg1vd5uoISd2XgZXgEb9hTCf40Tlw8MrDQPyL9zDG
	 3pT7r+4HsrxGsvsdWo2owinaZJPZhCJz6Z7Jf9oP1BPwTCDPVnfpnbRNo1pPAzO1E1n79
	 q7LTK5nG1fnb1mukqMdtCm+cmm5clYYpqbVsNwBLVnz18iBDwxcPnzKSjpjNkAGREBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fzSS0hsU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d37F2i1H;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9C0606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:06:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD9C0606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fzSS0hsU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d37F2i1H
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI9lflu835353
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:06:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W6pd7EU4elLsb2y8Q71KyuCpGffI4PpHwT4j0EhTH1c=; b=fzSS0hsUC/3DwuAb
	iryzlyAcSdMaZ7NzmnCtdiEVP4IjjIanKOLfyiBq4s/Y8LRRqEFU0Gg/BbAc7/zB
	cdNEnPM1eMRw6gGkNHEVNosnDPqp16tznAfp5rNon3mXH6QsMpvoXqKVEXgelTZK
	TB/bdjNvFEPKbr0e9R1AXiLvPxis2kAPXwEVtMzLWBZoN3IfEhOdGu5b1VKVF9t8
	7MknCtyhgs/Q2w5BLhvsDXIa2cXXf6rppoNiOKZ2xX4TTRTvE4pFW6yhqGAWXF8G
	h4KAo1oKxy668MOpN25r4FFjWhOR8PRgV9xFBDN9gZVaSJEZKMYJUiFtARUDGHv1
	f5renQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvcjqhk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:06:03 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so522795a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794999962; x=1795604762; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W6pd7EU4elLsb2y8Q71KyuCpGffI4PpHwT4j0EhTH1c=;
        b=d37F2i1HHN4vWbrq78O4WNI6zcuP6S1Xb4+VhjxCCFalCGh9l7SOokKK7XG+Eu1CTB
         QX45CcEYS4tmo8HLXhBIRsyKfP2A+u755QM+ArHNizSR0qAD2UpHIxjs48TtOWMlQG9P
         PUu1bY1H2XD+CNUxqSoYHkOhCq/Qa/li1qgAj6jqfvoMbSXX4CrYihdFeNXy/u2OHFAC
         aj1oZp3264ENhok3d3LEd1/1dSY8DtjhwO6AkkMXl+9Wh2cEgHPRZ4622znA5sE4HIE7
         k1xYoLCCVsrIiQX4UpQrr7VbVu7ij2K0Hwzzi5OsX9rKX/p2i5miHT94tP5x9HeMKIm6
         HDFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794999962; x=1795604762;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W6pd7EU4elLsb2y8Q71KyuCpGffI4PpHwT4j0EhTH1c=;
        b=G12G+Rz1TG3gClFkcDj1ulu13BFgcrkI3yn080oytBVp6dUAmWyF2QwmF8wGdK1SXe
         x3FwhWLYJyQVRczbIUXJHoAsSGOOXfMSGTph14MU4COJh1CCVnAU/24te54lG4elc9u4
         dm05ma0wS5HmcCMIEgOr6iTyR2CFdSoWe/QlFoJtk4ZMpuRJ8ObAwkd35/qbPv+N+wML
         +3fOcSiOPb3lVQ7QM+4OwUr2PVLXYYr2ezSpCozHhvxjmBvq4EHzAnwpdxbFlAyvWExn
         JmIuj7TJKX7iLPRqTkQpZGSRxJk3x+wBvtQRkgGaj6wIMyL0IIRPTGiio283ehsDLGWj
         RLDQ==
X-Forwarded-Encrypted: i=1; AL+hErFwPIl4hsN71+IIZdSLAQgkxBrnL4AOc5deEc1qRYPxrgbUEH6lAXirQP4rf2Y6iUy6X65TJf9UB4059Wg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VWR3wLFz3oI7nIFz8v9oEZZ3sI91penqHJlZftLgc8RFzkg/4
	ZemCqWY6xoVeK5VK5TX5Nc9leih5P7Q6GnPQgLkI+aFu8z+j6FUizz1Fkob+Q/kak1xF9yrQMKC
	xJFTnXRc4UftdrQ2oGgSMoWvvWPNmk20hbe+rbtWPx9eJ00ALKWMlzbQ+vQGFyt7eTig=
X-Gm-Gg: AYBFou3xnpltgl42uMXj1UP4acI58kEQA034vapsFLHAZbpZxXUyd8nENIhd3DIZmdj
	XR1bDrTguy2vvMq/m3ViQv0j8qXIcl/CI54tUxCn+WypMDpXu81IWBcFhVgjOTBZj3Jrx4c3n1V
	o0wQcJznh7A+VIGn8rHuzaSPeYj3bMuGrYlmdipY2YxNsYhWTd9R3xSfYN4ZeNZHY9zh5vvssuX
	sjdJDl/dmlC+exdGjSix4Flzmb6f2m5td0t/thVUeuax7WlBcqK80ZNED2Mi+R4nqW6/z7vgetS
	RQEC4gW285Ji3bYP24u0VC/xhMjB5FAnuUQ/w/xT9LjsCcf36hPp9vgtT/WhEhSAsgFEY2WptQG
	Nuz7Ksp3YOqNDQ3WNg2TLc02IO5qIsy3p5h6RrpF5E5/LSxgkbM9KKqod5tXFO+LABZ4mUpwbNY
	i0HCgGKyA=
X-Received: by 2002:a05:6a20:7d9f:b0:3e2:ac91:6bae with SMTP id adf61e73a8af0-3fe98af0f80mr2337732637.85.1794999962238;
        Wed, 18 Nov 2026 03:06:02 -0800 (PST)
X-Received: by 2002:a05:6a20:7d9f:b0:3e2:ac91:6bae with SMTP id adf61e73a8af0-3fe98af0f80mr2337687637.85.1794999961753;
        Wed, 18 Nov 2026 03:06:01 -0800 (PST)
Received: from [10.218.31.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cac8ffe6sm1040544b3a.23.2026.11.18.03.05.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 03:06:01 -0800 (PST)
Message-ID: <6965d3c1-1823-469f-8777-17fc52e132df@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 16:35:55 +0530
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
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Mark RPM message RAM as
 no-memory-wc
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bibek.patro@oss.qualcomm.com
References: <20261117-rpm-memory-non-wc-v1-1-e246fc6bc66c@oss.qualcomm.com>
 <20261117161904.2hecbffviqjz2dub@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <20261117161904.2hecbffviqjz2dub@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afd869b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8YGeh5X12gIyrkFA4RQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: VtGFeMQF5OA2xdu5DHZCYBStHFUz-p6K
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA0NCBTYWx0ZWRfX5iG//qXzsjZi
 O37BB0GZaCDsjTV5V+ULQBwraUa22rBOqW4B4JtdyfwbBEhHk676yszzJCFSu5xg2AVUmeHZTsS
 AToEG+gXMZGLeGUGDUzvaLJpemXzn7M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA0NCBTYWx0ZWRfX2O/ANmtNpo44
 wZSsR7TrCIeR97XrxNZzFKp3TqkoB29xiYTsgJy03iINyQwziyKh9JRR8RecVe69iDy7wE/qecM
 x9paWgifYKddwjj68nV+YqKCu+MKInbcMRm2V7T5IDE9YJj3Z5K9MrxEvfiVq/f0oVMDh2KywBD
 JDyvhkfhTELOWgs8HYSliHWWkXdMYoRBfgNr0OymY4IWUcybHyzPaW+3uxtlda+y+CX9RsZvxNz
 x+DZPFYkyi4F7kdd667z0zZC8i+SiRwlQHMK+CIBNg7U+KMnfjFic6CeBNXmaj62xOAGxGHEcNY
 KDYXBD9DK96AULWD88W9W9M76d/uNRNQXyuGv8+87k/BX0WkIoEX348w43WPU87l/c55M9p+7cT
 e64RlRsJ6NTa+4lqZSYOF7Wif3mL+oJw0TjW9wvYAJQf4zl+qJvO+gqfXODHEtTTO1xpqxG2qv7
 nl97XtUeqJek+0CC94w==
X-Proofpoint-ORIG-GUID: VtGFeMQF5OA2xdu5DHZCYBStHFUz-p6K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180044


On 17-11-2026 09:49 pm, Mukesh Ojha wrote:
> On Tue, Nov 17, 2026 at 01:35:50PM +0530, Vishnu Santhosh wrote:
>> The RPM message RAM is shared with other subsystems, and parts of it
>> are not accessible to the APSS. It is expected to be mapped as Device
>> memory.
>>
>> The "mmio-sram" compatible makes the SRAM driver map the region as
>> write-combined (Normal Non-cacheable) memory instead, which allows
>> speculative reads into the protected parts and results in XPU
>> violations.
>>
>> Add no-memory-wc so the region is mapped as Device memory.
>>
>> Fixes: 66664b5701da ("arm64: dts: qcom: Introduce Shikra SoC base dtsi")
>> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> Why only for Shikra ?

This XPU violation was seen only on Shikra, and only with Linux
running at EL2 (KVM). It is not seen on Shikra when Linux runs at
EL1 under Gunyah. So, I kept the change to Shikra.

Thanks,
Vishnu

>
>> ---
>> A similar issue was fixed for the Tegra SYSRAM in commit 61192a9d8a63
>> ("arm64: tegra: Mark BPMP channels as no-memory-wc"):
>> https://lore.kernel.org/all/20220622132300.1746201-2-cyndis@kapsi.fi/
>> ---
>>   arch/arm64/boot/dts/qcom/shikra.dtsi | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> index 2623e139196f6398c57b616879a37f84b83d59ac..597aaf490519e605d50e24c090bbfb1e47b1f28c 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> @@ -1347,6 +1347,8 @@ rpm_msg_ram: sram@45f0000 {
>>   			compatible = "qcom,rpm-msg-ram", "mmio-sram";
>>   			reg = <0x0 0x045f0000 0x0 0x7000>;
>>   
>> +			no-memory-wc;
>> +
>>   			#address-cells = <1>;
>>   			#size-cells = <1>;
>>   			ranges = <0x0 0x0 0x045f0000 0x7000>;
>>
>> ---
>> base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
>> change-id: 20261117-rpm-memory-non-wc-c93a6ff3e432
>>
>> Best regards,
>> -- 
>> Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>>
