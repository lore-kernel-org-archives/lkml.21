Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795790006;
	b=z6IJEwK9PpHy+pphFVLMUg0iIICC03dvloBQEoKjU0SjbmV9PFKF4QHxFH8mjjNuta2p
	 j5a2n1tW6jPbIfVVY1zw5osnfYxtFj9/tgl6wH+e1LSot5EKQVwTGxx9I9ajJizIRZdIm
	 2C+vx0xG63CCn8tQQPvG9OYO7uZgGA3stSTRdXctJCwp2nQVaGqU6cq8vZuzBDbOzMg0F
	 TC71ejiuMyz/k6VueK+JR0f1GoCXSvb+ow8lO6ElwV9QmD8afyMVKPinWZ7JOh/HcbB8U
	 I6j/YXtNGUV/t6T+cVUAEnyfVGQ5zBVWwtx4Xg/iJX0/veTF0zXccxBMqCFPeNluwVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795790006;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=4jk+eMtoNzyBPcbPSMP2jejnX5Q5wRK8gv8j2BTbshs=;
	b=AN4YIfYC2p8mcdQWPujY72gIKc8SLl+tTp4F6z9ANP9qTFv+xkcZypznUNDL1RAnO/fp
	 bTwWfv+IGWix4FpRzll5uXUd+5FAsmFC2Ajjm2AHO15ncGC8RZhYNr6C2myJrBXuMJlm2
	 qJ2FzkOx/FjqPZYRvw2SEjb/PQhVu4neGIFYFc4ndPo3xtUDibWcYVVHieaje4l+6lAFH
	 4DQyJn6Bwf5ooY+8guc2/vUSXz6TqLjz82tQCt+4nPwixkwPJW1GIxeKqzN4nu+CgxTmv
	 chcAQhJ+avFypkLA3PNrKMyRUft2LrFX99FrjeTPjUPigZTbd6ZyonTb2lZA+9GRbvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Kh4yhHoy;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2119606B1AD
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:33:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2119606B1AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Kh4yhHoy
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b587538a37so12379002a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795790004; x=1796394804; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4jk+eMtoNzyBPcbPSMP2jejnX5Q5wRK8gv8j2BTbshs=;
        b=Kh4yhHoyRLyamHP4c589eGt6mFYKg+T4DCFz2chTTM2iLS+5BJgzihuYm8dycaqj+I
         D+UKNRnLeHIZdIY/Y3uM0He11I7oK8XERH+Dd51NTF/1SOfYnGyaBxSQ2sgAauQrI3JJ
         zkqBx/uP/8Y/D2R735Kbyoa2uVQRT680ZyUSO6O/OoFkfSryNOU8TtTB1iSIeSuqdGsb
         WIw2Z3oRQJS2zsXHiwiQgEC3Dh9gGMUa+P3DS0GD9kfQZu3FTWYp18ijl0xwON/f85LU
         dKCDMPu7PDFm/gm7Xlal8NbeYYPaao0MhoOWVsFcssb0EU5O4EXz46Qp6dJys14hb/mQ
         kbaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795790004; x=1796394804;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4jk+eMtoNzyBPcbPSMP2jejnX5Q5wRK8gv8j2BTbshs=;
        b=b6pqJtNEdTTmS1S8lroSiCrSNPxU3mYhHAs4dddI3KkGMKJFnx+5wJq3lQ7eE+JnDx
         J4yUiFC5DgDTfzmCh0LRsVTpWyEsmdAunJxtBZOt+RaNeNxmhjivz0aGWxYek/hkEijH
         Hx3l6wYGtV+Pp1uc/HeZa+CyCtlK7+7aOIhQnEfxdpaexzvWZoPQg/+lHkOUk6OewSa6
         TWL7IO9XRFbi4T0K0RbEXi6jK86JYrJvRo+G2kJgWr9KDv3m0RFk3I1v9QOGg5yhZ8bx
         4od59EtIJqGV9deMvLZGzE1vOewFVzMI54PXU4zFRzPuD901lNLf65FrLxDFD91KQV0a
         CRUw==
X-Forwarded-Encrypted: i=1; AL+hErHZdzZR0Z29X6Ipk+A7mbG7UuGVF/h4SfRKKtNT5MUNEC701TpdZu/mmoI9umXT51yypNk6nJ+WJyw0kDw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EPlO0HO02zu5wLruGuhJ5z5wgpP6oyr67geEDXz5PQCSkmJPq
	rwfKhoAMfXqmNvECopBvd9AdvUG3A8taKMfFNTRAQsFGsgUffTDzKy+/CYC7Pvfnyr4=
