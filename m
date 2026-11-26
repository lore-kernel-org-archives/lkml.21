Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690199;
	b=WCxwEe5urSfIWbmIOeGoO16EDptiDrTrxhGk914PV+8uxkxmyJGbSp4Zc4I0LQUFrkFY
	 BB30Nw2pSZv/c8sV3Rc3Y+KS0z0paJPh+KGn2vNct5sjJKBbr13lwk6ONjy4n0/RGRYY0
	 /p/ApmOUlnRgHUvPy8gQHRSHlR14dS2gxyg4WpInhHwGOpHD+P2h0DImDfCT3CgwwDEuy
	 L3Aes4+qgAXM9gufGg6qVpgWeUJ+8D6gKyfYvx/TUTug3qdr0zEE0OWsbQr6S2EcFwSpt
	 RvJ5NpbFaeqCQtWKtxzCLvU0EPDo0gVl1wzz1wlp3iW0z76ATQZy6H6WRXbmzDOiJwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HKsMEH8dY6nrgiSxIOyCac2CumphTo4mC8nhOJyOu4Y=;
	b=Yltuywcss9Qde95hEKpkX6kU6/FzORMLd8uJ6e05LNyUqc9VEFfL7LCLcoOH7Dtdxc1V
	 zIS8R6cEPxmZ7TLzYkTJhnUGBO7hWMuPowJ/iAJBa1cej9wUyk77LBCsMrIT0j+fnA/wS
	 DcqdpJkJNKNJlaYJqvAfq3gYCB6QRMJpDwKcQ2f8Hg22c4t53twTOiUD6NoTvlnG5kDqu
	 q/1FfQLXTm8Z69aPaqpyPnoefz61AMcj4ob6rAWMZaam4UtjlB8se+FH9TeFe/kh3nyjW
	 CtYwc/dMgjH8BSJE8InV0SZYLo5+6ZpuJxuJU3J699XBoWKwn2ML0rkO4obvgBN7nyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=icFuVbhW;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E40606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:49:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2E40606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=icFuVbhW
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a73fdd2966so4970455e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795690197; x=1796294997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HKsMEH8dY6nrgiSxIOyCac2CumphTo4mC8nhOJyOu4Y=;
        b=icFuVbhW7SCowMEaY8foQXc6Ug6hI8KSnNsaFcg/6KdBJFOmddE8aDaHxZpRDhlF5d
         pdCyiKoeaYhqNvnn2OYZU6PxTECwhS1dWoN95OnR7qEEAlCD/6u2rnhWs0q7JQQVwlON
         2pjp8pjPlJA69x9bpB/TWwLwYZ0evpeNKwcu7+i57E0CfzR1pFXE4VYZssUGYxT2OMWj
         fJM7hVJjfd7Rm2ROSXN6MJOXhsrqvhg0q7Z8iCLK8x2wbWqBG8XECbwj5WGTU8//ewey
         8j10Ny3qqoVtCHbuqTZPh69p+7y5VilrNy1BqYZFdax2eFo3hYidsPapThvHQnH6KI9b
         /Kcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795690197; x=1796294997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HKsMEH8dY6nrgiSxIOyCac2CumphTo4mC8nhOJyOu4Y=;
        b=z3toKbY4W5IPZUM3wPrqOCcP1nzkuoUJSHM47/k3pILjHO4Y0pBuTbFXsU2xZGD47e
         A7+5vh2/TKLel+m9nWswYIaUKPSXGWdSETHpkobJIjXvhgSbAFiNq3oSEoj1hxpusGyh
         dNL1SwSeDBHWuV9HfiWUqBBlgTmQCjjdcrn7lE9rR2MybXbf77AioQm5DAFuvM4N1nuI
         y3XGUR5eELWHoSQVy3QTuyZsTjJc4pzNOC5Or0vNB//GtRHYe4RWYQgaZMn0j6RM8NqX
         RP0+hi64RESTjbaIXc81mYyoVZNjrAzW/1E/MLWNnJcaDkvr/n0/ZUTLlSEUx2jVtrEF
         8KzA==
