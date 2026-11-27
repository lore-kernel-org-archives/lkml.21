Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776991;
	b=m0w/fgoWWDCLBADnpzxLLCpFaGA0kabm2Ps9Uy2HHwJokvhww2XpUZ/kkZrjeRxY9xh0
	 NTbiHaCB4AgdEhA2r5r8vmYgDCQuObir6jY1/nknwt+jkJlE6wFYSizcAeOhZkQihVEie
	 JSa6VM69L/zhd9bwEV3TxaxlQXeIFRQQ0s6NsSLpAxQTp+Zxql1a+nPUG38l8D3WyHMtD
	 4i9jzxtEkzihwICoXOKVwIbgUEey7gZ0ex9v0n+4YXUdfEag0EqbvD38YYGoG7jszlN1E
	 O6IG85gx2V5WgvtnJ64QnTktAL5WvjLBsTTpNJ/dmnQjq76R6ZsyRmXp9ef4hs+8aKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776991;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=b6cv2nV7DQ+U2z5q1XF0ZWaJQHDCqA41YgiMRDI9ICE=;
	b=FHF/fZdzuxY0HYxCm0cpWryCV4k6dTCJ8JibtSAmKhlPaoetP7B/0VrkRIDBVz62MOpS
	 FIbvWb3RZZxutpgBXIcSb8QiIjLo0yW7T3J0M2vHyNHBkmHlQDSZZu9Xo/Sy36JD4GbEY
	 m0ZuzgH03tG3Bncg5YyrzoHkl9dXyHmiEF3xrjk/z14lsmHwXNgmQ1wYsjyHXDBMYhOlJ
	 /VDa6dMggVQmDR+oEhmSePPlvrDpcbgRFKrRppZdXlOEK9PfE0OpeO6j7cLYMdYfWFbYF
	 UP6qXZ+9Zt5gqAZocGDLhoQLHSx5SKMuQuoxsPDgCJXWCMwMoyzHxZbyR3CEonTqMWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nxFWYs+h;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fwd8xnlg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84533606A323
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84533606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nxFWYs+h;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fwd8xnlg
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARAphIn052883
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:56:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b6cv2nV7DQ+U2z5q1XF0ZWaJQHDCqA41YgiMRDI9ICE=; b=nxFWYs+hbj2oVrEG
	DjiO7+devEYg6Y0GUa8g9P6GUlJuqEV8JitG8WUQyqYsqp7C5DeQwg+YP8qUqPFg
	m8a5+VsIKUocm9xrF5cm9e1qXJAAGsmQC4NagCy0lnktbaDj70C0fuA2QpafWxtN
	j8wKbujzCjI9YcHtt2gvvoSGJmcdeASMXqCMRLzFng79Ekq1iD+wx72Ar6LTu0Yv
	S7oskl2VOIyqiY0BBl+sRAisP1RjEJxBTiyL9xIP0j1qAuFrO5pJYlha0H64khs8
	3N9CaSHL5wjXwbO4lPLxwlXYvyGr5ENMcaMctq4rxQn2Y3/cRIjXjpaZhD0f1z6u
	noZXFw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74g6s2x5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:56:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92eebb130dcso88151185a.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795776989; x=1796381789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b6cv2nV7DQ+U2z5q1XF0ZWaJQHDCqA41YgiMRDI9ICE=;
        b=fwd8xnlgMkfHaudynmDKzSndgVVYISR0kXA5SjCRodZrpSPJ+1ukeSEP942bGUHdSZ
         h2qjKRAV05rFyY9j0+hCwOGfddnPfRMaEbBSM8RXq+YwS68hS01vE23gtqFlmroO7+pa
         6RKWl+6chVWG4hXeAmCWh9lomTJ1mm3ZYcmFOI+d3/xsreUUamUtrFrAveDvD8XTLKST
         8VNfEx7s//OA8uMG7ZuZsJwAb6eVObcIDa2jfATeHTJKOLfmeklQAorjfNWQAVbQ8NvJ
         QMIv+GLNudGyXRPNE1x78xEI09tWVG13qXOQTeiXtP1C0wLgt9H7w+Gkor6r+eXBHNE7
         sI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776989; x=1796381789;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b6cv2nV7DQ+U2z5q1XF0ZWaJQHDCqA41YgiMRDI9ICE=;
        b=Ez6COWA6HUyMzfIHgjxaRtuEqdoAm0Xjbjf4bkn0ts6AIPYB3qk35OtPgDTfzgX5Vm
         Z2fTQFK89+G5mU+0WDRK0MHUba4L5NxPbivoJreG/HuVU4UACcnczIy2jQprb9l9FvMU
         jPGgBTxzhNVgyFPqcMwFwI7/zf9WUoElp85hJHylhkbdIlsDdUVaQXda09eAWvmD4SGC
         FncoYBG0UZIzHOLgqxf19KKi34xo5IYxAO2mehWjUzlp6heLQ0VmYrB2JKUmnYuykgEP
         zvEKVweg2p/Hh6zdEyNj+SuUODyHY3LDJJcWqTbztOCFReqm0tEY4yDTuEsLhJuBmaIH
         jrbg==
