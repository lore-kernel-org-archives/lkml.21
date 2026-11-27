Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795793019;
	b=EphCpLXyEIgGybaYFnkwi2t1wzhfLG2HEutKWph7WoQ4vm5dRLtlGgSE4KfFIGkEtQOE
	 Va+VsU8dqLzw0zcmqQQA4dM1C2NnESGlONd4fmzhSuSi0i9646GIA7vf/1WXjP8df7n5a
	 GQZQvEx26+gUZpffEa0K89wQZrOj+hDdni0ODnEI858gcQPxKWSkOT271/aLrV4BayBac
	 Pu6FwMgSx3SC6BTieD6WK6//pjELKJDjtbz0qePgHcfKK+MVo6PEBm1ud+5giKDqaRjk8
	 eLQ6E0lVELNdNcI+333GkE3k0t7b4fu/tVlb7QxOPeeA6FwnEo0J31Ef2zjtEbMH3Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795793019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=WsBNj7VIMT9Rex1IplHHRSQ8v1QyTHdnKiIH/swHccM=;
	b=nRl4+h7gbe1YYyLPYBt46avtoimH+APyoOB3EoVfqPaIC5jFiUM2p+N12AJjUWNcTkUT
	 lCAzqwzKvPKEPyYhS0FLfuIIZ0q59KcBMAbBMKtnvUcwpWseOQ8PhvU+n0ZO3f74d//0n
	 3O4r76NsBW/XaY2B1zz2nojSlffcGTSHNjViuXE6+/3qbCONTm2ItTek5PkEffVq0KVeU
	 9WEtmBBE0+yITVoHwbVVpNmu60r4DZBBAVXPWTApLvWb02zfMK6VKCXI5ZOQfvXiuZ4AI
	 e3hypYZiYOPSOrOdv4Tn697glc/NpvjCPjS5oScpvS6A3+L0g/FrptLKMIHmbj46Ctw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QboAQD4h;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945BE606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:23:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 945BE606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QboAQD4h
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so66494115e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795793017; x=1796397817; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WsBNj7VIMT9Rex1IplHHRSQ8v1QyTHdnKiIH/swHccM=;
        b=QboAQD4h6FlTh638/qbZrEca1ePBYi6iOTg6zCke7lOWUX02RSXg2kC0DTkf0WL/X7
         QuLCFyjBvBQkwvNgg+u+Mp2F3LldzbTRpqZ+vVlZTiR9F4uJAT7/sdATkGx+EVlLnAUK
         UX0d7swOYtyUzViymj1dadNl96yl46ox+3A1u/SNyW55NorFWw8ha2Rp/4vJqoAyTVpf
         Ma2mWvQuQI/EDdpGK6P0tEmrf32JZuVqOvElsl1HnUsekBZeSiDnYoAAYP+gp2A6gVB/
         bVjkNaMrVRt6MQ9xUvw3j0qQkpP796bZPoLKWZTIruGhHH0eOSaG5T2GRg4kZ00e7TtI
         d0nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795793017; x=1796397817;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WsBNj7VIMT9Rex1IplHHRSQ8v1QyTHdnKiIH/swHccM=;
        b=PHDOIcqba8e/1+bUiCgyKkG0f7OskvnPN/CujsJRdw3h1X9k+dfmsJjNvhAF1JSYLW
         nYlDrRB6d4RiIav1nRHiXB05Ff1wQkG/Dj6B3bPEe7A1wp8y7enePqrirosRGHKDK8fL
         3IUpdV4BohIUaC9O/bqria3rqkcCCw3ufahQFTtSh7UUQWZOedTzdnad7BfvJjPQ1AMj
         pBC8GPMAHxPCRsWtjAijvbJEyffBRB5z64dY9PhPvEESHcHptRM+79RYDEISLZYN7r0t
         pZ9pExW2tI8whBBnYkFwkPocBbfl0NT75EiQdLU8nrPYNe/B/sC5HqOfyb849F2zjWkh
         iqlQ==
