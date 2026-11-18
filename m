Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794990058;
	b=S1jrmXkpRdc47C2a+SdRz4XYMW+uhzPX1rqsxb8sID2EOwP4Io+3+orvgxtSTSZeXoG/
	 /bulT6zwrH6X4ZkuqhyVp7sPDFELt+a50QG5yKKbr7s0x8l6jOa7eR79rShSnmvFii9cH
	 dP0rDS0BZ/8fAJiOH1Oo1Ljh/83UBck03NYGIt/Yy1Djd4/1v8qJ9Nsofix5s7Hcq2KeM
	 qyDQb063Unk2pZftPv/OO1op6hXrbWU3Rm+wBotKK+CJhzrv0x9uGBSbxjX+NqIcNpjBi
	 JuiZgH3+inrXVASfswVlYPESj8L1+FyauEJC6vCKk5SLK5BoBAzHog8EXRWChPyiMWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794990058;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=PxUuAs6hF9FFnuFm7OwY4l9jBpo4nI/baW8NihC/UI0=;
	b=SNOxhwOhrJg37xnQJmMlvfC/fKot6O0TNX8OHDbP1R7TilRzT+/eXvv3yYjej8DaJJkP
	 xp6Y37rpNbgwIAY4OgwSUvKY0BEgLO87Fp1IIrvBSPmvyIMkAqaPRNE3KxsMBAYW7ovAV
	 1rJ6BTVLfgpkWS1OTdhcnyEKpr47fv5tj4np8rq9g33XIdR4O/oUbiX/no0/8smmSxWOE
	 OfgQt/x1ktngIMH9ihixdJdEUDrf/aqDfVl+Z0EFhcc04PqA2qx9EYHmxuFwtjtHXq+rL
	 Ophk1bYtnf11jRRgqBdu+NnF4fFX3mG3euzrL/wcQ9cMw8Ps7ne1t2DnJPql1snVb+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=uXSkMD8S;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A145F606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A145F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=uXSkMD8S
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 41AAB4E4160A;
	Wed, 18 Nov 2026 08:20:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 151F95FE9B;
	Wed, 18 Nov 2026 08:20:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B55C211BC0901;
	Wed, 18 Nov 2026 09:20:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794990055; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=PxUuAs6hF9FFnuFm7OwY4l9jBpo4nI/baW8NihC/UI0=;
	b=uXSkMD8SP7cFPwjkl1zPm3Nlck69h4eMxCwkoMwpLE9Vddbk+TRWnmVFdUjPGJOKDwHEy5
	PDBgW3YbVKb9Ex4A3Ko2apuXGcgWFdc3GV3NqzIR22lmUwGVOOf5uO/F1q41qIHwbTRjkg
	o6F5RNQMaETQus1lf5KE46i5ild8ESgVQpw14dGar1qROupVGHHvkbBLbbpbTyMUgm/2Sv
	sIfU27RyxBkkVJdamv3D6D5p2q2lHS6veGM1Z11iJ1Y3bBt8vTYxCW5HOzmLvR2qUcOCYh
	4oKJscimMKNKnM8a3iWBEMxOmf8YKfxuNwNXkkINc4aGdpPOW1FH/BSxcHJkag==
Message-ID: <560d269c-f537-47ea-8df1-b6c29d67518e@bootlin.com>
Date: Wed, 18 Nov 2026 09:20:48 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 4/4] net: phy: marvell: add RGMII-to-Copper
 mode configuration
To: Paul Louvel <paul.louvel@bootlin.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>
References: <20261116-marvell-phy-rgmii-v2-0-e04dca67e89a@bootlin.com>
 <20261116-marvell-phy-rgmii-v2-4-e04dca67e89a@bootlin.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261116-marvell-phy-rgmii-v2-4-e04dca67e89a@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Paul,

On 11/16/26 16:27, Paul Louvel wrote:
> The driver currently programs the mode only for SGMII-to-Copper, based
> on the PHY interface mode.
> 
> Some MACs connect to the PHY via RGMII. Add code in
> m88e1510_config_init() to configure the device.
> 
> Do not overwrite the media interface mode configured via
> m88e1510_port_configure_serdes().
> 
> Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>

FWIW I've tested that on a SGMII-to-Copper 88e1512 PHY, and no regressions
found. I can't test on RGMII though :)

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

