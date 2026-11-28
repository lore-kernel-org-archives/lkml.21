Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795884730;
	b=AVJ6oc5K2THRTXv5ganrCSRKsRe4/LQ5K4nPfxnjBD140f2exrZBXdnD/y/5IDIlgKLo
	 Qau5ohqyLNU8lAgsm2qmfCG39hz2G2Uj15+ZfP6GE0LcsnNd0x5BBhHWaJG434KO6xpKW
	 24ozuMmIFNdJe32W9NFNntxfCUuPqSPWnm+LtQb2/YE5Q6CR0AeJ/XV84Di9BlSd69/xN
	 fHcKd3esbHyF2UzD2VFAWlmiRoh2mU9bGZFantaVcZGgpFq1d2WQRiIxdEaeMMBwsQlbD
	 8SXK9PANn+HquzW0R0e1bP7pZxCkmkhQDBIIlcxdNrkOpI51teUVcqwlgi4EdlxXVIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795884730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wBU8+cAmg3igsvdbEi1eUF0PFheTO8LMlB0mvQPjR/Q=;
	b=FNXh8XDf2/ylALq4kToznku/ThibIdECtPO3YQwQJWKGTb9cd7fXpm8Kq12fU/jZuKA7
	 Zyy7pL9T0WdDMokCPRu2lKu3pQGV4xgIcPDlMnb9D66M6fGiev6/FJQS92SlT0c40P70y
	 DWAlK5f9DYbH6J72B+2ud09rVhERl0ckrUk+JcuWC/pPQXe+t1fxnZh5DSasuOl98JRBy
	 +QtlYo1WP+Szuwr0rOk/ys+UI1J/M1OQpf4buNAPqjkZ4w1Rb+Sfue328epGDKuI5x4JS
	 4XBnDVsxTmCEUYsm6XmTdWhCuEh0FkIm3z16w8J2Z5BFBa/rmBNMHdVOkeWJffG2Kjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=HSKg415n;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55235606A690
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 16:52:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55235606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=HSKg415n
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c5126505cb3so1192909866b.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 08:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795884729; x=1796489529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wBU8+cAmg3igsvdbEi1eUF0PFheTO8LMlB0mvQPjR/Q=;
        b=HSKg415ndxYm8VSCkMBcEH45ZWmlTlxYFHGaAptIGCcHZ5/oEsDIEMmdQGzSDJgL9w
         l8Q4TW4QlDSvQ4SOQnkqr8UnhXD7TlYI98wtfoNeEO9YL7hbTfZIh+oqcN/M2xNrvRRo
         gtcRi6CubY+qx+7cTNUmTmjpScMz5rjn/LJyFI9gDDdKegVQSz4Al497aFGhKv9JQW++
         hGh09331a9S70RLvdeogs3irO36LIVs4aWYFdRR/hESswHuGaASVL9WlabO2UIzsAk4R
         rQQ1x01Lh7SycMBfv827F7CcEZWUfkHddeu9JYhn/ZqHBcflQnGmsF1fWgIadSpZ4f4n
         RSCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795884729; x=1796489529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wBU8+cAmg3igsvdbEi1eUF0PFheTO8LMlB0mvQPjR/Q=;
        b=HkQzv1XgwiAfdnmM2wzyqbsWcKpkg00IujiMs1TksZbx5pnx6mF29Pi/s8Qv8sGJbx
         GQKGa6RP55EBnrjXQBLSexzvT/QLexR8TnHJyV/CiS46myXN+64K3E1Wxw40p5klAdmV
         LtjYhGZ0+1PUcLb0mehHDTMv9eTsb9ygFexD0Lzt+1aOxBVfuQRU+7LKa3ON2Jpm5K7E
         ppD1CTl5J/llhqK11TCDvaezoviVlOFl+6G3+z/1nBBfPN+Dlu7jWFU477WIGABOt2Xk
         BcDMPGJO5m9YqlwpA+xjhT3Zp+hbKVFrdTPrADVRFSO/Nv5gdhPy33vU/YMlPMvAxAsn
         UslQ==
X-Forwarded-Encrypted: i=1; AL+hErH3c7LZvBn6vLX7bQL9o3W/WHs/Gx7SZ7zKcrMVPXTArBUaF3sgJvXHKGy1sbOCo8PUDoLnwpX47lGV8xY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QMLYEMcilBg1Yc1mbQDXX4fLY7hb/aYrBzN9aCIO4MJ0RhlOl
	+diDqZjy3ZBYqsVTa9HNxvO8Ul8E+jlqMDDzyPOOAbckcV42SB+5DwYbNBWXowPHog==
