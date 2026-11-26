Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795693501;
	b=qRgZG40vVx3nS5hHfDpYADfctM3uLamrhiwmoOb0dEOLEq05Ndx2mrVIIwzk6hUsRhNh
	 SiksPmCm3vW+uhx/FDNderbmz654DCzqaMibtHYXZBRQ2sE6uM/1qfJbAz4K4HcFLH+BO
	 rGI16/ToB0Y2seUbZYT2hqg0c2jXmaZOf7sGSqKaBncFRYAd06sen2MioSLFSqrHjnVcV
	 NOGphwXLLcKBPTkfP7X5yXdolKhAaYn9Xn+JxsE3QXU1pbOL8DapkkAVegYbGWKSGFYbM
	 UfVriJ5mg4HkIR2Z/T+o8jzssiJIWfXXDwVLq567Mvf/EaSRnbWrJGO8IUcGAW3L4uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693501;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xYSc6o4UCMvbbTqkqVkaayI84J/EIX3dDWkV92RPVPU=;
	b=UvNGyE5MPX9f5O3cj2Nsek+bt9q+EjmZEoUhpCkKJp5+S4cZUP20gERtEbONYWqrsGgD
	 Y289+kqs6+FY4a1qQi0ubkRshjZMayUwoade+t0qAqCgCPqq2NqvqpF8EBjJ+qDp2FfoV
	 JnotOQ2z3GlFqnvdKNC8R0rrnVsW2TvKedfcwuZ0mvSCxKhVP0jrAvvXHgmFhC8LY4XXN
	 srYnUC1wckpMxM+YoRrww7msDL1ILzqhfSCNNrE5F1K5GsMiM4rAkjwdnk/rySNLJe9+E
	 hhWwK7FLpYoDX2kLl77I1dJCIhqKHzN4hFK5FD4HStn3drmbW6Oda7v13eoLyv9PviQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TT9nKMVn;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DC6606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:45:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27DC6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TT9nKMVn
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so3615415a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795693500; x=1796298300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xYSc6o4UCMvbbTqkqVkaayI84J/EIX3dDWkV92RPVPU=;
        b=TT9nKMVnjlGalKy60mqCX4AhaK2/uVGMNv2Q9+zuDWwWAA3ZallXeakZq60KA53PRk
         Eq1ZczfzGzWcE5/pGYHlnRb13FFhw/FBjCBY0u72R9fSR71GuGj9wB456Ua1pUCY9Vac
         GGSw3x3i/IchlVnCJjPdykA3wBro4TSSraLutbIql7I6a55TYcgbWCFmW6ehcAn4IUni
         jJV84wMHEgtNqUH77DM13rLPfZ01AwysgINjaSiKjn18kMw/gQfPV7buzEWBA2IlhEag
         THOEkGQNqUAhkUpNT8SwPbRDteF1qcDHEOfqIQm3Pb4AJI/d0dxQFAGJ42BbNNFV6cKQ
         u6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795693500; x=1796298300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xYSc6o4UCMvbbTqkqVkaayI84J/EIX3dDWkV92RPVPU=;
        b=Daudr3ZGhDT0oAiUdsMqQHbe/44DzIIdTvyuPVGQCu/J++f3vfge0DMgY3sU5OgjoU
         eFL+Or4rL2aL8TWvnCfkAszL4N8/DRbHwgGvO7iwjUpy8aN87XBL+V+GVTOA13Tjbxup
         wNIcXDQLVfDitefxX1kWU01Nq6wlAGlsOWczN8M2to49u0QECYTjoJGutI0fYUSM/JTN
         hCgN+yPi4MsJibKDWtWrYBuGq6t03oNiYpYQ1uap4bIlkTUHMkf7S4k9KVNLZbKRZZqI
         SjSJI5Y0pKEjelLAJv59mbprp1ylWZ+xJN/kYpcdtvLo2lyJU8d3idZgxqpMucRt+mwx
         iJFw==
X-Forwarded-Encrypted: i=1; AL+hErHpjH42LusglzZnlrR5AZTxljBNNn+c/OH151Ohyka3W+v/bCn8XN1px6Jl6c6wq8FwuSH/e8KNqbnIIV4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/G9OXVsMt34dHYiiyZlkJqI1PK38PVZ4WcrcT7fIZDrR5JY41b
	OCWkISglhdm+GV93GyAMkfTmeZosiFjCwMGte2nlJ2MPwOECmnzNREMk
