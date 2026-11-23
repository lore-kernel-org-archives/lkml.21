Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455765;
	b=lTa4s0Wl8fabrtmdiAfetRyu84pTjRoTgPMuGgBikyfcpz82Bh+sH16C10XizDfa6Z2T
	 NcHcb6CpF9ZsveFGEbuRMcR7r+lC2JVZ1sIEbvrFLXob58zX299b2COMvughNBZkVv2n3
	 mA8PJyPZO3qbQCnismBXxqOZz6nbpFYifMlDczT61LRuxTJGR2QNX91Tt3jiUqVAq+8up
	 zveTNl30Za9fCbrkhLWItuULERanPldsk4wIENu1wmyHhiXBG5QC01SEfsnyBswAyrgKq
	 mMfSld/ha/yq7Szftxi7ihp93FSitYe4Rzl6x7ZqIZa9C8MVuTdtvYnPkaQtSRy6dSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455765;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=/dhg4VNb7Bf6y22l9FV1//VBS5m2KJB8FreMv5POxa0=;
	b=TCOjXoygdT3tHMxTiUq+nkSWghOS4qweM81FpYL0230THkvkF3UHqOivd+xyFoBrKbAp
	 E32YknmAfweJg4meiTRuuZrVV7MJsw+UzFXCZTobSZ7RHV5crqiCT0eQtaF+hJDhFty50
	 Kqo9XxibVo0no2K3m36cKnWjmBS/GJrS/KlhQBBMCWFk8uGgzEjv6s2ZqitE9z7DtFKuT
	 /X0iXo2nwJBNYtr4Wr/mQcJc4hLRW4Jh9V+8J0/c/fLejEmHKD+YRhdIIRvtjXt7utHgn
	 4xpJa5htTHC7UIulL7lZupbGZVjfnZxfGa33Jc6/IHTuechLWrsPrTcAeLgabIaeIUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E9a5dG0A;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC791606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:42:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC791606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E9a5dG0A
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-71b0d330acfso2734335eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795455764; x=1796060564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/dhg4VNb7Bf6y22l9FV1//VBS5m2KJB8FreMv5POxa0=;
        b=E9a5dG0A8Zas0RMvbh14eJmIiXI7Xw1Wfc1G3I3dW3SQrILdc+q94BfohcPZeHsNiF
         VWNq1BSOcinTp+5s8ErMAw92IhPIdZDhgpTdulX34XX5py62F/E59U4ZyY/0KISGNhH/
         b8Cm/kAc8XDV2YbX4UEBXjMhElcBiEbXL56Gf86c57s1pbkZ1xVpSuGzF/AtTmE3qouD
         LPwv6slg+7UDePPqqKmKKpEnghiHWNsdkl+Bb/ogbm4hCbVcjIBQB68KuB/KdDa0DVaX
         bFXQc+zw6Fhh1i7ZW32Hz6pDRuysg3cqKb1ebkrw9KW2rD7OT90+kXnwuui+YyBDIKlm
         0y5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455764; x=1796060564;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/dhg4VNb7Bf6y22l9FV1//VBS5m2KJB8FreMv5POxa0=;
        b=bsKazTLiXri3tZctPh03ARE1XCiwyBUvuZNXv8RwSUV+ZK/jinW+eapcwJJD6ns5ZP
         l6O/oLNAjx3CJVam6yzHl/CQEANDe01oyY0InDhJfKQmDpUtXC3qh4dvUOg/Iqv4S4PH
         xgvDJ5GhYcFCXLIMDGVK9HqJ/fGUZu9ipGqMKbiHO0QYllXv25N5jl+NaJhR4COeCOsw
         sTqAiAHE5OngDmnM5okFqAYGXa1cEJcrWoqo1X/0EVYG/RdQt7u7IHx8hp5UKKFeBnLs
         OgfFDglImjFmefYLoEjsJChnaY3sT8hpYj10aegqeb6gR3oBMW7gKgratFLSTYi89+W2
         Ye5g==
X-Forwarded-Encrypted: i=1; AL+hErHcPkmnHf/oTu6XiXVZqGwFCTAGEaBUF5230SveZ2CknLOsiwoR8bETBs7/JxZ+RngLsvVGqn8sT+iR3W8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9iCHwr8YGZbjQZPw9dbw/udK3w+2ICd/JRf2jxMPdVelPsY3A
	xII5NM9ylQjxBc4aAhD4BJpRwV1A8LEir8adUEdrvKoi/wJK1aiUf9Iy
X-Gm-Gg: AZFdTZdohDDk9T8zHiZmyITlrl96/PTOjn7veid8MkXwgb/Of6CckGbspeWS0cdj6ug
	nvmD9r7Xy/D5fWBgHTFwQq5qc/1qamcL0hdXdjqwZTw0j3Twk3FfgGKaPIof15LYX9SYGev8iaM
	CuiKMjhR8qNRNTr9cGMo8AtOBVPx7vnVk8C5aGy2lmHje4WRYEYsPtnS6RkT+3gqbQa0c1GsPJX
	6ZBcovIE77g2eY5y9FuYa+GX5Kry1ZQ6Wl6ITnOtc/2+8xqwhREwk+67e4aAy6p7+bQ5PEbPJPw
	H9rd+nRshO+zQ3Fq3OS7hBa7sWdQ9Lpp76y9txqguBcCfvnSqOqhOdonKpnS9bs1E5L2nrkFd2x
	A8j29bvpvo8TxuhFJ7yYbeHwVNzbcnlLf9D5yNN1pi797apom2jgMWkeqynRisSqJ1/rtOadXc1
	pVFL/ABXhIu+xBhd7zVdEfIzBnfnddoBz0nko5NN3Z6E2R0l4JNAGEkx4S2b//eZhl0B0+xzIzS
	hk+vKXuuCLJ8yuwvaUaJhbHzwX3oua0jrkoHno5f/xixFjkNdUqbG4KuLB1M5KxVBngF14AcQIH
	q1gcNuKMx7FypI15agFSvJDVJcMZ5R5GH3LdI5l3AzRbCXWSTv1FiaWaQesOCi5FryBpDM5sVJh
	jsGI3
X-Received: by 2002:a05:6820:2204:b0:71a:e0db:7131 with SMTP id 006d021491bc7-71b327d5b77mr9724862eaf.63.1795455763890;
        Mon, 23 Nov 2026 09:42:43 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8631692d9f7sm9343058a34.24.2026.11.23.09.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:42:43 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: arm: sunxi: document Radxa Cubie A7S
Date: Mon, 23 Nov 2026 12:42:42 -0500
Message-ID: <20261121-a733-dt-v4-1-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122004008.0ee8e16d@ryzen.lan>
References: <cover.1795034153.git.enzo.adriano.code@gmail.com> <428efa99fdd0182e8bc9a2ed88b78d2cbd36fa45.1795034153.git.enzo.adriano.code@gmail.com> <20261122004008.0ee8e16d@ryzen.lan>
Content-Type: text/plain; charset="us-ascii"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Can you please add the A7A and name as well? I will send the .dts
> patch shortly, but having the name ready would reduce the churn and
> avoid conflicts.

I added "radxa,cubie-a7a", "allwinner,sun60i-a733". Both strings
are in Radxa's Linux 5.15 Cubie A7A board DTS. Please let me know if
your DTS uses a different compatible.

https://github.com/radxa/allwinner-device/blob/6d911d1582dcccdb5a4c38be8d3c1ee851019795/configs/cubie_a7a/linux-5.15/board.dts#L5-L9

Enzo
