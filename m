Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795580596;
	b=pNMhxLqKw9aI0xYhmCXp/tk1PMOxQ2ueO3GTGeVruO7Rgg4MY1J7kIJM2FY56iMYFnxa
	 KXnuQ7++cUI8ZhJXGjUn6LIPMxppLWJNPzEv3OllrzEanKGPeJ8Q0MvuOnkAHSCrKjRII
	 xXlsz2eCZDOKE2q0OZ5V6+nCm5PiASHiR9Ay+d871YfRl/UoDXZp79JTdWMMAe5CpzOop
	 Pmg/r80ldZVURWDEzpy6HbRzi1vL6kNvn0G8abEJTV06AXgfW7EI+4+1U1Co1bHdN5oht
	 9GUtGRnyZW+PgacDRPdVaZ53Gp+nKzQXiW7aS6UAStqAGQVtZYBmIYqTH+2/RO2e5ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795580596;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=D2AfVlTPC+NsUsB064L9pOKXA7uJcY99wYNds60qd4U=;
	b=5FzhmbH5pDAAu0ZJfVCQIQZ/LnPexS05c2gqfx9M4ig2+N/WXRsd5rk5YxfFEI5RbheI
	 wZrk10Z+2orao4cSk5J/1Kvnm/Y+GsVhh6dIwNZ5zNiONKEGcD22N+Dtyvk7eXdAXJVLN
	 OatSktETESfvh9uHRFSct3mlqNTMP+IUrL5sO5W9lndR8bTbV0ku5q4JErLmwZXacsyam
	 Qfp5uOszHQQXJsPluXzAhu0NsRdJvSauvrgCgnHQbN0mxqGA2FttzVxkWGjFQOFsPr7fJ
	 Smqt5D3LDC/ZLmnRDbGIhAxWGWMJIOjoOeUPwHOb146KKHOTJ9OUu30FNWnN5BBAvWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eJWSV6Wx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F65B606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eJWSV6Wx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C48211F000C4;
	Wed, 25 Nov 2026 04:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795580596;
	bh=D2AfVlTPC+NsUsB064L9pOKXA7uJcY99wYNds60qd4U=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=eJWSV6WxJRNPaELbfPb9duDj/C3KcUixgsIqYxag/t5AvnvYtysrhl1a3/zUpMgTM
	 AWcXY++o1p6Jt3sgALVWl7VjP9QB52pQbjZPcdBRVRJoVNvNMnRiI6/8LoGAdko37t
	 e/EzMxM/chDds2N5xdqkW1BviufTq712GiOkbAsQEMoWa7u7WYIpJfnhu3mcOokyP7
	 z9P9eBVQR86bJ3LrFvuMIcidbCdPTxYGr7jWsXyYZvgLKrsdRsi+pI7+VawR/vNQqi
	 qi8AbZKh6mmqwXFozdhc6RvrAPx77HehuVOxgjMU0cGmbCWuDKWGARCfEEDsb3L1Rz
	 WgWIq9T09z5Xw==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id D428BF40066;
	Tue, 24 Nov 2026 23:23:14 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Tue, 24 Nov 2026 23:23:14 -0500
X-ME-Sender: <xms:smIGa_TdMH7OC0jvuOhi_hBXIY1sZGrCIwOI5src9EOqq425qQ-FTw>
    <xme:smIGa7mMtrKnLwy0j-XRx9mFbvwkGq53sbJQsiiIt57CcjYNlDy_M46NJLJ3hzxXS
    nFSw5JTvkn9Up60AdfYT-KAQ4fJVwyUJzxXEicFvGP5NzRCRo08_ZM>
X-ME-Proxy-Cause: dmFkZTFZHvM/PIACT3wvtgzcRIp6jjfHrf++Y7+PHTHxLOjNYHyxDj4n2JpUfb/hGNyYO2
    B3dK6nXKEZ/PRR0WCO+jAd1elVyyK9QD5rvuJx9X0ivvPr7XigFlPsh1KxrUqukJ4G5ktn
    cRqQqMv1F+dg4zmfwnEOCB90ybUV+Ij6ZC6EIWzHWStrGAF/5p/DbLxJCe2MMVRSCO3IwW
    /SzR0zCrafk0E9pbGOmj2ziaOyyq3wsssCm15RQ6IEL68ugeF/BnBr1L5J6De6DyQxkA5X
    L2jGV58PXJWnSvCmI5mpsKTtztcSOCZbngi0d6bcPtOKumSgR5I6TEPllWdsaduVwkCNSj
    5PsE6a/SEeqRXMn6qCpBx5JW/obAGQWWuLlZiClrFtIpinRj20UGfmfzRUL282yl5JV1Vm
    MVdfMpiijBeIPywTUIoEb0wQA80ltqVHaLu8AGZS36bYkEbaY0SGs9Wb/cgMIlacWEO9RX
    iGBbOaYqqs5gNo+o5+scFQN83ksSvLkGc/p3qpQ+xeRBYN6DebA22evrPAKUfbq7dcBQ7R
    Yoh3AeftSiWiv0Wap7VIl0h6yCC3wmDiOX1Fq9k5OG3Y0xANVEzngupgXE2RpaX3rFwTuh
    44mOUlF7uHphkgFC9gssxpo7vg2SxWaXmtH4iSowuTqwqg4c7aFZFuDfMIig
