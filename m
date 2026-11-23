Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795413570;
	b=m7huFumc29Vu0zYi0IL3prs/kqVtmssei+FzxmmjpqmxV/NDdW9jWO0WiFTeWsV2E9h5
	 UhGHf7qktBdbBxK8sp/r8053zXdmYcWVhD6dY004Cr7XPqG9Jyi9XJ0UD8ck+EorNHJ4f
	 8TosAKYL05gA+zaVCToEgKaM+1hQ95hlfabs1xbXqnCqQR/x3mu+qXIjpSU++NoNsRtq5
	 bKZfJaj45sxrktWaCXnZXzmrALMYm8Ag354VXaJKBtWI6ryOuOaMvdngod95dJXMxuUES
	 pAZZ9e4ttSXX+U1UPqMlyEv8+ue+P2eZc1heBN8vCR54sRV/1mP9uLqLcu0+nvliACA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795413570;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GGk0hd4f1xgs6CEflzyR83o9KzmIDk+D5Xl9w8H0RMQ=;
	b=0qS+XDjhZ/mYYayi/yVwiDfuo6f3fwkZmRj2Nm0tZ3shhid6g7P4iluM4juV/sZtG4za
	 Ot/UFh8UWP61xlWSMF26AwOCAK7TjrDPPAS7kXVSvu7plQeRZiyE27TALzSM2+MMBdoHD
	 DdrXb8epejvOHW0J5gs9nLtb+zDAIiL8NzvIBDDNONt0xlgfuqVB8alYJfFtUo6cgcGsF
	 QswFzrbYWDLhQJhlVbY2obkzy0pvLy7CGwX+NPZ2pWBxF44Rcfw/ZShuK89zEiGkxRWRK
	 b96Bi+1rCo34dG5ibB2/K/egETt0BU9iPLEImj1ge//6ZYQecISDAw9oSr/r5fojv4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="YoIom/1Z";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QvbPXOFx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB603606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB603606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YoIom/1Z;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QvbPXOFx
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN50xf61961026
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:59:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GGk0hd4f1xgs6CEflzyR83o9KzmIDk+D5Xl9w8H0RMQ=; b=YoIom/1Z1MBYmvzp
	3BMsq0z1iLk1XkSMylQB8BJDr8W/SHfvjDeinB3Sa+RcIPuK1dlfmsgvwKezUOsr
	LTkFy5XBtTgJLXFD9364c5JKNR5/T/HHVxGbgegXPON37xTPOp4H6hBwgTYp+oHA
	h58C2HFLUnRNkL+vfam3HrfO2AFPIr3X56cCzXnuRdRhdFxq021EXFFggV7DX+kS
	TugRHt1MNeOTi5UZUl7YJUPoVJeFs1M/kgIown3oQrsT+sGsgV0mfLOq4SKJ9SRM
	Gk/JRNtKrc3N7e9FIQV2ZtBduvB2XV/oAlSGmBVXk13FNUle+89JvOtYYxx1Q6CY
	R22osg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32a6nfkv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:59:28 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f0467a525eso21099675ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 21:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795413568; x=1796018368; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GGk0hd4f1xgs6CEflzyR83o9KzmIDk+D5Xl9w8H0RMQ=;
        b=QvbPXOFxAEB9JQstgf4nr3VdFe2oh35GivdUDTuYLvx1o6s1JRz9fGdTnHkBcE1K/v
         dvmQRE+GLAgGHcOE35pNYBplkzl/lBnXc/UBQ8Tn6dLYSJ380eM+zqWvhsnK0TWInPGF
         VvvenPt0VXQpCzjvJCwBMVE0AfINK0Y24i0RgvyxW4s4/YCsUVgBxVcvvlp727yF8er7
         +6/cjmaFgdu/X+MpULWZU/3d+LeM/OBtg41AV74QafmgU1hT+EI04Vt1mU0L2V31em+n
         YbR1mY95XBqZW7EHUGQNUdLFvJIaphssOvro2m8nCeLK4yIxaP3fsLnWg4GSvjEmib0s
         fA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795413568; x=1796018368;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GGk0hd4f1xgs6CEflzyR83o9KzmIDk+D5Xl9w8H0RMQ=;
        b=lEo2vjovgD5fyQUvGXk018iqFIE/FKE0DPciCuZyuB9nklvzHV5G6oQyro4zGA/zG2
         OJd05jgBR8GBxptsTIXtf68LtHFRwCKlAnbsnPHgdLK24uasL9CMP585CrGuY8yHkBP7
         r4kVWn0hBFSkVMLQDFUN+w0paPPBjg5vtjiCH/BgmuyHhdXVDc1qFpBcexsKzEb07QFJ
         HB5TxIHM2vrBx6fSOocEWnIHgS2wT0C12EGa+Y//eFSdEC7UhNRV7P6+WfQ836Xwkjx7
         XCo6MfzPj8GXSViO+JN9YgOqI1re14R7HmZdFgzTVzS7KgiFNCzzktopyrN/FVURCV57
         ADIg==
