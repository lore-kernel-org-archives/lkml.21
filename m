Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795231873;
	b=oUEthBqQTDfhTKxI0/5/IvuKiDOESMVY1YEgW1SrxkW/moYFacKyKt58Az+9oegwKsRx
	 C2Yfp7DvaFcz1FxiiXbKRJTsr5DH9McIc1dQN1ewlG8e+8bUSqBYkbC6El/1JdRvKRbcL
	 7lnWliEYzQ80LsF+OGYchEPiLpBbCsQ0djSaA5MSH8gtDbdtS7wsVVniFgnT4u+G2HJLy
	 GzMLy0TtmQExA9Ttuo9CIgfT5eN5DGPPPJPYAukUzY8WVnyxH2fsnIXABhUt9klaYhkCg
	 Ncbu5PDUdAV8vwCaj2MyR+tn6YTeUwiSPfz55Dsj8AxoutXVaK91L9uaXhv7rc4hvLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795231873;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=X9k99YWlnt4nbGZyPDuesahA3NaBAphEO1mgNKV7HCQ=;
	b=L9hfeoHyyecMOn13hBJ5cRU15bfC42B/Copjfowh/RMmEiG/tkCgqtVQO1t/lZSqP1LJ
	 TYTMz3fg/puXdBXeW52dvu2FIq5VnAaTbxkXB+a8ljvUAuXKStS4UmUTpcA/StHDkMumg
	 0srNOfr0sZhFasZ42tuP3gv7G0YiDUD+sfIOHai4iP4SHQEQ9NK/8fwW9vmgUkq1Sqqta
	 pMms5JoU22CfpDIqCNj1TXB5Kc68Y54QbRiYCHvdJ8g0ZeY9x2q33WSNzVuMwo5v7e4u7
	 n+hMTLPWCFU6q9i12OJ6TlhwzBWxcCMWqVIsxXfhwR62ig/s+9Ze7hm8K/wGa8vD1Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=ETXQ+NuX;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0914606A6AB
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 03:31:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0914606A6AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=ETXQ+NuX
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 93A3540E01E1;
	Sat, 21 Nov 2026 03:31:04 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id jZAIpj3fUQNg; Sat, 21 Nov 2026 03:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1795231861; bh=X9k99YWlnt4nbGZyPDuesahA3NaBAphEO1mgNKV7HCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ETXQ+NuXqFIPnAGxqi0d4cMaGqXwi85eulYwdcq0BKNjX9d8Me2UwTeNl7zcp8GD5
	 TP2CWGPhOp0kz0xwL4y/8jmX7qw2yKLehr56tUvYcEOL4qZN7MvlVPSb1CPOGK2Jw1
	 qc25jrTCEPcl2j8PoVA6ZmQHcKh+fwXURDBt0d68cbJor70Y8gSBtkXROxSOQIGoEU
	 Lf8QmG45pIVcp9LETJG5j+zZcieriuIV11QCSZSEpiBzn0RfR+YJ8mrtzzCLX3up2p
	 xLFiA4l89M4iMkXIX2zcm0YHBlLVW1+Ewea30qUUV91DpgaokjGFGA4vBMZ6CJBbc9
	 G7bPfCoVHZlxn4AikE8+MxuQZ6c23LpFiBqbxu7XBNlYNgmbm3Kqer22hSOTaD57Xb
	 fu75QfT+pCWA532Cfu5TAueucFDtRVoBGn3SmqgWv66y7s+czwZPGT/p9vS1yMVsTE
	 +5cB9W2zkZHYxCpljU9wnnWUpP6kQRrujvUV3y6nHetZCh034vumALVhYROyluzDqV
	 hL5PA+kXYNV8kwmhIfDgH3V3BopiOFDD/QwYzwKIqtLLgceNvMa+fg6egXOCRQGxWb
	 lt0DMsBFVivjJLSfqhady//DeanE0Jm/7jYqOypqO1UJ28x1th1Yiqxd20XkLGv+oz
	 Lsf70rRZk/vynng3kjc93OmI=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7068C40E015B;
	Sat, 21 Nov 2026 03:30:55 +0000 (UTC)
