Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.202.70.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795154091;
	b=ahizu3iHWbn/I9UUOtYp5eETbe5v9WCajbsIicpL0Wiav/cieggHVuxUMy0J2eE5U0Y9
	 VVerW3ZNofR56PBX0APNtIRCY27NGn5IHBlY6qRcibENQs4AoU7vOrI53DGzdlFddEn3y
	 sKZgn7JWHjUkGN8x0UArumIf3LLU5W1WpKLWqIcUZUS4UVg/BQ2uQ+nI/j7gXSTMP9B+m
	 kJBooMm/m6fKfIryChUGmr3F6lc1oonR0b92smeZmoQ9vetJ4mFcdjeaUPl/t/5LGepWE
	 XaF42aSvN7jmEiJUQmCv4zHze1AcSbdEFGQe0vYpZXdcTqb6889nm21Xn9EwxP/t9Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795154091;
	h=DMARC-Filter:Received:Received:Received:Date:X-MD-Sfrom:X-MD-SrcIP:
	 From:To:Subject:Message-ID:Mail-Followup-To:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent:X-Originating-IP:X-ClientProxiedBy:
	 DKIM-Signature;
	bh=wwB/yQsTLu9DlExYuOD0GIhTCLIvYpd5e79IGcbMwqo=;
	b=1u2TUvXgAmFxOpw3XVzRwnORzKuajPyv10tKe77IdiI5oGIDtzSRPRvuQDcy9ZhsAK7T
	 dfagpHLG2K73SDQ14KF5887Jzg0pmdv0b9whBnNTSF9oV9wqvE93xPalocBoRed4bh0Ai
	 PE+jD/wdB0gwMhEDf0k5HR+tt7+Ou1CQc4PupqwwRyTdcoc67RTga944QubsLk6LBWvPB
	 xrtJgKwwgKMpjkXDXRmT1Coi4LadqEER2uuI5iof6HfwgJUE4Cq1RqqK7T3hTsva3OY90
	 Z8fYYq20X1LJ548PsXQE8wAj27naTLD2gntrrgO0c9JEuOapijsQUaVe6M1Dh8RLaOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=didiglobal.com;
	spf=pass smtp.mailfrom=didiglobal.com;
	dkim=pass header.d=didiglobal.com header.i=@didiglobal.com header.a=rsa-sha256 header.s=2026 header.b=dO7q1WMc;
	arc=none smtp.remote-ip=111.202.70.124
Received: from mx9.didiglobal.com (mx9.didiglobal.com [111.202.70.124])
	by smtp.subspace.kernel.org (Postfix) with SMTP id AA3C8606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:54:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA3C8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=didiglobal.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=didiglobal.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=didiglobal.com header.i=@didiglobal.com header.a=rsa-sha256 header.s=2026 header.b=dO7q1WMc
Received: from mail.didiglobal.com (unknown [10.79.64.20])
	by mx9.didiglobal.com (MailData Gateway V2.8.8) with ESMTPS id D246D18357EE7F;
	Fri, 20 Nov 2026 13:54:36 +0800 (CST)
