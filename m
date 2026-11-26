Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703914;
	b=SsepOFv4rrLe0qHZOMW64XFfkARWK12I7b1iO5Jr46DV0CbZcfxs3P1ln8xu+oh4jNGv
	 Bt4L6HgogDdd1JCHMtb/ofXnLRTlxxf4QSdRqkBZEdz6cZ2hud1MoiIHM6zEH1MuH5eKb
	 FEvLrNR0idrRpR2NixRJc/zD1SFTTZLgo9L48dKvlSnPeJELNyrMHA7BfKcuc5YZE/rTq
	 E7BLJjw0VWVBoNrCc95zaIOwDI9JMC/MmFhcwt7rdBXsNjuSHYm6+DWTEXL/xN16AxN7Y
	 5WY7fCejML1YR6GxtRN0oMCVIjwB4zWzIg5+lnZZxLr6b06WtatAc37qLIAwkjtrkzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703914;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=auCcba+5d77RO1uYXgMttg2oy3VWOurHghWnl0cLv30=;
	b=1RLO2EFca8luh6Yrl90pOROMquPZfl4E0GDvUdEBhk1CavbdQ5DBmP/NVDD78lRyZXF7
	 +/AzmVqqss339VAnbXmf1geuNSOoX/v0GTrvNhTfeI6ODGBIOMLzntAoejuPqu/YbIgfm
	 6Wp4MQz0IXWSutn88tHwkS0JCyBup07G30Jqjt3d4ytWIzqFqHOllBNiaIj4zzaeR7JM4
	 8BqoET7aYnYbTtbvfXd4Oc9gW5xdKlM+HpykuybrKaGqH0HFHwmh7R7RzfmYB1H5tvjEK
	 RflN0eGETJmiP3UqaTE6VWfjeNEXwe8CxxY27o/gHsGjZvYkGMAZruCrtYjPiP2LPuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=WnMPnIzC;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2788D606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:38:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2788D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=WnMPnIzC
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so5942459f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795703912; x=1796308712; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=auCcba+5d77RO1uYXgMttg2oy3VWOurHghWnl0cLv30=;
        b=WnMPnIzCdls3owP/R7yn2u4u0fUOEWTcVkLBsniilxqyGNDXTQ4mYtnNLW3jq/gu8c
         JPS6XwAQwe668dr05qBwoRf0yembIvH2CAhC+xD8WP+BUPu2x4ClIkjwObp9imYTKk52
         lnj0RGIaYTyR+Z6WA1w2C4afowfHBTIE6Nb8KHlB7IuGRKAu+h+V/HPe5eHILMCfzJOX
         yfV/voIjnBtVa99WV+7BRTtcAJCkH7Z6caSMesferB2eX/KNe0Wl17xIQIPl3rIV603U
         CJeJK0MAOKn2FlslWKKSsBesSuwXYQhexEcxP4WxvsX30dh/dcuhROsUUVhT1G25gxpv
         XJzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703912; x=1796308712;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=auCcba+5d77RO1uYXgMttg2oy3VWOurHghWnl0cLv30=;
        b=RX8IiFijC+WBotuyRvPjStxBbhjRXkEyIzfDI9SI/sUhEbSGSHapTJ8er5iMbLM7Fy
         4FbVX8B7R9K6lbaMhF9kfIUzZL36V8/S/muEx+NZaRaCqNsjMvbvRBGnbmz0uud+KJ6r
         vOOryEYk/Gjta2iEjQEF95KSAlwN/yZ5nYbs9YLe2Dwy8drnc284ldTX4PRLk+9RMhjw
         v7kFeHLEv/EABGFbO9HIg8BuIunadB/i/wOe0E63fj/am7UjlwdPGrufP2DwwL0+plhc
         mUIBcD1cvfWdGS1AkX8RCT9cytYOeLOTfDpxw4ceIy5kG+YLMTyO+HKxSTzfxCXAcIJ0
         oINA==
X-Forwarded-Encrypted: i=1; AL+hErFBu5nhVjXH6zaWoXc3kd0JQP6rnOGi3HI8FBfnSeNlWvCe2STE9rL05TO63hONrx6xEdn61f1ogN0/bk8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vfYmZp0XFomPRgM/sYapq10Fx1lZi1UROeN6yjpXBNEICOFVq
	P2PLwxUUFoh/3U6OQlnMdSSawAkjfQxsKmCwcd957Gz9NMS0JQk1oUtxn4mMKrVgAcg=
