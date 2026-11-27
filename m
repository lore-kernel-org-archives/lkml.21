Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795760660;
	b=aSjg+SrkDj4uKmNCR53xLxSH3I3PoRYFOIkT/+pU7hlNAqZkp3bbKhZKWpxJjuJOHvuZ
	 tfMgDJ1xoJH74scA7Iu1uswEmDyrqjRC9QD/cH41ZUZVid7EpYPDtq3QutATQH5wqiRy5
	 J1Z6+jfrUDVns/RrUjPJT5Jpoeo2zq/CxiPq639aentct/z9lJDOEbS2/jsOC05yyG+LP
	 9+FNTZKXb1d1J0n2hlDbbRFqHS5cf6XwyIRzA7m5FGRcvZp9yOK9H27Zo6MrjUIM3z3j6
	 KlR8WYq0R6gR1lB52dA6N6GP20PSFbITt2POhedJXzwhwvZnLGhzKI+boI8/0tnbqIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795760660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=SBkZFZAfcEuvoK54tInJ2sdXwGuJlWuARWjKskeguWQ=;
	b=cceS54RXd4NUmt00Qb2wVla+Gd7BHc8waXpxwSL5YOXWz8B8fPL+MvpGmmu/WbS3hDkz
	 s1PnMfnv+QFdW8tGAgGHQAdoj6JYVAQOX7pBzXClvU9iQsTrBg0Qvvbo+/phO21QNl3la
	 f8D94K9XyJ1fxNcKb2KezEyJeq8HoJzyOHHqGetCiMl3hbE+NlWYjEEGAoD5aqENQDbcJ
	 J4dtFZYWtO/uM6If8E7ExhR4+8t5AIJFGp52dgmqKFYvGlBVvX4oHkxVTpL8GpLci50Mc
	 9V2dZSUIRKYxHIqV4dssXE5A5D2Gul7dqDcGiJCWPu1yUcKskmSordoL7HzF/TDDOIQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SIET8682;
	arc=fail smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73981606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:24:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73981606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SIET8682
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b86bbbe954so1203638a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 22:24:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795760659; cv=none;
        d=google.com; s=arc-20260327;
        b=SsMgfUeI5R43LG0IZTZBCCaMbofyXPYkgy3FBqc0cmn+uKcE4Jotq9qHMVcW5AQ/as
         Q9SAuLCaYR3Vrnwud8yU5r8d6o2lZ8dsyq4/EsFia0Ctf0S5m/w7H0tdy8hZiUQDEaYF
         9AYmmrkWTZ6mz/VGMvOPwIATtOhnXrYVyWyddxPNGBmjPB1r4krmFMMgqiyiU001IHHH
         vXgJP9Ds3AkBagFp0BHgS4BuruVLsZ0ROgdeOvIarqoKn3KlTsKWUzuihGW65n+gfJSc
         D7tzWpZxa2vnki16gPwRpsTvUAOx0C0L1PzZFokXriDJm3lNO+LVynPP1kaRP6M1OGog
         218A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SBkZFZAfcEuvoK54tInJ2sdXwGuJlWuARWjKskeguWQ=;
        fh=iigqfIRDS5TiRL5evE69e8UFxs/5nBXZ9Nvk1pQsqzo=;
        b=d3eT+yRv9D3FA5fpo7wkVA+ckdKMjZJh8Re8PW4/02QKU2uibADSWOn2dvu3QDP6vR
         /Ce+o//xL+HUHP9hMIAoWeRpM/mHmkooO4rS+VyC+L54IHl+iOm2FYTM54yyX7HVOA0j
         R1LqOfTTUfgz9DqB/ZOMc1CjKa9IkfSi5Lsmi+CF3Kz4EQC8Pb7JHkh0/gKHRBb2kCb5
         fodvzrxYusNsycIFIWkkHVihbC0NiVi/O5hEV4+0a3++J394SPE5l8FE7/GrinVtLDQi
         uPsvUwXexdQns5ijAr4RkMm67JgzKvEZPfmyzSnb38NKUDpUEQCGUoX3mdhOATYudHvM
         FgdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795760659; x=1796365459; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SBkZFZAfcEuvoK54tInJ2sdXwGuJlWuARWjKskeguWQ=;
        b=SIET8682aKeUh888hyfIpEH/QzKiNlGQc0MTfL/SL4JkjVKDOvk8LzFJBhoaBxgFmM
         MJFjqn7gPJ02QI1+6cJbGlCgI5Zx/k9CVnuOfWcpGJWasMjHEKyx7tTAgUWcoJUsA+Fs
         EyanKaHO4aqchLXxuAHPfytc028RXiAg4ICMRmC3AsJeuMGqQMKN7Sb5D6zCfZsNUCnb
         DjsiNUdEmjkpy8JFkFDQ7m0xgNeUyxoWJJFLTCR3xnhTZJGjp5+iYOaGmyeESTkbRCvx
         fgiRiJ7RORyG+Y0vqOsDZ1Ai8wjbJCxCzCQmZzdb8fBYZBjroYTDZh/ZJnc+eaNyrp3B
         P2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795760659; x=1796365459;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SBkZFZAfcEuvoK54tInJ2sdXwGuJlWuARWjKskeguWQ=;
        b=0JUQgqHiBopWpBAG4X8OWVjRBr1XgAHX4sXOd+UKoLoaa/TvNtlvTm7UG8/hxoqlKd
         XLj6AAcj/fSe0sLCs0qQLSxTgQBC4qhLBG4WplV7vl3U2Agmp7n/JBedq9/psakVbvZi
         Q4YkhjhmQpSgD3QcBhQOnaHqW+TLXH94cheDrJTkJBVtRW47lNt0Fz3SbXC2G2j0fmOD
         iFh4xtzWSrDpkisTstq4hDKOx70d76yaXtY2u1wAqPXI/1P0Xs0pvZbfc6BPX9MBN321
         uLAZ2sKKYGO8kBIY35cKc6Wq/lFr8F6S1ceCvLSGTEXAAfQO4wa8sanFmw3ZuJg2wSVz
         jMVQ==
