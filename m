Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795006087;
	b=Z0FUyu50Qu59DWCZLzbZhdXKnKF9Iuspsz1Oez+LlKPBY/xxJ5blFMPsep4w3RAx2O/1
	 p8o7wUjZpvgp4Yo8C4cokwV/oXmv02jlhm6kf172aHOK655m5XmrkNnpsHVoOOaqawh76
	 TLmA8N90eZjVVipjUEgU4OmZORlxmqZPJREk4KQDOL0EQ4TIUP3Unsrby1Sgrx+hJDEu1
	 SfGmFErwXuvA+ig7DdxG+Igv3gQZPv2+4XhhblspA8ANtiz5TgJ8ROtKLAPc9eZGSsSTe
	 bF8qOxIMyoGXj4MveeT7faHGnHk37sUF/KbkNbWZeDLOX3w7aPSj+kvOXeknW4hffEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795006087;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LjfmYi6jxAobL2J/ncBt2ONxTq2J0U69VJpQ5IVs6qU=;
	b=iMTGl/DvtEW/9LlxN5qGa2A8bV2uh6LDaa8GjBcfLN50mOCdO6fsofi6uf6APZnOuqQ8
	 EkPkVC9OnRzpCs+ujXGFhZoxNmfok8/jprjO1CHUZs1Xy3c+AuJSye3M78jrKXKUqdV+b
	 zYLYLHvli0YmctEzn1LAreXvFl0q1fBUGLNzOVfHthK8i3Ux+aMJoWMS1xd/8F9EGEYNF
	 hdiUvK5/Ts4g8AcYd/HOtuMKP26MKSnv4/RytF4KfNENZnvabC1WjoLU+IFs7XZuYTwyw
	 611gOA+DoVdZd5+Yks1rsS0IHmaf//8cNWdzz+M98WIPldXpRREqYMLSD2/yuAMIuJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tdk29yw3;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E77606A330
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:48:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45E77606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tdk29yw3
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2efd993e9d6so4176705ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795006086; x=1795610886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LjfmYi6jxAobL2J/ncBt2ONxTq2J0U69VJpQ5IVs6qU=;
        b=Tdk29yw3/PRUl38+VNvz9P8HeVNbv/SXLOtLIZdOIz0pPeo9ny+AnQ0JTzs/oGlqxD
         EAJG0Auya2snuQ5mfsVmIL5uZXeEX3e3odvhDwwBaw01oT/obzyGhflt+2xwPtpjqxuL
         6CGDnwVPGxZ2C11PGN5I7/YS0x+41+m+fJdX8mZtoHF2uWrj1zpbo8nnVNUa0PLlJhFK
         0F789cia/Cj5tXTZF0A7Sj/d4dJzoNDY5AUtsRregNUm3qp3kupQO1s/j6u4xRf0gTgs
         9RCvCauILyPsYlN+dtT5ExsFzLu37Z3YrGnLDBeGa6smWRYWP60/hM+0mmNg+ilRvPRT
         5FBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795006086; x=1795610886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LjfmYi6jxAobL2J/ncBt2ONxTq2J0U69VJpQ5IVs6qU=;
        b=OCur5FgkU9A3FWrJCCSk2hg4bEa/lnrwIPO+jKub/p1cCXOIZPTz9my9tJuz/czSuR
         6AvjpuX9E5T7vxzdUdrrlKwxgh20/sLn2mrVTXVw2w3ohtBe/MRd8NEzwKNQJ3PUSOwU
         3bcdqmL3VOyI1Vc8D7FtYhMxY/jFZfZ+zrl4BJbjdTQoRJUKCHOKqb9fhjNI7KMSo1nV
         Pz/OdVH/+y1yt3gQfn0eFHdVVXai5eRAukZa0flzy8cIeXS+ZD0vBHnQwgyxqsFC8nQP
         IfLq1jKtDkA8jhAwkjDb2qBvXXz0IXxRc/upuksv4qZeiRDMMLu+ObSjlWzKtjSlZbkn
         k7cg==