X-Forwarded-Encrypted: i=1; AL+hErEYnVGn9V/Hvv7IfRdX4nZM5dZmsMe631BOZsGPrVF7ms4na4WltxMDPdoye6J54Ji7vT3JGC5aR+EOMsM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1aKYi3zIbRzDcOQhGbcnoRcqeUjQSozfJf8npkHTcCy/5dOFv
	+pkwBtR8LIfhqMOSTHtvY4UhCJIGVMroxuIGWnamaVyodI9Gp4zNa0bN
X-Gm-Gg: AZFdTZeR3foAXi/iSoKTwK5BurClccF5DwUxGtZTHcTLsQWo9uUorrLa25+eIj0hQyI
	oQASCbo+JhMT+sxeSQMdiKxN8Wht78C1FQoHmmMpG32BW9O9ZCbSjs6E8GJFNTXOva4dQ4Sr4kX
	JmpSKt62nUnw+wzzP056XwGx2x2KM5m7Hn6Hqy01cNCXmsVK8RTyqliy4bP05AFHXChnZYzF3cL
	v3JT2o+ik+b7xOnpnSy52ep5LVHzT+cdwUWCcwSGit8gg+QKbRmEI06/ooHQ7PafTZUNFwaAUk3
	EnUxq4wqzPw8raYmKWHnRtPLeGmiubBOek05KFJtAO73ZvaqSotpKY5g54acnjPuO2ueNtxDlAK
	gAHL3X8L8OgG1TH3A8mu8C30EQxiiuQLaBU+OyR53m5I/utN6H0lRAs9pjDfOT+WBhN8DlftCUo
	BqPawd7Pnij0LP+PveiosCXVWtN7BV7MBcGf0cThZEvMjt4jQrmi3Wg/eFukyFwObgQ69lpa3tq
	dLsdHp1fHmu2CFjgKWliw1faUbVE/fCkHF0cJiL6Jl8htOau9IlaGJyUP/mflr4ISsOxQpUlbc0
	4dX3Eos6TJgNRo4Xm10jovob6dc7/9kPj9vD5Eqmkf3l3XbH8sRfQyUlhbqIIWrmmOVvE9MZ7He
	7vBMh2CaMZUatrM2hxM7SfBTeZle9NSN9sx3y772k9Q==
X-Received: by 2002:a05:600c:1113:b0:4bb:a9f6:8bbe with SMTP id 5b1f17b1804b1-4bba9f68bc2mr37087675e9.0.1795690196814;
        Thu, 26 Nov 2026 02:49:56 -0800 (PST)
Received: from thomas-precision3591.paris.inria.fr (wifi-pro-83-006.paris.inria.fr. [128.93.83.6])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm585028225e9.15.2026.11.26.02.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:49:56 -0800 (PST)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Brian Cain <bcain@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-hexagon@vger.kernel.org (open list:QUALCOMM HEXAGON ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] hexagon: time: prevent release of not requested region
Date: Thu, 26 Nov 2026 11:49:07 +0100
Message-ID: <20261126104914.32285-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.53.0
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

time_init_deferred() calls release_mem_region() on region
rtos_timer_device.resource which is rtos_timer_resources which is
statically defined.

Drop the release_mem_region().

Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 arch/hexagon/kernel/time.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/hexagon/kernel/time.c b/arch/hexagon/kernel/time.c
index 05c5d6c96d96..b6d844b2c1ef 100644
--- a/arch/hexagon/kernel/time.c
+++ b/arch/hexagon/kernel/time.c
@@ -175,9 +175,6 @@ static void __init time_init_deferred(void)
 	/*  ioremap here means this has to run later, after paging init  */
 	rtos_timer = ioremap(resource->start, resource_size(resource));
 
-	if (!rtos_timer) {
-		release_mem_region(resource->start, resource_size(resource));
-	}
 	clocksource_register_khz(&hexagon_clocksource, pcycle_freq_mhz * 1000);
 
 	/*  Note: the sim generic RTOS clock is apparently really 18750Hz  */
-- 
2.53.0

