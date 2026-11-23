Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432008;
	b=KYlcEwxJkwB9EJFCCJF430hFOpp/ng4tArk79oe+sfD5MbhFxJ4sNuqDnxrFbI+aWG1p
	 7I+SO+mY276uR9SJVBpXZN0I2QfbtrLEopmb5KEEZUcAaFnhLOEcujKwv/ynkT7OSlBr3
	 huJDPs2HJ2H4HnjUnFePR8ARqYYMsHyrECKUE6PnXF9fhF31ttuT1hCpR42t5c521lSJO
	 vg6vghbJhDpMKDb0K+Cm3Dv6lUkhNEaUrE9S14nMjiqoFVsuRpGVJpHuuS4VEBWUmi3W+
	 S1/KLDRGSDGxsrh3MkchP1sJLM2HyukEGR2NzcH4hJl5oWXVwRHGdVnuF+LBnaQj/Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=x8YQa1D4D7Z8Lu5JGDQU9m0aos2cqq5iQXG2x9p7/pM=;
	b=uUWCymhfkTpcF5cfcT5UCuTZgTgxP6dcUdD6rmyWM/Zgq8AljTV2ukXARO5l5D0vT4Lc
	 Bx/KVnDaD6YL4IkImblt7p5PQTz0oAEAD2AcMqA6+D0UxsZZniI5JuuFmIEYsaFd59Kqt
	 LQLFnSivWJSEZceK57QkFbGbig17de2+TDSJI5OSu2G1c1CK2vQZkAEfEr9IMz7YggN2v
	 hBG6kbCGcngXSLrvofonvXyGjHF22oli4Jroo9ZomI9Zs8NdTOFFqKhWJK5pkjsjwsDeG
	 mvKkA0hd3s2UmFyeA6L+/8DD+TLhdeV2RWPkDAW209HMOclw/S9lQErLFbtljacwMXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=na1coZTh;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C371A606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:06:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C371A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=na1coZTh
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-386a2dc17adso142976eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432007; x=1796036807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x8YQa1D4D7Z8Lu5JGDQU9m0aos2cqq5iQXG2x9p7/pM=;
        b=na1coZThoYNwYhIV1igqGSdS+NMMFhY8aSV7YS62w3rHRuE98v+/g3gIQCf7QaX/cH
         K9Ne2nc6A2oYH9ImNSlr5JMrCb4A5945NLHCEyoaNHIohgx2R33uaDmsekY+3zUB+KIG
         WwlmZ4YYp0mGxzlhi0MXaj1TKIp5tdB0lA5I3byJhW9BqdSsSdqko7eOAGZvVjDG4e2z
         VQcXTOyAif3dQ5WNku/21NGOvkxChbKr84usGStafIMkz+ainhPijwR+lRiCa6oNgi/V
         A1O2YGWhSmx6aGhSfFSp5eCUp2ZLluS/lMFulOjUdyvdKex+ez2i7K2QMsWctBHDjQXC
         /kZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432007; x=1796036807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x8YQa1D4D7Z8Lu5JGDQU9m0aos2cqq5iQXG2x9p7/pM=;
        b=CTfj/tNH752hu7o5cZhqNNvmQKp43G49MelzrSn6EC3ObM+Rhi+tM9U61JYCzC7RWf
         GH+Jb0JSHaqVPp4DEdFQBV9IuCi3d6tAMnmXLxmSwSDBui+AQoGst3o2KHTbP5px4MtL
         2jS+sUd7jfdyLLJWNM6FJpyu2f3WD0mlffEBZNr8/B4pRmjhwjeqTC1LhTW2qmS3FwVX
         Kst1yMMwGUrmwKkINIwHsoQz88o4lRqJAT+fnk3OcLv57edS99TxZ9a5pLraBh0AYnuW
         AeAvsd9lYo8tL8wL2sse60aCXzcyTASdG3uSIul03I8qrcafdlCiTl6r845M7+Ru6zTP
         Quxw==
X-Forwarded-Encrypted: i=1; AL+hErFXU+piTE5kX2JQ9bS39hlPpnsrXk+9ZWdjeLLrHJtpXJIYs082PWFIqNtX0rUMFXXYF2K6HvjSwVY57vA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AH7Qs+RgIESnvemGEk+8+BNVkxETBx5xnHGUkz2rBzsdkr0LA
	qRuiw8V8yOIIE13s/Q2ZfNRMZZtl7vqeqJUpQkJrGu4Icq7C7dAydvS3
X-Gm-Gg: AZFdTZeFyxb09eFwMHZAg7d/+D89k4Ad1U+yfkYdKxsOxN7NRzFsWMopU6Nl5whT3s4
	iv8ADMvIOc9zr1hwVWORRDXKiETAgklYEURvDaOhPuj3c02/WdMaZ2rURL5lVkh87QIO8wI8DGH
	ekOqutu/y6fsvTUf/hFWcvc4K5mbqzRPK+Fge/pdhQ48XG/zwSJhYcFWmiNwrxtmt4l/EP6xpVy
	vHsKXnQ8/E37rsEGw5Gb/0Mxg8Awoi3V4Hb2t3QTSgaj5Vs4GywuSEwCvypHNHPwl7r57zsOoFk
	kOIHV2p9XMZwh8ED5nWflJxq5N927fBtS7jf90OqbSetS4MNBMkHgGj+h/f5eCzgWB4I5nhHVuK
	XySjfhFMm/JjhPloii/5mwR4Pn051AN/iZ5XATw0G30BdX6UGSYoku0DhetK9aMUq3u1x4YpRPQ
	xMSbcSGA/wWM2IWwShYvnPqPSPugRUqw0F9icKjhBHi5FQnWYZlDDfopxhpyHF3OvUPSKNqfex3
	QGUMdl5oQ86rNIrGj7rvsAqbW2EHzJdbtZCdNWmuwVBcap3oTym7iVPr3hDGp0RQ4EBkyC93Asq
	778xrdG+rrkLG36qgWSTPI5pIH0Oi0Gyst1rsgZmLq7+vIMg2p4EWt/hKlMy6RwGkA7gAl555iy
	p+BddnUBlJfYeVA9N186Z0BAuTfujaQEEc0VyvJgKwYGYaQ==
