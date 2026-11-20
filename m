Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795194370;
	b=Ld7Vj3Bo+2HMW8vIJUMx543Ed5jCHz6YM/dFDpM5EiEr/jcD5uc7AhfXlguRO2rjOAsp
	 YYiLD+6ofxWlDf2eHJNODwiB6hHOOF9K1ZnU+97FkumneF5RhbO0ZGIKMi3ofWRNqTW5g
	 bljjWk5Xb/khVR5IYe+fEeFCUBjq7g4sbkeyUWf2rgX/Z/js9jfGKBNO7Hqxa20/aqEO4
	 GP0Z0NsFzLVztQXmvtTxFThENC9jQy4Wi99bp8Kg4sjkW7GJYtzIsS1c+NWp/I7rYjxPA
	 c9RJSd0UlNei8k7uz1eta48GDCV+lL4l+ISkr2/igx40/+PRFVYpum78fCJseNMtsqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194370;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Last-TLS-Session-Version;
	bh=t+x3fHch13IoP3DzOrd+Jw9oyhxDL1RyeSBpicDyYEk=;
	b=AnQ0Hou9YCS0pnoWtV/UcO4WWiO31kdbhqF2l6K10CrYBhGTWHEM3gXDxaYAdIRctgZN
	 D1AN4Q7vnseSSpJ3Y19hXCw954NH0VU8Invk2xq9BwkmPzTcne1Cpq7j/uLj/1lnI0p6t
	 U/qBo47wALxG27C/x3CgPdJ8GLulTSEe4vdUR9kN31b1/t+t92hjhZahn4xTSPelcGOyk
	 iiy27w0z0iQF630CN+PGv6/PbLODoBsdFjUy2URNzOlXFosoHND3qXyPvkp/VLKANRag4
	 VCMg6h7WEq4XtENrY8przOddZdstBWlExrs8EP4fwecoQ4zegdD4FRpuxEx64daTuHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=rGE1lEic;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA31760A2606
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA31760A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=rGE1lEic
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5DD73C6221F;
	Fri, 20 Nov 2026 17:06:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8DA4C601B9;
	Fri, 20 Nov 2026 17:06:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D9C3011BC0437;
	Fri, 20 Nov 2026 18:05:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795194362; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=t+x3fHch13IoP3DzOrd+Jw9oyhxDL1RyeSBpicDyYEk=;
	b=rGE1lEic4XE21lRmga1qh5VJfVTg+B0Ie7+IZAijItzX0eKdphzxLLq1I4yPTPS4KZV5I5
	cpV1NZRQPcUjiwgU70jM19FLSckd8LVgdw24VlZK/Wgo6EHxXgIqomXw+6Sr/PhWgbJOAh
	bsXcHo6UdbvrU14tCvq4pzUXtqOFwBggQcdpE5XNzJMkWkMJzhrangc4uD2tRknGsSlz9P
	eG9NAcjqFbejEhQmf1DnY2qgU7Yup2xu/Gi4M4v7SGSC2tFAjKmqG8Ebag2VsOc6goprBA
	YtlZyz9EhRAM+xHNr7PcyFwscbpNqowYYvXEbHWD/rfITCjsf73SuwijoJgF6g==
From: Paul Louvel <paul.louvel@bootlin.com>
Subject: [PATCH net-next v3 0/4] net: phy: marvell: add RGMII-to-Copper
 mode configuration
Date: Fri, 20 Nov 2026 18:05:39 +0100
Message-Id: <20261120-marvell-phy-rgmii-v3-0-c11c99798931@bootlin.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ7CIBREr2JYiwFaaXHlPYwLWn/bb1poAImm6
 d1F3GhiXE5m5r2FeHAInhw2C3EQ0aM1KRTbDWkHbXqgeEmZCCYk50zRSbsI40jn4UFdPyFSyXT
 ddJKrfS1I+s0OOrxn5okYCNTAPZDzu/G35gpteCFf2wF9sO6R9ZHnxx9T5JTRVKtKQVd2vDg21
 oYRza61UzZE8cHg8hdDJAaw8tJqWUGt9DdjXdcn3Vz4ZRQBAAA=
X-Change-ID: 20261109-marvell-phy-rgmii-60a8bf619582
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 "Paul Louvel (Schneider Electric)" <paul.louvel@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795194355; l=1638;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=Abps4ps5dtOYROtt9ARGB+HIZGA9HUZZBm2FH6odHRo=;
 b=BW9jsnVn2G8xWiOyKsqUZtSnE1FpEYjsRd+HLTe09TwK+QXUB3wTsr2YThK5Xz0rx/ijjO17q
 TZRuthRe7WzByzd1p9UuOnwfq+2XuL0fnJ89nJGOnzbMhrpunXa5avo
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

Hi,

This series add the configuration of the RGMII-to-Copper MAC interface
for Marvell 88E1510/88E1518/88E1512/88E1514 PHYs.

Patch #1, #2, #3 are cleanup commits.

Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>
---
Changes in v3:
- After discussion with Maxime, discard the change related to v2 third
  point.
- Link to v2: https://patch.msgid.link/20261116-marvell-phy-rgmii-v2-0-e04dca67e89a@bootlin.com

Changes in v2:
- Reword patches to be more accurate.
- Added a patch to deduplicate the mode setting code in
  m88e1510_config_init(), as suggested by Marek.
- When setting RGMII system interface, avoid erasing existing mode that
  uses RGMII but a different media interface. This issue was raised by
  Sashiko.
- Added a patch to rework the EEE errata code by using
  phy_select_page() and phy_restore_page(), avoiding useless bus lock.
- Link to v1: https://patch.msgid.link/20261109-marvell-phy-rgmii-v1-0-026979ef4f13@bootlin.com

---
Paul Louvel (4):
      net: phy: marvell: move mode configuration into standalone function
      net: phy: marvell: de-duplicate mode initialization code
      net: phy: marvell: factor out EEE errata initialization
      net: phy: marvell: add RGMII-to-Copper mode configuration

 drivers/net/phy/marvell.c | 110 +++++++++++++++++++++++-----------------------
 1 file changed, 54 insertions(+), 56 deletions(-)
---
base-commit: 7b6ab4dbc156e2f96419715130b3d5738a306c93
change-id: 20261109-marvell-phy-rgmii-60a8bf619582

Best regards,
--  
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

