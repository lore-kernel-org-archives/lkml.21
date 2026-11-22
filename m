Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795369891;
	b=Q3hqknUsQSUHLB37qMhwYqzJAvqatv6KSN7JCqFSJHD+mGTCFU69D+McrlbAnljU9igM
	 W630lhlrr+XepqMu3TnsQPkwjbEmblvzvc15OoOJZHNDz/0y4MviqigDhPRBDpcMn7iKR
	 Cs8msqJY1DKtloJ7sjlPuQbb2zrYq3r76t/YPBogKD2iT6kT2edNiODa8hx2URh1isd7Z
	 fLv0HA3lUeU3BB+KogrKncb79Dr8Xfk3jn508BDn1ZZgUuCerehzk9+M0v/93xiRdRPnd
	 LtvLa4FqYS4TMeU8BJzEF8biR1NJKqqNSc6w+CwpKRv7iez0sHNsg6PCF3DTuFOCQyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795369891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Subject:X-Mailer:References:In-Reply-To;
	bh=1yMVaQOiv9B9KFhOF3+nr4ODmkWDhOk1vIMDXuWTipE=;
	b=cL/Nq3GEBIyXQ07+eXDSKujEbv0ei4uvnqca4K6GXjRHvWPrBbw+LeDARUh2eoHL8Md3
	 Vfx0I4DygJaYBWy05E85CW7fsoYN3VdBXe9oM29J9FWZN6bDmUJ91NBlb4LUZETbxmyfm
	 4I4D+BN1WE3Iwm6MEpnlZeje5J7ozNpyWTaCTUm+dFTgD456zPPl21ZUj2uUNwoK6khjg
	 nVZTqpBHd67rPjaXAf1eEy5RHFKCzh0dovQKlnb7J8Ln/CshR5C+UVpxt/PRZ+WQU4DId
	 7d79xFdAaOj6O8xHtfJHRcaquqOx1axzBVcWXqhv3PmrPxRaH7UR4TwVfmXKTZ5YN/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ocIXO8tt;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBD7606A33A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 17:51:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CBD7606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ocIXO8tt
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b8a2518f7cso2877151a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 09:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795369889; x=1795974689; darn=vger.kernel.org;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1yMVaQOiv9B9KFhOF3+nr4ODmkWDhOk1vIMDXuWTipE=;
        b=ocIXO8ttGSav0YlCF+6rCaq8/A8X2+hNimH0KNNt7I8Z9pOrjNimf6xfgJBVch5CGn
         KdCLCmQvhRJQmg+wq3LCmcS/aWe5jMCrTsvjj3iLIKo/Vvy32mijdyC9QMACnldboU5G
         dHAjOx0ZaXPBXk/nJRlk8HKX+DgTHqUzs/37rU8qLYE7Jo+VJgwyk+BWvT655W93m3af
         xGZ/d0wGUIkj3tukmsQcJZ4AQywSoBoYmLdHbQ2qQdQHp5Y+04Zr/Jspmr2v0MCB3XI+
         4kWCF8bBWRHnzBedRjqt4a7KGLvIHh2yn+lvE28DhKfqTK5SnwZ++0TTbvVpqox0w0zr
         QVSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795369889; x=1795974689;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1yMVaQOiv9B9KFhOF3+nr4ODmkWDhOk1vIMDXuWTipE=;
        b=j3Llrr93CyXxiQF6IyjoQzlovoHukNJEfjiglGSEN8N6FwfUBkvD1LYWWra4X28y/w
         970pXutAd2/A8t3IvARr1+HGkPnL32AgC7J28s9fIHitxnXlkze/fSJdrnr95VqerDW2
         oTsJa9Rw1N/0IvbBTugBzlNHEuHVcn0yq4Z3kXX5HHWWC4ANgXZi5//oS0w7lxJUN1Cj
         oOCEA1FVyYiifDEL/Uq3uY7d8/HrMaf/mNNpOWTdLDtDE6QQWh5cQef2+2MEcYtlrWXs
         VOAJygQCcbCPaQ3pgWyBXy1s3NPS0j5galDqaEFpueOOE/br9Jbk9u8iTpCSXg4XVjXT
         atEw==
