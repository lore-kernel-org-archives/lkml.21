Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795598339;
	b=ZLuZw/BzKNqcQZalmLRoZ8+SnOdVnx4WFqxRKrtFcHEPfl9DEryQoOqLnKCdtuQd1F0V
	 Y37DmC088obYOsxeZSEJ7S9XLLDj+2x1Pj+xG1u3yv9b8izOE5du+uXqs04VQxeT5N2Wk
	 mD/yEc1Xq4+6bcD2d2F4vke2e7HV/ldMr0zRZUP1Jp5Eje0THa8TXesWbgWDt1mpm0uqu
	 ftallwJo8sP2neWNHcNguHe6nusBz1M2xuIFfMKEIB6/yP/dMgYWf+ltC/KKDvDESMW+/
	 StTcL38VLc22xbrwx8PPibIRxcswiwbVCZETGIHFpdrgAKPkxQcz97NRVwZ1Kgka0gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598339;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jMbaKJz9g3EncUc8DUtHl36zo+oWHqVd7GDKw3y5cJs=;
	b=2rdQ9+el5L0OkaWMcMzsklq+q2tukiI3cKTrgD8aIbmanjSK5msONm7l5XQJk8H5JhXg
	 glfc9mqK75gxlY4eoBsgiHRgZHLox5cWleYCCyeguVDNIs9DgMp3Ckm54i6/ZsupYIXBT
	 Py05DYL8nbNKNIRWhXSiy8E4KFJCDKd/70rkjuE/VhRMlU0ursFQX5gq4CzArDFFyCack
	 57VGJRQ6HoLvTcQYhjAuImwn2wpB//TGLyDrDld7s4Z4b63Q2r4C3v2HPIzhvctXi19aT
	 Qfh9PZ3LTMZCWNmTsa3ZPTWrmj50X8O9FOoyl8Wf1ymOXmxtJfYh9s6gqGdQhIPpn9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GWgbSZ4T;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VRXEA7fw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C7D606A696
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62C7D606A696
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GWgbSZ4T;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VRXEA7fw
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68ZPq300019
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:18:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jMbaKJz9g3EncUc8DUtHl36zo+oWHqVd7GDKw3y5cJs=; b=GWgbSZ4TNz9+5qMl
	QkTo3W4EpXrRntBZDKsTi93htfjF1ObcWORNOizPjsspuh5silkP+R8pvJFUmcLk
	KDDNGlRc6aDby0XHutQ2sMzeD38f6AcIvjeTNbDrMd6EaJ9EAgzDsBBaUepaothL
	/6gLbWIWflflACvnfszeW1yZwp8nKJrqxmykGhh5LMP4Irh0Bxj7YdZKwmqUa9AL
	hERoiizUvEr73p20tFBn572LC/Mmte2oRR9/l+0bwvg3McT9e0SOFpmOLZ3avStZ
	gTHyeOZ+Dh+kuOZKXZnuzh28fgKhdsFM694WIRew4MevQU8d2UJ7DFPLB1aVnKWY
	DhUVLw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5n6rsvyn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:18:58 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b3fd219d07so4476582a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795598336; x=1796203136; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jMbaKJz9g3EncUc8DUtHl36zo+oWHqVd7GDKw3y5cJs=;
        b=VRXEA7fwf+fBmdgY4/fleky8uFnW9VeuM1Rjp7nEti2NYI3/07V/N1UjDjFlPGC4/8
         Uogn4h+Tx5oIzxcQZ/q9E5oZud/YkNkFITzKVU8l8U9g/LdBNhEa8eRlrqpcmoUI0L5A
         eKi9cO4QZ2ti2NyiIYDSMEvs6EACG3uIJ3/cjTaw4Wl/6qEec7yZoT5vnkLG/we0LGhj
         3tNJASX6r77Pizmb+EeZB+Nc6jTi2pYcG99ZF0adLfdqSs2XQJhblNfxQk2SgHWrjdfI
         F8qvCGhhBdJsRzuybkP9bgrnvj6a695ShFlfZJ6y77LPs4/d3T/yD72j12l4P/UVm7po
         o+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795598336; x=1796203136;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jMbaKJz9g3EncUc8DUtHl36zo+oWHqVd7GDKw3y5cJs=;
        b=p+VP9fVB+SdTCGlGOlzRtDmxKKnJq1Cte4FEcQPFrGA/E2JQAfOo+gfghThKZAdLfL
         pAJQZDmwvgAA633xpZPxRB0PpkfeV6b0oIx3hgBkx5IFUi1nP3w6PNimaa8x1mJUn2z4
         h5gexIJuVsW53kOwqHwTBbbEMjtmHogq/wbfw+7TkQ4Lw43+jzt/yGGYXgYgGrWJ/v4j
         OKNkri+QEyGAtPIYDrGyaUhe+8PC8xAwZMiKt6szCzjArk1X6kScDemTwlKrGdaAoiLO
         +sLmCdFlBV7sl3JLGWINdRxV32ruNNwf1tEXKEQaodpL2YhZ639ilBr+GgZhcDD+grNF
         A6tg==
