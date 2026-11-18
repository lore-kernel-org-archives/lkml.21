Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794960636;
	b=0MQezUj/kBbJJzNv+DSbN3q2V3wXxYMGVUgnoFQoCzZCUKy88bzh7h/zyPXYjr+aL0KI
	 ca2obiJxKt4nALPDLVKkEifLVM+ORIKe27qu/ysC7N28BxtuBUzfem/u6JzjpkA6i3EbU
	 fvBxHLYCHMybcjyJ9xj57bBnFr9clfWJISi7zpDOdImboDmblA8P9zun/GWqeCROTyhgq
	 pLfjTZGS2Cr+egBO4bmeHC5TVrAfCbi+DoaltdwRHqJ/e/x9Su1uTztUrJsyK1wKpMnNz
	 qHdyfnkb7h1AmXG/GpvT2QeZrUXqhocspzBuDCz8rk9xZE0TK37AMHuHy0vmrD7WWGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794960636;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=hhtGV7NL73bJe5B9lWB+5pLF+VPfTje0/6UzpuRfu5Q=;
	b=na+rekiMvdzyw8TScHWyzGsBm5RC53hUpQ45//TU9MAYvXa1wClQ7HazNht6V9wG8/NG
	 aaDzrSU1sfBCHR5CijpLgc33CHRdXOYsIB+L+gAqdeNsznO2xLiGEIyUFnAzqp+l/4Zpv
	 heAtCF77z9PMeVjUePJm5hFnE7s9jUBCdpselTaiS7m15xHCWkC5XbaVkuCqLrxoeUYbT
	 Le/aXif1YXzV6Ar/FoBmXPkF1Mw20igy+3Q7WKrLj8juwmtNi8UXv2JIkVOffzHHk5S/K
	 qjn0g1zaUKednAiGWSU/XdmNzIoLKUQbCCq1sstSenN6Vafh6YQFtwST0yX3R7ngn2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bqb63FZo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2205F606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bqb63FZo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBBA81F000C4;
	Wed, 18 Nov 2026 00:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794960635;
	bh=hhtGV7NL73bJe5B9lWB+5pLF+VPfTje0/6UzpuRfu5Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Bqb63FZokPiR44SGKuGyvIE008xeYRO1pf8CqeOqWdSHUuG1RXHMQPM9oSsM9UdwY
	 4+RlMLpobQ5kCLwFfFfVa1TIrAhjKqZM4eb7OU7f6UdGahI8M6gRvMv0n1E5TC4Szm
	 ijWYJI9RawoTG2ml6Vh7lVfD6xd4I7gniVZA8nWmcg6xG4jNBFKGOQyzxHsXwHluIS
	 g6gjW4rdyYBpeQp56htGgF9p9yx6nfx3Mr29htUcihNwLgZDkRNGmjufodptm+PFOX
	 tdeOseNZS5wIub/wU8jZoN9bcNaYzXFTfKCpYw5UXW6kQX3aLgsVoQEvYFO94apxbS
	 5x6Am13PeaNsw==
From: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
To: Thorsten Blum <blum@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, Christian Brauner <brauner@kernel.org>, Breno Leitao <leitao@debian.org>, Ryan Roberts <ryan.roberts@arm.com>, Sang-Heon Jeon <ekffu200098@gmail.com>, Wilson Felipe Pereira <wfelipe@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] init: Use scnprintf() to simplify setup_command_line()
Date: Wed, 18 Nov 2026 09:10:32 +0900
Message-ID: <undine-1794960632051140078-b87135ce0906bd8f@undined.local>
X-Mailer: UndineD 0.1
In-Reply-To: <20261117234805.551734-2-blum@kernel.org>
References: <20261117234805.551734-2-blum@kernel.org>
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
Content-Transfer-Encoding: 8bit

On Wed, 18 Nov 2026 00:48:04 +0100, Thorsten Blum <blum@kernel.org> wrote:
> strcpy() has been deprecated [1] because it performs no bounds checking
> on the destination buffer, which can lead to buffer overflows.
> 
> Use scnprintf() to format the saved and static command lines while
> taking their buffer sizes into account. Use scnprintf()'s return value
> to keep track of saved_command_line_len and avoid extra strlen() calls.
> 
> No functional change.
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy [1]
> Signed-off-by: Thorsten Blum <blum@kernel.org>

