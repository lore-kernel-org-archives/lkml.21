Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685911;
	b=rxPBonsjVIRpiDYDXEO9Yq3RE7yLfN9hlkCupcCuEaatr6+Pghhicn3AKKqBqZbVmLg4
	 UDME3jVtB7r/IGmLhrlGJ7I8xK10WhnnRrRCXS0YjAAeDZNUy9ZOIFJ5/IA6gPIj4wANR
	 AaK6WFiHc4409ep3gFVUJmr/r0n0QBEvHa69cNEGsvfxQbTtu9Vv5dOpESwGdzYqJcWnO
	 EpsY/OkwosEdIBuKyo8YHDPh7NHsvRNRFNC+GCmEqDS0UKV6upZCs6aLMzi0/lwpAuSlZ
	 Nh5vB2BJNxm6cGsMLOmnbQFnN3w0PPUt/GsCaNM/Son0UH2l7OE7YJXWeqGYc06PKYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pt7DX8nlqHiFJ7aXsSiW8EaVWyIU59SnklsNhtNjSiE=;
	b=Xkwn0ThfJNfTBVdYO4ojqbIAkxjrzDwJcQ8CZS7H5R37oGCs0Y+SbGXHkF6ijO9Y+asj
	 ydPnao7BUUM6ylX3IXdKPJ8+cL/bj7fB1TOZKEn8N2ZRmSOjrf4fDSrCULO40buSyMBNc
	 igH7beO5UqufRQybPgbe0KSkUuTztxaQiSEgaCeWiUauL4/kv+g/P/9x4YzegZtqeewRp
	 pEJ5ca0eKjjlmoFI0qWzUa+w9ssNWPoZGYYnfJhx+wB3L8zQDaGh9pBMrw5PuYXGKV28D
	 l6/aN7SwJXB3X5WTMseJ/5jEXiZjTW8g90r02/jiywIdSmbsJaUyDILw+QgkFhPCjxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aWGzwxQz;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4135B606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:38:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4135B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aWGzwxQz
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33fb4680717so2133167eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795685910; x=1796290710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pt7DX8nlqHiFJ7aXsSiW8EaVWyIU59SnklsNhtNjSiE=;
        b=aWGzwxQz9Wi0C+RrshIBxa38+3yLzysGAYB2LZxc19Q4H+rfA+20UKVsTMEMSUeidm
         5LJ5ndEWuh4XOccbQ0BNHbHh5PQe18HJds/1uubckXyXDn2iRlbQ7vgdAxy3TU+Bjz+c
         gpvTmloYsu2CNrJTDM7/vL+L64fqBICziPt7XYWhIVcwICsI2IV3ffjPN7KD0PyQAwKK
         11s3wD4mzkavEvyBmzyrXKdzSuMRNz2ZR42Hn98+zGDHVB4yk7Y9Fu7yueqT8qV/xWVF
         U279c810mOPFG+UPpjNkIB4e0XEE2i50DFqmlnd/MF0qfYQl7O+8c+vnsFkzLEmo3Zwr
         LIUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685910; x=1796290710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pt7DX8nlqHiFJ7aXsSiW8EaVWyIU59SnklsNhtNjSiE=;
        b=clzIXabPvla9YFlVYD+vCOx7HMHqETp2jCDZDHn6eF8MOk10uz6sj7pLae2BmLs3zO
         ynKm3RWAPBqcJZj1+lVybnfXksyYjiJ+hwczz+bcSYwzOjRmdumF2d8uWPzjS2prxVmc
         CCstPsTAvKhNAG5UWaXSd8ndK7o65AevOwdq/msNzhFP4yU5ZZr8ae7AXYhv8uKoxYKa
         6GIzsQQ4chADOMwi1V1rey3EkFaJfXk2h9AvB8j7IyGi+Ftz0KBBfRh3xiyRoSlVDGYY
         6fwOghPx/lfmAhUyATvxfHRBgW7TgvX5JZygcnwINK+c2DvZiXQmk/AwgBGiNvc66zcf
         SVbQ==
