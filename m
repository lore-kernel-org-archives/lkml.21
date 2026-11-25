Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795587376;
	b=IaPJU1gXYFe00uYOQreWOCw1w/sMNeAxlwt0N/HG/iiWaXt9U4IEr7PRjBGteti/BnYJ
	 3VtvSyQsRCfiXg9O/TkpudaiJyvaU9NNpm5abZLRiKd3kFan5lxMeUh0eaRlu2CW9SxQC
	 5kk8uWP8kRZvtjMdkwhHT+42qjPnvp27lt4w3q35LsA+mvKF6cRjjLwkCuPMToYjpOodm
	 8ihm79v93A3xVvzgv7z9WGbGNMDkEL7qbJFVZQUe3GUNjMLkGpuE+1xFQLZpOXNv899Wu
	 9Vb82Tw1t0hmDhoItz3tk2bqxB5RpmhjnZo9eMD/n5mqLg/KqeFkogAMY7qPZdNS6+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795587376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=GGDahMitB3LSpaFaJkVUo1Pzx9kbamS5IbDP2+gBQRY=;
	b=HSmXvhG2F4vE79yua4P23HVkar3qEEPBQVVXw9wa+uibaRWZLOnEv47GfZ/eLLH2AJmk
	 iasKsDOPGwtRn0EAh2G4hi9irBOjnazOtsnfcZtZ27zglJ1o06VGPlTdUkqXDSh+oIJuu
	 ybTixGu23FQ+qe//BKRXBQ5ljsikXsoXY0l85ELqfDvlqAc0mot/gjI9OJMcKfcCfvBy0
	 DIPMr5+blaNB+qfPFBFMoHfRMQHr/DPIxl3onXXgBG4Eqz3d93nwbIxf979Buvrt7lPLn
	 3NSaElEM+IQADosi2nEsu8t7GvrZP2f6X8x8QpO1SOVsAV+GZ342XBm2X/uy8KFbF0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NC8TFIwL;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF27607024A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CF27607024A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NC8TFIwL
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b3b45597c7so409859c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795587375; x=1796192175; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GGDahMitB3LSpaFaJkVUo1Pzx9kbamS5IbDP2+gBQRY=;
        b=NC8TFIwLTkPbzeWjMCBEzMycXowBO7nwlg1PQhGSIEdoRdcynFgU3xj0z346DalUvK
         CclzOOgsc08nnESEFqDQN8grEdC2dvQQay+O8qqF/cXS/Sx/3fHPHv22bsBKHsHYhqhL
         N7MKQrt38DWZocIKvHgSCP6atdy4p9PvnCrh+EVUWREweUMREZchFqy91Sxrc/M3Gq0x
         4IxBXWtMXRPrVFIYr3Tg854QTdurR/WVRTSLuOea9bx7plqd3QRfrjLI4E++6f3fadBC
         EcD9m8j1xBeixoCWAUp7sngoetkh00EBHTIE3CwevkPOOdyD58gjHWhr5ITeQvpeR1pk
         iPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795587375; x=1796192175;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GGDahMitB3LSpaFaJkVUo1Pzx9kbamS5IbDP2+gBQRY=;
        b=YxOKCkkFCg8VuknLbwztkcQ9qgBoFnyn+YtCdC9jjuiprwv1Q1WYpqHCnzn2/V+nGh
         vhfHpr/KRkBfEZYVrv9CXmUMM25JPTr0nYzVYXLjNEaahSrM+xdu+LBnjDjF1IGKqRBy
         T6kGAkVpUdw2vdYw9wawNXq/NNrofG1xmF3K5A7NIh9o4l2c8RzXRefGMuHvs+wWTFJY
         wxGDb7yLTpZg8vb0LeZJPevY4VHOMsv4itVjV/zS1M9h0qwOlNeHwroeZB5XbHI2x7/p
         oXHHOe4UVAJz41vWZBFxPCR129h+m79Q2Z6aI9MO/Hg44WiqpvWAh+NSwpzSWnTEJ1Xj
         YXTw==
