Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729239;
	b=D5cIFFlI7XdYyQDnLM/acEMDIHeRKKr3VmiPFTmHNmZ+m07AekhxagWdp2oRIGHNSufo
	 88kuL9b3FQSfMRBhDNl6u9E464gzWfd1liOpr06v8zE2isK/Zk5KgVCN8tkx3LkQq/Urq
	 RMLqX9hX5gYBpoGTWtLlNiXpEzTaP3vA8sXkAMiLUZtL1PGFB8xhEgYwzqCnI6X+OjUMt
	 jekv7BpAIx6XVUC49WXf3Krt6dQV4EKgepAFGfrhFWQmJ0X2Xd3dMQ7x/mckWHHOzDcpY
	 fFUPDMIYsabZ8B8h+3W+/W0KLaZaFIeaheJXNJwzvPIei+bpCHbSSipvmFEd9axS0Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729239;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=nxOeXcIHlrhhgXIC0hXVqACYVnzvsSHIm0+QlxzbOM4=;
	b=zzHmlvjvq/d8630wpJ348xX70ysH4WTxoBBFFvKGZVtEzRs9yMs/Jc6GiiXTe90PAQV5
	 4eNYxbrHLuOUufNKfbQpww5MVsVvsZ4+I3y8azFHjhHHXVMUma3kPCojWQ0OCqGsT9lLQ
	 Vy07udKE5pmfwfdbVLshurwXyMimduP4EWypBvwR25/I4ZSgIuNJBU4ydF8lK6NsQnS3n
	 cRrV2BXzYHNnFPyiCsDw7eV8vtWsjik7CCjsQQZ0MZ+hI39pAryphBB0/OQxmb8PkxfHs
	 l3lJtwu/lNbvbo8AKlrgX+WI/6+1EjfAj3GgPS7A/jxKbRSycHnVKgCkWuvUkwKoQ5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LxNxBTyC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F533606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LxNxBTyC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A4FC1F00893;
	Thu, 26 Nov 2026 21:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795729239;
	bh=nxOeXcIHlrhhgXIC0hXVqACYVnzvsSHIm0+QlxzbOM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LxNxBTyCXilIIYwMahbQW/2fK/WfjT6w0yfM2VQSYknsdmXdSUj/7k/tJTzdVY1mT
	 OJRSfQZs+npB1T/tpUbgnvyK6wVg0UJXkHzpVnhuhI1iKNTPxa8bDva8wiWWDcZ3Au
	 EoM6DvS2jaybKEuLdDq/6tA3kbivvHW7UABeH1XVgvfu9ejJ63wPvR7aas+g9fm69r
	 p1jjMonQZp8ikXEEJhdEcMQc74zqXM39R8VIIryURpzkahUdV2U3FEXracQWjhYcT8
	 OWl0RmJfswFqIoi1YkA8hCgil7jbGUVK/H60LVT1wOySySi+oNwc2IWcCkckiuNADz
	 u233geQcQIWhQ==
Date: Thu, 26 Nov 2026 22:40:32 +0100
From: Thorsten Blum <blum@kernel.org>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Wilson Felipe Pereira <wfelipe@google.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] init: Use scnprintf() to simplify setup_command_line()
Message-ID: <awinUAUXoDboX9Gz@kernel.org>
References: <20261117234805.551734-2-blum@kernel.org>
 <undine-1794960632051140078-b87135ce0906bd8f@undined.local>
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
In-Reply-To: <undine-1794960632051140078-b87135ce0906bd8f@undined.local>

Hi Masami,

On Wed, Nov 18, 2026 at 09:10:32AM +0900, Masami Hiramatsu (Google) wrote:
> On Wed, 18 Nov 2026 00:48:04 +0100, Thorsten Blum <blum@kernel.org> wrote:
> > strcpy() has been deprecated [1] because it performs no bounds checking
> > on the destination buffer, which can lead to buffer overflows.
> > 
> > Use scnprintf() to format the saved and static command lines while
> > taking their buffer sizes into account. Use scnprintf()'s return value
> > to keep track of saved_command_line_len and avoid extra strlen() calls.
> > 
> > No functional change.
> > 
> > Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy [1]
> > Signed-off-by: Thorsten Blum <blum@kernel.org>
> 
> Looks good to me. Let me pick this to bootconfig/core.

Have you applied this yet? I couldn't find it in the bootconfig/core
branch, which hasn't been updated in 5 years:

https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git/log/?h=bootconfig/core

Is there a different tree I should be looking at?

Thanks,
Thorsten
