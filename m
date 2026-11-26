Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795660017;
	b=3eMY5nt4EAKaQy0KyPDOYRmazW0MA2TBNyKPxlIY0tfHPkmHdoy4Zc2jap34XQmDE/25
	 14dPwtJrBCSI0O0RFFdGzmDW2s1MSzieeayAuK46qNVUeOwQIx11tEE3bxnt3RP8HG8WP
	 /P9Nlw67fr6nKH3qv7ZkMifHKTN5Y9eBQOfXKz8JxYgpY4AYNqpnPgbhUblHdbppaPjsB
	 3qi+Ia/tWERJC5/E3+XkbKNCOAPFgy8o+w0gnDKfrswkKtsySq0W8bjtzLhlp328WRXy0
	 2PEi4lI0YVUTg8N2yJfM+/BnJBOqLrPNCyVwfAL6gZPs5h45lbp6EZti7K2nOYdI7jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795660017;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=VZ0LpREsSiaCZ1xvrAarlAYj3hq6yIUoz1ZqZEl4im8=;
	b=CUPoLCyDeXlff4qViodJ+0npgP8HnNz6lR3bVyfLYhIP9z949NmKCJO87w1qpLQ7MtI3
	 AiA6G+hzMVso0JbZD/f28wK2Xii3fcL7Je9WTFdvmfez+WtYhQPdSuM+2kBjXihPGQh6o
	 k/dQFKXf9pYroXbyIWeTQXZdMoocwPdAUnnlWCU7r+9nOFIi/4+VcWfDbul/JSOzIeiXf
	 pHFMKSZ1ZwbTMQDxCubwynUk43hGsN1bJ3scASC97vGrIZcxR7c+vbwL1Dobb2hcT89Sq
	 gn+QpYVUPaUWE7pFpbZIbDszCaP2NAiKUzoTKbWqNpM3PZwUOx4pRDYCfxQbALxhEUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=f00LtqH3;
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B26606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:26:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39B26606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=f00LtqH3
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 45B553F788
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1795660014;
	bh=VZ0LpREsSiaCZ1xvrAarlAYj3hq6yIUoz1ZqZEl4im8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=f00LtqH3q59SIz4jEhz/G7Xi2UaqG7ATPnX6nbQmtMBMQLmnwL1P6WmbfJcCxk3FR
	 H0NB4UsHCC4JI/rWDkLcZEba1tJbhPDY/wDsJt9cX12eb7OiRWCkQBnnL8G+alWmbt
	 YWnV1/nxW5EM8VBnyyGbGsdiT5QGiz3/do/I+teJp4vdkvK79wNYeAnI3Hh/FVwddz
	 TxtHcZEZO2Qcc1Cl6nCBNmhgy8vT0RkF76I1pY01naU0vffOM9D018CJerW6NAZGiY
	 gfQynXCKKeHovl13RlT10BtqCEl6PVZ7CwFHUG6q440tOgxhgoyLlFHezHYHepT0Kd
	 q6eLt90gs2yJ9u+VrjD5DXp3roQegOVX8cmk8uquw1zr8CTvCkBDHT8iLqWWY5wYTj
	 HS3emDEqp3fPDAR5WVQXGsoMy4IPoQX0lWrOH5MNeXk2GsliibsHaZKyTcSbEvAQ5S
	 lFp2RMr2boM3pxiFIY/RRFFGWQUfh/DoDjX8zoDSK0VnKCgp8sjfNk4L/VsF2PqXke
	 dsnKitFTCzN5cGMWuc+Jmrfns7Jerpq5Q1YIdgbCHiSSHySFpzFvU3r80nM26O9Odu
	 1FsO1sixDnxgjW9wK71h3ZZhac0lo+3YMKrEim/8K2Y41/KsLlsHnKxpvu/TiWat05
	 ZWMCH0X5f5giQB76eagC+PMg=
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd652c0385bso4410564a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:26:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795660012; x=1796264812;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VZ0LpREsSiaCZ1xvrAarlAYj3hq6yIUoz1ZqZEl4im8=;
        b=WQoVY8j+wAZnjJHMMkGq4YMIUReoCFnRCHyBs1qkTNAKnbZoqohsQc4ZqsTu58TMcO
         Ap2Oi5LR46qWGyeBUmmLvzenvyQ2DXZCtdrPXU6wAmXllsmReO+RCj2+fQ3E7tTutcnr
         UCMtM3KLelLbkg5dMCLcQxuaDu1xsnd8LdVH7+iN2lb6j9yyoGFTgGW7ZSGjs5wlFHBD
         aNbwpzRFrxoJsVLqIxfqygqjK5A05tvcB+9Vj6LzGcSmmP+aSMx6JJlVfIxRwWHnfdxp
         tb7fqmTtlLD8jdFcThuDyN26RF8iK9/YSdcFhewC/iPBmC/sKpDoT5Siz32ZagOjp4/n
         0Gpg==