X-Gm-Message-State: APuU4Z9JEapgqHoYUGMo/4mMiTEewg/02XZDWi4o+5s0Ndbkir5BfykX
	myqxvN+diu0/r+bi0c6GnTHX40Nr8rgTJNUpXaKVro8/LA//y+MUxSyfyh4UF0RPoYZtzpMAxcN
	GAGshv9hnbUjrSFD+WXoC+yJHOxZ+yAB7mLalfgiHzPo6nFv/kGlscW53O/FU8Wt97onZqZs6Ih
	uxv7Q2sH+P0GjG964Y9JcvN/r4IzZRkwhcJ8FWrssLWpIuCnBsUw==
X-Received: from dloo27-n2.prod.google.com ([2002:a05:7023:a5b:20b0:1b5:8761:cc11])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:b902:b0:1a5:9abb:fdd7
 with SMTP id a92af1059eb24-1b556877a2bmr15589113c88.9.1795587374885; Tue, 24
 Nov 2026 22:16:14 -0800 (PST)
Date: Tue, 24 Nov 2026 22:15:02 -0800
In-Reply-To: <20261125061523.1540234-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261125061523.1540234-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125061523.1540234-10-irogers@google.com>
Subject: [RFC PATCH v2 09/30] efi/libstub: Disable unwind tables in x86 and
 RISC-V EFI stubs
From: Ian Rogers <irogers@google.com>
To: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org
Cc: jpoimboe@kernel.org, rostedt@goodmis.org, peterz@infradead.org, 
	mingo@redhat.com, tglx@kernel.org, bp@alien8.de, dave.hansen@linux.intel.com, 
	x86@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, acme@kernel.org, namhyung@kernel.org, 
	linux-perf-users@vger.kernel.org, mhiramat@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, bpf@vger.kernel.org, 
	nathan@kernel.org, llvm@lists.linux.dev, nsc@kernel.org, 
	linux-kbuild@vger.kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, ardb@kernel.org, linux-efi@vger.kernel.org, 
	maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, indu.bhagat@oracle.com, jremus@linux.ibm.com, 
	wnliu@google.com, dylanbhatch@google.com, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Pass -fno-unwind-tables and -fno-asynchronous-unwind-tables when
building x86 and RISC-V EFI libstub objects so enabling kernel-wide
asynchronous unwind tables under CONFIG_UNWINDER_DWARF_CFI does not emit
unwanted .eh_frame sections into the standalone EFI boot stub.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/firmware/efi/libstub/Makefile | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index bbab12b8eb4b..19c2822eb302 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -19,7 +19,8 @@ cflags-$(CONFIG_X86)		:= $(filter-out -mcmodel=kernel \
 				     $(PADDING_CFLAGS), $(cflags-y))
 cflags-$(CONFIG_X86_32)		+= -march=i386
 cflags-$(CONFIG_X86_64)		+= -mcmodel=small
-cflags-$(CONFIG_X86)		+= -fPIC
+cflags-$(CONFIG_X86)		+= -fPIC -fno-unwind-tables \
+				   -fno-asynchronous-unwind-tables
 # Nothing enables IBT while the stub runs, so ENDBR would only take space.
 cflags-$(CONFIG_X86)		+= $(call cc-option,-fcf-protection=none)
 
@@ -29,7 +30,9 @@ cflags-$(CONFIG_ARM)		+= -DEFI_HAVE_STRLEN -DEFI_HAVE_STRNLEN \
 				   -DEFI_HAVE_MEMCHR -DEFI_HAVE_STRRCHR \
 				   -DEFI_HAVE_STRCMP -fno-builtin -fpic \
 				   $(call cc-option,-mno-single-pic-base)
-cflags-$(CONFIG_RISCV)		+= -fpic -DNO_ALTERNATIVE -mno-relax
+cflags-$(CONFIG_RISCV)		+= -fpic -DNO_ALTERNATIVE -mno-relax \
+				   -fno-unwind-tables \
+				   -fno-asynchronous-unwind-tables
 cflags-$(CONFIG_LOONGARCH)	+= -fpie
 
 cflags-$(CONFIG_EFI_PARAMS_FROM_FDT)	+= -I$(srctree)/scripts/dtc/libfdt
-- 
2.56.1.831.g720f3f5937-goog

