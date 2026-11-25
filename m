Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649438;
	b=V+LrCN4muolKUBeBQeN9XVhmibjMgrYuUmeYdOkKWX4ug2Px2fSpLT1jzAc3sz1gFoU6
	 8TUbxYAtXUBUHV0YuTr9rHq8Ozo3nKgQl0ZpIwqytMR68qCqNvMnsTUJl1T64Bn54qXja
	 /p1ROi/Np4G5xRJvl0P1c+hIsoGfHd6rqMP681hzvpCKSpVhkOX/ceTUFhlPYfi+CWb2V
	 DEG2lNhoY/mGCWeIvN2VbMw3JkVVNtfOMvtrI+J2q5J86xdBP2TA6SiYZrENUTJ0RwyXX
	 SODfNjxnAPaE/CiwKmj5xH7nieX6UyycYnb2+GrzAltaiaw7n5K66zCAeBLrmRmr63g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649438;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=I4lPFLfieT6FbOV9CarxN3ibaJh2DCsYwIF1QQUH44s=;
	b=H9E57/3n7K9uU38Y6AUOgjZQNNlHO7xz4LVjmWtZ6hA8jdzGw83VKBZs+kLbRfonzeDl
	 eFQUmidJ924Hk1JOwD8tlyRSvCxzv5959U8DKG0z8y9hmf6eFNbKpNk8O0edX30VVKMx2
	 WYtltWMKN2C/RjwFXYYJ5w/psY85OqdUn6xb//NQMf0Goo1wXCF5T5fFQhz2S21nv/gti
	 +dJ7eA+Jvb1Al7BELqmB/PxLCsDgoWeGtQEKPcbxVra1H7IP37OC/OPsIgHPuMpedSLOi
	 /i4f2vTgF5+0FuaBO/mKgtdXktfP9BtaNB+yUFysrabYT33LaJAJqfkgGxGoYbprUEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pTGQiRRF;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5051D606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5051D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pTGQiRRF
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so3475416f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649437; x=1796254237; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I4lPFLfieT6FbOV9CarxN3ibaJh2DCsYwIF1QQUH44s=;
        b=pTGQiRRFzN76093oJQhpelOIJZWB6JaiGo7CsCslbyUbzSUKe4IAunceq2PZv5Z7Ht
         qbUD/mYL1yuDvJJJ9IGaGqgV4V2aXHHDR5ON1z5zs/KL56d/g6O1Wx4iz8TGQMLk4ivV
         1o8oFE0q2MAyy0jFnQPPuegEmCwYI6N7s4+BTj5WK8x9X+QaZmBy7kjI0fwBm9D6Hi1j
         RVyS2vvBeKXEmGmu0XeI/6tJXcoUzgg/bjFpsvYGpWGFfqKOxOjuGgkYLNLhqYQKl3dT
         uEmRHj+e3ogm2Y9Sn94qqc6ZqiZyw83O6P2Bq8Thxr1D6RCeLe4MrYFmo/xlldVikqof
         hGzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649437; x=1796254237;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I4lPFLfieT6FbOV9CarxN3ibaJh2DCsYwIF1QQUH44s=;
        b=ofQ0xGK1svwfvA3AmkiJx0uWGy823P7vPD3FVF7BIxtVd+8OcFOMNK0sa+tp01OEoI
         m/zBB5AcB3mxX/hr/FKq3yTGDAAyHhaQHwCZsLBfJnmJa2Kwv8td+UUPYIDKHnebk4zx
         +QGv6qw+5jjrU1P903NlekGtTLsDhKqX4R9oJFCTVgdicbvbdxIBNWL3NP4+Cuhoycwz
         LVrQnzxQmXEn0PkeFsmB6MVHRlhxGuBg8p0DtRkstkZHkyFLqZbT9B6DSFt+g1TqcUdF
         0grTXoDsz2kef+YBkTqt5BqneXf6cgIMo3KqsONfgCeeASG6skUGKbzgcDdAs6ulDF94
         qMZw==
X-Forwarded-Encrypted: i=1; AL+hErFSz8TC/UiRy1IVH6ZRpmbe8CiXXH47T0mxvxb1trwiesB2T3IXZrMx9M6a9mUY84p2zkCkoykAspzjTeU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ICCUBy4XuYYaSV0on06QXuIaGnQzXqzgTZtB7Ho0P/hV9bNtE
	SpCkVlPRL5uWbXDbcCg6mH7WRp5uP3k2A8lAS8Qz3wiDpSZvB5KhFsU9FX8VGxmqeRw=
