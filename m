Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795798682;
	b=NYvS2CuxDqijbGDShOqSHqDvU2u7YxxkmhW6/xFMNudquZOPLotq2CXOSG3KC8/zld6/
	 qJKH5G0RkVH0ZH3aMiqWOhfrmqdAP7Knti28Ky9sscAB7cl1dUN6Lf8jnmXRSszuUgtHo
	 u8agSx5GDOpKG/WCzITiCyx+PuONJMHDElhHc69FWjFLPAtgRnvopjBv8lW9xuGitOZkL
	 ntfsHj3xp2XVWGK00w3C2eRybZ8TaaQwYMKlF4d+XRV32Y9wpL202p4A5ie+/U2Hg0Ab9
	 tDJOUC8tcv313jjOdi0dox/95dcHMExPTejwPa3Cjx6LfUO7bmcm7lA5oBxc1f0rH1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798682;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=dDRUfH0o20Iw7H1ahxTXrk/aD+0O0X9e+lhbcvj0Hyc=;
	b=BBg8NucJeqlUrS7ZbDVbZRcm+E0m+f0l8xr16O0VQ4HNB3G74UUHhfLyN0ruR6v/4UnI
	 d8QLYYLCdCMcwY4GK0uKR++PMdhthTvp3STNnlrD5ATrh7gCd+do/2jCGX12ehWxAJ+J2
	 Tfkreug/XPVIf+Q39s10uHbnJUurdJJ+fzRv+XyQvUItkA/TJP3pEB8qjiIuQus/UOBfX
	 WAvAfrWtdKXy/iR+spV02DULsbIgUmQQsP4wB8NrQcvnbS5E5XLpWnHJlL25x5IEREeYy
	 0RtiplNnRLHAjbVjhHJPcPhhrIXR+fOkqLtkNhdIIaK+W3nCUS1BfLh4tOhAnLXVEKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gZadOtZj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E0C606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gZadOtZj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FF3E1F0089C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795798682;
	bh=dDRUfH0o20Iw7H1ahxTXrk/aD+0O0X9e+lhbcvj0Hyc=;
	h=From:Date:Subject:To:Cc;
	b=gZadOtZju3oA0OnCDHSKPuPrmZ7fNiKc+qHVH9FLh9Lp3to5jZRGeZ4MCQjwW+cVj
	 HRgB5jrlLlBwSW8LPfpKm0UAqPwQaDB91/uXA78xg8fRaXt4MkFI7oLDZs2IxLK2wa
	 sr+5oRzcZMIEjQy+Jdd6yyLwm9QbRb0KmzSsOLgIXU4gZ3TjNoVimdrJVDvqAKS2uA
	 0SvUxyWq+eul9PqsMtI7POu8HuqpHisSCrhEZZ0Eyipdalysxzt8t6nUDcyWubgVHT
	 lgeX5s+6ZUjGbhZRNVDzppnGzdv0soX0rhygCSb7pp6Q5P32o+B09XMYVW7n37mzen
	 LAAWh5Yt2FUAA==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5bcdae234ecso3429095e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:58:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFCU93wop4Q7kH8xxGiJniidnZAug6Mf53InJigu4yxoDRV+tHflEE7FCKYSMzaiYEeYrLOl10IPnvfFjk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YP9Ybmzy6aEaNyY/7B4O5fYUFKvpsWG47gUnYfRmvEoIL9m+0
	r9Io0JkVc5RjaOD9gkO4rJbUw6FRhjYxtp8L4pdnxGAW5mrAIOkIpduExIVZmtM4KbejV8UY6i9
	nbCyA3W7aluhPEC6laZmijiYQ2NoRAo4=
X-Received: by 2002:a05:6512:31c3:b0:5bf:dc95:3817 with SMTP id
 2adb3069b0e04-5c1bc7bcbe9mr7212492e87.15.1795798680797; Fri, 27 Nov 2026
 08:58:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 27 Nov 2026 17:57:48 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0goDeyB0c_g5YvKGGZZNKaSLqWKkei_9pb50BHseizSmw@mail.gmail.com>
X-Gm-Features: Aa3M54oQ7BNHJy2Wa8RGUivkc57ynpI4AcAhusGbno5lGHN1hzrmMCxfQDeAJaY
Message-ID: <CAJZ5v0goDeyB0c_g5YvKGGZZNKaSLqWKkei_9pb50BHseizSmw@mail.gmail.com>
Subject: [GIT PULL] Thermal control fix for 7.4-rc5
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux PM <linux-pm@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Lukasz Luba <lukasz.luba@arm.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

Please pull from the tag

 git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
 thermal-7.4-rc5

with top-most commit 52424a7805a05286743a5e9cb2dfe6548480b4af

 thermal: sysfs: take the zone lock in the tzp attribute handlers

on top of commit b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f

 Linux 7.4-rc4

to receive a thermal control fix for 7.4-rc5.

This addresses a possible NULL pointer dereference in the thermal
sysfs interface by adding thermal zone locking to some show/store
callbacks (Yu Zhang).

Thanks!


---------------

Yu Zhang (1):
      thermal: sysfs: take the zone lock in the tzp attribute handlers

---------------

 drivers/thermal/thermal_sysfs.c | 8 ++++++++
 1 file changed, 8 insertions(+)