X-Forwarded-Encrypted: i=1; AL+hErFguOdtWZFpcfpkRds53kTXoJC2778Z+pVzJ3Nu4u+qPPDzJfFcneLC5MnNPcvET/LuzOK/Yug/2VwAl6E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UQMfG8X489lNjjqF20Aolvg0BlMdEwz8ivsoGTK6iUUWpsPT/
	RpKZA6WRBrvvh1fc1P3sG/Em9RySI1qwa9ZwZ51zzUjA6ozvIuTaJ1OB1OsUXU0d93/YrVs3JgE
	v4D6bmn6n0TLRkRCPLLOq/XH2Fokr+ao3ekdxl+5QfALTBRU4fg8cz4Q5WWaWfimf7Zc=
X-Gm-Gg: AZFdTZflQQ9ELl4gLWiIZJQDGncSjrNb1smNylP8qNWy09uMPnmTfzcCTSNvMnSFdx1
	7P8POT+uEze+Gt91gANXakDoIETt0mijV9XKarGB0J2u9xIbCndhZyIaffsOXxrhAS4b+M100FX
	0teuDoUTjmv5CFIyQUu96cbPCHeI8NwAGvqwXbXqaTZCKwqQ9omF5HWmux6rUn7v+EwRM6RDQ6Q
	zpdGuBRzBc8bmyyHcelHYxOw3oVqZHTUB6EkJ1sjQp4tFiVP6vZJjaUVITMZbIs4YyfXUZ9D/rV
	qL3XWzudncqkGedPp9VQL30bD1JPGIjDQhbpef1B42I0f7z1vCyEGKiXCN6vGOrPAcMuSVjndzR
	5CFfm6Pj7hjlRELfvbO/ODtQh56w2Dyw8ODGPHvu7C+RF/wnylEFuRIwSezdXdaM+ra2hG0NNCX
	M=
X-Received: by 2002:a17:90b:48d0:b0:3ae:521e:767f with SMTP id 98e67ed59e1d1-3b41c95fa1amr15029383a91.36.1795598335907;
        Wed, 25 Nov 2026 01:18:55 -0800 (PST)
X-Received: by 2002:a17:90b:48d0:b0:3ae:521e:767f with SMTP id 98e67ed59e1d1-3b41c95fa1amr15029358a91.36.1795598335425;
        Wed, 25 Nov 2026 01:18:55 -0800 (PST)
Received: from hu-raryan-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde7f91c6f5sm6290687a12.27.2026.11.25.01.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:18:55 -0800 (PST)
Date: Wed, 25 Nov 2026 14:48:49 +0530
From: Raj Aryan <raj.aryan@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] dt-bindings: power: supply: Add qcom,pm4125-charger
 binding
Message-ID: <awan+SRMtZs6c9jQ@hu-raryan-hyd.qualcomm.com>
References: <20261124-smblite-charger-for-pm4125-v1-0-2132c9f0601f@oss.qualcomm.com>
 <20261124-smblite-charger-for-pm4125-v1-1-2132c9f0601f@oss.qualcomm.com>
 <a5f859c1-0779-4ae1-88f0-bfa12268e09c@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a5f859c1-0779-4ae1-88f0-bfa12268e09c@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNiBTYWx0ZWRfX/TuK5xLAp7FM
 YpS8XSQ/oJqH0xu2cRyoKbW3HPbqRpPeiuSN7EkyNyL2Nozn+3vuelTcfQ27XbcuO96DyOZmTNo
 hxv+0SAFBoBsxczj272SoIlWVK2sC7KQo/lxt1FXIGS+daUAYG9pAML5u/N9elFo3R8r89Bt1KZ
 PQ6O772isfvjoyDgeyGcJKYqPaE5tXySemSavASNI6vWSiIPqprcDG9RNstemCoP4Foa9JNNxb1
 Yqo7Ss/u7wmPzGNgbd7pQUT8oP/Bra7+HOMfxfMyACjrfeWst7D2oXqF4V8KeWhaarJQG+iv8Lc
 /ExdAIIcD9SNP3EIjDFSXDrrOaBIwlD0kRl/DDRc17kPiiAoqkNPQQw5CnTQcYKDTivbI/hYZUZ
 HILNHpjPVQz9sH9tVgwS64jWHaZ9SQtCowXrK5yopgCliPveehPHk4CQN3JiP+yfcdU8IlJE05B
 sWBoURLRETQ7HYd1ZMQ==
