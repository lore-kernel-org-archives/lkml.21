Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795765503;
	b=Lu47sZObZej33LRAYOpqCr2PEA6m1fI0pr/gBVqa+rc6qJ8ya4MuynjEfOse/NoWX25q
	 k/ykBAFfUXzO3xn3k1be1Lg48m5gvw578RqKJPIfa0botDNnwhiRiTNegWsPCKZxeNFuI
	 D/GJq7odVlQnPJ8kqZQAXhFv4kyJDCvo60y3AKMFvFQYygHLdxlAq15vHw1KwRp4yZfTH
	 qqUYZ3cdqE/MMZQBoE9DSQz8AEAKhJOoxLHDGBv9PrgfOIok7yiUIsc1tHeqIi0Dyydyp
	 7P/GegIIx3j/IU6X7EOe1cz29zKGgqsZ1bd0m4RcBMLn0QK5OVPCjVoc9egfhGO3cFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795765503;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Edaz0a8Pn7RwmCSYLpiyB9Hw6aP0EcYCTitOem48uaY=;
	b=puKDn0TNdrHwVWIlyUKo3eQc2nnYVOauuMndPk5As/n1csl9i033545lPRFN9YlX1ao2
	 LMlYa056g3nWHW3mK8nn5btSRqiquzFtLUWIkxZLer6hoo3kgeBCKE/xg5XGykqo1Tu8b
	 GO0PwJ6b1+FXXJFFe4v9E+gmo/aYnMlyIt67zzxbEEefeYZalo5zyEj48PrWOleEBS6SD
	 bUl5jzjpSO6r26Ok+a+oZg3O2axlhx3uX5lc53LJcPQHcH0V0hTM+mH9Y1ofLTZ4Ab7cn
	 vR7892SFlPWGiOh3fG6zMSB8u+Fyt10TTSfewNQ7Xi1/a3p9PlSyiHlEKI96rMLE6EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Hvhj66vo;
	arc=none smtp.remote-ip=95.215.58.119
Received: from mta1.migadu.com (out-119.mta1.migadu.com [95.215.58.119])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001AE606A6AA
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:45:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 001AE606A6AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Hvhj66vo
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=QauHdFkdMY5QnZ6hX3/Ka5uYXIegeVDxxJXsQ1MBmSU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795765501; v=1; x=1796370301;
 b=Hvhj66voT1cHMAKbs4RsyS9ML7mtXBRyiN7Ndm3qKUGrgtP7t9tVbdjZbc3qjPhrCsiYLUQh
 V7e4SNLJbNUmYeEMCsfq4ufuThk43Ibwzeb8/5/EiWh4qo/dc7HsddLbHp1m6PfrdUkEFkl7mmG
 FIQ1F8yu8xAyqOKV0Dn0atKc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bc1b4c27aa684e86;
	Fri, 27 Nov 2026 07:45:00 +0000
X-Mizu-Trace-ID: bc1b4c27aa684e86
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2 08/10] arm64: sysreg: Reject a macro name defined twice
Date: Fri, 27 Nov 2026 07:44:24 +0000
Message-ID: <20261127074426.50739-9-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127074426.50739-1-fuad.tabba@linux.dev>
References: <20261127074426.50739-1-fuad.tabba@linux.dev>
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

The generator rejects a duplicate register, SysregFields block, prefix
or enum value, but not two definitions of the same macro. Two fields
called F in REG make it emit REG_F twice with different masks, which the
compiler reports only as a redefinition warning against the generated
header, in every file that includes it. Two values of one enum sharing a
name do the same, and so do names that collide only once the generator
joins them: a field A_B beside value B of field A, a field F_MASK beside
F, or a field B_C in FOO beside a field C in FOO_B.

Record every macro name the generator defines, and fail on the second
definition. This covers a duplicate block or prefix too, but their own
checks stay, since they report the duplicate at the block's own line, by
block name.

Reviewed-by: Steffen Eiden <seiden@linux.ibm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/tools/gen-sysreg.awk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
index cde526896ed96..0bd6aab8aae0f 100755
--- a/arch/arm64/tools/gen-sysreg.awk
+++ b/arch/arm64/tools/gen-sysreg.awk
@@ -46,6 +46,10 @@ function expect_fields(nf) {
 # Print a CPP macro definition, padded with spaces so that the macro bodies
 # line up in a column
 function define(prefix, name, val) {
+	if ((prefix name) in defined_macros)
+		fatal("Duplicate macro " prefix name)
+	defined_macros[prefix name] = 1
+
 	printf "%-56s%s\n", "#define " prefix name, val
 }
 
-- 
2.47.3