X-Forwarded-Encrypted: i=1; AL+hErHxnG7hGYTtvorp0d54TtmvxhA+L8vmPkHAQhDl2jnffB0oxUtVWwLHM9yh4DiZjxRnuK9YgOBBT2Qf7vc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8U61ip3SRIbQqmLxBZSYx7n/yG7XxkDOfZJkRbENRIyU4Qeg1k
	y9oaZjAtRfu1Vq3nlM/q3HU/EyF4YxGiR5PUjAuLZEJJ53Qzhlt78TjElrrriC0vOX1lve71g19
	yeLcZ1IMnZ4lA51UrEjewvQzEERlJOTMVT9mvL7h7GUt/5YdpW1sokfgFbjCJEWR5yMc=
X-Gm-Gg: AZFdTZf4iCI81EvoCDt4nrD/XAJ5UeG0QFM+32oa8iHJvDPz9p6ZUom0wQih7VypeaU
	ax0Q/9nE61YsgViCkLzWhA3A7+gNRlvAerv6JpHnIFur62qXUThaW6eg8hTZqAj3BowU1HAk5CC
	7EQGUP9LDIwq58xrOO8tIlsUgBfnykks6fj/9nfEw2hp13f9dZLwsM8c+JkRV7nKZKAXz3kl4I8
	1W1WsDSy7zop/zJzdP+rrS5S+B5b6ZwXTD0B6eqNxzlIc1icTh/5tuavtjtBFEOwYpJJIfqSFXA
	bRoO2HqviUYZoQq9gxaRcAVlR6QUlMiGSeL4RJOy+k2RJDjSvjmcGfCgZTk/rhTR8DEwI3Ul3pz
	YGJnBt+Ki+yqutfnujVQMQgsBEfCY1S5JqrW0WhX0aREJdQ0Tex3DWNyKoyOimI+ZdEIK9A==
X-Received: by 2002:a17:903:228f:b0:2f0:7707:2294 with SMTP id d9443c01a7336-2f077072a3dmr45183885ad.22.1795413567524;
        Sun, 22 Nov 2026 21:59:27 -0800 (PST)
X-Received: by 2002:a17:903:228f:b0:2f0:7707:2294 with SMTP id d9443c01a7336-2f077072a3dmr45183525ad.22.1795413567022;
        Sun, 22 Nov 2026 21:59:27 -0800 (PST)
