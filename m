Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795556258;
	b=Vam/OrVRoexCf+/9C+k7SamnEOeVsOhmDxYURAJwK7XRPgC5Mj5xgabWTFbU555ks3Hf
	 sY+pIaffLghN2x6hxiW0nqsZx0miUJzjvCMkVZf47Etn1R2RI5LyPbB60JYpMtoLMyK6c
	 vsBtRJKtC1xKnB1Bxv8GMuCQOeVqn4k+tSs20rUfC1eWJI5yc6kt1TUiPvQpclP7BVArq
	 2zC94KbFvrZdfadYBJijoqnYastyqaQwBPQCaTGUbBx1nMVMLDWFpz08e0AGDHTA7MQxa
	 5C9a9Yxr30XNBiD+ccACVzJKwHhplm2lnWQoLt4xVIdp5SUwd/VwgxZ2QUN6B7IWnEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556258;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Fg3L3deHSkuexlMXiL0IKxngCsihbg1MRnR96egwqJQ=;
	b=x+2uSLnyyG2UioIcDJ3mtVPQHUpWFwmIu+Fypc3rYcBK3k/Ch4bsuZpiQq1jmkrA4L1h
	 FL6FOp6qqrKYuhvHYaHPRMZqxw6OgWT1Ys9JD0hvTGwOEb8VTYZ+ajOAR1nN6pVpWw6AD
	 jGMQn5iiE0zqRL9h9hTlen4PLxV0o+N84vrLCV2S+TbFzN/MrnxvwfVSxBYEU13maGkv3
	 HKVJl/0C2cV0zUK9TGEDncyHiNTvNADIIg6UMGqEHx2dGxafPB3rdZj6Fah2ayawucSg3
	 BEBBINQTj2XLDr6Oss4rkXRThCbOFzbn8SmzwoJ45dlu6aIwlfmaHGElMTs4P49E71A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b="sYJc/seu";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB1F606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:37:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EB1F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=sYJc/seu
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b4d6981c67so32460117b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:37:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795556257; cv=none;
        d=google.com; s=arc-20260327;
        b=T0IRb+VVp+Iy1cUw+th8BKo1Mseo701AssN8PrSKCzw7PcWyQ9TT4A8m4etAXUD9gX
         8RLK/oVdKfZ4VBV8uPXBok9yu3chBJqpp2RQWz2zYEcppIbC1jxGgV1ELMyz6C4rzMhE
         LObEGzc8aarDTk/+guhOHUpXl3t1Ut4SoWUXmvFqDEWtjSyRp0g6Jpy3spDvUW7OiuDj
         z7WRyPxTwuCSlh7JZ4wS3xhJXsUXdP5ZnzWS5NCs76qxB9hNcFyfgZtDJfIJ+EJYPyhP
         /uD91LEia5iONuu9ehro1b/jXKDX1OUBn6kKe+LU2dL/ANnReDQMsO2sKr8Zo/RY/RQu
         r/uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fg3L3deHSkuexlMXiL0IKxngCsihbg1MRnR96egwqJQ=;
        fh=vqdBBJrMLZgP+AKjR2ZC+BgQL8FIHD3t0rvhIW7EMdI=;
        b=qOTBvJJWIrkoFQ10qskZyLNuk+YWH3XM+0YQVfycCPAAEnDZCFgAHtvA9UmcXC9/xU
         7828DnXG3QssDccb1RrA21khqRnvxciH6MUEp8ik6bgfwaDMZx7+IojipBJVpHLmOi3N
         qgzi62z+cuPFeiaLwiTUWHzRwsZ7DIA3tdZQLGOabdnVR+OzcHs3WjB03a37BkdTRdMU
         rfWk8klf+vcrp40XhZ7z6TpkDD7BdZgOR2ZzwF4sMl9+FPz2MwhP20oKviiGW9RSSsSO
         +YK1uK9m6FlqnZ7VRR4I8ry2xl69jjHZrHRuq0kv8p2cbE7uS9R8BWAA6uv7AXxsTafW
         euqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795556257; x=1796161057; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fg3L3deHSkuexlMXiL0IKxngCsihbg1MRnR96egwqJQ=;
        b=sYJc/seuZAL5BO9cN9PEaJyyxuoxlHALCrc+VVOvetQXWeFw4ODR8D2TQ74t6c6+xD
         svNpcZ+X0cW0uHsPShiHJTaHRNuYtgUD1tBB+seV9uBUvkSE3sDkBF5eOIlEXUdDXM6f
         8zzcMRcWlNRWnzLJJpQYYRmqekd+YjguL8ZwQQQyDAPZZvF8yEMgKxuLVvocW1sUoE6Y
         UFFUI3ywaLLPmjOHdnIir+mUH+F7ShRNJ2QYb5HGE21mdde+5G8Y+nZS9oFOU7gRk9Yk
         qlz6rq4tOrhJeI3WQTkV2SAJJVkKbHGTTEnnWRv1YJlsTqee5TbYJNG/kPp/1nEKjAKu
         kWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556257; x=1796161057;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fg3L3deHSkuexlMXiL0IKxngCsihbg1MRnR96egwqJQ=;
        b=D3QFZ9QWTZ7ESU60ZmVqzsFuvpJkjRJYIIXvL/Q0vWxupZ9k5HEiDVRScjrb1MkRKH
         jpMjPIAu1KD8YVkYEf/vkcUAmYPHKZ8q1jSi2XtX4QOD6qDaFq91YF3uu1ejPsLmef7S
         nZEmYy9XJ3A492HPE9nEFT1JRuhQJHv6EPKFfPOH25nblh2ouzVj0b4fELozKlGQ9yYH
         HKxMtdzWTCgsyceklCZq3v+MIgepHHKbeKdgwaN1yN52HqrPmlhRpZfjtkhybt8Ez8jk
         U3SbPbQDL/iMQoQqvRxrUATGssQ4K1mCKotUej+f0Nb9fF7GVP1Mw+WYjnPkGS4PelmY
         vcRg==
