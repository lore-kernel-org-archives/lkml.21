Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795413684;
	b=GTrDNo93e5Dc9eFVzgNlvvwsOHOs//iNyTSqAaoQXa7xajXJsTlFnfUSWArUee/p64xC
	 o319QfCWyxtfFbCAEvMU9LwjbHi8iQs9lRJyo4niBSclCY4EyCKttukNJG2tFS7hYgW2F
	 ZL8OzNRRqZguH6O0IJN9AJFQ+OsFUseWYe0P3W/EHk5pqCNTku9Av2CBMR36rZHMl0IrK
	 xW7DYvERVXtRj0GLAvbdeODHB7uPMVvRK+ly1RypyXEjFnl/YxVj3S3i9gpUFlQN8IoN9
	 UmzMudyjfq+bxANoGNOIPFoYpODcF2yr5OM+jWsczbSIfhl7Zd+yZZ5E0uXrNCnHfmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795413684;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=z6xMM+SJMdqhpJSgog3XdQq/Hd6xOFzXoUOLDwQEggk=;
	b=u9Wkr82jgE+ftX8ZnshjCL9b4mjLhSlosDN7NLS7mHXU/DhW30R38rAKfbOEovlp4OSh
	 aeQyW3Y87MG163Pkzxue1OfNoxnuyr7uNWO80MNj20c1kkpQ8DPHHydR735yA9FNnQ9mX
	 23wY+101CtIJr/i6Wy7KvEVcOg0+lG/t5oKAyB3gfvR2kbbmyZwP1T8gIGbQjK9QeC85p
	 pyIF/lYCAWjPPnx+CzsbkM69E44FHlBDwnXnlvrO9PEAkYIx9ZJoqF+yCMzpvxOKDVqaO
	 303I4MHvxjWFmXdb32n71mFu5iECwy/iri2jEvumz6qzGQCz3qxMZVAzhD38lskj1ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XY3RLwAd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZUYtlpQI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB2A606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:01:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CB2A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XY3RLwAd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZUYtlpQI
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN50vlZ1960978
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z6xMM+SJMdqhpJSgog3XdQq/Hd6xOFzXoUOLDwQEggk=; b=XY3RLwAdMNJLfOoQ
	33PUtc4h41WLDZBNOHlBUAW5DD/OCUG8oUOuE9bhRti4z1EG+tQL+WALKvOVTFnG
	5IsWyzs406U5JUR+cLkupOaEmv2c1fwoCkD1jRke5NfPIfXeR7XQ+t2dIgMv9p7/
	o/sCeDU57fUf3asVmJyhB3uk0qRzSiuYB4+1cE8SLRFuUV8Bsx1UwojHvxbGLV8S
	rQXLspbDKX3BghQX1rVUN2R2PhqgHdbfA2Mw8Mmdd+BQABkK31QW3V4aKHz2qsXt
	xoKBSgrGsa3Xr79Evj8/qfel5UW0akjGP8k2CDPrGRwf/PSo58SjpohAtKPS0Iiz
	qXba7w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32a6nfut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:01:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b08aee6b3eso2743785a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795413681; x=1796018481; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z6xMM+SJMdqhpJSgog3XdQq/Hd6xOFzXoUOLDwQEggk=;
        b=ZUYtlpQIRO968iMCf4w/j1FSgNQaOCR64fmaDUsz/8FdrQJyUtPe1w556E5FTDFSXq
         rToQCOijUa+v2egSiEWiRmHm3bK0X77L5jz4koBQVJRjDyKg9s89VllQz14kRpWC7uuq
         oOhm/0blNqPA4mc9stH1zI/5Mp7E5kr8BBBUzR0w1MbASyvdqU9CCGPzyraC/+KTNkXP
         kfRcGpjqRMc9jCHDkxKYaw/fvN9feeIGKXfL/N1B8JM8Ekwezjj2l0gCV8OenAgpOq3m
         B0xo+bzjzYKmbmWrzwuA9/CrvwmXN2cDPf4fSXiab9mMNmak7ybmypBU62ZvlfdnGlHH
         o45g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795413681; x=1796018481;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z6xMM+SJMdqhpJSgog3XdQq/Hd6xOFzXoUOLDwQEggk=;
        b=XxBIJMVIYWuemnCfQKEoSHter0E2JqPi/mA6RKqn5SWfiaz8eg3ua9PfJzljWN1gdZ
         X6eV4srElJ6h3OL4C+YOmNK+sbFbSG5GA3Q3QgHO3MGKQDNboPn8Fk1EuwIxVuHrc0Rz
         etZmCj4hJPKAXTb4Wk66qtrWtnCWMhvSRt+UB2T+tt7u6K2vyWufWmXLrCZFwXF539tU
         UgGHrN0Hv7GZNGSFwR0XBrRicYml42kcj646tE7ReEcHKX1ltns6PrC0jlVtdP22Ip0/
         4yC3Fu3YMGrbwU334ZTJxOj9l5S8RmtD8sy5lUavk5p/EZ4+VaJZgOAmKSvF1CcGLtO/
         uzcg==
