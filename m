Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795581229;
	b=sW/Q8NImrZjc0Oco0TNgsOGR/p+9AN+fQrsqpXjBjrtdSKdJEpPVtk5QLatH4WOAiYlK
	 zJeuyRzQ+TCLJbQ0Pa3v6uztlRW5zwbNxVHREgj4gtDMvYD1UIhXEuvoHf509r7LszkZh
	 fm6Yp62m0bj88nkyVj5Wy486QnaH02vxfEp7Bu7zPSDUFDmWSZD3QYi/9om32j64Q0BR5
	 2JW25l+eT3tkhKvtEAV7wnJMusF/PO0inidKWlenfxWKPNL69E/QU/fBJWz6zBpYca47M
	 xJBc1CsF2FW7arRYLTsusOJ+4ZkbdNJ6QU7WihPAH1H5T2XnB7Z9BqGpE6jUmzsj3SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795581229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZT+4sCsr3xr8FnfN5LLRrbbwBT9PMqCRbtWGTXSuCNQ=;
	b=oIQL7M14sh0Xy++6p4wESUFP8XFzZBYcmaDlJZaqO4Gbef7FyRP5aNRGuajM61LrTdyn
	 DWALuAgt2hwHu3PDpn/n4tjHgdfAQG3R/jDDBQqQ1SAQwiAN9Y8kIWejp/9GeCKwQ6D6W
	 kWIxIAY311UpOxwkyH2ZS9iLVyHb+sPG4SBMc+DJ5+6RzJNeSIncdx9M5KcJLJK2RkPec
	 Pczhr3m9naDa0PGnZMkT8xanOY5v/6tsaVWvPzVXvzTDBioaF0HcfsmHh26hc3Hc43naF
	 Zjb3D7xkA385C+CarUOIuceaKGo3UhcIkej3RPLFAv+6NKCR5b95xxpsNh7X8nGzo0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZLDbJMcu;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2133C606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2133C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZLDbJMcu
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b6b22be970so2052808b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795581227; x=1796186027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZT+4sCsr3xr8FnfN5LLRrbbwBT9PMqCRbtWGTXSuCNQ=;
        b=ZLDbJMcuI51Esp+mXXWYMFQZlBQf5eXAll80XiSCwhk0AJZ2pseBEODIYWeAcik3fI
         /XxLGyOZ5+L7kqzAd48qaI8Dh4RIgaF+KzBWm9tci9HYoQm4X6UhdGl/OkvqzcXS2Fhc
         ZAcL5q7cHT1YrhDJ2RJ8UveerGZVhopBbwwsyOqRhUXnKmJv4D17nE+nU3akL0/Ds1ti
         hgwTyUnw4puxMLn7uIdbOpJd9Wijn2Fc0L43+Ta39V4VF1BYNcIK3xkvD2a+jkAImZwy
         4USb4HC1fki5BmalkXBgn2nqd8/CHoaUdXBNa34+QesJ2DmdGVfw5zaqT+qBqKrJTCk5
         jnVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795581227; x=1796186027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZT+4sCsr3xr8FnfN5LLRrbbwBT9PMqCRbtWGTXSuCNQ=;
        b=APQSELXv/XJ+e7p/bThCB0ywedartBLafDijGaNizDGohWAZBrKvcrd662DI6hNt7W
         s0PeFylyJb0Jot5VabjuIOORDXmx6p0hiNPKWskK2r+VJ3GHh/V+z3vkx8UQ0469kx6b
         u/jNN1oeJCEtpeTlbUC2WBOJqSC/o4uL8aXzXwBncoU+kYRR3U2lh1Ixx6a10c/cI0wd
         tVkmDkQDF3s2EBX6VuqllTRzwho/8nA+rPHc0h3BZY+7r2YQzMkR18UCILR/Bc0nBt47
         ddUppdO0L+PfNmygdd2TpqddALQy4uQZiNr7cnxrLYIgiclBtORfArmI7vma4yDzdFRf
         Xqug==
X-Forwarded-Encrypted: i=1; AL+hErGkkpg5GCVsy2Ubwu3zzqnrvwczqGxXLo2ciXkNNFreIJi/+ksiIUaPVI/imuX5Gq9HPFn/cXpPfVTAKc8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SyEEUZAtrv06/Lty4H+W9RIjYuNHxUroGuibgbxsRfTeNledF
	qk9zwTkP12ejPzEepuaUGcmaCgSr6HHLPitMazWs4VKl3/0TjddwlXQp
