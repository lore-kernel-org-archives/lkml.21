Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795508567;
	b=Jj9f9nOC7jFXjn6AJIc5TisCRXHWEoYyBXkNc3q5w1GMMeKNwHNaqzIsGFzaKRjc0YLa
	 rxbLoVUZP9H8D4GLQAzhPLBS/tjJXuF76EL8S4SLIcgdssi3tm+A7N1kF2s3bC6+KO1rg
	 jw67ml3HnjETi3PDp+Hb9ItzXOAKSvfYWQloF7O5rtWMZbmS4pInCUyA2FF7fD6tNSNZ6
	 R0BSr5p3OWYH72lQuZ0g13Q+WIE5qyyA+iblPKEqLirnO0ftkCZQr3RzQZbI/CKZp34rJ
	 Z/7WsOcBjLIFBgvuk/RVMh4rX/USUiBscLlOYEYSQXGaN4WgVNegBbbkGixxHToioJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795508567;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Transfer-Encoding:MIME-Version:Content-Type;
	bh=ImrZa/CtUYdIECWeql7+P6fyscSC7J3tVy4vOnUjZhA=;
	b=V0gkxYekGCE32Mn/f1Uw+C1d8988sCZT750mCRkCVpFcPQbs9KJY0ud9qqb0JWQcFvBY
	 MX5n5BG84KvAMvgVglymbWh7/I//d9TWizueoHZ8LTeV6NqOUJTFnbd9mB4CFP+0YrbgQ
	 Y3SG5WwQs8+9j5TG+cjw9LW+fIBSLwSyJxTZsFgAX3WfqtN/6sfeOb87SolTj/JDm2HeH
	 Y0DV8dkFdfiHNjzm48eWNjYa7AKyeS4MJCRKzaoVYGG8JTq2eIPsiLAHrp0wQKpX4udfV
	 LhjHmD+9RrhnkhnZuGnAVjb9DnHPdbuOA+g2MDtsJHWN0KBjZrrjhK2ZH06svNpIq/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zkXuyC4+;
	arc=none smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E72606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:22:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12E72606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zkXuyC4+
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c1479a959aso3073096e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795508565; x=1796113365; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ImrZa/CtUYdIECWeql7+P6fyscSC7J3tVy4vOnUjZhA=;
        b=zkXuyC4+mi0RVbuDiKRWE7S/6//F7Y1g8YtJOfu/xreqveajHoDWGssE1j5ca4741Y
         +sNJrDz5yLDn9Id4mhswHYeiG2ntdWVEgZ4Ox1UwljiMD0G/lMCAqPEAHsHailAsn7c0
         YPZWxUS2sd4L6SzMuoa/ggHvAdvoeG4nPJKImtbs209PRTxPl2LDUdxJw8J3d1BgAOjQ
         gI1HiZd3vlWuyCbZ+lv9T3McTqLaF1lRe1TfwvwZTYFKfW+YAT1qAPPpMppEiGEeaQeF
         yOpEpUYPOOACl+qZtKi9vl+bcLCKD2oqCA50BzK5IVcJBhr166TKI2mC1jBqvrktQxrm
         rNKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795508565; x=1796113365;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ImrZa/CtUYdIECWeql7+P6fyscSC7J3tVy4vOnUjZhA=;
        b=wf8ePrRMyr5YuGYwERhLm4oRPGBoo9v5bkOg1qinh+c5OQh2C1mAXTil/AMqWIB6ue
         T1PzNFijpSZWMib5lWQLaJ6jI6/hoQWp/QKtQK/PtTzxuvmYtEkMq4ZGMt8TVYQdbpyq
         K23x8TI94MuwWx+LDxukLNmstOJJ1aOAwIk95brEv9G3X+ikC5WrO0soNwrS41H8iWdR
         /O8G3ugBd2+d00Ee+PKdYtm/K5fGUy5gdbxHZSUmrBuePpzkhhPlDtNEiL7fWg4rO+73
         UsZbc0vOe/C9K5+Csn2YxBdPqz3OghJMcgUvrl8rteFU3di4z/RBbAYffetz8bJFyU0l
         1wOQ==
