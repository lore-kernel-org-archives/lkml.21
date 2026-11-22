Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371986;
	b=3jR68cz2adkW+XZtHtK1OXOC6FANmmYm6M79AjiRXoofzxDK1sRfxN8Oy97R38qnheQI
	 k4+YgxN0Sb7eLyZ6tJWk6FcZUh+pTEHOTqdsvnyDzzpdUiTUj0qbdbyTotEs87bgNu1VJ
	 R/T4W2bktU30TtxQX3Y+5J+g402oJX7Hp4ihNtpq865NRq23GbCJsuabCabAEFKcgzuMM
	 t/QB1tXVXeqBxTeixuSUQ6OO6G1emNz6sFBqQmjvzAX7Zdn554TrPVqKQlQzB2lk4g7TD
	 jPypliFhEtTA70uBKuZCJnzQ1mXnD8xbC+pAGkQTFibgWBPp974oEq9YpUMwcO9lufA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371986;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=4C6duPyG5vPlqV7p+o0/kxHKLFL7wRyqvG6Mw43QO1E=;
	b=WDvvyvG6bAg+w8pPNDzBrsEDWL1xr2UliYtR5Yh+OO5gm2UeBd+VsXDOFVU7ofIprfMP
	 tR+yy3PGZdG0qEqphlYbiW9bh+GWT7xCMK3erJZzQPtO20uq9TwpfKqlP5nPp0HNP4Ani
	 zgjk/2TnKBwHWu3/KLXpkTT8OiNgCkoEPtSrRlRm6pXVjWM7cj67iS/Qmtj3L2nlBOwLF
	 jYc/jz+B3T8rl4o/dSJsCwUnfOCNJrKAwE2aXpfy0IOC40KJJi1CpCvAUXV0oZJC4sBMG
	 o8ZGIXD7YIjxW4rri1BLrKh0UTnNfqPlL7N6uZeht3Unq3mDvjG0Q/EEXs9NjTcJ49A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=VNww9GMZ;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B859D606A334
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:26:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B859D606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=VNww9GMZ
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so350144566b.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1795371984; x=1795976784; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4C6duPyG5vPlqV7p+o0/kxHKLFL7wRyqvG6Mw43QO1E=;
        b=VNww9GMZot4OgfbhbLhbPpxx5e8cl1tDMZpJbMjMx8XqzQOApUCluYz2FUwvOvLy4l
         qKvzd67uXh2hj+d8vV8dhqbt2uLvqKog3SCGIEQRBUuJ43JpFXDdse4ZrKCDpXvSFBYo
         6uOr2M3S1El3ER96rJMixdt4/5U64+pW1RUww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371984; x=1795976784;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4C6duPyG5vPlqV7p+o0/kxHKLFL7wRyqvG6Mw43QO1E=;
        b=Eoq3KXSelyq27ilkNUAyJKWIgABUVHJo9PXhZK6iDExO4U5b07plecOs9sgxiGMY+8
         WINpvhsgq36jy/BOwfJADgSdn/s+hQXkrErVxU0WFjmiQMEouOFF2HNeiKkCO1x9/YM7
         YLwQvkXC3l5xO0RXwtP9E9fulCvc9eTchcKyCf8IFxFZo0E2b7i9lYnHM8o9j0fpPV9D
         kJQCNMvsKCr8GXZ4MLPp31cM/m7Shf2aQnrZSupsr35aCAFgfz3OVK1YX/uDGuU7vlHr
         GDKX9YKQ6qzAjgx9U2P/PrBNKC2VGnh8moAVfqP0eJXEeZfCy7+FP0jVBp7o85dI4YKI
         qAnQ==
X-Forwarded-Encrypted: i=1; AL+hErH6lvmDk0FDWMqz6P94rObOZclxkCi+791Osbi8CWfPdnsMyrN4TpSMn7OSHNrXKwpBUmH+KGuOCMfiVMU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NV+wIhz+JHS79xTZZ6bDTbOMouxlUlFxQPQZqKNAJHpcgNpPe
	uDoDPWVhhjJd4+15a+xyA+RmQiLWMU6Yi+Qnil5u2MdpAQClAkcHe/QOtxWsU0OLbZna3GAXehS
	jsZGH6SY=
