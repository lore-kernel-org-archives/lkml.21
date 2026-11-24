Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795556328;
	b=R4Fx2WeEwBgAk9EqLx/+bxDx/uaLv/tjsPenZTIRsoUNFlCCGw+04FFpFb9mD5tBfXoi
	 E1UQLrIP5uLD/GsPiWUOQWBGq3d4251FUwBAKVeBD7Y/iRchnTSMXKC3R9d+P+7I5m7rY
	 2Mxrrrn3H9VxWJfiq+XLmTS0IDgPLgM8FeF0L6vSspHktexocCLCBIAxz+hCnxWCs4sI+
	 g6giOSGQ7p2EPbm0sNEK8S3Z2jjIClc57Pk7C3XItA/o3htg7BRT1044p4oGjehbqnxkh
	 xjDtvXieE+oBkv3IrfvpLqXwRu0iZAboLIfeqxT62DHTVx/eDYrF7Tgb8mT7dhEfcIg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+yhNDtVkGsB34hsrY/DrTfudZWn+Znetsqsket55Xcc=;
	b=2FQbr9/5bx5F0E0s/mmtdrDBCuhb4uR5/nkMH67F7kVeyVLjx9OEvmbQBS+GzsOq4MrF
	 bguldjNupcrXGbP0PVJC1U0Q1GvZrwtt/rt06fQraDWTKrakDa6TI9nOciiVmAMGNCYzr
	 Tk1GzYy7pHYJQpfgElOzx66Bsg6jSmVJaKVqRjguo3KzDhqYK8wQaNvHDgX7mNs1QJYT8
	 kHtOE1uSBpiE1O0MutqIYHziwSWHVSdrITHteuCCuvADu5f9GQgIwK/0xb50oG1u60lF9
	 3MUbHD29VF7Wrt4HbNGFEOUu6Ue9/QwNp8j7YsvXJC5W93bst4v2BqzoQzS4P3q3+Ew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=MRQzwtKc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAF1606A698
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:38:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAAF1606A698
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=MRQzwtKc
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b30cbfa628so37609007b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:38:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795556327; cv=none;
        d=google.com; s=arc-20260327;
        b=P8ZoEpeCYteZZ0HTPiOTKDME+0OsR2CxLW8jCh+k9qEquc/VFzBgzYFefDT8If2YpR
         bpUO5+cktD6OZpEz6BJhs0XA/oRddYg63uQbdHnsyk6tAHXhXoxznT4JagWKvXU66YjE
         +s3HCWeoaDCAlL/zbpqbtwp+DBxmz02Mei+zsq4mNDb65vJ5bUEqTJm+lGV4BtkyuXq8
         0P0nOKE7R1/R4tJI2UdCp7JfRFbX3hSjFU24U63k+AZGlv6I58c5vY2V4VwH3qGsYfef
         KTeQxlXVcOeyVa41AeAjSys+H/paolUObyKoyKJDzL5ZJfPJSMaQR+SwnxMdloGqH7n9
         wHoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+yhNDtVkGsB34hsrY/DrTfudZWn+Znetsqsket55Xcc=;
        fh=cCvi6m236uzm+BseLOADHgdrPHC/kNY8RJPHITubGj0=;
        b=GbQKU+0z7a7iUfmWfS6cdR1p/MnZMZ34DsYQuBIjcJH+xgbO5yp7jTIF/yCmhtP5iM
         xk1skmgVX1ab1LeiepNejeyW0BleIGIxdHlAOGTS5PCifWRMuP++bRS4Y355YnRDi/um
         KyHZDiY8G6VIV//+MjwKMR3oTf9xU4L7rEMmXcxolnH+6RRKeEdBmYYmv6zVnMU71LlQ
         T828n2CrWzDmLsDkYR7rNleVeVDhOoQ7DxyIMJH4AdwQ+ow76UQ3rE79Chw1kgN5Vq6Y
         BcDedgA9WCElRcKxdVpk3DnyH2CPcB5Mcg/G1SYvh5WwvEo4QH81N73qzcPVDs2BQZxQ
         D7Ig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795556327; x=1796161127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+yhNDtVkGsB34hsrY/DrTfudZWn+Znetsqsket55Xcc=;
        b=MRQzwtKcpvuLUX7gVFRmvaBf8z7TwF++fqSkjnaqL1tkiZF2n360rRhGPODzSqMsnz
         zS37yyGaj2vH/anO7WJ+uamepQe28WsybHNyBjInK1z3ONzdi2zK1+uppWvMUg7wik0m
         gcJBvoj3c5yvQ34d0DjEotBoOJUdjYa8+PP5o5lvgotgvWd9/6I1uk+Ii284UD6vy2cB
         w4mqTszc8iSfhtwpprCcjmziMe72Tivt6bN/SKVnsWn4GLlcPszevwZc2jygNhGIO8D3
         CzuSGzzrhmPt9HboLdYrw/LCjRk/imUgqoxKarwk38lmHJ13AjqTP3iCI/G96LY6lW2H
         Weaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556327; x=1796161127;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+yhNDtVkGsB34hsrY/DrTfudZWn+Znetsqsket55Xcc=;
        b=kBoU78sp3uGnN6K50SFxAWb2pfKWZWkNom0ODm7uYfvBgx3N2R8oWoWlAx/1HYg/EQ
         hDdxmopsHbqTgdWDSy/HW5aVoMuUzVF95idaGbfs1VWoenEpPqugtkWBfrHJy+QVUYIY
         2xVTo2sYPI3pCwf/kyHh4rseiWfXjLMg4o+p63QMfhIkMLFDqbyQgtkoyLrWrlNv0Aye
         GY8ESjzAvcIVCdqKXlqHTUT0iGOJ+BVor+TrOdt464fA/bqDSwl+krQxMOKMMXJtnTha
         jixQHqThdFYD8wAeSEL+NfTaWHFY4xCLIMitCH2YxbPiyh0rRcI0tfpVy5pfABRo1slB
         70Vw==
