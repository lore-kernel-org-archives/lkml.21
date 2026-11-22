Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795351341;
	b=dpWMAhNXHvJdywLfVWXIbOBLsDUV1Hh5AwsmQorcGd/ev55aTsSS9qXBwZItAu0qgERT
	 nGBML19DvHxd37nPxR1B7ggLjOISUIbmdoKF3zwDgubETRDq+Gqe7Z7uYZnKs/GgIz1Ym
	 BchPXSWQDVF+BU87T9/8sPeNzNqRElsWO3APW/n3aWXPw0Zsz0bQ5FaQqZewXQGcg+jzt
	 dwvj0mXpgBL461wkD2+/g3wLycppN8VtUni0/Uo9MqT8FrrAk8Fj2DCNWEZU8SHL1DVDU
	 MDCJ/8QPvZx3jPslRFS1hkOCRTb3Ef1NBDd6Nsv23BWolqB1m7FPTDiPuDA1CgmzqZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795351341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NjLyddmhAPXtNb3QKE/8D0uZ863VQXkt9WgAWFpo7lM=;
	b=yqbvgCryHRETx4z8DdALjWb3PJ4e/VrviM864RNiKgsXOessY+ltc7wrr4m+g5uA8xaR
	 iHMdide5U0ZN91TxG4py2Gqk/majtgdFBIbf1SXzZGbWaI2OrXa0lanNswkPS9hLiEMly
	 HVMZ5slhjsNIc9tzlcPxJbRzb9x4LctvgKUKAi26eDmFVuKd8bb65aJezpGzx3xlTOHfA
	 qXcRIgqX6rcBN+mQ7kfjhyex217asA1XXsJTNjMybVGEccdpL82BBKiWt7jt2zwxxkPB/
	 Y7gl1wQbKNM55Ezut/ON2EAfEqAEJ8j0gmAelJFfLWE9gKr4LsdnaB0zD93G6mnO+vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=iWfDGmTC;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D071606A331
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:42:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D071606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=iWfDGmTC
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-491971ac844so2164518f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 04:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mgcrea.io; s=google; t=1795351339; x=1795956139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NjLyddmhAPXtNb3QKE/8D0uZ863VQXkt9WgAWFpo7lM=;
        b=iWfDGmTCde2bt+wepq4PgJNyha1vow8HgShJhgAqgwEb4VqiIG1qAiKLIKiWaGRuxd
         f8R6vPe1+sThZNdOoA0Mq356EC2okYJ243uZQdz5uLx7ZsNjaqfeymrnBu2nUSX3KkFt
         YgB7/fupJe1qhGJlFwKWug3Ng1ZX/n1BdxOf5Jjvnk70H94tQnTcRAB1K9VrdyKhjJko
         LnW8pJK3Oe1kytqRL+BYgKvMiCn9vuCirhPSy6vw+PNkvaNOsUsgwZlsKRHzqWW2qvcS
         WcUTjr5KMnUfMGamPt2r79Go/SYQtMvprdmDjIHkSPDd674WlwFczVf+G/FHc1QPveKO
         xVdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795351339; x=1795956139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NjLyddmhAPXtNb3QKE/8D0uZ863VQXkt9WgAWFpo7lM=;
        b=nIMY13CUs30YKTE6B1qbTWvcnHX+hc+fItOxz8mrU1wrJvk5yDSUga9zCC5WAJy46p
         10kEi7rWB7Ez3DK3OL6/lKWoUjNhwzQUXaJKLzwNKXK4Jc16vf6+1XqcaJRbhVuroQ+6
         yOj5tpyMQYJeyd6YHBqwKjTvH8fo7NrY2hKZFI2e4s5uzpc6KO6f9V51x42iBsBd8a75
         BeC8QPanMd4AW9LN7VUO5EVG1lhOYSfYQx96+/rn2GbSQyNbEPtidd+wlnQHEBnzxTsV
         YhcC7YRGe3OzHbWrWlWmHqQGZj9m7kJj2/cxtsUdMZ/gQvkSy5QI6sM734xtviFJ0Fjl
         9MLA==
