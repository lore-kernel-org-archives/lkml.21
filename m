Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795423694;
	b=shYenTyPK7rtdONZVCVH10E/QP0ef/vcInw9rPLuhzOtKFlNnVSqMKWr3e0g9mDaUTpc
	 krGNtLo+xuO/nFH/xCthUZaXWBTB0StrG6iwHJ2SgFMt2vU1OfCq8ZYk/zACyzG/s4V/C
	 9+Su5JjSVHqqMIeNRUUlO4dc6N/Lz8SACg5sTJ9QYcVHbJB7VKzWuOwvxF+Jy3qlx0fIe
	 qfgVK6GjTdBi2ysE2gl+CtN5vGnepUt5JlMUa8L1qO+ewhXXBIBgu+NnYL8hHWfFKcYk6
	 qfXaoEbZvrYHUby+SUgN4yu0l68DrNommMi88W6Cxl8YyIl5QKBWV/MGMjruNRqqNBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795423694;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-TM-AS-GCONF:X-Proofpoint-Reinject:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LTJZ6Z0BiW6sHaALZZ7IN+IFHkESfyt83jD2NHGY+AI=;
	b=1Y/ATxaQKUoSIEqYQ3DsbJYhesYS1EKvZ+VuT9xgJEaDYVjZ/NzJ15GQZh7gMi33zEKj
	 op9eQFMWyUg08rmzYy4hvSG1yrvQemiuRGlgvHuO7AulFPNTJcv1+Vwqp65mriln+JdFo
	 w1Odlm1Ei42D/Rl9KmhX/Z4DlptXAccXHjlHqmNzmxIh+ZX3GNQ2+l5uJ/HW8XqLQPNGU
	 pwqh852a9lityKgNS7HN+atdByZOJC95Hlpa7WMNdR/JkXcy2FqlMWurdFvtuVXXk4JJx
	 mhuy4r5UNxneHI4Xh2yIVVvnLUj6Ecp3E66LOb4h0VLQ6EwX0uckTNbSqMT4BbkbFxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YcJj10zG;
	arc=none smtp.remote-ip=148.163.158.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4072F606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:48:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4072F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YcJj10zG
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN54fD82633054;
	Mon, 23 Nov 2026 08:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=LTJZ6Z0BiW6sHaALZZ7IN+IFHkESfy
	t83jD2NHGY+AI=; b=YcJj10zGY6wChhmq9fch180g1AOpYPOFVLuZgSHhyI8985
	kcNL+rB6lqsjzTWFKsFDWJNaktcjRDypjFMDLfVbttPtU6i7A5yS9OEzBtEyick5
	Qgm6RZW7dykuwOk/6zpYbPI3zRamoRg+ceRVH7jJ064Gfpdd+fl+idi/E/uYPADs
	Djvpu/HwDRI13+Na2mxcO6KVoYqOsg66ZwNb7G4JAKUCwzvG8UNVcixM8moZJVXq
	6UkzuHq06oKDmV79aQTAV0ZDycD+9KqJVSDGGNCgfv5fLLjktQXiINWU2qDsC3q7
	Trp6AlNjNFnb7xWykdZArxeMzHFtLw3oXXheU0uw==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34g11yq9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 08:47:40 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN54Qr12487418;
	Mon, 23 Nov 2026 08:47:40 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4j3q4h5xa2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 08:47:40 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AN8lbjk44827102
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Nov 2026 08:47:38 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E1C6C2004B;
	Mon, 23 Nov 2026 08:47:37 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7D60820049;
	Mon, 23 Nov 2026 08:47:37 +0000 (GMT)
Received: from osiris (unknown [9.87.148.25])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 23 Nov 2026 08:47:37 +0000 (GMT)
Date: Mon, 23 Nov 2026 09:47:36 +0100
From: Steffen Eiden <seiden@linux.ibm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oupton@kernel.org>, Mark Brown <broonie@kernel.org>,
        Sascha Bischoff <Sascha.Bischoff@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 1/9] arm64: sysreg: Map MPAM1_EL12 to MPAM1_EL1
Message-ID: <20261123084736.20959-A-seiden@linux.ibm.com>
References: <20261123075219.369042-1-fuad.tabba@linux.dev>
 <20261123075219.369042-2-fuad.tabba@linux.dev>
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
In-Reply-To: <20261123075219.369042-2-fuad.tabba@linux.dev>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: HrrfkGD43JXnqT8diAfJKbosF-Tnrzfj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAzNCBTYWx0ZWRfX9KMEe7uYL4Xi
 zD9Wan/8eG4I0Ka/Sqc/bIAUDbbOmCDXIOht5F7qm9BAp0yVBvgrRAAM5+mxY4saJZkROdj9eRX
 Y6JOx8A/oQsbBQjZSPkBUhyn4VsUTh0=
X-Proofpoint-GUID: xo2bGLz2kMWEJJn6hlKAJ2ud1k0Gr6xK
X-Authority-Analysis: v=2.4 cv=c8M+0h9l c=1 sm=1 tr=0 ts=6b03fdad cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8
 a=pjIY73NwuUxA7bRLkYsA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAzNCBTYWx0ZWRfX1CzLx2JdkU3b
 NbzFxju0KVlmEIXZAT9TpsLI2m1eRfMM7VUqIjUnzZ6m/Zeo5ar7MMc7n/eIlQLy1x3V+lcW9iW
 C4OP+Gp1rO4KQdQ2+6Na9LuJFp7Jca6CfrmrGj67KsEyFMSBLNGFPpCqfYQyxHOBJ2OqgNErNc/
 yb76pZ55OdKVFmXZOVw1CdPbudqCCLWSDvq6CdppwTcmkQhuvHdxL14EtwZQjesc6fWJemrRKMR
 KQ0lGDYQVjTpDnBsB7APgv6YMZLKiHHrUsGdnb3dL9Z2mqk7uLcp4fkD0ElBLpCvXjHUYldjJjV
 DNi1H53IYhLlzDOWNece0O++Gd3wEM8+vagqjYCnFj3OC2IgARc48sNnwcajfhG4fXZrLFrxUVX
 iaZRcLyAlAxu9dGhTm5uT3rvoio3kUwrzeC41E2F10q6m6ZJK4z4A/KYga4PkKSknPAnOPgbXQZ
 qu5NwTJgfvQX85JdyWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 malwarescore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230034

On Mon, Nov 23, 2026 at 07:52:11AM +0000, Fuad Tabba wrote:
> MPAM1_EL12 is the EL12 alias of MPAM1_EL1, but its entry in the sysreg
> file is "Fields MPAM1_ELx", and the file doesn't have an MPAM1_ELx
> block. Since commit 6ae7fab7d9d33 ("arm64: sysreg: Emit RESx/UNKN values
> for Mapping/Fields definitions"), the generator's MPAM1_EL12_RES0, _RES1
> and _UNKN expand to MPAM1_ELx_RES0 and the like, which aren't defined.
> They aren't used yet, but the first user would fail to build.
> 
> Describe the register as a mapping of MPAM1_EL1.
> 
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Reviewed-by: Steffen Eiden <seiden@linux.ibm.com>
 