X-Gm-Gg: AZFdTZftjch12f9nViQDxapgV0quuq492i+KSifmse4Ydeq6+oiFs6Vy0eZaftQzgtp
	3ctceNgbQ757WPd78m1OijpZAwae5iAkR9S1VXqApWG0joWwoadFm5TF60Oj905JHH50WdCy4NX
	LbyatFepNXW89xzg1JOWXe/hSL+nJFCXec7GfuBseLaBlTilRz7KtmXAaTob2yAfJLCqElayhxt
	izE4qq/1PdGQUbzHgixGcF05N1tGkIM5EmV+UO1nVB3nuZ25AKJoudQ8ibQce9nzVAI7yiOWsph
	MSeh7IPoA98jEOC1x3LhXSiNm66beVIpVg0qQVbT3sabc1FfgZDrKvspOmYvMUua7gP02npsEts
	S3ICHrEoSYiyBVp7JmeTxMpmLdZ2SW0JWgeeFwc5NnA9N058DzqymMwwoRTwAID4cBj8s4XZ/KX
	U/ExxCi2aLLIatIWQH/4tvMC/gjlxwscwrc1WZ/8UjPxCrziUoOYyHqM1Q6XZJvqB7ezkpdYU9M
	dGpoYHS38G+GvrPhXrC9CG3i8EadEp9TCk/KOK8atiM0aqEMKmMwPBCa+rpp1t4NyQpN1tfmSc6
	pzwHpyPanJmEGLsZhxGst9puVExGo/xX5F/tP6jsvlmCL9A2gzJC92R5zh8/1b1q6hdT4cXMSDz
	apjXjlgJ0doYFAI8gHG3jByi/bs8rToV70IjxsuOa3HE4e+pZi02YN9KY2Ve0zL6LkqmbytGiNc
	yBRFanKa91I51ydItckm2ySuDeSB/zu8zMFOZQVFtYv7ENQQ5ofVJWovsuJcEPB3nA1mGCW1G4F
	PpFS6p0xjAKK5YR5qVktLRUNu2ahXS7YsWVGM/V2bMWwGnORVFfdXBAQSIxWbJWeXr0RFsGHfn8
	sE8r0h+xkT+I4Q==
X-Received: by 2002:a17:906:b746:b0:c50:8d2b:4391 with SMTP id a640c23a62f3a-c513ac659d6mr1799294666b.37.1795884728782;
        Sat, 28 Nov 2026 08:52:08 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea3537sm954627766b.36.2026.11.28.08.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 08:52:08 -0800 (PST)
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
Subject: [PATCH net 6/6] net: dsa: keep a bridge number while another tree uses it
Date: Sat, 28 Nov 2026 17:52:05 +0100
Message-ID: <20261128165206.3248835-7-julius@bairaktaris.de>
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

Bridge numbers are unique across all DSA trees, and a bridge spanning
ports of two trees gets one number, which both trees use.
dsa_port_bridge_destroy() puts the number when the last port of its
own tree leaves the bridge, and dsa_bridge_num_put() clears the bit
unconditionally, so the number is free while the other tree still
offloads the bridge under it. The next bridge that gets a number then
gets the same one: on a tag_8021q switch both bridges share a VLAN, on
mv88e6xxx a cross-chip PVT row, and frames of one reach the ports of
the other.

Clear the bit only when no tree offloads the bridge any more.

Found by an LLM review (Claude), and reproduced in QEMU with dsa_loop.

Fixes: f5e165e72b29 ("net: dsa: track unique bridge numbers across all DSA switch trees")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 net/dsa/dsa.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/net/dsa/dsa.c b/net/dsa/dsa.c
index 67b5d2c42fb..bcb398615fc 100644
--- a/net/dsa/dsa.c
+++ b/net/dsa/dsa.c
@@ -177,10 +177,13 @@ unsigned int dsa_bridge_num_get(const struct net_device *bridge_dev, int max)
 void dsa_bridge_num_put(const struct net_device *bridge_dev,
 			unsigned int bridge_num)
 {
-	/* Since we refcount bridges, we know that when we call this function
-	 * it is no longer in use, so we can just go ahead and remove it from
-	 * the bit mask.
+	/* The bridge is no longer offloaded by the tree that calls this, but
+	 * the number is global: another tree may still offload the bridge
+	 * under it.
 	 */
+	if (dsa_bridge_num_find(bridge_dev) == bridge_num)
+		return;
+
 	clear_bit(bridge_num, &dsa_fwd_offloading_bridges);
 }
 
-- 
2.53.0

