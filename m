Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011129;
	b=S02DD10ZeKMNarKArPpve7O/uVWJg+J6kbSeYkvAV+g5I4EMZNkUuloOF8dmU2bmmBv6
	 Vt+3vfs3LvR4W5Jyk5J8ed2FQRyn/2b+tBQOIbfE3mNzjWOYdjrqpxyD3a5mA51dRRdMJ
	 JJ5+V8S9tHYEoMcCoKDX/8yBhlJBY4m7i4IyUVDFCwSxNMQECz0eh/MLEJtHshz8dvGrc
	 UQM0ZZnKnYVAisoI4qB6BoQvNGuw4+Su+KMftu3lKMFESZxerFIArCIzxNJ+MstYuWBS/
	 tMoGxCqojzbd+oVpVdZNr1CItraJb+SH+LFllsQBIE7MJSnKtsSjWUNQLD8CN6/9K+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011129;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8+oQ1HV3e9R+CSE12Qaoq1BXQEmnqEm37qYpcdR4cOY=;
	b=j+eupxmAdYJb1s0NZYZfSTLWbFbxpb0/83biltobn9A6Y5tNGCJUQJI0MU2CKcC81Thr
	 uXMenKJHKcEZ9cJKWkDT5uSk4BGxZjxdy6A85Ve3vEDJt+a92xEZlaKfAl2a+ZRJHgAmm
	 l4EuJL+wZTcvC7YxL1+tKgZ7XKHXrMazRJo2QLxS4Mh4c9jz6uuE57r2EFErAqYMy7y8J
	 Sdp+5pReAbl3ziuqkn6YcDBN/M3swLlzJDnalQP0qkoTFLTWXgmLroGaZKWOwvcV/FvzM
	 qoOHeO9VdAZyntYw7Ux7EVW4fAqtmkGOP2FztYvQIP4YQ+rsdlStUQFtZMORRMTz8yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=X+Du2E5H;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A5E60A2617
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:12:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5A5E60A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=X+Du2E5H
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so670902f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795011126; x=1795615926; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8+oQ1HV3e9R+CSE12Qaoq1BXQEmnqEm37qYpcdR4cOY=;
        b=X+Du2E5HeDdGwpJtkkybS4mRnYIN76epeyKOe0BAKNzk2aIzSHPLlFW1sPj87xh6QD
         r8+27iMo40fH3/Dfjz/gjFCrVzVzwYvkUZD9TFz9bTM2Tc3FHcMsL2SxK0ysirMwspZ6
         bFZaHoYqXkDu1jjng6iK63CdgKssDdTzOvbzGkeu4BC33Kqb/OL0JZe3/FnqX3w7/Q09
         CoxzHRaFuCZM5DNQ+HEpaMLG+idiYekrYrYyjwysV7ldZqI8eqFfS9p9yDN77C27r4nd
         aQWcGYi1pHhF3PATB+2bvKGeW6ek3lSjSwjVlq1jIHKFJ/2km/fmms3HIkfrJRTOi6Bb
         ot/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795011126; x=1795615926;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8+oQ1HV3e9R+CSE12Qaoq1BXQEmnqEm37qYpcdR4cOY=;
        b=L9cnMpq1J2VVuvBqPmhPSWsm11P8NTpne0SZnOTrqTNTeidZC7tXfjXDRxu8SWr3Eq
         p71ReZsLBGemHZJTIG/QGb+yGgCaXRa/SmwWpKXBG6oV4EaLSnboJ2RPTL2wYSoGGS4X
         4GfB6i4E7AUqV6ZCbPlnGcPWbAk8BcuMCw/1328vF3FmQRS6QFP+j2hDIkk0wlOdGcZG
         5ObcSWvVxXshSoWt4d/ciL9i4oFCGDLrpqNB/yKm6/VOFl0wU9oxPqLoFN5UXirWbznM
         4ZfZibPO9R9v8XVkH++SUeUwFD+VlHToGFiPoxrGMX6dIHffVsKBV6/ZCx4hkK8WYPaZ
         NIrw==
X-Forwarded-Encrypted: i=1; AL+hErGF9XNYrw7yRrV5aBcMi/lLNai+UfxwTSCy7i2/6kQnQ1HOtrm63Pf9peJ3y7aDrusTU5ERIi5GUCPz3hs=@vger.kernel.org
X-Gm-Message-State: APuU4Z921ayt0oUsyl85AJLASa3xJxLTp0W4EWarqHeQFridLI2wQiF1
	w1V+NFHAOZElq4hOaCd9Z52rnT3DVw2CZPClZe/rYezwV9CJGE0RbDiV+UUXnKaC2jM=