X-Authority-Analysis: v=2.4 cv=Voa2kO2n c=1 sm=1 tr=0 ts=6b06a802 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=gAAQxgIGOAtfHdDX1gUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: JcNaI7_aRT-gQo-ye29QccZDA9UFpLK-
X-Proofpoint-ORIG-GUID: JcNaI7_aRT-gQo-ye29QccZDA9UFpLK-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNiBTYWx0ZWRfX+ajjqr35lXgF
 w4b5XoF83jpunvoEabfMMf7rA+VdrjSCAjAQE4g9IbJfTLFD6cyj3LIq2GhoJmEEcjSIsZO/Lu9
 4O5ObsM87uuNFTuIJP9jsTwFPw0F+FE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250036

On Tue, Nov 24, 2026 at 10:55:57AM +0100, Krzysztof Kozlowski wrote:
> On 24/11/2026 10:15, Raj Aryan wrote:
> > Add YAML devicetree binding for the Qualcomm SMBLite switch-mode
> 
> YAML devicetree binding, you hit combo... Drop YAML.
>

ACK.

> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23
> 

ACK.

> > battery charger found on the PM4125 PMIC.
> > 
> > SMBLite is a reduced-feature charger IP sharing a common SPMI
> > interface with the SMB2 family (PMI8998, PM660) but using separate
> > SPMI peripheral bases for CHGR, DCDC, USB, MISC and BATIF blocks.
> > 
> > The binding covers:
> 
> Do not explain what the patch is doing. We can read the diff. Please
> read submitting patches or look at other commits to learn what is
> supposed to be here.
> 

I apologise sincerly. I will correct this in V2.

> > 
> >   - compatible string: qcom,pm4125-charger
> >   - reg property for the CHGR peripheral base address
> >   - Four interrupts: usb-plugin, bat-ov, wdog-bark and
> >     usbin-icl-change
> >   - Two IIO channels: usbin_v (USB input voltage via ADC5_USB_IN_V_16)
> >     and usbin_i (USB input current via ADC5_USB_IN_I)
> >   - Optional JEITA soft and hard threshold configuration as raw
> >     16-bit ADC comparator values written to BATIF ADC comparator
> >     registers
> >   - Optional monitored-battery phandle for battery parameters such
> >     as float voltage and charge termination current
> 
> ...
> 
> > +
> > +maintainers:
> > +  - Raj Aryan <raj.aryan@oss.qualcomm.com>
> > +  - Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> > +
> > +description: |
> > +  The Qualcomm SMBLite is a switch-mode battery charger IP found on
> > +  the entry-level Qualcomm PM4125 PMIC. It exposes five separate
> > +  SPMI peripheral bases for CHGR, DCDC, USB, MISC and BATIF blocks and
> > +  supports USB input current limiting, JEITA temperature protection,
> > +  battery overvoltage detection and a hardware watchdog.
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,pm4125-charger
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description: Base address of the CHGR SPMI peripheral (e.g. 0x1000).
> 
> Drop description.
> 

ACK.

> > +
> > +  interrupts:
> > +    maxItems: 4
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: usb-plugin
> > +      - const: bat-ov
> > +      - const: wdog-bark
> > +      - const: usbin-icl-change
> > +
> > +  io-channels:
> > +    minItems: 1
> > +    maxItems: 2
> 
> Why is this flexible?
>

I  made io-channels flexible to allow an optional usbin_i channel. The
shared driver requires that channel for SMB2, but PM4125 uses SMBLite,
which doesn’t request it. Since this binding is PM4125-specific, I will drop it.

> > +    description: |
> > +      IIO ADC channels used by the charger. usbin_v is the USB input
> > +      voltage channel (ADC5_USB_IN_V_16). usbin_i is the USB input
> > +      current channel (ADC5_USB_IN_I).
> > +
> > +  io-channel-names:
> > +    minItems: 1
> > +    items:
> > +      - const: usbin_v
> > +      - const: usbin_i
> > +
> > +  monitored-battery: true
> > +
> > +  qcom,jeita-soft-thresholds:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    minItems: 2
> > +    maxItems: 2
> > +    description: |
> > +      JEITA soft temperature thresholds (COOL, WARM) as raw 16-bit ADC
> > +      comparator values written to the BATIF ADC comparator registers.
> > +      Example: <0x5314 0x25e3> for COOL=15°C, WARM=45°C.
> > +
> > +  qcom,jeita-hard-thresholds:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    minItems: 2
> > +    maxItems: 2
> > +    description: |
> > +      JEITA hard temperature thresholds (COLD, HOT) as raw 16-bit ADC
> > +      comparator values written to the BATIF ADC comparator registers.
> > +      Example: <0x58cd 0x20b8> for COLD=0°C, HOT=60°C.
> 
> Express temperatures with proper units.
>

ACK.

> 
> 
> Best regards,
> Krzysztof

Thanks & Regards
Raj Aryan