X-Forwarded-Encrypted: i=1; AL+hErFKQaF/wzS2zX3RkYvtR79Wx8wJAuUtvomY5oj5JW0kpNYVVg+aDWl8cSzMG11yxrCw2E5tCivI6BBtHcA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9y5WpQRpkugMxxDvuYGPk75aSQDzU8+lCFnadmtE20/InmlZ//
	bs5tTbPCtwIgBm+Ke2/NL9pvRjEurHwcbAgNnigOrdGeEN50sNt8K/ho
X-Gm-Gg: AZFdTZeAlVPc+eE2TyPB9+v6GYd/fwvIoaHMJ28RkPgDf+C9IAhycP+y0yxK+hH6MO6
	W4iDKRsUvN9ql1BtSzdksddByOZNOWX9xzPc6be390J+T77cBJm5/KoRywAUvfBIWm31HO2m49e
	VR2g2KW7Ibnpp5vve43lsiProH23Eb0DC8My8461WwChCi21fz6vl6VqUb9Iu8NzL8Q3oVCxKVO
	J0wNZUBct7U8temifnQMsVJN2QBwajlsTRmUOXjJuYtvP4I2HKY2VWeiB5RPUcL3KW7l5zEUupc
	fHoPgGeUZNaq15L38pwsa4ACwe7EgFEs4PQP5LJv/cwS6DC+Kf2QnzNgoQt0rxB6G9EYuM0+aCH
	btdUH7j9oLaOZVbVpLUKxoDf0UP+YUA7waot6l0PgLFmsHhe6MiOrRNSkNQ/0lS5c/TarGj6j73
	TKjZroE4gkV+LQL/s1475kLlZUKaOoBGKO5skgAblNaQtG7PDq5XN1WhGFZNac25CVUfxvUeCRF
	S/QE0OzZwSJ2qgD4CvwlSVFkIlLH+94U1vTU/6YDSPpAaKLIE7RL1yTFtWjjXhmK16xXO4f5NcR
	RqZwvr2KSsZHNybZmVso4OK0gmjSOkkaTiXJ9nPukOnj8PE0nC9a
X-Received: by 2002:a05:7301:1a84:b0:386:abfb:4a2 with SMTP id 5a478bee46e88-386abfb1a83mr13514697eec.11.1795685910273;
        Thu, 26 Nov 2026 01:38:30 -0800 (PST)
Received: from 192.168.1.36 ([2402:a00:163:2ce9:ad38:eaaf:b00d:c452])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aa203267sm32600571eec.0.2026.11.26.01.38.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 01:38:29 -0800 (PST)
From: Ajit Singh <blfizzyy@gmail.com>
To: romain.gantois@bootlin.com
Cc: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heikki.krogerus@linux.intel.com,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v2 0/2] usb: typec: mux: tusb1046: Support no-hpd
Date: Thu, 26 Nov 2026 15:08:17 +0530
Message-ID: <20261126093819.76480-1-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
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

On boards where the TUSB1046 HPD_IN pin has no usable HPD signal,
configure the device over I2C to treat HPD_IN as asserted while
DisplayPort Alt Mode is active. Describe this with no-hpd.

Changes in v2:
- Use the existing no-hpd property instead of ti,hpd-in-override,
  as suggested by Rob Herring.

Ajit Singh (2):
  dt-bindings: usb: ti,tusb1046: Document no-hpd
  usb: typec: mux: tusb1046: Support no-hpd

 .../devicetree/bindings/usb/ti,tusb1046.yaml        |  7 +++++++
 drivers/usb/typec/mux/tusb1046.c                    | 13 +++++++++++++
 2 files changed, 20 insertions(+)

-- 
2.50.1 (Apple Git-155)

