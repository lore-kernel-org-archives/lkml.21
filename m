Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795140650;
	b=UBxU0Q0lba9t7xKvYoDNJR7cCnloIsdKtZ/HI3J11fHZ/f4ndnS+wD8ywSS0JnDnKVi5
	 p7AyaeyInyBG8RtWBK2RaChGtKXEQKish6HR4iLA0PJutPYx9EwmMLdJCGvGuDK719y7L
	 H0GaUwM+MvY/qsxANkOkYx7B2TuW8/NOlteiD6t324r978oPvgC+J9G4adeEHxnsHFKwd
	 LzWLz0jnyugs8t9kr3iVox2f5ZU+984ox0QcOJX5lyV/9zwCQ0vSmXcG5qrFriC3mWKaD
	 s9swkC/O/gDUDgOyz4y5IWeSL+WCKl0qYXuI2s+RjYgoJKzUCpf/serthYFnowFj18A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795140650;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qWTIQYd8LsBycV6tDNDo4yeWH8peAJc+BARwBoSeYIY=;
	b=ASbBg3gH6U8VQSPVhcxNadxA9VWaBsF5zM8uvTy8QBsRjSZQeiux23n+0hpIPgeyJBn/
	 olLy1htN1MYNGlPf0lMBKIYziLP+KR0D0iz9I8zLdSdO7jI4dAZpwOm1174bzoqN9qHhF
	 cjL2QWxRFkSTk8izxFjt8T9AlzNZakpstISP6yMv2zgq236hCTbJewQuIXC94M6uGqTy7
	 z7FtaSjkJuEVf0yvWNtvZveiHvjf0osg9gpJBuAuqaPIyc0WwMWsi7O60SrOe3glraBOR
	 NUWCtMgdrLm5ubNaYM+gBA2xlQVonFYUr2nuh7v49Gcq+TWsPYLKw4lcRomUvBcJiew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=reflexrobotics.com;
	spf=pass smtp.mailfrom=reflexrobotics.com;
	dkim=pass header.d=reflexrobotics-com.20260707.gappssmtp.com header.i=@reflexrobotics-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=tx1Pauet;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA220606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:10:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA220606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reflexrobotics.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=reflexrobotics.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=reflexrobotics-com.20260707.gappssmtp.com header.i=@reflexrobotics-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=tx1Pauet
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b3b4944abeso375293c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reflexrobotics-com.20260707.gappssmtp.com; s=20260707; t=1795140648; x=1795745448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qWTIQYd8LsBycV6tDNDo4yeWH8peAJc+BARwBoSeYIY=;
        b=tx1PauettnPxkIqAWaFtW1a/gBgrgqfvTRUMhZPLJj8uvVjvqyWKp+4uAdVPrXRNEI
         kdCaM6vqeVqsLeHdE367fxTzVWZi+ffIDc9P2ItC0geE4yXx3P7FcmPurwiwjrGwV+HK
         NmomjWTv6SSK7w/gHBlT8SEHBV2b+6AosuDpMucrHY3RAndIH70yCB51UjavH3Oe2CKb
         ELl72f8YjhBklY8Vl/TALiYdAV3Y9ix1Z7o4+JwCnC160vDvreGuWtRPiK+akXBJPTxl
         EPRsmT8iTIVJVEcDYnZXsYXloVe9zqoGOw6sj1cq26ExuxyFTazgDAqdqi4Da/diNvq5
         j1pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795140648; x=1795745448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qWTIQYd8LsBycV6tDNDo4yeWH8peAJc+BARwBoSeYIY=;
        b=shi0Dw72tS/KDagpPjlZ3mVUdF7VJASPcnoiJ+ZUhgfHX9iFf5jo089OCJpnThxfVI
         hdcajpebeLryCqhTiEd6p1JlmZM2hb6/0qdHdTPle8M5+U97qBkzxbh9qKZWSijkMDJl
         w/LpNCva4PjVxmUfViQw7e0F5LjBNGjdT5qb120Yc3VU36dn0t3TE0QhnMC6m21lJfLT
         W50WDSv1VBepID/RfpUD/cTd5B7qKzFx09vq74phiZdFUbn8mwbjcZi0JnbUFK+FsAx2
         +8qV0lrk72GyhKanGwY4yAfkhIi4SuxLwL9nYYwLvADMP2FQivc27/eKuGGLcgyAwLfY
         SveA==
X-Forwarded-Encrypted: i=1; AL+hErF/Q7IQPc47BPRLjQut1lO0FZTzyQqE5yRHUHx3oRaL1FODzwY3431ZXiaKIPChYEiYA4HKS3iJKLKfcB0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tMar7GDGP9mRgOnLa9h3coYXzDQZrPeWMKwTuKrxU1Y9mNjlA
	MbPxem+d3tiKBuKh5bjpcE4aFl2P3YmZjlgD+RbsU5cpNmR54/1P/DbI5omYMXiRsgY=
