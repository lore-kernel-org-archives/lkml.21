Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794954164;
	b=ftTG/oumPdA1f/gxIQ39zPgEAYp2Nx/n8iRotC+IuLKH5TfTH88u3Omx7HAqV0oC6FMl
	 CPuEtYYNwQR3NReoH7qUuyv2/cPT9NuV7qYp3Q523vDS0xSdjdyU3eTxMNZwlhoEIFRes
	 zFQCnuFt9MvA3R0dnjXCvpQ3bBUMFwqLXztarD2jTy0EcbeGlA9aSVkvMr7Pd9rxFrbhs
	 j69lwM39iLh64X1kXODBmK1B8JUhYiROudtOy5yZGKTJxx/PJ/qMPxGfdh+NPfsZRt7Xe
	 kexJ17QKi/nicwmrIxkKtEcPfPy+E+Kru49FiFRCWSeXqVGcCoAlwmowDOAtbZtEErw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794954164;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=aBFHMhIIgXSbrUwb5q/wyndf+CH2M/iCX62Dg3RgmNw=;
	b=svjDtquIP+wGksQnn7pCrnJltPtWKVqp6ae2At7jvMHEyUhvkjnB16QSfKxdIevbHyAJ
	 qokfivu3lxWJMZ2iGGEqxnPeJ8tscNFPpL4BTxAuMqKLHSvHIKu//FOxWV3NxcnVGKIwD
	 B6S5wQblDCjX0wa5A4NgGIRy70x+aGUUf9F9QNqC3eew6mxh7pNOag3m0zedh0gBXZHpf
	 50Xg4KsvZS2I3BdvsdxKRvBGzZGT2XlCa9FUy7bW6ZI1q9ArMBoexvvRJHODy9ZpNeHvF
	 rvMZAkA6BCcLIxnGf9qTYAIqSz22wpsG8bNtDvRF6rb8Bjhr1dVZH0HNY5VEzBomXgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KGyYeJ0V;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00939606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KGyYeJ0V
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEEC11F000C5;
	Tue, 17 Nov 2026 22:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794954163;
	bh=aBFHMhIIgXSbrUwb5q/wyndf+CH2M/iCX62Dg3RgmNw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KGyYeJ0Vf8De+YOCbdp6qmWzBa5JiXoUaJ2xjZMvRbE6tucogxspja2Gsf6XcO/BB
	 Qy4PKsAFUvJsdH/McX3YRDGcuZ1EWovtlIuX2IbXbVGa77Lyn4ZdIAsS5abCPU7g11
	 Ry1b54Qcooc7UPZjKacjJxhtF0cguTkG8Y0ANY1qI123xwgjB5sxPW51M1oFi7vk0b
	 x977Iv3BdkwqVW3BrF3wT8vNpAL4RArfCvFGIuMcSjzrYYKrW9OrbdfbTwDSQZuCD5
	 EAGOltNOWZ63vqGgE8FX1bZVDcBm8cFt/obgfQHOmLtFFQYIf4sMEPfm6PhIT37xwx
	 BK8o2mCIGFVsg==
From: Arnd Bergmann <arnd@kernel.org>
To: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Navneet Singh <navneetsingh@microsoft.com>,
	apais@microsoft.com,
	hargar@linux.microsoft.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: add HWCAP3_LS64_ACCDATA
Date: Tue, 17 Nov 2026 23:22:23 +0100
Message-ID: <20261117222224.1465328-2-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117222224.1465328-1-arnd@kernel.org>
References: <20261117222224.1465328-1-arnd@kernel.org>
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

From: Arnd Bergmann <arnd@arndb.de>

LS64_ACCDATA extends the LS64 feature with the user-space ls64bv0 instruction
and the EL1 ACCDATA register. Like LS64, it was added with Armv8.7, and it
roughly corresponds to the 'enqcmd' feature for shared hardware workqueues
on x86 CPUs as described in the kernel's SVA documentation. [1]

Userspace can check availability of HWCAP3_LS64_ACCDATA to see if the shared
hardware workqueue feature is possible on a given driver.

