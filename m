Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431712;
	b=Qr2AaPcPubqVOd/EAOvHVA4A3OWIl4wb0XOKf2feM2PtLk8PkxzaI0Cgpm9UB7xeEgZK
	 o+xp6XFMPe71VUUTiXIUsIU1UIGZOdXHu3F8ZnxBYl+4izBep8D+iiW9T4PIwgCRkWPkx
	 wDQswMOhFCD1R9d0WgVtG3GSApo4FiPXAA///G4NRgn+r6n7plqxGPcf2p7IxdcV3dTuj
	 CFpNrOsM6pR6CmQV6m0ZQvYfvuvy41xWKbrJE9uQgzRbnX8osRqZ+ix4coaoyNykrvu0q
	 HI9CtK+VD6YA0eX9G2YrHAnlfZdyLBm++JsS4zu0Gh8J8QCUzUQVEK+AAmPfgof5Wtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431712;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-TM-AS-GCONF:X-Proofpoint-Reinject:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LgD3nSY1257E1IsY6TfVWiTgP6c1xTVWYijnR0FS17I=;
	b=FR9fXFvKaHn8SnC0GmcDNjfhA08oAP9xkcZwm4gmqNiJL9fH9qAEidF9iY42RtfakVL2
	 Uc7YVu4H82zvUBGz69SrLQwhB8HiWw0FWdOd8nbAUToXzqJPGzIiqkL4AEvoENYf/Cqdj
	 SarmL3u/w2zqHkWz/gYY95i1437ADCqIt0Ayn9n/o5Ua/MAD8BqFCQqTXbhinRn6hrDBg
	 Rm9/MCrcLc3GWPj7XSursNHicgHSqtQSqIGcwC105Ox5Vur3AHGIBrnCiqF+CcUzeKBgd
	 CFHbv0PZ5ALcYkqWmSM7+4mGxzDiB0rj9bRANzFqcA75RA3kqder9ZxD3ZNKbU+cjMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Oh6yh5Nj;
	arc=none smtp.remote-ip=148.163.158.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFA8606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:01:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AFA8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Oh6yh5Nj
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9YX2n3194393;
	Mon, 23 Nov 2026 11:01:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=LgD3nSY1257E1IsY6TfVWiTgP6c1xT
	VWYijnR0FS17I=; b=Oh6yh5NjKX5dY7LTgUjrDCDC1ri44Coy8lb3EjIxQUnpzd
	4cpcAeNy9wrcbU1YHQNNyzU0cYvy5p5u+bRrwKb8vkwCOQddbYZhAkOcHySgnHqA
	MTrM8Jk0lc2g+oGb1O8NNNSGbFrdGLPQf1/EW57ohHX2coXTTt9oxqI4OTugrAY9
	+6W2eZCRqnnkAeVzqhho/LfJvY+wqIKFg8cva4Om+ZS3MH7ib9gFwxOa+oCerDIJ
	RAaunIiK5xfQSoUYDZ7MaFBGplcsHHYd7AwEvkemplUyTS+t2ns00gtGbxkaxtfu
	MYJsY5h3Kl8ZTgW7qUV1Rh3jP2THei3EU1w4xNDQ==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34gv2j7t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 11:01:34 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9JQtK3089101;
	Mon, 23 Nov 2026 11:01:34 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4j3pmjxhmb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 11:01:34 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6ANB1Vkl6553884
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Nov 2026 11:01:32 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B8AD02004B;
	Mon, 23 Nov 2026 11:01:31 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4CD2F20074;
	Mon, 23 Nov 2026 11:01:31 +0000 (GMT)
Received: from osiris (unknown [9.87.148.25])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 23 Nov 2026 11:01:31 +0000 (GMT)
Date: Mon, 23 Nov 2026 12:01:29 +0100
From: Steffen Eiden <seiden@linux.ibm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oupton@kernel.org>, Mark Brown <broonie@kernel.org>,
        Sascha Bischoff <Sascha.Bischoff@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 7/9] arm64: sysreg: Reject a macro name defined twice
Message-ID: <20261123110129.20959-G-seiden@linux.ibm.com>
References: <20261123075219.369042-1-fuad.tabba@linux.dev>
 <20261123075219.369042-8-fuad.tabba@linux.dev>
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
In-Reply-To: <20261123075219.369042-8-fuad.tabba@linux.dev>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=CYCdd7rl c=1 sm=1 tr=0 ts=6b041d0f cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8
 a=bDhmL7OSd28iwCYqBswA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfXzzrzawKL9SDz
 Db84+zU9vjDAQYV5VPZBZEJRoJONrtPTPMYX20I2oB+ntWsUyW992oN49j4qXRbGwKD4PfAh0Nb
 VlcSPeZCOL/vhl+fr2bdDmiP1tcCw6E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX1eEajBdoVUsK
 TniiyViTaxfwIfHot+IBhSZnOGRwtk7Xr8W7hbiUHgJLGh66Fk7ZbZUyjakR6Ugsfj/+5wrb1xL
 pzRYkT9DFYuaievpr90JXLnJBFuNhGgNvWU0EP0kNSTbhj3V5LSW48N3SLTWW5JZwHIZ+O4ZXen
 ZmqcCm+gduWLlSkxrM2by4GLFceq1BNF8dWUl8xPwy4H2d5vq6QFmG0Cd3oWF3O2NVgCwh6/SaL
 KfjivN2BmS4IAtyUduF9G66AhlNczS80dk4evKkOHdvgi+DPcJ3niMsL6EMSbTK93dvxATi+K6V
 MjqWCAkKQXWJOx2Q6paHtUg9IZr648nLrgHLoehtn3Gpr9Y3ZYdo2tGUg9ZJ+2HbP5PmSWhy0BX
 S6tHFmzFdYhsshBnOBIFyKlYPteaTm2IuYD8iO9Zp0ScR/3df0r2aFwL/c9CQuDNPFg1Or716DP
 nzSWoeHnGecxpte12OQ==
X-Proofpoint-ORIG-GUID: E6WNZgee__Cn0xmamNsHqUKFKFsWb6mG
X-Proofpoint-GUID: mGOpEqJl_7I00zEVZUuN3JGt6JdyWXk8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230042

On Mon, Nov 23, 2026 at 07:52:17AM +0000, Fuad Tabba wrote:
> The generator rejects a duplicate register, SysregFields block, prefix
> or enum value, but not two definitions of the same macro. Two fields
> called F in REG make it emit REG_F twice with different masks, which the
> compiler reports only as a redefinition warning against the generated
> header, in every file that includes it. Two values of one enum sharing a
> name do the same, and so do names that collide only once the generator
> joins them: a field A_B beside value B of field A, a field F_MASK beside
> F, or a field B_C in FOO beside a field C in FOO_B.
> 
> Record every macro name the generator defines, and fail on the second
> definition. This covers a duplicate block or prefix too, but their own
> checks stay, since they report the duplicate at the block's own line, by
> block name.
> 
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Reviewed-by: Steffen Eiden <seiden@linux.ibm.com>