Received: from BJ01-ACTMBX-04.didichuxing.com (10.79.64.12) by
 BJ01-ACTMBX-01.didichuxing.com (10.79.64.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 20 Nov 2026 13:54:36 +0800
Received: from didi-ThinkCentre-M920t-N000 (10.79.64.102) by
 BJ01-ACTMBX-04.didichuxing.com (10.79.64.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Fri, 20 Nov 2026 13:54:36 +0800
Date: Fri, 20 Nov 2026 13:54:23 +0800
X-MD-Sfrom: jinkehan@didiglobal.com
X-MD-SrcIP: 10.79.64.20
From: Jinke Han <jinkehan@didiglobal.com>
To: <linux-kernel@vger.kernel.org>, <mhiramat@redhat.com>,
	<dave.hansen@linux.intel.com>, <tglx@kernel.org>, <mingo@redhat.com>,
	<bp@alien8.de>, <x86@kernel.org>, <hpa@zytor.com>, <peterz@infradead.org>,
	<nik.borisov@suse.com>, <jinkehan@didiglobal.com>, <rppt@kernel.org>
Subject: [PATCH v2] x86/kprobes: Fix boundary check in insn_jump_into_range()
Message-ID: <20261120055423.GA15683@didi-ThinkCentre-M920t-N000>
Mail-Followup-To: linux-kernel@vger.kernel.org, mhiramat@redhat.com,
	dave.hansen@linux.intel.com, tglx@kernel.org, mingo@redhat.com,
	bp@alien8.de, x86@kernel.org, hpa@zytor.com, peterz@infradead.org,
	nik.borisov@suse.com, rppt@kernel.org
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
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: BJ02-PUBMBX-01.didichuxing.com (10.79.65.22) To
 BJ01-ACTMBX-04.didichuxing.com (10.79.64.12)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=didiglobal.com;
	s=2026; t=1795154078;
	bh=wwB/yQsTLu9DlExYuOD0GIhTCLIvYpd5e79IGcbMwqo=;
	h=Date:From:To:Subject:Message-ID:Content-Type;
	b=dO7q1WMcizWg1FEmbFxxmyXdBeTAZRzjeekJaNSP7R7Go+J/z3dl34tbv9PzKLkBk
	 DRxILIOLiKISTZMBCXiT5sizQmBzZu0ZTOj5nUGWDrsRcVhJqhEZShIxQ+kC0zmDzY
	 Pb6c8tNAZ7QPXtdwg4usNAhE/8GdGBSVX0ZwXZRw=

The range checked by insn_jump_into_range() is half-open:
[start, start + len). However, the current check treats the upper
bound as inclusive, so a jump target at `probe address +
JMP32_INSN_SIZE` is incorrectly considered to jump into the
optimized region.

A valid jump target must be an instruction boundary. A target at
`probe address + JMP32_INSN_SIZE` lies just outside the overwritten
region, so allow the jmp optimization in this case.

For example, with a kprobe at queued_spin_lock_slowpath+17, the
optimized region covers queued_spin_lock_slowpath+17..+21, and the
next instruction boundary is queued_spin_lock_slowpath+22. A branch
target at queued_spin_lock_slowpath+22 is therefore outside the
half-open range [probe, probe + JMP32_INSN_SIZE).

Before this patch, the kprobe falls back to an int3 kprobe because
the boundary target is wrongly considered to be inside the range:

  0xffffffff823ebdff <queued_spin_lock_slowpath+15>:  xchg %ax,%ax
  0xffffffff823ebe01 <queued_spin_lock_slowpath+17>:  int3
  0xffffffff823ebe02 <queued_spin_lock_slowpath+18>:  add  %eax,(%rax)
  0xffffffff823ebe04 <queued_spin_lock_slowpath+20>:  add  %al,(%rax)
  0xffffffff823ebe06 <queued_spin_lock_slowpath+22>:  mov  0x0(%rbp),%eax

With this patch, jump optimization can be used:

  0xffffffff823ebdff <queued_spin_lock_slowpath+15>:  xchg %ax,%ax
  0xffffffff823ebe01 <queued_spin_lock_slowpath+17>:  jmp  0xffffffffc0401000
  0xffffffff823ebe06 <queued_spin_lock_slowpath+22>:  mov  0x0(%rbp),%eax

Fixes: c0f7ac3a9edde ("kprobes/x86: Support kprobes jump optimization on x86")
Signed-off-by: Jinke Han <jinkehan@didiglobal.com>
---
Changse in v2:
- Only the changelog is updated; the code keep unchanged. 
---
 arch/x86/kernel/kprobes/opt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/kprobes/opt.c b/arch/x86/kernel/kprobes/opt.c
index 3f8fea52619f..a920ecb99381 100644
--- a/arch/x86/kernel/kprobes/opt.c
+++ b/arch/x86/kernel/kprobes/opt.c
@@ -252,7 +252,7 @@ static int insn_jump_into_range(struct insn *insn, unsigned long start, int len)
 	}
 	target = (unsigned long)insn->next_byte + insn->immediate.value;
 
-	return (start <= target && target <= start + len);
+	return (start <= target && target < start + len);
 }
 
 /* Decode whole function to ensure any instructions don't jump into target */
-- 
2.34.1

