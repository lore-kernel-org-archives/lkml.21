Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795347365;
	b=HWqEzyFWKokJqh+QyTSB4zp0R3cO1IXUu6YRAQ+DkRdJx8T4Jb2e5rSMEK6OZaFh8nJO
	 j2gZM4/2FHqE9f0omwCGb/qeDPhAzRCnh7uBU3Za4UIM5egpPDIBLwHxwnCnDPdqe44P/
	 sUaP5YAZNs8rOiVAVPU5XhDwinzPvRRBj9mFvHNFq1kH8eQIfG1pDGFEYFD6pfRONcKea
	 /XuqB0ai1c4UaZX8jQpYsFN/IG3gtvBa4ihj7yRCcloJTGqtaRyJGFL+fujeRGJ4OcsEE
	 JdjmffMJ4NTXZlyvA6v/pS/DjjGIZ+JYL/AgoqnvlwDGVnpK1ZXIeKxeeth+3TlwEYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795347365;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=muP6DUXg9dLTYnQcGiDX4DlIbKU6QaKtbQTgxjz4/ac=;
	b=GcJiieh3Nom6comUKS7gQTE/ckzcjIX1i+X4qk/k/GCvVq/n00N4IkekbpXnazbQ74qk
	 h5oaXjt+RPLkHhnS9EphYn6NPImuBc8bldUqy4tjpIXGraYbBzfrgwQdIqggePuu9a2Cl
	 69AYRIP//OhbudN4cnLVobpO7lDWmELaKJmpTHBM8F3LWTGPT5bdzBlbtDp76rAtwPGbd
	 rru/h7odlfXsFkmA/IgXeqdBtqpT5RWcsNZm0jKWm7cf2uUYMurxOWbiZHh0VOmNb7ou0
	 OjISkBMGIdd3YBrRtQngiLfAtVZGwmichy0QbbufxjM/lElByzBlCnCK/pYDlhoX4Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OoVMAZwD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Du7TtbHq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0A0606A331
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 11:36:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B0A0606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OoVMAZwD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Du7TtbHq
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AM86SXa971904
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 11:36:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=muP6DUXg9dLTYnQcGiDX4DlI
	bKU6QaKtbQTgxjz4/ac=; b=OoVMAZwDbDBmoUb8eL+mcd6tZqZuGBWTCaYdmzvH
	a4LczG6uBQdDCngULHnaLsEti630LKNx+rmTtFs/DtrydtD+etmxlurqOl60/gn3
	5HHU2BY5OGxG2VD2QNT6ZM4IcAsQEBWBConkyp8WWHj0heYkBstjxkcNanBWsPcH
	OG/DyLDsLAvsoi8fjVEgRoUsXnrvThzLU+KGKhUdDeFOLRG6iCmsk79EPQZ+qSYt
	PJblJILb8la5oFCW59v4HjjtHQZO3RHoH2RaiBTjKvuKhH19y9LLwsm/kyZJ4PxJ
	eWZmY1U2a5M9ztCfItMRjezgsGRXbsG1FfPJWtTehEIT/g==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j30nnumwe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 11:36:03 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b56c696405so2078339c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 03:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795347362; x=1795952162; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=muP6DUXg9dLTYnQcGiDX4DlIbKU6QaKtbQTgxjz4/ac=;
        b=Du7TtbHqr1vjCwWUmT+Gkp1MRR6z0kDHQ0awROW0/OoGhKnynW3K65dzjWb6dmyU/V
         iS0QBbi5JpEXDiZcsDzxsgMsQkPRth6t8jKTLZ/707UwSsSDPcZb+Ci1TWKRj6O2Lhll
         7L6zcQ+p3Z0S5l2kzgPZLX9Q3l8aF1FBfJDmI0OibFYtdCG+3u4q6Q2EYdIUyHOHCV5i
         /MttkT0EwY7FYygub2MPZtVEY8vlzglni8b7vxHJsn42VDxmmUMSq9bc75gltsdB32dp
         7Bgcre3jIhv2HAvJJvcbq10WZW/uBKWGWI+IgbLLxE9L5h0/sHMFafLrm5ijBYQ2kbuq
         5drw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795347362; x=1795952162;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=muP6DUXg9dLTYnQcGiDX4DlIbKU6QaKtbQTgxjz4/ac=;
        b=vcP9tr10PDtWoD1BiJcZAsUvFIHjANQv03El+dRfubUYVY/1tYrCudiana9xPx1Z/b
         hMvHqYCKBOxHTyzD9kvhBfnLo1X9LBfQfskjBiyRsUed9qC4y60NjYwsswidg0AS9Q8F
         u31mCoSPDcqoA25CBoX2qC86BovlPMm9GBr60QSBXJn+QHBvHC3DqE8fdtHvKHGghLO2
         mXP2nl4SCFGE+RYEo7ZUt2gl4QHv+sBoej4O7/AwscN9/fU8GTG0Te3FayjNRho4BZx+
         XpiAoClPxYO5rt/02wcl1bUJ4GEP7H4O8YNotQVVEhT7PyFTEqbmZrK7u+4M2Hdndssb
         XetA==
