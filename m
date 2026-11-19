Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795123340;
	b=I+OcA+RPAEffOytqTDPSC5+ag8sp+rm1FVkaLEp1bHvJtcBeRFptcyI31gv6kNKTydGK
	 6TOqE9Tgsy7cXHeu94X2ferUcWYc87I6MdNGXPJNbH4UA0k+0NoNDG02GVuRCU+dnuVXP
	 ipUO3DbqEYIsnoy8WUodp8jaNxc+tIGobvXMV9Iod4qC3HNNKxOL0J7jgjIJ/COIEQNtr
	 DT1p0xBY5cPH6sYypWmEq7wXMQDlZ2fh8OrpfxuTUMXKIqp43zws3ALpHKUyuJgoFHMXI
	 qWLIOxdSkWrWSTFoS50w6C9pDE/FSBNFfARG55IrQ4egWBW62Fuy5EHAxgF8dZcZBYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795123340;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject;
	bh=qcjEcSxMerUyIcJCb5LoXrpksSMmt9uIaMrH55NR/bc=;
	b=U6Cm9Esx2e5bXOvNQqtcDdaAiiVDowJgaa1o6tMdEW6/3GBzuI+JbA2XSTaRAzN1qTzN
	 a7i5lGxi0OSr1mfYf5IuIeMT9U2CXetjqtDN2f0+MNfc3R0RMUAM6Rhzo6uJicU34RN1y
	 7MLZ5zsc8tCcqBOyJdRaZqEI3CYwyQcLhF0Ian7peIET1mIOkCLsnPIJ2d4wF5i5SaeRJ
	 WpdbxbGjTiWVvzJ2J7k8X6nUJkO6N0d0d96BPkOxJ5U4VN6D7ylcYNY6y0kHHCOTFj9vE
	 +r90ZqNW4kAJQHXtAflC3SZVTieQmzzrKt3hkb8Axph8fkMHaswka5dqirn8awWJhBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=b4kyZD6Q;
	arc=none smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B1F606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:22:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82B1F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=b4kyZD6Q
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91f2dd5dddaso2446426d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1795123339; x=1795728139; darn=vger.kernel.org;
        h=subject:cc:to:from:message-id:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qcjEcSxMerUyIcJCb5LoXrpksSMmt9uIaMrH55NR/bc=;
        b=b4kyZD6QXm+GEEGwq7TKClxnDVyHew5vDgtJgHBG8EG2okFDdAH4+rLSZVU+CLaD27
         o41y0HI1+10Tu+/uX0munx6pDHmyNXMuU6pm9SGYPVGwUwx2fb4wXToFvXHOtZq0A8Fk
         SP1GtOx/ty2rXiaapHazDej2BF5Va1HQ5szRrQHS/IEB4oRVLnUKKNLbZEjHpj6NJ74D
         DxAcyJmGCCCbf1Zddy8R9pc0U/RH5x2Tcdyb/c0uyv/yLHAhHCGr3JmSM0snMIgsZjXv
         pPGZcRIGfXTTXb7GbMJgnft3SYyL7hVt6RS7H8CgK3fTS/WSANLNtm8c0B64tfnvIGS1
         cNmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795123339; x=1795728139;
        h=subject:cc:to:from:message-id:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qcjEcSxMerUyIcJCb5LoXrpksSMmt9uIaMrH55NR/bc=;
        b=id6Hvhj4ZRO2CcpOSDEC0zhvDBm0AgKgYCdGneLvzWGbZH0IYMhd6iBG82QfDytrhr
         jvHYc+ZQfL6aWBuGlNDBQ1f5A20XmjyBIwW7V5VbAxZmv6Nxawsl4qKJQiTtPztFayV5
         aYS3NIrXZlpfEZLJR9hOrFlKDo3pKFW24miuz2Te4kOuoDSgI/pyeUWIxPaPgChvteHD
         AfHLmYeHydLDd6pUaxOUa8Pv9hBb9DDI5A30M2mtGlibdWJRKc5muXTHeNsv1iBR5a8g
         Q3OcEmlt+b4gnBTwReBIotEyxcBaobzqX8RSyQRPL8d3qYFBaTQo2o2U31MgmJx8dZRo
         t0zA==
