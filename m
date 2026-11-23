Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795424069;
	b=mlSoml98CJKKLITvlmqTbAHkxkHlGC8DhpW0OYGgGXsmGqaNdxp2t0+TOGaI8znHfZdb
	 nrMipd2+LDQSuyOrD+VCWoqpqB50K7m9xEprvtCUs34Tz0t2KYUpT56HX3zGTJMPgIsz3
	 axL4UW9DLA5eHaQWhWs+LdZPYG2JnscB8UEvQvIMJpd8gR4097KmqyeLdzfCl+8zgz8PO
	 VoM7T+UP+2hFya8nk3rGbhJTCPZ1YBl0L2CsdTBhzYfeNiGNp2iy7SS5Bn8PvLsLLrb+n
	 0KNqsK4FjNS6BMUgfwsN7hypvIDpMWzwQFIaj4dYCtmxJS2l3xiRCpoTCpSIMiRxchw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795424069;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vnRwo/ZsMPpWSsncariS2yc/xAKn3Nxe+Kux6J8DtAg=;
	b=xioKCbAmhOp8ur8QSdJMSSX2tufuXW9iDiiS4fihcYQFfO0HLgjnZ9mq8iPYDHBGjL24
	 xrvGrfq1AqVDZZAUE4aprvR1Ne6hci5K5J2RpYI1rIvXXivAidfhhAVkSQoP02KLcVr49
	 CxXDq5QP/oLnN2T6pD2SKxpPsDwk9Ixy7/XyeSMlf0cnZm8FmiQ4y98SLs02w+nOeJxDS
	 SmtPIrXORMs3Ag8ZsCbb0xPyxdA1aAuxFRbpntjOKZx1iZz/tMdzKmqMW7KSaSmGQur+E
	 ElqvZsZc39nxeObnFH17FcKtiw+nUIEVSnD2duAAE6hIhFHgbg+HIzcm97pTcXMsOKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dkd5DuMj;
	arc=none smtp.remote-ip=74.125.228.138
