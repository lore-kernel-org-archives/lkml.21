Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620925;
	b=sEkYIvhsm8LhRSySWwmAnhfd0NOGs/hE7hMhU6UY5cDqqBU+yZist5seP0O6HO4S//Hc
	 7NW/SP/JC/OH0Pz7RTQs1N4HaL/wk2t1PUJYsKk4+gRGmjMtSopEUC6UMDg5NW7O54osK
	 /1iLDracL+MAH3mgiPDi1RBSSVOrXfXYxMtJEzGAGozdDjSJq0BvwkFV/jRYvzldxK86o
	 /x1Q24Gb/tISR6KS/TKWa3wgJBQnmZaZs12Axr3xjomwhNct+gqA1oa+w1r3K94woVcuR
	 aQCUVf8S/ErmPeBdcXtgGCDnHtz38IMqSol+ZS8kmU7sfbJoOU+ZY+8RXLQPSDZZLQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RaW8x3wy2dy9KRWxzMBJFya20NKzKWRFujyB0bIcDJk=;
	b=yrVgDWGZDGHhgjpuxdEF0vjnHBmsGb0/DxR6lgqZMXSbzckUj+jbAaSPuesK4pCLPXz7
	 oCN2vUwC0EJt/TjWHqiDBgKowmkudT6EoKI2qtUE221BYx6T/DXy90gqq/pSxz4k6SLBO
	 uiXc3Rh36gO4xFaVKTig56KfJf5deKYhoHaRN8WA0SSZz0as7jxe/BCyBGXNdVgH2uNc+
	 qHPd0NU8EpHOiUZ4VPs3UvsR9ZQGn7jYkN7xrvrD4RP6tlNxUZJdSGU73hRPmZ7WHEuI8
	 utpgcfhhxFuei6TPsAVW9QUB1CKquru3YDx7o9AfvoC2ufsYRuv9leUzW5itXo4tJ2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linbit.com;
	spf=pass smtp.mailfrom=linbit.com;
	dkim=pass header.d=linbit.com header.i=@linbit.com header.a=rsa-sha256 header.s=google header.b=rjIL0cbT;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD61606A684
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:35:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFD61606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linbit.com header.i=@linbit.com header.a=rsa-sha256 header.s=google header.b=rjIL0cbT
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so40379425e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit.com; s=google; t=1795620923; x=1796225723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RaW8x3wy2dy9KRWxzMBJFya20NKzKWRFujyB0bIcDJk=;
        b=rjIL0cbT0oNZNA2goGo6xIOOUyHMaIJc3CCNC0cQ9u3F8Ll2tMJuAW03iB3ZwRv5eR
         pkEIwRRc9XJrttGZTRAR/aadihv8X4HXW435F4AfkAppOFQf/Z6qg1zZfSSZeiLsC5gx
         xsCeb1MVAXDrkPWqYH74GOtfIPa9DBsgGxuyn2oVIVh26jIv8Nbx/ecSKyjhSuJees+v
         gBL9I/MLVZMs30lUZfDuEKMUQc4pzhnkZsjZZQbaZ+a9aIEAiq4idPMsBQeIwCu+HL3d
         XlYiT1Qfv0Rtsx95kwkXSJ0qEYsEcFWtJAOKrHMT/uY0KPwKPWruO1wmUSektPsfEInw
         Kcdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620923; x=1796225723;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RaW8x3wy2dy9KRWxzMBJFya20NKzKWRFujyB0bIcDJk=;
        b=vJA6kez3Q8/wJbEp9evIJh8LUGAUO5oTSLo1Y7++raunIstlbuhqfHndQmvBd+diIK
         PjMIDdrgJqynAr0XSIxUUjyymWcCeKgDEy+X9SFMnYYxXR0rCZyvjFsjOQBk6LgoMFu6
         0HOxnLgxIndMMMrw1aUpFFh3viWxqw3VJJ/QWfI+gKOMZTId76iwNOHGhHjMykUeXY5d
         iPKhhCwuYfPZeslbVvyB9UPonb+vlgn6h6ZC/bdi7HFZbujotVhJhuZupFmhlreKavNh
         qtqG/5ysyw6HYtmgADQvH57s02O/oSYPsJVmMWNGVaOqsktGn0rbUkKxGiIi7CNFITUa
         0/Jw==
