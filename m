Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794945311;
	b=bVqHeDkXrFjiglRc9JvdDHxnV8asf5NP+UErlJ1M3fPU7U6qRXYzlOuGDobErfLcC//M
	 G3KWkg92j/YKvTjMjW4nwMJXgWJPrtNw3BdC+Y/GQ2IgtV/IMgHe92tZzvS95CY37yhUI
	 RxmP5Xtaqf271vaCyN7NZYGDzA7+FMBRVi6/bAC1XYz/++QI1tB58UAJyIXiDxXRisrPK
	 0KHsMqmUX9IqtVo4/XzZD4LwBIUFJLD2Ji80Qh58Bhlo45qzCc7GeMzAbcqWNnxkon96M
	 3PE3TP5dsoxsbjcCSJpQp8GFaY2wrB8PEP0KLNwi75ai2GpZDh+9jI/H1aHoYRqhrLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794945311;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/vrMmPGS0jN0gWIbF7eSFNDqKj+MG1/hhq+12WsX3L4=;
	b=NEaVdVHDK78zyDakFaXbvPZKq4q52Jrf6oyrLzsXzZXJcQM/z+lzdkZuNwvUQNtsIG1E
	 wbIXhxLsjmt592UpaRgEs/N2/FfYa+Hd3Mf/N+o5hQDRLBYee4icAk01MkjqbPbU44zLV
	 tAMFjV59U9peTbWkG9lJR7RM5eEvRQbSJZ7B/40FN8xo/Ti2Tb68YlNgv7YTBfikGQkAq
	 WveNQ9OpWq/n5Hq28K5E92iJmiAD9U/gGDfK5mWX8Hke4uThMfiweaLFBQHrJfXGksohR
	 EfnFEtsMC3Rl6M3/SE/6gczuZ3CxLA/BDyoxApvnmWvOKRHJkZjrqwRlA6cOUdlRkWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hbq3DKAB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8642606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hbq3DKAB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6380E1F000C9;
	Tue, 17 Nov 2026 19:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794945311;
	bh=/vrMmPGS0jN0gWIbF7eSFNDqKj+MG1/hhq+12WsX3L4=;
	h=From:To:Cc:Subject:Date;
	b=hbq3DKABzFki9RvEGs2NXNeXzOFUsWQuj4tfLW/UeU/kBYcCuSXxGVlojJF3RsDPn
	 hHDlQn4yGj8mygUMSCWhdHMAQP7Tjln1mRIvpZAdOs/hkEqPUrVt7e7ixVEj+iRDEi
	 p+ogqtZuotuPJfcxWa7RPMI1f9MVtS9BBxqzQeK/FFUpoNtM4TkJZT2gGwTM8Rz/Hk
	 cUKTieiWuyonkiF7fQu6uLF4U0vtv9o4q5uTeGoBm0xNFG48R8fL1/ll2zdr6MmRaX
	 MujORX7Be4uPJdwHsC9DJZd3BKE1IhS66IJ5q1iA5+PKePW3kf0YVG1DufPT0NluKy
	 kffF+kgcKBhKg==
From: Jiri Olsa <jolsa@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Jason Baron <jbaron@akamai.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCHv2] jump_label/x86: Avoid decoding instructions for jump entry size
Date: Tue, 17 Nov 2026 20:55:06 +0100
Message-ID: <20261117195506.23759-1-jolsa@kernel.org>
X-Mailer: git-send-email 2.56.1
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

arch_jump_entry_size() runs the full instruction decoder just to find
out whether a jump entry is 2 or 5 bytes long. A jump label site can
only ever hold a JMP8, a JMP32 or the matching 2/5 byte NOP, so the
size can be determined directly from the opcode byte or by comparing
against the x86_nops[] encodings.

This matters for kprobe registration, where the address safety check
calls jump_label_text_reserved(), which walks the jump entries and
calls arch_jump_entry_size() for each of them. When registering many
kprobes the instruction decoding dominates the registration time.

Signed-off-by: Jiri Olsa <jolsa@kernel.org>
---
v2 changes:
- sending just this single change from v1 post [1], rest will come later
- check code[0] against both JMP8 and JMP32 opcodes first and only then
  fall back to the memcmp() nop comparisons, instead of relying on the
  compiler to reorder the combined conditions [Peter]
- I measured the change with a test module that registers kprobes with
  register_kprobes() on 20000 generated functions (24 bytes each, probe
  placed at offset 8 in each function). The module is for testing only
  and is part of v1 [1].

    # perf stat -e cycles:k,instructions:k \
      insmod ./samples/kprobes/kprobe_many_example.ko nr_functions=20000

    before:
      51,498,815,127      cycles:k
      53,955,643,792      instructions:k

        10.133113175 seconds time elapsed

    after:
      23,945,896,734      cycles:k
      18,710,375,445      instructions:k

         4.695635577 seconds time elapsed

   That's ~54% less time and ~65% fewer instructions.

[1] https://lore.kernel.org/bpf/20261109194916.1089703-4-jolsa@kernel.org/

 arch/x86/kernel/jump_label.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/jump_label.c b/arch/x86/kernel/jump_label.c
index a7949a54a0ff..cf2df807e4c2 100644
--- a/arch/x86/kernel/jump_label.c
+++ b/arch/x86/kernel/jump_label.c
@@ -15,16 +15,24 @@
 #include <asm/kprobes.h>
 #include <asm/alternative.h>
 #include <asm/text-patching.h>
-#include <asm/insn.h>
 
 int arch_jump_entry_size(struct jump_entry *entry)
 {
-	struct insn insn = {};
+	const u8 *code = (void *)jump_entry_code(entry);
 
-	insn_decode_kernel(&insn, (void *)jump_entry_code(entry));
-	BUG_ON(insn.length != 2 && insn.length != 5);
+	if (code[0] == JMP8_INSN_OPCODE)
+		return JMP8_INSN_SIZE;
 
-	return insn.length;
+	if (code[0] == JMP32_INSN_OPCODE)
+		return JMP32_INSN_SIZE;
+
+	if (!memcmp(code, x86_nops[JMP8_INSN_SIZE], JMP8_INSN_SIZE))
+		return JMP8_INSN_SIZE;
+
+	if (!memcmp(code, x86_nops[JMP32_INSN_SIZE], JMP32_INSN_SIZE))
+		return JMP32_INSN_SIZE;
+
+	BUG();
 }
 
 struct jump_label_patch {
-- 
2.56.1

