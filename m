Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795672460;
	b=YVqlTBsoCWndv2eBym3bU53PT/RCV0p+OrIgSNU0iGi14PPwzKP+Hz9F3xMnXk0z9FLt
	 OvkJ4HQlPPqnVDFsrNGUbC0RUmSX3ca2eWpzA4zqEPb94nIUQ/aOzsW/Bl84fBJECmzdi
	 j0WYobyyx/y1toyhk4grTW32qXQYS6aeWqsx024qWXI/3lX+QSRq09S90oOsNv1QPalvK
	 vFoWdU+7UhKAPGaGX4+8Kymm228cDkv/o2uiIy3VKm4VlCHqOonIALi1PZY7+VLx+Hm1Y
	 Apl/QBhiNF8UTLdMoo4Qy56EJ5NzywWmCgCWzS5rFhAiYME/6KDaecLz+T14GwJDSbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672460;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6sqiVTrDEe2NBuw3nlAAoo2cHvqlzBtrt28T5zPPIyU=;
	b=nqUSFn97rLAnSbDpnaPmXPKXarfbl3r96AJWmY+9jNJZOBcqaoF8rLWnHhTSYpZB+Lzb
	 tkrCJyWZH+eCvC7N5i1j+hWwuCa22N7paYGQzQSdHFrZOgGdAN5D4hA4Vu2tgiXNazDWd
	 5BAB/JJcZXPwUfTdclqSiJjCj1k7y3YB+bSjMv4lTkDXyctYWOlC6LW+SlZ/rEXQP0RHQ
	 a+CteR0HGlrSp3rPox8mbq4v9F3em2s7llqutGU2iV9SimDeSLI90moYiRPu+mO6viukP
	 ETBpt+tSWDUcyh9ISe1hUOoH+UouduHbi9zEYSdp1qlEawVG5cF92Dnymq+l5gnSUoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=m9HX0h2S;
	arc=none smtp.remote-ip=95.215.58.89
Received: from mta1.migadu.com (out-89.mta1.migadu.com [95.215.58.89])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A319E606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:54:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A319E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=m9HX0h2S
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=48jh6X0S0d/3YzMepgD+fBr+qcdyyP0trXSd2pnvpUM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795672457; v=1; x=1796277257;
 b=m9HX0h2SfK2mGszpXzDcz1LbtCXh9UiltXV301pmtOqaBIBZnBFOngjFtQhKvjX/ZkTqCgHM
 LEILn7hXtLwTYtLUjyVOufsYYt9S+oxy2aXBWvX7ZbEnrvCBZqonEd5PXWLOf1S2a4jWy9yq2RR
 bYlolNI74K3bSQkn1rihzx1k=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d7a20327b4be166a;
	Thu, 26 Nov 2026 05:54:17 +0000
X-Mizu-Trace-ID: d7a20327b4be166a
X-Migadu-Flow: FLOW_OUT
From: George Guo <dongtai.guo@linux.dev>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com
Cc: bpf@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	George Guo <guodongtai@kylinos.cn>
Subject: [PATCH bpf-next v1 3/5] selftests/bpf: Enable struct_ops private stack tests for LoongArch
Date: Thu, 26 Nov 2026 14:53:52 +0900
Message-ID: <20261126055355.9967-4-dongtai.guo@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126055355.9967-1-dongtai.guo@linux.dev>
References: <20261126055355.9967-1-dongtai.guo@linux.dev>
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

From: George Guo <guodongtai@kylinos.cn>

As the LoongArch JIT supports private stack, enable the struct_ops
private stack tests for LoongArch.

With this patch:
  $ sudo ./test_progs -t struct_ops_private_stack | tail -1
  Summary: 1/4 PASSED, 0 SKIPPED, 0/0 FAILED

Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
 .../selftests/bpf/prog_tests/struct_ops_private_stack.c        | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/struct_ops_private_stack.c b/tools/testing/selftests/bpf/prog_tests/struct_ops_private_stack.c
index 103179ff8733..730d5741591c 100644
--- a/tools/testing/selftests/bpf/prog_tests/struct_ops_private_stack.c
+++ b/tools/testing/selftests/bpf/prog_tests/struct_ops_private_stack.c
@@ -7,7 +7,8 @@
 #include "struct_ops_private_stack_large.skel.h"
 
 #if defined(__x86_64__) || defined(__aarch64__) || defined(__powerpc64__) || \
-	(defined(__riscv) && __riscv_xlen == 64)
+	(defined(__riscv) && __riscv_xlen == 64) || \
+	(defined(__loongarch__) && __loongarch_grlen == 64)
 static void test_private_stack(void)
 {
 	struct struct_ops_private_stack *skel;
-- 
2.53.0

