Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795333963;
	b=0toaqZxn6MSPwdhZ1xRBjUHOuo/y5Jpmjkz1S0TsrEskQ7MhwWV/GVbbIGNbpfKQxOvT
	 tGM56s5Tprsu8EViwJxWL6rxzyx+uovSP/7GL5nffcptJVyKqyuelA6Qoygu33ISDZ7YT
	 1VcJ+tTNM/C50eztECk0h8XqEM5lIZSS4KrQd7fqz1jbCUEAK9k8p+WpmD2M/1bTqsxWs
	 7nN1RKbrOZ4HCjJKCAGq11K2Hpv/alfuN9NdNgzABBU86G6OE0pQHDifV5qtRj9iCKiz+
	 vIPMSaFX3rKjoHfy2bltQ27hdzENFQQlpRfSUwDDMWgbPEKpY3uLRn+mor2Z3eA/BQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795333963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=/xbKBOQ+2sn1cOusP4Ybo/C0ew1hnRxWONbAKH11Cm8=;
	b=LxlwCuwLfMjnAm4T6gmfsVwP7/ZtFUVKy2GPw40NZRRv4o1or0+QUZO4Q6gJtsv6FUO5
	 vPlmLEM2tshzZJuclEAXo9IYLGX96/MBGDwwt3Zlridp6RsrUg/PsB1jzT5l/clkORgld
	 bA3dZfd5gkVzDp/E0AG4OTMdSwnhLkrV+xL6zVaF38k/jZMU+WyQY8VU09Y0z+0g64J6y
	 Dg6T2KhiR0/t9lkUK1fnxuhbUmdeSpKcX2Gh0qVaMqaiT7Tt3mAzbe8MkTLpKV+Hp87cn
	 CBslZ+7dcg1PNgYG/sR+U9a2Pjq3O1q3Q+OhYwIdWGGbYUDDiMf6xUP7h0/YvbRMi7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m8R5qLvJ;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A05606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 07:52:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86A05606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m8R5qLvJ
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4395d31228so365041866b.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 23:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795333962; x=1795938762; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/xbKBOQ+2sn1cOusP4Ybo/C0ew1hnRxWONbAKH11Cm8=;
        b=m8R5qLvJwnBLK+o9R0WVEq95QI9gDJrbaGXirXaWjgk4/GwfdqjzJOUbw2A/aJFZDH
         sHkBM8RJm4FlA4mq9kajGiqRVsiRqDoFjmS7rEmqEENIJtcxvliptlDaZXv1RC6AWxDq
         /LHPjG2OYQWyFuBZFMwRwKgaVhmcchUxB3uEoXwETrwwWx9KADd3vye5nCQGEulHoFJo
         IOnjoXUqmaUCQYlFC2jEBkxI8pvNBV82OrjqjXTK1FlNY4Sc8ejvJFsVx5VzNNDuLd43
         NrkaIBNgvPF0MWyL1X31b+LM7u+BiRAYXcVmYMZXq1VVOJ+SZoQrTYFM3wsziKqSewTb
         rihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795333962; x=1795938762;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/xbKBOQ+2sn1cOusP4Ybo/C0ew1hnRxWONbAKH11Cm8=;
        b=PibP6eM2MbXBh7TUQ1RxN4s5XXOvdQTFbUJhwGIdc51VcPAJE2SF+B8MEH3/6WTNq2
         P0a51BWsfwx+V9WXHuqZ0ieBADLzTAukAODZU2aVvtG1vk0Q97oC+ahgtQDQq+HRie38
         Xt2KB1YozYRLI7ccTlyMhQ1NOg8ed3tFUm9G2nva94JqNWK3r0q6jYlr6Kh8v8jKpBB3
         jc80JZRRy5XFoh02jLyxOZyFvvFpIGNypQ4VYmFoxwU+0uJnu4f8qRW0icQWQVehSBun
         z7tD92N0vxaf8pvYWhtRwCTHC0YlW5zKcfOmOM8kcNm0IOD8fmkWEoGBFP/kHEVue/n4
         z3pw==
