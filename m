Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795633673;
	b=UyEaZG4BfkbDSlKb6fvOAW6j/5AjRhHi8lc4XOKyujRpbdCZHgRen9PDq1ZK6u4JkvzD
	 Wtrdaf/4Y5MBNN9BZA9KPharCH+CqcYlqhgzGcLzho6b8QfviSOo7TLf/qvlr28gE6xWg
	 6f02R/6ftFhEPMonnC7uAjVo4UrOsD35Hl5FY1PHaD7FOOcSrX+Vpcc/BisFudmLP6+dh
	 ts/Ulw1DhfCzg9gtpW3t3nx06B5bPc9pnL52jzor5PkCln73ww1Ch4KCf4T2svozsLpKl
	 VjPnVvLPrH8AsYcd1VigdIVSXUR2v5TunXiPCTny6JG4KqYW27brRHZOGd8BxvF+l0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795633673;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Z7oO1+idE1YuSoFAPc2/i5u2CikChDsikplJrvQUM+4=;
	b=u7Z+GBSczTE0/dB5MGqE1hUO6sELCVXV7iIr6dj++svxd6DVKnLSddezre+U9j2FT9pK
	 AeGvPA6/2OQDZYIjr8fbUJiVl8UkoNxZfgwu11QrkRV9kzI2nlUmeU3M92rJ9W6QqDpON
	 OfAydmPrpc5D92tlPbzoKLZWNPv6BRI4E5lHKHvq/uvdt+fKNRgs73NBJFZjol+wAeZTj
	 PEQ/KOicNmgjIA68MKaNXTR7pYgL6lWFRQurE/atuMlVdjeRCme643KfTX971Es8BvgDH
	 09wjs0j02dmz31yeM3lbHYtqwm6XTl8JCnhejX8yzHTupkhEBbxinll6TQ0dEQC/A7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IPZENFQ8;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5377A606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:07:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5377A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IPZENFQ8
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b563e32936so2127726c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795633671; x=1796238471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z7oO1+idE1YuSoFAPc2/i5u2CikChDsikplJrvQUM+4=;
        b=IPZENFQ8+nUfUPdU5/BAlejZdB21DpJJ9TBHmw1H3RyPgU9CH7UK7dfJp17y4rm6sb
         oQhEgNUkXKkhqklAF48CSxETEkYxf9IuenME0V1c1IsGwsJlRdAs6NumOPv16JHLJoRg
         8uwj8QmzErb6jz4NYbIZAPZSIgwgIFXy7iWuwQNS3ZabBlnkyzOWzouuw8DVkkfW+6tq
         5g0yos4Ioz7P/mJqFaHMOs6QOl0rEeSTKS9vY7ZBZarPDkfBzIeoJiAAfBJOeNYBd50a
         BGQfoDsEE8y2rGY81xZKBt+KDUpvDCH1FW4rLjH3IviTzt0DCXRY0TKYp6s636IW2JcO
         ni+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795633671; x=1796238471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z7oO1+idE1YuSoFAPc2/i5u2CikChDsikplJrvQUM+4=;
        b=132pKMx3+w919mjCljzrQNrjZvOFDFsD0Rlhha+jhpnmaRbnjKtKeXRlKnIkUaLHAA
         kon/VY2JVcKVbYjeeVsctffrp4S3uRyGDRAuTI50mmw6So/B/J54kRX77uIQSNxUhec/
         uZYmYeTol9AJXDCrB0jgZkJwIJm3tGxuQMpXs07xvbybpgRrRj909kmsjxpB3Dxnppz/
         uGmSmNZGMV0Oe1kuT6hQGLV5QSMg9aEo4OywQgN3v4YnR6pxPZOqBdmpcVakSvyMP0FF
         WGyDDlkFJbAKm0RRDwAVAup76rrh6NPwU0xpvluUO+CQ2qq1VZ8OOik8DHPLzkX/NhJ/
         e0+Q==
