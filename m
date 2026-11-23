Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430772;
	b=S+fF0w4nnueT9FwULPhb5pLBBpOwNaFijS7Rr0pCbLnH2wvj2ppiMVZMPU8HCkXVVHXN
	 XCo4EBLRFfpAQ7tUAia7CDYxTCfLpe6jLvl9Mp8znqNEW98Zi8japyN9WYOznZRiylN67
	 oz7YigAY0irtfrCRZ06aM+gt73AmXoTTCHsLuBYVhhg7n1FTzA94ZKlf8R92TWx55wd9U
	 hIdtBaXp+/mUpjlaqS5DyzXXs1sHjkJYFV8EcK5X3cE/qPNbsYU/DrsGDPaZgE6X/XNpa
	 7eylEo4a/60WxjSWYrM8uh4c/WNv/Dhg1DFEb+E626BrZ7OXPbhwypAxnNnyAvRIUVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430772;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-TM-AS-GCONF:X-Proofpoint-Reinject:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xIqRuuyi3s4SC841Ot37hEBBxupspYSo1v4iRKPGuWo=;
	b=oGdhlBEBHYSlHQaQkHd09RL1TvNIYWfGVUCD2QTnL6qb0r/GDre0fjiGQSa7qo/XXwiw
	 dbxgHM9g/RjSNXsAmZKL2OsyHtV70PVfOnjiARjwHEzUPnfaFx5cMeoW8zfp9GT42blMW
	 nTXYV3MCTc77UTUkK/EdJOKv+n03gkiYNfq0dndQNS82Hdn1h9ghugA5ue1uzhuj+wWrX
	 oh2jSpako+Vc4CLpQ4UkTwlm3pGToWWWFe+RScubVzfnP68mtNw0dmuZ6DmQRXv/RiXhj
	 5dgyjOcHOvZEyzE2zN1lT/pH1hewG363xGY3NsZDgSIhzTMXgAxSDs3+gEEVtbhKnnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T8eNMmJw;
	arc=none smtp.remote-ip=148.163.158.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4683606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:46:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4683606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T8eNMmJw
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9YX1c3194393;
	Mon, 23 Nov 2026 10:45:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=xIqRuuyi3s4SC841Ot37hEBBxupspY
	So1v4iRKPGuWo=; b=T8eNMmJwE9RlUSpm4gPa94j3iz/6gi6WujSrHaOSFq7ieH
	sS4BWpaXmVv8kNkas+sGuO7cNQmfEzknjTMWBaRl1st/48UQXMAtNhbsYRPBE+CQ
	vlYuShTODi1aqhonxZTtysMCPmszg3PEFI0tLOeF7W7GgGtkak/F1BtZbe77fs4v
	k54Tqmtn1LonaX/WP3VWYfK7iI5auix64hGQIAyvX4Bb26MIxm+bA0nLpF4wQ45s
	RaTlZMOKfuflMnYbKMDzCdij/QD6AHeAau56h0G+cciHmGBN/j7yxFtRs6EnddS9
	i6ZvpE7aXxrlu5YH0xtMvzj0SoGUbwe3GwdxA5ew==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34gv2gaa-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 10:45:58 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9JHxB1708408;
	Mon, 23 Nov 2026 10:45:57 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4j3raye62q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 10:45:57 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6ANAjtRi32506604
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Nov 2026 10:45:55 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ABC9720040;
	Mon, 23 Nov 2026 10:45:55 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2E9AC20043;
	Mon, 23 Nov 2026 10:45:55 +0000 (GMT)
Received: from osiris (unknown [9.87.148.25])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 23 Nov 2026 10:45:55 +0000 (GMT)
Date: Mon, 23 Nov 2026 11:45:53 +0100
From: Steffen Eiden <seiden@linux.ibm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oupton@kernel.org>, Mark Brown <broonie@kernel.org>,
        Sascha Bischoff <Sascha.Bischoff@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 6/9] arm64: sysreg: Reject an enum value not written at
 its field's width