X-Gm-Gg: AZFdTZekqXy455gv6dNwY/2eCiRr0+kObNyFe7YBLnbmuJLtF3cfe/BEq80MW7ZJxE6
	i7WzIcP+kFxWDoed1Ymoz6M0/7mKH7g/T0923LoKRqcgyJFyqBS0alS9sBCdIPK5XFaFRy//90p
	mLaI1arqHZqG4/ARcuMzXBSoer5J5w1MXmv3f2MmPsRmT0YAtepRtuVqP+a/uUa97NZ6SlyRs2H
	lfXug3XTB/PkSEsCT4mJs5P7dApAqikmyDax24O8RwGYG6mNNfsWwzI+eyD5N99Pvwv+VtNHpP4
	Y7gaDMRtw2qRaTb8icuVRC13ivz7+aQM0Do+MxO87H1D2xroLQMGFA8YatNgui8v0uXCDVmWf79
	BJViBNPh3e4xoyw7P0SmZbEy8mpSDe1lhBQ52pXmiwsjkphaP4GYgswC2BxtaYM5Ex3U99AKDct
	Y1GbrWgPQKNdrXemgwRJ4k/5dt1S9BgJTn46MJPy7VWmh58XsFuGVZWuprDt37a1QGVciljn9g7
	hYj8l8VSkrplhSx1qxSH2VMpDQfPlZQaPS0ZpfZUpET2/A/CNFvB86Bvp+R6A3EhRyvHhyyGXVF
	F9JSCc2BKBnffjMIWGElOrJTmPRMuerdBhjvbiXZfQW44pcR
X-Received: by 2002:aa7:c4d9:0:b0:6b5:9731:90fa with SMTP id 4fb4d7f45d1cf-6ba37cc0ad9mr13284812a12.6.1795790004077;
        Fri, 27 Nov 2026 06:33:24 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb9f8160ecsm72961a12.15.2026.11.27.06.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:33:23 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 openbmc@lists.ozlabs.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 stable@vger.kernel.org
In-Reply-To: <20261124-perso-ma35d1-upstream-clk-v13-0-c920f4a9f0ce@bootlin.com>
References: <20261124-perso-ma35d1-upstream-clk-v13-0-c920f4a9f0ce@bootlin.com>
Subject: Re: [PATCH v13 00/10] clk: nuvoton: ma35d1: Fix mux parenting and
 peripheral clock rates
Message-Id: <179578999837.3130490.1321256774164046797.b4-ty@b4>
Date: Fri, 27 Nov 2026 15:33:18 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1318; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=/kkh+STkW16bo61fnrALXUXLopXwJUn8icTeFUDyuzM=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmcUzaJnLvllxStGv1dWD2t2zaPaXOLj2dHvMC8gu0yX
 moGSbc7SlkYxLgYZMUUWWq4q8XfSWp9mTVd5zbMHFYmkCEMXJwCMBGnfkaG06uzPxgxWazev9T8
 nBznBSb/J5mvX23n5H1avOdw6kn1AEaG219YnyTk+92QXLDoc8rr7wv2Lb6115HvlPH6mBXGqbP
 SmQE=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Applied to clk/linux.git (clk-nuvoton), thanks!

[01/10] dt-bindings: clock: ma35d1: Mark HXT and LXT legacy
        https://git.kernel.org/clk/linux/c/5cb3fcb3a35e
[02/10] clk: nuvoton: ma35d1: Use clk_hw pointers as mux parents
        https://git.kernel.org/clk/linux/c/4df94650b44a
[03/10] clk: nuvoton: ma35d1: Avoid possible error pointer dereferencing
        https://git.kernel.org/clk/linux/c/88997515be60
[04/10] clk: nuvoton: ma35d1: Retrieve HXT/LXT from DT when possible
        https://git.kernel.org/clk/linux/c/4154c8b3d3bc
[05/10] clk: nuvoton: ma35d1: Reparent the gates correctly
        https://git.kernel.org/clk/linux/c/1c2214475dce
[06/10] clk: nuvoton: ma35d1: Use device managed helpers for fixed rate clocks
        https://git.kernel.org/clk/linux/c/c31aa10b3ca6
[07/10] clk: Create devm_clk_hw_register_fixed_rate_parent_hw()
        https://git.kernel.org/clk/linux/c/5093f6f2543f
[08/10] clk: nuvoton: ma35d1: Reparent SYSPLL correctly
        https://git.kernel.org/clk/linux/c/107caca779a5
[09/10] clk: nuvoton: ma35d1: Fix CCAP muxes bus width
        https://git.kernel.org/clk/linux/c/6f6ef44a950a
[10/10] MAINTAINERS: Add myself as Nuvoton MA35D1 clock controller maintainer
        https://git.kernel.org/clk/linux/c/350f54ff5b92

Best regards,
--
Jerome