X-Forwarded-Encrypted: i=1; AL+hErF0g4tAJtkukTMlI0bXDNf4JX1aQP7Ps98nVlxVcQ5Y7War2iOgX3FErodY2KJB3qziiGLjMbJoCuMdr0g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TkJVlyMxfCvQV8RdRNU2NjtCV67c8jkmsj5Z8mhSosVUXqY+g
	CjMaz2dLgwQbK6/QoCoTyj8TpsJrbmV9ULu7WjcN8/E0RKiHc6FV25un
X-Gm-Gg: AZFdTZeqPvoaTqY7Nr2fvNirbAJIrlI/0RVXcvzs7QvPzXMbCQ4r7lGveqf6wJQP5e4
	XPkCk3M1QZBj9RqR/RQ9RurjxMw+K6tMiOSn4bLP1QjlPOhyIfHp+zX6mpSR9pLOkHgl1PxzZ//
	lXvXpWOWNz57VHZnGMiQejUGD6cYNiwb3Q7YqIWL/7wKQFJmDd4U2VN+bJUkMy9OoZCYAB0QrFt
	G7DUyoPIjvNn94uvOBBtzkn2uM4je+Frnih5X2uTXSQlk6YTyQp1nO6QtapaLD8lwxQznvgg09+
	wNPGIXusuirdX4SXQtRlUP7BZ0WrSZG6pK2BPAbrodZE/onJG3JdYiPJ1HZzQySuAHzYDnXwN2h
	BhiRd+ehjhNdHohz0+LDrMSZB0Mri8gwIei60HqyL1F7EzJF53OD8VN1o0e7xfaqutNNYNAbnQm
	chhg1V2zLqV9BpvQ+kc/0lKtz15lXfiKLunsND6Ovs1kUgsCM8CoiWboj7SC4o1ZZRBJBnExJKu
	WZoBg+ouwfYzMe9pwF3z6ujisyTzniYyUMgptHf+GpCAYFeONLGSRIqoXVhhCrApT3u9oHVWDOX
	mn3lORyPklIE3LJIBxjN98bP0/IN1NdwZtsNcnF4cQlXg+qqOKu3JvA=
X-Received: by 2002:a05:6512:108a:b0:5c1:4e18:39d7 with SMTP id 2adb3069b0e04-5c1bc7bccd9mr4434489e87.12.1795508565068;
        Tue, 24 Nov 2026 00:22:45 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd0563casm3560147e87.67.2026.11.24.00.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 00:22:44 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] hwrng: Add Cortina Systems CS7542 TRNG driver
In-Reply-To: <awU2-KjkZB7WvqfX@monoceros>
References: <20261123-b4-cs7542-trng-v1-0-92d9ffcee531@gmail.com>
 <20261123-b4-cs7542-trng-v1-2-92d9ffcee531@gmail.com>
 <awU2-KjkZB7WvqfX@monoceros>
Date: Tue, 24 Nov 2026 11:22:01 +0300
Message-ID: <179550852171.3.3520172407021510093@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

Hi Uwe,

Thanks, I removed the redundant linux/mod_devicetable.h include in v2.

During the additional source review I also found the vendor's A0 reseeding
erratum workaround. The driver now checks the global SoC identification
register and limits hardware reseeding to CS7542 A1, rather than adopting
the vendor's RTC/timer-derived nonce workaround. Our Almond+ is A1; its
identification register was checked read-only as well.

The built-in and module ARM builds were repeated with COMPILE_TEST=n.
The A1 generation path is unchanged; the new guard and its error paths
were tested with the actual C code, without claiming a new entropy test.

Sent v2:
https://lore.kernel.org/all/20261124-b4-cs7542-trng-v2-0-0192937b44be@gmail.com/

Thanks,
Fil

