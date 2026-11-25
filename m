Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795577317;
	b=J/KoXB8SkaaixHzxbylD5EzdknemF8KLpTDxkjGukKjbs4d19BTVEol5bgas6a0PlnIv
	 fRoc7coZSiqZHVKASN1R2Lv/c1HNIn21jQm7gG820Trbf0YnVd1p9+9UkhWzwNc8zIly1
	 fu48Ii32Am/Ji+UzRUtD0JvCDgo6TC8TRtsYPW5Ld6lvDvwN7TQKtU3a+5pvjW1gAZ4iv
	 paWGp8/FT+Bu9vHYXLA3c2hbUCLPEIXB6tZ4zY971iw7FZKZGt74+PLF6qiyl1koCq7jN
	 ygw8TiZuQXL/Mv6lOplID7AMQ0N23AkuTkR50+MuYbTc9fit3wH5f/3fSdItTp/t2uA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795577317;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eVOao2kSoPsHbrBTrVlhM55djOW3pr1LawZArVs2fJk=;
	b=up9DD46lYPHxVvlwngsvkSOjFq7IrIMrchDRDRZxRcIzBjywanIuOMIKtnmyNEANV4fe
	 6k/LgtiaEXx33DHPjjCvnswnNsCpy9RN4bGKNgds14GBSDqKuOCDZVjvOJb0F0zVFF9JH
	 8fbgTtmaxlTfOm0vZ4ezl0cRPwimxzQCW+Pp68DYkMlS/Y54dDWGbbshEE5Mu6xV9n1ag
	 C0kxh5pTY1ff7v0Zr5wDY0teHAJnrlnwjeJ12kQYLWhs/N2AhjqMWQAnba/3FeSBpzflO
	 zKcIuyH0jJoSAPoI74f7IvjhCC29xGTEfZ6fpPBKdMZSPWgIUYKsXXShpN2VdkXABgA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CKrE2NJm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF275606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:28:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF275606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CKrE2NJm
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso7360952e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:28:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795577315; cv=none;
        d=google.com; s=arc-20260327;
        b=grm6ZVsncx2Hl9dt5a6+pQjgS9MKuLnaBhftBwmUh9aQy8Tohq+cFyYMFQH0MW1JcR
         Bqja4lvcLXpOlHS3NN/PgkEETSVtUIyTc7FeC8t2HdPbWK6BYerwFcIxlEyUbgSiLb5t
         OFwShy4JzlYS7DQ8YVt+gmp5+hJYPR2Ty80uN3z8Ngqb1oHsgZ1PzKvtiP0y5y+SsdjM
         +EjsS/HqCt6PgVxywUbVAkgycR3v6yISTwgYT8Ix6Gxwy0Pmfh9oWgqdUUhjoSUnU319
         wAswrHUqKpwKyzNy4aksW5rzX8ONjGbUkOPgFj7hoS14oaRachCVNKlAU3cAocyin7Bg
         86bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eVOao2kSoPsHbrBTrVlhM55djOW3pr1LawZArVs2fJk=;
        fh=Ihb8cfiALDT00ClvKuGdoGKOPS8BOPk89nyP0S4Fzkg=;
        b=Wsgd/PwJVFRtzAycanofKj+bOL2VkVNx8hG6yGdFrkJ1bTueUvYWs56m6Znbv4YCH1
         1r9QaeAMazO7JDj0K3hdhNwd0P3n/kx9OdkVHwC7ZcvQY1ue1mg/zgoO/Rdy/6sI04dN
         up+pgGBLBstRShBKgtf8p1z0+imiFQ55Nk4UlQMDTO2pTWkoo9QXppdt1JMmkJWqMcam
         CBVqU7KWArxwueNqb64ciTesnkdGTQzWgdNl9sF14WyB8VgdHfLBtnTKBD/nFxNCUOM1
         DjFCDSt6kRcnom/fA/XZjsQomIdv3BBgmSSRIjvdB/UhN6JTvJK2SKwjivo0/VZ/kg4B
         HcVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795577315; x=1796182115; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eVOao2kSoPsHbrBTrVlhM55djOW3pr1LawZArVs2fJk=;
        b=CKrE2NJmlO2x2coP0veBjV43Ou6wO02utmDWOdQSD0IkTjr3J6lG9f9RqRUMJs53A2
         hJprCmuxtWzih2y0dy4DOnGYV8UFqsLFMPI4kG2gOnaPvNpjIhM1Kl6o6+W8BXvYtw0m
         NXxJGK6jX2k4C7T9oqL6OKmnX+rwIQ++IbMcNRyOpuG5ejw0UqUyBEH2QNeB3H1LHV8S
         zTLR/1GbP2eDY+gj9cyba75/ol5+p0UJIi22lqyT7BJxORrSmtnxzcV5xE+EiFnTCJ6d
         xB/pPs80i9Wl7WMnvqO0buCYNyxR17vRt23KyQR/Sz6+CoSICQSpitl2qJfc17VRxke6
         L68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795577315; x=1796182115;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eVOao2kSoPsHbrBTrVlhM55djOW3pr1LawZArVs2fJk=;
        b=GB3HvxZ4tpHT41Uu91ZknYVg+DBBG5PirIjEyE6MOoacaTNBAX7uQIHlMi9nfNk/0Q
         v6dMUJ0xeTrD4Xi2WFg+TUs5bVX8duiIxDV1CxMSiA3B5lZhiLy8yVfKMbXLM1A4kR6r
         4+RZGTXrNCKP+p1lnLbgYAB9rQJjynCW6oCJ42+Ux16xUTJw1gk/K+SLk2skO0WFj5EY
         EvYh7dTSfWCgfaokjmt8kT+UQTxAD5AHLvuU+9Uqb2zaB9Ss0VvPHtdLOBrfU4CAUiaW
         vLWlwM/YiIdwjw9Swsv6s1JrDfX1oi/QkkBPiNU5Xtx5njhRTHPKGb+drSckpyuxmIot
         wDwg==
