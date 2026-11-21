Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795256450;
	b=ff6dZi4255VVhWdqubQkrer6EA9ms6819fP7Tsm1Y6qRtZbbrq6plmm+CQ058/ZlsAZw
	 plTnU4UvpDQsYdjbF2c32TXa8D1W9pAMUj/LIxCR7e8mzlArDFT/FyyvBPbcwsPoVaLuG
	 99dloZrv+23nwk9J76nvNy2jMIFWv1uUpICe8AbccAvPtfnqSxdBfemQ0B19VY7aBwxWO
	 JJ4u7oI8qF0N1TfRwYvd1E++c1mY4N5dsSKDRrSFC37/o0PdPmkqCaT5h9/xptSKVJv1+
	 id2qKgDcyv6atBzp4giEZziwJLiBm5epD+h4pk1uvKXT7dGnLA7Lck1o3LykQ2LQ4BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795256450;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CXYi6ELkOoT9uHz5fc4tdk5+APeWmFmbN9MkRaxLJmI=;
	b=OvyHVL4FPvVt9HmUJGz7/mvBLWTRMxxQ/f12PP2SZybUlCPj20cm1oqILOeyy4pFFgN5
	 8bUOi+Oolb48oDbHlM8pJbVKxwhkvm+fHODAiWvsZZZKRky4mgkkguvYVhT7JWSdJiGA5
	 mv2H9c5g/32esvFEVB6WinT6WhnvQhMjSD52I23d3ohTiczG8ii/2EBZ4wCfd4giH4m6d
	 7fkvefAu7G5CI7kvPDcVwc19LKDna4zpQaLGxC2RI1pi8AUEv6alBUQH/Y1KTIfrYlF8K
	 PwvGHVsRC52rMU4/ObruhNoZ1Jz1qmTPX1pYgPD1QpJk/pDL217oPv1PUXbDWfLstCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NXAaN49S;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I4SmRsRl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0E5606A331
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 10:20:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F0E5606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NXAaN49S;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I4SmRsRl
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AL8AtND3787719
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 10:20:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CXYi6ELkOoT9uHz5fc4tdk5+
	APeWmFmbN9MkRaxLJmI=; b=NXAaN49S+pxRLORUip3jdzjhR26uTGLBv8HMgO7a
	liXjKBS9aOWpY8eO9EB3NKxf3opGukJ9v32brE9mY/qPM08fZVdQ7CGAeHszZei2
	Mwg41Yekw1y4PmbKdT3lrCZ2/5fUJTkCf//Ar6+FNKavhcHrsZvepwPR2c9ND8Kh
	8rHrDwZWloBI7qycwVtk/EkaZGYyhsWOExlXEyaiSZIcBMdrENELwtBK/o/UIhty
	SgadWgZJIglHcQsC+bkq9bferetXV5WGhmNOQfqkpqkaJr8Jlvv2438ocb1e7J/K
	w8QZbFEswHuC5zU2p+j4jjhG2DBi05OlJ0qddJrM69Phow==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33p7rtt5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 10:20:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb7f9bb86so368301085a.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 02:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795256448; x=1795861248; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CXYi6ELkOoT9uHz5fc4tdk5+APeWmFmbN9MkRaxLJmI=;
        b=I4SmRsRlma3SMK+rKSJL6oxUDsho8PI6Z+NqJPyjYxpgHCsV/+YTzBSyiKOLlwHS2q
         33SlMQg5xL1Aeeq3D9rvLQNyG+HOtcJo/ff0TqLAKeL+/Z+avH9hwDRIV2o4UIMEIyj0
         45JIoXsv1S8fvHplMO4libW0Xov+tA098aenYPvbJhAJ4MQ2XE7RBxtKDt/6AS5P3Zx7
         AIsqcxGQalTAHYu25Nb+ggj29h2Tzlz6JScJk61dHxHCGfKxqX1TD240IELFMdpvCyGe
         C5+8pN9EPvIFHpH10m+UfHm8QwhZylTS6wVP3/T4CEEJFvhCyyqur16vdd3Xk1d2CgmY
         STqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795256448; x=1795861248;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CXYi6ELkOoT9uHz5fc4tdk5+APeWmFmbN9MkRaxLJmI=;
        b=CrABo9spNthup6YxGRzCzexFS2PUiEJQqVwAOIKXt9CE7r7YkK/qE7cwUaFXOOjYen
         hC6wcDg1TwqIkktJEM+kPWzL43fdgaTFc7do38A2cWXbiJgoLsDSoO3uh+r1xGF7gwjY
         r+EZws8nLGV8gbkFUgLIOThdqJvj6jeMCFVsRwXnwxPJfV6YUeBHIGhyDPMCsfkCCmgY
         TuQTNxSqZL580WvRkbZulJ3SqtcorSQ2CBydongoxcV0HcVATK/rzir4g5FXO7kxOVyh
         KV+Up7X798yIclEO7S2kN/c7jq92NgxgCoqQ/ag8f/lB9Y7BOntXGFmIngY51S6wb9ja
         HJhg==
