Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.142
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795123920;
	b=q1ADZtRzMV2sXwhHuvTziX6sLuEviaR4HHflruHYDuE278VDoH/zbR9W668f0PHm7+LY
	 RxqHTHwRbH/OCQIMwnujpTMLa2FTrBQldId1i8E3t0a0SF3q72rO7htv0va39wZuvR0T3
	 dBFytK0OU0+dsPND3Cr/Bs9eGW6rdqWWVIvgMZxFTTxly38SxH6UPBvUoISbjxO6wdhg0
	 /th6BA4K+G5rV2Ih4NkZbL5cDtFr15UReP101QokmVFJZz3L9l8x6Jt0hzbXbyPPGgSKV
	 ns+L542R5sI0IR4zGXbGOz5dKVqS2yfmdiEjIUj0Vf3LcaFc4d/44fG9C5zgNLuorXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795123920;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=z82Fi18D8IzxzM7snm4f0enJxLNYAonxvUBFSN19rNE=;
	b=0nyTBLaXQbfhOy++LnaPYt5rqgKzmqeJTpA3IO+brHzlV79WKLemZ12+Jp0/9POM8L04
	 JRXcvcp2+DwFZj76VcuhZ5sli2MAljmk8B3/LFdx6ALAgmt1qrcPEqY3s+RueVz2G2cLG
	 ZPQcI1rs0W1csnHWBolnrTJjI9MPfyYsS8G/zD/q5mKNfrvkprJi09oCz9oQRVbW4cBT7
	 KBjzCdYhWrg1HzmQKuUf1fpja4jC2ZBcHz++dmqA7iJe3Z6ow57OZPHLP0zEiu0nS7ums
	 Aw7+QZmszecLQ95aaEpJ9r5rhWQ/V9XtKNdv5hMDk6BGYkccYErfowHXvj5Q3ct9BUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qyZBAUrc;
	arc=none smtp.remote-ip=95.215.58.142
Received: from mta1.migadu.com (out-142.mta1.migadu.com [95.215.58.142])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05F6606A33F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:31:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A05F6606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qyZBAUrc
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=FQgocnJVGX/UOY3g+Sx9R6WdMZmKAPZnWIEEeOVH290=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795123917; v=1; x=1795728717;
 b=qyZBAUrciq0cRBwUw7Ly2XcqfONyylaAvv+F//yn+cysuEMD/kN1kAc4tmDFQvIS19JGpEuu
 dT6nWUk4lGhaEcEkl+bGD8eEspjxj6pmFPPkr75CTvkw+vymVZmizgexfhvNbUmATfIpIvHngK4
 vvQhC1Gd7W2lXc7dEKTFvbCI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id a7fa74e5abb5802f;
	Thu, 19 Nov 2026 21:31:57 +0000
X-Mizu-Trace-ID: a7fa74e5abb5802f
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	kees@kernel.org
Cc: hpa@zytor.com,
	gustavoars@kernel.org,
	ardb@kernel.org,
	hca@linux.ibm.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	kernel-team@meta.com,
	rkeilty@meta.com,
	atish.patra@linux.dev,
	dgreid@meta.com,
	Usama Arif <usama.arif@linux.dev>
Subject: [PATCH 1/2] x86/boot/startup: Disable kernel stack depth tracking
Date: Thu, 19 Nov 2026 13:31:07 -0800
Message-ID: <20261119213147.1094488-2-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261119213147.1094488-1-usama.arif@linux.dev>
References: <20261119213147.1094488-1-usama.arif@linux.dev>
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

Commit 57fbad15c2ee ("stackleak: Rename STACKLEAK to KSTACK_ERASE")
renamed DISABLE_STACKLEAK_PLUGIN to DISABLE_KSTACK_ERASE everywhere
except in arch/x86/boot/startup/Makefile. The old name now expands to
nothing, so the startup code is built with stack depth tracking enabled.

The startup code is linked with every symbol prefixed by __pi_, so that
it cannot call into the rest of the kernel by accident. It has no alias
for the tracking callback, and tracking stack depth there is of no use.

At the default KSTACK_ERASE_TRACK_MIN_SIZE of 100 no startup function is
large enough to be tracked, so this went unnoticed. With Clang,
CONFIG_AMD_MEM_ENCRYPT=y and a minimum below about 90 bytes,
pvalidate_4k_page(), snp_cpuid() and do_vc_no_ghcb() get a call to
__sanitizer_cov_stack_depth() and vmlinux fails to link:

  ld.lld: error: undefined symbol: __pi___sanitizer_cov_stack_depth

Use DISABLE_KSTACK_ERASE, which disables tracking with either compiler.

Fixes: 57fbad15c2ee ("stackleak: Rename STACKLEAK to KSTACK_ERASE")
Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 arch/x86/boot/startup/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/boot/startup/Makefile b/arch/x86/boot/startup/Makefile
index 5e499cfb29b5c0..0815105e7205c7 100644
--- a/arch/x86/boot/startup/Makefile
+++ b/arch/x86/boot/startup/Makefile
@@ -3,7 +3,7 @@
 KBUILD_AFLAGS		+= -D__DISABLE_EXPORTS
 KBUILD_CFLAGS		+= -D__DISABLE_EXPORTS -mcmodel=small -fPIC \
 			   -Os -DDISABLE_BRANCH_PROFILING \
-			   $(DISABLE_STACKLEAK_PLUGIN) \
+			   $(DISABLE_KSTACK_ERASE) \
 			   $(DISABLE_LATENT_ENTROPY_PLUGIN) \
 			   -fno-stack-protector -D__NO_FORTIFY \
 			   -fno-jump-tables \
-- 
2.53.1-Meta

