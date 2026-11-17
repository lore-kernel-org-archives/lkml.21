Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794945879;
	b=UCaIcQbT6LRUPKc6UiyV0UUWgczTpow9qjHMAUm5ozYDT8s9wOYpHofWPNr2v/4B8891
	 x1kJcXw3/700RcDtwPvUkOWTVdg1zHQaOmtzuO6cTf4eWf4GWd+82bA2Oe548Ul8mM78V
	 IY/SDUEYUFVII5SLJdnLZhVP03uHNtcA8n+YRbP4NDTrOxqaXQFzSQ0lI36oL7fkLfF2M
	 gKjGF4TLFEq7qjV0O7Ff5S/n74MwLgT7m8PK6rjkvbVNp2y0vKmIDktEq6OnpLj6/4icb
	 WzGHId3wdMhOoDmJQwFD9guMikyQDO9XgGSTdG35y8Mmomq853DxBEk2uTzQMlPQUKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794945879;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=XjiiH9vEp71/nKv/afBhmdp7G4Z4pntmYOkq9YJDSd4=;
	b=DMN8mgP2xhOVtu7n/HxfNcg57+H9kPtjGqsR9jlNg0I20SqLzJ4mFtKeClFMOAk2/Swv
	 Q4sEpmSvBN9FpYqZcqjYvHf9UeGUj566GroNJ+QMMISpwR5Zbpz0q79ORcn/xmS0Vj7hG
	 4UPLYB9RWDC/NmIgWLDsp9ogv7UOccsN/9RatF7y3/5cxKzEAd/G5p+gv4Y36ZhuP88JK
	 AIz1tUJBuZOxD4V8BcM9SQ2Dqkc6RrV5ke3p6bzP86v0EWQOgZVf11WYbfn5m7Mm49ium
	 FZdwuoIEAJG7a/2tUr4mJpT8nhHMt2S07dLODwpO7wi1NdHAgD53CXUU1s8751nr5lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853EA606A335
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 853EA606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso38791a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:04:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794945879; x=1795550679;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XjiiH9vEp71/nKv/afBhmdp7G4Z4pntmYOkq9YJDSd4=;
        b=AaHl7rALhu3I+CNt4aqpd+qDnX//gcAlnilYB2/9ZDoNSAetaKReII3aIOhQIqBdFi
         yZfRAwnrtDnBYjHp97RWDtLEdyzdEpqgYJXZOEeBuvjlP4x91rwbSKERjiUaZjj9Mb+T
         5YbK1ZfD/JG/BpFqNrrrgv5ztSzJliZjhTiXnG50qtKwqqjB91d5YXt9vTRBMx1Ne+i7
         VScOJiCECncj5gtmadyM7ONV4ZEE5vYi0RBzf9yAfXSD0Vc3g71wbh2Q3eQ0RSthoHEF
         f/idPFuoZa7E+dUW1dIb09ATlGC5SA8finGFPrnjh/hGv4TdnyU30WhSJztL/6harBpF
         e+4g==
X-Forwarded-Encrypted: i=1; AL+hErHSPJwp2KKIAQ5OKM1hAtiVEf0WNAnR2D8a5bNeYT0pKxjUzFwvR3Kf0+TlBRSMByBPLHnOW7nM2CsjQXI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Bgj/NcDJQvCDwpzBMT7i9uAgZjf3lTp8K1T5PN8uX4/jJvpmF
	/pb+wwRYlUKY8myWwqFJlb6j7c0tnU//eBf2wbces36oUHI37yqdFvyV2jTxyc3/
