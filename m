Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516329;
	b=YL7mPNKdYQXeacn025plkRxiLg1VWreFCR012f5iqQdhZcYz4uxhEksjzdWYW/qdHALA
	 v63QFyqPUwWWFcMw6mmLUJFzPDr8pN/RYFw7ArXnjTBc0/POuKopP0DdOkwnYKtNNe9Iy
	 8IezVdqGJ7WwRPJkXQAp4qCfyjtWHaqUmCqeRyX8B1teH8qdSnqyobejFEjWoZIyWyiNr
	 r5m5kV3CGFu536+RRLDvH60cjF9461v06h5IdmSn3AReyFuTeKyHXJ/x/ZsuDqd0g6Z6+
	 PhbHSCDEABJUllIFZ8pfTxFv6kGZ+wKWRvnsRFtHCOEUibZa6jQQpke1Q5rH3kSXZ5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Transfer-Encoding:MIME-Version:Content-Type;
	bh=L91r7jLCdgBrVDkCLs5wB8S82AZQlItQYcCNZU9WUC0=;
	b=x5CsmNCrtblLHMRkc8F1E1RArpdhXIK45YeNd8esnqHXniCWXTrtNSnyJuvKZaLzSv2o
	 dNdmkZjuoYhiyDvzqzFa1P4KaABcfwEM8owIe35i309O+M/wU64k4qjc1U9esvSNwN2aM
	 FA7bGzGnw5VC9NsHcXKo7QtHAY/EYrVMi3gI2j9dpLTAOIh2+pKlQ+9a81yAZTlVrGkVd
	 UmpzQgf56z4V4JBZXJrWcBfBUlryPykzxkZy/1WHOrchQY814zk8/NAvy0nAYXejsZWoq
	 blLr3fhjlMU8qWBUJJ5P/KlKd7jwr4INYkDN/uxeBugh9bUg4LKMIupEWGYogZ49H2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jxYtZjny;
	arc=none smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E5C606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:32:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24E5C606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jxYtZjny
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5c1c0c8d61aso2766720e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795516327; x=1796121127; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L91r7jLCdgBrVDkCLs5wB8S82AZQlItQYcCNZU9WUC0=;
        b=jxYtZjnytvxvCfLSD14Mjy8gdnPqOnkGAD8oV/RDjwN3Jq1OKzV470i6aqaho1R4rh
         4Z5JCBcHy7QYAFrknXmkiKXtnooQS32SNGm3d+o3kZ4CxPckt1AntXrrsZQA8v3zafII
         dILBm8eyY4rqPoE5DEZJ/d0foS6n5PTS5uZxJMgx561EYe2xox8+Ib+COdeoMEwORsvK
         MnJJgtI+PTigIutZQkV3pJFaRYKImIsbYr+FfeaASJaIfcYsX45nG8700Yq6VBixF8Ck
         njHV6e+E5HJLJNBUTM/UUnfa6gEKDmKlNE+rnTeoP64AIsVFQec+R1Zqg/WCrAOrTqeA
         87wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795516327; x=1796121127;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L91r7jLCdgBrVDkCLs5wB8S82AZQlItQYcCNZU9WUC0=;
        b=eBPeccUfQbSEXx2rgAGH0XyUPlBBrzZir2fOExeceOiNqnlQHgtYQg58N54lyvh94M
         owajYAJeo9DXlgARZ+wX8NJKnhsewYRfGls/C3rEY1e9p7danwycbDvB1/QZBML1oysJ
         OmrIIjtRDW8eEZj3n21xBepRNFylYbjXf+c5cYA8IQrfOeliTm5V+CiWphIie1dRVif0
         K+sEtQWaQ6UTedx+OJr7FmtiNqrb2QO2jaTGqEDh0KOtwxbYVnFnsIq7P+qYbLk59YIQ
         4dpB+AbMtppMYCMMYueBEdE4YBGdOXKTLvU2yUWeX71LuqF+QyFFmDvrs2S5XfzKI9qf
         um2w==
