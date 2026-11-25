Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795634096;
	b=b0RQwqy/WDkmr1VCnp7vmVobjje1lnTUdIGqPkfTfuKchDuWaC1THfsYLRp5UgG2dxAN
	 5a0GIJzpe60XwEG8OaOrcx8LvQMEsXUWXqU/ikEFpKbjsc2yeC/0thz4CxDfVp4qdhuaQ
	 JJCUITlPlOobvGdPhN055Ln9Ynav4C5M/kfAg4X8sUFfnn13NkygqXqwF6TraLyXT2Oiv
	 X3z6lSmPWghb0NBmbRzUvuxx1Y5FuzqpqPqlIjUBdaHrDNJ7rlwJhrntY1bRAP+MJpyXO
	 9Ji4SR4KOfuiZT9rtry/ZWr7OdQs5VMx7rOaBIhWL0e6bfapkZ2YEbE7bLP/csPXumA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634096;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 In-Reply-To:References:MIME-Version:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Content-Type;
	bh=4Zwr6dBwoEAPGqRmkM3SYrI36353cOO24+3gk4v1MbE=;
	b=IfTuZgzlD4esth5owVkkYC4ZOjg+U9+yG6L3ln6y4pwGF1VGw3BCHvw/iFGGE5BYydQ9
	 OpdtXL8HdQtN2XrocBb9bdNY8h6lVseudpEh8OBbF8Vx6J1b98H9bedFFQBkj03u+dU2Y
	 p34PeJn+GHhfOUpbIUMyt+cOe0MqRODxeQtKWbQyHZTX2GtFsUM7xiW1/d8+uAYcegyCX
	 NgR017qXRqSG9d6LXlMnErTwLUWalYHC2jTbACWTCJXC83KqzrOEInfqyIJJub4KH9iwd
	 3+gItLXvGBbJQ0i3hA2YXwL9PE0+gPKkNiicMWMqhLHwAywgLhm1xnQtySfnaFfcXJA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V2dPPlwZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF62606A33E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:14:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABF62606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V2dPPlwZ
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c511c0e2826so709886966b.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:14:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795634094; cv=none;
        d=google.com; s=arc-20260327;
        b=GxAeqeu7JBXpG7kioyEGTyZ6kdmBu4GcH2PADVn/N2IoIb25HShW72mzfr88eBdGwd
         7F7eh0Y7Pfa8lBAy7nrp3a0WdC5BrwBhwZZGgb2SWE2MmlA3sxhUustE+JeEm5smvAQq
         AmCyjaqta2CjpbLWCyVZSDI+sb4+0EEa6qglF/FebvMAhY1jZ0PG48Jo8k9oebgX+ptA
         czMtMluluyJBweMNt8ynScTh7VIa6B/zy7RTO8jBRY2R/63FFcJVKUaUQJ2FDJuDpkUm
         NyHzJGGWMiRT+fW1g+otMRI7c1jl7Su8YB//t0aEDdjEEgTEJ5Qd/pHCmEQH02dw71a/
         Xl0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:references:in-reply-to
         :dkim-signature;
        bh=4Zwr6dBwoEAPGqRmkM3SYrI36353cOO24+3gk4v1MbE=;
        fh=G7BaVbVnEhtIogcSPcaDYzh/aVRFByoYe/f850VPOHs=;
        b=Kc3wpbAGlitC0BMzhTSFC2gxlB7sG8y19NH39dr5y9OTtNyDBjNvBzBARa8yIRJ+HU
         BOoSfe5cp097v8lmOGf/alDWsKjoQhkPOJNpN66ad61ySXHvmQj5M0Aey/q0sQFSqptD
         rBZvCpe0dt3TcH6Tq5iO7ylEVPY4kcTU/yAty4OtTgQSgiMXghO7vep771Qk6mn36jhe
         hCIbLrgu47ALtjb4ZldW2I2iwQRR42n2wW8YN2dcsUlkT5SfpYUuOWoFizp/uVsvOlaK
         5Ii0qKyVngHXPNhRxLeF1fOTusdK/5KLHOkU0DuwLddp53TfXwMmtL7eA+r32QMPcENu
         lJLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795634094; x=1796238894; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Zwr6dBwoEAPGqRmkM3SYrI36353cOO24+3gk4v1MbE=;
        b=V2dPPlwZIw8RSSYGBiPS9riHjLKCbIKmhGH746G9Vw+WKNGoF1pK34jlxV6OxHliUD
         +4x8KQFOyHBv93Eslcb6ZQriJzQCg8lh+cuxhnJBCYxOkDEVeu6mFhuZ8Irk8YxD7JUI
         P0nrT+QohI1JLu+JiKfjBL99fAacsNfpvOFSzRO2EuUFWuP/NxYQnBYkkbBxIr2fZEKs
         KChRl/Mn72Pp2hAbFTBPHSRIemdxOYB5HdFyXI6WcRruvX4i2bkXwNbHo9fn6WKdOno0
         LUxobXi06oVo37gsBPfVfk8QKYDCnnLoBAUUHoKmqMFM/0Ywp/PVJ9W/q50ehnOTkPa/
         1Z6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634094; x=1796238894;
        h=content-type:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4Zwr6dBwoEAPGqRmkM3SYrI36353cOO24+3gk4v1MbE=;
        b=OOgmzyKO3yOT0zV9/Ftq02OU1caSWXv/DoFqo/gzLhwYru9f9Tid4H+PtQ0Kh3MYuQ
         nzCX5BlYeK4lnljnghPhbB75mI7emKIvkUKcCo4V4YGdPVJ1wr5Ia9ehiu/I6LYY7/xp
         DXDNoa4xZNaointIadpd/BdABE0soWZFtJHF6gfhSj47UCUNhPhqFtfN5rU2U88ixRQT
         DIHD7fZ5r1zM2+gqA0Zw/Y22gquUF8aM9tPM6F3E+gTFOlS0pvoaTRY15jltR7hd4ClI
         nL51oZ27VgAbp36SbaOvPe7Vz+mW8hpiTVaLF+UslwSdNLuItUs7UlfHGP0iez4dKODl
         rB7A==