Received: from mail-ej2-f10.google.com (mail-ej2-f10.google.com [74.125.228.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D98606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:54:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50D98606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dkd5DuMj
Received: by mail-ej2-f10.google.com with SMTP id a640c23a62f3a-c5093617c7aso123762566b.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 00:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795424068; x=1796028868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vnRwo/ZsMPpWSsncariS2yc/xAKn3Nxe+Kux6J8DtAg=;
        b=dkd5DuMjnT1Zg0XpG6+AvbHgqKji7n8v+2tMSLraDoy9z9u7GIDQ5GX+/LUkq1svfS
         zoVj4VWJRHLseKMmjRBn3rybbwpcEeBT62LGYFtJ8U/Q3dFbxSrt45GBzgPp/pWz92Da
         sSp6pvMANDwhvmi3V8aNC3UWrQbQMPUH1Yx6j5nnjZJAgbS9CT9Xi/d/wdNU9prxwanZ
         orwNq3KnNbdBV/7yJrETQbJub+HCBeLukgUMDuJET/B96xRQtwgB8RR9xSBWpPyL22I8
         KaFfuFcuNtXYsxTIwbGNtPgFF7rrqH5kJOWNyReKT1e7nr5trS6Y1ebcZB7IT4BHge/K
         UEMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795424068; x=1796028868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vnRwo/ZsMPpWSsncariS2yc/xAKn3Nxe+Kux6J8DtAg=;
        b=SOdO/hChg5QcnD4rLbx41OWA0Gneu4x4aLlphVb0VcO+KAzrOyyUECSqwE3TXQDIhv
         xT9bZj3qn2xvZsjI2XY7MwUN2q3WS9LaCAy4ZfRd2uY97IW7kysFULuaAR1u5z9TsPcI
         cKIVXxhoZ2L/8VevjJN+lDoh4uze6uSGlCXVz2HEqzg760lsQDuTB84bteB/F8Fe7fmZ
         vdp0ffLlYR4W32xFbmCwuuk0UkZyS+9DYXo4eRYverExGv7CNJkQusPItmNyq/DW3p+t
         n+9eMR414zw6ro8gL7bDBttMASXHe1lqngt5IyLwfxLriCOf8TTz69kxn7wjE48LaHzv
         ShZA==
X-Forwarded-Encrypted: i=1; AL+hErELvw0xJpE46fQrXdMKTiBR7uJka7eOprjuzWhm8A7edpxkSR/KBZ+JTXsUAgsdiNhaMw+AJ1RKrbf7Iyg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CXstQb91ReHyvVdLyq9FwVpPsqaqBDU9YsXhWDrVCgLDegp5z
	7jiM818NYqq/WJplgZiFAPsbryffCfc7iLP3+hQFWtVzdH4YHcpZG2Eh
X-Gm-Gg: AZFdTZfo9NXFEirXFPHJoAn1RCApSQpbEd43Rw03jwR2xC972D9ZOYEhzbHgixve5kv
	nkIER78KGQaRyOSHVdNGxpUD/zsAEbQGSsQa/xHz1VrOBAZaW0cdmAi23uhG/J/stmWUNHcwZs3
	cd1iJPsdITDcmczYlcyNuDy3JayPHXedLRSaxfdZeetgKn3953gSbLA7O/4hzsTc21nCp8JPEpO
	FO/vEUoLxJ+AWf8e+PPsWdc8xHpPmIirKRDOm9OWb6tjvD6Lot0VhHz3/7idNMFE9mWd3lm8RVe
	QoAMIY8oF8A1RCxvlE37mDc4g36fqcFNBxKjvsH4f4ySoBpKAV2bBkRcZWeWwr8ZMDRLTF8VOmR
	fkJt9IhzEMF3dVnkWP8mqDPa/QV7ok2r/yIW03dLNKG4vXSQHwLNemxhAaGjiAPheUhr+ge8NTi
	PMi2iU2EuQtI91SVtk4qfqT3MuZIEVnunz0gBUQWe7IntXeS1zxnJIlmjkbf+c3rHPxonON6vL+
	ciVBwUqKkC1i6sCnbMwWQfEtYj6mhNx03GBeEl6pDmvfs+tm7RU5bmVGv59ZIiyiDmOHDhgF4pK
	7VbZM8TwQY7fI2gP9bkESyRMU81Lw+EVYzXIgXOPQ+dj45BecCAdN7+4exnRHb5Rwdj+v8tycOF
	d2g90zXHh4aTFQo/cVWblDFSZPx72Cw9zcVAydItDGXT/zZ4jXCIWAVs=
X-Received: by 2002:a17:907:da0c:b0:c50:5545:b66f with SMTP id a640c23a62f3a-c513a803353mr781995666b.23.1795424067352;
        Mon, 23 Nov 2026 00:54:27 -0800 (PST)
Received: from thi-server.fritz.box (dslb-092-076-092-047.092.076.pools.vodafone-ip.de. [92.76.92.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afdf022sm377880166b.67.2026.11.23.00.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 00:54:26 -0800 (PST)
From: Thilo Zirnstein <thi.zirnstein@gmail.com>
To: michal.simek@amd.com,
	andi.shyti@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thilo Zirnstein <thi.zirnstein@gmail.com>
Subject: [PATCH v5 0/2] i2c: i2c-xiic: fix clearing of bnb irq and waiting/ clearing while atomic
Date: Mon, 23 Nov 2026 09:53:50 +0100
Message-ID: <20261123085351.3415122-2-thi.zirnstein@gmail.com>
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

Changes in v5
- Fix timeout for polling bnb bit, set to 4us
- Link to RESEND v4: https://lore.kernel.org/all/20261118101147.3350796-1-thi.zirnstein@gmail.com/

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

