Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160355;
	b=TGCT4zd9BYSLQrUi/Rtb9YxGEn4N3BoE49PZiDDdxXHrhnF1aO74LVjS+ggJVTJyCnav
	 rd/8IYbPsCdbDH8JfZm6lzyEZyepbn20RRKDVE8HiFY/HdWuLyuL6A0MTdineIxn4c9k4
	 iygas88r9bVZWCjLVkYBescq0E8gjc77O7xn0tenTE2ua2zlXOka8foQxfTek6bbQ86MR
	 ZCUtyG7H7gd7lP8pI/QuWvohc4cyJY4OTYzpst6p154j+dM48c7SMVHHsJgLZcBP+WBv8
	 qZMWe/UBpuf8YEJHsCSksiOeNb9BbsGCvKYsYRkoyjizgwTBHSlsw9vVpx0roF4mzyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lVTvq8d6IhVG4vZNXMLdoD7D7oeTtaAvwrHl+0pF8xI=;
	b=hMLJz8QZYtwBcmzZqPvuwvXf8lyhUXydgzeEjy0EmNSd1AXabtMx0OwsHusDX2T/QzAh
	 LxhduGd2rSBIC8upr48LNFYIcHZFg0YwLTqsmEab4prypRmiUmmz+qig0LPUJV5HyvzDM
	 Q+VDKLX8QST+SvAnjyCnTJp+EpdKEU47g9EST1bC6ytxe6JQGqtiZ+2pfvCtleZLf4T1M
	 AIA4gy36jd0GPid1iHMucqTvU+hQI5BgXOfglgttci29szhxgJhzcXPgx3ndpyTMXHrN/
	 8xbyGfhJ7bI3ksWg/J2RlI3ifxkCr9yRY643lfi8p31+6CN0KVAVTvsgNbGmQtafxyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ffroot.co.za;
	spf=pass smtp.mailfrom=ffroot.co.za;
	dkim=pass header.d=ffroot-co-za.20260707.gappssmtp.com header.i=@ffroot-co-za.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VPDbLo1C;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607EA606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:39:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 607EA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ffroot-co-za.20260707.gappssmtp.com header.i=@ffroot-co-za.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VPDbLo1C
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so5055165e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20260707.gappssmtp.com; s=20260707; t=1795160352; x=1795765152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lVTvq8d6IhVG4vZNXMLdoD7D7oeTtaAvwrHl+0pF8xI=;
        b=VPDbLo1CJKIq5TgsAPCEdMdcA9NkYuBQ8TvEuE5FC+GCTgpWIKHAIrJsCim1NhKHoL
         MgGVVic/Oq79qHixBRsoJKMtkqbr+a5MHr1oR0tqoqXLdbRIwQApLLSFz2tKoPoLwucV
         nCZhYsB5ZKoJrqWGbXQSHBQUbJgpw12nJZOPjMs4xWAk1yNn1P6LZs7xM3nqJONA3nC2
         49JkSaN44fpOU7pSfDS/U4jjhqambIWg2pqlFiJmk1dAiqvLqpWBc9QGQI6MJEIGjZ1X
         Ew+XpiSTFPugIf/ciO8iKIbvbZZ/9jlTwQPLIG3wffWgZqlzUZ+Jhawd7TqBVI0e6cES
         RXGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160352; x=1795765152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lVTvq8d6IhVG4vZNXMLdoD7D7oeTtaAvwrHl+0pF8xI=;
        b=wD5wbfmO+irBbXIFDAdEIbDsdfjMKp+PC9ZsK5Ebt4ZPIFJJ+GW/TxqAt7adWaTABx
         QCf1oOB0DGGTKno6WCsc5pvwMuDkhd2Zciujpjsk6l4avQwOX6+YA4MO8E6GaioiViH/
         HOpsz7Stm5pLWPfBKUeDzbseJ4ilJWf4P6TudVyQ84gUq1k0/MLRHTCko8bIeR8JuIFI
         JVsGDUYonlQHGtUvEcugJ2cbkGDGVsIppZry1OK6jTQut1/GQCMpagsfFOzaTkRvgg7b
         FLwGRj7YaT1+EYulbxj60AqnjxHzXTCneb6CkVc9jFKRD7B1+W5sttKiwfRCeEVnRxq5
         DDUA==
X-Forwarded-Encrypted: i=1; AL+hErFqPYCkgenGpAkonDnKpb0yGOS2r1WMTiAiK5FS6qrgm7mrSDhPoZTawig05FvMZPD1vToLdhhhM94oNTI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VAVy2B3bXjcxw0LYBhcwrbtYZF6leeoUfBBqf4C0Pjz1ok57D
	1L6UNpxcx3QcQozINto+WARBz6rQiKNAOJuExYovQn/pt2NtNU2+7ynDeN9sKMJyBd8=