X-Forwarded-Encrypted: i=1; AL+hErEOKDiWakcIldZtM6qWIeQGwjVQR581vy0NHjKLiQlNesrDb+XKu5YqywkPY6JWf33uTKRDOkn3QWk05cE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0ECB3h3eg9NU74r1p5fxvRtX7RNce+ehh+siGPUFclz0+1wh3
	N085ynV8R/Mu4B3AY3rXJfdRYCSoH7ccDsM8yoXbrTqTs4ROdYYBFQ3ViGFJLzdsLuiCarfk2KV
	Gpey/UOtMmkm55/opL6k6hktLLV5uCM2NuadOscMiJXfbcGBp4mZD4oyO4xoRqrpOTik=
X-Gm-Gg: AZFdTZc3SV5UGZFP72EbxYJyONovSaESv7co1A6yX2/sG1oxj7H4ua0WC2htgSeqziu
	JYgJDXrqFSL/eC/k8CaCYJuAIUY8D97KRNIH4JVhmBdT77rsWNZKnD1K01kgFzjrkPPLJVdnlLR
	lgpJIdMBMhtcLKmnY/qUkdXUkkyYAesNu4f59uxZg0OlHn3N21EgEppVwpSROyvcNQX8rNpSwp6
	7YdTCY7LKfjxjBjVrd6xddsUGNywrhyqWHSA152YALh4ue+Bd5dWOeFwFAXeVkMQIzdHKS8u9OY
	u5iyVnWnDEAZlCwu0MoreYDTZeIRHO6kvO0Lq7jMikHohEYngpENx5+AK8ckBytqUhB9KuV62cZ
	1E9pL1qUxFwzJKKkbsNLuJnckFjMcQr/rg/C/DsL6+UWpkP7jYamt+c4cC7Bqx5GXpRvxQw==
X-Received: by 2002:a17:90b:4a48:b0:3b4:1884:984c with SMTP id 98e67ed59e1d1-3b41c7b573amr9780752a91.6.1795413680953;
        Sun, 22 Nov 2026 22:01:20 -0800 (PST)
X-Received: by 2002:a17:90b:4a48:b0:3b4:1884:984c with SMTP id 98e67ed59e1d1-3b41c7b573amr9780713a91.6.1795413680447;
        Sun, 22 Nov 2026 22:01:20 -0800 (PST)
