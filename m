Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.207.212.86
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795508613;
	b=VLYIHZzrMtLYKWO58itE+moYgy9Fyc/8t33cCqwEgMVpqVVRxUNZi/mmzFeX3AqOW7Re
	 HdcxRBmi3Z3s/ee+6NTiozXDc1MaF4EuoVD3YRemdVlnrMvfpbo+CCMJiYD8IL7/yasZl
	 Blz1Z8LgK0CQFAj3SwlYoQzg74Es0YWWQdJBgVzPwFcyBPrZM4jxiv5cE+eiYEkH7C1qO
	 H4F0ZipxKVWsL3hb8EO3APjtNi5hxAkXkgLPpe1G5mzO/I82Pu6N21zN3lUP4p7Q3ibnR
	 9NKaim3F7XJo+y/BK8/USg+dEe7vMsmB4Ft2SwO9NKC2Q9g8o7svkJG3AO7FqRc3MUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795508613;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 In-Reply-To:References:Subject:Message-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:X-Originating-IP:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID;
	bh=+lB0qIYI/uTFr9P55v+/IWmV/RBbTeTLfzExy9APUxM=;
	b=YtG6dCHt70cn9C1OPyZfkTi+3HUqbfzjVeQSag9LUfEZOVo/toy2UMdpDZxdN3yTafsY
	 Tk7TPFkuapK44ANLfwV2ZYlC/Rm3oa5T+vRnVOByLyChGEh8HOy2heVzV3e9bEIvhb5U+
	 yeLRgU2EEwhZ+DB3pE7uHI8ntuPGX8PYfZKQHy3aqvgF0BdDYhpyjh6mfCt75PcCRHnOu
	 3PHRr9Vn1a6EedskMcEIFR5u+5LxloPHrN5Lxp6uLU/jFlO7l22sCoVtNm/PaBCL6BEoK
	 M/ewGh9HI+U88S8i/t89+Kqf5CIRKszabhSlnlq2ADnyL6BTp4qTcJRkb62Avs1F73Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=imgtec.com;
	spf=pass smtp.mailfrom=imgtec.com;
	dkim=pass header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=GcwSHRu1;
	arc=none smtp.remote-ip=91.207.212.86
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com [91.207.212.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBED606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:23:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CBED606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=GcwSHRu1
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.12/8.18.1.12) with ESMTP id 6AO7hor33490018;
	Tue, 24 Nov 2026 08:22:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=+
	lB0qIYI/uTFr9P55v+/IWmV/RBbTeTLfzExy9APUxM=; b=GcwSHRu1RrLLvwsJK
	AAszIL2ncf/yn2lbDQ783VeZr4DGtCL/uU6ZJ83M/AKlNNcOzVWE9PMZ03PJcs+v
	bqOfX6wYUVuK47jbYST6iO6Vs39dZXvzLBfTfLFtdVUTLgk1WxbWiwYebwwIkTU4
	GhbGY5cMe57TMF83YBqq92NEch3ZapGS65VrKjQdwxFWB1OpueDmul+LbohaY0BF
	SdpghDaTU3ZPr/8VbNpC+UIkN6Zj9agp4CiPMeYNd9Tx2FwJJ2N2ov/lLwIAApFi
	1OIr2+GA1NAe+/8W86Kgye1N35zirEncoq9sckfeYEX/b8t2euchF2dmgIbtPE3a
	01esQ==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4j32ev23kk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT key_exchange=secp384r1);
	Tue, 24 Nov 2026 08:22:39 +0000 (GMT)
Received: from [127.0.1.1] (172.25.128.225) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 08:22:35 +0000
From: Brajesh Gupta <brajesh.gupta@imgtec.com>
To: Alessio Belle <alessio.belle@imgtec.com>,
        Luigi Santivetti
	<luigi.santivetti@imgtec.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Paul Walmsley <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>,
        Alexandru Dadu <alexandru.dadu@imgtec.com>
