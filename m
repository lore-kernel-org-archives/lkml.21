Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795264456;
	b=R/V8qaCdtw1O9gSz5C0fSCRtnfXIaGGxhKRlIZ15MrRjg8wSutX4CWbJsU2MOlWPb0ah
	 lfjbqzk0r/Uq9P+uTSNP8dv8aBTgp3E9tD3ENGJ3zDCEcegGFzBC3EuYAXdtnfre8FRZM
	 MXmgYnl6NLDCPnDk7jVI9iPbN1Mi209zb1twQBe2mhuGveOY1jVabX965iQUDUecVw6EW
	 oqMw8oC1BRGIYZdBbCUmAvYMtDGlAveqmPfZLuZcl0zber7/x6yXG7VsaO4Izq7wpPKCq
	 kQwpKN+5w6osTtwrS9aQZHl74b+m3hDA6wKLy/w3Tq5c/HJOW+Xbksyytyod9EDrgNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795264456;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
	b=x0IlicsvfFkx1cSLB2GU6nuT7bFtOf73dhL2t+d/9g+23Qvvinz7VWLLGE2BErWkjUe2
	 V4RPwfHSbv8SO0dxX8OZdUGv/DAn0ouEltL7iMwhFj9neKvR+q9+mEfXA4pz4DL6daLZV
	 9tiVq4uMiUuxAPJjZ9lIH8pnq85m8Kb1n9sVrcQyJ9l9O2AgeULkps/Dwz9MPZOr/MWU7
	 A6U79H0sZMlUQn1FHz+t47jBhWz0P7PLyd33Hurl6usTJ/cEeE/GzToLBsm/Yrgr4nJpN
	 MiKOnZ2qjkExNTERjWBFM00ZLNVYNvMzjViHKqIJcLOz+iIB1bCCq7s5Dqx8UwFex7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hQgSQQVE;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91569606A32C
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 12:34:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91569606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hQgSQQVE
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b546061d58so3893214c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 04:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795264456; x=1795869256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=hQgSQQVE1Yg5CpJc/19imBMjUu1xfs/WpK/jLJhA4pljZFlH8/K2eWrBMd9Xb8O7tT
         g8eHdEcL3JexJMk9wUEIi6oLTppDb4cTvi0IFGdjCckmf5z9SN9gQROQ7ZqffJ+oH0kk
         dbOubHYWO+N4MOCNUXY4SByA7J44Z2heg8m6W0oRy9OTw3nJzow8xGbos0uXkaSLkUeJ
         gvdRHgbp8r9RsTYySFvECc4KhV1/KLpOrtLQnoWSzHYvAQddwvA9qkxodQ+60BBgTI9K
         hSpuXszw6S8FZmnqqaiQAeNCJqj+AeV7Fu1awDfUIlv3pW0PIKn+3pZFeg1u41tC0NXN
         rFnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795264456; x=1795869256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=nwrh/LuYO4xFdSKVMjaMsrniQI2JBCpn9uX01ZppZDHQgxFXBnPXNsZ4l6hlKGm3Vz
         6cl7ut/wjuvIQW4z8toTYJe6HCXrnTOp0MNymL0h1yIe4caJq6OvpL92bHKjZOSkHXo6
         EroziTKuSIRFE6m55mun2WceeR/IdCYq7XL0v9XKu7GPKvv5MtzfSs0o/AtH+Oqpur+K
         ViYc0MBT3Ge7mFsm5mL8owQFXuqw09G46ffGuSJPPjBP610apYKYTBFICadVpqqBCQgS
         sxqXUW34fM554JSaFCFb2RCE12krgEvMj9WWV2TNi0G9rVuf+snXR5aIRzwYZqERhtmt
         iXtQ==
X-Gm-Message-State: APuU4Z/yySwvL5vh9vHksL6PxQrgudeS//HIdLFpC7cdPBfK+A/YBc3n
	VYqhJi/wzOISxjRD+i5b+KYC4slr0VJV4wa6VKBCAXXXrWoj/n6Jj0HM
X-Gm-Gg: AZFdTZcreNCHZERPxEF6D+faJfxoUPyEWwJuURdke/P6Lpnt6SD3K66cFx/hhWux7B8
	Tkf+I/kkt/S6ae6PJcosHLfqLTh6Gb1F4XZ7+8fNhnl8M9xcBmBha7Su/hz+4nzYy7tBUsR1Gyv
	Ha5NIi9g8kDroUsBMwMKWFOBnN0cU6r6b037yowoUPZvwK0G0Y4niChJeRqVuWJ8afxDLzRZxXT
	dV2vWpQlf2alhKeWvW1A40ZL255Q90ElFHJAGVTCUAKsPpX83EZMvFZwKzu3LTcRZcHJOOtyJ1b
	8ZAENay+I1gmKVh1q90yB4As5vKSLctAQdU45jULENx/E6XQSuvavWW4FGCLyqWi2O5f4ITazAe
	9pUmOoa8FhPKyzh6/pQve+w1Y9V/NnkYIToN9TiWrun/0Lk0u+wimd4A+9rTEHv88XDzcaCyWb4
	twCxDOwpukTYfj403P/87kCbWfUScC5PHqJ+OM0QI0oIlOPEhmNdtcbzSHeK8xzQMnaEJJudfoz
	S8AIcK3RGIciNb7g5F9TnJOuncCccLd/IRj+2EvfdnBV5Ul3h5peIa24R+/OYJwcWGfXurBcXra
	AI2TMVZ+M1jTGkxedXXCEyawHNb56D5SUGPo4eI89qee9XXXc3Y=
X-Received: by 2002:a05:7022:1502:b0:192:e5a8:6bae with SMTP id a92af1059eb24-1b5644a3076mr2154983c88.40.1795264455644;
        Sat, 21 Nov 2026 04:34:15 -0800 (PST)
Received: from localhost.localdomain ([103.179.231.88])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm24366451c88.9.2026.11.21.04.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 04:34:15 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH] ALSA: pcm: Avoid reading beyond ELD monitor name
Date: Sat, 21 Nov 2026 12:33:53 +0000
Message-ID: <20261121123353.2617-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <874idbwhqo.wl-tiwai@suse.de>
References: <874idbwhqo.wl-tiwai@suse.de>
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

Hi,

Thanks for applying the patch!

Best regards,
Sreeraj