X-Gm-Gg: AZFdTZfgjRPhrlUCu/SpMmCgTMOVpcA8nEZvtzRzrSMTIfaTc1GynTwXaFohMz/XEK3
	1ZeciqfsR3DYOaeGG7/aa+cPkdy3Hm5ZKKBm2Xn2TTAYEcFKo1n5QSHaYd0lcY3B44GoOVVIlHP
	fN+Erdj/lrJvyjfm7GO5Mj45w2x8juzZR64HE+YPRrX8FnDd9Zng+oPGDBSAtnirrTyba1P5AJ/
	obypsUIGFhNMHscNTHGncqmtq39SWajsPMUa6MgAwaLLUp5HDKDtHySUIiToLLsjMA7tx4KZzGB
	IGccp6+heSpF4DtKuU3o84zwgGL8cL7ePK3L5C7kjDu/USqBC0Zch4HqLDXQ4FKdAwXaOmP/V1X
	Z1u4q6R/zWvmayBJkmKQWhGZXFiYarVEPkUsEpjToB1laz0BSr6Q65x5lz9cTQCtweJkRlfH7y/
	ZmYJ0e77zRwyFbqklGol4a6CqrAmuM1mz+ucgTWVO4QkGazcf5sUG0IRojZBDXK+98ezBKq1m+s
	uzsQx2UEZFhfFSnPAHlWKz6s1YZhd0VTR31LLdYP/0/qV3fPNDELk8KVsSPCLpL0gVvEok8DREn
	vZmTAu1cVpaSyEW1ts+cSQrK1o+Mwy9WWqW4en8eAsy4kPrb8UptsSipowIGY0lA0JBZuEBgdNb
	wU3Cs0Hu83tF5RLIDdr7ZDR3ozXUSEvDgnhvChtZ2lQ6P
X-Received: by 2002:a17:90b:33c7:b0:3a0:b312:1fbe with SMTP id 98e67ed59e1d1-3b3d074d7e5mr435744a91.23.1794945878833;
        Tue, 17 Nov 2026 12:04:38 -0800 (PST)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com. [74.125.82.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac4cff6fsm5479607a91.12.2026.11.17.12.04.37
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 12:04:38 -0800 (PST)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso467388eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:04:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHytwXaQ7hlwQ2e8yh6KzvqrRXxnvIJTUc+NcTVXqaN8bDu0PxGHj1vxBilWDBfsy1Rc0EylrZMT03q+D4=@vger.kernel.org
X-Received: by 2002:a05:7300:7314:b0:381:1580:cb4c with SMTP id
 5a478bee46e88-38281023cfemr582427eec.24.1794945876970; Tue, 17 Nov 2026
 12:04:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-iio-ad5246-v1-0-ef6b7c06d4b0@telaak.dev>
 <20261116-iio-ad5246-v1-3-ef6b7c06d4b0@telaak.dev> <20261117-object-glutton-d948f8e36ae4@spud>
In-Reply-To: <20261117-object-glutton-d948f8e36ae4@spud>
From: Joseph Telaak <joseph@telaak.dev>
Date: Tue, 17 Nov 2026 15:04:25 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ6dAt1YGcd_u6SJW6A_tBUZrZUZyie6W9Pc0Q3NHwXGYg@mail.gmail.com>
X-Gm-Features: Aa3M54qec_C2Pi8qcev_6zb3aM3vk4ZjOhmwBtJpitJBxkWn2QAJ5tNJXdTE9jc
Message-ID: <CAPY4CJ6dAt1YGcd_u6SJW6A_tBUZrZUZyie6W9Pc0Q3NHwXGYg@mail.gmail.com>
Subject: Re: [PATCH 3/5] dt-bindings: iio: potentiometer: Add Analog Devices AD5246
To: Conor Dooley <conor@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux@analog.com, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 17, 2026, Conor Dooley wrote:
> Why is there no fallback between devices? Do the different resistance
> values affect the logic? Please note that.

Yes. The versions differ only in end-to-end resistance, which the
driver reports as the channel's scale (R_AB / 128 per step), and the
part can't report it, so none of them can stand in for another. I'll
note that in the v2 commit message.

> Filename matching a compatible please.

Will do, as adi,ad5246-005.yaml.