X-Forwarded-Encrypted: i=1; AL+hErFbJCPW+1EBsAmKNZjqgAl0qiI+sfqHcxZv2m+gAsEH4SI9jrjq6LX+cMG+gf5OZ1SVJJ1l41GxP10xidg=@vger.kernel.org
X-Gm-Message-State: APuU4Z88Agcp/J6UF+KE5eY2nrs+b5VD/Z4ha+S+XLEdN6D6nLIqDBeI
	T4ccWEF95fNoVl0138nyIzGnJkidcscqDA5UtWbIMi9c82zYZk5WpXA4KkeOOoZYm7HB0Cb8iOu
	8aMCgKP/Zzf5l6/13HV667DTA50B9euk8DPtn22b5FjeyoLOodXyD4BdqrdR2nxNhZmU6id4w9x
	U=
X-Gm-Gg: AZFdTZcfF2Jfia5INWqwo4RIjqzvljqxvVbKYTZTsQZEOQUnxmrXhw/DmJ5JyfK1JxZ
	vPB9AVoFRUGn+Sk9c5gMnwgNaEv6fW1dQQsPXvTTc+hRjMQhqmlayRX/CqC08ZvKsmV7ON48hat
	A2TVKzEsJzBKZMEhfW/9W2BI2LLSCaoBWKq8dfZe0vJtOPnSDP5Nfw6HvtqA4eAoJnw/wQjtINg
	G2WgNYQ0Fjsv9SUOTCz25/tjsm6cDm4iNXmiTSFi4xKvnt7b0eJWVCdeRELdkbDC1XiX9IjUtel
	v/bmj6zP5WqQk1SdSBdkRvV68l3y/U0OVpKwoiaqk30a1ZdA77okLzA+DXiPJ4YDCX7gwn3cKyJ
	TO4GcvmqUtD6u1qcbKCGMF07VJ2aaThsOg28pNNwBj86b1qOWkHYAWpZZOlWyqSETU0tEyUo=
X-Received: by 2002:a05:620a:6587:b0:94a:26da:35aa with SMTP id af79cd13be357-94a26da3683mr69442185a.3.1795776988607;
        Fri, 27 Nov 2026 02:56:28 -0800 (PST)
X-Received: by 2002:a05:620a:6587:b0:94a:26da:35aa with SMTP id af79cd13be357-94a26da3683mr69439085a.3.1795776988148;
        Fri, 27 Nov 2026 02:56:28 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb07844211sm4492470a12.6.2026.11.27.02.56.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 02:56:27 -0800 (PST)
