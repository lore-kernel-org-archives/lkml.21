Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795830640;
	b=BPOXLiaBClZK/zH72wY4WcHHefq3M3g1sLDEXxFyYAP7VzO8dzZnSoo9SzrDmRZ6EBKl
	 pY6wi36g+PXR1UPGmEon8a1BDWVWTqmgEsRv+qiGVUnSwoWgVkWy0jSt0QRG8rUg1iWsF
	 b5wS6tLM7yHb1POH2QwDXxU9qO4sAV0tHu7+73DqT7TliQUyfo5XK44aAyZEQYI4F/T8z
	 iuRdQZErH+SAjQfus9hLjBAMtuJJROGBOCm34BNVlBXoSl1gRWeIIErqEOHzvwlQaaf9C
	 0Mz2E0Ia1+cKuQRopJsCdwyJ7OwwUmYm7rh2qRTnaUv17tf+0Yo7g7PVt3xe7IGNdSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795830640;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=jTkWjHu4Sgk8WdZ81Zw8P7Rf3jH+36wh03WSsnJk744=;
	b=V5aBCOh/lfx9wbfSk8wRHHJTdLWd0GTASXtLixXePq3g/Mn7alpcjVRWwFH5f8uizVyo
	 O3pBmPXe4bXZx34h6J4m2l6CP/ZWgqBRwI4a45ntJ3+BJupewn5MdTa+vuVCyApz0GCQ2
	 KVQmZWS8PPymBmJ5KB+MUYoRcODTWkAm4cS8xjPTabRH+SdOpUK9PpY9IhlRHrQNauJ+L
	 dhyhaIxhJwXF7XT8th0ibMxs36BjUIKSq3KKJfMmlFWu+ZJeWEBoX67o5CCrQBah6d7mm
	 8w/a+8YzUlxRRP4k5W3xKEW5q0TubavvISa5sxEKfBzZC3tCDkNtA90NYlZ1zic+a4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=0MQpzQL1;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62009606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 01:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62009606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=0MQpzQL1
Received: from eig-obgw-5007b.ext.cloudfilter.net ([10.0.29.167])
	by cmsmtp with ESMTPS
	id X0EuxJ3PjVK9UX7aJxdN1Y; Sat, 28 Nov 2026 01:50:40 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id X7aJxN6QDxqjjX7aJxQYn8; Sat, 28 Nov 2026 01:50:39 +0000
X-Authority-Analysis: v=2.4 cv=bZxrUPPB c=1 sm=1 tr=0 ts=6b0a336f
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8 a=zjfLJ7VQdEjd3HVhXVoA:9
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jTkWjHu4Sgk8WdZ81Zw8P7Rf3jH+36wh03WSsnJk744=; b=0MQpzQL17bDhNUHs+UIhngDZvP
	Or4VNy3L03Yr81BfOR2vk0If+dlax2JSjZdT9s2kaDQ3v+Xs3PaBEWUO6Ob5LbCWXED9zn1Nyo46H
	oVVliMV3xNqIo/LM7ndp8ubNFyF74vAhhls8XnKi7LP07a7Y2CzAhu7LHdfHM9Ic5B+1bPRm7T12M
	unvolxyUzyx6YZFEOqTsr2iMXvcAo/PdRk5FDs0x/QFa5oqIrgxoUKNtgDR18gPvn2Gu8qTgpmjHg
	eupJtLkldZ3cruO9WA7MNpPdzfQGLHBcgGq9Xthoh2mU6xBxAJV+wJLiUQ3k31rMcBTW7Y7GsKoJX
	qfc/n4nA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:55232 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.2)
	(envelope-from <linux@roeck-us.net>)
	id 1xX7aI-00000002CGM-3hky;
	Sat, 28 Nov 2026 07:20:38 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v7.4-rc5
Date: Fri, 27 Nov 2026 17:50:38 -0800
Message-ID: <20261128015038.3132946-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
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
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xX7aI-00000002CGM-3hky
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:55232
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 1
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLouI0kqXNNYBxcsPmCUxH/uI7Sl9xdTmc0ymFCh1uT5eb9TiX0hzzL2aSBdvavSVFIy+aWlHH52rpo26tFi7hfQ8lJBGGZJGj+ZmHBH0EqQqQAX74Ix
 D+kyW1wSVs5dudu8QkNrc98hTPea7nqhnP28TACkS4WDXyvv5gT3nRoHm7Y2KMRZrFtTEZwmj5Ik2i5hwypYhcR1XQix0XrRacefWQFLlPGK3ciHR+86TQSL

Hi Linus,

Please pull hwmon fixes for Linux v7.4-rc5 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.4-rc5

Thanks,
Guenter
------

The following changes since commit b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f:

  Linux 7.4-rc4 (2026-11-22 14:57:40 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-v7.4-rc5

for you to fetch changes up to ab8ea038584868fbcc91878a6caccf6404582fce:

  hwmon: (pmbus/ltc2978) Fix peak comparison for IEEE-754 chips (2026-11-27 11:27:21 -0800)

----------------------------------------------------------------
hwmon fixes for v7.4-rc5

* Fix a v7.4-rc2 regression in aquacomputer_d5next that rejected
  single-collection Aquaero sensor interfaces during probe by only
  checking collection[1].type when maxcollection > 1.

* Fix peak value tracking for IEEE-754 half-precision chips
  (LT7170/LT7171) in pmbus/ltc2978: compare binary16 values as
  sign-magnitude integers instead of decoding them as LINEAR11, and
  use -infinity/+infinity for peak initialization and reset values.

* Fix ACPI fan paths for the Lenovo Yoga Pro 7 14IAH10 in yogafan by
  using the dual-fan FA1S/FA2S configuration instead of the nonexistent
  FANS path, and update the driver documentation table to match.

* Add the missing platform:cgbc-hwmon module alias to cgbc-hwmon so the
  driver autoloads when built as a module.

----------------------------------------------------------------
Christopher de Guzman (1):
      hwmon: (pmbus/ltc2978) Fix peak comparison for IEEE-754 chips

Guenter Roeck (1):
      hwmon: (aquacomputer_d5next) Fix collection check for Aquaero devices

Markus Haberlander (1):
      hwmon: (cgbc-hwmon) Add module alias

Navon John Lukose (1):
      hwmon: (yogafan) Fix fan paths for Yoga Pro 7 14IAH10

 Documentation/hwmon/yogafan.rst     |  3 +-
 drivers/hwmon/aquacomputer_d5next.c |  5 +--
 drivers/hwmon/cgbc-hwmon.c          |  1 +
 drivers/hwmon/pmbus/ltc2978.c       | 66 +++++++++++++++++++++++++++++--------
 drivers/hwmon/yogafan.c             |  8 +----
 5 files changed, 59 insertions(+), 24 deletions(-)
