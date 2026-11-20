Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.202.70.125
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795135014;
	b=FIQjBYjC1Wrlkg4xim9ljy4VTdqHtoceUQGq77Q5CG4bU5OT6AYhxNLPQob3G5WHoI9y
	 SYrEZlvrcMmlHh3BImysxlBY8QqLSWpr4FYvB5VxjEuiCJW3hHVzvr7In3TivS6W+lrlK
	 1E9FZRdHZrH4TZjBsfafLXhtd0P/mwQTTgjN+8gqEj1oeZ4iIncSQwSW8Eam2AyeKMz3Z
	 wBLMVwQOB5wpHjiDbHe3YVHKXR+V0oyydDdbyeuI89+SB/9G8pjcCKwW8SUTNgdaN6pgB
	 nFpuJ/3s6AUCkiGLmivmjG9+8kpzxNpoTcc8zP29mIXCphsq0uID2frnyFGrQfEs4IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795135014;
	h=DMARC-Filter:Received:Received:Received:Date:X-MD-Sfrom:X-MD-SrcIP:
	 From:To:CC:Subject:Message-ID:Mail-Followup-To:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent:
	 X-Originating-IP:X-ClientProxiedBy:DKIM-Signature;
	bh=Muf9ijqOPw1smWynZYGNfE2y9m90cQqo/s7ODdVyyc0=;
	b=lgfFIFpEsIuBKPJHgB5sPKcCkow3AlZ/2ND8qqVY5COu8PMhsaJi3gGQXRyHqXR/kSRx
	 nAIhUgT+s0VT+9H668CZ6B5LCqe9OeqELygjfZE3Z2vt/3V3bTF3e78YgR/MRtxFMJQwz
	 asdZ7XRBhfYYOJcUOVBZrXwKQRb4K7cXu//qdfP8GFlzu97IknrQL+k2KQrWIN9EuCjmk
	 usibt4JR+We+PvyZjZ3nQcCU+DKnM9NTez7TRC/cF6saCG+OQgq11ZGWZ3wdqYj2KiAKl
	 DaT8m1XyxKGiqzkYa3U9hFbvESf0HiuEgVdEjnZ6qant7Is6haQkioqsWGDt8QXsBVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=didiglobal.com;
	spf=pass smtp.mailfrom=didiglobal.com;
	dkim=pass header.d=didiglobal.com header.i=@didiglobal.com header.a=rsa-sha256 header.s=2026 header.b=UopeyvYv;
	arc=none smtp.remote-ip=111.202.70.125
Received: from mx10.didiglobal.com (mx10.didiglobal.com [111.202.70.125])
	by smtp.subspace.kernel.org (Postfix) with SMTP id E669D606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:36:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E669D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=didiglobal.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=didiglobal.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=didiglobal.com header.i=@didiglobal.com header.a=rsa-sha256 header.s=2026 header.b=UopeyvYv
Received: from mail.didiglobal.com (unknown [10.79.64.21])
	by mx10.didiglobal.com (MailData Gateway V2.8.8) with ESMTPS id 8F83A1811263A5;
	Fri, 20 Nov 2026 08:36:31 +0800 (CST)
