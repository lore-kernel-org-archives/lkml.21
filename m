Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514783;
	b=VO6+YR3+QY0sPsMK54NHIQ/SuDLYRecBymiU0jSLMaj3bxjNxFFVBtrW6LjLn4yEiR2W
	 OHVjrJvB7ZUfRBcFGg/S36V7QjJIETDs+J+OAUdedG6kODpiix28+ZWiEJAFQYnwxUXOG
	 +OZ30hn5rXIQwmnsaGJ7JXSNfaCuXBV4m2eqtG1BrWDGdDKgoE2bAxAKl1Yng69Nk0pzT
	 XKyJHUnFPVrjz8e3ufAORRD7TIxK8mkay0hFCuV/cg9068KFIxTdvQ7vMrvw4Y/i9fQ3T
	 ELKdr4WFiVWA3C92f99twz+4lDOC0U6t/ndjwThP6RBNSL6swjnpn8orb4WOjMLvQEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514783;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Transfer-Encoding:MIME-Version:Content-Type;
	bh=HKyC5Y8ArbHevJ7+3eNbqEfUXbI8Lmcn1USmOAduUL8=;
	b=tmpiU/OAfVu00cemC//wUCoPArq2OnuS3LraQXV2GfakY+CoY6TTBqdhJs8yrnI3QQxf
	 KvG61TwxtM78liXjV3FTRWM+AzW8f84kNRlk/LkJXdMei6sWzjOgNn1nsMeh8SuImbENl
	 EQD+GZZlUe45YU7qg1T4S0zTXqhmL4c6ld4Piigfu1zY83WmUDKXo7VX3Hy0ICRswoZKV
	 gO00LFy6yaapltG2vyOVKrGR+x9Q/3J/RKF/5kU9hR32IE/OAQVR+bcT3/aylqwiiqEmT
	 JYhArAsu0CwIiDTvW6+x8qDpk9A57bCbO9G+rxDOQ/VTmUatTIvegzR+tMcfg07HAjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mZgY1IRu;
	arc=none smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1076606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:06:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1076606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mZgY1IRu
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5c148d4dbfbso4141789e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795514781; x=1796119581; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HKyC5Y8ArbHevJ7+3eNbqEfUXbI8Lmcn1USmOAduUL8=;
        b=mZgY1IRutbfxoEyOQvSGmKLJUEp+Eu6JolB/hRdVFmprzU+N56r0kuBCzbaGeoC1Kr
         E1leuNmYvr9aamFFdNrVl9ezKqpJU81J+m1rFJ6zT4rJdddCoK3/67Z0jGxUEJmH+51I
         f+7qcGFjjCXKtibJaZulYEU8kCXqkEugCSd8o2tP4/Agdf4Sa4YLI4ylBQmucH4xI5q7
         RpxgVmlA2zyQZGwNTsUSlXWjx/AgqmY024OBMY3Ri/UOKpLBaBt6jA4iCpLda0RdjcwX
         i5czapbYLURJq+GvRGG85QrH4G42nkyth48LqTS74ywvIO3EdQKa4ZBRTMoB3CG2wyd3
         SRsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795514781; x=1796119581;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HKyC5Y8ArbHevJ7+3eNbqEfUXbI8Lmcn1USmOAduUL8=;
        b=ZKppvFaKD8It9yMWc6T6uBwMws1SrcJOmEWGOTh4P4wDkAmakASaKPlpzzB+IUs0nL
         RTZAeJK58+qRTE4NV8A+FqhSoZuQO3s5ZuqrEWiYLzQZN97Pxy5j7pEVpRD4gF21TMmU
         F1/ImCwf8FlGJTJ0QQeBJW1RokPwhtPyBPPy2JxgHuXdlc1DVaWKNijKbeIoEas9V7QP
         TQuItDMJrVa9mgQqIHT2aPzETKjO6oK5zOLFus5SIpDFdBw9Zbt41MOxG+mBsM85Zydg
         0IA6QZ+V7qPPe9GHDJjEDuF44ZrL797cR+K/cWf5oTYapWpD3HBP/KOqnpVXIpeTWaJY
         9bcA==
