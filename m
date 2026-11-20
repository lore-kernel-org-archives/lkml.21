Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795208396;
	b=Tgdd4lFvSHqstajyt1s6RiIhnA5PpZvmgSiZhUjcezPpjjDD0+2I5mLWhte4Q7bK8EHt
	 ffItBVqKQaXzic33yfj7Y5rmW3fHWdDYMt9FSLDgV358wIhnU96Lge0glkS5iRf9M0UfD
	 htDAyKYqLrY2qYwN4X+USdjGiO2QkoliPx3AC2dU3oIlrwYYKC7iNPZ+e3lyJ9P8xyjZ7
	 vDrcuxJczPBrSaF8laHVYjObeEmjahyYA/ki9hiF9anqVZwD21WOlHm7BwOw8DhHFfhpg
	 6+oSvbNug8dxhc38HyC7TtxbINckY8dhJd1MEaXc9moZFiWAJYI3SFs1pH4WqPIfUMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795208396;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=Icyh0e2Mm8AUBYKEdhB5OYsUp0Bl5CdshODguFNod34=;
	b=TEJA0t9f8QOd/5NzVljcbQOH/zOU1y0XVkgEVKCQuRMUsGbvklrfs2HUn8TRi8/jVz1l
	 wywlbfQbAFzjdILsbq2zQHZ72fLe4l8tpg1LyKsvRv84uByksv1+sG5frqSJQwE/wEwj5
	 JoOHw1+W6aD274Svmi1cu/PPucbogL6yQIKZo2/dJT2w0V7wJip3jdPlKKtnTBachNKsM
	 pR7S4X/DgQoQsh5ggKq10kEO50BtVR9QiW3redECIj9r2hqmvbDOw+LrJFQvrCUiMO7Lx
	 Qe/pKDgyQGIaGa6TRMPVktjhra4bnrrhEPy5iaiQ6G0wioqkBXSnUKuB9Ga+OKHKSbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=yz0ceOad;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADDD606A6BD
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:59:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ADDD606A6BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=yz0ceOad
Received: from eig-obgw-5004b.ext.cloudfilter.net ([10.0.29.208])
	by cmsmtp with ESMTPS
	id UV3Bxkw5I4vCDUVhzxu6n9; Fri, 20 Nov 2026 20:59:47 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id UVhyxPEcnuJrPUVhzxlHlW; Fri, 20 Nov 2026 20:59:47 +0000
X-Authority-Analysis: v=2.4 cv=WLZ/XmsR c=1 sm=1 tr=0 ts=6b00b4c3
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8
 a=4uo6Mt23h18qz7fEtTcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Icyh0e2Mm8AUBYKEdhB5OYsUp0Bl5CdshODguFNod34=; b=yz0ceOadJNe2qvhf7oZDn5hdaw
	ovtl5CmEo/iREoSdIR9KYcYL+P8Jyw0h+x1VO4HHnth1YiuCB3Erb5dO5qy0JoCvgTtQukDzI143d
	awiGsrrPmwHrMXiQwC5bspwx5nunBUNl3BDvoazeijmEGyGO2mXtD5/medwSt0ZIO2Pb5I1rmNAp+
	GerbMy3f93E93B4964lLapduRl2ZPTixKggBXHVh91wqHIVgbHdhHHFEsvutlLRL3jtS9uN2eN7SS
	GRvUELIFcYjJ0Bvy0QzVsAjtPYz9MwBOB7SivS66V4bxC5nlDPDvZVYT9EKn9EvVKPYPo8j4vi+SX
	EX5YXLOw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:42518 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xUVhy-000000029Fq-2Xcz;
	Sat, 21 Nov 2026 02:29:46 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v7.4-rc4
Date: Fri, 20 Nov 2026 12:59:44 -0800
Message-ID: <20261120205946.799247-1-linux@roeck-us.net>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xUVhy-000000029Fq-2Xcz
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:42518
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 3
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfCpaLYqNRSBjE1Npw1iKXGT7FldozYMXJFr+uJhR9xd9QwhGJ8rKDoHnh79x+F1bvej7gjjmwTOPB0XAmIOqlhLf/qGsv3+cuHlSonbQvClUG/+7qXPY
 BvCzU6d+PBFt2JcAf8n61Nx9dnMiDu+H0f/lw8FReyAKQMzVA5RcbJFCobPDGCVAriXgXcd8udZuEPTz41/FErDBVG3gxD6E4p8SUvIDxp1gXpSuhIgzjylb

Hi Linus,

Please pull hwmon fixes for Linux v7.4-rc4 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v7.4-rc4

Thanks,
Guenter
------

The following changes since commit aebb7274476403040d582c61478df8f4a7bf9cd3:

  Linux 7.4-rc3 (2026-11-15 14:30:11 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-v7.4-rc4

for you to fetch changes up to 449cdc5e29c63aa66b41ce8c2783f6b0d84c62b0:

  hwmon: (ads7871) Add error handle from spi_setup() (2026-11-19 08:50:01 -0800)

----------------------------------------------------------------
hwmon fixes for v7.4-rc4

* Use per-device lockdep keys in the hwmon core to avoid false-positive
  recursive locking warnings when one hwmon device accesses another.

* Fix sysfs attribute struct downcast mismatches on big-endian systems
  that caused out-of-bounds temp1 array accesses in w83791d/w83792d and
  directed all beep writes to channel 0 in nct6775.

* Fix nct6775 fan control: initialize target temperature and tolerance
  masks/limits on NCT6106/6116/6126, fix swapped normal and critical
  temperature tolerance writes, and use tolerance_mask on REG_FAN_MODE.

* Reject dell-smm fan_max values above 255 to avoid allocation count
  wraparound and invalid SMM calls, and reject PWM writes outside 0..255
  to prevent integer overflow from turning fans off.

* Fix 32-bit overflow and bitfield wrap when encoding sht3x alert
  limits, and propagate spi_setup() errors in ads7871 probe before
  accessing registers.

----------------------------------------------------------------
Guenter Roeck (4):
      hwmon: Use per-device lockdep keys
      hwmon: (nct6775) Fix target temp and tolerance for NCT6106/6116/6126
      hwmon: (nct6775) Fix swapped temperature tolerance register writes
      hwmon: (nct6775) Fix tolerance bitmask when reading REG_FAN_MODE

Rosen Penev (2):
      hwmon: (dell-smm) Reject a fan_max that the BIOS cannot take
      hwmon: (dell-smm) Reject out-of-range pwm values

Vítor Hugo Silva (1):
      hwmon: (ads7871) Add error handle from spi_setup()

Wayne Ho (1):
      hwmon: (sht3x) Fix overflow when writing alert limits

Ziheng Wei (3):
      hwmon: (nct6775) Fix incorrect struct cast in beep callbacks
      hwmon: (w83791d) Fix incorrect struct cast in show_temp1() and store_temp1()
      hwmon: (w83792d) Fix incorrect struct cast in show_temp1() and store_temp1()

 drivers/hwmon/ads7871.c        |  4 +++-
 drivers/hwmon/dell-smm-hwmon.c |  9 +++++++++
 drivers/hwmon/hwmon.c          |  7 ++++++-
 drivers/hwmon/nct6775-core.c   | 19 ++++++++++++++-----
 drivers/hwmon/sht3x.c          |  4 ++--
 drivers/hwmon/w83791d.c        |  4 ++--
 drivers/hwmon/w83792d.c        |  4 ++--
 7 files changed, 38 insertions(+), 13 deletions(-)
