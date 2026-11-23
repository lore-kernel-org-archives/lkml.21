Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795471740;
	b=dfcoeuLPX3vy9X+iOV+ygYLQaO1Le6rYrS+zeaEivlMMAe+kjcEgKRy91sSMCZdaQ2rG
	 FoDMzT6Zaz990pnFgSZ1aVk+O0qnV8E54mBed2PnrG4BOSfe7++sHfBFJbLeOaCnG3Yut
	 R2xBp6J0O5O0ADY13A13d5PFaL0+bK7S4894fzc3twjFvK6K8MQMSRyIwwuuWPY2q13ob
	 RLE/bxx++Y2MiRLNNMvA+iR3SQorobUtvWfA3cmJ8jnzaZgvUy5AE5u3TsNyL1CoULmSc
	 XEcU6/VPdpRBTbhKZXaaG7jlGrgCpLP4Sig6X29FY8K2b0UEj3IOBBa+MNmpPX6URiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471740;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jO0jfM6XRLgagT8aMcVQmvm0DCRJ2+e7pbdmqZkT1eE=;
	b=i1b0pkr5t2dCsVtmisC9UYBDZ4NhsBZk2Y19ClzEgPn3oVptMrPrBiDPrqpe9TBEcg2Z
	 Z8LfWQgUXhcBvQqw9BVD5MKvA0tbuFSB2EI9b3luYe+N22BrPd+Vc/hriEUn4I9CutSO8
	 Z1kc7bO1NG6eMw8+vIunihHuM2JrjLvsivWnG5hv3Mlz5SSiVDuds2yBPgyu7PmvhcFVD
	 rHo03awjWrjtKNxYwSloGp4u3yXhCr+/QY1HTSfFteuvJpGLs3ZJ4gF+xAa8wf9ild2Ak
	 jLKW4X0fubZEbNi5NTkwUEz9EEOg/v60g4AuUHD3OYL3qKMHmDTQjTKkYB095v1rIhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S5fen8zl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A4YfQGzt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654DD606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 654DD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S5fen8zl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A4YfQGzt
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuiFQ3962964
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:08:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jO0jfM6XRLgagT8aMcVQmvm0DCRJ2+e7pbdmqZkT1eE=; b=S5fen8zlThJ6oL5v
	9XBb0bL0KtRCHm2GWxYG65Ef8xgZXSabe55j7G517UjzDE4GwEwHVTg9NuooKp2A
	cCfM+ywFd8syQ+XDtTJnvgMGWfIem3WDxbUWsajAJAvUAuj79copV80rurNKFavT
	YE3/pfA/DzJ40PPzbqGWEBQXRoKcsXKCZLfZYLNE3Y3Ebdkc1iqR+Hh3+rZGpeS6
	fxqlNHkwgUGFgD7/9Aaub8KdNk08GrMxMXj8tchQsnt0LtuJqbGF/yVmeGxCMAMa
	SihGfuybYwqntjlPuXjOrZLb6dVRigcmNMhKlM3keJFWv94c/zBohRAl3dYUyLzn
	ObNeDw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7ub5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:08:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9493e89d4f9so561555685a.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795471739; x=1796076539; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jO0jfM6XRLgagT8aMcVQmvm0DCRJ2+e7pbdmqZkT1eE=;
        b=A4YfQGzttkYmEgzCKJXXcVvapu0i4W80QgJLO/Tg0X54JUghFuPBnSmtxjDMSQkgGP
         Bltb9TEk0CZk96v2E+9z9HAH8WGcs2m/HF03hIR9lqZJVC+Zy4KDv2bgM2U/rHZP5q6I
         Ly+ybfvYxsQZgFfqL+Aum8qp0nEbVM7erDX+4VoQNA1mVvf+eQz12kb0Zf4u5MAlzHZn
         au/LHq2s9HbUqaafXjVj3QGFzHLbsvSaQj59LegxSa7ZduYOi296sUVxPoYdGHW0hyK0
         K6zmlzR9LppYCghC/K8uqqqZPD0jmia5OYVQcrIUsr5s4b/azcyeYsYbAPtR7i8guIqn
         JL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795471739; x=1796076539;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jO0jfM6XRLgagT8aMcVQmvm0DCRJ2+e7pbdmqZkT1eE=;
        b=Ugm5apJ3rG3yI5VjFAMk/TD89MZPr4HvxNXb4ACd1kn49owTpR2n2OG4jUppSziw5O
         p8qxdp/BImqDtWJh/OUWsHZOr72Myp1eCfnU7Kvespj0Sh7ekphdA9v+ZCTHQeqiE2F7
         BwcmsOYZxjvyDFCB1/InR5rtBLRCuIyA3/nZcsDHfYwsMB3VPhTQKVejuza//amLU3+/
         8Qzjj/tZRv0WvXDfPWBS+behvM6SZ4/oOJQ0uqYAnCp9AYqm60627e8tJVnBgGSK+z8K
         cWMU7X473G0hf4HlTs8YM4jGkXG5C6KiUz7JuuAgk17rvpZFJqeMaXp6avywCKQdBXgo
         EwvA==
X-Gm-Message-State: APuU4Z/ELNfzJrUtyTKbfq6GXw+8tKuZG5CmcOopCGh707Q6qi+vSN8R
	g1Wsh6goXvs9eLQFgeGDSJrTJzBy41vKJrIn/3WQ0bAM9WeuqQ+YrcXXi80+oMzW7Z1cioR57cY
	OYkOVpZKirbXd0jKQss2eU0SOa6FRwfQ1t5Elx4uQ+wld7S7wBfn2OVEgXaKHT5tXLtA=