X-Forwarded-Encrypted: i=1; AL+hErGVtW6/SCgMHlb79NJKOU1M0fbIQnBTudhOKDpAJWmCr6ZrsdjXPSxObHCdiYYQfIvcceBl+CqyNXk5Xto=@vger.kernel.org
X-Gm-Message-State: APuU4Z81XxxjJmz3mGmRG9NZP8naVbcPqwU2O17yrbZNydL0guMRSqGs
	RF3qGMVEHXVErH3gyzDfWasZIp7rq1qiW/qeo1wXm5f1iP+6KQGwCHU2
X-Gm-Gg: AZFdTZdzBNwbAWaIAFT1iF0TmHZRiu8zNEiy/Pp1r3YN4wTRDbz9YhPr5V0RSPt9aF/
	1i5PhZ8o7fYMC+LDh/TF47wvsF7epqYmd72g13Pa/NfjW58F05olFb2pvRCwm7HvFUvkPLz1Sfj
	kKfexiGwu2RsNd6PNJ9HD1tLxzJkFDzS9RpEcaLjx0o1NMb1t/U6L3W5DiIuozQtwfxMsYMdbyq
	SOQODuetYCWiRAGv45M2BhfaLI+u7DzaMrqWVT5PPo8T2WjHPbMJMx5mCbxUVpUGiyO6Jq55lm2
	5CviPueFAsN5LWnHxS7cYjQcyG/6tmLoQv3as5G34TZKU3O0FknrdZIBkdIS8AIYdBhbwKhb1c7
	fTUgobiRLKRyVOqb5OqOoVVDEjQhy/JsUBtD/W4EepaI/w2mBDOmWX0RCLe7uKlPxBZv2+TMvSK
	wYKtxJld1qEpiy32NwM0BF5MTwz5500yWmOslavWLV/u8fDoTcQPWw6zGnYJ2/kbPz4xl/yuzNx
	x1/Rj0G6Cph7jzWFcVaXpUs9vLSKRbeZ/37rF3rG5Q/EjgOUk+SLVI4tXWzRAp0Q1EICP+wiS32
	MAHqoYbNeKw1MSpd1WjDRhMgvw88E7THzqdnNM+BqMRUPuXmJpgDdpqhiNc=
X-Received: by 2002:a17:902:cf09:b0:2ef:db5d:59a6 with SMTP id d9443c01a7336-2eff75209famr17213905ad.23.1795006086041;
        Wed, 18 Nov 2026 04:48:06 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:2c16:ada8:2d24:d03])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6214f4dsm12775795ad.43.2026.11.18.04.47.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 04:48:05 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Michael McAllister <me@michaelmcallister.org>
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	brgl@kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_bgodavar@quicinc.com,
	lumag@kernel.org,
	mka@chromium.org,
	markus.probst@posteo.de,
	shuai.zhang@oss.qualcomm.com
Subject: Re: [PATCH v3 2/5] Bluetooth: hci_serdev: Track whether the serial port is open
Date: Wed, 18 Nov 2026 20:47:27 +0800
Message-ID: <20261118124727.2330-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <179484638195.54009.8903355214693287470.wcn3950-poweroff-v3-2@michaelmcallister.org>
References: <179484638195.54009.1916641645532262287.wcn3950-poweroff-v3-0@michaelmcallister.org> <179484638195.54009.8903355214693287470.wcn3950-poweroff-v3-2@michaelmcallister.org>
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

Hi Michael,

The hci_uart_close() hunk touches the quirk branch that clears
HCI_UART_PROTO_READY and closes the port. That branch has a separate
race: it clears the flag without hu->proto_lock and closes the port
without waiting for write_work, so a transmit that is still queued can
reach the tty while the port is being closed.
hci_uart_unregister_device() already clears the flag under
percpu_down_write() and calls cancel_work_sync() first.

Your patch does not change the ordering, so I think it is better kept
as is. I will send a separate fix for the close path. It changes one
context line of your hunk (the close call), so it will need a trivial
rebase on whichever series lands first. If you prefer, fold it into
your series and I will send it to you.

Zhao Li
