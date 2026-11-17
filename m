Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794942743;
	b=5cqnLKxdR1V4WxOljE7WF060DHlV4z7Czc7S7AqAZ4Ost8wrB09BvYsetZd3Pc3669le
	 QwTIZYMq21ikhwse5ZADhjUhyCgZuPx4lWhMpdUbbeCkYew6mU7HedgNjNCsPT0v20MDy
	 5GqJ8IBkBPsIBAMzM9RTQ3bEPfmkYt6gp1c+PSXKCig+hG3uj1LmJL4SdS412t/8FIAMB
	 k1LUQmoSnNLOYb9nMpEtpYe6R+aeQAG84KyrweWH4OxtohmoAmqBnv9zVfSKDJb+wOx17
	 rbm0zbvI0r9HQvYXYKgEhAMM1FSYZ7R9lbey8hArhfKSWnSCZCZxN8NVPv6NWFCg5Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794942743;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=fEyRTCIvFn0qfVWEf26UkSN1N6cLWQriDiBDA0wCb/Q=;
	b=4OaZuTpFoO5zE1SGT31tcRZ7Bzy7sDWdkHmDcEBamXE0WKrGNpPlvmfNHCb6OfNwUxHk
	 0/0n25Zb7wzRsf8EhF7wBD3uKg2VImHskCK90kknOFop1xC73hzc27swYwL+LryO94iCt
	 53muf58mZ2uNpV/tUysH8fcO8jLf1EOlbAjk/KTJRbl/Hk/Dcgn1xDGmUhGRkrZyBpIEJ
	 u5974l6VNG7OWcW9jIafI8d0n2ZeHHIZ0KFo+gqOAchUixLn7KWoYaTsErtCG3/X0TFQg
	 2dfzNGzNXwLwyo7RPhuhaSIkRZffhssYO4ZGpzAOsEzSVAV8fmJSXz2h6i1ZWzB2Lpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b="PyIFowp/";
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5ED606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:12:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C5ED606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=PyIFowp/
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4d21051042so10809866b.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794942741; x=1795547541; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fEyRTCIvFn0qfVWEf26UkSN1N6cLWQriDiBDA0wCb/Q=;
        b=PyIFowp/MC9EHblJR/FjgB+sBQONj45OomIR1TSjzp7yh8agarQzuwsas3cgGxvvGl
         iOJ7B0po7o6og7HEn4P3FJHdRvIDddDHKwoZmtYm55ZDX6n2Ue9ZA75FKueTdk4xauNG
         p51PruNslE5UsNVe+eoGlydvV2TDN0teZuy3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794942741; x=1795547541;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fEyRTCIvFn0qfVWEf26UkSN1N6cLWQriDiBDA0wCb/Q=;
        b=GfjVsF7Eij7QOS77rVPNXZ03juTlcTdMw+FKY3exeCKqO9b79rTf5VS6G7beKvM9kX
         nYsdLhoHH6sVZMcqUwFl0RHtSpuZold5upkerdu8Aw0SFNnB19s7zvYB1ep4RJxFSXTF
         CjsyUfsz8Lv0mA7LYs/Z7KNtfRGtBfAsVIe5FDcvxtoE62guG3onE7H3qMJquekd4Kwq
         Qexvzo73ix2iaBcJLsmMYed73aEo68stOrBmgKbkuyNpR2yFckoA+RxlKcXP7rcihMrG
         +h2xYJmUT2FUrGBHxNLONXDk5hIIRwF9I7Cl53hWirfNgZXBtO2lucd4Aqxc+6wPf/fI
         AxZA==
X-Forwarded-Encrypted: i=1; AL+hErGSuaCQE/HM8Xc1xk7qeRilr9FD8rnaBuhVjiUffDj4B0uDY3+tjxj0XCjw/cBOjwZqpYQ72AzA3bP1bkc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JvFJpKMAtatqxJmybeCJUcprg49sn6DGv1CFNmXgps1oM00Cl
	fG5ohgPQzsuPIumQQck0cApINWTxeEvwVq9IsxpS7RTQM6yi8Xnsh5CGZE8x5lFpACwag/WINc8
	mTtnZBcbkzA==
