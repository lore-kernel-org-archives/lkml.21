Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795343015;
	b=2RH7CKzQA6XumhQFOZFTDAVbtfkYFSDnjZCciFHWLX1xmgkEVMQkWPGf8JxM+nGbuTgF
	 1PO/1kA9l5JmmVUpBNOicBXaTVxsWs4nqbMVA3dk4UnZJphwINRMG+EH7nm493PuNpsda
	 Kq73RddDc+/vjgsPQjquJ+PS1gngTUZOs3/Zj7kqZWj2xV6ncvN6yKfE2N0/aG/AeUnXj
	 V5zD9kao770iVAywjrV2heVm6Wxsci09Zbjv8I9m5DHkrBkO/77ty70pToPylBl4Rj2fP
	 DdhNvgDg7BggDHKKaTT0x2/N+aSKHn+NllULGBiluwTN09MzbvY01PTjdFyJK8v+UvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795343015;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cSubAhLf2nToqdpyL5hNhVaoMwlhz2nCl7Gn87Xueqo=;
	b=M08eFirZMDP7NNu8oYyZBHOxw9uQbyCtbZLZJm4sKhhIcX8k8OqTobsfUTF/n7dhUOoX
	 zz60qD/tCJBv+vBdsTcBAJxvOQOY1VNxKWEJjIbCTTV+aID1imbBWXHBrjge6d4wQlTwV
	 fmkNMHShLHSA3NaMRWDGqCo8I7vlT733I1lcUWwA7K6nJ17L+WQRF1ib1J5ykgOMeDdHn
	 25UfGKERqqo33SZnPRFu8oMfDhinnx91GmSzirr9ZBqiUsyjQqPOymEZ5Enn9IYhQuGgJ
	 RcfQTXlzFFwVjAOX1WJE5zdnHY89AaXKKkZtyGk/WIkYy7xO+xUUtqbT0xvX8Ec2akw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UriH+rnc;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD2A606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:23:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CD2A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UriH+rnc
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2f052ae3c86so9982445ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 02:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795343014; x=1795947814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cSubAhLf2nToqdpyL5hNhVaoMwlhz2nCl7Gn87Xueqo=;
        b=UriH+rncW5dbSem2k/IMc9Kh+RX8VYHC4eywgNMHqwQRSEq6rZUOBfKq5ywV07S8wv
         yImnubBBBgIiR3KHa6l558qnoyw9fUfwGg/QX0rLcHz1icT7w806qTQcJuo0zAmQ4sZd
         EyWL8eTiFIGcmqExv2CklrPO3Q+CpX5vOC68jofIDNjIBD4SH6soHvTdTbHbwmiNkSmP
         aQtxX0RG/62iqUVCG0jbq/m219Dg+A2fKenLBKHrBt7GAZ5F5frWQz2T/6Ecb3UcUkvf
         /rnURGXNRiyy/ZdxKrPSmmfzlVQixOO3jGHj/iOc0lQr2p4dxae/7HPVnpzMWSCXdOYx
         WQBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795343014; x=1795947814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cSubAhLf2nToqdpyL5hNhVaoMwlhz2nCl7Gn87Xueqo=;
        b=i9SIvDIkSPB0I7l8LRMRrZzbLdg2USAWpgvycr5mGLeuaSWtzz9Gml30MxUq1TV0As
         fQkbON2qBTymmpGrOWTJvOPbbteglowXJlNxwcB0TuqLP/ceso7i/Gobg4iAyQ1vnLUb
         U5wbKaNIchKSKh/EJxlmwgZeaIsLdw3/P6G1OwTmQaCdA3PycLb2C2dbePOx+njw8c3Y
         vfk74JRw64UEMiO6S0QvSEWjpA0B/7ZVfe0seTZP0BjHixb1LPEyhiyPeIs40o0cBQEa
         OllUivfeHzzC9q3UzU1gxw+19hcgvNh9coDONjLQrqhD/2AaXCzSV7RxAq61VOMpBjaN
         0hFg==