X-Forwarded-Encrypted: i=1; AL+hErGGT7wMH72DzhxiUYi1cZUXmON1Pwa1frLLCu81jW5SLTUABbfD6up1kpL6ixjrea7a9O9qsVGkPSDw1Bs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9AdevROe0nOvso0cuaJ4RjE653NC5z7zbzDIj52eKfCbVr6b0
	xUfvvH7CigDpaieww1H5EIbr94qh81buWsruy3nqijqeic5BTzQtskGC
X-Gm-Gg: AZFdTZek3MVWAflARhvYfJOchNq6BORx58zSYiJXk1VY7uzqgt0Ldte89j8ci4y9jnI
	by1xvj9apLl2q/ij0fja/gdKLWt8hD+FAsgqkQYFAFk0O+TZ0t+L2lr7tEqS5Uj1CPrWx3xkDo+
	C55xWvcT6+qsfeySMF3wIHjw2OnKD2v62W3bT1sBYQDdW0uNo0WvoOIvFsZpqog0X8fAi+0AfzV
	7y8tBL+pKqnD26gi98/tj2U2IcYEYU8Q6XaK26rABVcfZHfq6Zr/XiqqhRFzVDwgQhOxs4mU9OS
	kGUfTAq659KaC+mmqK3nMONdViCQ+xcU0QmgQl1MPRFbODysMB3V4AE3EFmPvPjqphAPzZ9gOjR
	0Xog2YduA6RtniTYm6RBw5sIt68KOz2NqlLl2J2ey8ERQ8oQc10Phm7a13WoF3EmrBEqSs/5zr2
	fI3jzquPMcBpI/YE6Op5T5U9DO85tZFFRtdDb7SJ3+gw2JSL6kMGBkBVVAbkGJaOtfhEBYPi62F
	pN3WwMHrpD9vY9cDzdTVjWpyflOkOy6AM2JR5DHcBstPRnu1SDwLgr0AURbBSgAL5/ODJckBuHW
	Sv1STONYZ4lg0kEohnA5jVQ8M5RhU/8GxLi5m2seCDNj9oAIUTvmDKw=
X-Received: by 2002:a05:6512:3d0f:b0:5c0:4cb:2415 with SMTP id 2adb3069b0e04-5c1bc7c9a8bmr4202658e87.28.1795516327013;
        Tue, 24 Nov 2026 02:32:07 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcf332c9sm3680542e87.7.2026.11.24.02.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:32:06 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof Wilczynski <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/8] PCI: cs7542: Add CS7542 PCIe host support
In-Reply-To: <f5d30781ae9502cd76ee2b6757f96a0e5ffa8b71.camel@pengutronix.de>
References: <20261123-b4-cs7542-pcie-v2-0-f589a9cd0bef@gmail.com>
 <20261123-b4-cs7542-pcie-v2-7-f589a9cd0bef@gmail.com>
 <f5d30781ae9502cd76ee2b6757f96a0e5ffa8b71.camel@pengutronix.de>
Date: Tue, 24 Nov 2026 13:31:25 +0300
Message-ID: <179551628581.3.13614361091709904582@gmail.com>
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

I'll drop the PCIe host's select of RESET_CONTROLLER. The host only
uses the consumer API.

I looked at reset_control_pulse(). The CS7542 host asserts its
exclusive reset before enabling the clock and powering up the PHY.
The PHY has separate reset bits and leaves the host reset asserted.
I'll keep it asserted for 10 ms after phy_power_on(), deassert it,
then wait another 10 ms before accessing the host registers.

The helper would cover the assertion and hold time for a standalone
pulse. Here the line is already asserted across PHY setup and the
controller also needs the delay after deassertion, so I'll use the
explicit sequence in the host.

Thanks,
Fil

