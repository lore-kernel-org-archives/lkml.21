Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789510;
	b=nO/I51I/KpENerlp5UVDIRpd3XtUKN+hJD8YNWhwkg8o/B2KxcWhqlf3zITjCP2IKxjR
	 6o1I+tpTPiA7fcUQ268srwzaPg6FS/E30tHMjmumWq2vlcJqtVSnNpyFbCUeR7etIF/6m
	 5KqKXJa3ORbX+xZGt06Gd10RnSsnCisjp91FSn091K7zP2yl08YuyP8Kr28sBTsj27Eai
	 FIadFuACTLMPiojqMygdzLBscJJTlhl/2Uju3PGGlGU9DEtDRc1u9+7rLr1ZDk31ZiTA6
	 Xc7i4urIZB/tWWuIP+I9+E6t+XgrWcvWrLi6xQ8+6gfO12DC05QZ9bPuMBAo+c0D7fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789510;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=o5YMEpyPVMRHq3R3jE/xM+ZLo97uZzcZNi23LeKuoHA=;
	b=Jc1xUolXR/PrUt3w9HpWPlF6Vpj9H+T21Huo3FjsGj3q5qDhLRWTKe0uLro15z+PCFlY
	 YCPAWMW9soNmilZUycA6+49hFHaL0x5hrCZtiqWLrwolSphAEn6G38qNGtbdBTA1L74xb
	 1UtMrdhI659UaBlRo/rck5g7ab7LFjRdkdkYtilcK2tLcZ3PWeApiE89d6TMbxE4ynEYm
	 CbNbms+9oPFQq7TbvNOnYrHGR5yduJC3A8VRbAb3LrSTZgdM96pgU6HcF1ArZbHIDrJPM
	 DQrFmOmAj3TQG9OW/eDZeDKkYsQKHtn0jT/a4K5FDN/MtdtZ79yWfyCr6dqSNmCzl3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=QIryK6YP;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F7E606A6B5
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:25:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02F7E606A6B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=QIryK6YP
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A35811A183F;
	Fri, 27 Nov 2026 14:25:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 71B156049C;
	Fri, 27 Nov 2026 14:25:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 37EF711E69006;
	Fri, 27 Nov 2026 15:24:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795789504; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=o5YMEpyPVMRHq3R3jE/xM+ZLo97uZzcZNi23LeKuoHA=;
	b=QIryK6YPTIgydwV4pC7EccY920APC/caDdInW75e99di7b5N5q6nalwfbeM6A54FBoZAur
	+lgMtkrmsr5ahz1MVU53wRcfR2doH80Y968uVo608aDISbm003902nqDVEs2S7N3fOZMnU
	OOmFkapoF0wwZLh4KEL/OK1xeK1YbY0DKetBHBNvXiqLPXbf0ysfizLCjFbvOnPsb0zP9i
	dzpFw/D15adauAkNOV8RZ/TDr86lNw3BtvO3wss0HXWP5KMk45AKwyg4NJdbIZrL6uUZx4
	RrKIvEXMKcOtCrbsXfVmhLF1D6Gg5BAxynVUybydS+p7vsqItDTRCxm9Zj9wZg==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 15:24:58 +0100
Message-Id: <DN628YQ8UFG4.PF85CG1FNM2@bootlin.com>
Cc: "Vladimir Oltean" <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Frank Li" <Frank.Li@nxp.com>, "Jerry
 Ray" <jerry.ray@microchip.com>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Bo Mellberg"
 <bo.mellberg@se.com>, "Pascal Eberhard" <pascal.eberhard@se.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>
Subject: Re: [PATCH net-next 0/3] net: dsa: lan9303: add LED mode
 configuration
From: "Paul Louvel" <paul.louvel@bootlin.com>
To: "Andrew Lunn" <andrew@lunn.ch>, "Paul Louvel" <paul.louvel@bootlin.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261126-lan9303-leds-v1-0-a96731317859@bootlin.com>
 <a96f239a-09f0-4899-b5e4-1cac4013b3c5@lunn.ch>
In-Reply-To: <a96f239a-09f0-4899-b5e4-1cac4013b3c5@lunn.ch>
X-Last-TLS-Session-Version: TLSv1.3

On Thu Nov 26, 2026 at 3:52 PM CET, Andrew Lunn wrote:
>
> Sorry, but NACK.
>
> Please use /sys/class/leds, with the ledtrigger-netdev, and offloading
> to the hardware.
>
> 	Andrew

Understood.

I will send patch #1 separately also.

Thanks.
Best regards,
--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