X-Forwarded-Encrypted: i=1; AL+hErG74XRndmD6FrrX61U4tJIb+M0jgvXe7678y/xmOTSX6NGFrqBOuRHryuHbd+2vF2bXpI5o/s/Cl2DkUb8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8N8PKpe048ePtXfeQL/Un559jz/23nDiBIErnJN6ZBedpLlcn7
	pmSJzQrDOkbogBP6ZkRmZtit04+xf2asjIAqBdXSPhytl/vqDkfH8NlD6nRvle9xLYrtUAOdWEh
	UGMP5Tw4xmbHebEZuwkr24x1u+OapnLs=
X-Gm-Gg: AZFdTZdeKMGKZvArqyVfkBpx7qenjEP1Xu/fhNJXrgAm8GnElLUw6EUj72zSdodpe9d
	p9/elZxhtn9OY1PY+vbL3+f06I4RYIn05SGOWQthR//LUIKGWOvAVOaBKCz+TCFbUvBBx7dGUZG
	c7sjTy01RJWgPuJBNVtMymvORimj/nFlx3MxiUJXg9A6sBJNIQ5Vu9zq+d3lFobeuS7rfx2GhrA
	AKtudeVrMhtPz7qdZ8dO0oxf9UQpM4uUP1pHugfLRQlblDCSJuEsHPTtEYU4hBaoh342/gjjCAP
	YN0duoTLPsLOUdyCrGwwyAmn+ZxtezMJIxps43bLOpAA65cQTiYrkYpNGYJy05WnDxLBbfHkEWq
	JlMLCe45E7flWnR61tVvETusUbw4QoSHYdSRPQw==
X-Received: by 2002:a17:907:9693:b0:c4c:ddd1:d006 with SMTP id
 a640c23a62f3a-c513ab47f40mr1465563266b.38.1795634093898; Wed, 25 Nov 2026
 11:14:53 -0800 (PST)
Received: from 1087654160852 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Nov 2026 11:14:53 -0800
In-Reply-To: <20261126-ymc-82yl-v3-0-e30842671ec3@rong.moe>
References: <20261126-ymc-82yl-v3-0-e30842671ec3@rong.moe>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Eduard Aliman <edialiman20@gmail.com>
Date: Wed, 25 Nov 2026 11:14:53 -0800
X-Gm-Features: Aa3M54qj30q9oeFFdGB4n11RJStBUerkgEvp5gMN6LeWlAY5SA1VjQECSLu4Xro
Message-ID: <CAA4HgYJpBHnAVav3SS0b+WZhAG0ryrJ2icNcV+uSbMof5_O6TA@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] platform/x86: ideapad-laptop: Trigger the EC on
 YMC events following Windows behavior
To: Rong Zhang <i@rong.moe>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Derek J. Clark" <derekjohn.clark@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Gergo Koteles <soyer@irl.hu>, Ike Panhc <ikepanhc@gmail.com>, 
	Andrew Kallmeyer <kallmeyeras@gmail.com>, Eduard Aliman <edialiman20@gmail.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mahir Faisal <mahirfaisalantiq33@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rong,

I tested this v3 series (patches 1-8/8) on top of Linux 7.3.4 (Fedora 45)
on my Lenovo Yoga 7 14ARP8 (82YM) without setting ymc_ec_trigger=1
manually (relying on the DMI quirk added in patch 8/8).

Folding into tablet mode now automatically turns off the keyboard
backlight, and unfolding restores it as expected.

Tested-by: Eduard Aliman <edialiman20@gmail.com>

Thanks again for adding the quirk for the 14ARP8!

Best regards,
Eduard Aliman
