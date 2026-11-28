Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795883355;
	b=tAm4iUt8NOTQctsHgf2fypMgzATLaQNxXP8Qi2X3GscVnEJeWr79AZjQWoLnsZGVu6yB
	 HTskTtMTs8pXImKcoxKzTr+0mNhnJLS4CHbQRnksEAvz/V2MOMwZ/dMO13jy9HyRXiVUA
	 DiFaQCEO9z9CQv7mN3EnI/QZTY+/KmjvFQNdEShYakoneiUn6zdRp4sq85fzTjYVGhIEL
	 3iqBolwz1I/avfVGrzE7fz0mt26nQJ6aSM2ODR8ZbvSlVULR1zHtkzYlAzPEZ37qgVOlR
	 lMa9g5AJqmhvrpXzzMBiRahehOcb7nsUX0yzDWO1gNoXxB+VLtO+WJ+YzG+WnrE5deQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795883355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LFJzERN2VLt9fPmk1K7aSoPfto3qxkknuNn2tRoxvfc=;
	b=mP6g6tzb6x0DaD1OvSeh58P3iadSbh3wrhyAFgk1Lg3iITlcAT8vs4hsl6IlMT200ofh
	 EWXnZZBGhj4T472r5LpIZAKh7kxF3inJcC02yTT/erOvgmYjJ3jY/NS9PBVJLAOVdZq40
	 caeucLUKuDoWcwqyGUa9Vy0IL0CHh/r8G3JZmyJLB/psRyFIg4JGf+2VcnecRA+y3emHO
	 l4sv5YljVghHZ5vbcL6XnuRAEdoDOOHwzmCFbZszdO1GKxkrUpUF8HD7hS+2RAgMr2yds
	 ROfAWRB55PRZU4fDWyShgiwV0+b6wDQd+5CehR15egiHSQUQMRElpUx0wQMO0i3VsPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZzuawVIE;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82FD606A336
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 16:29:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B82FD606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZzuawVIE
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4b52fcb410dso3749295f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 08:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795883353; x=1796488153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LFJzERN2VLt9fPmk1K7aSoPfto3qxkknuNn2tRoxvfc=;
        b=ZzuawVIEqoOtwVKzR8+w8mszNFMHibEotHrq2aJaOnOn/Vj2bVZkt1pQvpwdcm7Odt
         e6SbeUMavyPiQBhSabB50iGAK0pyC63vk9ydNPT0a/SHTaRqLznkLXb/UHeB7zyF53UD
         0Jlt92nLqf0UhivRRLQoYEgWa3GTibamHVXrFo0jHaiosF4ZhAAuBU9J9r59xFceOWyr
         AAWEAPGWRoL1VU4oL5FVbFVelgtiItKNF5SJmgkmgCvKc8wR6V5xDHK12H+Zk2zuIrpi
         3XfYtxvnYINN5Fi7nKVf0rz0jP9saAXjy4OBYQQt7uI0XVj7LCY0yHMuxpwAeKvsU8KX
         a4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795883353; x=1796488153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LFJzERN2VLt9fPmk1K7aSoPfto3qxkknuNn2tRoxvfc=;
        b=GX9XZkXIGC2nKW7HNQ3yKmhy5vMmvDnEWBZ6iThYXYmmln2muro5BpdO7ffywL37vU
         BM5Riu43PMxGN6FGwJPb+DkuO4d9MF0tw/8GEWScLjfRvibEH8M/7eL7DMyENI5if89B
         pHLDBpgaKdbrcDyfQHfDCAChvBTK0LxCMHU+cn0hc4pj06Cwwv4Wm7PI8c3b7Tpxq4kS
         ULYX/AjKmv8o5TefreOLw7ykNgOd9Rbmdwc8hK6fDDG0s6pOkt/MAgjnLDxsoxiJgF2b
         nfjXUxdLMK5KMcZQg6sAeTxmju2GvYx+D9r8ozvp1LucZyP47zkJwWnSCzvv4APeoqX/
         MrCw==