X-Forwarded-Encrypted: i=1; AL+hErEWog6MTm9Vj0r7Gc7L9ibtqBWO0LDIlgSQm7fOV4PQAF5sPEOrPsuz3/sXRM4HAiz8No+WvdJZUIi+jCY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ustLQDP+FYepgKV7neYkkHbRvi5/qqtwTJpbQRbs6oz41Y42R
	MlSrBcwTfA0IYs/kEKU8M1GzRhqC2Ol2bcdw3iV1HT7fRVFU6IqK3Z+v
X-Gm-Gg: AZFdTZcqICKBC6lSfGGgg3dLalEV4rt2oIsu+88tORqDWuliSUzOPyUCa5yZZE3zrF3
	wY5dEkTNLeLEq7DQt9V7cTSZ/86O0Yw3R9C+9F2j8569llXH3YfguTTgaS/Jmo7tipastbsNFAJ
	yCTlVqCCNLXI+teMCDPGJADZG0XOcOFjoRmM3jN/h6JhDcMrqZ9+r0FP671XjKmaYlhBqBT2Ie6
	BZ1flCBFVE/oBXpy6SBpO8eUlZDzbmqZmfIJMWFyqtTkhSCALVb+frfSn1lPWe/Re4tPpiqBvKU
	kypfgJCUj8biE1SNopApRE8o51vH1AHPsm6o9za9SG10pwwMa1Z7GFnxNbVyUWPOKdnLf9mttjP
	NexGwOqM3TsI4zeg5ch/XnPVMZOpTP/LS6aR0jVTp/ea58SmekyGp9Icdx7YCyQmstURMOg+XPQ
	fYdU263LFHLqGqBu3fck4/N6YWKFZwqBw1XliJtCFBde5r4yy+Tk++XdS3PLEl8XiddcgEEy14f
	x/tKMrg9K6PF2hSUwS+u5oLgfT19R8U6PIbfv0tSLEC4KWJY/3pWR5eQ7KDzQCjeuDs3Pb71xi0
	LpqKwm7fMjRo00i5kG7G7ks4mS4+YQiJ1cRn0KkS5ihXXGpYMg==
X-Received: by 2002:a05:6402:350f:b0:6b7:d189:6044 with SMTP id 4fb4d7f45d1cf-6ba37e64b27mr6482678a12.17.1795369888545;
        Sun, 22 Nov 2026 09:51:28 -0800 (PST)
Received: from localhost ([2001:1b81:1b55:aa00:48b3:8eff:fe5b:7d15])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e8adbsm4246918a12.17.2026.11.22.09.51.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 09:51:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Nov 2026 18:51:27 +0100
Message-Id: <DN1XIBUZ90MF.2JOY3U2VDD3ZP@gmail.com>
From: "Oleh Kuzhylnyi" <kuzhylol@gmail.com>
To: "Oleh Kuzhylnyi" <kuzhylol@gmail.com>, "Daniel Golle"
 <daniel@makrotopia.org>, "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Hendrik Noack"
 <hendrik-noack@gmx.de>, "Arnd Bergmann" <arnd@arndb.de>, "Ferass El Hafidi"
 <funderscore@postmarketos.org>, =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>, <linux-input@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/5] Input: hynitron-cst816x: respect touchscreen DT
 properties
X-Mailer: aerc 0.17.0
References: <cover.1790944534.git.daniel@makrotopia.org>
 <75b8436b900ecdce7f29513a7403b851986a3a1b.1790944534.git.daniel@makrotopia.org> <DLWC73DK15W4.2LCL8MREV6FDM@gmail.com>
In-Reply-To: <DLWC73DK15W4.2LCL8MREV6FDM@gmail.com>

Looks good to me.

Reviewed-by: Oleh Kuzhylnyi <kuzhylol@gmail.com>

Best regards,
Oleh Kuzhylnyi
