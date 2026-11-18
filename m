Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794997832;
	b=fb3c1aAK1cklj/mGtjebZZye3PWCBcbAoiIkNiZ/9fwVj1KjXwRj3G+mHqZhUHCojMs1
	 tZW0WZnNNBqhy/FDnAEJFROS6yweI+wykBLqDHYV+D5OkDl4YSOHTZvCdVhQZmx5ryBRt
	 VMPw5EOlMolLLh0tAxkLgrZb015wgLyVcGxv02qb8HARGj2i2/kjbOVD9oAotRrAfo6iB
	 MOtfxaDhsw84y5R1t9LRak95rr/OpfOXvZa5kR/pdqoyQDMmmnc5pf2JlO3PZx2NpC0iH
	 OtFoQuNG/STQ5T9IZhwXIjZie5cXMQD9Oi478bPpi+qSa5Lp2UvppzWRmN18QB2rF+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794997832;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ZFYle6KblLp4pMRurRVbM9XAwT6FbRg7IQe5ICogpZc=;
	b=fYLmVcXOqgcK1zOmEMxWoaCEN39th0oYRuP/ul3MYMaCde1amo+E9D/MAkxwogRFY7Io
	 tVwegfGdiMMvPs7/Gi5SVVII8kGibILJstaoL289YLSKXUxbM5WEd9PoLDILLgqxf7Vx4
	 gcecW2s6+gIfpm2zt+WIosdnLJBZotABBmiFte9gOPCOhuSUL1ImvMw43A0CzyGRyY7wa
	 cpcLFdHGN7CYAc0/sFJbE9+wSXSny0WqEYQSts5eoydTgUhfB90LbogQz3QwMVjFiAqFb
	 y+6nmUyyd1nXw1LUTDOFaGGV7C0W/QSplhzZANjM4nRXx5feex9N0Mgc9vB94xKGi5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uAatVS1p;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB412606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:30:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB412606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uAatVS1p
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso7586665e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794997830; x=1795602630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZFYle6KblLp4pMRurRVbM9XAwT6FbRg7IQe5ICogpZc=;
        b=uAatVS1pICWhh2yIqaUAXDLIMc0ZHMlELMNRzwjpIclFx+LoC0ohfCo361ezZ80LY4
         zE1nA2S40seW4kNMmjBAtGig/Dg5XUJ2ahF3n/kL7AyqndKfaazJm01QBoIEEfYXmC9N
         bioFHuBMHolD/d09iFTxxHKp9fZHXBbs2OgQFcPDuto4aOl6CrK3Pn179NMaifdFlPPw
         K0jSgeZUUT1ZwFLZ6pW5OAXEJ5NasznwsoiYqgtkrh/WDtqdscPt0XwF+LXqrS66q01B
         4mJw7APgVFOJE7+H9vDF6lC6tl5E0ybadmBZo17H71LJcezN+J4r6LS+2GfJVMNSwJBQ
         TVEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794997830; x=1795602630;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZFYle6KblLp4pMRurRVbM9XAwT6FbRg7IQe5ICogpZc=;
        b=Xiigsi1Eblt8bU7AFIBOGRSmqpI1eQfV/MJXlGFLwwdutpqiAEH5YhkI/XxsKOjmrc
         cRo9+TelUoIo3KClC4NC7YI/UvGbkdqu8vEghB9p9M1CrERj07jY0cS7ooGkmnT4/Lni
         sMrlmfHmFFJ8JjM3TEml16qmUcFzHOCGBwAFNsI/uXsmaJ02n/nCy+NZiydqfKCGnEON
         IhBnUDH010CufZFRNkZyGoE+bbk3B9CQ6BhK7pKmyrGlR8T7I5xyVJA+BnHcmYr95eqx
         tOuxHCdNZxr+zSmABVSAdm+S6EI9r3+om8Y2E2/ucSimS+oIewbFILhBSmUGTV1gZgZs
         ErlQ==
X-Forwarded-Encrypted: i=1; AL+hErG9N92uNiVLOMNCd11w3Joo+g+Ea4hRXXRF3qVmkBHrSP8cHLhhH0g60ImJ2qtuyM/cmyQYML88yfWDqAs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/d1LJ7IvNxxyly7AZa+WvsHg+pSUKDawtC3Cwy5r32EuYngU67
	H/oqdmxeUR/Fud1+295mKCtNHhEQO6u2XvKqwvPDQQ6rQ61D82LUbFIZ
X-Gm-Gg: AYBFou0lutDL/mwjBHcqH0dBo0h1zrLLlpbbBLeWaBm70pGrClXcGPYBnPfs5k4iQJw
	CmZCEQenFI9TSv+WDgZMfd9VseJEdncO3Brb6C36Oq+fMo0IET8c20AQzgAyf6ufvwZin0X0dDE
	Rtam+81iZP4pJlXTI9MiEDPTzOYUwBiUjP9CUCzp6qR6vko5QJw5I1H7uA+nsaYI09S1L2ToOdG
	8rgxsLjYROgm22ruNYfOxt3Vt17w+ZxARqJ0YNzCHQDtb70LiQ8iC1+p+Vaw3cObIYi4hjNNTBc
	RuVSTSpZjuskRMifX9/tO0jAPheydTCU6Qo8F4TE4jm6YnKTa6/WefvfxLGRFmAa/QSARPe/IwJ
	c5o7PoIUi/VO4R+Qi0+osq0EvuiV8pn1svpppHwOf2dkHLJMYBp4f5Oi+baNB4syPdWFuvStJWw
	zrGHT0X0LzIvzf5akrlb88PXN3MhR+S47jjbm250alMy++a6DxU71X4t/DsYyQYDkiMxiRBtMtE
	MuTy30qQEo55z9PCJ63eoS08ssaggzsSxb2cQrMeXRvEvNuQ2Tsivloj+XzgRh+eORDrdS9aQoz
	J95b42rT6o+i16VUTmW3x5OefaJk+C3C0WDtTZ7SHFm8syBIKyxPvMsALfXATQNKmbr1zUbzFY+
	oKsNTeplXEZs=
X-Received: by 2002:a05:600c:b99:b0:4ba:6d8:dfad with SMTP id 5b1f17b1804b1-4bb7da1aa22mr38586795e9.14.1794997830101;
        Wed, 18 Nov 2026 02:30:30 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d257112sm49503835e9.2.2026.11.18.02.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:30:29 -0800 (PST)
Date: Wed, 18 Nov 2026 10:30:27 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Thorsten Blum <blum@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Masami Hiramatsu (Google)"
 <mhiramat@kernel.org>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Christian Brauner <brauner@kernel.org>, Breno Leitao <leitao@debian.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Sang-Heon Jeon
 <ekffu200098@gmail.com>, Wilson Felipe Pereira <wfelipe@google.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] init: Use scnprintf() to simplify setup_command_line()
Message-ID: <20261118103027.33256f2b@pumpkin>
In-Reply-To: <20261117234805.551734-2-blum@kernel.org>
References: <20261117234805.551734-2-blum@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 18 Nov 2026 00:48:04 +0100
Thorsten Blum <blum@kernel.org> wrote:

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

I think all the lengths are known (and used for the alloc) so the
code might as well uses memcpy().
	blen = strlen(boot_command_line);
	...
	if (xlen)
		memcpy(saved_command_line, extra_command_line, xlen);
	memcpy(saved_command_line + xlen, boot_command_line, blen + 1);
(etc)

David

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