X-Forwarded-Encrypted: i=1; AL+hErGFQRswRddbasgXvXK+p8SiAV3cBc2/m7ld+/Jl59BZc3XYtOBD/cIzXhB/bmyXT7QrgrasL1HNqoAC7Cc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2hsBWJKyIWHM2A3wL0kwJqlxwngos5kMlOmckHqESW/CutDta
	hePpRD/m/3CAUbNs/TX0LaMVOhclhka6rWjTqG85q95ItgIU7/gcVjcNd7t/T8klMx8=
X-Gm-Gg: AZFdTZdY5WyF+exz84t8S1v2dr2+O3FTUlgBNILS0RwK8ionRobL9QgOyktwMozHskc
	i6G1zeP04xFs+XFfVZd04TsTQhES8Y1jCBybmbyt4pkgIzGQi7NzSk9+O57ps3LJ59PoR47qjxA
	lDa1Ok5ILRI2V06NaFTwGNG4vyjM/Gdx7l9RguIxiSSCKNLhaEtAmIZjslakgrrtojo+Vu82z/U
	3xJyGuyR8lQXRQ2sKF+8Nn0khdS9/22d5bX8G0qjzN2SWweUCEXhkv11l8hw1Y8v+xplvjlz0SR
	8UjcxILJTYwZfCFVSdwyPpC8fTVOf6eqKSTEd/gJc+RdY/tAqiQ+30PVaaYNOJRE1MT1jsdQPJY
	E5ux1vBHMo6XMlienXSlv0zWLGApiFG6V0BfcklHSqWn9Jel80aBpMTfkQyKk7Q5eEqZXEixuir
	Ghxgm2WWc7oF+zzwbvd2rlvzHAJz1YR0xnmuCIxoBG+kX5yZyy1LkRRFwC5NkFBZgh2b7JqmUdQ
	lxCotMjkcTe38VzIEhkjJvY8SP2zR7N+B6epWvgauWttErKapvs0bXrKI/fmiAFCrys9FkdV6bj
	OgSes6JqxNU8MxtFNw+K50/Zv6Yio+gG0/5ZN7wtZIow5e2CYvE=
X-Received: by 2002:a17:90b:4a48:b0:3b3:b5b4:e4a9 with SMTP id 98e67ed59e1d1-3b41c7ac07amr7895999a91.3.1795343014416;
        Sun, 22 Nov 2026 02:23:34 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([134.82.71.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41aab4729sm12098095a91.0.2026.11.22.02.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 02:23:34 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: linux@roeck-us.net
Cc: artem122novak@gmail.com,
	bcm-kernel-feedback-list@broadcom.com,
	florian.fainelli@broadcom.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org,
	wim@linux-watchdog.org
Subject: [PATCH v2] watchdog: bcm2835: add newline to dev_info message
Date: Sun, 22 Nov 2026 04:23:28 -0600
Message-ID: <20261122102328.207524-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122082943.173681-1-artem122novak@gmail.com>
References: <20261122082943.173681-1-artem122novak@gmail.com>
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

Add a newline to the watchdog timer initialization message so that
the message is properly terminated in the kernel log.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 drivers/watchdog/bcm2835_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/bcm2835_wdt.c b/drivers/watchdog/bcm2835_wdt.c
index 755954cbadee..df08236d2689 100644
--- a/drivers/watchdog/bcm2835_wdt.c
+++ b/drivers/watchdog/bcm2835_wdt.c
@@ -213,7 +213,7 @@ static int bcm2835_wdt_probe(struct platform_device *pdev)
 					      SYS_OFF_PRIO_DEFAULT,
 					      bcm2835_power_off, wdt);
 
-	dev_info(dev, "Broadcom BCM2835 watchdog timer");
+	dev_info(dev, "Broadcom BCM2835 watchdog timer\n");
 	return 0;
 }
 
-- 
2.56.1

