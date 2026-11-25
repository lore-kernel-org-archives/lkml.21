Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645083;
	b=jdMwrSuSuwjNYUnY/OyVCL5oindL8zQSacsv4FK9t8QdUnfDezOo0rOlaUTSOBw2waM4
	 kRW8zurtGu00VIw/fNH9YGCJcta81zLP5/teEOcVUu9cYs/KDoVlWKeMqkQtBh2JdACeH
	 eyhsUR730qfRrt7hLmUi6QFfL8f7WRZetqZTFwEShGJhohdBgJ+VRlhGO52HaDOVOgJ2F
	 DfDKmyu5L4P9Ef9ETZyRWTUb+A6xYiQPUA1fLCX9c7OtlPfn8qOv6cH1KjX3sRqn3soVX
	 Yc5me/zj0U1uG+AcDT03JLlA+75XRyluwMYJH5BDQAqF7/3m4LtK98YNKOe1cUOIV6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BnNnCP79mIT11o498QX7t0hvFj8f/s/nQ+8DjF/+0o0=;
	b=m+fF9MAczdUkRzDwhPo4vseUpZtJGp0UZATHI6l0ZkkNwJH/llXgfErEXBWRjCeVyc6U
	 q7ActsxC26TpaA6Oabv7EVwAnD2aKjytHFOqzh1BYDzOieZ0VYfiKClOjKksQbU+MEKsk
	 KkOMOmUOcLdMk88k42apOBUcVk62g6ewUo6NoLIhD28WVzuseq4GqD581vU8m6J8n3zXo
	 30B3LTjgdEdyE/r/E9wyqgoKonDhn66QM0Ik4ZY1DwtdQtIvjAC7uWNASp5cMx47X2qIg
	 bSrzLkHoqhtVQNWGiLB8dwz2QRgrzFILwlguxYUO8ypdcZEdJo1Ia1by6utE2VEurlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fZxGGnum;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824DA606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:18:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 824DA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fZxGGnum
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-38431138772so8265023eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795645082; x=1796249882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BnNnCP79mIT11o498QX7t0hvFj8f/s/nQ+8DjF/+0o0=;
        b=fZxGGnumQ471hrV6MSOZ544ePTSYpR3Lpx1xjQjLGbLFi+CyEjoihhTrNFOnsUregf
         PC9dfmFaXIseGu4FIHQknJd41iX+Pfjh+pVEa9givyLuAaa/QLXg6hZjapJd29+5FKQd
         SeINeDM6vBzGE5p3mXaJRacxB7gjH+HgroTijO5ZiWPRCJUlOnihF9TN/DA2gQWygDHo
         Dhm817XIYFjIozAp7hurJ/G7vqVyV55MLsjBP0W7ANa0kSpDD+CCgM3lZTXbkR41rR10
         SGVpyeLQ678n98ApzY4dBaVcEPR4K6Ndqn6Qo6ZXJXg/iFEXXgD7UhMPSDkDWcAGwMTd
         bJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645082; x=1796249882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BnNnCP79mIT11o498QX7t0hvFj8f/s/nQ+8DjF/+0o0=;
        b=SM5fAWX9Sn2nhCUzGO1VcVoTLSxXI7K14URx/qCFoMMqKab7Ce74bOGVb7fuvRF6Uk
         d0eWFKy5ry/GEmUlVDUVrNbTT90vT1OmGgKslCtCru0ixkKrN5VeY/HH6YHVYXyWQ4BL
         uqMKwlBq+df8Cex2pXh8sU94tQyZvt4qdEHf3kpi4ROYRJdCoWS4n7LeVIuoKznQB8bo
         geChDdxZjU6M8lWRFt3O43jrQoydMfQBiEoNVjPFdGXRvmsoxQry3o77nm3tCwHiWf4r
         xsXZtv3ARXG8kbaAlQbl3i0UsT1h5blrGIQnOnkk3yrrx3rPGRN798SMudT9YVu7Nvfj
         x8ag==
X-Forwarded-Encrypted: i=1; AL+hErEB2e242Z+0mDSXoWUtrasKWbxCzhGWG2JRMbEbb9dig/PoR/NsG57h4og2z2BYVA6EMMVQR5Hvml4ajC8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9G+/LfQW/WQ0GctUrp4WQIHazHVizr1oz1kUME6A08UgfeJEEL
	z/5LB+H4DBRTiXV0M7Z69axMv6cMm0Fn1IAh0qwfveCo07C/MFFkcmRJ
