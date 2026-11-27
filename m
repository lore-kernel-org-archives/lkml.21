Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.127
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795765521;
	b=CzFtznN4uhU/rAp7colkl0Vssx3PB1IMCaWQBEpd7PtxpB0wYrbsxVgoX096yCdccyqh
	 VqShE+5LPNALCaF79h2M3EQWxYXh1ZgCAB96U+fDvzX+LM/+kxdUQqSGjXyIIMLL3vYLB
	 NIuk2N1pHXcy/naU5fU/zAwYOHE6GR7iKfLjxMlVoSmsFK1hFFumKka2CnpCpi1YovSop
	 58VQz/FGwQnF4075ZAw3PGR3QTzFj/LSbHy9ZVZ3hnXNMPyhG3iKByTaPBaiQuEXepPyS
	 ayBVlx2c0jRF+QKkGgCh70+2okzADwXc5uKOZtd+2nu/KY9l0P0Hu7BCppQcL/vMapg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795765521;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cerfVBgu9YPI0O+wyBK+FTIgV6wt8zLv1/3eHjoa+4E=;
	b=3KjDAE/B/erHtHPFPRnxeRaKYQbltkCM26Qs33zfvZCFWm7a7woZd/T8Z6Jy/shh4aRV
	 HLjIeP4lohqN8hqV6r96MoMM5ri4mxVOT4eY+AonCkawV7vq7/LoiYZQw7pXGF9MoiaBj
	 q75oKNSF7kPYUsX8HgCdEm50oH1GA15VpkKyUI78M5qZpuJ0Y4F0TZbiiu7qcfxIS8qpg
	 K1JGqSYfH0rZcZqTDeyK/ZUHvCcJHgyZvmWSlIUGdPB4xgmocdiI2dVFWzhNxPeGXjiWA
	 Zd6EnShyIXz3DYKJxSXcFaCSj57RV/vI51nXfCTkIfoz5caPsj+0pKZ2QZao7neeCmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=chZuL7G+;
	arc=none smtp.remote-ip=95.215.58.127
Received: from mta1.migadu.com (out-127.mta1.migadu.com [95.215.58.127])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451EE606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:45:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 451EE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=chZuL7G+
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qYRjslUDVcj1lt8KzDUu0lRPd6BDIf6Rmbfrgg+NzNY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795765519; v=1; x=1796370319;
 b=chZuL7G+6HfoI+6F9a1JfOh2WWb3e0Fm26cBoS3v7TXKdjMOkhX0jXo/UjTahdUPSAFHXviB
 KjrlsEe/3NjlgWGLwFMybOuxqbwPqt/FEkg4cJFVGM/xkZIz2uWTH4Fpa4cnb71jLDEBeQS+yXH
 xRBZO5VgWZBPX1p6bviRzotM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4d49051ba8f4cc3e;
	Fri, 27 Nov 2026 07:45:17 +0000
X-Mizu-Trace-ID: 4d49051ba8f4cc3e
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
Subject: [PATCH v2 10/10] arm64: sysreg: Reject a bit position written with a leading zero
Date: Fri, 27 Nov 2026 07:44:26 +0000
Message-ID: <20261127074426.50739-11-fuad.tabba@linux.dev>
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

parse_bitdef() reads a field's msb and lsb as decimal and checks the
layout with them, but the generator copies the digits into GENMASK()
unchanged, and C reads a leading zero as octal. "Field 63:010 A" is
accepted as bits 63 to 10, with the next field starting at bit 9, while
its mask is GENMASK(63, 010), bits 63 to 8, which overlaps that field.

Require both ends of a bit range to be decimal numbers without a leading
zero.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/tools/gen-sysreg.awk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
index 057dc98082b5e..103420b58d24c 100755
--- a/arch/arm64/tools/gen-sysreg.awk
+++ b/arch/arm64/tools/gen-sysreg.awk
@@ -102,7 +102,8 @@ function parse_bitdef(reg, field, bitdef, _bits)
 		fatal("invalid bit-range definition '" bitdef "'")
 	}
 
-
+	if (msb !~ /^(0|[1-9][0-9]*)$/ || lsb !~ /^(0|[1-9][0-9]*)$/)
+		fatal(reg "." field " non-decimal bit-range '" bitdef "'")
 	if (msb != next_bit)
 		fatal(reg "." field " starts at " msb " not " next_bit)
 	if (63 < msb || msb < 0)
-- 
2.47.3

