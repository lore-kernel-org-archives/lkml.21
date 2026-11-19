Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099923;
	b=Uxq+WMmCCzOMBnzlIXIwsuxoV8jiy5/IKI5t1mNJN8b6ho5p/dRaRinzHwjHsZfrw1O0
	 njPbetH2zg+quyZ907SJyy8luK1lnpiYVxzA0/Mlhb/X7dMYaiA+mNSXkxQFQyHlOMC2p
	 6nGgGIfNaiaV2easw5Rdgc4AFICKhFV1sBYXMq1yY/2lK/DObYXmcosA73IZV8FkRP6g7
	 ddtqaAiuqvdkYKZz2fLEz06Xw+3ttERfCm+e+5J5B/TloZokHKV6fCOut3Pc1qaVSm4R1
	 eHFF2dAe+J4/CFmV5xbI9vkBipDlVj+C2pBbgfLpKnQk1lutCqqogP+6BUykHPtXofg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=sHDi3n/DwJusFdRaY4+52UP/45IKh0P8pO8s1HdZiBM=;
	b=OkVY4rS8HEUpcgY+cEbnxvotlcW7ctxa4/wy62+rDrcJmCbdVMNgjd3dGw2YzuOfAD8T
	 p9e0QWOkMMLkPRMIYLr0ixTlXtAu8CsTPttdjioyrfaVf/Dr8pNQswZBODon2F9DHeNQ0
	 +SFGfx6kFby9/1eXUKzhKz51G1liISNq01EqJ7uPQbgppeYn9hlqCQZbbTGO990ds67+Q
	 Gc8kxE+KXJlsS3paHOuBJsi1MJZFvc0TacNNT+GOnGyetKhszR2OxaAGKvf6k+yshHA5T
	 nkGUF0O6QI31QaEr/EqwFZpXUA5Z6DmxFsm44o7ebGOxF1YGwaYaULmYnI891qEmC0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K33iAVDr;
	arc=none smtp.remote-ip=209.85.217.44
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5234A606A333
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:52:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5234A606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K33iAVDr
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7cc0ccc2fddso839647137.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795099922; x=1795704722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sHDi3n/DwJusFdRaY4+52UP/45IKh0P8pO8s1HdZiBM=;
        b=K33iAVDr28WuDqdsKQ7c6BaLdM9PoKWwfFp/RVmBN2ruREIvpWU/CcVciG2GuHy/XY
         XOGuT8cyqW2Tr0sBsK3AEPFxOW1Tjq5imWBh0v75DOPsRzT3H+UFzClalx3Azancgmrp
         A/wMT/ychNoVIhpGSgg3HskeSpanL20YKxOLgu2dEcqlRReo2X+2IS23fygsWrx/pS7g
         gQkKP4lZvrEbArMfchoiO+q9vIwcMFnjhqR6+PMZNCtpvEwUnmze5zWfKGVUKHdKipUA
         F3cVE0JSC618twvZ2hmJq2c4HgvBPqc8qdngMWU8t3QnTe3soWwgSEMFi+/LjI3t2ogA
         avtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795099922; x=1795704722;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sHDi3n/DwJusFdRaY4+52UP/45IKh0P8pO8s1HdZiBM=;
        b=N9D11+l20hDdxbpyuxHEs/3r/l0p1w6+hcavQVyfts0+om2xNXLSg1C5/Jdcp3QvXt
         qWb55tcuD4y1icl82HvYpisBN9sLZoWjI1AmnQg/P3pvd8evRRlmHx8hG79+aATtESXt
         GhlJJd3yklwAdc4SQOQsJQLfClC5ev+OnP4xFDqG1UnCtQkq962AqUPSOX51xYquXcmh
         lv8vvGQpNtlSD/k1qTqgBB+NNS9LYflr4mdCgbBle5TK6YxaM12aTUdJvhY2xbxGft54
         wjyXtTV6DncnQMfGO51fzbyNaxAi8N9AC291S5Hlyk99CEZdyX4Maz1+rFsECSFY9w7S
         Gnjg==
X-Forwarded-Encrypted: i=1; AL+hErFaoM26qee6kBL387EmIaWqaEFmOkA7aHTLWm6GWsHdn+ZY8yyKuu9IDipGVU6jgsjRA6vljL2BsQiHL0Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xcuQFjLE+g0r0RScux9XIWy4ibzql5thY5b3Dy8zbRYSS2HrY
	dPeMC2zJE528buSdHXg3nhulm7XgEhmgCi2TcUg7MdXQhbBV+MWTlJwo