X-Forwarded-Encrypted: i=1; AL+hErEXC3df7fqyiWdu2uTEIERFZnlE/wEQ5wwgMYzzv/ny2fkwJqsbbpo4eFp//rhsXoO3J5L1uKjpF3zNs/c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cM6/60Hmj1vgTmb1OuaG1RLep8dpjt6tqIYJiBKFzaYOpY84J
	nV+5jf2EmMFEAbr05Im95Jikd4uHxh6/zta8OCDfH6nsEPIx+oFFA0VQMW6HqZEn/FQ9h7NGl0H
	8xgI+yN3+BCvIbNxleVdn40jy40fxs7Q=
X-Gm-Gg: AZFdTZfsqDyhEyploAifMluRnzhB0UjMBcR+b0yq//yObbFEZgVTi6ivwEi0ORq/DRf
	BllVR3xrhGcKMWXlxtR5YmVyurfxcEPga9NU23WP3QDoaYDphCmgMWkNVBu1Sw0AZW2aMKDWm4g
	bunm0a+d/yanXA4TxQN6brwMCR4TSrhcFAri8E8wutQX/gRqEmNEZHPSty9YjsVmPZsNGIIhPh+
	pIM8qHbjJbLgxR0UcV14wLgN20rsWySpzII8fsfkpdEa0oEqVatIRl5uplZqXGiOwyjEPFb2zdH
	HWHuBVDbAe7n2cQyVgehm3K8NXYQn1weu692BFNoCMbMfO6nWeEM3sfyb55gQYeUqZPvM0nhJpc
	N0ZH+IXHY/Xa8ZfunTsKKE1eCGAeTKAxNpE3mjJA=
X-Received: by 2002:a05:6512:8346:b0:5bf:f7e7:85eb with SMTP id
 2adb3069b0e04-5c1bc7fea99mr2659579e87.21.1795577314677; Tue, 24 Nov 2026
 19:28:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-u-serial-console-dequeue-v2-0-820f355827e6@gmail.com>
 <20261122-u-serial-console-dequeue-v2-1-820f355827e6@gmail.com> <awP_a5IqlYHPvx-G@qmqm.qmqm.pl>
In-Reply-To: <awP_a5IqlYHPvx-G@qmqm.qmqm.pl>
From: Fabricio Akio <fabricioakio@gmail.com>
Date: Wed, 25 Nov 2026 00:27:56 -0300
X-Gm-Features: Aa3M54q3-u3iR8PfW5c1rCzULwKjC42ht9kSn9FSOQhdbTrBvX5w3OxzVNEj4Ks
Message-ID: <CANxzQdFNudKjwSO0cA3Leizo9PmZgDJkZtEfEnBWL7H+xYwCLQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] usb: gadget: u_serial: Publish the console only
 under port_lock
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Neill Kapron <nkapron@google.com>, 
	Krystian Kaniewski <krystianmkaniewski@gmail.com>, Brian Ellis <brianellis@gotenna.com>, 
	Ai Chao <aichao@kylinos.cn>, Prashanth K <prashanth.k@oss.qualcomm.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 09:55:07AM +0100, Micha=C5=82 Miros=C5=82aw wrote:
> Note that there is `if (port->console) return` just at the start of this
> function. If there is indeed a race here, that should be taken into
> account.

gserial_set_console() and gserial_free_line() hold ports[port_num].lock
across gs_console_init() and gs_console_exit(). The initial call from
gserial_alloc_line() during configfs function creation runs before the
function's console attribute is exposed. That makes the early check safe.

The race is later in gs_console_init(). After it sets port->console
and before it takes port_lock, gserial_connect() can take port_lock,
set port->port_usb and attach a request to the console. Init then
takes port_lock, sees port->port_usb set and attaches a second
request, overwriting the first. Moving the assignment under port_lock
closes that window.
