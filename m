Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601333;
	b=NqmLQg1sMALpCKyUDKUVidGlNOIOJeL1/p9Fboo6FEbPffekkCjiAFi+YE222R5ag2qU
	 sBVLB/wyuzpo8C4wdiAUasyibm1n+rywDOx3FupPsggvaWVLTg7Uv4gKr3igFp34otHL/
	 ci9JMgbyiDJ3aJHuFZnWA6ZWQmJG8zjw0kXy/JiNAXn7K0/C6f3vlCEmBbG0w0dFR1Kug
	 EQjQrxMUgenMkox4SsCkhKz8SnnRDT7DbOdSEVUFQRXnqYTuHvOuei5JL+SabHsxG/Ldk
	 1p+BFVG3rw2pP5k6s6BZBXuGGP/3CQcCZ5Vz6XA/Bvh1selMPRnxHXVdwzt0XVqyOPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=8RFJnfFUofOUJVeOBHJ0G0LL1AXcDfGe/iXizP4/kQ4=;
	b=agCeMZAFI/gKXyhBPYGyloLBH7sYviEvkQxlkXGSH8S/GG6dZAH1C0TYo5XbUwmXs+cV
	 hmWFLQA5JEZ1FcpUHERXriMsD+zmisljIlsHr+yBUE0ddJQqXA+oTGlLOjZA4O0JnaTPS
	 2r+33TbxXV5f2Xz8fJjsE1z5cR6vZjtnfSn+hOeNvkGvnHmAMgjioKPmaMPBSrO6j0x42
	 U0IQBWw9cV6QHgTVprE5hyTPxQ6ZRw1x4blwZDuvDqkBjs72vaZWFqvrIYWEcVeYTKRfe
	 b7nCP9fLjECd5PQiDZLFDCljA5BJuk7JOhT9aKME/wL3C6PaqsMNAphzIVKUHHFMA2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=a9GKwi79;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60CF606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A60CF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=a9GKwi79
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bba5e17728so4450555e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795601331; x=1796206131; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8RFJnfFUofOUJVeOBHJ0G0LL1AXcDfGe/iXizP4/kQ4=;
        b=a9GKwi79120n4yBBhURyzuvJMs8n2HoUre26B8bje8feS3Qtx/9GZaH1rP15mA6Yxx
         VdYOWxE65FHI1XpmaSuir5ZWL7uN7PIzJ3s8OBRvWY4sCMDxYOitz9YDEwjGQm/nVl0X
         adPc1n5OvSSJhYxFlKIluSnZh54edfOCvZVNkJn8pKFMMRVmc0FI9whI/bPK4f/VSt2D
         RjIgB3oob6aTWHOyHzgU19+0OOlODIPYJUbxjDPXAHPjWREZjdMfKeXHfrh1ATdjO5bx
         dYHYy6vEJ9BYFkLW+g+UpCZnDJFLHV4jNYgJQbLWkjJfKYuKhXeHRUTqp+cSicY/WugN
         2gnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601331; x=1796206131;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8RFJnfFUofOUJVeOBHJ0G0LL1AXcDfGe/iXizP4/kQ4=;
        b=hTiPf1rhqXnRl1FnlGWhzreKssJ6mzdQnw3XdomqYO8L4ZxN6MltgyeNX0GH7APBPl
         TT0/S7AyA3lJSs1azYBGHrGpHUiCOtArDVP82wyt37EegozaSCjAd0VLhQJ0ALr9QsLP
         vASx0xFtEZocbNnJGDUpe9RV75HNtBxGECG7zwMrJcI0w/CNT5d5nf54FOKHT5jivp+X
         V54kMzQVP3kDK+fRCmgWRmxMz1Zck6+8VJbz3/FcIOXvYYXFsb3vC8s/VzChsNDaqNaQ
         b+NrixmfFTg7P2bxxHy90d0d6X6Sfp3QWI4NcazdVpgUrYq3Oihetv+Sey9rveKe2Al5
         lllQ==
X-Forwarded-Encrypted: i=1; AL+hErFuEAp1XA+7sEYEyVFWChm8z/hCM/gY9D0p7a2Bo7AqG1Fe5GZmVX1Wt7VcJHXkHD+Wsce2VfY8xcmZq/Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0Z3RofZEhlmCzNDm28IMQcOGcvZZ+q//vvYJrJcDYyX9cGdXF
	EW8mb0159qar1T8Mzkzu6wp4oSiLxiyQAXSkGHHsnkXXmmm6urtupquaQQ0LwwM3Byg=
