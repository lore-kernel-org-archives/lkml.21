Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795707029;
	b=Sr8/jMGcZmlHhVYB910RUGHIq4aSucI2kClFhuWwyH/+O4cY09Ct2HFMbAxAIrcJw+IJ
	 beQIj5fEP5nsNDcDHfiET+Cnye8p3KbuKREuwAAfxLCynaCbYcQ9DunCypz/WcxoGJwaJ
	 CPZuh7BCLioWmg2r9lhgAb4ETC7aqyGDHHsDokqt6XQMcWYxgFZKGTby6JuXd1WHkH5p2
	 0HT0qCxTjI/6W4Mj6e0xxCoQ4Jv1/hlwtuTSLQwnvk5RNeJaImpWiY/3oucwL9MYIHT45
	 w551ctJJZHPmQVnu8bTFEMviV70wtJVUuwcJeafByqBaBMairkv0seSsf+vvl7SRkoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707029;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XKZ3x/rie7YxuparZp3FDLxAgZri1JZZJzg0hOQw4vo=;
	b=CE5N0T39FuXJ0h9PheABYooN/+3TtClgNh9Cf2DIUXVWafTLG8Xm++l4w1ewsIL7+T0I
	 MFDYNU1fKgSerjgSLIz8Gv+MG5+sLcmpxzJMUGp8VTZF9gWGSmPLrVtTWoVlrPZJYeDj1
	 au0QKMtSaKi/dp8XNb2hn/qWbMwPua3wm6ef+FDyW5qPlmYFdHOV4uA90rm1lQmUxzU9X
	 zLaDiPtWjbC2ZpN28RfLgr8YCEZgJCqOco78qix4cwZABU4zPuqW0dWIArDd1Kw6zd7Se
	 s3BsQA+YQHumPmyYzSyPR8ARWI+CIcfiqwKetfkjRDAs87UgbP+N7jV3SE0SO2lx2ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jGaNPfbj;
	arc=none smtp.remote-ip=95.215.58.199
Received: from mta1.migadu.com (out-199.mta1.migadu.com [95.215.58.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744BF606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:30:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 744BF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jGaNPfbj
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=lu8CDYDhRtzNr4mWTlOAnFDoXf3YmniHydQtAwXqbPE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795707026; v=1; x=1796311826;
 b=jGaNPfbjnpr+26NO5g1rYHVotLgkjc3X/SiVOlWO3Pxux9fwVQiIiHjYyH8Jzh5/M/E+408S
 drGA5yBvnk1GynNvN5DRjmxuNjbDDVZ4xissHCbKKSelmra1TySp8SO+rVAjJMEkGPNmFRnzj7C
 GU9mJAUPQ5NcfzPB0SshpEOQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4c568da8571219e0;
	Thu, 26 Nov 2026 15:30:25 +0000
X-Mizu-Trace-ID: 4c568da8571219e0
X-Migadu-Flow: FLOW_OUT
From: Leon Hwang <leon.hwang@linux.dev>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leon Hwang <leon.hwang@linux.dev>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>
Subject: [PATCH linux-6.12.y 3/4] bpf: Disallow interpreter fallback for arena-related insns
Date: Thu, 26 Nov 2026 15:30:01 +0000
Message-ID: <20261126153002.162337-4-leon.hwang@linux.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261126153002.162337-1-leon.hwang@linux.dev>
References: <20261126153002.162337-1-leon.hwang@linux.dev>
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
[edit]
  Apply the check_map_prog_compatibility() change in
  resolve_pseudo_ldimm64(), where this branch handles arena maps.
Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
---
 kernel/bpf/verifier.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 492355f69d26..ab6263a769d2 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -19772,6 +19772,7 @@ static int resolve_pseudo_ldimm64(struct bpf_verifier_env *env)
 					return -EOPNOTSUPP;
 				}
 				env->prog->aux->arena = (void *)map;
+				env->prog->jit_required = true;
 				if (!bpf_arena_get_user_vm_start(env->prog->aux->arena)) {
 					verbose(env, "arena's user address must be set via map_extra or mmap()\n");
 					return -EINVAL;
-- 
2.55.0