Received: from [10.64.68.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcfe16sm16426806a91.17.2026.11.22.22.01.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 22:01:19 -0800 (PST)
Message-ID: <20276ae3-9b8c-46b4-9ddf-ffb39bfc3b0f@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 14:01:12 +0800
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
Subject: Re: [PATCH RFC 3/6] dt-bindings: arm: qcom: add QDCP STM source
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
 <20261119-introduce-qcom-qecp-feature-v1-3-b1a730d2c57a@oss.qualcomm.com>
 <30c74f5e-cd18-445a-964b-b839fc077b25@kernel.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <30c74f5e-cd18-445a-964b-b839fc077b25@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: E95O4i9xvFXMQuCgHm9I-xgZsc-tAhjA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyMyBTYWx0ZWRfX4RebzlXJ3shS
 EW+LM2oDlKqP4PdrQjVx+OiYaL00C0Up53agtxtAyN/ecXrXw70yQb4Ypd2Xo0ka907xda8pfmf
 8NUSK2X7OAAbr6rx0A5xHroIFnSjnmQ=
X-Proofpoint-ORIG-GUID: E95O4i9xvFXMQuCgHm9I-xgZsc-tAhjA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyMyBTYWx0ZWRfXwhA5BMfoK55f
 L6v7x3tJ0zN+ta9eD2gz8Sp8aBibYYQcmQQV18o+5+HgyUNia5cbRuvV7P8bAtfr6mmrCNRVOc3
 ZHE7+xoNBG2WafZNiFr/Qi0I6j4N44JKcYeg9r8pyzWDkXLY8qiwvjocwXJas7efC0tBEcTn4CL
 AouhvEZGqBgo2U0e9NWDNALW3LKaPjDu35zxl7uYjvWeMJcY7+JpTANo3HC6Y6QNl72jvhdB/Mf
 C31qoUHiiDtwOFpRUhh4uRFOqfv6sVfSt3SL1Pdw60Bo3r1993fWXK+oeRo7zNz63Py1UiUBENw
 YDtg4CNA05OA8EsztGSrvQOIJp7NNxBbFaWklO8RnYT5IPTamkQV7MGn3+T8Sv2DRzqukr8o3T/
 1hpkHo5XNdemRvN44cnEQ1xdkNgECIeIWvKLb2PWgAVjKlagoby0stT+tiwNLVoan914yhukMpx
 iYWzo+PU7f312iOYZuw==
X-Authority-Analysis: v=2.4 cv=UbHE26SN c=1 sm=1 tr=0 ts=6b03d6b2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=q_CrVRYiZK5X_reCBHkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230023



On 11/19/2026 10:02 PM, Krzysztof Kozlowski wrote:
> On 19/11/2026 10:01, Jie Gan wrote:
>> Document the Qualcomm QDCP-backed CoreSight STM (System Trace Macrocell)
>> source, for platforms where the STM control registers are owned by
>> Qualcomm Embedded Co-Processor (QECP) firmware instead of the
>> application processor (AP).
>>
>> The node describes only the STM stimulus aperture, the MMIO region the
>> AP writes trace data to. Firmware controls the STM through the Qualcomm
>> Debug Control Protocol (QDCP) provider referenced by the qcom,qdcp
>> phandle. Firmware also controls the block's clocks and power, so the
>> binding has no clocks or power-domains properties.
>>
>> The output port must have an endpoint so the source can be connected to
>> a trace sink.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   .../bindings/arm/qcom,coresight-stm-qdcp.yaml      | 111 +++++++++++++++++++++
>>   1 file changed, 111 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-stm-qdcp.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-stm-qdcp.yaml
>> new file mode 100644
>> index 000000000000..f365ce2450ad
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-stm-qdcp.yaml
>> @@ -0,0 +1,111 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/arm/qcom,coresight-stm-qdcp.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm QDCP-backed CoreSight STM source
>> +
>> +maintainers:
>> +  - Jie Gan <jie.gan@oss.qualcomm.com>
>> +
>> +description: |
>> +  The System Trace Macrocell (STM) is a CoreSight trace source designed for
>> +  high-bandwidth trace of software instrumentation, made up of memory-mapped
>> +  writes to the STM stimulus aperture.
>> +
>> +  On Qualcomm platforms where the STM control registers are owned by QECP
>> +  firmware, this binding describes an STM whose stimulus aperture is mapped by
>> +  the application processor for data writes, while enabling and disabling the
>> +  trace path is delegated to firmware over the Qualcomm Debug Control Protocol
>> +  (QDCP). It references a QDCP provider through the "qcom,qdcp" phandle rather
>> +  than exposing the STM programming registers directly.
>> +
>> +select:
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        const: qcom,coresight-stm-qdcp
>> +  required:
>> +    - compatible
>> +
>> +properties:
>> +  $nodename:
>> +    pattern: "^stm(@[0-9a-f]+)$"
> 
> That's RFC, so maybe you do not expect review. Explain in cover letter
> as the most important part what do you expect from us.

Acked. I should focus on introduce the design idea in coverletter for RFC.

Thanks,
Jie

> 
> Anyway, drop, I do not see how is this conforming to DT spec.
> 
> 
>> +
>> +  compatible:
>> +    const: qcom,coresight-stm-qdcp
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  reg-names:
>> +    items:
>> +      - const: stm-stimulus-base
>> +
>> +  qcom,qdcp:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      Phandle to the specific "connection-N" child node of the QDCP
>> +      provider (see qcom,qdcp.yaml) that owns this STM's control registers
>> +      and services the firmware enable/disable transactions. This must
>> +      reference the connection child node directly, not the top-level
>> +      QDCP provider node itself.
> 
> No, the QDCP is just part of this device.
> 
> 
>> +
>> +  qcom,qdcp-source-id:
>> +    $ref: /schemas/types.yaml#/definitions/uint64
>> +    description:
>> +      QECP firmware source identifier for this STM, used to address it in QDCP
>> +      transactions.
> 
> Drop, we don't allow instance IDs.
> 
> Best regards,
> Krzysztof