X-Gm-Gg: AZFdTZeEznWfM4pSkN17xZwEBtfja94bi9xG1fgHsVILZMjx5gnVnduSZAn/ur/ZfTQ
	+8CCmXjOD1ANdi+X2z1C3fH5KMbEI7f+T6L+b/8mobpOHtzAnYud0HDPqeKDdeM6bhefcntS/w/
	P8oondZPS98j+4WWlf8BGsXj9OsaITEKC4Weu04B8ddeCcIgpYGChj3TWKfQ79nwXXdJERFoRwc
	9+8iY7y5M+PPgN0iwwhDkq+pYpO6OCu7bI51CXtPRjdMCj462PXqCReXKpYPjHKcRLE23gBR3dZ
	FM5erUtaH+5soYFWbarsClQzcf8bxl5H/9YCHOA9XrRHNxZSD+eTf8NgfPpJw3ldys9cFYcXi/G
	UtNGLM7Qpl5IqW7xE+OUCxv8efp4BoDCeFs46HUZjY23UqFxJN/UBG++BNLT1gHlUejg0pvUfed
	x9EkF8BRIYk9GI/r6jj+HmNo9Yc9yQrrL/Wj2Jdhv3bcxYFXEt4Un++8CHADa+vSLHXj03gjVOG
	7MMuvBmg1aR3n8+1Xes6lwoNRSm3tpcLt75bwVrKGIkyo9obbqmiKVsNZttsaKOU4UIcdP+Q580
	DJcCJmZ2cDfKdc+x4vEhy8Me0BRivI3kUl/CB8CXr0Cgi9Ar
X-Received: by 2002:a05:6000:186b:b0:48e:88e2:fe6a with SMTP id ffacd0b85a97d-4a63f4623d2mr6222883f8f.49.1795011126108;
        Wed, 18 Nov 2026 06:12:06 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a650d2ecd0sm5590663f8f.8.2026.11.18.06.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:12:05 -0800 (PST)
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
Subject: Re: [PATCH] MAINTAINERS: Update UltraRISC driver maintainers
From: Jerome Brunet <jbrunet@baylibre.com>
To: Xincheng Ji <jixincheng@ultrarisc.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Linus Walleij <linusw@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
 linux-pci@vger.kernel.org, linux-clk@vger.kernel.org, 
 netdev@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Fei Chen <chenfei@ultrarisc.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261116-ultrarisc-maintainer-v1-1-f58706ae438c@ultrarisc.com>
References: <20261116-ultrarisc-maintainer-v1-1-f58706ae438c@ultrarisc.com>
Date: Wed, 18 Nov 2026 15:12:02 +0100
Message-Id: <179501112283.639563.5233054429317576626.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1377; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=vlDn3aALOXByZVs7mEqRvuJC3A1ctnxY975yMiaHYv8=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFl/N5nknC99zPPvkMAeEz+LJ/rb3O42SObtqLnBOZNhY
 rKGh3pmRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACbyv5rhf+pRtSNHwkU+xf62
 3H1MSnpnB/t0htMrxT57Xp29uUlbppLhf/BEnSWNU72uGOXvU9VP+/jowUV9g7UhNjMfXXfY/J3
 3GgMA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> Jia Wang and Xincheng Zhang have left UltraRISC and are no longer
> maintaining its drivers. Jia's listed company email address is
> no longer available.
> 
> Replace Jia Wang with Xincheng Ji and add Fei Chen as a co-maintainer
> for the DP1000 PCIe, clock, DWMAC and pinctrl drivers. Remove
> Xincheng Zhang from the PCIe maintainer entry.
> 
> Having two maintainers provides continuity for maintenance and
> patch review when either maintainer is unavailable, as suggested
> by Conor Dooley during the UltraRISC maintenance handover.
> 
> Link: https://lore.kernel.org/all/20261112-legend-outcast-c2226b5e02a1@spud/
> 
> Signed-off-by: Xincheng Ji <jixincheng@ultrarisc.com>
> ---
> Hi all,
> 
> Jia Wang and Xincheng Zhang have left UltraRISC and no longer
> maintain these drivers. Jia's listed company email address is
> no longer available.

Maintenance is not necessarily tied to an employer.
It would be better if the people removed could Ack the change, and let
the community know they don't plan on being involved anymore.

If they do not reply within a reasonable timeframe (a cycle maybe?) I guess
you can remove them anyway.

That does not prevent you from adding yourself in the meantime.

I suppose this would go through a starfive/riscv tree ?

For the clock:
Acked-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome

