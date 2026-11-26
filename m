Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795707015;
	b=3rQtBStCh3D0ZLvRr7/WCJc/aDUZQDfsMDiPX+VVg/QEPp0dVB6dOrETQF2/qSZRVPuf
	 f11D0cyN2hbZSVZclQWlsyQ5pEXBYlMxPdDc8mOzemNQANo13kWbw0ME6LIEMi9hdyAed
	 u6Fhjy+QQ+6stFDrUcq7JEc2l6FhYK6tx4nCB7wHUfm/KkArt+ruT5Jke0mbHLqGGuNK0
	 KhkwKYLNLm2HEEyiwho80Sstuqh0sawDR7B/2v0PQ++kL7GZMh1GJMXI510G+Zv8yZ5sP
	 0zOZ3oWDLvKcZ1oaVyvmqF5o15IqkHmkcLWi+93tbwDcHB9IHQln4j+CxHVBTPXZLvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707015;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=RUIuNtsNjFQRnriJiAaRNZkrS0anB54nAcvR+tqu5rQ=;
	b=ImyRbPeTa1cpsluJmnCOIahluBRNtKFH2H/dsrEmKc3WcagdTK0oDUEwBv5ypdP3BJ+f
	 Js0pfBwRY2sZqMcJL0Hgwnf2b2i+wVWQBvOuI2Mifom47Uz+lzSatIkDvZ/r8A0hgDzBl
	 bCaTJk6JEuZO76JSFxwGegMREH0w8Ly4cupV6XoNWGtPjfc0g79kMRS0U9wSF8l7oXH+G
	 XfLFTOnxQaNlhDjJYN02Vq0XRXPQ+3yF/gGhRQwX8J3SUPd5bvr9DJKIA3di17BjtkwZj
	 YeqE/hJ5T3LVMutjxDg3dv7NMLoFSFt3Q4xItt4Cz//+g3oYPcBe7hXxCms2xp/ALZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hg4fjU83;
	arc=none smtp.remote-ip=95.215.58.174
Received: from mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC43606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:30:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDC43606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hg4fjU83
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=mSefQdG9q8oprzWmA/cvxJZNWxrmJfpm9iiyYsB1lOk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795707012; v=1; x=1796311812;
 b=hg4fjU83svUjZWYFR2PoA1S0U9h93QzMnlNyUDSxQZE1/bAazfq9KrzgKxlE/hDL2rvpVfNJ
 7CRXsCjCZYEzIPlyPBOqdy7Y0UDnvSYqZbFQqXVUvcGSI08W9uuljNlk6DuADNBb3akwTV1z3aW
 ef7/sr/+cJUtF9M2yKs9e6nU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1524a602b15b02a6;
	Thu, 26 Nov 2026 15:30:10 +0000
X-Mizu-Trace-ID: 1524a602b15b02a6
X-Migadu-Flow: FLOW_OUT
From: Leon Hwang <leon.hwang@linux.dev>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leon Hwang <leon.hwang@linux.dev>
Subject: [PATCH linux-6.12.y 0/4] bpf: Fix interpreter-unsupported insns
Date: Thu, 26 Nov 2026 15:29:58 +0000
Message-ID: <20261126153002.162337-1-leon.hwang@linux.dev>
X-Mailer: git-send-email 2.55.0
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

Request from Guillaume and Vincent [1][2], backport the following commits to
linux-6.12.y with editing the commits manually.

9a6df65d5c6a ("bpf: Introduce jit_required flag and remove bpf_prog_has_kfunc_call()")
f1c27922576e ("bpf: Reject programs with inlined helpers if JIT is not available")
34746b5a84ec ("bpf: Disallow interpreter fallback for arena-related insns")
7a0855e73757 ("bpf: Disallow interpreter fallback for BPF_ADDR_PERCPU insn")

As there was a big code refactoring in linux 7.1, the changes in the new
file kernel/bpf/fixups.c will be backported to the positions in
kernel/bpf/verifier.c.

Patch 1 introduces a new bit 'jit_required' in struct bpf_prog. The
other patches set 'jit_required' to fix the issues.

Links:
[1] https://lore.kernel.org/bpf/BESPR02MB12296D62B1B3F33BA21C4F24AF1432@BESPR02MB12296.eurprd02.prod.outlook.com/
[2] https://lore.kernel.org/bpf/MR1P264MB331494502C9D13D8A9EAFB99B7E82@MR1P264MB3314.FRAP264.PROD.OUTLOOK.COM/

Leon Hwang (2):
  bpf: Disallow interpreter fallback for arena-related insns
  bpf: Disallow interpreter fallback for BPF_ADDR_PERCPU insn

Tiezhu Yang (2):
  bpf: Introduce jit_required flag and remove bpf_prog_has_kfunc_call()
  bpf: Reject programs with inlined helpers if JIT is not available

 include/linux/bpf.h   | 22 +++++++++++++++-------
 kernel/bpf/core.c     |  7 ++-----
 kernel/bpf/verifier.c | 21 ++++++++++++---------
 3 files changed, 29 insertions(+), 21 deletions(-)

--
2.55.0

