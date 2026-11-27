Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795742326;
	b=Q9uirxTmkxCzLnVaBPwamcfkrkijR66at0j9qnSRk/a7zfZD/TFnTqCZAeLOUHjso85d
	 1Gz+KWCA4igjyG9TR9ZQ2KXxVQSw4MDPA4i9Dnlggoo1ebZsgzipUGYZSPzHHdD91Mrfh
	 JjOx1NI8tXafR4jjV8EvTmIg9d1tS5XbqRPHjE+Tcg35rIUU8txa8SRTDJtNM7PgxKPTk
	 iwi/U2CJtQLmcmIpIAwINPcYKrBaj2lctkEEyTsOV8YC8FqQG2H0wFkaFvY9HpOfF5eca
	 6mN2LtvoJZwqbUAozDmoO5dQuOl7FRxpgS2brZdS7meuvtCM21UKbSfFJv/cnrkLkNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795742326;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=iao1EWCDDfVtlF3aXs2M95w1AQpIVf65dJ9wkuxqDiw=;
	b=HvPn46IyQbIHA1tmURu+ISq2wqbb1ODBS0iUp4s+J2KLr7j+tph0VRrZnG2jD/MjkwsW
	 9LT8Fcb/GdMN37aL70SDFNHT1yd+sYjmnz8vwgHn3mDCgHHv2+6Et/5KTM2F9u4lFl7K1
	 37FVVdtEwhJAnFvzHvpe6IiQVqXBq4Haeo34JI/sfLqBT/RNQ1UAnshsSTiSTff1YY+6H
	 x02/j23M24473kHyGU3ehpoAdV3vKS9+DGB909pkNpAE7Tls5HRP2cJwxfx3KPjhR/q1Z
	 ap9Qq99Fp3Tl8q1Is//7aMqyFTkRpmVa7vFKcpYThLRM9zJGt4mOqtGUDuK2g/8TWwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=HkCeHt6F;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DF2606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=HkCeHt6F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05BDA1F00893;
	Fri, 27 Nov 2026 01:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1795742326;
	bh=iao1EWCDDfVtlF3aXs2M95w1AQpIVf65dJ9wkuxqDiw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=HkCeHt6FYbeW2EQ0F4vhdp4mO4uS/bj+ipMJjdiFTslH/6Ahv8hoiMo4wL8w/mREH
	 xvMJJ+pULb5D/uGOvWaNI6la7rjKVcgCep6smQAXKwYdkj38dpkU+zDFSpwEFucdsl
	 xXDZ/M9IgbKYDCLKvfrfgm9R3LMEusRUZUfzP/1c=
Date: Thu, 26 Nov 2026 17:18:45 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: Yury Norov <ynorov@nvidia.com>, Valtteri Koskivuori <vkoskiv@gmail.com>,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org, Eric Dumazet
 <edumazet@kernel.org>
Subject: Re: [PATCH] scripts/bloat-o-meter: describe output fields in help
 text
Message-Id: <20261126171845.de2fdb3c4b15b1b6a22fb7f0@linux-foundation.org>
In-Reply-To: <20261126-bloat-o-meter-help-v1-1-fb0785c94bbf@igalia.com>
References: <20261126-bloat-o-meter-help-v1-1-fb0785c94bbf@igalia.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 26 Nov 2026 19:13:00 -0300 Mauricio Faria de Oliveira <mfo@igalia.com> wrote:

> First time users of the bloat-o-meter script might not understand what
> its output fields mean (add/remove, grow/shrink, up/down, Before/After),
> and even occasional users might eventually forget.
> 
> Describe the output fields in the help text, so it is quick to find out.
> 
> RawTextHelpFormatter is used in order to keep line breaks in place.
> 

Nice, thanks.

RawTextHelpFormatter has apparently been in argparse since 2011 so
there's no breakage risk.

>     Before:       size of all symbols in old file.
>     After:        size of all symbols in new file.

LLM suggested a little adjustment here.  wdyt?

From: Andrew Morton <akpm@linux-foundation.org>
Subject: scripts/bloat-o-meter: clarify Before and After help text
Date: Thu, 26 Nov 2026 17:15:17 -0800

bloat-o-meter selects symbol types according to its options and filters
some names. Mauricio Faria de Oliveira's new help text describes Before
and After as the sizes of all symbols in each file, which includes
symbols that the script does not count. Say "selected symbols" instead.

--- a/scripts/bloat-o-meter~scripts-bloat-o-meter-describe-output-fields-in-help-text-fix
+++ a/scripts/bloat-o-meter
@@ -27,8 +27,8 @@ fields:
                 '-' means symbol added/removed;
                 '0' delta symbols not included.
 
-  Before:       size of all symbols in old file.
-  After:        size of all symbols in new file.
+  Before:       size of selected symbols in old file.
+  After:        size of selected symbols in new file.
   chg:          percent change.
 
   Symbols in both files with the same size are only counted in Before/After/chg.
_