X-Forwarded-Encrypted: i=1; AL+hErGP90IKgCi4O6mKcKJx4ZX2T8gxMWsp+AL2+eRr1x/sNVmhMA5fnfuHuETPtjCRhKbv08gznmmMJUUfGzM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ONJFpp/zPOUL2oPKWUhRgekX8HJVBxGBunGPgmhXyEQd/4N9R
	0SOF5F+IkHbDPWbTRVcWHnGfLp5iKLMAesCXpKDfpJiD57onaEKBXGtfncTyszHAiOTOrD/5u2Z
	b5kDPjQ8OpGNXo9QjNMTr+VDejm1RnxglUSRT5PCXiD3F4D27ZRgI7rTT0PnMQlWHoS0=
X-Gm-Gg: AZFdTZdQ/zyAFOS3WOkmV34jDc0+bX46g+dEfZtBY2p/BH45gH5vMMrCEC5hUOXeU7J
	UbIJ4rHFZuvSogi5d0sAu34sYdO1Bz9jT/fCY3dlFhGWSel+4eB8js8kPleSJVcImH9gwRVDf2+
	Dp5YTSZrsHip7Rm6j/qJpNPdbODyNlo3gH6Ugr85UOte6FI4Ti1auuF7tmn4s6ZK9itEF5/jc5J
	S5Mhc8drx70cCDIje7W720Clgz3vSDpe/VXDW2as5WW3v+XxoTa8uqmfoCL/VcizV199KySxn2Z
	ujuC1WutlZBOusar0B8CCXuLfjN0a7lDoNn6rtfE66Xw8ZbjUKCgl8SCQZ0EKP3aKT6juRjRhE7
	za9pR7dAXzgNU6q9HIYoozEkaKRk6AxdXz7PqoTc9CjEv80YA4ImHOQZfUEXfqxk=
X-Received: by 2002:a05:7022:7f04:b0:166:af48:a2ba with SMTP id a92af1059eb24-1b5566fdfc3mr10202031c88.0.1795347362069;
        Sun, 22 Nov 2026 03:36:02 -0800 (PST)
X-Received: by 2002:a05:7022:7f04:b0:166:af48:a2ba with SMTP id a92af1059eb24-1b5566fdfc3mr10201991c88.0.1795347361468;
        Sun, 22 Nov 2026 03:36:01 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm23234990c88.13.2026.11.22.03.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 03:36:01 -0800 (PST)
Date: Sun, 22 Nov 2026 17:05:51 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v4 03/10] dt-bindings: net: qcom,ethqos: add
 qcom,shikra-ethqos compatible
Message-ID: <awLTl77S5Pj0Maok@oss.qualcomm.com>
References: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
 <20261117-shikra_ethernet-v4-3-c41902e5f2fa@oss.qualcomm.com>
 <20261118190745.GA198891-robh@kernel.org>
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
In-Reply-To: <20261118190745.GA198891-robh@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA0NiBTYWx0ZWRfX6gfQyk7poA8/
 0qcC+DJIME6ybos295owui+HOf3GR+bSJ2yLk+VZBB8mMV/7vCusHo/I60WoEBqKt55qXy0bsjG
 LLHg0vbh2Lhxnpaf3Djz0mNTkas0aBlfaC4Ew3oD9toLMDmQ9lZ/pseu/q3AfqBSZqGnzH9pOWW
 xZII8Hip1Sc8ZyelOR87WxxQ87NvAa9p85k/Ft9ae3XYRz4LOuGXAKqvgzII5rjyHAFXoXPRjko
 pWNnlerPPiqOtM4kqFlaUi1X2grmD8xXEUp2sUjAiaQBk+IBu/MegceoNSCELJkIxmvemfCCH3o
 CCDH9KADJ//SfWjxoSjc2eBEO9TEY50u/Y3pRvbVJggibXQUt+UOcbX8Bb3Hge2tPjkmtfqz8ct
 aSJvVQuw2PyMD1UPS6Mys+MYH1yrRfLtB/kLw8yVITEtDQguWhaN0M3nRmaMY5lyIDvuuRE6kpL
 flexT5tpRBNsnh4FV8w==
X-Proofpoint-ORIG-GUID: J_daTQGRW-R5aXiE8SToQCDJ8Osri5Fq
X-Authority-Analysis: v=2.4 cv=LITz05W9 c=1 sm=1 tr=0 ts=6b02d3a3 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=cC9zmzg-b8Z3h8VEsn8A:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA0NiBTYWx0ZWRfX7BbXdunIVsvp
 2XtWwtRcwZ6pGZBB29EotJKc+ySyK9v4KY510UL9Y5wBswY5SviQTGQ9fdcqnwrCVgHJYgJ1hJl
 kDl7SP2uVhylCU1m5JfEGW/NqDPhBp0=