X-Forwarded-Encrypted: i=1; AL+hErFDo3dX5WlPKq48TBGMb2wYxFXdOdXTZ9uXFKOnoGySNSZovPPACKKCTel9WxSLRBlH+GltNCMAiKXCj8M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cPKFOTYfIOBZQ27NhHh7MJXj0zaumtb3gQ3hVD7eyRzv3pQmU
	f9Bj1Gdc9UTHihXP6bn3ZUkP9bILKmEaywzXV388bd/TwlQ7Xr1fPIUr
X-Gm-Gg: AZFdTZe8LYpqbiuZo91If6K9mw3zi8ptuE10246hAmib3h/szMSZG8mf1BubDyQycKM
	dMO5bmgDPNzjOYf0Pj5cJwLSdGWs1hCMu4RhyciiPAG7Hal/EnfLtkgFPSPk+2sXpzJZn6WNjmN
	xc72kI408CmfJH/pSV6c0edegxRCNSYI5de2iwsCTcNL7ZlbGsABHyIUO/OMQjVcdIZr3kWHdlN
	d2pAaRTi+6m3wE8bgV/P6UFzVJZEiGEgNqZGrIJbolDmrBQ8laL8T1g380TNdYph/2t1jgJ7k+e
	L9bgW0vRraA3qGpZ9Laep9WK3VhjgesTA+mzOnmdbFrGtNarui/0315YX9PIKgqXTtnAaaT/Sm7
	b3d+p3ku3UfSXOQaeNcp72RoCJJstXCv2HFVhT6foYD/KpqxO6VcDnrsfwwFikcl79OaFXnJtpX
	snS4xqjpPqZSF93l3dG0pQBcY67jIi6HTA3qNZq8JU0ZU/6S0HEfi58xSPcOVGMytpHf/KB/JXM
	EI2Rx1jfFdv8owUj/C5IYY2I2/mA7ribCi59Gst60Kg++oCdZP7zdRSd6etakHYa850H97iw/2t
	nb8kPfewklnU0vG4tkw67knsUcalynvmCCMGuX4FK5n1HYm5S/Crr/U=
X-Received: by 2002:a05:6512:3b08:b0:5c1:b29a:1ba3 with SMTP id 2adb3069b0e04-5c1bc7d5ce5mr5731034e87.29.1795514780815;
        Tue, 24 Nov 2026 02:06:20 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd01b423sm3627942e87.43.2026.11.24.02.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:06:20 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: cs7542: Add global PCIe controls and network
 engine reset
In-Reply-To: <9facd8eabb9d0c2bbe816117481dd624aa8c1f04.camel@pengutronix.de>
References: <20261124-b4-cs7542-global-controls-v1-0-12548785df2c@gmail.com>
 <20261124-b4-cs7542-global-controls-v1-2-12548785df2c@gmail.com>
 <9facd8eabb9d0c2bbe816117481dd624aa8c1f04.camel@pengutronix.de>
Date: Tue, 24 Nov 2026 13:05:40 +0300
Message-ID: <179551474060.2.10541952676329766668@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

Hi Philipp,

Yes, those are seven separately named bits in GLOBAL_BLOCK_RESET. I
haven't found a hardware requirement to change them in one write. The
vendor cs_ni_reset() toggles bits in a different register,
NI_TOP_NI_INTF_RST_CONFIG.

I grouped the lines for Ethernet teardown. QM can still own RX buffers
and DMA-LSO can still own TX descriptors. The driver checks that all
the blocks it owns are held in reset before freeing those buffers.
The -EIO for a mixed readback is how the current driver detects an
incomplete stop. The Almond+ tests exercised the grouped sequence.

I'll try exposing individual reset lines and checking each in the
Ethernet driver. If any assert or readback fails, it needs to keep the
DMA buffers. reset_control_bulk_assert() would deassert earlier lines
on error, so that helper is unsuitable for this teardown.

I'll also use regmap_test_bits() for the gate, drop the redundant ID
checks, and move the PCIe assert, deassert and delays into the host
driver. These reset bits stay asserted until software clears them.

Thanks,
Fil