X-Forwarded-Encrypted: i=1; AL+hErHCJNU1bukPGgitqXh0UuYNRx3nv6s7+lR052r74nnlKvvSTyN6bs4bR8mIHWbpXNpPuB6ue+L6JB0Q3Gg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/kXFPFSBV+VUkDuc51OuyugbygmfBf6tuiJwgaeVCT8WFgtln
	SSivm5Q3SKdVOUe60G834Hr+PgY8LKK2qOt0lJPgE4FjU5V/k5dd7kOwdfcxEgaBaQ==
X-Gm-Gg: AYBFou2Fb4PjHtST1ZTerXf4bgJAUibPEln2jUiJ33VdIgiX+ZiOxTx1f4ZCMj1GGb6
	CfXhXVnefIoTtRaSB+IMszHNBKAYwfl1ZeA2WTIE2QDCtL7Dac71nvj9WFMNe+Baf/QJvIqH3Zg
	WR23KSzpahX+6HiRdVTsnxrHzVJ2VqBYVx9wfXmX6yj1rihQCdiedCGcM0sAT13KQliJjmgpM4k
	qrhrcnN/76qXSw+5NVqMRB91X8LjeS6zvpsPLLS/zDze7CduyGDKdsdzCU4uDyLs0yuv3WbXz/i
	MQs7Qt54SpZ4HznJyHRZn9BFZoMPJziTyMDcsLyFFUa02azrsCI27GHmSwPOqdggIMsr428/VZB
	htPaamKF7Wz7sf4NuKsQ6U6PZLMl/BGfL0O6jmU5RfDCy9XwwOJCSfbTU3AcdeJ5BAqKofdZG9k
	nm0cK6PCss8O/TFBy8eWJUxa+YUrc/IF+ETCGy0hfvJvnbHypXRqh8RT0LLmw57EZlEZIPyLxnV
	BUawyTc7EJKP96QNVAqXLXMvQqPve+EAQtiO3Cyhb0PP6lgakXLT1ka/CZtMgWajSx+S8PWwOu0
	W0I/WMsoGdPSS3LHSGKxZ6CKFeLv4GvdKmaso9mG6aWEUvyb2/xhUHzKNuHepgXCe6CBotEJ5gA
	mbbC0/EseyepBnwexe3ommG20M2jhXg==
X-Received: by 2002:a05:620a:6c18:b0:93a:11a4:223c with SMTP id af79cd13be357-949ba81a577mr150251485a.9.1795123339444;
        Thu, 19 Nov 2026 13:22:19 -0800 (PST)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb40ea12sm49176285a.35.2026.11.19.13.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 13:22:18 -0800 (PST)
Date: Thu, 19 Nov 2026 16:22:18 -0500
Message-ID: <d583b944b32f1a6f9bb27005d628ba9a@paul-moore.com>
From: Paul Moore <paul@paul-moore.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: selinux@vger.kernel.org, linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] selinux/selinux-pr-20261119
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Linus,

A single SELinux fix for Linux v7.4 to fix a problem where we were not
properly handling MAP_SHARED_VALIDATE.  Please merge for the next v7.4-rcX
release.

Paul

--
The following changes since commit 7475ea8b58616b33c04afb976cf0fbaad9dd63fb:

  Linux 7.4-rc2 (2026-11-08 16:22:20 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git
    tags/selinux-pr-20261119

for you to fetch changes up to beb0ae6bcd7505e2e61babe5d98a8dd3b3f03c7f:

  selinux: check MAP_SHARED_VALIDATE mappings as shared
    (2026-11-09 18:32:04 -0500)

----------------------------------------------------------------
selinux/stable-7.4 PR 20261119
----------------------------------------------------------------

Stephen Smalley (1):
      selinux: check MAP_SHARED_VALIDATE mappings as shared

 security/selinux/hooks.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

--
paul-moore.com
