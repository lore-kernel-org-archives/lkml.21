Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943671;
	b=MfSkC4o/+xnKQUMOgfCVm9amSPuG7H2DuuIECj0x6vcIYKKpXAsNg68O7O74WhFpO4R9
	 bfSYIuTF9HGzHFE/n0Qpz1e3LeCFp99aOXDy0b0IxmV8RNpl9MEOMNgvLNSzqELO3SHP9
	 UohXV7b+93gjU+xYBH8SLOfHome+yiNIoxuJXNmY+QlslHg3YrViiJxS8RSpQ2uQf00vC
	 JGP/V/3H3qtzJkkOSImAqxNCuah8ZN6YvUxtkgcrezoPLtdnOQIeh7QTDnTHTNsvkeLba
	 Vrt87xlPzYqkn9IJb1an66KFLQyL5LuKo+xWe+CarVuhudY7EgZNTBsGT5pnRYIhKKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943671;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=+DQj5Rd8zqu4HARCi8rW0yj9HPFCT3iadFhwoSDGLHw=;
	b=F7T3US9UrVCdrSCdTobbhudFCApBYC78LH3hA1xaciXAvlSYcIa1X0BOTfxPtdpfUlUy
	 PSfymQOoBDiwJi0ldFePrNkyOjyxOjM85LFVGw1KcYXb4AT9yVoKtX8cBQsRU5FNPs/zz
	 kL1VJ6JQMf1N6AVHqSucw7rKh4JwkvyisDHv2UqXbNeT3VQycka1N1A0VnCNRH0nNqXyq
	 JH1lEZXJNDPnU4b6UJyvhwBIcSNiiDT2mLSJ+XRcY6OQB0cVoeH7+253gF9zdhQGH0n/H
	 oRB8VJT/AT7mnOcJqG6LhF/aDX5lyMNJ65Fkw0ypQzErO6Gh7s6kEEU2lJ3B5YL3GUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wUCKssxR;
	arc=none smtp.remote-ip=95.215.58.77
Received: from mta1.migadu.com (out-77.mta1.migadu.com [95.215.58.77])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA2E606A337
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:27:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BA2E606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wUCKssxR
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=dKmJYX/63y+iQ1pYCnW01HTy/TWczwm2xVh0zs98/fA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794943669; v=1; x=1795548469;
 b=wUCKssxRB0M8jY8OUxjL4GHT7RTqPYP2zmQtzJUlNo9kz+Ltm/cInhzD8M+BC1l1+ehNeukz
 vvXrgFM8Mj3uWlI/jHBPGEHTdQqxqaiLQCOAQusBbW0GXqYKIeaVfRcb3KCtZAev+1THxlBJee9
 02FntqQRKlazMWK+vgSL/mzI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 74585e219372958a;
	Tue, 17 Nov 2026 19:27:49 +0000
X-Mizu-Trace-ID: 74585e219372958a
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so1132e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:27:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEZeNP7QShRjcjvBG7TVhEY4BBrqWQeY7lomnoxCB7QaiCqyC7zolMxJDrtrnsb9INvaVO0y69chhrO2xE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9N0uItPUV7qpYtHXWEeOo59n0WKcWhW7Z4PNXe4Mxn9nEGzpB4
	yVe4tA3+iMcSePKeGDqcTb6WgNRxxOp4yepWd0G4vrRgPqFAQ6BQ9qQ2CLeH6m5sDLNEYcGpGC3
	neZOM3rIn3FXe/fIXFXPbgXc2iAMIk2bDXSimBnrg
X-Received: by 2002:a05:6512:304d:b0:5bf:f81a:f24e with SMTP id
 2adb3069b0e04-5c1a98e431bmr17685e87.10.1794943664222; Tue, 17 Nov 2026
 11:27:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109083205.806619-1-fuad.tabba@linux.dev> <20261109083205.806619-8-fuad.tabba@linux.dev>
 <avyZH2g3rrIVm-Fl@kernel.org>
In-Reply-To: <avyZH2g3rrIVm-Fl@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 17 Nov 2026 19:27:07 +0000
X-Gmail-Original-Message-ID: <CA+EHjTxsZFOwT5O5FfMf3wcTWrydR+x1TYVRDaCEF_FQX8giFw@mail.gmail.com>
X-Gm-Features: AclHuK_6wbUaiI-auzUUbuozU8SjWYXkCa76KeN8iu8Ffe01iC2J030eQ3Qa2QI
Message-ID: <CA+EHjTxsZFOwT5O5FfMf3wcTWrydR+x1TYVRDaCEF_FQX8giFw@mail.gmail.com>
Subject: Re: [PATCH 07/16] KVM: arm64: Compute a protected vCPU's fine-grained
 traps at EL2
To: Oliver Upton <oupton@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Vincent Donnefort <vdonnefort@google.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Oliver,

On Tue, 17 Nov 2026 18:12:47 +0000, Oliver Upton <oupton@kernel.org> wrote:
[...]
> > +#ifndef __KVM_NVHE_HYPERVISOR__
> >  static void __init check_feat_map(const struct reg_bits_to_feat_map *map,
> >                    int map_size, u64 resx, const char *str)
> >  {
[...]
> > +#endif
>
> We already have too much ifdeffery... It isn't mentioned in the
> changelog but I take it you're doing this to avoid the printk() in
> check_feat_map()?
>
> If yes then just upgrade that thing to a WARN() and carry on, it only
> ever runs at init.

Yes, it's because of the kvm_err(), as printk() isn't available in the
hyp object. WARN() calls __warn_printk(), which isn't available there
either. WARN_ON() works, so I'll use that in v2 and drop the ifdef.
The warning won't have the register's name or the bits, though.

I'll wait until next week before respinning, in case you or others
have more feedback.

Cheers,
/fuad