X-Forwarded-Encrypted: i=1; AL+hErHqrc9yblytjW82ozzEJna0UgWzURyID1ug2/jzHuUtNzMQUwHEefUvELL+Ecw1rn17mU/IxofAWTxPpn4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+F4fqHNp9KvtxKo6obXrvur05KRmlEcBnD7JBkceEJdAxpst5
	HyUOXto2nW9qU+FBBwW9mDbw5YksLVMB5TQRvnp8jgi2BTO5NHVVqHMYdMGLDIUNjlEjVs7zhzm
	ljodXhecyq0iAa0vwaApAZSbCxgYf9t8=
X-Gm-Gg: AZFdTZfPIqZwTTq8edKQmEnAHQZI2c6TpFTDfIT4oF4bn4SXwTH4R2Jqhf+knnVX5VQ
	qgzXHlgWJ8whTU8KbB5Dhvs8xnvMEtqrylT5Jloxst+46oizABUGDWCuiiHpwbzwchk788dTnWb
	T5IkWSNKSmt+qggjLatoro8wI7S04qoq8BjL8RPilSoDWsm5m3IbwDmlfX9qsiu6ZGzoHlHFt7R
	DcFpU2pDrfaVV3tuLR5arJdOUQIbAD+rGHcnDe0wV2qR/CBEkiFbujMDKpg2/vbmtShGbIaxpmG
	roc8Z1tYGMJj05SgvCodI+SN/Pd/peJpqxoRTYceflB48DuuMErOaRwdFS/nihU/vFvTEPKDby5
	HLyDcKYRn82dSOdCPeSPpx1G7TnNMd4/IIHHj1mYd10s6P7iD5rBKIwWBQiPCa6R1NxJuXA==
X-Received: by 2002:a05:690c:3749:b0:8b4:d6de:975a with SMTP id
 00721157ae682-8b520442f78mr75631547b3.17.1795556257259; Tue, 24 Nov 2026
 13:37:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121213102.143130-1-tanure@linux.com> <20261121213102.143130-4-tanure@linux.com>
In-Reply-To: <20261121213102.143130-4-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Nov 2026 22:37:26 +0100
X-Gm-Features: Aa3M54raaw5cpHc_7i460xpAtUuQL2U6TjCh0nslZW-bSHKd5TU4q_42SX4Pzaw
Message-ID: <CAFBinCAzSgCGfXb_Q3FuwEmPAEiHSxzVR_ceyqMNp+LEZ18u1g@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] arm64: dts: amlogic: t7: add the ethernet controller
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 21, 2026 at 10:31=E2=80=AFPM Lucas Tanure <tanure@linux.com> wr=
ote:
[...]
> +                               int_mdio: mdio@1 {
> +                                       reg =3D <1>;
> +                                       #address-cells =3D <1>;
> +                                       #size-cells =3D <0>;
> +                                       status =3D "disabled";
Lucas, Igor (+Cc) has taken a closer look at the MDIO mux, see [0]
What he's saying is that (in my own words):
- status =3D "disabled" is unnecessary
- if you had problems without status =3D "disabled": Igor's patch should
fix it, can you please test it?


[0] https://lore.kernel.org/linux-amlogic/20261124-re-martin-g12a-mux-t7@ia=
v.lv/T/#m240f885979c7c3a84af26ee8b60d38f3092f0c0a
