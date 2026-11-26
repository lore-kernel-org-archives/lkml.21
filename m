Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795708095;
	b=MpynWhW0ohDcI0i0Dru3poqMjZC7R3TlrMKpQ7I/jt6cHUvf6oZjZIArq1+e9auMQSfR
	 fGpmZ9XDT5df1E2QBEuxmQ0UkdSLVslHECDmnByXDjXpOmoP/ljwxlXHlMoLK8PnPu4E0
	 r+75Y00HErijrhadjfZ8TPAnbWZjXCV2GZOMcdQ1Y1daURP+dUtHa0rpZ+4f2gxxAGOXd
	 2/jxbyCOrORctj60HXggMT7+86PhbwQRbw9W8AlftuPs7nh0Ar16745TtTJf5JfYvARN0
	 BFBMZceB69OEHzivcK+Zvh2tgu+joNmdjw5S0BrRMdZVV5MggOl1PxF+H+ymAbkbzpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708095;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=iqhBRS59PTgKeV6kXKxuNnAYvtcJ2dXB934gAWnaYIg=;
	b=nY8R3xWxWwUFkrvKh7eDR7HAhp3gVdPTX60ajqGQMh0ERS0pHSyu+db3o4tqB9AQZwDM
	 1ZhtuyNP8Pyz2n697BM1jUurR0DnprTF4XXmeU1Ua/If0o9cQY9LK9U8oYSBtfWL6/QhI
	 GRTVM7c5OqSI9f3JPj9G1XF9/0fYNebG04uBUE7Xs/H24AJdfLEJd7F7RwUgrEr7EBSIL
	 sFxe9EbLEQz4gsX908ySTDeDtkHhEu6SJZ13S15xt2dX4lMcaL/mZhvYM16x08Uqp4JuH
	 +1lagicMfpDnnpyLTwfll6SaWZnk6CfzIOwYE885sQcSrsXJRvjMhSxtyWj6JMVyxMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kyELCG8s;
	arc=none smtp.remote-ip=95.215.58.89
Received: from mta1.migadu.com (out-89.mta1.migadu.com [95.215.58.89])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55EC606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:48:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E55EC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kyELCG8s
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+LBJkLt2mDpgOjIwkdoz+vWwwjI9J6p/J12jl6W3mmo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795708093; v=1; x=1796312893;
 b=kyELCG8sa16zhs1LFw6wXdoFH1oygP4o7X6g58cs0VFfcPizCvYFzXOxvabHz6WC8a2240LK
 CHnByD7bOiXFitP/sM/dLoJ0zdJMDcZ+bnx0WaNRhnhQ+a9QXOkRd55IJ2UXvWncPxjrsjZKvgH
 s1HNco/jzcQVdhuPhrUR65EY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5a70713291a611fb;
	Thu, 26 Nov 2026 15:48:12 +0000
X-Mizu-Trace-ID: 5a70713291a611fb
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
	Leon Hwang <leon.hwang@linux.dev>
Subject: [PATCH 6.18.y 0/4] bpf: Fix interpreter-unsupported insns
Date: Thu, 26 Nov 2026 15:47:09 +0000
Message-ID: <20261126154714.169698-1-leon.hwang@linux.dev>
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
linux-6.18.y with editing the commits manually, excluding patch 3.

9a6df65d5c6a ("bpf: Introduce jit_required flag and remove bpf_prog_has_kfunc_call()")
f1c27922576e ("bpf: Reject programs with inlined helpers if JIT is not available")
34746b5a84ec ("bpf: Disallow interpreter fallback for arena-related insns")
7a0855e73757 ("bpf: Disallow interpreter fallback for BPF_ADDR_PERCPU insn")

As there was a big code refactoring in linux 7.1, the changes in the new
file kernel/bpf/fixups.c will be backported to the positions in
kernel/bpf/verifier.c.

Patch 1 introduces a new bit 'jit_required' in struct bpf_prog. The
other patches set 'jit_required' to fix the issues.

Unlike the backporting to 6.12.y, no manual editing in patch 3.

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