Message-ID: <92f6d14f-1f81-4605-806d-57c13e30126d@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 11:56:25 +0100
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
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: mahua: add iris video codec node
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261123-mahua_iris_enable-v2-0-b1a16b16afca@oss.qualcomm.com>
 <20261123-mahua_iris_enable-v2-3-b1a16b16afca@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-mahua_iris_enable-v2-3-b1a16b16afca@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BkwoM98M2Ybf-8ANFF1XIMYZrA3JxLAT
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b0961dd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=3aXJPGk6cDIRbk3RZP8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0MyBTYWx0ZWRfX4usH2PJKO+Yg
 DhKM5F1+4pfudN2bHvTUmWlrWX3D9kCFkcwSyBa0XB0/VKU/rjD6BHztFn5ui/zy73txJmE+SwO
 MMDEfv+vjmCZ++nUT6bSR+GdpX/rUrE=
X-Proofpoint-GUID: BkwoM98M2Ybf-8ANFF1XIMYZrA3JxLAT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0MyBTYWx0ZWRfX1881bJQM6SEG
 9qtMn1YfEVRyis5kuK7B5gswZ5uPJKKtu//p/+70UBDtq9Wg+S/M3wfKuEKwBGurMHfjokGvCIr
 R3HV1w/pgls2pxaUnEXlPcKesH2qnW4P75rHu6XnC+Oz/XKQRTGY4vamWEp0Yr9DLVmoP4UasBX
 YM8/DjL4WuZON2dChEfYgjHEnx/m0CV4kP5Pb03xEMr6FqDLVX6marvyGpzvWTFRMvKTg0jS7RU
 Nb+oSOZCJIxME5D+F1+VfUMqhKU2xtNpuia7d3Nw4xVf7sdkQwirQlvG7ZKix/3UjXl6xZ0Fm9/
 aPnh/4nhaL3NQyFJicv1EqjkiAwYkn3vSSw05eb+12+hY9nCKOyoRxBtGRUK0T7u70goVF9xQqK
 xQe96koTuimdCGbiUQ1oZkq3EHSHZeSVnkHpeyIAocR1nRoBXz08tzrh47FcFzbESRE0mC4CMIi
 yb1WvYupQSU3my7wAkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270043

On 11/24/26 7:44 AM, Deepa Guthyappa Madivalara wrote:
> Add the iris video codec device node for the mahua SoC, overrriding the
> fields clocks, power-domains, resets and opp-table reflecting single core.
> 
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
> ---

The glymur series is not yet merged and can't be because of
dependencies, so this patch can't be applied either

>  arch/arm64/boot/dts/qcom/mahua.dtsi | 67 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
> index e7141f8c9e0d372aa30f2ac1ecdc5941d249311d..4f018193be50a9f62bd9b0b403a5a6b0a9f6b6a5 100644
> --- a/arch/arm64/boot/dts/qcom/mahua.dtsi
> +++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
> @@ -150,6 +150,73 @@ &hsc_noc {
>  	compatible = "qcom,mahua-hscnoc";
>  };
>  
> +&iris {
> +	compatible = "qcom,mahua-iris";
> +	status = "okay";

This is stray



> +
> +	clocks = <&gcc GCC_VIDEO_AXI0C_CLK>,
> +		 <&videocc VIDEO_CC_MVS0C_CLK>,
> +		 <&videocc VIDEO_CC_MVS0_CLK>,
> +		 <&gcc GCC_VIDEO_AXI0_CLK>,
> +		 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
> +		 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>;
> +	clock-names = "core_iface", "core", "vcodec0_core",
> +		      "vcodec0_iface", "core_freerun",
> +		      "vcodec0_core_freerun";

Please match the style in the glymur submission

Konrad
> +
> +	power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
> +			<&videocc VIDEO_CC_MVS0_GDSC>,
> +			<&rpmhpd RPMHPD_MXC>,
> +			<&rpmhpd RPMHPD_MMCX>;
> +	power-domain-names = "venus", "vcodec0", "mxc", "mmcx";
> +
> +	resets = <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
> +		 <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
> +		 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
> +		 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>;
> +	reset-names = "core_bus", "vcodec0_bus", "core", "vcodec0_core";
> +
> +	iris_opp_table: opp-table {

You need to delete-node on the Glymur table, otherwise this shadows over
that one

Konrad