X-Forwarded-Encrypted: i=1; AL+hErHYD+GCMhg5yeXlE1Y8ZmAf/ZSc0n8ve2FRm7kbiS/2vzYKQkgn9ZOh5GdhLTwKW9GstoMqsOKGUl3zcTQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ItI58k4fLNKU6eMDA0AVrtM1WHOQpQl7YLEP8TmkpfRweD4Xl
	Waev7w8eg6JNHJ7mAvw5/MDCHK5gBNqAB0nlWcFhwffD4SVjqgh2nCsMYCnS5YHy5Hg=
X-Gm-Gg: AZFdTZfvFgjq6z/52ko93xpkIsPEDP7udYSWOZmg+MI6LVvOOjjB6SupTUJU8597LI9
	oK+it1UQ9Gu5n/LRNfNR6uH5XfIRuFVdAZbJQQ69L6nl9sedETJWoQvhYeOMBnp43xPrmMBEpI1
	u6I6svGnggiyIvuGm/Fnq12s8N68r6wsPr5zCpxgFvdzbWEvFiBCrTF3P9p78EnJikYhjURVrWz
	yyttM/lagH3Sm4rDisJ50l/tYu+TjH+UHYhLOyaVqzrvstHbiwekQ+KFc8da+858U3vhV3ui/IE
	VlmTgZYHt1GibbDw2MzCHvvOqspGhPmDjypZ4fkIVxyq5fcDAdWku66B5vz/LkMig5ZyiFiznwl
	f/1q53Iwvq6TpRbnwxG0iqGdqkItMZu5fsev2BuOSJ/L92KlQRiq8kjmAXfIC21/xWBwtJXnP3F
	b7rii8jVWPPLvGbcDlUfclm1JjCoGCCLh2Ta140kC20p6qLy1HoDcZDvpmQTpdAirpitKyjBPJh
	iZVaQdqfi00yXODT5GNPy86OWZgfzwcVJJN08+Zs/bPGoPqy784yYGzYa3Vik3EGRlrCKxyUXmG
	DhX4X9nv8eVWu35OYOXUidtLxn4RfhJ83q3NrlUKc3OoBERA
X-Received: by 2002:a05:600c:4f81:b0:4bb:5e8c:13bc with SMTP id 5b1f17b1804b1-4bb88805902mr482584215e9.7.1795793016430;
        Fri, 27 Nov 2026 07:23:36 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm403008435e9.0.2026.11.27.07.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:23:35 -0800 (PST)
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
Subject: Re: [PATCH v3 1/6] clk: starfive: jh7110-sys: Fix memory leak in
 reset controller register
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>, 
 Brian Masney <bmasney@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <179579266081.2809466.15729395589845750540.b4-review@b4>
References: <20261123112053.20400-1-changhuang.liang@starfivetech.com>
 <20261123112053.20400-2-changhuang.liang@starfivetech.com>
 <179579266081.2809466.15729395589845750540.b4-review@b4>
Date: Fri, 27 Nov 2026 16:23:34 +0100
Message-Id: <179579301418.2809466.2771229024752123171.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=581; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Vst0VQm1vcSZ7OfH3CNMLMaYl5sNZoVSXY6fEdIrm0c=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmcC8qOOV6JqahZuVC1YoPfnyUabkl6O6p0QvLXS+2c5
 pa4zXNZRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACaybzEjw8GazYsXiQc0lB4L
 cP+a8ElOj3NzsajI3W7Wi+c/FlYf3M/IcCmQ+8aHyZke7Md4fv0MdC5S9PwjXBjd9CTS67x3OyM
 PCwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On 2026-11-27 16:17 +0100, Jerome Brunet wrote:
> > auxiliary_device_init() returns an error before device_initialize() is
> > called, so the release callback never runs on this path and the rdev
> > allocated in jh7110_reset_controller_register() is leaked.
> > 
> > Free rdev when auxiliary_device_init() fails.
> > 
> > Fixes: d1aae0663023 ("clk: starfive: Avoid casting iomem pointers")
> 
> sashiko is right about this tag, this needs fixing
> I'll do it while applying the change

Arf I got confused , you've already fixed it up. Sorry about that

-- 
Jerome

