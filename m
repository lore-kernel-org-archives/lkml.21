Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795745085;
	b=bMglWXiNCeold8BvnkMjzLz3hwS7lBqCUcn8omQGieYl13lAf99Yh+jVVE+TY9mjy2kL
	 KCG81FO8R/HQTsuEatgcYvNiFXTHBcZwtwYgd0m5n8j37N9zT7Xjshk7xJf/BcdSBNSiN
	 YriLezPQvT8u1uIAjUdDMoaOl+WFAm4chLsXko2hmagT+HyFZ+wUa5AfkGjME54oEBuOr
	 +oK4lmMXZj24MhNWq+8iqoZtmEAZyxq4s4IyMXEJw0hnnA0nkSVwmuiiE1oJEXs5S0Jdl
	 0s44iMvbS/FnhFI6PoMQHTzGrD+jpXztkQYwXXIHAEIipekdlzYpO64NFd4CkYkreLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795745085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YY72A3VkTpqQHLjZtoVYV5pa4ptzRiTxzbTv3ZjemY4=;
	b=FzMdG4q68s9l6sxXELuMlSHSnZd8CNoycitbFabepmpnMkJZ/s9TPDCebIneGFgWbEIv
	 6Nx6MkSCmh8ZRsi3vIEmTqk4TwdefNRgDhoBIX13TN7oIPo+uj6Fi7RYAMY1uxXEBLG6n
	 chHjabopQv/AnJgeiVAS0BucRZugbl7UOf6YCVLsN6606uzS0ORoFgWD1a/mA4x3HYkvE
	 gxEi2m41x6/royXThR6ewAWlOaTJiKWehTx1zgyQXei4j7xk2z/7It1EkgLafT7yOMADt
	 3i494KPB2uDlmsc9CWGLloDsKHqwVfiGE3RmclvmCsn81EQY/ZMbDtm5HxcmTMxuakw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UBUhCAzT;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B06606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:04:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01B06606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UBUhCAzT
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2f046b0adc0so43369605ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795745084; x=1796349884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YY72A3VkTpqQHLjZtoVYV5pa4ptzRiTxzbTv3ZjemY4=;
        b=UBUhCAzTgvbKAAFhnTpomsqo+O+JF9Q1BaL+C80nWqnIfOVWh3Vgi12wUMh0pi524g
         llm1OjgSAPB+UE2p7beR83ZUn8Zzec1E/7/PDm69gA/4Ee7KNwTJUh0YaF4NSr65JlQj
         44IaG0SChi1z46T9rXLy4uUViOq02brf15/3qHQyd0UTlVAtwCLreZ8gyms88Y+0J5nc
         SDbDmbXX4VVELrc0TSvyz6yV94Ex4vo4X4Ro1Orhly29S9oHaOhBV0vJjv5G/nlw9caf
         1CK1B15JO+iQaSHjcy8ILMlcIWB3bZ5azlbnnpufTGre61K5d2oyOCykYAhJDbNW4L0q
         CFXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795745084; x=1796349884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YY72A3VkTpqQHLjZtoVYV5pa4ptzRiTxzbTv3ZjemY4=;
        b=acHZ+bZrfuAvLkqo8h3mz1lLstouG/61SLqIOqY50rNsY6vHxQ1XKEwmEvreGjp/ZB
         7lawW7H6XBr0whzP8iiIstol4AKyXfkv/lq+5iRNLR6ql3pm9snO7TEZi+Il+ibD1iCu
         K6wUqPNcdInNFwHGKaKeTQyv2b/tCxwY8HG82xkuLyrWxQDAiFvPxdOEj9Fxx+irBY1M
         JL3kUVPRiwBiXj4JJGiwYVIkCwpHR10BnUbN/CwLcYHSAxRo8g47kQ13YbzVnG2fnwVk
         5AEEMsg4aiTu3iUhT0RokACorq610k9GntWtKzakxI1g4YjUxce+LPkDgkvGNUCvTS6q
         4eBw==
X-Forwarded-Encrypted: i=1; AL+hErHV2THAoljGT9gJVcj7QPwnKdIBNlHyVaCg9ZZRsNpXd1i1n5LrTj0lNuU441tg6tEOuTzqt9JQk1StUy4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WQ2a3EVgghyKF5I0tKzWwZF/Z9PGd7IfubOVZ7rfsjg1h8EmU
	rYQ4R0WbH+Pi55KqF4kp4tGiJwNcEWEom8yYLrqdnOpfMAkgvz/AE1Mq
X-Gm-Gg: AZFdTZd4i9ZmfOSqpJ1qpkQI2htiV1MIxBjcHukfXDCCXSsXY1poVOeyU3WjDvKjUUn
	lyRiSbBuVg2JJU1QACXhwXtPGWBqJcr2SGyy7NQpWYgrrvWrI1qJfqMFl5IBfD51GSlgxmYsVUS
	bM4ZaLMmsPWCxoTLIOnp9tZY4UB6hFn4bpaJOBohippjoqbQHOvg6lIlOXT6X1iGgRKLS+dydwi
	akH7aqbReZ8f9iyYRifLNp2086GXd2wSWBu6yrNzTRvO//u5WZ8IW5oTz9BUswp1EiwReRXujcC
	kW/0kerF5MjOxuF0K7N1PUTp1hlkQ6w+rbf1eTu5OflUVLEWWMT59lB581vHZ3SQIgb57xYlVPg
	xg4UoNCZTWc5YEHcizjRSfCbp38ByUmDEHaA+iFqHrJVDJar1YAfrDOY4smLXxahFGYiKJveTcb
	s7S3iDFl4J4HCMRiZP/Oyh1tVkqBL59ruIoI0s7ezPJoDWtuyEQxH6X/Bk4OU3Ifcu35ch0fcC0
	y4+q2zUZxVQ97MIxFG+Rm9irjnZyptmvmyh+1ePO/VZnFLUC/kpDYDh4KBnLhs0+eYfmTlx0EFB
	Datwq0bK8bFEUVrsIsqssJuu1++JXkEvkw==
X-Received: by 2002:a17:903:2c50:b0:2e9:6972:54d7 with SMTP id d9443c01a7336-2f03f17e712mr197749485ad.52.1795745084230;
        Thu, 26 Nov 2026 18:04:44 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84027sm110819175ad.7.2026.11.26.18.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:04:43 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	leeonion.muyu@gmail.com
Subject: Re: [PATCH v5 3/3] mtd: rawnand: r852: declare NAND_USES_DMA
Date: Fri, 27 Nov 2026 10:04:39 +0800
Message-Id: <20261127020439.1732176-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <87fqwnwwl6.fsf@bootlin.com>
References: <87fqwnwwl6.fsf@bootlin.com>
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

From: leeonion.muyu@gmail.com

Hi Miquel,

Sorry for the noise on both topics -- I had not realized how much
review load AI-generated submissions have been putting on you.
And I admit the quality control on my side was not tight enough
in some places.

Thanks for your patience, and have a good day. :-)

Ping
