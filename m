Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795335925;
	b=4s3AMn8mSoxRH1A2dNY8wmTfd3KTu2doQ3TDcd9xHvrru5QuoPMRBkiLK8E01MBpjHdk
	 SjldRLgwaom2BSBwoKGVvSycsQPpamQwEhy396+0hLZu7LzmG1kZgY7DZLyhmH4rp6vY6
	 5q/F5abTXq3Sf5vjsl3jNQ29KfHYU/+1XQ8QuucYvs5tb+U2L4dVRD0I6lb0LM7O4EWn0
	 64mOdK8fn7Uyqe85znbl3Cb899anzj4tdyzDukh3axxzKSbgS6BlqfjY3RBDnS5P9cu1+
	 y6kzaeEANfS0tgfrR+OeH+biPCi1CuKb6y+vjpOZ9ti1ShY+8qCd13IntHCJbLH2Pwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795335925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PHr5lMNgh4e1muETwY9dGYxImK1kdVOuIl14a1lxYrc=;
	b=imeSGsr2rgTgVUnAjiL1GgHEslk/doTnRvvolerH8uXiQT5JVVeto39K+N8ZOZfUHDjP
	 xIW8d4uRURdXjKJakTt3W35mivuvtsW963PfmAoyc7R/tk7vGTJHG3FA3JQXq6KBMkmLD
	 QhnryAHxoiui70mvi9kysCFLSKdzuU7SsYh35bfi6NkarUOp/BeDugKc7upVN42EM7sXX
	 g/fEUFEF0+oxCcjphfrgJK1fNoFKYwA5NrULjhBB9slmC4CdSi81JHZSiEc0DMU0WRTQh
	 fDhUJ+tQRyjII/c0OAvsScqG1w1NcNok/mF8yUtLEUD4Ug6+6AZMwP/OdJatf2tWcsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OXWiRVYG;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358FB606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:25:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 358FB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OXWiRVYG
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b596afb4c5so2463780a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 00:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795335923; x=1795940723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PHr5lMNgh4e1muETwY9dGYxImK1kdVOuIl14a1lxYrc=;
        b=OXWiRVYGiuGA5K4EINKm8QimzDFoI77PPgLGFz1wa8QIvfBbZwQ8BkSsar8q4DJZUG
         o9rionaxNbTyKqP2/JwxKcAwWs501r/puu15KyMlP5Pe19y1Z+cQpO7LAUh9t92YpDGz
         B5dwvUM8AgICmcMfyysnF846s3vs/lso8hu0mtnJPi1mZuvYSmNefiUj4TGxr0dGtxQU
         uzraSTgeHM/9ATnvNgs/UpjM309E4QfT1GNGW9Q8/ZZGE8rXVCAi4oJsRSNLmizJMCpd
         3x5ZOXRD7WbliGV4Xy7i2WaOdOzid2pI3TsUWwTNAI655ixiBmAh9dmbLPL9ehrewadV
         F8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795335923; x=1795940723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PHr5lMNgh4e1muETwY9dGYxImK1kdVOuIl14a1lxYrc=;
        b=CFF8VVR+Q0PjeQNBJy6Xf3XDW1l3YwDPVjZa4jBf9AUns3p/nmN0hKwJbOl8975DIJ
         vNXeaVz7MMfL6ooWnVcOCZx+Xd9OF9jQDuv9W14lx0gxo6uZOo18X+AtgUSxlcR6v9Yl
         NFO4gV4aJt/sn5UnX8OxDIBy1AP3fUN240siNj35cKY+ZXp3Xoxr00J3IrBJpif7ZbW0
         TNsuMVi7YbvDXWJVjFPqZaos/N5snburNindkB4ehuGAQYD8+g6gk1m5AeQAZEMg3TdN
         hlxfGZ96YNTCcOKbnK9B8rrVltE/SvM/VCPgf1l/psfg4Uo7KWA57gOumKOfPafBTdOx
         d3xQ==
X-Forwarded-Encrypted: i=1; AL+hErFO3Mi+LSSkcPPwHmSXse3OYAV7/MGAmR2uWG9fWBxEUAyHxh9sk81Oypihb3dhA5x+USI01v10VUo+MuU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dnfRPj5TEgZLF0+4eKhyE+Y/cagbAMhLqosZbwrPEzEgtMsOj
	+6UaH3dwRY44QzKP74/RdIOl1bWUr7NJCXWTqeoqwT+U4p044pGlf5y1xHclrg==
X-Gm-Gg: AZFdTZfvQhGotHbqMIke6cT1vUGzWp6ykOuO0Hbanj2JgPEyAjUInCbWNV7wr3ULGcc
	LgZQqQJdb1/kt5i9GA5pKSIy7grbYHGc2dynvvQk5avvYh3VpO4CZbvDbWLg4lq8keqyqO7cC+h
	k5FPSXclGFApkrYfySvNz1XPTvqywFxdC+imWse5i71rDNFUgCBnjhMmyAjbHL6N+b0fSUeKDyA
	8/aKSPY7Q9cmDp3PzCDSphjugI6h6b+pZGP36hLoGPstpW52bh5DqTzetu76jXJTc0KK5CcpOW1
	3DhSc1WmHDO0xQDT/8B9Em63pjDBT59E7DaGX9SOkF/P/xsWgMsC4HEsf+yNQitg3PNw7qRfTGZ
	2I9YC2PW5ghh8mGLSvpV7j2ydYwd9zuAZQKa9nOyUvFGYHKvTsWBK0MXgM+fxpZSvwTmswG4JRG
	I3VotgoVobp3dNNRj/1mJ+QpwxOQSdHO+w8GtZ7YVDx2zc8a6g3A4q0JCQTehjBsmaOQbhN2AA9
	/zT9JoZJRgOs6MRPvwyXRBXsTq/7cLt3A3Xcw/4hoZBdeiK84auVeJPufBIHA80mXlKu57jKsNB
	pWUEk1LDnOBIVK/UMh6fpK5SXsVEWSxKfh3rDtT3WeYL4qRpvMCM5449vWtkCNwwLoqyLJ16bvT
	g1EhIJU+8Rg==
X-Received: by 2002:aa7:d351:0:b0:6b4:86e1:cc67 with SMTP id 4fb4d7f45d1cf-6ba37ea0b91mr3954141a12.27.1795335923506;
        Sun, 22 Nov 2026 00:25:23 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba6f8fa5b9sm2116187a12.37.2026.11.22.00.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:25:21 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Matthias Kaehlcke <mka@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] usb: misc: onboard_usb_dev: Add devices used by ASUS AiO P1801-T
Date: Sun, 22 Nov 2026 10:25:10 +0200
Message-ID: <20261122082512.64304-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
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

ASUS AiO P1801-T has 2 built-in devices linked via USB which require
basic configuration (reset and power supply). Add them to onboard_usb_dev.

Svyatoslav Ryhel (2):
  usb: misc: onboard_usb_dev: Add Chicony USB2.0 HD UVC WebCam support
  usb: misc: onboard_usb_dev: Add USBest Technology SiS HID Touch
    Controller support

 drivers/usb/misc/onboard_usb_dev.c |  4 ++++
 drivers/usb/misc/onboard_usb_dev.h | 10 ++++++++++
 2 files changed, 14 insertions(+)

-- 
2.53.0

