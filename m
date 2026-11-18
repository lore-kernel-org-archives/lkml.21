Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996735;
	b=nS9QTSBR9UWyeoXY4OGb+qbBaAVbwnEjYKEi2Y21d5qZk9czn6grgTlkiTjk2JpXKWQy
	 kPdKUOHPexd0o9omxGZHCaCzAWpRM5qXR5sTx3scKsXtb6STMtgWSdvdOf4vO3vTY8d4z
	 PxXic0EPJs1DPgA3IWkORhugtvj9A595mG4xOOlCmQz0uD+xMQdXQdNRs3vSw4+RxldBG
	 1wDhVwwl7RYqPHX5kt58qUdjuLFW349ZmPaBBsRt/nevJhnZbARp0GNUydah7Sl3VEQxB
	 WCHs5hIxJBCaDEXSLeA3cRZ/PlgP+YYjYPMOgLu3k4orZKywMzTD+Nj3oz9Kenw4G9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=g0wg2R4D4ws9g0qj9z8FjxgFwkWHzS73xmd1tBLqVOI=;
	b=a5mesnLTGF9/cRjRepx77coOb0Zt5V8oHq2vUIRDmP+Rcq0IqkT+OeaRvxnBmOGPC7yT
	 0VnOuM97kTziTB3ftCcI157slBpVL5XGQyXKRNkWiBegO2dYhcBVsHjKroClWe2FIG+LL
	 dJjrvii3Qy0agBfhJxEqDePrApBk2aE+dm4DIOlPhHBbfdyxeNX6a1tM8TDBXjf/Rd37t
	 rgYNc/Z1RATjsmj/FzB/ezOYwKC2YxprqC2alKuSVhSxpEslpZY8XCw2KOsPXq+X8Dsqe
	 0JWhOJw4/eGj6ayxk8hczsG6QWd2pHiJoO4tYADmDGBraDC/Fm1rRXFvI7bKoweXvUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M137R3Jq;
	arc=none smtp.remote-ip=74.125.228.134
