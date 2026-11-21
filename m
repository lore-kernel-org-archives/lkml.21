Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795219781;
	b=Ig9lcHFh9BmQxJZL4sB8IuajNV3abefIcd0qoZB+jVaSQ5BEvXdK0Bx9xhdZZxM/6pPl
	 StpbFqFF/d/qKKZN+65GeLK25Z3xA9TVA1rMg9esb/HdzW/iV7JVtKD7cu3NqqexLWPG+
	 LIj0KYGp+hI1j6ddiFokzRJbK42Zu33QzYSXNfho3dg/y/7kUhyY2BzlZ5sU+bFoiTBa2
	 Y42QhDjLtQXyWb6czfpfcVYN1g2QZxUL4jEjtSyXBpsAHNIs2ediPWnnCE29eFVM14k5c
	 mPzh4wvLep2JiUj3GFuu8w+VcDXx6zUs+CG7bvXxIRxa5basRPFdpHh5Rh/sRsshtdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795219781;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iEQX1pAJ7wtjY2/7daAaqxt4QQCiCe/GT1MXA+6yeBA=;
	b=oxlJOZtccKhx6zjpWUVB1RbKLMIYXCOgKIacJl/BdxwPWM/puRzVte+GAodOT5TGrmFU
	 rw8/Q/I5tPYPUyJS7HUAiAWequ0f+VTwvb008kpe99ttAjby99c7apv4orv2iyBJ9ySqU
	 7NHRdeJOrdmsTzgZ/LKksHY83/vKGwuegs3zSWtNMQWLYJyl500T45ZmsikqZMu2aI4T4
	 4cAlm0sPv5UuaFknvoyR0NtrP1wNhIjqeZIdCmFamhAjrWxHHnlnSrq6Nr7V9FXiehzh3
	 uvBPVQpLHZxbbp8W4y8N2rLsDS/GKtBvDxp2FH4PqJM9ja4ktOq3HoGfpwf2tmUeKsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MRPohT2H;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623F8606A33D
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 00:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 623F8606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MRPohT2H
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b41188c8b9so1109843a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795219780; x=1795824580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iEQX1pAJ7wtjY2/7daAaqxt4QQCiCe/GT1MXA+6yeBA=;
        b=MRPohT2Hi7L9tT3edEUMdEHRH8uVyTlfpl1y8J1khVVswjkzvdcBSDNWQCF4sD3JHO
         rATq1hmaMEoyMQj91ulv17dbBhnzMldAstC/89kbCIiVjbCIlhiEDxghw/G8DwhwThVf
         erGDiNUKxs5bUvX2YW+Umo5wPHPJIRsu4Dd6Gzy1rRbd/nLZrMG2c1wY4SrpBn9hegix
         71JFn7i8WkKEF6X+m/CzmZggZPmVW3eAmAPIab7MxSu/Ulag+n7g+FFf/hFhvipgLeON
         Rqqdm0ACyOfGxjUJzE6jYGhkeODWbM62m+nm11h3gRzHfhFK1NWYGf3k53ZBskplDj2y
         5a3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795219780; x=1795824580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iEQX1pAJ7wtjY2/7daAaqxt4QQCiCe/GT1MXA+6yeBA=;
        b=am/ab+U/6JDMlbR/qpJtAUA7LRPLQ9dJOfUWrqKxEiwmtdKIiL1HQbS+yn70cIBGqe
         vxGTMBdSOisSwi/kYLwLsBWglxj/UU1+TxWHg+p5Fxtmik2IPXwwnTkqiK+AGvJxpz0b
         hH3CM/N4Ta1V0vxoBkMgKVUYzK2EdRm4+sw4DZxzPCt1QKmgQB6u5b0pSzqbFIx7vGEh
         qFEuvWkguiZE8UCXAiVUxynBnqKNm/bd/2Z5CqSI3IGCNNP7MpCWNHkFA76Z0mDsOTgf
         AItK3o+s9jSIcyPPzjuo1VSMlx+H8ct1CaZoTFZ+k3XyxHhc9po16IigrPs+T/zjGWGe
         NvEA==
X-Forwarded-Encrypted: i=1; AL+hErGkQDK5OOP2W03Yvk8G7uXCVp5gsK1n/rWAr1MIVish2RIdJBxy1NzD9EofAS4eKrDao6rL3IdNzGzZY/s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BiyTYZpb4oSt19aTfTdDEFBXjrm03cMQm1bHlzh/jyIOQVLVZ
	mjnxp24M4oPCc7WfaBS99KQ6uXL7/SYGHGP8ealXzJ8ZjBGTdcUbylKN
