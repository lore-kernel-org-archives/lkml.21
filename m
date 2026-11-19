Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082310;
	b=cWQFd1j6dxFyvf/l+2lOvaQd9lfmZXHhfnIK9+eyHzsRFOFAyY9T41yZCDh0QO8Brchr
	 AurfLyClu0dI3KSDAgz5q0XHReZH3dgcTbzG9tf1h4spVwJtoW4jB8wTVcYfUrSuNtsdX
	 DLhxxDpRuiPB6eduUpRtuXdGy+IMYR1ehEU7ENAH8hmZGP/rDSHcJBJHCxckrdiDUSlXq
	 TiDY4RaX79NO6IUixQ6xIizu/cUV2vUwkt+iSPFFVgK/wp6jAzNOmAQ/BoKoLNiKWyFwE
	 qrdXNOiobmkVjGkh5+aQQMd7BGiIXrJY43qseEyFmbMic9+6YG92XUt+6o6pmzSnqpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082310;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=n2VTtGN9TynWUD8SrKDL71tJAxT7cgR8kfgCuoVolSs=;
	b=IFoUeQwfhndjTH7d0UM2mYfvPIFuovCOHckx/sLib4XryD01spyczRKqQ+QC3nXlhQp6
	 zEeNBjRG1JSJI9rnChHzzDYLxL4Gwua4DMzvCFOqijpOmlHKM/YaDq5NNSHrmUzRzwavs
	 qRTEez9PWtNcnq6t/4zeMKTIM5vCCW/hQwmaLzpyJrsUtis/nBRbRESevrjL3SR5O1iC6
	 BO7hNhrirKzChZYJ7a06+GUvmqP8k90DYBVBu4YpC6+ilOAx2+5jICwq8apm7iVC1Uq/e
	 VB0KiRUz4Ue8LGhqOIOqhFTy9gDKc+lx2rdxFYi0R+J/FnGzeng1wITPj044Vrpw6gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bfWzlh7V;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E195606A33B
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:58:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E195606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bfWzlh7V
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso20324905e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795082307; x=1795687107; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n2VTtGN9TynWUD8SrKDL71tJAxT7cgR8kfgCuoVolSs=;
        b=bfWzlh7V4mIrnzbXOwt94RyyLmgPx6+hm8wRbDJrOAWxaQer4uDxiLz8+WgYStEtcH
         OHfIfRI8AeBf2c8BH8JRdjGd0SD8TnAdEHsgHKq/r5nGgk6i4Q5CwIZRx3Xnkjtz+dmd
         Tf2v9dsYILgihHEZhXTZGBIA+OvcxvILiUI1m9ze06mgmwO51ASvs5yvLRq3fHb8gMaS
         lSmAFJb4IYWcM1GpCXOrtfpxS+Gt2qNUgGAM/e9n7wVQ3IBZ2QLMIlQyzynpj50lDAH1
         bWcHnHM7pMFM/5yvMIWXweA+fov+DEDBEHaUlYf+TK+oD8QxfAI0iJIKy3O9NICslpQR
         5k7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795082307; x=1795687107;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n2VTtGN9TynWUD8SrKDL71tJAxT7cgR8kfgCuoVolSs=;
        b=iVOqiu2XS/6A9ltasx1TUxPehfMsih14zGcMSFgYAvuvL44uNUq408Zy2KsJ7DDAJW
         Fn/q+frK+3GPN5JuOqBHn/jXMwGdI/00rjgj7t8LnTw9Fbvkuyp/MKV8eoULFWA/S3BD
         lNdWyNeNqs8bXSCfHlO3g4ecjTDl9dTn0V2J2uAxGEYWgyEy9R1PZYtTP1xcWoCC3/Sz
         +Z2s6ZPLyMpogG1J6RfEjmpmlptE0bqdNLJcdb0FuLslcirkLPSw9WLqtUDCxGQTqC1c
         Ingsh+d1iDbLFswV6SXSd6dUdxgvG/U2jNTolSBh+CRDGI1pWq4VzUZ+ShrivVwdXI5s
         3STg==
X-Forwarded-Encrypted: i=1; AL+hErF3pNIIRSwQTxqkqu0lbyqoe9jT7KMa+F8TGmagzpii/3+SCzuzU0Ddl95Tc5GSnKSgl1C0OJaUFMu04v0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HoVO8l/HTsDN1E1jjdnwWH1ijC2eQ2crc5OyxysDxEeoLrx9V
	kNL9SuyRRLx0ssLQcTliG5cJa3DuJqbW4OownLW1YDijbpU+F6I/NLQ5