X-Forwarded-Encrypted: i=1; AL+hErEZYV1rO4zMZycpxaKOfqhFsGhBE37VZ8cz5Xg8YQ73eN4yHEYqFVvV5ASJAzkz3JCwRmicB2W2wmBXy9Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FTdzYoc+BH3enYX/ul9VEY/sGjeYZZEKKH/daADrIx9f0Rsnh
	LMNZ89e6xbikgvra4lwTIOvvn1IMs230CMcXfB/Sh3H2UDWGOrUIuIe9
X-Gm-Gg: AZFdTZdfe3qb/4S1YOsxrzcemYRGHCAYWu6i5fXlT/D+2+oLZzghZ3ZsiYlbnDbQ2mA
	EgdoMQyw2Hzs8ym6Nczs1g9sfAIJqXYDRNnu/cnqXNslPOAEBcTJL67KxpAnf3+NkGbPoLrOHy+
	eguVlsoHOQv1CTQKLf7wWnkRMfLGa9Pi/m/Mc489ddwQtieu6WFz/uBISYiFCqvK1gmddR4cwp7
	QHgY0x90rPslkfd8oxgx5XL5A1ufIf8cS5xFUZUGUhrk1AexkNWZJ1OZLAY/3hvSV5zRL3nHqw9
	i51UjONrfE4FFQQ7uos33FiCc8pM14WzOg1Dr7HK99xyb6UagfLa54Wxf+dN7ZuxlmbQztCBT3O
	o2A5oqcHmS/sgIXTs+dNr1yVSx4gzutEcMfVzvBAPkK+fWFhzQ0SLO7ju7UlP0dCrcWov8aS2Le
	fS4mkiEw/gGYaBA30kC+nr64CEQq3aLbarkdGRGOcjFS4jSq3ALDyLDVudpfkMtrqMHtBbk4YJ1
	AUDA4NtGO0jM9Gj7gckY4DtgtyI4hgFVDjvZhowS2XcX1lUeoiHmFcGq23d9VAhBwRfm2qr6yJX
	MBED+Ec6Ft+3uQYkvzjCoxBAmA==
X-Received: by 2002:a17:906:2dd8:b0:c2e:3ed7:7db4 with SMTP id a640c23a62f3a-c513a840ebemr531051466b.23.1795333961712;
        Sat, 21 Nov 2026 23:52:41 -0800 (PST)
Received: from dl360p ([195.155.168.55])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad026a4sm290470366b.2.2026.11.21.23.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 23:52:39 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Michael McAllister <me@michaelmcallister.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: display: panel: add Novatek NT36525
Date: Sun, 22 Nov 2026 10:52:35 +0300
Message-ID: <20261122075235.2915534-1-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121-brave-adamant-caribou-b01daa@quoll>
References: <20261116070212.314228-1-tadilhusrev@gmail.com> <20261120114100.978148-1-tadilhusrev@gmail.com> <20261120114100.978148-2-tadilhusrev@gmail.com> <20261121-brave-adamant-caribou-b01daa@quoll>
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

On Sat, Nov 21, 2026 at 12:09:21PM +0100, Krzysztof Kozlowski wrote:
> Still incorrectly threaded.
>
> I asked to use b4 for a reason. If you insist on not to, then at least
> follow standard process and standard guides of upstreaming work.

Understood, and sorry. I was sending each new version with
--in-reply-to pointing at v1, which is exactly what buried it. The next
version will be prepared and sent with b4, as a new thread.

> > +      - enum:
> > +          - novatek,nt36525-xcover5
>
> I don't get it, what is xcover5? This claims it is Novatek device. Why
> isn't this actual panel manufacturer?

You're right, Novatek only makes the controller. Samsung's vendor
kernel names the panel vendor as CSOT ("CSO" in its panel table), but
it doesn't give a part number, and I haven't found one in any public
source. I'll try to read it off the panel itself. If that fails, what
name would you accept for a CSOT panel whose part number isn't known?

> I don't understand why this cannot be part of other bindings... looks
> exactly like nt36536 or nt36672a

Agreed, it's the same shape as novatek,nt36536.yaml (three supplies,
reset, backlight), which already carries a CSOT panel. Would you prefer
the NT36525 panel added to that file, as a second compatible item with
a novatek,nt36525 fallback, or a separate file modelled on it?

Michael McAllister (Cc'd) has a DJN NT36525B panel on the Moto G10 that
would use the same driver, so I'd like to get the structure right
before his panel is added too.

> > +  - port
>
> Drop port

Will do.

Thanks,
Adil