X-Gm-Gg: AZFdTZeEEiNcJE1PVl9zx0PzvL3Gw4PqU/LgjUgFXDGriIq6cJKZ+zxRBcDNDxyLqtq
	dy0nJ322Lda7neG7HZKOFOCFSeUSdF4MK7ndZ1Wh7Jc1wBM7vkB1rlsxTubwzNNe9nHy50D5RFH
	BDdam0xtb9VDvi8nZKvgLN9t0I2T8v/0f9i33lcumnAzM2y5LPM16791d7ghC0Zuz7v/jGAqISj
	pcazFuW8QzskpQmLYrgNtP5OoqQ56/JmKeK/Nd4JHLXefMVvWcxk1z2IGcGv0DbDM8hrXAKZnuj
	9hrnkFD36u94p84g8CIciIJpzw9Lq5HgmH6o3GD/Kcr5FCpwIKNd7L1Zc6i/ydF4xlv6fqfXu+m
	zTXt8eTvNGPxL6PhMJ92CdqUwEfDJmVD9gGpwm3NaKC5S+UT+ltDSjXOZA4uV6k40bxw7J/nvpv
	/wmYUgAyZ9FvWZkFzOqfTJ2xswcCdp4Bmy2/zXQJJId+9ptywxn0gIVjSpK6EnLBbSxJdUk1OWu
	4bMRo/7zOK2wYjigiYtbNYZZtG+UadOi4W/l0G75GVvPFMHA+hurva2cJQIrxsvx+W4dpBNB1u5
	+gYDj8SGjNEXvXwmQGRDL1OhbWJT4Z4DTOh3B7Ud3vCat/f1hpzEW1KvuQJutktZ3BWPcPnxqds
	cFDmNLoDTd9ySm7wA
X-Received: by 2002:a05:600c:848d:b0:4bb:52d8:73ef with SMTP id 5b1f17b1804b1-4bb88940f1bmr346869865e9.34.1795601331043;
        Wed, 25 Nov 2026 02:08:51 -0800 (PST)
Received: from localhost (p200300f65f19a9043ef7230869dfba63.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3ef7:2308:69df:ba63])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb853ca452sm494486865e9.15.2026.11.25.02.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:08:50 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Paul Mbewe <paultyson.mbewe@ziehl-abegg.de>,
	Joachim Knorr <joachim.knorr@ziehl-abegg.de>,
	Martin Fuzzey <martin.fuzzey@flowbird.group>,
	Luca Fresi <luca.fresi@bithiatec.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v1 0/2] serial: sc16is7xx: Two simplifications
Date: Wed, 25 Nov 2026 11:08:37 +0100
Message-ID: <cover.1795601260.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=612; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=x3FshVaiZ2bQ7REteKeXQd9o/itPhX2UHimwWozOqB8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrBrOligdbxiii+PmMAhR41FggMFupvbQayJJ2R x/U6JBCXlCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawazpQAKCRCPgPtYfRL+ TthnB/9+0VgDmPwTgmZVpux2mE3nVwoeNUfUOMKTvDQQ0td1GgcDVU7NJl+n1P2aCdUZ7+RiLoc jGbNcL4GSfHr2h7lR46vhzZcY1EPE+JlKlw1WYES0mmBd/+mrNS2CBlpHvtRxRvaPwyDuuMMWpu yyadOR4LpWbcxDTFrVhcdFVQarNkpGqTcKCAzusTUr11mLzTusCS8NcIx9/jRDwG+qGI2H6xFxK l/N9P9I3M0EiNJ8ZL5pKWNGhdWBCChIIlPMhA4/2n3xwViycS3pm8Y6ZfB15OSQaDxj++LU+6AM kYMvRyvB1VGEHacCfQnIc54M+rX23zZhlGkqu/brkvWNu0iP
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

the objective of the first patch is to prepare for the removal of
<linux/mod_devicetable.h>. The 2nd patch is just a patch opportunity I
noticed while working on the first patch.

The patches can be applied independantly if needed.

Best regards
Uwe

Uwe Kleine-König (2):
  serial: sc16is7xx: Drop usage of <linux/mod_devicetable.h>
  serial: sc16is7xx: Drop unneeded __maybe_unused

 drivers/tty/serial/sc16is7xx.c | 2 +-
 drivers/tty/serial/sc16is7xx.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)


base-commit: 3dd8c790a7b7027abdd568e36db5e82ffaea7c77
-- 
2.47.3

