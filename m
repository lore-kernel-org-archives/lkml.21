Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789609;
	b=eFSg/W65kSh99VGTPSCsHESt+LBG46gxBZBFzU3aBoqpTHzjc1rjpkKi8QD8RPkmYZ5C
	 19N2P4vUdYpfvmXcoCESuVcrkNTFCagqtKMqXs7yyBEuFt/VbEXFlJvObJM4aNJl+VBGo
	 7lDNEDPXG0UzJXHjyJzYxlK9XZ3rkP5zpGkTGPw7AvbZ49/8xdl2UezfeL09qzps/vHod
	 Is2+CHT1eDh3C4EXytySNUtCQpVuMrJGdTSYOS9f8vZ+e9OoDtI/Y0HgywP72tgsbb2x6
	 TxrC4lqSAfw5Sv0+V7AYFMIqsrW+bWAppYSPksCZBL5tE0cAcopAkjGvSdvWQs0dTwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789609;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-TM-AS-GCONF:X-Proofpoint-Reinject:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nw4O8lnteDsmTZKki2W+UXQHWVsC/shTOH4ogbkSBlE=;
	b=jZatZtdW7ZpaO4jthGewB/bu/w3b3jQW1fGLwwB36BHyj0NKuD2rQj3YDJ7j1f6sw9ul
	 cZNBiUB9vQPYtBAUcEF9NuElyA93D1N4/kapjH1Rxgh4gHXTaqAyFlMy1v5wOnPykfW7g
	 Y37VaZSB+YSgcPJr7oZGX8eDw4BFv2RpuKrAGQTpTR2qfweMuCjUNfDr0vAOur+I5rdPw
	 80GtQiXeQPrQUm1lyrKLSp320tAMfmHYFW4GbYf0FB0HSPKG83OoRTif7ZeXwaWyXc1q+
	 +eAT4VOkF0HRILScZgSZ8Vd3VbfYs3LXTPVkpO2m3sTZFlP8eONMP8lcdazhqbKs4DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LkVhibND;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4216071E68
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:26:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B4216071E68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LkVhibND
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE4l6e1650370;
	Fri, 27 Nov 2026 14:26:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=nw4O8lnteDsmTZKki2W+UXQHWVsC/s
	hTOH4ogbkSBlE=; b=LkVhibNDfZp4vayKPmE9hbDLrlsjYEX02wn+5z2GGXTt6e
	n+moSG4lnDZoGFHdUSfaVICiPTqDHtWNuZZoMWMvw9o9hllBkUfdV029wkfSgefh
	SsDV8fi/HnBaxmI+BoOgQlQzk1KY3YBhwafoin30HdgZQj0vjyw4IpeJ+2OZu5ib
	Y9J/6Sy5lcDsOS7yXUjkQeBc3hRg+GpdZ7dey9VZwcHnjuilW+keSp1QCr9bGHGV
	zO+3PkWOth7Qmtue2lnRyXRtv7eiFKKVOxcv77Un4XzVErSg1Va7l4Cp9moU03GG
	pstAxT+xasiXx/4vmAnt8VDKTxpWPLNP8vsBE9Pg==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34g3p801-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 14:26:23 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE4EO43998998;
	Fri, 27 Nov 2026 14:26:23 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4j6x3h2ff2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 14:26:23 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AREQL4t48038280
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Nov 2026 14:26:21 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4121F2004F;
	Fri, 27 Nov 2026 14:26:21 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CA0BC2004B;
	Fri, 27 Nov 2026 14:26:20 +0000 (GMT)
Received: from osiris (unknown [9.111.4.254])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 27 Nov 2026 14:26:20 +0000 (GMT)
Date: Fri, 27 Nov 2026 15:26:19 +0100
From: Steffen Eiden <seiden@linux.ibm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oupton@kernel.org>, Mark Brown <broonie@kernel.org>,
        Sascha Bischoff <Sascha.Bischoff@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH v2 10/10] arm64: sysreg: Reject a bit position written
 with a leading zero
