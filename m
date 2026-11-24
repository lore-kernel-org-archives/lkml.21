Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795552609;
	b=M9zOx/oZyMwegE9cTjE1KRTDdOqGgfpcuLEi3FZ8wOCpNflp7l3KM8Q587NZMLFg+/we
	 +to1UlhVRKRCpJxwTNY5+ktPXIiEIFomwysLOnd9wjqWitq1qEX7xhhwKpHt0vHOwripl
	 SLD8UlgbPPB3uBrd9+NYn8YB7WWQCIZZerKSMRuyIqT4gJ8JMPpH6CbzQ88fG2LLgqgqi
	 CpV9wwpLTC6nbuEj6SxrQXkLtLbRdTQqriIP/vIqkNtbUXXE6wh8uR3Uw5dqMpWceof7p
	 GOi3q2SpiM3EaLShIS+x0ttTVkD+cu7EVoBIoWUqRULgr2kbSP81+kFTX3m6Dvt8slg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795552609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=eJLr5+zjtN2zIXLilCqA/IW3JjEHhNR2k5tn4GAGSN0=;
	b=kRjtVQ66Jw1SmNd8C5xpX+p51vdbMKoe/wwIVgHAHHvV1en2q4Mtwc3lZSf424KeTgiA
	 B/c9xj3x2Ksf7DKz6U8q4ojw/o7wCW/xmtQI05jf74Bf1Vxb1NRNunYa9UvSyi6pxS2by
	 BbJpoW3nkvSbVQEW784+Bzew0aGyz1BpvletnR2ZdT0IIFoWcYowAP1BQSkptVFCKcLBn
	 AwKxcLrtxXVVgmvOtt5kELTUamEly9qiZhQTGJ5RZq9obXpGopYBAqZdsJGiUfRiiqQZ4
	 UjjM7LWtR6DptA9H3aYMUIC5Njz5BGQEvA27WP8HA9QDM2ZrQ8Buhn/yQgZmD1uANRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B05D606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:36:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B05D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4395d31228so850446566b.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1795552597; x=1796157397; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eJLr5+zjtN2zIXLilCqA/IW3JjEHhNR2k5tn4GAGSN0=;
        b=S97JUwUkwk89sa9xrvim+TxUIhZPfMGt1coF5XjnrYUPd0WGJihc+CzRggF+o8IlYH
         yNjeINVRy0sKkHIxfSGFNpXbo4lYLvCO3DVhLQp34aN4/uxeWGKDZGtmITxT9i7dN6xR
         VhK0XiF/iJyVXA7scrmbZnNVEsSWTWJymc5SM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795552597; x=1796157397;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eJLr5+zjtN2zIXLilCqA/IW3JjEHhNR2k5tn4GAGSN0=;
        b=jUcSOxK/K/K1aCYmFTqO5+uJQM3jKxtDWtRGdi+2bl9v1T/hHQd6lEAAw2fWGQXB5u
         ZO9JrDezSgnZIDwoPA16yTr5IMckBradCnUEyLrh5+s8S3F3NYnszydCGOGXNUg2sGW+
         /mZOSIHNveULYqwjMrrVOFxvlqpbcxo4e7sB2dKlxRUStz9NUMH7/0GcTZV7N0o/BqYX
         4bTZp+pDDHc8Pyy5mV1IFw+K9AzilK8Zd7XwtcPwL/QXjuAIKk6i3v+JsnTEqqq7Y79I
         wZiyax4MLVdK4yGGXA6d8bNd13BPibbFaeOHhjUfubJ/MHO6i8LfxXd0smSyuNH3ujEj
         6w4A==
X-Gm-Message-State: APuU4Z90jXJwh+kym7yAEFjlJNm5jpQK0IX0HOcIjmamn/P4W+ToHGvu
	PrvL/jMKmCRnwLCj1zTFakUYZ1qx5xAJ1QszyhODx62RGbFEouaMowMRe+vfRexPvwQiI5SB0AA
	yu6oyBU0RGg==
