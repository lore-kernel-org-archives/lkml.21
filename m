Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705573;
	b=cBCYpyDq0fxAO/Q48y8yW+hAKcPo7JgdVYg227NIvU5trX6OMCckoap42TASCrzddYO2
	 s8tHyUqC+Z73eAVE76WgClZY6JT1AkhEnByw+3qPiO/q7UoY4svWedlTPH25mgPCZRGuJ
	 HS7n7cOzxPQLgrW9aVVRegokf9lJa85fPK9XisVFsUA6oZURi7AOYlfAzUjqtdpaZjaVU
	 bjmkE4v2JblCdTks9nzgWdT3zQcyyKIOQ6d0yq9mUBcx5LxkMXF1MV7YOQDTnMdmRfgyv
	 EqTS1zRvu/aP0iy1tEwKE9cydE28DkdUedoeymNp30rAIoULckFjxRnQzx5dGDIYBGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ArVfh1wsf+Kth2ceemwq0MhxiQP2TwBL9XnUiqzbYq0=;
	b=KYHwYR/IcPkiFjvVK4zgr6jSwuBsPoH1nDdw6zmhmvMOnITrvBKV71IMba6xkj5FJtfj
	 /eeJbRqru3gToIPAWofS8OiiS7ot1rFrNi9fF9ZIyF85N0e27K7mxAs94SteRmkYjJRVS
	 UlWRBTchucWbyjwFxkTDfqODDgl8/WIShv+XZAwpb6aj6HmPR2JQ9KAWxXDaXX2XRxqcM
	 Q7y2eKZEuum7iSTEG5BRHk8cL7JUwTyH3RDy/pXDtSZEs5du8kXAnHZvf0bYRSxj1rSZp
	 09Ry5CP2q7fOzwhzS/ygZGXnGhczr45TeUsb6VK1Bxdb6nxebxNzBHPa4pZD3I1mZGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dZrmxiRN;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13882606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13882606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dZrmxiRN
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so48694225e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795705571; x=1796310371; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ArVfh1wsf+Kth2ceemwq0MhxiQP2TwBL9XnUiqzbYq0=;
        b=dZrmxiRNELCK7pidOeGv4MJJl/V6zvRCFFnhZ4gc4PHktWahW6j1A81Kjd27oOWOz3
         WrMIKFApx+hWYq9zbI0oMt1hOPP5UCS1WSE9icu5bhfBrFPpToHOEjj08zNmqm121UqT
         6M2HkxkmudOobxgqZ+Lf75RFxYp6bn/BDcrbEJMaBeHvGvlpBL4geJawp16opRIkETCJ
         K+A6SbvI686YrcVn0CkcFEFjQzXPlwQuoJ8DNhHYMQQfekhomo9p1dhMTjyobcpCB4Z0
         bz+l1RJAJZl+MrIkrU6fwaLsqmtob0rTr77zjvJk73fQ6sG1Di+iRkESMybWgMVPdl/h
         BieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795705571; x=1796310371;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ArVfh1wsf+Kth2ceemwq0MhxiQP2TwBL9XnUiqzbYq0=;
        b=uvwoVX3r/q3Rfo7Rw6XafqXPwT4Cggi3nExBuP6DcZL8UvrfNXJOXtgYaAZAQ9G3qX
         7DDQ57w1Aa3EmTv7QcWHy+Dlj71+w+//272fgvvoXMXxeiucyNKxZdYxmiS0coOUMiht
         /EaMxaUQt+0b7pyZ25vdKTdQ542Ke1qaKOXQjiGllN/e8Fqdd7f2D18I44ZJmP6dh19B
         1FrTxfHSDR49ZhRg3QJCAEPdQo8CeS/uQ9zolxa4GUdhhg7hqzvwGlP1XFQrA9j6iB5l
         rGxxCr1dS+rZNJ1GJusRZWplmaxYT6RZ+z0dRSkxA6CIwYoCrP8gYrZCt5MfpLy/Nrts
         p3JA==
X-Forwarded-Encrypted: i=1; AL+hErF7g3SMKPoR0k/xIXFy44q3Rl3iiirMP6g7G4+XfH2Z6egesAXhoHs6o1E72FCoRoOBpPsprmKuR8glbQA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9eYS1IljgjJCa6keTq7ByrOxFSdH7n7V2cCa0CBEoVdt7xOSUT
	Wmv4qsyL69y6f1rSyyBO6n41sLsbhHM0S6LOxF1hjktf6j3SGgTutVRogUI06ADZ7vk=