X-Gm-Gg: AYBFou0qOWY5wm10wLYr57c7sKY1iNjlp/m7gmLLALiVAN+QBNyJ9M2KGHsuWklQC51
	3JlD/0Jbu4kMd58oBOQOjSpRj7KSLdhlEhjZyXdBOiIkp/Pddr3TrcOU9an+uMWugKxrhEmLxez
	2M8jEe3N5NHJYpbppknRPfnzpqRAmmJNtFAfK7y+J5QqcgUlrJlqnDkc5GmdTafYFrozNdxJWVQ
	Idit9nDEHz2pIq8Ohr7rs5qfNXHzNQ4zFs+DGXIv11At+pBWScwN/Y9IMwXUGsWNyl7M9HlFLU9
	rXY9VYj+WnS/xs2Adijgryktj62AyknNZZSyVFLEjkgdSYBOhALNaBT2n6LYU+qTwe4wUqjv+Gq
	y7zrf2NHGUUQun9Ph1J6Ztr9gtnpK6TBglombyNubj0Y4ZrSZiWaKKkqEqIXLWmA1CZvYLDlfkP
	enQ3yw2+mT0hwp+QOlQIU+v2+l1M6l+UzCHj9kDr6cM6LDEH5RFzmP3jFR3gObsatipf77BBoo/
	F06PyCketPS9tmFdluZIPYomlKllT6onmTKRM83qQ1qh3EQC6nvWbuEzaeBK/nVXckKyOafFTBS
	VMtgrCwRW9iCKsuMgjiJPsF5zLIZFkXZ8b3F1hUmdTLtXu6xGNWv
X-Received: by 2002:a05:600d:82d3:b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-4bb8880f0ebmr50112675e9.9.1795160352369;
        Thu, 19 Nov 2026 23:39:12 -0800 (PST)
Received: from localhost ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a12acsm99786745e9.8.2026.11.19.23.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:39:11 -0800 (PST)
From: Andrew Gaylard <ag@ffroot.co.za>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Daniel Machon <daniel.machon@microchip.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH net-next v2] net: sunplus: also fix the byte order of 1c:50:1e MAC addresses
Date: Fri, 20 Nov 2026 09:39:01 +0200
Message-ID: <20261120073901.21656-1-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
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

The driver reverses a MAC address from the OTP when it finds the
Sunplus OUI fc:4b:bc at the wrong end. Newer SP7021 chips have
a different Sunplus OUI (1c:50:1e), possibly stored in the same
reversed order, which the driver does not recognise. If the reversed
address has the multicast bit set, the driver rejects it and uses a
random address; otherwise it uses the reversed address as it is.

Handle both these OUIs. An address that already starts with either OUI
is left as is.  On chips that used the reversed address, the interface
now gets the correct address, so configuration tied to the old address
(DHCP reservations, udev or networkd rules) will need updating.

Tested on chips that needed each of these OUIs to be reversed.

Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
---
v2: Use a helper that checks for both OUIs instead of an OUI table and
    two loops, as suggested by Daniel Machon.
v1: https://lore.kernel.org/netdev/20261112123738.429728-1-ag@ffroot.co.za/

 drivers/net/ethernet/sunplus/spl2sw_driver.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/sunplus/spl2sw_driver.c b/drivers/net/ethernet/sunplus/spl2sw_driver.c
index 9ccaf928ed66..b5ae950f6d5b 100644
--- a/drivers/net/ethernet/sunplus/spl2sw_driver.c
+++ b/drivers/net/ethernet/sunplus/spl2sw_driver.c
@@ -203,15 +203,20 @@ static const struct net_device_ops netdev_ops = {
 	.ndo_tx_timeout = spl2sw_ethernet_tx_timeout,
 };
 
+static bool spl2sw_is_sunplus_oui(u8 b0, u8 b1, u8 b2)
+{
+	return (b0 == 0xfc && b1 == 0x4b && b2 == 0xbc) ||
+	       (b0 == 0x1c && b1 == 0x50 && b2 == 0x1e);
+}
+
 static void spl2sw_check_mac_vendor_id_and_convert(u8 *mac_addr)
 {
-	/* Byte order of MAC address of some samples are reversed.
-	 * Check vendor id and convert byte order if it is wrong.
-	 * OUI of Sunplus: fc:4b:bc
+	/* Some chips have the byte order of the MAC address reversed.
+	 * Check for the Sunplus OUIs (fc:4b:bc, 1c:50:1e) and fix the
+	 * byte order if it is.
 	 */
-	if (mac_addr[5] == 0xfc && mac_addr[4] == 0x4b && mac_addr[3] == 0xbc &&
-	    (mac_addr[0] != 0xfc || mac_addr[1] != 0x4b || mac_addr[2] != 0xbc)) {
-
+	if (spl2sw_is_sunplus_oui(mac_addr[5], mac_addr[4], mac_addr[3]) &&
+	    !spl2sw_is_sunplus_oui(mac_addr[0], mac_addr[1], mac_addr[2])) {
 		swap(mac_addr[0], mac_addr[5]);
 		swap(mac_addr[1], mac_addr[4]);
 		swap(mac_addr[2], mac_addr[3]);

base-commit: 2208ab00f4f213ade91ab775e7f8c4dacdcc856e
-- 
2.53.0

