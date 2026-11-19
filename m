Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795069205;
	b=ZDOwiCfH7NL+rzja5dwFnQLg9pV/xTjvEikUr6PUFXZgPJjREtUV+hHeBdt6NKmO/O3k
	 YCcA+s7f4kROncNLVYKN27Q+mDh5OQ89avEW95/9EkS1StqT3L+cgR741/ZUqKVnTa/8k
	 KHCgsEQot50HU8hXw002cfCO0OVb+G4pma6Z1TekEH8BnmfY3BLrxo1Z2VGVUBV8A5leu
	 Xj0cLI29do7RJGcfQpmNuf6RISi0+lgkK1/6y1N2JyhpllvSQpZ6xypYfFJIs+BRZwe7L
	 8yNOewPwH+e355ubdiMeBhvg1e6Jg1I+f1vc+3B+cJddRhBTemd9OQSaxFmGroN33QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795069205;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=6Tu/bs6kQPkjmVQnnCE+dtDa9glo7TX4j5HXJcUm8EQ=;
	b=Soe6ael+ifhO+mX46qJMnQfjyGO5nKwn9Ox5fJClUnXpDCcXUgG16Q2kfu2wRsCPX6gJ
	 ZLVvtbEuX/3N4pN3NqBm9v+NGx8WjZCof1NLvLyxFa7YDfiKFMN0K3tKijts5P4lsQvbP
	 mmU1i97/KwYKAPd/HbzibKSREy0GAyANI9NCygjfGAUp01msCDhLJjDd3whhKICYqsBbZ
	 Peho8pKqTWDfQoZ7GKI9egG0jyxRb/Rdl5eeJ15kJ1x/hq0M/ioeA8hF11lGkvfgi6R6C
	 NZjrIQxPetQ6GASmj4NDEIgFpfs+Q186RAiu7YuNxP1KX8x3ZvoDXder+M1De3wR5ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=Pl1+v4co;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA8C606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:20:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BA8C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=Pl1+v4co
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id D0C1640E0218;
	Thu, 19 Nov 2026 06:20:01 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id RMrkxnwORObH; Thu, 19 Nov 2026 06:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1795069198; bh=6Tu/bs6kQPkjmVQnnCE+dtDa9glo7TX4j5HXJcUm8EQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pl1+v4cohgzp5UaABOcQ0N632Xgxr4CGHgt7AsAFEOwGib4FL4O68FaWm1K4MNqlc
	 OMQaMsTpxk2q/mHn7YM5dYNnFfsnNmxxYfm2aNukVp/AuE97JjCJdPe5EhnokH3dfQ
	 0V2YOd+dMb3Xm15e/GWS9ojGHBvDQqZOZnvG4/Nq0ZFMIoht2ZUKn42FekIvC71wdP
	 TPEL9YUIDOHRyQqexPZE8mGF+YFLGsFhKVb7a0hIsjj6KZ28GLctNmtrCt9as0dlw5
	 o4vnqnVnuhSzCkl6KJ5rcqbjME/CINwBWbHi0ZqXwxLgWXw7op5bpNsIJXG7bx4+XB
	 npO3d18JvbyhB8MdHOsH+Y3Jxr2Xp8d+zSu9R5kBtYClNa44cBWXgnLbpa4SSjg7Mq
	 BHTAWMgF70e6MqxLeHKqEjkaZQ+NLdJqyfY8Jxko9bownmoGCRqybWNEGgVv6CC1m0
	 1yIUpDBEPR1pfgq60JxuUOjSk2BdbaxyzVUMNHZ4Tmm2aV8Uc96J3DplEllDuUV/1W
	 /S5v7wuXYjgRl2lms0eVSKAimbW6zNxp+rpdbZB184kRjN7WPcCZ1QVUzpAnpD4hth
	 PAwSSvYx/1/+SHWyL6cleBnx7IPhGe4M+uj+Q56AAo3BsBnKd4CuAd9tk62NB+KxXc
	 RMbLcskhjo8twV5adTlY1aDY=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 38A8940E0140;
	Thu, 19 Nov 2026 06:19:53 +0000 (UTC)
Date: Wed, 18 Nov 2026 22:19:50 -0800
From: Borislav Petkov <bp@alien8.de>
To: Melody Wang <huibo.wang@amd.com>
Cc: x86@kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>, ardb@kernel.org
Subject: Re: [PATCH v6 3/7] x86/sev: Route unsupported APIC register accesses
 to the hypervisor APIC emulation
Message-ID: <20261119061950.GAav6VBv-NXax_OkHb@fat_crate.local>
References: <cover.1793926736.git.huibo.wang@amd.com>
 <054e8a3991ed4f541afded6fb9622f08f7bd8526.1793926736.git.huibo.wang@amd.com>
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
In-Reply-To: <054e8a3991ed4f541afded6fb9622f08f7bd8526.1793926736.git.huibo.wang@amd.com>

On Fri, Nov 06, 2026 at 01:25:29AM +0000, Melody Wang wrote:
> -	res = __vc_handle_msr(ghcb, &ctxt, false);
> +	res = __vc_handle_msr(ghcb, &ctxt, write);
>  	if (res != ES_OK) {
> -		pr_err("Secure AVIC MSR (0x%llx) read returned error (%d)\n", msr, res);
> -		/* MSR read failures are treated as fatal errors */
> -		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_SAVIC_FAIL);
> +		pr_err("APIC MSR via GHCB (0x%llx) %s returned error (%d)\n", msr, write ? "write" : "read", res);

Make that line shorter and to the point:

		pr_err("APIC GHCB %s MSR 0x%llx: error %d\n", write ? "write" : "read", msr, res);

> +		/* MSR read/write failures are treated as fatal errors */
> +		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_APIC_MSR_FAIL);
>  	}

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