Message-ID: <20261127142619.333656-C-seiden@linux.ibm.com>
References: <20261127074426.50739-1-fuad.tabba@linux.dev>
 <20261127074426.50739-11-fuad.tabba@linux.dev>
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
In-Reply-To: <20261127074426.50739-11-fuad.tabba@linux.dev>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=SoQFe/O0 c=1 sm=1 tr=0 ts=6b099310 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=VnNF1IyMAAAA:8
 a=aFQD6YNGmoihz_4X8V0A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NiBTYWx0ZWRfX9ZgY0AlBZ9nf
 6rDuLqW4pMhFta41W4xcz9fGgQpoDV1zGA5ImXe4JHVkKLCEwsN3EAmtC9QVPZudw6GbMLgsnlX
 JUOsPQNZkby7mULQMa/YdJMAmlrjTRw=
X-Proofpoint-ORIG-GUID: NYG4igp2Z9_lsY0kOCegrtTI4UV8_ZRk
X-Proofpoint-GUID: ZUWCThpP_VK8kLRC2RQEP-p-EjStnJWF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NiBTYWx0ZWRfX0j18FS2q7fTf
 6lndbY3rLYqRWPdk56Zuak01oDZyqqi37PnQWoTjwbzFKcpx8w1OdZbSZLPywZRIOHp5bhpdu3T
 2QKtId7A7jr8mY6oN1lGq+i4oWRcYzjfuyXlZttKznFB3a7sdNxM9ZrUljZA5OahyFfTEZ24YCz
 d6Y5UmLH531ugIVgspktEIGt4IazFtPz917SkpIT9jNOU96ZNLee3Ivv8BXx8HIIb5v0TnkuOmG
 dDkL4mZKfDtUnRBwu5xdSaQB8iozTdb+LLWTg4rG9O2n4d3rPr3e4nbpOe9+CbfUv57/uAK0zLH
 1tKJdTnw9OPYzPvwONspSs/wss51bngZXeeHZjogTbAKIneb44ibzO1RoqgjVnXLueDfHVZ/xdD
 ZRRo+FFBlW3lhDIccasZyg8fgyvYaxaIZxgwEbTOuYidaea7zoXbVpZX1vnKMI0inE8pV35cq91
 mnKBuXNBzk7+6vsQu4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270056

On Fri, Nov 27, 2026 at 07:44:26AM +0000, Fuad Tabba wrote:
> parse_bitdef() reads a field's msb and lsb as decimal and checks the
> layout with them, but the generator copies the digits into GENMASK()
> unchanged, and C reads a leading zero as octal. "Field 63:010 A" is
> accepted as bits 63 to 10, with the next field starting at bit 9, while
> its mask is GENMASK(63, 010), bits 63 to 8, which overlaps that field.
> 
> Require both ends of a bit range to be decimal numbers without a leading
> zero.

Nit: technically, this is testing for non-hex numbers as well.

> 
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Reviewed-by: Steffen Eiden <seiden@linux.ibm.com>

> ---
>  arch/arm64/tools/gen-sysreg.awk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
> index 057dc98082b5e..103420b58d24c 100755
> --- a/arch/arm64/tools/gen-sysreg.awk
> +++ b/arch/arm64/tools/gen-sysreg.awk
> @@ -102,7 +102,8 @@ function parse_bitdef(reg, field, bitdef, _bits)
>  		fatal("invalid bit-range definition '" bitdef "'")
>  	}
>  
> -
> +	if (msb !~ /^(0|[1-9][0-9]*)$/ || lsb !~ /^(0|[1-9][0-9]*)$/)
> +		fatal(reg "." field " non-decimal bit-range '" bitdef "'")
>  	if (msb != next_bit)
>  		fatal(reg "." field " starts at " msb " not " next_bit)
>  	if (63 < msb || msb < 0)
> -- 
> 2.47.3
> 
