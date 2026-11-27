Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795790480;
	b=TifAyTUHXF3xs+VxrtYWTnpmi8NvobMFYdbR5M61r/m+yqxOHc1zG9y7CHbYsm2cHGy/
	 +PwyA+1hsW26hyY06nPlV78N+cd035l736hVwSY4h3+IdlJFvJJCdRHDfsQC/LdVlMXva
	 h2gH2nktAZZf+oa3lY/X4zhFPZZdFir9qLjYKUDvD43rs+opV0F4L7jRSlESh5w/1gghN
	 vkksvfCIwGJjFjMhPCtphyOZ3CFRNLc2rPFljq3LS1SySApaD0hVr0luDTmbdeFSKn4kj
	 JR35tVzOYKhS7mW00r9BW/LF3rvMId5GVqwyYM91kl2agaEqgAp6pWNQTy1WCRRb6gw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795790480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=1xAA2Goyp0+/R7QCDqIjCUY9e99g0trvUh4YZU4vu90=;
	b=0W6jjbN8J4CiMRonyT0IWaLBnRAFBmogIf6T9RdXnS6ZoK1TWVoQF1P7yyTM/JBaZRAC
	 tdD4SoSRvoeVIGkKcFln1u85N/KJa9ZbkAE+j8iliv5Y/6gkxZB+UQEUinaF54103UacI
	 xv/VOQYEusrJqs0EWOG5FSWjcQYVhlavHJx3S47TfZV3JoNX+YghiFGsdNl2X3acm+8Dw
	 lTJsEmsONey2LLpCslDJVzXRDtTR0D5DPRiOqTffK4rKZZK0rfKMksCDfGoYQYqvA76e5
	 HSnHBa1OcZsgBH87a+QVRo5hTvwCHK4oEVrRDSZRFedB9S1IjHEavXVYpJom9xm29eg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=LHfcB0pa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A289606A33E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A289606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=LHfcB0pa
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4d427836e9so1077977666b.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:41:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795790479; cv=none;
        d=google.com; s=arc-20260327;
        b=GBEo0HhGLKdbDcuVLBWkXvIkT/oOk8+kJAjDB47M/NWDQBZLJjbd+zmRHEi8tRXdn2
         wigu8Sn3GurpBOjlYrk+vLPiDD11UJFC3TXS8J2Ilc99nCkgjHazQI95doseIT5P4hJ0
         /OIzwdZCj9O+Ygg3Y1GWlydF4+sxrQo8tTxVtIN+t/j8lrvcpAAZceWGGJ/pT4TOsekW
         t2P1E3gKS/yg4p2yNeL8RHpvaWyQ+a3AICBL5hYqoluzfZahEIdTQosxxFGpDfRHQQzO
         cIW4bKu+AB2cndsP2EqJIEDL4f7cB/nJR+bW87+Q1hjyPTqc0YzxusOpAIUttBdd3EK9
         EnoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1xAA2Goyp0+/R7QCDqIjCUY9e99g0trvUh4YZU4vu90=;
        fh=2q84zW7H0morvDUTgI4W9nAKM1Rc247EJ00S40zAdAM=;
        b=DgvTOyNoIXKQvfN13Z9Ln27mtKx4rrfVlyc0tYrDrOl/Y+LdYqdvp4HAzPCBrZBFy2
         gd+UAGxcEf0+NiN5SJokwLxiF4YiBHU8whwB5nt8dzDwA+zLCzWBMkh5sEzqb2pT44o5
         M5s1z69k4U24tVeO4p4Dec94607MPE2g4IBCPa0WWk9kaZATA7rzh1stNHAxVe/YcCTY
         YzrK62iR8tH9KG0RAxP1RqiWN5HHS9vy1WP2WhIK1MilIH7FIiQtMm8JeCv0bzpESd3b
         lcNnGM3IsiiUkAJRGk9E07sB+OzVemuZAmv4uoRBD4vhzZpTmtxoJfTDVru9XqRBSjfb
         LIDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1795790479; x=1796395279; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1xAA2Goyp0+/R7QCDqIjCUY9e99g0trvUh4YZU4vu90=;
        b=LHfcB0pa9Ab7t7V5ree0LguhPCVLlgg2YVYz63+bEkwiJyWjniALgiV+VY1f+LDElB
         InK/6q7KAQPVAydVOQ6A4ZP6uQ7kBwJka+DdBeq4fTSGLzLnvRmlagDjZ1L+OYp9ykVH
         i0muj6dUr7iSzFw957h0/294/PqZcgMnfY0+s7Dexyz8rjbTQEAQlYf5o7n89hQPMde1
         TR5LIiH+LrHYKfF+Kt4y0p4AsI82qeIVXihhlj51XMNtV9AcpQmx+gwAKsfoXKueGA7I
         o+DHJtdwzc2UC27L2qVBjsVO2jDomfEMDfkK62o31ORctEkaEs2+pELR3DjfBJ6Gfur1
         O9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795790479; x=1796395279;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1xAA2Goyp0+/R7QCDqIjCUY9e99g0trvUh4YZU4vu90=;
        b=t4oXoRpdLsJ6K5klcyobo0Xn1QZTlEpBrrolWIiIVr3dddh26/iIDp7x3g+LVhRdlz
         2nCxBB/ml4V8sUUEwNaCt6TC5qyIE4xNLRlzs3tbjX/RIpdjKpnn2i1A4ULJKZxCyFMY
         s1VFwWoP0zwTYvJNaG0cmA+k9CVWDoEJvC1mHymRnFgMWE763ym4S0B4yWo2QhTk5VjB
         5ux5bf381pagEpI4juUAwr5pfVbFmA2SecFv8sjSQhkz2icYymCaNxjGCkDQtpx7rf2V
         z/uhSpOdZVbladfQMDeCe+sIdesRvd8enbrFY3mWX4rsQqSWpEjZZNZ6SuAPMfqgkXHg
         ukjA==