X-Forwarded-Encrypted: i=1; AL+hErFHJOPoLzFe4kBG/kS7DwZ+/JSesLN7eKRq45mBJcrONNWtPDh+zuXa5ywDKk8EkAM1fa6d/QzOhyUTob0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vWZmFMJFmi73ln0tnWhmkR6YA4W+Ddg3+zv6YEIS/LsyWY5rP
	dZE5ydjTp71j97T7HgLq6xqI+m5pLyy25WPm0cS8VzwzE/ebznCfEhacoGb0FbIFxqo5xjkKQYA
	cYdTCWZBJ3ZAUk3VTeFHechAyPYW1ZfUk/OTsA5aXIaZH5aTQKyVpBBb9DMBQnrHV418=
X-Gm-Gg: AZFdTZfliZPt4fPj11iqW4FazZmfdCn32132m42bbLuWNOYaPBczlHBvDUupL/fhEM7
	D6o7eEhu495z1Iipvt/lMaJW3686tj6XvPRnNPPFwqk1GqfQDmTmVsFljSDLPEufGZqbuY3GXPO
	321+Bwnuxb0X9Z/ko2Z7nFo/vaBCEGWyFugHfTHnZQA7rZ7tNpcRTtCqheQNKlJaNWRKnkbMWcU
	ehOxLx08cCHwPHCAMpiuwS3q+T3ZFmi9TQ88wTD1Cn6FiPY2DTpeP1p8mxw3TuPSSgGTGN09Oqh
	Ahoj6ALTGwnwar8531SeuZfD85c2fO0HQFuulaALNIYLJ2V7IltP/Klmx+EmaMFneBplFnLoiee
	0wuRgdwsuKhyJoFA2MQo57ZAvT6Dkc64SoyzOi4pcpfU8h1O0f16+1jnHgCU9qXlN8aHgOndY+t
	kbqKBHO+TCR5wxWNTFL3hotWObMLU=
X-Received: by 2002:a05:620a:2901:b0:949:7473:b1ab with SMTP id af79cd13be357-949ba95df99mr898043685a.17.1795256447450;
        Sat, 21 Nov 2026 02:20:47 -0800 (PST)
X-Received: by 2002:a05:620a:2901:b0:949:7473:b1ab with SMTP id af79cd13be357-949ba95df99mr898041785a.17.1795256446818;
        Sat, 21 Nov 2026 02:20:46 -0800 (PST)
