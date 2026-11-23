Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.205
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795420376;
	b=KT3isMB8c4BRJEowYO0DjHNFpxZaag1akGzf/PGPCEsDoiYDdAk4nuGiqLmjv0MQbgOz
	 L8PL0HmdV76PCrrO7jRqdRDJ0+Oh7OhFWesWn7JMy2p6brpvrrXZvTiMFPdB6nfzJmJsW
	 Lnn6swjoUdRnNDOS+6k5fBQ4VpHAhYTRfjfJDNDmVUtDRT+FdV6zlD/AQLxiUTTbV+2Yn
	 fNnPSGy5MWM/Mh8syVHYRf7lBi/SAz1cJAWTI6+RSR/7WsKUwo87nkD8EhjamqyEr2Gcv
	 Ojd1VVOX+qHL3Ojef+9ILlsQ292qvqFi0EkdOKAni9nBXPF8d+8qDmiYjxf4i54as6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795420376;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=p4WNrnTmjL11PBLlIs9x7E6Ygb6cyG3MjAKmtC16Sv4=;
	b=iserfzmxjbn7gQ+Ei7L8IVGbBcdcqfLanKQtadFRbBdGXyy9DwhDDw+q8zKYQ66rQYbv
	 HuWtt4QQ1hByGMfWuWltuh+gOIVgtW1ObAMVmwp8GTIgODQQHpsjKvQYdon1dXOsCOfKq
	 6jviqIX8lK4Ik8fy86wov3DgGffxKPFw5iJNwKOV0czQjhbGhdnpcCAJ41EEawXCkuNcs
	 xTCAa1uiCd0KAVjtGuWWxPpq39XvK2tFxPy/ih8pgwfCfaNMmScFfIsB24maRWMxZqLsD
	 y/6/EIoTEz91+VJVcyIEEydIgbCfSfK4bDyriv1s0zvVzzuxqGVXPCJlxy9ScFjABdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VY716lNV;
	arc=none smtp.remote-ip=91.218.175.205
Received: from mta0.migadu.com (out-205.mta0.migadu.com [91.218.175.205])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13F1606A680
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:52:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A13F1606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VY716lNV
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=W5MVlLabdoLJygsTruEB+0zDUQy4ednpuAK/pgs3G7I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795420373; v=1; x=1796025173;
 b=VY716lNVIxIbgQa2xjy1B3kXj8KVdp0PaNMCrNqxSeGX2H3rgx3ZlMHFzdPetNupB7Cy5JS4
 OYvA6wF4NMq4mqP9aQa8Q6RnEcS588R950n9tRm8b4h6JsT2qU9XkESj3l/GbNG497JQE90nDPz
 HN8H6+deX0eoBaTg+SwLopbU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 17f89cfd84a43798;
	Mon, 23 Nov 2026 07:52:53 +0000
X-Mizu-Trace-ID: 17f89cfd84a43798
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
Subject: [PATCH 7/9] arm64: sysreg: Reject a macro name defined twice
Date: Mon, 23 Nov 2026 07:52:17 +0000
Message-ID: <20261123075219.369042-8-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123075219.369042-1-fuad.tabba@linux.dev>
References: <20261123075219.369042-1-fuad.tabba@linux.dev>
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

