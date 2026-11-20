Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170078;
	b=pHYEoR5n2bVNLRKuRL3PyqigmfFWfoD9TgoiosFOr2fqQF4JhfA2iPpaOjgXUw0ligw/
	 nxeR2u0XdtE0Jv2ur/oGzoJp7Tvw8nmEYGtRIgFyNt+bQffVxtW8sASKI9dMqVlv/g6VQ
	 7Y/2s38JyDeBuT1gF7qjlYn8ouN4wAkP26SCafmRAE3/C5T/Uos/GhdQQgrMOaqQ11nlm
	 NYJkURh7UwhCDn4feYay+hQU4Vxcq8eqocrFz6bx9d6JU42kci+Zy+LZUCZy1STcOsAmg
	 PDDSgsQewFcaTJ1AjVfkYEmfz8aqBHW9lE54JZgTURamspqfstqAMLvmG8jEOiSErgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170078;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=n6xNjiXLI4ldZMgm9vuyivlFeIPVFifPb1EDl7UJecI=;
	b=leDG1OxAuKQ0GPiSP3augqMa+au5hLaltbRi8QImmafWPIfsAd+IVONdIAsOlynfQLgi
	 YE4dvAoxlK//D8uOG3R9yJ1cHN74RkmKvpHqg5FFIL+wgmbC6Iq49MwBE37Mx7pcQSSws
	 WVZuQIOvmSSnrNl+cCwiTv7h4Nqgq6WTdhxYM17q/PiFErL6u05eu6insqzqpwc95nAEO
	 /PVJdg7HSiZFZOJXHYDTMQVh4ETvdxnijwOOtzlSPbG4jlxVlnogIy8J8wnDZSB8ujWph
	 MUXQC+YLXzVigAaGD7pL93QZ8mC5BUtnggiDG8bxh5kAfMj0V78HDW67hPNIQIFt1jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CiQQmnZP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NFgi5Vhs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB7C606A333
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:21:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DB7C606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CiQQmnZP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NFgi5Vhs
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7et0x1268397
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n6xNjiXLI4ldZMgm9vuyivlF
	eIPVFifPb1EDl7UJecI=; b=CiQQmnZPTzu9L41uX++xGZzjLXHOfK8Pbf6a9gvv
	1b3ZmL84IQyGNMUUyQXpRlOPbv7v23GfD3cD4qderzPHqcNp0Sc/RelCW7K0YnFX
	/qBmQ19QNwi50g8JyAhmj4ClBHBEIfm2trb5SjhaSsUNBbjYrMHa1AY8TIuAAnM5
	dGgwM3Iqw4Wul05TOvDuZvhfKvgPydFUmoi4yje0wedMFLLGtlkH/UpG3rOu/kNA
	qSS57tfItpUDX1QVfovE3k692uv15pkjeWBQ5R8C0Eb8t3Jpk2ENdS37v8opHbTP
	5BuRybzmncizaSw8fbTOiIO6biDIp4A8WMvpC9+Bs3Wupg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2cd1sxca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:21:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f26dd2165so194545885a.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795170075; x=1795774875; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n6xNjiXLI4ldZMgm9vuyivlFeIPVFifPb1EDl7UJecI=;
        b=NFgi5Vhsn4vUb/dJrGBKsAI3iD6JYIgFx6PlTkCMFzalQnnNOBBws3Tt49vqVsO5uJ
         nuIGID8R+E8jWn5uqdILU4PsoLD4aGeJwqza5txtBrIFLzJRR9M74vfx5TvqodL3Jecj
         iB9SSLFMi36yt9yfyIgUVD5jddTPnfXcUNAEnsAcj3m//rh0ghlGbGRFLgZyRwX3f3al
         SwRgGD69gl0PSsvDmH2Z+BzB991hQBtpYLPhkJg+grUSSdc2QpxOQgto1/exSveWfuKR
         uSyIHHCEUJpVrl4MnDCywRouZUdekQkzz8L36KrEa6eFiK1hTZQmQpu0Uak0YwG+BPnw
         p1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170075; x=1795774875;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n6xNjiXLI4ldZMgm9vuyivlFeIPVFifPb1EDl7UJecI=;
        b=Q/vgRnsCfAf8i0hQQODyhyBMMBnKc9genMgFGUN6PBRsDGcPfnHoq7aKqRcGpZS4RL
         oDCprLles3wLhcbzKJRlN7OY+Nw35VeCBMmXjuwGgMnSlzTY6cXfGbcLTeS07nsZFNEG
         K3X22rNhrfxJvyJwxsQfFARodAHS6bjUeX6ERBJDMBh9S90c9MW+q72+AvyaqlLmQ0u7
         B5JQ8724knQGUYCv5G6wfrDJehU3sWYn0v4dsgCQwz4OXCoNCoEqEkuorTNNuNmFnQKx
         S+ELT0Hx15GEWSN3Yvdb25TKpiUW7kr5IQVwN14Y0R+NFF48QjGLMeDB12IrTz3r0Q5z
         poiA==