X-Forwarded-Encrypted: i=1; AL+hErEXan54PUrz2vMhskJwTUhyR9ymyKAxjIfFJVsQTETxswIB3S8gNT2FJ0JkAMuIj4A+ZpwtuUAjbUAe4cg=@vger.kernel.org
X-Gm-Message-State: APuU4Z83bijyl47FdsUwfzSaRrHtQc48h9D+QqhQGLlp65XKhXQw6gvI
	1UOTjEEQzGtX2OGaYxY20vzpOBofBaL+9g+Bn1aXnJg3a/cw6ZSkduDBFgyUkIxs7iBcHINRPvl
	14AkwvX3h47W2bI5Kjo/kNUfr6uTQ1Ho=
X-Gm-Gg: AZFdTZfZnG1eEk/02/QRUinWmPYahY2DH/epbmRNgYvtey3edx4eT288mUzjSjpTxQu
	ukKyT9ZlXMKlmCRQKPX45aK29QzkYdNkln4hSjfe4cy2Bu81hsStRD3oXlP9NjKNUZKQqMhlnQB
	Uga2BaeeBnoBVBmgWZaY6h/ql6Zqt5Ofcc4uZgMSE7bKIqrRbQ+ZDs0DjaT3KWiYWtq/uMqSnbu
	ipzKiKvLyKRSTRUnV2hLEtfW6wXz5DSy7dsWkFH1iHVgcqYt4lGVVxaon5hJ2HtHX2KoZMrMvQa
	H776jfn+k2rhnLsroQ2LXFLuGqO0DEDhFu+iCLAlZLxn9hAZj+hm0cx534E+bjOCwNfcDfSqFUm
	FvzfNnpcmcAkcthQgbwmoH22pPxZLgpIFUqcoZo64AqOkkKU9kx/MZWza90Vfi9G80m6htJI=
X-Received: by 2002:a05:6402:c521:20b0:6bb:3e3f:2cdc with SMTP id
 4fb4d7f45d1cf-6bb3e3f2fecmr4072358a12.2.1795760658224; Thu, 26 Nov 2026
 22:24:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-dcphy-rx-v1-v7-0-8de1adac3a74@gmail.com>
In-Reply-To: <20261118-dcphy-rx-v1-v7-0-8de1adac3a74@gmail.com>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Fri, 27 Nov 2026 14:24:06 +0800
X-Gm-Features: Aa3M54ovbh04_f0CIR-_hXe0njTveJM5wqr9aBZi2LAaLZkChYM5oN2Bhm_6rKk
Message-ID: <CAPwA33K7f2EbtH8rqihnxB8RkB1PzJTmDyGJ39ojROuTYwK0Dw@mail.gmail.com>
Subject: Re: [PATCH v7 0/9] phy: rockchip-samsung-dcphy: Add the MIPI D-PHY receiver
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Guochun Huang <hero.huang@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi all,

Michael, I kept your Reviewed-by from v6 on 6/9, 8/9 and 9/9, as the
v7 changes there follow your suggestions. Are you fine with keeping it?

For v8 I only plan to drop the Tested-by tags from 1/9 and 2/9.
Please let me know if anything else should change before I send it.

Thanks,
Jason
