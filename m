Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795672473;
	b=vQ8mmEXcjaBwOIUVByfiJA7eriGdLJ9sqAKorNh2bttNf5WD996V9GInLdboJFVhxaWL
	 SsS1c6yOlFsIQkx8cYG9/lUpTyLDQ5lOGS4LuyJLMC0AapVkC+AmC4igtbJX8BLwi2DBy
	 h1QB4x+TF3tFOd7zODOJZWZf4+41JUZ73X/vgDES/PlATeeweoCUjMPkEcqLW78t7FsEx
	 DbJ2D4z3VjGMlVMYakHU6ofYDxD1+9qVAm+mudjAgwDSuVqaUOz0eHfmIvmA2hzpqMCQ2
	 KTv6sR3fOZoq6OGymnhE+BRq2T2ilyAZtLBnpmNHQU6CfxEN+4yW4DxPpvTQe2KOk2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672473;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/G3zvhNkKdmfVKtWob86Zyxb5hXbqb/ix8g+eNQ40M0=;
	b=MkptGPA3WrAhPrb0X3E7WQ1L5SwzuKEdeMeOwrxnmy4skddK7B8lKE/1jRjdEyoyMiy+
	 Mi/QlCAnmilwiMhOkXwiIV5iHesMv3SFfkjQDu4cQtbGmjmfwQyY5lcmsptBb5L12rk2s
	 QJVOlbf66w/1mQoS3pZa9j7g9D8ec8MKSpsvRqeYXH1op6o3TIeG9DFFDVQ1gIYfbPxPB
	 f5R1SVToaOxm1PISqJ0weqDkHUO1L4BADMRx4xYprVDRc59mNgRsDnQVMp94YtnQCQXnf
	 dJNsh87O/vAGvvf3gkjpo9DB3ElHzv+P29nUQcclnSm1goD4rrJgFH8yklvMtoAptiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EzcYUoGK;
	arc=none smtp.remote-ip=95.215.58.98
