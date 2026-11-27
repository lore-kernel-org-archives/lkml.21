Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795792332;
	b=BUGnCu1MV+Z3aaIn/hpPe6yH4ZL2vtzyfMEz1gMEjzUpJKea25Q1UQIscCrjZO+pIX85
	 v3lZmCX3mJhCDC4vVQa5M5Md55NVor4sEv135tPjwAGhM+iBtWqju+GIZ9oxcMH94mdWK
	 SlOe+m3eoB+6dwDW6m9ElGBEPC9wnFKRUdT9EkWRj6KNkZAwKqqPaOzXIGHvPFmHgLvLy
	 yywjFg8swkOQGlHI0sLp7vzYRJNsy++tf2xwFLaoFHPkOjL22PT5glTFYoBLdXjPfxnbz
	 2hUex+0xtOSP5te6ObmtNsH3IrEYbAIHFtAeE/ugq4ScBjHqda+XZP5hYbPACXmzUEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792332;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yWSjcEYYlYAmdYuP3+fGqSKyGg+3xIkQlvbIfZyBFiU=;
	b=JwW6GUTL+O/Q8jONeCPrYb/NZs64Hi2/MTYPrPUviYT100asnONSU9NwbxR/EESbRYfi
	 VH0LMlfiGuBMoqzCO2S1wmxBplRaGZwJ12Wr3lembg9ydXtoWsphBdlP4LcmYlMz6v1oS
	 QbClBl0lTEi1H8kuPZfODzRB+gE1sB1PqHb7b1dMoXP3+cRAP0vhLdHymfUAPYGnQmI13
	 49t0ExmS3KGlrzDclKYnOhCI2Ut7G9zwNHLkpFIFLKjdoDi7qm67UB4U1mrUqYvMclbG4
	 iJtHZ2ekMabuueULsLboX/xP1z6B41msLmzNzCZZCtKPNYC1r4DjL2NPD2TLEyZNa6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=EqZAqUEX;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B5DA606A6BC
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:12:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B5DA606A6BC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=EqZAqUEX
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25EEF1D70;
	Fri, 27 Nov 2026 07:12:08 -0800 (PST)
Received: from e144440.cambridge.arm.com (e144440.arm.com [10.2.199.104])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9BB073F632;
	Fri, 27 Nov 2026 07:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795792330; bh=DwvUUy/1RnTz32AMXT9X1m9COrhuDJWS/hb3hMlp0EI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EqZAqUEXaiLOKoLyqRWfagrkndJyfcIuB8FwEUgbQhXo0mhkIxh+0BD4uHfeSJcSp
	 Jb5xkD02VPXbt2uZxgD3SoqN6ESfkqI5jrmF4WRKTTHx73i3hv+0S6CPqscvqqc07i
	 2cbOXIyNLWBQhVuui8mK9LWAloP1DVS304uZJd2U=
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Linu Cherian <linu.cherian@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] arm64: cpufeature: Document BBML3 exclusions
Date: Fri, 27 Nov 2026 15:11:55 +0000
Message-ID: <20261127151157.406111-3-ryan.roberts@arm.com>
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

Several CPUs advertise BBML2 and are known never to raise a conflict
abort, but cannot safely use the BBML3 no-abort semantics because of
hardware errata. Omitting their MIDRs from the allow list hides the
reason for the exclusion and makes it difficult to tell whether a CPU
has simply not been added yet.

Document the excluded CPUs and their erratum numbers above
supports_bbml3_list[]. Record the errata in silicon-errata.rst with N/A
Kconfig entries.

Keep C1-Ultra and C1-Premium enabled from r1p1, where erratum 3683289 is
fixed. Also explain that Cortex-A510 can generate conflict aborts and
therefore does not meet the BBML3 requirements, independently of errata.

