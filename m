Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.90
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795491809;
	b=YDOiegYvMGRDBU33fDkTMoowK7MwJyG44JorAxa+0PUx0GND18KB/RSYx3NOMgW1ogD7
	 7gaAiH3UGDhVEAKQnqhSfH6TUGX15kd3Vgn9DMLBsKRLXUr1vdZX1QVvTa73QCn8AMH4w
	 R2EbLr1m3y0Qs3xHkoxrwFgp+BR/TqAFmVDjCCqdxYGW3piKq9iuE0o4Id0cf1VzeFXwM
	 OVQU/1v4V+unlnDZ2OCUruLHLBss7Ytyv62MM3ur4dbJjwjpIbLHC8nTDjO3nxUF5S/fE
	 XEihBSyDm7lPfR7+BmvY2f5nVdwllwZ1dW5554n3VPNtjc143L6bOZMHntMmIJJvJ2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795491809;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=7M4wAkcRkb6dvf/wF5/1Lb5K43+ciQ6wkAeFxRT0J/A=;
	b=sJclmkejoZ/GHqC5AkcqxcaN/XYw3dzrM6OqnOB/8dCpNUpe3otZYZMZn+3mk0JQhA5E
	 pURf834ieuOWI0AEDrhyUImmtIdGqcLX2DXEYTgPLHhGMkq7+yxDKv4DOXuLNUrEM/OP2
	 gSHuN2m0Olz0WR52OK6zFeaWIm54e+AJETqtKax2zQ69oeMXWN7Ri72gGHVBZWguboDtl
	 n8TqVtG91pyCuput7lDEl8wsDVahzYyF0uiUREacmXbhvrQXIxnP490zkG2PIwMw7a0fH
	 WXCsuZDYkadDJFW0LzjQMuTEQarh+LPlfq+lJwtNCGcV8mW3Hby1O9lUAwN/rC49Syw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=K0vBSuRG;
	arc=none smtp.remote-ip=95.215.58.90
Received: from mta1.migadu.com (out-90.mta1.migadu.com [95.215.58.90])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DB1606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:43:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91DB1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=K0vBSuRG
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=yaQ1iSL0Ettiz67uSnxASSrVErm3nTbgg2wSpt+Ygks=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795491806; v=1; x=1796096606;
 b=K0vBSuRGn4tW61FNQC5SoK/IU3uOMA3cYNrWCEuG1q9fVy9B29yTJd/VVOmROlAJPAZfebrp
 +xjzUMuvjEQOQTU7qXR72p86YnR6tfoHcPJ9e2iiadFWUCmUmRD7s/IOv451dZXxuXqDOq1gN4u
 UxJ65fccPhGe9RyctcnfL4lc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 900d51c335235986;
	Tue, 24 Nov 2026 03:43:26 +0000
X-Mizu-Trace-ID: 900d51c335235986
X-Migadu-Flow: FLOW_OUT
Message-ID: <094948ff-cd86-4f20-865e-ee78b908db23@linux.dev>
Date: Tue, 24 Nov 2026 11:43:20 +0800
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
Subject: Re: [PATCH v2 2/2] arm64: errata: Fix Falkor E1041 Kconfig name
To: TAKANO Mitsuhiro <takano32@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-arm-kernel@lists.infradead.org,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261121083950.1957044-1-takano32@gmail.com>
 <20261121083950.1957044-3-takano32@gmail.com>
Content-Language: en-US
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <20261121083950.1957044-3-takano32@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/21/26 4:39 PM, TAKANO Mitsuhiro wrote:
> The Falkor E1041 entry in the arm64 silicon-errata table names
> QCOM_FALKOR_ERRATUM_1041, but the symbol is QCOM_FALKOR_ERRATUM_E1041: it
> is defined in arch/arm64/Kconfig and used in
> arch/arm64/include/asm/assembler.h.  Correct the name in the table.
> 
> The E1003 and E1009 rows name QCOM_FALKOR_ERRATUM_1003 and
> QCOM_FALKOR_ERRATUM_1009; the E in the erratum ID is not part of either
> symbol name, so an E-less name in the E1041 row looked consistent.
> QCOM_FALKOR_ERRATUM_E1041 is the only Falkor symbol that carries the E.
> 
> The symbol in arch/arm64/Kconfig is spelled correctly; only the table
> entry is wrong.
> 
> No functional change; this only touches Documentation, so no build was
> run.  The change and this changelog were written with the help of an LLM
> assistant (Hermes Agent); I reviewed both and am responsible for them.

Again, please use a concise commit message.

> 
> Fixes: 932b50c7c1c6 ("arm64: Add software workaround for Falkor erratum 1041")
> Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
> ---
> v2: the change is the same as in v1; only the index and hunk line
> numbers moved with the rebase.  One changelog sentence is replaced in
> each patch: in 1/2 v1 called the table row the tree's only record of
> the erratum, but irq-gic-v3.c records it in gic_quirks[]; in 2/2 the
> sentence about the symbol is reworded to name arch/arm64/Kconfig.
> Both changelogs now say that no build was run.
> v1: https://lore.kernel.org/all/20261106234541.1474324-1-takano32@gmail.com/
> A duplicate submission went out the same night with different subjects
> on 1/2 and 2/2 (20261106235616.1533003); please ignore it.
> 
>  Documentation/arch/arm64/silicon-errata.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
> index 4bb5707a880a..cc7bf2b6a09b 100644
> --- a/Documentation/arch/arm64/silicon-errata.rst
> +++ b/Documentation/arch/arm64/silicon-errata.rst
> @@ -378,7 +378,7 @@ stable kernels.
>  +----------------+-----------------+-----------------+-----------------------------+
>  | Qualcomm Tech. | QDF2400 ITS     | E0065           | QCOM_QDF2400_ERRATUM_0065   |
>  +----------------+-----------------+-----------------+-----------------------------+
> -| Qualcomm Tech. | Falkor v{1,2}   | E1041           | QCOM_FALKOR_ERRATUM_1041    |
> +| Qualcomm Tech. | Falkor v{1,2}   | E1041           | QCOM_FALKOR_ERRATUM_E1041   |
>  +----------------+-----------------+-----------------+-----------------------------+
>  | Qualcomm Tech. | Kryo4xx Gold    | N/A             | ARM64_ERRATUM_1463225       |
>  +----------------+-----------------+-----------------+-----------------------------+

Reviewed-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>

Thanks,
Zenghui