X-Gm-Gg: AYBFou0PJ2X8edHJfqKKhfkyXMVHJXnDzMSeXKdtV7voV6qIVaX9bqBVGr5ZS1nFnwc
	i9t8Gh315/wK93q3rmBY1qSX71c8HwezRRX1QuABP58DEO7m42SsilQgfTGjptKSynB/ptVVakA
	5guTx+I7nKo1tEq4pSwWK15SQzOBVdlY/stXlWV1QrFpkiqJ2OP5ML2LI/Y7AOHetWHs/ATy+ed
	9mmQ+lirTNZ56VwtVs6IzRAEUFEnY3LH6b+lEDZaGreedq8LxllCgneEUEysXWGOag6NrBPE/W4
	YQOOhuVxPZnZHZbiI6renONW4A4X8bDzQHYYQLBU13E9l1TjDid4zYut4+hrKH9XVzKONIHEcAI
	J4PLsqHqJI52D5lotD2keyUwro569ssqyNk8gRCyQYn1dgSAaKo97SjSVa8YOR2tt05ZxSi5ktd
	jcHlauneVvj6+W+ycZALPrxdF8bp5/j4ADzJ1b+aSQin821K9/l0gNhVakUI4tk0Iyi8uBwksJA
	us/YcbQNDrOWODbwwQCHXmvOg8uD8eM8Ntwn791b7GcazrGkB47sZaBvWe7RaGCg9Apb/+Eb9RV
	hl/uni7BrDd4R+HGefLWhenm/1Jqxz7edNwt
X-Received: by 2002:a05:6102:6044:b0:7d6:864a:5509 with SMTP id ada2fe7eead31-7d6ba43b12fmr2019264137.24.1795099922016;
        Thu, 19 Nov 2026 06:52:02 -0800 (PST)
Received: from localhost ([2804:30c:914:4500:cd15:65cc:e2cc:7363])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6df8a28dsm150070241.4.2026.11.19.06.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:52:01 -0800 (PST)
Date: Thu, 19 Nov 2026 11:53:26 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Conor Dooley <conor@kernel.org>,
	Marcelo Schmitt <marcelo.schmitt@analog.com>,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux@analog.com,
	Michael.Hennerich@analog.com, nuno.sa@analog.com,
	eblanc@baylibre.com, dlechner@baylibre.com, andy@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	olivier.moysan@foss.st.com
Subject: Re: [PATCH v1 4/5] dt-bindings: iio: adc: Add ADA4355
Message-ID: <av8NZpVuodpXM7GU@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1795003864.git.marcelo.schmitt@analog.com>
 <c7be62089d2b54dbf7fb57cdea189bdb1cade7c5.1795003864.git.marcelo.schmitt@analog.com>
 <20261118-liver-decompose-434eedb257b8@spud>
 <20261119025950.456dc645@jic23-hlaptop>
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
In-Reply-To: <20261119025950.456dc645@jic23-hlaptop>

Hello,

On 11/19, Jonathan Cameron wrote:
> On Wed, 18 Nov 2026 17:39:46 +0000
> Conor Dooley <conor@kernel.org> wrote:
> 
> > On Wed, Nov 18, 2026 at 10:04:13AM -0300, Marcelo Schmitt wrote:
> > > The ADA4355 is an integrated analog front-end and 14-bit analog-to-digital
> > > converter with a serial LVDS data interface.
> > > 
> > > Document how to describe ADA4355 devices in device tree.  
> > 
> > Please explain why the 4356 differs rom the 4355 such that it cannot use
> > a fallback compatible.
> 
4356 has a different set of selectable input configurations that leads to a
different scaling factor to get to milliampere units. A system with ADA4356
matching/fallingback to a device driver only supporting ADA4355 would get the
wrong _scale from the IIO device driver. Users would not be able to accurately
read data in milliampere units. ADA4355 cannot fallback to ADA4356 for the same
reason.

Will provide this explanation in v2. 

> Also mention it in the patch description!
> I was briefly very confused at Conor's comment :)
> 

Thanks,
Marcelo