X-Forwarded-Encrypted: i=1; AL+hErGK4WIaKGM5bHD00+yQ0B6GB0U2m/56xsDEbfRKM8nlC2p7vFHSYpAQuGHIMX06V3zHNiu1X0UqOBYgC4U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9a8Xa9MRZ0TZrCAk1u5GCsP1obaz0LXjb+ZOWeTkdZqrm/xNoB
	+Jw43eXxh6Oc85Xsx/SaLMRqxAFYX2L1RtjpRaFGdDL32iKJQ0/MSD+FW2npX/P+59jSiVA7ccB
	l9rKl8xAeNTEth6jy+mCxCifTS3FkXUw=
X-Gm-Gg: AZFdTZffJ/FOXVlFrnfjaihDVIQKxCSIxgHFpRtwRQB1EdWEOg5EdtYJ7NZJ1e2OY6n
	48I0AuBQ63JvZHIiVPoyuzIzgNH4wqWwtUKhI2rPjbdZv2TkH8sy1lWJqbkK8e07eeLyhuhXxEc
	Xsm9KdZaNDatNTzepquzQKfk4LU58UShxAJmQQcQXbzSAR8ITUTZLREdEbOckGnYbYRZMz3b0a0
	lYQhmBKxcXGBGg6Ruirrv8qBM9wptnPdul+cZ5ah8tOqwP4LpXwSbINrehb7Ob7zomBd9nBxtF4
	20Np3d+0cw6qPQSXB4LromvlYtyPVcIKmOjDf+5x3qzzL5Dd0AfxqKkM8hcOrCHSnUuNbNXY9V0
	/3aH8odcG+rNjKxDeTNA34YMxDOdQnqiDv9DDD9K4iS99b7o8DbF69dYDcA24sebaR230yw==
X-Received: by 2002:a05:690c:a89:b0:8b4:c1ef:db88 with SMTP id
 00721157ae682-8b5204dc558mr63502567b3.40.1795556326911; Tue, 24 Nov 2026
 13:38:46 -0800 (PST)
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
 <CAFBinCAzSgCGfXb_Q3FuwEmPAEiHSxzVR_ceyqMNp+LEZ18u1g@mail.gmail.com>
In-Reply-To: <CAFBinCAzSgCGfXb_Q3FuwEmPAEiHSxzVR_ceyqMNp+LEZ18u1g@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Nov 2026 22:38:36 +0100
X-Gm-Features: Aa3M54pH5ipmAt51OQad9aGPrJTAjEJ236HllU0tqVNlknXoe88HjErnJUF6ArA
Message-ID: <CAFBinCD+JwU4mdgE54r0_XT8K5eMt2rjKQ9+3Pnt9V2nviH-fw@mail.gmail.com>
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
	linux-kernel@vger.kernel.org, iav@iav.lv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 10:37=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> On Sat, Nov 21, 2026 at 10:31=E2=80=AFPM Lucas Tanure <tanure@linux.com> =
wrote:
> [...]
> > +                               int_mdio: mdio@1 {
> > +                                       reg =3D <1>;
> > +                                       #address-cells =3D <1>;
> > +                                       #size-cells =3D <0>;
> > +                                       status =3D "disabled";
> Lucas, Igor (+Cc) has taken a closer look at the MDIO mux, see [0]
Sorry, I forgot to Cc him :-(
Now he's actually looped in
