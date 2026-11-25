Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603805;
	b=bgznppXSt1tZ7X/aKiETfczDSdDmbEpdZovNcELwsbb5N7cV/mHUk4YqS0DT/e53xtnh
	 VuNy8yOS2dmJwoAbsYstxZFhyr3dpzalFoeRWZM+zrhBsjhgXjSsOITiJ0503uqedMWDa
	 7v5lk4MjVdNw6KRePGiZZEK9gpAsnSf32bJ7YJ3xofO7LDL6snPZ0Aiz8rs2RMzh0MFoE
	 pcv13zSwjvw0S0vDuzWphxBdFQfBAt1HiTCSnLYNgaBp2h+URiz+87jVPfpOopfxy6dll
	 lZhZAgniQK5FIqA6C9+lVyXBLzbZVy7ENWdttvrYE4kXhRMoAJbYWyAzDULtmnRCDGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603805;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Developer-Key:
	 X-Developer-Signature:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=iNsoMr6T6H6tXBBcGO5QuTopXNx9EbRoa5Eh8+XiL8s=;
	b=2gcuX09tpOqjgZlrFEFcyUc9Qfs69w7ColOQMiXHXA07WiMI1TbUxST39D7GWe1CCmrn
	 223M0mQCC0CiW2CZXuIazktZ70XaUfQ+oJnKYFESEjsKk0p4WIMUNCd2LIbtqVVji3DPt
	 KmwAeSTG3/7MN7zG4ZCcxWI33K65//3TkPXw/L34hzl7wlT/O7nT5Ko0IlPFPucclyP2g
	 W+EAHo1llV7z2dTLNxiQTlzRj5AOXDDlkxHbSjyP6tGc3XCHngdlFYm1NmgzmwvSX6K5K
	 lriDGMcPN5+u+H2bLHhtlgF+vr7hcsSzB3YNhMdBSITv5rpy7UkMTdjVgn035Ulmq1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XXusy5Vn;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183AA606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:50:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 183AA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XXusy5Vn
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4bb818d8dcfso28060155e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795603803; x=1796208603; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iNsoMr6T6H6tXBBcGO5QuTopXNx9EbRoa5Eh8+XiL8s=;
        b=XXusy5VnFGz9SF2SfbBV/J3N4CTzCtnGh0MdFKuglpPBF5KLQikIMm3ppNi83fKOO9
         1NMpS1hPb5MTFNTDruR7gEknH+3kyg4ti+CCokYZVonCQ08R4eX793vQr/WVv36m51Ti
         Rk2rdwO5IC3klW5ffdujkYLwDzZ/bWwKot4CChlxgXUKYEb0MiO0SjYJs958zoUf4A7m
         MK7CYVXfvdTjVvaGqXcLNwwV5RjR5EbmGHOAPnjNZO1E3IHlFKpvh8mAwfGrPFnYwFDN
         +y2VexXQSAQndz0OIRkbLZ3IEAhuxkDrdiHBHFCj3IwQSp+AECuEdmfYGP2aPDEL1qLE
         0EvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603803; x=1796208603;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iNsoMr6T6H6tXBBcGO5QuTopXNx9EbRoa5Eh8+XiL8s=;
        b=ZYEplNquwy9iUAaKzCW5VAA7dueQT7tNQpOsPCmRy1kjzGLl8Y0DpACgE2e1XW5f1b
         Zyg0tm2EGyfLDpbL5eTU8ZAwRMUQAtRJTMnu84CEK5rKKqqRCSP+At1hmbfmqED+fmlc
         oEAqCP2g05i2vKQWkQdAbIW1eBuj4HaBTtEChr2VR14LuShIxx9nc7JJaIOK+LK/8DII
         kP/RCbLJZjKeoaK741T6/oKGOvBfbpTpsAEooCIkLmYuTKzDbNln8bjHwvztKioPgfP2
         7d2JI72e2APeuUKB6hZ89zQcZ5V9RGS6a2Ax779yZTLPmf4qHhjivf2EfIQNyzo8kIMS
         PgQA==
X-Gm-Message-State: APuU4Z8IHGdwUPP3Lk/I54J+JJ/IKKAblMCBW4nnuFjiJTa9tdwrtCUR
	8B12r2GbH3IZtO9+L/Gkez25LtjowfHmUNmc8c+5aEQGZcSt9mJq4r1kyBoB/8vGYYLuROpiRWP
	Arxgu8oHHriimWD1NxM9Exs1FkJkth0/oiLfKl92zSaY+kwcXVRh9BzPU7tBCUFL6NFzgDz8i27
	dvqyzVcy+SbOCHEBDszdh9zcnGzvbbPrFo9w==