Received: from mta1.migadu.com (out-98.mta1.migadu.com [95.215.58.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17FD606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:54:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C17FD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EzcYUoGK
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=j+OWHMnYCCCssvX3Hkh8piXzgwLU6h/W1B5YRlmfKt0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795672470; v=1; x=1796277270;
 b=EzcYUoGK4JShYalgMxVDzBGCXerkjRT16QYXJMN/V6fkQxbSIHkXZbDdrTdZstiicUBpv20V
 TcCQlIKgH5/wTJ+dlPnsrEoVQLoAEfjmMzaX4lOyIOMHh/YFx9slgN1HUNMUBSmcav7Z0wluPIg
 jgWGbqjmjPPT81xlT7BzWZPc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 54099c44540c3c32;
	Thu, 26 Nov 2026 05:54:30 +0000
X-Mizu-Trace-ID: 54099c44540c3c32
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
Subject: [PATCH bpf-next v1 5/5] selftests/bpf: Enable arena atomics tests for LoongArch
Date: Thu, 26 Nov 2026 14:53:54 +0900
Message-ID: <20261126055355.9967-6-dongtai.guo@linux.dev>
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

As the LoongArch JIT supports arena atomics, add LoongArch to the
architecture guards of the load-acquire and store-release tests in
arena_atomics, and of the spmc and bitmap parallel tests in libarena,
which use atomics on arena too.

With this patch:
  $ sudo ./test_progs -t arena_atomics | tail -1
  Summary: 1/11 PASSED, 0 SKIPPED, 0/0 FAILED

  $ sudo ./test_progs -t libarena | tail -1
  Summary: 2/43 PASSED, 0 SKIPPED, 0/0 FAILED

Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
 .../bpf/libarena/selftests/test_parallel_bitmap.bpf.c          | 1 +
 .../selftests/bpf/libarena/selftests/test_parallel_spmc.bpf.c  | 1 +
 tools/testing/selftests/bpf/progs/arena_atomics.c              | 3 +++
 3 files changed, 5 insertions(+)

diff --git a/tools/testing/selftests/bpf/libarena/selftests/test_parallel_bitmap.bpf.c b/tools/testing/selftests/bpf/libarena/selftests/test_parallel_bitmap.bpf.c
index 017add229bef..722971b1eba8 100644
--- a/tools/testing/selftests/bpf/libarena/selftests/test_parallel_bitmap.bpf.c
+++ b/tools/testing/selftests/bpf/libarena/selftests/test_parallel_bitmap.bpf.c
@@ -24,6 +24,7 @@ static volatile bool test_abort;
 	(defined(__TARGET_ARCH_arm64) || defined(__TARGET_ARCH_x86) || \
 	 defined(__TARGET_ARCH_s390) || \
 	 defined(__TARGET_ARCH_powerpc) ||				  \
+	 defined(__TARGET_ARCH_loongarch) || \
 	 (defined(__TARGET_ARCH_riscv) && __riscv_xlen == 64))
 static bool bitmap_tests_enabled(void)
 {
diff --git a/tools/testing/selftests/bpf/libarena/selftests/test_parallel_spmc.bpf.c b/tools/testing/selftests/bpf/libarena/selftests/test_parallel_spmc.bpf.c
index 5fa96eb74095..af577e1e5050 100644
--- a/tools/testing/selftests/bpf/libarena/selftests/test_parallel_spmc.bpf.c
+++ b/tools/testing/selftests/bpf/libarena/selftests/test_parallel_spmc.bpf.c
@@ -70,6 +70,7 @@ static volatile u64 round_steals;
  */
 #if defined(ENABLE_ATOMICS_TESTS) &&		  \
 	(defined(__TARGET_ARCH_arm64) || defined(__TARGET_ARCH_x86) || \
+	 defined(__TARGET_ARCH_loongarch) || \
 	 (defined(__TARGET_ARCH_riscv) && __riscv_xlen == 64))
 static bool spmc_tests_enabled(void)
 {
diff --git a/tools/testing/selftests/bpf/progs/arena_atomics.c b/tools/testing/selftests/bpf/progs/arena_atomics.c
index 2a9664f54399..fcb70b984434 100644
--- a/tools/testing/selftests/bpf/progs/arena_atomics.c
+++ b/tools/testing/selftests/bpf/progs/arena_atomics.c
@@ -30,6 +30,7 @@ bool skip_all_tests = true;
 	defined(__BPF_FEATURE_ADDR_SPACE_CAST) && \
 	(defined(__TARGET_ARCH_arm64) || \
 	 defined(__TARGET_ARCH_x86) || \
+	 defined(__TARGET_ARCH_loongarch) || \
 	 (defined(__TARGET_ARCH_riscv) && __riscv_xlen == 64) || \
 	 defined(__TARGET_ARCH_s390))
 bool skip_lacq_srel_tests __attribute((__section__(".data"))) = false;
@@ -454,6 +455,7 @@ int load_acquire(const void *ctx)
 	defined(__BPF_FEATURE_ADDR_SPACE_CAST) && \
 	(defined(__TARGET_ARCH_arm64) || \
 	 defined(__TARGET_ARCH_x86) || \
+	 defined(__TARGET_ARCH_loongarch) || \
 	 (defined(__TARGET_ARCH_riscv) && __riscv_xlen == 64) || \
 	 defined(__TARGET_ARCH_s390))
 
@@ -508,6 +510,7 @@ int store_release(const void *ctx)
 	defined(__BPF_FEATURE_ADDR_SPACE_CAST) && \
 	(defined(__TARGET_ARCH_arm64) || \
 	 defined(__TARGET_ARCH_x86) || \
+	 defined(__TARGET_ARCH_loongarch) || \
 	 (defined(__TARGET_ARCH_riscv) && __riscv_xlen == 64) || \
 	 defined(__TARGET_ARCH_s390))
 
-- 
2.53.0