X-Gm-Gg: AZFdTZe3NpuEsMgAmgp3yrqx2aUDeXXVAuwfJVqwvTssRoH2wIlQ00QJXlAnWyej6nT
	2V/ANo1QkcGKFBlI6TDlLyqv6v2FrldMeMjQru1COpDWNkix9tU0LGDAbJ/qk/nFamVBfbHlmhX
	kxKtwBfZI22l244mRve0vzgvVBo06KUjk5L7ezw9QDevBESa1l0uSAO7PHjpehZjSg7h31EfQJS
	Xn2u10hnOXVa7P5f3C3iyR6yo0l0JV+LLkuNx8oeeZLhzrsC/3uzn/ixJaD19R5ylWLZfl94aKP
	CkDKLNck2A0qN+H9DfdVInhiZejJHKOO9oLlqBTc0YEwPev5udS0+WuIeAp95AG08KeNPpa36QI
	+sRLxXs8HhaDJLv/YHSLcBstV7F0rAXVEO2ny0N22sxHsMSSauYMwVdGTyN0DFtGMnX/942LjNq
	gjVBhWL+ZJdOfqEeHZqms8eoADLZe7sLLCEIgKF/4E6jPzBcSi6hbbYiGgTZkCRIwW9xF6c4Uyw
	immIXcDO2C/atzrVJCvFbNOhE/mnR5xsbX5gygWDbmMtxPDmVb1Egtrj1MDJYPqu86BBC/ZI23x
	/f/1RuNTl5MtU+OCQS6QSB4Dfn6ZjN46tM3tjNWqKu/ds+K7GmyOOwlbLBxUHvUJuQI/kahUnhP
	+3hfw8Ui1tXluFHGheN2SMolbzrP6UD3+fYj7ZwsnB4Ua06/1Ny4YGQpp8YNMzpA1jTqXdS8hAo
	jfkw==
X-Received: by 2002:a17:90a:d2cf:b0:3b3:ffb2:6ae3 with SMTP id 98e67ed59e1d1-3b41c902f49mr4198463a91.32.1795219779657;
        Fri, 20 Nov 2026 16:09:39 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc613csm1920509a12.5.2026.11.20.16.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:09:39 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Matthew Garrett <mjg59@srcf.ucam.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>,
	Darren Hart <dvhart@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] platform/x86: dell-laptop: Fix keyboard backlight and charge threshold handling
Date: Fri, 20 Nov 2026 16:09:28 -0800
Message-ID: <cover.1795219225.git.rosenp@gmail.com>
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
Content-Transfer-Encoding: 8bit

Three fixes for dell-laptop: keyboard backlight timeouts that overflow
during unit conversion were silently accepted, an unread keyboard state
was used at init when the SMBIOS call failed, and the charge end
threshold was parsed as unsigned into an int.

These patches were developed with the help of an AI coding assistant
(Claude Opus 5.5): it reviewed the drivers, found the issues and drafted
the fixes and changelogs. I reviewed every change and I am responsible
for them.

All patches build cleanly with W=1.

Tested on a Dell Precision M4800 running v7.2.15, using the equivalent
backports built as out-of-tree modules:
 - writing 4424214d / 18989323d to stop_timeout set 4m / 2m before
   patch 1 and is rejected with -EINVAL after it; 5m still works
   (v1 of patch 1; v2 is compile-tested only)
 - charge_control_end_threshold rejects -1 and 101, accepts 85
The kbd_get_state() failure path of patch 2 was not triggered.

Changes in v2:
 - patch 1: convert to a u64 seconds value instead of failing
   check_mul_overflow() on the int, so the unit selection below works
   on the full value; retitled (review feedback)
 - patch 2: don't fail kbd_init_info() when kbd_get_state() fails;
   fall back to level 0 / off mode so the existing code picks sane
   defaults (review feedback)
v1: https://lore.kernel.org/r/cover.1794633179.git.rosenp@gmail.com


Rosen Penev (3):
  platform/x86: dell-laptop: Fix keyboard backlight timeout overflow
  platform/x86: dell-laptop: Don't use an unread keyboard state at init
  platform/x86: dell-laptop: Parse the charge end threshold as an int

 drivers/platform/x86/dell/dell-laptop.c | 47 +++++++++++++++----------
 1 file changed, 29 insertions(+), 18 deletions(-)

-- 
2.56.1