Looks good to me. Let me pick this to bootconfig/core.

Thanks!

> ---
>  init/main.c | 54 +++++++++++++++++++++++------------------------------
>  1 file changed, 23 insertions(+), 31 deletions(-)
> 
> diff --git a/init/main.c b/init/main.c
> index 8a6c3b4f1d5e..0c3bc7efe0f4 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -669,36 +669,31 @@ static inline void smp_prepare_cpus(unsigned int maxcpus) { }
>   */
>  static void __init setup_command_line(char *command_line)
>  {
> -	size_t len, xlen = 0, ilen = 0;
> +	size_t xlen = 0, ilen = 0;
> +	size_t saved_cmdline_size;
> +	size_t static_cmdline_size;
>  
>  	if (extra_command_line)
>  		xlen = strlen(extra_command_line);
>  	if (extra_init_args) {
> -		extra_init_args = strim(extra_init_args); /* remove trailing space */
> -		ilen = strlen(extra_init_args) + 4; /* for " -- " */
> +		extra_init_args = strim(extra_init_args);
> +		ilen = strlen(extra_init_args) + strlen(" -- ");
>  	}
>  
> -	len = xlen + strlen(boot_command_line) + ilen + 1;
> +	/* Keep bootconfig kernel parameters before any "--" separator. */
> +	saved_cmdline_size = xlen + strlen(boot_command_line) + ilen + 1;
> +	saved_command_line = memblock_alloc_or_panic(saved_cmdline_size, SMP_CACHE_BYTES);
> +	saved_command_line_len = scnprintf(saved_command_line, saved_cmdline_size, "%s%s",
> +					   extra_command_line ?: "", boot_command_line);
>  
> -	saved_command_line = memblock_alloc_or_panic(len, SMP_CACHE_BYTES);
> -
> -	len = xlen + strlen(command_line) + 1;
> -
> -	static_command_line = memblock_alloc_or_panic(len, SMP_CACHE_BYTES);
> -
> -	if (xlen) {
> -		/*
> -		 * We have to put extra_command_line before boot command
> -		 * lines because there could be dashes (separator of init
> -		 * command line) in the command lines.
> -		 */
> -		strcpy(saved_command_line, extra_command_line);
> -		strcpy(static_command_line, extra_command_line);
> -	}
> -	strcpy(saved_command_line + xlen, boot_command_line);
> -	strcpy(static_command_line + xlen, command_line);
> +	static_cmdline_size = xlen + strlen(command_line) + 1;
> +	static_command_line = memblock_alloc_or_panic(static_cmdline_size, SMP_CACHE_BYTES);
> +	scnprintf(static_command_line, static_cmdline_size, "%s%s",
> +		  extra_command_line ?: "", command_line);
>  
>  	if (ilen) {
> +		size_t len;
> +
>  		/*
>  		 * Append supplemental init boot args to saved_command_line
>  		 * so that user can check what command line options passed
> @@ -708,19 +703,16 @@ static void __init setup_command_line(char *command_line)
>  		 */
>  		if (initargs_offs) {
>  			len = xlen + initargs_offs;
> -			strcpy(saved_command_line + len, extra_init_args);
> -			len += ilen - 4;	/* strlen(extra_init_args) */
> -			strcpy(saved_command_line + len,
> -				boot_command_line + initargs_offs - 1);
> +			len += scnprintf(saved_command_line + len, saved_cmdline_size - len, "%s%s",
> +					 extra_init_args, boot_command_line + initargs_offs - 1);
>  		} else {
> -			len = strlen(saved_command_line);
> -			strcpy(saved_command_line + len, " -- ");
> -			len += 4;
> -			strcpy(saved_command_line + len, extra_init_args);
> +			len = saved_command_line_len;
> +			len += scnprintf(saved_command_line + len, saved_cmdline_size - len,
> +					 " -- %s", extra_init_args);
>  		}
> -	}
>  
> -	saved_command_line_len = strlen(saved_command_line);
> +		saved_command_line_len = len;
> +	}
>  }
>  
>  /*
>

-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
