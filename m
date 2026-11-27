Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795785844;
	b=OlEoCSy9ImdOtxlNCZmuqx0h+qBK+oOOb1Z1KrCKMb900WSem9nLWtxYx6lRoRnyCccV
	 F0msgHFUhoHR0LRfGkd+6EFcUmjg7FbJ1Sf4ulPVqym6ooz0ocu1jdTfAqAYs3Q1390wp
	 g+PZ0keM2bq6f0BX60pXP3vFFtgRbNYKU+HTzYPnLCQs0SXA2YGtt/BSz81WhdoQ03gTI
	 ZwDIHuHWz6XDAu76+Om1hekdBULNVFtcKTaeRwa8PrWt9/raJC+aGWHb7mgStXfUT7nBS
	 GXF4NrUTsgiZluwMOf46f4pZ7Gmxz0SD3++BP/WPPeM4+gAYb68D7sQxDspz4BFN+Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=M0PWQLD2FCpEUpDWv96HtGewID9HlsaLAxqC+iTd9Rw=;
	b=UCSRI6PzvHpeFVNA7CnGPJIxbLxU2W79ZcDOEsG2PuhYu/Z3ZXYdzqe/P+ufkEb2K6EV
	 fPI95asYl5U6JsqwCrMorQMXbAyROuke5XbZKwPad1uB7wSOE/sbFBEEBljynYcXNy4eJ
	 lFVXv5Q2f65arXleagVwee+hu9AwDSlA8+sPbqemnXfGCjHMUoXa3MzgN3Jz+165xCcaH
	 3ofQ7ClWgklPkuJveSreRIlIPOcREeMR8PjBx1TjAsNEKrRRMR2emrPtXejWuJ1XKBUDp
	 +U29l/tMLk+Emc9Xpd8i8ojTULD6mF6awa/T304d/IJyEJx4sFmu+gkKIZE3QDJ2vgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QbDZ0OmW;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD47606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:24:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCD47606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QbDZ0OmW
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3866a784546so11098632eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795785843; x=1796390643; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M0PWQLD2FCpEUpDWv96HtGewID9HlsaLAxqC+iTd9Rw=;
        b=QbDZ0OmWb23DeQ6SMsEROCLzRpC9WkHeoy/hlrD6xOTf+ZvTpSa+ESznh+t+jDIi+s
         XYDpDrTh/p0pGoouz1lCgNnxUWt/cnMof2H82NdysfECX+EW+GNvf8LKH/jDyyRab+9p
         F6nKcs/Xsm3rbRln7R3ID0HoPA6bBZOdcdGLsmAgpaELohL3ud0cQ5WV53mn8UFV1ieQ
         0QqGz5lvQNCCX+6/qsuk9gCTk31PNfwVXJYG8s0qfcWEuBtG5VKzF9y24IzOICGfxxg7
         UdhUsy9i2Pz71r5wYPVDqpezKUmUCvzHfox4nYsiZCV7c8K0xsN/sNnohLFlDRSe/tOH
         bCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795785843; x=1796390643;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M0PWQLD2FCpEUpDWv96HtGewID9HlsaLAxqC+iTd9Rw=;
        b=UPGzqPQTQ86aDSCr1qW07LqFkFGox6UvXECpZeEYG/vrZKjikBqLdJ2fj4wbgQ9ey3
         rAtAW440j5RKab5V2dEENV+zd3TNWEf7PLEBqXM7HJ46NgRQ5kTYuvfJ4+67CTJvOsuF
         3Kd36QO+7mvE/aY6MxKjsr9VF35G3JmZsQZ+pWoWch3MhjDiPtz08Ehbyej/DDVWdSHa
         Njl/sek79Tp5aMEa8tyKd9fUpUnM3Vpdc3mzUP64nrJspnlW7BO824Y5F8kKtv+7AHKQ
         wqLQd4k50nyvClCu4cMEE58R61P5Ta4FgwPfmIczbjMMc/lT6OyZYHnmGiWMHvGIgHyH
         81Jg==