X-Gm-Gg: AYBFou0kXktK3ofvC5aqbLzhuWLBvUaNc50qmI5ICMn4rbIG5OnKlB/g9HU89TiPz7x
	ehc99BSZQSIRks6xlYL815x4uLo42FYMJf4c2il3ltnlj1BDR2PVgVsvuIWlnmT8tOWREQHp6d1
	q3ayEBU/Cr5srHM3Ut9mQ8gS7qF6HDkEoojHJfghY7nGuHnL3w0vHByYvl4g13aqnb0iTJ24DIe
	ktNoc4rQWVD9szSd0ULgBmAi0pNJsR27ShUHpWYUIdNiBfJFW8ImsIOjsv2bnZOtY15vQln2ZIp
	ux4O1d3LAo9DVUmaB09bLCXNuk+1JepRf1hx6lI0r6fjIpU12aRqg1B+O31x+rkzIssl+tAJRXg
	Da3o5s/Ru7ez4DM9JXdAVfrhXnpaP7ZtSImDrmdK+HXcZR5k4riWsF3fWOOcDXl2hWlCNTGYoQX
	t98/fCLgVDqkJWBRjbHzFwYQFzxpl/swt3P1kloiITWYyBBdI/AHuzEtY0Ia74AERUEqYMICUWc
	eH0GANMy+QtJHwIsmKiogkvhANQEvrfutTy0/aTJgWKq9qw+hDSOmhp3N0G9EurUP8efy8aAsJw
	ql32mwyK97zqPnBvu7bdpej4tufjOKbpP6x28NSHBw/ScMcokiqBLKSJZf9IU1DM/ZA2uogWJ8j
	C8Wa5nwrS4UrizDjFt0Bs18TGQTnp2Vv72yvjiSgjO2ehI4FmsjufDXqfZdb37A==
X-Received: by 2002:a05:600c:3e0c:b0:4b7:6b96:e431 with SMTP id 5b1f17b1804b1-4bb7da458eemr109808135e9.28.1795082307133;
        Thu, 19 Nov 2026 01:58:27 -0800 (PST)
Received: from Lord-Beerus.station ([93.146.104.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65560b1ddsm9462578f8f.28.2026.11.19.01.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:58:26 -0800 (PST)
Date: Thu, 19 Nov 2026 10:58:23 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/1] arm64: dts: freescale: imx93-var: Add Cortex-M33
 configurations
Message-ID: <av7IP7M_UAtYFm4D@Lord-Beerus.station>
References: <20261119090600.9257-1-stefano.r@variscite.com>
 <be20af64-e729-4d1e-aba1-c8512ac6e775@oss.nxp.com>
 <av7BStmo7w4_rPci@Lord-Beerus.station>
 <4a4366e3-a99d-4250-9fb2-c3eb254c06f4@oss.nxp.com>
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
In-Reply-To: <4a4366e3-a99d-4250-9fb2-c3eb254c06f4@oss.nxp.com>

On Thu, Nov 19, 2026 at 11:42:54AM +0200, Daniel Baluta wrote:
> On 11/19/26 11:28, Stefano Radaelli wrote:
> > On Thu, Nov 19, 2026 at 11:18:45AM +0200, Daniel Baluta wrote:
> >>
> >> Use "reserved" instead of "disabled" for all the nodes that need not to probe
> >> on the Application processor because they are used by the M33 FW.
> >>
> >> Also, instead of disable in the commit message I think it is better to say "reserve".
> >>
> > 
> > Hi Daniel,
> > 
> > That makes sense, thank you for your review!
> > 
> > I'll use "reserved" for the peripherals used directly by the Cortex-M
> > firmware, and keep "disabled" for devices that become unavailable as a
> > consequence.
> > For example, Wi-Fi cannot use its reset GPIO because GPIO4 is reserved
> > for the M33.
> > 
> > Does that match what you had in mind?
> Yes, that make sense. I wonder if it is a good idea to split this patch
> into multiple patches each one representing a logical change.
> 
> The commit message suggests a lot of activities going on with the code which
> makes it harder to understand. Either approach is fine tough, as the changes are not that big.

Thanks for the suggestion. I'll split this into two patches for v3:

- Extract the existing M33 configuration into a common include,
  preserving the current behavior.
- Add the M33 overlays and combined DTBs, using "reserved" for the
  peripherals assigned to the M33.

Best regards,
Stefano