Received: from localhost (net-188-152-73-83.cust.dsl.teletu.it. [188.152.73.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90655f5asm49433115e9.1.2026.11.21.02.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 02:20:45 -0800 (PST)
Date: Sat, 21 Nov 2026 11:20:45 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Alex Elder <elder@riscstar.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
        p.zabel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
        fabrice.gasnier@foss.st.com, alexandre.torgue@foss.st.com,
        marex@nabladev.com, changhuang.liang@starfivetech.com,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: toshiba: introduce
 toshiba,tc9564-clock.yaml
Message-ID: <awFwfR6UZ5CRxb25@lore-desk>
References: <20261120183212.1264522-1-elder@riscstar.com>
 <20261120183212.1264522-2-elder@riscstar.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="74I8zLIQFI5Rhphx"
Content-Disposition: inline
In-Reply-To: <20261120183212.1264522-2-elder@riscstar.com>
X-Authority-Analysis: v=2.4 cv=OrHaWC/t c=1 sm=1 tr=0 ts=6b017080 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=mlS0om9xteqVCAF/aDpb2g==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=gEfo2CItAAAA:8
 a=ee_2aqc6AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=SNAN7obyeoS8sKvqHW4A:9
 a=CjuIK1q_8ugA:10 a=yYJo9gpscVuyvyc8L8AA:9 a=IoWCM6iH3mJn3m4BftBB:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDA0MSBTYWx0ZWRfXxOztiIVmCYX7
 YAsAi7MXHAgcat488VB6ARaSvcRRDtxwiZN9pikpEpZrjYKdbKcfn9cNBt2voi0OuXzOJnEWTi4
 oV1KdQ6x+g/009P+Hk+eODeH/c7qesY=
X-Proofpoint-GUID: qQyYapr4YfCMYjfGSnmIEbJLhxloZ2vq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDA0MSBTYWx0ZWRfX5dHosZUw59q6
 THMN5wxiLxW6GhCtDjMSxzk7Tf2Q9S2xczcTHJ7L748feXxDz7OLHuO5U3pNgEYp+zkK2BnAOKP
 VcC69TJGBlbr+zBvkys9SD4UZXN7Sc78XX8ARlt77I7XDcCyOn/O46fNxltKLCvlK7HT2JJjIvt
 4LCMXh5DBLNnXgHoB1ms389CWTRLjEW6VTdS/PyhV7xfu9ot2fETZaavsR2wPfc6f/S2KZIguOQ
 k6zRcYvkP2EaZYENAVsE/lNQXrbqFypa4r3LhI8vdehb675kyPDSr6jSEZbiCnlFBQuC7ipf4QT
 WMjVT2ZjamAqO07cwlKdS9hwfVfdcSnlChP7KTww4+QGCRD+0uy3iJImyGeuWye32SHqL9FR6gc
 DRqiFK72j0RJgKSBoET2QHWqi1eEdAvB4gKwm7Cs8BVy80mB0FdgJcGwTYRL7Nf4IxUH7uNz2VR
 ERwqA1jg8XcL2Qf056g==
X-Proofpoint-ORIG-GUID: qQyYapr4YfCMYjfGSnmIEbJLhxloZ2vq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_02,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611210041

--74I8zLIQFI5Rhphx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Define the binding for the clock and reset controller that present in
> the Toshiba TC9564 SoC.
>=20
> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>

Reviewed-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

> ---
> v2: - New binding that combines clock and reset under the clock node
>=20
>  .../bindings/clock/toshiba,tc9564-clock.yaml  | 73 +++++++++++++++++++
>  MAINTAINERS                                   |  8 ++
>  include/dt-bindings/clock/toshiba,tc9564.h    | 50 +++++++++++++
>  3 files changed, 131 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/toshiba,tc956=
4-clock.yaml
>  create mode 100644 include/dt-bindings/clock/toshiba,tc9564.h
>=20
> diff --git a/Documentation/devicetree/bindings/clock/toshiba,tc9564-clock=
=2Eyaml b/Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
> new file mode 100644
> index 0000000000000..e789ce8c6a3ac
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/toshiba,tc9564-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Toshiba TC9564 Clock and Reset Controller
> +
> +maintainers:
> +  - Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> +  - Alex Elder <elder@riscstar.com>
> +  - Daniel Thompson <daniel@riscstar.com>
> +
> +description:
> +  The Toshiba TC9564 is an SoC accessed by a host system through the
> +  upstream PCIe port on the PCIe switch it implements.  The chip includes
> +  an embedded PCIe endpoint that provides access to various peripherals
> +  within the SoC via its BARs.  These peripherals include a simple
> +  controller to gate internal clocks, and a reset controller.
> +
> +  The TC9564 chip has a single input clock.  Internally that clock is
> +  multiplied by a PLL, and the PLL signal is divided into a set of
> +  fixed rate, always-on clocks.
> +
> +  The clock controller uses two registers to control a set of simple
> +  gated clocks, each derived from one of the internal fixed-rate
> +  clocks.  A total of 21 gated clocks are implemented within the chip,
> +  but support for enabling and disabling only a subset of them is
> +  provided at this time.  Two clocks (I2C and PCIE) are marked critical
> +  to make it clear that they should never be disabled.
> +
> +  The reset controller uses two other registers to control a set of 13
> +  resets that can be asserted or deasserted.  Here too, only a subset
> +  of the resets can currently be managed, and the I2C and PCIE resets
> +  are treated as critical.
> +
> +  Clock and reset IDs are defined <dt-bindings/clock/toshiba,tc9564.h>.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: toshiba,tc9564-clock
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  "#reset-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - "#clock-cells"
> +  - "#reset-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller@1004 {
> +        compatible =3D "toshiba,tc9564-clock";
> +        reg =3D <0x1004 0x10>;
> +        clocks =3D <&tc9564_xo_board>;
> +        #clock-cells =3D <1>;
> +        #reset-cells =3D <1>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c00d3612c9acf..af088e1092e63 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -28683,6 +28683,14 @@ F:	Documentation/devicetree/bindings/media/i2c/t=
oshiba,tc358743.yaml
>  F:	drivers/media/i2c/tc358743*
>  F:	include/media/i2c/tc358743.h
> =20
> +TOSHIBA TC9564 CLOCK/RESET CONTROLLER DRIVER
> +M:	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> +M:	Alex Elder <elder@kernel.org>
> +M:	Daniel Thompson <danielt@kernel.org>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
> +F:	include/dt-bindings/clock/toshiba,tc9564.h
> +
>  TOSHIBA TC9564 PCI DRIVER
>  M:	Alex Elder <elder@kernel.org>
>  M:	Daniel Thompson <danielt@kernel.org>
> diff --git a/include/dt-bindings/clock/toshiba,tc9564.h b/include/dt-bind=
ings/clock/toshiba,tc9564.h
> new file mode 100644
> index 0000000000000..a0325b10b6c36
> --- /dev/null
> +++ b/include/dt-bindings/clock/toshiba,tc9564.h
> @@ -0,0 +1,50 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +
> +/*
> + * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights res=
erved.
> + */
> +
> +#ifndef __CLOCK_TOSHIBA_TC9564_H__
> +#define __CLOCK_TOSHIBA_TC9564_H__
> +
> +/* Clock IDs */
> +
> +#define CLOCK_PLL		0
> +
> +#define CLOCK_62_5M		1
> +#define CLOCK_100M		2
> +#define CLOCK_125M		3
> +#define CLOCK_250M		4
> +#define CLOCK_312_5M		5
> +
> +#define CLOCK_I2C		6	/* critical */
> +#define CLOCK_PCIE		7	/* critical */
> +#define CLOCK_MSIGEN		8
> +
> +#define CLOCK_MAC0_TX		9
> +#define CLOCK_MAC0_RX		10
> +#define CLOCK_MAC0_125M		11
> +#define CLOCK_MAC0_312_5M	12
> +#define CLOCK_MAC0_ALL		13
> +
> +#define CLOCK_MAC1_TX		14
> +#define CLOCK_MAC1_RX		15
> +#define CLOCK_MAC1_125M		16
> +#define CLOCK_MAC1_312_5M	17
> +#define CLOCK_MAC1_ALL		18
> +
> +/* Reset IDs */
> +
> +#define RESET_I2C		0	/* critical */
> +#define RESET_PCIE		1	/* critical */
> +#define RESET_MSIGEN		2
> +
> +#define RESET_MAC0_MAC		3
> +#define RESET_MAC0_PMA		4
> +#define RESET_MAC0_XPCS		5
> +
> +#define RESET_MAC1_MAC		6
> +#define RESET_MAC1_PMA		7
> +#define RESET_MAC1_XPCS		8
> +
> +#endif /* __CLOCK_TOSHIBA_TC9564_H__*/
> --=20
> 2.53.0
>=20

--74I8zLIQFI5Rhphx
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCawFwfQAKCRA6cBh0uS2t
rKhKAP462A+O+0d08oJ57bD0xi8kZxoMIy69AvPWSsVll1JMRgEA0+CAQJ89voRL
FIgXA/+1Tpy3ashRbhj7E1SQUL+mXw8=
=fQZw
-----END PGP SIGNATURE-----

--74I8zLIQFI5Rhphx--
