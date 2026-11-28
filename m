Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795879072;
	b=xsCuxU6ONqophf+/kdgNModdqLuC0T/WQc6EuYMyb6Bo2QbQDfJ/8Pr6or1G2+j9mCZi
	 VHAptJpy5ZxnMTDqFtAFGcIzKYBAglf9eAn/Gl//4P93I6KJhpv/EYrFjtNWk+Dh7M9J8
	 BRQX4a7/AXM+8DFRI4fCNEEo4SeSpG5FnJ2kDvCc1GZpmzhdnOUywZT/kIsdAnbnZS5B3
	 hH9gdMy6T+FhrDLFRH9yD/+J1LPFscijcmhClTntVbcYJTIcI5mhOSxMcPpMXSuTeZrNx
	 yblzQBKEcW1nwIbCSVXPQqub7pG7K7eJDYlBmo1omSZObCHXHXHlYjmWUWP39zJJ5PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795879072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=boJHVtZaNd2Ip0sYxyQoGj4OCG9SDHvMT5R5+mkI9p4=;
	b=pVa2J7orssqJVuerFDOZvnzSb01TO5TSr7ClcpatafVZ2PNs7fLC4ZsS1diU4attba8v
	 5fRJf4J6kKrJcAGb3NgpG4XYbEIcZIbyIrBWTVxky3LLSTajCJeHVS4vxBviHv9jC6CHm
	 89JXNISnLGy0ywJcjqCFdz96SIQyZzDWkZOnWb9FQtORALM3V3OmJIsMV4C8IkZ/8fIPw
	 mq4xO46RSE/7YoBq+1oevbAUNO+EXFJkuPb78sIWmYfR1GJwXMytouIEvcNyLmyLmZR61
	 CA59B0t7yC9i65QIyXTeV+KAvYetYNAcPZCNTFW48WF+lwsz21kLELEWxeE7icqbrEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VdNXrhtf;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525B3606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 15:17:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 525B3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VdNXrhtf
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2efddf749e5so37801135ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 07:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795879072; x=1796483872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=boJHVtZaNd2Ip0sYxyQoGj4OCG9SDHvMT5R5+mkI9p4=;
        b=VdNXrhtfkquQyB+weXIUQzt1WPqF0QGhE/StYFjscKu36SfwJ9AkNy4R0F6Y1Z+ghs
         +t8QXCNjF6sKYMHnPSkmWOOgJTjOQMUE1J4OTWbov6OG7ZwC9O0EjFyC0gbTRr56s898
         wGe1e2/u6PZHVVu+m+dbUI2oXGn61oDqI0AwWo6OG3GLEObFYkL4U3RFTwR6A3DOHPoG
         JZmEkOJOa70FfCvxReI2A4wJ+c8GZM1AWOHZzygGRkHoJ77AOUdPBCdoA9BwZ+K+wMjH
         gC4LVe1EdboJq2Eucd9+HUkSTEpQvohPB1I7Q5vym8PjKK7tzyuHvfjenoeoXoOiRhSq
         nkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795879072; x=1796483872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=boJHVtZaNd2Ip0sYxyQoGj4OCG9SDHvMT5R5+mkI9p4=;
        b=arKFfHcXBmjggNNtxJMea/NYOSp4v0eeuGP/tFz1vS7F9T3gcO/XM/U3qB/umPQHfk
         x4OHamA6Y+ZDLzEY/t+g8xxMmC5fng5Wk+dLt83Co44XyOXetm2WqjDfh7F4OvFNSsQE
         3zg5sLwhdtVBcbROT7G4t06ps+cfL2ADKUbG32PF8IawMY2XXrIQ5Si7GKz9WFxH85Ct
         qVVqWmHTTJnZ9suW0/mJONMU08Bgxvk7VySpYTJ6xSmdS9rySoP2RENpfyWa8tQp1asC
         BQ5ynHyrlC4pBTADF5GCllvzOTZbmU6hQ8ml6vLD8GIYWOvNpGUtBbuiBI5fFElK5+rv
         qWEA==
X-Forwarded-Encrypted: i=1; AL+hErFWK1di8xwmTgtjU681NSeN5wG79mXgfjF+gopW7OvZJ7ya7o17HWjFw0JPzmLkee62qz5NCI7GwngMUbE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XL1txf6hadQ1SGTYaZmx51ocjpn6ycHBCB/N2vrzlnD8/KY1t
	xRGYUg8zy6gX+LtLJbBxy/e7U/GEbXG9y/jzo0M9LXlguOgSc0XhNQkb
X-Gm-Gg: AZFdTZemQXsuHq1FeQeq+PROrg5WTpeW78r4ZM3bahxYZO452tJdGuYklpLJtTpOIxC
	6FKt7Ro4jwZ3JAWQUA1VM3AdWQDTn6WgPYOHprARBX6OGnWpmVRD7VfHBZIKTbTRyz9a9/oEDTC
	QQvbeKhASzssz5re0nsY5o9dK35i9AxM68vl8Cms0KEOhH6Cdg47OfFXu6ZvY3Mmm2kojxYS2hi
	dBk+UNtqhMiTY6c9mmzdIY2sifFYT41cF2W1hQF9zFy2+zHKMJ4ndAKd+uhF1wMnfjkqyjnv5Ln
	xXztJlNJnnTBx/QW035HE6PErU9yU3TC8b5lQHyau41kPxh4JFvrux1hDJavaABAer2B+A3hzqB
	k0q69USD2Q/qpbDlhzWboJQPdgmnXIaRlI07oMrOrJp2DhUp1dkSqQ0K5vEdGscAw2HXvlfGD7K
	OjSYaocU8EWAHPeKtS1cGnbh/3j2nsYaCoR5FNr3rC8kHWsgZnrYgzElVY7eN3lLeYN99s7MxXe
	6clM54hMladgjGZYk2n5x0h9gc98JpBVKp2QBWLeb5bN/Alu1LhtLQy/YtJWbvyOOLb40bqY977
	n2FOB6pJqlcaZB9B243tCHJJbQ4gunP7PR4veL4FsKOfuHC1zCgAZDc+yKkooDtLi/tSSgT3sXE
	XYWWvlpg4gDZ6XcsjTdtdFuMn1ZW8n5JsuKVfmAZsgqm64Rx6
X-Received: by 2002:a17:903:244b:b0:2e5:457d:6c20 with SMTP id d9443c01a7336-2f031f7a49emr234013155ad.23.1795879071469;
        Sat, 28 Nov 2026 07:17:51 -0800 (PST)
Received: from localhost.localdomain ([2405:201:301c:f8cd:241f:982d:147f:bf76])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c6e50sm138078425ad.13.2026.11.28.07.17.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 28 Nov 2026 07:17:50 -0800 (PST)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-spi@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] arm64: dts: mediatek: Add MT8189 Skywalker based Tarkin Chromebook
Date: Sat, 28 Nov 2026 20:47:32 +0530
Message-ID: <20261128151743.17053-1-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <9ec63a02-b5bc-4053-a57e-73fd8d290531@sirena.org.uk>
References: <9ec63a02-b5bc-4053-a57e-73fd8d290531@sirena.org.uk>
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

On Sat, Nov 28, 2026 at 02:39 PM UTC, Mark Brown wrote:
> This doesn't apply against current code, please check and resend.

Sorry about that, the dts patches depend on the Genio 520/720-EVK series
which is not merged yet. I have resent the SPI binding on its own with the
subject fixed, it applies to your tree now. The rest will go to the
MediaTek folks without you in Cc.

Thanks,
Aryan
