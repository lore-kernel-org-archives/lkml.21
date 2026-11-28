Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795884729;
	b=4DZQojvD+4aPBSyIJfHDxTln9NiY+6IZQYCVTtmDlx9p6APrUG/aPOW49XbSVIFrk4P3
	 JeQSbLLi+n/3wCywGleFjAoT9E/BZb77kp7Mxpcs7FNCFgTHKa55CF3ZIYfPP4MjSLVtU
	 ypup7hPFURSXHpSTOMdeIWqDUWfb5OHfz+P5mykzOYaeaQvEtxjmMYFAoV2hJw0ohGdPO
	 lxgpvKwU5rfyKhmbWI/40aKOTh+q80YhvWgZ9T4IisRNB6URJuVc4VJOeAovbcc0mIbzZ
	 Fo2UxcyqTCQPmCqssKCMmtZ2Fw/vMgZTJHxHg43jGvOonqbQ+/ZR/deX0dw53yRhMfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795884729;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7aKxz4tIl1oHn3UmDCWXIsWmjmNKo3P/L8xrY/Al+Zw=;
	b=vefRSvONEGCJVZtMB37DSiFUYGsBistH6PEBvcUjGNIya/YYAJkzjtGwidw30VBFCWCb
	 W+Ibp+kayXW2GYnvTop8IeI32y9/ka0Pp56hWHwJs0zlSpEbQjSgOCfH3dGH29MBJ7Lr8
	 ZQHSwXC+YmA9pBDHw04vji/rNLiaxOGwhlzY6LLHrgrXpU1KwLByK5LYp7ytBiziRS8rj
	 MMnkdytgUShZ53EMDZJfItt1HoIaOTjEae7fGlbbEXi8lTR3G2/bG+UURlrHrTrd662Su
	 NG6DW8HyNa34R9pliSXhWLCW0aZaLtkUcIBk3tWUUewQBNa6J1GZLeardJAsbBTreDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=cb3DBnGI;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BFC606A6B4
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 16:52:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3BFC606A6B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=cb3DBnGI
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c511c0e2826so1037481566b.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 08:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795884727; x=1796489527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7aKxz4tIl1oHn3UmDCWXIsWmjmNKo3P/L8xrY/Al+Zw=;
        b=cb3DBnGIFEgHXtMds4mzJ98BmQMj7Y5+EkURzsLIAueRR4KOxNSKuXxs3bREFRlYXA
         S/IKyLG+lA371vXS3CPV7NiKYau9absfwKAAOAf71VNttlZccZSy3s5p/SJHqhcO9qQF
         kExL/araUhQ0FqwRaT0ZNcyRjvHRXZb60d2tRzaXwVucs9XVZ77MZq0BgBC9QjEvXAzN
         McDzLdZkDaio18M37SY7tmpIKEfXm6pyQwwYpyMaGn2EkPrrVFoSSui+NH59BPcwXOmB
         dXVhKvi0eaA8a3J+LthiMtDKfTLPIuj57WLLvoKtaqter7IJ1OBRcRVXxL6WRQJPFe0B
         w9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795884727; x=1796489527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7aKxz4tIl1oHn3UmDCWXIsWmjmNKo3P/L8xrY/Al+Zw=;
        b=0kl9YyOVDg9QtVmhD86BaVAafRVRHIQ94DKYr7/8YBUjBMufqDVgcMM2BBmPBaLhni
         LErbga7GfV6aGVVPgAujDxqT0T3+G3E768E5n3pN/lVD+/+734Y1HsQQLbRFLkOqsPBm
         jLbOq8F/LxpwozZ5WJQa6SEz7yqVf5HC6knru1CJmqZUPyB0Pc+05alSWw9TgEn7yXfl
         1LFqk+FHbFxeeie5+IfhAmngSu6pER79xMii+7JT5zF7yHFQRrqUi7Mo4Tsw4DrbrzvP
         LWEmIB+jSFJTxULPGFtmfMXqHcuXT7PzO/Jdz9TwttBDtkbLOn4Hwijemu7caJvEDz7/
         a5yA==
X-Forwarded-Encrypted: i=1; AL+hErHurJQeZuvxpi47qKvLu9z8yvGe17y6PEIHZgeWr1HAtSjwuIGAcBTnk7bGhRgK8qOIaHt5zxvkB7ee3aU=@vger.kernel.org
X-Gm-Message-State: APuU4Z89OR1techAtJO59wMRkaPIUcUNheljr8PKv1MR/uxvv0X96Cq5
	JPjICaU5Ywjfq1U3zX+Hpywz3qFPcisYV6rHOTqQhWmD7YePLYYRzevgItstIc9Rdg==