X-Gm-Gg: AZFdTZcxEcqriyYg0lI086pA++rzSgwR1o/Z1SiMaTHMQpGr7lnQPyANkByzHengaqu
	NiahSBM28nAWmOZK/yheNcyU2KHbO4woxI/ivPD39PTpUFr++TRnXieMWNruvFdNSoJI8XTo6n8
	Tc2vBUAnc/GVMAzEv0anAUi7G9tjoBU3LycF1bB9icS/DYzKHepbeRbijFJgfABWOQi5fTiPSaz
	2jyPE+ST38SgTlLccWdZWnaKajZMVbq2Yeca4kGylHqzAMAts2PnK2nUi9jaCCJhjfd3fbNioIu
	kv9Q3WHQYoLM2Lv6FWeO2E7uz+1Vx6do6+4RH+aAX7WGSKoJt4e5L7X3QOB8xXUDAIkwq/wAuBc
	5/6hL8ELHIZkJnOHByjjtMLW5t45/EQAD97P5d/cifQLBkRdKQ/RmBFc+UbpR41MK/f/pOYeISI
	TcSGr+WAA651oS74BdEn9KjFiK8AldTAOegEBBcXsOsAcTDOxLDFg+R+6u/LoddaE70Aze1Ahn5
	1XxCLDmIYAU76tlQe0FCmzdBfxxOcea9Kvnj6OdBU+MlOFuRm/QqR18JczgIsI4ut3PW1+kH3PC
	Q+gKmzFS6+0kKU13tIV/+XYSoszicfTokZXAcCHpg5uBW4Suf8Gg0fbY58Pi93oBuQ54F4AcUGV
	+D5g=
X-Received: by 2002:a17:906:f10a:b0:c49:b8ec:a9e3 with SMTP id a640c23a62f3a-c513aad202amr1113315666b.43.1795552596589;
        Tue, 24 Nov 2026 12:36:36 -0800 (PST)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b01e242sm538144266b.82.2026.11.24.12.36.36
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:36:36 -0800 (PST)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b547d6c07bso6529791a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:36:36 -0800 (PST)
X-Received: by 2002:a05:6402:2484:b0:6b7:221c:beb with SMTP id
 4fb4d7f45d1cf-6ba37ac6648mr12169260a12.0.1795552595842; Tue, 24 Nov 2026
 12:36:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <awW86EI5fYafQx-o@mit.edu>
In-Reply-To: <awW86EI5fYafQx-o@mit.edu>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 24 Nov 2026 12:36:19 -0800
X-Gmail-Original-Message-ID: <CAHk-=whyUfwzMDMTpih8Xs1MxmhwTCDAc_YwUSZG79vXFMLU=Q@mail.gmail.com>
X-Gm-Features: Aa3M54piJ-XMLaeN1Oeemqn9S4xWtQbFhct3GZIUhtcFVjPISsbDehuY56nJB5M
Message-ID: <CAHk-=whyUfwzMDMTpih8Xs1MxmhwTCDAc_YwUSZG79vXFMLU=Q@mail.gmail.com>
Subject: Re: [GIT PULL] updates for 7.4-rc5
To: "Theodore Ts'o" <tytso@mit.edu>
Cc: Linux Kernel Developers List <linux-kernel@vger.kernel.org>, 
	Ext4 Developers List <linux-ext4@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Nov 2026 at 08:36, Theodore Ts'o <tytso@mit.edu> wrote:
>
> The bulk of the new lines was caused by adding KUnit tests, which
> makes it safer to validate AI generated patches.

Honestly, I don't think this was appropriate for this stage. You
should have kept your tests in a separate branch for your testing, and
done this *huge* update for the next merge window.

This whole notion of "anything that is a fix goes in -rc" is bogus.

I've taken this, despite serious reservations and some bad conflicts
due to this braindamage.

But next time this kind of sh*t happens I'll just ignore it.

STOP THINKING THAT YOU - OR AI - NEVER ADD BUGS WHEN YOU FIX SOMETHING.

There's a why we have release candidates and several weeks of calming
things down.

Yes, I'm pissed off. Why the hell people have such a hard time
understanding such a simple concept is hard to understand.

If you think that "41197 insertions" is ok and cannot introduce new
problems just because most of it won't be compiled or becasue they
were fixes for other things, you are full of crap.

If the bugs were subtle things that have been around for a while
without being detected by AI, the fixes by definition are fixing
something subtle and rare that nobody has noticed until now.

And that makes the *fixes* possibly buggy.

I was going to just unpull it, but I dealt with this and am giving you
a fair warning instead. Get your shit together and stop this kind of
idiocy.

And tell your AI companion to get its act together, and do any new
development and test-cases ON A SEPARATE DAMN BRANCH, so that it can
be merged during the MERGE WINDOW.

What's so hard to understand about this?

And yes, it will mean that *you* have to deal with the resulting
conflicts while running those tests, but dammit, it will also mean
that we don't introduce tens of thousands od lines of random crap in
the middle of a release!

               Linus
