Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795303239;
	b=U6rl1nUHguMmeVB2jnTAvAuvNPt0JIEapfYoY4EWV+V0dtKJivG1RUAJ8sCaCWI2sVBa
	 B/D+Io5ZzJAif5mJ/8c7L+UW6MyK5KwlzQEFDPrPTa9ywWGIHnsKVjUy8+UZQ6vjq1Tef
	 WW2Utn1JrsJKlwfoy73YWulO9TO9NFWxHnx+beu35QtfBHQTEKCcaUwIOJtzVqBFpZ+Ic
	 nP0o+bxL+L1POEzpre4cZYTld+ojhlXAQI19cyrpWpqp4osPISgJIciD2IrnBWQ9AMuIB
	 QmDmtVg3y9LQ2Ri2HIq8S/xWv2IGk5vjGjrFHwh/RVzurcEqVWd4Fv1zgWm/oKn/XlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795303239;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=YlAezq90M4HzqpuWrlTQT1OnO/TeKG0+1ot3k9/z+RM=;
	b=5GKPYd+xtyEVgh2so+lAG4qS6LS30F2GaNuwX5gfWdR7DcBg/O119XbVVsy01m8EnhS8
	 I+OwBBGZnSgMPNALpdzOmPILG/GGrUSeszayU2SNcyfF4JOTGODGEg7vssvxGCMVhNoE9
	 FRL61TOZiKE3KGeqk8ZvCyjI+umQC0B6/zhnzu120/OnkHP1xZTee/uOTzW6cEUh4EIWs
	 bVk1e8r/hMGE4EWbV/5tLp7rOkCn/LR0OagkmHbr8peaG+7LLnoASp3w3rgLEaTvU7fMt
	 v45nDzJLMXSp39USF8d/ktgvFWOIZd/StvDAaV4KP6dZXa0vgm/159marcuaVrqh0JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b="lTA/OlkD";
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C664A606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 23:20:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C664A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=lTA/OlkD
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 0194A40E0218;
	Sat, 21 Nov 2026 23:20:37 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 1MFPblJl-rWs; Sat, 21 Nov 2026 23:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1795303233; bh=YlAezq90M4HzqpuWrlTQT1OnO/TeKG0+1ot3k9/z+RM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lTA/OlkDjJLLdsaIvEdGT2brqe1heQBt21DbEW4otwIyj0xGmjxWU7RxUVBGK+G6J
	 vM9U5ir8Y4DKx83XBwjwVvFq9OhVTr+B5djan7J6HY48eb/+LaB1VxIRloaHjKLwXl
	 qYAeFTC1EpodqU44zgrfkkGRBwubVQyjbwb1hht8MRwWQumcWzNTMYH8XBxyKhhwn8
	 y0HLwz/85IRN5x1VCwF/6zQkmm9dFithfd9JKrSw2AI1eXc9VLKoRRA7y26+jU0ELc
	 mJHX0kJDp1oLjPdU7M5TVfBDq5YCdrecxPWLfDzCC+Bs9dwfFzFErO5AARaVyTXL9N
	 hoNZaQs27PHrFwthDvxhXt7H33hkj1NoxQaSJpOsGi+zA3Ciw+iR4/g3mXHuZogm9b
	 aYbuVD36LSt7iv5stXjwHrcBy+v/G62vfDvCYVtzjoVZN/n8usE99hkEaVKujS4L05
	 KitpPgd/9H+8h7ajllohtRne7NZkpLElIjsrUsYqvwxiS/3OoNHtSE3vMwURx8wCGn
	 GyYwag7Q8erf72skTRfILgrCh3s4HeOfUe6WNKuZlIntSyUCvFzdXZjmV8q40QIKOC
	 ittTdhRljdCXAMZfpKX48SuM1BwFt4fkqXoTicBAqftm21RRby67ig0HIEs4AWqQXe
	 CRQBPVPE7kDiOQc/pClSacBE=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 02C5740E00DC;
	Sat, 21 Nov 2026 23:20:27 +0000 (UTC)
Date: Sat, 21 Nov 2026 15:20:24 -0800
From: Borislav Petkov <bp@alien8.de>
To: Melody Wang <huibo.wang@amd.com>
Cc: x86@kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>, ardb@kernel.org
Subject: Re: [PATCH v6 6/7] x86/sev: Allow the guest to configure interrupt
 vectors for the hypervisor
Message-ID: <20261121232024.GFawInOCjrW_TLUr2U@fat_crate.local>
References: <cover.1793926736.git.huibo.wang@amd.com>
 <3bb412990005d4ec37e0e5d89a3524ea5e9d5117.1793926736.git.huibo.wang@amd.com>
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
In-Reply-To: <3bb412990005d4ec37e0e5d89a3524ea5e9d5117.1793926736.git.huibo.wang@amd.com>

On Fri, Nov 06, 2026 at 01:25:32AM +0000, Melody Wang wrote:
> The SVSM APIC protocol supports 5 API calls. SVSM_APIC_CONFIGURE_VECTOR
> (shortened to SVSM_APIC_CONFIG_VECTOR for brevity), call 4, provides for
> the guest to configure an interrupt vector which the guest allows and
> the hypervisor can use to signal interrupts for it.

s/for it/using that vector/.

It needs to be clear how that vector is going to be used.

> Implement this call, and make the default interrupt setting permissive
> when detecting an SVSM.
> 
> Signed-off-by: Melody Wang <huibo.wang@amd.com>

...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