X-Gm-Gg: AZFdTZfFZeMerP0Ae7HEqPTJLsXXqwVD2XC0AdvjSeKL4iRt/5Jhn58CRaUgWGlcmHA
	dm5WUt2eTD+ACWoymahILrX6xCWyd6LQB81WgQghTGdIyxu28I7gzlIJYFSS4PwoDFzN4KRXGVM
	QZUonQ+azWA7XqGA2GQhePFptV04Ir9ZYv+JWKaD/HPv/2w6+2ghY0D7PYo7p1y2T/ByKOv9KB4
	de9cmVeVfonfDlrHjc3zzm5J+iULBV1HOH+ccupysqf/s31F4jLdHhL3AAotemDQTE3CwghLl1a
	KSdhoLQmNUB0dlQhSCC08SoJaS9c2yQCGSiAjOsMZk6nl/ezzzP7ZCcYhSFSfj0ByT2WXZVPQ4/
	KW8YMDuE9cDAPAXXRzpcdYDdLG2rGsueS6u6hHrjm3qhoB231s8dJ5/IxcsLZGtp1YQ8s2kA4Cj
	OAw9szcAxiQp1UjReifmcSY8uH90aTj4/nDh6VuEqSbIgnl+7oXh/TwcXDk69bvKsNVWcM9EFVj
	xtsOqWzdrxpaz1Zp2ZmZNcPQKFeLQ4+I/XD9f0rFXzYAo0aeIfsL97fSPaCOgjbaJ1GR1qsbopp
	/ck5kIxHWgiDzZ9XoZCuptFv7CMZBccsqdUvLIuIOkhpSaHN2FTBRlqsxa1wL6t6pAFtUh777Q0
	O3AoTDVmdR7J416a6C8AoC6FdKGEERD0idNmiyOcLCll4tVlDttlX7Doam749Gn3uxosDDg==
X-Received: by 2002:a05:6a00:b80c:b0:899:74d0:8a72 with SMTP id d2e1a72fcca58-8c87d90393dmr15459092b3a.59.1795581227294;
        Tue, 24 Nov 2026 20:33:47 -0800 (PST)
Received: from yupeng-XPS-15-9520.. (c-73-169-192-12.hsd1.wa.comcast.net. [73.169.192.12])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343f726sm8528812b3a.36.2026.11.24.20.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:33:46 -0800 (PST)
From: Peng Yu <yupeng0921@gmail.com>
To: Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Cc: Joe Thornber <ejt@redhat.com>,
	dm-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peng Yu <yupeng0921@gmail.com>
Subject: [PATCH 0/2] dm thin: complete writes only after the metadata commit
Date: Tue, 24 Nov 2026 20:33:23 -0800
Message-ID: <20261125043325.138351-1-yupeng0921@gmail.com>
X-Mailer: git-send-email 2.43.0
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

This series adds a new option to the dm thin pool: wait_for_commit. When
wait_for_commit is enabled, a write or a discard will return after the
metadata is committed. By default, wait_for_commit is disabled, and the
thin pool behaves exactly as before.

Why we need wait_for_commit:

Assume there is a server A, and the underlying device of its thin pool
is an NVMe-oF device. Server A creates a thin device and exports the
thin device to a remote host via NVMe-oF too. When server A fails, a
control plane will rebuild the pool and thin device on a standby
server B, and server B will export the thin device to the same remote
host. When the remote host issues a FLUSH, server A fails, so the
metadata are not committed to the pool. The thin pool fails over to
server B, and then the NVMe-oF multipath resends the FLUSH to B.
B receives the command and finds nothing to flush. In this case, some
uncommitted data are lost, but the remote host can't get any error.

As the dm thin pool doc says: "the thin-provisioning target behaves like
a physical disk that has a volatile write cache". If the underlying disk
of a thin pool is a remote disk and we want to fail over the thin pool
from server A to server B, the "volatile write cache" is only on
server A, and server B doesn't know about it, so we will get a
consistency issue. The wait_for_commit option could fix this issue with
a performance penalty.

Below is a performance test on my laptop. We got the results in a VM on
loop devices.

1 MiB sequential first writes (no zero fill)
|                      | 1 job, depth 1           | 8 jobs, depth 8          |
|                      | MiB/s | mean ms | p99 ms | MiB/s | mean ms | p99 ms |
| no wait_for_commit   | 1307  | 0.65    | 1.59   | 1596  | 39.7    | 276    |
| with wait_for_commit | 131   | 7.57    | 17.7   | 776   | 78.2    | 148    |

4 KiB random writes, mostly to new blocks (allocation and zero fill)
|                      | 1 job, depth 1, 2000 writes | 8 jobs, depth 2, 10000 writes |
|                      | s       | IOPS   | p99 ms   | s       | IOPS    | p99 ms    |
| no wait_for_commit   | 1.16    | 1723   | 0.97     | 4.96    | 2066    | 15.3      |
| with wait_for_commit | 10.5    | 195    | 11.6     | 15.1    | 673     | 49.5      |

4 KiB random overwrites of mapped blocks, 4 jobs, depth 16
|                      | IOPS   | mean ms | p99 ms |
| no wait_for_commit   | 202095 | 0.31    | 1.12   |
| with wait_for_commit | 203293 | 0.31    | 1.13   |

Peng Yu (2):
  dm thin metadata: report uncommitted state and refuse commits after a
    failure
  dm thin: add wait_for_commit pool feature

 .../device-mapper/thin-provisioning.rst       |  25 +++-
 drivers/md/dm-thin-metadata.c                 |  61 +++++++--
 drivers/md/dm-thin-metadata.h                 |  14 +++
 drivers/md/dm-thin.c                          | 116 +++++++++++++++---
 4 files changed, 190 insertions(+), 26 deletions(-)


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.43.0

