Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645086;
	b=OXUwtgG72IPxvFh1d98PDxrYpL3b0B1ftFpNF08UFjtq8PwuZUVKR4Y9EtOVmQGzlyry
	 rIoTJgWeqIRJLM/IGOBz9uLa4y2ZH3g2Uxal02LwahwAfsyJuJfRWXbZXbhoMoZfEPMlo
	 iWAla6EniBZ6OVKAW3J+k5G264gobMQwemOXWxJaj8EqVcJLjb07Z/eAeUFjC1Lv3vv+7
	 ToTHo2BiqvhtLeoMn0gM4SFcU82BO2xrnTN4RPo7rdYcNXTZ6TiEyxsJhc2A5cOwMhVZt
	 663F2e85VspASPeUlSXibVXh6g0AMAiGyC6SwEe2730tiT8v6xOQlbHxHsKCsq5owvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645086;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0ipuY/GPGnzCJlnHWCO1S3xz7owRUdE8H+HL99PrQAY=;
	b=E5GPmikrDDA0GqjMt0ac/GRctznUdDQfUK3ijcPdx80G1Fuo9r/EHkTFI6SNDTO/NU3W
	 C788c4x1CYOrxsvHRNHQ17S5x94x0bfHETZHy1IEAXnqe82nVmcfsPXmGXzohAGY8H+w4
	 x+p4vgkLI13Orf79c0mY/ZtF2EZMqRbR6orQIDxRAXp00XC5JClpEzDG7yS02fgdC4t6W
	 c3ssgQlKaputBCu1Dszw+PJ4Fr01E+yMWZ7JdK7LkaoUBN+DEG8tvXEua/WOIStOAI7zf
	 98qWTfvolFTrpBxcptwj6quwCZ7UxiaiZm+fa7wzdVcjTRA/I6kJ9Bs2TkMmbaMs+Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d4C4hDru;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0425606A332
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:18:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0425606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d4C4hDru
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-385d8a00598so9370844eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795645085; x=1796249885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ipuY/GPGnzCJlnHWCO1S3xz7owRUdE8H+HL99PrQAY=;
        b=d4C4hDruGezjryJjUXDGrcMNv91JTeaHoH02IBRRrhMTYsm+KdaIq8zPvV135GrEUc
         cvTs7SLLqIRI3xDB36dHNrwLjadHZcmthjeYZBAcbMxsjuMh6oR1Xuj7J8OhSDZxXLWh
         HRNsSiqMMhd1VVny4P3EaxuOdbqriGk/39ad7BTzpvIXsVMvfLzWWJ5nH4uow1MRDTeY
         UhRPjh+jgIiUaw8Au4cOkmXtrbFuYujQGXJAvddaXTjGjbNpXX2RlpIR0po5hxehRSXu
         Rl6cw/hPk0q9VfnwoiSJaYbhSkZwBtCc8ZoEGexB5piGnbQYaLNac+56G22AemftWcA+
         dLcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645085; x=1796249885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0ipuY/GPGnzCJlnHWCO1S3xz7owRUdE8H+HL99PrQAY=;
        b=r+TEq1g3NOOvNv0DKsbxK4A1SH3C/6OPLNh76B8J+LCa9WSxgNuO4p2uV+TW8cr7A8
         arc/faH+Bb6zQU6ZHo8APSXH3IyNqqd5oA9qvSQmN2YGAjKgoYJgDPX+RzGTRTmwneDy
         qOdwBdde7LryqirAjuL0wPBMmuTaMh7rf7+nxeXzpW6u+szTLDjosHOkACh0D3Aj6Kq0
         ulDulNLBbqzFNDyx0XK0EEG9hD7G882ttDz2/RAmdG3AB7uz8H1VnzxOZ77/DrEv/20P
         V7HH9r/AqpIe4m58IHBZRtW30p/QWBx0z18Je4WbXRKORFKInbY9kSkmUEsGENzPwk96
         ml/Q==
X-Forwarded-Encrypted: i=1; AL+hErGWgwoTu07b6uIyWiEI8Qadt7cOo+qjVNSlupQEt7JC109OKv8ioua6Frg+rt31aLugN/cTBgfLwMGinq0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pmY4e274mZtEYCbfBq/0H2e0mQcyfrBRD547X6ismx3VJMHIW
	RhimX3oVfcGJWLmMjNuXoGUF8CvPWXn8z/UsXdGTkEaey79VpxKJ2Vmn
X-Gm-Gg: AZFdTZch5Xb+LjelgyhDS8z7BP7n6k1mGlLSCzEjBygXHf4ldEhLZPghdg50kv98pAp
	zrv/3nS+3IxFKtRdSY0hyLY1wKfVMZsfNWms503WU4USAsA9ld2Tq7J6Q+rw/GvpnmVJbigm1h+
	0Xc1b1wbSjmbcyHvMAnp/WUPG/PKs0JM+EEqOMsVcQL9qkQf0+0YYqDXGYPAEpksl3iWEngHnBn
	LcTX0kWQ7iucn71iUtFuRWv/O1EwXRyFYB7Roh4Mc3eO5L5oy1bk6sbqtrjHYVMdUM2igd+qBoY
	kSv4fMjBwx++yQ//st7W/d1M00Q0XiwKLhov5bUyFaYY27ivn7ct24iGcNYi0A7GunTroNEAV60
	7ENq8lzJKjnN1z4/Wpjhj33241g397+OJn/bIRhvLvepb4+EnyrqaF2pvSI/tOIt2BnMd2khzlq
	2Fk5NQvOV7i4QU7LnIXcJHrefju8FWENFDRHkQTMyaraPcDvYe+SMEgTyPlGGdw2c3qJ0uOAwsm
	5P3/D1PuNc9Khx3BNuShERPyhHfaZZAOlI8zPCgnicEbbRU2nPKPMWnESEiaJ5LyYhrkmXD4Rdj
	NQwWwNd6bF2Vkndbpj1/eQ==
X-Received: by 2002:a05:7300:ce93:b0:36c:a44c:1763 with SMTP id 5a478bee46e88-386bbfa6402mr7456394eec.32.1795645084664;
        Wed, 25 Nov 2026 14:18:04 -0800 (PST)
Received: from a1-free ([2603:c021:8021:f000:0:1865:8c38:18fc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm69581357eec.5.2026.11.25.14.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 14:18:04 -0800 (PST)
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
Subject: [PATCH v2 1/3] docs: ABI: mlxreg-io: Drop the second shutdown_unlock entry
Date: Wed, 25 Nov 2026 22:17:56 +0000
Message-ID: <20261125221758.2535044-2-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125221758.2535044-1-takano32@gmail.com>
References: <20261125221758.2535044-1-takano32@gmail.com>
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

Which default applies is a property of the board's CPLD, not of the
driver: mlxreg_io_attr_show() returns the register bit as it is.

Verification: get_abi.py --dir Documentation/ABI validate no longer
reports shutdown_unlock twice.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
Changes in v2:
- The documents are fixed before the checker is added, so the tree
  does not gain warnings in the middle of the series.
- The internal MCU protocol_version entry points at the top-level
  attribute; v1 gave it the prefix of the removable controller's
  group, which made it name the same file as that entry.
- The checker keeps its warning for an entry without a file, counts
  lines rather than occurrences, and drops an unused loop key.

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