X-Forwarded-Encrypted: i=1; AL+hErGLo7nryKDB1JKVXuu+1wr3/RJtZg8xAeF6K5G3qFggGz7u0tfO53ILOliqTkgh1LTKRVin3C2PVS70xs0=@vger.kernel.org
X-Gm-Message-State: APuU4Z87GqnDxcU7Ashe/Upra13y5z7KRf4uKQ0rJb1QJHB+nL+MqA+c
	eQ6wtHtZZT5LsYwq/Lwj3wgn8w4QKy+zd9vewOZxtW0/YKDK3yVmzCzeCtM1yEL+WcZbB7MVGsh
	0lvm3kM5udrkEiVFA2ZqfA2V4WjpNUz6yIfgZ1f6Mir0ognqv8kgo+W3RfwuTxYsUDI4=
X-Gm-Gg: AYBFou0omGJjQAy2TqXxZaqgSg1z2uQ3GgpiomqboMklWxS29XfRX65PukJZ4dj4lAr
	Bokrb41Rx6MNsZbvKLjg2o/M5SbP227ojFuvdvRP2mXbVZsPToSD25ZVVsnTQbtEdcXUFW7snsg
	zX+rpffxBMzY2+EAehDslMpx4JJGbUkvBc/qSizA3c21RZvzyYr/r23Snljlv6fLCYyj05qZsct
	Gnqwm9CLIk82JQKGfsbxhLhxaMjleK1SvIhMtAEGrTb0DpRkuSNBcZwcGDFN4a33NlJaIlL+uw7
	FThEKVP3Mwol0ciUFfHDpeRZxubQQRfbQB1T/AqF8bTEKS55I574xhxFQGH+htpC+h5xxK/x8na
	j5k4nKhKMKKOpl5Vwzk+RhOLVDR/yleK9g2ruzOv611YoBm66U6U5l4SZeg6iQDz4
X-Received: by 2002:a05:620a:4142:b0:943:faab:a149 with SMTP id af79cd13be357-949bab1e48dmr406230085a.63.1795170074875;
        Fri, 20 Nov 2026 02:21:14 -0800 (PST)
X-Received: by 2002:a05:620a:4142:b0:943:faab:a149 with SMTP id af79cd13be357-949bab1e48dmr406225985a.63.1795170074176;
        Fri, 20 Nov 2026 02:21:14 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f643adsm29150615e9.1.2026.11.20.02.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:21:13 -0800 (PST)
Date: Fri, 20 Nov 2026 12:21:11 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luo Jie <jie.luo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        netdev@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: ipq5210: Add NSS clock
 controller node
Message-ID: <m77xx44vjdg7e5myewy63j6nhdkgqnvvdyhqnohmylnbputjwm@2ymesyhjurov>
References: <20261116-qcom_ipq5210_nsscc-v3-0-1eaf92698379@oss.qualcomm.com>
 <20261116-qcom_ipq5210_nsscc-v3-4-1eaf92698379@oss.qualcomm.com>
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
In-Reply-To: <20261116-qcom_ipq5210_nsscc-v3-4-1eaf92698379@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Dt/Da2/+ c=1 sm=1 tr=0 ts=6b001f1d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=B4M9V4KaqHGFCjQwF8YA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: KOaIBin9ZJrLvozH1Vo6yQWlBkY8b2fr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfXx80nAP1/NL7r
 w86I/aax5B9gN44juOvujX6zSCNgDQOu8utQ+OlBtdquNvdCBT3sqI02vexWrm7cnJnih396kzJ
 +PAcFI5ZY6qi2HBqB6CHIZ9Ai4prhsdq9jxn+W+4bZVWPWal4LDz3AV1rwhVvBuFWkaPNicwyL9
 mdzxBIabpkirmV4z/7NpLB7VN54en4xa0H65ngB9CzkrR8VfXWjWx/RjtkeJQKYqC4PfXsDd/3p
 NYYCak5gHWO0L5ZxnNYLtmNR2v5c+Udu3K99owE1qZNGxv23hfVpVXiN1wPOll1Ji/9rBj8pEl7
 4RJAFxk7cPaTR2xiNdrFmJadWuBYRoa0nib47r4amoRTwGjDjYjZtMfByIKRwdomInlb30qCjPR
 rZl24CxX2YaEywQLc48wf4QCaKFMIYLo+WiM9E2Juw7o1Pt+2w+UZRVQ0ULVntivLm7Z3XUcDNT
 Rsb1Ppqh/r4Oi5KW5Jg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfX3vZQTQGjiues
 KP/4j9KmLUHBILL+rEEIyCGOs3ZuK/61KidWuGTc7MX+KxgN+bKWW3Id6Qf8AN0Da5N9OXRFFa7
 T3DyUehcdslJVpPK5Gogje8hI4AqC/E=
X-Proofpoint-ORIG-GUID: KOaIBin9ZJrLvozH1Vo6yQWlBkY8b2fr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200041

On 26-11-16 02:19:51, Luo Jie wrote:
> NSS clock controller provides the clocks and resets to the networking
> hardware blocks on the IPQ5210, such as PPE (Packet Process Engine) and
> the integrated EPHY.
> 
> Note that the CMN PLL output clock names are reversed with respect to the
> hardware block they actually feed: IPQ5210_PPE_CLK is wired to the NSS
> hardware block, and IPQ5210_NSS_CLK is wired to the PPE hardware block.
> Documentation is added in the DTS file to call this out and avoid
> confusion.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