X-Received: from wmdp22.prod.google.com ([2002:a05:600c:5d6:b0:4a2:1824:f77d])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4fc1:b0:4bb:53e4:a7cc
 with SMTP id 5b1f17b1804b1-4bb88820741mr391672135e9.30.1795603803163; Wed, 25
 Nov 2026 02:50:03 -0800 (PST)
Date: Wed, 25 Nov 2026 11:49:54 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3347; i=ardb@kernel.org;
 h=from:subject; bh=xnrI87ZBQQSKaohYJde0WQjUe3lWmPb1HGDjkOQx43Q=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIZttb1CThVWc8y5vbfFdwlWLblg7Na/yWDJP43WKVuXyx
 R3ld5Z0lLIwiHExyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgIn8LGRkOHVTes33gwV3b87W
 MNNTFpqsuO26quC/nJSNR56H/lO5+orhf7ryo5Rn/74n6BlOq7X/aMhq9iXynGPSgnbbt/lpG9R 3MQMA
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125104953.381561-2-ardb+git@google.com>
Subject: [PATCH] x86/percpu: Use address space loads for per-CPU reads when
 using Clang
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Clang never discards inline asm with memory operands, even if its result
is unused [0]. This means unused per-CPU reads are always emitted,
including the load of this_cpu_off by this_cpu_ptr() in cases where the
resulting pointer is never dereferenced.

Clang's support for the __seg_gs/__seg_fs named address space qualifiers
is insufficient for full CONFIG_USE_X86_SEG_SUPPORT, but works well
enough [1] for plain loads, and is present in all versions of Clang that
Linux still cares about. So use those to implement __raw_cpu_read() on
SMP, permitting the compiler to elide them when the result is unused.

On a v7.4-rc1 defconfig build, this gets rid of 174 spurious per-CPU
loads, 136 of which are loads of this_cpu_off from this_cpu_ptr().

[0] https://github.com/llvm/llvm-project/issues/245738
[1] Exclude KMSAN, which ignores the segment base when instrumenting
    such loads.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Bill Wendling <morbo@google.com>
Cc: Justin Stitt <justinstitt@google.com>
Cc: llvm@lists.linux.dev
Cc: x86@kernel.org

This supersedes "locking/local_lock: Don't evaluate the per-CPU lock
pointer if unused"

https://lore.kernel.org/all/20261122105646.2223131-2-ardb+git@google.com/

 arch/x86/include/asm/percpu.h | 25 ++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/percpu.h b/arch/x86/include/asm/percpu.h
index cef9a4ca9841..40262edef878 100644
--- a/arch/x86/include/asm/percpu.h
+++ b/arch/x86/include/asm/percpu.h
@@ -32,13 +32,13 @@
 
 #define __force_percpu_prefix	"%%"__stringify(__percpu_seg)":"
 
-#ifdef CONFIG_CC_HAS_NAMED_AS
-
 #ifdef __CHECKER__
 # define __seg_gs		__attribute__((address_space(__seg_gs)))
 # define __seg_fs		__attribute__((address_space(__seg_fs)))
 #endif
 
+#ifdef CONFIG_CC_HAS_NAMED_AS
+
 #define __percpu_prefix
 
 #else /* !CONFIG_CC_HAS_NAMED_AS: */
@@ -144,6 +144,25 @@ do {										\
 
 #else /* !CONFIG_USE_X86_SEG_SUPPORT: */
 
+#if defined(CONFIG_SMP) && defined(CONFIG_CC_IS_CLANG) && !defined(CONFIG_KMSAN)
+
+/*
+ * Clang never discards inline asm with memory operands, even if its result is
+ * unused. Its named address space support is sufficient for plain loads, so
+ * use those instead, allowing unused per-CPU reads to be elided. KMSAN is
+ * excluded as it ignores the segment base when instrumenting such loads.
+ *
+ * Once CONFIG_USE_X86_SEG_SUPPORT is fully implemented in Clang, this version
+ * can be dropped.
+ */
+#define __raw_cpu_read(size, qual, _var)				\
+({									\
+	*(qual TYPEOF_UNQUAL(_var) CONCATENATE(__seg_, __percpu_seg) * __force) \
+		(__force uintptr_t)&(_var);				\
+})
+
+#else
+
 #define __raw_cpu_read(size, qual, _var)				\
 ({									\
 	__pcpu_type_##size pfo_val__;					\
@@ -156,6 +175,8 @@ do {										\
 	(typeof(_var))(unsigned long) pfo_val__;			\
 })
 
+#endif
+
 #define __raw_cpu_write(size, qual, _var, _val)				\
 do {									\
 	__pcpu_type_##size pto_val__ = __pcpu_cast_##size(_val);	\
-- 
2.56.1.831.g720f3f5937-goog

