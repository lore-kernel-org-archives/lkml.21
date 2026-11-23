Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795456029;
	b=B3xTEd9LnjzUf18S1rS2Jh56Kx3pVotN2R/37XUBwQ+4metQwiUYderIfwX+YSdBQco3
	 UyIR9t9ZFPJ7j+DmfPthzS3ma2+dAYyfCpDhEc6cGEkMcTNt3T1AsKeA3Xwo2Zl0M//Pz
	 WMKCgT1HslJJ4WOOnbuAUM6Forb1H/avlYwtvPnDYMJA+ndbk0j6nSumiQiW1DsjNfiif
	 wgz4TuBN3S3X7Ve9KDbYg4MXPMsDiLdZxCPd/0PIRjAMioUtLvPju6Rm/bKPKIiPA4EER
	 tG4vICieiO6mRuSHP6xDuTYbGNU3o6oOLPhJKbW2BE+VlNrW4JM2h2iMuqTQVb5rgcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795456029;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=+EIsW0Fyp4FUISuPz5cViVS//4FP11RjU+ucX4qbvl4=;
	b=3KOU7W+bNiRcQeBSUq8UCr650xL1P1N1DI2eccFX5LMqrnQPuLxyY7LmRiHoCYu4C6u3
	 su2U8O7K/CR66ixNQsH2Oy9GHYeslwyHbFFCwBoLDl4xotTu/NMdsDIwq1AHnT3/D8ID9
	 k60ggO63nJZys1eE7cwPO1OCgjn3CCbsZKLeHKkAaf3N2mvfkI4U14VWtyjj/BzHkM+87
	 df/VXNx/1hOcRyFHDZZwHkKPBFWAATD+F1ePEpB2KNJaWxXOsdwlbcUWKgV/briyiBVMq
	 VRPjTKk4UwR/Iv7jTDARxkiy27SmrqhbOx79jTjcHTUakU6VXOgkRfEee+NkPwJaiEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GhOVZ6hq;
	arc=none smtp.remote-ip=95.215.58.206
Received: from mta1.migadu.com (out-206.mta1.migadu.com [95.215.58.206])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD68606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:47:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DD68606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GhOVZ6hq
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=vTq/47LX7EXP25/eUB2xcyGE3kvFvEXFYsqeUA9EgO0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795456026; v=1; x=1796060826;
 b=GhOVZ6hqFxmUdbdfRzl3aRnSTvvLMHqMb/l6oDMNBEgWG3aZUBD2EPsgbr9sDTmGF2+QAxek
 IyiZ+nI6RCoJTgPj9Rwj5sKYCfvSvuljTEnG18S5lSDXevIm6Ay25DI/cH6FR/ohhQXxECTIxCW
 GzGjUf9IVg+ZEi4ZFN4JSCmw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 91c2c5e67698e3d9;
	Mon, 23 Nov 2026 17:47:06 +0000
X-Mizu-Trace-ID: 91c2c5e67698e3d9
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	kees@kernel.org,
	peterz@infradead.org
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
Subject: [PATCH v2 0/2] Subject: [PATCH v2 0/2] x86/kstack_erase: Faster stack poisoning, plus a startup build fix
Date: Mon, 23 Nov 2026 09:46:37 -0800
Message-ID: <20261123174703.133167-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.1
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

With KSTACK_ERASE, every return to user space poisons the part of the
task stack used since the previous return, one 8-byte store at a time.
On Meta hosts running many small VMs, that loop costs about 1.5% of
non-idle host kernel cycles. Most of it is on the way out of futex,
epoll, procfs and socket syscalls that go 1-2 KiB deep.

Patch 2 makes x86-64 use memset64() for spans above 512 bytes, through
the arch hook that s390 already uses. Shorter spans keep the loop, and
the range and value written do not change.

Patch 1 is an independent build fix I found while testing patch 2 with a
small KSTACK_ERASE_TRACK_MIN_SIZE. The startup code still uses the
pre-rename DISABLE_STACKLEAK_PLUGIN, so with Clang, AMD memory
encryption and a tracking minimum below about 90 bytes, vmlinux fails
to link. It can be applied on its own.

Zen 5c KVM guest, one vCPU, before -> after:

  stackleak_erase() per return to user       68 ns -> 47 ns
  futex wake/wait ping-pong                  6% faster
  Unix socket sendmsg()/recvmsg() ping-pong  6% faster
  open+read+close of /proc/self/stat         8% faster
  getppid() (spans below 512 bytes)          within 1%

v1 -> v2: https://lore.kernel.org/r/20261119213147.1094488-1-usama.arif@linux.dev
- Patch 1: add Nick's Reviewed-by.
- Patch 2: use memset64() instead of inline asm and make it
  __always_inline (Nick, Peter). KMSAN kernels keep the generic loop,
  as memset64() is out of line there.
- Patch 2: keep the word loop up to 512 bytes; this is the v2.1
  variant from the v1 thread. Unrolled loops, Duff's device, a 64-byte
  aligned REP STOSQ and REP STOSQ for all lengths (Peter, David) all
  came within 1 ns per erase of it. Most of the time left is the
  search for the poison, not the fill. This current version is the cleanest
  one IMO.

Usama Arif (2):
  x86/boot/startup: Disable kernel stack depth tracking
  x86/kstack_erase: Use memset64() for large stack fills

 arch/x86/boot/startup/Makefile   |  2 +-
 arch/x86/include/asm/processor.h | 21 +++++++++++++++++++++
 arch/x86/include/asm/string_64.h |  2 +-
 3 files changed, 23 insertions(+), 2 deletions(-)

-- 
2.53.1-Meta