X-Forwarded-Encrypted: i=1; AL+hErFmK/FGx3UGlFVSP9UV59XoQqcPB1gybAeNkX1K2Fux/AMsKkV1GUMAjLoh2R7wuM0z7jfitGhLF8ABchY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GtTsYsgFhgUhs+m87CXcgpAnc3JuEgyb5ZYd6WQn/C4NEHazw
	vMjseH76g+ZGOn1l2NC8/fM9sfNO9t6sLwV3BR4+CzjwZUXryh7Uyh+1m6OtopkQ3a8z1FNh0SP
	BhYe4xXFxelc1wUq0g5jWI3wGoK0wrSpBxOoLGTJ0/ChO8NFKRVOLV/5IYzeZuam3tG5VKltnwS
	pG1KIBtw==
X-Gm-Gg: AZFdTZc7uB7bzGDgg5v0SyMk/RV17Hf8J1fiLUQj/PMvlIMf8k08Y0nrA3TeudMXus/
	GmU/GJwJg519qwX/5WsehqUiKHGNnVcMTmc3TSYPga1gYnJWG/TDsDEIYPlanRvq/Hm2cMPIpUI
	0uN7m92n4PuOspbA8UQ5ZtnL24+ftyDmxEwQGqQHKYm60Lb62mNlDWDju2GlOjmSbvHf/EXv62q
	HR4KffHyzTh5xMWNMAfckGJesRkuQsoVBuisrfXw8O96FrAjk/imNipg1T04KeH+P8llFd9koqm
	Wp/G6u66iRG743zqoeUT/Cmq9ytVi190bML7gsFg2ai52BP0yuX6TqED6nc6QjVXBGqGW4x/b0C
	8N6hZCNYlAa7FGRDew3VMyuLLQNW36DFPUpB4NqqqDuy2286i6h6NeCdtLDa85l+8wpS3c0r+wL
	VIt/QOE4hCKZHxI4beO61RTlx7AoRj
X-Received: by 2002:a17:903:298d:b0:2e9:740c:36c with SMTP id d9443c01a7336-2f03f1ba67amr192049525ad.41.1795660012470;
        Wed, 25 Nov 2026 18:26:52 -0800 (PST)
X-Received: by 2002:a17:903:298d:b0:2e9:740c:36c with SMTP id d9443c01a7336-2f03f1ba67amr192049315ad.41.1795660012059;
        Wed, 25 Nov 2026 18:26:52 -0800 (PST)