Message-ID: <20261123104553.20959-F-seiden@linux.ibm.com>
References: <20261123075219.369042-1-fuad.tabba@linux.dev>
 <20261123075219.369042-7-fuad.tabba@linux.dev>
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
In-Reply-To: <20261123075219.369042-7-fuad.tabba@linux.dev>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=CYCdd7rl c=1 sm=1 tr=0 ts=6b041966 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=IEvGn1zUL_vtJd7OkNwA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX2roCqqfTqkw8
 YEROHFQZ88IvlrCijNa5miUOeg4EVxim4+TWlmYUoVkjcbrShgur+68IB8xIYpznvYd3iorjuUp
 2HQRU4PRh4zrlr1Ue32xFdaMUkIoLCY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX2FPRqvNF3h9r
 KChK8u5v17NX6EmnrQK+2oQMkLb3cEm2E0YXQzzNnRnff5pDAuswZYx6yHr4XbQGW2lYSmoxFvQ
 bH/rSu89Y86ggNF1opMZ4HWP9m7mTPIaSJDSUew9XvahLS7xQZ9L1k6c4LXOrVeWQmuF9iiAfc+
 Tp5J5OZpIqXMxFn9WGTRStsfDcGml51+2Uxm96QAloGG3dOYtuiYUth4Ob9QdYUZiDQKkN7eIji
 35QoEXxvCve/P7hIKN0+zCQbWMTsjbS/+w9QZYwz/CD1TKCpH/nciTbLEr3Nv/7jlEe4ivQtUq5
 ezEfVYSlIZzUmdicQ21aofr4zToRIXtlrDCAbZghTDiyQsgsKIvej5O8qFi1gBOA2y2/634Xyjt
 OK7foVdUYOIf4DY6LNhx6zJ0aJXjihT5TT397rcp6c7I+m9Ku2awncg4sOIuCvCYQzkwHo8EGin
 BE+C8CqjVOaDrgEbZag==
X-Proofpoint-ORIG-GUID: xvXmXRxewmVX3uEZMer83MfDNwFp9XZn
X-Proofpoint-GUID: 49DySJUMN-cKB_jeklQg8KakNNn62Xjj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230042

On Mon, Nov 23, 2026 at 07:52:16AM +0000, Fuad Tabba wrote:
> The generator emits each enum value as written and doesn't check it
> against the width of its field, so a value wider than the field defines
> a constant the field can't hold. The duplicate value check compares the
> strings as written, so 0b01 and 0b001 in the same field pass as distinct
> values, and the rule's pattern, an unanchored /0b[01]+/, accepts 0b12
> too.
> 
> Require each value to be 0b followed by exactly as many binary digits as
> its field has bits. The one enum written otherwise is TS, a two-bit
> field of TRFCR_EL1 and TRFCR_EL2 whose values have four digits. Write
> them with two digits, which leaves the numbers unchanged.
> 
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  arch/arm64/tools/gen-sysreg.awk |  3 +++
>  arch/arm64/tools/sysreg         | 14 +++++++-------
>  2 files changed, 10 insertions(+), 7 deletions(-)
> 

Lets split this patch into two: 

1. Fix the bitwidth of the Enums
2. Add the new check to the awk script

Then the fix is split apart from the enforcement.

The actual changes LGTM.

	Steffen


> diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
> index 1843d283192d2..cde526896ed96 100755
> --- a/arch/arm64/tools/gen-sysreg.awk
> +++ b/arch/arm64/tools/gen-sysreg.awk
> @@ -367,6 +367,9 @@ $1 == "EndEnum" && block_current() == "Enum" {
>  	val = $1
>  	name = $2
>  
> +	if (val !~ /^0b[01]+$/ || length(val) - 2 != msb - lsb + 1)
> +		fatal("Enum value " val " for " name " is not " (msb - lsb + 1) " binary digits")
> +
>  	if (val in seen_enum_vals)
>  		fatal("Duplicate Enum value " val " for " name)
>  	seen_enum_vals[val] = 1
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index ebe5c5bd6fef6..5b587a7544e40 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -2919,9 +2919,9 @@ EndSysreg
>  Sysreg	TRFCR_EL1	3	0	1	2	1
>  Res0	63:7
>  UnsignedEnum	6:5	TS
> -	0b0001	VIRTUAL
> -	0b0010	GUEST_PHYSICAL
> -	0b0011	PHYSICAL
> +	0b01	VIRTUAL
> +	0b10	GUEST_PHYSICAL
> +	0b11	PHYSICAL
>  EndEnum
>  Res0	4:2
>  Field	1	ExTRE
> @@ -4300,10 +4300,10 @@ EndSysreg
>  Sysreg TRFCR_EL2	3	4	1	2	1
>  Res0	63:7
>  UnsignedEnum	6:5	TS
> -	0b0000	USE_TRFCR_EL1_TS
> -	0b0001	VIRTUAL
> -	0b0010	GUEST_PHYSICAL
> -	0b0011	PHYSICAL
> +	0b00	USE_TRFCR_EL1_TS
> +	0b01	VIRTUAL
> +	0b10	GUEST_PHYSICAL
> +	0b11	PHYSICAL
>  EndEnum
>  Res0	4
>  Field	3	CX
> -- 
> 2.47.3
> 