X-Gm-Gg: AZFdTZeFwzgsCG5UA6PgyLxkrg9b119n5m4ZgSdZzqFaFUyL2JaF2O1Bjg7gw8Z2VVX
	obN3nFUlTzkZ2cRCsDVbnyXk1Oj4GU6jH7NfIC8XDf1aDMVs0c/+4rpi6yjzISMR4eLpoIwrBxO
	iiGIZYHnOgB5Ze3CP55yNBDG0kRhIooLn6LCHVOA2wwdt1FSPj2tWdVhdlMtoHAf4FHdggDgQha
	qOMxZnF1d7a8hly8zpTXw30E4M6K2mx+UYVzJsIh8izyTqEDuehMwtRk6UpNCrVySVXdSp/qUTk
	umq7L4jOZHufMF1y1aEK41RV/Oh+IeSYyNVbWwwYI7wUukpH2AHcYM5JFPScBLaZV+NEzIv1l59
	Mmi75cs55ZBcbFZ494PY+vTh9ptl72WJn2cn4bt+4G8EpYfyq451bZ+cYrDlNFt0+AyTEqrk8k8
	7XftojP0P1fqzStvEIFwHrrJhDJk+ZdD5Qhg0IRw2E3qcyP3r4LY+w9U3KoLaQ9/2CenFciypmS
	D+xbplJo9kGO1kRQhCnXcKsvVBajHyLCvUhIYPV7EW7oz6kOAXfjx5DsVAFp7LlJmAkhgwkCcFB
	Xhx5MsyQqnCfKYOFI36tPZbF+fTB2EBWjn92ikmJz+GWwN0wZ8wPa4FZ1qaisjYBdkCZsuNkZhg
	wuz6WXzGMuF8PqADqOmGzqw5+qmTqNRqDG1LQJz7c5Dlc1aCiFcpEy6koZkJkqDnAzb0QQ1hYKc
	fGmgAcaDRaWwQyl6Odg+d39F6DbZB69jbQcR9jK5cHss4YYigGOLkJ5fxYVBKj+MQyAHLacEI+F
	3nV5T4u+nnRgpaDw1Iz6wVsLWTpRYhYRC4tvTx6ObQsdM/aB84dwNl+rUG6IttGufjZy0snyUcI
	94P2G4D69NmryQ==
X-Received: by 2002:a17:906:f34c:b0:c46:9ca9:f522 with SMTP id a640c23a62f3a-c513aad4784mr1628075566b.26.1795884727205;
        Sat, 28 Nov 2026 08:52:07 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea3537sm954627766b.36.2026.11.28.08.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 08:52:06 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	=?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin.sipraga@analog.com>,
	Linus Walleij <linusw@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Pawel Dembicki <paweldembicki@gmail.com>,
	Tobias Waldekranz <tobias@waldekranz.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Russell King <linux@armlinux.org.uk>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 5/6] net: dsa: do not take a bridge number past the end of the bitmap
Date: Sat, 28 Nov 2026 17:52:04 +0100
Message-ID: <20261128165206.3248835-6-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128165206.3248835-1-julius@bairaktaris.de>
References: <20261128165206.3248835-1-julius@bairaktaris.de>
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

The bridge numbers in use are bits of dsa_fwd_offloading_bridges, one
unsigned long, and dsa_bridge_num_get() searches it with
find_next_zero_bit() over DSA_MAX_NUM_OFFLOADING_BRIDGES, which is
BITS_PER_LONG. When every bit is taken, find_next_zero_bit() returns
the size of the bitmap, and only "bridge_num > max" stands between that
and set_bit(). mxl862xx sets max_num_bridges to 48
(MXL862XX_MAX_BRIDGES), so on a 32-bit kernel the 32nd offloaded bridge
gets number 32 and set_bit() writes past dsa_fwd_offloading_bridges.

Refuse a number at or past the size of the bitmap; the port is then
bridged in software, as one beyond the switch's limit is.

Found by an LLM review (Claude).

Fixes: f5e165e72b29 ("net: dsa: track unique bridge numbers across all DSA switch trees")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 net/dsa/dsa.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/dsa/dsa.c b/net/dsa/dsa.c
index 1c2a29678ac..67b5d2c42fb 100644
--- a/net/dsa/dsa.c
+++ b/net/dsa/dsa.c
@@ -159,7 +159,8 @@ unsigned int dsa_bridge_num_get(const struct net_device *bridge_dev, int max)
 		bridge_num = find_next_zero_bit(&dsa_fwd_offloading_bridges,
 						DSA_MAX_NUM_OFFLOADING_BRIDGES,
 						1);
-		if (bridge_num > max)
+		if (bridge_num >= DSA_MAX_NUM_OFFLOADING_BRIDGES ||
+		    bridge_num > max)
 			return 0;
 
 		set_bit(bridge_num, &dsa_fwd_offloading_bridges);
-- 
2.53.0

