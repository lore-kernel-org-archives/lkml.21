Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795068003;
	b=B4GekWOnA2jShwYSMts9A2G8zqe+Mr7iWpxI/Q3wEreauPgve3h9t+mESNmV+Fl0Z5Ok
	 TtQ/+RKUzuqVl8chOAP56lNHaOY67+4rH7bxIG/A6ER8k3nlTV9cdy/3zIMEAxoyy25vy
	 g/rwwu3UXUztANDiFGNGbosmXwOAXiqTiTaLUiWzNZDnotm4NWH012u7kuXthxMaOKh9s
	 YGTAV+0VCwyIdxRx/AASXlmByy+2FL+F1apQZIjoIGHKg7AsohC6RQtvCkGbd78upri+p
	 1O4xzCuNxFafIRQ9TJHkpKNOtsjKO7W8xAMp1IaEes2YH4qFCtcB/PVHz2towhTpiaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795068003;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=d8fMnFA2+FUR78qV2kHlRazBFSTAz7DuxJQu4dXifxQ=;
	b=SMdJDqJ+p/ehwLx5yLo2nAfafw8w7PkoMyR3t1ebw3DKUKjM1m4uaSgeHvI5nbtkhxNy
	 4/XaGukx8yqcSL7Yhj5YjtDSzTsVLxrxaCp+EH91a0Y3XHCwG4UYQmamLAlGroorO3asR
	 i6ocj5DurCgq9YlGiLW/KwnmGBbvwuBjIEuu4zKTMhdDdVlFRkBv9q6gPZ64f4ZO7SZE/
	 Id2E+jD5pAQg0s15i+uzokdCZ8medLtSI+gDdFx03IsHLQbVYttMAyRImQCDMlsYW57OT
	 22XQE/nkTFndi4Y+ccC5YAPnUg/kyEqaciO49Zc/qfR0m81OHs5uMG+6k+x770dQP9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HsKslM7v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B159A606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HsKslM7v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FB091F000C7;
	Thu, 19 Nov 2026 06:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795068003;
	bh=d8fMnFA2+FUR78qV2kHlRazBFSTAz7DuxJQu4dXifxQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HsKslM7vU5YeXDw+LVRg9aZxdXuvrDw9hXroxKfeEVZfgmQhSVPBGRoPK2VXvYwu8
	 umDguwh2OvTmxdfahpb3kVXiSzhjdE76LGxlf1a6Cw9Ob/eQ9t/fniZf/M4UP6+g+2
	 R5eU1GNkcplJVAUwiicFL2dzCDcppLcKDLyrxOA/+lDtNHM8w1trvpszOX66TGDAH9
	 lTKZG1PAAeWcAsyXpu2DqbI4LrMI3xUIPlBX7+zghhsxkZCl7vDelcmnGyvCiFWEC2
	 osAdiVa0qIX4UwkskeP4ugmPwZW0xSFDFA4Te4oh2Ig4ikS85Bd+Qtf86WTeFcFlwu
	 zgp5IWuIVsqPA==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Simon Schuster <schuster.simon@siemens-energy.com>,
	Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 1/4] ARC: math emul: elide 64/64 divide and floating point routines
Date: Wed, 18 Nov 2026 21:59:55 -0800
Message-ID: <20261119055958.1621709-2-vgupta@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119055958.1621709-1-vgupta@kernel.org>
References: <20261119055958.1621709-1-vgupta@kernel.org>
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

64/63 divide are not needed in 32-bit kernels.
FP shouldn't be needed at all.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/kernel/arcksyms.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/arch/arc/kernel/arcksyms.c b/arch/arc/kernel/arcksyms.c
index 8851c0a19e09..c22055e66cfe 100644
--- a/arch/arc/kernel/arcksyms.c
+++ b/arch/arc/kernel/arcksyms.c
@@ -11,7 +11,6 @@
 extern void __ashldi3(void);
 extern void __ashrdi3(void);
 extern void __divsi3(void);
-extern void __divsf3(void);
 extern void __lshrdi3(void);
 extern void __modsi3(void);
 extern void __muldi3(void);
@@ -19,17 +18,10 @@ extern void __ucmpdi2(void);
 extern void __udivsi3(void);
 extern void __umodsi3(void);
 extern void __cmpdi2(void);
-extern void __fixunsdfsi(void);
-extern void __muldf3(void);
-extern void __divdf3(void);
-extern void __floatunsidf(void);
-extern void __floatunsisf(void);
-extern void __udivdi3(void);
 
 EXPORT_SYMBOL(__ashldi3);
 EXPORT_SYMBOL(__ashrdi3);
 EXPORT_SYMBOL(__divsi3);
-EXPORT_SYMBOL(__divsf3);
 EXPORT_SYMBOL(__lshrdi3);
 EXPORT_SYMBOL(__modsi3);
 EXPORT_SYMBOL(__muldi3);
@@ -37,12 +29,6 @@ EXPORT_SYMBOL(__ucmpdi2);
 EXPORT_SYMBOL(__udivsi3);
 EXPORT_SYMBOL(__umodsi3);
 EXPORT_SYMBOL(__cmpdi2);
-EXPORT_SYMBOL(__fixunsdfsi);
-EXPORT_SYMBOL(__muldf3);
-EXPORT_SYMBOL(__divdf3);
-EXPORT_SYMBOL(__floatunsidf);
-EXPORT_SYMBOL(__floatunsisf);
-EXPORT_SYMBOL(__udivdi3);
 
 /* ARC optimised assembler routines */
 EXPORT_SYMBOL(memset);
-- 
2.53.0