X-Forwarded-Encrypted: i=1; AL+hErGP1hKcz2/Hdl2nBJnrVVarKy+GOwzt8l7WolGRwlwuQCxtFz8gCnLxiYE+LgVdu3EBCbt+tFAz2D7bREs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sHeouJ0xUVwTDs0shOX7Eut1mhYMC6CtrJbpRWzRkXlWeirHt
	FUgW7+H6w4G7ZNb1lWKUMkIg7xENAkbWFUcYwd+XSLCbZi1EYW1wsfGY
X-Gm-Gg: AZFdTZeyFRIIXoxc2yHCZLZ6UGJS0C8f2LGkfq9yCfEe6VGYZcJs9//IJdBZO1hBeJj
	C2BKMLA33h6MCxfL5wdVrMOeFsEbOnWyboFg5/wOz/Jx96Vu21OlIRyVJtl4K5VRZubeHfRAby/
	RAMERwDgnAsjjIhWMslq+Ix0Fb1JXzpAzlyNQK01ayos3yLWUef3NBYGJ6D2hba88Jx74fUjjyA
	zCHKGa+WQVAihheHlnqdgYH7Kh0Uj9up5HpCIunqgjNCEug2W2KbALCkJIAHkdqa+yglO+hskxR
	/Q1mXB7rMspqNvrh+RNjgGIfCQe9OUq3TnLZhNwCoaCEok7/gSO1rwmwvLHAGJ5yFbcJt4rhyra
	lISWiMN3n4wXAmlqrt3HbYjECDUYTWiazpwknTCE0+S+I0MJZIhmSCClXp1FTUBgfZy3bcg9ypy
	lj3QLhe3dAuu4QvteIO6ypFBxL+kZD67BoucotQAg/B+FNOdlahMVwsXLLQ2kqPkGfy/nEbaW+m
	YZRMxmozzrptEUMtrhu+zvTCKk108qNaoa/UcVmHSCoFlZYyKEQ5Jbtvy4DpU5aC/bXueQ1YYpy
	YDIaTj7PAfauMwACiIj3
X-Received: by 2002:a05:7023:a8b:b0:1b0:430d:d81c with SMTP id a92af1059eb24-1b5568feb77mr18978686c88.25.1795633671181;
        Wed, 25 Nov 2026 11:07:51 -0800 (PST)
Received: from a1-free ([2603:c021:8021:f000:0:1865:8c38:18fc])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm42584510c88.2.2026.11.25.11.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:07:50 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Vadim Pasternak <vadimp@nvidia.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH 3/3] docs: ABI: mlxreg-io: Drop the second shutdown_unlock entry
Date: Wed, 25 Nov 2026 19:07:42 +0000
Message-ID: <20261125190742.2420486-3-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125190742.2420486-1-takano32@gmail.com>
References: <20261125190742.2420486-1-takano32@gmail.com>
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

Commit 4e29dd3821df ("Documentation/ABI: Add new attribute for
mlxreg-io sysfs interfaces") added shutdown_unlock as a new attribute,
but sysfs-driver-mlxreg-io already described it in the October 2021
block.  The tree ended up with two entries for the same file, and with
two different defaults: the older one says "Default is 1", the newer
one says "Default value is 0".

Keep the entry that came first, which documents the behaviour in full
and carries the kernel version the attribute appeared in, and drop the
later copy.

Verification: get_abi.py --dir Documentation/ABI validate no longer
reports shutdown_unlock twice.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 Documentation/ABI/stable/sysfs-driver-mlxreg-io | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
index f59461111221..00cff8965b22 100644
--- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
+++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
@@ -741,18 +741,6 @@ Description:	This file, when set 1, indicates that access to protected
 
 		The file is read only.
 
-What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/shutdown_unlock
-Date:		May 2025
-KernelVersion:	6.16
-Contact:	Vadim Pasternak <vadimp@nvidia.com>
-Description:	When ASICs are getting overheated, system protection
-		hardware mechanism enforces system reboot. After system
-		reboot ASICs come up in locked state. To unlock ASICs,
-		this file should be written 1
-		Default value is 0.
-
-		The file is read/write.
-
 What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/*-00**/mlxreg-io.*/hwmon/hwmon*/boot_progress
 Date:		May 2025
 KernelVersion:	6.16
-- 
2.53.0