X-Forwarded-Encrypted: i=1; AL+hErENwndR5vFbI2qf27EVlG+WzhuhocTFrV1p0dy/VO+iAZlk2dni0fsGx1HObnQoDXqzGQU2XMgAl7U6WmM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DWkDN9UCw4yl3oDPA7scb5x3p1oFNpt7Ob8YxeCZ/oyTcM2QV
	Q7W/RnUHD+5xw7XrmrnHN+oaKFeUkUOpHVg1+NIdGWYTQDx3uMbR0qmX
X-Gm-Gg: AZFdTZfHEVsC5rSUC4hlCgMT87KVUtb/GphKstaLhHX7DFA+GhIImfxftdKhOdFLEIR
	w95Huqsw3eGVx1zegyiq/biJJ8YsaQRGv7qQpvhGFJ6ftuIbrxm0vso5pxU2UYji5pGxnmN1JSF
	C9UQ7GMqsf+Uz91TM5OmwBwx5oZBTocDcD2CuirTgkMcn1u1hEQbTMP3VmgqPOXoktxJorxWfJL
	R/k/n61+KTpV5KKeHBECnfuaxd7JdQkZWnwWSpVGyB1b1Px1lmTJym04b/C8SjDh9EAXUL8so7H
	o9+bnepmN3sKeBWmO4haLMPOZh5CEzF4bB/sJe5OHga01EVZOqbBpexHT7UaB9nB3Mr9gRndkEC
	fzZ4umQbhzM+u19I+xtw5oxkwX90TD8Kqy3/UjM6KboqjRRIw/imSTJgDwWsBSfB+cVGESy8q4c
	izAQn7A4KEeeCTnkN2XR1yY0PT/ugQl0rXETrZ9CfwnPu3WFyO7GLFnRKhWXlHmpFWsVgcCapmI
	dnq10lhYtmd+BPlVd8omcOjYUHGlfNIrbAyYvytJFbCS6l9MUGWwM5UO4xaZXPgXO5A6AaSy/L2
	OG6g8wUIltZ2SEYhEEj8RN1/gCVmQ+qh8OOWD8sLbKmJJ8KsLsxbqUg6pp5Zk2HV3zTPwk43TxG
	Z+FeTwOjWZYQcUnDGz12uwJhsnAn2oJrdyg7TIf4RqlIieQ==
X-Received: by 2002:a05:600c:154c:b0:4bb:6a78:7c42 with SMTP id 5b1f17b1804b1-4bb887c3428mr561273925e9.1.1795883353086;
        Sat, 28 Nov 2026 08:29:13 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:7966:a38c:a84a:d91c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm781525525e9.10.2026.11.28.08.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 08:29:12 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH 4/4] iio: adc: Add the PocketGo S30 analog stick MCU
Date: Sat, 28 Nov 2026 17:29:11 +0100
Message-ID: <20261128162911.2534778-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261128023333.5873929d@jic23-hlaptop>
References: <20261127012612.1589039-1-romain.tisserand@gmail.com> <20261127012612.1589039-5-romain.tisserand@gmail.com> <20261128023333.5873929d@jic23-hlaptop>
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

Hi Jonathan,

> I'd guess this is swapping ends of the pot to detect shorts or broken
> connections? That has to be on consecutive samples.

Most likely a transfer check: the MCU sends each value followed by its
one's complement. They come from consecutive samples, as you say: they
differ by a count or two at rest and more while the stick moves fast.
The comment says so; I'll make it clearer in v2.

> Does this actually happen?   It is fairly unusual for a recv to fail.

I have not seen a short read in testing; the retry exists for the
complement mismatch. In v2 a short read will be a plain error, no
retry.

The rest (loop variables, state in iio_priv() instead of drvdata,
named initializer) will be in v2, whichever subsystem it ends up in
(see my answer on the cover letter).

Thanks,
Romain
