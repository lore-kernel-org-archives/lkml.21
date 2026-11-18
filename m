Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794984545;
	b=iBP+Zjk+n3d4gciR5EqQkNaBO4Kgq97R090r+dnrXm7Yq+EQDgT09jNuUG0y6sUWxU+y
	 FYntsVjoIb+YnUJRCT3mwArAePywx5g0hRBSpkT/Ht7ix4Cimu8yhoJUrdDpp0xnBWE2t
	 rd4xQGjcvmFG4vDrknUkAiR3brHTlfVpyUHpu/QK4yNb3Wp39+xKbDbBig/Ofw9UeXZ4F
	 6dVBD5HwBz3ZmiUoTHjzC5VAD3+a8YpVHnXwJ72xTLRIpzbHPGZf/t2Oy0jQgKWO/fRSe
	 5MVvdnyKrFEXm98Zy+8JN6lyAeP4HVdIv2abh7DQm4h1u7aOMw5XtWNu0dHlemfy2cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794984545;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=xxWKMH6BY+Z09D/5F5m0IFSeEDfCXNxKdZmc2UOHg20=;
	b=n3W/j9qe99mTr+5/O8WEVMITwDY/CacsuMRaa4Ue4CmQigxl2/iv6osDF9bKnGZBUBLC
	 O1lC5O+Yf4dI+nAY4AdqP30ICsqty6gdEUpkGk01gbvlEeBr1b/7stzYI1aPSZqBlCtPs
	 OOgGLwVWlebUDksrfA4+99tnbruD1XF/Y6upNEZSr/UhJdo1ezu6uxWCiuJd5ytLqXkK9
	 +iagLvQoGjSRHUKpyyfNaV7r+uqZssr8mCzyfm54D9H9g8PLO8yi+ol9LW/HnxMsbdvXS
	 9BUtj5FDP3w4I7boMiPZwrLTxjBNGgHauW9Jw9c2SabQPMf6/J0GmfvT6TwGWm7ltCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=OAW0E20z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6931606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=OAW0E20z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A45D21F000C4;
	Wed, 18 Nov 2026 06:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1794984545;
	bh=xxWKMH6BY+Z09D/5F5m0IFSeEDfCXNxKdZmc2UOHg20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OAW0E20zRI04KRDo6EGVkgEmQnUifBijI3BXdyIJEJrLFydbQ6KJF9U/H7zfKMeae
	 Me0j/n9bBj9HZw+Bd8HPo2N4//96VymwdsnC9G9nKu6vdKwZBP4IcUenxQLhyFaX9/
	 0p9JN+ck5OoX5lKdx/yOAuzeypVa63swGqvp5Jko=
Date: Wed, 18 Nov 2026 07:49:02 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: desobei <desobei@outlook.com>
Cc: Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] comedi: ni_routing: fix SyntaxWarning in
 convert_csv_to_c.py
Message-ID: <2026111830-writing-dripping-428d@gregkh>
References: <PH7PR19MB66587C2BE5E8E94F693B4F14AF7A2@PH7PR19MB6658.namprd19.prod.outlook.com>
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
In-Reply-To: <PH7PR19MB66587C2BE5E8E94F693B4F14AF7A2@PH7PR19MB6658.namprd19.prod.outlook.com>

On Wed, Nov 18, 2026 at 12:09:49AM -0500, desobei wrote:
> convert_csv_to_c.py validates register values against the regex
> '[VIU]\([^)]*\)', written as a plain string literal. "\(" and "\)" are
> not valid Python escape sequences, so with Python 3.12 and later every
> run of the script (e.g. "make c-files") prints:
> 
>   convert_csv_to_c.py:47: SyntaxWarning: "\(" is an invalid escape sequence. Such sequences will not work in the future. Did you mean "\\("? A raw string is also an option.
> 
> Python currently keeps unrecognized escapes verbatim, so the regex still
> works, but the script will stop compiling once this warning becomes an
> error.
> 
> Use a raw string. The resulting string is identical, so there is no
> functional change.
> 
> The problem was found by compiling all in-tree Python files with Python
> 3.14 and SyntaxWarning promoted to an error. The search and this patch
> were done with the help of an AI coding assistant (Claude Opus 5.5).
> Tested by checking that the script now compiles cleanly with warnings
> as errors, that its compiled bytecode, constants and names are
> unchanged, and that the regex still accepts all 95 register values used
> in the ni_route_values tables.
> 
> Signed-off-by: desobei <desobei@outlook.com>

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- It looks like you did not use your "real" name for the patch on either
  the Signed-off-by: line, or the From: line (both of which have to
  match).  Please read the kernel file,
  Documentation/process/submitting-patches.rst for how to do this
  correctly.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