X-Forwarded-Encrypted: i=1; AL+hErFFtyxP/QgyU89Ga9ZN2jK2PPBmxQ4MIRWyfiRHdAp2YH/DucS4qlX5JOID/cbpqgaLyMOxjj8sA8X88Kc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+A9hOvlDk6YzqI8jf8Kr7eHRZ54lsyNhjqXR7MN32HU7UBZPQN
	rJCFs4pXTi7g2/PPre2m9ziRjV/OKjQmN4bcXUefJu3gpMOxNQO3F0Mw/epaLziWE+A=
X-Gm-Gg: AZFdTZfiiH9uyhPHpqpEdJeQIc4qlTxNkqpZu/mgB3i1el+jI77RzjLQnbc+msWyUog
	rc40pOVpYoTiw8EvSm4iWH7NLEGqeg14I2IK+tXZ7B4yRZnHvb7E71q6EI/9WTWpm/RZXruBaqf
	OnWQqTlKGYKc8UJVymn9bTIDJDH4XFu6WKCczkrlj+D+BG+p3YklP6TY5tY0QaAk8OyH18gYFCe
	NKy9APPEDY12kZ3BYQirRfd8yag9n9ulo+ughgo+AuZniqUfIsnb5UtOnoEXZ30z0I2mLlwQS60
	fJxNXhQ8R0nK7X8y/W9Wph/ZWHqyOFyRlbx/B8kyCpMw7+/uiLImzPic5KP24RXRLq4oyrb6WT1
	Limn3MHoxDiN+54ITfq9NWpHALJ/RgFPQhyPmrFwRYJW25ulfhdLsJ+p91PFJV6yJB6NmXguY2W
	cvL5ycRE0NoAkj8G7z70dFw6nCnM/EyWJsGgALvnU0RLAjA0MuoPOjsfIWpaPunsm705wPpM3hp
	/+qj+cAV4Pem9mbtRlcTYR1ejOZRr2gRQ4ZEn03aq1HXf66kTxxXcyz/RFtsixHmntuEQhns0eI
	zt5ot7h5IRKpx7eUGGGHK8Z9vM/BYE/xl3jn4Z0A3OTzl8MUjm9LjF+fPYaevw==
X-Received: by 2002:a5d:5d0a:0:b0:4a8:eed3:760 with SMTP id ffacd0b85a97d-4abb225faa7mr18135404f8f.31.1795351339007;
        Sun, 22 Nov 2026 04:42:19 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:a5ac:a6f0:7687:6596])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c4353d6sm16091531f8f.56.2026.11.22.04.42.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 04:42:18 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: i2c: ingenic,i2c: Add the X1600
Date: Sun, 22 Nov 2026 13:42:17 +0100
Message-ID: <20261122124217.9668-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <C17AD04D-6EE7-4CF8-8DB1-FED4A16C66AB@goldelico.com>
References: <20261024212520.91401-1-olivier@mgcrea.io> <20261024212520.91401-3-olivier@mgcrea.io> <33b5ee36-e293-4356-9906-54e99ba3557e@kernel.org> <at8jCGfp9dKjieoo@zenone.zhora.eu> <20261109190345.61480-1-olivier@mgcrea.io> <384F58FF-41C4-46AC-8B2A-1B6ABCDA6981@goldelico.com> <C17AD04D-6EE7-4CF8-8DB1-FED4A16C66AB@goldelico.com>
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

Hi Andi,

On Thu, Nov 12, 2026 at 11:06:39AM +0100, H. Nikolaus Schaller wrote:
> So at the moment I have no device using I2C at high speed to do real tests.
>
> Please go ahead and if I find something we can write updates later on.

Nikolaus can't test it for now and is fine with it going in. Could you
take v2 as it is, with the two patches swapped as you offered? It still
applies on i2c/i2c-next.

Thanks,
Olivier