X-Received: by 2002:a05:701b:450b:20b0:1b5:5a76:dfea with SMTP id a92af1059eb24-1b55a76e18emr14850858c88.0.1795432006886;
        Mon, 23 Nov 2026 03:06:46 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.16])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm30054074c88.6.2026.11.23.03.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:06:46 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: alexs@kernel.org,
	corbet@lwn.net
Cc: wy@wyuan.org,
	dzm91@hust.edu.cn,
	si.yanteng@linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v2 00/13] docs/zh_TW: process: add translations of 13 documents
Date: Mon, 23 Nov 2026 19:06:23 +0800
Message-ID: <20261123110637.172045-1-chenyou910331@gmail.com>
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

I previously promised Jon that if no contributors stepped forward
within two months, the maintainers would have to produce some results
ourselves.

This series adds zh_TW translations for 13 process/ documents that had
no Traditional Chinese version, and moves each one from the TODOList
into the toctree of process/index.rst.

It is independent of the "resync translations with the English
originals" series sent alongside it, and applies on its own.

Terminology follows the decisions in that series; whole-file
terminology unification and the glossary.rst update will follow
separately.

The series is based on the docs-next branch of
https://github.com/kernel-zh/linux-zh_TW.

Changes in v2:
 - Drop the seven labels that nothing refers to (Dongliang)
 - handling-regressions.rst: display the zh_TW path in the :ref:s that
   point at zh_TW labels, so the text matches where the link goes
   (Weijie)
 - maintainer-handbooks.rst: link to the zh_TW development-process.rst
   instead of the English one
 - Collect Weijie's Reviewed-by on 01, 03, 04 and 13

v1: https://lore.kernel.org/all/20261106113545.708896-1-chenyou910331@gmail.com/

Chen-Yu Yeh (13):
  docs/zh_TW: process: add researcher-guidelines.rst translation
  docs/zh_TW: process: add cve.rst translation
  docs/zh_TW: process: add applying-patches.rst translation
  docs/zh_TW: process: add maintainer-pgp-guide.rst translation
  docs/zh_TW: process: add changes.rst translation
  docs/zh_TW: process: add handling-regressions.rst translation
  docs/zh_TW: process: add deprecated.rst translation
  docs/zh_TW: process: add kernel-docs.rst translation
  docs/zh_TW: process: add maintainer-handbooks.rst translation
  docs/zh_TW: process: add contribution-maturity-model.rst translation
  docs/zh_TW: process: add conclave.rst translation
  docs/zh_TW: process: add threat-model.rst translation
  docs/zh_TW: process: add maintainers.rst translation

 .../zh_TW/process/applying-patches.rst        | 390 +++++++
 .../translations/zh_TW/process/changes.rst    | 530 ++++++++++
 .../translations/zh_TW/process/conclave.rst   |  35 +
 .../process/contribution-maturity-model.rst   |  83 ++
 .../translations/zh_TW/process/cve.rst        |  90 ++
 .../translations/zh_TW/process/deprecated.rst | 361 +++++++
 .../zh_TW/process/handling-regressions.rst    | 969 ++++++++++++++++++
 .../translations/zh_TW/process/index.rst      |  35 +-
 .../zh_TW/process/kernel-docs.rst             | 353 +++++++
 .../zh_TW/process/maintainer-handbooks.rst    |  20 +
 .../zh_TW/process/maintainer-pgp-guide.rst    | 793 ++++++++++++++
 .../zh_TW/process/maintainers.rst             | 125 +++
 .../zh_TW/process/researcher-guidelines.rst   | 134 +++
 .../zh_TW/process/threat-model.rst            | 187 ++++
 14 files changed, 4087 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/translations/zh_TW/process/applying-patches.rst
 create mode 100644 Documentation/translations/zh_TW/process/changes.rst
 create mode 100644 Documentation/translations/zh_TW/process/conclave.rst
 create mode 100644 Documentation/translations/zh_TW/process/contribution-maturity-model.rst
 create mode 100644 Documentation/translations/zh_TW/process/cve.rst
 create mode 100644 Documentation/translations/zh_TW/process/deprecated.rst
 create mode 100644 Documentation/translations/zh_TW/process/handling-regressions.rst
 create mode 100644 Documentation/translations/zh_TW/process/kernel-docs.rst
 create mode 100644 Documentation/translations/zh_TW/process/maintainer-handbooks.rst
 create mode 100644 Documentation/translations/zh_TW/process/maintainer-pgp-guide.rst
 create mode 100644 Documentation/translations/zh_TW/process/maintainers.rst
 create mode 100644 Documentation/translations/zh_TW/process/researcher-guidelines.rst
 create mode 100644 Documentation/translations/zh_TW/process/threat-model.rst

-- 
2.43.0

