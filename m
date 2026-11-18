Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.47.206.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794970618;
	b=tk0L4op+VZ9IwGv8zTRVyLN4j32jZg5vytYTpoCgbQEKlkIoWs/ZK5KcQ1Rt7haf1DdT
	 tKZGmJ/fhIiFQX9xmkP1oeglvhDfVb/bygHxsPecnlJ7SVZ7LQysAoTGYL5uw69Il2NIs
	 4dc58iBzv89asw5MHCF/7CMPjZiSgM/lCaABvlN9L65KJs5VNjA0ZFElZeWDwabeFH4PE
	 XHSw7vetqVB72n0bPHC6OplEA7AO8SKc5GtbMb4YPn47OqfHU1HqE3zDa1d/l61NZWGGP
	 oehQmqr43WlcLVMTd7EWmhFdmmpIlym+gloT8iNRRMEw1xbDIIqfKsUDY0iS61aactg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794970618;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Received:Received:From:To:
	 Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Smtpcorp-Track:Feedback-ID:
	 X-Report-Abuse;
	bh=eg7NMuzPwVvUZHsljdV+WNXSBJJGrbA0gnIcZswSWFQ=;
	b=lfRPp1zWz+tO4+uZb760Xz1svrr0tMyiWF4ORmfcr0P2/vFtKWY8AqtYLBbOHCI9+XEy
	 TeWUAtcenJ9cKrj9BdESHKdm66CGVm9ev5zTtG2SwYNkqnmjGOvLBAFsOLeRCDfF90UJ7
	 1Lil5EV9x2V7uEz/ZZZZRHYwW0FWxtGzNqvMzt2wOed5ePOXEf3BvZ5u2Bv5zB3XMvDZ2
	 iYH45/zgq2HneZgjwq1ydy0GOZuPuWy9DKH3LeRFFuqpy3VAuQ4jgdBllwO9YrrlPadwr
	 wTqhBmwQykxGAhs1a6xWcPRQ9iYw4Ha0UmbqWE3kFUrk6qJaSscPJ9XpgBku0beCbDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bumblecito.com;
	spf=pass smtp.mailfrom=em1130875.bumblecito.com;
	dkim=pass header.d=smtpservice.net header.i=@smtpservice.net header.a=rsa-sha256 header.s=mo8l70.a1-4.dyn header.b=lxzjBi5a;
	dkim=pass header.d=bumblecito.com header.i=@bumblecito.com header.a=rsa-sha256 header.s=s1130875 header.b=g92A3vRH;
	arc=none smtp.remote-ip=103.47.206.45
Received: from a2i557.smtp2go.com (a2i557.smtp2go.com [103.47.206.45])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67D5606A334
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:56:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B67D5606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bumblecito.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1130875.bumblecito.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=smtpservice.net header.i=@smtpservice.net header.a=rsa-sha256 header.s=mo8l70.a1-4.dyn header.b=lxzjBi5a;
	dkim=pass (2048-bit key, unprotected) header.d=bumblecito.com header.i=@bumblecito.com header.a=rsa-sha256 header.s=s1130875 header.b=g92A3vRH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mo8l70.a1-4.dyn; x=1794971517; h=Feedback-ID:
	X-Smtpcorp-Track:Message-Id:Date:Subject:To:From:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=eg7NMuzPwVvUZHsljdV+WNXSBJJGrbA0gnIcZswSWFQ=; b=lxzjBi5a20WoRTsBeD4bDAe8JT
	Q/vAec5drzdqb8jcztBQx8Xa/4w4DFkxS/A5eGy/gZn1t34gplCuPNwQ1wlAS+XLfW/iBBNnlPIEd
	Rgh3QF7/+yGmRuyvHHko1NiMffa6Dy9tqnIz/BC3enq+hiLP9SXs4RBRryZ8VmQXFRTCpiDl1ww4P
	NIkb1HoXGw9doD6vcwCKk3WLcz97ZbeEAmGyOS9zDGU4p3xS90FL5BEaUgh8JS651lti0137RUyHi
	E20TJZwGd5xU+7/9TK1uSdANiMOLGrdA+s/QsVepbGWba+NBjsRtLmEEp9S7CJkSUDtKf9awujBOX
	5U1VyTlQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bumblecito.com; 
 i=@bumblecito.com; q=dns/txt; s=s1130875; t=1794970617; h=from : 
 subject : to : message-id : date; 
 bh=eg7NMuzPwVvUZHsljdV+WNXSBJJGrbA0gnIcZswSWFQ=; 
 b=g92A3vRHfStsaxrtPj8GsRaHvm/4eW/J4BOEIC8uSNlc1+UcqthvjeMhY+7T60bzIruNpM
 Ht4iyXPBpNJ2NteaySZTT2RoCdaDZc8xe0ozoJVVyYfiYbYAO7GeUUgyz1sJp30QvjGYtQtC
 8HB2hundev1P52jyZIOc/dXCiAKKblHOH8qExzcqq6MEioyiMA9vWbrd/DCP6dJN/47g6J95
 yQ3GLCUbE+6k98v7kxo313K3uv1Ox4YU9jQvJQ6mM/Tzaubb1UDHHePcYrXmyEQkQ7cweGS3
 YMKtUfnmoevNBKNMB2lhm+95aujeosTrJ/888g4+dOSPvEcFgkrz9UiA==
