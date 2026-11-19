Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795123914;
	b=NnTsSyFKrQ4n06yuT/Wz97WSyHc697h4dvcKSjvzqE3g4aD1GPW0FIA4JUi3+9xjyYYm
	 Lk6v/dEHez7jf1M6DeWEPTczA/WlMwXDh3o+lis+p1ykj32/THCKwHwhia1zBrOsmPQdr
	 tXH7jMPmahqOsNcsKc4vVqMu+qKELvAVik59yjQJtVwwtlm0sNytlBDEmYLiVkSZXVPop
	 u/ye9XoESBO/zhvcAg8DqBdDx78rp2Du3WkYz5HnlpCeMDe1cn3vhrnrpyPOiJEaxHxMe
	 wQjrEFRr6U42EnViqTCSgljLIzT3/wu/VSIQLj1qWgad4yYPrYBtw5wa4BCdcnDly9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795123914;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=dQz21Aw4+aAA80ySXmQcgJRTmMnpZE5b7/pXJb+9Veo=;
	b=dL+6Ha6iE/jJw+hB3dUwLqaPRykaMRDLaHAkJ0+bAtAqLTWo7Gtf9TpuU/qm3HYy+e42
	 U2B4G0CBzft1DZyX1muTd1KYIVvW+S9swo4/92fkyK89W7fycK67eQSCmsMbQav8N3WSP
	 fHxrMaGk2HLZWoimRN0KMQnNZXJv/Vt2KWzshfFHXmQiFbz8uiyVnyatCidIp+z5Z9Jqd
	 Q/RYhbmi9t57mEWV389FqX0EIJjUpbNJTGpyIckc+sMWo/1p2oA8q7DkCye14TsBMhQm7
	 RwoPgr6qA/ZLfuaN4rClBenE1vFogeAGFgqsysOIv+LECjTh93erSjTa2aUYTW/4Aog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eAxy9vGD;
	arc=none smtp.remote-ip=95.215.58.130
Received: from mta1.migadu.com (out-130.mta1.migadu.com [95.215.58.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9BF606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:31:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E9BF606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eAxy9vGD
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=3JL7T3LbQWO+ElSkWVtEQZdOEEkcR0/m7CwfXfyLAvo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795123911; v=1; x=1795728711;
 b=eAxy9vGDabS7cR5Dv+e+Cm40CiOB/qDr1Xjs99phEVmzTLCNQEU/SgDkeQc9EWyJXgyw9BjX
 XCGxQOxZVSvvz2EMhmME+rm4RZ3UMPjWPV45yZVm/8NQsaDj8KW8B1BvwgHt5TYPCpEoeWJL4eQ
 ku5hUskJIy83Ba4N9dKlTuO0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 8e9d3d94edded809;
	Thu, 19 Nov 2026 21:31:50 +0000
X-Mizu-Trace-ID: 8e9d3d94edded809
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
Subject: [PATCH 0/2] x86/kstack_erase: Faster stack poisoning, plus a startup build fix
Date: Thu, 19 Nov 2026 13:31:06 -0800
Message-ID: <20261119213147.1094488-1-usama.arif@linux.dev>
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

Patch 2 makes x86-64 use REP STOSQ for spans above 512 bytes, through
the arch hook that s390 already uses. Shorter spans keep the loop, and
the range and value written do not change.

Patch 1 is an independent build fix I found while testing patch 2 with a
small KSTACK_ERASE_TRACK_MIN_SIZE. The startup code still uses the
pre-rename DISABLE_STACKLEAK_PLUGIN, so with Clang, AMD memory
encryption and a tracking minimum below about 90 bytes, vmlinux fails
to link. It can be applied on its own.

Zen 5c KVM guest, one vCPU, before -> after:

  stackleak_erase() per return to user       71 ns -> 46 ns
  futex wake/wait ping-pong                  5-7% faster
  Unix socket sendmsg()/recvmsg() ping-pong  5-8% faster
  open+read+close of /proc/self/stat         6-8% faster
  getppid() (spans below 512 bytes)          within 2%
 
Usama Arif (2):
  x86/boot/startup: Disable kernel stack depth tracking
  x86/kstack_erase: Use REP STOSQ for large stack fills

 arch/x86/boot/startup/Makefile   |  2 +-
 arch/x86/include/asm/processor.h | 25 +++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 1 deletion(-)

-- 
2.53.1-Meta