Date: Fri, 20 Nov 2026 19:30:52 -0800
From: Borislav Petkov <bp@alien8.de>
To: Melody Wang <huibo.wang@amd.com>
Cc: x86@kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>, ardb@kernel.org
Subject: Re: [PATCH v6 5/7] x86/sev: Register Alternate Injection protocol
 during OVMF boot
Message-ID: <20261121033052.GDawEQbFJ7XyDOM-K-@fat_crate.local>
References: <cover.1793926736.git.huibo.wang@amd.com>
 <bc08967cc41dd4454c75e9315e37dbe34225e258.1793926736.git.huibo.wang@amd.com>
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
In-Reply-To: <bc08967cc41dd4454c75e9315e37dbe34225e258.1793926736.git.huibo.wang@amd.com>

On Fri, Nov 06, 2026 at 01:25:31AM +0000, Melody Wang wrote:
> The SVSM provides the SVSM_APIC_CONFIG_EMULATION protocol to register
> and deregister Alternate Injection. This configuration must be completed

Unknown word [deregister] in commit message. Use "unregister".

But you said that the spec calls it "deregister". Oh well...

> before ExitBootServices() is called. Therefore, OVMF needs to invoke
> this protocol early to set up Alternate Injection for SEV-SNP guests.
> 
> Implement this registration by default for guests that have SEV-SNP
> Alternate Injection enabled.
> 
> Signed-off-by: Melody Wang <huibo.wang@amd.com>
> ---
>  drivers/firmware/efi/libstub/efistub.h  | 11 ++++++++
>  drivers/firmware/efi/libstub/x86-stub.c | 36 ++++++++++++++++++++++++-
>  include/linux/efi.h                     |  2 ++
>  3 files changed, 48 insertions(+), 1 deletion(-)

...

> diff --git a/drivers/firmware/efi/libstub/x86-stub.c b/drivers/firmware/efi/libstub/x86-stub.c
> index a2f193da9bde..878f61cd6fab 100644
> --- a/drivers/firmware/efi/libstub/x86-stub.c
> +++ b/drivers/firmware/efi/libstub/x86-stub.c
> @@ -786,6 +786,39 @@ static efi_status_t exit_boot(struct boot_params *boot_params, void *handle)
>  	return EFI_SUCCESS;
>  }
>  
> +/*
> + * When the guest is running at VMPL2 with Alternate Injection enabled,
> + * register Alternate Injection before ExitBootServices().
> + *
> + * Return true in the first conditional to mean that this is not an Alternate
> + * Injection guest and boot can continue. If it is an Alternate Injection guest,
> + * both failure to locate the protocol and to register it, means fail the boot.
> + */

So since we have a CONFIG_AMD_ALTERNATE_INJ config symbol, the intent is to
put all that functionality behind it so you can do something like this:

> +static bool svsm_register_alt_inj(void)
> +{
> +	efi_guid_t alt_inj_proto = OVMF_SEV_ALT_INJ_REGISTER_PROTOCOL_GUID;
> +	sev_alt_inj_register_protocol_t *proto;
> +	efi_status_t status;

        if (!IS_ENABLED(CONFIG_AMD_ALTERNATE_INJ))
                return true;

> +
> +	if (!early_is_sevsnp_guest() || !snp_vmpl ||
> +	    !(sev_get_status() & MSR_AMD64_SNP_ALTERNATE_INJ))
> +		return true;
> +
> +	status = efi_bs_call(locate_protocol, &alt_inj_proto, NULL, (void **)&proto);
> +	if (status != EFI_SUCCESS) {
> +		efi_err("Alternate Injection registration protocol not exist\n");
> +		return false;
> +	}
> +
> +	status = efi_call_proto(proto, sev_register_alt_inj);
> +	if (status != EFI_SUCCESS) {
> +		efi_err("Alternate Injection registration protocol failed\n");
> +		return false;
> +	}
> +
> +	return true;
> +}

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
