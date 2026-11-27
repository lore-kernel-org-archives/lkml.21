Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780264;
	b=TeDr5RnfpL9XSogy85y6d+ywqNHHARN+DS77q6QS3/kZqtWQzv6KCFvvuwjp2roiNqCI
	 JuE7lXrsCj9MPB2SB/gKJIh6EpEFM3JoqOX2ajM/BPhUNAu9+ISxanmNtD1NMSrNwSNMK
	 h/OdVwYcEs1U3okzKunme8HCoIqV+OPffsyCF+c/VfzJe5x8BG4FMVep0L5gV98nuYFCX
	 KN5yepccHhvdDw66PR8x5tD/GKnDZX/NWCxXkEH2p916+8BRCWfZY6MM7+6kXMz2MHr10
	 X/ZNm0lxjH+HzAUcDWi6o8utJg9xNCIx7DhN7Wm92zCflUYHYwuMHnJSXVlcQ9cB4RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780264;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=HF9YKM3qySdp71vvMXfdu+eMeA4N9PDI494ydnXnj58=;
	b=UYTpuEtICTlVEofYsxfXHrFKcOBcfvInE6q01bNQtyFNo6mPswiGMQgEjO7lgxfraBxk
	 dYD74zVYC5rEBn1M5HTn4INSQvmKpkPKAk13QohmzOJsHlvepsiKvuKOpo4lAvVpZmrlq
	 SxOlYGaBYukLenxaGC4i9QzUVTAz92s97udBdX+srsa2J568Vqw4qudQQkUUwW92pg/lW
	 m7sxiFlnNQIiEqf9IJ+u1TOdMyU26coY7vR28gB7LVteeq4rczKgEu8oE9hAvIKccvdOy
	 8MEOl2Zu9H1ogUUuW5fiYbUSxf5Fyvi0Td4YDnw516B/Jf8JtGn0+3em2M8UOGqQIEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WerBzao2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE83606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WerBzao2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7C7B1F00893;
	Fri, 27 Nov 2026 11:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795780263;
	bh=HF9YKM3qySdp71vvMXfdu+eMeA4N9PDI494ydnXnj58=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=WerBzao2beC7vVxh5Dea+hptJQFKGg6jULeV/lGSTFEthqkuNr2CP8/l9yYpMmDdT
	 zHWHgc5Eyr0WXMsnccRPP+0BYOHZxLJatn+eJLyXUsvUGHfgEs0FrcxtTc9VpTnLXA
	 +Wc8h1FlID+z8zihcni0macobeKnWasQAcWJcNMw0oDvcgPCqWsXfy/VbaGOtrbbeS
	 QAdRRBC5U5co54u3H/Ggah1HzXxFkJxJhtEO+5U4JGapyM2fFTMi9v2Vr1i7KnSveI
	 M2Kd/XojoG7iLXL+g+UOIhhABd7KLkSFUboJjj9s1jBjrOvSSapooTy/0uGdhzWHid
	 EXC0gaI63jK8Q==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] phy: ti: omap-usb2: fix OF node leak at probe
From: Manivannan Sadhasivam <mani@kernel.org>
To: Zhao Feng <zhaofeng2@cmss.chinamobile.com>
Cc: Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org, 
 Johan Hovold <johan@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Miaoqian Lin <linmq006@gmail.com>, Guangshuo Li <lgs201920130244@gmail.com>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261109072450.1005-1-zhaofeng2@cmss.chinamobile.com>
References: <20261109072450.1005-1-zhaofeng2@cmss.chinamobile.com>
Date: Fri, 27 Nov 2026 17:20:56 +0530
Message-Id: <179578025671.13164.10837931399215798521.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=693; i=mani@kernel.org;
 h=from:subject:message-id; bh=asCYCABtuQZZaJied0t9+9hFbnGEIInAKC7eOFlUOJw=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrCW6jMSa89peYrFPB4acHymYne9v2noHNOSrdB
 hsmyQww/j2JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawluowAKCRBVnxHm/pHO
 9SrDCACNPXxflh0JQTed6hyqX1HvQWJUY66vGkdc/ZZYFQ8uElUdsUEkTR6CRAuXn8xkxf5hI06
 zYFgi9hPfaMpk2jSv46V98xHIau1W66sd8Wo3ymm5t4XCsmh7J+MYy8RTYjsJHQg4i/T2kuGH0s
 VlWewkMUdlQ314D2X8ASimJZj2QGNdbnq9R4IpeQHSyll3ogXMMgVaKQbRzpYANJcqGZLr+Cz8a
 u+aocHPD4feT4NYZgdLabh176wP9ZDhzWSmf7DXf5fdjkjEHo1nOIdIcPudxMawt6FLikTYG46M
 Og2G/CEKlGqZ2MsfDF/c7K6axusSYcot7yo5syhji3LcADoQ
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-11-09 15:24 +0800, Zhao Feng wrote:
> omap_usb2_probe() obtains a reference to the ctrl-module device node
> with of_parse_phandle() and never drops it, on either the successful
> path or the !control_pdev error path.
> 
> Drop the node reference right after of_find_device_by_node(); the
> device reference taken by of_find_device_by_node() keeps the platform
> device alive and is released at unbind by the devm action registered
> below.
> 
> Fixes: 478b6c7436c2 ("usb: phy: omap-usb2: Don't use omap_get_control_dev()")
> Signed-off-by: Zhao Feng <zhaofeng2@cmss.chinamobile.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani


