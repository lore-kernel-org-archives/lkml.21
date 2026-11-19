Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=130.136.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084492;
	b=RpXz708cWrfNSO968xy2fBNzqpQnuoMJX63W/1epR5S5EBAcopV7ta+zudjnGVrZXprf
	 6jzE9LMqlAZ+njBfd+XncxudtWwJh43P+IriDYsX80ty0SHU0cJxTYCPUuFYdyCkZxJmh
	 u37J0sj8L+jnPLQRS8ZaAmvx6qDMCgnolSGhuoBMCeEXGpeUZyJAkGAq4EeS66UpbVHiW
	 AIWWjK7EnZ04Lx7LhcCDD+on/ZJSZ81k8h6XMTorp77xP0fO1jWSI9kQCWlHL8z+ZpToa
	 vttKJbQhZrvwYqmcBhTeCb67jPNhC9PzdSTKQfz95u2BcVRYkyZ6XvQcmG2CFZf255w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084492;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=aCKEnKdCSy+ImZs7Fr08y3Q1G1aahqToEeebZ+fmVxQ=;
	b=d3FnBVgYXUTJNbZ8gdg1XvFdCxejTbD+HkTZbtWJEFCc8Wq9d393z65sg2U++JOj7eeN
	 nINmwFuRFZBH1m0Bjit4rI7h54UvTHAxhNk4J1vobJ0HTWj5pfokIwOrMv5tL1o/DmGgf
	 2LVqfB8xyuwIPZyuNNPSPSTiAzGvT5ulykUGXYDRiPsENdzxLI0kBHG4ZKweiub4TCKWW
	 pWvnS6j9N3nksqCpjP54NP/T5o6xBNaPShAftX5jgpjnSXEt5apVzJ/EHp//2GX5KTx6R
	 eUFVVG7p6fu4ADSSZaog8EQOQvgBrHcUc2PPwyNUOaWHr4p9gKCiwOgTVRPIdSQQrGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unibo.it;
	spf=pass smtp.mailfrom=cs.unibo.it;
	dkim=pass header.d=cs.unibo.it header.i=@cs.unibo.it header.a=rsa-sha256 header.s=virtlab header.b=E3Ie1BHW;
	arc=none smtp.remote-ip=130.136.161.50
Received: from mail.virtlab.unibo.it (mail.virtlab.unibo.it [130.136.161.50])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38328606A337
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:34:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38328606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cs.unibo.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unibo.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cs.unibo.it header.i=@cs.unibo.it header.a=rsa-sha256 header.s=virtlab header.b=E3Ie1BHW
Received: from cs.unibo.it (renzopb-wl.cs.unibo.it [130.136.2.252])
	by mail.virtlab.unibo.it (Postfix) with ESMTPSA id D6B4E1C024A;
	Thu, 19 Nov 2026 11:34:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=cs.unibo.it;
	s=virtlab; t=1795084487;
	bh=aCKEnKdCSy+ImZs7Fr08y3Q1G1aahqToEeebZ+fmVxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E3Ie1BHWc/V6b1bgdwtc+2v71pAz+kleKjlPIEJguRI1UeOerm0esQVsBjPfxVbb2
	 3nNRPyNBUsItmS4wxnV7QW3nDFBfTMT8xhb6a0gxwRJuRsLbmfHdXhJwoMEmOJl7a0
	 lRi+0pU0z6HbeHORs+j7+1RZlPZZSUE5dLPjJ8mI=
Date: Thu, 19 Nov 2026 11:34:46 +0100
From: Renzo Davoli <renzo@cs.unibo.it>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>,
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
	"Dmitry V . Levin" <ldv@strace.io>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] powerpc/syscall: Fix the return value of skipped
 syscalls
Message-ID: <av7Qxhc37BAA04mf@cs.unibo.it>
References: <20261030084926.1068384-1-renzo@cs.unibo.it>
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
In-Reply-To: <20261030084926.1068384-1-renzo@cs.unibo.it>

On Fri, Oct 30, 2026 at 09:49:23AM +0100, Renzo Davoli wrote:
> When ptrace or seccomp skip a system call on powerpc, the return value
> they set is lost or the tracer is affected:

Hi Madhavan, Michael,

gentle ping on this series.

It fixes a bug already present in mainline: on powerpc a return value
set via PTRACE_SET_SYSCALL_INFO for a skipped system call is lost, and
syscall_set_return_value() sets TIF_SYSCALL_RET on the tracer instead
of the tracee. This currently breaks the set_syscall_info selftest
and seccomp_bpf user_notification_basic on ppc64le.

The series still applies to current mainline. Please let me know if
anything needs to be changed, or if I should resend it.

Thanks,
renzo