X-Gm-Gg: AZFdTZf4wM+o1qYrruqJda9vTXAULFhkvF+RFzOd6jz1nvHSkCQ7atHJXlvau8qttca
	rQwT5qKBFKZcoRO8Kta9Vo0vVBt+8uXFD4zsf76MzWIG7kw4SoxmmS3Rtvm5k2237Y3veJRjYin
	AW9jjoy6Uhtv28B6TYumUpFMli7wbc/k7VNEyMArgUSvy3vKV4Z8LXHk86E3BW/N/wrwq/a/HlJ
	2+U8fyiVftM/vdbOoh6WKX7P3mgU9Q/gopjA4pHbGaeHkkjKe4i8EFeGl7te1sb1VLdE0NGCSJU
	DmbUPUmlZm0zeFxVYnwGX3QYvebmhrliHh+7nZSTgmhEN/IATQjDnvwpEnTl5SWto7zADMuWwIE
	v9mdM7MR9nVVP0bnA5HMscWqPj40PCNp83UkxQdESoLexCWtZVYHn92KwC/+q1bXOuGOg43wDXt
	c=
X-Received: by 2002:a05:620a:2585:b0:949:727a:44e8 with SMTP id af79cd13be357-949ba9e6390mr2297187485a.35.1795471738587;
        Mon, 23 Nov 2026 14:08:58 -0800 (PST)
X-Received: by 2002:a05:620a:2585:b0:949:727a:44e8 with SMTP id af79cd13be357-949ba9e6390mr2297181685a.35.1795471738048;
        Mon, 23 Nov 2026 14:08:58 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b2437sm561786005e9.13.2026.11.23.14.08.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 14:08:57 -0800 (PST)
Message-ID: <c8e53787-adee-4fe6-8a8c-66fab28bbedc@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 23:08:55 +0100
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
Subject: Re: [PATCH 2/2] dt-bindings: qcom: qcom,ids: Remove unneeded ID
 constants
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com>
 <20261122-qcom-socinfo-id-dt-bindings-v1-2-eeee0ffa25da@oss.qualcomm.com>
 <c4509c17-2c67-4f76-899d-548edc47069c@oss.qualcomm.com>
 <b10fa9da-39e1-4bfe-8c09-cc1d5cc007f4@oss.qualcomm.com>
 <786351d0-c7a6-4ebe-bae3-0c81ec20b833@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <786351d0-c7a6-4ebe-bae3-0c81ec20b833@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b04b97b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=-8XAt7TJbku-FhjSX4IA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4OCBTYWx0ZWRfXy4zlzeJxS0wA
 0+YpfKPWFw8d2EjKgzddrpTJ8wAlvjsi/xDWM9JQawxVelOWUFgDDIOATMbAs9LjeVMrpAybMmO
 3wOtYSo5RoRVE4hSzIglQCQhPjhUSM49uSu+86rTdyyRhIen1kdXM+E2agf/9oLANYJp0MIl9WU
 gSIMID1fSNipY3eJ51vlnpdfl14W02X9mPTC52KDR3CNzPlQN+EmD8ydxleSlhEBQWUuMMZ5N0V
 +HtUMQBMB8nydYDroDjmIXBtio3qqHLNmucbdqxXeemsMuYgEXNgCFKY2CHQUSHFyh3bIij34/B
 Es1o+XR8a61KWbhCf3fsI96lC9B83wus1YJvbl0kAIq/qp8hiP/rZUIGh3W5NPEM1Wf62f9lwTq
 KCveyZ8JKqoFrk9mfWGTcrfH3bF709L94NKwX4TzjIhRrUoIwyh3gvu2nasuuLI6lJwz117bJlV
 S+c4aDVk+KiozkKADrg==
X-Proofpoint-GUID: u4iSuLpDJbRhWN7hnlaN973EjIvwdhL6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4OCBTYWx0ZWRfX4DqDjAZMgVsa
 Bc+cQ8rourgurfMVAQQesBVuxsZdMJuXn1hPV5LcPdmSzb3CdDqgUTr2lr2ySTRcG/fvkx5raxr
 3Zkv4rzCHzBgKOakz/wh9lPU7di53g0=
X-Proofpoint-ORIG-GUID: u4iSuLpDJbRhWN7hnlaN973EjIvwdhL6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230088

On 23/11/2026 20:06, Konrad Dybcio wrote:
> On 11/23/26 4:22 PM, Krzysztof Kozlowski wrote:
>> On 23/11/2026 16:17, Konrad Dybcio wrote:
>>> On 11/22/26 6:46 PM, Krzysztof Kozlowski wrote:
>>>> The IDs of newer Qualcomm SoCs, as reported by hardware or firmware, are
>>>> currently used only in the socinfo.c driver.  There should no and there
>>>> is no in-tree DTS user of these, so none of these constants are really
>>>> proper Devicetree ABI.  IDs of older SoCs were being used in DTS, thus
>>>> that part matches the concept behind DT bindings.
>>>>
>>>> Driver have local copy of these defines, thus these can be dropped.
>>>> This has no impact on in-tree ABI, but any outside users would be
>>>> affected.
>>>>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>> ---
>>>
>>> I think we can move it altogether, to prevent a situation where one has
>>
>> We cannot move all, because some are actual ABI. I could try to leave
>> these ones only, but that's a bit too much work, IMO, that's why I cut
>> everything at ~450 value of ID.
> 
> If you mean ABI as in "used in DTS", I don't think that's quite ABI
> (again, looking at the glymur-ipcc.h case)


True, not ABI in meaning something agreed between DTS and driver, but
the values are used by bootloader, DTS and the driver, so I would just
leave them as is. I rather care about not growing this for newer platforms.


Best regards,
Krzysztof