Received: from mail-ej2-f6.google.com (mail-ej2-f6.google.com [74.125.228.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3084606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:12:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3084606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M137R3Jq
Received: by mail-ej2-f6.google.com with SMTP id a640c23a62f3a-c410cdcab7dso19228566b.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794996733; x=1795601533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g0wg2R4D4ws9g0qj9z8FjxgFwkWHzS73xmd1tBLqVOI=;
        b=M137R3JqnrXHrCuaq4bpoBaKRlmo7e2gnV3a2TPKEvhnjgrDlE+JNyHI0PyfuvSE3X
         P8y8WMtV1+L5fdMIbWSguYL+5p0ki837DIG+zF16hhEhLKs8eDnrh/Tr5Um+s6ELD4Of
         pekQa6zwnbRv/AXECK4EVb5PO5rl7tMXPYpWMPWJwrGF6lofWVR9yXn4uJIAwSjXea9Q
         xBcfsOjs2kkWA6pDJZo2TNq7L9xwomaf9CfxnoQmkSnjNmdbGr7kYbV7gzdk+MJvzWzm
         nSrZD324xdWlOSNIjsarhfXYzUBwMUs2Vqd0tXnysSR+vWKYKdKUWEMn+uQRmji/8I7u
         FwKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794996733; x=1795601533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g0wg2R4D4ws9g0qj9z8FjxgFwkWHzS73xmd1tBLqVOI=;
        b=McqTkQulP3769VbLp98R4FswdADdI2feJZ8Zng5dcRLeM4pcUBWvJ/GjaGk25SuCwi
         D6e8ovy/KYq2SZkafyxrYE0ikqfQtvZVN1YsVPNxV5IgjGqvSu0tU25kksZPfhnitjEy
         WbU2sQVnEs9B8zpU8YcEOniKPM4R8CbQqLVQBENpsyBHETqFX+6UhJuDacT3aKR/poto
         DCup8Tk6NwwKLTA8yIuviOQOlmxtIT6ZGo+NUipPUjQm4KFCJ3qyzyzFXK7NEbUTRfHD
         7HseQ0yYFRQTwoZo4k2yW780LeE9PUFglrV1CrrySDrCzTsaBNRQ43QXiJlBV2ty/UMz
         9O4Q==
X-Forwarded-Encrypted: i=1; AL+hErEOylpwNyMrvC3JeuP2/CrXx4SUFSYxU3F+qJDSj8qij37V6FsogNJ6S9DfvghCqCmx6agfchajznXw/fk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NOORes6Ik8Vn9v75Gf2YDHCnvDvh4JnzmTCYZJ9ikpYKGmhOP
	JcyAbB3JY16arA0XFRpq1hgL8bvkffmWKbD9aNo37DxojPTe56wD2n6GTcD9AWBX
X-Gm-Gg: AYBFou2NH/+aDGiOJKi9Ftiwh4lsuznH5w/ZpVlcjsQW51pxuvnamUu8zCvlj/SGvUg
	+AuiQ4JRybEF9Hz7eRm3FAnkXayy+8nWLxmbqUnqA6mmrerMAliE1pqoWe0w9Zh9pi9JLxnArov
	s6y5ZU7P2vpHGOb2KnVzVYBoHw+2W7Z3U76P9ZrKfbrav4H+NffzIM14Cwf+vHG97kj3HmcsgrQ
	8B4E5la2LDnrqJ/m/8+2xpv5ZZm+nUmK1eztEa0g9b6+VCGBsGU1PKbRkGriGZ0DfzAD+ZGqpOE
	QUUAXWqB4fmaRh7NNMtKo6OiDd/l7C0y5fFVMK4/xunOlmoZwlSYK7buqDnaUI/kv6dbpnEU1VG
	MXKscCbO/FIUNQ0XgSenvJQQdheuClPz+fFGAIH81+QdWtjx/vPQ8kkqtDTwiMK8z2sqsfQ55NR
	fegT5A8bKxT6Hbg1YzBVwL81961TbVf7OmhOh4dnKj3lVHaTNMm4uniwN4vqPlGhJyEEGitG1Ou
	eO2feJ5Cy6CpnXt1pyekxDefem3g2nmAPVY20wgssKbhCl9lTQphhT67Y4ewLP8dIqEDCg0kDX4
	hLdhVM7Vx6lu/7HQQXXPsjRgffKF4Q9iUs4ncHzVkgqZWB7e0LDvibDofJfy3PbqRoDIErdX5YS
	3Smv+jOrOEopOSARBvLopkbkK8zDSi91g+KZva7tRmr8n5AAs10ZgR7uGCNz31VWK2vwLPapqLI
	FH4g==
X-Received: by 2002:a17:907:9805:b0:c50:93b6:52ed with SMTP id a640c23a62f3a-c510e34dd9dmr172220566b.40.1794996733005;
        Wed, 18 Nov 2026 02:12:13 -0800 (PST)
Received: from thi-server.fritz.box (dslb-092-076-089-226.092.076.pools.vodafone-ip.de. [92.76.89.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c510c83f332sm78436366b.7.2026.11.18.02.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:12:12 -0800 (PST)
From: Thilo Zirnstein <thi.zirnstein@gmail.com>
To: michal.simek@amd.com,
	andi.shyti@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thilo Zirnstein <thi.zirnstein@gmail.com>
Subject: [RESEND PATCH v4 0/2] i2c: i2c-xiic: fix clearing of bnb irq and waiting/ clearing while atomic
Date: Wed, 18 Nov 2026 11:11:45 +0100
Message-ID: <20261118101147.3350796-1-thi.zirnstein@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Resend due to inactivity since Nov 09.
I think PATCH v4 2/2 misses a review.
Anything I can do to move this further ?

Dear all,

This patch-series fixes the clearing routine for the bus not busy (bnb) irq
plus the waiting and clearing routines while in atomic context.

The bnb is used to indicate that the current transfer is done.
A high level view of the software flow for tx:

* init i2c controller
* prepare all registers ( fill fifo, enable irqs, ... )
* start i2c txfer
* clear and enable bnb
* wait for completion
* ( serve interrupts )
* ( bnb interrupt ): complete completion

The datasheet ( pg090-axi-iic, Interrupt-Status-Register ISR)
states that the bnb bit can only be cleared if
the bus busy bit in the status register is set.
So the iic controller must have recognized that their is some activity
on the bus. ( Start condition )

Currently the bnb bit is cleared without checking or waiting for this
condition. This can lead to spurious bnb interrupts.

Andi suggested to use an atomic-save function to wait for bnb.
This was applied for other waiting/ clearing functions, too.

Kind regards,

Thilo Zirnstein
---

RESEND v4
- Add Reviewed-by Tag

Changes in v4
- Fix timeout argument of polling in atomic context

Changes in v3
- Use atomic-save functions for waiting and clearing.
- Fix intendation
- Unintentional changes removed

Changes in v2:
- Unintentional changes removed.
---

Thilo Zirnstein (2):
  i2c: i2c-xiic: fix clearing of bnb irq
  i2c: i2c-xiic: fix waiting/clearing while atomic

 drivers/i2c/busses/i2c-xiic.c | 70 ++++++++++++++++++++++++++++-------
 1 file changed, 57 insertions(+), 13 deletions(-)

--
2.43.0

