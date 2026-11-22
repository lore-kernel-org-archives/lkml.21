Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795370383;
	b=5a+TB+It/kso8/oX2y2TCE8fr2jwcivHl0O4y9+JZI1PhltB/tt7FnxwaB/LDVuJQEB/
	 v54WJHibz+kvh5hWUO9e7rhcpX1RdkXEJAdQloWcmEcGwPEjYVlmPRj5BwQwsiY5gxjSL
	 WhwKLiCvmTQpEE9MzL+PE3gTbBLd7+MkNM9ujkgorIxjB4XrRFOWtfcTyT0jR+QHWGagA
	 9PclXk4/kGdUoOvrC3+6hM0HWekrSUCWfmvB4TTneXaHlXW8jir+LSx6B49g6u3jV3kVH
	 e9yVjwKpHpaomxEEfk3Hq51ZNU6nKHtMOWahcw0ehkiYSjBmtHOWv075m82sFQVNTaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795370383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ff4jSj/cKfylzuF7GrEwDeEsXTeM/Jo8CpbIJyNJYCo=;
	b=yHSlUZb8uqeY22SGuKJqrjOkLW0ZdTZErH5CsFW8mQ1+ZdagAVPrFbPsSceigeVHNrYf
	 A/l1frbMCAf82Om2dV/LHgqPt41/2yD7+dHw7A2LYnRCiwoHmEcskhDislsA1Sc6K1s8K
	 cnmM4MPWDSkSgCD9Sk3djSv5JtYF/Dhnrn3CLwFooEQfiFjix9l0q4ym4Fg05BDDNWys7
	 ynEfe6xBzITofdRtM50C2ngmx8mdgDhZ3lsLiFevJQb6QUZ3bI79qkOuHofNqeVIqjxLz
	 6OOE6JYEnWFSb/dKnjx5Jd4aBBUxpqf3TqazqfkIIUvOJT3VQ7sYUTC+JMqMjNT/t3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Aeiniqvk;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B761606A33A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 17:59:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B761606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Aeiniqvk
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e46e449e8so1643250f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 09:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795370381; x=1795975181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ff4jSj/cKfylzuF7GrEwDeEsXTeM/Jo8CpbIJyNJYCo=;
        b=AeiniqvkKWpAB1kr0/DQMkGYNw3mSNQTHLJN7Nmmnw22EpV8DjXlHk78Ro+gc6X+7y
         bEyu5oIdU7dUS+fES7gIzEEN6ZJZF6JBRg56z38NNpose9TpXxQdI7chH2eFpd6diarg
         QiKGWPzCTn9db8KVTamosYxJbANj6u5w1st0I2V07KAHZrabhXrGFidbJKqQmp6tiwuM
         4TdSeD2pwGkDRvD4D5n1g5zJ0c4jwTj1TbWDExzlsu3FERwRdmm9BRNpdodH1OSO2+7h
         P/Cns9UV69qvUotDqPTlooPiDGppd312bOvhOiy6VqbPjogz+/01Vpi5QZHE5jZyUuc7
         nwsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795370381; x=1795975181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ff4jSj/cKfylzuF7GrEwDeEsXTeM/Jo8CpbIJyNJYCo=;
        b=yhX/TenYLiHFpJtu2Xzob9o8RTuFBpakAG69QOstA/BUq/sNUU+zl25LunwoQydSyg
         ik+UAvYvmpeUW4NUlkyeY0idnh/8avQnaQ/BLAOCj7OdoMAs78OrylhQ2R5AX4dSOPB4
         yysj+yluKcKn/sJ44SQy7qc59fEdj910XPhn49lq/SDLd0yr/tfSVUfV18cafRZ23K9R
         quocf8Lt9PxMH4W85ezn486ZovC84n1DZs2LZ12iDbH9qan0YyZN98xby2384hykZPEG
         4kTQBh0C/kZNxxRpw3ye6z1FRP+vzEBQyUHXH6OmJA97aeK/905aZwzpI3cf6WxRAWaU
         Fchw==