X-Gm-Gg: AZFdTZfvs3F3ZtupZnFZArnWJmPipIcQERQGTH39jGgGylFIV447s7lQzjcbSIiF9CS
	mFk49WH5VFC9ex75Vy5FSIcjbcSEEiT7wxzDCwVbCU83kzbcaeF0oDvxTlwHXeP01AGquidejKx
	zp+QWxCzAHyv9ya+UCQ6lrHrZyYsu5Bav6yxp/aZirxWKIvFjlPBH3lJ7Slypc3I9B3n+qJfYSt
	n/wnXWf2A94hxMXbliNxWiAn7M2g9Uj9yXzXrDlgOHGc59BD70Q4nTRAA++aypW4Cm+5IfUClHR
	z9cHHSD2KKtxNuWY2PVwSSNA/e8SWXpgAp4S4KBI45ufdsSWy/JX2OSf976XLlPk17RH8JrEQ30
	aaE7mR1LdENLTSgUEPwcdNS1GTeov7JT+cPVJz8Zs3DcK19DSW4h2xudnClz0gw6i0/vsb3mkme
	kRrljoA2M7Sta8lOi60vLrIFHZZSVcIiQ5+acP2hL2vY2bM8oKla3PXj82XAkLpchNZxx7Ua3xg
	noj8EYr5I92gXmAmmbUf5m1B0ComqukhSKeGOKBYY5D1PlOk6xh0uiB7YpAbr17uFDGkHuf5Sqy
	Jbsuo88qlU9iQSs/OoMA
X-Received: by 2002:a05:693c:87d8:b0:386:b896:319c with SMTP id 5a478bee46e88-386b8963d3amr8931010eec.35.1795645082138;
        Wed, 25 Nov 2026 14:18:02 -0800 (PST)
Received: from a1-free ([2603:c021:8021:f000:0:1865:8c38:18fc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm69581357eec.5.2026.11.25.14.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 14:18:01 -0800 (PST)
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
Subject: [PATCH v2 0/3] docs: ABI: report a symbol that one file describes twice
Date: Wed, 25 Nov 2026 22:17:55 +0000
Message-ID: <20261125221758.2535044-1-takano32@gmail.com>
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

check_issues() compares a symbol across files, but it skips the case
where one file describes the same symbol twice: the loop returns as
soon as the symbol has one file.  The ABI parser keys every entry on
its own, so a repeated symbol on one file is visible as two entries
that point at the same file.  Compare at that level.

Doing so surfaces two entries that claim the same ABI:

  - shutdown_unlock in sysfs-driver-mlxreg-io, described once in the
    October 2021 block and again in May 2025 with a different default;
  - the internal MCU protocol_version in sysfs-driver-hid-lenovo-go,
    whose entry carries right_handle/, the group the removable
    controller lives in.

The two documentation fixes come first, so the tree does not gain
warnings in the middle of the series, and the checker is added last.

Four symbols are described by two files each.  That is legitimate when
two drivers expose an attribute with the same name for different
devices, as hid-lenovo-go and hid-lenovo-go-s do, so the cross-file
case keeps being reported, but as information rather than as a
warning.

The first version was posted on 2026-11-25:

https://lore.kernel.org/all/20261125190742.2420486-1-takano32@gmail.com/

This version points the internal MCU entry at the top-level attribute,
which is where sysfs_create_groups() puts it since mcu_attr_group has
no name, and the checker keeps its warning for an entry that ends up
without a file, counts lines rather than occurrences, and drops an
unused loop key.

An AI coding assistant found the two duplicate entries and drafted the
checker.  The counts above come from running get_abi.py validate
before and after; the paths and the group were read from the driver,
not from the document being fixed.

TAKANO Mitsuhiro (3):
  docs: ABI: mlxreg-io: Drop the second shutdown_unlock entry
  docs: ABI: hid-lenovo-go: Point one entry at the top-level attribute
  docs: python: abi_parser: Detect a symbol repeated on one file

 .../ABI/stable/sysfs-driver-mlxreg-io         | 12 -----
 .../ABI/testing/sysfs-driver-hid-lenovo-go    |  2 +-
 tools/lib/python/abi/abi_parser.py            | 48 ++++++++++++-------
 3 files changed, 33 insertions(+), 29 deletions(-)


base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.53.0

