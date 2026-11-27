Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773122;
	b=ctXS2SrqEMc0zc9oGoyPXswctsy1QEvXsgDnOVbXFN/QqjT/mBovZyjIhEsLmPnd/CNq
	 EqYDlxXqU9Bym40AUZmOG/EZTnA+5BMCz/odWxsSlR75Ru4o30UqR2kqD7frnF1r7KZoZ
	 VX1N9VLh3hr3QQGkMWSCSV2tGPsgwV88xOCXzvRH/HPWNDzF3uZTKNlvhRHI3W6O05GDu
	 d2wNJlpV4aanrh3L2mAF5wK6KvWDwDER5i3fsbkDktHs+NlwYTX4EsFbJkiO0RCptUpfV
	 XlbwyJHZqZ7ZG1WHj37GSqqX7hfMR1vtApta/rGMxPZrbJD2vD6uKPv+6ojv+gWekKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773122;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=O6L939f9X0Bf0f8CrwpPeKq7uGGEz23ogLG/rkd1zBs=;
	b=pbGnoJtiKKGqU6Wo3/q07vZ8YjmcINp/o/RRmhgPQTwnjcfO99MloEWgfGQJm04UPHD1
	 f5aw404o8pUlAW3MepcuuTcnS9Tn64oEKNIQ7u6HSXnEhEd+ZOW9gfsddF3cv4Rt9oame
	 c0C/PdtAoAysP4GKrXm3p/JsxV/rNBYgxAnzP3AsXVA3ji0X7M6EgrGBzj9NhbRXpHiHZ
	 xZlA3q1MTN3ne2HJ8H022o48FkvJTEAkvmxpFErodhffERLEAekrnaSTJUOrf1KTJh+4P
	 vpQEaOPW70kn086bQli6wFMGEo7/ZaqtZYRzn0XDfL3TqgPfrQ8QaxlXrFftTeID3Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YAZn7BJi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E329D606A329
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YAZn7BJi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EE861F000C1;
	Fri, 27 Nov 2026 09:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795773121;
	bh=O6L939f9X0Bf0f8CrwpPeKq7uGGEz23ogLG/rkd1zBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YAZn7BJiJI427OpNFSlP+H/uM4G1EUDdaY4bRj71kLl3+iPW3mj4xQ/Dpe66mT8/M
	 q7ELSN9Dqf+RgZIEcokTnUvqDANZagzcCIYraEjdLaO+YaWrFVXlvoRs9VDymmYCPf
	 L6UeE/+WM7412/FvIhViKQuGE+hOARvjofUO76YvcKrdxYbBoo8/ewgwVymZkmLUTM
	 gvT4pfQa0N6k5B/FNqK9RBdwPuPiXiBejCDcxjiCpRHgxvqpiZT9JPwt5vGlUeqMyb
	 SE3jSrcDDs9kwh6JEMC87djW6rXSeVSVj5bnKwyDoSQKB/YKI26xpQjZXYYa73L7Ig
	 ysM7h+VbK2SEw==
Date: Fri, 27 Nov 2026 15:17:51 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Nikolay Borisov <nik.borisov@suse.com>
Cc: x86@kernel.org, mhocko@suse.com, kas@kernel.org, ljs@kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>, 
	Ingo Molnar <mingo@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Kirill Shutemov <kirill.shutemov@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Pedro Falcato <pfalcato@suse.de>
Subject: Re: [RESEND PATCH] x86/devmem: Drop /dev/mem access for confidential
 guests
Message-ID: <awlDUT0n3Uo4mjld@blrnaveerao1>
References: <20261124160025.738362-2-nik.borisov@suse.com>
 <8e8bda1f-dbcc-4f24-bc75-0b68bcc1a40c@suse.com>
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
In-Reply-To: <8e8bda1f-dbcc-4f24-bc75-0b68bcc1a40c@suse.com>

On Thu, Nov 26, 2026 at 10:28:02AM +0200, Nikolay Borisov wrote:
> 
> > diff --git a/mm/char-mem.c b/mm/char-mem.c
> > index c5761ddedbd7..5d383befd87d 100644
> > --- a/mm/char-mem.c
> > +++ b/mm/char-mem.c
> > @@ -30,6 +30,7 @@
> >   #include <linux/uio.h>
> >   #include <linux/uaccess.h>
> >   #include <linux/security.h>
> > +#include <linux/cc_platform.h>
> >   #include "internal.h"
> > @@ -609,6 +610,15 @@ static int open_port(struct inode *inode, struct file *filp)
> >   	if (rc)
> >   		return rc;
> > +	/*
> > +	 * Enforce encrypted mapping consistency and avoid unaccepted
> > +	 * memory conflicts, "lockdown" /dev/mem for confidential
> > +	 * guests.
> > +	 */
> > +	if (IS_ENABLED(CONFIG_STRICT_DEVMEM) &&
> > +	    cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT))
> > +		return -EPERM;
> > +
> >   	if (iminor(inode) != DEVMEM_MINOR)
> >   		return 0;
> 
> Having taken a 2nd look I think a consensus solution would be if this check
> is moved inside devmem_is_allowed() for x86. That way /dev/mem could be
> opened but reads will simply return -EPERM. That way x86-specific checks
> don't leak into the generic mm code.

I arrived at the same conclusion. I believe the reason Dan chose to do 
it in open_port() is to mimic lockdown-style semantics so that userspace 
could detect and fall back (to using /sys/firmware/dmi/tables, for 
instance).

But, as far as I can tell:
(a) userspace should be able to deal with -EPERM from read()/mmap() too,
(b) and the tool failing is better than it crashing, or worse crashing 
the guest.

So, I think we can move the check to devmem_is_allowed() and reject all 
accesses for CoCo guests.


- Naveen