X-Gm-Gg: AZFdTZdZM9yLkQGAyxUUXnY1eeaYfCDx6dmNXj53Ug6OYa1UykIc3f/3zvqmDjNj2co
	W7Tlg61yDiMuR4xLBKklfNcrwDxsFeKna51nAsQhArLNZlFFgjkmIUqp5d7aCnOODXtQ22MdkDi
	6Q55gMRBDxs7la6PUjFzbgceYxwRk3pM0pDakim7Owr4XEFxuejDYdcbAMsm8m+pO5pdCM2q9bs
	HSS0o8RpA/rKxCjYkqfXynXB63t5oA1SggLMkCSj8X4XtigRQvS+MB/sgalYhLrDpGCUjPD4dca
	clTjw88GPpLyE0FXHz8tw9NE49SeQrqm3HlxqI6rXUiwqLQLYtLh5AcVP9hr0mMZalJrLN5EMkS
	FRixlrOKwGen3uvSo6n2DlL5uoYecN67YCcqKo0Hf1mzTDe7iGfetW8DW7aCD+FUiZe3cSrVGSQ
	Ap4Al4zetniXHVCS6mWeZ39bgpV6twFfHq+YqQhXq2mNnwisZW4OpldGPACfT3rIqoMM2LDv1Hm
	skRScYMy6RrtG3cdodEZCZZM2EBJ/Oq7evEAFB7a0C+Z44oeLnQh+l2OMXLpxKbWt77M+7MECzp
	/h2+/EsPsBA+xQDlhCspVrCNMFpnzw==
X-Received: by 2002:a05:600c:4e16:b0:4bb:69b2:d3df with SMTP id 5b1f17b1804b1-4bb88813024mr437965725e9.25.1795703912479;
        Thu, 26 Nov 2026 06:38:32 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm615439805e9.5.2026.11.26.06.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:38:32 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 26 Nov 2026 15:42:32 +0100
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 06/28] dt-bindings: dma: brcm,bcm2835-dma: Document
 dma-channel-mask and DREQ flags
Message-ID: <awhFWBteSWqZ5keD@apocalypse>
References: <20261123145728.29082-1-andrea.porta@suse.com>
 <20261123145728.29082-7-andrea.porta@suse.com>
 <awXnR8jz-Nd4QLJ_@lizhi-Precision-Tower-5810>
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
In-Reply-To: <awXnR8jz-Nd4QLJ_@lizhi-Precision-Tower-5810>

Hi Frank,

On 14:36 Tue 24 Nov     , Frank Li wrote:
> On Mon, Nov 23, 2026 at 03:56:44PM +0100, Andrea della Porta wrote:
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
> > ---
> >  .../bindings/dma/brcm,bcm2835-dma.yaml        | 26 ++++++++++++++++---
> >  1 file changed, 23 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> > index c9b9a5490826..f619e395cf0d 100644
> > --- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> > +++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> > @@ -37,15 +37,30 @@ properties:
> >      maxItems: 16
> >
> >    '#dma-cells':
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
> 
> Add header file for such defination.

Ack, in v4, the header will be include/dt-bindings/dma/brcm,bcm2835-dma.h, used
by both the driver and the device trees.

Thanks,
Andrea

> 
> Frank
> 
> >      const: 1
> >
> > +  dma-channel-mask:
> > +    maxItems: 1
> > +
> >    brcm,dma-channel-mask:
> >      $ref: /schemas/types.yaml#/definitions/uint32
> > +    deprecated: true
> >      description:
> >        Bitmask of available DMA channels in ascending order that are
> >        not reserved by firmware and are available to the
> >        kernel. i.e. first channel corresponds to LSB.
> > +      Use the generic dma-channel-mask property instead.
> >
> >  unevaluatedProperties: false
> >
> > @@ -54,7 +69,12 @@ required:
> >    - reg
> >    - interrupts
> >    - "#dma-cells"
> > -  - brcm,dma-channel-mask
> > +
> > +anyOf:
> > +  - required:
> > +      - dma-channel-mask
> > +  - required:
> > +      - brcm,dma-channel-mask
> >
> >  examples:
> >    - |
> > @@ -96,7 +116,7 @@ examples:
> >                          "dma14",
> >                          "dma-shared-all";
> >          #dma-cells = <1>;
> > -        brcm,dma-channel-mask = <0x7f35>;
> > +        dma-channel-mask = <0x7f35>;
> >      };
> >
> >  ...
> > --
> > 2.51.0
> >