X-Proofpoint-GUID: J_daTQGRW-R5aXiE8SToQCDJ8Osri5Fq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_02,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220046

On Wed, Nov 18, 2026 at 01:07:45PM -0600, Rob Herring wrote:
> On Tue, Nov 17, 2026 at 02:15:23PM +0530, Mohd Ayaan Anwar wrote:
> > Shikra's EMAC requires two additional clocks for NOC interconnect
> > access (axi-noc, pcie-tile-axi-noc) beyond the standard four, and an
> > OPP table with required-opps to vote VDD_CX to SVS when the NOC clocks
> > are enabled.
> > 
> > Add qcom,shikra-ethqos to the compatible enum and use an if/else
> > block to constrain Shikra to exactly six clocks and require
> > operating-points-v2 and power-domains, while leaving existing
> > compatibles unchanged.
> > 
> > Add the relevant compatible to the binding document for snps,dwmac as
> > well.
> > 
> > Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> > ---
> > v4: moved operating-points description to the top-level, and added
> > power-domains as a required property for Shikra.
> > ---
> >  .../devicetree/bindings/net/qcom,ethqos.yaml       | 54 ++++++++++++++++++++--
> >  .../devicetree/bindings/net/snps,dwmac.yaml        |  2 +
> >  2 files changed, 52 insertions(+), 4 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> > index ef520f810577..6bd4bded650a 100644
> > --- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> > +++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> > @@ -14,9 +14,6 @@ description:
> >    dwmmac based Qualcomm ethernet devices which support Gigabit
> >    ethernet (version v2.3.0 and onwards).
> >  
> > -allOf:
> > -  - $ref: snps,dwmac.yaml#
> > -
> >  properties:
> >    compatible:
> >      oneOf:
> > @@ -32,6 +29,7 @@ properties:
> >            - qcom,qcs404-ethqos
> >            - qcom,sa8775p-ethqos
> >            - qcom,sc8280xp-ethqos
> > +          - qcom,shikra-ethqos
> >            - qcom,sm8150-ethqos
> >  
> >    reg:
> > @@ -57,9 +55,11 @@ properties:
> >        - const: sfty
> >  
> >    clocks:
> > -    maxItems: 4
> > +    minItems: 4
> > +    maxItems: 6
> >  
> >    clock-names:
> > +    minItems: 4
> >      items:
> >        - const: stmmaceth
> >        - const: pclk
> > @@ -67,6 +67,8 @@ properties:
> >        - enum:
> >            - rgmii
> >            - phyaux
> > +      - const: axi-noc
> > +      - const: pcie-tile-axi-noc
> 
> These sound like inter-connect clocks. Shouldn't they be controlled by 
> a interconnect driver?

On other platforms, yes, the EMAC AXI clock is only a gate, and the
interconnect provider scales its rate along with the NoC.

However, on Shikra, the EMAC AXI path is fed by a dedicated GCC RCG:

  gcc_emac0_axi_clk_src (RCG)
    +- gcc_emac0_axi_clk              "stmmaceth"
    +- gcc_emac0_axi_sys_noc_clk      "axi-noc"
    +- gcc_pcie_tile_axi_sys_noc_clk  "pcie-tile-axi-noc"

This RCG is outside the Shikra interconnect provider's control.
EMAC DMA does not work unless all three clocks stay enabled, so the
EMAC has to hold them and also scale their frequency for the line rate.

I am hoping that I understood your question correctly, please let me
know if you were asking something else.

> > ..
> >  
> > +allOf:
> > +  - $ref: snps,dwmac.yaml#
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: qcom,shikra-ethqos
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 6
> > +        clock-names:
> > +          items:
> > +            - const: stmmaceth
> > +            - const: pclk
> > +            - const: ptp_ref
> > +            - const: rgmii
> > +            - const: axi-noc
> > +            - const: pcie-tile-axi-noc
> 
> No need to repeat the names here. Just 'minItems: 6'. I suppose you 
> might also want:
> 
> contains:
>   const: rgmii

Understood, I will make this change.

> 
> > +      required:
> > +        - operating-points-v2
> > +        - power-domains
> > +    else:
> > +      properties:
> > +        clocks:
> > +          maxItems: 4
> > +        clock-names:
> > +          items:
> > +            - const: stmmaceth
> > +            - const: pclk
> > +            - const: ptp_ref
> > +            - enum:
> > +                - rgmii
> > +                - phyaux
> 
> Just 'minItems: 4'
> 

I take it you meant 'maxItems: 4' here? If so, I will make that change
in the next revision.

Thank you for the review.

	Ayaan
