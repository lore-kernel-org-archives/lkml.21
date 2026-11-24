Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795535841;
	b=aGlKpvUD3log0rI8zMmH09UxuKAHeKwYsTZcx7zrryYXWrnVdilZ3CL4fyDyYA8GHqO9
	 zzocVsRfwwfsahz7ivFzVpDV7u1uwVgzvW8jLwvdczu2MpxMmpbF64F7EEq0mAANsUwwY
	 g+4p3pnj4kCG80cBUldkUaZNm8BTgqmrj3+kEGK2oCVA+3RupJOGDJwdG1Ub0Jb9tuu9I
	 kMOg97ldiaEkgg2LkJ1ljkcmtVAqsqFImMNHHotSQBku/sYTHnKHNd8Ww6jxdRJ3zltvB
	 Psw1L3+2YjyTJlHTLlbN0zkAvPNTokX2RgKOV+Y8o0vK8XOec5U62NsLV0mA+vT8+tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795535841;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=e618oH1wZyA3evgTKCe3X6OhnEmuk1PZR1Bt320gdGA=;
	b=AkcB7sqzDmhcwXRoAuvnQkSfGBTrwQVr0Hggmf9IkANPeLrCjzPlMb3gavL6RM5pR8tO
	 rv6q6pFTeHDaWcYeXLR+wVq/QMJc0h6V2yef1/JeyA5/AnUP9PLn5WjUt0X9DjIgdw5qq
	 CQ+JXj2rH/Pm4zklbOtrD0AdQEGd9qAcOlBN42hDr/00aDyRH+HRakjCGCI+gHYkY+Kax
	 LARe2XGg4RBAeXsqC9Gfad3Uz0+Lq71i6b3gJsUiYxQ/y24e9ZdvPCSN/d46dbTac3JIY
	 qLMiy0tpXtD4fgrAUeMaECKaoOsuc1zGoebx8yS7PQ4Kzzg4D+Am8Yp36MivbxdcLAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BpwfxaTD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC680606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BpwfxaTD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F0321F000E6;
	Tue, 24 Nov 2026 15:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795535841;
	bh=e618oH1wZyA3evgTKCe3X6OhnEmuk1PZR1Bt320gdGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BpwfxaTD2MEjS1btEJaR5JWWEC+b2IZqBFJqtADDhoQXgna3MzcvZJ6TyMC3TuAax
	 RP7uJkdSlZYH/CxGszqx7/9MPjuYOyXMc7FN7+eSv+NVKSbFkdLFveouNfWcgyuG2P
	 r9W6OTU7DCdU0YG+Ms96qNeYcUotV7Shb0g8hGzyq35XNvhTVJUzcFCSn09RWzkmxX
	 aUGEGHhcTLK+P8QGldpE6N7ouQcu95wX5D4YQs8+eNFszBMv+WalM7fOwyJSI9akZJ
	 ZD8bJYpk/KRnjsdQTPlgpxWpbhS2jLdzFbizovnWLtP6svoXo2/d3ZFu+AVVa0uAdv
	 /BJ5DSwPhBzsg==
Date: Tue, 24 Nov 2026 17:57:13 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>, x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/9] x86/mm: CPA robustness fixes and cleanups
Message-ID: <awWz2REjNXoGJV0b@kernel.org>
References: <20261112-fixes-x86-v1-0-791adb8d6670@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112-fixes-x86-v1-0-791adb8d6670@kernel.org>

Gentle ping :)

On Thu, Nov 12, 2026 at 06:31:05PM +0200, Mike Rapoport (Microsoft) wrote:
> These are x86 CPA robustness fixes and cleanups I found while working on
> a generic implementation of the set_memory APIs.
> 
> The first three patches fix issues that are unlikely to happen in
> practice, but are still worth fixing even if only to avoid LLM spam:
> * CPA does not flush the TLB when only an alias of the requested range
>   changes, and the alias keeps stale TLB entries.
> * mark_rodata_ro() ignores a failure to write protect the kernel and
>   enables the read-only protections anyway.
> * set_memory_encrypted() and set_memory_decrypted() map random physical
>   memory at an unmapped address instead of failing.
> 
> The rest are smaller robustness changes and cleanups.
> 
> ---
> Mike Rapoport (Microsoft) (9):
>       x86/mm/pat: flush the TLB when only an alias mapping changed
>       x86/mm: don't set kernel_set_to_readonly when write protecting fails
>       x86/mm/pat: don't populate page tables in set_memory_{en,de}crypted()
>       x86/mm/pat: don't BUG() on inconsistent page count
>       x86/mm/pat: don't warn about W^X violations before mark_rodata_ro()
>       x86/mm/pat: remove CPA_ARRAY
>       x86/mm/pat: pass the address to CPA by value
>       x86/mm/pat: move the collapse of large pages out of cpa_flush()
>       x86/mm/pat: use cpa_flush() on CPA errors
> 
>  arch/x86/mm/init_32.c        |   8 +-
>  arch/x86/mm/init_64.c        |   8 +-
>  arch/x86/mm/pat/cpa-test.c   |  15 ++--
>  arch/x86/mm/pat/set_memory.c | 203 +++++++++++++++++++------------------------
>  4 files changed, 108 insertions(+), 126 deletions(-)
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261112-fixes-x86-0c15b6adc212
> 
> --
> Sincerely yours,
> Mike.
> 

-- 
Sincerely yours,
Mike.