Received: from BJ01-ACTMBX-04.didichuxing.com (10.79.64.12) by
 BJ01-ACTMBX-02.didichuxing.com (10.79.64.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 20 Nov 2026 08:36:31 +0800
Received: from didi-ThinkCentre-M920t-N000 (10.79.64.102) by
 BJ01-ACTMBX-04.didichuxing.com (10.79.64.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Fri, 20 Nov 2026 08:36:30 +0800
Date: Fri, 20 Nov 2026 08:36:21 +0800
X-MD-Sfrom: jinkehan@didiglobal.com
X-MD-SrcIP: 10.79.64.21
From: Jinke Han <jinkehan@didiglobal.com>
To: Dave Hansen <dave.hansen@intel.com>
CC: <linux-kernel@vger.kernel.org>, <tglx@kernel.org>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	<hpa@zytor.com>, <nik.borisov@suse.com>, <rppt@kernel.org>,
	<peterz@infradead.org>, <mhiramat@redhat.com>
Subject: Re: [PATCH] x86/kprobes: Fix boundary check in insn_jump_into_range()
Message-ID: <20261120003621.GA13347@didi-ThinkCentre-M920t-N000>
Mail-Followup-To: Dave Hansen <dave.hansen@intel.com>,
	linux-kernel@vger.kernel.org, tglx@kernel.org, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, nik.borisov@suse.com, rppt@kernel.org,
	peterz@infradead.org, mhiramat@redhat.com
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <728b7746-b64d-439a-9c1a-a828b56650b1@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: BJ02-PUBMBX-01.didichuxing.com (10.79.65.22) To
 BJ01-ACTMBX-04.didichuxing.com (10.79.64.12)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=didiglobal.com;
	s=2026; t=1795134994;
	bh=Muf9ijqOPw1smWynZYGNfE2y9m90cQqo/s7ODdVyyc0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type;
	b=UopeyvYvI5KXGvKBMcB6+Wte244hS5pet0ozzjmSCYnYipsLE6abbP90qC/yFcgOf
	 K+QmkOqZGX6Xr+VuzFARPXuAewWQjwWlOYho70AHNPkeeJdpD5cxX4a8rpxiN1kcEH
	 Sq9Xo3MeiDzsfovJy/53xbaz+hRFGNe96XW8h7YI=

On 11/19/26 11:41, Dave Hansen wrote:
> What is the end user visible effect of this issue, and of fixing it?

There is no correctness impact: before this change the probe simply stays
unoptimized and falls back to the int3-based path, which is functionally
correct but pays trap overhead on every hit. So the user-visible effect is
limited to probe overhead, and only for probe points that hit this false
positive.

I do have a concrete in-tree example, on queued_spin_lock_slowpath+17.

Original code:

  crash> dis queued_spin_lock_slowpath
  0xffffffff823ebdf0 <queued_spin_lock_slowpath>: endbr64
  0xffffffff823ebdf4 <queued_spin_lock_slowpath+4>:       push   %r14
  0xffffffff823ebdf6 <queued_spin_lock_slowpath+6>:       push   %r13
  0xffffffff823ebdf8 <queued_spin_lock_slowpath+8>:       push   %r12
  0xffffffff823ebdfa <queued_spin_lock_slowpath+10>:      push   %rbp
  0xffffffff823ebdfb <queued_spin_lock_slowpath+11>:      mov    %rdi,%rbp
  0xffffffff823ebdfe <queued_spin_lock_slowpath+14>:      push   %rbx
  0xffffffff823ebdff <queued_spin_lock_slowpath+15>:      xchg   %ax,%ax
  0xffffffff823ebe01 <queued_spin_lock_slowpath+17>:      mov    $0x1,%edx
  0xffffffff823ebe06 <queued_spin_lock_slowpath+22>:      mov    0x0(%rbp),%eax
  0xffffffff823ebe09 <queued_spin_lock_slowpath+25>:      test   %eax,%eax
  0xffffffff823ebe0b <queued_spin_lock_slowpath+27>:      jne    0xffffffff823ebe7d <queued_spin_lock_slowpath+141>
  0xffffffff823ebe0d <queued_spin_lock_slowpath+29>:      lock cmpxchg %edx,0x0(%rbp)

Further down in the same function there is a back edge that jumps to +22:

  0xffffffff823ebe7f <queued_spin_lock_slowpath+143>:     jmp    0xffffffff823ebe06 <queued_spin_lock_slowpath+22>
  0xffffffff823ebe81 <queued_spin_lock_slowpath+145>:     mov    (%rdi),%esi
  0xffffffff823ebe83 <queued_spin_lock_slowpath+147>:     mov    $0x200,%eax
  0xffffffff823ebe88 <queued_spin_lock_slowpath+152>:     cmp    $0x100,%esi

With paddr = queued_spin_lock_slowpath+17, the probed instruction
"mov $0x1,%edx" is exactly 5 bytes, so copy_optimized_instructions()
copies exactly JMP32_INSN_SIZE bytes and the overwritten region is
[paddr, paddr+5) = [+17, +22). The back edge at +143 therefore targets
paddr + JMP32_INSN_SIZE, i.e. exactly the address the detour buffer
returns to after executing the copied instruction.

can_optimize() checks

  [paddr + INT3_INSN_SIZE, paddr + INT3_INSN_SIZE + DISP32_SIZE]

which is [+18, +22] with an inclusive upper bound, so the +143 jump was
counted as jumping into the optimized region and the probe was left
unoptimized:

  crash> dis queued_spin_lock_slowpath
  0xffffffff823ebdf0 <queued_spin_lock_slowpath>: endbr64
  0xffffffff823ebdf4 <queued_spin_lock_slowpath+4>:       push   %r14
  0xffffffff823ebdf6 <queued_spin_lock_slowpath+6>:       push   %r13
  0xffffffff823ebdf8 <queued_spin_lock_slowpath+8>:       push   %r12
  0xffffffff823ebdfa <queued_spin_lock_slowpath+10>:      push   %rbp
  0xffffffff823ebdfb <queued_spin_lock_slowpath+11>:      mov    %rdi,%rbp
  0xffffffff823ebdfe <queued_spin_lock_slowpath+14>:      push   %rbx
  0xffffffff823ebdff <queued_spin_lock_slowpath+15>:      xchg   %ax,%ax
  0xffffffff823ebe01 <queued_spin_lock_slowpath+17>:      int3
  0xffffffff823ebe02 <queued_spin_lock_slowpath+18>:      add    %eax,(%rax)
  0xffffffff823ebe04 <queued_spin_lock_slowpath+20>:      add    %al,(%rax)
  0xffffffff823ebe06 <queued_spin_lock_slowpath+22>:      mov    0x0(%rbp),%eax
  0xffffffff823ebe09 <queued_spin_lock_slowpath+25>:      test   %eax,%eax
  0xffffffff823ebe0b <queued_spin_lock_slowpath+27>:      jne    0xffffffff823ebe7d <queued_spin_lock_slowpath+141>
  0xffffffff823ebe0d <queued_spin_lock_slowpath+29>:      lock cmpxchg %edx,0x0(%rbp)

(The +18/+20 "add" instructions are just the remaining 4 bytes of the
5-byte "mov $0x1,%edx" being misdecoded after the int3 overwrite.)

With the fix the checked range becomes half-open [+18, +22), the +143
target is no longer rejected, and the probe is optimized:

  crash> dis queued_spin_lock_slowpath
  0xffffffff823ebdf0 <queued_spin_lock_slowpath>: endbr64
  0xffffffff823ebdf4 <queued_spin_lock_slowpath+4>:       push   %r14
  0xffffffff823ebdf6 <queued_spin_lock_slowpath+6>:       push   %r13
  0xffffffff823ebdf8 <queued_spin_lock_slowpath+8>:       push   %r12
  0xffffffff823ebdfa <queued_spin_lock_slowpath+10>:      push   %rbp
  0xffffffff823ebdfb <queued_spin_lock_slowpath+11>:      mov    %rdi,%rbp
  0xffffffff823ebdfe <queued_spin_lock_slowpath+14>:      push   %rbx
  0xffffffff823ebdff <queued_spin_lock_slowpath+15>:      xchg   %ax,%ax
  0xffffffff823ebe01 <queued_spin_lock_slowpath+17>:      jmp    0xffffffffc0401000
  0xffffffff823ebe06 <queued_spin_lock_slowpath+22>:      mov    0x0(%rbp),%eax
  0xffffffff823ebe09 <queued_spin_lock_slowpath+25>:      test   %eax,%eax
  0xffffffff823ebe0b <queued_spin_lock_slowpath+27>:      jne    0xffffffff823ebe7d <queued_spin_lock_slowpath+141>
  0xffffffff823ebe0d <queued_spin_lock_slowpath+29>:      lock cmpxchg %edx,0x0(%rbp)

So the effect is: the same probe point now uses an optimized jump into
the detour buffer instead of an int3 trap, which is measurable under
lock contention since queued_spin_lock_slowpath is hot. Semantics are
unchanged; the +143 back edge bypasses the probe point in both cases, so
the hit count is the same.

Regarding the generality of the false positive: it needs a jump whose
target is exactly paddr + JMP32_INSN_SIZE while the copied length is
also exactly JMP32_INSN_SIZE. When the copied length is larger,
paddr + JMP32_INSN_SIZE lands inside an instruction and cannot be a real
jump target, so allowing it does not let a jump into the overwritten
region slip through.

Since there is no reported failure, I'm fine with dropping the Fixes:
tag if you'd prefer to treat this as a cleanup. I can also post a
separate change that makes the check use the actual optimized length
instead of the open-coded DISP32_SIZE, if you think that's the better
direction, and add a regression case under
tools/testing/selftests/kprobes.

Thanks,
Jinke Han
