Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795672467;
	b=deFM9lLhHs1kGooEOOd5PcRQQvIGC1U0jS1XpzoSiMg+jiF1x07UDaAUW/0vynWb1MbV
	 plO/tn9PW5xAgdE3V+PDeoyLZlemMR9W/dz3laOSqYyx4hl+sRAoTXRq/VBuzMU7z1j0I
	 5O/8phvtUH9l43VMRjBY4Okh8NCq+QTS6y87uGC2TefEt6nO904DPBlfre0UPFZjKQFD2
	 QlSeI1Jk8i0VRJ+GyGLI/AtOpS70tRYgm1IPjqRnGnP8t//l1IeY+j3StuImsH4yRRg47
	 n6c6uwNiTHYNduIUXWu/51OLr4jB5pqnreqArUgA/5Iqhk5/w6HMYdH2/3lCsLf9liw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672467;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=h1E/qbwcbCoXU64ZkRvFDVMvyO3pjoekRG9SCWvIno0=;
	b=d6c2m8O9Pfi9qjknzhe9/cX1OU2uNYGmOMqztFFTfg5xiukYB6DmUn8FawBhsNgZvlRD
	 sJRVzLdP5yhHK6/NO58rTveZBLP8R3Xu30NTuaLQtncQN01FSEb1YD76L/0K9cF3ilvti
	 opmllM9H6XlyPoVbbz/9z59DkxUL6p0FGum/p6iV5JJU8hszusKqTq64eNiETBviMaFVh
	 PQGdbVTTMa5/wQPetut2eawVKKCHiDzILUgfsQtBVZL0xgcrKDmmsQaaV1n+tWVKyKkTO
	 GAumBJbn/DY8EK/QSEJRuADzsqcHCd35K3vF6gmU6DV+tGMV+R7ilUR70hKem/vsIFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jBWa6COz;
	arc=none smtp.remote-ip=91.218.175.122
Received: from mta0.migadu.com (out-122.mta0.migadu.com [91.218.175.122])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEF6606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:54:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECEF6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jBWa6COz
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=S9+zMefTvAR+Z9c2FXJzd2Zi3vwRARgx3uXTK8MpAww=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795672464; v=1; x=1796277264;
 b=jBWa6COzhmtltZNGd7+6PKBwBwUZk0MeoNeS90XW0gQDTaJHoUEWCApOLSCpUA4SWkFL9TZL
 Ae2XvaW3pqK7+juQfcc6eniyFMwrvfCwHS4GrAvOty5ddcVDx+fJs/uxqaHfsMxmqE2b0Sqnsz/
 qXupeoIhcH5ea1RgiXP447bs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e56cc51892adac85;
	Thu, 26 Nov 2026 05:54:24 +0000
X-Mizu-Trace-ID: e56cc51892adac85
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
Subject: [PATCH bpf-next v1 4/5] selftests/bpf: Enable arena LDSX tests for LoongArch
Date: Thu, 26 Nov 2026 14:53:53 +0900
Message-ID: <20261126055355.9967-5-dongtai.guo@linux.dev>
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

As the LoongArch JIT supports signed arena loads, enable the arena LDSX
tests in verifier_ldsx for LoongArch, and add the expected LoongArch JIT
disassembly for the arena_ldsx_disasm test.

With this patch:
  $ sudo ./test_progs -t verifier_ldsx | tail -1
  Summary: 1/24 PASSED, 0 SKIPPED, 0/0 FAILED

Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
 .../testing/selftests/bpf/progs/verifier_ldsx.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tools/testing/selftests/bpf/progs/verifier_ldsx.c b/tools/testing/selftests/bpf/progs/verifier_ldsx.c
index 232082428cb9..ad7ae015b39d 100644
--- a/tools/testing/selftests/bpf/progs/verifier_ldsx.c
+++ b/tools/testing/selftests/bpf/progs/verifier_ldsx.c
@@ -299,6 +299,19 @@ __jited("add	t2, a0, s7")
 __jited("lh	s4, 0x18(t2)")
 __jited("add	t2, a0, s7")
 __jited("lb	s4, 0x20(t2)")
+__arch_loongarch
+__jited("add.d	$t2, $a5, $s6")
+__jited("ld.w	$s2, $t2, 16")
+__jited("add.d	$t2, $a5, $s6")
+__jited("ld.h	$s2, $t2, 24")
+__jited("add.d	$t2, $a5, $s6")
+__jited("ld.b	$s2, $t2, 32")
+__jited("add.d	$t2, $a0, $s6")
+__jited("ld.w	$s3, $t2, 16")
+__jited("add.d	$t2, $a0, $s6")
+__jited("ld.h	$s3, $t2, 24")
+__jited("add.d	$t2, $a0, $s6")
+__jited("ld.b	$s3, $t2, 32")
 __naked void arena_ldsx_disasm(void *ctx)
 {
 	asm volatile (
@@ -331,6 +344,7 @@ __success __retval(0)
 __arch_x86_64
 __arch_arm64
 __arch_riscv64
+__arch_loongarch
 __naked void arena_ldsx_exception(void *ctx)
 {
 	asm volatile (
@@ -353,6 +367,7 @@ __success __retval(-1)
 __arch_x86_64
 __arch_arm64
 __arch_riscv64
+__arch_loongarch
 __naked void arena_ldsx_s8(void *ctx)
 {
 	asm volatile (
@@ -385,6 +400,7 @@ __success __retval(-1)
 __arch_x86_64
 __arch_arm64
 __arch_riscv64
+__arch_loongarch
 __naked void arena_ldsx_s16(void *ctx)
 {
 	asm volatile (
@@ -417,6 +433,7 @@ __success __retval(-1)
 __arch_x86_64
 __arch_arm64
 __arch_riscv64
+__arch_loongarch
 __naked void arena_ldsx_s32(void *ctx)
 {
 	asm volatile (
-- 
2.53.0