X-Forwarded-Encrypted: i=1; AL+hErH9EezT7hGiaJGWfGCvx8HGDAED+G+c9FR95o2qHg5mHY16Gjcm00CunFws8JCJyxIC7JhsNP75FFDiuxA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9F9vZaXtcprVsA3PUcz7Rr8IoumZBUlDcLYl8NBolDB8YWUqZY
	K015+lDRntyarEHLMhCjXyYO/xz/o8d9zd6E2I7HhSkT3iBWeVAcBppALJMpkfDHrVF+GOIP7Ha
	qFLpikKsC/6XB1lSZvNSEHEYh0O2ViWL7wuAvXFX1Fw==
X-Gm-Gg: AZFdTZfz2cLIbckzzI4f2s71RWxesIV6SW7W94iXNXsES9ngrlY119xR9q4VrcQu3Pk
	jbBsw6vC5OBBNu+tHYdtfATa70czqvwuZOcf9m/pHskd3HMQF1FxCiMgbBW4ViiEBF3ZJ8pgYwO
	sdao7zQ9vz+gCGfoTSLwuotbr18itFwxBOWKPJeldAoBqAUCXgDirRwIkqXiroH27jIgB4berFm
	VSOIXE57YgSukvb6BrgziZcYAwkXCA8UEiKQnv5nDVk6S43uIvGqtwk1MYAenMxJDy2X+iz3lby
	MKrnunwBfcZDuZIlQjIKjrcCwTvbXtghk5g07raUPCRbWHWApo/FmhWUTxEEQ+fFtaX6+vgWamn
	RtBQkDbOLWKj6qT6CTo5C+S73Ii7hAmhnISI=
X-Received: by 2002:a17:907:1b0b:b0:c51:e06a:4744 with SMTP id
 a640c23a62f3a-c51e06a478emr187991766b.7.1795790478468; Fri, 27 Nov 2026
 06:41:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123104236.4179425-1-rmustafin@cloudlinux.com> <179551712630.3135.52212996809224784@kernel.org>
In-Reply-To: <179551712630.3135.52212996809224784@kernel.org>
From: Rustam Mustafin <rmustafin@cloudlinux.com>
Date: Fri, 27 Nov 2026 21:41:07 +0700
X-Gm-Features: Aa3M54ridbYcbm90XHp9x2LSe6zmQntTNNJ5b4vHfgqbclmUtnKlfUB5zVS6gIA
Message-ID: <CAG6=z5vW4aPe9f5S_8m73oKvEkxSZySc7tJJo_hbK7F-bL3ZJA@mail.gmail.com>
Subject: Re: [PATCH ipsec v2] xfrm: use the frame's own socket in the too big checks
To: netdev-bot+sashiko@kernel.org
Cc: steffen.klassert@secunet.com, herbert@gondor.apana.org.au, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, netdev@vger.kernel.org, ipsec@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 24, 2026 at 5:45 PM <netdev-bot+sashiko@kernel.org> wrote:
> Does iptfs_is_too_big() in net/xfrm/xfrm_iptfs.c still have the same
> mismatch?

IP-TFS has its own output path, which this patch does not reach. It is
fixed in a separate patch:
https://lore.kernel.org/all/20261127142550.66326-1-rmustafin@cloudlinux.com/

> This isn't a bug introduced by this patch, but this branch leads into
> xfrm6_local_error(), which looks like it can leak kernel heap memory:

It is pre-existing and this patch does not change that path, so I have
left it for a separate fix.

Br,
Rustam
