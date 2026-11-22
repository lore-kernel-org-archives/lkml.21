Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795333969;
	b=21qnu8vWJeEX/u2xZ6RVAiKNKf9KT8RBHZ2t6JZYeIJFTeGgw1UzdbVkQ4RR8I8rXIWr
	 U+ct611EPi0NVW7swe8PyQdr8YX3o0cA+HZJuaDDdJORmFWy0D1o+0v9V1RD7u8KMA6ZE
	 sE50g1OkPqaheFlE11hJC9y/oYvy2GQBxLuMM1RRtEhzcuQWtyf4xKAleIFIfqSJ5enTH
	 TCarTEADPdTWVqbLLy188tYJoaA+Os3vUOc1Q41yb9O29IaY/YAmZWYYxlEaAiea/eW+o
	 9HN9hsetW21XysFqQ+jx0BTjNqNXRAeZQEyrOIZ51xr0dudvvQvM+79DogtuZYvQaGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795333969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ciNlBsmt/ihohJlZfy6Y/766ujih1RX020bU3zC+WcM=;
	b=4YQAHmkSX6Jil7qQjHgQu4r9pGm/3KagXfmG5fnlRv6GjUUBkP1nNR6X3g/4o3M4ZNRw
	 uLPK/IgkVJCjCPeUJYqwmj35NUvLikeXPxx9iYbHeJNH0dtaGsgXAQgJlJZwN4o6rzVio
	 lY9Aojccpbz7qvV5ySu2xk75023wYuyGmI0LOjOAPGzPVdCqAMIDYJDDPV8gFUHzsvtEq
	 OTd7pRF7smpMOhdgOeGqtdBIEUS9ES3ZqRjRh8vrKIL8k9lqQtjlw5B8LdIqEY0xh9mA6
	 pPPFDfSNmEhbsgmLxvLMs/bX0ViEOjioRSWy+UeBtRjpfc2+timvqh3cPKnoKWnuU/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P3EwjdAI;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90373606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 07:52:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90373606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P3EwjdAI
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso521949266b.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 23:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795333968; x=1795938768; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ciNlBsmt/ihohJlZfy6Y/766ujih1RX020bU3zC+WcM=;
        b=P3EwjdAIWBuYLgL/Ltp4V9bQavyPv6UwTu/fxuJlsGnEVXJXYZ68AHtVcSfrG7mZeQ
         N5ozErcN2MOUyzf8gAx6EGcm/5igi2bDzdvqdcOaWId5XZVMGamXC6JUrqy8utwYfKxX
         sShDpsOzKDXDwvPgkFUrMBeRwZEk3TmZRBlGcf5u/4pHaZC32z8zWvZXmKkf+erQABWI
         RVh5fvOk7Dbv0Tkk4vKSIu4HS1fiZuHrewfI1Qt5wi/5//dmFR8vtbmgug9JDpPtBHys
         y1VrXy00Bb3YqcyZwV4wkSTcs0BPMnO9XVhcpMlGp1rc2LQXHUGizwE9snOgea3rFan6
         5Meg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795333968; x=1795938768;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ciNlBsmt/ihohJlZfy6Y/766ujih1RX020bU3zC+WcM=;
        b=q3KMiAnz7metTwr8NJgX4gILfz93UUESuZi7Hf2q3HktMwMtGa7Gu3ZqoNY89s+fs8
         tV7Ll2uNIlKwV3ZQVMbllHH/61aovTeLJJSWmFokuWHEgQH4MwG6d6AKxk7dgcs/1JbI
         TnE89Kj4uRdC6/Jv+u+VvgchrMFIe7oZFOPdmbVe3qleXO0PVKb1+8hsM/lNJLSCB5tk
         7QxhxnpSwiyfBg4pTO9cCa7N/3N1tP8BXxyLYVSYz72AoLl3UpAD0QJ8giJ0sQijV3dR
         XT2kDfDiFq8F8tuIu6ZZCqgf0zI1XFUI+uuy529S2PBEA983aGxbpn9k9O5/6XUC8pDU
         BSvw==
X-Forwarded-Encrypted: i=1; AL+hErGdtWgo4rP90pZGxmp3IuclkQl+3qDrDZWYqc+sgylZ8t6EAcT9UEd2i321QHC5r9zLKm3mHUQ2eXqBOWA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FTxt72rcLyDsOMcbeNNC/PvWEVvXL1U7K1bdH0QrV7kXgWb/4
	JTaiKRsiGkdTfT7B5UTVHqFUa1GFAvdlwKEB+/BJP5Dt4pAzrbis0hOi
X-Gm-Gg: AZFdTZdt88/7rjJaM3w7NEp8osDtBEP5mOVeKzrP1+5ZjIFeJvEDyo0wIQVekZSnJ4f
	q4n994plBTunpRWqZjleHMQjsnOsd4KG8G8Hy7Eiq61S9Q5/o9ren+eUN66xq1yyGzHRj+/RTGi
	6ryPDboQTJ+dCsKwj1Ep8mcaAbnr4NTGf8teF013LYvTvNCfOfDBG0Tknx9pQJxFJ8/BGm+Ih8K
	G2mBO3pgy5jqwhTNKSpEfU5SGy7x9wyd5oyPMS9tc3JGalK4vWKX7kL90wszR8FY90hYUierUen
	+g/Z8wglHtVE9A+KkjUmy+ne/rhwuDc/LCrwcip+3goFHCbd/FWimE37yzoSoCbjwdw2W1tyZSZ
	+EdZi8YScdjrF1u9NgWM6PRnYduoKTAJndn+WuPFzN7mElhIX0zQ4J3nx1Uns/qCprua4DQ/x0d
	7wWXFDH96DMyhDnFnXw57WU6n8YZigOJgyZfUWKZIQvUQkQAXafSAjVg8GKjR08DXxiBC5C/Yse
	lr+YgP2UuMBUen0v3duMU4KIbdE0dFPNG9dzLvtYIW9AQmcWdcB90T+nuyx8/z4V/JzIx47DDxM
	k0NaDt+ZfQw0QWKjFeGd5yN3K/yOEli5/T8G5ptJshw60Qg=
X-Received: by 2002:a17:907:7b8c:b0:c42:4557:4532 with SMTP id a640c23a62f3a-c51317e487bmr815867866b.5.1795333967909;
        Sat, 21 Nov 2026 23:52:47 -0800 (PST)
Received: from dl360p ([195.155.168.55])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae67cbfsm291308966b.14.2026.11.21.23.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 23:52:47 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Joshua Crofts <crofts@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: proximity: add Imagis ISG5320A
Date: Sun, 22 Nov 2026 10:52:45 +0300
Message-ID: <20261122075245.2916935-1-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121-arrogant-viridian-swift-fb8001@quoll>
References: <20261116074013.355363-1-tadilhusrev@gmail.com> <20261117173333.1853986-1-tadilhusrev@gmail.com> <20261117173333.1853986-2-tadilhusrev@gmail.com> <20261121-arrogant-viridian-swift-fb8001@quoll>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, Nov 21, 2026 at 01:23:42PM +0100, Krzysztof Kozlowski wrote:
> Do not attach (thread) your patchsets to some other threads (unrelated
> or older versions). This buries them deep in the mailbox and might
> interfere with applying entire sets.

Understood, sorry. v4 will be sent with b4 as a new thread, not as a
reply to v1.

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thank you. One thing up front: Jonathan's review of the driver makes
the vdd supply required, so in v4 vdd-supply moves into "required"
here. Since that changes the binding, I'll leave your tag off this
patch and say why below the ---, unless you're happy for me to keep it.

Thanks,
Adil
