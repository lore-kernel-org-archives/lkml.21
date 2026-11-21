Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795292149;
	b=Vg5vWHxq2bau8zZUMX3GHbOEvdWT8CIGpeLq1vAXhTASAEDGwoDxzS9yEZ2PHgMnJDcw
	 zQhz1mU4eKL+N5Ka9BhN2zEirWTKcrEXDKJfAep0dNlaSKYn+2r0FUwsGP+Uk65Te78uR
	 muL3L1U+fhX6FyVF2eWMQu8l/AGOF4sF1URtHU6FlDWT/Q2fFF00HcOrbCYfMHqPH+xFf
	 z7SBnood1v90zEAOWjx43W5SSmGc0pgJShRs5I2G/QffjrVsAtRJzchYOoOOrq+Hvvu8d
	 XDFHiCd5OySmoV57hzTwDqLBxftbhbdFSkUXVN7H5KM1z3GACh1INN1xM1LfGlzitbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795292149;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ptZn/PY1qnnr3eBmB2mWHLWI6g925yKErFSC8CXOBEE=;
	b=xGKqqB/Kx8bN4YA7MhtW7VWNFasH82dkwz1J6Th9baR6KUTLWhVdGNzF3PXGIewX7u0J
	 GUuyPNy/HP+CMBuNLrL7QBevyIkgFFNCQb5BVHoF9bd2gp79rYcCCi3qLqHZlvE3RTdf0
	 SeI3KFiAGkHd2mmnttn6WeNxv/b36r8qNX0XtI9F/dFkc5iNhH8lrpeDQ3hK1WxvAi/Gx
	 E4ZQAbtlr6FysFreB9LrDiOylGc9LgJUjyY02CFcd3fidVSHMgSRoVWH7iNIP0QJFNuIH
	 WKjAdr+cffCXB8/Q3/tIxoEhHhCzXVHrv+aQSUKPumkTd6b2jGtgUrUSWUvDVG9aQEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XVRSxQs6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA87606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 20:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XVRSxQs6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8F561F000C6;
	Sat, 21 Nov 2026 20:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795292149;
	bh=ptZn/PY1qnnr3eBmB2mWHLWI6g925yKErFSC8CXOBEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XVRSxQs6Ig7L8GYvF4uChf5yMpyTJMFIJuE4kW0Y/pdw/KhtVj2iB3TMm0eOBwORQ
	 68Gsij5X3mzfQ1jVF5a/f5ahzCz8GYq37mYPB7txL00NeHZlFJDTnqrWt6eVezclHI
	 SjinjifoWOEP1YXmMmqSYGX9a/pHeePcti9Hp6C1eCjmwa+VbRNVFQZjHbIzE7ixeg
	 Drw7G7E8WiZbMmAxI0IDttPUgKEruPiDopt9GjIWLI0MPOomAUDV7VtITfuEdvtEQQ
	 RbnO1kUyPq4oc54mhDGQjmHv8qaPqXynr5Ku2fxA6530UG3Bv04198KaQ+WD3ASjOf
	 uAFHNPQ5ViFBQ==
Date: Sat, 21 Nov 2026 12:15:47 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Jiri Olsa <jolsa@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Jason Baron <jbaron@akamai.com>, 
	Alice Ryhl <aliceryhl@google.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2] jump_label/x86: Avoid decoding instructions for jump
 entry size
Message-ID: <awH76ikbfurgj63W@jpoimboe>
References: <20261117195506.23759-1-jolsa@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261117195506.23759-1-jolsa@kernel.org>

On Tue, Nov 17, 2026 at 08:55:06PM +0100, Jiri Olsa wrote:
> arch_jump_entry_size() runs the full instruction decoder just to find
> out whether a jump entry is 2 or 5 bytes long. A jump label site can
> only ever hold a JMP8, a JMP32 or the matching 2/5 byte NOP, so the
> size can be determined directly from the opcode byte or by comparing
> against the x86_nops[] encodings.
> 
> This matters for kprobe registration, where the address safety check
> calls jump_label_text_reserved(), which walks the jump entries and
> calls arch_jump_entry_size() for each of them. When registering many
> kprobes the instruction decoding dominates the registration time.
> 
> Signed-off-by: Jiri Olsa <jolsa@kernel.org>

Acked-by: Josh Poimboeuf <jpoimboe@kernel.org>

-- 
Josh
