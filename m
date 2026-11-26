Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795653887;
	b=NFxh4pnzV/2kFU3GGx6AmQbirFGQkg0q1kvlV3X/XxMMVfObsaT1FmP6ZFQdFyPJTAVE
	 yxHi0GYTju1Y6l9eK5QJS0933YvzWmuW/vsHg1sPDfpUSjNTZU+GHjPK7cUa06HoK+i8w
	 4hyTBQ7Gn+ACGyXaiNT3XOjjAf6+evzGxm4cXKjnPpryXnpfcWcOuN27pgP6evatabKGJ
	 OhCT4PANveW97lkuw2V/+/o2KXR4dA8FDGfiJhiJoQcvxSL55uJmas15sXq+8059Zfi4t
	 NZfN5ScaaJf3VUqBm31UGUxqwz2O+esG6lqzAoAWVf1LdoVb7iXwTYRlg9bo56Fo0YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653887;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Qa2fXQ8QHv/UVSD1PLtqudyUB69vbVtCIiXIZczjwis=;
	b=tZQ+gQZSl3ha9JbugatWxOqq1nLNzHay5cr9iDSN+OmGg3jnpH89156Xqvs4WjpvM2kN
	 C46RmnABVoTX+R5kDD1qBFNY/Bcd928ne9tA5Sd9Oi1Tri+i76elgKSOd/gqo9lpXWQL5
	 0MuwdtDzY3yDNGW8PZuPL0F56vITjCDrpGZdjKuWIoBqpv1x1eEbSj8kI9mletk7uujNI
	 bPR6JZdbpEEEkOIUDyv9pcpVrbF7XiqLvmcf6zRaTpthtnY+dxQxFHAfImXs7o+FpV4d4
	 plojMeoqiErQODMmv6iGRmVERrMwHGyIGHf5m0IPUic7+IP77xGT6V0WaPQRMWR2Lfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=dPntnIXx;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5496606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5496606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=dPntnIXx
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id B243440E0232;
	Thu, 26 Nov 2026 00:44:44 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 0E8_dedj0J4t; Thu, 26 Nov 2026 00:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1795653881; bh=Qa2fXQ8QHv/UVSD1PLtqudyUB69vbVtCIiXIZczjwis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dPntnIXx0S+0ss9kG5o6d4dR1UiUV/wn1GH1GbSiucBWx0yPZgX7VFPHnubGzMZ0x
	 pHA1gRt1D6P6mQQJSvm4I9dhmSwrRxhJpAsJRTBGLbgRvURU6tfiYxIxgFNlQ3KOLF
	 OKGzMa2Fl1QuT/H/nPl62LXIZUprw6gNRraE602BVzxwoecQooqZzsIgnzifbWHGvy
	 U0x1PHejpYMYxHRReG+OkkaWojHQUVibJLhq3S4AIvbjG3cqC/zrobKQN10BtSxmo1
	 eFl0emGvgg2bIfGhk2498VEkyzYab+kijcNHmWCfU8KncpH9R+xOQrMSrHa7pxv6eE
	 2hJnulnF5UIhkaqIaUUjFtQUm1zT3TjAfG9ojiiuykGwTyn6h97slUXGTq+NwYeEqp
	 xmvfQtYjhHrpoMdBrkSkJOP+SgM8UYVhM91azSdYrCye4uCkgj+vDWaIO8XZBDtc4h
	 1QSnv9DIuWN3yBbkeuk//dIAzIc75/XMjWZAXhrPILtQPji9kd/tvliNb6LmQKCWXU
	 F6k7ZqeG+uHWMnsB/NJy+vBsAfGvdSc+njekLZJwdYWimecqx9PqY2gXbKZAS4Nsh/
	 ItZTKaMr4/qa742yo2w0C4JPzIZU3pyHGxMKkvRg3pZfZuGwsmtPqRWH2bksNDThDG
	 ddIe47QIZY/VzfW/x+68fahA=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 8725D40E0140;
	Thu, 26 Nov 2026 00:44:32 +0000 (UTC)
Date: Wed, 25 Nov 2026 16:44:29 -0800
From: Borislav Petkov <bp@alien8.de>
To: Erwan Velu <erwanaliasr1@gmail.com>
Cc: x86@kernel.org, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
	Erwan Velu <e.velu@criteo.com>
Subject: Re: [PATCH] x86/microcode/AMD: Warn when a patch is skipped because
 of the Entrysign cutoff
Message-ID: <20261126004429.GCaweA7XoIaa5k_ZBh@fat_crate.local>
References: <20261125175203.1003294-1-e.velu@criteo.com>
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
In-Reply-To: <20261125175203.1003294-1-e.velu@criteo.com>

On Wed, Nov 25, 2026 at 06:52:03PM +0100, Erwan Velu wrote:
> Co-authored-by: Claude Opus 5.5 <noreply@anthropic.com>

We don't use the AI tag anymore:

1e035297ffda ("docs: remove Assisted-by references")

> +	if (cur_rev <= cutoff &&
> +	    ucode_rev_to_cpuid(patch_rev).full == bsp_cpuid_1_eax)
> +		pr_warn_once("Patch 0x%08x skipped: current revision 0x%08x is at or below the Entrysign cutoff 0x%08x, a BIOS update is required\n",
> +			     patch_rev, cur_rev, cutoff);
> +

Except that a one-liner in dmesg doesn't tell you the whole story.

Also, not everyone can get BIOS updates and then more questions arise.

Perhaps I can document it in Documentation/arch/x86/microcode.rst.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