X-Forwarded-Encrypted: i=1; AL+hErFxIT8TUfL1YUOmujpJLja/6+lbqc74/LHjjsavqoP0UgiEOpTRhbV5300PkJbQ7KZP7oQXV05gDcHRzpY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zt0qyGru1HnknmM6cgYpMx0xMIHLPM7l2Eu4Bwbqi8v9pvws9
	sDbBQGFX0CTvhJjezeh8KrSYWQCQQbnIoDnhdQewRlQV8/FrfTYobRLR
X-Gm-Gg: AZFdTZf610F6YOwm5yy1sDe5Y0NWl7JFnmo5LH+2uO56zN5rIVLQ2cJEoIF8rq4GfEy
	6KjCZWFrH5axn3AUymLhk+OaMopdS6tUs3cu5niDS8d+cHU7b+CR1rQczW9oC1BLBMc0kB8meeN
	cH9zkV0djSaAqxAXveCzb5HxxYWyyPIkxXr+9NwPPfjOelOZ6JsOyvHdoUbmCCH8mKHLz2NS/MJ
	1+h1fvQVe8wwazB+JBLh2s1KcHgFU3iap1Jko46NAmxcRfXV0/l1tc9ECWH5t3NtmLN+m5qfsOB
	BeEtP6Wv/4ty/fzIfgpg44RvAfpnx6yW+YEANhIu9bWdApwZSrhAUmnmoi8gDtykmZxslyJ6K+I
	zc1kTqRH6i1Ga3IrUp4qh71oz6OvNitH2QaXFx669pxOVUdSdyYoyaj4l5XU94/KZSccfhmumhX
	xa6jqEMIq82iul0fgQAeIRev8tVWmjYHWNHDuytb/PZx7US3KATUZMx0AfCP6P/0q5QvfHN/Ro8
	OE4fEC6N5fvF6QFcBzGSqDOADK3ckGCl0HoAs9LHcU09qHVx62sDk1WC0+dvghhDGYwUwE8D9wi
	eBnYBAV+ihNFKoUrzhOSSAYjsiYHQW6fdiVvdq0j1oEZ6r6DHHfp2d7p9guz2PaQhY4X/ZokPXi
	kUQ==
X-Received: by 2002:a05:6000:26ca:b0:492:3176:3d64 with SMTP id ffacd0b85a97d-4abad5ac748mr18217584f8f.8.1795370381218;
        Sun, 22 Nov 2026 09:59:41 -0800 (PST)
Received: from DESKTOP-V28CTA4.localdomain ([103.125.177.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dcf9sm17464646f8f.32.2026.11.22.09.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:59:40 -0800 (PST)
From: Arbab Haider <arbabhaider649@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shichao Lai <shichaorai@gmail.com>,
	linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org,
	syzbot+dc208a8cf8d37cf3e5ac@syzkaller.appspotmail.com,
	stable@vger.kernel.org,
	Arbab Haider <arbabhaider649@gmail.com>
Subject: Re: [usb-storage] Re: [PATCH] usb-storage: alauda: track media_initialized per port
Date: Sun, 22 Nov 2026 22:58:05 +0500
Message-ID: <20261122175805.2955-2-arbabhaider649@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ac19e630-f96a-4144-88dc-e3f22091c7bb@rowland.harvard.edu>
References: <ac19e630-f96a-4144-88dc-e3f22091c7bb@rowland.harvard.edu>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Nov 22, 2026 at 09:53:25AM -0500, Alan Stern wrote:
> I asked because when syzbot tests a patch successfully, it provides a
> Tested-by: tag and asks to have the tag included in the final patch
> submission -- but you didn't do this.  Did you run the reproducer
> locally, without using the bot?

Yes, I ran the syzbot C reproducer locally in QEMU without using syzbot.
I also just tried sending "#syz test" to syzbot, and it replied that
patch testing via "#syz test" is currently disabled:

  Patch testing via #syz test is temporarily disabled.
  See https://github.com/google/syzkaller/issues/8122 for details.

Also, while checking lore.kernel.org, I noticed that syzbot previously
posted a similar AI-generated patch from Aleksandr Nogikh on 2026-08-28
that never received a reply. Please let me know if you prefer taking
that earlier patch instead, or if this submission looks good to you.

Regards,
Arbab
