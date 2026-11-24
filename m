Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795486476;
	b=OTZtkE8rVmMJt+OQFKZPOudhf9M/xZEF/mZLVo+y/RcULhwFv3Zf/9qeXWF4+v5zYd1Q
	 BPKOpAlkzoogawegjBT+nbNR1AljJYGgNUqu9ZpOIyBjkYO8sGbfe7Jn8xn+I12t9lk9X
	 kmtycdiqU05PnKq02XktWUp0RTLAOHWlRDTlMMjyumTsgJYkN1OGbzjGoxkCFPBeOKDnY
	 yKeDya4VHB6ox2XMDWh8lb1g0iU/PjOS8WsEh2re7nSUHBR4LXSiFOisD7qZH9oTR2nG9
	 NwN3EEXOjVxrSxj2Hmm63kUff1U1OITu61L6FGO0txNMC2lg7jiE8wqz92w2hoErQ3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486476;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=t7lyZV/WXo9tIwR+kw6JoK9M2RVjX/WsSh8N1G2nxmI=;
	b=IL7vSMbNu6rn2BHCjtzm+Fj3wWVu9dJ8sBXzO18s8BhTJQwQ8Rh3UBSiaVwSblZl4gR3
	 9mPEhSA+cMEPalNYtsGbOSv9sRtOZ7BkEXtTdur+WWbmUmNBRPEuqwNLAKNw6ZfTHM+42
	 7OsupSWNcs2zpC6yF0KX1oSltW4ZP3bVeZ0j5cskAxJ3j7ztZFXWMp2PCu/kzkceOeHWT
	 8hq2O0ueafbwUxjgMUBy6fjrZfdcJPNOlpV6gfV+LAttyv7itWXYng3eki37CQIw1KjCn
	 6dNhcx0LDpwQtS8C8ifIg2M3hqJu84eZ2pOIChw4aFxhZdoxzZVzP9rEo/ms6bBf50w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ot2wQrSG;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C958606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:14:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C958606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ot2wQrSG
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a2af4c8d00so687850c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795486475; x=1796091275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t7lyZV/WXo9tIwR+kw6JoK9M2RVjX/WsSh8N1G2nxmI=;
        b=ot2wQrSGFD8iogfnt/LhoxykZjMmduMu9KyaK1KctW8UKVQj20x7lGeqU8ktCEPsxo
         lItLIetEAnuQkcTX5N8IOzwLoyaIRXSWtcycb04MRpgYLqi7Zknza1dRrSjLZ2c/oBkd
         HTIJDaDpk5UO4wMCL/WpLKe5vwMooOeaIEXr5RUm6gVMGe9/DXWnvxCgOjcCbRqnxYLj
         CwOUnA9lDL/Ck8AOriHQe4YvcrqQp1ZiOg8beBR08hjNbjXAtNvvl7h0W6KG90ITd20H
         gsu7jCSKRAkgFL3CRmqPoGO8095u7fejklOtpNfivmEfKZL4Tr/XZCOAE3gBSegsPAAi
         8sgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795486475; x=1796091275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t7lyZV/WXo9tIwR+kw6JoK9M2RVjX/WsSh8N1G2nxmI=;
        b=YExqDIg1ztQh6akjEyj30oUyp2tI6XOeSpD8nErar/LEhdcXjcbxAbl7r75JwcAN9E
         KTGQUPIqrAUQmmqbwiIGt6KB+0iYo2RhyRszeIWXZAmNCTQt/FjS3zkoltVoHd1PWL1M
         /nvnuZJPvEJSiwHewIjMcjSLyR/HoFKopnrSxUxkXxgsvVQQP0dBVw8MqO/lClanCTk8
         69Co54daMzyscLBoTMvoCfGUone23IFJzOwt4KJuFC7TgoMIy6GiKEX0EVGkG1Tc6Gq9
         O5o5tpwncee2U0A1xNqv4FiWY9hGmBe4LuoniDX/LnOR6d5a/pSjgprY4dpFPVc80Jvi
         YOVQ==