X-Gm-Gg: AZFdTZc1R1o5EdHfahbxoDtIxBYDjodJjFe6m3phy6gKsOJq2mtXLvHIpka5bLXxBv+
	/9rHiCJGaIKGM/Z3U4eG2OIoxCPeb1k8EiTqU7GanQjTQbcmZKoRgEP63vXwmOEtvEGqGhHviDr
	8hSzrOc5cfPHE0ywabhHvgCg+uj42eNc87ay3yfJM5RePG1qfYsDk2mdHhpJrjzovSKoQX7baew
	5hXdrUHgCkhMimwiq25cL+7x0/ijSCh31Qlx8SsdxkXfQZKTnM/Ce5VrmhHN3ynQB9Vp8ar4Buc
	u/jnVn5P+ZJ8iAl4JG1YlqLYeI5lvFF0CcgNGLds1QosJrrXtwhMvF1Pr0rmaSyv0bocMFxXhk8
	qgznto9E7i4EeVp4D5PYQQzQ9fKw47omTE5OqkMd4B2w0RKf53uu93TvDV/7oCHag8nq0SmtVkG
	oqNCFUpW7FWXmcPD9LP+k2guYAvsqwf42wtcC+DXzOS5TAApGWwGTVliznoc8soyRIdFpj4TLOC
	H7Dh/+aDGIk3al085BG8BWB0rQMCWO5BevSUk72Kp389Izqp895taAC8JjniPBk3jYOO3m/kHzN
	hhsw5LU76EuwcMqXogNDLxYP0s76eL+n
X-Received: by 2002:a17:90b:1802:b0:3b4:1359:45e8 with SMTP id 98e67ed59e1d1-3b41c92c55emr19529457a91.44.1795693500463;
        Thu, 26 Nov 2026 03:45:00 -0800 (PST)
Received: from omarchy ([14.139.177.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm32962809a91.2.2026.11.26.03.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:45:00 -0800 (PST)
From: Vaibhav Chahar <vaibhav.chahar26@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Marius Cristea <marius.cristea@microchip.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Joshua Crofts <crofts@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vaibhav Chahar <vaibhav.chahar26@gmail.com>
Subject: [PATCH v4 0/2] iio: adc: Use guard(mutex) to manage locks
Date: Thu, 26 Nov 2026 17:14:31 +0530
Message-ID: <20261126114433.20674-1-vaibhav.chahar26@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Convert mcp3564 and palmas_gpadc to use guard(mutex) instead of manual
mutex_lock() and mutex_unlock() calls to simplify error handling paths.

Changes in v4:
- mcp3564: Drop blank lines before `if (ret)` checks and add blank lines
  after `guard(mutex)` in `mcp3564_read_raw()` to improve readibility.
- palmas_gpadc: Move `palmas_gpadc_read_done()` inside
  `palmas_gpadc_read_raw_locked()` and drop unused `ret` from
  `palmas_gpadc_read_raw()`, moved conditional check inside
  `case IIO_EV_INFO_VALUE:`.

Changes in v3:
- mcp3564: Use of guard(mutex) across all paths. (Dropping __func__
  from dev_dbg() calls will follow in a separate patch.)
- palmas_gpadc: Make helper function palmas_gpadc_read_raw_locked() so
  palmas_gpadc_read_done() always runs before unlocking safely.

Changes in v2:
- Patch 1 (mcp3564): Wrap switch cases containing guard() in braces,
  add blank lines around guard() calls, and clean up the commit message.
- Patch 2 (palmas_gpadc): New patch converting palmas_gpadc calls to
  guard(mutex).

Vaibhav Chahar (2):
  iio: adc: mcp3564: Use guard() to manage mutex
  iio: adc: palmas_gpadc: Use guard(mutex) to manage locks

 drivers/iio/adc/mcp3564.c      | 103 ++++++++++++++-------------
 drivers/iio/adc/palmas_gpadc.c | 126 ++++++++++++++-------------------
 2 files changed, 107 insertions(+), 122 deletions(-)

--
2.56.0

