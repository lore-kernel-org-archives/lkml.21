Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795370116;
	b=cC86tIkgMIK1+WAHdA5koAGKBButiowo3t7Uh8It13ZiYDZi2ykAHHVbw4VvUofyBBVw
	 pTafH5/+pXeRjS3FaohVJ2GTfFMnIqMivMrgiuOmFkckM2fpD8bnv2Xo1ruuEEmy6x8jX
	 ODQSzVOkX8nqewUXxQeu5/3tvn8eeO5uIUGiWoAIFHdZS3e5ET3RsZF39iACv74WuCDej
	 m2uHTI8eod4VswOsN3KGb54s4zeHi8/oL4CvH3uCVMJih74iB6JaR0AbY2bpJbBCZ+kpk
	 WT9IJCPK3GkeEV17/qczRTpVW5AZjpmSGs78xPswGFYr1oSfea1IEeS9gBtTs6shNSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795370116;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Subject:From:X-Mailer:References:In-Reply-To;
	bh=1yMVaQOiv9B9KFhOF3+nr4ODmkWDhOk1vIMDXuWTipE=;
	b=y2uB6As8q8RDS8l8O3pGJVI7hOy+JYHbFr1ezEH3acMxMB5NoYubwPnQ3Iq3HExt9eod
	 vQe70/1LixdU2miAlUo1YUdS1SM+N6A1iWi2gBEnjThAotjW6W7asbhJt1CIGVenrUt4P
	 +1KneOLNeJhTmCb5pZIQi7NSFU14o12NmBNDb7VOg8TN2FEFqhrDmuK7mOZZGMIVMeBJO
	 pgjxy/4fgAwdEfKLzUcDcabq7JaPxOTPrfsmB/Nenx+v/gdBiAigySvctFuvcrUv419si
	 8cuCHjB0654u+FD0pPL1JAUeQsSZoWztzmu3GXKW6qChE3chAqSHFU98tkCSoztzvXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="F8aupT1/";
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA9F606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 17:55:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BA9F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F8aupT1/
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso565440766b.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 09:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795370115; x=1795974915; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1yMVaQOiv9B9KFhOF3+nr4ODmkWDhOk1vIMDXuWTipE=;
        b=F8aupT1/AXXLqFRYnFG9Wa4oKDTm+nQiKVJJpHAjGD/m8srnDYHjHTuG7VJUL6jgTU
         0LshakNGtPggj2pbNgWhkM6Bv3c+6fydnUaJ8nqhmnpdvE7ZKJtQxTy4zukzH4aBsjc8
         cS9lkJBW8SapYNQ0UdfwaqI18nSj0t0fkfsqW8rIUt4aQh7cRwRn4F4+bFYhBjwcwK1Z
         y12l7sKn7AfbwbnERzZ4fsWTbscrrEIr7IUW4+j2Mg6oPYWF8POyv4tPa+yqONcKI8nW
         W34hZbcsp6T/oRvaNKsVtTPv88SzVAxAOlNJaZ6UOMQ7mS6DpM9Yjw6iQmFvlB2kyO1U
         p6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795370115; x=1795974915;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1yMVaQOiv9B9KFhOF3+nr4ODmkWDhOk1vIMDXuWTipE=;
        b=Erx/W4tYjgS/S/O1yjJplcBEwXzvMsUCNb9YKm4UVtgRGfdNIhHubSKAetMefsIAxQ
         x41XohWWWxtEfCSt4rnf9nYx54sMslqgApqh7LXNJnmSshmjuXr9PwI9OEsxZZgJSo+f
         7NBPiklyoU2PtjetmZSyO14wiWiKS+f0GCKebN5nRQYjT+DfpQZa3JMEZschgw80GjZn
         Fv8hLMfeBfpCEZ15kFmtoesqMryPabqFkZc2jsIvGdt8Nwmtgn80MFc8kEK4mdg9lxpk
         sXWUNdP9W6sTcmILUBFG6oEkUq65yVMFK9aMtT6oIjn4eOqtaYEre5dEtYA+JZ2OLAeN
         UWqQ==
X-Forwarded-Encrypted: i=1; AL+hErEyy9GAcxVJZme9Z3cjs3mx0m2fYA65yNi6Snx4COqTQJYflb+e1t0/wqlOZ+hajU01RptPSbk+AIYH18Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/uNV7EoXTOuBo81rgT/eB+HLsWpOLMY4rR66mf/4GTF4S15oJ
	7+VH70Ah5X85hu1CRM5/VXD+Iya5KR6l4vBLdEecaDqAVRlH2WVJlPjU
X-Gm-Gg: AZFdTZe1+8Lp8zY+g55RlFU0nLP5Zckpv+EUWGHKLNXfGCtk4NPmyNliF8QkQN1PpmN
	9pX0AbdPBL/+5v2zn9sadu+BRWbB1FvTj3drCDNjSvQ8UMtL9pVUci5ryPJGF3huAd82RDB13Xg
	PtDZfuD+0WaIDTuf+929JmtMGMoxtiQhW1/G0hBKxIgY3/YB31RURaSPT5BHZvGJa6I10hMBuFu
	jVvhhT0QLvyNjjCdE48Idrlnd1Re9o3seOqdJJJzmf8N6UblJ+qNLd3tXdBRdoqRqhP/XwjSkLE
	ToG1KPxRSqpxhjAP4w9yA5+YBbRoU5yr21ExG7vn2Obn7T9LthjbZWejKNZWrCtwBYQoPJJfII7
	HoIXFhWkdIiDu0DCcug6gOkypeiig9A0csgg9vZ1+lz0Nn5ylSTSLSEkmF116kkToXkclwiT6JO
	T7FB9GG7yow23TcHZi40cGKEDvb/ANHhXIBZt3kszQou07Ec5kEVKCbGDbxWfNM7lyGCc5jd4dz
	jlHBRozsGxwyrkdxlMja1iqCYeNq/0Hs5GwNltvAQICnBlr0rFcLAZRb9rdIPVlyayQRjMCw62s
	NBl0J2+AQQxTNBn7ufBh5n2w27HE
X-Received: by 2002:a17:907:3dac:b0:c51:249f:7215 with SMTP id a640c23a62f3a-c51317e3341mr933233966b.7.1795370114732;
        Sun, 22 Nov 2026 09:55:14 -0800 (PST)
Received: from localhost ([2001:1b81:1b55:aa00:48b3:8eff:fe5b:7d15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae6841asm340920566b.24.2026.11.22.09.55.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 09:55:13 -0800 (PST)
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
Date: Sun, 22 Nov 2026 18:55:12 +0100
Message-Id: <DN1XL7HI1QUD.GQ4SZXCBUK3V@gmail.com>
To: "Oleh Kuzhylnyi" <kuzhylol@gmail.com>, "Daniel Golle"
 <daniel@makrotopia.org>, "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 4/5] Input: hynitron-cst816x: time out gesture key
 release
From: "Oleh Kuzhylnyi" <kuzhylol@gmail.com>
X-Mailer: aerc 0.17.0
References: <cover.1791233147.git.daniel@makrotopia.org>
 <d73d26d8c9d75fa230e3dd64058acb65f45da64d.1791233147.git.daniel@makrotopia.org> <DM339BDR8JE2.1FJ5827JZIBWD@gmail.com>
In-Reply-To: <DM339BDR8JE2.1FJ5827JZIBWD@gmail.com>

Looks good to me.

Reviewed-by: Oleh Kuzhylnyi <kuzhylol@gmail.com>

Best regards,
Oleh Kuzhylnyi
