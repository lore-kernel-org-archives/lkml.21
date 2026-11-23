Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467962;
	b=CMDpsNd+8pTDpifh2CQDEM352ScPkBEDeZzvKJ4RoHG/v4SvrPPQccO3E9pwqbEOb1vM
	 9LYYTL4tUylP7/qjEmAlXc3/Mw79FmvgjbIq80GxIbi93nfBNcQQ4JS6k81LhD7QVXHOu
	 ZbkiqChK+PLZemCSxV7Pr0wFdQjboMMBUJmP9MRypvbNBED79aToOqaJHaElDdx7Klwks
	 OpYvOfetU+1a+C6gLyOW3zbbzSAmvh7d07kNq1ofQa5eKE0LM2huifhjRmgniHekaRWZA
	 oDXqp8g5iEC/587Fz+rZtaKuIa7KJpCDM9qioOplLuRy1phx8myy4mz0HILzaNzWveg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=XMBLf+oFpGY8ZXLOORoqNUv/sgwI+cM0AGAeYIAJOjc=;
	b=YgCyGO479eVqah23FDwEeruy8bNVoxAu6GvV2Y+jd4iWt3UBQZJUzvIyU3TlzrZ3YR4J
	 MFrgXzh9t9YtVI5OiB+8BBbdlWTcYLz8AsRNzhSJzzNgvrgJ2GKQzNhwpbA3uanMl2fNq
	 BWLJiTs0HsfLJFbru1eOGTZCDgzcA/oCDEmyJAGJ3p4BD9SgcWIp0W+4J9MDJmviQw9Lc
	 Oq9UTSs4LAMcshis5vqSCcafaaa0GzC15XJpVVce22wBbQJUUhPziWYVUHtXgX/d2Prep
	 qbM7EaDhMsXzYk8z5BWEK2uZ2zk4iUdNshHfUpvUhArLty5VA7ifhnWCuwlKzpxHF9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hsfX6eHx;
	arc=none smtp.remote-ip=209.85.222.51
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17938606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 21:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17938606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hsfX6eHx
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-99e156fe905so3198561241.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795467961; x=1796072761; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XMBLf+oFpGY8ZXLOORoqNUv/sgwI+cM0AGAeYIAJOjc=;
        b=hsfX6eHxLkyGhzgsKpICfbUlsnibIJsum+dOlXFqR75aeGrldW8GcJu9Na4Jgh5P7Q
         pIOJHHcsOUQLl++F6NlxyD8UbBXuOgvaQA1y/+vpdgI4UfK33PHgusb8sxPaQPjxL+Xg
         kvLA5rIru92NfVYma+SI5rqAmqFCLfiddBQkR5euwO9ML0t5TUPSOlr520IaDDbwQ0Es
         ZjVC6X6NwsqkccF8Xpj4iIFlfFIHCfI5mINDY7PdZG+rSCU3QF2Cr9ZVak6hPACeWi2K
         8w22LpgurG8tu1Ie2v5OdWI1jwYx5iLY2YnlPIpditicXdq8Kqax2prXFVI3WWl1upJt
         L33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467961; x=1796072761;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XMBLf+oFpGY8ZXLOORoqNUv/sgwI+cM0AGAeYIAJOjc=;
        b=Flwz0aX+z7Ky0OiHNT6COiJMu1gfxL6uwgT9FpIap28sq+I8HSuJDJ8PR35+24FPXe
         w/3bDx1Ejx8vMQ8wFqaqBP220tkYBlRcbLX3FeRP4ThdWkdzxI6943xGmN6vV2hWcKWb
         xgKfvthaivm2q6LNqpepGai46lfLvGS+iq2xirsKqi2QiLbf8b/yW6g2caCf6assFo+H
         Er7HpN4sG1uyOvln54J7xQ/tVuePkzDa3xWEvKzouYvZANY8X1cLG9JcQt/7E8tyzRX3
         ZTM1ENP97iNC4YgNCZSFPeu+hqlHudNf0fm6rpBI232qdTiCUukPs2HjRcEdux/a/VGG
         p5yg==
X-Forwarded-Encrypted: i=1; AL+hErEAFFsRnx2T+bJdSitK7rmyqq5FCoPVjBRGuZXPiINh0Ek+b/DkZh8+3VR9tt9q5ushgL8zkiWLpS0vQnk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+J6YxIDKDVJIAZFg4d2F2ouHIY3D4sylLbhpE9xfrKdFuD6Zik
	CRukbDh6BS/QaIPZPXKKXEbFtJ398olnCQalP7oodK+PVYmHrEHqJYxC
