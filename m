Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795794740;
	b=J6DXK2D1o02hWR6D+UM45CSv19Bov1J64wOvsC7BSpPjCL+ybqq1eEEshIVaQW0yis7H
	 o5yOTXuFyy9MbWBEy6PvGwd4N0foVPt4HdWLs0eCgZ3TZYnHWL4BuE+XEhvhMY0zp1ltg
	 44qsTsECUdmjfEAlhHHI+nFSrafWaTSm9LauWqxfUqOt9mgZEba49UB+ZyljriTrwP+p7
	 Js8ImzNkR6BNmHjfYUG8MlpJp9VoBoTglf2LGn0PIXVJvIf+byLiS05i1bZE74d6a+MZL
	 I+TkFlcL3QyDh9o7sfOYh+7OdaWCrqKFlbKXgWcA6kiTFUNSU3bZDxX9D+2JzMLo9jQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=Bn519PC2mGI84FvdY3LE3CWcTtP+TtO03ylXAMsjaGk=;
	b=cZMK8GRlMeUft2p3nDge48r7OIUZMdlfjrLXz33g94MAPNl1VlJIPXuM5Aui8KFPVRly
	 G+p9SoHzVDsl7uzzgJoEA0DcijuFIOXxQfYubksIqBqeAGgilmUWTRi+2GamHPHP1iGYg
	 iywfVuj4Rz8+c8qeXdLQLZO5XnJfuJ2MWtC5faL9ZOoTGZsNJ9IIViBbxTpCYlA2QUYtk
	 XgSB/BTzFkRiJ+GjAyzn5j9r+wcA/bKWZ2QMfrPmVvw0BVvzWPpQvZDUUJF4owk8m0rEH
	 jby4ajiiBxPubJ0emMFsr1XDPBKfM+M9o1xXd9P8TEgHYMM9Lru3HFGXfj7AyClfEng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G68bOQ7g;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F31B606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:52:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F31B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G68bOQ7g
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b4d26094beso70534077b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:52:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795794739; cv=none;
        d=google.com; s=arc-20260327;
        b=UZL9mvknJztPc7MZt87yf6wV8qrr+d/GcsBfo1IAanyWGPtAzYPkBKw8yTrR0KBhIk
         /xqVPSuiorwqyao4YdVERqbsnTo0XaGSrZqyIkWgxdGMaekJry4zuDQbLJoEkSnXH4WG
         CXrTixTf9OsCnk+nzybo8/rNK283MGyRETfA2Ka3IFG64z+38W+9TSFcGN0y54BtPRkM
         kAg+gNfocJP3CG92R4mRRGE+ABkZUZ7nDNqKhY2cv1oPmHHc7xTFWlv3JpYAHW4+My1I
         uOtchIzYj4zGbGYCzJnCsXm9zYAUyMAdexhVzhX5yRRUsNGl2UBPtcf5k1ULUp8yOs+/
         l3pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bn519PC2mGI84FvdY3LE3CWcTtP+TtO03ylXAMsjaGk=;
        fh=SzsBjy5ZPAtTGSP6j/zGmxP9McGEy0Xrrxxvrt24bW0=;
        b=VK5zZmZagiV1DoRGEkuDmqLnHw6FtaIjHwJNmAzhWWXf81xxVIXJiyo6F0VE2lqsG6
         8WTA2QdliFH6vzqScOYCxrDA50X4agazg+H1umY80KQAN6NFg9bj0X2EVplVtcOhCjIj
         pi19aVgx13y9N8CMEpveEG4rnSHjGEkoNbzcaY7n/2KWyl/hn4TBpKJAPasNgDT3DxXF
         ksn1VxfcfUuUjzw+Z05JVF7Bzxxo2aQ/zgQLByU9Hy9kKMzMYvf1mtYK2YDezHRpOrHX
         RNmMS1RhhMTPbaaPfNMxm6FXEhWpGg5rOfivhriOBN4o/WFOR9HXKpcBV8SsNUT9mpsd
         bECQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795794739; x=1796399539; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bn519PC2mGI84FvdY3LE3CWcTtP+TtO03ylXAMsjaGk=;
        b=G68bOQ7gd9fYWPs4vpitzktdodXkfO4IvTrwfu+V5dAlrLLn2uoo8t2lRb/yzgDlY5
         8cpPB1aymtLQVMlEeKvgLiiMRoft0rT/3tEX/XFmyzXvcqrG84KRnXZsjQQjcdPNnmJK
         x/ZS7oaEHm7uAp4NfSTZ3C25iUKc/+rI+TzV43zvtjsdh72tY3bC02mZhdHbu4KE/zNy
         rObHq7sQNICtIwbLA5ioZsO3UaIkq8MgW7+lpa0iG6FU7+NO8meSRyvMsUMKckcilW+7
         ezynRg9NfyhSgeLgLGLDQWYwZK4kzQ38bXEgtHrHnrPOHntMm5m0HoSXgg6YLllHn3KP
         T+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794739; x=1796399539;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bn519PC2mGI84FvdY3LE3CWcTtP+TtO03ylXAMsjaGk=;
        b=hgleW7RXJAQyrpN5sg9jUk6HsjtHtbowMtWId57cMWXnd5iJodrGbQYo4gt2rs35hF
         7hqq7e1pcHd1hH2XZoV3qSPaoSo0smHTmBobP5gr6IWSwRSr2qtP3bDBlsq1+DOsDVJX
         4pXQhYf96bhO2D4B6D5/GmozUEh0xQkfJunwE94EdxMG6bmjfmOPZ1wT4CnKaDNUFefJ
         Ktx38Jw0kh/RkVbYpwP/3IVcGcRyAyshCWNrThu8Hz9EHaGcX1x9M7YHiUFNBEmlYk3E
         cw4NbEzrCjF3ZJv0pq4zObB1tO+/03CFHxIEGgV8UWMi3SN3m3dWvEaj1erqhwjTvNgV
         RlCQ==