X-Gm-Gg: AZFdTZebRTcOylgl12PXRvHs4IgYdt8VieHMVyOfWSM9V9yl5AaBACObycc0BsLiH0E
	+sreR4ukfE5UQBJEp4/8Bo03ihvHplGK6vEmX0WCo8rSpaynb6W4oIwY98hUhVZSNijfut0ksBl
	Lyn1dQSCmTn3kwuEAhlBoiVYtxcmFSgfx5kh/Ww93Pymzs2nMwQ5K52mxrADj7md4obr3MpWDtJ
	LR0gswOyj2B/kYP0FQ5aru6sMRWBQAQ3f7wLac85DBc14v4knSfmBQ2NJrU+sw8oII/hQtjyG+L
	2mLay9s3Ux22PqQCFGFo9AvvIN/0b9r4YWYcxD8f6oS/f23hvjtvT8wjI6THj2BAWgj+wMK/ugd
	nC5OxdGo+ZX088qf0QCR0wU5jGvf0C3IKRTlylQce3aWw+H+87tPNbCgzwKryAtMwsJMdv6pecF
	G54qaQ17VNeufZ8rO2qBYG152Y9z2bGh69Y8/ztWP4QaSy/lQBSv76awUfDMN6+u2Aeydab5gPc
	3rftKq4//KfcEbZjl84z2B84l/8XIJvM2BBURlSVxWoIkQCq1pO61eMGL6dT/9m6tfFvQkoCJKi
	1dFVr5p5DgsrAVR3KVLB73Mmsrud2OWGnbYCJbQ6o2SUmWJyEdW2PQXC5tHncfLGSYpa857EEpC
	0gwoA/z67IQ==
X-Received: by 2002:a05:6000:4381:b0:4a6:5a2a:f5a3 with SMTP id ffacd0b85a97d-4abaa9773abmr40225454f8f.3.1795649436500;
        Wed, 25 Nov 2026 15:30:36 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b8b7888sm36661490f8f.42.2026.11.25.15.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:30:36 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH RFC 01/19] riscv: Prepare ESP32-P4 early CLIC trap vectors
Date: Wed, 25 Nov 2026 23:30:02 +0000
Message-ID: <20261125233020.1380594-2-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125233020.1380594-1-vitorhg20080@gmail.com>
References: <20261125233020.1380594-1-vitorhg20080@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The ESP32-P4 HP cores run with mtvec.MODE fixed to CLIC. The legacy
mie and mip CSRs cannot mask CLIC interrupts, and mtvec.BASE requires
64-byte alignment.

Add an opt-in configuration for RV32, single-hart M-mode. Mask local
interrupts through mstatus.MIE at kernel entry. Align the early park,
PMP probe and normal exception vectors to 64 bytes.

AI assisted with the trap entry changes and elaborate the help
description.

Link: https://documentation.espressif.com/esp32-p4_technical_reference_manual_en.pdf
Signed-off-by: Vítor Hugo Silva <vitorhg20080@gmail.com>
---
 arch/riscv/Kconfig.socs   |  9 +++++++++
 arch/riscv/kernel/entry.S |  6 ++++++
 arch/riscv/kernel/head.S  | 13 +++++++++++++
 3 files changed, 28 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index cecbce0c4983..0272923c7d88 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -12,6 +12,15 @@ config ARCH_ANLOGIC
 	help
 	  This enables support for Anlogic SoC platform hardware.
 
+config RISCV_ESP32P4_CLIC
+	bool "Espressif ESP32-P4 early CLIC setup"
+	depends on ARCH_RV32I && RISCV_M_MODE && !SMP
+	help
+	  Enable early machine-mode trap setup for a single ESP32-P4 hart.
+	  This aligns the trap vectors to 64 bytes as required by the CLIC.
+	  During kernel entry, it clears mstatus.MIE to mask interrupts,
+	  since the legacy mie and mip CSRs do not control the CLIC.
+
 config ARCH_ESWIN
 	bool "ESWIN SoCs"
 	help
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 61b7a7716697..f659bf62bb39 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -125,7 +125,13 @@
 		CONFIG_RISCV_USER_CFI)
 .endm
 
+#ifdef CONFIG_RISCV_ESP32P4_CLIC
+	/* mtvec.BASE starts at bit 6 in CLIC mode. */
+	.balign 64
+SYM_CODE_START_NOALIGN(handle_exception)
+#else
 SYM_CODE_START(handle_exception)
+#endif
 	/*
 	 * If coming from userspace, preserve the user thread pointer and load
 	 * the kernel thread pointer.  If we came from the kernel, the scratch
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 1631fd6bc786..f266c4238b2f 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -183,7 +183,11 @@ secondary_start_sbi:
 	call smp_callin
 #endif /* CONFIG_SMP */
 
+#ifdef CONFIG_RISCV_ESP32P4_CLIC
+.balign 64
+#else
 .align 2
+#endif
 .Lsecondary_park:
 	/*
 	 * Park this hart if we:
@@ -210,9 +214,14 @@ secondary_start_sbi:
 SYM_CODE_END(_start)
 
 SYM_CODE_START(_start_kernel)
+#ifdef CONFIG_RISCV_ESP32P4_CLIC
+	/* The CLIC uses mstatus.MIE to mask interrupts globally. */
+	csrci CSR_STATUS, SR_IE
+#else
 	/* Mask all interrupts */
 	csrw CSR_IE, zero
 	csrw CSR_IP, zero
+#endif
 
 #ifdef CONFIG_RISCV_M_MODE
 	/* flush the instruction cache */
@@ -233,7 +242,11 @@ SYM_CODE_START(_start_kernel)
 	csrw CSR_PMPADDR0, a0
 	li a0, (PMP_A_NAPOT | PMP_R | PMP_W | PMP_X)
 	csrw CSR_PMPCFG0, a0
+#ifdef CONFIG_RISCV_ESP32P4_CLIC
+.balign 64
+#else
 .align 2
+#endif
 .Lpmp_done:
 
 	/*
-- 
2.56.1