X-ME-Proxy: <xmx:smIGa91MhhXd81CMgC6rHSwomvTXKvNokVzuI59dukd46t8J1kEaXQ>
    <xmx:smIGa83jIfLdN9bYbP47tBZ8OUHPGMTrqL581q891UuCr1nofkk9Fg>
    <xmx:smIGa8lLs5x5_xLBcOEZcVUj4NmvPfoMQl9wcR9rVeXBW4ATshqpmA>
    <xmx:smIGa9Nx1FvXWLsbdBlHwG18grmn5SrfYjKoYue0JPDldN7RnAF5QA>
    <xmx:smIGaz7I8ntU1HDuq1UVZFjRM3b7naHRwTt9FZobZzYjmkIw28aDWjDe>
Feedback-ID: ieff94742:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B4142700063; Tue, 24 Nov 2026 23:23:14 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AisSLPdYCdlo
Date: Tue, 24 Nov 2026 20:22:53 -0800
From: "Andy Lutomirski" <luto@kernel.org>
To: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, bpf@vger.kernel.org
Cc: "Puranjay Mohan" <puranjay@kernel.org>,
 "Alexei Starovoitov" <ast@kernel.org>, "Andrii Nakryiko" <andrii@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>,
 "Eduard Zingerman" <eddyz87@gmail.com>,
 "Emil Tsalapatis" <emil@etsalapatis.com>,
 "Ihor Solodrai" <ihor.solodrai@linux.dev>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 "Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>, kkd@meta.com, kernel-team@meta.com,
 "the arch/x86 maintainers" <x86@kernel.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>
Message-Id: <df69ab5d-bc97-4651-8668-a2b3e4bb272a@app.fastmail.com>
In-Reply-To: <20261009024925.3169077-2-memxor@gmail.com>
References: <20261009024925.3169077-1-memxor@gmail.com>
 <20261009024925.3169077-2-memxor@gmail.com>
Subject: Re: [PATCH bpf-next v1 1/3] x86/mm: Resolve BPF exception fixups for user
 address faults under SMAP
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Oct 8, 2026, at 7:49 PM, Kumar Kartikeya Dwivedi wrote:
> With SMAP enabled, do_user_addr_fault() treats a kernel-mode fault on a
> user address with EFLAGS.AC clear as a kernel bug: it does not consult the
> exception table and oopses right away. That is correct for ordinary kernel
> code, where get_kernel_nofault() and the other nofault accessors never let
> a user address reach a faulting instruction.

...

>
> The next patch uses this to drop the range check from the JIT when SMAP is
> enabled. Nothing changes about which addresses a BPF program may read: a
> user address never becomes readable, since SMAP forbids the access, and a
> PROBE_MEM load of a kernel address is handled as before. Without SMAP the
> JIT keeps its range check and this path is never reached.

Didn't we hash this out a decade ago or so?

Can you at least explain how a non-range-checked pointer read of a non-verifiable pointer doesn't have a problem with, say, MMIO?

If you are so inclined, you can ask your favorite chatbot about common MMIO ranges for which reads have side effects.  Mine informs me that they are quite common, and you can find them even in very modern designs like virtio.  I'm pretty there was a conversation like this, minus the chatbot part, years ago.

Does anyone have a compelling argument as to why the vsyscall page is any different from a PCIe (virtual or otherwise) BAR other than the fact that the x86 arch code will OOPS you when you accidentally read the vsyscall page but you will just possibly deadlock or otherwise screw up more subtlely when hitting a different inappropriate page?

If not, then I think this series primarily serves to make x86 complicit in papering over a problem with eBPF: right now eBPF has a heuristic that is wrong, but with the patch set applied, eBPF can make the heuristic even more wrong and x86 will paper over the cases that it happens to be able to detect.

No thanks.

--Andy
