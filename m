Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795792333;
	b=obtgL1ENb52BOBWqV+xc3MZiU+KFGEnZod8vokogfhU3bisJ6XjCST7VKDTFXsesLHr/
	 8+Km9AWNzEyxrbI+xd3JcCoiACFP3J7zvd31NzRufFeIEm+9IJ+97EAKjCy38Hh1N4Gbu
	 cswl9Hjgd9z4IqeqGRqJgZjrfPvFG9EjpXMK5X1mDwnQrBiOgnr4LQxOV8X3fo9ZAJRIs
	 mmwmQ9HJ2mbGqohbE5Qh849VScX+qENEkUL++9HIl33V5CuTZaAG1wpucGy04POkBx1uv
	 FlesIINPqTCJRQw6UmjFpO2uYCrLFwcqgTDe9rkTTcZwUvNb5gxPCZMsn1l93DHvqow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792333;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0pyZKqnDWMuc95St72Xgy3CQJky567UxPOLvnlQg5vw=;
	b=QFKQZFyFn76cp8uDng08aiJx1UjwJljEoHFjuDsGuDMXxoSrgwp6GdSxetsTGZ02YwB5
	 yL+K0QJG06/umm61sDhh9/UTMegxqlTpDm+wrvnjH7f7eaVBpgAPs7RMsQuA+j9wHosuG
	 Qo0vF70SN7ALJCnRBdlCTLJMXSqkBqQE4BQOrAfk7Elf17rs4DrQUvY4ASZkWbuKFxDxw
	 Z5FdXiNmLop24GZfG6tLjPbj6pUWNUjhBjt/PXS/gS95xzEGCRfXrV82GzR+DYhVKdKqx
	 G338QR3cNyfaK1b9gyH5jhjTBiBgebrJvFG63+DG9IyJXja4SHTr/HntDDzFNsrElwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JCuqdHno;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C32360A2613
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:12:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C32360A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JCuqdHno
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A086E1DB5;
	Fri, 27 Nov 2026 07:12:09 -0800 (PST)
Received: from e144440.cambridge.arm.com (e144440.arm.com [10.2.199.104])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 237B63F632;
	Fri, 27 Nov 2026 07:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795792332; bh=MxCYFbgbltrmMMr0MHqOOsTbz5t4vRUGRW7Vw3l2Y7M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JCuqdHnoNNtfuX/W8z7GpIPrdn5rStcDNgIcn42t7WOmlHpBZhcchQHWCjOO1We6P
	 mjZ334e2vZCMWS5p0UpEhE6oVIOr2Mz8lEBkWbCnPstO4lEyN04kGKKRv6KXpyUI8c
	 P7RgJoXCuiEX7VEKdI4D8DCvifO+TZGVNbSiciOI=
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Linu Cherian <linu.cherian@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: cpufeature: Enable BBML3 on Cortex-A320, A520 and A720
Date: Fri, 27 Nov 2026 15:11:56 +0000
Message-ID: <20261127151157.406111-4-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127151157.406111-1-ryan.roberts@arm.com>
References: <20261127151157.406111-1-ryan.roberts@arm.com>
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

Cortex-A320, Cortex-A520 and Cortex-A720 advertise BBML2 and are known
not to raise conflict aborts for mapping-granularity changes. They can
therefore use the BBML3 semantics, but their MIDRs are missing from the
allow list.

Commit a7ac60414475 ("arm64: cpufeature: Extend bbml2_noabort support
list") named A520(AE) and A720(AE), but added only the AE MIDRs. The
non-AE CPUs have distinct MIDRs and need their own entries. Cortex-A320
can now be identified using its new MIDR definition.

Add all revisions of these three CPUs to the allow list. The reviewed
SDENs identify no BBML3 exclusion erratum for them.

Cortex-A510 remains excluded because it can raise conflict aborts.

Link: https://support.arm.com/documentation/SDEN-2877630/0000?lang=en&rev=0000-06
Link: https://support.arm.com/documentation/SDEN-2444153/0000?lang=en&rev=0000-12
Link: https://support.arm.com/documentation/SDEN-2439421/0000?lang=en&rev=0000-17
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/kernel/cpufeature.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 710d44a30d29..1c4e809f73e4 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2037,8 +2037,11 @@ bool cpu_supports_bbml3(void)
 		MIDR_ALL_VERSIONS(MIDR_NVIDIA_RIGEL),
 		MIDR_ALL_VERSIONS(MIDR_AMPERE1),
 		MIDR_ALL_VERSIONS(MIDR_AMPERE1A),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A320),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A520),
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A520AE),
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A715),
+		MIDR_ALL_VERSIONS(MIDR_CORTEX_A720),
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A720AE),
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A725),
 		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N3),
-- 
2.43.0