X-Gm-Message-State: APuU4Z/m/VuJ6MPUC264N9F7E7LY9e9uk9xjCFamRsd997c1GdhG7U0T
	fMsbwW5BGqAoeBpkTiKzOW2h6aiVOEIWELVRg40tg01HtVkcy8LJwcWt4my4Te98GVoT+Gn9kQy
	aD4BlvqTvFwUCD6NdsZqpoOP1s5h4cS8Vgw==
X-Gm-Gg: AZFdTZfjY1IXSqBZocNRHaPjKFcXd3R5O3+ifuaDQddmTXz3yNgFoJBQfMT3jquonJs
	ooNp7rXGISjqe71V4d4uguxdT+QVXpCInkkkNe8n8z/kmOtkBl8QhUuUW8iXV0YzMhquzlux8nT
	ugIDbtPKocHVP/hAQgGUfdWy9X2+MecvUtJrqrNje4ODMEM3ysNOzwFoa2lXs7oOdiuo6KENZDf
	03FU0Esr6tva3yCD4Qhwq47/3bTBIx9/cbavFlg0BG/AVejRoJ/FVcZa5iB5kvRIKE1oFpF7BeL
	0to93FrJ6m3DbKRdkusjfhDbAp4rfGwp+0jy8KVAyZuhRKR2tHRXHfh5EXUqyHAtZvg5vgyw9bM
	zsnOakvA29eYLBTcatBRpNAhs9pY3V4ihuofTpoeVSqGwaOBoByuh6VhEX/+q4sB1oT+wZbFu6K
	0ORlfWie5IELVCUdI=
X-Received: by 2002:a05:690c:d0f:b0:8b3:5f41:3c1e with SMTP id
 00721157ae682-8b520456e2cmr101773017b3.15.1795794738916; Fri, 27 Nov 2026
 07:52:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123004501.1771603-1-rdunlap@infradead.org> <179544374364.72405.3233920081843026528.b4-ty@oss.qualcomm.com>
In-Reply-To: <179544374364.72405.3233920081843026528.b4-ty@oss.qualcomm.com>
From: jim.cromie@gmail.com
Date: Fri, 27 Nov 2026 08:51:52 -0700
X-Gm-Features: Aa3M54rm3kLJSfQuoGS-kB6ubBWCryZ8gHwyhIHj60l5I6g3JB7jIkv7hQ15H_w
Message-ID: <CAJfuBxw0ZC7=935bE0PRf9Xy5d+y-wA=5YMRJm0JmwHF7qq_dw@mail.gmail.com>
Subject: Re: [PATCH v2] chardev: GPIO common access methods: repair
 non-kernel-doc comment
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-gpio@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 7:23=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
>
> On Sun, 22 Nov 2026 16:45:01 -0800, Randy Dunlap wrote:
> > Change a "/**" non-kernel-doc comment to a plain C comment "/*"
> > to avoid 21 warnings like these:
> >
> > Warning: ./include/linux/nsc_gpio.h:2 Cannot find identifier on line:
> >    nsc_gpio.c
> > Warning: ./include/linux/nsc_gpio.h:4 Cannot find identifier on line:
> >    National Semiconductor GPIO common access methods.
> > Warning: ./include/linux/nsc_gpio.h:6 Cannot find identifier on line:
> >    struct nsc_gpio_ops abstracts the low-level access
> >
> > [...]
>
> So this isn't really a header for a GPIOLIB-based driver and technically
> outside of my jurisdiction but it's also not seen any changes for 20 year=
s so
> let me take it and see if anyone yells.
>

Acked-by: Jim Cromie <jim.cromie@gmail.com>

as to your GPIOLIB rewrite, I have the board buried somewhere,
I'll try to get it back together and running, and test your rewrite.
just not real soon.



> [1/1] chardev: GPIO common access methods: repair non-kernel-doc comment
>       https://git.kernel.org/brgl/c/d4dc896fa2bdfd7d1a78911598a0fa3e3c831=
d92
>
> Best regards,
> --
> Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