X-Forwarded-Encrypted: i=1; AL+hErEALSwAPsDgEMHGE9E+bJ+KrD05UhzJpYJmJPAFBJvPsU2sbUo12Fk5gn2byEWxzY951uZ917L4itwdWWw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+07O7FKpl72XRcg5R0DKm+UCefPmDpd47ntgXE3vO8wtGyhJ6t
	MAWvwx0IE9w8ZWNs0BzvRqXlGZmXfI9UPZ8+DACogN/UWm2pFRlGPQ/E
X-Gm-Gg: AZFdTZdAM64vUjNThhdVJVFmWbTp14D52/1V5z6yQaURFtD+5BC+zpz965/cYgYOCCO
	+cKWNGk584PiBGcDEgSc5KhaBU7RV3Smg656dvsoGYL2nVGCGHEgjsChCE7xuL/3Jkn2SHHlQix
	VTANt0ojQAxZ6hLDwBp7IoYSXMsp/LEO84kEGtY3JK9C9aqunsyV2ZHRk3kSN355/2l9/Z6s03p
	C/p8qaIAhL/1w5Q0TVVHCP+/JSHS7GvntlDJQGPb6QWouPnW7rO6VWFkuG2Aax7Lw4K3D+1Zx3H
	R/XqFs2GuQLiRPAIXRMfy+cqIfUDdverqanVeOQX0QLB5NRoUP7vD8bSAn6z4rA67g/EcYS31g1
	/g3gw/3xUaxK9gjDa4zDF1Q/GDKXYSrXm0uyF0h4k9jD25smyATiWXu9sjoxiJHvm+bhRgCHVnZ
	hJLn4/WuiAuzJ1SAKIwPPFb4z3iHwSRx5B7pwgwCgC6LAMRDsLRhiKwH+fmXEiYdtdlM5rkzXuq
	g5oyMuN3OFg57oh5MM7PNEG2i1nMV8pm17O5RiHrzlrDBcY6DupePZ9B8+Ior1EHUsrQ6gWBcmO
	N/9ihMvSELxvHMXa58jidV5egiwxM9nxIb6SQP41np1DAP0OmDh9
X-Received: by 2002:a05:7300:dd02:b0:386:9957:750e with SMTP id 5a478bee46e88-386995777d2mr20420340eec.27.1795785842774;
        Fri, 27 Nov 2026 05:24:02 -0800 (PST)
Received: from 192.168.1.36 ([2402:a00:163:2ce9:b15c:e4fe:6de1:494a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm86897461eec.4.2026.11.27.05.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:24:02 -0800 (PST)
Date: Fri, 27 Nov 2026 18:53:55 +0530
From: Ajit Singh <blfizzyy@gmail.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: ti,tusb1046: Document no-hpd
Message-ID: <awmD1f5QbjlQoZiC@192.168.1.36>
References: <20261126093819.76480-1-blfizzyy@gmail.com>
 <20261126093819.76480-2-blfizzyy@gmail.com>
 <20261127105641.16941-1-romain.gantois@bootlin.com>
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
In-Reply-To: <20261127105641.16941-1-romain.gantois@bootlin.com>

On Fri, Nov 27, 2026 at 11:56:41AM +0530, Romain Gantois wrote:
> Hello Ajit,
> 
> On Thu, 26 Nov 2026 15:08:18 +0530, Ajit Singh <blfizzyy@gmail.com> wrote:
> >    reg:
> >      maxItems: 1
> >  
> > +  no-hpd:
> > +    type: boolean
> > +    description:
> > +      The HPD_IN pin is not connected to a usable HPD signal. When DisplayPort
> > +      Alt Mode is active, the device is configured over I2C to treat HPD_IN as
> > +      asserted.
> 
> IMO device tree bindings should not describe configuration procedures,
> only hardware. So I would just limit this description to "The HPD pin is
> not connected to a usable HPD signal" and let the OS figure out what to
> do with this information (in this case, treat it as asserted).

yeah, sound reasonable.
Thanks,

> 
> Thanks,
> 
> -- 
> Romain Gantois, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