X-Gm-Gg: AYBFou0pnLJSuthUVepps9XiM7zp51hOBBi8a4c2rUUbQbjOzpJIu5noFkHg+NnmiJt
	mYcIenpGfaTF3/BuRqZoSfa+mXbQLhJbfOag7RXQIc8LJH9ZOKl88o3g6ySPGW+2jkNvaKLFeDP
	e3n8uDBMHRUbDt8Kn/1PKhXjzDz1Y/2naMcJ5lfCSsxD1FvhqktAvFCRwn/eQtRLsk2uxvEhK93
	BphQjnGsj4rhq2BOE3SP7FQyClFkjUi4nTzRIliLcnzlWCQFS4bWq6ajyVLvn4Kttkvo4fOebOK
	BIh7sVWhenFTdBZyQ0jo7lqVFsFIqMZjWbMFvifLimEH4CfphIhnBqhMJqP+bC6O8jB7C6pSTGB
	+TcQRobxSXAE2c2fWojsRfcYFL+BqOYjRZ+i8ToHhUIChi9yVWS22Iu6ypgMt1rEvohUA9EWuQo
	1ewYadSBOo/67hnRfFQZjFE3I4Y9omMWbCjeLWQ2n4n361ZMvM+ALUVRb7j3otz4eVokGo/hbYR
	dne6V8nrdVke9mPzXHi5QjFYIi4uSAqrZ66LxeKHroQh5PYQBTYcJAINKtk6//a9FACbT2XBEAI
	kwQzHT804p0Lx3XwnXj7NDugfeJ3hPrX0mnQtwIeVsrt+NF68XtvAtGg5qnkusIFRGTBgUHZPj5
	3W4U=
X-Received: by 2002:a17:907:6095:b0:c51:908:fe70 with SMTP id a640c23a62f3a-c510e4c4f7amr16889666b.43.1794942740787;
        Tue, 17 Nov 2026 11:12:20 -0800 (PST)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c510cb84136sm13078366b.87.2026.11.17.11.12.19
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 11:12:19 -0800 (PST)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c505186727fso6336566b.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:12:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHq3BSkOgGpzUySVkEZNmTF8n3anFnF97CFCxbjv7cClPPRlFUyfBLdeSz1M/kJ1any9TkEwGhqkmzHhis=@vger.kernel.org
X-Received: by 2002:a17:907:d409:b0:c40:3a99:3f96 with SMTP id
 a640c23a62f3a-c510e162740mr19765066b.10.1794942739071; Tue, 17 Nov 2026
 11:12:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-pipe-epollexclusive-wakeup-v1-1-0af6283e9fda@columbia.edu>
 <avxWKI795DthE8Sb@redhat.com> <CAHk-=wjOq+G=6gte4vX_YxOD_VfE1uZh7=+KHs8N0wU75xyHEg@mail.gmail.com>
 <avyODoFhZ_M7YDU5@redhat.com> <CAHk-=wgcBSBtHE+3ceKGjq1jyF64OyoEqf5JPpixowAa80GqNQ@mail.gmail.com>
 <avyVwg-5ef-pXZkG@redhat.com>
In-Reply-To: <avyVwg-5ef-pXZkG@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 17 Nov 2026 11:12:02 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjJF8uZLfVbbqei9-fhs9K70i2OnVreCV-rQF9EGKAxJg@mail.gmail.com>
X-Gm-Features: AclHuK9dpUSJoar-8-Rd_ibx448sJ7TbrjnfHX7r-45ghAgtBLw1mawjEAbP-so
Message-ID: <CAHk-=wjJF8uZLfVbbqei9-fhs9K70i2OnVreCV-rQF9EGKAxJg@mail.gmail.com>
Subject: Re: [PATCH] pipe: keep per-write wakeups for EPOLLEXCLUSIVE consumers
To: Oleg Nesterov <oleg@redhat.com>
Cc: Mani Tofigh via B4 Relay <devnull+mt4022.columbia.edu@kernel.org>, 
	Breno Leitao <leitao@debian.org>, Christian Brauner <brauner@kernel.org>, 
	Mateusz Guzik <mjguzik@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tz2294@columbia.edu, stable@vger.kernel.org, 
	Mani Tofigh <mt4022@columbia.edu>
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Nov 2026 at 09:58, Oleg Nesterov <oleg@redhat.com> wrote:
>
> On 11/17, Linus Torvalds wrote:
> >
> > So what we could do is to just make the pipe code open-code its own
> > wait event logic, and add its waiters at the head.
>
> perhaps... and we already have WQ_FLAG_PRIORITY, but we can't re-use it
> without more changes...

Ok, I looked at this, and it gets ugly, and I'd worry about the
unfairness. Yes, the unfairness probably helps throughput, but every
time we've doen that, it ends up being a starvation issue for some
case.

I think "ignore it - bad epoll actors get to use both broken pieces"
issue unless somebody comes up with something nicer.

             Linus
