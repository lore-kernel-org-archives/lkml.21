Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.125
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795708117;
	b=Jn6RC8+aLpjD+dQZszh+GxkXsT/i1JbU2jXn1d7Crato/hoT9//hRcV/1MpW23Ud0YBN
	 okwkLQIq6VRQY2+fopWsR9NalNPaZK0gtpzJIoyivGrU6AHeI+RywhSOZ4IxHMzaiMiUG
	 HNsa4XtZLbznm80L2nUHpKJ0FuKCwLWqis1H3XqWwfasYEa8NWxMFPWkLw9WORnIicS0O
	 7rYeDfnK/2ziTYM9N14pECtYaLKcQDJTFdkmdeJeL/6GaDLXPcK9QjLF296uev5Qnekps
	 FzgUKP2RKM77GiTiKpRAEHPzFrdwc6UFzRzmC+zFW8wEBISjjLwk9spL6647YczMW8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708117;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=C1dEdWeDxpgKQfDGosMbcKuIvKQ/TjH2X7ZuB6oiK2Y=;
	b=ZsGST9Z35kyAHqVLBLtgOcX2P9YJoRDEO4c0kI2E6ZHIOj+QV2J87A3pKBPzrKzkupEP
	 CeUcbIZVHwZWy5Q//vunRd+Fb0Ku4PiDMK6WgapikGzsd8WFIqTLVysZ94vf0+jZLvvLc
	 3x78kefvK6aVvjgj0mZ9YxgaJ01x7/TH4VTvI6SE7Nxe6iKKrrNWlBAiTDB8v0twX24gR
	 XiUOz+Z+ihJpNKDQPVnKnjP2G9t8NCNGPgBb2ImoWJ4u5We8UzzfFiHC+NblBBgr0Y6ML
	 LBpqPMRR6iGpF6MXmhDgiQjuvQ9gftLZWNlyha0iZwsn/84ZVphjmg0mD4PHH6Hm1vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RQTFnD56;
	arc=none smtp.remote-ip=95.215.58.125
Received: from mta1.migadu.com (out-125.mta1.migadu.com [95.215.58.125])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F8D606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:48:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11F8D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RQTFnD56
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+ugi0ffknDsDv/WElNjAOvTzE4ppDV9pVvzwvWa3Ih0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795708115; v=1; x=1796312915;
 b=RQTFnD56vgKXG1lsOHneagPm+AI7VtL2fuA8SPXgSMXCsatoh9vX8hgD3qjVxqJLdOvEAweQ
 xmUqCIaQj5q1FOujOhumDKghvGBcHvMCUnLdtyI6JucCNiImLXjmWQVflkpGbGi0KEcu3MQC9r8
 xMS8a/VX9LsoGLV1x4fMQYTA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c0b53319757a8e46;
	Thu, 26 Nov 2026 15:48:35 +0000
X-Mizu-Trace-ID: c0b53319757a8e46
X-Migadu-Flow: FLOW_OUT
From: Leon Hwang <leon.hwang@linux.dev>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Guillaume Laporte <glapt.pro@outlook.com>,
	Vincent Thiberville <vincent@harfanglab.fr>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leon Hwang <leon.hwang@linux.dev>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>
Subject: [PATCH 6.18.y 3/4] bpf: Disallow interpreter fallback for arena-related insns
Date: Thu, 26 Nov 2026 15:47:12 +0000
Message-ID: <20261126154714.169698-4-leon.hwang@linux.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261126154714.169698-1-leon.hwang@linux.dev>
References: <20261126154714.169698-1-leon.hwang@linux.dev>
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

[ Upstream commit 34746b5a84ec37c0ea2bf6808c65c5ed8790eb51 ]

Since the interpreter does not support the arena-related insns,
interpreter fallback should not be allowed for these insns in
core.c::__bpf_prog_select_runtime().

Currently, when the interpreter executes the arena ST/LDX/STX insns,
it would hit the BUG_ON() in ___bpf_prog_run() at run time.

[    2.579196] BPF interpreter: unknown opcode a2 (imm: 0x0)
[    2.579998] ------------[ cut here ]------------
[    2.580652] kernel BUG at kernel/bpf/core.c:2349!
[    2.581314] Oops: invalid opcode: 0000 [#1] SMP PTI

Set jit_required as true when arena map is used in the prog to disallow
interpreter fallback for arena-related insns.

Fixes: 6082b6c328b5 ("bpf: Recognize addr_space_cast instruction in the verifier.")
Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
Link: https://lore.kernel.org/bpf/20260715141122.15783-2-leon.hwang@linux.dev
Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
---
 kernel/bpf/verifier.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 2749dee1643d..0ed5d9e0db39 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -21106,6 +21106,7 @@ static int check_map_prog_compatibility(struct bpf_verifier_env *env,
 			return -EOPNOTSUPP;
 		}
 		env->prog->aux->arena = (void *)map;
+		env->prog->jit_required = true;
 		if (!bpf_arena_get_user_vm_start(env->prog->aux->arena)) {
 			verbose(env, "arena's user address must be set via map_extra or mmap()\n");
 			return -EINVAL;
-- 
2.55.0

