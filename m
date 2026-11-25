Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.67
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795598413;
	b=tUmcnQAzgo6Nve4xcA6pPMo+rFSETSGO2fHk8ADMVmZdSxEZCKdpFzE72F9KrxR3yz+a
	 ieE5YikqFuEeoL5mYVGXh7N6P4iwvVhnYQ0Kiv8KW8ac5ejJudzUtVlWH65f66dAhPV8K
	 8IA7zRHVnx5JZuF9xzB34TgJFJsCoFVHDwA42Pmc62OtjGd8++DYnqNNCD6geNDAcMEKJ
	 jzfZr39zrRNxqo03ImwNn8hW4gzbVCm7BzS1zj9iDoo1giXdTtZ5Se1y6Mjg+EAyBgcHM
	 +TcnHBwkqS0IIuMwsvMM8l9cxHSCSLu56I7g7dc5lh47Gaabn2/pVdsghDMGWoTlRsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598413;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=F2Xkdeo0HzaNsNuC4QUMqleMrJpmw0zTyb8wkyKNlT0=;
	b=SjAdQRxBP/SRAmte3y1f1SX/fDZF4F3ntYnxi5eLfPi828pV0ptZPAOwPoCGXhhDHNHw
	 LSrX89WGfgpzN2e7WpGvH7fCyveqTArO90DmSoWJixPNMvl7kdnITw2OWs3eTPEd7U+Ag
	 GUOPpubAj3tpcWk492P0JkREP83MSHU2wRGLFzCkpzlDzwHLF22XBKIDYDc4SIwDjLo0A
	 g8L7RohcBcp8HvzS03K6maEGi5U26LUsrUio7ijqbly86v6Wm9d3lNYOXLa6ei0vDJNHD
	 6SwhICbAGtYrbnEx8sTIFqPkIDxu9/2QDY+S21Gfx2XInUCrXAzNJLPCQ80En6RcRTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xLvETzrV;
	arc=none smtp.remote-ip=91.218.175.67
Received: from mta0.migadu.com (out-67.mta0.migadu.com [91.218.175.67])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528BB606A68F
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:20:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 528BB606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xLvETzrV
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=F2Xkdeo0HzaNsNuC4QUMqleMrJpmw0zTyb8wkyKNlT0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795598410; v=1; x=1796203210;
 b=xLvETzrVtLHmsX/F46N4Gp81AytfeXZ1n3CKBsCcH2axdpca4ScAwEJNfS+DNOwEDthA3OK1
 8nulH/pg1d+qHRcWwT12hBvzZ8gANTsE4U98vQ9krUwySRv1H7zL2BeqXXqcIX1UeFwiCKr8iWo
 98DxMwcyO+lXE8ClIsNyfKZE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 90f6497c923fe212;
	Wed, 25 Nov 2026 09:20:10 +0000
X-Mizu-Trace-ID: 90f6497c923fe212
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so33476e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:20:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG68R1imKWkN/T7NYv4ezc4TsIWJ929J6i4N3QjkGB3LI6jlw2QaIW8+qnk5EpubleIi/sL0uyMPVnOebw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IWIPZVg7EVMTh/pLCPdxOI8eUMQ1Vpsb/8h9WFA4cKlg2u9xs
	zQQQWPF4Ju+Nk36+WJHoAMt2pgfWJmxwmrhNIhjCDubncyw9N5/Wv4KLjBw39+fychRuF+4vyOe
	NdB3w1nn1oQ0x7OclXpdpvtY0tzQrJIwimlsLzJ+T
X-Received: by 2002:a05:6512:2249:b0:5c1:ac5e:ee43 with SMTP id
 2adb3069b0e04-5c212394558mr484720e87.3.1795598408854; Wed, 25 Nov 2026
 01:20:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102095656.2948964-1-fuad.tabba@linux.dev> <2576e9e5-395e-4842-aa83-e09494e97d4d@arm.com>
In-Reply-To: <2576e9e5-395e-4842-aa83-e09494e97d4d@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 25 Nov 2026 09:19:32 +0000
X-Gmail-Original-Message-ID: <CA+EHjTw1higCqZ5eY9_xsegh=C9W_=ba3VSE=8-wa-X-7_oG8w@mail.gmail.com>
X-Gm-Features: Aa3M54rNelAy3rRx_aqH9o44IgmjZOttEw2zqBrwcOUYh3b1IB0PHZ2N_7TmlyA
Message-ID: <CA+EHjTw1higCqZ5eY9_xsegh=C9W_=ba3VSE=8-wa-X-7_oG8w@mail.gmail.com>
Subject: Re: [PATCH v5] KVM: arm64: Trap guest MPAM accesses whenever MPAM is implemented
To: Ben Horgan <ben.horgan@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Xi Ruoyao <xry111@xry111.site>, 
	Mark Rutland <mark.rutland@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Gavin Shan <gshan@redhat.com>, 
	Yuan Yao <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Nov 2026 at 12:00, Ben Horgan <ben.horgan@arm.com> wrote:
>
> Hi Fuad,
>
> On 02/11/2026 09:56, Fuad Tabba wrote:
> > finalise_el2_state() clears the EL2 MPAM traps on every CPU whose ID
> > registers advertise MPAM once the arm64.nompam override is applied.
> > KVM sets them again on guest entry only when ARM64_MPAM is set, a
> > capability that also requires MPAM1_EL1.MPAMEN. Without EL3, only
> > MPAM2_EL2.MPAMEN is writable, and the kernel never sets it, so
> > ARM64_MPAM stays clear and so do the traps. A guest can then access
> > MPAM0_EL1, MPAM1_EL1, MPAMSM_EL1 and MPAMIDR_EL1 while its
> > ID_AA64PFR0_EL1.MPAM reads 0.
> >
> > Record two per-CPU flags at KVM's CPU init: whether MPAM is
> > implemented as finalise_el2_state() tests it, and whether
> > MPAMIDR_EL1.HAS_HCR is set (MPAMHCR_EL2 is UNDEFINED without it).
> > Read ID_AA64PFR0_EL1, ID_AA64PFR1_EL1 and MPAMIDR_EL1 from cpu_data,
> > which holds them with the overrides applied since commit 342e62ded77c6
> > ("arm64: cpufeature: Read MPAMIDR_EL1 in __cpuinfo_store_cpu()"). Set
>
> Ok as long as this patch isn't expected to be backported.

Nope. I didn't tag it as stable.

> > the traps from those flags. MPAMEN isn't part of any MPAM trap
> > condition, so the traps take effect whether or not it is set.
> >
> > Fixes: 31ff96c38ea3 ("KVM: arm64: Fix missing traps of guest accesses to the MPAM registers")
> > Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
>
>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>

Thanks!
/fuad
