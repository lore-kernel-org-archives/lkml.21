Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795335787;
	b=grhFaYR69JztIdYElb1TEd6zbwJebhUCRuzQbLPNZE21rJeReo5YXqdoBmvtsdYxiEgo
	 g1WanSeEyk5Pty2BBoGGqGG1I8hj3z7PupbvVvlZP4yp2vqqiCG0yUAdz043OtEGR/W2I
	 0abweX/Gk+ijclciJJX/SvWJnsYLLdgHyCFIBqRIvUFiyEBXibJFK8OMr11X86s796Bfa
	 qri2aUMpHgqr27Nej3kbLj7sdHfwWYCMg6F0BLz1hjqhLf8+RBglxwQ/Lw1RGqxe3UG9F
	 MxOPsQQHTrxsWeyClcYxdS5QWHH6UowB8b5/qN1amQAZddRDXYXBLwFAh1TkW8LySFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795335787;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6akX7pzAHH0ivf8SsSGJ7CYw3qAkgFrjvzXEYBsaGuI=;
	b=Iv2nf9/qxTfNpFuB1zLm05Q3KWmeYYsmEv5hXBGFA/srg98u88D5B1Ucl/hqpF+7wA16
	 Ly0fiIxTE1HC2SJGMphzWrwQFVd2y0geq0qyJem/eyXQ9iYzdzxgOTQgCHRdU80bG8ibv
	 l6N84jZjOv69kJH2+1r6JagTgvtDZmsniU/QvJXjnWSOMsoB00EUlV5cVqhNSLD9Qe0zE
	 rqSm19j2Kyn3qw0Kr2KjBDLfcGJXZkjJudebo4WWEID/AAmmdc/w6Zb7vYGkNvh/pP8wH
	 K1Usp9V7N2RDRV7dBzeqTIZyHsngp1cVYCBKk3UJ6C1hkNlndQQIhBlxapjBsLkmGcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uy+MW7EX;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5D1606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:23:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C5D1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uy+MW7EX
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cddc250d815so843150a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 00:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795335786; x=1795940586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6akX7pzAHH0ivf8SsSGJ7CYw3qAkgFrjvzXEYBsaGuI=;
        b=Uy+MW7EXTLIpQBzhIhKP63fq5Q+zqrn/Jpb0imjgiKMDFrrt+OQ9nVUz/T/afveEGj
         dt/5U+42E9umaWXPuya3mQYpWFCpaS0VvPDOU8HPqIR+df1ib6rmAyZ0TAgwNSTYJ+Sa
         sWlhJTacjQqNDNrIu9oUMs6ub/2QNGLkb6cf2hHNWr+sP3+U3gst3F/IIgdyK6bOucc+
         Kqsx+5olkVWetZ11Cr51mWE04jjGROljhZDU5OJoiKnq1LU/ew/IkZLxEvrX/Vs4P5Jx
         K880+r1RSuaHP+GIVhRtRKgi6EIRdFfQz1PVixhcJxzUbQqEqkh2+KnpYfdp8y+tNT0r
         zKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795335786; x=1795940586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6akX7pzAHH0ivf8SsSGJ7CYw3qAkgFrjvzXEYBsaGuI=;
        b=nweW2HZNdWcw6CeH4blP+nDQahYOKysa/rmWkwSoj0ASAaoesQGmOklvhEpzAEsqXg
         YADndYhOCv/Pshc6CCRK6uBpch0wManmkNR/1Ks5wk66YqQ7XXjKtpDmLnzuUpQro7Pq
         ZkbwwGthryJ7TJGYrlNp4dXLJkeW0OruCSdVsWjPtu7NBJ6T/CLsR4yqWuGa7aUs3RoF
         bON8cJKbjqdo7wKJRdMX0EyQgG+mB0cjQfk+JIm+/QLSWLqKmOB+3+5Mff2kT4JL7s8F
         64+E4aSlTxxwbW5G2tTpPu8P+0eNLM8KLJuBuEvEGV6YgaFO5j/HDuBISrx93h/gvmb8
         WW4Q==
