Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433163;
	b=Pl93RtmluEwoiqMNkd6Z/qeE0dhO+o1ZMwTBxuHAosjQFDjoYXXS02xJKlFdzwUEgbUT
	 /noH9w5PT6bBzPmC39LLqmJBLfPB4fkh588GBf9EN4tDMsRtplHSpN/Tn1eGT58j9g7K1
	 W50pmWVSNSkqo/RGs8Kas/w6xUQZJDPqCiOSeeODnalu8i3crpQfDCmF6BOn0V0Ix/L1r
	 U/xuygO+HTODl7SvgUxqaRxwXw2TCuf2sTE61aUyfhUkKE2Qmi/LkH/VFdGcFw8k8dQdL
	 k63Pa6iImTGAi0r+O7Sbmf2+Bu+OyfsN0KI3t0OpyO0Npo27UvxxMHsPKBCe7OHnPpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433163;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Js9pC7jeiLo17zQaZ18MlpnQNslFBrPydnPaVDBRGVs=;
	b=CQgkpwxSZoiX+VqGn3CRi+2oXKd/Yr8FvU92kPZcRtyogKkTMm117jEL9W9c93ZotDYc
	 UHXIYFgbSEm3JkepXPTbMXe72MZpGBmLYEJgECIzEnMD6BBs2NnW4nD1QTOx54rNYWVwf
	 VCmRljxaLBwcP6V8yksw2DF2AP+d4WNI1BOM2C8zGKmqRIvqjYFCHHcaW5scSl5Wau9iU
	 EQTsMLr9xpd1dmfY9R3BKysu9hpHWvraWzFtrIjPoGAQtRI4S4nVNFQ0dTW0SQ2icZANO
	 8L87Z9bAiOUrD2qY6WmM35lyHiwLyf7cofBAbvpyDLeAwBzHy0T5fuRbeGsFq+52auQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=H45jtW3r;
	arc=none smtp.remote-ip=91.218.175.171
Received: from mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFC1606A32D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:26:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CFC1606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=H45jtW3r
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ZxLBiXZ1NUZ1MFmbtMflV0tJeuN9FWz7PunWy9rzBsg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795433160; v=1; x=1796037960;
 b=H45jtW3rYn7rPc5Iit1kUFEZr9zVTgns6IKVlrltNxyMdr4qyp2jit3RmiRuvEYbvSOf49CK
 Pa0O7ZwjCCgfFbmI1qnveghqMzV01KFrpiyfkxa9pxqys6/JaT/8Jk+vjDi8G0oEZ2UJEtukLVS
 GPp/2cRwZTgGjoI0xy+ZFa60=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 10ddb6a54804c209;
	Mon, 23 Nov 2026 11:25:56 +0000
X-Mizu-Trace-ID: 10ddb6a54804c209
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5be58ad9600so9913e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:25:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErExYez3AKJ+TpANKGLLaBfUSqwUUYOvXwOLJVwLRfqmX+edhcLXkr49awI0iCgytjTCW8AGLNbqEf2yaXk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wDq4ATGcyr2Prp/1jEzCnWKcOVAppaIl0wra3xUR2paElCMIE
	Vrkn7vUd0COX6DtBrKDRvrFMsI6iFGHki0XfX9GZBH+UoNwcEwBoTaOdr9aRzWUMO2qW4K374uC
	amTQTd+Q52/JeTXOdTX/yJeB/ElkG/qeRP0yEyWA4
X-Received: by 2002:a05:6512:3502:b0:5c1:488e:a067 with SMTP id
 2adb3069b0e04-5c200ba538amr163953e87.16.1795433155472; Mon, 23 Nov 2026
 03:25:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123075219.369042-1-fuad.tabba@linux.dev> <20261123075219.369042-10-fuad.tabba@linux.dev>
 <20261123112218.20959-I-seiden@linux.ibm.com>
In-Reply-To: <20261123112218.20959-I-seiden@linux.ibm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 23 Nov 2026 11:25:19 +0000
X-Gmail-Original-Message-ID: <CA+EHjTx1AYw7SzWpv=k8ahrKnovaftP8rC7_GHx2g+PZ-cjXew@mail.gmail.com>
X-Gm-Features: Aa3M54q04K4Vkb_xge3irgDfROZAKGCFM3lbfFzE09aj0suM-WV_djSD8CzF7iU
Message-ID: <CA+EHjTx1AYw7SzWpv=k8ahrKnovaftP8rC7_GHx2g+PZ-cjXew@mail.gmail.com>
Subject: Re: [PATCH 9/9] arm64: sysreg: Reject a bit position written with a
 leading zero
To: Steffen Eiden <seiden@linux.ibm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Sascha Bischoff <Sascha.Bischoff@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Nov 2026 at 11:22, Steffen Eiden <seiden@linux.ibm.com> wrote:
[...]
> > diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
> > index 057dc98082b5e..01b463e271cef 100755
> > --- a/arch/arm64/tools/gen-sysreg.awk
> > +++ b/arch/arm64/tools/gen-sysreg.awk
> > @@ -102,7 +102,8 @@ function parse_bitdef(reg, field, bitdef, _bits)
> >               fatal("invalid bit-range definition '" bitdef "'")
> >       }
> >
> > -
> > +     if (msb !~ /^(0|[1-9][0-9]*)$/ || lsb !~ /^(0|[1-9][0-9]*)$/)
> > +             fatal(reg "." field " invalid bit-range '" bitdef "'")
>
> The test is good but IMO the error message should be more precise to
> what you are actually checking. sth like:
>
> fatal(reg "." field " non-decimal bit-range '" bitdef "'")

Ack.

Thanks again,
/fuad
