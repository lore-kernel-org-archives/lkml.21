Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789533;
	b=ITNAXwudQXYVYHTJa4WI+GD26PyhgR2ycV5Cz+fY4NezrOjRLcrP3p7o2ferj9Xg1fzA
	 lBhZX5pGMtJKUL1sm9p9/fo63Rd5hjBZF2g8FQ5nMBXlyx9m/sZSGKC3YCA41YtJ3rPs5
	 gCzze9M1Qhymdwot/6/xfWT1/TbEyp0Eeq6OJvUzljzg+jrSPEkeDNaFwYRtChjb4jdym
	 iD2e/2ZY1LkBqSyJ7rguefc8r25lG25/IlVtVBZdvt7oQ4dnvJQKj582xVV2xvgn9QtiB
	 Z0Czm0X4OXiWGqv9W+9mxdIxqBP6KXAWQBp4EZb0qSLb+BIhfMorQ2q0iux4CZrTmlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789533;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-TM-AS-GCONF:X-Proofpoint-Reinject:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=69Boeb8mRxWk2/KhwOa9TkdVF7ruaVgxWOjUsLjcTpc=;
	b=d4wVbv6ui87SaEC8Y7N3DD1l6Yms+4T16zXsM/yzBC5D+c78FS7ir8B0Ns11Q6GFuihG
	 9NKo4As5XZmjhXKXErKAoXFWbblwEAOvQDAsPxEwsFQ2nnMrJ/CtrLTXryp34OQohGXQL
	 iaiOO1qLPM6W0KOVgBB3xI9uqe1aQOP8zaFlNCQ0hkQycvg01eeFEQj2/jKl0rMbUzEE2
	 4M9V7gXSMHqSHWiLVgJf925YPbac/mLm2wW+Cvlata+hBZ5oXFlPOTxoyBRrMjb+9o6LD
	 OYXoFB8pOglblKjw24TTJnPMxSS7h9CttoIOUM6k3Bl089LCx5dQNhoJgTcAjNysBlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZDGkpVFV;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BFB606C2DF
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:25:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41BFB606C2DF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZDGkpVFV
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE4Uga3419210;
	Fri, 27 Nov 2026 14:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=69Boeb8mRxWk2/KhwOa9TkdVF7ruaV
	gxWOjUsLjcTpc=; b=ZDGkpVFVChFEKR0+HGRzJNBYnhG2tJ6KTUrekOfkh3eos0
	JWtb0Z439xqCSM7cyeu1A/nM2TXkC8fEKHd057aD14q6MzaJ7blsCwHu2UreD3oU
	O5Ul6pxJyK6yDdSNiZ23nrb5W/clPsNSkl3lUjjEJHdRzoyFyZy6ZDFA5LNYBnel
	+VYgJnovTEHQVB8TcP7OlJBU/4ArwzFoduMqt+3KavLA8ZeItoqAlZS386gX4wzs
	rQlmKsDxPrtmxgQycpb/uHIQDKZzJAq7qXxVO1yHarRgLMYI24mmqEEYdnIdC1C5
	u1oSkPGLSnyUjgbrqQlMW7SCx7CaUJQhmt+mV4aA==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34fap8sw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 14:24:54 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE4FdU3892940;
	Fri, 27 Nov 2026 14:24:53 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4j6ucctxb3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 14:24:53 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AREOpbt46465342
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Nov 2026 14:24:51 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5A4CC2004F;
	Fri, 27 Nov 2026 14:24:51 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BD17B20043;
	Fri, 27 Nov 2026 14:24:50 +0000 (GMT)
Received: from osiris (unknown [9.111.4.254])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 27 Nov 2026 14:24:50 +0000 (GMT)
Date: Fri, 27 Nov 2026 15:24:49 +0100
From: Steffen Eiden <seiden@linux.ibm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oupton@kernel.org>, Mark Brown <broonie@kernel.org>,
        Sascha Bischoff <Sascha.Bischoff@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH v2 07/10] arm64: sysreg: Reject an enum value not written
 at its field's width
Message-ID: <20261127142449.333656-B-seiden@linux.ibm.com>
References: <20261127074426.50739-1-fuad.tabba@linux.dev>
 <20261127074426.50739-8-fuad.tabba@linux.dev>
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
In-Reply-To: <20261127074426.50739-8-fuad.tabba@linux.dev>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NiBTYWx0ZWRfX6LfmeZNZiicE
 U4DgzlPoQRTCYs72LTqt3tDI3u6sxFY2U7LRAj4ChcxmDKaJBnr1Gam369GUhfxxfGlHFyhcnfx
 T4UETxjBTmIft5qNMb5NpqiFmiLCYyOo48UUZBHtkA/euwk4FT5t/Jh81/xJ9Bp3lylhvnjSGSp
 nUtuzN9pwMtbrChsMnHeADh9r9QVRWUvysYcoic0wuKCxLQukGdVgPFF/9adR1eBBDiA+tctaAw
 YVwr7piFOpyWgCF49y5Jm0MIaGEYUklwgWpEdIadrHYxBsgQTibn7MwlL/+u90TrsYD7xKiNxY/
 I3Nc78wNC8pdGNyayldUxw8w97ShQ7aFf4ZdNzUnNF9EvmGjxZiZw3xJW529LFiUbB+F16TYEoJ
 KIi8ZQXs5rVfVm56qq0s9/KbODoBCN9ITJDR7vZ67ZFvkOfThYtZNf3OKOHiBjZySWucuoRtR+h
 v6sP3aoSsZTjOCisxHQ==
X-Proofpoint-ORIG-GUID: siIcS3kY0a9R8TElJG9AbDqR2B53cKyZ
X-Authority-Analysis: v=2.4 cv=U6QHnuru c=1 sm=1 tr=0 ts=6b0992b7 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=OUEnCn56XahdxCnzIxUA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
X-Proofpoint-GUID: Qbkhe7uRqyNltyMZpenIPvCIZr7g46S4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NiBTYWx0ZWRfX1iX6K8X+ZL+K
 cKMF7vFrETr9bhI9wF0NtTNdLUDYvkLgsG1M+MISam7qTP+nDfS6whkvPzLVCRXM3nsOCtSGhZ7
 KJFWd/Y46FIn8vY+szd1/vYdou/1gBM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 impostorscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270056

On Fri, Nov 27, 2026 at 07:44:23AM +0000, Fuad Tabba wrote:
> The generator emits each enum value as written and doesn't check it
> against the width of its field, so a value wider than the field defines
> a constant the field can't hold. The duplicate value check compares the
> strings as written, so 0b01 and 0b001 in the same field pass as distinct
> values, and the rule's pattern, an unanchored /0b[01]+/, accepts 0b12
> too.
> 
> Require each value to be 0b followed by exactly as many binary digits as
> its field has bits. Test it in the rule's action rather than by
> tightening the pattern, so that a value such as 0b12 is reported with
> its field's width, instead of falling to the generic "unhandled
> statement" error.
> 
> Reviewed-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Reviewed-by: Steffen Eiden <seiden@linux.ibm.com>