X-Forwarded-Encrypted: i=1; AL+hErEtM+H/H2tuMmlQFtBoowB1JZz9Rl7aB8WifVKdL06I2jp2aPerM13QXAB7mf6A90RRAt3GCwN/ehdKoC8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fzh1u5Zv78nGOZtVHDcvZz/ojtYBQXW5u74sKQpB93Oxm0p+T
	xMKImALQV7HExR+6dUoxJYennOJ4xEDnHE/55+6QOzVhgz3ALxNmqRy6egelVQvD2pk=
X-Gm-Gg: AZFdTZeBUWhEI7i0yCaHRV6p72l9O15IV1Qn2+4FA2F93HgupQnpEObjb+MWrE1Dk6w
	eJGsNETLX2nD26eoLRfN3QBIddjxt/UC7tiENvCLattAz/adbgvbkEfz1zLIMEITlAkhkECjpkt
	pWczrME4uAD5wcLZxvB3IM8LHN8Ima5WlS9cz8oduUs06RHMFpQ0gekOx9IhJDVmeV29ml1wcRq
	uOQAPCQivZRF5uxwiFIZc9uAYH+afpEd1WIxqIMKzHh4WILFRR/epNJ0i4mmAmTBTPT/9jJR80P
	FFP3laBamA4OzlNi0LWRp0H+d+kdg4SVV/kI4WhvIsBKRwQ58BbmXEQuj+IsABoo47SYp5szks2
	kB+CaqKTxV/nnPqAnGVcQfV1ipLjzSsXsBHK7PJxAlaJCpuoHpwmmgSi7qLmFQIx8n9TKv4Ze0g
	pEu1GF4ZSNBhUE0XcQQElMgZ4hews7ctQqTtMbFytv7uYYKtezA2B9GdAll/E0QdWwetDpmAQs5
	+KCooJQwMwkQgyj57KeHbe7N0AsJ2/sm0YYKSkx5ckH0NU4y2ZjpLCcqoKWXLhnDDkEPUbf9KBU
	GdZ4v9VCSRiS/kWnl3Al52+99D778jAwSzH2AOiEEszwIBRmDiFn8xGScOo5POC/Nf+FGELiNu5
	K/EdN7K4T45euTwGpko56NHrhvBxyZumFnqy/lW4F
X-Received: by 2002:a05:7022:1583:b0:1b3:a9c6:b293 with SMTP id a92af1059eb24-1b5568c0198mr14437633c88.25.1795486474639;
        Mon, 23 Nov 2026 18:14:34 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm18872921c88.4.2026.11.23.18.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 18:14:34 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: HyeongJun An <sammiee5311@gmail.com>,
	linux-sound@vger.kernel.org,
	vkoul@kernel.org,
	vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: Re: [PATCH v3 0/5] soundwire: Fix bandwidth leak in multi-link aggregation failure
Date: Tue, 24 Nov 2026 11:14:26 +0900
Message-ID: <20261124021426.424452-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112141905.1372770-1-yung-chuan.liao@linux.intel.com>
References: <20261112141905.1372770-1-yung-chuan.liao@linux.intel.com>
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

Hello Bard,

Tested on a Dell Latitude 9420 (Tiger Lake, SOF IPC3, Speaker
aggregated over links 1 and 2) on soundwire next afd88e7ad781. With and
without the series, all peripherals attach, playback and capture work
on every endpoint, 40 start/stop cycles of the multi-link Speaker
stream pass, and pcm-test shows 24 pass and 0 fail. The aggregation
failure that patch 5 handles was not hit.

Tested-by: HyeongJun An <sammiee5311@gmail.com>

I ran these with Claude Code (Claude Opus 5.5) on the laptop.

Best regards,
HyeongJun An
