Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.153.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795652397;
	b=2sSosmUOPBb34VThRSisM5wc8+hCc1B6rL5p9xUpnHSUzCpErPAQBD5iTwrqr62RE+zp
	 Z/H5lg8iJBIBT53NODl5YAgQBxtQkR9Ogpq49m8tGBy9Q6ufSjuFkNkpben685L8yudU6
	 xaQRDMSm1474GLn6R9CTz9amSZ5IcubK3Uva/gd0FwfEuNh8Pm9fYatRY+0t8ucOziD3x
	 uwey/+3Dq9X7Z/YUPAs2Qy7L3JeX8OYANRQeSczCfC1pNcrkHoBhrl4jeSMEywvYBY8WK
	 9M/MxZIx3fFWCuEc7IOqhE2vXc/cLLFfFMbazhzIWN/E4vz2TgrhnOKz6naP5U/B9sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795652397;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version;
	bh=47SGSR6ZUVrtGx0g8gnswzV2LPBUE2QF9Cyhi0n7410=;
	b=llK2vSJshMLfCu2n6VC2gjF2usheG/rs1bCZMaWaWIe8bvWcXc4McaL+jN5mbsYFc8eY
	 rYSZ3/zxrx6e6+lcraj7g0bFu2Sc9qcwq3ehOVeHcaoYPYOM3gacxmfFpzMf7kse7Ii5d
	 Ga5im7OIfxgqjXLybBh84euht4KsEmZ/2KtJ/RfxsAwKDKqQp+lXDQMAbn5xciKNd7IIi
	 dlp6K1/qTlPN0eEgA9vrEMPBEd7UN9uBBFkevtSH4WFSAZZ/+IB4YpE7bbFo6DaMQvAcs
	 a7yO8LV22N++aopXcT4IRMhOQCvga47ZnSvo+dWq631jxJOLkAUuXlHY5s2cTjctsSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=Ks5FU4sb;
	arc=none smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFC8606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:19:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDFC8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=Ks5FU4sb
Received: from pps.filterd (m0528005.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APM1kCF3576277;
	Wed, 25 Nov 2026 16:19:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=47SGSR6ZUVrtGx0g8gnswzV2LPBUE2QF9Cyhi
	0n7410=; b=Ks5FU4sbySDCKunlTvbAdvA/t9TuQLQx7xnp7YpZZkvjiYahjznbz
	4Rlgy1WUjWHkUo13eBjUVbJBu0Jakan9yS7hS1rqVk6M6zUNwuThICsRwbWcyBMq
	akticnfM/L10XIb8YSNgG2U6VG+afeEV6ctQ0TOdE8Ub2XcWTazhvwzJMSQC2yfh
	zgniKQTut1Urz3y09A9QDcMapMhgnB5JmOCBJv7Q8pQbrlt/kVbJcIDKjUD1xTCI
	GoZdA4gR3+2tv+v/NQ+UNrmSrmy7OJWGxrfpi/Egzsh2CEfI7DbIOmyaNCwDDKhZ
	Gu9uDc7vjpWLWdmjPKS3z+P8fDeFe6H+Q==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j5fap21f5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 25 Nov 2026 16:19:33 -0800 (PST)
Received: from localhost (2620:10d:c085:208::f) by mail.thefacebook.com
 (2620:10d:c08b:78::c78f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Thu, 26 Nov
 2026 00:19:32 +0000
From: Yann Collet <cyan@meta.com>
To: Ping Li <leeonion.muyu@gmail.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <palmer@dabbelt.com>,
        <pjw@kernel.org>, <mark.rutland@arm.com>, <alex@ghiti.fr>,
        <emil.renner.berthing@canonical.com>, <masahiroy@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <u-boot@lists.denx.de>
Subject: Re: [PATCH 0/2] arm64,riscv: boot: emit standard LZ4 frame for Image.lz4
Date: Wed, 25 Nov 2026 16:19:20 -0800
Message-ID: <20261126001920.3185323-1-cyan@meta.com>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261124065650.1968930-1-leeonion.muyu@gmail.com>
References: <20261124065650.1968930-1-leeonion.muyu@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAwMCBTYWx0ZWRfXxbv/lVsq1VIk
 U0jO68Ek/ZgfsEsUosNAmLzdC0VirBIXx78XSk+Fq5RBm4+k+1rivqMjUwr/JkjKwBGgwoKINcO
 a4kq3jm6yvQ2sBdXF+SU4cakzZ6pnOepGKRJDu1NeVNYuwKJmgbtH7Mrx8EAxxJnO1cGA0sXjX/
 nj4MHBy+g4FoIEjN+4fGSAeqd/V/Kel7rj/LdJecWNWCSNww9ik9cUFbad76xX0ls2vQbJd1BLx
 5dW+FdHymNwf9Sl0rs8NbC4V/61pQazg0IU4+0DXbwpegELioNusqRinOqQKUOWxp7SLDI7Nlft
 3fy/YX2LE9cUOMAmzPoE07vqhXYJfsMRthxXPffT6gQgf8M5Svch6btsT+/8xdfit9hjyJng4l7
 wI6g6IVUFIwzhT66lqD8HdZjLZ4nIDw1EL2obwB/PLSLIOI4R3tQ+VVT9Mf7jNGU73f9dBsO27e
 MSMKyS9OcP5ruNhA4ug==
X-Proofpoint-ORIG-GUID: HS-aMb4GaL-DcgH4Ivl2FAW5exzSSANa
X-Proofpoint-GUID: HS-aMb4GaL-DcgH4Ivl2FAW5exzSSANa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAwMCBTYWx0ZWRfX18KQ9ZGKAbE+
 EVc4wzDNAFesY8zM3PWxWiU6yVP0JKrGdiVtGhN38mn44y0pozgkQN+/oLGAxKto4lOyJKFdCaC
 vfgZhIH/NKuJvP6fN1xWWLSDEmEJZVo=
X-Authority-Analysis: v=2.4 cv=Eexd0/mC c=1 sm=1 tr=0 ts=6b077b15 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=jCddH8ec0KUNCymVuxII:22 a=I0HTz2J1b6gKnfYguBMA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01

On Tue, Nov 24, 2026 at 02:56:48PM +0800, Ping Li wrote:
> arm64 and riscv also build Image.lz4 with the plain cmd_lz4, but a
> compressed boot image on these two architectures is not decompressed
> by the kernel itself - it is handed to the bootloader.  U-Boot, which
> implements this via the 'booti' compressed-kernel path (boot/image.c
> image_decomp -> lib/lz4_wrapper.c ulz4fn), only accepts the standard
> LZ4 frame (magic 0x184D2204) and returns -EPROTONOSUPPORT for
> anything else.

U-Boot's decoder has a second requirement: independent blocks. It
rejects frames with linked blocks, and the new rules rely on
independent blocks being the default of the lz4 CLI. lz4 is considering
linked blocks by default in a future version. U-Boot can learn to
accept them, but bootloaders already deployed won't.

Passing -BI makes the output independent of that default:

	cmd_lz4_std = cat $(real-prereqs) | $(LZ4) -9 -BI - - > $@

With current lz4 versions, the output is unchanged. One caveat: -BI
exists since lz4 v1.9.0 (2019). Older versions, still found on some
build hosts (lz4 1.8.3 on RHEL 8), reject it, but they produce
independent blocks by default anyway. So the rule can pass -BI only
when lz4 accepts it: 'lz4 -BI -V' fails on these older versions.

Yann
