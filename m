Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.249
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458502;
	b=Oy8XHwvmDlKhR6bDpxKJqwKbZIRgUoRtC+UhK3UuoFW6kTtLNLWsiJ5jEwSN1S6t+1YM
	 Bedg62gZLh6vN5uBkIvlXGvR9b5cg81PHTsysJDb22ArwfSn/MrASQaERJKt+swFYLgP5
	 ckh9TtPxmfCSi9dtyWzfte1gfbnIIOtqfHZrLI/xHbspHNDnZvPse9FjvEgBrT/E+vlZf
	 Yu33DXueMh4Z1ApUcZijfE5svrGMayBNiUqm06uJjzySiNklIDHfmIQtBCpX0gedGvCmP
	 ZFuo5wyJ/VWpvPMCqIMLUn6O3eopDyJCZKNjdbtJvxAIwq/3rEnwTzZnrQjG0bA7X+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458502;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Date:Message-Id:In-Reply-To:
	 References;
	bh=ePtAq88JQv2mQTCltV6prJnPqbIrXTNiEgvUQLAl4To=;
	b=Gy3t/m6T6AtRV+rEYjZi+kaVWGBvlnYu8+1RuHVEqhzdptsc7V3JFN5NFzBvGqxPFwfb
	 AtJyjhSX0hxSQqj935TV40F3VYuqrnNQsfFg0eG2dWnC/ERC5dyEUAt+4CnDzZEdB4i4Y
	 OzSwywCkgcfl7UpbkRYW72M5OJWw5hJCNbHdUt1+tEgsl4W3z785VMvHJ3QjZSYeZe/0w
	 AVDpkDrureIg5ZLn1crR0lQOoR+M1F5TA+gLBYIqyra+e7dcTiq3d1lS+3tlyrP9UB6AW
	 NqgpKaUS3g7cZqfgpuclDpVs7xDk9QBwVHjpfQBTPwiJg+uj2LVyO7IrkbS34cFC8Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cressey.dev;
	spf=pass smtp.mailfrom=cressey.dev;
	dkim=pass header.d=cressey.dev header.i=@cressey.dev header.a=rsa-sha256 header.s=key1 header.b=terJ6FOM;
	arc=none smtp.remote-ip=95.215.58.249
Received: from mta1.migadu.com (out-249.mta1.migadu.com [95.215.58.249])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C282B606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:28:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C282B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cressey.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cressey.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cressey.dev header.i=@cressey.dev header.a=rsa-sha256 header.s=key1 header.b=terJ6FOM
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ePtAq88JQv2mQTCltV6prJnPqbIrXTNiEgvUQLAl4To=;
 c=simple/simple; d=cressey.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795458494; v=1; x=1796063294;
 b=terJ6FOMLbjLx3VoE3P2Fv0DRIKfB9L9FesGDQLqeEo0sybE3t2VY+wRe7CPJg1UqWyJv5Kf
 WD3nJ/U3eBH+UfZo+GtKUZTpKWdGlUvbyuS9sN13f4WLSVXyLxrgYIoL0EpNvQUWIvBlXbYBCcS
 sB24vX+NOTIlplCZrJBaeqX8C0zSh8+5Y/eAZs9ij6z+eS32B9kiVxH9DZFiBPtpI42587xk9ZN
 NkOqNzwGVel6MTPRbQL2i7eF4Pie+nIQloeQrVBR61hIe6+Zp6hYP1RIvRQ9XdQR98kEgNce6ek
 SG5pGYZI1sp3KuOQeHCh0H4ZSApHK9YE8DWd4uo0yp9Qw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1b45b762173106e7;
	Mon, 23 Nov 2026 18:28:14 +0000
X-Mizu-Trace-ID: 1b45b762173106e7
X-Migadu-Flow: FLOW_OUT
From: Ben Cressey <ben@cressey.dev>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, Josh Poimboeuf <jpoimboe@kernel.org>, kexec@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] x86/kexec: Type relocate_kernel() to drop __nocfi
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Date: Mon, 23 Nov 2026 10:27:57 -0800
Message-Id: <20261123-re-947c87d493b9@cressey.dev>
In-Reply-To: <20261112080050.GZ2668804@noisy.programming.kicks-ass.net>
References: <20261111-x86-kexec-kcfi-v1-1-b4d41ea14deb@cressey.dev>
 <20261112080050.GZ2668804@noisy.programming.kicks-ass.net>

On 2026-11-12, Peter Zijlstra wrote:
> On Wed, Nov 11, 2026 at 03:26:59PM -0800, Ben Cressey wrote:
>> The check guards only the pointer, and not reliably under plain FineIBT,
>> which checks in the callee with IBT off. A failed check panics or hangs
>> with no CFI report, since load_segments() has reset GS.
>
> I don't understand this; what?

Sorry, that was hard to follow. The patch gives relocate_kernel() a kCFI
type. The call to it is then checked, and machine_kexec() no longer
needs __nocfi. It does not fix a known bug.

That paragraph was about the limits of the new check. Plain FineIBT
relies on IBT, which is off at the call, so it can miss a pointer to
code with no preamble. A failed check may panic or hang without a CFI
report because load_segments() has reset GS.

If you'd rather keep __nocfi, I'm happy to drop the patch. Otherwise
I'll send a v2 with simpler text.