X-Gm-Gg: AZFdTZcvhE+sfmCM1mHyoTsgzpEj5QsZ4oJ2/Fd7oRkBfwAQDYkJXHWwUXj0az+D4CZ
	jpWRXuUF22xtjrgCY5BLXDxs1Kys14K/OBoyS93ar8u45n7jbGD7aLWugoeJqLgCJoopRBjHNtm
	9prnCH/t8pSzQ9GA4m3Z2KqwKaV+uOK5J3vjoRKDCE+6VSypJx8ulweYt2U4pebY7b18sEMCCKc
	cEd4RC5DBPbL0dabHCXOvt8jCQGwO1Gn96lrDOtwCRVED1+gWnU8lz3Z9MDHyE/wceXRk+sAGQ5
	twVt2wNHP08kyCgitx/b5Gt32kfhEnXye4ja81MgdwcGDF52fU9k8Hhr3XlkNHm9v0bFQB4VtNp
	TnftyCzas8VCLwt8rVrUgq+MRTPx21X3Wbnkdpst8IyrDZpOKYlCx4vuAwAOFhqIu0etl7ZMEyD
	eNBdA3h5UlOu/CARpIKNbiMhSYCZZ4Z8o0MeXumg0lHdkxjleALSQ0xx14M4tkjC79TjF85Ppx3
	7b2rUAIbxtwUVZSSZ2uRPz7iH4PPBwX0mvY5pWyKLotYokyeS8vVZpcazNFsFZWKjTHiY3+njwP
	dUWW+OSkPEoRsKKoQS1fMyVzaqoB
X-Received: by 2002:a05:600c:8287:b0:4a1:6992:f861 with SMTP id 5b1f17b1804b1-4bb887e064dmr436496855e9.1.1795705571098;
        Thu, 26 Nov 2026 07:06:11 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067846esm415663915e9.4.2026.11.26.07.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:06:10 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 26 Nov 2026 16:10:10 +0100
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 06/28] dt-bindings: dma: brcm,bcm2835-dma: Document
 dma-channel-mask and DREQ flags
Message-ID: <awhL0itLEAIsK4HR@apocalypse>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-7-andrea.porta@suse.com>
 <e2d27b2e-db69-4fac-b7f3-28961a9e094c@gmx.net>
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
In-Reply-To: <e2d27b2e-db69-4fac-b7f3-28961a9e094c@gmx.net>

Hi Stefan,

On 18:49 Mon 23 Nov     , Stefan Wahren wrote:
> Hi Andrea,
> 
> Am 23.11.26 um 15:56 schrieb Andrea della Porta:
> > The available channels are currently described by the vendor specific
> > brcm,dma-channel-mask property, while the generic dma-channel-mask
> > property from dma-common.yaml carries exactly the same information.
> > Allow the generic property and mark the vendor one as deprecated,
> > requiring at least one of them, so that device trees can provide both
> > for compatibility with older kernels.
> > 
> > The single specifier cell is also not limited to the DREQ number: the
> > driver interprets some of the upper bits as per-channel flags (AXI
> > priorities, wide accesses, burst and write-response handling). Document
> > the meaning of those bits.
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> this patch should before the bcm2835-dma patches which modify the dma-cell
> behavior.

Ack.

> > ---
> >   .../bindings/dma/brcm,bcm2835-dma.yaml        | 26 ++++++++++++++++---
> >   1 file changed, 23 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> > index c9b9a5490826..f619e395cf0d 100644
> > --- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> > +++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> > @@ -37,15 +37,30 @@ properties:
> >       maxItems: 16
> >     '#dma-cells':
> > -    description: The single cell represents the DREQ number.
> > +    description: |
> > +      The single cell contains the DREQ number in bits 0-4, optionally
> > +      combined with the following per-channel flags:
> > +        bits 16-19: AXI priority
> > +        bits 20-23: AXI panic priority
> > +        bit 24: use wide (128-bit) source reads
> > +        bit 25: use wide (128-bit) destination writes
> > +        bit 27: do not wait for AXI write responses
> > +        bit 28: wait for outstanding writes before signalling completion
> > +        bit 29: do not pause the channel when the debug signal is asserted
> > +        bit 30: use multi-beat bursts
> No strong opinion, but mixing DREQ number with per-channel flags is ugly

I agree it isn't pretty, but it is the encoding the downstream DTBs have been
using for years. Switching to #dma-cells = <2> (or introducing new exotic properties)
would mean supporting both formats in the driver: I'm trying to play nice here in
order to not break compatibility with downstream DTBs, which I think should be wise.
The header I'll add in v4 with the definitions for these flags at least makes the
device trees readable.

> >       const: 1
> > +  dma-channel-mask:
> > +    maxItems: 1
> > +
> I think, the dma-channel-mask stuff should be a separate change.

Ack.

Regards,
Andrea

> 
> Best regards
> >     brcm,dma-channel-mask:
> >       $ref: /schemas/types.yaml#/definitions/uint32
> > +    deprecated: true
> >       description:
> >         Bitmask of available DMA channels in ascending order that are
> >         not reserved by firmware and are available to the
> >         kernel. i.e. first channel corresponds to LSB.
> > +      Use the generic dma-channel-mask property instead.
> >   unevaluatedProperties: false
> > @@ -54,7 +69,12 @@ required:
> >     - reg
> >     - interrupts
> >     - "#dma-cells"
> > -  - brcm,dma-channel-mask
> > +
> > +anyOf:
> > +  - required:
> > +      - dma-channel-mask
> > +  - required:
> > +      - brcm,dma-channel-mask
> >   examples:
> >     - |
> > @@ -96,7 +116,7 @@ examples:
> >                           "dma14",
> >                           "dma-shared-all";
> >           #dma-cells = <1>;
> > -        brcm,dma-channel-mask = <0x7f35>;
> > +        dma-channel-mask = <0x7f35>;
> >       };
> >   ...
> 