X-Gm-Gg: AZFdTZeGRbzdZKTpU7EUjxBcZK8eiqhjF5y0jv+rAc7151qsuf5azmMrmEXrJ/uWb/0
	GylkEVhFFYx5wC1IwhQ5qDol/LdF1TzKb4JV7Jptsr8bXiD6xOTzSDjGxSdU6KfWeWmojp9r3KF
	dGRWLvXZVEj60S4Z3DCihKp2H/dpxHeOzFZDXc4on3LslWBPkp6a8CuV3i7ZghAKfZMN1W59zjs
	014O78ZgGpPIJwJ/Nf/qN6WDg0A2mnPNjhGi4kRUvgAVxWaMBVx1MCfxbHmdRwHgr9JINL+OREd
	WH1xckBueklOIyP+bUMYTKI2Y0+dW/0FunGn1ebZ4yVqQ+QAmWWjK12V656JkPoCuVo4SX0cjdI
	3cRKTv58aSWebm5ZqQstr2eEuwthjxAfKT+EaPtcVFh1mECyYwbkkTMhNB9Sxg52Judo9Zd4UgQ
	Gec5LH/8G1y+okDyc1JU730miaM1Q9IHU+cGd9nuotO3BRkdlE6P1DtONwHzwsYDgIBIJM1XGRv
	OKFK5dvOJsGgNgEeZv98jI8t7mjeyTekARGc2bq8RQTSNWmrw00R0mA47tKgKjbhtzlUbUPobn7
	yicpfGZb2YmPe6YX06TabaUN
X-Received: by 2002:a05:6102:f12:b0:7a5:673f:9a37 with SMTP id ada2fe7eead31-7d73967451cmr4349495137.15.1795467960926;
        Mon, 23 Nov 2026 13:06:00 -0800 (PST)
Received: from garuda ([187.114.10.31])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e8219b2esm13041769137.9.2026.11.23.13.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 13:06:00 -0800 (PST)
From: Renan Biegelmeyer <renan.biegel@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>,
	platform-driver-x86@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	Renan Biegelmeyer <renan.biegel@gmail.com>
Subject: [PATCH 0/2] platform/x86: uniwill: add read-only WMI EC backend
Date: Mon, 23 Nov 2026 18:05:52 -0300
Message-ID: <20261123210554.3357528-1-renan.biegel@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Some Uniwill-based devices do not expose the INOU0000 ACPI device, so the
in-tree driver cannot bind even though the EC is still reachable through the
AcpiTest_MULong WMI interface. This is the case on the Avell A62 LIV used for
testing.

Patch 1 adds a read-only regmap backend over that WMI interface, makes the WMI
driver instantiate the platform device when INOU0000 is absent and the EC
answers a test read, and restricts the WMI path to the hwmon sensors (CPU/GPU
temperature, fan speed and PWM). All write-oriented features are skipped; the
WMI backend intentionally has no write callback.

Patch 2 documents the fallback.

The series is based on platform-drivers-x86/for-next at 2268d837d and is
compile-tested with W=1 and checkpatch --strict. Runtime-tested on an Avell
A62 LIV (i7-10750H, BIOS N.1.02) with the same change backported to 7.3.5:
the driver exposes fan1/fan2, temp1/temp2 and pwm1/pwm2, with values matching
coretemp/nvidia-smi (3157/3084 RPM, 60/56 °C, PWM 102).

Tested-by: Renan Biegelmeyer <renan.biegel@gmail.com>


Renan Biegelmeyer (2):
  platform/x86: uniwill: add read-only WMI EC backend
  platform/x86: uniwill: document the WMI EC fallback

 Documentation/wmi/devices/uniwill-laptop.rst |   8 ++
 drivers/platform/x86/uniwill/uniwill-acpi.c  | 138 +++++++++++++++++--
 drivers/platform/x86/uniwill/uniwill-wmi.c   |  76 ++++++++++
 drivers/platform/x86/uniwill/uniwill-wmi.h   |  12 ++
 4 files changed, 225 insertions(+), 9 deletions(-)


base-commit: 2268d837dea13a78639fa3dad60472bb67478709
-- 
2.56.1