Received: from acelan-Precision-5480 (118-163-61-247.hinet-ip.hinet.net. [118.163.61.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84027sm95486895ad.7.2026.11.25.18.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:26:51 -0800 (PST)
Date: Thu, 26 Nov 2026 10:26:44 +0800
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: "Ruinskiy, Dima" <dima.ruinskiy@intel.com>
Cc: intel-wired-lan@lists.osuosl.org, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Ye Shu <hello@shuye.dev>, Vitaly Lifshits <vitaly.lifshits@intel.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] e1000e: disable K1 by default on more MTL+ systems
Message-ID: <aweXIb8RzSVHmTwT@acelan-Precision-5480>
Mail-Followup-To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>, 
	"Ruinskiy, Dima" <dima.ruinskiy@intel.com>, intel-wired-lan@lists.osuosl.org, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Ye Shu <hello@shuye.dev>, Vitaly Lifshits <vitaly.lifshits@intel.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261119001818.513503-1-acelan.kao@canonical.com>
 <20261124022233.1234651-1-acelan.kao@canonical.com>
 <087a9cf2-bd0a-4f57-8dcf-9b0962186fe1@intel.com>
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
In-Reply-To: <087a9cf2-bd0a-4f57-8dcf-9b0962186fe1@intel.com>

On Wed, Nov 25, 2026 at 09:42:20AM +0200, Ruinskiy, Dima wrote:
> On 24/11/2026 4:22, Chia-Lin Kao (AceLan) wrote:
> > Like the Dell Pro 5 Micro P5M1260 added by the previous patch, other
> > systems with an I219 on MTL or later no longer enter S0ix during
> > s2idle since commit 578294b8b60d ("e1000e: Reconfigure PLL clock gate timeout and re-enable K1 on Meteor Lake").
> > Every suspend ends with:
> >
> >    intel_pmc_core INT33A1:00: CPU did not enter SLP_S0!!! (S0ix cnt=0)
> >
> > Each unit ran 3 s2idle cycles on kernel 7.0 with the default K1
> > setting and, if all of them failed to reach SLP_S0, 3 more with
> > disable-k1 on. On the following systems the default cycles never
> > reached SLP_S0 and the disable-k1 cycles all did:
> >
> >    Dell Pro 14 PC14250                       [8086:550a, 57a0]
> >    Dell Pro 3 14 P314260                     [8086:57b3]
> >    Dell Pro 3 16 P316260                     [8086:57b3]
> >    Dell Pro 5 14 P514260                     [8086:57b3]
> >    Dell Pro 5 16 P516260                     [8086:57b3]
> >    Dell Pro Max 14 MC14250                   [8086:57a0]
> >    Dell Pro Max 16 MC16250                   [8086:550a]
> >    Dell Pro Precision 5 14 PW514261          [8086:57b3]
> >    Dell Pro Precision 5 14S PW514260         [8086:57b3]
> >    Dell Pro Precision 5 16S PW516260         [8086:57b3]
> >    Dell Pro Rugged 10 Tablet RA00260         [8086:550e]
> >    HP ZBook 8 G1i (14/16 inch)               [8086:57a0, 57a1]
> >    HP EliteBook 6 G1i (13.3/14 inch)         [8086:57a0]
> >    HP EliteDesk 8 Mini G2i                   [8086:57b3]
> >
> > Add these systems, matched by DMI vendor and product name, to
> > disable_k1_list so K1 is disabled by default. The HP entries match
> > the product family, which covers the screen size variants.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 578294b8b60d ("e1000e: Reconfigure PLL clock gate timeout and re-enable K1 on Meteor Lake")
> > Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
> > ---
> >   drivers/net/ethernet/intel/e1000e/netdev.c | 98 ++++++++++++++++++++++
> >   1 file changed, 98 insertions(+)
> >
> > diff --git a/drivers/net/ethernet/intel/e1000e/netdev.c b/drivers/net/ethernet/intel/e1000e/netdev.c
> > index a8f0d3c0fd750..319c7a44f5a53 100644
> > --- a/drivers/net/ethernet/intel/e1000e/netdev.c
> > +++ b/drivers/net/ethernet/intel/e1000e/netdev.c
> > @@ -80,6 +80,104 @@ static const struct dmi_system_id disable_k1_list[] = {
> >   			DMI_MATCH(DMI_PRODUCT_NAME, "Dell Pro 5 Micro P5M1260"),
> >   		},
> >   	},
> > +	{
> > +		.ident = "Dell Pro 14 PC14250",
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell Pro 14 PC14250"),
> > +		},
> > +	},
> > +	{
> > +		.ident = "Dell Pro 3 14 P314260",
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell Pro 3 14 P314260"),
> > +		},
> > +	},
> > +	{
> > +		.ident = "Dell Pro 3 16 P316260",
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell Pro 3 16 P316260"),
> > +		},
> > +	},
> > +	{
> > +		.ident = "Dell Pro 5 14 P514260",
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell Pro 5 14 P514260"),
> > +		},
> > +	},
> > +	{
> > +		.ident = "Dell Pro 5 16 P516260",
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell Pro 5 16 P516260"),
> > +		},
> > +	},
> > +	{
> > +		.ident = "Dell Pro Max 14 MC14250",
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell Pro Max 14 MC14250"),
> > +		},
> > +	},
> > +	{
> > +		.ident = "Dell Pro Max 16 MC16250",
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell Pro Max 16 MC16250"),
> > +		},
> > +	},
> > +	{
> > +		.ident = "Dell Pro Precision 5 14 PW514261",
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell Pro Precision 5 14 PW514261"),
> > +		},
> > +	},
> > +	{
> > +		.ident = "Dell Pro Precision 5 14S PW514260",
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell Pro Precision 5 14S PW514260"),
> > +		},
> > +	},
> > +	{
> > +		.ident = "Dell Pro Precision 5 16S PW516260",
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell Pro Precision 5 16S PW516260"),
> > +		},
> > +	},
> > +	{
> > +		.ident = "Dell Pro Rugged 10 Tablet RA00260",
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell Pro Rugged 10 Tablet RA00260"),
> > +		},
> > +	},
> > +	{
> > +		.ident = "HP ZBook 8 G1i",
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "HP ZBook 8 G1i"),
> > +		},
> > +	},
> > +	{
> > +		.ident = "HP EliteBook 6 G1i",
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "HP EliteBook 6 G1i"),
> > +		},
> > +	},
> > +	{
> > +		.ident = "HP EliteDesk 8 Mini G2i",
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "HP EliteDesk 8 Mini G2i"),
> > +		},
> > +	},
> >   	{}
> >   };
> Hi AceLan,
> Thank you for this investigation.
>
> With a list of systems this long, covering multiple generations, this
> suggests a fundamental problem somewhere, probably not what this quirk is
> intended to solve.
>
> Furthemore, as I said, I am not aware of the mechanism by which enabling K1
> can prevent SLP_S0, and the GBE_D3_STS as a blocker seems particularly
> strange.
>
> I have asked our internal validation team to investigate this, at priority.
> First I want to understand if this is limited to Dell/HP systems, and if so
> - why.
We have Dell and HP machines in the lab, so only systems from these
two brands have been verified.

We also have few Lenovo workstation/server here, but it looks like
they are not affected.
>
> I would rather hold this off for a bit, while we investigate. Though, if the
> investigation turns out complex, we may apply this patch, at least
> temporarily, until a better solution is found.
>
> --Dima
>