X-Forwarded-Encrypted: i=1; AL+hErGoUNO2MfVTlhaAdQXqPY7FlcIbizGfc6imYB2XV8sRKS7iR7AkzAZ7nFbef4fXxXUNXm2H3ijakiq0gvk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aDCXNksXk+G7QnBincUWIY1fFekYF72736BVBzETHDDviTvbC
	JPpizDtYiCB4PF30CeSeuVapwRF/dhggKzOXaiFcugCMKybhaRy5KkcS6JrWy+Ui9Ic=
X-Gm-Gg: AZFdTZe/NefFg39D8SijVFBacWNVZb10FeTeZtGZwqPPSnODF/i1Jgtkkl57/YJVhPY
	3q1GY4I368fBKMuz66xs8r1M29z0w2wFujYIZWhVFOelDH+A5Gu8A+RjkHeoAtVxM+PfPzLSLby
	EUiNhP/5BdVlaHFSSjGTeatxN/uxRZuO549orbmEoLPhuPWXUijL8t67lXUuGjavZbsFJ5K2Z/n
	cDaA218POeoSxFTs61RzJG+tNgzWDWUWKG36Ud4A9DIqrqkfrHBZwWlFIbimRr5IfjSqjVG7euM
	iKc/Nhkn1N3q+UIP4pBYgSoYF6x6xu1KoHl6n+JIv0vSeXnfwEpCxb++Ke1f3TC9aP7F0naPkKN
	SDWYBMnrhd3qsX65JEdXRYh6thnZCvI1KPfY67v8jgcUAcpi4ck8lns1lO8pEdneA0L/yooXs9q
	AMLAJLOL183RuiLK6OCKflMbIoSNgjXWB4pnpgSCpJKMflp6oQswdf3et2funoKCiHEYDjYnxnd
	v3xon0GP4ZcRIBTsBXdb3/oqznPWB7aPw5gUoZ46b635fAENGn+o7+7+fBqJ5t0r1QUYQDwDjhJ
	Mu9ZyNjg7KL3D3GiPlPmRNipk0y3eojABfuNe/WqDo6eihPBFPYtoFRoXD11b3xZgeH+iHx5NvT
	f/tj9XbHmqaxZF+u+XnI=
X-Received: by 2002:a05:600c:3b8c:b0:4b7:6c16:7b43 with SMTP id 5b1f17b1804b1-4bb8881d019mr364067455e9.10.1795620922993;
        Wed, 25 Nov 2026 07:35:22 -0800 (PST)
Received: from linbit.com (h082218129081.host.wavenet.at. [82.218.129.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm35816275f8f.3.2026.11.25.07.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:35:22 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: drbd-dev@lists.linux.dev,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Chuck Lever <cel@kernel.org>,
	kernel-tls-handshake@lists.linux.dev,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org
Subject: [PATCH v4 06/21] net/handshake: allow the DRBD TCP transport to enable NET_HANDSHAKE
Date: Wed, 25 Nov 2026 16:34:56 +0100
Message-ID: <20261125153511.3060599-7-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261125153511.3060599-1-christoph.boehmwalder@linbit.com>
References: <20261125153511.3060599-1-christoph.boehmwalder@linbit.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

NET_HANDSHAKE is available only to the subsystems it lists: the SUNRPC
client and the NVMe/TCP host and target. The DRBD TCP transport uses
the handshake API for TLS-encrypted replication in the same way as
NVMe/TCP: its BLK_DEV_DRBD_TCP_TLS option selects NET_HANDSHAKE.

Add BLK_DEV_DRBD_TCP to the list, as NVME_TCP is there for
NVME_TCP_TLS. Otherwise that select would enable NET_HANDSHAKE with
an unmet dependency.

Signed-off-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 net/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/Kconfig b/net/Kconfig
index 76ab44aa439a..db53f7474b7f 100644
--- a/net/Kconfig
+++ b/net/Kconfig
@@ -92,7 +92,7 @@ source "net/xdp/Kconfig"
 
 config NET_HANDSHAKE
 	bool
-	depends on SUNRPC || NVME_TARGET_TCP || NVME_TCP
+	depends on SUNRPC || NVME_TARGET_TCP || NVME_TCP || BLK_DEV_DRBD_TCP
 	default y
 
 config NET_HANDSHAKE_KUNIT_TEST
-- 
2.56.0

