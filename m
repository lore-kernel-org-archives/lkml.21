Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597563;
	b=dpU7HW4DeGxE79sFMnLmTvZg3yCAVupJaJbpr7tn97RNlMca6WtNNm+iO/c/p8H4GkvO
	 HC+QR55psOKNesCjpfbKaKKZnKjR/HGuvZ+lD2B+TNLIWmaTfhJSuXF8QSPbl6QQ/B24l
	 EW/tmvGUq3fnF6L/r4A1SFAt+cWpnEnmmCD58dI8131ejjsi0YpEeFKCifGcKEiPJ7lIE
	 E2e7pY7EKrL4tQP03+eQPNAQcjee4Ozq3NSqDXtDY6SXnVg5MMa41m3/tDVLfT95DerYH
	 KIuF+A6MD1fPkFo3M6p8koE36AAsfY3qriWxjDQERyCndb9qNUHHF9I1ZR8XkO483tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597563;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=2R+ptACluYa/01MSznZHoJj0o1fxIPmKw66p6dBKggI=;
	b=SlxQoXOmG+8MJODa1WaUblK99cyzrS/NSfdgN6Mp99+3I/4eCt8rRjTgwfPv9JRyGQB5
	 mj9TKQ3BUH/sxs6A+EXvXwHJqAzDv4D8GsLlx+feBscmssk8pHwYzFVkj5T8fkSlkRDld
	 d/MHrcAncUvg/5mymmC+slh5f12Fre973eHVIlHadxX4WntWkD2GRJFI1eTJa8GsU4QEc
	 HHIQ3UF7H+QS3mIPvvoNO7Agu3nhTeRyc6oiutqiXna3E9qiGS3CCQoP+DgPw8i72Ad+V
	 Oi4di4fdYPWvKEK67yVdOqrsuNEKTmO61TkBXr18/oOswe0Verz8byXS9ZPsVuMJHzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PL5jRQyT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FB0606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PL5jRQyT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BD201F0089F;
	Wed, 25 Nov 2026 09:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795597562;
	bh=2R+ptACluYa/01MSznZHoJj0o1fxIPmKw66p6dBKggI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PL5jRQyTyVyrXpi/UQCp0SAZ5Rchq22JsMf8JtkfUEclVT/HrpzW+NhkTwOu38wSV
	 hlxnljqJMWSjkXM3ToJ5iInI5nybl4G/SwBWi72IRYsbwfyggoCibrRkCkRAGWTlqx
	 Wdyg8uHlgPSQnZGokMlzAQG1L5QCycFjlgRroHxy/FbGtni24f2tZ0vWX6MfTWwvGc
	 qIGpy23cMtrGBpzUCARq6Iryt7Yl20wTLEIESrFcsN3HYPlcIOaemt0ROf5skxJ+Br
	 sWU2g4vG94mVOQ17r5QCw2SDrzsPnCEZTIoGLBZJgxNAWgaRr/ZFzTWuyAQ69USbUJ
	 WBX9t55Zbeq0A==
Date: Wed, 25 Nov 2026 11:05:55 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "luto@kernel.org" <luto@kernel.org>, "x86@kernel.org" <x86@kernel.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"peterz@infradead.org" <peterz@infradead.org>,
	"bp@alien8.de" <bp@alien8.de>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"tglx@kernel.org" <tglx@kernel.org>,
	"hpa@zytor.com" <hpa@zytor.com>,
	"thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/9] x86/mm: don't set kernel_set_to_readonly when write
 protecting fails
Message-ID: <awak8ysyQqt6jQ06@kernel.org>
References: <20261112-fixes-x86-v1-0-791adb8d6670@kernel.org>
 <20261112-fixes-x86-v1-2-791adb8d6670@kernel.org>
 <afbc0c7a79e880947962fec09885a9a8937ba7df.camel@intel.com>
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
In-Reply-To: <afbc0c7a79e880947962fec09885a9a8937ba7df.camel@intel.com>

On Tue, Nov 24, 2026 at 11:01:06PM +0000, Edgecombe, Rick P wrote:
> On Thu, 2026-11-12 at 18:31 +0200, Mike Rapoport (Microsoft) wrote:
> > mark_rodata_ro() ignores the result of write protecting the kernel text
> > and rodata. It can fail when CPA cannot allocate a page table to split a
> > large page, and then a part of the text and rodata stays writable.
> 
> Seems like something very unlikely to happen before the kernel has even finished
> booting. Probably other worse problems are coming in that case.

Yeah, most probably we'll crash a few cycles later :)
 
> > kernel_set_to_readonly is set anyway, and CPA enforces the static
> > protections of rodata from then on. On 64-bit the next call,
> > set_memory_nx() for the data, may find the writable rodata and warn
> > about a conflict with the static protections, which does not say what
> > actually went wrong.

But here we'll see the failure where it happened rather than a
static_protection's WARN a bit later.

Another thing is that hopefully we'll be able to make set_memory_*()
__must_check everywhere Really Soon.

s390 are already doing it:

https://lore.kernel.org/linux-s390/20261118144709.202520-1-hca@linux.ibm.com/

> > 
> > Report the failure and set kernel_set_to_readonly only when write
> > protecting succeeds.
> > 
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> 
> 

-- 
Sincerely yours,
Mike.