CC: <imagination@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Matt
 Coster" <opensource@mtcoster.net>
In-Reply-To: <20261103-prep-meta-fw-arch-independent-v4-0-513d1c51f458@imgtec.com>
References: <20261103-prep-meta-fw-arch-independent-v4-0-513d1c51f458@imgtec.com>
Subject: Re: [PATCH v4 0/5] drm/imagination: RISC-V and META firmware
 interface updates
Message-ID: <179550855515.553125.14973110047433852790.b4-ty@b4>
Date: Tue, 24 Nov 2026 13:52:35 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzMiBTYWx0ZWRfX3xLW8kDiKZny
 pzlgA/m8MpTShOQsfONqSEAcTepgDtguhEDCsampD/Ja17GkuUAW83GOOIHkZ6XqOMavplItAfq
 u/U/Hcx0KkDuGxUHlqxoq0PUi4JLkSU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzMiBTYWx0ZWRfX0cAKPrQZFaRf
 U0+zDi/HU6sfNVMnXoXgGW2jqr0SzyIDcp0HPKMkJID6SXbVj4MsnRE/kMGow0p4ujSQ70jSG/e
 HHdhSzB32GgjfR3urcXvcIUuUdGuJMKPBOS+TgIjEAYoFGY89KbcBt2GQ20lC8F+t2nRoiYFskg
 19feJhOXT6AOWm8wbPKANGVqpK00sW+u8ZYmaGfAgcyfBTdZKpQAIX8y5sNer39zWv/MHKKt7Cr
 /3+YkmnrZKwm4WwWVH+Y+DGzFiZZhA1Vgt8eOiYB/v2LIwJhE7DhRVgdeG1hQ/QeogdeoI+T3Ie
 AhQoVeADJErfkx6RVhV86W/Vr634RN0tnbEQ8Gon++MyLVIDBBO64UPC/HV/F+ISBrmbKRTRHfs
 qFnPVxn2V8IBJKvYmDaIC38WK6TgTSoKYtyFHGgtTVH59sIcStoBDSYus4ukJUiBFv9uK0gtn6I
 JyD7SkTxgKvGKLdehcA==
X-Authority-Analysis: v=2.4 cv=T7AZ3PKQ c=1 sm=1 tr=0 ts=6b05494f cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=HYrZrZQ_E1YA:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=r_1tXGB3AAAA:8 a=b4IBWIOinYyicvjhWD4A:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: DFY79QVYbJn3aGu_YdsitQqUhvNz5qNf
X-Proofpoint-ORIG-GUID: DFY79QVYbJn3aGu_YdsitQqUhvNz5qNf

On Tue, 03 Nov 2026 11:00:39 +0200, Alexandru Dadu wrote:
> Refactor RISC-V and META firmware interface headers to have a more
> generic and architecture independent approach:
> 1. Limits access to the RISC-V and META firmware respective interfaces.
> 2. Aligns RISC-V and META firmware headers with the other processor
> headers.
> 3. Add "_fw_" component to the headers filename.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/5] drm/imagination: Prepare heap config header for multi-arch support
      commit: 78739294551c39d6c082913afd45166102c81bd4
[2/5] drm/imagination: Limit access to the RISC-V firmware interface
      commit: 2f42457ad97a6d3274196e6a825763d9d51d677f
[3/5] drm/imagination: Make the RISC-V firmware header arch-independent
      commit: a2eb58c3919aa45bd600c3c092ec301ee96f715c
[4/5] drm/imagination: Limit access to the META firmware interface
      commit: 780a9c551157cd373cac647b00a2c18a440ee49b
[5/5] drm/imagination: Make the META firmware header arch-independent
      commit: a70a2efe98a999f78a307bbcd933bfccf22f0672

Best regards,
-- 
Brajesh Gupta <brajesh.gupta@imgtec.com>