X-Gm-Gg: AZFdTZeGT4N3hXh7IlhGRbr1l74jU0bf879qUdJk+Ii9l/IfonD9rw2dYt7OF6o4FfN
	YAc5qKi6LbCaqCZFuSNCnrzpBkB/lvfMjyQQ+N0XFomoi9cubPVFy64uDq0nYfsbzz9elbkGsIQ
	yg1M4QXj0nKIAJSy0wH9G9jvcUH+FF0laE/7gUuUFIG8SezhEJDB4V5/CvPPGaEAB4gAWiS9Uc5
	GsJYaDw1kYp3oSJj88SNnXnnnIPR2iot4ptXyB68LMCY5pA8EN3DiYlchUrfB2ifI3zn6BJanlu
	NBTR8fWc5a62xKemp25gl5CvpcdvMfMeUUzh65w+4fUy3FWsGCFyhxSJTJzJTa7UefOx91mOduD
	MZle05/7aoNKyToylkVM4eA0EVdt5mmrPWTefzKvbWZeHuycr/fUXDaLlOlf+86sN7/kq3Slqfj
	hJUQS15Vw3aVmmaBSkhg+2Lzsd2RE6WOEsExrqn8lRhKYZOlQzbmvn0U6jDHqpr1tMoT1IwbITk
	Q2XMlVag4gqJFfMb6LHdQ8slHmx4OWz+kaAywc6J1OHCoL65oOBpThjLBErsqKkSXP6ibIuE7eo
	Zvw+L9GoaAEKcIZNHCH0wlOfQyN2NPiIyUF9gPlrj6TzRZVcy+Skncg7wzbYhNI2r4q43G2EKq9
	egK5/
X-Received: by 2002:a17:906:c312:b0:c4d:31f7:28e6 with SMTP id a640c23a62f3a-c513a8805efmr622762266b.29.1795371984065;
        Sun, 22 Nov 2026 10:26:24 -0800 (PST)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae679e3sm335507866b.22.2026.11.22.10.26.23
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 10:26:23 -0800 (PST)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4cdc606b47so437226766b.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:26:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGIgaYSZS/ztsXBXUXeMyk7c12eYa2dQMsQvbX0LH2OafJwzLZ7RMDTBzSSXIOyFY/+d97OywndjdX1IKU=@vger.kernel.org
X-Received: by 2002:a17:906:15c6:b0:c40:231:6eab with SMTP id
 a640c23a62f3a-c513a5eaa3emr601872966b.16.1795371983466; Sun, 22 Nov 2026
 10:26:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-vfs-7.4-rc4.fixes-0bcebc1aae75@brauner>
In-Reply-To: <20261122-vfs-7.4-rc4.fixes-0bcebc1aae75@brauner>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 22 Nov 2026 10:26:06 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiNpMo-uM86NEEguFtBa5N7OLcQ6fYd=2gZGuxhJv0SMQ@mail.gmail.com>
X-Gm-Features: Aa3M54qJFxDloCRjJVN16I8Xt2nbOI9mFuPP31QMki8fcNEx3MxbnOeXxz5hNVk
Message-ID: <CAHk-=wiNpMo-uM86NEEguFtBa5N7OLcQ6fYd=2gZGuxhJv0SMQ@mail.gmail.com>
Subject: Re: [GIT PULL for v7.4] vfs fixes
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 22 Nov 2026 at 06:42, Christian Brauner <brauner@kernel.org> wrote:
>
> This contains the procfs fixes from the procfs rework I've been doing.
> I've mentioned this on the list. If you'd rather take the fixes during
> the merge window, let me know:

I think the changes are good, but none of these are remotely new
issues, and I feel it's better left to the next merge window.

Even the bugs / misfeatures tend to only really trigger under special
situations like module unloading etc, afaik (eg the "sysctl unregister
can be held up over user access" kinds of things) or actual active
mis-configuration.

             Linus