Received: from [10.64.68.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1207f1sm46286895ad.64.2026.11.22.21.59.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 21:59:26 -0800 (PST)
Message-ID: <81dbfe3f-c88f-4fcf-a460-ba3376d736e9@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 13:59:18 +0800
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
Subject: Re: [PATCH RFC 1/6] dt-bindings: soc: qcom: add QDCP provider
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Suzuki K Poulose
 <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20261119-introduce-qcom-qecp-feature-v1-0-b1a730d2c57a@oss.qualcomm.com>
 <20261119-introduce-qcom-qecp-feature-v1-1-b1a730d2c57a@oss.qualcomm.com>
 <d0dd4fad-2f56-456a-91ee-737af0f3b4e6@kernel.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <d0dd4fad-2f56-456a-91ee-737af0f3b4e6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rBw9Fn5FcYA_rF9bvu7h1xSBJ2dLv4kD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyMyBTYWx0ZWRfX1gvXqPAhMgzf
 sWUWD+v16tqAP76W3IcEQFUEl7RENYtd71t9rFaWJjAnktim4LdnrJhH2KvNQ6UyG6uH3Vk+Em1
 USpAFxBHn4upKRmSV59PueMbAEqJzQ8=
X-Proofpoint-ORIG-GUID: rBw9Fn5FcYA_rF9bvu7h1xSBJ2dLv4kD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyMyBTYWx0ZWRfX0zqdtT4UKBeQ
 9snB44Cfzl/Np2hrfiguRftdZ+HdEWSqSfviHKW9eGZhHPWLW4by9M+ELLTF7G1O/E21jDVG4Ki
 chOghf7WaT9pz9No4SnQoDQB5u3hOtxO/H8qQEE02qfcpHVaUHNXDpzEM3tmKgOqtSsoUG/x64Q
 qA5BQkSPewmw7VkJ6qdI/gYm36LTh2+qX3pBGRXNS8x/Zo57XW1rt//QnpjtZa5KHvdjii+gS09
 K/UCxgEICgEPlabkKH9klETqgmx0LIsUiLqcciExGON8W7MB0AzkH6d/ytbkZEZaOfmMS9RyWFR
 Aa4f5HhS92mwvMsZOlGkc5GQHlJUDrQMWNMFbzkh0glMO5BTdVaUKHyR5Pg4QdRb6/6V7C3UJfs
 Zw+rcL8ZyjXh/nd0CEUmyjQuLRo8+DseLT3J9MGvH6gDEseNiNUQFDfdiv9IcR4n0eFa30Na4rN
 etueFMXmYP7CyybQN7w==
X-Authority-Analysis: v=2.4 cv=UbHE26SN c=1 sm=1 tr=0 ts=6b03d640 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=uD7aXjGElm0TJE3nPE0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230023



On 11/19/2026 10:00 PM, Krzysztof Kozlowski wrote:
> On 19/11/2026 10:01, Jie Gan wrote:
>> Document the Qualcomm Debug Control Protocol (QDCP) firmware provider
>> node used by CoreSight debug and trace blocks that are owned by the
>> Qualcomm Embedded Co-Processor (QECP), a separate on-die processor that
>> runs its own firmware. QDCP is the QMI (Qualcomm MSM Interface) service,
>> carried over QRTR (Qualcomm IPC Router), that Linux uses to ask QECP
>> firmware to control those blocks.
>>
>> The provider is a Qualcomm platform/QMI service node, not a CoreSight
>> graph device. It exposes the qcom,qdcp compatible along with
>> per-connection QMI service/instance identifiers; the QMI service
>> version is the only optional identifier, defaulting to 1.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/soc/qcom/qcom,qdcp.yaml    | 81 ++++++++++++++++++++++
>>   1 file changed, 81 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,qdcp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,qdcp.yaml
>> new file mode 100644
>> index 000000000000..ee0a66b12dde
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,qdcp.yaml
>> @@ -0,0 +1,81 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/soc/qcom/qcom,qdcp.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Debug Control Protocol (QDCP) provider
>> +
>> +maintainers:
>> +  - Jie Gan <jie.gan@oss.qualcomm.com>
>> +
>> +description: |
>> +  QDCP is a QMI-based firmware provider used to control CoreSight trace
>> +  blocks that are owned by the Qualcomm Embedded Co-Processor (QECP) rather
>> +  than the application processor (AP). CoreSight-facing consumers look up
>> +  the provider through a "qcom,qdcp" phandle, naming a specific
>> +  "connection-N" child node rather than the top-level provider node, and
>> +  issue typed firmware requests instead of programming registers directly.
>> +
>> +  This node does not represent a CoreSight graph device. It is a platform
>> +  driver that establishes the QMI connections used by consumer drivers such
>> +  as the Qualcomm QDCP STM source and QDCP-backed TMC/ETR sink.
>> +
>> +  QECP exposes more than one independent QMI service (for example, a
>> +  separate service used by remote ETM/diag sources). Each QMI connection is
>> +  described as a child node of the "qcom,qdcp" node rather than as a
>> +  property of the node itself, so a single provider device can establish
>> +  more than one connection. A node without any "connection-N" child is valid
>> +  but provides nothing for consumers to reference.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,qdcp
> 
> Standard comment - compatibles are not supposed to be generic. That's
> why you have entire commit msg to explain any oddities or deviations
> from common rules.
> 
> 
> No resources here, so this does not look like separate device.

Thanks for the comments. I agree that we should introduce a 
device-specific compatible string with the corresponding match data. The 
instance, service ID, and version are resources specific to each device.

Thanks,
Jie

> 
>> +
>> +patternProperties:
>> +  "^connection-[0-9]+$":
>> +    type: object
>> +    description:
>> +      A single QMI connection established by the QDCP provider. Consumers
>> +      reference this child node directly via their "qcom,qdcp" phandle, not
>> +      the top-level provider node.
>> +
>> +    properties:
>> +      qcom,service-id:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        description:
>> +          QMI service identifier for this connection.
>> +
>> +      qcom,version:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        default: 1
>> +        description:
>> +          QMI service version for this connection.
>> +
>> +      qcom,instance-id:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        description:
>> +          QMI instance identifier for this connection.
>> +
> 
> Please don't describe firmware contents as random integers in DT.
> 
> 
> Best regards,
> Krzysztof

