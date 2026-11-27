Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795798587;
	b=CFZ1tcUaI5A7GvHUqFYSTxAbe0SVGrlaD0ovh1aOOXv1Nkj470W0rB3WoJA2+arnUT6K
	 WJQUHGUbuERajE4+hJkGkSA6iKdA2NFtMiz5k4RMEg3iveX/iMi0LwS8I7vve/hdi8JMm
	 pnpCrqbmUseNLjRSdPbP1FyKZdB6MzaeRs2NVPe2UBhDTZEFmL+t/p4LgmfL+qtzSX9eK
	 GVhsBheoXqSnbjLYUZHCWXALTgLOv8LiVVDojDCdPEDhNX0mAgW/T76hzQNFRwroakA0l
	 2xuVt/UI8q9CUmvS1/XeTwgmqulOmGHNFnLKC1UJ5Ac2z4VGHqHdU8BHpBarFEz8ISA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798587;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=Nm5GsoRVqPZjF7NiFim3iyXJW+IHzow3RlWZbSCsnE0=;
	b=gDGhU54fR+CWC/KOITbYAwqlMGr/MbYpvTZL4PTdz9CvBM2Y5F/EAutTyWR7ZV3BwC7s
	 ATK9ZgqHNqqcy0FA876lThT/JBtHbvaNzcIj69dC7k+g2rtOqBaXq2omw0KA4ANqY5c0C
	 4WJSpOmQAf5X9LCYOatjNDrmfuOeevRDNG7MsEFJ3or15GtoocXEzGjqsEl/3R+5d2Gu6
	 Bu82zE7+vlb1mAOzOiLo2cwlr9z4NXZ7YO0Aik0aAwybKlgz/7WdzRcTENZZysiJrTXtu
	 stcqlGChhQoXR7x5g5KcoOgu8qvqqFwQLyQ3ryGu82MORYYjSKw+f6mHjmzvqCYA2iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mjskCGsz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C3F606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mjskCGsz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A00D1F000C1
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795798587;
	bh=Nm5GsoRVqPZjF7NiFim3iyXJW+IHzow3RlWZbSCsnE0=;
	h=From:Date:Subject:To:Cc;
	b=mjskCGsz2pDTrTgeONRGn+PMQABd/uH6PeN26AYNzWZhyYa64nEaGLZzdHprB93bG
	 NnJoYAKbEpMpV8rVn5tOtyhrpqQ8yl3LKf1UVC26d1ZyOzlL1xkNw/4WA5fL4CIazj
	 V2rerAfFPSROYqP7t1y2wEnbMCBh9w9qJIFfbh156bu82NADA7VOSwrBfIbXbzoBWo
	 WP2QxC2phptBQxl80m+85MZ8tfAcbvO1MQA8ev9tqjtithDksiJLsxxYGtiB/LZchR
	 XvTsP+2k3fWZdcrJlAb8q2J6jpnqZnmP/ZWO7esQewRUInDG7nHDKq7zoVtWVbhJrD
	 1XFlgCaPTKpoQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so2196582e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:56:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGlur32BZ7OOczPs1x0BUDsD7w1kJAXhqEiuBhTeko2qizMKpF6rmphpTpqFJXuYo0QEQc6xjgzraXTBq4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dIHRRGtLHYCpAUHsTaXBB9TzUXPOxdAbJdQw8KgU5wCe5pdB5
	ggMexe0FUQVhrC5avofp+9RmILKjjhsw61emQFmFFkmfjav7YQjN3j2PjbPwNtoE+RRE5t1E9m5
	RJS1lC9kJ95ylrP1+m4HgKZcGHt5fhN4=
X-Received: by 2002:a05:6512:6695:10b0:5c0:bca:77cd with SMTP id
 2adb3069b0e04-5c1bc803ecamr5353701e87.42.1795798585547; Fri, 27 Nov 2026
 08:56:25 -0800 (PST)
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
Date: Fri, 27 Nov 2026 17:56:12 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jwg0cGJgPnP2SaXdcHWpW_5FPq25McuQmh9794L5QWpQ@mail.gmail.com>
X-Gm-Features: Aa3M54qnjPoJ8mF5BIzTgERRjtaFuU95ItH4SUcHBADTGze3jzpDHyS5YxxH9To
Message-ID: <CAJZ5v0jwg0cGJgPnP2SaXdcHWpW_5FPq25McuQmh9794L5QWpQ@mail.gmail.com>
Subject: [GIT PULL] Power management fixes for 7.4-rc5
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux PM <linux-pm@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

Please pull from the tag

 git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
 pm-7.4-rc5

with top-most commit 569e1eb36b033f42a9c363ffe4bfbf50bdadae51

 cpufreq: intel_pstate: Use dedicated lock in set_power_ctl_ee_state()

on top of commit b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f

 Linux 7.4-rc4

to receive power management fixes for 7.4-rc5.

These fix two issues in the intel_pstate driver including one recent
regression:

 - Prevent intel_pstate from triggering lockdep splats during system
   resume due to suspicious ordering of locks that is a consequence
   of a recent cpufreq core update (Rafael Wysocki)

 - Make intel_pstate refresh cpuinfo.max_freq when a CPU goes online
   to avoid using a stale value of it (Hugo Sales)

Thanks!


---------------

Hugo Sales (1):
      cpufreq: intel_pstate: Refresh cpuinfo.max_freq when a CPU goes online

Rafael J. Wysocki (1):
      cpufreq: intel_pstate: Use dedicated lock in set_power_ctl_ee_state()

---------------

 drivers/cpufreq/intel_pstate.c | 52 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 42 insertions(+), 10 deletions(-)
