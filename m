Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795135503;
	b=bCELE1e8/2nSdmaddLQKUy36KQxTSQuSy9mstdORs6o+p62XOMuiNhnPuK4e4q9lFyGS
	 XF0FkrnQFxc6PQ2zkex+J6s7CbUsI4eiKD+vNHXfaMJZVXDdlonVgGnEGdEsHWMWH15xi
	 MFxIfNsZrWQ8q/fJqwEdN1AeyKyYsJjPWPvlst38zjxGtnQsMdzzuucCCzKgdkhK417Cm
	 DAwVZKN2448pak43dYqc8IfYHsftwpixMFc2r3QaKZ0NU75qMM+KfVh/5OAAqQ/obcQdx
	 ++PD77+D9lPQkiUIjr0g4CN4Vl/G/nvy7H5p9ol9LQkxp1yH3zWDo42SfjX5URGxCpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795135503;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CGXmRqzIRYYwQBph0EliJVjrCQ4Lb/Di6C+8WpK5drg=;
	b=a9KknLkMh/ee60vHYfSSouxfgE8J4cQK0haL+IycxEnqAhYdDBr+FbPRRRvm2RWmEEJe
	 gaVf4PItwK8kiXzLxRoZFBNIuNVDzoXJl7zmvFJHOb52UFGpAXgkd99EU8oD+3GK7MBTk
	 3DuBQORqK//RaMu420+X07iw+YhzyIqPJBScG4xdWsL8c4eABczKsLSNzL4/5hMGzcP7j
	 5wDoeRxGdIk1JNEBNMnzu7wFfIYcEw+Mmh0WWjuAPbkERkCkad+0/TUHLLZ9iZ6cK65kd
	 X1LdJw7U2GOUxGk7pmAAS2pjwPdKIadSnsYnpczLs7kkBi4WySrJqeTqLhAFWqyG7wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ihBLXm4E;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A385606A330
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:45:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A385606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ihBLXm4E
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-492690dd5daso208091f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795135502; x=1795740302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CGXmRqzIRYYwQBph0EliJVjrCQ4Lb/Di6C+8WpK5drg=;
        b=ihBLXm4EXEgDv69ppDtXRHTWiCY1l0QwWi/p+mM+6LQibxEmZg2zTSvdbRQkXHIhBK
         d4IamreYYdxlCyWO2KioPjuwB6VO/cujps5G8L24+i4+L3Dsopu+2aLJEXMYxMBWq4Am
         e2jZFtIP6YzRYU2Zf4LboxWDah/0toYjfhsp25Ddb6jbqn1RTYBmnnyq1TLNCf0uEJnk
         iXrVu0gHy8dMrUJVil7ONFT/IM1wJbAsI+lDggt6AS279MdTjkpZoRaY7pNgvFExtQya
         G2bjvI5yNlQR3yX1O4wVeiayvYJ0eFzpBbxhqmS9s53IosmDV9Oj48hKfNnNIYlbDA9Y
         xt4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795135502; x=1795740302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CGXmRqzIRYYwQBph0EliJVjrCQ4Lb/Di6C+8WpK5drg=;
        b=lklWSk/GjsCWV+2itrl3xzNHbe7A/DrXhfX076C9rW7uD/VXshTSY4XeFp1IYZYx5W
         yDgIY4cMCtjlX8rh3QBuj4+Fk9ISR/Zv3aFDsK1BZuTVbLQ04Hb4x9ewmaOgjt7a8U42
         Lc7P4inwB3lhbahp91umzO3EO3zd1+HObeIziDSyP5X62yVTHDO8SEmuueXgaH+42VU7
         qmMevNzG1rH2Dd9HiGxKZdgTBvnI5KXkaO8+FTF/q1moZapRwaeSrRrJF1jRLHwUkRbw
         Jn/icilfEoBq6IhEtHws++f11Do/X8VrjbP6f6WMjl01TxEYKqQ49vkUDMGXvZmZ8sNc
         rwTA==
X-Forwarded-Encrypted: i=1; AL+hErEZT2/YH5eVwymSOlLGREn5liptt1dGKxq5V8tiG0zPZ9KD81EeHobMftpQhSrloPgqndN0Yr1m/AvybrI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+9G2XV0yXIh6S3CntBbeJ/XhHkOuKCFbQon6ifmFvvlpjYjaw
	hMv3Yef0SulSEOE8FpPyoHO8iWNmW6yj8bvKjuPTBvfFVlSFCMtz0lBI
X-Gm-Gg: AZFdTZduB7aFhBWzL8sFkNYFhqXd1heKRx73LzJPPdxrILVHRqL0Xv4qEW42d4jogCc
	T9cTy8BcbFr/WlXEOLl+C3i2fu8qvoHFQjkDkQ2Du9BhIh1bCRossxh2QixpUyr+zQ5tFyFV64D
	i22EAq+6cAASvmulUxfl4nLDGBtGmxwttMBRFqq64BcPfj8XgZzjcW6gwyw7FKu6iAlxCNKxSg+
	rlUrrIfYZAR9tfQSZ80oshZdX/MzYJDkS+TruyT8jVNWi7PIAMK3gU2wVnXbppVTW8mUkGIRRyu
	tn7HLDe1ULN8XaFZ3IUkII2aPNwBRCg6+IUSsXdvOVh5U9w8p2lHhpkaheuc62jChF9lg3x71a5
	xGL+Xmv6NQGbi9hlYpkoS1DCVFKcOKam0s8yXMRxWIU22BJoshozw0vAABwHqHiOxrqe7W+i0ya
	3mUf5XnbNRuxPVlAcW9KTEukDlaxlBv/UH78W7KJ09ANkk6O3XSVZXW3I9acQDIG/X15DO8/1ae
	g9GM9bK4clziRAG3OmsEljKGqGHzC0PdFbM29nJmTyk9NYTYum70WHTEGXE54I4fP73lj5jpLLO
	qiHnh6lXQtYuS6MuZU265bqlwYyKyBvCRm1urg==
X-Received: by 2002:a5d:5308:0:b0:48c:67d6:a87a with SMTP id ffacd0b85a97d-4abb36786femr1837057f8f.32.1795135501619;
        Thu, 19 Nov 2026 16:45:01 -0800 (PST)
Received: from unknown.m0rf30.ray ([2a02:b027:10:5673:5f22:93eb:1bb8:839c])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989b3sm2438480f8f.51.2026.11.19.16.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:45:01 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Gianluca Boiano <morf3089@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: sound: add Texas Instruments TAS2557
Date: Fri, 20 Nov 2026 01:44:39 +0100
Message-ID: <20261120004442.1687225-2-morf3089@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20260719-furious-wine-tuna-f4acb8@quoll>
References: <20260719-furious-wine-tuna-f4acb8@quoll>
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

On Sun, Jul 19, 2026 at 10:33:15AM +0200, Krzysztof Kozlowski wrote:
> This paragraph does not look useful in commit log. This is part of
> changelog rather.

Moved to the changelog in v4.

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks. I did not carry it to v4 because the binding changed:
reset-gpios and interrupts take one entry per reg entry, ti,asi-port
is new, ti,imon-slot-nos/ti,vmon-slot-nos are gone (the register they
were written to only holds the I-sense scale) and firmware-name is
required for two chips.

Gianluca