Link: https://support.arm.com/documentation/109180/13-0/?lang=en
Link: https://support.arm.com/documentation/111077/10-0/?lang=en
Link: https://support.arm.com/documentation/111078/10-0/?lang=en
Link: https://support.arm.com/documentation/111287/10-0/?lang=en
Link: https://support.arm.com/documentation/SDEN-2055130/18-0?lang=en&rev=18.0
Link: https://support.arm.com/documentation/SDEN-2332927/13-0?lang=en&rev=13.0
Link: https://support.arm.com/documentation/SDEN-1775101/23-0?lang=en&rev=23.0
Link: https://support.arm.com/documentation/SDEN-1775100/23-0?lang=en&rev=23.0
Link: https://support.arm.com/documentation/SDEN-1982442/21-0?lang=en&rev=21.0
Link: https://support.arm.com/documentation/SDEN-1401781/23-0?lang=en&rev=23.0
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 Documentation/arch/arm64/silicon-errata.rst | 16 ++++++++++++++
 arch/arm64/kernel/cpufeature.c              | 23 ++++++++++++++++++++-
 2 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index bffaa46c664b..64ad29d00243 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -159,6 +159,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-A78C     | #4193794        | ARM64_ERRATUM_4118414       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Cortex-A710     | #3696244        | N/A                         |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-A710     | #2119858        | ARM64_ERRATUM_2119858       |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-A710     | #2054223        | ARM64_ERRATUM_2054223       |
@@ -197,6 +199,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-X1C      | #4193792        | ARM64_ERRATUM_4118414       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Cortex-X2       | #3696244        | N/A                         |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-X2       | #2119858        | ARM64_ERRATUM_2119858       |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-X2       | #2224489        | ARM64_ERRATUM_2224489       |
@@ -205,6 +209,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-X2       | #4193788        | ARM64_ERRATUM_4118414       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Cortex-X3       | #3696239        | N/A                         |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-X3       | #3324335        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-X3       | #4193786        | ARM64_ERRATUM_4118414       |
@@ -215,6 +221,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-X4       | #4118414        | ARM64_ERRATUM_4118414       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Cortex-X925     | #3043240        | N/A                         |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-X925     | #3324334        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Cortex-X925     | #4193781        | ARM64_ERRATUM_4118414       |
@@ -231,6 +239,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-N1     | #4193800        | ARM64_ERRATUM_4118414       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Neoverse-N2     | #3696250        | N/A                         |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-N2     | #2139208        | ARM64_ERRATUM_2139208       |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-N2     | #2067961        | ARM64_ERRATUM_2067961       |
@@ -245,12 +255,16 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-N3     | #4689341        | ARM64_ERRATUM_3821522       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Neoverse-V1     | #3696285        | N/A                         |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-V1     | #1619801        | N/A                         |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-V1     | #3324341        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-V1     | #4193790        | ARM64_ERRATUM_4118414       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | Neoverse-V2     | #3696242        | N/A                         |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-V2     | #3324336        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-V2     | #4193787        | ARM64_ERRATUM_4118414       |
@@ -279,6 +293,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | C1-Ultra        | #4193780        | ARM64_ERRATUM_4118414       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | C2-Ultra        | #4196850        | N/A                         |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | MMU-500         | #562869,        | ARM_SMMU_MMU_500_CPRE_ERRATA|
 |                |                 | #841119,        |                             |
 |                |                 | #826419,        |                             |
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index a8a1a73ba1b8..710d44a30d29 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2010,7 +2010,28 @@ static bool hvhe_possible(const struct arm64_cpu_capabilities *entry,
 
 bool cpu_supports_bbml3(void)
 {
-	/* CPUs that support BBML3 but dont advertise through ID_AA64MMFR2_EL1 */
+	/*
+	 * CPUs that support BBML3 but don't advertise through ID_AA64MMFR2_EL1.
+	 *
+	 * The following CPUs advertise BBML2 and are known not to raise
+	 * conflict aborts, but are excluded because of errata that can cause a
+	 * load or store to livelock when changing mapping size without
+	 * break-before-make:
+	 *
+	 *   3043240: Cortex-X925
+	 *   3043263: Cortex-X4
+	 *   3053180: Neoverse-V3 and Neoverse-V3AE
+	 *   3683289: C1-Ultra and C1-Premium (before r1p1)
+	 *   3696239: Cortex-X3
+	 *   3696242: Neoverse-V2
+	 *   3696244: Cortex-A710 and Cortex-X2
+	 *   3696250: Neoverse-N2
+	 *   3696285: Neoverse-V1
+	 *   4196850: C2-Ultra
+	 *
+	 * Cortex-A510 also advertises BBML2 but can generate conflict aborts,
+	 * independently of errata, so it does not meet the BBML3 requirements.
+	 */
 	static const struct midr_range supports_bbml3_list[] = {
 		MIDR_ALL_VERSIONS(MIDR_NVIDIA_OLYMPUS),
 		MIDR_ALL_VERSIONS(MIDR_NVIDIA_RIGEL),
-- 
2.43.0