Received: from [10.45.79.114] (helo=SmtpCorp)
 by smtpcorp.com with esmtpsa (TLS1.2:ECDHE_RSA_SECP256R1__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <github@bumblecito.com>)
 id 1xTVqn-ED4yOy-AK; Wed, 18 Nov 2026 02:56:45 +0000
Received: from [10.168.248.187] (helo=ubuntu.local)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256:X25519)
 (Exim 4.100.1) (envelope-from <github@bumblecito.com>)
 id 1xTVql-FnQW0hPz57a-NHO6; Wed, 18 Nov 2026 02:56:43 +0000
From: github@bumblecito.com
To: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux@armlinux.org.uk, andrew@lunn.ch,
 hkallweit1@gmail.com, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, Israel Cueto <github@bumblecito.com>
Subject: [PATCH net-next] net: sfp: add 2500base-X quirk for ODI DFP-34X-2C3
Date: Wed, 18 Nov 2026 02:56:02 +0000
Message-Id: <20261118025602.171615-1-github@bumblecito.com>
X-Mailer: git-send-email 2.34.1
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
X-Smtpcorp-Track: XrB_f5zd7JSq.Z8Z1a73rN_Zk.zCW1KgFDtJh
Feedback-ID: 1130875m:1130875aWStQz3:1130875sO5hQYxWT0
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

From: Israel Cueto <github@bumblecito.com>

The ODI DFP-34X-2C3 XPON SFP module supports 2500Base-X.

Add a quirk to enable 2500Base-X support for this module.

Tested on a Horaco ZX-SWTGW2C8F switch with an ODI
DFP-34X-2C3 module. A 2500 Mb/s link was established
with speed and duplex forced and autonegotiation disabled.

Signed-off-by: Israel Cueto <github@bumblecito.com>
---
 drivers/net/phy/sfp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/phy/sfp.c b/drivers/net/phy/sfp.c
index 915156743..666e515d2 100644
--- a/drivers/net/phy/sfp.c
+++ b/drivers/net/phy/sfp.c
@@ -606,6 +606,9 @@ static const struct sfp_quirk sfp_quirks[] = {
 	SFP_QUIRK("HSGQ", "HSGQ-XPON-Stick", sfp_quirk_2500basex,
 		  sfp_fixup_ignore_tx_fault_and_los),
 
+	// ODI DFP-34X-2C3 XPON stick can operate at 2500base-X
+	SFP_QUIRK_S("ODI", "DFP-34X-2C3", sfp_quirk_2500basex),
+
 	// Lantech 8330-262D-E and 8330-265D can operate at 2500base-X, but
 	// incorrectly report 2500MBd NRZ in their EEPROM.
 	// Some 8330-265D modules have inverted LOS, while all of them report
-- 
2.34.1