X-Forwarded-Encrypted: i=1; AL+hErFF6J7l3p7PIKef5peV+h9sIUs17eniw50ZfryxX4nMvzHjurE3XBsdEmjFCpuK/AXDP+7/t/wA1v6SzN0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Jofvykglc7vnjCzTLqFQ58gVz1okURGUTN0BO++iExjmMvckc
	DWE1UN7AbTo+VnZPfT/7lXQLbFofiNreHePyBYJ2mRtp2nsG6cuWPtX+
X-Gm-Gg: AZFdTZcQdOQWA7EDf2R3BVqsiiJMxhQH5yzINV7cJI6TkyeL0FDSZl+ufXJvNWwJotS
	Igsqet/GSkA0L8xd/H/w0hZWVrVki1dCgdbb0snS6tQwhFKWHoUuf2QGygdIsAkrvQI17c6CmhL
	N2wGYtLt+9OucBBFSxxftApU6A+Kol89YGhuMBK7mM4inxFPAJN6/7rna9K8KYjvniaizmmosyQ
	uAhgFZQEkQM3cHEm0eBzQE4RRc44vCaBMOgtdmLU0EofPVTgfAdNN7YOYBqknjDNFZoq6OkObG3
	YgvIUnsihxC5MPPWCZeWKNUugJinhXRBUCDMo5ojhWwQzKYUd2LNtHlPfQe254XouKfaz2Eje1j
	WXoTzkM15RB0QksfdsIKi0+czb972zDEv26jbYjDF6iOliR7AauM1OifWEae909duYS9TjApDLQ
	WK/WXIrRk/3LDMHkhy8y8NeY2Jx1Iwv3tcEAGiY4SD4lL1s/9oa2Y8OOhK0PP+Dwjnk5tHtqM8j
	+gvyslavLLBugZwALWWAT8RjMyIg2M+MLAjQ+4YBRD3TKlSxDJAc/mQ7RDu2wAtFQFXsW1o8EyV
	cgHBzqwYo/KMjwUU107C8UPHpxPkOd+ex2+PHAUPDVQVZaYLYw==
X-Received: by 2002:a17:90b:2f8c:b0:3b4:1997:3495 with SMTP id 98e67ed59e1d1-3b41c9613bbmr7277675a91.57.1795335785650;
        Sun, 22 Nov 2026 00:23:05 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm11723350a91.4.2026.11.22.00.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:23:05 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: broonie@kernel.org
Cc: florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-spi@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH] spi: bcm2835: clarify native chip-select fallback
Date: Sun, 22 Nov 2026 02:23:02 -0600
Message-ID: <20261122082302.170387-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Document why the driver uses GPIO-controlled chip-select instead of
the hardware-controlled native chip-select.

Also explain how the temporary GPIO lookup table is used when the
device tree does not provide a CS GPIO descriptor, and document the
fallback's limitation regarding the alternate GPIOs 36/35.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 drivers/spi/spi-bcm2835.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-bcm2835.c b/drivers/spi/spi-bcm2835.c
index cc5748973281..d4c938fa3a23 100644
--- a/drivers/spi/spi-bcm2835.c
+++ b/drivers/spi/spi-bcm2835.c
@@ -1310,13 +1310,16 @@ static int bcm2835_spi_setup(struct spi_device *spi)
 		return 0;
 
 	/*
-	 * TODO: The code below is a slightly better alternative to the utter
-	 * abuse of the GPIO API that I found here before. It creates a
-	 * temporary lookup table, assigns it to the SPI device, gets the GPIO
-	 * descriptor and then releases the lookup table.
+	 * The hardware-controlled native chip-select can produce short
+	 * glitches during transfers, so use GPIO-controlled chip-select
+	 * instead.
 	 *
-	 * More on the problem that it addresses:
-	 *   https://www.spinics.net/lists/linux-gpio/msg36218.html
+	 * If the device tree doesn't provide a CS GPIO descriptor, create a
+	 * temporary lookup table to obtain the GPIO through the consumer API.
+	 * This fallback assumes GPIOs 8/7 and doesn't detect whether the
+	 * alternate GPIOs 36/35 are configured.
+	 *
+	 * See https://www.spinics.net/lists/linux-gpio/msg36218.html
 	 */
 	lookup = kzalloc_flex(*lookup, table, 2);
 	if (!lookup) {
-- 
2.56.1