Link: https://www.kernel.org/doc/html/v7.3/arch/x86/sva.html#enqcmd [1]
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 Documentation/arch/arm64/elf_hwcaps.rst | 7 +++++++
 arch/arm64/include/uapi/asm/hwcap.h     | 1 +
 arch/arm64/kernel/cpufeature.c          | 1 +
 arch/arm64/kernel/cpuinfo.c             | 1 +
 4 files changed, 10 insertions(+)

diff --git a/Documentation/arch/arm64/elf_hwcaps.rst b/Documentation/arch/arm64/elf_hwcaps.rst
index f60ca5612daa..f63035696654 100644
--- a/Documentation/arch/arm64/elf_hwcaps.rst
+++ b/Documentation/arch/arm64/elf_hwcaps.rst
@@ -478,6 +478,13 @@ HWCAP3_SVE_LUT6
     Functionality implied by ID_AA64PFR0_EL1.SVE == 0b0001 and
     ID_AA64ISAR2_EL1.LUT == 0b0010.
 
+HWCAP3_LS64_ACCDATA
+    Functionality implied by ID_AA64ISAR1_EL1.LS64 >= 0b0011. Note that
+    the function of instruction st64bv0 requires support by CPU, system
+    and target (device) memory location and HWCAP3_LS64_ACCDATA implies
+    the support of CPU. User should only use st64bv0 on supported target
+    (device) memory location, otherwise fallback to the non-atomic
+    alternatives.
 
 4. Unused AT_HWCAP bits
 -----------------------
diff --git a/arch/arm64/include/uapi/asm/hwcap.h b/arch/arm64/include/uapi/asm/hwcap.h
index 10272ddb4d6f..c85c445275f6 100644
--- a/arch/arm64/include/uapi/asm/hwcap.h
+++ b/arch/arm64/include/uapi/asm/hwcap.h
@@ -155,5 +155,6 @@
 #define HWCAP3_F16F32DOT	(1UL << 9)
 #define HWCAP3_F16F32MM		(1UL << 10)
 #define HWCAP3_SVE_LUT6		(1UL << 11)
+#define HWCAP3_LS64_ACCDATA	(1UL << 12)
 
 #endif /* _UAPI__ASM_HWCAP_H */
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 952f70a48190..bbd809c83a6c 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -3226,6 +3226,7 @@ static const struct arm64_cpu_capabilities arm64_elf_hwcaps[] = {
 	HWCAP_CAP(ID_AA64ISAR1_EL1, DGH, IMP, CAP_HWCAP, KERNEL_HWCAP_DGH),
 	HWCAP_CAP(ID_AA64ISAR1_EL1, I8MM, IMP, CAP_HWCAP, KERNEL_HWCAP_I8MM),
 	HWCAP_CAP(ID_AA64ISAR1_EL1, LS64, LS64, CAP_HWCAP, KERNEL_HWCAP_LS64),
+	HWCAP_CAP(ID_AA64ISAR1_EL1, LS64, LS64_ACCDATA, CAP_HWCAP, KERNEL_HWCAP_LS64_ACCDATA),
 	HWCAP_CAP(ID_AA64ISAR2_EL1, LUT, IMP, CAP_HWCAP, KERNEL_HWCAP_LUT),
 	HWCAP_CAP(ID_AA64ISAR3_EL1, FAMINMAX, IMP, CAP_HWCAP, KERNEL_HWCAP_FAMINMAX),
 	HWCAP_CAP(ID_AA64ISAR3_EL1, LSFE, IMP, CAP_HWCAP, KERNEL_HWCAP_LSFE),
diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
index 94e6cd211d70..009de5255d2d 100644
--- a/arch/arm64/kernel/cpuinfo.c
+++ b/arch/arm64/kernel/cpuinfo.c
@@ -158,6 +158,7 @@ static const char *const hwcap_str[] = {
 	[KERNEL_HWCAP_F16F32DOT]	= "f16f32dot",
 	[KERNEL_HWCAP_F16F32MM]		= "f16f32mm",
 	[KERNEL_HWCAP_SVE_LUT6]		= "svelut6",
+	[KERNEL_HWCAP_LS64_ACCDATA]	= "ls64_accdata",
 };
 
 #ifdef CONFIG_COMPAT
-- 
2.53.0