X-Gm-Gg: AYBFou2N0iHq7vnHGofo7Rs9YBX9HynncxCEX4gU4KmW+HvOLgEGHUn8PhVclmvYacN
	4fdvxUh0Sc+nrMo7PnDFNM1Xsmug3gtHCpRd9n+5jVr5SmdHkzV8r0ZfuKqcRsSjLbWgvgxH6Uj
	CXNLCTLpP/FovQdOOf3siEcWGYNve0ayQsCmRffIMxCkSysVzUMEWQzztfSM+XX39yzsOAiSVI1
	lFnr39fGbEQTvcWXZ3nXgHiAKy41B/NSd+jdM3WdgQ9urs8WoWFTcgQ++LITtBLrle0KyQZpATd
	B9TXZG880odZALdckVvokCy33UaqGKpkvMGp7HEpExiWc7RWW0JhgxPEH2rJlfAB50nmjdbxDtd
	/Ka2PTV+YIoTRg3ZlYzmZ6nZFE0AqDI/CnyqX3U12+eqKn8JIoK+cFkKyWlF8pqvq0s16cn2Te5
	AdctbazYxdqVYeUglI+H/HDW8xEoeQSPs4WrZiJ9tqQM02Iu8v5UvQBrNsuydgGPButjl8cjHTD
	+1Wq6eksS08xZ/S09dB6li6zor2aTfKDJaqBOj+1rOXQVVFXTVD5b6TlvupSXvZNsJUHdfNreA0
	JSmIEUkczhqNgNo0o8WbyXnvhN4ISg5axu2HxC9uXaPUmUJHC+tzwImueUzGnYDcCU5CjIM+jmh
	dGeq5aruAAahjQBK8/uLi1biN+/rtToUnHGwtoOf+S45E
X-Received: by 2002:a05:7022:f10f:b0:1b3:abd2:2eb2 with SMTP id a92af1059eb24-1b55689ed61mr1647264c88.10.1795140647739;
        Thu, 19 Nov 2026 18:10:47 -0800 (PST)
Received: from localhost ([76.51.7.19])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b556840494sm2727974c88.12.2026.11.19.18.10.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 18:10:47 -0800 (PST)
From: Joe LeVeque <joe.l@reflexrobotics.com>
To: jean-baptiste.maneyrol@tdk.com,
	jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joe LeVeque <joe.l@reflexrobotics.com>
Subject: [PATCH 0/2] iio: imu: inv_icm42600: keep the temperature sensor always on
Date: Thu, 19 Nov 2026 18:08:48 -0800
Message-Id: <20261120020850.24318-1-joe.l@reflexrobotics.com>
X-Mailer: git-send-email 2.34.1
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

On an ICM-42688-P, the gyro shows a large, stable offset at rest (about
8 to 23 dps) whenever the driver has the temperature sensor disabled
(PWR_MGMT0.TEMP_DIS): without it, gyro data is not temperature
compensated internally. As discussed with Jean-Baptiste and Jonathan,
this series keeps the temperature sensor always on and removes the
driver's temperature enable/disable handling; temperature reporting in
the FIFO stays switchable.

The chip only measures temperature while the accel or gyro is on; with
both off, its data register keeps the last measurement. Patch 1 makes a
temperature read return -EBUSY in that case instead of stale data, so
that patch 2 can remove the enable/disable handling without changing
what a direct temperature read reports.

Discussion:
https://lore.kernel.org/linux-iio/20261118232418.7fc702a8@jic23-hlaptop/T/#t

Tested on an ICM-42688-P (SPI) on an i.MX8M Plus board: on 6.18 with
these patches backported to the 6.18 driver (minor context adjustments,
built as an external module), and on 6.6 with the driver backported
from mainline:
- gyro correct from the first reads after boot and after runtime
  suspend; accel unchanged
- idle temperature read returns -EBUSY; current values whenever accel or
  gyro is on
- PWR_MGMT0.TEMP_DIS never set (regmap debugfs)
- buffered capture of gyro and accel, separately and concurrently
  (including stopping one while the other runs), with and without the
  temperature channel, and temperature-only: correct data at 50 Hz
- repeated buffer enable/disable; module reload
Build-tested on the IIO togreg branch.

I kept the INV_ICM42600_PWR_MGMT0_TEMP_DIS definition in inv_icm42600.h,
now unused, to document the register bit; happy to drop it if you
prefer.

Joe LeVeque (2):
  iio: imu: inv_icm42600: return -EBUSY for temperature reads when idle
  iio: imu: inv_icm42600: remove temperature sensor enable/disable

 drivers/iio/imu/inv_icm42600/inv_icm42600.h   |  6 ---
 .../iio/imu/inv_icm42600/inv_icm42600_accel.c | 16 ++------
 .../imu/inv_icm42600/inv_icm42600_buffer.c    | 14 ++-----
 .../iio/imu/inv_icm42600/inv_icm42600_core.c  | 37 ++++---------------
 .../iio/imu/inv_icm42600/inv_icm42600_gyro.c  | 16 ++------
 .../iio/imu/inv_icm42600/inv_icm42600_temp.c  | 10 ++++-
 6 files changed, 26 insertions(+), 73 deletions(-)

-- 
2.34.1

